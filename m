Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81871310CA1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 15:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B8A6E08A;
	Fri,  5 Feb 2021 14:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADB26E08A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 14:43:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D031EACBA;
 Fri,  5 Feb 2021 14:43:45 +0000 (UTC)
Subject: Re: [PATCH][V2] drm/mgag200: make a const array static, makes object
 smaller
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20210204191156.110778-1-colin.king@canonical.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c9dd8c05-93cf-f74c-48a0-e512f2e2ed9b@suse.de>
Date: Fri, 5 Feb 2021 15:43:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204191156.110778-1-colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1021881097=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1021881097==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iIYPSx0lbNbPQSd7MPbsqFdxlsweQNlMx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iIYPSx0lbNbPQSd7MPbsqFdxlsweQNlMx
Content-Type: multipart/mixed; boundary="tYKCTmFoO52fIfy9sx49pj0Ydixv7HwHo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <c9dd8c05-93cf-f74c-48a0-e512f2e2ed9b@suse.de>
Subject: Re: [PATCH][V2] drm/mgag200: make a const array static, makes object
 smaller
References: <20210204191156.110778-1-colin.king@canonical.com>
In-Reply-To: <20210204191156.110778-1-colin.king@canonical.com>

--tYKCTmFoO52fIfy9sx49pj0Ydixv7HwHo
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Merged.

Am 04.02.21 um 20:11 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Don't populate the const array m_div_val on the stack but instead make
> it static. Makes the object code smaller by 29 bytes:
>=20
> Before:
>     text	   data	  bss   dec    hex filename
>    34736	   4552	    0 39288   9978 drivers/gpu/drm/mgag200/mgag200_mod=
e.o
>=20
> After:
>     text	   data	  bss   dec    hex filename
>    34625	   4616	    0 39241   9949 drivers/gpu/drm/mgag200/mgag200_mod=
e.o
>=20
> (gcc version 10.2.0)
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>=20
> V2: move static declaration to the top of the declarations
>=20
> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/m=
gag200/mgag200_mode.c
> index 1dfc42170059..c3dfde8cad25 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -706,13 +706,13 @@ static int mga_g200eh_set_plls(struct mga_device =
*mdev, long clock)
>  =20
>   static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
>   {
> +	static const unsigned int m_div_val[] =3D { 1, 2, 4, 8 };
>   	unsigned int vcomax, vcomin, pllreffreq;
>   	unsigned int delta, tmpdelta;
>   	int testr, testn, testm, testo;
>   	unsigned int p, m, n;
>   	unsigned int computed, vco;
>   	int tmp;
> -	const unsigned int m_div_val[] =3D { 1, 2, 4, 8 };
>  =20
>   	m =3D n =3D p =3D 0;
>   	vcomax =3D 1488000;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--tYKCTmFoO52fIfy9sx49pj0Ydixv7HwHo--

--iIYPSx0lbNbPQSd7MPbsqFdxlsweQNlMx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAdWaAFAwAAAAAACgkQlh/E3EQov+CW
7A/+NovrsdcN0AX8UJln3uk/CiH43FmwEWUjtLjlOnSQRIx95ecS6gZ/ZXWlZAfBP9iu9cqcZnN7
ycJbGDWeSixB1tPKLEIHL+Pv5kqGKdpea4recuxZ22uU+ZziWqVvpXabE6o5+7CE0i64NxbUVyS6
ylKq7WJ6u4M8Xm9m1YZuM70j3kgZpWseDRySTpJU5SSqzLAcaRqe+q1bOaF979PYPbwaCgBrd0KG
m/grVtRLRV0OHKmzgqdbCGrCsQjQ3SY3ckebSVNIxmuhvDBjc8mZEosADu5+jBdpj+C1WUtcKjA6
SOG/pkpdh/UylTRFOvwKdaKKLOv7XmekEbMT8xisWGWp/TqDwz+DvPIzAhKI2EV1aM5sF3lwXWol
ICk2/0IqwZUR7etUYgXJhXAvb/CzZpmNYvVh6uwsk9YbdpFxW7gZAagbOgsH8+ZOH4Ce/srrqFM5
9TwdBJNTs6Nvp+TxbyBVaHilMZiVpSc1L5fYOjxy/xrOdo7ZCTV3Bl+hZXA3uJ4a729+cluvdXpr
5EoHqqXdKRvigmcHIbJfbvbAPRN4aS4aSjpHMImmlcgb11HdNbQgB38T+h+IMbhM4YE7eN9EjlOT
DAQcUdeI9PnkMk5Ucr9sIwPTCcgvRq2Qqki6lW+mMSLdh1GC0yCgkCr3QEwbC28cf7qovKedoG2j
GLM=
=v0Sv
-----END PGP SIGNATURE-----

--iIYPSx0lbNbPQSd7MPbsqFdxlsweQNlMx--

--===============1021881097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1021881097==--
