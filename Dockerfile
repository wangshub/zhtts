FROM tensorflow/tensorflow:2.4.2

MAINTAINER wangshub <rocksong.hit@gmail.com>

ARG HOME="/home"

RUN apt-get update -y --fix-missing

RUN pip install -U pip && \
    pip config set global.index-url http://mirrors.aliyun.com/pypi/simple && \
    pip config set install.trusted-host mirrors.aliyun.com

RUN cd $HOME && mkdir zhtts && cd zhtts
WORKDIR $HOME/zhtts
COPY ./ ./

RUN pip install flask
RUN pip install -e .

CMD ["python3", "/home/zhtts/app.py"]