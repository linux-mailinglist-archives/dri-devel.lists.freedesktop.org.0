Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37DD4C15F3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 15:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785E910E55D;
	Wed, 23 Feb 2022 14:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297AB10E551
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 14:58:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id hw13so52704879ejc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 06:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fv8FmGALKcXXiC61Pb90szGF4PWZeFkoGuOLIz8Tk0o=;
 b=lEoeTEWcwx6ipDZoNfBYvGV7e/qMOP9sRZQ24TQdjehlsnUQSmOvgT+6P56eQan/Fx
 Emr5/z6BDELDQbVmPH2inLMClTalmO9F+K2SGPNC9psZmJLFquSJxDXoUFG7mpVzm+5d
 aF4z29enzixkctxJmVgrETr22tI9lDwZ1u826+kZBjImzzNeI41vAXTiTJFz9nYSOHUl
 wcwnIbp1nFGCjle4WGjnnRqSPjnE3+zy4Cp/979hDp8P3S2q9oKIo2raMG+0FP2D/a5t
 e85x0P9ro4v7d4avkYUFiWFqCdNOgDGHYcng9dXmblfnuUl1FV99T/UdLYfCLXldsOqk
 Z/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fv8FmGALKcXXiC61Pb90szGF4PWZeFkoGuOLIz8Tk0o=;
 b=AlCnReA8IPdp1XBUDHk5w8Askm/Z0sYOQUdA/Y0ycT/jto7GSv3BAH9N6nUIg4sQqw
 DcbhgNlKv5DyuBo8QW5/OzEnL9HO8jPW5WLssdKOTpGOsWwfNT74AqS+tDwW99F4yhfe
 qbfCJn0NXq7fRxk6QartFa6VSL6dFKZ/+ndQXQKtzfZ2LSvH3DTJPRYmkiR1Opw1V0+r
 v3QND72Y3yOUTeFW2socvStXSzO/vXNrg5qxxD8YsuvPiJGc/KWY6ZX66/wlehN9EEPl
 70u40VEav3ALAbLQD6uh5/Q7AauYmBg0W58RXimp1/N8ePoCCP5BOUC7jGpNBNLx8cMr
 29Ug==
X-Gm-Message-State: AOAM530L2qMdoe45ZTcwG10ly5iGTEgrbm+mNiO7cOKDp0PLi4GJT46k
 EbdCD7m2ZD8OIvTfRaimG7s=
X-Google-Smtp-Source: ABdhPJwCWND5sWX1yn3B580BuH8sQgsQoadtauR/T9KSpLCR3SB13SGmbHIrz7PWjAy1JAZ/PWPuZA==
X-Received: by 2002:a17:906:c0c8:b0:6d0:562c:2894 with SMTP id
 bn8-20020a170906c0c800b006d0562c2894mr67880ejb.625.1645628287545; 
 Wed, 23 Feb 2022 06:58:07 -0800 (PST)
Received: from orome (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id c3sm7605177ejc.120.2022.02.23.06.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 06:58:06 -0800 (PST)
Date: Wed, 23 Feb 2022 15:58:04 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH libdrm v2 20/25] tests: tegra: Add VIC 4.0 support
Message-ID: <YhZLfDL0TO7W8mAi@orome>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
 <20220217191931.2534836-15-thierry.reding@gmail.com>
 <aecb46db-20c6-61d4-ffde-798b42842a7d@kapsi.fi>
 <YhZIqTCn/NmR7KAF@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/fwrtCeFF/sTXthu"
Content-Disposition: inline
In-Reply-To: <YhZIqTCn/NmR7KAF@orome>
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


