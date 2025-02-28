Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87C4A494FF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DB610EC30;
	Fri, 28 Feb 2025 09:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TFjDMFp8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B427C10EC30
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:31:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so1175361f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 01:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740735064; x=1741339864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bqel5QvHHXQv3It1fe1Y4bC+iS5SdVJWtocG59pT558=;
 b=TFjDMFp8SJD5dHcW1j/H3iOnfe1o8jjEMqxfIAexFOO6QhgAXmsU/3WPJhoqvorntH
 o1oCqvL6WKCOV2dkq0fBYvzb1x91RMPRXCxHitl82dIZbfKS/RMOH7BtxOO/0r6zSBCs
 jtKU1A8eQhevhKLLT9huDvo8/tiXjdkIudiGl0yAmlxHQHorYwa7Xr2cvlXQIJn/h+jQ
 mVt+KipTZR4kKwLP0ivFXmHlqdC2ytZJ5T2eIJQj8V83H/bHAYkT+5wyGbaoIvIMgUx0
 doIbnDBG4Bb6Tj5OIWTA1Jy8AVY29RDRamHcpOy9ET4xJxspBsxHR11bb+kpQWVbJmDW
 tLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740735064; x=1741339864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bqel5QvHHXQv3It1fe1Y4bC+iS5SdVJWtocG59pT558=;
 b=TMoSAn9DIYDYr4Psujla3l9zrLPDqyWU9X2rUywe/XK/+6znjaqUccXFoltN3G/7+X
 nPuSSaZxux1h33BiRuYY+Iz1cdi+OGFoh6uc6B8dHzwbJXuo+X6grGtNCQ2qx3KNPk63
 8g31MDUXXE8LXkLEuqktelbJI5n2d0AogC4B9bL8IFqvWkMpR0R3u5kuDnHCPdbF9Nvd
 DQGDCyF+7gCWbG80Qw31raD8nv2LfFuvm1ingEDaxJ8B7vFaQRU9hlUm69EV6vMTHWwg
 2totj6tTl3Noebjdgz/lLm84CvDKCEVC/xGWol4j2l9F0T8ScIUKdgVLTcI1+qm8ty3m
 7ngg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIcAub4uIYTMwek9BAf2yVPCLdBM4TIjUf4t/9qqOTut7YQPoaNjb5H8Lg3vgTb0Lv5cRtR6QYY6s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVtp+M/5gQiN2wemz0jempEzkuxp+8CsAyaPYDRre5cFsJSZ6m
 deZ3LBDeAbUfJ5+bK1NFofOqbK9LONt6NHqfk6dQEZ2k1pfBKfiw9RUb3aoHTckTD2r56leD5D3
 hNnFMGiJmeQ/+/ExO0K4PTb4VdSU=
X-Gm-Gg: ASbGncsIum38B8S/WkWd1I8qYH+zIf6xEie9BKgUeB8benXxxmRbX31LtblfqQRYcc+
 CLURCc1IMq6hmp3Sn7Jt6hQ6J3Ff77Kwi6lhtB7MRqdhFdw1KPGmBWlIoNvuSNPT7xgaORjdw27
 gvfjT7rGct
X-Google-Smtp-Source: AGHT+IE7Q54dBp3H2wvOq/CUFqahEOZL08WMVIVBWSjW3mQQbvTWZ1V6+Qz818tmw4E95Svm/LH55hUb3xAr71MvNcc=
X-Received: by 2002:a05:6000:4027:b0:390:db07:87ea with SMTP id
 ffacd0b85a97d-390eca48108mr1768233f8f.34.1740735063789; Fri, 28 Feb 2025
 01:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20250224114815.146053-1-clamor95@gmail.com>
 <20250224114815.146053-3-clamor95@gmail.com>
 <20250228085927.GM824852@google.com>
In-Reply-To: <20250228085927.GM824852@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 28 Feb 2025 11:30:51 +0200
X-Gm-Features: AQ5f1Jp4R239u-KC4mj96oJEZwpXjAoEgcFxj04eQ_1D6Pzsz1_ydnGiSr2CQKA
Message-ID: <CAPVz0n0jaR=UM7WbBs3zM-cZzuaPVWBjf4Q7i82hvxtXg2oCzQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mfd: lm3533: convert to use OF
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

