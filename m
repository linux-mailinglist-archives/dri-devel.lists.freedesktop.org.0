Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA76D1B06
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C599110F156;
	Fri, 31 Mar 2023 09:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE89C10F156
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:59:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d17so21637641wrb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680253197;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ye0o0DOlmwExDTDHeZjZe7L/whuEGmKI0wj5yw1wRxo=;
 b=PFc7jF3ItJ+FZRQN3LHZe0MawGiBP/Lg8vX5Ch4HlshzvoOfePQ6XRZ3aBsuxAn28m
 SRSgJM3MFuaMO89mmA6ZOeXGHZT0DoHu+qktfaA7Pq+TGdqjOFVM5GbVncoKkmNjcLN9
 jmfvQZHE/teBTICIU+/A9A2hYqq31M5r7V9Cw2z9LzuKIg6eAdrodZ0KvP5eJs6Sct89
 iZwO204UO2yhEgP2cNtNXDfmyzVGpHQKamm9qwxnqpgkWlMllLhSpvS/DtKFtdEoG4n6
 jHa/N9ltuhEC0nj+IwyYCZctjLN4VB7XbJEk8qo8IWY0j/cq8CWtnI3mFQ09dqPiMWOn
 gk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680253197;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ye0o0DOlmwExDTDHeZjZe7L/whuEGmKI0wj5yw1wRxo=;
 b=CoBG+hg69uy9abilXuQ+iFXmfsC2bFfwmbhNaufgEwIKV56SZBUjH52WxJug/v81H6
 2mE38c471OPcncaGsQQFV86dFD7WNj0v85o+UEikdsyZ18r0e1vdhZ4BoLEXWjMULTA0
 SDUmX3ncFzVpUTvvu8Lmt+k1OJdHYfZlbiScf0eGKtj7KKUKxypDukgsFdEZH92gUvVw
 7OVDmIwBR4+ihFORkIS6qp/GQYRekriN/sW/k7YU31OJ6+WlchLqB2qSGyoZJtJTcJDK
 jvV0UGkMMCxQMCjRuL6gBcCfCLCOha0v1VPijN4zU8sL7lNGpdHZgLXptEtaJAGUrL+m
 r8BA==
X-Gm-Message-State: AAQBX9dqJmUof0/Gfx1Oov2VzTM3IOnVXLrdBto0G26cKz/Q1FfWrORu
 g//Jg6A6y8SelxXShDnVl1OrIQ==
