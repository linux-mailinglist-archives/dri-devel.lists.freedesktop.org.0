Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4712C86E2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 15:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2056E4D4;
	Mon, 30 Nov 2020 14:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408F16E4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:35:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0025AAEF5;
 Mon, 30 Nov 2020 14:35:44 +0000 (UTC)
Subject: Re: [PATCH v2 20/28] video: fbdev: nvidia: Fix set but not used
 warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-21-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5b66b320-3ffa-d140-fc8b-eafa7119860b@suse.de>
Date: Mon, 30 Nov 2020 15:35:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-21-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1429831884=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1429831884==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bcmPH7xOYq3jf6FGcuV6o8X3oFT3vY6Ju"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bcmPH7xOYq3jf6FGcuV6o8X3oFT3vY6Ju
Content-Type: multipart/mixed; boundary="5TR118EHhcQAIyG732m9kPFMmMyopeW6a";
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
Message-ID: <5b66b320-3ffa-d140-fc8b-eafa7119860b@suse.de>
Subject: Re: [PATCH v2 20/28] video: fbdev: nvidia: Fix set but not used
 warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-21-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-21-sam@ravnborg.org>

--5TR118EHhcQAIyG732m9kPFMmMyopeW6a
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fix warnings by deleting unused code. The register reads are
> kept as it is unknown if there are any hidden side-effects.
>=20
> v2:
>    - Update subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Antonino Daplas <adaplas@gmail.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/video/fbdev/nvidia/nv_setup.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/nvidia/nv_setup.c b/drivers/video/fbde=
v/nvidia/nv_setup.c
> index 2fa68669613a..5404017e6957 100644
> --- a/drivers/video/fbdev/nvidia/nv_setup.c
> +++ b/drivers/video/fbdev/nvidia/nv_setup.c
> @@ -89,9 +89,8 @@ u8 NVReadSeq(struct nvidia_par *par, u8 index)
>   }
>   void NVWriteAttr(struct nvidia_par *par, u8 index, u8 value)
>   {
> -	volatile u8 tmp;
>  =20
> -	tmp =3D VGA_RD08(par->PCIO, par->IOBase + 0x0a);
> +	VGA_RD08(par->PCIO, par->IOBase + 0x0a);

This again looks like it sets up the attribute register. I hope this=20
isn't optimized away now.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>   	if (par->paletteEnabled)
>   		index &=3D ~0x20;
>   	else
> @@ -101,9 +100,7 @@ void NVWriteAttr(struct nvidia_par *par, u8 index, =
u8 value)
>   }
>   u8 NVReadAttr(struct nvidia_par *par, u8 index)
>   {
> -	volatile u8 tmp;
> -
> -	tmp =3D VGA_RD08(par->PCIO, par->IOBase + 0x0a);
> +	VGA_RD08(par->PCIO, par->IOBase + 0x0a);
>   	if (par->paletteEnabled)
>   		index &=3D ~0x20;
>   	else
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--5TR118EHhcQAIyG732m9kPFMmMyopeW6a--

--bcmPH7xOYq3jf6FGcuV6o8X3oFT3vY6Ju
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/FAz4FAwAAAAAACgkQlh/E3EQov+Cr
NxAAq92YX/nNcn+1RLBtMPBRRb5BECrmoQDn7umlca58bN/ZeFxcO6DEXpQ5fXKvxOeHZU54fjz1
dnGbz+jRXTckL+zcxpfZYVIUrofEbAtOE22/+bhAXa1vbZ0R3ywhFI5RQOm/79ewTNbHPKh2IEa1
eLJwoz8szwO5HWFr4yd2C4S5mH76z0UCwibJfOyhbIjHGzQrwsJFYKTcIADiQko5uohpSJp8ieXj
n6s27yiacCGGltl0Yo3xCnfZrQPqK6OFUgW3UiwSr8xiA5W7j/LasxD3yyNX+UubFSePMOtb0flx
MSZSpUDCS9zCL+OmTt+9kMokk8q6z8CfOs4IFM84rQAd3zRYi1Iefykyc7ny7NU+t+YfnK0+u92b
cKpsz6MwRGZuhLDsvniJCDMKAfud4O7YZEWuhcm+Ppk/Uq99KjNEB8475uAYPH/x+uQZOgTCdUh8
sX531m6NH8dAakWzvuk+vXFLyIWt42GVLMLdjYB3xZ+dczlKlaCMx6R19s1fzn+S3Bgsb09UDrAm
dXAh3m8ghvUf+u2Y1StRkk1DXtehVNcfdcp+cY0/D/md3/I+Cn9RNZEJg+K/cHrqafbHjS5BADZE
dmxQmE8MMpA1SLbTHAe/oRrgN3q3I7efyceNHov5dbNDbfU7A1B5M/D/UmQBY+ewrfc16kFqiN3s
WYc=
=IbV2
-----END PGP SIGNATURE-----

--bcmPH7xOYq3jf6FGcuV6o8X3oFT3vY6Ju--

--===============1429831884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1429831884==--
