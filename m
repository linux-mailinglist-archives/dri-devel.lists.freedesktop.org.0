Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9817150897D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 15:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F30610E2BA;
	Wed, 20 Apr 2022 13:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136BC10E2BA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:43:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0977460EC8;
 Wed, 20 Apr 2022 13:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1680EC385A0;
 Wed, 20 Apr 2022 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650462188;
 bh=qAX+7/fdnliZOw4nv8Rp4dEJx8oAsndLLAxA2eMiTfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L42/09/yCO9iNyPaBjWiMD4CSiTKyzal96En6UIVXJBZ8TPeOhlOYXYfO7wwHRjSz
 mUlV0LBvzIO8NbyfVzbA9Aarvuh36VplGfIaRP9pJJVszuFHqYb7WlIOsh/oyVO4qG
 aA8T52kx+JWbq+JATh1Fxbwi+3v3CFqWmeQPmDbDRK6YfpctuZ+IkierB/lu1ZgyZ0
 WTCCChm3if9vCxR4x5Z35u1OMDN8F1sOEGE5B+msjpxzRMWH7MTl9piR4VDraZeqsi
 Jw3Kw/aMlVggHe4NwSpY6Bx/JG8t1s+d2GRmilCIN5Wi7oDusCKGLouwvXqt3hK4+j
 hqRCMkShofHPg==
Received: by mercury (Postfix, from userid 1000)
 id 5D41D1060347; Wed, 20 Apr 2022 15:43:05 +0200 (CEST)
Date: Wed, 20 Apr 2022 15:43:05 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 40/48] ARM: pxa: tosa: use gpio lookup for battery
Message-ID: <20220420134305.fq7pc3fsz5fxkryj@mercury.elektranox.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-41-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qpvv5pfrnllxtjfz"
Content-Disposition: inline
In-Reply-To: <20220419163810.2118169-41-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, robert.jarzmik@free.fr,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Sergey Lapin <slapin@ossfans.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qpvv5pfrnllxtjfz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 19, 2022 at 06:38:02PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The battery driver uses a lot of GPIO lines, hardcoded from a
> machine header file.
>=20
> Change it to use a gpiod lookup table instead.
>=20
> Reviewed-by: Sebastian Reichel <sre@kernel.org>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

That's the last power-supply driver not yet using descriptor based
gpio API :)

> [...]
> diff --git a/drivers/power/supply/tosa_battery.c b/drivers/power/supply/t=
osa_battery.c
> index b26b0eca33e1..d10320f348d0 100644
> --- a/drivers/power/supply/tosa_battery.c
> +++ b/drivers/power/supply/tosa_battery.c
> @@ -15,11 +15,16 @@
>  #include <linux/gpio.h>

This should be <linux/gpio/consumer.h> now.

-- Sebastian


