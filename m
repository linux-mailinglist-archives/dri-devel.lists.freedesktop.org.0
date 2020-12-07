Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E832D1284
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 14:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D64D89D61;
	Mon,  7 Dec 2020 13:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A0D89D61
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:50:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39F72AB63;
 Mon,  7 Dec 2020 13:50:46 +0000 (UTC)
Subject: Re: [PATCH v3 10/13] video: fbdev: gbefb: Fix set but not used warning
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-11-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <21f4d506-04cc-3e51-2001-caea493de809@suse.de>
Date: Mon, 7 Dec 2020 14:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201206190247.1861316-11-sam@ravnborg.org>
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Tony Prisk <linux@prisktech.co.nz>, Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============0599690557=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0599690557==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HmciU3ZxSV6AfntWGwBAddLpBupsAza6h"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HmciU3ZxSV6AfntWGwBAddLpBupsAza6h
Content-Type: multipart/mixed; boundary="X8O1oEuHfJsdnJ2i46qP5uyNJ6MqgVzMZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Alexander Klimov <grandmaster@al2klimov.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin Ian King <colin.king@canonical.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Gustavo A R Silva <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@kernel.org>, Peter Jones <pjones@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Qilong Zhang
 <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Rich Felker <dalias@libc.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Tony Prisk <linux@prisktech.co.nz>
Message-ID: <21f4d506-04cc-3e51-2001-caea493de809@suse.de>
Subject: Re: [PATCH v3 10/13] video: fbdev: gbefb: Fix set but not used
 warning
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-11-sam@ravnborg.org>
In-Reply-To: <20201206190247.1861316-11-sam@ravnborg.org>

--X8O1oEuHfJsdnJ2i46qP5uyNJ6MqgVzMZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 06.12.20 um 20:02 schrieb Sam Ravnborg:
> The variable "x" was set but never used.
> Drop the redundant assignments.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/gbefb.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
> index 31270a8986e8..c5b99a4861e8 100644
> --- a/drivers/video/fbdev/gbefb.c
> +++ b/drivers/video/fbdev/gbefb.c
> @@ -198,7 +198,7 @@ static void gbe_reset(void)
>   static void gbe_turn_off(void)
>   {
>   	int i;
> -	unsigned int val, x, y, vpixen_off;
> +	unsigned int val, y, vpixen_off;
>  =20
>   	gbe_turned_on =3D 0;
>  =20
> @@ -249,7 +249,6 @@ static void gbe_turn_off(void)
>  =20
>   	for (i =3D 0; i < 100000; i++) {
>   		val =3D gbe->vt_xy;
> -		x =3D GET_GBE_FIELD(VT_XY, X, val);
>   		y =3D GET_GBE_FIELD(VT_XY, Y, val);
>   		if (y < vpixen_off)
>   			break;
> @@ -260,7 +259,6 @@ static void gbe_turn_off(void)
>   		       "gbefb: wait for vpixen_off timed out\n");
>   	for (i =3D 0; i < 10000; i++) {
>   		val =3D gbe->vt_xy;
> -		x =3D GET_GBE_FIELD(VT_XY, X, val);
>   		y =3D GET_GBE_FIELD(VT_XY, Y, val);
>   		if (y > vpixen_off)
>   			break;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--X8O1oEuHfJsdnJ2i46qP5uyNJ6MqgVzMZ--

--HmciU3ZxSV6AfntWGwBAddLpBupsAza6h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/OMzQFAwAAAAAACgkQlh/E3EQov+AW
0hAA0DGijVeuGk2118333CrQPBB7RUYqE8ksHoiE2OzbIJAei+mOL9vD934bsRHz/9I+gwUVyOSX
vWgzQU8YdJLwGFJSR9ZE6K6X80Z+upb3Pb/NH1wTnWlks87WWp3schCMWDl+0S1OSdNlIECaSN16
k5tsGorxy62ySjwTV+fBRbgIsX8EC0jSfDcDc2QtRiXlYxIsFneKM3C1LrGWWNkbM3U3OR5d0DbN
65xVpfB8ASzsdiVj4ib8jYOsow9lUz5Gln8DekQPZFtXZwpxRGMe+1GrqztXP2MKXQf+V7OU6gbm
AfYuQg2N3AkljgzNcrMMfRuD0FY5kSvju6cjiuLQEAYtQ39a3BRFrs5sJmJpxjHY0J1NlGSwRUwS
NduUhRbZNmgD4gT6t0dkaS59n/hnjVzA0aLLP5Ccb2t2w/aTSG6hq93ccZYwYXv9Luc0dzn05Kqa
ZKTG2SI0lRQLveMEohdU7AnVBtjER7UqZU2dytNAmljjVxCKR4smJ0V9EPOgO3W16z1G4U+Fi9Nx
1j0jWVMqq7JZMmRG0bEutRUvI2Se76aPYF6G/ppwibFno0W5ji+EL5/iraQB+BEVQW29ZTyLTpFQ
LmTA0huUIs2BcAjPaKgG6baFrYOW0CKKKVU+NND/gzCR+LWPkpzl1WJFT35R7IKKD5vR/yBkEhKV
jWk=
=jPXz
-----END PGP SIGNATURE-----

--HmciU3ZxSV6AfntWGwBAddLpBupsAza6h--

--===============0599690557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0599690557==--
