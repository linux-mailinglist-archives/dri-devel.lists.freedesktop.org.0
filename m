Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EBC9E985B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 15:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E8B10E49F;
	Mon,  9 Dec 2024 14:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="s3oX8rPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF4B10E49F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 14:07:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9E7UMo2316902
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 9 Dec 2024 08:07:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1733753250;
 bh=6TJcHZFUyZ3J1O7CR6yBj510HU9Y0J2P4nljoBnaJM8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=s3oX8rPeu4Wnm2lRCGZY+fVWxFc3H8/thmQtpf1OOBJtnAAsLT9nNB7fX8PVKJhsF
 DvBmZ6K+N36542+nupCJAzEZffjqTbCIUP9clCYrwiNL8x8VLJ40VHge2FyP5R0Tas
 pNdqUvS/+INzL3cdaWVD93A1dR/ds9n+uV1RK3lc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9E7UVs116651;
 Mon, 9 Dec 2024 08:07:30 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 08:07:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 08:07:30 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9E7UOp089197;
 Mon, 9 Dec 2024 08:07:30 -0600
Message-ID: <65b88065-7cac-4185-b50f-f9fcb9cb164c@ti.com>
Date: Mon, 9 Dec 2024 08:07:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] leds: lp8864: New driver
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Lee Jones <lee@kernel.org>, Daniel
 Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Pavel
 Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20241209084602.1199936-1-alexander.sverdlin@siemens.com>
 <20241209084602.1199936-3-alexander.sverdlin@siemens.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241209084602.1199936-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/9/24 2:45 AM, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Add driver for TI LP8864, LP8864S, LP8866 4/6 channel LED-backlight drivers
> with I2C interface.
> 
> Link: https://www.ti.com/lit/gpn/lp8864-q1
> Link: https://www.ti.com/lit/gpn/lp8864s-q1
> Link: https://www.ti.com/lit/gpn/lp8866-q1
> Link: https://www.ti.com/lit/gpn/lp8866s-q1
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changelog:
> v3:
> - dropped lp8864_init(), REGCACHE_NONE, %pe in dev_err_probe(),
>    i2c_set_clientdata()
> - added devm_add_action_or_reset() return value check, dev_err_probe() after
>    devm_regmap_init_i2c()

LGTM,

Reviewed-by: Andrew Davis <afd@ti.com>

