Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC929112DC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 22:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6183410E171;
	Thu, 20 Jun 2024 20:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K3Q5hlmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829C810E171
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 20:15:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0A5CACE28D2;
 Thu, 20 Jun 2024 20:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3088C2BD10;
 Thu, 20 Jun 2024 20:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718914513;
 bh=dx88qbfA3v0QDgtBAfkX2p+KZ894xqWOi1spAiEK79Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K3Q5hlmFTV2StGeAqV1ad3ALvO+at6HlmCfy/QXw80XBHI+CtCSJkAB6T0ljm1Cla
 h1FXTkMlJVy3YH8tdyanjrUGrMb+VoRevwm6fnqvKUM57OyG/H15yfbdSIVTdZCLh3
 37/vSJq/jpQHMF3G47KlhSq+OSUt8sc0+DmRekUGL9Bje93H8KLMY/PBtbK1Sh5Uks
 mrnDLEAMdFXzxRAKsxZtF13sVSaXwSWqY3ZjjuVcQ0QzyFwy2lQCNQLs4U6Y5wLWZ6
 YcyobmsG93CE3GImMYQqPd3ezOFin5JLavDjJQF6mCPAWzDHNK11PoA1fh2iITVrMb
 s0XuW0DNn177w==
Message-ID: <dafab4dc-34ef-4abd-9f3f-1dee675a1a56@kernel.org>
Date: Thu, 20 Jun 2024 22:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/23] leds: max77705: Add LEDs support
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-16-e3f6662017ac@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-16-e3f6662017ac@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/06/2024 15:59, Dzmitry Sankouski wrote:
> This adds basic support for LEDs for the max77705 PMIC.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/leds/Kconfig         |   6 ++
>  drivers/leds/Makefile        |   1 +
>  drivers/leds/leds-max77705.c | 166 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 174 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f66f08825db9..f3c245d432d9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13691,6 +13691,7 @@ F:	drivers/*/max14577*.c
>  F:	drivers/*/max77686*.c
>  F:	drivers/*/max77693*.c
>  F:	drivers/*/max77705*.c
> +F:	drivers/leds/leds-max77705.c
>  F:	drivers/clk/clk-max77686.c
>  F:	drivers/extcon/extcon-max14577.c
>  F:	drivers/extcon/extcon-max77693.c
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 05e6af88b88c..14d483011308 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -728,6 +728,12 @@ config LEDS_MAX77650
>  	help
>  	  LEDs driver for MAX77650 family of PMICs from Maxim Integrated.
>  
> +config LEDS_MAX77705
> +	tristate "LED support for Maxim MAX77705 RGB"
> +	depends on MFD_MAX77705 && LEDS_CLASS && I2C
> +	help
> +	  LED driver for MAX77705 MFD chip from Maxim Integrated.
> +
>  config LEDS_MAX8997
>  	tristate "LED support for MAX8997 PMIC"
>  	depends on LEDS_CLASS && MFD_MAX8997
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index effdfc6f1e95..be064e3d678e 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
>  obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
>  obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
>  obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
> +obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
>  obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
>  obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
>  obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
> diff --git a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c
> new file mode 100644
> index 000000000000..f91c0e41056c
> --- /dev/null
> +++ b/drivers/leds/leds-max77705.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Based on leds-max77650 driver:
> + *		Copyright (C) 2018 BayLibre SAS
> + *		Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> + *
> + * LED driver for MAXIM 77705 MFD.
> + * Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.org>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/mfd/max77705.h>
> +#include <linux/mfd/max77705-private.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define MAX77705_LED_NUM_LEDS		4
> +#define MAX77705_LED_EN_MASK		GENMASK(1, 0)
> +#define MAX77705_LED_MAX_BRIGHTNESS	0xff
> +
> +#define LEDBLNK_ON(time)	((time < 100) ? 0 :			\
> +				(time < 500) ? time/100-1 :		\
> +				(time < 3250) ? (time-500)/250+4 : 15)
> +
> +#define LEDBLNK_OFF(time)	((time < 1) ? 0x00 :			\
> +				(time < 500) ? 0x01 :			\
> +				(time < 5000) ? time/500 :		\
> +				(time < 8000) ? (time-5000)/1000+10 :	 \
> +				(time < 12000) ? (time-8000)/2000+13 : 15)

Make both static functions, if really needed, but these appear only in
one place, so maybe just code it directly.


> +
> +struct max77705_led {
> +	struct led_classdev cdev;
> +	struct regmap *regmap;
> +	unsigned int en_shift;
> +	unsigned int reg_brightness;
> +	unsigned int regB;

noCamelCase.

> +};
> +
> +static struct max77705_led *max77705_to_led(struct led_classdev *cdev)
> +{
> +	return container_of(cdev, struct max77705_led, cdev);
> +}
> +


> +		led = &leds[reg];
> +		led->regmap = map;
> +		led->reg_brightness = MAX77705_RGBLED_REG_LED0BRT + reg;
> +		led->en_shift = 2 * reg;
> +		led->cdev.brightness_set_blocking = max77705_led_brightness_set;
> +		led->cdev.blink_set = max77705_rgb_blink;
> +		led->cdev.max_brightness = MAX77705_LED_MAX_BRIGHTNESS;
> +
> +		init_data.fwnode = child;
> +		init_data.devicename = "max77705";
> +		/* for backwards compatibility if `label` is not present */
> +		init_data.default_label = ":";

There is no backwards compatibility - it's fresh driver.

> +
> +		rv = devm_led_classdev_register_ext(dev, &led->cdev,
> +							&init_data);
> +		if (rv)
> +			goto err_node_put;
> +
> +		rv = max77705_led_brightness_set(&led->cdev, LED_OFF);
> +		if (rv)
> +			goto err_node_put;
> +	}
> +
> +	return 0;
> +err_node_put:
> +	fwnode_handle_put(child);
> +	return rv;
> +}
> +
> +static const struct of_device_id max77705_led_of_match[] = {
> +	{ .compatible = "maxim,max77705-led" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max77705_led_of_match);
> +
> +static struct platform_driver max77705_led_driver = {
> +	.driver = {
> +		.name = "max77705-led",
> +		.of_match_table = max77705_led_of_match,
> +	},
> +	.probe = max77705_led_probe,
> +};
> +module_platform_driver(max77705_led_driver);
> +
> +MODULE_DESCRIPTION("MAXIM 77705 LED driver");
> +MODULE_AUTHOR("Bartosz Golaszewski <bgolaszewski@baylibre.com>");
> +MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:max77705-led");

You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.


Best regards,
Krzysztof

