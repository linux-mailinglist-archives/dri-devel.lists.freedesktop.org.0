Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 047ECFDBB6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 11:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494476E430;
	Fri, 15 Nov 2019 10:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA426E41B;
 Fri, 15 Nov 2019 10:50:02 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y23so10170211ljh.10;
 Fri, 15 Nov 2019 02:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ea9zLnFHS1AZW10VY451V5LQgt4RUuv83Kk6EMC907E=;
 b=tShwu6j+6GoHG1fD9oC+5CExE4BIp60/gZJOwnePYJ4tUbcNRlG7t2P4KSjNcsBFEb
 XmSAtBGFBrcKWrmz3fQbFZFaAIZUjvLxNtdDC1allZ1jU/mqVv6fsCS/BOjbWhwu3JnT
 knryEC6v73zcLrNXBtKHkwTulSUL9ffMDkIPP8mOHNVR6v7sXqiaDX2U7cJx2Q+WT/kQ
 gJDf5r0yuN080NcnlBULkLY4t+ZBKChAJ9T/99LLS/VNe+7VeBCYIZ3MhmIrYo2jzqm0
 9mxIxA7L05fm94wDsefiMdevy0liEwQvZ+kRo5/wHccdsV2YiN9rrE/t2IZIrYSYD0Lm
 ZefQ==
X-Gm-Message-State: APjAAAXY1eOIuj1bHQyoZQWeB749iNuKGdV9q9sOSyoDXBciMzTEGFRH
 wOOa+QjRBOohdCm4SzlRqHs=
X-Google-Smtp-Source: APXvYqwAZJeBt6D4+2W0WiUgmYXrcfrzYi8ETiitGlXEvtXhNaNvEHsgpvdPvD+BKfSF/EH4c0iolg==
X-Received: by 2002:a2e:6a10:: with SMTP id f16mr11056805ljc.100.1573815000277; 
 Fri, 15 Nov 2019 02:50:00 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u7sm4196665lfg.65.2019.11.15.02.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 02:49:59 -0800 (PST)
Date: Fri, 15 Nov 2019 12:49:44 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/8] drm/fb: More paranoia in addfb checks
Message-ID: <20191115124944.25e31d63@eldfell.localdomain>
In-Reply-To: <20191115092120.4445-2-daniel.vetter@ffwll.ch>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-2-daniel.vetter@ffwll.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=ea9zLnFHS1AZW10VY451V5LQgt4RUuv83Kk6EMC907E=;
 b=nIWkbiYlidvBWUjTA/RjpwSrKKXSYWm7BgUv8e6WSAxJxRrA8NIyD96m5CgJZYjrR6
 FFl3GeE+2OlVJdBWQtATJJ4lLm6478L532w9ew0L0HW/a9546DEIuUikPNPD9X5REYKA
 RmE4NZcShuo4wRDLhevmyhZ2Y7po9AfNfqSuIssspm6cjIlxrC78htqdY977mhu7hB/v
 Cbk4Y4SFqsAu94BiJ//gfvze07I4TUjXqgV8zDGpOB3Peg+5WXesBXqn13+0KmSW5aKo
 bDYo6RUb2jKMRWpQMS9/0jrqx1qtrLmC8BP6p9uVak4GpXF4qIWYFU07jXRq/ozirSB7
 kG3w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1761834773=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1761834773==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/isEOVCvveAkT4r=oyK/C6kr"; protocol="application/pgp-signature"

--Sig_/isEOVCvveAkT4r=oyK/C6kr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Nov 2019 10:21:13 +0100
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> - Our limit is uint32_t, make that explicit.
>=20
> - Untangle the one overflow check, I think (but not sure) that with
>   all three together you could overflow the uint64_t and it'd look
>   cool again. Hence two steps. Also go with the more common (and imo
>   safer approach) of reducing the range we accept, instead of trying
>   to compute the overflow in high enough precision.
>=20
> - The above would blow up if we get a 0 pitches, so check for that
>   too, but only if block_size is a thing.
>=20
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_framebuffer.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_fram=
ebuffer.c
> index 57564318ceea..3141c6ed6dd2 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -214,15 +214,20 @@ static int framebuffer_check(struct drm_device *dev,
>  			return -EINVAL;
>  		}
> =20
> -		if (min_pitch > UINT_MAX)
> +		if (min_pitch > U8_MAX)

This looks odd, but I don't know what min_pitch is or why it should be
limited to 255(?). What's with the U8, should it not be U32?

>  			return -ERANGE;
> =20
> -		if ((uint64_t) height * r->pitches[i] + r->offsets[i] > UINT_MAX)
> -			return -ERANGE;
> +		if (block_size) {
> +			if (r->pitches[i] < min_pitch) {
> +				DRM_DEBUG_KMS("bad pitch %u for plane %d\n", r->pitches[i], i);
> +				return -EINVAL;
> +			}
> =20
> -		if (block_size && r->pitches[i] < min_pitch) {
> -			DRM_DEBUG_KMS("bad pitch %u for plane %d\n", r->pitches[i], i);
> -			return -EINVAL;
> +			if (height > U8_MAX / r->pitches[i])
> +				return -ERANGE;
> +
> +			if (r->offsets[i] > U8_MAX / r->pitches[i] - height)

Aside from the U8 again, this looks strange too. You want to check that
offset + height * pitch does not exceed MAX?

Wouldn't that be height > (MAX - offset) / pitch for bad?

If offset cannot be negative, this could also replace height > U8_MAX /
r->pitches[i].

> +				return -ERANGE;
>  		}
> =20
>  		if (r->modifier[i] && !(r->flags & DRM_MODE_FB_MODIFIERS)) {

Thanks,
pq

--Sig_/isEOVCvveAkT4r=oyK/C6kr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl3OgsgACgkQI1/ltBGq
qqfu1A/+LMeAvBfMrsDU9bqy6FW1FEv938rdKt/NjWPl99rfWQbilZYxlW4KITru
lJ8ErQ6IUhVB1EDGQrQtkbqk9s/Q4a3qY8L41pYJ2e2TedS+5Tcu3emYhweKAkX2
qJUbbfO2IoRMG09F2Xow1NkND1vOWZGOZbiZCGxihXTIzOiFu0MRvCqpUXyGlOCC
yTEF1NKofNS19s9rIiRAZGshwtMNXak52+sM97ls3NhnGhsEFuilCTe0jD6IBfVi
UYpKpRRtVMiG4Q2gYq0lgHsWl7tYaFKKLZq0LguVZAIGfPDJdmjj7bPSpnVEYWaq
vAVyKyN1xKJbSvd0nph3c6KZqRyLw3EiJ3UyTUjHgDNPLxBCgtdTAr4O44a7MqnV
mdJNf2i/fTcKe/83jGvW9kiC7n0Muce4nM76+brxtkbI57OB0C2o+F61mMMj/V/m
5Uf5gJBuwxIEHJEdTr0m3ohF8wAZEp7m34j//hxhmylnTcDRNBqHTgRKSn+AkIEP
sJD6z/e7E69a6kPrvM6xYkhXag+zEOXQ17qQMWijl1sMuiEmZxzk33/EVLGR42ES
prz2hXlOX36ZfPAEatspOotut5+rt9LzLaQhz37DAwQEDkwXkWSqu+SJZ/YlJ3eH
B2BsrtWuMgLV5Xs/WEITmOhoZeOzAgxzCJeBCcb8aC/B8y/VAp0=
=CoGY
-----END PGP SIGNATURE-----

--Sig_/isEOVCvveAkT4r=oyK/C6kr--

--===============1761834773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1761834773==--