> v2: no changes
> 
>   MAINTAINERS                |   7 +
>   drivers/leds/Kconfig       |  12 ++
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-lp8864.c | 308 +++++++++++++++++++++++++++++++++++++
>   4 files changed, 328 insertions(+)
>   create mode 100644 drivers/leds/leds-lp8864.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 21f855fe468bc..a89f0b9d991fb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23262,6 +23262,13 @@ S:	Supported
>   F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
>   F:	drivers/iio/dac/ti-dac7612.c
>   
> +TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
> +M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
> +L:	linux-leds@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
> +F:	drivers/leds/leds-lp8864.c
> +
>   TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
>   M:	Nishanth Menon <nm@ti.com>
>   M:	Tero Kristo <kristo@kernel.org>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index b784bb74a8378..6d0e88e501614 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -511,6 +511,18 @@ config LEDS_LP8860
>   	  on the LP8860 4 channel LED driver using the I2C communication
>   	  bus.
>   
> +config LEDS_LP8864
> +	tristate "LED support for the TI LP8864/LP8866 4/6 channel LED drivers"
> +	depends on LEDS_CLASS && I2C && OF
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for the TI LP8864-Q1,
> +	  LP8864S-Q1, LP8866-Q1, LP8866S-Q1 4/6 channel LED backlight
> +	  drivers with I2C interface.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called leds-lp8864.
> +
>   config LEDS_CLEVO_MAIL
>   	tristate "Mail LED on Clevo notebook"
>   	depends on LEDS_CLASS && BROKEN
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 18afbb5a23ee5..f66bf2e13665f 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -57,6 +57,7 @@ obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
>   obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
>   obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
>   obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
> +obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
>   obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
>   obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
>   obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
> diff --git a/drivers/leds/leds-lp8864.c b/drivers/leds/leds-lp8864.c
> new file mode 100644
> index 0000000000000..1617aa0422d33
> --- /dev/null
> +++ b/drivers/leds/leds-lp8864.c
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * TI LP8864/LP8866 4/6 Channel LED Driver
> + *
> + * Copyright (C) 2024 Siemens AG
> + *
> + * Based on LP8860 driver by Dan Murphy <dmurphy@ti.com>
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +
> +#define LP8864_BRT_CONTROL		0x00
> +#define LP8864_USER_CONFIG1		0x04
> +#define   LP8864_BRT_MODE_MASK		GENMASK(9, 8)
> +/* Brightness controlled by DISPLAY_BRT register */
> +#define   LP8864_BRT_MODE_REG		BIT(9)
> +#define LP8864_SUPPLY_STATUS		0x0e
> +#define LP8864_BOOST_STATUS		0x10
> +#define LP8864_LED_STATUS		0x12
> +/* Writeable bits in the LED_STATUS register */
> +#define   LP8864_LED_STATUS_WR_MASK	GENMASK(14, 9)
> +
> +/* Textual meaning for every register bit */
> +static const char *const lp8864_supply_status_msg[] = {
> +	NULL, "Vin under-voltage fault",
> +	NULL, "Vin over-voltage fault",
> +	NULL, "Vdd under-voltage fault",
> +	NULL, "Vin over-current fault",
> +	NULL, "Missing charge pump fault",
> +	NULL, "Charge pump fault",
> +	NULL, "Missing boost sync fault",
> +	NULL, "CRC error fault ",
> +};
> +
> +/* Textual meaning for every register bit */
> +static const char *const lp8864_boost_status_msg[] = {
> +	NULL, "Boost OVP low fault",
> +	NULL, "Boost OVP high fault",
> +	NULL, "Boost over-current fault",
> +	NULL, "Missing boost FSET resistor fault",
> +	NULL, "Missing MODE SEL resistor fault",
> +	NULL, "Missing LED resistor fault",
> +	NULL, "ISET resistor short to ground fault",
> +	NULL, "Thermal shutdown fault",
> +};
> +
> +/* Textual meaning for every register bit */
> +static const char *const lp8864_led_status_msg[] = {
> +	"LED 1 fault",
> +	"LED 2 fault",
> +	"LED 3 fault",
> +	"LED 4 fault",
> +	"LED 5 fault",
> +	"LED 6 fault",
> +	"LED open fault",
> +	"LED internal short fault",
> +	"LED short to GND fault",
> +	NULL, NULL, NULL,
> +	"Invalid string configuration fault",
> +	NULL,
> +	"I2C time out fault",
> +};
> +
> +/**
> + * struct lp8864_led
> + * @client: Pointer to the I2C client
> + * @led_dev: led class device pointer
> + * @regmap: Devices register map
> + * @led_status_mask: Helps to report LED fault only once
> + */
> +struct lp8864_led {
> +	struct i2c_client *client;
> +	struct led_classdev led_dev;
> +	struct regmap *regmap;
> +	u16 led_status_mask;
> +};
> +
> +static int lp8864_fault_check(struct lp8864_led *led)
> +{
> +	int ret, i;
> +	unsigned int buf;
> +
> +	ret = regmap_read(led->regmap, LP8864_SUPPLY_STATUS, &buf);
> +	if (ret)
> +		goto err;
> +
> +	for (i = 0; i < ARRAY_SIZE(lp8864_supply_status_msg); i++)
> +		if (lp8864_supply_status_msg[i] && buf & BIT(i))
> +			dev_err(&led->client->dev, "%s\n",
> +				lp8864_supply_status_msg[i]);
> +
> +	/*
> +	 * Clear bits have an index preceding the corresponding Status bits;
> +	 * both have to be written "1" simultaneously to clear the corresponding
> +	 * Status bit.
> +	 */
> +	if (buf)
> +		ret = regmap_write(led->regmap, LP8864_SUPPLY_STATUS,
> +				   buf >> 1 | buf);
> +	if (ret)
> +		goto err;
> +
> +	ret = regmap_read(led->regmap, LP8864_BOOST_STATUS, &buf);
> +	if (ret)
> +		goto err;
> +
> +	for (i = 0; i < ARRAY_SIZE(lp8864_boost_status_msg); i++)
> +		if (lp8864_boost_status_msg[i] && buf & BIT(i))
> +			dev_err(&led->client->dev, "%s\n",
> +				lp8864_boost_status_msg[i]);
> +
> +	if (buf)
> +		ret = regmap_write(led->regmap, LP8864_BOOST_STATUS,
> +				   buf >> 1 | buf);
> +	if (ret)
> +		goto err;
> +
> +	ret = regmap_read(led->regmap, LP8864_LED_STATUS, &buf);
> +	if (ret)
> +		goto err;
> +
> +	/*
> +	 * Clear already reported faults that maintain their value until device
> +	 * power-down
> +	 */
> +	buf &= ~led->led_status_mask;
> +
> +	for (i = 0; i < ARRAY_SIZE(lp8864_led_status_msg); i++)
> +		if (lp8864_led_status_msg[i] && buf & BIT(i))
> +			dev_err(&led->client->dev, "%s\n",
> +				lp8864_led_status_msg[i]);
> +
> +	/*
> +	 * Mark those which maintain their value until device power-down as
> +	 * "already reported"
> +	 */
> +	led->led_status_mask |= buf & ~LP8864_LED_STATUS_WR_MASK;
> +
> +	/*
> +	 * Only bits 14, 12, 10 have to be cleared here, but others are RO,
> +	 * we don't care what we write to them.
> +	 */
> +	if (buf & LP8864_LED_STATUS_WR_MASK)
> +		ret = regmap_write(led->regmap, LP8864_LED_STATUS,
> +				   buf >> 1 | buf);
> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +
> +err:
> +	dev_err(&led->client->dev, "Cannot read/clear faults (%pe)\n",
> +		ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +static int lp8864_brightness_set(struct led_classdev *led_cdev,
> +				 enum led_brightness brt_val)
> +{
> +	struct lp8864_led *led = container_of(led_cdev, struct lp8864_led,
> +					      led_dev);
> +	unsigned int val = brt_val * 0xffff / LED_FULL;
> +	int ret;
> +
> +	ret = lp8864_fault_check(led);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(led->regmap, LP8864_BRT_CONTROL, val);
> +	if (ret)
> +		dev_err(&led->client->dev, "Cannot write BRT_CONTROL\n");
> +
> +	return ret;
> +}
> +
> +static enum led_brightness lp8864_brightness_get(struct led_classdev *led_cdev)
> +{
> +	struct lp8864_led *led = container_of(led_cdev, struct lp8864_led,
> +					      led_dev);
> +	unsigned int buf;
> +	int ret;
> +
> +	ret = regmap_read(led->regmap, LP8864_BRT_CONTROL, &buf);
> +	if (ret) {
> +		dev_err(&led->client->dev, "Cannot read BRT_CONTROL\n");
> +		return ret;
> +	}
> +
> +	return buf * LED_FULL / 0xffff;
> +}
> +
> +static const struct regmap_config lp8864_regmap_config = {
> +	.reg_bits		= 8,
> +	.val_bits		= 16,
> +	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
> +};
> +
> +static void lp8864_disable_gpio(void *data)
> +{
> +	struct gpio_desc *gpio = data;
> +
> +	gpiod_set_value(gpio, 0);
> +}
> +
> +static int lp8864_probe(struct i2c_client *client)
> +{
> +	int ret;
> +	struct lp8864_led *led;
> +	struct device_node *np = dev_of_node(&client->dev);
> +	struct device_node *child_node;
> +	struct led_init_data init_data = {};
> +	struct gpio_desc *enable_gpio;
> +
> +	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	child_node = of_get_next_available_child(np, NULL);
> +	if (!child_node) {
> +		dev_err(&client->dev, "No LED function defined\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = devm_regulator_get_enable_optional(&client->dev, "vled");
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to enable vled regulator\n");
> +
> +	enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
> +					      GPIOD_OUT_HIGH);
> +	if (IS_ERR(enable_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(enable_gpio),
> +				     "Failed to get enable GPIO\n");
> +
> +	ret = devm_add_action_or_reset(&client->dev, lp8864_disable_gpio,
> +				       enable_gpio);
> +	if (ret)
> +		return ret;
> +
> +	led->client = client;
> +	led->led_dev.brightness_set_blocking = lp8864_brightness_set;
> +	led->led_dev.brightness_get = lp8864_brightness_get;
> +
> +	led->regmap = devm_regmap_init_i2c(client, &lp8864_regmap_config);
> +	if (IS_ERR(led->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(led->regmap),
> +				     "Failed to allocate register map\n");
> +
> +	/* Control brightness by DISPLAY_BRT register */
> +	ret = regmap_update_bits(led->regmap, LP8864_USER_CONFIG1,
> +				 LP8864_BRT_MODE_MASK, LP8864_BRT_MODE_REG);
> +	if (ret) {
> +		dev_err(&led->client->dev, "Cannot write USER_CONFIG1\n");
> +		return ret;
> +	}
> +
> +	ret = lp8864_fault_check(led);
> +	if (ret)
> +		return ret;
> +
> +	init_data.fwnode = of_fwnode_handle(child_node);
> +	init_data.devicename = "lp8864";
> +	init_data.default_label = ":display_cluster";
> +
> +	ret = devm_led_classdev_register_ext(&client->dev, &led->led_dev,
> +					     &init_data);
> +	if (ret)
> +		dev_err(&client->dev, "Failed to register LED device (%pe)\n",
> +			ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +static const struct i2c_device_id lp8864_id[] = {
> +	{ "lp8864" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, lp8864_id);
> +
> +static const struct of_device_id of_lp8864_leds_match[] = {
> +	{ .compatible = "ti,lp8864" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, of_lp8864_leds_match);
> +
> +static struct i2c_driver lp8864_driver = {
> +	.driver = {
> +		.name	= "lp8864",
> +		.of_match_table = of_lp8864_leds_match,
> +	},
> +	.probe		= lp8864_probe,
> +	.id_table	= lp8864_id,
> +};
> +module_i2c_driver(lp8864_driver);
> +
> +MODULE_DESCRIPTION("Texas Instruments LP8864/LP8866 LED driver");
> +MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@siemens.com>");
> +MODULE_LICENSE("GPL");
