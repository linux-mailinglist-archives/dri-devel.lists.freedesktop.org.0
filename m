Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5FF78A0D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 13:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC2A89CAA;
	Mon, 29 Jul 2019 11:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9536689CAA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 11:03:14 +0000 (UTC)
Received: from earth.universe (dyndsl-178-142-067-122.ewe-ip-backbone.de
 [178.142.67.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8BE12070D;
 Mon, 29 Jul 2019 11:03:13 +0000 (UTC)
Received: by earth.universe (Postfix, from userid 1000)
 id A9AFD3C0943; Mon, 29 Jul 2019 13:03:11 +0200 (CEST)
Date: Mon, 29 Jul 2019 13:03:11 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 08/11] power/supply: Drop obsolete JZ4740 driver
Message-ID: <20190729110311.naisyxxmrcdt5j2x@earth.universe>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-9-paul@crapouillou.net>
MIME-Version: 1.0
In-Reply-To: <20190725220215.460-9-paul@crapouillou.net>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564398194;
 bh=VgHIT7fPLEoqx+I2FCd1vG87U6/E7bCQT5sx3c8dKIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sXdjeOYAjQntPU0O2SF451E2CcZ4qEaATatn4PCax92mwXiFSpAH3ENFFHHSoE51m
 fjrrCnHmdgwxrsI23upkCutidLwS1Z8+ILS/u6uxtNNX4tYCPfC78QwKC+3s5gT/83
 vjmUXVmAvF2ftmnWyGc9mlrdcCEQFR58w4/NiJeQ=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1555314437=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1555314437==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="btulm44pv4u75rxi"
Content-Disposition: inline


--btulm44pv4u75rxi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 25, 2019 at 06:02:12PM -0400, Paul Cercueil wrote:
> It has been replaced with the more mature ingenic-battery driver.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> ---

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/power/supply/Kconfig          |  11 -
>  drivers/power/supply/Makefile         |   1 -
>  drivers/power/supply/jz4740-battery.c | 421 --------------------------
>  3 files changed, 433 deletions(-)
>  delete mode 100644 drivers/power/supply/jz4740-battery.c
>=20
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 5d91b5160b41..6ba602ed7979 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -417,17 +417,6 @@ config CHARGER_PCF50633
>  	help
>  	 Say Y to include support for NXP PCF50633 Main Battery Charger.
> =20
> -config BATTERY_JZ4740
> -	tristate "Ingenic JZ4740 battery"
> -	depends on MACH_JZ4740
> -	depends on MFD_JZ4740_ADC
> -	help
> -	  Say Y to enable support for the battery on Ingenic JZ4740 based
> -	  boards.
> -
> -	  This driver can be build as a module. If so, the module will be
> -	  called jz4740-battery.
> -
>  config BATTERY_RX51
>  	tristate "Nokia RX-51 (N900) battery driver"
>  	depends on TWL4030_MADC
> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
> index 96c2b74b36bf..6c7da920ea83 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -58,7 +58,6 @@ obj-$(CONFIG_BATTERY_S3C_ADC)	+=3D s3c_adc_battery.o
>  obj-$(CONFIG_BATTERY_TWL4030_MADC)	+=3D twl4030_madc_battery.o
>  obj-$(CONFIG_CHARGER_88PM860X)	+=3D 88pm860x_charger.o
>  obj-$(CONFIG_CHARGER_PCF50633)	+=3D pcf50633-charger.o
> -obj-$(CONFIG_BATTERY_JZ4740)	+=3D jz4740-battery.o
>  obj-$(CONFIG_BATTERY_RX51)	+=3D rx51_battery.o
>  obj-$(CONFIG_AB8500_BM)		+=3D ab8500_bmdata.o ab8500_charger.o ab8500_fg=
=2Eo ab8500_btemp.o abx500_chargalg.o pm2301_charger.o
>  obj-$(CONFIG_CHARGER_CPCAP)	+=3D cpcap-charger.o
> diff --git a/drivers/power/supply/jz4740-battery.c b/drivers/power/supply=
/jz4740-battery.c
> deleted file mode 100644
> index 6366bd61ea9f..000000000000
> --- a/drivers/power/supply/jz4740-battery.c
> +++ /dev/null
> @@ -1,421 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Battery measurement code for Ingenic JZ SOC.
> - *
> - * Copyright (C) 2009 Jiejing Zhang <kzjeef@gmail.com>
> - * Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
> - *
> - * based on tosa_battery.c
> - *
> - * Copyright (C) 2008 Marek Vasut <marek.vasut@gmail.com>
> - */
> -
> -#include <linux/interrupt.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/platform_device.h>
> -#include <linux/slab.h>
> -#include <linux/io.h>
> -
> -#include <linux/delay.h>
> -#include <linux/err.h>
> -#include <linux/gpio.h>
> -#include <linux/mfd/core.h>
> -#include <linux/power_supply.h>
> -
> -#include <linux/power/jz4740-battery.h>
> -#include <linux/jz4740-adc.h>
> -
> -struct jz_battery {
> -	struct jz_battery_platform_data *pdata;
> -	struct platform_device *pdev;
> -
> -	void __iomem *base;
> -
> -	int irq;
> -	int charge_irq;
> -
> -	const struct mfd_cell *cell;
> -
> -	int status;
> -	long voltage;
> -
> -	struct completion read_completion;
> -
> -	struct power_supply *battery;
> -	struct power_supply_desc battery_desc;
> -	struct delayed_work work;
> -
> -	struct mutex lock;
> -};
> -
> -static inline struct jz_battery *psy_to_jz_battery(struct power_supply *=
psy)
> -{
> -	return power_supply_get_drvdata(psy);
> -}
> -
> -static irqreturn_t jz_battery_irq_handler(int irq, void *devid)
> -{
> -	struct jz_battery *battery =3D devid;
> -
> -	complete(&battery->read_completion);
> -	return IRQ_HANDLED;
> -}
> -
> -static long jz_battery_read_voltage(struct jz_battery *battery)
> -{
> -	long t;
> -	unsigned long val;
> -	long voltage;
> -
> -	mutex_lock(&battery->lock);
> -
> -	reinit_completion(&battery->read_completion);
> -
> -	enable_irq(battery->irq);
> -	battery->cell->enable(battery->pdev);
> -
> -	t =3D wait_for_completion_interruptible_timeout(&battery->read_completi=
on,
> -		HZ);
> -
> -	if (t > 0) {
> -		val =3D readw(battery->base) & 0xfff;
> -
> -		if (battery->pdata->info.voltage_max_design <=3D 2500000)
> -			val =3D (val * 78125UL) >> 7UL;
> -		else
> -			val =3D ((val * 924375UL) >> 9UL) + 33000;
> -		voltage =3D (long)val;
> -	} else {
> -		voltage =3D t ? t : -ETIMEDOUT;
> -	}
> -
> -	battery->cell->disable(battery->pdev);
> -	disable_irq(battery->irq);
> -
> -	mutex_unlock(&battery->lock);
> -
> -	return voltage;
> -}
> -
> -static int jz_battery_get_capacity(struct power_supply *psy)
> -{
> -	struct jz_battery *jz_battery =3D psy_to_jz_battery(psy);
> -	struct power_supply_info *info =3D &jz_battery->pdata->info;
> -	long voltage;
> -	int ret;
> -	int voltage_span;
> -
> -	voltage =3D jz_battery_read_voltage(jz_battery);
> -
> -	if (voltage < 0)
> -		return voltage;
> -
> -	voltage_span =3D info->voltage_max_design - info->voltage_min_design;
> -	ret =3D ((voltage - info->voltage_min_design) * 100) / voltage_span;
> -
> -	if (ret > 100)
> -		ret =3D 100;
> -	else if (ret < 0)
> -		ret =3D 0;
> -
> -	return ret;
> -}
> -
> -static int jz_battery_get_property(struct power_supply *psy,
> -	enum power_supply_property psp, union power_supply_propval *val)
> -{
> -	struct jz_battery *jz_battery =3D psy_to_jz_battery(psy);
> -	struct power_supply_info *info =3D &jz_battery->pdata->info;
> -	long voltage;
> -
> -	switch (psp) {
> -	case POWER_SUPPLY_PROP_STATUS:
> -		val->intval =3D jz_battery->status;
> -		break;
> -	case POWER_SUPPLY_PROP_TECHNOLOGY:
> -		val->intval =3D jz_battery->pdata->info.technology;
> -		break;
> -	case POWER_SUPPLY_PROP_HEALTH:
> -		voltage =3D jz_battery_read_voltage(jz_battery);
> -		if (voltage < info->voltage_min_design)
> -			val->intval =3D POWER_SUPPLY_HEALTH_DEAD;
> -		else
> -			val->intval =3D POWER_SUPPLY_HEALTH_GOOD;
> -		break;
> -	case POWER_SUPPLY_PROP_CAPACITY:
> -		val->intval =3D jz_battery_get_capacity(psy);
> -		break;
> -	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> -		val->intval =3D jz_battery_read_voltage(jz_battery);
> -		if (val->intval < 0)
> -			return val->intval;
> -		break;
> -	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
> -		val->intval =3D info->voltage_max_design;
> -		break;
> -	case POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN:
> -		val->intval =3D info->voltage_min_design;
> -		break;
> -	case POWER_SUPPLY_PROP_PRESENT:
> -		val->intval =3D 1;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -	return 0;
> -}
> -
> -static void jz_battery_external_power_changed(struct power_supply *psy)
> -{
> -	struct jz_battery *jz_battery =3D psy_to_jz_battery(psy);
> -
> -	mod_delayed_work(system_wq, &jz_battery->work, 0);
> -}
> -
> -static irqreturn_t jz_battery_charge_irq(int irq, void *data)
> -{
> -	struct jz_battery *jz_battery =3D data;
> -
> -	mod_delayed_work(system_wq, &jz_battery->work, 0);
> -
> -	return IRQ_HANDLED;
> -}
> -
> -static void jz_battery_update(struct jz_battery *jz_battery)
> -{
> -	int status;
> -	long voltage;
> -	bool has_changed =3D false;
> -	int is_charging;
> -
> -	if (gpio_is_valid(jz_battery->pdata->gpio_charge)) {
> -		is_charging =3D gpio_get_value(jz_battery->pdata->gpio_charge);
> -		is_charging ^=3D jz_battery->pdata->gpio_charge_active_low;
> -		if (is_charging)
> -			status =3D POWER_SUPPLY_STATUS_CHARGING;
> -		else
> -			status =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
> -
> -		if (status !=3D jz_battery->status) {
> -			jz_battery->status =3D status;
> -			has_changed =3D true;
> -		}
> -	}
> -
> -	voltage =3D jz_battery_read_voltage(jz_battery);
> -	if (voltage >=3D 0 && abs(voltage - jz_battery->voltage) > 50000) {
> -		jz_battery->voltage =3D voltage;
> -		has_changed =3D true;
> -	}
> -
> -	if (has_changed)
> -		power_supply_changed(jz_battery->battery);
> -}
> -
> -static enum power_supply_property jz_battery_properties[] =3D {
> -	POWER_SUPPLY_PROP_STATUS,
> -	POWER_SUPPLY_PROP_TECHNOLOGY,
> -	POWER_SUPPLY_PROP_HEALTH,
> -	POWER_SUPPLY_PROP_CAPACITY,
> -	POWER_SUPPLY_PROP_VOLTAGE_NOW,
> -	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
> -	POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN,
> -	POWER_SUPPLY_PROP_PRESENT,
> -};
> -
> -static void jz_battery_work(struct work_struct *work)
> -{
> -	/* Too small interval will increase system workload */
> -	const int interval =3D HZ * 30;
> -	struct jz_battery *jz_battery =3D container_of(work, struct jz_battery,
> -					    work.work);
> -
> -	jz_battery_update(jz_battery);
> -	schedule_delayed_work(&jz_battery->work, interval);
> -}
> -
> -static int jz_battery_probe(struct platform_device *pdev)
> -{
> -	int ret =3D 0;
> -	struct jz_battery_platform_data *pdata =3D pdev->dev.parent->platform_d=
ata;
> -	struct power_supply_config psy_cfg =3D {};
> -	struct jz_battery *jz_battery;
> -	struct power_supply_desc *battery_desc;
> -	struct resource *mem;
> -
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "No platform_data supplied\n");
> -		return -ENXIO;
> -	}
> -
> -	jz_battery =3D devm_kzalloc(&pdev->dev, sizeof(*jz_battery), GFP_KERNEL=
);
> -	if (!jz_battery) {
> -		dev_err(&pdev->dev, "Failed to allocate driver structure\n");
> -		return -ENOMEM;
> -	}
> -
> -	jz_battery->cell =3D mfd_get_cell(pdev);
> -
> -	jz_battery->irq =3D platform_get_irq(pdev, 0);
> -	if (jz_battery->irq < 0) {
> -		dev_err(&pdev->dev, "Failed to get platform irq: %d\n", ret);
> -		return jz_battery->irq;
> -	}
> -
> -	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	jz_battery->base =3D devm_ioremap_resource(&pdev->dev, mem);
> -	if (IS_ERR(jz_battery->base))
> -		return PTR_ERR(jz_battery->base);
> -
> -	battery_desc =3D &jz_battery->battery_desc;
> -	battery_desc->name =3D pdata->info.name;
> -	battery_desc->type =3D POWER_SUPPLY_TYPE_BATTERY;
> -	battery_desc->properties	=3D jz_battery_properties;
> -	battery_desc->num_properties	=3D ARRAY_SIZE(jz_battery_properties);
> -	battery_desc->get_property	=3D jz_battery_get_property;
> -	battery_desc->external_power_changed =3D
> -					jz_battery_external_power_changed;
> -	battery_desc->use_for_apm	=3D 1;
> -
> -	psy_cfg.drv_data =3D jz_battery;
> -
> -	jz_battery->pdata =3D pdata;
> -	jz_battery->pdev =3D pdev;
> -
> -	init_completion(&jz_battery->read_completion);
> -	mutex_init(&jz_battery->lock);
> -
> -	INIT_DELAYED_WORK(&jz_battery->work, jz_battery_work);
> -
> -	ret =3D request_irq(jz_battery->irq, jz_battery_irq_handler, 0, pdev->n=
ame,
> -			jz_battery);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to request irq %d\n", ret);
> -		return ret;
> -	}
> -	disable_irq(jz_battery->irq);
> -
> -	if (gpio_is_valid(pdata->gpio_charge)) {
> -		ret =3D gpio_request(pdata->gpio_charge, dev_name(&pdev->dev));
> -		if (ret) {
> -			dev_err(&pdev->dev, "charger state gpio request failed.\n");
> -			goto err_free_irq;
> -		}
> -		ret =3D gpio_direction_input(pdata->gpio_charge);
> -		if (ret) {
> -			dev_err(&pdev->dev, "charger state gpio set direction failed.\n");
> -			goto err_free_gpio;
> -		}
> -
> -		jz_battery->charge_irq =3D gpio_to_irq(pdata->gpio_charge);
> -
> -		if (jz_battery->charge_irq >=3D 0) {
> -			ret =3D request_irq(jz_battery->charge_irq,
> -				    jz_battery_charge_irq,
> -				    IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
> -				    dev_name(&pdev->dev), jz_battery);
> -			if (ret) {
> -				dev_err(&pdev->dev, "Failed to request charge irq: %d\n", ret);
> -				goto err_free_gpio;
> -			}
> -		}
> -	} else {
> -		jz_battery->charge_irq =3D -1;
> -	}
> -
> -	if (jz_battery->pdata->info.voltage_max_design <=3D 2500000)
> -		jz4740_adc_set_config(pdev->dev.parent, JZ_ADC_CONFIG_BAT_MB,
> -			JZ_ADC_CONFIG_BAT_MB);
> -	else
> -		jz4740_adc_set_config(pdev->dev.parent, JZ_ADC_CONFIG_BAT_MB, 0);
> -
> -	jz_battery->battery =3D power_supply_register(&pdev->dev, battery_desc,
> -							&psy_cfg);
> -	if (IS_ERR(jz_battery->battery)) {
> -		dev_err(&pdev->dev, "power supply battery register failed.\n");
> -		ret =3D PTR_ERR(jz_battery->battery);
> -		goto err_free_charge_irq;
> -	}
> -
> -	platform_set_drvdata(pdev, jz_battery);
> -	schedule_delayed_work(&jz_battery->work, 0);
> -
> -	return 0;
> -
> -err_free_charge_irq:
> -	if (jz_battery->charge_irq >=3D 0)
> -		free_irq(jz_battery->charge_irq, jz_battery);
> -err_free_gpio:
> -	if (gpio_is_valid(pdata->gpio_charge))
> -		gpio_free(jz_battery->pdata->gpio_charge);
> -err_free_irq:
> -	free_irq(jz_battery->irq, jz_battery);
> -	return ret;
> -}
> -
> -static int jz_battery_remove(struct platform_device *pdev)
> -{
> -	struct jz_battery *jz_battery =3D platform_get_drvdata(pdev);
> -
> -	cancel_delayed_work_sync(&jz_battery->work);
> -
> -	if (gpio_is_valid(jz_battery->pdata->gpio_charge)) {
> -		if (jz_battery->charge_irq >=3D 0)
> -			free_irq(jz_battery->charge_irq, jz_battery);
> -		gpio_free(jz_battery->pdata->gpio_charge);
> -	}
> -
> -	power_supply_unregister(jz_battery->battery);
> -
> -	free_irq(jz_battery->irq, jz_battery);
> -
> -	return 0;
> -}
> -
> -#ifdef CONFIG_PM
> -static int jz_battery_suspend(struct device *dev)
> -{
> -	struct jz_battery *jz_battery =3D dev_get_drvdata(dev);
> -
> -	cancel_delayed_work_sync(&jz_battery->work);
> -	jz_battery->status =3D POWER_SUPPLY_STATUS_UNKNOWN;
> -
> -	return 0;
> -}
> -
> -static int jz_battery_resume(struct device *dev)
> -{
> -	struct jz_battery *jz_battery =3D dev_get_drvdata(dev);
> -
> -	schedule_delayed_work(&jz_battery->work, 0);
> -
> -	return 0;
> -}
> -
> -static const struct dev_pm_ops jz_battery_pm_ops =3D {
> -	.suspend	=3D jz_battery_suspend,
> -	.resume		=3D jz_battery_resume,
> -};
> -
> -#define JZ_BATTERY_PM_OPS (&jz_battery_pm_ops)
> -#else
> -#define JZ_BATTERY_PM_OPS NULL
> -#endif
> -
> -static struct platform_driver jz_battery_driver =3D {
> -	.probe		=3D jz_battery_probe,
> -	.remove		=3D jz_battery_remove,
> -	.driver =3D {
> -		.name =3D "jz4740-battery",
> -		.pm =3D JZ_BATTERY_PM_OPS,
> -	},
> -};
> -
> -module_platform_driver(jz_battery_driver);
> -
> -MODULE_ALIAS("platform:jz4740-battery");
> -MODULE_LICENSE("GPL");
> -MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
> -MODULE_DESCRIPTION("JZ4740 SoC battery driver");
> --=20
> 2.21.0.593.g511ec345e18
>=20

