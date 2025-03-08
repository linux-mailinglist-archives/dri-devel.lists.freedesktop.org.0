Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AB0A57C48
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 18:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C432810E265;
	Sat,  8 Mar 2025 17:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MrnmAze8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5052D10E265
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 17:19:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C4EACA45A03;
 Sat,  8 Mar 2025 17:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392D4C4CEE0;
 Sat,  8 Mar 2025 17:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741454384;
 bh=WIXPEAfYW6XziCXxNrSUx8MTO0qn8BfggsX4aIVdclE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MrnmAze88WmBN/BzwaskCEYUl/E7BBXL4zio3IYdhby50e3KiZaPauGIURpacE/Dw
 UBb+o9RKvUtD8FZcx+9DBz69KbwMmZvn2ADR3VrAbBy/2I1GDssGYJO/4K4wzG8GHO
 ZNbnsL1ebkV6GXU+0h1iUkYgnp4fYYw0r6cpHTSamn2fJL7YrK3H+DbBSVhBrHd79z
 4+8kH/U1hj2tQWYIYiWfT6rJ+xAVemaQUqHdmxSzu99yAMjBKruAuTJ6pwXAwXukK4
 3H6s/bCklWlVZPO+/buxuUFR+Kh2tQE6JcuTP6m2tyv9PI3eg6FIP25uHYQWvuJQmp
 EmH1Nmlv0ciDg==
Date: Sat, 8 Mar 2025 17:19:32 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>, Daniel
 Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge
 Deller <deller@gmx.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mfd: lm3533: convert to use OF
