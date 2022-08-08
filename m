Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4698658C56A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 11:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E2E95076;
	Mon,  8 Aug 2022 09:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09709549C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 09:15:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j7so10165684wrh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=uiaFxzAwshzp7MgJQb1QiOOF1h20ZXAXyF+VJOFMnRk=;
 b=n5jgufyClAHYo7MZ9hLMCDveoj83kL3BsNinG+Xz98eCm2KT45fqQX/oibe2Ul0OsT
 Gi6BEB8edBG527o19dU2qh+6PTccpD/G4KlYXVrN9vdm3RrtvI6rsVXbBIhLvlE4pACp
 8/k7eMhk/A82XDPdSG/umhLRD2Ofxtkq97ksFVslybOf77cgGQW9yaBehHd7CZjUzwWu
 ZoLdnTZnNTMI4NTz9Zh49t20VDSX3x/fhI4V5PeHv11L99bQ+MvD4jVAWCxBSzWp6fHW
 beCjJ4zDabViDgPLTTXzPMssMsTHJQeZfHVhCcPNMALTXx/OCTCeBs8JTHap0rm8hsP6
 IVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=uiaFxzAwshzp7MgJQb1QiOOF1h20ZXAXyF+VJOFMnRk=;
 b=poV5MXpikqhTVOBOXeASB/YSzBRZ+0WBZQ8s8Z0sr0k8ZIkGRBqAZ0VXEX0cNOdXHe
 4CrfiZr6xV5g/a4pkkg5tQ8XwJgAqIZCazyK0XNHDGudaBQcLhSVX15NMPem4nXXM5MH
 nZ8xs6PAjgjmjViDtPX0aw583AfcDqViqPk+LpFQ2yP7xqvLgLxrElbtm8Am9i8Cnt5P
 WeYo+VyYPXk+Q7g6HkvjhbS2tecxTXItRqN1CCw0bhEQvUGv0AC+SpvzHXW9EHHLCEuH
 RZUWQw4TnwDpFsvIV8o9rOe31yW02g0LPy6jLqqBPGX4f/eBNZoFplK62PL8fAsnUT4l
 487g==
X-Gm-Message-State: ACgBeo387eUjLMaZpeySRIdkRiXxQ9MjB5uonNGakGOznWviVsqHIB3w
 cuMNpXTTI/he/5rky6c32qIp8f3iAZbpUQ==
