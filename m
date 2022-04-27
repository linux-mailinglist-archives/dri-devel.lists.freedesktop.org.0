Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D666511301
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 09:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBBF10E3C0;
	Wed, 27 Apr 2022 07:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4929910E3C0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 07:55:27 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id y19so1569275ljd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 00:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=TyH6+5T3wcAA0XHHk4ZJ/o+jyKd8ZrjECnypsG294TU=;
 b=bkhc/Xq/2c0xOEbptR5zXlisbIWD/lmYplhLDY7izY/qVEkvI9TCr+dVK3CpkWkyEB
 QMhqr6gFL0n137PHAAPoX5HAAtBymqRcFTM9dqg408oWfu+PX6nbUJXDP1qbBrqvT2e2
 J73vhgLF8UB7ghQVmxbaYV5PJ4bVHGcmnL5u7657/Gy39oapobzK65Z4UG2t6n6ssych
 Ty5VzfyvrhsWLjFu+HSvnFbcJxsACuiBv4wiINwS7GhS5cpEYqG948yBkNZ1Z5R+uGDk
 6vxnF/CayORpP7yfp5RhQqZtvAWC3DQabl0H1XacQ7O8NX/FuH2Wrp7fSLolHEjRknEx
 0e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=TyH6+5T3wcAA0XHHk4ZJ/o+jyKd8ZrjECnypsG294TU=;
 b=tRmI0CIBLi9vtwiPcnNcwrLq1BsX92tozY83v2XPhAOf8A1qtspxDbgfKBRNSYjRJr
 fSgqUDX76rrc66btB0laynLn8V0C7/oDa9SXk0zBmoFl25xZL7CaW5oAEpVgd8vbp2Mw
 bURAdtLHXOCERWtw3bZHqFajZugNFXsM7PFTT4YaAx8FKG8JHsXvG1j0dH0BOdOWRd86
 866stPkcwacaOopHhk5L6uck/yO/B5Ehonm6anpUfPf2ZQI74oNY4tL5HgU0Uj6uZA+h
 KnuVWt6O40tUKF/OOU19gIqYWLEK0WkctmX9vOr6wc45Q21VR3UftOujiLxkWcyajX+n
 3z7w==
X-Gm-Message-State: AOAM531oyiaaq82SVcMJlWNGGZxQt7h5F7X2Gwy3Hf0LeU+VigHFvRDV
 4P/x0welapg4X967xDYOysY=
X-Google-Smtp-Source: ABdhPJzk6td8sbmUHUgkIywhjmECvmfOl0VofI7+b1StBA/9beFyiAu0RgdKXbeaoyDVQaVigHsk3A==
X-Received: by 2002:a05:651c:1504:b0:24e:ec65:f947 with SMTP id
 e4-20020a05651c150400b0024eec65f947mr17631350ljf.138.1651046125507; 
 Wed, 27 Apr 2022 00:55:25 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a7-20020a19e307000000b0046ba24f205fsm1980167lfh.57.2022.04.27.00.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 00:55:25 -0700 (PDT)
Date: Wed, 27 Apr 2022 10:55:21 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 9/9] drm: vkms: Add support to the RGB565 format
Message-ID: <20220427105521.73faead3@eldfell>
In-Reply-To: <5143c749-55bc-c6d8-59af-55ee931d8639@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-10-igormtorrente@gmail.com>
 <20220421135859.3403f0ce@eldfell>
 <5143c749-55bc-c6d8-59af-55ee931d8639@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cAoiFa.pDlLF4z2Ab=yaxWE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/cAoiFa.pDlLF4z2Ab=yaxWE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Apr 2022 21:53:19 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Hi Pekka,
>=20
> On 4/21/22 07:58, Pekka Paalanen wrote:
> > On Mon,  4 Apr 2022 17:45:15 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> >  =20
> >> Adds this common format to vkms.
> >>
> >> This commit also adds new helper macros to deal with fixed-point
> >> arithmetic.
> >>
> >> It was done to improve the precision of the conversion to ARGB16161616
> >> since the "conversion ratio" is not an integer.
> >>
> >> V3: Adapt the handlers to the new format introduced in patch 7 V3.
> >> V5: Minor improvements
> >>
> >> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> >> ---
> >>   drivers/gpu/drm/vkms/vkms_formats.c   | 70 +++++++++++++++++++++++++=
++
> >>   drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
> >>   drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
> >>   3 files changed, 76 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkm=
s/vkms_formats.c
> >> index 8d913fa7dbde..4af8b295f31e 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> >> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> >> @@ -5,6 +5,23 @@
> >>  =20
> >>   #include "vkms_formats.h"
> >>  =20
> >> +/* The following macros help doing fixed point arithmetic. */
> >> +/*
> >> + * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fr=
actional
> >> + * parts respectively.
> >> + *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
> >> + * 31                                          0
> >> + */
> >> +#define FIXED_SCALE 15 =20
> >=20
> > I think this would usually be called a "shift" since it's used in
> > bit-shifts. =20
>=20
> Ok, I will rename this.
>=20
> >  =20
> >> +
> >> +#define INT_TO_FIXED(a) ((a) << FIXED_SCALE)
> >> +#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> FIXED_SCALE))
> >> +#define FIXED_DIV(a, b) ((s32)(((s64)(a) << FIXED_SCALE) / (b))) =20
> >=20
> > A truncating div, ok.
> >  =20
> >> +/* This macro converts a fixed point number to int, and round half up=
 it */
