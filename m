Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AD44AF5D2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9151F10E140;
	Wed,  9 Feb 2022 15:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9769810E140
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644422053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NtqH0xaWq+3l32cscdAy7mIdMW7E2NuYONnZUKRcir0=;
 b=XemxFjWAGZ17XF353xq/1TYMfBiDPmts2jwJXcwotlp/s7OS81cjRUBbkAhYN677RV2/k/
 ildemYmVVfxDKzrh372G/TIum8OnygL3x5HEQsG9cB3GYCtI81meYhWHlvo4NlxH26z2aI
 rMokpdZjU7pOizXxSpPsba4I+H6uOK8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-FiLHAmOHMBSW8_JK6QWJHQ-1; Wed, 09 Feb 2022 10:54:05 -0500
X-MC-Unique: FiLHAmOHMBSW8_JK6QWJHQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 w26-20020adf8bda000000b001e33dbc525cso1244629wra.18
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 07:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NtqH0xaWq+3l32cscdAy7mIdMW7E2NuYONnZUKRcir0=;
 b=mqChjXPudo5aMqKINtd7PlgF9D/k/0qeKHS5zCuUGWXxco36N7y2jQkj7AaGtfmkYh
 0fC//0sGNOXdcvy2bmSvM9xTPS+rZF39HuidYpPiRfUPLX8wj/hrLEaAOa72FMxSA4TW
 4YjmS1XtcrXfjbWNzmX+YjLtYh5RgLiBxK9awg1c/U3dancbxaQa26WRmjbv+Q8gfTAD
 02FsYVsAkStUttzTR3zP9U7SR3zM4AQrvAdR88+tTB/eCRHV3jigJjTzT/VrrjPMMojz
 oJ9AeXzguJeXMDUWr18c8fB5X/6bXTiSA9Eln5iX+1J1ap5vtJSK+W8XeMoXbyT6ywQB
 7Sjg==
X-Gm-Message-State: AOAM533Pl+N0pjUYMafpLzwoJLZnXMe5s0F5aiFp/WMibKDS/+4tF8sk
 nrG4RTtp39EMjlieMpAKRsBD6VR78SPtN2OFl1Sb2vkyBxctx8zsDcGmMBsY5NNJMkJ8COO7Mql
 QzTknRFy/xZucDt463Z66Bp359AOC
X-Received: by 2002:a5d:5052:: with SMTP id h18mr2514616wrt.589.1644422043936; 
 Wed, 09 Feb 2022 07:54:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy750xCBUNUT8acyK0Kr4KBhlDeP6lCING9wODeSrTZT0Xpfk1tiDcdfRqqZCkX+LTBGrpzDg==
X-Received: by 2002:a5d:5052:: with SMTP id h18mr2514593wrt.589.1644422043673; 
 Wed, 09 Feb 2022 07:54:03 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id i6sm17583376wry.33.2022.02.09.07.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 07:54:03 -0800 (PST)
Message-ID: <e29eaccc-863a-21d4-e669-0b708604d723@redhat.com>
Date: Wed, 9 Feb 2022 16:54:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPZ3W0e7N7JQ1dT@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPZ3W0e7N7JQ1dT@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andy,

Thanks for your feedback.

On 2/9/22 16:12, Andy Shevchenko wrote:
> On Wed, Feb 09, 2022 at 10:03:10AM +0100, Javier Martinez Canillas wrote:
>> This adds a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
>> OLED display controllers.
>>
>> It's only the core part of the driver and a bus specific driver is needed
>> for each transport interface supported by the display controllers.
> 
> Thank you for the update, my comments below.
> 
> ...
> 
>>  source "drivers/gpu/drm/sprd/Kconfig"
>>  
>> +source "drivers/gpu/drm/solomon/Kconfig"
>
> 'o' before 'p' ?
>

The Kconfig was not sorted alphabetically so I just added it at
the end. Same for the Makefile. But I will change it in v4 just
to not keep adding unsorted entries.

[snip]

>> +/*
>> + * DRM driver for Solomon SSD130X OLED displays
> 
> Solomon SSD130x (with lower letter it's easy to read and realize that it's
> not a model name).
>

Ok.
 
>> + * Copyright 2022 Red Hat Inc.
>> + * Authors: Javier Martinez Canillas <javierm@redhat.com>
>> + *
>> + * Based on drivers/video/fbdev/ssd1307fb.c
>> + * Copyright 2012 Free Electrons
>> + */
> 
>> +#include <linux/backlight.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/property.h>
>> +#include <linux/pwm.h>
>> +#include <linux/regulator/consumer.h>
> 
> ...
> 
>> +#define DRIVER_NAME	"ssd130x"
>> +#define DRIVER_DESC	"DRM driver for Solomon SSD130X OLED displays"
>> +#define DRIVER_DATE	"20220131"
>> +#define DRIVER_MAJOR	1
>> +#define DRIVER_MINOR	0
> 
> Not sure it has a value when being defined. Only one string is reused and even
> if hard coded twice linker will optimize it.
>

I like to have all this at the beginning, it makes easier to read IMO.

[snip]

>> +
>> +	do {
>> +		value = va_arg(ap, int);
>> +		ret = regmap_write(ssd130x->regmap, SSD130X_COMMAND, (u8)value);
>> +		if (ret)
>> +			goto out_end;
>> +	} while (--count);
>> +
>> +out_end:
>> +	va_end(ap);
>> +
>> +	return ret;
> 
> Can bulk operation be used in the callers instead?
>

I'm using bulk writes for the data but not for the commands. Because I
tried to do that before and didn't work. But I'll give it a try again
now that I switched to regmap. Maybe it was some mistake on my end.
 
> I have noticed that all of the callers are using
> - 1 -- makes no sense at all, can be replaced with regmap_write()

