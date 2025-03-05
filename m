Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887EEA5019F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BD610E790;
	Wed,  5 Mar 2025 14:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b/lVWU3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2578110E78E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 14:18:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43bb6b0b898so32771165e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 06:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741184329; x=1741789129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uVxEKUGPmST9SVCsY1zuL15uHcxYusVnASOLADTY7W0=;
 b=b/lVWU3fT8tiCpSJ5orjBi8/2t/KxMQNwyc/IU8ZZntH30K9REAt1m3kpfTL4LhZvF
 PxtHns6o3/LdqD/A17mCAOUrx33yOrSbgz1OaHh3cvg8prp67Egc7rukPetUHcW8VQ2X
 fh/XorsK3u+oqJcLQi3yqV8XEQwrLy4I3/oV1h2S+DclUuzP38DWYpLg8VGttA07dV3C
 v3HRyQe2jH3Xf/QKy38+BjHc5UHnL9BCDeS820TnqP505TteL6G0dVSZ3wGUsyHbfYWx
 HXZgE6bwVOcyyrwbZ02CZA6aVaib7a7k34mrkOpWZ4Z1RP7Khw9RQmGhexfq7MykDbwF
 EMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741184329; x=1741789129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uVxEKUGPmST9SVCsY1zuL15uHcxYusVnASOLADTY7W0=;
 b=k41QmiKPrsWqWJPQekeJ9HqLkDhGqrS90WwhXbT7XuTx2ToW19Mp2ra2TQpPvh2soP
 sjevAVg3m7TLi+NjYq/oM5O1VOzzl/OC/Kv33J1lrGJKRaenvOATiZ5RAnLCFWme0khm
 ciUTxYnEf49w2qdeus7pBv0YPeatXXRXvFTdyoRuHB3J/Dhg4HjmabdqRGM0NjSOFN7x
 CaDK3NqmP5CMI5x0KiA6Q5i7w+bXlU12c+3HVsE2ppv872Qwv7LLaQ5YhVyLLNmYKuug
 fUU0AgpDQzGb8PJVgTXQgIR/9v/hYOldWqhWNXxFTk1oeI2QwomzmPmjOoN1S8rm8sq6
 eNyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWChWgkENeismWUEAoZ4lOoPyyE7L7Y740cjtBg/zoBOkANajGfu1sH+NGMDpMTpxMHt15H979hkJE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLRB5yjw6bZI2ZmaBf6Yt7D3LJDEwmZYWrmHlzMFPhcYZZOzH7
 QNswDhjBcXbMbU2a+jApwaW0+6HrnTbTCpZFbgMT0BYbUhjLoB98nhrSmCsSyl5BgLelCp6OinX
 HaBRQ2koMc54IgNaGE1jhPrIxBnw=
X-Gm-Gg: ASbGnctyV9W2AE/3w6U+dmfgpqKzBoOGzTQluLPdQttk8n3z9+KlKMogpIR7Ret8dNA
 XN6jjkkECvqbN0UvaIe0kSQUQjBwu5FXv5bxIcszQdnmFOR3oMG1iA6RSPMd3iT+aL/gwgW/i5j
 sI2Ad/G0BFAYXAg/UCHW4b7XbxOkw=
X-Google-Smtp-Source: AGHT+IGtt5kKKBiJjBbm2DU1GbYl+vKb+nT4lkgnAmQUxI2KsqJnS5S/wjYJqyjYIYU15T1CQievr7HPF4XKPY8Qlu8=
X-Received: by 2002:a5d:5986:0:b0:38d:d664:67d8 with SMTP id
 ffacd0b85a97d-3911f7200cbmr2836278f8f.11.1741184329266; Wed, 05 Mar 2025
 06:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20250224114815.146053-1-clamor95@gmail.com>
 <20250224114815.146053-3-clamor95@gmail.com>
 <20250228085927.GM824852@google.com>
 <CAPVz0n0jaR=UM7WbBs3zM-cZzuaPVWBjf4Q7i82hvxtXg2oCzQ@mail.gmail.com>
 <20250305134455.2843f603@jic23-huawei>
In-Reply-To: <20250305134455.2843f603@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 5 Mar 2025 16:18:38 +0200
X-Gm-Features: AQ5f1JpXA6J5TL49b1DAVq6n5wnuuTukD3GyYGoSYEpxJIiUmzK9BkiZvUPOFTs
Message-ID: <CAPVz0n3Qt00my1ejoyEgxTRi-mQszHybwhPq70eO=94oxMfECQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mfd: lm3533: convert to use OF
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

