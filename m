Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9FD4AF4E0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58A610E1DB;
	Wed,  9 Feb 2022 15:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED5310E1DB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644419617; x=1675955617;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WnHoOKI6ZskCpbFPWhjafUby+06+1OCHKz8FEZmNV68=;
 b=cidU9pyTkaqA05u3/bLd/QGWh0dDM9E7CqECfwSFRbzTO49TsjS0kmjZ
 VG4BAJnR7kbqlwBHa/r5hv1Ed07smgDezXmaAsFlPJMsvZ2HwqMPfXuNv
 QYwOfK/N7fw4/qAM7GpL+TX5DPs27ivR2oYHAa35AwYjKn5agrVqRYMlk
 2oIinjjzvx82764lpRRnW+FIEqBrzM8Umegp+4Rp3gGO+7XVM9wVxBAYa
 lUTn+DKMS7YChk6KKdIxvAUCuG3ZfE+lD4xbR2dBhOZAfJcYwWu87ViqT
 gt6mT5p/Xy7MP9y2RulEE+LD0NtX2DfGRwkh/LZ7OBNj7Lyh8/4d1CgkK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="246807108"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="246807108"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:13:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="568264164"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:13:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nHodx-002eU1-Ox; Wed, 09 Feb 2022 17:12:29 +0200
Date: Wed, 9 Feb 2022 17:12:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
Message-ID: <YgPZ3W0e7N7JQ1dT@smile.fi.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209090314.2511959-4-javierm@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 10:03:10AM +0100, Javier Martinez Canillas wrote:
> This adds a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
> OLED display controllers.
> 
> It's only the core part of the driver and a bus specific driver is needed
> for each transport interface supported by the display controllers.

Thank you for the update, my comments below.

...

>  source "drivers/gpu/drm/sprd/Kconfig"
>  
> +source "drivers/gpu/drm/solomon/Kconfig"

'o' before 'p' ?

...

>  obj-$(CONFIG_DRM_SPRD) += sprd/
> +obj-y			+= solomon/

Ditto ?

...

> +/*
> + * DRM driver for Solomon SSD130X OLED displays

Solomon SSD130x (with lower letter it's easy to read and realize that it's
not a model name).

> + * Copyright 2022 Red Hat Inc.
> + * Authors: Javier Martinez Canillas <javierm@redhat.com>
> + *
> + * Based on drivers/video/fbdev/ssd1307fb.c
> + * Copyright 2012 Free Electrons
> + */

> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/property.h>
> +#include <linux/pwm.h>
> +#include <linux/regulator/consumer.h>

...

> +#define DRIVER_NAME	"ssd130x"
> +#define DRIVER_DESC	"DRM driver for Solomon SSD130X OLED displays"
> +#define DRIVER_DATE	"20220131"
> +#define DRIVER_MAJOR	1
> +#define DRIVER_MINOR	0

Not sure it has a value when being defined. Only one string is reused and even
if hard coded twice linker will optimize it.

...

> +/*
> + * Helper to write command (SSD130X_COMMAND). The fist variadic argument
> + * is the command to write and the following are the command options.
> + */
> +static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
> +				    /* u8 cmd, u8 option, ... */...)
> +{
> +	va_list ap;
> +	u8 value;
> +	int ret;
> +
> +	va_start(ap, count);
> +
> +	do {
> +		value = va_arg(ap, int);
> +		ret = regmap_write(ssd130x->regmap, SSD130X_COMMAND, (u8)value);
> +		if (ret)
> +			goto out_end;
> +	} while (--count);
> +
> +out_end:
> +	va_end(ap);
> +
> +	return ret;

Can bulk operation be used in the callers instead?

I have noticed that all of the callers are using
- 1 -- makes no sense at all, can be replaced with regmap_write()
- 2
- 3

Can be helpers for two and three arguments, with use of bulk call.

What do you think?

> +}

...