> =20
>  #include <asm/mach-types.h>
> -#include <mach/tosa.h>
> =20
>  static DEFINE_MUTEX(bat_lock); /* protects gpio pins */
>  static struct work_struct bat_work;
> =20
> +struct tosa_gpio {
> +	const char *con;
> +	enum gpiod_flags flags;
> +	struct gpio_desc *desc;
> +};
> +
>  struct tosa_bat {
>  	int status;
>  	struct power_supply *psy;
> @@ -28,38 +33,42 @@ struct tosa_bat {
>  	struct mutex work_lock; /* protects data */
> =20
>  	bool (*is_present)(struct tosa_bat *bat);
> -	int gpio_full;
> -	int gpio_charge_off;
> +	struct tosa_gpio gpio_full;
> +	struct tosa_gpio gpio_charge_off;
> =20
>  	int technology;
> =20
> -	int gpio_bat;
> +	struct tosa_gpio gpio_bat;
>  	int adc_bat;
>  	int adc_bat_divider;
>  	int bat_max;
>  	int bat_min;
> =20
> -	int gpio_temp;
> +	struct tosa_gpio gpio_temp;
>  	int adc_temp;
>  	int adc_temp_divider;
>  };
> =20
>  static struct tosa_bat tosa_bat_main;
>  static struct tosa_bat tosa_bat_jacket;
> +static struct tosa_gpio gpiod_jacket_det =3D { "jacket detect", GPIOD_IN=
 };
> +static struct tosa_gpio gpiod_battery_switch =3D { "battery switch", GPI=
OD_OUT_LOW };
> +static struct tosa_gpio gpiod_main_battery_low =3D { "main battery low",=
 GPIOD_IN };
> +static struct tosa_gpio gpiod_jacket_battery_low =3D { "jacket battery l=
ow", GPIOD_IN };
> =20
>  static unsigned long tosa_read_bat(struct tosa_bat *bat)
>  {
>  	unsigned long value =3D 0;
> =20
> -	if (bat->gpio_bat < 0 || bat->adc_bat < 0)
> +	if (!bat->gpio_bat.desc || bat->adc_bat < 0)
>  		return 0;
> =20
>  	mutex_lock(&bat_lock);
> -	gpio_set_value(bat->gpio_bat, 1);
> +	gpiod_set_value(bat->gpio_bat.desc, 1);
>  	msleep(5);
>  	value =3D wm97xx_read_aux_adc(dev_get_drvdata(bat->psy->dev.parent),
>  			bat->adc_bat);
> -	gpio_set_value(bat->gpio_bat, 0);
> +	gpiod_set_value(bat->gpio_bat.desc, 0);
>  	mutex_unlock(&bat_lock);
> =20
>  	value =3D value * 1000000 / bat->adc_bat_divider;
> @@ -71,15 +80,15 @@ static unsigned long tosa_read_temp(struct tosa_bat *=
bat)
>  {
>  	unsigned long value =3D 0;
> =20
> -	if (bat->gpio_temp < 0 || bat->adc_temp < 0)
> +	if (!bat->gpio_temp.desc || bat->adc_temp < 0)
>  		return 0;
> =20
>  	mutex_lock(&bat_lock);
> -	gpio_set_value(bat->gpio_temp, 1);
> +	gpiod_set_value(bat->gpio_temp.desc, 1);
>  	msleep(5);
>  	value =3D wm97xx_read_aux_adc(dev_get_drvdata(bat->psy->dev.parent),
>  			bat->adc_temp);
> -	gpio_set_value(bat->gpio_temp, 0);
> +	gpiod_set_value(bat->gpio_temp.desc, 0);
>  	mutex_unlock(&bat_lock);
> =20
>  	value =3D value * 10000 / bat->adc_temp_divider;
> @@ -136,7 +145,7 @@ static int tosa_bat_get_property(struct power_supply =
*psy,
> =20
>  static bool tosa_jacket_bat_is_present(struct tosa_bat *bat)
>  {
> -	return gpio_get_value(TOSA_GPIO_JACKET_DETECT) =3D=3D 0;
> +	return gpiod_get_value(gpiod_jacket_det.desc) =3D=3D 0;
>  }
> =20
>  static void tosa_bat_external_power_changed(struct power_supply *psy)
> @@ -166,23 +175,23 @@ static void tosa_bat_update(struct tosa_bat *bat)
>  		bat->full_chrg =3D -1;
>  	} else if (power_supply_am_i_supplied(psy)) {
>  		if (bat->status =3D=3D POWER_SUPPLY_STATUS_DISCHARGING) {
> -			gpio_set_value(bat->gpio_charge_off, 0);
> +			gpiod_set_value(bat->gpio_charge_off.desc, 0);
>  			mdelay(15);
>  		}
> =20
> -		if (gpio_get_value(bat->gpio_full)) {
> +		if (gpiod_get_value(bat->gpio_full.desc)) {
>  			if (old =3D=3D POWER_SUPPLY_STATUS_CHARGING ||
>  					bat->full_chrg =3D=3D -1)
>  				bat->full_chrg =3D tosa_read_bat(bat);
> =20
> -			gpio_set_value(bat->gpio_charge_off, 1);
> +			gpiod_set_value(bat->gpio_charge_off.desc, 1);
>  			bat->status =3D POWER_SUPPLY_STATUS_FULL;
>  		} else {
> -			gpio_set_value(bat->gpio_charge_off, 0);
> +			gpiod_set_value(bat->gpio_charge_off.desc, 0);
>  			bat->status =3D POWER_SUPPLY_STATUS_CHARGING;
>  		}
>  	} else {
> -		gpio_set_value(bat->gpio_charge_off, 1);
> +		gpiod_set_value(bat->gpio_charge_off.desc, 1);
>  		bat->status =3D POWER_SUPPLY_STATUS_DISCHARGING;
>  	}
> =20
> @@ -251,18 +260,18 @@ static struct tosa_bat tosa_bat_main =3D {
>  	.full_chrg =3D -1,
>  	.psy =3D NULL,
> =20
> -	.gpio_full =3D TOSA_GPIO_BAT0_CRG,
> -	.gpio_charge_off =3D TOSA_GPIO_CHARGE_OFF,
> +	.gpio_full =3D { "main battery full", GPIOD_IN },
> +	.gpio_charge_off =3D { "main charge off" , GPIOD_OUT_HIGH },
> =20
>  	.technology =3D POWER_SUPPLY_TECHNOLOGY_LIPO,
> =20
> -	.gpio_bat =3D TOSA_GPIO_BAT0_V_ON,
> +	.gpio_bat =3D { "main battery", GPIOD_OUT_LOW },
>  	.adc_bat =3D WM97XX_AUX_ID3,
>  	.adc_bat_divider =3D 414,
>  	.bat_max =3D 4310000,
>  	.bat_min =3D 1551 * 1000000 / 414,
> =20
> -	.gpio_temp =3D TOSA_GPIO_BAT1_TH_ON,
> +	.gpio_temp =3D { "main battery temp", GPIOD_OUT_LOW },
>  	.adc_temp =3D WM97XX_AUX_ID2,
>  	.adc_temp_divider =3D 10000,
>  };
> @@ -273,18 +282,18 @@ static struct tosa_bat tosa_bat_jacket =3D {
>  	.psy =3D NULL,
> =20
>  	.is_present =3D tosa_jacket_bat_is_present,
> -	.gpio_full =3D TOSA_GPIO_BAT1_CRG,
> -	.gpio_charge_off =3D TOSA_GPIO_CHARGE_OFF_JC,
> +	.gpio_full =3D { "jacket battery full", GPIOD_IN },
> +	.gpio_charge_off =3D { "jacket charge off", GPIOD_OUT_HIGH },
> =20
>  	.technology =3D POWER_SUPPLY_TECHNOLOGY_LIPO,
> =20
> -	.gpio_bat =3D TOSA_GPIO_BAT1_V_ON,
> +	.gpio_bat =3D { "jacket battery", GPIOD_OUT_LOW },
>  	.adc_bat =3D WM97XX_AUX_ID3,
>  	.adc_bat_divider =3D 414,
>  	.bat_max =3D 4310000,
>  	.bat_min =3D 1551 * 1000000 / 414,
> =20
> -	.gpio_temp =3D TOSA_GPIO_BAT0_TH_ON,
> +	.gpio_temp =3D { "jacket battery temp", GPIOD_OUT_LOW },
>  	.adc_temp =3D WM97XX_AUX_ID2,
>  	.adc_temp_divider =3D 10000,
>  };
> @@ -294,36 +303,16 @@ static struct tosa_bat tosa_bat_bu =3D {
>  	.full_chrg =3D -1,
>  	.psy =3D NULL,
> =20
> -	.gpio_full =3D -1,
> -	.gpio_charge_off =3D -1,
> -
>  	.technology =3D POWER_SUPPLY_TECHNOLOGY_LiMn,
> =20
> -	.gpio_bat =3D TOSA_GPIO_BU_CHRG_ON,
> +	.gpio_bat =3D { "backup battery", GPIOD_OUT_LOW },
>  	.adc_bat =3D WM97XX_AUX_ID4,
>  	.adc_bat_divider =3D 1266,
> =20
> -	.gpio_temp =3D -1,
>  	.adc_temp =3D -1,
>  	.adc_temp_divider =3D -1,
>  };
> =20
> -static struct gpio tosa_bat_gpios[] =3D {
> -	{ TOSA_GPIO_CHARGE_OFF,	   GPIOF_OUT_INIT_HIGH, "main charge off" },
> -	{ TOSA_GPIO_CHARGE_OFF_JC, GPIOF_OUT_INIT_HIGH, "jacket charge off" },
> -	{ TOSA_GPIO_BAT_SW_ON,	   GPIOF_OUT_INIT_LOW,	"battery switch" },
> -	{ TOSA_GPIO_BAT0_V_ON,	   GPIOF_OUT_INIT_LOW,	"main battery" },
> -	{ TOSA_GPIO_BAT1_V_ON,	   GPIOF_OUT_INIT_LOW,	"jacket battery" },
> -	{ TOSA_GPIO_BAT1_TH_ON,	   GPIOF_OUT_INIT_LOW,	"main battery temp" },
> -	{ TOSA_GPIO_BAT0_TH_ON,	   GPIOF_OUT_INIT_LOW,	"jacket battery temp" },
> -	{ TOSA_GPIO_BU_CHRG_ON,	   GPIOF_OUT_INIT_LOW,	"backup battery" },
> -	{ TOSA_GPIO_BAT0_CRG,	   GPIOF_IN,		"main battery full" },
> -	{ TOSA_GPIO_BAT1_CRG,	   GPIOF_IN,		"jacket battery full" },
> -	{ TOSA_GPIO_BAT0_LOW,	   GPIOF_IN,		"main battery low" },
> -	{ TOSA_GPIO_BAT1_LOW,	   GPIOF_IN,		"jacket battery low" },
> -	{ TOSA_GPIO_JACKET_DETECT, GPIOF_IN,		"jacket detect" },
> -};
> -
>  #ifdef CONFIG_PM
>  static int tosa_bat_suspend(struct platform_device *dev, pm_message_t st=
ate)
>  {
> @@ -343,6 +332,21 @@ static int tosa_bat_resume(struct platform_device *d=
ev)
>  #define tosa_bat_resume NULL
>  #endif
> =20
> +static int tosa_bat_gpio_get(struct device *dev, struct tosa_gpio *gpio)
> +{
> +	int ret;
> +
> +	if (!gpio->con)
> +		return 0;
> +
> +	gpio->desc =3D devm_gpiod_get(dev, gpio->con, gpio->flags);
> +	ret =3D PTR_ERR_OR_ZERO(gpio->desc);
> +	if (ret)
> +		dev_warn(dev, "failed to get gpio \"%s\"\n", gpio->con);
> +
> +	return ret;
> +}
> +
>  static int tosa_power_supply_register(struct device *dev,
>  			struct tosa_bat *bat,
>  			const struct power_supply_desc *desc)
> @@ -350,6 +354,23 @@ static int tosa_power_supply_register(struct device =
*dev,
>  	struct power_supply_config cfg =3D {
>  		.drv_data =3D bat,
>  	};
> +	int ret;
> +
> +	ret =3D tosa_bat_gpio_get(dev, &bat->gpio_full);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D tosa_bat_gpio_get(dev, &bat->gpio_charge_off);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D tosa_bat_gpio_get(dev, &bat->gpio_bat);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D tosa_bat_gpio_get(dev, &bat->gpio_temp);
> +	if (ret)
> +		return ret;
> =20
>  	mutex_init(&bat->work_lock);
>  	bat->psy =3D power_supply_register(dev, desc, &cfg);
> @@ -358,49 +379,55 @@ static int tosa_power_supply_register(struct device=
 *dev,
>  }
> =20
> =20
> -static int tosa_bat_probe(struct platform_device *dev)
> +static int tosa_bat_probe(struct platform_device *pdev)
>  {
> +	struct device *dev =3D &pdev->dev;
>  	int ret;
> =20
>  	if (!machine_is_tosa())
>  		return -ENODEV;
> =20
> -	ret =3D gpio_request_array(tosa_bat_gpios, ARRAY_SIZE(tosa_bat_gpios));
> +	ret =3D tosa_bat_gpio_get(dev, &gpiod_jacket_det);
>  	if (ret)
>  		return ret;
> =20
> +	/* these are not used anywhere, continue on failure */
> +	tosa_bat_gpio_get(dev, &gpiod_battery_switch);
> +	tosa_bat_gpio_get(dev, &gpiod_main_battery_low);
> +	tosa_bat_gpio_get(dev, &gpiod_jacket_battery_low);
> +
>  	INIT_WORK(&bat_work, tosa_bat_work);
> =20
> -	ret =3D tosa_power_supply_register(&dev->dev, &tosa_bat_main,
> +	ret =3D tosa_power_supply_register(dev, &tosa_bat_main,
>  					 &tosa_bat_main_desc);
>  	if (ret)
>  		goto err_psy_reg_main;
> =20
> -	ret =3D tosa_power_supply_register(&dev->dev, &tosa_bat_jacket,
> +	ret =3D tosa_power_supply_register(dev, &tosa_bat_jacket,
>  					 &tosa_bat_jacket_desc);
>  	if (ret)
>  		goto err_psy_reg_jacket;
> =20
> -	ret =3D tosa_power_supply_register(&dev->dev, &tosa_bat_bu,
> +	ret =3D tosa_power_supply_register(dev, &tosa_bat_bu,
>  					 &tosa_bat_bu_desc);
>  	if (ret)
>  		goto err_psy_reg_bu;
> =20
> -	ret =3D request_irq(gpio_to_irq(TOSA_GPIO_BAT0_CRG),
> +	ret =3D request_irq(gpiod_to_irq(tosa_bat_main.gpio_full.desc),
>  				tosa_bat_gpio_isr,
>  				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
>  				"main full", &tosa_bat_main);
>  	if (ret)
>  		goto err_req_main;
> =20
> -	ret =3D request_irq(gpio_to_irq(TOSA_GPIO_BAT1_CRG),
> +	ret =3D request_irq(gpiod_to_irq(tosa_bat_jacket.gpio_full.desc),
>  				tosa_bat_gpio_isr,
>  				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
>  				"jacket full", &tosa_bat_jacket);
>  	if (ret)
>  		goto err_req_jacket;
> =20
> -	ret =3D request_irq(gpio_to_irq(TOSA_GPIO_JACKET_DETECT),
> +	ret =3D request_irq(gpiod_to_irq(gpiod_jacket_det.desc),
>  				tosa_bat_gpio_isr,
>  				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
>  				"jacket detect", &tosa_bat_jacket);
> @@ -409,9 +436,9 @@ static int tosa_bat_probe(struct platform_device *dev)
>  		return 0;
>  	}
> =20
> -	free_irq(gpio_to_irq(TOSA_GPIO_BAT1_CRG), &tosa_bat_jacket);
> +	free_irq(gpiod_to_irq(tosa_bat_jacket.gpio_full.desc), &tosa_bat_jacket=
);
>  err_req_jacket:
> -	free_irq(gpio_to_irq(TOSA_GPIO_BAT0_CRG), &tosa_bat_main);
> +	free_irq(gpiod_to_irq(tosa_bat_main.gpio_full.desc), &tosa_bat_main);
>  err_req_main:
>  	power_supply_unregister(tosa_bat_bu.psy);
>  err_psy_reg_bu:
> @@ -423,15 +450,14 @@ static int tosa_bat_probe(struct platform_device *d=
ev)
>  	/* see comment in tosa_bat_remove */
>  	cancel_work_sync(&bat_work);
> =20
> -	gpio_free_array(tosa_bat_gpios, ARRAY_SIZE(tosa_bat_gpios));
>  	return ret;
>  }
> =20
>  static int tosa_bat_remove(struct platform_device *dev)
>  {
> -	free_irq(gpio_to_irq(TOSA_GPIO_JACKET_DETECT), &tosa_bat_jacket);
> -	free_irq(gpio_to_irq(TOSA_GPIO_BAT1_CRG), &tosa_bat_jacket);
> -	free_irq(gpio_to_irq(TOSA_GPIO_BAT0_CRG), &tosa_bat_main);
> +	free_irq(gpiod_to_irq(gpiod_jacket_det.desc), &tosa_bat_jacket);
> +	free_irq(gpiod_to_irq(tosa_bat_jacket.gpio_full.desc), &tosa_bat_jacket=
);
> +	free_irq(gpiod_to_irq(tosa_bat_main.gpio_full.desc), &tosa_bat_main);
> =20
>  	power_supply_unregister(tosa_bat_bu.psy);
>  	power_supply_unregister(tosa_bat_jacket.psy);
> @@ -443,7 +469,6 @@ static int tosa_bat_remove(struct platform_device *de=
v)
>  	 * unregistered now.
>  	 */
>  	cancel_work_sync(&bat_work);
> -	gpio_free_array(tosa_bat_gpios, ARRAY_SIZE(tosa_bat_gpios));
>  	return 0;
>  }
> =20
> --=20
> 2.29.2
>=20

--qpvv5pfrnllxtjfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmJgDd8ACgkQ2O7X88g7
+pqj0A//Qrvjjke5jQ/QnNji1ayQEZh8WgQVSUMTFK98PKNf0ZJ2sLS9c7EAMHLC
R8IODTm2NLMY0kQ+fDtHrmXBsOsLfHCqG1WtFQdO55BmIc3R6J0m0VhTySlsijYo
BZDAVJ9uWMlxPzCXayQqS9BiMot+BTKRU+iPbCyBUwiMlym+w+Itz+InhEq24J22
xORG4+qSQ8moQPcSG40gzASRE1mtAo811/hndnzJlzhR67vOKmKQlS6lOnQKW6CQ
eVpYLvmASViXotq74d89al73jRsz7BBPS5pEZjh6cQwpwX8fb+fhwIioFidPtyL7
CjzaU1hqrNrxzI0DtMNY3J72PIEJ7+UdVlLasO9hGji8P/O4RSiXD41jQ6bpL2zN
7LtRseESnbxK1ifOqobpEhexJHAfFz9MBRHzd2xUgv8qSTGAltkwK5y+hEzkPvwz
d1b2ey+CIL8apFUlgffrR1OGS/Ja6vt+uTX5xSu1SVXSsk1GYLa1yifDyjD1HOAb
hYb5Q+OLjGZjmZkSW6B8KYl3LUQ9S3kqXkrRNwUK/MH4DyZvfi3kl4JgqyQk9cVE
O3sdikHUATBxGKeLzRh9y0ur3oMmnRTp+X/eldjhYtRHp4EYhwNnXF2wci7F32B5
PUUv/t/hAp8AJKaJsnFeApn5Bh6EpGumWsXh3QMcS7KoAKgCagw=
=gkQY
-----END PGP SIGNATURE-----

--qpvv5pfrnllxtjfz--
