Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BECB55A5E87
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91C610ED02;
	Tue, 30 Aug 2022 08:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD95210ED02
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:49:38 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AC6CB6601E8E;
 Tue, 30 Aug 2022 09:49:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661849377;
 bh=BzYQv5SyDeOC0RvJR6By0SIblbhuVKWfe2nPF1J9ai4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UaPgfY2Q5LVtRq/bWkihHN3QDTjrUU9ONZL2n8Ku/o1PLqo8dcAMQtU2hbdE5rzto
 JhjRoNubQWgwjmNvsBQ2otjcn0fs8kEM/FhYulYp1G5ZShBkMpYZqg4SdYP80JzMKE
 IM/b9K6pdhcBKb2Dkr78Q1LcBIiyshgCv8E3GI1oEXi4Xm2EugUd3rKEi8pkzvbphv
 w25eLqRt414RTHfnn6P4TU+N8OtZvTKRlBGUJSe1gaU2oux7EN78lfOKOgeAKCa06Q
 YGC26hIjewzQshS3U3traT1wUC4zs39GdZ2LsElL1HggR7pQ8ctFIeFhi4BFR/Xjec
 AG+L6SWZcMHIQ==
Message-ID: <d78a91f3-483d-75f2-f867-f1a4e4876743@collabora.com>
Date: Tue, 30 Aug 2022 10:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 09/10] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, jic23@kernel.org, lars@metafoo.de,
 deller@gmx.de, broonie@kernel.org, mazziesaccount@gmail.com,
 andriy.shevchenko@linux.intel.com
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-10-peterwu.pub@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220830034042.9354-10-peterwu.pub@gmail.com>
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 szunichen@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com,
 andy.shevchenko@gmail.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 30/08/22 05:40, ChiaEn Wu ha scritto:
