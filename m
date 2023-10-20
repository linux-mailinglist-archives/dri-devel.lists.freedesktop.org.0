Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEED7D134B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 17:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386F510E5D2;
	Fri, 20 Oct 2023 15:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EA510E5D2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:57:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1FA88CE39C0;
 Fri, 20 Oct 2023 15:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B768C433C7;
 Fri, 20 Oct 2023 15:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697817416;
 bh=LU2hL9b4hnNU6+vwyFlzvgIPIfjJD0MUr6xwE2SP37c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=txNDTxdsuaxOiI4TmtJlD1Rv8IGfQh0CTl1lGG6V26CzORmoQ/4aOzXcuIR9G+wfc
 Xd4Fxqck7eXy2zT59a59RAi+v29y0RxIRqHLtr14G+BCBeNIH/KSZCRr+W67Em7Ehw
 f6BKBJdf+w/4HAKXNi57XfJOGt007FTLbJ4nY/f2piZVaKYx6Lc+WOz8RYx36QYwfg
 M4gQMT19wC4uvuaE4MauiGYDS4vBevSDW3YBrw2zsLucSs8bT0GsVzkA46ZX5J/FAF
 +tiDR3/6rJDidPR9lrdkOeLakv6pZbndmkSBsKnQgmdp8kuWgdzKYPa4mqz/ItfJQA
 kujjg7ujeWdJg==
Date: Fri, 20 Oct 2023 16:56:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v5] backlight: mp3309c: Add support for MPS MP3309C
Message-ID: <20231020-esquire-rug-24a27fb72314@spud>
References: <20231020135434.2598578-1-f.suligoi@asem.it>
 <20231020135434.2598578-3-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fmrSnAj5eGo+Mp1q"
Content-Disposition: inline
In-Reply-To: <20231020135434.2598578-3-f.suligoi@asem.it>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fmrSnAj5eGo+Mp1q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 03:54:34PM +0200, Flavio Suligoi wrote:
> The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring=
 a
> programmable switching frequency to optimize efficiency.
> The brightness can be controlled either by I2C commands (called "analog"
> mode) or by a PWM input signal (PWM mode).
> This driver supports both modes.
>=20
> For DT configuration details, please refer to:
> - Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
>=20
> The datasheet is available at:
> - https://www.monolithicpower.com/en/mp3309c.html
>=20
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>=20
> v5:
>  - checked and resend for updated kernel 6.6.0-rc1

Why is this v5 patch attached to a 1 patch "series" that only purports
to contain a binding patch?

Thanks,
Conor.

