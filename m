Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E95431F5C7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 09:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BAA6E8C6;
	Fri, 19 Feb 2021 08:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6E26E8C6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 08:23:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F960AC69;
 Fri, 19 Feb 2021 08:23:07 +0000 (UTC)
Subject: Re: [PATCH] drm/drv: Remove initialization of static variables
To: Tian Tao <tiantao6@hisilicon.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
References: <1613701811-32037-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a7ec9ff2-5793-4dc6-c12d-667a6a54f747@suse.de>
Date: Fri, 19 Feb 2021 09:23:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613701811-32037-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1512063246=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1512063246==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0L7RWso29DGvSq7U80UdrFwZS7clHSy3R"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0L7RWso29DGvSq7U80UdrFwZS7clHSy3R
Content-Type: multipart/mixed; boundary="XOzxhDmo8vPMDQpUAQLz86rfU5UNuJytd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <a7ec9ff2-5793-4dc6-c12d-667a6a54f747@suse.de>
Subject: Re: [PATCH] drm/drv: Remove initialization of static variables
References: <1613701811-32037-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1613701811-32037-1-git-send-email-tiantao6@hisilicon.com>

--XOzxhDmo8vPMDQpUAQLz86rfU5UNuJytd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Am 19.02.21 um 03:30 schrieb Tian Tao:
> Address the following checkpatch errors:
> ERROR: do not initialise statics to false
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the patch.

> ---
>   drivers/gpu/drm/drm_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 20d22e4..c2f78de 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -61,7 +61,7 @@ static struct idr drm_minors_idr;
>    * prefer to embed struct drm_device into their own device
>    * structure and call drm_dev_init() themselves.
>    */
> -static bool drm_core_init_complete =3D false;
> +static bool drm_core_init_complete;
>  =20
>   static struct dentry *drm_debugfs_root;
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--XOzxhDmo8vPMDQpUAQLz86rfU5UNuJytd--

--0L7RWso29DGvSq7U80UdrFwZS7clHSy3R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAvdWkFAwAAAAAACgkQlh/E3EQov+Ai
fhAAoN8BNq1nqgNdAPQA5ed5y6WH8sKVuhGfC6cuU7xIrD1JRHCjFhNwxJz5Hni9OdPTi5567B09
VcVh3a3gLmbW8OgsVkMrB/LVE5e7bltlH+Y2MGaW60JbcPzAoHxaJbdEaParg4FWfns++0lrOB4k
OdmZdS9hhav0+MwkYR1S3OGI6PoqMa5OhRqOgUcNZH2nOmt151OHWeVM1knsD5XM+jeP8HpDLtNH
mBG1C7yE+GAP8ITOPUkN99YEGZmyDqWFg+qTIAr4elG2p1TRyq9GNYbf98MKQdrO6o3JkEei6c1f
OyJTRwbsO7aG3oqKDBYxA4ZiFnoHdfZ3LaouDGH/4bxbjZX3evyflQuo6cwNooNxwbouaFg7Wbf9
Zmp/98lh/ATH21a1jPrr8MgDQ1r1G0Hy7ilQpw3qB2ZHG4QqjLlaKW+riMMOytv78Jdwu8JOP3H+
kfRManYW4STYvqQ5ehes1qTGEbYtFh4udNVarXQwtYbEQc2qMxJywsqpmMVrUaH5M2dRudSUIejZ
O2O5xIMlHwFq5CQS2WIWNQCd861u17Zfh0PTEfWZgM+191ZwQjS9YK+aairAnv5FTs8sGmW8JV3c
7iycMg2xPJ/0G/Zdru/ltB4Pj8KNhovEyVFeVJWmn9ApaUEdtI6je8yRx3kN69aec8QUJ1KTT4uV
0JQ=
=piK1
-----END PGP SIGNATURE-----

--0L7RWso29DGvSq7U80UdrFwZS7clHSy3R--

--===============1512063246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1512063246==--
