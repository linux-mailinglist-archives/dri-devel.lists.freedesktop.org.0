Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1A42C788D
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 10:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6BE6E182;
	Sun, 29 Nov 2020 09:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FE589807
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 09:59:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99878AC55;
 Sun, 29 Nov 2020 09:59:27 +0000 (UTC)
Subject: Re: [PATCH v2 28/28] video: fbdev: s1d13xxxfb: Fix kernel-doc and set
 but not used warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-29-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <18caca15-a6e7-cb4b-3028-c010922bda80@suse.de>
Date: Sun, 29 Nov 2020 10:59:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-29-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============2063560397=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2063560397==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1aenue9Ch7R7POAKtsLeZ3WSZkYx4AW4x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1aenue9Ch7R7POAKtsLeZ3WSZkYx4AW4x
Content-Type: multipart/mixed; boundary="3rwwiIZG2PfCZYAyWfeCUtOOaevZuulxH";
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
Message-ID: <18caca15-a6e7-cb4b-3028-c010922bda80@suse.de>
Subject: Re: [PATCH v2 28/28] video: fbdev: s1d13xxxfb: Fix kernel-doc and set
 but not used warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-29-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-29-sam@ravnborg.org>

--3rwwiIZG2PfCZYAyWfeCUtOOaevZuulxH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fix following W=3D1 warnings:
> - Fix set but not nused variables which was used only for logging.

s/nused/used

s/which was/that were

Otherwise

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

>    Fixed by introducing no_printk() to trick compiler to think variable=
s
>    are used
> - Fix kernel-doc warning by deleting an empty comment line
>=20
> v2:
>    - Subject updated (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/video/fbdev/s1d13xxxfb.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d=
13xxxfb.c
> index 4541afcf9386..d1b5f965bc96 100644
> --- a/drivers/video/fbdev/s1d13xxxfb.c
> +++ b/drivers/video/fbdev/s1d13xxxfb.c
> @@ -45,7 +45,7 @@
>   #if 0
>   #define dbg(fmt, args...) do { printk(KERN_INFO fmt, ## args); } whil=
e(0)
>   #else
> -#define dbg(fmt, args...) do { } while (0)
> +#define dbg(fmt, args...) do { no_printk(KERN_INFO fmt, ## args); } wh=
ile (0)
>   #endif
>  =20
>   /*
> @@ -512,7 +512,6 @@ s1d13xxxfb_bitblt_copyarea(struct fb_info *info, co=
nst struct fb_copyarea *area)
>   }
>  =20
>   /**
> - *
>    *	s1d13xxxfb_bitblt_solidfill - accelerated solidfill function
>    *	@info : framebuffer structure
>    *	@rect : fb_fillrect structure
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--3rwwiIZG2PfCZYAyWfeCUtOOaevZuulxH--

--1aenue9Ch7R7POAKtsLeZ3WSZkYx4AW4x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/DcPsFAwAAAAAACgkQlh/E3EQov+D/
PQ//Z4e8OyqjSfevVlybAeU3nUQukcFGaXEjQWcUwdu0S+zPuKlT+9Oq4w0jrjrV+szBcvmqs/lj
asiS4MpWTV1gQOfqr7k6JiQ/W2ickxkm7be/P8p0hGiMaYzEyz7Rd89YiyMVqDQLaIIQagQmhRt+
jAkqzoEBn7Vt3wdQqSwWKUEYdXz7F3aVUflvYo2Nn0IG3jlA701PMCU4CqcPKko0I8e8FQfDc7/9
2a4lDslxtUX4B7NX3n7e6Ni6rC04kWR7yVBzr2YsOXrGeDvdCez0tkL6vf3SwgAcSPo/S6tG/m+o
PoiK5NL6Id5hf+qosNajjYj+fIQuvfUSTOXTDigbXbisGtgXU0QAeYI2k1VKX99kZTyaKR4tN7N3
F08zBrkPU91VqFsyjzeZ3gUBHDK8Fw0EXdwfUrbRwzwysEIZHUpFj74bP7VCtUOpv/WWGN7tmQgk
OtXFTD2Y2ZLxZ2AicH+hFWt5vcGL4Y2Wg5kXc7jVH5RALFIiLHEDabZwNnTtnhWLNBBfHGJb2KuD
XJuil9roowZz35oQh6R+OfyQEXDxO00EW0Y5ObLW0CxPw2vu8o3eldLMNp3cY+mBrjt84KGG0Rpt
WLKk3EoQuFalIRP9AUY1R13hmuq5XrBFUa7tveTeRs1TyUxAxopAuxcj+DI4IVwKZMf3hZPwGSvs
mUc=
=Co+r
-----END PGP SIGNATURE-----

--1aenue9Ch7R7POAKtsLeZ3WSZkYx4AW4x--

--===============2063560397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2063560397==--
