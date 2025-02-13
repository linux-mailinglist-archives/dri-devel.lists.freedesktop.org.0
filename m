Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A2BA3445D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0EC10EB05;
	Thu, 13 Feb 2025 15:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JF4wab3U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F4D10EB08
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:03:41 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-38f286b5281so317331f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 07:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739459020; x=1740063820; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=il270moocRQxXWx9sDop2wPY9i++i0FF/XAOD2V/4TY=;
 b=JF4wab3UHTpc/f0p72cv+xMTgtviZ/38OHyEiEE5FT6TVKo1GCaRSkx1Fvq5pJGYyF
 BAuu6Rulo1RpNibI0yPNcIzKeLZYuilyRGJ1zqXDZlnnbiffeE8TQF5dd/HJ7GlocJSB
 wSiRhDyZY/i9E70voqMoe+83yciJN/lPjPCb5OE1bT4I+iQ8Kl/JXARsAuAv3+7hizpz
 RSp3K7Yi9pOxAcEojmglya0JYmfmniallOLHQltZgibvKYveD7j5yuEOGjht/4Hh80xD
 W5CYwZYShIoMn9/HrATcQ34G7lm8ZpkLqKrprNiljKMRb4POgxfvLX48+dXB8WX3kWa8
 4xmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739459020; x=1740063820;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=il270moocRQxXWx9sDop2wPY9i++i0FF/XAOD2V/4TY=;
 b=hSfhVu1oHS1/+aYERoVa9o1P4DuOSFNI3hDFiIp3VJlVxY2QY1FbhtrPtivxOzD6f/
 eVEgCAEQLa2+UXB4ZyZ65wOfTL+5PfQJGZpGtqqA+PUIUwXtd7qPyLThwQIOEpGRZA9T
 1CKL0xmMl/YWWKbOSRVrL3B9tUFr/yOLNRxRFdwMwednfjJv8dHB0MJnZpYT99GDlnUb
 o3ZoQYsIfKG1xz0jOnOSU8OwaAk6wyWSc+waLqDM32pCysd+PJZQsjVIphNd47aLz5ML
 bwjX8RE6HELwPN4SWRhikDtfhjiR5adTTppierdSXOzoBCHi0EeLamqgbRNlgoAgyNAU
 gfBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFMQsOYSxOPwZ2brIXTXvrUHp4sP5qf5TbiRncoTI3/LL7lFC2429P6D/h6XZvlN8WHbr7WH3lZfk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb6WcVTu3Kf9J0zffWITjGYfHsHWu/HqK9csEckfhiYkG996Mh
 HA1Z4I+i+2LCscF4Mt1AOAXQbYlk7MzKGsux711d1fw/hSqszZNXM+fudJrqZNnUQhvfllXwMIY
 UWJQFTEpyjPGtoEw5tshQWXqbUj4=
X-Gm-Gg: ASbGnctR5z/eJUXScKGt7ibs1hzzxR/ZdCBM413uz2aO2YcKlU3hXdbZJ0CSwgiOavb
 EFVyzTCzQRrX/IXxk41pk9lWeU3XwG0q9VNXeljSiryG66A42w2V6VGr5b6yHW9FRQd+StxnC2A
 ==
X-Google-Smtp-Source: AGHT+IE8DKcyHRlcVZTAi4KF6Sh5KbjMdfB2KDTubvGG7HEDVbAuM4dGu6BtK52l5l2xucBK9g38u/USqfRqqkbnJB4=
X-Received: by 2002:a05:6000:184b:b0:38d:b113:eb8 with SMTP id
 ffacd0b85a97d-38dea26ecebmr7135274f8f.20.1739459019532; Thu, 13 Feb 2025
 07:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20250212075845.11338-1-clamor95@gmail.com>
 <20250212075845.11338-3-clamor95@gmail.com>
 <Z64IPpW5Uhad4HjU@smile.fi.intel.com>
