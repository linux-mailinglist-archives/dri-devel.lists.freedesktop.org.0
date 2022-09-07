Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2E95B0D24
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 21:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D844D10E845;
	Wed,  7 Sep 2022 19:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3991C10E83E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 19:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q60A7O2cwDRGmCCMAGlOcenDecqVyG/8lkpDi3chEWI=; b=AK1o1uQKOcjjQNe+I5TIpp6toP
 lNTmMu/E2WkOyC0WcER+i3nprmeTaZYYPPtGvthpbnNxJeY+EM6E+v4JRyZIAoyrq/XmcBInJTxkc
 cxkn+Pm8VOelRq7UIJOup6jDusS8jZTy5pIjnisk6AFE0TlijpEwkeWmqVnXll3zffrlrlBB39U7H
 Z1KPMrCqwkgcnXcVBqgem3izDEssY4pHIN/bf90z2uzTHjLxUV/8aVibKe9FrDSs/CR73YpOdZgFN
 N+LGOoWy374qjP5jA5DA3Y+3SO17VXKJH4VOyqBN9QgTt4vCeZXsrt5uS72o2FBuqe2sunJHGex9t
 EG5O2iYg==;
Received: from [38.44.74.92] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oW0da-00CtuV-Pc; Wed, 07 Sep 2022 21:23:02 +0200
Date: Wed, 7 Sep 2022 18:22:50 -0100
From: Melissa Wen <mwen@igalia.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: build failure of next-20220906 due to 396369d67549 ("drm: vkms:
 Add support to the RGB565 format")
Message-ID: <20220907192250.jfkpwaq54f2h7stf@mail.igalia.com>
References: <YxducgSzR6/zyHD7@debian>
 <CADVatmNfc1YT02v5-FaMoGN==MOx5ZJ=o8YMQAH19Gvf91betA@mail.gmail.com>
 <20220907170451.efhz62nkxybqxtaa@mail.igalia.com>
 <CADVatmNodAV4PB5jjARnowu=VGbgMWgBYDWPuwJe-f1WFaS8ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ts6kcvki5ecf2bf5"
Content-Disposition: inline
In-Reply-To: <CADVatmNodAV4PB5jjARnowu=VGbgMWgBYDWPuwJe-f1WFaS8ow@mail.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, linux-next <linux-next@vger.kernel.org>,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ts6kcvki5ecf2bf5
Content-Type: multipart/mixed; boundary="kga24fbvtfkl572e"
Content-Disposition: inline


--kga24fbvtfkl572e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/07, Sudip Mukherjee wrote:
> Hi Melissa,
>=20
> On Wed, Sep 7, 2022 at 6:05 PM Melissa Wen <mwen@igalia.com> wrote:
> >
> > On 09/06, Sudip Mukherjee wrote:
> > > On Tue, Sep 6, 2022 at 4:59 PM Sudip Mukherjee (Codethink)
> > > <sudipm.mukherjee@gmail.com> wrote:
> > > >
> > > > Hi All,
> > > >
> > > > The builds of next-20220906 fails for mips, xtensa and arm allmodco=
nfig.
> > > >
> > > > The errors in mips and xtensa are:
> > > >
> > > > ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] undefine=
d!
> > > >
> > > > The error in arm is:
> > > >
> > > > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/vkms/vkms.ko] u=
ndefined!
> > > > ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/vkms/vkms.ko] un=
defined!
> > > >
> > > >
> > > > Trying to do a git bisect to find out the offending commit.
> > >
> > > git bisect points to 396369d67549 ("drm: vkms: Add support to the
> > > RGB565 format")
> >
> > Hi Sudip,
> >
> > Thanks for pointing out this issue.
> >
> > I think we can replace the macros that are triggering those compilation
> > error by functions in drm/drm_fixed.h that do the same calculation.
> >
> > I checked those errors when building for arm and i386 and the issues are
> > fixed after applying the patch below. I appreciate if you can test.
>=20
> Sorry, could not test as the downloaded mbox is saying patch is
> corrupted and could not be applied. Can you please attach the patch or
> maybe send using git send-email.

Sorry, my bad. It's attached. Let me know if goes smoothly.

Thanks again,

Melissa
>=20
>=20
> --=20
> Regards
> Sudip

--kga24fbvtfkl572e
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-drm-vkms-fix-32-bits-compilation-error-by-replacing-.patch"
Content-Transfer-Encoding: quoted-printable

=46rom d52824abf4d3913dfd82a927f320ad4f670545d1 Mon Sep 17 00:00:00 2001
=46rom: Melissa Wen <mwen@igalia.com>
Date: Wed, 7 Sep 2022 15:14:31 -0100
Subject: [PATCH] drm/vkms: fix 32 bits compilation error by replacing macros

Replace vkms_formats macro for fixed-point operations with functions
=66rom drm/drm_fixed.h to do the same job and fix 32-bits compilation
errors.

Fixes: a19c2ac9858 ("drm: vkms: Add support to the RGB565 format")
Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 53 +++++++++++------------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkm=
s_formats.c
index 300abb4d1dfe..ddcd3cfeeaac 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -1,27 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0+
=20
-#include <drm/drm_rect.h>
+#include <linux/kernel.h>
 #include <linux/minmax.h>
+#include <drm/drm_rect.h>
+#include <drm/drm_fixed.h>
=20
 #include "vkms_formats.h"
=20
-/* The following macros help doing fixed point arithmetic. */
-/*
- * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fractio=
nal
- * parts respectively.
- *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
- * 31                                          0
- */
-#define SHIFT 15
-
-#define INT_TO_FIXED(a) ((a) << SHIFT)
-#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> SHIFT))
-#define FIXED_DIV(a, b) ((s32)(((s64)(a) << SHIFT) / (b)))
-/* This macro converts a fixed point number to int, and round half up it */
-#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (SHIFT - 1))) >> SHIFT)
-#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)=
))
-#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(b)=
))
-
 static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x=
