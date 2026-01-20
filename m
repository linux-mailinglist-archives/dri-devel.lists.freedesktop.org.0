Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0604BD3C3C0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 10:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DF810E595;
	Tue, 20 Jan 2026 09:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="LFbLFT7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E96F10E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 09:38:44 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so39873395e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 01:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768901922; x=1769506722;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JPcPIZUGx04qHWK759PItSENS0mcgGK/1dry0pxcZSU=;
 b=LFbLFT7wYyJjfDjNoFRdbqicGJtpYPbE25GiRtSGoSFRlC6DSgX4N5+PhZlEWuSlOa
 0I5hZmgRnpwBFFei01gVQz4M+dG+U55Xn+HivXX8lNacMRdnfgJby7yp7eUb+Gh3WJet
 Bozlxn4QSwfK9UvujzDUSA9nbH+B+fWNX6s+LfhthL8m5DzM8GESbxwZR2oNUMcx26Y4
 CXKhqh1MTejn+TW7mSrCpDRfwNSHW6WWmbQ6dw4vrArTcyCqKsr51xg/Yc1unUqmFIK2
 2WpBI8lvOtwW1fuBchcIxisAnH+5DTgPw6W3JTW8VTkfks5POMqoT/8PyVHACYLKvtNr
 vzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768901922; x=1769506722;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPcPIZUGx04qHWK759PItSENS0mcgGK/1dry0pxcZSU=;
 b=E2y4s9wxkt4MbO9V0z5X4tKJbFjR8CU3aiWtEbTY7x+zMfTjf/qmMqA5KlQVLKdDns
 yAaxbwuJ1ibWqhVx3yZPVDXz5eIOnmY2egzCndcqr+t3E8+canompTr/mqLwe+Cu5SZQ
 qkEGsOdrnn9j+WdWJNS/9AOGamrB70q3TUL5ATgLL3+k+riAKH+tHJIgOKgamBzWtF/+
 jOXk1bJN1DGaPf1VH7+FfJd22QYGEkFksHr7eN/gGXUKdnmxk1fAQrEWRJIujWgssN4E
 BzNGNOeWgvl4fOIrMl5dWtqd9voeJGQ5OkI0es1uXMn+s+cdYtH6UZusHmCl4XCQ5mG1
 XRVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfSnhJyBAxgDxBrE9Bc2Walv/DL7QB7gYoDnKEM/gmQSN9rpvR7Pm7rXiCf4q9ot85xUML7uEhopk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhNQvhgYUdN/pwh/mERzZ5F4XuQX4cT9Gant9RF2OP/98IUSm2
 vR+V32e6CxXx3S+/jnYM3ZGWGRCZ87uksHqi0KatLLkVa/d8paQ8YxO4vJyt87aAT7c=
X-Gm-Gg: AY/fxX4n0bPJ2RPAQ+8983rxWbWBX/qLAhDjgf012Q1nlBweeVF84RZCEUmTMLTWO28
 SVhzComCQ17ocOoES097qoXUIapHApFXPMimAQw6/3eyjucy6QQ0f14NZULccqi3Fx7HOriIPPa
 uZkmnkQpWv4YQJuT8tuOP7PwB+lDKiCA/+SsyZunbHFvKpHh8uFeOHG33D16TvtuPQewSaDyvwe
 FAMpUM0nM1fidSupH/IDFEEmBByHDQJhEHM7GnVwAnT/fRN7p1ByB4WaZNiMVnKECBYo6fHjn6l
 mqxEljFLYGDSIo7Q+xrr1sVdqM9x/fjW+XUgEeaUt3zCuhqQDPCksRcDerwZcteuYmir6t+6h5W
 xFTJJ7Y7TfvtTbE/rODLZKFx605l7lnMeCiod2eLLa22Nu+jQ9hDXnId9ltNVqU8AEHmGgDwKSj
 3NRWENdYatxpXN6Pv0VnVkgtjzrww8RpbPdwuTkSunN795kAs7xnQrrfYNybzibZpudyQfBKVZN
 WWrE/vs22MC97p6gBzljvj31UaTGVoaxnqziK1h5nTRL2z4KLFrWs0PWBZ+ObyA88x7coDf
X-Received: by 2002:a05:600c:1d14:b0:47d:4fbe:e6cc with SMTP id
 5b1f17b1804b1-4803e7a39damr16391835e9.13.1768901922024; 
 Tue, 20 Jan 2026 01:38:42 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4b267661sm298932175e9.13.2026.01.20.01.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 01:38:41 -0800 (PST)
Date: Tue, 20 Jan 2026 09:38:39 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: tessolveupstream@gmail.com
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] backlight: gpio: add support for multiple GPIOs
 for backlight control
