Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6E04C15A2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 15:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC8E10EB67;
	Wed, 23 Feb 2022 14:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2741810EB56
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 14:46:06 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id bq11so23267176edb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 06:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ofG14EmgPlrKEqqyIh5UqepsSkm3T8XbQq0Ltdyzk0E=;
 b=ifWeOf5a1xNMgmToLHGdVkFvc+RCDmqOZKibOs0aIiHeGj+umbKg3Rj9e5GN7lrsDI
 BevCF5jQVWQRVfQPmubagewcMlOzq0Aza2uvjC+3jjOgm+iZBQu+zMZtZUxbnXgTohgU
 VElZMlKq3BeFYc3Zrd5riuUHtMCq/BHTTYyS7KrpC8rVDYcKHhaXa8xGY7SjN5iV1Ztl
 X+TsN/TY9ws6UO4TgFq3uucHEoOEVSra/C7jQbVnALyd0INb9tLeM8RUKgyF4m4HtMBn
 6EIlLn6njr6ttD/Ut8136Ebg1IOqeKn0ekehjOtmDNH/bBwmRDZXfXquIhJgXIFa7b8L
 Xovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ofG14EmgPlrKEqqyIh5UqepsSkm3T8XbQq0Ltdyzk0E=;
 b=NF76Nia6eh9jgrc3bjZvYneRslpQn2eC+AgCuITGDVJPeHNWyhTWFU2JVydC8Rbn+V
 w+b/NwccAgjiyzptDtKcQuQCx3rHqfflCl278RwosGflzVMLtvDha48HD7rosmbS6mmo
 QA6u03UVw4XLi/BuKs/q+DMC8hWyCvXtbJI+65OcJv1m5pSKwJ8H+gk35jCHUs5KXgIy
 BRFmCaNYospNtqyYS90FDsLGrSImV9nXkjwypEcVLyuuT63vjsf4H4T9cTtAIS6a6gga
 Ase5Tep8wyyTU52lYP5vBMlfKEIzRalvIngE6U4VGc/mkafDLpmSlI0CLTl9WbMaXA3E
 xhJw==
X-Gm-Message-State: AOAM532++aiPdsFvvNewO0i3h8uob7YJxBXbZ0Ai3h7bVVY9kf/D4iPn
 9j81czj7+aOkuC714bUdgsjkYyr6Dxw=
X-Google-Smtp-Source: ABdhPJzyUx0boPqjkUGK0Sr7qYA0st6Rtg9C5mSt7Pi2yY3IuFfjRyC8pjRv7uUvDx2Fwn3rM4hBiA==
X-Received: by 2002:aa7:d415:0:b0:410:a0fa:dc40 with SMTP id
 z21-20020aa7d415000000b00410a0fadc40mr31519185edq.46.1645627564437; 
 Wed, 23 Feb 2022 06:46:04 -0800 (PST)
Received: from orome (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id ka26sm3070400ejc.170.2022.02.23.06.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 06:46:03 -0800 (PST)
Date: Wed, 23 Feb 2022 15:46:01 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH libdrm v2 20/25] tests: tegra: Add VIC 4.0 support
Message-ID: <YhZIqTCn/NmR7KAF@orome>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
 <20220217191931.2534836-15-thierry.reding@gmail.com>
 <aecb46db-20c6-61d4-ffde-798b42842a7d@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MtWCWDlAi0rB5gZO"
