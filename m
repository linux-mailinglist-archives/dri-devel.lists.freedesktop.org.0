Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FBC671E1E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 14:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F33110E1EE;
	Wed, 18 Jan 2023 13:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E89A10E1EE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 13:39:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id k16so4056625wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 05:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hbqo8y8itUmS74Hp/Oy9k6/Cd/04Q/v2PoCaMqfjJUA=;
 b=Ey/3asLfOg7ehOUnk6TWC8L8setwNIDNmRSX8VM+SIidOYljE/JiVP8FjjGpg3XLnL
 sh7ClT0+oOpGO7gv2p/sXjyT4VQOl9Bsis9BpN1tbO60TIYDnYteYuuj773JuJPkYF43
 4xPqZGflEilEa9y3lze8nbwqOCoUNhxbaH2+A1sfc1mWTW2menfO9JH/4JtNWLKltO7C
 csxuMv5OzFE/4xZfLPQj1rKtOSfreCHBDfLm1fCfx5eIT40XYhpjry9JQvD5Zpm8fj7T
 UI3srd9iDpe/QB10qL8I2PoRcVHzT23QXvdlu4hHKGjccZLIE4tKHzRlK9jQFdJ/BOHL
 vAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hbqo8y8itUmS74Hp/Oy9k6/Cd/04Q/v2PoCaMqfjJUA=;
 b=IJk+eEO56WBxhTOui+tkGoDEBAb7Z9cQkHBxEiNmSGVzndprmios558ANzWrCAzT4Q
 0fZJWeA1OaCRSsXRRP5EkiCwyf9WCeukmXCx/ATgCJhvuJ9uPGUxokFhKH/G+LP7hKKA
 fu8iJzzzAyDHYI2gU6Pq2zotLFJssiF++vpkFoUZnoR3KqHiHo09ziob+Vpy2863zmbU
 TPWBKNKjmKU4KE9FmlFwiLARdP6ebswXf4dP8ZfJdysqFK1FxgcjWBEQQ14D+dGmuNkp
 58tTfVaPam3otCQ7wU10v8MiLis1VES2JIG5m1xQiOGnoOTQrrBf8H3ri5NrNv76W3pH
 n5GA==
X-Gm-Message-State: AFqh2krIOIwoDBt6zZo6k+xGptYW0Pef/8T7JySGr0ZfYyThQpmXiwx1
 iQ1kZOaKQH4M2ElX2mghdIDjuQ==
X-Google-Smtp-Source: AMrXdXt9UjN5VKZ8KL2r1tHX2krWXtOX+wwkqLP8neD5BgB8E+kHTT+tzt2PIL0oUH6keVdXeJVLDg==
X-Received: by 2002:a05:600c:3108:b0:3d1:baf7:ceae with SMTP id
 g8-20020a05600c310800b003d1baf7ceaemr6573597wmo.39.1674049157438; 
 Wed, 18 Jan 2023 05:39:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a05600c215400b003d358beab9dsm1919401wml.47.2023.01.18.05.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 05:39:17 -0800 (PST)
Message-ID: <8349dd70-c383-8339-841a-1b440049debb@linaro.org>
Date: Wed, 18 Jan 2023 14:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v6 2/2] backlight: ktz8866: Add support for Kinetic
 KTZ8866 backlight
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
References: <20230118131002.15453-1-lujianhua000@gmail.com>
 <20230118131002.15453-2-lujianhua000@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118131002.15453-2-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2023 14:10, Jianhua Lu wrote:
> Add support for Kinetic KTZ8866 backlight, which is used in
> Xiaomi tablet, Mi Pad 5 series. This driver lightly based on
> downstream implementation [1].
> [1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/video/backlight/ktz8866.c
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Add missing staitc modifier to ktz8866_write function.
> 
> Changes in v3:
>   - Add 2022 to Copyright line.
>   - Sort headers.
>   - Remove meaningless comment.
>   - Use definitions instead of hardcoding.
>   - Add missing maintainer info.
> 
> Changes in v4:
>   - Change 2022 to 2023.
>   - Remove useless macro and enum.
>   - Describe settings by devicetree.
>   - Move header file to C file.
> 
> Changes in v5:
>   - Change "2023" to "2022, 2023" in Copyright line.
>   - Set scale property for backlight.
> 
> Changes in v6:
>   - Correct devicetree property name.
> 
>  MAINTAINERS                       |   6 +
>  drivers/video/backlight/Kconfig   |   8 ++
>  drivers/video/backlight/Makefile  |   1 +
>  drivers/video/backlight/ktz8866.c | 205 ++++++++++++++++++++++++++++++
>  4 files changed, 220 insertions(+)
>  create mode 100644 drivers/video/backlight/ktz8866.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42fc47c6edfd..2084e74e1b58 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11674,6 +11674,12 @@ M:	John Hawley <warthog9@eaglescrag.net>
>  S:	Maintained
>  F:	tools/testing/ktest
>  
> +KTZ8866 BACKLIGHT DRIVER
> +M:	Jianhua Lu <lujianhua000@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> +F:	drivers/video/backlight/ktz8866.c
> +
>  L3MDEV
>  M:	David Ahern <dsahern@kernel.org>
>  L:	netdev@vger.kernel.org
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 936ba1e4d35e..f7113ceb264a 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -190,6 +190,14 @@ config BACKLIGHT_KTD253
>  	  which is a 1-wire GPIO-controlled backlight found in some mobile
>  	  phones.
>  
> +config BACKLIGHT_KTZ8866
> +	tristate "Backlight Driver for Kinetic KTZ8866"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +		Say Y to enable the backlight driver for the Kinetic KTZ8866
> +		found in Xiaomi Mi Pad 5 series.
> +
>  config BACKLIGHT_LM3533
>  	tristate "Backlight Driver for LM3533"
>  	depends on MFD_LM3533
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index e815f3f1deff..f70a819c304c 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
>  obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
>  obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
>  obj-$(CONFIG_BACKLIGHT_KTD253)		+= ktd253-backlight.o
> +obj-$(CONFIG_BACKLIGHT_KTZ8866)		+= ktz8866.o
>  obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
>  obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
>  obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
> diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
> new file mode 100644
> index 000000000000..ca3ac349cd10
> --- /dev/null
> +++ b/drivers/video/backlight/ktz8866.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Backlight driver for the Kinetic KTZ8866
> + *
> + * Copyright (C) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#define DEFAULT_BRIGHTNESS 1500
> +#define MAX_BRIGHTNESS 2047
> +#define REG_MAX 0x15
> +
> +/* reg */
> +#define DEVICE_ID 0x01
> +#define BL_CFG1 0x02
> +#define BL_CFG2 0x03
> +#define BL_BRT_LSB 0x04
> +#define BL_BRT_MSB 0x05
> +#define BL_EN 0x08
> +#define LCD_BIAS_CFG1 0x09
> +#define LCD_BIAS_CFG2 0x0A
> +#define LCD_BIAS_CFG3 0x0B
> +#define LCD_BOOST_CFG 0x0C
> +#define OUTP_CFG 0x0D
> +#define OUTN_CFG 0x0E
> +#define FLAG 0x0F
> +#define BL_OPTION1 0x10
> +#define BL_OPTION2 0x11
> +#define PWM2DIG_LSBs 0x12
> +#define PWM2DIG_MSBs 0x13
> +#define BL_DIMMING 0x14
> +#define PWM_RAMP_TIME 0x15
> +
> +/* definition */
> +#define BL_EN_BIT BIT(6)
> +#define LCD_BIAS_EN 0x9F
> +#define PWM_HYST 0x5
> +
> +struct ktz8866 {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	bool led_on;
> +};
> +
> +static const struct regmap_config ktz8866_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = REG_MAX,
> +};
> +
> +static int ktz8866_write(struct ktz8866 *ktz, unsigned int reg,
> +			 unsigned int val)
> +{
> +	return regmap_write(ktz->regmap, reg, val);
> +}
> +
> +static int ktz8866_update_bits(struct ktz8866 *ktz, unsigned int reg,
> +			       unsigned int mask, unsigned int val)
> +{
> +	return regmap_update_bits(ktz->regmap, reg, mask, val);
> +}
> +
> +static int ktz8866_backlight_update_status(struct backlight_device *backlight_dev)
> +{
> +	struct ktz8866 *ktz = bl_get_data(backlight_dev);
> +	unsigned int brightness = backlight_get_brightness(backlight_dev);
> +
> +	if (!ktz->led_on && brightness > 0) {
> +		ktz8866_update_bits(ktz, BL_EN, BL_EN_BIT, BL_EN_BIT);
> +		ktz->led_on = true;
> +	} else if (brightness == 0) {
> +		ktz8866_update_bits(ktz, BL_EN, BL_EN_BIT, 0);
> +		ktz->led_on = false;
> +		msleep(10);

Why 10 ms? Document magic values. Their need, reason behind.

> +	}
> +
> +	/* Set brightness */
> +	ktz8866_write(ktz, BL_BRT_LSB, brightness & 0x7);
> +	ktz8866_write(ktz, BL_BRT_MSB, (brightness >> 3) & 0xFF);
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops ktz8866_backlight_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = ktz8866_backlight_update_status,
> +};
> +
> +static void ktz8866_init(struct ktz8866 *ktz)
> +{
> +	unsigned int val;
> +
> +	if(of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val))

