Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B97763F08
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 03:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1F88992E;
	Wed, 10 Jul 2019 01:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E528992E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 01:54:12 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w17so741907qto.10
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 18:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Rl/l0lv/RtftyGXlBncrpuyucSyNxpAjwoNFIcH2g3s=;
 b=L4moPOPZ6owV0vP5sfXqeBCA2j/8Rw/PtOxZItrl+kemlDztq8YoIwqvBfErERqFYY
 G9H4vUyNYZ8lvA9XZDRrU0/NdTfhJMXbx+69rQDI79r7dt1HKKsa0Ps8b/PhEQFqcaBw
 xkptGzqTN/dRcsn8+5SXljyP7lTvAeZZuJCfPzi8ZqR4PCKwXRwKrK7fnoFIzft/dnGH
 gRPjBcacDi9YSaamuExIcFH7ePiN4oFb4Bvt4WeotHm2I1QnbwNdLNU8zgDaQZV4UHI2
 m9c3c9h/6NKOhTxVXIc4ScnF1SpbsjTiG4vdYYMJqb6XXYxwplsFwMB2mwcijFD2ntF6
 RvEA==
X-Gm-Message-State: APjAAAUQ/TpIpUF5fgVFksdfsh9VsdSIHAEDZrrbmnoeRIYckXt4uJjK
 2UuHEudNKdt/QgTZoX3Mlww=
X-Google-Smtp-Source: APXvYqwdGvebD5uoi6JfsmmnbR3yoS0xb1kwNdhLQ2mb7mTC91DvgkA4fuimynlpMDk6de4G6s28wg==
X-Received: by 2002:ac8:2c17:: with SMTP id d23mr21131594qta.385.1562723651223; 
 Tue, 09 Jul 2019 18:54:11 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.22])
 by smtp.gmail.com with ESMTPSA id i22sm348098qti.30.2019.07.09.18.54.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 18:54:10 -0700 (PDT)
Date: Tue, 9 Jul 2019 22:54:05 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>, Simon Ser <contact@emersion.fr>,
 Oleg Vasilev <oleg.vasilev@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH 2/2] drm/vkms: Use alpha channel for blending cursor with
 primary
Message-ID: <f09271656e9b29cb56e63c0bbf864060e5974cad.1562695974.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1562695974.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1562695974.git.rodrigosiqueiramelo@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Rl/l0lv/RtftyGXlBncrpuyucSyNxpAjwoNFIcH2g3s=;
 b=ejFKPXzvn1phIqms4yYo1HxB+xY6s8QiTpK9ZIM9O57fTojLMYHr/DRRFzDGTZ6WRr
 AfHD/+bLrnMSON1NNIFDBkrmigmXylIQs5w6oZMKtm6KatMB/VhnG0YdC1yrMZxSyxPz
 563vtMNEkXSXr/+cvyhEZTIwSSa7d6Hzps4Sx6wGLO+75TAysv2hPme8AWIC852GRMoj
 1P4K6TstYvbDRr91qonIYHaO1qCMF4pxk3FpIisyVcXK7iYJ4gZHomtRJawJfCuwaKGB
 mbYE4Kmc/j8BrNLum2hJwSB2zrSguVLEFdOd53KuH3R17Oj64eVTkggetf1le5Q3pnTU
 88Sw==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2112827665=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2112827665==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fpslhh6j4fs42obw"
Content-Disposition: inline


--fpslhh6j4fs42obw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Currently, the blend function overwriting the cursor value into the
primary plane. This patch utilizes the alpha value for a fully
transparent blend of the cursor (vaddr_src) with primary (vaddr_dst)
instead of overwriting it in blend().

Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Mamta Shukla <mamtashukla555@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vk=
ms_composer.c
index fb106964d8bf..bb758a5131a4 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -26,6 +26,17 @@ static void set_pixel(int x, int y, u8 *buffer,
 	*dst =3D value;
 }
=20
+static u32 apply_alpha(u32 src, u32 dst)
+{
+	u8 alpha;
+	u32 k;
+
+	alpha =3D src >> 24;
+	alpha =3D (alpha + 1) >> 8;
+	k =3D (alpha << 24) - alpha;
+	return (k & src) | (~k & dst);
+}
+
 /**
  * compute_crc - Compute CRC value on output frame
  *
@@ -89,15 +100,19 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 	int y_limit =3D y_src + h_dst;
 	int x_limit =3D x_src + w_dst;
=20
-	u32 pixel_src;
+	u32 pixel_src, pixel_dst, new_pixel;
=20
 	for (y =3D y_src, i_dst =3D y_dst; y < y_limit; ++y) {
 		for (x =3D x_src, j_dst =3D x_dst; x < x_limit; ++x) {
 			pixel_src =3D get_pixel_from_buffer(x, y,
 							  vaddr_src,
 							  src_composer);
-			set_pixel(j_dst, i_dst, vaddr_dst, dest_composer,
-				  pixel_src);
+			pixel_dst =3D get_pixel_from_buffer(j_dst, i_dst,
+							  vaddr_dst,
+							  dst_composer);
+			new_pixel =3D apply_alpha(pixel_src, pixel_dst);
+			set_pixel(j_dst, i_dst, vaddr_dst, dst_composer,
+				  new_pixel);
 			j_dst++;
 		}
 		i_dst++;
--=20
2.21.0

--fpslhh6j4fs42obw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0lRTwACgkQWJzP/com
vP8IwA/9GS6vppNEv2BszWYSS5mPf/m5tf+g31Bh+IaaNJIrV4enswcymuGGJFI+
X1YkTtk+PklMFKEvnIS8GEKaMcPGJ5z6xpZ2OsdI5kgoa+OphTUaxAtj5+BCTPH3
hOtUilhl+tPxcQH+wZXFPMRuF+kZcr57rZ9UPSk9ti/C5N+tdMEB1JkZ24QOCLAj
cLse0oMFv1CdN6uMMm3NsjohpE2vWPQFERoduABGWXhV6kL0Rc1Il/REUo60dnP6
rJxA+ZPK29p+Gsleb+t+kdjk5YmwbzzuOxaC5dfpqPBgL0bRzS7hqZA9tgYCPQWj
YpJAChHw1OgIEKsXvibM4dpb2a6BrBDj5QtqjtgZqsiBramBhCcGkB4hujH8YSdC
lcfP5t59EEcuynn6vlq0bW2PJp0EE35OuvuAmyHyMXXnCxgMXCrsVkfgFJIWI0nt
Af++PQJzPIv26bEq5fEP7d7BKtCe7V43uVb/MYQeGTFWIzOuir0hSuDzfLHX4QTY
9M8Bko7certhVdjZLDHHOPBYazRlvWiOrWngi5gIsNIjr6K9QxLQVrXaLtcmcJg6
u5N88kD+4FR/1NrVsh/yowXhhvOllgoSeG3jkRR9WdUBCAjhMIMWnrftXli0NvJ4
2Kwg5pKrClwP2ajZ5apbJgekqV2MhnoGms0CITk/32V9aRJaUvE=
=JUlX
-----END PGP SIGNATURE-----

--fpslhh6j4fs42obw--

--===============2112827665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2112827665==--