> +static void ssd130x_reset(struct ssd130x_device *ssd130x)
> +{
> +	/* Reset the screen */
> +	gpiod_set_value_cansleep(ssd130x->reset, 1);
> +	udelay(4);
> +	gpiod_set_value_cansleep(ssd130x->reset, 0);
> +	udelay(4);

I don't remember if reset pin is mandatory. fbtft does

	if (!gpiod->reset)
		return;

	...do reset...

> +}

...

> +	if (ssd130x->reset)

A-ha, why not in the callee?

> +		ssd130x_reset(ssd130x);

...

> +	/* Set COM direction */
> +	com_invdir = 0xc0 | ssd130x->com_invdir << 3;

Can 0xc0 and 3 be GENMASK()'ed and defined?

...

> +	/* Set clock frequency */
> +	dclk = ((ssd130x->dclk_div - 1) & 0xf) | (ssd130x->dclk_frq & 0xf) << 4;

GENMASK() ?

...

> +		u32 mode = ((ssd130x->area_color_enable ? 0x30 : 0) |
> +			    (ssd130x->low_power ? 5 : 0));

With if's it will look better.

		u32 mode = 0;

		if (ssd130x->area_color_enable)
			mode |= 0x30;
		if (ssd130x->low_power)
			mode |= 5;

...

> +	/* Turn on the DC-DC Charge Pump */
> +	chargepump = BIT(4) | (ssd130x->device_info->need_chargepump ? BIT(2) : 0);

Ditto.

...

> +		for (i = 0; i < ARRAY_SIZE(ssd130x->lookup_table); ++i) {

i++ should work as well.

> +			u8 val = ssd130x->lookup_table[i];
> +
> +			if (val < 31 || val > 63)
> +				dev_warn(ssd130x->dev,
> +					 "lookup table index %d value out of range 31 <= %d <= 63\n",
> +					 i, val);
> +			ret = ssd130x_write_cmd(ssd130x, 1, val);
> +			if (ret < 0)
> +				return ret;
> +		}

...

> +	u8 *buf = NULL;

> +

Redundant blank line, not sure if checkpatch catches this.

> +	struct drm_rect fullscreen = {
> +		.x1 = 0,
> +		.x2 = ssd130x->width,
> +		.y1 = 0,
> +		.y2 = ssd130x->height,
> +	};

...

> +power_off:

out_power_off: ?

...

> +		ret = PTR_ERR(ssd130x->vbat_reg);
> +		if (ret == -ENODEV)
> +			ssd130x->vbat_reg = NULL;
> +		else
> +			return dev_err_probe(dev, ret, "Failed to get VBAT regulator\n");

Can it be

		ret = PTR_ERR(ssd130x->vbat_reg);
		if (ret != -ENODEV)
			return dev_err_probe(dev, ret, "Failed to get VBAT regulator\n");

		ssd130x->vbat_reg = NULL;

?

...

> +	ssd130x = devm_drm_dev_alloc(dev, &ssd130x_drm_driver,
> +				     struct ssd130x_device, drm);
> +	if (IS_ERR(ssd130x)) {

> +		dev_err(dev, "Failed to allocate DRM device: %d\n", ret);
> +		return ssd130x;

return dev_err_probe() ?

> +	}

...

> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
> +					    &ssd130xfb_bl_ops, NULL);
> +	if (IS_ERR(bl)) {
> +		ret = PTR_ERR(bl);
> +		dev_err(dev, "Unable to register backlight device: %d\n", ret);
> +		return ERR_PTR(ret);

Ditto.

> +	}

...

> +	ret = drm_dev_register(drm, 0);
> +	if (ret) {
> +		dev_err(dev, "DRM device register failed: %d\n", ret);
> +		return ERR_PTR(ret);

Ditto.

> +	}

...

I have feelings that half of my comments were ignored...
Maybe I missed the discussion(s).


-- 
With Best Regards,
Andy Shevchenko


