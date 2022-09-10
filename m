Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 198015B4806
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 21:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCB510E24E;
	Sat, 10 Sep 2022 19:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FFB10E24E
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 19:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MQBOJYaPsTsmzp6XQNvMbRLKTi468X/eCM9deH7bT+U=; b=P5DL9ztMeiqyIKPSqVMCDQyh9u
 lUqxikJWXHAhTc3xJWJPbVS72nUfpwd1819XM74K7wuyHaIi3BVpfANSscsnw9s5Y4e5z6kA/Obz4
 eWAEnEqaskXU3OJ7Wew5Oj81WEugJrpXyJ7BYE+C3ZxROm6/Fd5AyDWivIYmWtqDjH+pPgfMc5VO4
 CrWl+oieBLcYx5at7qWxM9omeFjjY2oA5eU9PPYJ/82myEb1B4FeKd5jv0/rvV9o6r2gjm6P+uKg4
 UMzH9k9+/RwJjC/OH2fMfzfg1CrSes1qzxsrKRxZxsUenxDOd0OzikFYkKWvxYmYUSnZyxmqVvdjT
 DG2S59GA==;
Received: from [38.44.74.92] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oX5sN-00EgrH-Ph; Sat, 10 Sep 2022 21:10:47 +0200
Date: Sat, 10 Sep 2022 18:10:35 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH] drm/vkms: fix 32bit compilation error by replacing macros
Message-ID: <20220910191035.ukxhlhbc3mscbqis@mail.igalia.com>
References: <20220909114133.267689-1-mwen@igalia.com>
 <29f87796-b288-7cdc-86dd-050cf7f0b5dd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ltbt5kws2shgme65"
Content-Disposition: inline
In-Reply-To: <29f87796-b288-7cdc-86dd-050cf7f0b5dd@gmail.com>
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
Cc: rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ltbt5kws2shgme65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/09, Igor Matheus Andrade Torrente wrote:
> Hi Mellisa,
>=20
> Thanks for the patch fixing my mistakes.
>=20
> On 9/9/22 08:41, Melissa Wen wrote:
> > Replace vkms_formats macros for fixed-point operations with functions
> > from drm/drm_fixed.h to do the same job and fix 32-bit compilation
> > errors.
> >=20
> > Fixes: a19c2ac9858 ("drm: vkms: Add support to the RGB565 format")
> > Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> > Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_formats.c | 53 +++++++++++------------------
> >   1 file changed, 19 insertions(+), 34 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms=
/vkms_formats.c
> > index 300abb4d1dfe..ddcd3cfeeaac 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -1,27 +1,12 @@
> >   // SPDX-License-Identifier: GPL-2.0+
> > -#include <drm/drm_rect.h>
> > +#include <linux/kernel.h>
> >   #include <linux/minmax.h>
> > +#include <drm/drm_rect.h>
> > +#include <drm/drm_fixed.h>
> >   #include "vkms_formats.h"
> > -/* The following macros help doing fixed point arithmetic. */
> > -/*
> > - * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fra=
ctional
> > - * parts respectively.
> > - *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
> > - * 31                                          0
> > - */
> > -#define SHIFT 15
> > -
> > -#define INT_TO_FIXED(a) ((a) << SHIFT)
> > -#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> SHIFT))
> > -#define FIXED_DIV(a, b) ((s32)(((s64)(a) << SHIFT) / (b)))
> > -/* This macro converts a fixed point number to int, and round half up =
it */
> > -#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (SHIFT - 1))) >> SHIFT)
> > -#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXE=
D(b)))
> > -#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXE=
D(b)))
> > -
> >   static size_t pixel_offset(const struct vkms_frame_info *frame_info, =
int x, int y)
> >   {
> >   	return frame_info->offset + (y * frame_info->pitch)
> > @@ -137,19 +122,19 @@ static void RGB565_to_argb_u16(struct line_buffer=
 *stage_buffer,
> >   	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> >   			       stage_buffer->n_pixels);
> > -	s32 fp_rb_ratio =3D INT_TO_FIXED_DIV(65535, 31);
> > -	s32 fp_g_ratio =3D INT_TO_FIXED_DIV(65535, 63);
> > +	s32 fp_rb_ratio =3D drm_fixp_div(drm_int2fixp(65535), 31);
> > +	s32 fp_g_ratio =3D drm_fixp_div(drm_int2fixp(65535), 63);
>=20
> I think you need to add `drm_int2fixp` to 31 and 63.
>=20
> >   	for (size_t x =3D 0; x < x_limit; x++, src_pixels++) {
> >   		u16 rgb_565 =3D le16_to_cpu(*src_pixels);
> > -		s32 fp_r =3D INT_TO_FIXED((rgb_565 >> 11) & 0x1f);
> > -		s32 fp_g =3D INT_TO_FIXED((rgb_565 >> 5) & 0x3f);
> > -		s32 fp_b =3D INT_TO_FIXED(rgb_565 & 0x1f);
> > +		s32 fp_r =3D drm_int2fixp((rgb_565 >> 11) & 0x1f);
> > +		s32 fp_g =3D drm_int2fixp((rgb_565 >> 5) & 0x3f);
> > +		s32 fp_b =3D drm_int2fixp(rgb_565 & 0x1f);
>=20
> And we are cast implicitly from 64 bits int to 32 bits which is
> implementation-defined AFAIK. So, probably we should be using `s64` for a=
ll
> of these variables.
>=20
> I tested the patch. And I'm seeing some differences in the intermediate
> results. From my testing, these changes solve those differences.

Hi Igor,

Thanks for checking the calc results and all inputs provided.  I just
sent a second version, can you take a look? I replicated your
suggestions for RGB565_to_argb_u16() in argb_u16_to_RGB565() and
double-checked for i386 and arm. Let me know what you think.

>=20
> Another thing that may have an impact on the final output is the lack of
> rounding in drm_fixed.h. This can potentially produce the wrong result.

Yeah, I see... I can include a comment about the rounding issue for
further improvements, or do you plan to work on it?

Thanks,

Melissa
>=20
> Thanks,
> ---
> Igor Torrente
>=20
> >   		out_pixels[x].a =3D (u16)0xffff;
> > -		out_pixels[x].r =3D FIXED_TO_INT_ROUND(FIXED_MUL(fp_r, fp_rb_ratio));
> > -		out_pixels[x].g =3D FIXED_TO_INT_ROUND(FIXED_MUL(fp_g, fp_g_ratio));
> > -		out_pixels[x].b =3D FIXED_TO_INT_ROUND(FIXED_MUL(fp_b, fp_rb_ratio));
> > +		out_pixels[x].r =3D drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
> > +		out_pixels[x].g =3D drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
> > +		out_pixels[x].b =3D drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
> >   	}
> >   }
> > @@ -248,17 +233,17 @@ static void argb_u16_to_RGB565(struct vkms_frame_=
info *frame_info,
> >   	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> >   			    src_buffer->n_pixels);
> > -	s32 fp_rb_ratio =3D INT_TO_FIXED_DIV(65535, 31);
> > -	s32 fp_g_ratio =3D INT_TO_FIXED_DIV(65535, 63);
> > +	s32 fp_rb_ratio =3D drm_fixp_div(drm_int2fixp(65535), 31);
> > +	s32 fp_g_ratio =3D drm_fixp_div(drm_int2fixp(65535), 63);
> >   	for (size_t x =3D 0; x < x_limit; x++, dst_pixels++) {
> > -		s32 fp_r =3D INT_TO_FIXED(in_pixels[x].r);
> > -		s32 fp_g =3D INT_TO_FIXED(in_pixels[x].g);
> > -		s32 fp_b =3D INT_TO_FIXED(in_pixels[x].b);
> > +		s32 fp_r =3D drm_int2fixp(in_pixels[x].r);
> > +		s32 fp_g =3D drm_int2fixp(in_pixels[x].g);
> > +		s32 fp_b =3D drm_int2fixp(in_pixels[x].b);
> > -		u16 r =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
> > -		u16 g =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
> > -		u16 b =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
> > +		u16 r =3D drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
> > +		u16 g =3D drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
> > +		u16 b =3D drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
> >   		*dst_pixels =3D cpu_to_le16(r << 11 | g << 5 | b);
> >   	}
>=20