--/fwrtCeFF/sTXthu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 03:46:01PM +0100, Thierry Reding wrote:
> On Fri, Feb 18, 2022 at 11:29:34AM +0200, Mikko Perttunen wrote:
> > On 2/17/22 21:19, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > The Video Image Composer (VIC) 4.0 can be found on NVIDIA Tegra210 So=
Cs.
> > > It uses a different class (B0B6) that is slightly incompatible with t=
he
> > > class found on earlier generations.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >   tests/tegra/meson.build |   2 +
> > >   tests/tegra/vic.c       |   7 +
> > >   tests/tegra/vic40.c     | 370 +++++++++++++++++++++++++++++++++++++=
+++
> > >   tests/tegra/vic40.h     | 285 +++++++++++++++++++++++++++++++
> > >   4 files changed, 664 insertions(+)
> > >   create mode 100644 tests/tegra/vic40.c
> > >   create mode 100644 tests/tegra/vic40.h
> > >=20
> > > diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
> > > index 1ee29d0afe1b..e9c2bc875a01 100644
> > > --- a/tests/tegra/meson.build
> > > +++ b/tests/tegra/meson.build
> > > @@ -36,6 +36,8 @@ libdrm_test_tegra =3D static_library(
> > >       'vic.h',
> > >       'vic30.c',
> > >       'vic30.h',
> > > +    'vic40.c',
> > > +    'vic40.h',
> > >     ), config_file ],
> > >     include_directories : [inc_root, inc_drm, inc_tegra],
> > >     link_with : libdrm,
> > > diff --git a/tests/tegra/vic.c b/tests/tegra/vic.c
> > > index f24961ac5c6d..e0a97c059eca 100644
> > > --- a/tests/tegra/vic.c
> > > +++ b/tests/tegra/vic.c
> > > @@ -134,6 +134,10 @@ void vic_image_dump(struct vic_image *image, FIL=
E *fp)
> > >   int vic30_new(struct drm_tegra *drm, struct drm_tegra_channel *chan=
nel,
> > >                 struct vic **vicp);
> > > +/* from vic40.c */
> > > +int vic40_new(struct drm_tegra *drm, struct drm_tegra_channel *chann=
el,
> > > +              struct vic **vicp);
> > > +
> > >   int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channe=
l,
> > >               struct vic **vicp)
> > >   {
> > > @@ -144,6 +148,9 @@ int vic_new(struct drm_tegra *drm, struct drm_teg=
ra_channel *channel,
> > >       switch (version) {
> > >       case 0x40:
> > >           return vic30_new(drm, channel, vicp);
> > > +
> > > +    case 0x21:
> > > +        return vic40_new(drm, channel, vicp);
> > >       }
> > >       return -ENOTSUP;
> > > diff --git a/tests/tegra/vic40.c b/tests/tegra/vic40.c
> > > new file mode 100644
> > > index 000000000000..1a5d2af6b0b6
> > > --- /dev/null
> > > +++ b/tests/tegra/vic40.c
> > > @@ -0,0 +1,370 @@
> > > +/*
> > > + * Copyright =C2=A9 2018 NVIDIA Corporation
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtai=
ning a
> > > + * copy of this software and associated documentation files (the "So=
ftware"),
> > > + * to deal in the Software without restriction, including without li=
mitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, subl=
icense,
> > > + * and/or sell copies of the Software, and to permit persons to whom=
 the
> > > + * Software is furnished to do so, subject to the following conditio=
ns:
> > > + *
> > > + * The above copyright notice and this permission notice shall be in=
cluded in
> > > + * all copies or substantial portions of the Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVEN=
T SHALL
> > > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAM=
AGES OR
> > > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERW=
ISE,
> > > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE US=
E OR
> > > + * OTHER DEALINGS IN THE SOFTWARE.
> > > + */
> > > +
> > > +#include <errno.h>
> > > +#include <string.h>
> > > +
> > > +#include "private.h"
> > > +#include "tegra.h"
> > > +#include "vic.h"
> > > +#include "vic40.h"
> > > +
> > > +struct vic40 {
> > > +    struct vic base;
> > > +
> > > +    struct {
> > > +        struct drm_tegra_mapping *map;
> > > +        struct drm_tegra_bo *bo;
> > > +    } config;
> > > +
> > > +    struct {
> > > +        struct drm_tegra_mapping *map;
> > > +        struct drm_tegra_bo *bo;
> > > +    } filter;
> > > +
> > > +    struct {
> > > +        struct drm_tegra_mapping *map;
> > > +        struct drm_tegra_bo *bo;
> > > +    } hist;
> > > +};
> >=20
> > Histogram buffer not necessary at least on VIC4.0 and later. (Same appl=
ies
> > to VIC4.1 and VIC4.2 patches).
>=20
> I'm pretty sure that I saw SMMU faults without this on all of Tegra210,
> Tegra186 and Tegra194. I'll go and test this once more.

Nevermind, I see now that this buffer isn't used at all on VIC 4.0, 4.1
and 4.2. I misread your comment as this buffer not needing to be
supplied in the command streams.

Removed all code related to that from the newer versions of VIC.

Thierry

--/fwrtCeFF/sTXthu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIWS3wACgkQ3SOs138+
s6ENOhAAntVyL0wZTsJJrDEpx7/xlgaVUGBqln5Qsely5uqstqyMDkFJsGW33qrK
5lfHoQSvym46b6uG9JJxI+JMTvprXLU/NCWyBi6hjLvorkZ92HhSrgn4gijfkD0U
0ObCPB+6BmKfBEEVC4tIVMaQIjiD2l4sHjULwXPaDpP2f9CoYZrqax70CWr8SAjO
0uqVgoU5Bzp+4yuMSwreqglu4zjuQl7RbwSuoK5yFgn3H5qDPCZBj0GQWY7F9bDN
CmfEmKTjSbaokoJjCTyg0w/pQTIuYY2lQgy68TLX43pBcZi1K/dwA893SBb/z5Lj
XlSOYGG3e7S0HaqOCFDNLGMggGB7bzOQKkYESh1ie3U3zDVl8XkgX1kKzqIlcfPp
iTSjZ/OuzDR6KSOYMfCADYypz55jh8zr9uhBqlKbVOFNXJz9zUXjN8sT5gtuQqdB
HDoErxXyRXEI2Mi+R7x6LMUTG4AHiLPI/QTXv+4E6PRTIjlf1KCPeEP2OSfCaSf+
oPbgY4VyMqKIHsIpiml6i2Qdb1OxCd9OEv9qJIA2QTJYa4RKKIws9hAF1hIwSnek
7ojnvOYWMHGVrhic80jL46Aly0dffboSDpXJrCtRazDTL/KuKNXn5lET309vzrro
m29/dweo6ByuSEx5ghTErcURS4Jaaw86DZOLoH1RNrw07LSkoK4=
=s36U
-----END PGP SIGNATURE-----

--/fwrtCeFF/sTXthu--