In-Reply-To: <Z64IPpW5Uhad4HjU@smile.fi.intel.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 13 Feb 2025 17:03:27 +0200
X-Gm-Features: AWEUYZmUj-krca9nu8UVllaTPCZQMTjt3IELvxYIQkmFcH7UwZphBSmDpexxcjA
Message-ID: <CAPVz0n3TTrkfARQNWfhgJd0sNnUTTdX8vx8hnHDZMq+p9aK_wA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mfd: lm3533: convert to use OF
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, 
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

=D1=87=D1=82, 13 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 16:57 Andy=
 Shevchenko
<andriy.shevchenko@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Feb 12, 2025 at 09:58:42AM +0200, Svyatoslav Ryhel wrote:
> > Add ability to fill pdata from device tree. Common stuff is
> > filled from core driver and then pdata is filled per-device
> > since all cells are optional.
>
> ...
>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/mfd/core.h>
>
> > +#include <linux/of.h>
>
> Is it used? In any case, please no OF-centric APIs in a new (feature) cod=
e.
>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
>
> ...
>
> > +static int lm3533_pass_of_node(struct platform_device *pdev,
>
> pass_of_node sounds a bit awkward.
> Perhaps you thought about parse_fwnode ?
>
> > +                            struct lm3533_als_platform_data *pdata)
> > +{
> > +     struct device *parent_dev =3D pdev->dev.parent;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct fwnode_handle *node;
> > +     const char *label;
> > +     int val, ret;
> > +
> > +     device_for_each_child_node(parent_dev, node) {
> > +             fwnode_property_read_string(node, "compatible", &label);
> > +
> > +             if (!strcmp(label, pdev->name)) {
>
> This is a bit strange. Why one need to compare platform device instance (=
!)
> name with compatible which is part of ABI. This looks really wrong approa=
ch.
> Needs a very good explanation on what's going on here.
>
> Besides that the label is usually filled by LEDS core, why do we need to =
handle
> it in a special way?
>
> > +                     ret =3D fwnode_property_read_u32(node, "reg", &va=
l);
> > +                     if (ret) {
> > +                             dev_err(dev, "reg property is missing: re=
t %d\n", ret);
> > +                             return ret;
> > +                     }
> > +
> > +                     if (val =3D=3D pdev->id) {
>
> > +                             dev->fwnode =3D node;
> > +                             dev->of_node =3D to_of_node(node);
>
> No direct access to fwnode in struct device, please use device_set_node()=
.
>
> > +                     }
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
>
> ...
>
> >       pdata =3D dev_get_platdata(&pdev->dev);
> >       if (!pdata) {
> > -             dev_err(&pdev->dev, "no platform data\n");
> > -             return -EINVAL;
> > +             pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KE=
RNEL);
> > +             if (!pdata)
> > +                     return -ENOMEM;
> > +
> > +             ret =3D lm3533_pass_of_node(pdev, pdata);
> > +             if (ret)
> > +                     return dev_err_probe(&pdev->dev, ret,
> > +                                          "failed to get als device no=
de\n");
>
> With
>
>         struct device *dev =3D &pdev->dev;
>
> at the top of the function will help a lot in making the code neater and =
easier
> to read.
>
> > +             lm3533_parse_als(pdev, pdata);
> >       }
>
> ...
>
> >  #include <linux/leds.h>
> >  #include <linux/mfd/core.h>
> >  #include <linux/mutex.h>
>
> > +#include <linux/of.h>
>
> Cargo cult? "Proxy" header? Please follow IWYU principle.
>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/slab.h>
>
> ...
>
> > +static void lm3533_parse_led(struct platform_device *pdev,
> > +                          struct lm3533_led_platform_data *pdata)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     int val, ret;
> > +
> > +     ret =3D device_property_read_string(dev, "default-trigger",
> > +                                       &pdata->default_trigger);
> > +     if (ret)
> > +             pdata->default_trigger =3D "none";
>
> Isn't this done already in LEDS core?
>
> > +     /* 5000 - 29800 uA (800 uA step) */
> > +     ret =3D device_property_read_u32(dev, "max-current-microamp", &va=
l);
> > +     if (ret)
> > +             val =3D 5000;
> > +     pdata->max_current =3D val;
> > +
> > +     /* 0 - 0x3f */
> > +     ret =3D device_property_read_u32(dev, "pwm", &val);
> > +     if (ret)
> > +             val =3D 0;
> > +     pdata->pwm =3D val;
> > +}
>
> ...
>
> > +static int lm3533_pass_of_node(struct platform_device *pdev,
> > +                            struct lm3533_led_platform_data *pdata)
>
> I think I already saw exactly the same piece of code. Please make sure
> you have no duplications.
>
> > +}
>
> ...
>
> >       pdata =3D dev_get_platdata(&pdev->dev);
> >       if (!pdata) {
> > -             dev_err(&pdev->dev, "no platform data\n");
> > -             return -EINVAL;
> > +             pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KE=
RNEL);
> > +             if (!pdata)
> > +                     return -ENOMEM;
> > +
> > +             ret =3D lm3533_pass_of_node(pdev, pdata);
> > +             if (ret)
> > +                     return dev_err_probe(&pdev->dev, ret,
> > +                                          "failed to get led device no=
de\n");
> > +
> > +             lm3533_parse_led(pdev, pdata);
>
> Ditto.
>
> >       }
>
> ...
>
> > -     led->cdev.name =3D pdata->name;
> > +     led->cdev.name =3D dev_name(&pdev->dev);
>
> Are you sure it's a good idea?
>
> ...
>
> > -     if (!pdata->als)
> > +     if (!pdata->num_als)
> >               return 0;
> >
> > -     lm3533_als_devs[0].platform_data =3D pdata->als;
> > -     lm3533_als_devs[0].pdata_size =3D sizeof(*pdata->als);
> > +     if (pdata->num_als > ARRAY_SIZE(lm3533_als_devs))
> > +             pdata->num_als =3D ARRAY_SIZE(lm3533_als_devs);
>
> Looks like you want
>
>         pdata->num_als =3D clamp(pdata->num_als, 0, ARRAY_SIZE(lm3533_als=
_devs));
>         if (!pdata->num_als)
>                 return 0;
>
> instead of the above. You would need minmax.h for that.
>
> ...
>
> > +     if (pdata->leds) {
>
> This is strange. I would expect num_leds =3D=3D 0 in this case
>
> > +             for (i =3D 0; i < pdata->num_leds; ++i) {
> > +                     lm3533_led_devs[i].platform_data =3D &pdata->leds=
[i];
> > +                     lm3533_led_devs[i].pdata_size =3D sizeof(pdata->l=
eds[i]);
> > +             }
> >       }
>
> ...
>
> > +static void lm3533_parse_nodes(struct lm3533 *lm3533,
> > +                            struct lm3533_platform_data *pdata)
> > +{
> > +     struct fwnode_handle *node;
> > +     const char *label;
> > +
> > +     device_for_each_child_node(lm3533->dev, node) {
> > +             fwnode_property_read_string(node, "compatible", &label);
> > +
> > +             if (!strcmp(label, lm3533_bl_devs[pdata->num_backlights].=
name))
> > +                     pdata->num_backlights++;
> > +
> > +             if (!strcmp(label, lm3533_led_devs[pdata->num_leds].name)=
)
> > +                     pdata->num_leds++;
> > +
> > +             if (!strcmp(label, lm3533_als_devs[pdata->num_als].name))
> > +                     pdata->num_als++;
> > +     }
> > +}
>
> Oh, I don't like this approach. If you have compatible, you have driver_d=
ata
> available, all this is not needed as it may be hard coded.
>
> ...
>
> >       if (!pdata) {
>
> I would expect actually that legacy platform data support will be simply =
killed
> by this patch(es). Do we have in-kernel users? If so, they can be easily
> converted to use software nodes, otherwise we even don't need to care.
>
> > -             dev_err(lm3533->dev, "no platform data\n");
> > -             return -EINVAL;
> > +             pdata =3D devm_kzalloc(lm3533->dev, sizeof(*pdata), GFP_K=
ERNEL);
> > +             if (!pdata)
> > +                     return -ENOMEM;
> > +
> > +             ret =3D device_property_read_u32(lm3533->dev,
> > +                                            "ti,boost-ovp",
> > +                                            &pdata->boost_ovp);
> > +             if (ret)
> > +                     pdata->boost_ovp =3D LM3533_BOOST_OVP_16V;
> > +
> > +             ret =3D device_property_read_u32(lm3533->dev,
> > +                                            "ti,boost-freq",
> > +                                            &pdata->boost_freq);
> > +             if (ret)
> > +                     pdata->boost_freq =3D LM3533_BOOST_FREQ_500KHZ;
> > +
> > +             lm3533_parse_nodes(lm3533, pdata);
> > +
> > +             lm3533->dev->platform_data =3D pdata;
> >       }
>
> ...
>
> > +static const struct of_device_id lm3533_match_table[] =3D {
> > +     { .compatible =3D "ti,lm3533" },
> > +     { },
>
> No comma in the terminator entry.
>
> > +};
>
> ...
>
> > +static void lm3533_parse_backlight(struct platform_device *pdev,
>
> pdev is not actually used, just pass struct device *dev directly.
> Same comment to other functions in this change. It will make code more
> bus independent and reusable.
>
> > +                                struct lm3533_bl_platform_data *pdata)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     int val, ret;
> > +
> > +     /* 5000 - 29800 uA (800 uA step) */
> > +     ret =3D device_property_read_u32(dev, "max-current-microamp", &va=
l);
> > +     if (ret)
> > +             val =3D 5000;
> > +     pdata->max_current =3D val;
>
> > +     /* 0 - 255 */
> > +     ret =3D device_property_read_u32(dev, "default-brightness", &val)=
;
> > +     if (ret)
> > +             val =3D LM3533_BL_MAX_BRIGHTNESS;
> > +     pdata->default_brightness =3D val;
>
> Isn't handled by LEDS core?
>
> > +     /* 0 - 0x3f */
> > +     ret =3D device_property_read_u32(dev, "pwm", &val);
> > +     if (ret)
> > +             val =3D 0;
> > +     pdata->pwm =3D val;
> > +}
>
> ...
>
> > +static int lm3533_pass_of_node(struct platform_device *pdev,
> > +                            struct lm3533_bl_platform_data *pdata)
> > +{
>
> 3rd dup?
>
> > +}
>
> ...
>
> >       pdata =3D dev_get_platdata(&pdev->dev);
> >       if (!pdata) {
> > -             dev_err(&pdev->dev, "no platform data\n");
> > -             return -EINVAL;
> > +             pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KE=
RNEL);
> > +             if (!pdata)
> > +                     return -ENOMEM;
> > +
> > +             ret =3D lm3533_pass_of_node(pdev, pdata);
> > +             if (ret)
> > +                     return dev_err_probe(&pdev->dev, ret,
> > +                                          "failed to get backlight dev=
ice node\n");
> > +
> > +             lm3533_parse_backlight(pdev, pdata);
> >       }
>
> Ditto.
>
> > -     bd =3D devm_backlight_device_register(&pdev->dev, pdata->name,
> > -                                     pdev->dev.parent, bl, &lm3533_bl_=
ops,
> > -                                     &props);
> > +     bd =3D devm_backlight_device_register(&pdev->dev, dev_name(&pdev-=
>dev),
>
> I'm not sure the dev_name() is a good idea. We usually try to rely on the
> predictable outcome, something like what "%pfw" prints against a certain =
fwnode.
>
> > +                                         pdev->dev.parent, bl,
> > +                                         &lm3533_bl_ops, &props);
>
> ...
>
> Also I feel that this change may be split to a few separate logical chang=
es.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Acknowledged, thank you.
