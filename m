Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F1E2C7892
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 11:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2042E6E185;
	Sun, 29 Nov 2020 10:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD2C6E185
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 10:03:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0FD8AC6A;
 Sun, 29 Nov 2020 10:03:33 +0000 (UTC)
Subject: Re: [PATCH v2 02/28] video: fbcon: Fix warnings by using pr_debug()
 in fbcon
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-3-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9fbdaff8-18af-223d-6cec-4b44aeb94fec@suse.de>
Date: Sun, 29 Nov 2020 11:03:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-3-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1655301654=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1655301654==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Y1dyWBokTQjuohFD3fJHCxmzQeGgbDqBD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Y1dyWBokTQjuohFD3fJHCxmzQeGgbDqBD
Content-Type: multipart/mixed; boundary="uZqC5lgzqUgo9PxVBELLGxOPaxuKRXLNr";
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
Message-ID: <9fbdaff8-18af-223d-6cec-4b44aeb94fec@suse.de>
Subject: Re: [PATCH v2 02/28] video: fbcon: Fix warnings by using pr_debug()
 in fbcon
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-3-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-3-sam@ravnborg.org>

--uZqC5lgzqUgo9PxVBELLGxOPaxuKRXLNr
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> Replacing DPRINTK() statements with pr_debug fixes set but not used
> warnings.  And moves to a more standard logging setup at the same time.=

>=20
> v2:
>    - Fix indent (Joe)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Joe Perches <joe@perches.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Peilin Ye <yepeilin.cs@gmail.com>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: George Kennedy <george.kennedy@oracle.com>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Peter Rosin <peda@axentia.se>
> ---
>   drivers/video/fbdev/core/fbcon.c | 25 ++++++++-----------------
>   1 file changed, 8 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/cor=
e/fbcon.c
> index bf61598bf1c3..44a5cd2f54cc 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -56,8 +56,6 @@
>    *  more details.
>    */
>  =20
> -#undef FBCONDEBUG
> -

I guess this was added for quick debugging during development. Anyway, I =

never liked these kinds of hacks.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>   #include <linux/module.h>
>   #include <linux/types.h>
>   #include <linux/fs.h>
> @@ -82,12 +80,6 @@
>  =20
>   #include "fbcon.h"
>  =20
> -#ifdef FBCONDEBUG
> -#  define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt, __func__=
 , ## args)
> -#else
> -#  define DPRINTK(fmt, args...)
> -#endif
> -
>   /*
>    * FIXME: Locking
>    *
> @@ -1015,11 +1007,11 @@ static const char *fbcon_startup(void)
>   	rows /=3D vc->vc_font.height;
>   	vc_resize(vc, cols, rows);
>  =20
> -	DPRINTK("mode:   %s\n", info->fix.id);
> -	DPRINTK("visual: %d\n", info->fix.visual);
> -	DPRINTK("res:    %dx%d-%d\n", info->var.xres,
> -		info->var.yres,
> -		info->var.bits_per_pixel);
> +	pr_debug("mode:   %s\n", info->fix.id);
> +	pr_debug("visual: %d\n", info->fix.visual);
> +	pr_debug("res:    %dx%d-%d\n", info->var.xres,
> +		 info->var.yres,
> +		 info->var.bits_per_pixel);
>  =20
>   	fbcon_add_cursor_timer(info);
>   	return display_desc;
> @@ -2013,7 +2005,7 @@ static int fbcon_resize(struct vc_data *vc, unsig=
ned int width,
>   	    y_diff < 0 || y_diff > virt_fh) {
>   		const struct fb_videomode *mode;
>  =20
> -		DPRINTK("attempting resize %ix%i\n", var.xres, var.yres);
> +		pr_debug("attempting resize %ix%i\n", var.xres, var.yres);
>   		mode =3D fb_find_best_mode(&var, &info->modelist);
>   		if (mode =3D=3D NULL)
>   			return -EINVAL;
> @@ -2023,7 +2015,7 @@ static int fbcon_resize(struct vc_data *vc, unsig=
ned int width,
>   		if (virt_w > var.xres/virt_fw || virt_h > var.yres/virt_fh)
>   			return -EINVAL;
>  =20
> -		DPRINTK("resize now %ix%i\n", var.xres, var.yres);
> +		pr_debug("resize now %ix%i\n", var.xres, var.yres);
>   		if (con_is_visible(vc)) {
>   			var.activate =3D FB_ACTIVATE_NOW |
>   				FB_ACTIVATE_FORCE;
> @@ -3299,8 +3291,7 @@ static void fbcon_exit(void)
>  =20
>   		if (info->queue.func)
>   			pending =3D cancel_work_sync(&info->queue);
> -		DPRINTK("fbcon: %s pending work\n", (pending ? "canceled" :
> -			"no"));
> +		pr_debug("fbcon: %s pending work\n", (pending ? "canceled" : "no"));=

>  =20
>   		for (j =3D first_fb_vc; j <=3D last_fb_vc; j++) {
>   			if (con2fb_map[j] =3D=3D i) {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--uZqC5lgzqUgo9PxVBELLGxOPaxuKRXLNr--

--Y1dyWBokTQjuohFD3fJHCxmzQeGgbDqBD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/Dce4FAwAAAAAACgkQlh/E3EQov+A/
CRAAjppBMa+VYXc0pTyEpyWbGVVseOgW40U1A7JaKVHgR1tMMuOWNH6MelmMrYzgyhDh2OPa23xm
KnroutrGTm0Afyxg8i4il360HOBXqZzIeIgqQYoBL0yjlTfYlR7PZTiY4dt1FPOHIoPEeolvDydj
4r3GDvE7Av484u8caM9op8vKW+JLihMKlGGysUq/qV3Lm/Y6u8cN9yY8kJgLCiU/6UXXxhN2OW7F
gQGiPI5mfR38eW0NprbJavBsdo0/3xLU9ZfNkvV6SQD10flbxcex0p4jfGhfUHpEn5nbvQ8JWrkR
SceKvN1Pd+TgOolb7zZWFCoBgLPyzlQVh9CHHu97ce0zLEb651ZGWH5LSbRAc0ren1/0B3FY1eAH
Vrs8RMdPsCsrSitSXkRiPybEk2yySLCVmRhwGoxcokOb9RwVWVmY6/PYoHJ3adPniye+XBxDh1S4
XSWLatZz8jWRfLziaGn6j4ejse2e9TZgrEQSFEBQDPOy9zv2qMF8C5ur6YPrdn5gGuT2AsbqdNaf
+hMcCx9Y+AWJ0fh5dRO9pYIDJw3BbpUVKXZyLecl0JXGgbUodNPzf1HXAF6v5z/L0kwfczC2VKzl
2iMHi4Cldx7ymrta8Xl/oA8t0ALOIfz7DyQLXKpdIH6ERF36JwPOy7jhBTA8HPieIN+J9oRKpnpf
XFI=
=/+Ig
-----END PGP SIGNATURE-----

--Y1dyWBokTQjuohFD3fJHCxmzQeGgbDqBD--

--===============1655301654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1655301654==--
