Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5ECA3C245
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949F110E18D;
	Wed, 19 Feb 2025 14:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LUFwLugH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B737C10E18D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:36:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso43208275e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 06:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739975810; x=1740580610; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+QTXbtvB5WqPCPZqBXLo7Idaw2Yrfijp1ad/HqmeWbs=;
 b=LUFwLugH5p4P/PD1VuINs+H7ytrV8TXpFdJCfJHXJIwVxYrUgbOSq2mscTTIUZk+Lz
 +3UG62kRV5eF8Ogtf/WzyIed+WEJiCUEaXMbNkgRX/iRQO8Y34wa1xyOCNtH4yWT5ajX
 jJnXUzi4f/vwm0oU1kVhxIS15SruK9oEuPyOihhG92iYe+U4//cOpFKvuOq+rSM6LDq8
 v9rQrV3jMLazR4flBFieXiWf+Bgjmtw6XCd8AigJq7uwrptsrW3QmMVYevd8nWX/dIa1
 Vom9XQwyMnvp9EfBy/EsqcSye5h80i2EmlKr0SRKdor9ze0yIfW489dfRq9xv/Mp4Wzv
 Kzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739975810; x=1740580610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+QTXbtvB5WqPCPZqBXLo7Idaw2Yrfijp1ad/HqmeWbs=;
 b=jyaHwXsyubUfevw7b3J8dWlykIiBggeweb3GkNAD71HT1apHwaUyXsKUe4mW82d4l3
 kB2lUmGUQaL1yH5umGUAMfK5W7LWY8BC4Pj2BnOp2/NR7HaI8YRIhU+zwcz8Kqm9PwGH
 QpSKNW6TIWj2365TKDM0ZI/VsJcMXCcZfV2kc57BLT2w+8/lXHN6EjL8mi4IhvaRAdSL
 HvxZYed0nrBnKRi1ZNe5EEGhUprPi/CbVht3AXnpM92gTGhuz1bW8TmqNwLCBp8ZoIFL
 1J2uWtsyUHFWpg2ZjxgQYCXuJB3d66z1c3V7sY47YwhB+hC67jb0tF92uKpLzbkmSjRP
 R4WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuNLsCuxWP5ZzRQSDmqDm5RyoeE3oSNz1R/c952ALRPGh8YjWdDMldBnvzwG5tyJAY+EnDciJ6T2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJy7KtBvvhreqrvmaw30cAV7JO1M8sCCW2nfpJwPWj+cQ0Gopt
 FVMjmEPJPApQLBZz36S7gXEYi62mapdMbyWocSevta3YOuqz5774BzDs3H6fCa6FtVl6dZ0BTKK
 ZNzwtXoMVrxD7vk7V69akesQsKsQ=
X-Gm-Gg: ASbGncs9Adr6cBU684rN/mEcPSNjXGFVlS80hmhnVup3wRAPR2tvyCBiO6Ku7DS0jEC
 4OddeXE4vvVzw+hAOXlFQdYQoONZGjjvfRI9HIHeHVAM4tE0AQk6BoNZRZFK4nmIpgcY7maJtXA
 ==
X-Google-Smtp-Source: AGHT+IGuUdWXrb/mtz3pDeb/kKeAwZ1uQIcWAmTUWKnQyPJtlEcB5Mz3/TO0x0WLmRb/T6h6Ir38NTvppeBJI0eHa/0=
X-Received: by 2002:a05:600c:4750:b0:439:9828:c425 with SMTP id
 5b1f17b1804b1-4399828c633mr54172835e9.7.1739975809915; Wed, 19 Feb 2025
 06:36:49 -0800 (PST)
MIME-Version: 1.0
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-3-clamor95@gmail.com>
 <Z7XqKcOUt5niXzpv@smile.fi.intel.com>
In-Reply-To: <Z7XqKcOUt5niXzpv@smile.fi.intel.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 19 Feb 2025 16:36:38 +0200
X-Gm-Features: AWEUYZnnp1prjZiOv4DEGghz-JiQuuNsDsxtsmrRfSqxZJkzyQuhOgT8aOgjbHE
Message-ID: <CAPVz0n1_WQyOHhtEVAh53uhEUhZvqqZSEJh6XALtSrVfkMSLYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mfd: lm3533: convert to use OF
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

