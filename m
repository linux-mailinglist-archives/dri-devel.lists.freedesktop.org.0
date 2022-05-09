Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C6851F597
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 09:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFE410E098;
	Mon,  9 May 2022 07:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D238E10E098
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 07:53:36 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id v4so16000644ljd.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 00:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=33eR1/03YlRx2+2cTZdqbJBnVCQfDsL3Tdk9fvvkB8Q=;
 b=QMXcRhdKD8XCZRdVxYQKP4yhk/PpmIwG4uMcxyp3psP+80N73WjuAyWZaFANsvP5u0
 KwMKH7ItjN18lEv0+hVMlNmCp0CrTx2bSNkyIFQ2wsasGd7rQO/vbD2L1bksqth9CUyt
 tBpGojopZH2CR5Q3cR2eDEzTLBKKQMTPalPx+TA/mFSKRYhH8YfxEasRWUvq2B3EYLs/
 fwuW0SkqMS7grg8wAQmt64RL2wvzS5gQbVqy0kCCOdTta8r/PKm6RShn+v8YrO74kFGZ
 PKw9A9lCLSR8aWI2Noiypu27aX1RuUTAm7TPR6MGSnrFBGfyTUNFgD9x/0yt4U8S0TIO
 dGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=33eR1/03YlRx2+2cTZdqbJBnVCQfDsL3Tdk9fvvkB8Q=;
 b=xr4YwTmxRIgiSjGQQV+JujYo6iUeTjfJZSGmvwPeALZNq4o+v9/heumRFMKcUjxZJi
 XshqFrnFkxOCIJgNOmg+6uwgtwjdao78CkDbRyJW1REUPKMLRx0SjIuufRz74Vh2UwUt
 PFVG1m32RNniOgE6Wz4W5sG72nnIcwJ4c9RUODtNUjQ/zLR9qn9Flmzf3GrQ2mMVene/
 xmQhClxXUnQxO70yIEYjTydRxgIQLCzz1H2meHBP0R5xIW1BAdJJnE8kpxrOS3qRqEKc
 t/5HMbH+u6SUyzemWHyijQ4zZLaAfqOgcwxKkbVTz2BposHXVwsydypfFyYQDi+ClRRG
 xZ0A==
X-Gm-Message-State: AOAM532nSwgFJ+e3Q+yN6ZV318pdQbzBUFFjF/aCxSjzZQMnbSVncJgk
 9YVSyYgWwUGy/QNmTERhbSc=
X-Google-Smtp-Source: ABdhPJxWNztbkmTVz1ICGD/j+Y2m25JOJc0K5HivPEqVG0f9FG668zE07xUfDTkc+NrN2oAQFVQLwQ==
X-Received: by 2002:a2e:a30a:0:b0:24f:cf6:11ab with SMTP id
 l10-20020a2ea30a000000b0024f0cf611abmr9517255lje.461.1652082814903; 
 Mon, 09 May 2022 00:53:34 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f3-20020a2e3803000000b0024f3d1daec3sm1740148lja.75.2022.05.09.00.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 00:53:34 -0700 (PDT)
Date: Mon, 9 May 2022 10:53:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 9/9] drm: vkms: Add support to the RGB565 format
Message-ID: <20220509105324.5ede4d90@eldfell>
In-Reply-To: <239e2329-197e-099b-ecce-4d640493077e@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-10-igormtorrente@gmail.com>
 <20220421135859.3403f0ce@eldfell>
 <5143c749-55bc-c6d8-59af-55ee931d8639@gmail.com>
 <20220427105521.73faead3@eldfell>
 <239e2329-197e-099b-ecce-4d640493077e@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wv97TVyURZhTyXRQx_YwOUk";
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