=D0=BF=D1=82, 28 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 10:59 Lee =
Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 24 Feb 2025, Svyatoslav Ryhel wrote:
>
> > Remove platform data and fully relay on OF and device tree
> > parsing and binding devices.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/iio/light/lm3533-als.c      |  40 ++++---
> >  drivers/leds/leds-lm3533.c          |  46 +++++---
> >  drivers/mfd/lm3533-core.c           | 159 ++++++++--------------------
> >  drivers/video/backlight/lm3533_bl.c |  71 ++++++++++---
> >  include/linux/mfd/lm3533.h          |  35 +-----
> >  5 files changed, 164 insertions(+), 187 deletions(-)
> >
> > diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-=
als.c
> > index 99f0b903018c..cb52965e93c6 100644
> > --- a/drivers/iio/light/lm3533-als.c
> > +++ b/drivers/iio/light/lm3533-als.c
> > @@ -16,9 +16,12 @@
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/mfd/core.h>
> > +#include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> > +#include <linux/units.h>
> >
> >  #include <linux/mfd/lm3533.h>
> >
> > @@ -56,6 +59,9 @@ struct lm3533_als {
> >
> >       atomic_t zone;
> >       struct mutex thresh_mutex;
> > +
> > +     unsigned pwm_mode:1;            /* PWM input mode (default analog=
) */
> > +     u8 r_select;                    /* 1 - 127 (ignored in PWM-mode) =
*/
> >  };
> >
> >
> > @@ -753,18 +759,17 @@ static int lm3533_als_set_resistor(struct lm3533_=
als *als, u8 val)
> >       return 0;
> >  }
> >
> > -static int lm3533_als_setup(struct lm3533_als *als,
> > -                         const struct lm3533_als_platform_data *pdata)
> > +static int lm3533_als_setup(struct lm3533_als *als)
> >  {
> >       int ret;
> >
> > -     ret =3D lm3533_als_set_input_mode(als, pdata->pwm_mode);
> > +     ret =3D lm3533_als_set_input_mode(als, als->pwm_mode);
> >       if (ret)
> >               return ret;
> >
> >       /* ALS input is always high impedance in PWM-mode. */
> > -     if (!pdata->pwm_mode) {
> > -             ret =3D lm3533_als_set_resistor(als, pdata->r_select);
> > +     if (!als->pwm_mode) {
> > +             ret =3D lm3533_als_set_resistor(als, als->r_select);
>
> You're already passing 'als'.
>
> Just teach lm3533_als_set_resistor that 'r_select' is now contained.
>

This is not scope of this patchset. I was already accused in too much
changes which make it unreadable. This patchset is dedicated to
swapping platform data to use of the device tree. NOT improving
functions, NOT rewriting arbitrary mechanics. If you feed a need for
this change, then propose a followup. I need from this driver only one
thing, that it could work with device tree. But it seems that it is
better that it just rots in the garbage bin until removed cause no one
cared.

> >               if (ret)
> >                       return ret;
> >       }
> > @@ -828,22 +833,16 @@ static const struct iio_info lm3533_als_info =3D =
{
> >
> >  static int lm3533_als_probe(struct platform_device *pdev)
> >  {
> > -     const struct lm3533_als_platform_data *pdata;
> >       struct lm3533 *lm3533;
> >       struct lm3533_als *als;
> >       struct iio_dev *indio_dev;
> > +     u32 val;
>
> Value of what, potatoes?
>

Oranges.

> >       int ret;
> >
> >       lm3533 =3D dev_get_drvdata(pdev->dev.parent);
> >       if (!lm3533)
> >               return -EINVAL;
> >
> > -     pdata =3D dev_get_platdata(&pdev->dev);
> > -     if (!pdata) {
> > -             dev_err(&pdev->dev, "no platform data\n");
> > -             return -EINVAL;
> > -     }
> > -
> >       indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*als));
> >       if (!indio_dev)
> >               return -ENOMEM;
> > @@ -864,13 +863,21 @@ static int lm3533_als_probe(struct platform_devic=
e *pdev)
> >
> >       platform_set_drvdata(pdev, indio_dev);
> >
> > +     val =3D 200 * KILO; /* 200kOhm */
>
> Better to #define magic numbers; DEFAULT_{DESCRIPTION}_OHMS
>

Why? that is not needed.

> > +     device_property_read_u32(&pdev->dev, "ti,resistor-value-ohm", &va=
l);
> > +
> > +     /* Convert resitance into R_ALS value with 2v / 10uA * R */
>
> Because ...
>

BACAUSE the device DOES NOT understand human readable values, only 0s
and 1s, hence mOhms must be converted into value lm3533 chip can
understand.

> > +     als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * val);
> > +
> > +     als->pwm_mode =3D device_property_read_bool(&pdev->dev, "ti,pwm-m=
ode");
> > +
> >       if (als->irq) {
> >               ret =3D lm3533_als_setup_irq(als, indio_dev);
> >               if (ret)
> >                       return ret;
> >       }
> >
> > -     ret =3D lm3533_als_setup(als, pdata);
> > +     ret =3D lm3533_als_setup(als);
> >       if (ret)
> >               goto err_free_irq;
> >
> > @@ -907,9 +914,16 @@ static void lm3533_als_remove(struct platform_devi=
ce *pdev)
> >               free_irq(als->irq, indio_dev);
> >  }
> >
> > +static const struct of_device_id lm3533_als_match_table[] =3D {
> > +     { .compatible =3D "ti,lm3533-als" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, lm3533_als_match_table);
> > +
> >  static struct platform_driver lm3533_als_driver =3D {
> >       .driver =3D {
> >               .name   =3D "lm3533-als",
> > +             .of_match_table =3D lm3533_als_match_table,
> >       },
> >       .probe          =3D lm3533_als_probe,
> >       .remove         =3D lm3533_als_remove,
> > diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> > index 45795f2a1042..6e661a2a540f 100644
> > --- a/drivers/leds/leds-lm3533.c
> > +++ b/drivers/leds/leds-lm3533.c
> > @@ -10,8 +10,10 @@
> >  #include <linux/module.h>
> >  #include <linux/leds.h>
> >  #include <linux/mfd/core.h>
> > +#include <linux/mod_devicetable.h>
> >  #include <linux/mutex.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/slab.h>
> >
> >  #include <linux/mfd/lm3533.h>
> > @@ -48,6 +50,9 @@ struct lm3533_led {
> >
> >       struct mutex mutex;
> >       unsigned long flags;
> > +
> > +     u16 max_current;                /* 5000 - 29800 uA (800 uA step) =
*/
> > +     u8 pwm;                         /* 0 - 0x3f */
>
> This comment doesn't add anything.
>

This comment is from pdata. Both values were just transferred from there.

> >  };
> >
> >
> > @@ -632,23 +637,22 @@ static const struct attribute_group *lm3533_led_a=
ttribute_groups[] =3D {
> >       NULL
> >  };
> >
> > -static int lm3533_led_setup(struct lm3533_led *led,
> > -                                     struct lm3533_led_platform_data *=
pdata)
> > +static int lm3533_led_setup(struct lm3533_led *led)
> >  {
> >       int ret;
> >
> > -     ret =3D lm3533_ctrlbank_set_max_current(&led->cb, pdata->max_curr=
ent);
> > +     ret =3D lm3533_ctrlbank_set_max_current(&led->cb, led->max_curren=
t);
>
> Why not make max_current and attribute of lm3533_ctrlbank and drop the
> redundant parameter?
>
> >       if (ret)
> >               return ret;
> >
> > -     return lm3533_ctrlbank_set_pwm(&led->cb, pdata->pwm);
> > +     return lm3533_ctrlbank_set_pwm(&led->cb, led->pwm);
>
> As above.
>

As above.

> >  }
> >
> >  static int lm3533_led_probe(struct platform_device *pdev)
> >  {
> >       struct lm3533 *lm3533;
> > -     struct lm3533_led_platform_data *pdata;
> >       struct lm3533_led *led;
> > +     u32 val;
> >       int ret;
> >
> >       dev_dbg(&pdev->dev, "%s\n", __func__);
> > @@ -657,12 +661,6 @@ static int lm3533_led_probe(struct platform_device=
 *pdev)
> >       if (!lm3533)
> >               return -EINVAL;
> >
> > -     pdata =3D dev_get_platdata(&pdev->dev);
> > -     if (!pdata) {
> > -             dev_err(&pdev->dev, "no platform data\n");
> > -             return -EINVAL;
> > -     }
> > -
> >       if (pdev->id < 0 || pdev->id >=3D LM3533_LVCTRLBANK_COUNT) {
> >               dev_err(&pdev->dev, "illegal LED id %d\n", pdev->id);
> >               return -EINVAL;
> > @@ -673,8 +671,11 @@ static int lm3533_led_probe(struct platform_device=
 *pdev)
> >               return -ENOMEM;
> >
> >       led->lm3533 =3D lm3533;
> > -     led->cdev.name =3D pdata->name;
> > -     led->cdev.default_trigger =3D pdata->default_trigger;
> > +     led->cdev.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d"=
,
> > +                                     pdev->name, pdev->id);
> > +     led->cdev.default_trigger =3D "none";
> > +     device_property_read_string(&pdev->dev, "linux,default-trigger",
> > +                                 &led->cdev.default_trigger);
> >       led->cdev.brightness_set_blocking =3D lm3533_led_set;
> >       led->cdev.brightness_get =3D lm3533_led_get;
> >       led->cdev.blink_set =3D lm3533_led_blink_set;
> > @@ -702,7 +703,17 @@ static int lm3533_led_probe(struct platform_device=
 *pdev)
> >
> >       led->cb.dev =3D led->cdev.dev;
> >
> > -     ret =3D lm3533_led_setup(led, pdata);
> > +     /* 5000 - 29800 uA (800 uA step) */
> > +     val =3D 5000;
> > +     device_property_read_u32(&pdev->dev, "ti,max-current-microamp", &=
val);
> > +     led->max_current =3D val;
>
> Why not just use 'led->max_current' from the offset and delete 'val'?
>

BECAUSE, linux has no device_property_read_u32_default to pass default
value there. Additionally max_current is u16 and
device_property_read_u32 will not work for u16.

> > +
> > +     /* 0 - 0x3f */
>
> How does this improve readability?  Why would use this info?
>
> > +     val =3D 0;
> > +     device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &val);
> > +     led->pwm =3D val;
> > +
> > +     ret =3D lm3533_led_setup(led);
> >       if (ret)
> >               goto err_deregister;
> >
> > @@ -739,9 +750,16 @@ static void lm3533_led_shutdown(struct platform_de=
vice *pdev)
> >       lm3533_led_set(&led->cdev, LED_OFF);            /* disable blink =
*/
> >  }
> >
> > +static const struct of_device_id lm3533_led_match_table[] =3D {
> > +     { .compatible =3D "ti,lm3533-leds" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, lm3533_led_match_table);
> > +
> >  static struct platform_driver lm3533_led_driver =3D {
> >       .driver =3D {
> >               .name =3D "lm3533-leds",
> > +             .of_match_table =3D lm3533_led_match_table,
> >       },
> >       .probe          =3D lm3533_led_probe,
> >       .remove         =3D lm3533_led_remove,
> > diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> > index 0a2409d00b2e..e1b8fe136af9 100644
> > --- a/drivers/mfd/lm3533-core.c
> > +++ b/drivers/mfd/lm3533-core.c
> > @@ -14,10 +14,13 @@
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/mfd/core.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/property.h>
> >  #include <linux/regmap.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> > +#include <linux/units.h>
> >
> >  #include <linux/mfd/lm3533.h>
> >
> > @@ -42,41 +45,41 @@
> >
> >  #define LM3533_REG_MAX                       0xb2
> >
> > -
> > -static struct mfd_cell lm3533_als_devs[] =3D {
> > +static struct mfd_cell lm3533_child_devices[] =3D {
>
> Drop the child_ part.
>

Why? It seems that you are nitpicking.

> >       {
> >               .name   =3D "lm3533-als",
> >               .id     =3D -1,
> > +             .of_compatible =3D "ti,lm3533-als",
> >       },
> > -};
> > -
> > -static struct mfd_cell lm3533_bl_devs[] =3D {
> >       {
> >               .name   =3D "lm3533-backlight",
> >               .id     =3D 0,
> > +             .of_compatible =3D "ti,lm3533-backlight",
> >       },
> >       {
> >               .name   =3D "lm3533-backlight",
> >               .id     =3D 1,
> > +             .of_compatible =3D "ti,lm3533-backlight",
> >       },
> > -};
> > -
> > -static struct mfd_cell lm3533_led_devs[] =3D {
> >       {
> >               .name   =3D "lm3533-leds",
> >               .id     =3D 0,
>
> Do you know if these are actually used for anything?
>

Yes, they are used to select correct control bank

> Any reason to not just use PLATFORM_DEVID_AUTO?
>
> > +             .of_compatible =3D "ti,lm3533-leds",
> >       },
> >       {
> >               .name   =3D "lm3533-leds",
> >               .id     =3D 1,
> > +             .of_compatible =3D "ti,lm3533-leds",
> >       },
> >       {
> >               .name   =3D "lm3533-leds",
> >               .id     =3D 2,
> > +             .of_compatible =3D "ti,lm3533-leds",
> >       },
> >       {
> >               .name   =3D "lm3533-leds",
> >               .id     =3D 3,
> > +             .of_compatible =3D "ti,lm3533-leds",
> >       },
> >  };
> >
> > @@ -376,136 +379,60 @@ static struct attribute_group lm3533_attribute_g=
roup =3D {
> >       .attrs          =3D lm3533_attributes
> >  };
> >
> > -static int lm3533_device_als_init(struct lm3533 *lm3533)
> > -{
> > -     struct lm3533_platform_data *pdata =3D dev_get_platdata(lm3533->d=
ev);
> > -     int ret;
> > -
> > -     if (!pdata->als)
> > -             return 0;
> > -
> > -     lm3533_als_devs[0].platform_data =3D pdata->als;
> > -     lm3533_als_devs[0].pdata_size =3D sizeof(*pdata->als);
> > -
> > -     ret =3D mfd_add_devices(lm3533->dev, 0, lm3533_als_devs, 1, NULL,
> > -                           0, NULL);
> > -     if (ret) {
> > -             dev_err(lm3533->dev, "failed to add ALS device\n");
> > -             return ret;
> > -     }
> > -
> > -     lm3533->have_als =3D 1;
> > -
> > -     return 0;
> > -}
> > -
> > -static int lm3533_device_bl_init(struct lm3533 *lm3533)
> > -{
> > -     struct lm3533_platform_data *pdata =3D dev_get_platdata(lm3533->d=
ev);
> > -     int i;
> > -     int ret;
> > -
> > -     if (!pdata->backlights || pdata->num_backlights =3D=3D 0)
> > -             return 0;
> > -
> > -     if (pdata->num_backlights > ARRAY_SIZE(lm3533_bl_devs))
> > -             pdata->num_backlights =3D ARRAY_SIZE(lm3533_bl_devs);
> > -
> > -     for (i =3D 0; i < pdata->num_backlights; ++i) {
> > -             lm3533_bl_devs[i].platform_data =3D &pdata->backlights[i]=
;
> > -             lm3533_bl_devs[i].pdata_size =3D sizeof(pdata->backlights=
[i]);
> > -     }
> > -
> > -     ret =3D mfd_add_devices(lm3533->dev, 0, lm3533_bl_devs,
> > -                           pdata->num_backlights, NULL, 0, NULL);
> > -     if (ret) {
> > -             dev_err(lm3533->dev, "failed to add backlight devices\n")=
;
> > -             return ret;
> > -     }
> > -
> > -     lm3533->have_backlights =3D 1;
> > -
> > -     return 0;
> > -}
> > -
> > -static int lm3533_device_led_init(struct lm3533 *lm3533)
> > -{
> > -     struct lm3533_platform_data *pdata =3D dev_get_platdata(lm3533->d=
ev);
> > -     int i;
> > -     int ret;
> > -
> > -     if (!pdata->leds || pdata->num_leds =3D=3D 0)
> > -             return 0;
> > -
> > -     if (pdata->num_leds > ARRAY_SIZE(lm3533_led_devs))
> > -             pdata->num_leds =3D ARRAY_SIZE(lm3533_led_devs);
> > -
> > -     for (i =3D 0; i < pdata->num_leds; ++i) {
> > -             lm3533_led_devs[i].platform_data =3D &pdata->leds[i];
> > -             lm3533_led_devs[i].pdata_size =3D sizeof(pdata->leds[i]);
> > -     }
> > -
> > -     ret =3D mfd_add_devices(lm3533->dev, 0, lm3533_led_devs,
> > -                           pdata->num_leds, NULL, 0, NULL);
> > -     if (ret) {
> > -             dev_err(lm3533->dev, "failed to add LED devices\n");
> > -             return ret;
> > -     }
> > -
> > -     lm3533->have_leds =3D 1;
> > -
> > -     return 0;
> > -}
> > -
> > -static int lm3533_device_setup(struct lm3533 *lm3533,
> > -                                     struct lm3533_platform_data *pdat=
a)
> > +static int lm3533_device_setup(struct lm3533 *lm3533)
> >  {
> >       int ret;
> >
> > -     ret =3D lm3533_set_boost_freq(lm3533, pdata->boost_freq);
> > +     ret =3D lm3533_set_boost_freq(lm3533, lm3533->boost_freq);
>
> Same comments as before.
>
> Teach lm3533_set_boost_freq() that 'boost_freq' is contained in 'lm3533'.
>

Same answer as above.

> >       if (ret)
> >               return ret;
> >
> > -     return lm3533_set_boost_ovp(lm3533, pdata->boost_ovp);
> > +     return lm3533_set_boost_ovp(lm3533, lm3533->boost_ovp);
> >  }
> >
> >  static int lm3533_device_init(struct lm3533 *lm3533)
> >  {
> > -     struct lm3533_platform_data *pdata =3D dev_get_platdata(lm3533->d=
ev);
> > +     u32 val;
>
> 'uV' and 'hz' could be easier to follow.
>

Add 2 temp values instead of one, nice.

> >       int ret;
> >
> > -     dev_dbg(lm3533->dev, "%s\n", __func__);
> > +     lm3533->hwen =3D devm_gpiod_get(lm3533->dev, "enable", GPIOD_OUT_=
LOW);
> > +     if (IS_ERR(lm3533->hwen))
> > +             return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen),
> > +                                  "failed to request HWEN GPIO\n");
> >
> > -     if (!pdata) {
> > -             dev_err(lm3533->dev, "no platform data\n");
> > -             return -EINVAL;
> > -     }
> > +     val =3D 16 * MICRO; /* 16V */
> > +     device_property_read_u32(lm3533->dev, "ti,boost-ovp-microvolt", &=
val);
> >
> > -     lm3533->hwen =3D devm_gpiod_get(lm3533->dev, NULL, GPIOD_OUT_LOW)=
;
> > -     if (IS_ERR(lm3533->hwen))
> > -             return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen), =
"failed to request HWEN GPIO\n");
> > -     gpiod_set_consumer_name(lm3533->hwen, "lm3533-hwen");
> > +     /* boost_ovp is defined in microvolts, convert to enum value */
> > +     lm3533->boost_ovp =3D val / (8 * MICRO) - 2;
>
> Wait, what.  Why?
>
> Converting a useful microvolt value to an arbitrary enum sounds fragile.
>

BACAUSE the device DOES NOT understand human readable values, only 0s
and 1s, hence uV and Hz must be converted into value lm3533 chip can
understand.

> > +
> > +     val =3D 500 * KILO; /* 500kHz */
> > +     device_property_read_u32(lm3533->dev, "ti,boost-freq-hz", &val);
> > +
> > +     /* boost_freq is defined in Hz, convert to enum value */
> > +     lm3533->boost_freq =3D val / (500 * KILO) - 1;
> >
> >       lm3533_enable(lm3533);
> >
> > -     ret =3D lm3533_device_setup(lm3533, pdata);
> > +     ret =3D lm3533_device_setup(lm3533);
> >       if (ret)
> >               goto err_disable;
> >
> > -     lm3533_device_als_init(lm3533);
> > -     lm3533_device_bl_init(lm3533);
> > -     lm3533_device_led_init(lm3533);
> > +     ret =3D devm_mfd_add_devices(lm3533->dev, 0, lm3533_child_devices=
,
>
>
> > +                                ARRAY_SIZE(lm3533_child_devices), NULL=
, 0, NULL);
> > +     if (ret) {
> > +             dev_err(lm3533->dev, "failed to add MFD devices: %d\n", r=
et);
>
> "child devices" or "sub-devices".
>

Does this naming matters? I can call them any way I want to as long
this remains clear. Or you have created some twisted consensus in your
heads that mfd child devices MUST be called sub-devices?

> > +             goto err_disable;
> > +     }
> >
> >       ret =3D sysfs_create_group(&lm3533->dev->kobj, &lm3533_attribute_=
group);
> >       if (ret < 0) {
> >               dev_err(lm3533->dev, "failed to create sysfs attributes\n=
");
> > -             goto err_unregister;
> > +             goto err_disable;
> >       }
> >
> >       return 0;
> >
> > -err_unregister:
> > -     mfd_remove_devices(lm3533->dev);
> >  err_disable:
> >       lm3533_disable(lm3533);
> >
> > @@ -517,8 +444,6 @@ static void lm3533_device_exit(struct lm3533 *lm353=
3)
> >       dev_dbg(lm3533->dev, "%s\n", __func__);
> >
> >       sysfs_remove_group(&lm3533->dev->kobj, &lm3533_attribute_group);
> > -
> > -     mfd_remove_devices(lm3533->dev);
> >       lm3533_disable(lm3533);
> >  }
> >
> > @@ -591,6 +516,9 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
> >       lm3533->dev =3D &i2c->dev;
> >       lm3533->irq =3D i2c->irq;
> >
> > +     i2c->dev.coherent_dma_mask =3D 0;
> > +     i2c->dev.dma_mask =3D &i2c->dev.coherent_dma_mask;
>
> Why are you manually doing this?
>
> The core should take care of this for you:
>
> drivers/mfd/mfd-core.c: pdev->dev.dma_mask =3D parent->dma_mask;
> drivers/mfd/mfd-core.c: pdev->dev.coherent_dma_mask =3D parent->coherent_=
dma_mask;
>

Parent uses DMA, but mfd and its children do not,

> > +
> >       return lm3533_device_init(lm3533);
> >  }
> >
> > @@ -603,6 +531,12 @@ static void lm3533_i2c_remove(struct i2c_client *i=
2c)
> >       lm3533_device_exit(lm3533);
> >  }
> >
> > +static const struct of_device_id lm3533_match_table[] =3D {
> > +     { .compatible =3D "ti,lm3533" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, lm3533_match_table);
> > +
> >  static const struct i2c_device_id lm3533_i2c_ids[] =3D {
> >       { "lm3533" },
> >       { }
> > @@ -612,6 +546,7 @@ MODULE_DEVICE_TABLE(i2c, lm3533_i2c_ids);
> >  static struct i2c_driver lm3533_i2c_driver =3D {
> >       .driver =3D {
> >                  .name =3D "lm3533",
> > +                .of_match_table =3D lm3533_match_table,
> >       },
> >       .id_table       =3D lm3533_i2c_ids,
> >       .probe          =3D lm3533_i2c_probe,
> > diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backli=
ght/lm3533_bl.c
> > index babfd3ceec86..0827a5e98dbb 100644
> > --- a/drivers/video/backlight/lm3533_bl.c
> > +++ b/drivers/video/backlight/lm3533_bl.c
> > @@ -9,7 +9,9 @@
> >
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> > +#include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/backlight.h>
> >  #include <linux/slab.h>
> >
> > @@ -19,6 +21,7 @@
> >  #define LM3533_HVCTRLBANK_COUNT              2
> >  #define LM3533_BL_MAX_BRIGHTNESS     255
> >
> > +#define LM3533_REG_OUTPUT_CONF1              0x10
> >  #define LM3533_REG_CTRLBANK_AB_BCONF 0x1a
> >
> >
> > @@ -27,6 +30,11 @@ struct lm3533_bl {
> >       struct lm3533_ctrlbank cb;
> >       struct backlight_device *bd;
> >       int id;
> > +
> > +     u16 max_current;                /* 5000 - 29800 uA (800 uA step) =
*/
> > +     u8 pwm;                         /* 0 - 0x3f */
>
> Remove or improve this comment.
>

Comment was moved from the platform data along with the value.

> > +     bool linear;
> > +     bool hvled;
> >  };
> >
> >
> > @@ -246,25 +254,40 @@ static struct attribute_group lm3533_bl_attribute=
_group =3D {
> >       .attrs          =3D lm3533_bl_attributes
> >  };
> >
> > -static int lm3533_bl_setup(struct lm3533_bl *bl,
> > -                                     struct lm3533_bl_platform_data *p=
data)
> > +static int lm3533_bl_setup(struct lm3533_bl *bl)
> >  {
> > +     int id =3D lm3533_bl_get_ctrlbank_id(bl);
> >       int ret;
> >
> > -     ret =3D lm3533_ctrlbank_set_max_current(&bl->cb, pdata->max_curre=
nt);
> > +     if (bl->linear) {
> > +             ret =3D lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_=
BCONF,
> > +                                 BIT(2 * id + 1), BIT(2 * id + 1));
>
> These need to be defined as SHIFT values or whatever they are.
>

Why? IMHO looks perfectly fine and readable.

> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (bl->hvled) {
> > +             ret =3D lm3533_update(bl->lm3533, LM3533_REG_OUTPUT_CONF1=
,
> > +                                 id | id << 1, BIT(0) | BIT(1));
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current)=
;
> >       if (ret)
> >               return ret;
> >
> > -     return lm3533_ctrlbank_set_pwm(&bl->cb, pdata->pwm);
> > +     return lm3533_ctrlbank_set_pwm(&bl->cb, bl->pwm);
> >  }
> >
> >  static int lm3533_bl_probe(struct platform_device *pdev)
> >  {
> >       struct lm3533 *lm3533;
> > -     struct lm3533_bl_platform_data *pdata;
> >       struct lm3533_bl *bl;
> >       struct backlight_device *bd;
> >       struct backlight_properties props;
> > +     char *name;
> > +     u32 val;
>
> As above.
>

As above.

> >       int ret;
> >
> >       dev_dbg(&pdev->dev, "%s\n", __func__);
> > @@ -273,12 +296,6 @@ static int lm3533_bl_probe(struct platform_device =
*pdev)
> >       if (!lm3533)
> >               return -EINVAL;
> >
> > -     pdata =3D dev_get_platdata(&pdev->dev);
> > -     if (!pdata) {
> > -             dev_err(&pdev->dev, "no platform data\n");
> > -             return -EINVAL;
> > -     }
> > -
> >       if (pdev->id < 0 || pdev->id >=3D LM3533_HVCTRLBANK_COUNT) {
> >               dev_err(&pdev->dev, "illegal backlight id %d\n", pdev->id=
);
> >               return -EINVAL;
> > @@ -295,13 +312,15 @@ static int lm3533_bl_probe(struct platform_device=
 *pdev)
> >       bl->cb.id =3D lm3533_bl_get_ctrlbank_id(bl);
> >       bl->cb.dev =3D NULL;                      /* until registered */
> >
> > +     name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d", pdev->na=
me, pdev->id);
>
> Doesn't platform already provide enumerated names?
>

It does, but if you have 4 devices which use same driver there cannot
be 4 same names.

> > +
> >       memset(&props, 0, sizeof(props));
> >       props.type =3D BACKLIGHT_RAW;
> >       props.max_brightness =3D LM3533_BL_MAX_BRIGHTNESS;
> > -     props.brightness =3D pdata->default_brightness;
> > -     bd =3D devm_backlight_device_register(&pdev->dev, pdata->name,
> > -                                     pdev->dev.parent, bl, &lm3533_bl_=
ops,
> > -                                     &props);
> > +     props.brightness =3D LM3533_BL_MAX_BRIGHTNESS;
> > +     device_property_read_u32(&pdev->dev, "default-brightness", &props=
.brightness);
> > +     bd =3D devm_backlight_device_register(&pdev->dev, name, pdev->dev=
.parent,
> > +                                         bl, &lm3533_bl_ops, &props);
> >       if (IS_ERR(bd)) {
> >               dev_err(&pdev->dev, "failed to register backlight device\=
n");
> >               return PTR_ERR(bd);
> > @@ -320,7 +339,20 @@ static int lm3533_bl_probe(struct platform_device =
*pdev)
> >
> >       backlight_update_status(bd);
> >
> > -     ret =3D lm3533_bl_setup(bl, pdata);
> > +     /* 5000 - 29800 uA (800 uA step) */
> > +     val =3D 5000;
> > +     device_property_read_u32(&pdev->dev, "ti,max-current-microamp", &=
val);
> > +     bl->max_current =3D val;
> > +
> > +     /* 0 - 0x3f */
> > +     val =3D 0;
> > +     device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &val);
> > +     bl->pwm =3D val;
> > +
> > +     bl->linear =3D device_property_read_bool(&pdev->dev, "ti,linear-m=
apping-mode");
> > +     bl->hvled =3D device_property_read_bool(&pdev->dev, "ti,hardware-=
controlled");
> > +
> > +     ret =3D lm3533_bl_setup(bl);
> >       if (ret)
> >               goto err_sysfs_remove;
> >
> > @@ -381,10 +413,17 @@ static void lm3533_bl_shutdown(struct platform_de=
vice *pdev)
> >       lm3533_ctrlbank_disable(&bl->cb);
> >  }
> >
> > +static const struct of_device_id lm3533_bl_match_table[] =3D {
> > +     { .compatible =3D "ti,lm3533-backlight" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, lm3533_bl_match_table);
> > +
> >  static struct platform_driver lm3533_bl_driver =3D {
> >       .driver =3D {
> >               .name   =3D "lm3533-backlight",
> >               .pm     =3D &lm3533_bl_pm_ops,
> > +             .of_match_table =3D lm3533_bl_match_table,
> >       },
> >       .probe          =3D lm3533_bl_probe,
> >       .remove         =3D lm3533_bl_remove,
> > diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
> > index 69059a7a2ce5..3b28fc0970f6 100644
> > --- a/include/linux/mfd/lm3533.h
> > +++ b/include/linux/mfd/lm3533.h
> > @@ -27,6 +27,9 @@ struct lm3533 {
> >       struct gpio_desc *hwen;
> >       int irq;
> >
> > +     u32 boost_ovp;
> > +     u32 boost_freq;
> > +
> >       unsigned have_als:1;
> >       unsigned have_backlights:1;
> >       unsigned have_leds:1;
> > @@ -38,25 +41,6 @@ struct lm3533_ctrlbank {
> >       int id;
> >  };
> >
> > -struct lm3533_als_platform_data {
> > -     unsigned pwm_mode:1;            /* PWM input mode (default analog=
) */
> > -     u8 r_select;                    /* 1 - 127 (ignored in PWM-mode) =
*/
> > -};
> > -
> > -struct lm3533_bl_platform_data {
> > -     char *name;
> > -     u16 max_current;                /* 5000 - 29800 uA (800 uA step) =
*/
> > -     u8 default_brightness;          /* 0 - 255 */
> > -     u8 pwm;                         /* 0 - 0x3f */
> > -};
> > -
> > -struct lm3533_led_platform_data {
> > -     char *name;
> > -     const char *default_trigger;
> > -     u16 max_current;                /* 5000 - 29800 uA (800 uA step) =
*/
> > -     u8 pwm;                         /* 0 - 0x3f */
> > -};
> > -
> >  enum lm3533_boost_freq {
> >       LM3533_BOOST_FREQ_500KHZ,
> >       LM3533_BOOST_FREQ_1000KHZ,
> > @@ -69,19 +53,6 @@ enum lm3533_boost_ovp {
> >       LM3533_BOOST_OVP_40V,
> >  };
> >
> > -struct lm3533_platform_data {
> > -     enum lm3533_boost_ovp boost_ovp;
> > -     enum lm3533_boost_freq boost_freq;
> > -
> > -     struct lm3533_als_platform_data *als;
> > -
> > -     struct lm3533_bl_platform_data *backlights;
> > -     int num_backlights;
> > -
> > -     struct lm3533_led_platform_data *leds;
> > -     int num_leds;
> > -};
> > -
> >  extern int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
> >  extern int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
> >
> > --
> > 2.43.0
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
