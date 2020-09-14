Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 920FA26857A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F8589C93;
	Mon, 14 Sep 2020 07:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6778789C93
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 07:07:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5513CACF3;
 Mon, 14 Sep 2020 07:07:39 +0000 (UTC)
Subject: Re: [PATCH] drm/vc4: Handing the return value of
 drm_universal_plane_init
To: Tian Tao <tiantao6@hisilicon.com>, eric@anholt.net, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <1599811777-34093-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d35a968e-d957-7d0a-cf93-084d7b4002e0@suse.de>
Date: Mon, 14 Sep 2020 09:07:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599811777-34093-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============1688494436=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1688494436==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4bTyLzhK43sYIAR6fVZpB85MDepDwDL2k"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4bTyLzhK43sYIAR6fVZpB85MDepDwDL2k
Content-Type: multipart/mixed; boundary="Y5hw2zFn9stj8m8Th9pIGK6DEj1yRRN8E";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, eric@anholt.net, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Cc: linuxarm@huawei.com
Message-ID: <d35a968e-d957-7d0a-cf93-084d7b4002e0@suse.de>
Subject: Re: [PATCH] drm/vc4: Handing the return value of
 drm_universal_plane_init
References: <1599811777-34093-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1599811777-34093-1-git-send-email-tiantao6@hisilicon.com>

--Y5hw2zFn9stj8m8Th9pIGK6DEj1yRRN8E
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.09.20 um 10:09 schrieb Tian Tao:
> Handing the return value of drm_universal_plane_init to fix the followi=
ng
> W=3D1 kernel build warning(s):
> vc4_plane.c: In function =E2=80=98vc4_plane_init=E2=80=99:
> vc4_plane.c:1340:6: warning: variable =E2=80=98ret=E2=80=99 set but not=

> used [-Wunused-but-set-variable]
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!

> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_=
plane.c
> index 24d7e6d..65c1205 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -1361,6 +1361,8 @@ struct drm_plane *vc4_plane_init(struct drm_devic=
e *dev,
>  				       &vc4_plane_funcs,
>  				       formats, ARRAY_SIZE(formats),
>  				       modifiers, type, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> =20
>  	drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Y5hw2zFn9stj8m8Th9pIGK6DEj1yRRN8E--

--4bTyLzhK43sYIAR6fVZpB85MDepDwDL2k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9fFqsUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNbGAf/bBX68vBxpFMJAU6GmfVrHOV4ILkn
rigrt33CXkNXDv7c69Qh3tZ+F63NUMSD2GDvnxFWN4yyXYk6hp861RB1i3yL63+U
oSmBAZg7CUom6Dj7vhVme2nVZ33/YlhS6eo9J9IrDmLbLmmnVWM41qs1t6tIu11o
tkqBz3YCOjlaw/99ZCVuYPfz+OzvoSUjjSFxfKr2PTdXq90wLxNn9/cO58aDyUPg
SrYC22ZIq5t3TNzxvY/FXnNwHalHyKIVGbSlilA9M19vFyWF8b3g34bzy4PAdoY3
FpBBvMUbhriwPOP61ZRxFGb7LllqES/gHu9wgx6R/VdTTzn9Kq2Tc0QEsQ==
=crLV
-----END PGP SIGNATURE-----

--4bTyLzhK43sYIAR6fVZpB85MDepDwDL2k--

--===============1688494436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1688494436==--
