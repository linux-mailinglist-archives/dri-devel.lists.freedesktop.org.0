Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED34A2C83E6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810286E484;
	Mon, 30 Nov 2020 12:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E556E484
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:12:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D02AAF78;
 Mon, 30 Nov 2020 12:12:20 +0000 (UTC)
Subject: Re: [PATCH v2 12/28] video: fbdev: tdfx: Fix set but not used warning
 in att_outb()
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-13-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5e7d4fe6-f122-b3c3-5153-f7a043fac252@suse.de>
Date: Mon, 30 Nov 2020 13:12:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-13-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1246792331=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1246792331==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="H1pNz1Elz7LVf4Sn0jD1Ry5loFKxl2a9x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--H1pNz1Elz7LVf4Sn0jD1Ry5loFKxl2a9x
Content-Type: multipart/mixed; boundary="MLWjn68f199HTOUtQqnGmFli3oa1czEK3";
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
Message-ID: <5e7d4fe6-f122-b3c3-5153-f7a043fac252@suse.de>
Subject: Re: [PATCH v2 12/28] video: fbdev: tdfx: Fix set but not used warning
 in att_outb()
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-13-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-13-sam@ravnborg.org>

--MLWjn68f199HTOUtQqnGmFli3oa1czEK3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> The tmp variable were assigned but the result was never used,

s/were/was

> so delete the tmp variable.
>=20
> v2:
>    - Update subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/tdfxfb.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.=
c
> index f056d80f6359..67e37a62b07c 100644
> --- a/drivers/video/fbdev/tdfxfb.c
> +++ b/drivers/video/fbdev/tdfxfb.c
> @@ -206,9 +206,7 @@ static inline u8 crt_inb(struct tdfx_par *par, u32 =
idx)
>  =20
>   static inline void att_outb(struct tdfx_par *par, u32 idx, u8 val)
>   {
> -	unsigned char tmp;
> -
> -	tmp =3D vga_inb(par, IS1_R);
> +	vga_inb(par, IS1_R);

It resets the attribute register's state. Hopefully, this doesn't get=20
optimized away.

>   	vga_outb(par, ATT_IW, idx);
>   	vga_outb(par, ATT_IW, val);
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--MLWjn68f199HTOUtQqnGmFli3oa1czEK3--

--H1pNz1Elz7LVf4Sn0jD1Ry5loFKxl2a9x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/E4Z0FAwAAAAAACgkQlh/E3EQov+Cs
tA//S8QSJ0is79uDuav9im2IRaELRa0n+5yT+H8IV36E5mnl5scFbpT2IZwPToO1Rr2UG1b+yIGf
70ZM3CwrnFS4XsILGZ4bWzKL+NGYr+SMeCL1qfCkYXymz2MYpcSp2pmRKanbFH6NALwrTCATe/Zt
kwVB1cDQj5+4wqQq6y6eexbO0EWckd9zqMrGPHs+S7mKVh5vd0na0TzASwaPK0X57bqE4vbbBKLV
htCvD+eZGvUKCXXcp9JxEmj8BrHPEymDxBbk8pWN6EB1pXPf9l5NAt77nRT/E4YPeBbFN9xTAOhC
yzCW42sS5ViaGWged9t/ad9vNTLIjAyDyYiNaSDxfcebbLh9G96OPkLhJRSUhCfKyz3bK186xm+u
Qm++5hoGBDs9HUV8MTqeRD7W2vVCqK+mqXob0xYDwJ1Gz4LoAZNfzTuxLvT1/6gKtas6ARBwwi5j
MZllzY1I/5WxVFchcTiH1mkRtM/TKfHDbNCnRTKkC2gXAjJ7nXSUO1rmGxxIf2yo429TSFMB44oU
tfvqYkVGF30HWoDu1eLH9l6sBANvxcU4u0fIR9W7lOcYkQFDjVfeAp00X4xEhdAGux5XyOFVvJpM
rQhPDGWRZ+mnvokGPEtjr8+/FlYwgVyp7cLiWdWMvDy2kM/iBNJ9s8B8zY7OZhaWQskvsyRD+At1
5V0=
=lzhd
-----END PGP SIGNATURE-----

--H1pNz1Elz7LVf4Sn0jD1Ry5loFKxl2a9x--

--===============1246792331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1246792331==--