X-Google-Smtp-Source: AKy350Z960b4qXOgbVvrPqkVXpCMt/BnSrX218lANtVkhq6VgQsYYNjC1q+R5ya41an7VAvI3rh0ZQ==
X-Received: by 2002:adf:ed0e:0:b0:2d1:86e6:bd6 with SMTP id
 a14-20020adfed0e000000b002d186e60bd6mr19853304wro.22.1680253197081; 
 Fri, 31 Mar 2023 01:59:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0?
 ([2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a5d508f000000b002c707785da4sm1587034wrt.107.2023.03.31.01.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 01:59:56 -0700 (PDT)
Message-ID: <bcc65251-8bd1-04a6-ace4-8a5f095f9764@linaro.org>
Date: Fri, 31 Mar 2023 10:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] drm/bridge: tfp410: Support basic I2C interface
Content-Language: en-US
To: Jonathan Cormier <jcormier@criticallink.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230125-tfp410_i2c-v3-0-a85d5f0f50f1@criticallink.com>
 <20230125-tfp410_i2c-v3-1-a85d5f0f50f1@criticallink.com>
Organization: Linaro Developer Services
In-Reply-To: <20230125-tfp410_i2c-v3-1-a85d5f0f50f1@criticallink.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org,
 Michael Williamson <michael.williamson@criticallink.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bob Duke <bduke@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/02/2023 23:10, Jonathan Cormier wrote:
> From: Michael Williamson <michael.williamson@criticallink.com>
> 
> The TFP410 driver does not support I2C.  As such, the device remains in
> Power Down if the I2C is enabled by the bootstrap pins.
> 
> Add basic support for the I2C interface, and provide support to take
> the device out of power down when enabled.  Also read the bootstrap mode
> pins via the CTL_1_MODE register when using the I2C bus.
> 
> Signed-off-by: Michael Williamson <michael.williamson@criticallink.com>
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
>   drivers/gpu/drm/bridge/ti-tfp410.c | 93 +++++++++++++++++++++++++++-----------
>   1 file changed, 67 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index b9635abbad16..bb3f8d0ff207 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -6,6 +6,7 @@
>   
>   #include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
> +#include <linux/regmap.h>
>   #include <linux/media-bus-format.h>
>   #include <linux/module.h>
>   #include <linux/of_graph.h>
> @@ -21,6 +22,20 @@
>   
>   #define HOTPLUG_DEBOUNCE_MS		1100
>   
> +#define TFP410_REG_CTL_1_MODE	0x08
> +#define TFP410_BIT_PD   BIT(0)
> +#define TFP410_BIT_EDGE BIT(1)
> +#define TFP410_BIT_BSEL BIT(2)
> +#define TFP410_BIT_DSEL BIT(3)
> +
> +static const struct regmap_config tfp410_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = 0xff,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
>   struct tfp410 {
>   	struct drm_bridge	bridge;
>   	struct drm_connector	connector;
> @@ -33,6 +48,8 @@ struct tfp410 {
>   	struct drm_bridge	*next_bridge;
>   
>   	struct device *dev;
> +	struct i2c_client *i2c;
> +	struct regmap *regmap;
>   };
>   
>   static inline struct tfp410 *
> @@ -183,6 +200,9 @@ static void tfp410_enable(struct drm_bridge *bridge)
>   {
>   	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
>   
> +	if (dvi->i2c)
> +		regmap_set_bits(dvi->regmap, TFP410_REG_CTL_1_MODE, TFP410_BIT_PD);
> +
>   	gpiod_set_value_cansleep(dvi->powerdown, 0);
>   }
>   
> @@ -190,6 +210,9 @@ static void tfp410_disable(struct drm_bridge *bridge)
>   {
>   	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
>   
> +	if (dvi->i2c)
> +		regmap_clear_bits(dvi->regmap, TFP410_REG_CTL_1_MODE, TFP410_BIT_PD);
> +
>   	gpiod_set_value_cansleep(dvi->powerdown, 1);
>   }
>   
> @@ -221,38 +244,48 @@ static const struct drm_bridge_timings tfp410_default_timings = {
>   	.hold_time_ps = 1300,
>   };
>   
> -static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
> +static int tfp410_parse_timings(struct tfp410 *dvi)
>   {
>   	struct drm_bridge_timings *timings = &dvi->timings;
>   	struct device_node *ep;
>   	u32 pclk_sample = 0;
>   	u32 bus_width = 24;
>   	u32 deskew = 0;
> +	unsigned int val = 0;
> +	int ret = 0;
>   
>   	/* Start with defaults. */
>   	*timings = tfp410_default_timings;
>   
> -	if (i2c)
> +	if (dvi->i2c) {
>   		/*
> -		 * In I2C mode timings are configured through the I2C interface.
> -		 * As the driver doesn't support I2C configuration yet, we just
> -		 * go with the defaults (BSEL=1, DSEL=1, DKEN=0, EDGE=1).
> +		 * For now, assume settings are latched from pins on reset / power up.
> +		 * Should add options to optionally set them out of DT properties.
>   		 */
> -		return 0;
> -
> -	/*
> -	 * In non-I2C mode, timings are configured through the BSEL, DSEL, DKEN
> -	 * and EDGE pins. They are specified in DT through endpoint properties
> -	 * and vendor-specific properties.
> -	 */
> -	ep = of_graph_get_endpoint_by_regs(dvi->dev->of_node, 0, 0);
> -	if (!ep)
> -		return -EINVAL;
> -
> -	/* Get the sampling edge from the endpoint. */
> -	of_property_read_u32(ep, "pclk-sample", &pclk_sample);
> -	of_property_read_u32(ep, "bus-width", &bus_width);
> -	of_node_put(ep);
> +		ret = regmap_read(dvi->regmap, TFP410_REG_CTL_1_MODE, &val);
> +		if (ret) {
> +			dev_err(dvi->dev, "Read failed on CTL_1_MODE\n");
> +			return ret;
> +		}
> +		pclk_sample = (val & TFP410_BIT_EDGE) ? 1 : 0;
> +		bus_width = (val & TFP410_BIT_BSEL) ? 24 : 12;
> +		dev_dbg(dvi->dev, "(0x%02X) : detected %d bus width, %s edge sampling\n",
> +			val, bus_width, pclk_sample ? "positive" : "negative");
> +	} else {
> +		/*
> +		 * In non-I2C mode, timings are configured through the BSEL, DSEL, DKEN
> +		 * and EDGE pins. They are specified in DT through endpoint properties
> +		 * and vendor-specific properties.
> +		 */
> +		ep = of_graph_get_endpoint_by_regs(dvi->dev->of_node, 0, 0);
> +		if (!ep)
> +			return -EINVAL;
> +
> +		/* Get the sampling edge from the endpoint. */
> +		of_property_read_u32(ep, "pclk-sample", &pclk_sample);
> +		of_property_read_u32(ep, "bus-width", &bus_width);
> +		of_node_put(ep);
> +	}
>   
>   	timings->input_bus_flags = DRM_BUS_FLAG_DE_HIGH;
>   
> @@ -291,7 +324,7 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
>   	return 0;
>   }
>   
> -static int tfp410_init(struct device *dev, bool i2c)
> +static int tfp410_init(struct device *dev, struct i2c_client *i2c)
>   {
>   	struct device_node *node;
>   	struct tfp410 *dvi;
> @@ -313,15 +346,24 @@ static int tfp410_init(struct device *dev, bool i2c)
>   	dvi->bridge.of_node = dev->of_node;
>   	dvi->bridge.timings = &dvi->timings;
>   	dvi->bridge.type = DRM_MODE_CONNECTOR_DVID;
> +	dvi->i2c = i2c;
> +
> +	if (i2c) {
> +		dvi->regmap = devm_regmap_init_i2c(i2c, &tfp410_regmap_config);
> +		if (IS_ERR(dvi->regmap))
> +			return PTR_ERR(dvi->regmap);
> +	}
>   
> -	ret = tfp410_parse_timings(dvi, i2c);
> +	ret = tfp410_parse_timings(dvi);
>   	if (ret)
>   		return ret;
>   
>   	/* Get the next bridge, connected to port@1. */
>   	node = of_graph_get_remote_node(dev->of_node, 1, -1);
> -	if (!node)
> +	if (!node) {
> +		dev_err(dev, "Could not find remote node\n");
>   		return -ENODEV;
> +	}
>   
>   	dvi->next_bridge = of_drm_find_bridge(node);
>   	of_node_put(node);
> @@ -352,7 +394,7 @@ static void tfp410_fini(struct device *dev)
>   
>   static int tfp410_probe(struct platform_device *pdev)
>   {
> -	return tfp410_init(&pdev->dev, false);
> +	return tfp410_init(&pdev->dev, NULL);
>   }
>   
>   static int tfp410_remove(struct platform_device *pdev)
> @@ -378,7 +420,6 @@ static struct platform_driver tfp410_platform_driver = {
>   };
>   
>   #if IS_ENABLED(CONFIG_I2C)
> -/* There is currently no i2c functionality. */
>   static int tfp410_i2c_probe(struct i2c_client *client,
>   			    const struct i2c_device_id *id)
>   {
> @@ -391,7 +432,7 @@ static int tfp410_i2c_probe(struct i2c_client *client,
>   		return -ENXIO;
>   	}
>   
> -	return tfp410_init(&client->dev, true);
> +	return tfp410_init(&client->dev, client);
>   }
>   
>   static void tfp410_i2c_remove(struct i2c_client *client)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