Content-Disposition: inline
In-Reply-To: <aecb46db-20c6-61d4-ffde-798b42842a7d@kapsi.fi>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--MtWCWDlAi0rB5gZO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2022 at 11:29:34AM +0200, Mikko Perttunen wrote:
> On 2/17/22 21:19, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The Video Image Composer (VIC) 4.0 can be found on NVIDIA Tegra210 SoCs.
> > It uses a different class (B0B6) that is slightly incompatible with the
> > class found on earlier generations.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   tests/tegra/meson.build |   2 +
> >   tests/tegra/vic.c       |   7 +
> >   tests/tegra/vic40.c     | 370 ++++++++++++++++++++++++++++++++++++++++
> >   tests/tegra/vic40.h     | 285 +++++++++++++++++++++++++++++++
> >   4 files changed, 664 insertions(+)
> >   create mode 100644 tests/tegra/vic40.c
> >   create mode 100644 tests/tegra/vic40.h
> >=20
> > diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
> > index 1ee29d0afe1b..e9c2bc875a01 100644
> > --- a/tests/tegra/meson.build
> > +++ b/tests/tegra/meson.build
> > @@ -36,6 +36,8 @@ libdrm_test_tegra =3D static_library(
> >       'vic.h',
> >       'vic30.c',
> >       'vic30.h',
> > +    'vic40.c',
> > +    'vic40.h',
> >     ), config_file ],
> >     include_directories : [inc_root, inc_drm, inc_tegra],
> >     link_with : libdrm,
> > diff --git a/tests/tegra/vic.c b/tests/tegra/vic.c
> > index f24961ac5c6d..e0a97c059eca 100644
> > --- a/tests/tegra/vic.c
> > +++ b/tests/tegra/vic.c
> > @@ -134,6 +134,10 @@ void vic_image_dump(struct vic_image *image, FILE =
*fp)
> >   int vic30_new(struct drm_tegra *drm, struct drm_tegra_channel *channe=
l,
> >                 struct vic **vicp);
> > +/* from vic40.c */
> > +int vic40_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
> > +              struct vic **vicp);
> > +
> >   int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
> >               struct vic **vicp)
> >   {
> > @@ -144,6 +148,9 @@ int vic_new(struct drm_tegra *drm, struct drm_tegra=
_channel *channel,
> >       switch (version) {
> >       case 0x40:
> >           return vic30_new(drm, channel, vicp);
> > +
> > +    case 0x21:
> > +        return vic40_new(drm, channel, vicp);
> >       }
> >       return -ENOTSUP;
> > diff --git a/tests/tegra/vic40.c b/tests/tegra/vic40.c
> > new file mode 100644
> > index 000000000000..1a5d2af6b0b6
> > --- /dev/null
> > +++ b/tests/tegra/vic40.c
> > @@ -0,0 +1,370 @@
> > +/*
> > + * Copyright =C2=A9 2018 NVIDIA Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be incl=
uded in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#include <errno.h>
> > +#include <string.h>
> > +
> > +#include "private.h"
> > +#include "tegra.h"
> > +#include "vic.h"
> > +#include "vic40.h"
> > +
> > +struct vic40 {
> > +    struct vic base;
> > +
> > +    struct {
> > +        struct drm_tegra_mapping *map;
> > +        struct drm_tegra_bo *bo;
> > +    } config;
> > +
> > +    struct {
> > +        struct drm_tegra_mapping *map;
> > +        struct drm_tegra_bo *bo;
> > +    } filter;
> > +
> > +    struct {
> > +        struct drm_tegra_mapping *map;
> > +        struct drm_tegra_bo *bo;
> > +    } hist;
> > +};
>=20
> Histogram buffer not necessary at least on VIC4.0 and later. (Same applies
> to VIC4.1 and VIC4.2 patches).

I'm pretty sure that I saw SMMU faults without this on all of Tegra210,
Tegra186 and Tegra194. I'll go and test this once more.

> Also not sure if it's worth duplicating all this for the very minor
> differences between VIC4.0/4.1/4.2?

In practice you would likely want to compress this a bit. However, as I
mentioned before this is meant to serve as a reference implementation
and therefore it's a bit more verbose than it would be in a more
practical use-case.

Thierry

--MtWCWDlAi0rB5gZO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIWSKcACgkQ3SOs138+
s6G2rQ//apIHDUwK0UN5DJgdGuHkywdrwXQqBnMAmLhbqAB0KlHjOSyQs8TwPmQK
izsazXyj7qYBlDdVK9vrCLfIuQUdQvlTBr9htNGsdma7IvNX068mX+X6ohBx2fiC
J8wVFe1Eo68R7puqp5lR3HQoePhTxM0aZEKiOJ0O92j7C1uFSsnrvZ2G/xMSQ+S/
B4tp22jbYVU+tkOLpObsiUTihHcvaxB/TY6laFrasZtTlpC6NU3Sj2zhNp7UWevx
aKz9BjPWPK9s+MAMzF9+nbZloJtFijMOARn+PT3A30dN/kuhFEYvWGmtMmrRoHnX
qy4jAUHODZIWPDuWjXdnCImbuNfRP9VbC8YoJ9ZTEGqPU14WGwFWmDpGGMAXJiy/
t2WDEMqscn5cO34RnFZx7DeY/ib3XxUeePF9tqGdRKryUndkYrsVCPEuVyufxtPH
hlgJskcxAG9A58NU9p23FvG2saZxvd1WK7fkUvWsDIPzOSe3Ry+SDTzDpRjg9493
LA75eMf7gxHUvE/ZEUj256DkhxICM3tHjWBEo9IDb5/+Z3xe4+BhnEb1bdfEn79V
UvcsMGuXsx/63GpfhmEo2oq7Gv8R2ih+RmXt9RcsTrVLtf7mIYa9el/0Rl2iwUnn
O7Q8by7FHPkTmyECNhom5k9dQby+wK626XtbqAgO9PP/i2BlRVY=
=er/x
-----END PGP SIGNATURE-----

--MtWCWDlAi0rB5gZO--
