Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD9634F72
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 06:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C4910E4E4;
	Wed, 23 Nov 2022 05:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E5710E4E4;
 Wed, 23 Nov 2022 05:20:45 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NH8bW43SMz4wgr;
 Wed, 23 Nov 2022 16:20:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1669180840;
 bh=P8mENoA61c0gWpjTpO5OaWphgwE90TW4qhvmhkFoqzQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NXx0qjtH4rEpXGVaERoT7BHKYvOo9AsUEvdr9MUj5uvb46tWLdlqc3h6nnUX/bYh1
 hJcNoCbxQsO8H10LEYcrd+p9RbAhwg3DQFLPwJRGXQtEZoAwIxGkSaxslumv3E9QST
 TQ63shWdg3s5IaHkyCtias10VJsg8zFS28dMfTemeFksGpAIpTpaKh025Gy4e4nqTn
 R+iWDgipMTBd+fi9HC3Pf2zHzaHcllEm9rAdDkhZtku/GdBwrtYFuvFMnHZ/JEuR4J
 A6ojcmOloTOdduCeOX6x6Ad7gNoHhahHcqxCW3PVSGbvzi2TaqRho3EJRq+QVuSjy4
 HmCZmRL5pc3Hg==
Date: Wed, 23 Nov 2022 16:20:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20221123162033.02910a5a@canb.auug.org.au>
In-Reply-To: <20221117183214.2473e745@canb.auug.org.au>
References: <20221117183214.2473e745@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QdkUDVBl0GM8MmuvnPiUWNp";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/QdkUDVBl0GM8MmuvnPiUWNp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 17 Nov 2022 18:32:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
>=20
> ld: drivers/video/fbdev/core/fbmon.o: in function `fb_modesetting_disable=
d':
> fbmon.c:(.text+0x1e4): multiple definition of `fb_modesetting_disabled'; =
drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> ld: drivers/video/fbdev/core/fbcmap.o: in function `fb_modesetting_disabl=
ed':
> fbcmap.c:(.text+0x478): multiple definition of `fb_modesetting_disabled';=
 drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> ld: drivers/video/fbdev/core/fbsysfs.o: in function `fb_modesetting_disab=
led':
> fbsysfs.c:(.text+0xb64): multiple definition of `fb_modesetting_disabled'=
; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined he=
re
> ld: drivers/video/fbdev/core/modedb.o: in function `fb_modesetting_disabl=
ed':
> modedb.c:(.text+0x129c): multiple definition of `fb_modesetting_disabled'=
; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined he=
re
> ld: drivers/video/fbdev/core/fbcvt.o: in function `fb_modesetting_disable=
d':
> fbcvt.c:(.text+0x0): multiple definition of `fb_modesetting_disabled'; dr=
ivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
>=20
> Caused by commit
>=20
>   0ba2fa8cbd29 ("fbdev: Add support for the nomodeset kernel parameter")
>=20
> This build does not have CONFIG_VIDEO_NOMODESET set.
>=20
> I applied the following patch for today.
>=20
> From 63f957a050c62478ed1348c5b204bc65c68df4d7 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 17 Nov 2022 18:19:22 +1100
> Subject: [PATCH] fix up for "fbdev: Add support for the nomodeset kernel =
parameter"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/fb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 3a822e4357b1..ea421724f733 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -807,7 +807,7 @@ extern int fb_find_mode(struct fb_var_screeninfo *var,
>  #if defined(CONFIG_VIDEO_NOMODESET)
>  bool fb_modesetting_disabled(const char *drvname);
>  #else
> -bool fb_modesetting_disabled(const char *drvname)
> +static inline bool fb_modesetting_disabled(const char *drvname)
>  {
>  	return false;
>  }
> --=20
> 2.35.1

This commit went away for a couple of linux-next releases, but now has
reappeared in the drm tree :-(  What went wrong?

I have reapplied the above patch...

--=20
Cheers,
Stephen Rothwell

--Sig_/QdkUDVBl0GM8MmuvnPiUWNp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN9raEACgkQAVBC80lX
0GwzsAf9FsX728ujmxJyRH1r6NH3/BtmZR7MmvHvSTVE2C+UOUjNQ/QPGgna2Wtl
G2Yt6ZPTSci350K2x6ISaAjVKwsLBACSyhgHddeKWz72ZEwB63MQUjGFC/Ql5L+a
M+GJASmOeExAd2i06E29dCV2XTBeV+2Iw+QhmotpsBtjjdFxoAmJv5KrJzzNtBpJ
CSdqCZzCBI6ClGRTK1J2gQ4KVUaCPvMQPHMMmy+/VMKrFiH5AjwATHdFX1VhbIEA
FfKwCCdarYnbW+L1tvOWogD2XEiasOnuJOvvxCOJqSUgHKTXfVbXRF74Ujo5NWGo
cGptfJ//Al8NmnLeppXRHtaj23tFRw==
=+ny7
-----END PGP SIGNATURE-----

--Sig_/QdkUDVBl0GM8MmuvnPiUWNp--
