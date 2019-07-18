PROJECT = emq_web_hook
PROJECT_DESCRIPTION = EMQ Webhook Plugin
PROJECT_VERSION = 2.3.1

DEPS = clique dogstatsd
dep_clique  = git https://github.com/emqtt/clique
dep_dogstatsd = git https://github.com/WhoopInc/dogstatsde 0.8.0

BUILD_DEPS = emqttd
dep_emqttd = git https://github.com/emqtt/emqttd master

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

TEST_DEPS = emqttc
dep_emqttc = git https://github.com/emqtt/emqttc

TEST_ERLC_OPTS += +debug_info
TEST_ERLC_OPTS += +'{parse_transform, lager_transform}'

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emq_web_hook.conf -i priv/emq_web_hook.schema -d data