Yes, I just used for consistency. That way all the places sending a
command would use the same function call.

> - 2
> - 3
> 
> Can be helpers for two and three arguments, with use of bulk call.
> 
> What do you think?
> 

Agreed, as mentioned I'll give it a try to sending all the data as a
bulk write with regmap.

>> +}
> 
> ...
> 
>> +static void ssd130x_reset(struct ssd130x_device *ssd130x)
>> +{
>> +	/* Reset the screen */
>> +	gpiod_set_value_cansleep(ssd130x->reset, 1);
>> +	udelay(4);
>> +	gpiod_set_value_cansleep(ssd130x->reset, 0);
>> +	udelay(4);
> 
> I don't remember if reset pin is mandatory. fbtft does
> 
> 	if (!gpiod->reset)
> 		return;
> 
> 	...do reset...
> 
>> +}
> 
> ...
> 
>> +	if (ssd130x->reset)
> 
> A-ha, why not in the callee?
>

I think is easier to read when doing it in the caller, specially since there
is only a single call. Than calling it unconditionally and making it a no-op
if there isn't a reset GPIO.

>> +		ssd130x_reset(ssd130x);
> 
> ...
> 
>> +	/* Set COM direction */
>> +	com_invdir = 0xc0 | ssd130x->com_invdir << 3;
> 
> Can 0xc0 and 3 be GENMASK()'ed and defined?
>

Ok.
 
> ...
> 
>> +	/* Set clock frequency */
>> +	dclk = ((ssd130x->dclk_div - 1) & 0xf) | (ssd130x->dclk_frq & 0xf) << 4;
> 
> GENMASK() ?
>

Ok.
 
> ...
> 
>> +		u32 mode = ((ssd130x->area_color_enable ? 0x30 : 0) |
>> +			    (ssd130x->low_power ? 5 : 0));
> 
> With if's it will look better.
> 
> 		u32 mode = 0;
> 
> 		if (ssd130x->area_color_enable)
> 			mode |= 0x30;
> 		if (ssd130x->low_power)
> 			mode |= 5;
>

Sure.
 
> ...
> 
>> +	/* Turn on the DC-DC Charge Pump */
>> +	chargepump = BIT(4) | (ssd130x->device_info->need_chargepump ? BIT(2) : 0);
> 
> Ditto.
>

Ok.
 
> ...
> 
>> +		for (i = 0; i < ARRAY_SIZE(ssd130x->lookup_table); ++i) {
> 
> i++ should work as well.
>

Yeah.
 
>> +			u8 val = ssd130x->lookup_table[i];
>> +
>> +			if (val < 31 || val > 63)
>> +				dev_warn(ssd130x->dev,
>> +					 "lookup table index %d value out of range 31 <= %d <= 63\n",
>> +					 i, val);
>> +			ret = ssd130x_write_cmd(ssd130x, 1, val);
>> +			if (ret < 0)
>> +				return ret;
>> +		}
> 
> ...
> 
>> +	u8 *buf = NULL;
>
>> +
>
> Redundant blank line, not sure if checkpatch catches this.
>

Agreed.
 
>> +	struct drm_rect fullscreen = {
>> +		.x1 = 0,
>> +		.x2 = ssd130x->width,
>> +		.y1 = 0,
>> +		.y2 = ssd130x->height,
>> +	};
> 
> ...
> 
>> +power_off:
> 
> out_power_off: ?
>

Ok.
 
> ...
> 
>> +		ret = PTR_ERR(ssd130x->vbat_reg);
>> +		if (ret == -ENODEV)
>> +			ssd130x->vbat_reg = NULL;
>> +		else
>> +			return dev_err_probe(dev, ret, "Failed to get VBAT regulator\n");
> 
> Can it be
> 
> 		ret = PTR_ERR(ssd130x->vbat_reg);
> 		if (ret != -ENODEV)
> 			return dev_err_probe(dev, ret, "Failed to get VBAT regulator\n");
> 
> 		ssd130x->vbat_reg = NULL;
>
> ?
> 

Mark mentioned that the regulator shouldn't really be optional.
So half of this part is going away.

> ...
> 
>> +	ssd130x = devm_drm_dev_alloc(dev, &ssd130x_drm_driver,
>> +				     struct ssd130x_device, drm);
>> +	if (IS_ERR(ssd130x)) {
> 
>> +		dev_err(dev, "Failed to allocate DRM device: %d\n", ret);
>> +		return ssd130x;
> 
> return dev_err_probe() ?
>

No, because this isn't a resource provided by other driver. If this
failed is mostly due a memory allocation error.
 
>> +	}
> 
> ...
> 
>> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
>> +					    &ssd130xfb_bl_ops, NULL);
>> +	if (IS_ERR(bl)) {
>> +		ret = PTR_ERR(bl);
>> +		dev_err(dev, "Unable to register backlight device: %d\n", ret);
>> +		return ERR_PTR(ret);
> 
> Ditto.
>

Same. This is an error and not a reason to defer the probe.

>> +	}
> 
> ...
> 
>> +	ret = drm_dev_register(drm, 0);
>> +	if (ret) {
>> +		dev_err(dev, "DRM device register failed: %d\n", ret);
>> +		return ERR_PTR(ret);
> 
> Ditto.
>

And same.
 
>> +	}
> 
> ...
> 
> I have feelings that half of my comments were ignored...
> Maybe I missed the discussion(s).
> 

I assure you that no comments from you or anyone were ignored.

I may had missed something but if if I did was a mistake and
not intentionally. I keep a changelog for each revision in
the patches with the name of the reviewer so people can check
and compare.

If something that you mentioned is not there, I apologize and
please point me out so I can address it in v4.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