> From: Alice Chen <alice_chen@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> Add support for the MT6370 Flash LED driver. Flash LED in MT6370
> has 2 channels and support torch/strobe mode.
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> v9
> - Revise the format of the comments.
> ---
>   drivers/leds/flash/Kconfig             |  14 +
>   drivers/leds/flash/Makefile            |   1 +
>   drivers/leds/flash/leds-mt6370-flash.c | 632 +++++++++++++++++++++++++++++++++
>   3 files changed, 647 insertions(+)
>   create mode 100644 drivers/leds/flash/leds-mt6370-flash.c
> 
> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
> index d3eb689..405bd16 100644
> --- a/drivers/leds/flash/Kconfig
> +++ b/drivers/leds/flash/Kconfig
> @@ -61,6 +61,20 @@ config LEDS_MT6360
>   	  Independent current sources supply for each flash LED support torch
>   	  and strobe mode.
>   
> +config LEDS_MT6370_FLASH
> +	tristate "Flash LED Support for MediaTek MT6370 PMIC"
> +	depends on LEDS_CLASS && OF
> +	depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6370
> +	help
> +	  Support 2 channels and torch/strobe mode.
> +	  Say Y here to enable support for
> +	  MT6370_FLASH_LED device.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called "leds-mt6370-flash".
> +
>   config LEDS_RT4505
>   	tristate "LED support for RT4505 flashlight controller"
>   	depends on I2C && OF
> diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
> index 0acbddc..0c1f3c5 100644
> --- a/drivers/leds/flash/Makefile
> +++ b/drivers/leds/flash/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
>   obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
>   obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
>   obj-$(CONFIG_LEDS_SGM3140)	+= leds-sgm3140.o
> +obj-$(CONFIG_LEDS_MT6370_FLASH)	+= leds-mt6370-flash.o
> diff --git a/drivers/leds/flash/leds-mt6370-flash.c b/drivers/leds/flash/leds-mt6370-flash.c
> new file mode 100644
> index 0000000..a8ec7e1
> --- /dev/null
> +++ b/drivers/leds/flash/leds-mt6370-flash.c
> @@ -0,0 +1,632 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 Richtek Technology Corp.
> + *
> + * Author: Alice Chen <alice_chen@richtek.com>
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
> +#define MT6370_REG_FLEDISTRB(_id)	(0x174 + 4 * (_id))
> +#define MT6370_REG_FLEDITOR(_id)	(0x175 + 4 * (_id))
> +#define MT6370_ITORCH_MASK		GENMASK(4, 0)
> +#define MT6370_ISTROBE_MASK		GENMASK(6, 0)
> +#define MT6370_STRBTO_MASK		GENMASK(6, 0)
> +#define MT6370_TORCHEN_MASK		BIT(3)
> +#define MT6370_STROBEN_MASK		BIT(2)
> +#define MT6370_FLCSEN_MASK(_id)		BIT(MT6370_LED_FLASH2 - (_id))
> +#define MT6370_FLCSEN_MASK_ALL		GENMASK(1, 0)
> +#define MT6370_FLEDCHGVINOVP_MASK	BIT(3)
> +#define MT6370_FLED1STRBTO_MASK		BIT(11)
> +#define MT6370_FLED2STRBTO_MASK		BIT(10)
> +#define MT6370_FLED1STRB_MASK		BIT(9)
> +#define MT6370_FLED2STRB_MASK		BIT(8)
> +#define MT6370_FLED1SHORT_MASK		BIT(7)
> +#define MT6370_FLED2SHORT_MASK		BIT(6)
> +#define MT6370_FLEDLVF_MASK		BIT(3)
> +
> +#define MT6370_LED_JOINT		2
> +#define MT6370_RANGE_FLED_REG		4
> +#define MT6370_ITORCH_MIN_uA		25000
> +#define MT6370_ITORCH_STEP_uA		12500
> +#define MT6370_ITORCH_MAX_uA		400000
> +#define MT6370_ITORCH_DOUBLE_MAX_uA	800000
> +#define MT6370_ISTRB_MIN_uA		50000
> +#define MT6370_ISTRB_STEP_uA		12500
> +#define MT6370_ISTRB_MAX_uA		1500000
> +#define MT6370_ISTRB_DOUBLE_MAX_uA	3000000
> +#define MT6370_STRBTO_MIN_US		64000
> +#define MT6370_STRBTO_STEP_US		32000
> +#define MT6370_STRBTO_MAX_US		2432000
> +
> +#define STATE_OFF			0
> +#define STATE_KEEP			1
> +#define STATE_ON			2
> +
> +#define to_mt6370_led(ptr, member) container_of(ptr, struct mt6370_led, member)
> +
> +struct mt6370_led {
> +	struct led_classdev_flash flash;
> +	struct v4l2_flash *v4l2_flash;
> +	struct mt6370_priv *priv;
> +	u32 led_no;

The maximum value that we will ever see for `led_no` is 2: this means
that we don't need 32 full bits here.

	u8 led_no;

> +	u32 default_state;

This should be...

	enum led_default_state default_state;

...but then, you're never using this variable as far as I can see, apart from
initializing it in mt6370_init_common_properties, for which, there's a comment
below.

In any case, please either fix the initialization and actually make use of
this variable, or remove it entirely.

> +};
> +
> +struct mt6370_priv {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct mutex lock;
> +	unsigned int fled_strobe_used;
> +	unsigned int fled_torch_used;
> +	unsigned int leds_active;
> +	unsigned int leds_count;
> +	struct mt6370_led leds[];
> +};
> +
> +static int mt6370_torch_brightness_set(struct led_classdev *lcdev,
> +				       enum led_brightness level)
> +{
> +	struct mt6370_led *led = to_mt6370_led(lcdev, flash.led_cdev);
> +	struct mt6370_priv *priv = led->priv;
> +	u32 led_enable_mask = (led->led_no == MT6370_LED_JOINT) ?
> +			      MT6370_FLCSEN_MASK_ALL :
> +			      MT6370_FLCSEN_MASK(led->led_no);
> +	u32 enable_mask = MT6370_TORCHEN_MASK | led_enable_mask;
> +	u32 val = level ? led_enable_mask : 0;
> +	u32 curr;
> +	int ret, i;
> +
> +	mutex_lock(&priv->lock);
> +
> +	/*
> +	 * There is only one set of flash control logic, and this
> +	 * flag is used to check if 'strobe' is currently being used.
> +	 */
> +	if (priv->fled_strobe_used) {
> +		dev_warn(lcdev->dev, "Please disable strobe first [%d]\n",
> +			 priv->fled_strobe_used);
> +		ret = -EBUSY;
> +		goto unlock;
> +	}
> +
> +	if (level)
> +		curr = priv->fled_torch_used | BIT(led->led_no);
> +	else
> +		curr = priv->fled_torch_used & ~BIT(led->led_no);
> +
> +	if (curr)
> +		val |= MT6370_TORCHEN_MASK;
> +
> +	if (level) {
> +		level -= 1;
> +		if (led->led_no == MT6370_LED_JOINT) {
> +			int flevel[MT6370_MAX_LEDS];
> +
> +			flevel[0] = level / 2;
> +			flevel[1] = level - flevel[0];
> +			for (i = 0; i < MT6370_MAX_LEDS; i++) {
> +				ret = regmap_update_bits(priv->regmap,
> +						MT6370_REG_FLEDITOR(i),
> +						MT6370_ITORCH_MASK, flevel[i]);
> +				if (ret)
> +					goto unlock;
> +			}
> +		} else {
> +			ret = regmap_update_bits(priv->regmap,
> +					MT6370_REG_FLEDITOR(led->led_no),
> +					MT6370_ITORCH_MASK, level);
> +			if (ret)
> +				goto unlock;
> +		}
> +	}
> +
> +	ret = regmap_update_bits(priv->regmap, MT6370_REG_FLEDEN,
> +				 enable_mask, val);
> +	if (ret)
> +		goto unlock;
> +
> +	priv->fled_torch_used = curr;
> +
> +unlock:
> +	mutex_unlock(&priv->lock);
> +	return ret;
> +}
> +
> +static int mt6370_flash_brightness_set(struct led_classdev_flash *fl_cdev,
> +				       u32 brightness)
> +{
> +	/*
> +	 * Because of the current spikes when turning on the flash,
> +	 * the brightness should be kept by the LED framework. This
> +	 * empty function is used to prevent checking failure when
> +	 * led_classdev_flash registers ops.
> +	 */
> +	return 0;
> +}
> +
> +static int _mt6370_flash_brightness_set(struct led_classdev_flash *fl_cdev,
> +					u32 brightness)
> +{
> +	struct mt6370_led *led = to_mt6370_led(fl_cdev, flash);
> +	struct mt6370_priv *priv = led->priv;
> +	struct led_flash_setting *s = &fl_cdev->brightness;
> +	u32 val = (brightness - s->min) / s->step;
> +	int ret, i;
> +
> +	if (led->led_no == MT6370_LED_JOINT) {
> +		int flevel[MT6370_MAX_LEDS];

Since you're writing this value to registers, please use fixed size variables.
If this is really supposed to be a signed value, it would be:

		s32 flevel[MT6370_MAX_LEDS];

> +
> +		flevel[0] = val / 2;
> +		flevel[1] = val - flevel[0];
> +		for (i = 0; i < MT6370_MAX_LEDS; i++) {
> +			ret = regmap_update_bits(priv->regmap,
> +						 MT6370_REG_FLEDISTRB(i),
> +						 MT6370_ISTROBE_MASK, flevel[i]);
> +			if (ret)
> +				return ret;
> +		}
> +	} else {
> +		return regmap_update_bits(priv->regmap,
> +					  MT6370_REG_FLEDISTRB(led->led_no),
> +					  MT6370_ISTROBE_MASK, val);
> +	}
> +
> +	return 0;

If we reach this point, this means that led_no is out of range (which is never
supposed to happen - I know).
Since that condition is something unexpected and unhandled, you should return
an error here.

> +}
> +
> +static int mt6370_strobe_set(struct led_classdev_flash *fl_cdev, bool state)
> +{
> +	struct mt6370_led *led = to_mt6370_led(fl_cdev, flash);
> +	struct mt6370_priv *priv = led->priv;
> +	struct led_classdev *lcdev = &fl_cdev->led_cdev;
> +	struct led_flash_setting *s = &fl_cdev->brightness;
> +	u32 led_enable_mask = (led->led_no == MT6370_LED_JOINT) ?
> +			      MT6370_FLCSEN_MASK_ALL :
> +			      MT6370_FLCSEN_MASK(led->led_no);
> +	u32 enable_mask = MT6370_STROBEN_MASK | led_enable_mask;
> +	u32 val = state ? led_enable_mask : 0;
> +	u32 curr;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	/*
> +	 * There is only one set of flash control logic, and this
> +	 * flag is used to check if 'torch' is currently being used.
> +	 */
> +	if (priv->fled_torch_used) {
> +		dev_warn(lcdev->dev, "Please disable torch first [0x%x]\n",
> +				      priv->fled_torch_used);
> +		ret = -EBUSY;
> +		goto unlock;
> +	}
> +
> +	if (state)
> +		curr = priv->fled_strobe_used | BIT(led->led_no);
> +	else
> +		curr = priv->fled_strobe_used & ~BIT(led->led_no);
> +
> +	if (curr)
> +		val |= MT6370_STROBEN_MASK;
> +
> +	ret = regmap_update_bits(priv->regmap, MT6370_REG_FLEDEN, enable_mask,
> +				 val);
> +	if (ret) {
> +		dev_err(lcdev->dev, "[%d] control current source %d fail\n",
> +				     led->led_no, state);
> +		goto unlock;
> +	}
> +
> +	/*
> +	 * If the flash needs to turn on, configure the flash current to
> +	 * ramp up to the setting value. Otherwise, always revert to the
> +	 * minimum one.
> +	 */
> +	ret = _mt6370_flash_brightness_set(fl_cdev, state ? s->val : s->min);
> +	if (ret)
> +		goto unlock;

If this fails, I think that we should revert the previous changes to FLEDEN
before returning.

> +
> +	/*
> +	 * For the flash to turn on/off, we must wait for HW ramping
> +	 * up/down time 5ms/500us to prevent the unexpected problem.
> +	 */
> +	if (!priv->fled_strobe_used && curr)
> +		usleep_range(5000, 6000);
> +	else if (priv->fled_strobe_used && !curr)
> +		usleep_range(500, 600);
> +
> +	priv->fled_strobe_used = curr;
> +
> +unlock:
> +	mutex_unlock(&priv->lock);
> +	return ret;
> +}
> +

..snip..

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

This is only initializing the default state, for which you do have a helper.

Please use led_init_default_state_get(fwnode).

> +		if (ret)
> +			return ret;
> +
> +		ret = mt6370_init_flash_properties(led, &init_data);
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

Regards,
Angelo

