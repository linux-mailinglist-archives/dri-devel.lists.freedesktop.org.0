Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A747C4B29E0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 17:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A5510EAA2;
	Fri, 11 Feb 2022 16:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF6110E361
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644596055; x=1676132055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2sObmrIIJ6u7JgxEqMuhXgNJQeFbV1/jHHnxLE325BM=;
 b=Ho2Z1vLaSXw9C3ZYUNKHXqJ949xAeGMTE5ncjC6IO5sRzALyGeeNaGBa
 9M8FL6SQmLdhRgLXrg8LSrWh7jlrcbMMBlpppKiSmEBQmI8eIBvDTL4PG
 jkrGDS35uv1yF8Me5sfSd9GTC/MvJQwD5I0QFH6WgqcDFrSxpYFhHBSLU
 hpNXwzhWn5Ylim4qjpNHfCMkRl4HRlu0W40f48seWA40EkZPmrv85ttKR
 7+NsFcznypY5cG2plQar28tFA5zytFpsSIrWYqzG/9jxtwRsrdp1PEG/W
 71crS0SqP11Jedr3xCbjyYR1/r6ZZv/PgJoHZ7m984VBWAJTOeybg+axd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="233311251"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="233311251"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 08:14:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="483479902"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 08:14:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nIYXo-003V6e-FM; Fri, 11 Feb 2022 18:13:12 +0200
Date: Fri, 11 Feb 2022 18:13:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v5 3/6] drm: Add driver for Solomon SSD130x OLED displays
Message-ID: <YgaLGDVscXlANxcZ@smile.fi.intel.com>
References: <20220211143358.3112958-1-javierm@redhat.com>
 <20220211143358.3112958-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211143358.3112958-4-javierm@redhat.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 03:33:55PM +0100, Javier Martinez Canillas wrote:
> This adds a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
> OLED display controllers.
> 
> It's only the core part of the driver and a bus specific driver is needed
> for each transport interface supported by the display controllers.

...

> +#define SSD130X_SET_CLOCK_DIV_MASK		GENMASK(3, 0)
> +#define SSD130X_SET_CLOCK_DIV_SET(val)		FIELD_PREP(SSD130X_SET_CLOCK_DIV_MASK, (val))
> +#define SSD130X_SET_CLOCK_FREQ_MASK		GENMASK(7, 4)
> +#define SSD130X_SET_CLOCK_FREQ_SET(val)		FIELD_PREP(SSD130X_SET_CLOCK_FREQ_MASK, (val))
> +#define SSD130X_SET_PRECHARGE_PERIOD1_MASK	GENMASK(3, 0)
> +#define SSD130X_SET_PRECHARGE_PERIOD1_SET(val)	FIELD_PREP(SSD130X_SET_PRECHARGE_PERIOD1_MASK, (val))
> +#define SSD130X_SET_PRECHARGE_PERIOD2_MASK	GENMASK(7, 4)
> +#define SSD130X_SET_PRECHARGE_PERIOD2_SET(val)	FIELD_PREP(SSD130X_SET_PRECHARGE_PERIOD2_MASK, (val))

> +#define SSD130X_SET_COM_PINS_CONFIG1_MASK	GENMASK(4, 4)

BIT(4)

> +#define SSD130X_SET_COM_PINS_CONFIG1_SET(val)	FIELD_PREP(SSD130X_SET_COM_PINS_CONFIG1_MASK, (!val))
> +#define SSD130X_SET_COM_PINS_CONFIG2_MASK	GENMASK(5, 5)

BIT(5)

> +#define SSD130X_SET_COM_PINS_CONFIG2_SET(val)	FIELD_PREP(SSD130X_SET_COM_PINS_CONFIG2_MASK, (val))

I would put GENMASK() directly into FIELD(), but it's up to you
(and I haven't checked the use of *_MASK anyway).


...

> +static int ssd130x_write_data(struct ssd130x_device *ssd130x, u8 *values, int count)
> +{
> +	int ret;
> +
> +	ret = regmap_bulk_write(ssd130x->regmap, SSD130X_DATA, values, count);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

return regmap_bulk_write(...);

> +}

...

> +/*
> + * Helper to write command (SSD130X_COMMAND). The fist variadic argument
> + * is the command to write and the following are the command options.
> + *
> + * Note that the ssd130x protocol requires each command and option to be
> + * written as a SSD130X_COMMAND device register value. That is why a call
> + * to regmap_write(..., SSD130X_COMMAND, ...) is done for each argument.
> + */

Thanks!

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

Wondering if you really need this casting. value is u8 by definition.

> +		if (ret)
> +			goto out_end;
> +	} while (--count);
> +
> +out_end:
> +	va_end(ap);
> +
> +	return ret;
> +}

...

> +	ssd130x = devm_drm_dev_alloc(dev, &ssd130x_drm_driver,
> +				     struct ssd130x_device, drm);
> +	if (IS_ERR(ssd130x)) {

> +		dev_err_probe(dev, PTR_ERR(ssd130x),
> +			      "Failed to allocate DRM device\n");
> +		return ssd130x;

This...

> +	}

...

> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
> +					    &ssd130xfb_bl_ops, NULL);
> +	if (IS_ERR(bl))
> +		return ERR_PTR(dev_err_probe(dev, PTR_ERR(bl),
> +					     "Unable to register backlight device\n"));

Can be consistent with this then.

-- 
With Best Regards,
Andy Shevchenko


