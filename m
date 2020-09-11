Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF0265AC8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 09:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F906E359;
	Fri, 11 Sep 2020 07:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C8D6E359
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 07:47:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 353DAAEAB;
 Fri, 11 Sep 2020 07:48:04 +0000 (UTC)
Subject: Re: [PATCH] drm/vc4: Remove unused variables
To: Tian Tao <tiantao6@hisilicon.com>, eric@anholt.net, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <1599636807-9003-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <83352520-3f8c-96c4-d769-e1c74435d039@suse.de>
Date: Fri, 11 Sep 2020 09:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1599636807-9003-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: linuxarm@huawei.com
Content-Type: multipart/mixed; boundary="===============1886516266=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1886516266==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tuMxfVcijXw6oOWTfrnlipSFhy5ISqJI9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tuMxfVcijXw6oOWTfrnlipSFhy5ISqJI9
Content-Type: multipart/mixed; boundary="ZWDJi7XWO23ZqoDt57P3fWGwFy1rHBkcf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, eric@anholt.net, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Cc: linuxarm@huawei.com
Message-ID: <83352520-3f8c-96c4-d769-e1c74435d039@suse.de>
Subject: Re: [PATCH] drm/vc4: Remove unused variables
References: <1599636807-9003-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1599636807-9003-1-git-send-email-tiantao6@hisilicon.com>

--ZWDJi7XWO23ZqoDt57P3fWGwFy1rHBkcf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.09.20 um 09:33 schrieb Tian Tao:
> Fixes the following W=3D1 kernel build warning(s):
> vc4_plane.c: In function =E2=80=98vc4_plane_init=E2=80=99:
> vc4_plane.c:1340:6: warning: variable =E2=80=98ret=E2=80=99 set but not=

> used [-Wunused-but-set-variable]
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_=
plane.c
> index 24d7e6d..5be0f5dda 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -1337,7 +1337,6 @@ struct drm_plane *vc4_plane_init(struct drm_devic=
e *dev,
>  	struct drm_plane *plane =3D NULL;
>  	struct vc4_plane *vc4_plane;
>  	u32 formats[ARRAY_SIZE(hvs_formats)];
> -	int ret =3D 0;
>  	unsigned i;
>  	static const uint64_t modifiers[] =3D {
>  		DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED,
> @@ -1357,7 +1356,7 @@ struct drm_plane *vc4_plane_init(struct drm_devic=
e *dev,
>  		formats[i] =3D hvs_formats[i].drm;
> =20
>  	plane =3D &vc4_plane->base;
> -	ret =3D drm_universal_plane_init(dev, plane, 0,
> +	drm_universal_plane_init(dev, plane, 0,
>  				       &vc4_plane_funcs,
>  				       formats, ARRAY_SIZE(formats),
>  				       modifiers, type, NULL);

IMHO vc4_plane_init() should rather handle ret correctly and return an
error if it's non-zero.

Best regards
Thomas

>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZWDJi7XWO23ZqoDt57P3fWGwFy1rHBkcf--

--tuMxfVcijXw6oOWTfrnlipSFhy5ISqJI9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9bK6MUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiP5bQf/VHn1nSMXCTkKDNESxB12sxhspLze
qy92rbzqMZtL+OBVPBdToJ8HpOwKKedr8WHrUR9AZwzDAlhryfw9b8aKSIABR4xD
Ga2MirqR2OxGayovLTw/RRDyzgxd/TPTKOMzR5W7mKJOtEMGJBMYKlNRS0eGTMpB
z/pbwMuMBz7od+T0d1ZA7PJOOc3U3cyZKmw+TUVAse5cEc9HqsK0ImSskgS6cb9i
IGiGImK2+4XKrKVoOFuVEw57zfHnMDf9V7R6LdqP5/n7uN1H6eH7+igajF3tCOuR
FPerZowdVlVdavd+JxiT0MSDlMZotWEVzwAd7L3/blo0ApI0Xf7cgslGGQ==
=706w
-----END PGP SIGNATURE-----

--tuMxfVcijXw6oOWTfrnlipSFhy5ISqJI9--

--===============1886516266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1886516266==--
