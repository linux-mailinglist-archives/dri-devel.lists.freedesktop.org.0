Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED338349138
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 12:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1CB6ED09;
	Thu, 25 Mar 2021 11:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89A66ED09
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 11:53:09 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id u5so2407399ejn.8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 04:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7IX0Yj+2rzcGHUgvCwC2c2cC5OMxI6X15YXcc54logI=;
 b=zHhcw7nEqVJiTQkwx3rCXmlmMc0/D5PfMnSKmc3D+M0LqhDIscP0PyGHsb5Iaf6lv8
 9PJKmoDgfn4hLxx0htyUzC7iJRRu4fu9Nb34GVZQGx11O+rzp43ksDLbeTcO9M/PSA2F
 exfdtja33aEyRO69jWSY3GQpze1R2a/J3PVNWvKcCdav5WCEEV1etJpZmeLv//WIpqa5
 LsRABSL4QM9arPY2gXL+x4s/C4Td6TlS8wyNVYy84C0IwrprLXG/zmS+cPeGn/DtrDrt
 it/vKOISKMm1ulA6FOpu7JDj01uvHS9IFA4xgC0boXm5c7NdeYZN6TVKE3LBeHM1c4YI
 zRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7IX0Yj+2rzcGHUgvCwC2c2cC5OMxI6X15YXcc54logI=;
 b=ZsiJ2FRNovKugeZIYPNHzhnc8+lOjAIXdfxUjzBL8X3bNmyHk2ZoCGMYrIC5lsA/ns
 YXlVI/PJA/Zzo+7sNApxBZ0JEEkGDpE5X69YQdI/vlrI2VctDgu39+4thK1jUsEJjM8J
 rG36DAJTL17dSRCuiY0fQkMpTrmO7dL5PiYSBAu1AwuqxbFPBwNqDYT8PKyqbvJiTgy1
 /Hwxf8md+T1Riu9y0N6u7cWKZVRkhi9p66IvNywB6KEPhi54hE6IIucYp89ChcKEbGK6
 5UOsjnLSMYo+HP39gjhpB1loYgnwTFpJ19vCskwQGcs0PcxnD3x/qs3oM8Mhp5Y7Dvyj
 wY8A==
X-Gm-Message-State: AOAM530OsuBUn/vCwVYnSKbvUIrYY9XKGNP7nvWlrHLSgXZ8ra8Ttc5J
 Gdg47XMDRf0Ka53pCSXy5VQlVg==
X-Google-Smtp-Source: ABdhPJyspSSPpTxSzJuwpyY/ctL3hpSi6cFfjwWP1EVsbtnOjbctgms5VfyobMFw2T2raqYzgGZlQQ==
X-Received: by 2002:a17:907:761c:: with SMTP id
 jx28mr9064503ejc.417.1616673188374; 
 Thu, 25 Mar 2021 04:53:08 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id be27sm2598456edb.47.2021.03.25.04.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 04:53:07 -0700 (PDT)
Date: Thu, 25 Mar 2021 11:53:06 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v5 5/6] backlight: rt4831: Adds support for Richtek
 RT4831 backlight
Message-ID: <20210325115306.a462t6wwf5bm26zw@maple.lan>
References: <1608217244-314-1-git-send-email-u0084500@gmail.com>
 <1608217244-314-5-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608217244-314-5-git-send-email-u0084500@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 broonie@kernel.org, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 11:00:43PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds support for Richtek RT4831 backlight.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

Looks ok but there are a few minor niggles.
> ---
>  drivers/video/backlight/Kconfig            |   8 ++
>  drivers/video/backlight/Makefile           |   1 +
>  drivers/video/backlight/rt4831-backlight.c | 219 +++++++++++++++++++++++++++++
>  3 files changed, 228 insertions(+)
>  create mode 100644 drivers/video/backlight/rt4831-backlight.c
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index d83c87b..666bdb0 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -289,6 +289,14 @@ config BACKLIGHT_QCOM_WLED
>  	  If you have the Qualcomm PMIC, say Y to enable a driver for the
>  	  WLED block. Currently it supports PM8941 and PMI8998.
>  
> +config BACKLIGHT_RT4831
> +	tristate "Richtek RT4831 Backlight Driver"
> +	depends on MFD_RT4831
> +	help
> +	  This enables support for Richtek RT4831 Backlight driver.
> +	  It's commont used to drive the display WLED. There're four channels
                    ^^^

> diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
> new file mode 100644
> index 00000000..816c4d6
> --- /dev/null
> +++ b/drivers/video/backlight/rt4831-backlight.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <dt-bindings/leds/rt4831-backlight.h>
> +#include <linux/backlight.h>
> +#include <linux/bitops.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define RT4831_REG_BLCFG	0x02
> +#define RT4831_REG_BLDIML	0x04
> +#define RT4831_REG_ENABLE	0x08
> +
> +#define BL_MAX_BRIGHTNESS	2048

