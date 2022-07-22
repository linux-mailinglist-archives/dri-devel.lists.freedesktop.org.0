Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C9257E035
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 12:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B6C93CD7;
	Fri, 22 Jul 2022 10:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AE493CD7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 10:48:50 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6C2C666019A3;
 Fri, 22 Jul 2022 11:48:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658486928;
 bh=SvP6s/+17kIWapX0baXIPtUEVbiiuXx4uopQWvyJ93k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Lw/DMloRHY3kffQaCXzfXzNqNDLfJwycJK/La8zMlpf5E+hiYk/UYiqJT424m4sLs
 hNuDO6RNz5WD1LFPJNdyhl4xIlhUbRVtRmGF3/nudG5+spGHFB8yyytpu4JyT85sLE
 CghThTlR41yxvvUNfpWNFBbPSXoXAVEY1BopUvy9Uq8QLz3FJg/cNk3k6QzyHt7ddy
 h2Cn2rf9Lyxwn914KrQ0x8551+wMyqNlDYNuhbETrnUiu8qzJcp3RBSlpL5Xhd3T62
 mzRNfZzdkUCEuGZb9Lh7U+G2kU9+TCIegtsQapFRYBb5r8ojAmUbJ0XV5FjzyOMlUR
 mxtrtwJbWXxGw==
Message-ID: <dfa5ff36-5734-4bd9-0e54-6a6baaec55aa@collabora.com>
Date: Fri, 22 Jul 2022 12:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-13-peterwu.pub@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220722102407.2205-13-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 22/07/22 12:24, ChiaEn Wu ha scritto:
> From: Alice Chen <alice_chen@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> The Flash LED in MT6370 has 2 channels and support torch/strobe mode.
> Add the support of MT6370 FLASH LED.
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> ---
> 
> v6
> - Use 'GENMASK' instead of 'BIT'.
> - Use dev_err_probe to decrease LOC.
> - Use 'dev' variable to make probe function more clean.
> - Refine the return of _mt6370_flash_brightness_set function.
> - Refine the descriptions.
> - Use mt6370_clamp() instead of clamp_align().
> - Use device resource managed API for v4l2 flash_release.
> ---
>   drivers/leds/flash/Kconfig             |  12 +
>   drivers/leds/flash/Makefile            |   1 +
>   drivers/leds/flash/leds-mt6370-flash.c | 633 +++++++++++++++++++++++++++++++++
>   3 files changed, 646 insertions(+)
>   create mode 100644 drivers/leds/flash/leds-mt6370-flash.c
> 
> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
> index d3eb689..d5761ed 100644
> --- a/drivers/leds/flash/Kconfig
> +++ b/drivers/leds/flash/Kconfig
> @@ -90,4 +90,16 @@ config LEDS_SGM3140
>   	  This option enables support for the SGM3140 500mA Buck/Boost Charge
>   	  Pump LED Driver.
>   
> +config LEDS_MT6370_FLASHLIGHT
> +	tristate "Flash LED Support for MediaTek MT6370 PMIC"
> +	depends on LEDS_CLASS
> +	depends on MFD_MT6370
> +	help
> +	  Support 2 channels and torch/strobe mode.
> +	  Say Y here to enable support for
> +	  MT6370_FLASH_LED device.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called "leds-mt6370-flash".
> +
>   endif # LEDS_CLASS_FLASH
> diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
> index 0acbddc..4c4c171 100644
> --- a/drivers/leds/flash/Makefile
> +++ b/drivers/leds/flash/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
>   obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
>   obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
>   obj-$(CONFIG_LEDS_SGM3140)	+= leds-sgm3140.o
> +obj-$(CONFIG_LEDS_MT6370_FLASHLIGHT)	+= leds-mt6370-flash.o
> diff --git a/drivers/leds/flash/leds-mt6370-flash.c b/drivers/leds/flash/leds-mt6370-flash.c
> new file mode 100644
> index 0000000..fe439ee
> --- /dev/null
> +++ b/drivers/leds/flash/leds-mt6370-flash.c
> @@ -0,0 +1,633 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 Richtek Technology Corp.
> + *
> + * Author: Alice Chen <alice_chen@richtek.com
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/led-class-flash.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#include <media/v4l2-flash-led-class.h>
> +
> +enum {
> +	MT6370_LED_FLASH1,
> +	MT6370_LED_FLASH2,
> +	MT6370_MAX_LEDS
> +};
> +
> +/* Virtual definition for multicolor */
> +
> +#define MT6370_REG_FLEDEN		0x17E
> +#define MT6370_REG_STRBTO		0x173
> +#define MT6370_REG_CHGSTAT2		0x1D1
> +#define MT6370_REG_FLEDSTAT1		0x1D9
> +#define	MT6370_REG_FLEDISTRB(_id)	(0x174 + 4 * _id)

Please fix the indentation.

> +#define MT6370_REG_FLEDITOR(_id)	(0x175 + 4 * _id)
> +#define MT6370_ITORCH_MASK		GENMASK(4, 0)
> +#define MT6370_ISTROBE_MASK		GENMASK(6, 0)
> +#define MT6370_STRBTO_MASK		GENMASK(6, 0)
> +#define MT6370_TORCHEN_MASK		BIT(3)

..snip..