=D1=81=D1=80, 5 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 15:45 Jonat=
han Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, 28 Feb 2025 11:30:51 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > =D0=BF=D1=82, 28 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 10:59 =
Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Mon, 24 Feb 2025, Svyatoslav Ryhel wrote:
> > >
> > > > Remove platform data and fully relay on OF and device tree
> > > > parsing and binding devices.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/iio/light/lm3533-als.c      |  40 ++++---
> > > >  drivers/leds/leds-lm3533.c          |  46 +++++---
> > > >  drivers/mfd/lm3533-core.c           | 159 ++++++++----------------=
----
> > > >  drivers/video/backlight/lm3533_bl.c |  71 ++++++++++---
> > > >  include/linux/mfd/lm3533.h          |  35 +-----
> > > >  5 files changed, 164 insertions(+), 187 deletions(-)
> > > >
...
> > > >       /* ALS input is always high impedance in PWM-mode. */
> > > > -     if (!pdata->pwm_mode) {
> > > > -             ret =3D lm3533_als_set_resistor(als, pdata->r_select)=
;
> > > > +     if (!als->pwm_mode) {
> > > > +             ret =3D lm3533_als_set_resistor(als, als->r_select);
> > >
> > > You're already passing 'als'.
> > >
> > > Just teach lm3533_als_set_resistor that 'r_select' is now contained.
> > >
> >
> > This is not scope of this patchset. I was already accused in too much
> > changes which make it unreadable. This patchset is dedicated to
> > swapping platform data to use of the device tree. NOT improving
> > functions, NOT rewriting arbitrary mechanics. If you feed a need for
> > this change, then propose a followup. I need from this driver only one
> > thing, that it could work with device tree. But it seems that it is
> > better that it just rots in the garbage bin until removed cause no one
> > cared.
>
> This is not an unreasonable request as you added r_select to als.
> Perhaps it belongs in a separate follow up patch.

I have just moved values used in pdata to private structs of each
driver. Without changing names or purpose.

> However
> it is worth remembering the motivation here is that you want get
> this code upstream, the maintainers don't have that motivation.

This driver is already upstream and it is useless and incompatible
with majority of supported devices. Maintainers should encourage those
who try to help and instead we have what? A total discouragement. Well
defined path into nowhere.

>
> Greg KH has given various talks on the different motivations in the
> past. It maybe worth a watch.
>
>
> >
> > > >               if (ret)
> > > >                       return ret;
> > > >       }
> > > > @@ -828,22 +833,16 @@ static const struct iio_info lm3533_als_info =
=3D {
> > > >
> > > >  static int lm3533_als_probe(struct platform_device *pdev)
> > > >  {
> > > > -     const struct lm3533_als_platform_data *pdata;
> > > >       struct lm3533 *lm3533;
> > > >       struct lm3533_als *als;
> > > >       struct iio_dev *indio_dev;
> > > > +     u32 val;
> > >
> > > Value of what, potatoes?
> > >
> >
> > Oranges.
>
> A well named variable would avoid need for any discussion of
> what it is the value of.
>

This is temporary placeholder used to get values from the tree and
then pass it driver struct.

> >
> > > >       int ret;
> > > >
> > > >       lm3533 =3D dev_get_drvdata(pdev->dev.parent);
> > > >       if (!lm3533)
> > > >               return -EINVAL;
> > > >
> > > > -     pdata =3D dev_get_platdata(&pdev->dev);
> > > > -     if (!pdata) {
> > > > -             dev_err(&pdev->dev, "no platform data\n");
> > > > -             return -EINVAL;
> > > > -     }
> > > > -
> > > >       indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*als))=
;
> > > >       if (!indio_dev)
> > > >               return -ENOMEM;
> > > > @@ -864,13 +863,21 @@ static int lm3533_als_probe(struct platform_d=
evice *pdev)
> > > >
> > > >       platform_set_drvdata(pdev, indio_dev);
> > > >
> > > > +     val =3D 200 * KILO; /* 200kOhm */
> > >
> > > Better to #define magic numbers; DEFAULT_{DESCRIPTION}_OHMS
> > >
> >
> > Why? that is not needed.
> If this variable had a more useful name there would be no need for
> the comment either.
>
>         val_resitor_ohms =3D 200 * KILLO;
>
> or similar.
>

So I have to add a "reasonably" named variable for each property I
want to get from device tree? Why? It seems to be a bit of overkill,
no? Maybe I am not aware, have variables stopped being reusable?

> >
> > > > +     device_property_read_u32(&pdev->dev, "ti,resistor-value-ohm",=
 &val);
> > > > +
> > > > +     /* Convert resitance into R_ALS value with 2v / 10uA * R */
> > >
> > > Because ...
> > >
> >
> > BACAUSE the device DOES NOT understand human readable values, only 0s
> > and 1s, hence mOhms must be converted into value lm3533 chip can
> > understand.
> A comment that gave the motivation would be much more useful than
> repeating the maths.
>
> /* Convert resistance to equivalent register value */
>

ok, this is reasonable.

> >
> > > > +     als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * val);
> > > > +
> > > > +     als->pwm_mode =3D device_property_read_bool(&pdev->dev, "ti,p=
wm-mode");
> > > > +
> > > >       if (als->irq) {
> > > >               ret =3D lm3533_als_setup_irq(als, indio_dev);
> > > >               if (ret)
> > > >                       return ret;
> > > >       }
> > > >
> > > > -     ret =3D lm3533_als_setup(als, pdata);
> > > > +     ret =3D lm3533_als_setup(als);
> > > >       if (ret)
> > > >               goto err_free_irq;
> > > >
> > > > @@ -907,9 +914,16 @@ static void lm3533_als_remove(struct platform_=
device *pdev)
> > > >               free_irq(als->irq, indio_dev);
> > > >  }
> > > >
> > > > +static const struct of_device_id lm3533_als_match_table[] =3D {
> > > > +     { .compatible =3D "ti,lm3533-als" },
> > > > +     { }
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, lm3533_als_match_table);
> > > > +
> > > >  static struct platform_driver lm3533_als_driver =3D {
> > > >       .driver =3D {
> > > >               .name   =3D "lm3533-als",
> > > > +             .of_match_table =3D lm3533_als_match_table,
> > > >       },
> > > >       .probe          =3D lm3533_als_probe,
> > > >       .remove         =3D lm3533_als_remove,
>
> Anyhow, I'm short on time so only looking at the IIO related part.
>
> Jonathan