X-Google-Smtp-Source: AA6agR6og/Q+kbmkJlgF7I2zL9Uq4E/pje2B5U486uYqTkw3nan0s2ZNV1GRQRGz1sdzSzP4K/AXiA==
X-Received: by 2002:a5d:64a1:0:b0:222:3b0d:c9a3 with SMTP id
 m1-20020a5d64a1000000b002223b0dc9a3mr5874006wrp.437.1659950143195; 
 Mon, 08 Aug 2022 02:15:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b?
 ([2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a5d430e000000b002217540b222sm8411453wrq.58.2022.08.08.02.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 02:15:42 -0700 (PDT)
Message-ID: <a4a36360-3f77-17a0-9239-08cb8c08de74@baylibre.com>
Date: Mon, 8 Aug 2022 11:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/bridge: sii902x: add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Content-Language: en-US
To: Dmitry Osipenko <digetx@gmail.com>, andrzej.hajda@intel.com,
 robert.foss@linaro.org
References: <20220113144305.1074389-1-narmstrong@baylibre.com>
 <25976b46-21b4-6e3f-0182-85dd4ca2b654@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <25976b46-21b4-6e3f-0182-85dd4ca2b654@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 31/07/2022 22:07, Dmitry Osipenko wrote:
> 13.01.2022 17:43, Neil Armstrong пишет:
>> This adds support for DRM_BRIDGE_ATTACH_NO_CONNECTOR by adding the
>> bridge get_edid() and detect() callbacks after refactoring the connector
>> get_modes() and connector_detect() callbacks.
>>
>> In order to keep the bridge working, extra code in get_modes() has been
>> moved to more logical places.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>   drivers/gpu/drm/bridge/sii902x.c | 129 ++++++++++++++++++++++++-------
>>   

1 file changed, 99 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
>> index 89558e581530..65549fbfdc87 100644
>> --- a/drivers/gpu/drm/bridge/sii902x.c
>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>> @@ -166,10 +166,12 @@ struct sii902x {
>>   	struct i2c_client *i2c;
>>   	struct regmap *regmap;
>>   	struct drm_bridge bridge;
>> +	struct drm_bridge *next_bridge;
>>   	struct drm_connector connector;
>>   	struct gpio_desc *reset_gpio;
>>   	struct i2c_mux_core *i2cmux;
>>   	struct regulator_bulk_data supplies[2];
>> +	bool sink_is_hdmi;
>>   	/*
>>   	 * Mutex protects audio and video functions from interfering
>>   	 * each other, by keeping their i2c command sequences atomic.
>> @@ -245,10 +247,8 @@ static void sii902x_reset(struct sii902x *sii902x)
>>   	gpiod_set_value(sii902x->reset_gpio, 0);
>>   }
>>   
>> -static enum drm_connector_status
>> -sii902x_connector_detect(struct drm_connector *connector, bool force)
>> +static enum drm_connector_status sii902x_detect(struct sii902x *sii902x)
>>   {
>> -	struct sii902x *sii902x = connector_to_sii902x(connector);
>>   	unsigned int status;
>>   
>>   	mutex_lock(&sii902x->mutex);
>> @@ -261,6 +261,14 @@ sii902x_connector_detect(struct drm_connector *connector, bool force)
>>   	       connector_status_connected : connector_status_disconnected;
>>   }
>>   
>> +static enum drm_connector_status
>> +sii902x_connector_detect(struct drm_connector *connector, bool force)
>> +{
>> +	struct sii902x *sii902x = connector_to_sii902x(connector);
>> +
>> +	return sii902x_detect(sii902x);
>> +}
>> +
>>   static const struct drm_connector_funcs sii902x_connector_funcs = {
>>   	.detect = sii902x_connector_detect,
>>   	.fill_modes = drm_helper_probe_single_connector_modes,
>> @@ -270,42 +278,40 @@ static const struct drm_connector_funcs sii902x_connector_funcs = {
>>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>   };
>>   
>> -static int sii902x_get_modes(struct drm_connector *connector)
>> +static struct edid *sii902x_get_edid(struct sii902x *sii902x,
>> +				     struct drm_connector *connector)
>>   {
>> -	struct sii902x *sii902x = connector_to_sii902x(connector);
>> -	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>> -	u8 output_mode = SII902X_SYS_CTRL_OUTPUT_DVI;
>>   	struct edid *edid;
>> -	int num = 0, ret;
>>   
>>   	mutex_lock(&sii902x->mutex);
>>   
>>   	edid = drm_get_edid(connector, sii902x->i2cmux->adapter[0]);
>> -	drm_connector_update_edid_property(connector, edid);
>>   	if (edid) {
>>   		if (drm_detect_hdmi_monitor(edid))
>> -			output_mode = SII902X_SYS_CTRL_OUTPUT_HDMI;
>> -
>> -		num = drm_add_edid_modes(connector, edid);
>> -		kfree(edid);
>> +			sii902x->sink_is_hdmi = true;
>> +		else
>> +			sii902x->sink_is_hdmi = false;
>>   	}
>>   
>> -	ret = drm_display_info_set_bus_formats(&connector->display_info,
>> -					       &bus_format, 1);
>> -	if (ret)
>> -		goto error_out;
>> +	mutex_unlock(&sii902x->mutex);
>>   
>> -	ret = regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
>> -				 SII902X_SYS_CTRL_OUTPUT_MODE, output_mode);
>> -	if (ret)
>> -		goto error_out;
>> +	return edid;
>> +}
>>   
>> -	ret = num;
>> +static int sii902x_get_modes(struct drm_connector *connector)
>> +{
>> +	struct sii902x *sii902x = connector_to_sii902x(connector);
>> +	struct edid *edid;
>> +	int num = 0;
>>   
>> -error_out:
>> -	mutex_unlock(&sii902x->mutex);
>> +	edid = sii902x_get_edid(sii902x, connector);
>> +	drm_connector_update_edid_property(connector, edid);
>> +	if (edid) {
>> +		num = drm_add_edid_modes(connector, edid);
>> +		kfree(edid);
>> +	}
>>   
>> -	return ret;
>> +	return num;
>>   }
>>   
>>   static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
>> @@ -354,12 +360,16 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
>>   				    const struct drm_display_mode *adj)
>>   {
>>   	struct sii902x *sii902x = bridge_to_sii902x(bridge);
>> +	u8 output_mode = SII902X_SYS_CTRL_OUTPUT_DVI;
>>   	struct regmap *regmap = sii902x->regmap;
>>   	u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
>>   	struct hdmi_avi_infoframe frame;
>>   	u16 pixel_clock_10kHz = adj->clock / 10;
>>   	int ret;
>>   
>> +	if (sii902x->sink_is_hdmi)
>> +		output_mode = SII902X_SYS_CTRL_OUTPUT_HDMI;
>> +
>>   	buf[0] = pixel_clock_10kHz & 0xff;
>>   	buf[1] = pixel_clock_10kHz >> 8;
>>   	buf[2] = drm_mode_vrefresh(adj);
>> @@ -375,6 +385,11 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
>>   
>>   	mutex_lock(&sii902x->mutex);
>>   
>> +	ret = regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
>> +				 SII902X_SYS_CTRL_OUTPUT_MODE, output_mode);
>> +	if (ret)
>> +		goto out;
>> +
>>   	ret = regmap_bulk_write(regmap, SII902X_TPI_VIDEO_DATA, buf, 10);
>>   	if (ret)
>>   		goto out;
>> @@ -405,13 +420,13 @@ static int sii902x_bridge_attach(struct drm_bridge *bridge,
>>   				 enum drm_bridge_attach_flags flags)
>>   {
>>   	struct sii902x *sii902x = bridge_to_sii902x(bridge);
>> +	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>>   	struct drm_device *drm = bridge->dev;
>>   	int ret;
>>   
>> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
>> -		DRM_ERROR("Fix bridge driver to make connector optional!");
>> -		return -EINVAL;
>> -	}
>> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>> +		return drm_bridge_attach(bridge->encoder, sii902x->next_bridge,
>> +					 bridge, flags);
>>   
>>   	drm_connector_helper_add(&sii902x->connector,
>>   				 &sii902x_connector_helper_funcs);
>> @@ -433,16 +448,38 @@ static int sii902x_bridge_attach(struct drm_bridge *bridge,
>>   	else
>>   		sii902x->connector.polled = DRM_CONNECTOR_POLL_CONNECT;
>>   
>> +	ret = drm_display_info_set_bus_formats(&sii902x->connector.display_info,
>> +					       &bus_format, 1);
>> +	if (ret)
>> +		return ret;
>> +
>>   	drm_connector_attach_encoder(&sii902x->connector, bridge->encoder);
>>   
>>   	return 0;
>>   }
>>   
>> +static enum drm_connector_status sii902x_bridge_detect(struct drm_bridge *bridge)
>> +{
>> +	struct sii902x *sii902x = bridge_to_sii902x(bridge);
>> +
>> +	return sii902x_detect(sii902x);
>> +}
>> +
>> +static struct edid *sii902x_bridge_get_edid(struct drm_bridge *bridge,
>> +					    struct drm_connector *connector)
>> +{
>> +	struct sii902x *sii902x = bridge_to_sii902x(bridge);
>> +
>> +	return sii902x_get_edid(sii902x, connector);
>> +}
>> +
>>   static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>>   	.attach = sii902x_bridge_attach,
>>   	.mode_set = sii902x_bridge_mode_set,
>>   	.disable = sii902x_bridge_disable,
>>   	.enable = sii902x_bridge_enable,
>> +	.detect = sii902x_bridge_detect,
>> +	.get_edid = sii902x_bridge_get_edid,
>>   };
>>   
>>   static int sii902x_mute(struct sii902x *sii902x, bool mute)
>> @@ -829,8 +866,12 @@ static irqreturn_t sii902x_interrupt(int irq, void *data)
>>   
>>   	mutex_unlock(&sii902x->mutex);
>>   
>> -	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
>> +	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev) {
>>   		drm_helper_hpd_irq_event(sii902x->bridge.dev);
>> +		drm_bridge_hpd_notify(&sii902x->bridge, (status & SII902X_PLUGGED_STATUS)
>> +								? connector_status_connected
>> +								: connector_status_disconnected);
>> +	}
>>   
>>   	return IRQ_HANDLED;
>>   }
>> @@ -1001,6 +1042,11 @@ static int sii902x_init(struct sii902x *sii902x)
>>   	sii902x->bridge.funcs = &sii902x_bridge_funcs;
>>   	sii902x->bridge.of_node = dev->of_node;
>>   	sii902x->bridge.timings = &default_sii902x_timings;
>> +	sii902x->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
>> +
>> +	if (sii902x->i2c->irq > 0)
>> +		sii902x->bridge.ops |= DRM_BRIDGE_OP_HPD;
>> +
>>   	drm_bridge_add(&sii902x->bridge);
>>   
>>   	sii902x_audio_codec_init(sii902x, dev);
>> @@ -1022,6 +1068,7 @@ static int sii902x_probe(struct i2c_client *client,
>>   			 const struct i2c_device_id *id)
>>   {
>>   	struct device *dev = &client->dev;
>> +	struct device_node *endpoint;
>>   	struct sii902x *sii902x;
>>   	int ret;
>>   
>> @@ -1049,6 +1096,28 @@ static int sii902x_probe(struct i2c_client *client,
>>   		return PTR_ERR(sii902x->reset_gpio);
>>   	}
>>   
>> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
>> +	if (endpoint) {
>> +		struct device_node *remote = of_graph_get_remote_port_parent(endpoint);
>> +
>> +		of_node_put(endpoint);
>> +		if (!remote) {
>> +			dev_err(dev, "Endpoint in port@1 unconnected\n");
>> +			return -ENODEV;
>> +		}
>> +
>> +		if (!of_device_is_available(remote)) {
>> +			dev_err(dev, "port@1 remote device is disabled\n");
>> +			of_node_put(remote);
>> +			return -ENODEV;
>> +		}
>> +
>> +		sii902x->next_bridge = of_drm_find_bridge(remote);
>> +		of_node_put(remote);
>> +		if (!sii902x->next_bridge)
>> +			return -EPROBE_DEFER;
> 
> Hi,
> 
> This patch broke ARM/QEMU vexpress display because of_drm_find_bridge()
> always fail with -EPROBE_DEFER. Reverting this patch returns display
> back. Please fix or revert, thanks in advance.

Can you share a QEMU cmdline to reproduce ?

Neil
