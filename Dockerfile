FROM centos

COPY . /usr/local

WORKDIR /usr/local

RUN yum -y update \
    && yum -y install epel-release \
    && yum -y update \
    && yum -y install erlang socat \
    && yum -y install wget \
    && wget https://www.rabbitmq.com/releases/rabbitmq-server/v3.6.10/rabbitmq-server-3.6.10-1.el7.noarch.rpm \
    && rpm –import https://www.rabbitmq.com/rabbitmq-release-signing-key.asc \
    && rpm -Uvh rabbitmq-server-3.6.10-1.el7.noarch.rpm

EXPOSE 5672
EXPOSE 15672

ENTRYPOINT rabbitmq-plugins enable rabbitmq_management && rabbitmq-server

CMD ["rabbitmq-server"]