Here and in other places - not conforming to coding style. Missing space
before (.

Be sure you run checkpatch --strict and fix all relevant errors.

> +		ktz8866_write(ktz, BL_EN, BIT(val) - 1);
> +	else
> +		/* Enable all 6 current sinks if the number of current sinks isn't specifed. */
> +		ktz8866_write(ktz, BL_EN, BIT(6) - 1);
> +
> +	if(of_property_read_u32(ktz->client->dev.of_node, "current-ramping-time-ms", &val)) {
> +		if(val <= 128) {
> +			ktz8866_write(ktz, BL_CFG2, BIT(7) | (ilog2(val) << 3) | PWM_HYST);
> +		} else {
> +			ktz8866_write(ktz, BL_CFG2, BIT(7) | ((5 + val / 64) << 3) | PWM_HYST);
> +		}
> +	}
> +
> +	if(of_property_read_u32(ktz->client->dev.of_node, "led-ramping-time-ms", &val)) {
> +		if(val == 0) {
> +			ktz8866_write(ktz, BL_DIMMING, 0);
> +		} else {
> +			unsigned int ramp_off_time = ilog2(val) + 1;
> +			unsigned int ramp_on_time = ramp_off_time << 4;
> +			ktz8866_write(ktz, BL_DIMMING, ramp_on_time | ramp_off_time);
> +		}
> +	}
> +
> +	if(of_property_read_bool(ktz->client->dev.of_node, "enable-lcd-bias"))
> +		ktz8866_write(ktz, LCD_BIAS_CFG1, LCD_BIAS_EN);
> +}
> +
> +static int ktz8866_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	struct backlight_device *backlight_dev;
> +	struct backlight_properties props;
> +	struct ktz8866 *ktz;
> +
> +	ktz = devm_kzalloc(&client->dev, sizeof(*ktz), GFP_KERNEL);
> +	if (!ktz)
> +		return -ENOMEM;
> +
> +	ktz->client = client;
> +	ktz->regmap = devm_regmap_init_i2c(client, &ktz8866_regmap_config);
> +

Drop blank line

> +	if (IS_ERR(ktz->regmap)) {
> +		dev_err(&client->dev, "failed to init regmap\n");

dev_err_probe

> +		return PTR_ERR(ktz->regmap);
> +	}
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +	props.brightness = DEFAULT_BRIGHTNESS;
> +	props.scale = BACKLIGHT_SCALE_LINEAR;
> +
> +	backlight_dev = devm_backlight_device_register(
> +		&client->dev, "ktz8866-backlight", &client->dev, ktz,> +		&ktz8866_backlight_ops, &props);
> +

Drop blank line

> +	if (IS_ERR(backlight_dev)) {
> +		dev_err(&client->dev, "failed to register backlight device\n");

dev_err_probe

> +		return PTR_ERR(backlight_dev);
> +	}
> +
> +	ktz8866_init(ktz);
> +
> +	i2c_set_clientdata(client, backlight_dev);
> +	backlight_update_status(backlight_dev);
> +
> +	return 0;
> +}
> +
> +static void ktz8866_remove(struct i2c_client *client)
> +{
> +	struct backlight_device *backlight_dev = i2c_get_clientdata(client);
> +
> +	backlight_dev->props.brightness = 0;
> +	backlight_update_status(backlight_dev);
> +}
> +
> +static const struct i2c_device_id ktz8866_ids[] = {
> +	{ "ktz8866", 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, ktz8866_ids);
> +
> +static const struct of_device_id ktz8866_match_table[] = {
> +	{
> +		.compatible = "kinetic,ktz8866",
> +	},
> +	{},
> +};
> +
> +static struct i2c_driver ktz8866_driver = {
> +	.driver = {
> +		.name = "ktz8866",
> +		.of_match_table = ktz8866_match_table,
> +	},
> +	.probe = ktz8866_probe,
> +	.remove = ktz8866_remove,
> +	.id_table = ktz8866_ids,
> +};
> +
> +module_i2c_driver(ktz8866_driver);
> +
> +MODULE_DESCRIPTION("Kinetic KTZ8866 Backlight Driver");
> +MODULE_AUTHOR("Jianhua Lu <lujianhua000@gmail.com>");
> +MODULE_LICENSE("GPL");

Best regards,
Krzysztof