Message-ID: <aW9NH5GTwSR-m7VQ@aspen.lan>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-3-tessolveupstream@gmail.com>
 <aVuN7zVUWJ1qsVh8@aspen.lan>
 <1fedb7d7-3a30-4f0f-961f-09613f2a95d0@gmail.com>
 <aWe-QA_grqNwnE4n@aspen.lan>
 <ec7b7af7-1343-4988-b783-9ce9b045c8ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec7b7af7-1343-4988-b783-9ce9b045c8ae@gmail.com>
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

On Tue, Jan 20, 2026 at 10:22:02AM +0530, tessolveupstream@gmail.com wrote:
>
>
> On 14-01-2026 21:33, Daniel Thompson wrote:
> > On Tue, Jan 13, 2026 at 12:47:26PM +0530, tessolveupstream@gmail.com wrote:
> >>
> >>
> >> On 05-01-2026 15:39, Daniel Thompson wrote:
> >>> On Mon, Jan 05, 2026 at 02:21:20PM +0530, Sudarshan Shetty wrote:
> >>>> Extend the gpio-backlight driver to handle multiple GPIOs instead of a
> >>>> single one. This allows panels that require driving several enable pins
> >>>> to be controlled by the backlight framework.
> >>>>
> >>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >>>> ---
> >>>>  drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
> >>>>  1 file changed, 45 insertions(+), 16 deletions(-)
> >>>>
> >>>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> >>>> index 728a546904b0..037e1c111e48 100644
> >>>> --- a/drivers/video/backlight/gpio_backlight.c
> >>>> +++ b/drivers/video/backlight/gpio_backlight.c
> >>>> @@ -17,14 +17,18 @@
> >>>>
> >>>>  struct gpio_backlight {
> >>>>  	struct device *dev;
> >>>> -	struct gpio_desc *gpiod;
> >>>> +	struct gpio_desc **gpiods;
> >>>> +	unsigned int num_gpios;
> >>>
> >>> Why not use struct gpio_descs for this?
> >>>
> >>> Once you do that, then most of the gbl->num_gpios loops can be replaced with
> >>> calls to the array based accessors.
> >>>
> >>
> >> Based on your feedback, I have updated the implementation to use
> >> struct gpio_descs and array-based accessors, as recommended like
> >> below:
> >>
> >> git diff drivers/video/backlight/gpio_backlight.c
> >> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> >> index 037e1c111e48..e99d7a9dc670 100644
> >> --- a/drivers/video/backlight/gpio_backlight.c
> >> +++ b/drivers/video/backlight/gpio_backlight.c
> >> @@ -14,22 +14,37 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/property.h>
> >>  #include <linux/slab.h>
> >> +#include <linux/bitmap.h>
> >>
> >>  struct gpio_backlight {
> >>         struct device *dev;
> >> -       struct gpio_desc **gpiods;
> >> +       struct gpio_descs *gpiods;
> >>         unsigned int num_gpios;
> >>  };
> >>
> >>  static int gpio_backlight_update_status(struct backlight_device *bl)
> >>  {
> >>         struct gpio_backlight *gbl = bl_get_data(bl);
> >> -       unsigned int i;
> >> +       unsigned int n = gbl->num_gpios;
> >>         int br = backlight_get_brightness(bl);
> >> +       unsigned long *value_bitmap;
> >> +       int words = BITS_TO_LONGS(n);
> >> +
> >> +       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
> >
> > Not sure you need a kcalloc() here. If you want to support more than 32
> > GPIOs then you can pre-allocate space with a devm_kcalloc() in the probe
> > method rather than reallocate every time it is used.
> >
> > To be honest I don't really mind putting a hard limit on the maximum
> > gpl->num_gpios (so you can just use a local variable) and having no
> > allocation at all.
> >
>
> Thanks for the suggestion. I addressed the kcalloc() concern by
> moving the bitmap allocation to probe using devm_kcalloc() as
> below:
>
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 0eb42d8bf1d9..7af5dc4f0315 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -19,32 +19,25 @@
>  struct gpio_backlight {
>         struct device *dev;
>         struct gpio_descs *gpiods;
> -       unsigned int num_gpios;
> +       unsigned long *bitmap;
>  };
>
>  static int gpio_backlight_update_status(struct backlight_device *bl)
>  {
>         struct gpio_backlight *gbl = bl_get_data(bl);
> -       unsigned int n = gbl->num_gpios;
> +       unsigned int n = gbl->gpiods->ndescs;
>         int br = backlight_get_brightness(bl);
> -       unsigned long *value_bitmap;
> -       int words = BITS_TO_LONGS(n);
> -
> -       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
> -       if (!value_bitmap)
> -               return -ENOMEM;
>
>         if (br)
> -               bitmap_fill(value_bitmap, n);
> +               bitmap_fill(gbl->bitmap, n);
>         else
> -               bitmap_zero(value_bitmap, n);
> +               bitmap_zero(gbl->bitmap, n);
>
> -       gpiod_set_array_value_cansleep(gbl->gpiods->ndescs,
> +       gpiod_set_array_value_cansleep(n,
>                                        gbl->gpiods->desc,
>                                        gbl->gpiods->info,
> -                                      value_bitmap);
> +                                      gbl->bitmap);
>
> -       kfree(value_bitmap);
>         return 0;
>  }
>
> @@ -67,22 +60,25 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
>         struct device_node *of_node = dev->of_node;
> -       struct backlight_properties props;
> +       struct backlight_properties props = { };
>         struct backlight_device *bl;
>         struct gpio_backlight *gbl;
> -       int ret, init_brightness, def_value;
> -       unsigned int i;
> +       bool def_value;
> +       enum gpiod_flags flags;
> +       unsigned int n;
> +       int words;
>
> -       gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
> -       if (gbl == NULL)
> +       gbl = devm_kcalloc(dev, 1, sizeof(*gbl), GFP_KERNEL);
> +       if (!gbl)
>                 return -ENOMEM;
>
>         if (pdata)
>                 gbl->dev = pdata->dev;
>
>         def_value = device_property_read_bool(dev, "default-on");
> -
> -       gbl->gpiods = devm_gpiod_get_array(dev, NULL, GPIOD_ASIS);
> +       flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> +
> +       gbl->gpiods = devm_gpiod_get_array(dev, NULL, flags);
>         if (IS_ERR(gbl->gpiods)) {
>                 if (PTR_ERR(gbl->gpiods) == -ENODEV)
>                         return dev_err_probe(dev, -EINVAL,
> @@ -90,12 +86,17 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>                 return PTR_ERR(gbl->gpiods);
>         }
>
> -       gbl->num_gpios = gbl->gpiods->ndescs;
> -       if (gbl->num_gpios == 0)
> +       n = gbl->gpiods->ndescs;
> +       if (!n)
>                 return dev_err_probe(dev, -EINVAL,
> -                       "The gpios parameter is missing or invalid\n");
> +                       "No GPIOs provided\n");
> +
> +       words = BITS_TO_LONGS(n);
> +       gbl->bitmap = devm_kcalloc(dev, words, sizeof(unsigned long),
> +                                  GFP_KERNEL);
> +       if (!gbl->bitmap)
> +               return -ENOMEM;
>
> -       memset(&props, 0, sizeof(props));
>         props.type = BACKLIGHT_RAW;
>         props.max_brightness = 1;
>         bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
> @@ -106,50 +107,19 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>         }
>
>         /* Set the initial power state */
> -       if (!of_node || !of_node->phandle) {
> +       if (!of_node || !of_node->phandle)
>                 /* Not booted with device tree or no phandle link to the node */
>                 bl->props.power = def_value ? BACKLIGHT_POWER_ON
>                                                     : BACKLIGHT_POWER_OFF;
> -       } else {
> -               bool all_high = true;
> -               unsigned long *value_bitmap;
> -               int words = BITS_TO_LONGS(gbl->num_gpios);
> -
> -               value_bitmap = kcalloc(words, sizeof(unsigned long),
> -                                      GFP_KERNEL);
> -               if (!value_bitmap)
> -                       return -ENOMEM;
> -
> -               ret = gpiod_get_array_value_cansleep(gbl->gpiods->ndescs,
> -                                                    gbl->gpiods->desc,
> -                                                    gbl->gpiods->info,
> -                                                    value_bitmap);
> -               if (ret) {
> -                       kfree(value_bitmap);
> -                       return dev_err_probe(dev, ret,
> -                               "failed to read initial gpio values\n");
> -               }
> -
> -               all_high = bitmap_full(value_bitmap, gbl->num_gpios);
> -
> -               kfree(value_bitmap);
> -               bl->props.power =
> -                       all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
> -       }
> -
> -       bl->props.brightness = 1;
> -
> -       init_brightness = backlight_get_brightness(bl);
> +       else if (gpiod_get_value_cansleep(gbl->gpiods->desc[0]) == 0)
> +               bl->props.power = BACKLIGHT_POWER_OFF;
> +       else
> +               bl->props.power = BACKLIGHT_POWER_ON;
>
> -       for (i = 0; i < gbl->num_gpios; i++) {
> -               ret = gpiod_direction_output(gbl->gpiods->desc[i],
> -                                            init_brightness);
> -               if (ret)
> -                       return dev_err_probe(dev, ret,
> -                                       "failed to set gpio %u direction\n",
> -                                       i);
> -       }
> +       bl->props.brightness = def_value ? 1 : 0;
>
> +       gpio_backlight_update_status(bl);
> +
>         platform_set_drvdata(pdev, bl);
>         return 0;
>  }
>
> Kindly confirm whether this approach aligns with your
> expectations.

As mentioned yesterday, I'd rather just review a v2 patch than this kind of
meta-patch. Please send a v2 patch instead.


Daniel.