, int y)
 {
 	return frame_info->offset + (y * frame_info->pitch)
@@ -137,19 +122,19 @@ static void RGB565_to_argb_u16(struct line_buffer *st=
age_buffer,
 	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
 			       stage_buffer->n_pixels);
=20
-	s32 fp_rb_ratio =3D INT_TO_FIXED_DIV(65535, 31);
-	s32 fp_g_ratio =3D INT_TO_FIXED_DIV(65535, 63);
+	s32 fp_rb_ratio =3D drm_fixp_div(drm_int2fixp(65535), 31);
+	s32 fp_g_ratio =3D drm_fixp_div(drm_int2fixp(65535), 63);
=20
 	for (size_t x =3D 0; x < x_limit; x++, src_pixels++) {
 		u16 rgb_565 =3D le16_to_cpu(*src_pixels);
-		s32 fp_r =3D INT_TO_FIXED((rgb_565 >> 11) & 0x1f);
-		s32 fp_g =3D INT_TO_FIXED((rgb_565 >> 5) & 0x3f);
-		s32 fp_b =3D INT_TO_FIXED(rgb_565 & 0x1f);
+		s32 fp_r =3D drm_int2fixp((rgb_565 >> 11) & 0x1f);
+		s32 fp_g =3D drm_int2fixp((rgb_565 >> 5) & 0x3f);
+		s32 fp_b =3D drm_int2fixp(rgb_565 & 0x1f);
=20
 		out_pixels[x].a =3D (u16)0xffff;
-		out_pixels[x].r =3D FIXED_TO_INT_ROUND(FIXED_MUL(fp_r, fp_rb_ratio));
-		out_pixels[x].g =3D FIXED_TO_INT_ROUND(FIXED_MUL(fp_g, fp_g_ratio));
-		out_pixels[x].b =3D FIXED_TO_INT_ROUND(FIXED_MUL(fp_b, fp_rb_ratio));
+		out_pixels[x].r =3D drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
+		out_pixels[x].g =3D drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
+		out_pixels[x].b =3D drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
 	}
 }
=20
@@ -248,17 +233,17 @@ static void argb_u16_to_RGB565(struct vkms_frame_info=
 *frame_info,
 	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
 			    src_buffer->n_pixels);
=20
-	s32 fp_rb_ratio =3D INT_TO_FIXED_DIV(65535, 31);
-	s32 fp_g_ratio =3D INT_TO_FIXED_DIV(65535, 63);
+	s32 fp_rb_ratio =3D drm_fixp_div(drm_int2fixp(65535), 31);
+	s32 fp_g_ratio =3D drm_fixp_div(drm_int2fixp(65535), 63);
=20
 	for (size_t x =3D 0; x < x_limit; x++, dst_pixels++) {
-		s32 fp_r =3D INT_TO_FIXED(in_pixels[x].r);
-		s32 fp_g =3D INT_TO_FIXED(in_pixels[x].g);
-		s32 fp_b =3D INT_TO_FIXED(in_pixels[x].b);
+		s32 fp_r =3D drm_int2fixp(in_pixels[x].r);
+		s32 fp_g =3D drm_int2fixp(in_pixels[x].g);
+		s32 fp_b =3D drm_int2fixp(in_pixels[x].b);
=20
-		u16 r =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
-		u16 g =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
-		u16 b =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
+		u16 r =3D drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
+		u16 g =3D drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
+		u16 b =3D drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
=20
 		*dst_pixels =3D cpu_to_le16(r << 11 | g << 5 | b);
 	}
--=20
2.35.1


--kga24fbvtfkl572e--

--ts6kcvki5ecf2bf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMY74EACgkQwqF3j0dL
ehx1kBAAoJIU5Tami+4a1gE3yNrKeqUEdxsBoaVs97kcDGqtKXSdzM3SU7k39QTw
4+pnq20IOHQnCcZZqgs97WLKdNJCy8X5Qr9DB9qGQzE4sanecWmD44iP7unHRRVv
J31pCGJLY9DSdmFR2T4zx06gV1y1JJ99HMx90IlgKYVERAn+O9bUP5iMEu/nPN+z
gtgZQLj9ijvmyhiA4kkoQD488iM+Jkj2q4mmCIUvThjpWIodwWrocGtMLpzHtZmp
zzDAJ3IFXuaeQbLpa83hBtiaJ4ucYYW+b0T5OaNj1qXFzoUZrZS79EPjl1gXLo31
RfSQiMtHRFwQuHscZSZZYFVoLNCL62X800Eb5uCHYcUZ9Vp3fA7urMOPwH76Wrbg
Bb1I8ErvuHg5HdP0pglchLS+4WzK91hP/+mQ/XImAo2Io2J22Ywdsgv0oUOBxqvq
RTinKVQ0UlfZ3RsIGLp1FvztESsVzpZPEDD++UY7Jl5E82OWtPmEzM9AbfQxNf7m
+sHo9iXdXFzQ1lMh/lxnIRUxAfRsN8bK9F/aquzdDAgKNYr9+sp7Ld4Ui9GNtsVy
SEOjX5DkSCZKxYtqT2uS7ArlivmGxYPC+o4XRnlHtOx1O49Zaxryvvdntdz+tsZn
pSZCfUZfro5+IY+MM7VCGUVxMqCeIlGo45bRe3kjKFr3TwZSb2s=
=5FWC
-----END PGP SIGNATURE-----

--ts6kcvki5ecf2bf5--