=D1=81=D1=80, 19 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 16:27 Andy=
 Shevchenko
<andriy.shevchenko@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 18, 2025 at 03:27:00PM +0200, Svyatoslav Ryhel wrote:
> > Remove platform data and fully relay on OF and device tree
> > parsing and binding devices.
>
> Thanks for following the advice, but the problem with this change as it d=
oes
> too much at once. It should be split to a few simpler ones.
> On top of that, this removes MFD participation from the driver but leaves=
 it
> under MFD realm. Moreover, looking briefly at the code it looks like it o=
pen
> codes the parts of MFD. The latter needs a very goo justification which c=
ommit
> message is missing.
>

Splitting this into a set of commits would be nearly impossible,
original driver does not relay on OF, it relays on platform data.
Ripping out platform data will leave behind a broken useless driver.
So it has to be done simultaneously.

MFD part is removed since MFD cells binding is unconditional, while
the device supports any amount of children grater then one. For
example, my  device uses only backlight at bank A, while all other
subdevices are not present and used. This patch switches to dynamic
bind of children.

> ...
>
> > +static const struct of_device_id lm3533_als_match_table[] =3D {
> > +     { .compatible =3D "ti,lm3533-als" },
> > +     { },
>
> No comma for the terminator entry. I think I already pointed that out ear=
lier.
>
> > +};
>
> ...
>
> > +     device_property_read_string(&pdev->dev, "linux,default-trigger",
> > +                                 &led->cdev.default_trigger);
>
> One prerequisite patch you probably want is an introduction of
>
>         struct device *dev =3D &pdev->dev;
>
> in the respective ->probe() implementations. This, in particular, makes t=
he
> above lines shorter and fit one line.
>

This is not a scope of this patchset. Original driver uses &pdev->dev

> ...
>
> > +static const struct of_device_id lm3533_led_match_table[] =3D {
> > +     { .compatible =3D "ti,lm3533-leds" },
> > +     { },
>
> As per above.
>
> > +};
>
> ...
>
> > +             if (!strcmp(comatible, "ti,lm3533-als"))
> > +                     lm3533->have_als =3D 1;
>
> If you end up having this, it's not the best what we can do. OF ID tables=
 have
> a driver_data field exactly for the cases like this.
>

This is required by core driver to handle some attributes and is here
solely not to touch those in this patch.

> ...
>
> > +             if (!strcmp(comatible, "ti,lm3533-backlight"))
> > +                     lm3533->have_backlights =3D 1;
>
> Ditto.
>
> ...
>
> > +             if (!strcmp(comatible, "ti,lm3533-leds"))
> > +                     lm3533->have_leds =3D 1;
>
> Ditto.
>
> ...
>
> > +             ret =3D lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_=
BCONF,
> > +                                 1 << (2 * id + 1), 1 << (2 * id + 1))=
;
>
> BIT() and better to use a temporary variable for this calculation.
>
> > +             if (ret)
> > +                     return ret;
>
> ...
>
> > +             ret =3D lm3533_update(bl->lm3533, LM3533_REG_OUTPUT_CONF1=
,
> > +                                 id | id << 1, BIT(0) | BIT(1));
>
>                 mask =3D GENMASK();
>                 ..., id ? mask : 0, mask);
>
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> ...
>
> > +     bd =3D devm_backlight_device_register(&pdev->dev, pdev->name, pde=
v->dev.parent,
> > +                                         bl, &lm3533_bl_ops, &props);
>
>
> With the advice from above:
>
>         bd =3D devm_backlight_device_register(dev, pdev->name, dev->paren=
t, bl, &lm3533_bl_ops,
>                                             &props);
>
>
> >       if (IS_ERR(bd)) {
> >               dev_err(&pdev->dev, "failed to register backlight device\=
n");
> >               return PTR_ERR(bd);
>
> Consider another prerequisite patch (which should come before the firstly
> proposed one):
>
>         struct device *dev =3D &pdev->dev; // yes, this can go in this ch=
ange
>         ...
>
>         if (IS_ERR(bd))
>                 return dev_err_probe(dev, PTR_ERR(bd), "failed to registe=
r backlight device\n");
>
> ...
>
> > +static const struct of_device_id lm3533_bl_match_table[] =3D {
> > +     { .compatible =3D "ti,lm3533-backlight" },
> > +     { },
>
> As per above.
>
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