> v4:
>  - add brightness-levels property
>  - force fixed 32 brightness levels (0..31) in analog-i2c dimming mode
>  - remove useless irq and reset_gpio from mp3309c_chip structure
> v3:
>  - fix SPDX obsolete spelling
>  - in mp3309c_bl_update_status, change from msleep_interruptible() to msl=
eep()
>    and improve the related comment
> v2:
>  - fix dependecies in Kconfig
>  - fix Kconfig MP3309C entry order
>  - remove switch-on-delay-ms property
>  - remove optional gpio property to reset external devices
>  - remove dimming-mode property (the analog-i2c dimming mode is the defau=
lt; the
>    presence of the pwms property, in DT, selects automatically the pwm di=
mming
>    mode)
>  - substitute three boolean properties, used for the overvoltage-protecti=
on
>    values, with a single enum property
>  - drop simple tracing messages
>  - use dev_err_probe() in probe function
>  - change device name from mp3309c_bl to the simple mp3309c
>  - remove shutdown function
> v1:
>  - first version
>=20
>  MAINTAINERS                       |   7 +
>  drivers/video/backlight/Kconfig   |  11 +
>  drivers/video/backlight/Makefile  |   1 +
>  drivers/video/backlight/mp3309c.c | 443 ++++++++++++++++++++++++++++++
>  4 files changed, 462 insertions(+)
>  create mode 100644 drivers/video/backlight/mp3309c.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..3d23b869e2aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14474,6 +14474,13 @@ S:	Maintained
>  F:	Documentation/driver-api/tty/moxa-smartio.rst
>  F:	drivers/tty/mxser.*
> =20
> +MP3309C BACKLIGHT DRIVER
> +M:	Flavio Suligoi <f.suligoi@asem.it>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> +F:	drivers/video/backlight/mp3309c.c
> +
>  MR800 AVERMEDIA USB FM RADIO DRIVER
>  M:	Alexey Klimov <klimov.linux@gmail.com>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kc=
onfig
> index 51387b1ef012..1144a54a35c0 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -402,6 +402,17 @@ config BACKLIGHT_LP8788
>  	help
>  	  This supports TI LP8788 backlight driver.
> =20
> +config BACKLIGHT_MP3309C
> +	tristate "Backlight Driver for MPS MP3309C"
> +	depends on I2C && PWM
> +	select REGMAP_I2C
> +	help
> +	  This supports MPS MP3309C backlight WLED driver in both PWM and
> +	  analog/I2C dimming modes.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called mp3309c.
> +
>  config BACKLIGHT_PANDORA
>  	tristate "Backlight driver for Pandora console"
>  	depends on TWL4030_CORE
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/M=
akefile
> index f72e1c3c59e9..1af583de665b 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LP855X)		+=3D lp855x_bl.o
>  obj-$(CONFIG_BACKLIGHT_LP8788)		+=3D lp8788_bl.o
>  obj-$(CONFIG_BACKLIGHT_LV5207LP)	+=3D lv5207lp.o
>  obj-$(CONFIG_BACKLIGHT_MAX8925)		+=3D max8925_bl.o
> +obj-$(CONFIG_BACKLIGHT_MP3309C)		+=3D mp3309c.o
>  obj-$(CONFIG_BACKLIGHT_MT6370)		+=3D mt6370-backlight.o
>  obj-$(CONFIG_BACKLIGHT_OMAP1)		+=3D omap1_bl.o
>  obj-$(CONFIG_BACKLIGHT_PANDORA)		+=3D pandora_bl.o
> diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/=
mp3309c.c
> new file mode 100644
> index 000000000000..3fe4469ef43f
> --- /dev/null
> +++ b/drivers/video/backlight/mp3309c.c
> @@ -0,0 +1,443 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for MPS MP3309C White LED driver with I2C interface
> + *
> + * This driver support both analog (by I2C commands) and PWM dimming con=
trol
> + * modes.
> + *
> + * Copyright (C) 2023 ASEM Srl
> + * Author: Flavio Suligoi <f.suligoi@asem.it>
> + *
> + * Based on pwm_bl.c
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/pwm.h>
> +#include <linux/regmap.h>
> +
> +#define REG_I2C_0	0x00
> +#define REG_I2C_1	0x01
> +
> +#define REG_I2C_0_EN	0x80
> +#define REG_I2C_0_D0	0x40
> +#define REG_I2C_0_D1	0x20
> +#define REG_I2C_0_D2	0x10
> +#define REG_I2C_0_D3	0x08
> +#define REG_I2C_0_D4	0x04
> +#define REG_I2C_0_RSRV1	0x02
> +#define REG_I2C_0_RSRV2	0x01
> +
> +#define REG_I2C_1_RSRV1	0x80
> +#define REG_I2C_1_DIMS	0x40
> +#define REG_I2C_1_SYNC	0x20
> +#define REG_I2C_1_OVP0	0x10
> +#define REG_I2C_1_OVP1	0x08
> +#define REG_I2C_1_VOS	0x04
> +#define REG_I2C_1_LEDO	0x02
> +#define REG_I2C_1_OTP	0x01
> +
> +#define ANALOG_I2C_NUM_LEVELS	32		/* 0..31 */
> +#define ANALOG_I2C_REG_MASK	0x7c
> +
> +#define MP3309C_PWM_DEFAULT_NUM_LEVELS	256	/* 0..255 */
> +
> +enum mp3309c_status_value {
> +	FIRST_POWER_ON,
> +	BACKLIGHT_OFF,
> +	BACKLIGHT_ON,
> +};
> +
> +enum mp3309c_dimming_mode_value {
> +	DIMMING_PWM,
> +	DIMMING_ANALOG_I2C,
> +};
> +
> +struct mp3309c_platform_data {
> +	unsigned int max_brightness;
> +	unsigned int default_brightness;
> +	unsigned int *levels;
> +	u8  dimming_mode;
> +	u8  over_voltage_protection;
> +	bool sync_mode;
> +	u8 status;
> +};
> +
> +struct mp3309c_chip {
> +	struct device *dev;
> +	struct mp3309c_platform_data *pdata;
> +	struct backlight_device *bl;
> +	struct gpio_desc *enable_gpio;
> +	struct regmap *regmap;
> +	struct pwm_device *pwmd;
> +};
> +
> +static const struct regmap_config mp3309c_regmap =3D {
> +	.name =3D "mp3309c_regmap",
> +	.reg_bits =3D 8,
> +	.reg_stride =3D 1,
> +	.val_bits =3D 8,
> +	.max_register =3D REG_I2C_1,
> +};
> +
> +static int mp3309c_enable_device(struct mp3309c_chip *chip)
> +{
> +	u8 reg_val;
> +	int ret;
> +
> +	/* I2C register #0 - Device enable */
> +	ret =3D regmap_update_bits(chip->regmap, REG_I2C_0, REG_I2C_0_EN,
> +				 REG_I2C_0_EN);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * I2C register #1 - Set working mode:
> +	 *  - set one of the two dimming mode:
> +	 *    - PWM dimming using an external PWM dimming signal
> +	 *    - analog dimming using I2C commands
> +	 *  - enable/disable synchronous mode
> +	 *  - set overvoltage protection (OVP)
> +	 */
> +	reg_val =3D 0x00;
> +	if (chip->pdata->dimming_mode =3D=3D DIMMING_PWM)
> +		reg_val |=3D REG_I2C_1_DIMS;
> +	if (chip->pdata->sync_mode)
> +		reg_val |=3D REG_I2C_1_SYNC;
> +	reg_val |=3D chip->pdata->over_voltage_protection;
> +	ret =3D regmap_write(chip->regmap, REG_I2C_1, reg_val);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int mp3309c_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mp3309c_chip *chip =3D bl_get_data(bl);
> +	int brightness =3D backlight_get_brightness(bl);
> +	struct pwm_state pwmstate;
> +	unsigned int analog_val, bits_val;
> +	int i, ret;
> +
> +	if (chip->pdata->dimming_mode =3D=3D DIMMING_PWM) {
> +		/*
> +		 * PWM control mode
> +		 */
> +		pwm_get_state(chip->pwmd, &pwmstate);
> +		pwm_set_relative_duty_cycle(&pwmstate,
> +					    chip->pdata->levels[brightness],
> +					    chip->pdata->levels[chip->pdata->max_brightness]);
> +		pwmstate.enabled =3D true;
> +		ret =3D pwm_apply_state(chip->pwmd, &pwmstate);
> +		if (ret)
> +			return ret;
> +
> +		switch (chip->pdata->status) {
> +		case FIRST_POWER_ON:
> +		case BACKLIGHT_OFF:
> +			/*
> +			 * After 20ms of low pwm signal level, the chip turns
> +			 * off automatically. In this case, before enabling the
> +			 * chip again, we must wait about 10ms for pwm signal to
> +			 * stabilize.
> +			 */
> +			if (brightness > 0) {
> +				msleep(10);
> +				mp3309c_enable_device(chip);
> +				chip->pdata->status =3D BACKLIGHT_ON;
> +			} else {
> +				chip->pdata->status =3D BACKLIGHT_OFF;
> +			}
> +			break;
> +		case BACKLIGHT_ON:
> +			if (brightness =3D=3D 0)
> +				chip->pdata->status =3D BACKLIGHT_OFF;
> +			break;
> +		}
> +	} else {
> +		/*
> +		 * Analog (by I2C command) control mode
> +		 *
> +		 * The first time, before setting brightness, we must enable the
> +		 * device
> +		 */
> +		if (chip->pdata->status =3D=3D FIRST_POWER_ON)
> +			mp3309c_enable_device(chip);
> +
> +		/*
> +		 * Dimming mode I2C command (fixed dimming range 0..31)
> +		 *
> +		 * The 5 bits of the dimming analog value D4..D0 is allocated
> +		 * in the I2C register #0, in the following way:
> +		 *
> +		 *     +--+--+--+--+--+--+--+--+
> +		 *     |EN|D0|D1|D2|D3|D4|XX|XX|
> +		 *     +--+--+--+--+--+--+--+--+
> +		 */
> +		analog_val =3D brightness;
> +		bits_val =3D 0;
> +		for (i =3D 0; i <=3D 5; i++)
> +			bits_val +=3D ((analog_val >> i) & 0x01) << (6 - i);
> +		ret =3D regmap_update_bits(chip->regmap, REG_I2C_0,
> +					 ANALOG_I2C_REG_MASK, bits_val);
> +		if (ret)
> +			return ret;
> +
> +		if (brightness > 0)
> +			chip->pdata->status =3D BACKLIGHT_ON;
> +		else
> +			chip->pdata->status =3D BACKLIGHT_OFF;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops mp3309c_bl_ops =3D {
> +	.update_status =3D mp3309c_bl_update_status,
> +};
> +
> +static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
> +				 struct mp3309c_platform_data *pdata)
> +{
> +	struct device_node *node =3D chip->dev->of_node;
> +	struct property *prop_pwms, *prop_levels;
> +	int length =3D 0;
> +	int ret, i;
> +	unsigned int num_levels, tmp_value;
> +
> +	if (!node) {
> +		dev_err(chip->dev, "failed to get DT node\n");
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * Dimming mode: the MP3309C provides two dimming control mode:
> +	 *
> +	 * - PWM mode
> +	 * - Analog by I2C control mode (default)
> +	 *
> +	 * I2C control mode is assumed as default but, if the pwms property is
> +	 * found in the backlight node, the mode switches to PWM mode.
> +	 */
> +	pdata->dimming_mode =3D DIMMING_ANALOG_I2C;
> +	prop_pwms =3D of_find_property(node, "pwms", &length);
> +	if (prop_pwms) {
> +		chip->pwmd =3D devm_pwm_get(chip->dev, NULL);
> +		if (IS_ERR(chip->pwmd))
> +			return dev_err_probe(chip->dev, PTR_ERR(chip->pwmd),
> +					     "error getting pwm data\n");
> +		pdata->dimming_mode =3D DIMMING_PWM;
> +		pwm_apply_args(chip->pwmd);
> +	}
> +
> +	/*
> +	 * In I2C control mode the dimming levels (0..31) are fixed by the
> +	 * hardware, while in PWM control mode they can be chosen by the user,
> +	 * to allow nonlinear mappings.
> +	 */
> +	if  (pdata->dimming_mode =3D=3D DIMMING_ANALOG_I2C) {
> +		/*
> +		 * Analog (by I2C commands) control mode: fixed 0..31 brightness
> +		 * levels
> +		 */
> +		num_levels =3D ANALOG_I2C_NUM_LEVELS;
> +
> +		/* Enable GPIO used in I2C dimming mode only */
> +		chip->enable_gpio =3D devm_gpiod_get(chip->dev, "enable",
> +						   GPIOD_OUT_HIGH);
> +		if (IS_ERR(chip->enable_gpio))
> +			return dev_err_probe(chip->dev,
> +					     PTR_ERR(chip->enable_gpio),
> +					     "error getting enable gpio\n");
> +	} else {
> +		/*
> +		 * PWM control mode: check for brightness level in DT
> +		 */
> +		prop_levels =3D of_find_property(node, "brightness-levels",
> +					       &length);
> +		if (prop_levels) {
> +			/* Read brightness levels from DT */
> +			num_levels =3D length / sizeof(u32);
> +			if (num_levels < 2)
> +				return -EINVAL;
> +		} else {
> +			/* Use default brightness levels */
> +			num_levels =3D MP3309C_PWM_DEFAULT_NUM_LEVELS;
> +		}
> +	}
> +
> +	/* Fill brightness levels array */
> +	pdata->levels =3D devm_kcalloc(chip->dev, num_levels,
> +				     sizeof(*pdata->levels), GFP_KERNEL);
> +	if (!pdata->levels)
> +		return -ENOMEM;
> +	if (prop_levels) {
> +		ret =3D of_property_read_u32_array(node, "brightness-levels",
> +						 pdata->levels,
> +						 num_levels);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		for (i =3D 0; i < num_levels; i++)
> +			pdata->levels[i] =3D i;
> +	}
> +
> +	pdata->max_brightness =3D num_levels - 1;
> +
> +	ret =3D of_property_read_u32(node, "default-brightness",
> +				   &pdata->default_brightness);
> +	if (ret)
> +		pdata->default_brightness =3D pdata->max_brightness;
> +	if (pdata->default_brightness > pdata->max_brightness) {
> +		dev_err(chip->dev,
> +			"default brightness exceeds max brightness\n");
> +		pdata->default_brightness =3D pdata->max_brightness;
> +	}
> +
> +	/*
> +	 * Over-voltage protection (OVP)
> +	 *
> +	 * This (optional) property values are:
> +	 *
> +	 *  - 13.5V
> +	 *  - 24V
> +	 *  - 35.5V (hardware default setting)
> +	 *
> +	 * If missing, the default value for OVP is 35.5V
> +	 */
> +	pdata->over_voltage_protection =3D REG_I2C_1_OVP1;
> +	if (!of_property_read_u32(node, "mps,overvoltage-protection-microvolt",
> +				  &tmp_value)) {
> +		switch (tmp_value) {
> +		case 13500000:
> +			pdata->over_voltage_protection =3D 0x00;
> +			break;
> +		case 24000000:
> +			pdata->over_voltage_protection =3D REG_I2C_1_OVP0;
> +			break;
> +		case 35500000:
> +			pdata->over_voltage_protection =3D REG_I2C_1_OVP1;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* Synchronous (default) and non-synchronous mode */
> +	pdata->sync_mode =3D true;
> +	if (of_property_read_bool(node, "mps,no-sync-mode"))
> +		pdata->sync_mode =3D false;
> +
> +	return 0;
> +}
> +
> +static int mp3309c_probe(struct i2c_client *client)
> +{
> +	struct mp3309c_platform_data *pdata =3D dev_get_platdata(&client->dev);
> +	struct mp3309c_chip *chip;
> +	struct backlight_properties props;
> +	struct pwm_state pwmstate;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(&client->dev, "failed to check i2c functionality\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	chip =3D devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev =3D &client->dev;
> +
> +	chip->regmap =3D devm_regmap_init_i2c(client, &mp3309c_regmap);
> +	if (IS_ERR(chip->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
> +				     "failed to allocate register map\n");
> +
> +	i2c_set_clientdata(client, chip);
> +
> +	if (!pdata) {
> +		pdata =3D devm_kzalloc(chip->dev, sizeof(*pdata), GFP_KERNEL);
> +		if (!pdata)
> +			return -ENOMEM;
> +
> +		ret =3D pm3309c_parse_dt_node(chip, pdata);
> +		if (ret)
> +			return ret;
> +	}
> +	chip->pdata =3D pdata;
> +
> +	/* Backlight properties */
> +	props.brightness =3D pdata->default_brightness;
> +	props.max_brightness =3D pdata->max_brightness;
> +	props.scale =3D BACKLIGHT_SCALE_LINEAR;
> +	props.type =3D BACKLIGHT_RAW;
> +	props.power =3D FB_BLANK_UNBLANK;
> +	props.fb_blank =3D FB_BLANK_UNBLANK;
> +	chip->bl =3D devm_backlight_device_register(chip->dev, "mp3309c",
> +						  chip->dev, chip,
> +						  &mp3309c_bl_ops, &props);
> +	if (IS_ERR(chip->bl))
> +		return dev_err_probe(chip->dev, PTR_ERR(chip->bl),
> +				     "error registering backlight device\n");
> +
> +	/* In PWM dimming mode, enable pwm device */
> +	if (chip->pdata->dimming_mode =3D=3D DIMMING_PWM) {
> +		pwm_init_state(chip->pwmd, &pwmstate);
> +		pwm_set_relative_duty_cycle(&pwmstate,
> +					    chip->pdata->default_brightness,
> +					    chip->pdata->max_brightness);
> +		pwmstate.enabled =3D true;
> +		ret =3D pwm_apply_state(chip->pwmd, &pwmstate);
> +		if (ret)
> +			return dev_err_probe(chip->dev, ret,
> +					     "error setting pwm device\n");
> +	}
> +
> +	chip->pdata->status =3D FIRST_POWER_ON;
> +	backlight_update_status(chip->bl);
> +
> +	return 0;
> +}
> +
> +static void mp3309c_remove(struct i2c_client *client)
> +{
> +	struct mp3309c_chip *chip =3D i2c_get_clientdata(client);
> +	struct backlight_device *bl =3D chip->bl;
> +
> +	bl->props.power =3D FB_BLANK_POWERDOWN;
> +	bl->props.brightness =3D 0;
> +	backlight_update_status(chip->bl);
> +}
> +
> +static const struct of_device_id mp3309c_match_table[] =3D {
> +	{ .compatible =3D "mps,mp3309c", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, mp3309c_match_table);
> +
> +static const struct i2c_device_id mp3309c_id[] =3D {
> +	{ "mp3309c", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, mp3309c_id);
> +
> +static struct i2c_driver mp3309c_i2c_driver =3D {
> +	.driver	=3D {
> +			.name		=3D KBUILD_MODNAME,
> +			.of_match_table	=3D mp3309c_match_table,
> +	},
> +	.probe		=3D mp3309c_probe,
> +	.remove		=3D mp3309c_remove,
> +	.id_table	=3D mp3309c_id,
> +};
> +
> +module_i2c_driver(mp3309c_i2c_driver);
> +
> +MODULE_DESCRIPTION("Backlight Driver for MPS MP3309C");
> +MODULE_AUTHOR("Flavio Suligoi <f.suligoi@asem.it>");
> +MODULE_LICENSE("GPL");
> --=20
> 2.34.1
>=20

--fmrSnAj5eGo+Mp1q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTKjQwAKCRB4tDGHoIJi
0tXeAP9CjYoPjVfUd01Srj5cGeJaf4TpRf47U2oo5eixdfSwIQEAsHV4azaLIt+V
gKhHTgQuyEq7sgOZ20FGpncNGQQtFw4=
=oHNv
-----END PGP SIGNATURE-----

--fmrSnAj5eGo+Mp1q--