--btulm44pv4u75rxi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0+0mIACgkQ2O7X88g7
+poTBBAAm3HXpzJfr/9M3YzpNPzpEo0JkdKqEy/Mzv3chuI5K2vq/tQUkuR8aG7M
9p8dMGYQngDJf6zQz1VHHna0k71yNcRKABamjJ9n0H3S5VT46gVSY+eVxgeGO9tN
BfqD57iQf+ou0Tvaln/ZWQbNTdvoMQtZ5U5C6jhFgc7o+vWmtkUQsj8MsRUbE6ZZ
78A1bz9uIo0yTEXAFNMmapNjvqTvtVILBiwmBtLhLpw8Fyvqpn1KJnPTWSNJ1wq1
MljMrc59Qct0dchaKZAmsfLr94EF4LAxeKLouZyOceV5ZJRLKX3wrJi61OXgZl/I
ghSAbNVT46X87TFmNfn9ZY0gSZYDzsop8Qyu2s7+Rd3/04afnH+TcF4mOQL78QRJ
UoGaet5RaWnA9627P8dXBNFquc7KcmF4jxPTY7rc0g1P6X9X2JBcu17DWi+3isEl
BAAt6MH/tsCMiEtbz73F4eecLloCk+raEcMbbKNkx/BtURpl8a12Bxh/+VkfS6ml
0N4n1CmxQvaaF4jrZ6a9+wKgLYynHGYe8jsghVrKvx2N+9AiSIAm74dKo7W9wAGI
hwjd73eTKd6ocj98cdu5ij7Ef5XP36nljA9461O2tguqGRyItzbX3RzF0OYVwKKm
3USXMUcJqU4RKI1QVBG/S8It3pnOyRCdmLLGzM3e2x6X8PltRJ4=
=+sJI
-----END PGP SIGNATURE-----

--btulm44pv4u75rxi--

--===============1555314437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1555314437==--