> >> +#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (FIXED_SCALE - 1))) >> FI=
XED_SCALE) =20
> >=20
> > Yes.
> >  =20
> >> +/* Convert divisor and dividend to Fixed-Point and performs the divis=
ion */
> >> +#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIX=
ED(b))) =20
> >=20
> > Ok, this is obvious to read, even though it's the same as FIXED_DIV()
> > alone. Not sure the compiler would optimize that extra bit-shift away...
> >=20
> > If one wanted to, it would be possible to write type-safe functions for
> > these so that fixed and integer could not be mixed up. =20
>=20
> Ok, I will move to a function.

That's not all.

If you want it type-safe, then you need something like

struct vkms_fixed_point {
	s32 value;
};

And use `struct vkms_fixed_point` (by value) everywhere where you pass
a fixed point value, and never as a plain s32 type. Then it will be
impossible to do incorrect arithmetic or conversions by accident on
fixed point values.

Is it worth it? I don't know, since it's limited into this one file.

A simple 'typedef s32 vkms_fixed_point' does not work, because it does
not prevent computing with vkms_fixed_point as if it was just a normal
s32. Using a struct prevents that.

I wonder if the kernel doesn't already have something like this
available in general...

> >> +		u16 r =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
> >> +		u16 g =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
> >> +		u16 b =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
> >> +
> >> +		*dst_pixels =3D cpu_to_le16(r << 11 | g << 5 | b); =20
> >=20
> > Looks good.
> >=20
> > You are using signed variables (int, s64, s32) when negative values
> > should never occur. It doesn't seem wrong, just unexpected. =20
>=20
> I left the signal so I can reuse them in the YUV formats.

Good point.

>=20
> >=20
> > The use of int in code vs. s32 in the macros is a bit inconsistent as
> > well. =20
>=20
> Right. I think I will stick with s32 and s64 then.

...

> >> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/v=
kms/vkms_writeback.c
> >> index cb63a5da9af1..98da7bee0f4b 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> >> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> >> @@ -16,7 +16,8 @@
> >>   static const u32 vkms_wb_formats[] =3D {
> >>   	DRM_FORMAT_XRGB8888,
> >>   	DRM_FORMAT_XRGB16161616,
> >> -	DRM_FORMAT_ARGB16161616
> >> +	DRM_FORMAT_ARGB16161616,
> >> +	DRM_FORMAT_RGB565
> >>   };
> >>  =20
> >>   static const struct drm_connector_funcs vkms_wb_connector_funcs =3D =
{ =20
> >=20
> > I wonder, would it be possible to add a unit test to make sure that
> > get_plane_fmt_transform_function() or get_wb_fmt_transform_function()
> > does not return NULL for any of the listed formats, respectively?
> > Or is that too paranoid? =20
>=20
> I'm not opposed to it. But I also don't think it needs to be in this=20
> series of patches either.
>=20
> A new todo maybe?

If it's a good thing, then it belongs in this series, because those
function getters are introduced in this series, opening the door for
the mistakes that the tests would prevent. I don't mean IGT tests but
kernel internal tests. I think there is a unit test framework?

You really should get a kernel maintainer's opinion on these questions,
as I am not a kernel developer.


Thanks,
pq

--Sig_/cAoiFa.pDlLF4z2Ab=yaxWE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJo9ukACgkQI1/ltBGq
qqcasw//eycv7OBwst4N7E8XivH+2NFHVKXu+Y0RwE+E4GAxNSNzwAPty+h0fgPs
vEo3rKpmc6I6tFHZv4eUyhsKpH0Y3CRz9LhaOxvWiFR8LE24ANHXrm/DIp97hwMY
xWuUnQg65JuQ5WW3KDvnh4Lo1W+ZS7ntSB5pC8XrzU4UnjMzdcWuQwZQW/+k57X2
SvYAFRkXJzD6oPmfHwAx2dwAk9nmaBfyhjGB7OdtQDqB6tp0bl+WkK2XS22F+NZL
vFT3C3CcTaD89SST6qyrp8PAyTv91uq/cfLZLPJdAxLDgbrIk3SdoD3lKxve39PS
nyA1ZSEllFJHxcepXmgZ9g7C892SoIbV67X08pQh3Kb6vKVfFQFxVRPvqbMsXtTr
LXUbxtokM5veMQzqHa99SS5XuawWDVCXXeHVbm0dec4j3ZIynVtz5dvhnT3CoL4v
Uxop4a2+LYAv4S8CLrUYFwu19VpJvs4PfOGeeeUVENtMF9O4O4h8B+8x3XmdUtOJ
fTzRZDcJvT+/ScogUQBe93+ln0TTnFEFgzV9kOymEYKVW7p64/qk1gui4GDh2rgk
AbqsWwbEei4+YxxhOlDtrQNJFrV6CWSPj1m1tGWFaztogs0gi5De/L6FMPRCSW3X
kbY9O/vs+xiPfXCkStM3LYTW5bd3KddwSu8Epyqosu1FUa0GGN4=
=WVOi
-----END PGP SIGNATURE-----

--Sig_/cAoiFa.pDlLF4z2Ab=yaxWE--
