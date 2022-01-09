Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EB0488ABC
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 18:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D490510E346;
	Sun,  9 Jan 2022 17:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4035D10E346
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 17:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a2HbibrqoP2b/EFY3k58N0PXg1b2xRKA8sQhjxdpS2M=; b=OPG5w905USE2RAxeODBgDx/7zG
 PrQL/I1kvGdbC5eeSaQT3Z/ZKeQyXZA+gf/9Rm3OBW4psLAtSBcPKcuIdpZwOmPBdmXThE4KAHcRQ
 yGoI9kkP9dous2u3Krfi6uBpc2H72HWKj2HLJza/IJ/bHN9j5g1Y/JbxdP4fmvqDpttm46n6Dv8KJ
 vVrqPb6OuoDS/NPL3Vkd1K+ZQUIYn55tS9xYdwmygAsdxv2VwZf4i9RnusmAA42s569Lj4HNyGV5w
 2fc9vV/bhBHemEtf1ygP7u1Xbj1G3PxKZEHy3vQsBEJ3KC8RFtKz7JczYCRmQqw1/j1MFSfUbfwtA
 hJR6sogQ==;
Received: from [165.90.113.117] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1n6bY7-000C9s-Ds; Sun, 09 Jan 2022 18:00:07 +0100
Date: Sun, 9 Jan 2022 15:59:55 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH RESEND v2 2/3] drm/vkms: add support for multiple overlay
 planes
Message-ID: <20220109165933.sa6kpgrzdzj5r3ho@mail.igalia.com>
References: <20220107182809.141003-1-jose.exposito89@gmail.com>
 <20220107182809.141003-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v2pdnz6aag4fqvuc"
Content-Disposition: inline
In-Reply-To: <20220107182809.141003-2-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v2pdnz6aag4fqvuc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/07, Jos=E9 Exp=F3sito wrote:
> Create 8 overlay planes instead of 1 when the "enable_overlay" module
> parameter is set.
>=20
> The following igt-gpu-tools tests were executed without finding
> regressions. Notice than the numbers are identical:
>=20
>                     |     master branch     |      this  patch      |
>                     | SUCCESS | SKIP | FAIL | SUCCESS | SKIP | FAIL |
>  kms_atomic         |      10 |   02 |   00 |      10 |   02 |   00 |
>  kms_plane_cursor   |      09 |   45 |   00 |      09 |   45 |   00 |
>  kms_plane_multiple |      01 |   23 |   00 |      01 |   23 |   00 |
>  kms_writeback      |      04 |   00 |   00 |      04 |   00 |   00 |

I checked that several testcases from kms_cursor_crc are failing after
recent changes in the test. However, this regression is not caused by
these changes and need futher investigation for fixing.

That said, this patch lgtm.

Reviewed-by: Melissa Wen <mwen@igalia.com>
>=20
> Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>
>=20
> ---
>=20
> v2:
>=20
>  - Set the number of overlay planes as a constant instead of as a
>    module parameter (Melissa Wen)
>=20
>  - Add a test results in the commit message (Melissa Wen)
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h    | 2 ++
>  drivers/gpu/drm/vkms/vkms_output.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index d48c23d40ce5..9496fdc900b8 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -20,6 +20,8 @@
>  #define XRES_MAX  8192
>  #define YRES_MAX  8192
> =20
> +#define NUM_OVERLAY_PLANES 8
> +
>  struct vkms_writeback_job {
>  	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>  	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index 2e805b2d36ae..ba0e82ae549a 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -57,15 +57,18 @@ int vkms_output_init(struct vkms_device *vkmsdev, int=
 index)
>  	struct vkms_plane *primary, *cursor =3D NULL;
>  	int ret;
>  	int writeback;
> +	unsigned int n;
> =20
>  	primary =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
> =20
>  	if (vkmsdev->config->overlay) {
> -		ret =3D vkms_add_overlay_plane(vkmsdev, index, crtc);
> -		if (ret)
> -			return ret;
> +		for (n =3D 0; n < NUM_OVERLAY_PLANES; n++) {
> +			ret =3D vkms_add_overlay_plane(vkmsdev, index, crtc);
> +			if (ret)
> +				return ret;
> +		}
>  	}
> =20
>  	if (vkmsdev->config->cursor) {
> --=20
> 2.25.1
>=20

--v2pdnz6aag4fqvuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmHbFIsACgkQwqF3j0dL
ehxkpA//eN3X3rFpQlQ/VWd13er+EVs3pqNS6XFFvyMHZ8R/K53E0vuJ4VLKOwX6
CZyRvVe03ujYfRr2fV8VrpMxJHD6CpLwS4BkjyvpwY21Ys4ZNUhT+LMXsEb6EDO1
Y452Pvf1fRdoDFA9A+ETu0K26esCYhdYiY6jtyPuPOsvIDRsYvqupWj5MVzVf3OI
HpLtiLG953RT4oizocSfluYbFz/dI5zMJxSqxVfwjBLdiwtqz7+ioN1Lbrc2TABZ
/w17K8U2vQ0w2cOXJyua5O4e99Yw07RU3+FxyUPaPa+/Xek4GqG0O3vTwb6//heg
Bm/zEO/kJEfcIOMsRwmYdVSNco5qO4ZFS1P9/NjM7TvTvmxmA5qQkeaZk+Wd/FNO
1il+H/VfyRHUoXvshU6qOO1GU+ktyUvfxnTL0J60y6EFJQBPY2nYkhFOV4ziZtoc
t91UroohxniTfKIrFiCotUbqh8qjOrLrJ+7y/hwVFe8WlYnb8NKFFMIxtvj2IUUU
ivd9afhOPgykm2EFKDJnmusGZ+oPnNdzgKg5akk4sSIiv6wYapgKTQMWZWKCXhTJ
95Wu8TB4y9Op9mJxwEZlM9CYcMC/17VeDm7dD2LVIhfhoVWCm8+yJKvCzzjbxRMZ
w/ha37kJCrDkuUCeXyWqmbLiPQ85znCDD4hd5z8old8Qnm6bF2k=
=hCwJ
-----END PGP SIGNATURE-----

--v2pdnz6aag4fqvuc--