--ltbt5kws2shgme65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMc4SIACgkQwqF3j0dL
ehy/aRAApmfb5+KQAy2iNH/Jygh1+IKycJnfVAqBsuB6LmMvy2ImmPBEP02qBhU6
Kb0xZxJcny/R/4UiNejCqr4LnVADa5LujgIeVl56XJ3tQvGNNDJKIvv3Rpl/tUW/
Kf/ucJiEBx/bKCoJoq0HC8RNZXLZEAQRvRkwA6FltleMEiaXtgeN0gFVjjbmG4ca
7Ff2jreh88yw1ADVt3GxW8sElMIXHTk8xOphZrK/gFEgY++eh54oxrtCKF+hY3Jp
Ch04s7wtVwf604F7fbPOIflTkyDjXth+h4J+tU8/zsMaKQ1njV7VGDt80SYy2ltp
2YXzWgikXe/5bdorpYBXEQFJxNYvgNeCzLIBtAAQIWyT3NIbzogcBgf55W/XWGmJ
23OoKi6y1eXRbZcGBvTXb+VOf2NwR51u7cBFCTKb/PzoTXIuZM9kYtxBr7vI3u/h
yeufZ1Tzuhzarf1MLr4gMFWoD4qwohnnn6zbkFFL6+0h4NPlRDkYaJEsWAn1ub2G
yoSgoDb9OQEQHf8wwzTxKa45c+Q3fm3gxRKi00ZINJnclsCRZ2viOzJ6ly99StaT
wa2Q/LQIaKeLN0ebU9ob0noFUwS3t1OhMfjL8d6NGpr/BQ4EvnbKcm3y7SJwTq2Q
Dx1PAp12iyHRMmG0Ld+S1a7bIGT/em5vC3wNCf7kZ+mLJAQ2tl4=
=exXR
-----END PGP SIGNATURE-----

--ltbt5kws2shgme65--