--Sig_/Wv97TVyURZhTyXRQx_YwOUk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 6 May 2022 20:05:39 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Hi Pekka,
>=20
> On 4/27/22 04:55, Pekka Paalanen wrote:
> > On Tue, 26 Apr 2022 21:53:19 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> >  =20
> >> Hi Pekka,
> >>
> >> On 4/21/22 07:58, Pekka Paalanen wrote: =20
> >>> On Mon,  4 Apr 2022 17:45:15 -0300
> >>> Igor Torrente <igormtorrente@gmail.com> wrote:
> >>>     =20
> >>>> Adds this common format to vkms.
> >>>>
> >>>> This commit also adds new helper macros to deal with fixed-point
> >>>> arithmetic.
> >>>>
> >>>> It was done to improve the precision of the conversion to ARGB161616=
16
> >>>> since the "conversion ratio" is not an integer.
> >>>>
> >>>> V3: Adapt the handlers to the new format introduced in patch 7 V3.
> >>>> V5: Minor improvements
> >>>>
> >>>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> >>>> ---
> >>>>    drivers/gpu/drm/vkms/vkms_formats.c   | 70 ++++++++++++++++++++++=
+++++
> >>>>    drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
> >>>>    drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
> >>>>    3 files changed, 76 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/v=
kms/vkms_formats.c
> >>>> index 8d913fa7dbde..4af8b295f31e 100644
> >>>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> >>>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> >>>> @@ -5,6 +5,23 @@
> >>>>   =20
> >>>>    #include "vkms_formats.h"
> >>>>   =20
> >>>> +/* The following macros help doing fixed point arithmetic. */
> >>>> +/*
> >>>> + * With Fixed-Point scale 15 we have 17 and 15 bits of integer and =
fractional
> >>>> + * parts respectively.
> >>>> + *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
> >>>> + * 31                                          0
> >>>> + */
> >>>> +#define FIXED_SCALE 15 =20
> >>>
> >>> I think this would usually be called a "shift" since it's used in
> >>> bit-shifts. =20
> >>
> >> Ok, I will rename this.
> >> =20
> >>>     =20
> >>>> +
> >>>> +#define INT_TO_FIXED(a) ((a) << FIXED_SCALE)
> >>>> +#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> FIXED_SCALE))
> >>>> +#define FIXED_DIV(a, b) ((s32)(((s64)(a) << FIXED_SCALE) / (b))) =20
> >>>
> >>> A truncating div, ok.
> >>>     =20
> >>>> +/* This macro converts a fixed point number to int, and round half =
up it */
> >>>> +#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (FIXED_SCALE - 1))) >> =
FIXED_SCALE) =20
> >>>
> >>> Yes.
> >>>     =20
> >>>> +/* Convert divisor and dividend to Fixed-Point and performs the div=
ision */
> >>>> +#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_F=
IXED(b))) =20
> >>>
> >>> Ok, this is obvious to read, even though it's the same as FIXED_DIV()
> >>> alone. Not sure the compiler would optimize that extra bit-shift away=
...
> >>>
> >>> If one wanted to, it would be possible to write type-safe functions f=
or
> >>> these so that fixed and integer could not be mixed up. =20
> >>
> >> Ok, I will move to a function. =20
> >=20
> > That's not all.
> >=20
> > If you want it type-safe, then you need something like
> >=20
> > struct vkms_fixed_point {
> > 	s32 value;
> > };
> >=20
> > And use `struct vkms_fixed_point` (by value) everywhere where you pass
> > a fixed point value, and never as a plain s32 type. Then it will be
> > impossible to do incorrect arithmetic or conversions by accident on
> > fixed point values.
> >=20
> > Is it worth it? I don't know, since it's limited into this one file.
> >=20
> > A simple 'typedef s32 vkms_fixed_point' does not work, because it does
> > not prevent computing with vkms_fixed_point as if it was just a normal
> > s32. Using a struct prevents that. =20
>=20
> ohhh. Got it!
>=20
> >=20
> > I wonder if the kernel doesn't already have something like this
> > available in general... =20
>=20
> After some time searching I found `include/drm/drm_fixed.h`[1].
>=20
> It seems fine. There are minor things to consider:
>=20
> 1. It doesn't have a `FIXED_TO_INT_ROUND` equivalent.
> 2. We can use `fixed20_12` for rgb565 but We have to use s64 for YUV
> formats or add a `sfixed20_12` with s32.
>=20
> In terms of consistency, do you think worth using this "library" given
> that we may need to use two distinct ways to represent the fixed point
> soonish? Or it's better to implement `sfixed20_12`? Or just continue=20
> with the
> current macros?
>=20
> [1] - https://elixir.bootlin.com/linux/latest/source/include/drm/drm_fixe=
d.h

I think that is something the kernel people should weigh in on.

The one thing I would definitely avoid is ending up using multiple
fixed point formats in VKMS.

In the mean time, your current macros seem good enough, if there is no
community interest in better type safety nor sharing the fixed point
code.


Thanks,
pq

--Sig_/Wv97TVyURZhTyXRQx_YwOUk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJ4yHQACgkQI1/ltBGq
qqdaRBAAjk2HsfCyMF7D0LsHztfnpIpTABIWEgJcTT7tE3t232B/x0euUAB2cWGc
7xZFXS4N6p+FOZuFElwxqooNV7aqllEmTIfqlN3XYc72YI0frmDG5kFI1/a/B1X/
PYhRceOoUyzAjgN8LgJ6se8ykWCyPIZkhl80Sbk++kgxUDgDAnZbgYk5mJIOy0YX
woMhB9B6jdjzhmblkXzOPTLoX6UmMs7S48cxdG51WVOXFSXRWZCozhRxtNLzRCwA
b8l+eiyr3XXuVm/M5N9G0SNqs1HsGpfRNeOro9s1Fi1hKTT02Y8I2ehC3o9Ak/kA
4hWBlvj8u6fKEBGcPg5+BjvCivrYteSYQ7+dsS4iTirjpZAOCKaQwOJpmLWJ8aI7
YOlSMPGT/GqmGz8C9cpzrUFgj4ljFOxfoR2r4Bfd/C0onZDFII+MoDlWz6Fcdc0+
Of3bBT3B1gLo6B/tX4GoOnOJ5pTMgl8Ts1wvXwNPtkgahxRUGyGZF6YJunN5CWeh
P08Z7DCmgpHApBGPbWj5SxZS7ErCP3UCCInpYStJJG83c0IlMjyyR81v5gz7OjXx
IP0jFoqdfTXZLiNySfRn0LEaHz04RKx8k0wW5azqloBYD4RU2gho0jY8xEOB8Y2A
Y+Zwds0Yt8lvXbTYIx0oNH9cq1WWvmKk7LypaVbZ2hWkilXH8H4=
=lPEu
-----END PGP SIGNATURE-----

--Sig_/Wv97TVyURZhTyXRQx_YwOUk--