> +
> +static int mt6370_init_flash_properties(struct mt6370_led *led,
> +					struct led_init_data *init_data)
> +{
> +	struct led_classdev_flash *flash = &led->flash;
> +	struct led_classdev *lcdev = &flash->led_cdev;
> +	struct mt6370_priv *priv = led->priv;
> +	struct led_flash_setting *s;
> +	u32 sources[MT6370_MAX_LEDS];
> +	u32 max_uA, val;
> +	int i, ret, num;
> +
> +	num = fwnode_property_count_u32(init_data->fwnode, "led-sources");
> +	if (num < 1 || num > MT6370_MAX_LEDS)
> +		return dev_err_probe(priv->dev, -EINVAL,
> +				     "Not specified or wrong number of led-sources\n");
> +
> +	ret = fwnode_property_read_u32_array(init_data->fwnode, "led-sources", sources, num);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < num; i++) {
> +		if (sources[i] >= MT6370_MAX_LEDS)
> +			return -EINVAL;
> +		if (priv->leds_active & BIT(sources[i]))
> +			return -EINVAL;
> +		priv->leds_active |= BIT(sources[i]);
> +
> +	}
> +	led->led_no = (num == MT6370_MAX_LEDS) ? MT6370_LED_JOINT :
> +		       sources[0];
> +
> +	max_uA = (num == 2) ? MT6370_ITORCH_DOUBLE_MAX_UA : MT6370_ITORCH_MAX_UA;
> +	ret = fwnode_property_read_u32(init_data->fwnode, "led-max-microamp", &val);
> +	if (ret) {
> +		dev_warn(priv->dev,
> +			 "Not specified led-max-microamp, config to the minimum\n");

This should be a dev_info() instead.

> +		val = MT6370_ITORCH_MIN_UA;
> +	} else {
> +		val = mt6370_clamp(val, MT6370_ITORCH_MIN_UA, max_uA,
> +				  MT6370_ITORCH_STEP_UA);
> +	}
> +
> +	lcdev->max_brightness = (val - MT6370_ITORCH_MIN_UA) /
> +				MT6370_ITORCH_STEP_UA + 1;
> +	lcdev->brightness_set_blocking = mt6370_torch_brightness_set;
> +	lcdev->flags |= LED_DEV_CAP_FLASH;
> +
> +	max_uA = (num == 2) ? MT6370_ISTRB_DOUBLE_MAX_UA : MT6370_ISTRB_MAX_UA;
> +	ret = fwnode_property_read_u32(init_data->fwnode, "flash-max-microamp", &val);
> +	if (ret) {
> +		dev_warn(priv->dev,
> +		   "Not specified flash-max-microamp, config to the minimum\n");

same here

> +		val = MT6370_ISTRB_MIN_UA;
> +	} else {
> +		val = mt6370_clamp(val, MT6370_ISTRB_MIN_UA, max_uA,
> +				  MT6370_ISTRB_STEP_UA);
> +	}
> +
> +	s = &flash->brightness;
> +	s->min = MT6370_ISTRB_MIN_UA;
> +	s->step = MT6370_ISTRB_STEP_UA;
> +	s->val = s->max = val;
> +
> +	/*
> +	 * Always configure as min level when off to
> +	 * prevent flash current spike
> +	 */
> +	ret = _mt6370_flash_brightness_set(flash, s->min);
> +	if (ret)
> +		return ret;
> +
> +	ret = fwnode_property_read_u32(init_data->fwnode,
> +				       "flash-max-timeout-us", &val);
> +	if (ret) {
> +		dev_warn(priv->dev,
> +			 "Not specified flash-max-timeout-us, config to the minimum\n");

and same here

> +		val = MT6370_STRBTO_MIN_US;
> +	} else {
> +		val = mt6370_clamp(val, MT6370_STRBTO_MIN_US,
> +				   MT6370_STRBTO_MAX_US, MT6370_STRBTO_STEP_US);
> +	}
> +
> +	s = &flash->timeout;
> +	s->min = MT6370_STRBTO_MIN_US;
> +	s->step = MT6370_STRBTO_STEP_US;
> +	s->val = s->max = val;
> +
> +	flash->ops = &mt6370_flash_ops;
> +
> +	return 0;
> +}
> +
> +static int mt6370_init_common_properties(struct mt6370_led *led,
> +					 struct led_init_data *init_data)
> +{
> +	const char * const states[] = { "off", "keep", "on" };
> +	const char *str = states[STATE_OFF];
> +	int ret;
> +
> +	fwnode_property_read_string(init_data->fwnode, "default-state", &str);
> +	ret = match_string(states, ARRAY_SIZE(states), str);
> +	if (ret >= 0)
> +		led->default_state = ret;
> +
> +	return 0;
> +}
> +
> +static int mt6370_led_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mt6370_priv *priv;
> +	struct fwnode_handle *child;
> +	size_t count;
> +	int i = 0, ret;
> +
> +	count = device_get_child_node_count(dev);
> +	if (!count || count > MT6370_MAX_LEDS)
> +		return dev_err_probe(dev, -EINVAL,
> +		       "No child node or node count over max led number %zu\n", count);
> +
> +	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->leds_count = count;
> +	priv->dev = dev;
> +	mutex_init(&priv->lock);
> +
> +	priv->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!priv->regmap)
> +		return dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
> +
> +	device_for_each_child_node(dev, child) {
> +		struct mt6370_led *led = priv->leds + i;
> +		struct led_init_data init_data = { .fwnode = child, };
> +
> +		led->priv = priv;
> +		ret = mt6370_init_common_properties(led, &init_data);
> +		if (ret)
> +			return ret;
> +
> +		ret = mt6370_init_flash_properties(led, &init_data);
> +

Unnecessary blank line here.

> +		if (ret)
> +			return ret;
> +
> +		ret = mt6370_led_register(dev, led, &init_data);
> +		if (ret)
> +			return ret;
> +
> +		i++;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mt6370_led_of_id[] = {
> +	{ .compatible = "mediatek,mt6370-flashlight" },

As common practice, write that the last element is a sentinel.

	{ /* sentinel */ },


Everything else looks good.

Regards,
Angelo