Message-ID: <20250308171932.2a5f0a9b@jic23-huawei>
In-Reply-To: <CAPVz0n3Qt00my1ejoyEgxTRi-mQszHybwhPq70eO=94oxMfECQ@mail.gmail.com>
References: <20250224114815.146053-1-clamor95@gmail.com>
 <20250224114815.146053-3-clamor95@gmail.com>
 <20250228085927.GM824852@google.com>
 <CAPVz0n0jaR=UM7WbBs3zM-cZzuaPVWBjf4Q7i82hvxtXg2oCzQ@mail.gmail.com>
 <20250305134455.2843f603@jic23-huawei>
 <CAPVz0n3Qt00my1ejoyEgxTRi-mQszHybwhPq70eO=94oxMfECQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Wed, 5 Mar 2025 16:18:38 +0200
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> =D1=81=D1=80, 5 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 15:45 Jon=
athan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Fri, 28 Feb 2025 11:30:51 +0200
> > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > =20
> > > =D0=BF=D1=82, 28 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 10:5=
9 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5: =20
> > > >
> > > > On Mon, 24 Feb 2025, Svyatoslav Ryhel wrote:
> > > > =20
> > > > > Remove platform data and fully relay on OF and device tree
> > > > > parsing and binding devices.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/iio/light/lm3533-als.c      |  40 ++++---
> > > > >  drivers/leds/leds-lm3533.c          |  46 +++++---
> > > > >  drivers/mfd/lm3533-core.c           | 159 ++++++++--------------=
------
> > > > >  drivers/video/backlight/lm3533_bl.c |  71 ++++++++++---
> > > > >  include/linux/mfd/lm3533.h          |  35 +-----
> > > > >  5 files changed, 164 insertions(+), 187 deletions(-)
> > > > > =20
> ...
> > > > >       /* ALS input is always high impedance in PWM-mode. */
> > > > > -     if (!pdata->pwm_mode) {
> > > > > -             ret =3D lm3533_als_set_resistor(als, pdata->r_selec=
t);
> > > > > +     if (!als->pwm_mode) {
> > > > > +             ret =3D lm3533_als_set_resistor(als, als->r_select)=
; =20
> > > >
> > > > You're already passing 'als'.
> > > >
> > > > Just teach lm3533_als_set_resistor that 'r_select' is now contained.
> > > > =20
> > >
> > > This is not scope of this patchset. I was already accused in too much
> > > changes which make it unreadable. This patchset is dedicated to
> > > swapping platform data to use of the device tree. NOT improving
> > > functions, NOT rewriting arbitrary mechanics. If you feed a need for
> > > this change, then propose a followup. I need from this driver only one
> > > thing, that it could work with device tree. But it seems that it is
> > > better that it just rots in the garbage bin until removed cause no one
> > > cared. =20
> >
> > This is not an unreasonable request as you added r_select to als.
> > Perhaps it belongs in a separate follow up patch. =20
>=20
> I have just moved values used in pdata to private structs of each
> driver. Without changing names or purpose.
>=20
> > However
> > it is worth remembering the motivation here is that you want get
> > this code upstream, the maintainers don't have that motivation. =20
>=20
> This driver is already upstream and it is useless and incompatible
> with majority of supported devices. Maintainers should encourage those
> who try to help and instead we have what? A total discouragement. Well
> defined path into nowhere.

That is not how I read the situation. A simple request was made to
result in more maintainable code as a direct result of that
improvement being enabled by code changes you were making.
I'm sorry to hear that discouraged you.

>=20
> >
> > Greg KH has given various talks on the different motivations in the
> > past. It maybe worth a watch.
> >
> > =20
> > > =20
> > > > >               if (ret)
> > > > >                       return ret;
> > > > >       }
> > > > > @@ -828,22 +833,16 @@ static const struct iio_info lm3533_als_inf=
o =3D {
> > > > >
> > > > >  static int lm3533_als_probe(struct platform_device *pdev)
> > > > >  {
> > > > > -     const struct lm3533_als_platform_data *pdata;
> > > > >       struct lm3533 *lm3533;
> > > > >       struct lm3533_als *als;
> > > > >       struct iio_dev *indio_dev;
> > > > > +     u32 val; =20
> > > >
> > > > Value of what, potatoes?
> > > > =20
> > >
> > > Oranges. =20
> >
> > A well named variable would avoid need for any discussion of
> > what it is the value of.
> > =20
>=20
> This is temporary placeholder used to get values from the tree and
> then pass it driver struct.

Better if it is a temporary placeholder with a meaningful name.

>=20
> > > =20
> > > > >       int ret;
> > > > >
> > > > >       lm3533 =3D dev_get_drvdata(pdev->dev.parent);
> > > > >       if (!lm3533)
> > > > >               return -EINVAL;
> > > > >
> > > > > -     pdata =3D dev_get_platdata(&pdev->dev);
> > > > > -     if (!pdata) {
> > > > > -             dev_err(&pdev->dev, "no platform data\n");
> > > > > -             return -EINVAL;
> > > > > -     }
> > > > > -
> > > > >       indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*als=
));
> > > > >       if (!indio_dev)
> > > > >               return -ENOMEM;
> > > > > @@ -864,13 +863,21 @@ static int lm3533_als_probe(struct platform=
_device *pdev)
> > > > >
> > > > >       platform_set_drvdata(pdev, indio_dev);
> > > > >
> > > > > +     val =3D 200 * KILO; /* 200kOhm */ =20
> > > >
> > > > Better to #define magic numbers; DEFAULT_{DESCRIPTION}_OHMS
> > > > =20
> > >
> > > Why? that is not needed. =20
> > If this variable had a more useful name there would be no need for
> > the comment either.
> >
> >         val_resitor_ohms =3D 200 * KILLO;
> >
> > or similar.
> > =20
>=20
> So I have to add a "reasonably" named variable for each property I
> want to get from device tree? Why? It seems to be a bit of overkill,
> no? Maybe I am not aware, have variables stopped being reusable?

Lets go with yes if you want a definitive answer. In reality it's
a question of how many are needed.  If 10-100s sure reuse is fine,
if just a few sensible naming can remove the need for comments
and improve readability.

Jonathan

