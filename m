Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C42C84FD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 14:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E096E4B6;
	Mon, 30 Nov 2020 13:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823946E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 13:22:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0143BAC91;
 Mon, 30 Nov 2020 13:22:30 +0000 (UTC)
Subject: Re: [PATCH v2 18/28] video: fbdev: mx3fb: Fix kernel-doc, set but not
 used and string warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-19-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <21d7f316-120d-930a-98c1-27426f6439cc@suse.de>
Date: Mon, 30 Nov 2020 14:22:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-19-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1200999613=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1200999613==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="W5ondu2BzooQuN1TJhHShX5xd8qVp4c8s"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--W5ondu2BzooQuN1TJhHShX5xd8qVp4c8s
Content-Type: multipart/mixed; boundary="gBhdQZ4fzKcCFXCbfYJKRXkfI9yrNiC2e";
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
Message-ID: <21d7f316-120d-930a-98c1-27426f6439cc@suse.de>
Subject: Re: [PATCH v2 18/28] video: fbdev: mx3fb: Fix kernel-doc, set but not
 used and string warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-19-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-19-sam@ravnborg.org>

--gBhdQZ4fzKcCFXCbfYJKRXkfI9yrNiC2e
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fix W=3D1 warnings:
> - Fix kernel-doc
> - Drop unused code/variables
> - Use memcpy to copy a string without zero-termination
>    strncpy() generates a warning
>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Xiaofei Tan <tanxiaofei@huawei.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/mx3fb.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
> index 894617ddabcb..fabb271337ed 100644
> --- a/drivers/video/fbdev/mx3fb.c
> +++ b/drivers/video/fbdev/mx3fb.c
> @@ -445,7 +445,6 @@ static void sdc_enable_channel(struct mx3fb_info *m=
x3_fbi)
>   static void sdc_disable_channel(struct mx3fb_info *mx3_fbi)
>   {
>   	struct mx3fb_data *mx3fb =3D mx3_fbi->mx3fb;
> -	uint32_t enabled;
>   	unsigned long flags;
>  =20
>   	if (mx3_fbi->txd =3D=3D NULL)
> @@ -453,7 +452,7 @@ static void sdc_disable_channel(struct mx3fb_info *=
mx3_fbi)
>  =20
>   	spin_lock_irqsave(&mx3fb->lock, flags);
>  =20
> -	enabled =3D sdc_fb_uninit(mx3_fbi);
> +	sdc_fb_uninit(mx3_fbi);
>  =20
>   	spin_unlock_irqrestore(&mx3fb->lock, flags);
>  =20
> @@ -732,7 +731,7 @@ static int mx3fb_unmap_video_memory(struct fb_info =
*fbi);
>  =20
>   /**
>    * mx3fb_set_fix() - set fixed framebuffer parameters from variable s=
ettings.
> - * @info:	framebuffer information pointer
> + * @fbi:	framebuffer information pointer
>    * @return:	0 on success or negative error code on failure.
>    */
>   static int mx3fb_set_fix(struct fb_info *fbi)
> @@ -740,7 +739,7 @@ static int mx3fb_set_fix(struct fb_info *fbi)
>   	struct fb_fix_screeninfo *fix =3D &fbi->fix;
>   	struct fb_var_screeninfo *var =3D &fbi->var;
>  =20
> -	strncpy(fix->id, "DISP3 BG", 8);
> +	memcpy(fix->id, "DISP3 BG", 8);
>  =20
>   	fix->line_length =3D var->xres_virtual * var->bits_per_pixel / 8;
>  =20
> @@ -1105,6 +1104,8 @@ static void __blank(int blank, struct fb_info *fb=
i)
>  =20
>   /**
>    * mx3fb_blank() - blank the display.
> + * @blank:	blank value for the panel
> + * @fbi:	framebuffer information pointer
>    */
>   static int mx3fb_blank(int blank, struct fb_info *fbi)
>   {
> @@ -1126,7 +1127,7 @@ static int mx3fb_blank(int blank, struct fb_info =
*fbi)
>   /**
>    * mx3fb_pan_display() - pan or wrap the display
>    * @var:	variable screen buffer information.
> - * @info:	framebuffer information pointer.
> + * @fbi:	framebuffer information pointer.
>    *
>    * We look only at xoffset, yoffset and the FB_VMODE_YWRAP flag
>    */
> @@ -1387,6 +1388,8 @@ static int mx3fb_unmap_video_memory(struct fb_inf=
o *fbi)
>  =20
>   /**
>    * mx3fb_init_fbinfo() - initialize framebuffer information object.
> + * @dev: the device
> + * @ops:	framebuffer device operations
>    * @return:	initialized framebuffer structure.
>    */
>   static struct fb_info *mx3fb_init_fbinfo(struct device *dev,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--gBhdQZ4fzKcCFXCbfYJKRXkfI9yrNiC2e--

--W5ondu2BzooQuN1TJhHShX5xd8qVp4c8s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/E8hQFAwAAAAAACgkQlh/E3EQov+BP
tg//QgEeyxJohypv5p+2dp18uL6+hQhFn2JFqV5/Cpttk8tRB4tbnGljL4Z6T/sx+sfNIafvkvgb
6w5RNP/+pjsyKtwdqlipKW0aPBMseRHgNogBnZ8M7SbsSSZYfre7kip31PgJRQ+jzAHhjdVT5Uao
zf1CDP66+HrYd6x9UjZ2NoCiOGl4cjgWb4bV+wssIw0qyoUPerWj4kkKD0AXI8ZolLjxcm9Aqe0Z
lirsRyNpu+5+D2WZDhdlG+Ja3L2kX0HUnChCBDv12QpBN1pXkV7KOliu0mn+jPe3Wp5vWSUQyFJ2
ntRDfeQ2mwz5MadWRqr0NwcPV36fDDhE5vpDha+UVxgIJ4uEjve1Z9oV7aPmgZnAF/NOWAt3Ptco
9EOpmvxu4Jw6DefyYzCeyG7f1w52pC2KvLHuUjnCSFO27gCHJwg+ddDtAiCgHUAmvRk+HmXfW5sJ
1x73mpia7d5mPP1K5/DL6s8cMSNwFKVJTnp7bI/rskkGBrG/nhapIXPlVkLaK0JK7G21WfcODSQB
y9pj4am0x3sS+oTpO6jLuPdvck6XztaKxx9aERswrVLJrPi/WFrJx+zaVOoOoIDQl2IgNkjC865h
qOVpO1526HVsI6QlF7eVB9tC4vQMmf89Jm46goqMn9/+r9Sw9h1fwmmyfJ6fDFc1PUnBiyEGySBD
pmc=
=FNZb
-----END PGP SIGNATURE-----

--W5ondu2BzooQuN1TJhHShX5xd8qVp4c8s--

--===============1200999613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1200999613==--
