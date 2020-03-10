Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E16317F4E0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 11:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC036E866;
	Tue, 10 Mar 2020 10:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0BF6E866
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 10:18:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r7so15094494wro.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 03:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DgiO2chKoJ8vjMNestzs4TKOYYd4s40lBmzDiEk2JPM=;
 b=VT/et8X/azwH5HPRePhnfM90hD3Y9ksu/lhtt2eZ7lIjWu0ZbwTq20kJniG7szqn7N
 ey5vDIYuZkNhr4+4UQdIm31jgyOySwtH6RRcKJ5/fyMl2LVCrCK8Rm+aWwMP9kIg3Yze
 MDZabwlV8p5obkM/vIYq7vieHeMCb0QTnOtkmX0CEjxGbzwzTO/WkIeCxRWjP99m2aQt
 ZYdxTmW+kNxNWC0z+VTpAnphzAaHAmMg1vGngTLUSRLsfmysI34PV3Xs2nTrtklwJgPT
 4GtzJF4p2zSuqTH8mN3xHbIcIfYZOQRWnmL6X9adBz1hND2dvq71Uyqb2ncoHELdjeR9
 Pzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DgiO2chKoJ8vjMNestzs4TKOYYd4s40lBmzDiEk2JPM=;
 b=dBQ4ZhAnFIi0JPkjc7YNFqAFmha7P6cfdIr0NgIuInNG3M1SAkB1Ir+BthUiBke4bk
 d2y3GFYqHQx56PMfIWE/Awo3sLU9WwcZdJ//3OQVtydoNj8IQ7jabY1D+5N4KQ7TM5KX
 s2rRghPHsZnFIvmZnjii0tZsqRqOLZKpOWpopsPCfN1rAuSu4XpMCkCVVEyN6DPffPBU
 Dm9UFyCGHUf9L0aSKq0tzMniDCA2ml9CzDfOAggREQgANyXPeaIKuJrLZAlPryoVhzB/
 amb+naPw1+eka9yLkqZMlSC/qTJqj2Tiespf1zYZ3iZJYjSIf4EKGOArsF1kLs9oy4+5
 eIFA==
X-Gm-Message-State: ANhLgQ3mVheWsmRJ0ngrElBYZF2D+Tt5q0Y4codc0/x81/27z6AduHqT
 zFYv6Cyk8fxpAaJtAdDaD7qsrbygy1qcNA==
X-Google-Smtp-Source: ADFU+vuZjiwDGmSY9ujI6IzzZiJjGOpT4aZAHUoOXlMD6XC0+suHICJ2SWK39FVc8f6z8sHwo68HGg==
X-Received: by 2002:a5d:68cc:: with SMTP id p12mr13054455wrw.375.1583835509517; 
 Tue, 10 Mar 2020 03:18:29 -0700 (PDT)
Received: from [10.1.3.173]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f4sm9719626wrt.24.2020.03.10.03.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 03:18:28 -0700 (PDT)
Subject: Re: [PATCH v2] drm: bridge: tfp410: Check device ID for I2C-connected
 TFP410
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200309184432.10293-1-laurent.pinchart@ideasonboard.com>
 <20200309203736.32695-1-laurent.pinchart@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <e6cecf9f-f5c8-dd43-9322-dca1ca4f162d@baylibre.com>
