Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F62C84A0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 14:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE6A6E48E;
	Mon, 30 Nov 2020 13:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497666E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 13:04:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A722EADD5;
 Mon, 30 Nov 2020 13:04:16 +0000 (UTC)
Subject: Re: [PATCH v2 17/28] video: fbdev: tgafb: Fix kernel-doc and set but
 not used warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-18-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <31653cb9-244f-0839-fb28-daee0bcce5a6@suse.de>
Date: Mon, 30 Nov 2020 14:04:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-18-sam@ravnborg.org>
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1353463331=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1353463331==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NukdGSikX30tt4092MftjYdedI4rTWICV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NukdGSikX30tt4092MftjYdedI4rTWICV
Content-Type: multipart/mixed; boundary="4tb0iIV0KkyetX0sCdmc6O7ya1gaTYlpw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Aditya Pakki <pakki001@umn.edu>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Alex Dewar <alex.dewar90@gmail.com>, Antonino Daplas <adaplas@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Evgeny Novikov <novikov@ispras.ru>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 George Kennedy <george.kennedy@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Silva <gustavoars@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Jason Yan <yanaijie@huawei.com>, Jingoo Han <jingoohan1@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Joe Perches <joe@perches.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mike Rapoport <rppt@kernel.org>, Nathan Chancellor
 <natechancellor@gmail.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Peter Rosin <peda@axentia.se>, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Xiaofei Tan <tanxiaofei@huawei.com>
Message-ID: <31653cb9-244f-0839-fb28-daee0bcce5a6@suse.de>
Subject: Re: [PATCH v2 17/28] video: fbdev: tgafb: Fix kernel-doc and set but
 not used warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-18-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-18-sam@ravnborg.org>

--4tb0iIV0KkyetX0sCdmc6O7ya1gaTYlpw
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fix W=3D1 warnings:
> - Fix kernel-doc
> - Drop unused code
>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Joe Perches <joe@perches.com>
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/tgafb.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
> index 666fbe2f671c..ae0cf5540636 100644
> --- a/drivers/video/fbdev/tgafb.c
> +++ b/drivers/video/fbdev/tgafb.c
> @@ -555,7 +555,7 @@ tgafb_setcolreg(unsigned regno, unsigned red, unsig=
ned green, unsigned blue,
>  =20
>   /**
>    *      tgafb_blank - Optional function.  Blanks the display.
> - *      @blank_mode: the blank mode we want.
> + *      @blank: the blank mode we want.
>    *      @info: frame buffer structure that represents a single frame =
buffer
>    */
>   static int
> @@ -837,7 +837,7 @@ tgafb_clut_imageblit(struct fb_info *info, const st=
ruct fb_image *image)
>   	u32 *palette =3D ((u32 *)info->pseudo_palette);
>   	unsigned long pos, line_length, i, j;
>   	const unsigned char *data;
> -	void __iomem *regs_base, *fb_base;
> +	void __iomem *fb_base;
>  =20
>   	dx =3D image->dx;
>   	dy =3D image->dy;
> @@ -855,7 +855,6 @@ tgafb_clut_imageblit(struct fb_info *info, const st=
ruct fb_image *image)
>   	if (dy + height > vyres)
>   		height =3D vyres - dy;
>  =20
> -	regs_base =3D par->tga_regs_base;
>   	fb_base =3D par->tga_fb_base;
>  =20
>   	pos =3D dy * line_length + (dx * 4);
> @@ -1034,7 +1033,7 @@ tgafb_fillrect(struct fb_info *info, const struct=
 fb_fillrect *rect)
>   		     regs_base + TGA_MODE_REG);
>   }
>  =20
> -/**
> +/*
>    *      tgafb_copyarea - REQUIRED function. Can use generic routines =
if
>    *                       non acclerated hardware and packed pixel bas=
ed.
>    *                       Copies on area of the screen to another area=
=2E
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--4tb0iIV0KkyetX0sCdmc6O7ya1gaTYlpw--

--NukdGSikX30tt4092MftjYdedI4rTWICV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/E7c4FAwAAAAAACgkQlh/E3EQov+Af
Ig//UW1HUf7Xz3R2sPe0V81j8FWUFGxX4t6PBNskJPADVVM9WAVu5yshtEdQmlnbYI7xCs7Z15Nz
A6EtB8D/8uZVusU/5+F/1w/NgJWK9pGJhoVqTIOSZK8sHFEENDGlzHouxl5H7Kgg5IKlk4GRWjMQ
6I1AonHP0bW54N4Yuc//o2i8BLA72Zp5nkk/ty/y1J/yFtGupdQlknNLLjMjNoqEptpd10i8tgYf
lDdb9dtrcUwOOVvSZno95H3TnZpeFDLBl/0AkCJ/WHIyQj6LsT+tUYFdosfwq72c/bypipWbsWfV
8R1UBx0B2vUsdf/bMKRgH4wySDwrdc8+PaWmImPxm2S+UFUoPjcPUCOVkKkEB9Hg4yVZD6FXyTCr
/D2ZoAD/vsbQKgxWofpbRpSGQoQHD+NPS7GgTPDsnrgj97X3elFtm1RhcrcIbiCO/N6n47rnr7jq
6EnH9/J1PrrKUwic0MhUHJ92Ni09a0mDBmOsli9gv2zWkLn32Crz1QZjWIdw8au0tegdPGAlThcW
L91r4BaE+o3dGy2m43g6TfnuWPL35S4/ZnDyvMAZ6sjIkre3KQh0ZqT296jorx4McenY//WYeNVZ
8bElXYQtSI85uSSnUsU3hui7noujsrwfvd4+Vu8mysE00fP65YDjd9drM/vX2JPSzvzdzRK6JPZP
tZ0=
=F9nG
-----END PGP SIGNATURE-----

--NukdGSikX30tt4092MftjYdedI4rTWICV--

--===============1353463331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1353463331==--