Would be better with a prefix.
> +
> +#define RT4831_BLOVP_MASK	GENMASK(7, 5)
> +#define RT4831_BLOVP_SHIFT	5
> +#define RT4831_BLPWMEN_MASK	BIT(0)
> +#define RT4831_BLEN_MASK	BIT(4)
> +#define RT4831_BLCH_MASK	GENMASK(3, 0)
> +#define RT4831_BLDIML_MASK	GENMASK(2, 0)
> +#define RT4831_BLDIMH_MASK	GENMASK(10, 3)
> +#define RT4831_BLDIMH_SHIFT	3
> +
> +struct rt4831_priv {
> +	struct regmap *regmap;
> +	struct mutex lock;

Locks aren't very common in backlight drivers. Why isn't the ops_lock
sufficient?


> +	struct backlight_device *bl;
> +};
> +
> +static int rt4831_bl_update_status(struct backlight_device *bl_dev)
> +{
> +	struct rt4831_priv *priv = bl_get_data(bl_dev);
> +	int brightness = backlight_get_brightness(bl_dev);
> +	unsigned int enable = brightness ? RT4831_BLEN_MASK : 0;
> +	u8 v[2];
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	if (brightness) {
> +		v[0] = (brightness - 1) & RT4831_BLDIML_MASK;
> +		v[1] = ((brightness - 1) & RT4831_BLDIMH_MASK) >> RT4831_BLDIMH_SHIFT;
> +
> +		ret = regmap_raw_write(priv->regmap, RT4831_REG_BLDIML, v, sizeof(v));
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	ret = regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831_BLEN_MASK, enable);
> +
> +unlock:
> +	mutex_unlock(&priv->lock);
> +	return ret;
> +}
> +
> +static int rt4831_bl_get_brightness(struct backlight_device *bl_dev)
> +{
> +	struct rt4831_priv *priv = bl_get_data(bl_dev);
> +	unsigned int val;
> +	u8 v[2];
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	ret = regmap_read(priv->regmap, RT4831_REG_ENABLE, &val);
> +	if (ret)
> +		return ret;

Deadlock.


> +
> +	if (!(val & RT4831_BLEN_MASK)) {
> +		ret = 0;
> +		goto unlock;
> +	}
> +
> +	ret = regmap_raw_read(priv->regmap, RT4831_REG_BLDIML, v, sizeof(v));
> +	if (ret)
> +		goto unlock;
> +
> +	ret = (v[1] << RT4831_BLDIMH_SHIFT) + (v[0] & RT4831_BLDIML_MASK) + 1;
> +
> +unlock:
> +	mutex_unlock(&priv->lock);
> +	return ret;
> +}
> +
> +static const struct backlight_ops rt4831_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = rt4831_bl_update_status,
> +	.get_brightness = rt4831_bl_get_brightness,
> +};
> +
> +static int rt4831_init_device_properties(struct rt4831_priv *priv, struct device *dev,

This is not the idiomatic name usually used for this type of function.
In fact since this driver purely uses device properties then this code
could just be merged into the probe function.


> +					  struct backlight_properties *bl_props)
> +{
> +	u8 propval;
> +	u32 brightness;
> +	unsigned int val = 0;
> +	int ret;
> +
> +	/* common properties */
> +	ret = device_property_read_u32(dev, "max-brightness", &brightness);
> +	if (ret) {
> +		dev_warn(dev, "max-brightness DT property missing, use HW max as default\n");

Does there need to be a warning on this?

It's code pattern is common but the DT docs have formalized a lot
recently. The DT docs in patch 1 say these are optional... so
why does it justify a warning of they are omitted? There is nothing
wrong! Is it better to specify the defaults in the bindings and
then the kernel can say nothing when the defaults are adopted.


> +		brightness = BL_MAX_BRIGHTNESS;
> +	}
> +
> +	bl_props->max_brightness = min_t(u32, brightness, BL_MAX_BRIGHTNESS);
> +
> +	ret = device_property_read_u32(dev, "default-brightness", &brightness);
> +	if (ret) {
> +		dev_warn(dev, "default-brightness DT property missing, use max limit as default\n");

Ditto.


> +		brightness = bl_props->max_brightness;
> +	}
> +
> +	bl_props->brightness = min_t(u32, brightness, bl_props->max_brightness);
> +
> +	/* vendor properties */
> +	if (device_property_read_bool(dev, "richtek,pwm-enable"))
> +		val = RT4831_BLPWMEN_MASK;
> +
> +	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831_BLPWMEN_MASK, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = device_property_read_u8(dev, "richtek,bled-ovp-sel", &propval);
> +	if (ret) {
> +		dev_warn(dev, "richtek,bled-ovp-sel DT property missing,
> use default 21V\n");o

Ditto.

> +		propval = RT4831_BLOVPLVL_21V;
> +	}
> +
> +	propval = min_t(u8, propval, RT4831_BLOVPLVL_29V);
> +	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831_BLOVP_MASK,
> +				 propval << RT4831_BLOVP_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = device_property_read_u8(dev, "richtek,channel-use", &propval);
> +	if (ret) {
> +		dev_err(dev, "richtek,channel-use DT property missing\n");
> +		return ret;
> +	}
> +
> +	if (!(propval & RT4831_BLCH_MASK)) {
> +		dev_err(dev, "No channel specified\n");
> +		return -EINVAL;
> +	}
> +
> +	return regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831_BLCH_MASK, propval);
> +}
> +
> +static int rt4831_bl_probe(struct platform_device *pdev)
> +{
> +	struct rt4831_priv *priv;
> +	struct backlight_properties bl_props = { .type = BACKLIGHT_RAW, };

In new drivers please make sure to correctly set props.scale so that the
backlight slider can be mapped correctly (see
Documentation/ABI/testing/sysfs-class-backlight for description of the
options).
 
 
Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