Date: Tue, 10 Mar 2020 11:18:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309203736.32695-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2020 21:37, Laurent Pinchart wrote:
> The TFP410 supports configuration through I2C (in which case the
> corresponding DT node is a child of an I2C controller) or through pins
> (in which case the DT node creates a platform device). When I2C access
> to the device is available, read and validate the device ID at probe
> time to ensure that the device is present.
> 
> While at it, sort headers alphabetically.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> This time based on drm-misc-next instead of v5.6-rc5, with conflicts
> resolved.
> 
>  drivers/gpu/drm/bridge/ti-tfp410.c | 134 +++++++++++++++++++++++++----
>  1 file changed, 115 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index 40c4d4a5517b..be8d74ff632b 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/workqueue.h>
>  
>  #include <drm/drm_atomic_helper.h>
> @@ -26,6 +27,7 @@ struct tfp410 {
>  	u32			bus_format;
>  	struct delayed_work	hpd_work;
>  	struct gpio_desc	*powerdown;
> +	struct regmap		*regmap;
>  
>  	struct drm_bridge_timings timings;
>  	struct drm_bridge	*next_bridge;
> @@ -213,7 +215,7 @@ static const struct drm_bridge_timings tfp410_default_timings = {
>  	.hold_time_ps = 1300,
>  };
>  
> -static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
> +static int tfp410_parse_timings(struct tfp410 *dvi)
>  {
>  	struct drm_bridge_timings *timings = &dvi->timings;
>  	struct device_node *ep;
> @@ -224,7 +226,7 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
>  	/* Start with defaults. */
>  	*timings = tfp410_default_timings;
>  
> -	if (i2c)
> +	if (dvi->regmap)
>  		/*
>  		 * In I2C mode timings are configured through the I2C interface.
>  		 * As the driver doesn't support I2C configuration yet, we just
> @@ -283,10 +285,10 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
>  	return 0;
>  }
>  
> -static int tfp410_init(struct device *dev, bool i2c)
> +static int tfp410_init(struct tfp410 *dvi)
>  {
>  	struct device_node *node;
> -	struct tfp410 *dvi;
> +	struct device *dev = dvi->dev;
>  	int ret;
>  
>  	if (!dev->of_node) {
> @@ -294,11 +296,6 @@ static int tfp410_init(struct device *dev, bool i2c)
>  		return -ENXIO;
>  	}
>  
> -	dvi = devm_kzalloc(dev, sizeof(*dvi), GFP_KERNEL);
> -	if (!dvi)
> -		return -ENOMEM;
> -
> -	dvi->dev = dev;
>  	dev_set_drvdata(dev, dvi);
>  
>  	dvi->bridge.funcs = &tfp410_bridge_funcs;
> @@ -306,7 +303,7 @@ static int tfp410_init(struct device *dev, bool i2c)
>  	dvi->bridge.timings = &dvi->timings;
>  	dvi->bridge.type = DRM_MODE_CONNECTOR_DVID;
>  
> -	ret = tfp410_parse_timings(dvi, i2c);
> +	ret = tfp410_parse_timings(dvi);
>  	if (ret)
>  		return ret;
>  
> @@ -346,7 +343,15 @@ static int tfp410_fini(struct device *dev)
>  
>  static int tfp410_probe(struct platform_device *pdev)
>  {
> -	return tfp410_init(&pdev->dev, false);
> +	struct tfp410 *dvi;
> +
> +	dvi = devm_kzalloc(&pdev->dev, sizeof(*dvi), GFP_KERNEL);
> +	if (!dvi)
> +		return -ENOMEM;
> +
> +	dvi->dev = &pdev->dev;
> +
> +	return tfp410_init(dvi);
>  }
>  
>  static int tfp410_remove(struct platform_device *pdev)
> @@ -370,20 +375,111 @@ static struct platform_driver tfp410_platform_driver = {
>  };
>  
>  #if IS_ENABLED(CONFIG_I2C)
> -/* There is currently no i2c functionality. */
> +
> +#define TFP410_VEN_ID_LO		0x00
> +#define TFP410_VEN_ID_HI		0x01
> +#define TFP410_DEV_ID_LO		0x02
> +#define TFP410_DEV_ID_HI		0x03
> +#define TFP410_REV_ID			0x04
> +#define TFP410_CTL_1_MODE		0x08
> +#define TFP410_CTL_2_MODE		0x09
> +#define TFP410_CTL_3_MODE		0x0a
> +#define TFP410_CFG			0x0b
> +#define TFP410_DE_DLY			0x32
> +#define TFP410_DE_CTL			0x33
> +#define TFP410_DE_TOP			0x34
> +#define TFP410_DE_CNT_LO		0x36
> +#define TFP410_DE_CNT_HI		0x37
> +#define TFP410_DE_LIN_LO		0x38
> +#define TFP410_DE_LIN_HI		0x39
> +#define TFP410_H_RES_LO			0x3a
> +#define TFP410_H_RES_HI			0x3b
> +#define TFP410_V_RES_LO			0x3c
> +#define TFP410_V_RES_HI			0x3d
> +
> +static const struct regmap_config tfp410_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = 0x3d,
> +	.wr_table = &(const struct regmap_access_table) {
> +		.yes_ranges = (const struct regmap_range[]) {
> +			{
> +				.range_min = TFP410_CTL_1_MODE,
> +				.range_max = TFP410_DE_LIN_HI,
> +			},
> +		},
> +		.n_yes_ranges = 1,
> +	},
> +};
> +
> +static int tfp410_check_version(struct tfp410 *dvi)
> +{
> +	unsigned int value;
> +	u16 vendor_id;
> +	u16 device_id;
> +	u8 revision_id;
> +	int ret;
> +
> +	ret = regmap_read(dvi->regmap, TFP410_VEN_ID_LO, &value);
> +	if (ret < 0)
> +		return ret;
> +	vendor_id = value;
> +
> +	ret = regmap_read(dvi->regmap, TFP410_VEN_ID_HI, &value);
> +	if (ret < 0)
> +		return ret;
> +	vendor_id |= value << 8;
> +
> +	ret = regmap_read(dvi->regmap, TFP410_DEV_ID_LO, &value);
> +	if (ret < 0)
> +		return ret;
> +	device_id = value;
> +
> +	ret = regmap_read(dvi->regmap, TFP410_DEV_ID_HI, &value);
> +	if (ret < 0)
> +		return ret;
> +	device_id |= value << 8;
> +
> +	ret = regmap_read(dvi->regmap, TFP410_REV_ID, &value);
> +	if (ret < 0)
> +		return ret;
> +	revision_id = value;
> +
> +	if (vendor_id != 0x014c || device_id != 0x0410) {
> +		dev_err(dvi->dev, "invalid device ID %04x:%04x\n",
> +			vendor_id, device_id);
> +		return -ENODEV;
> +	}
> +
> +	dev_info(dvi->dev, "Found TFP410 revision 0x%02x\n", revision_id);
> +
> +	return 0;
> +}
> +
>  static int tfp410_i2c_probe(struct i2c_client *client,
>  			    const struct i2c_device_id *id)
>  {
> -	int reg;
> +	struct tfp410 *dvi;
> +	int ret;
>  
> -	if (!client->dev.of_node ||
> -	    of_property_read_u32(client->dev.of_node, "reg", &reg)) {
> -		dev_err(&client->dev,
> -			"Can't get i2c reg property from device-tree\n");
> -		return -ENXIO;
> +	dvi = devm_kzalloc(&client->dev, sizeof(*dvi), GFP_KERNEL);
> +	if (!dvi)
> +		return -ENOMEM;
> +
> +	dvi->dev = &client->dev;
> +
> +	dvi->regmap = devm_regmap_init_i2c(client, &tfp410_regmap_config);
> +	if (IS_ERR(dvi->regmap))
> +		return PTR_ERR(dvi->regmap);
> +
> +	ret = tfp410_check_version(dvi);
> +	if (ret < 0) {
> +		dev_err(dvi->dev, "failed to read device ID (%d)\n", ret);
> +		return ret;
>  	}
>  
> -	return tfp410_init(&client->dev, true);
> +	return tfp410_init(dvi);
>  }
>  
>  static int tfp410_i2c_remove(struct i2c_client *client)
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
