Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A9D155922
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 15:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FCB6EAC3;
	Fri,  7 Feb 2020 14:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54916EAC3;
 Fri,  7 Feb 2020 14:20:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 474B5B01D;
 Fri,  7 Feb 2020 14:20:01 +0000 (UTC)
Subject: Re: [PATCH v2 3/6] drm/exynos: Use drm_encoder_mask()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-4-ville.syrjala@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <f6e73430-7916-926d-1724-051c585c0ba6@suse.de>
Date: Fri, 7 Feb 2020 15:19:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207135950.6655-4-ville.syrjala@linux.intel.com>
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
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, intel-gfx@lists.freedesktop.org,
 Joonyoung Shim <jy0922.shim@samsung.com>
Content-Type: multipart/mixed; boundary="===============1016615052=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1016615052==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Pb5qI8hmZ9RpFc1IEUVFFJ3wATfA0Y85G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Pb5qI8hmZ9RpFc1IEUVFFJ3wATfA0Y85G
Content-Type: multipart/mixed; boundary="nDGj67J45V4Z82cOSokMUeevuwxjtCIWF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 intel-gfx@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Message-ID: <f6e73430-7916-926d-1724-051c585c0ba6@suse.de>
Subject: Re: [PATCH v2 3/6] drm/exynos: Use drm_encoder_mask()
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20200207135950.6655-4-ville.syrjala@linux.intel.com>

--nDGj67J45V4Z82cOSokMUeevuwxjtCIWF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.02.20 um 14:59 schrieb Ville Syrjala:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Replace the hand rolled encoder bitmask thing with drm_encoder_mask()
>=20
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/=
exynos/exynos_drm_drv.c
> index ba0f868b2477..57defeb44522 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -270,7 +270,7 @@ static int exynos_drm_bind(struct device *dev)
>  	struct drm_encoder *encoder;
>  	struct drm_device *drm;
>  	unsigned int clone_mask;
> -	int cnt, ret;
> +	int ret;
> =20
>  	drm =3D drm_dev_alloc(&exynos_drm_driver, dev);
>  	if (IS_ERR(drm))
> @@ -293,10 +293,9 @@ static int exynos_drm_bind(struct device *dev)
>  	exynos_drm_mode_config_init(drm);
> =20
>  	/* setup possible_clones. */
> -	cnt =3D 0;
>  	clone_mask =3D 0;
>  	list_for_each_entry(encoder, &drm->mode_config.encoder_list, head)
> -		clone_mask |=3D (1 << (cnt++));
> +		clone_mask |=3D drm_encoder_mask(encoder);
> =20
>  	list_for_each_entry(encoder, &drm->mode_config.encoder_list, head)
>  		encoder->possible_clones =3D clone_mask;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--nDGj67J45V4Z82cOSokMUeevuwxjtCIWF--

--Pb5qI8hmZ9RpFc1IEUVFFJ3wATfA0Y85G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl49cg0ACgkQaA3BHVML
eiO5WwgAhdA+lwwUYUGyTzSU/8YSSBUraI3XCLfYo/4gGMIrZnEb3ndeiVZ/Pvwy
DQiR2xM7kF5jacpgh73QxUMfpEsj14iQkpW5q5Sd7UZWCq9Mxpa13S/4BupP6qS6
J7z19VEgQwYFVV5dRpJVQmagssJ6ERBS274A7+Re986aaqBHsZqyu9wkh3Hk0xcU
OelQk9EIvnS3xO1JRyy6pQw18P8Z7/wR6QZVqp1gpPKHK44l6GNWhdNeJIE6z7s7
w98kN/fQyYVTuI+9o6NVocJGtPtk4b9aNsPDplYTegQsts97G+A3ddXhYG3VQFvy
L6404hs58Wy7aSJsYdQdaaz1QaC43g==
=bP3t
-----END PGP SIGNATURE-----

--Pb5qI8hmZ9RpFc1IEUVFFJ3wATfA0Y85G--

--===============1016615052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1016615052==--
