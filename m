Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2722BE2A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 08:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA986E428;
	Fri, 24 Jul 2020 06:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F2C6E428
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 06:43:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53771AC66;
 Fri, 24 Jul 2020 06:43:42 +0000 (UTC)
Subject: Re: [PATCH 1/9] drm/ttm: initialize the system domain with defaults
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200723151710.3591-1-christian.koenig@amd.com>
 <20200723151710.3591-2-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <0f69b57b-407a-8c23-04e2-280436e6c368@suse.de>
Date: Fri, 24 Jul 2020 08:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723151710.3591-2-christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0802110098=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0802110098==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VxWXEQe1hPvYruKhh1asNh5XMclc9C4mx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VxWXEQe1hPvYruKhh1asNh5XMclc9C4mx
Content-Type: multipart/mixed; boundary="JuPKyrDSctMwus9fUTfnHZOkDCvzRKQZy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <0f69b57b-407a-8c23-04e2-280436e6c368@suse.de>
Subject: Re: [PATCH 1/9] drm/ttm: initialize the system domain with defaults
References: <20200723151710.3591-1-christian.koenig@amd.com>
 <20200723151710.3591-2-christian.koenig@amd.com>
In-Reply-To: <20200723151710.3591-2-christian.koenig@amd.com>

--JuPKyrDSctMwus9fUTfnHZOkDCvzRKQZy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 23.07.20 um 17:17 schrieb Christian K=C3=B6nig:
> Instead of repeating that in each driver.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 3 ---
>  drivers/gpu/drm/drm_gem_vram_helper.c      | 3 ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c       | 3 ---
>  drivers/gpu/drm/qxl/qxl_ttm.c              | 3 ---
>  drivers/gpu/drm/radeon/radeon_ttm.c        | 3 ---
>  drivers/gpu/drm/ttm/ttm_bo.c               | 2 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 --
>  7 files changed, 2 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> index 0dd5e802091d..e57c49a91b73 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -84,9 +84,6 @@ static int amdgpu_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->flags =3D 0;
> -		man->available_caching =3D TTM_PL_MASK_CACHING;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_TT:
>  		/* GTT memory  */
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 3296ed3df358..be177afdeb9a 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1009,9 +1009,6 @@ static int bo_driver_init_mem_type(struct ttm_bo_=
device *bdev, uint32_t type,
>  {
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
> -		man->flags =3D 0;
> -		man->available_caching =3D TTM_PL_MASK_CACHING;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_VRAM:
>  		man->func =3D &ttm_bo_manager_func;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> index 4ccf937df0d0..53af25020bb2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -655,9 +655,6 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev=
, uint32_t type,
> =20
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
> -		man->flags =3D 0;
> -		man->available_caching =3D TTM_PL_MASK_CACHING;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_VRAM:
>  		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_tt=
m.c
> index 1d8e07b8b19e..e9b8c921c1f0 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -54,9 +54,6 @@ static int qxl_init_mem_type(struct ttm_bo_device *bd=
ev, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->flags =3D 0;
> -		man->available_caching =3D TTM_PL_MASK_CACHING;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_VRAM:
>  	case TTM_PL_PRIV:
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> index b474781a0920..b4cb75361577 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -76,9 +76,6 @@ static int radeon_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->flags =3D 0;
> -		man->available_caching =3D TTM_PL_MASK_CACHING;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_TT:
>  		man->func =3D &ttm_bo_manager_func;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.=
c
> index 7c02ce784805..1f1f9e463265 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1677,6 +1677,8 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev=
,
>  	 * Initialize the system memory buffer type.
>  	 * Other types need to be driver / IOCTL initialized.
>  	 */
> +	bdev->man[TTM_PL_SYSTEM].available_caching =3D TTM_PL_MASK_CACHING;
> +	bdev->man[TTM_PL_SYSTEM].default_caching =3D TTM_PL_FLAG_CACHED;
>  	ret =3D ttm_bo_init_mm(bdev, TTM_PL_SYSTEM, 0);
>  	if (unlikely(ret !=3D 0))
>  		goto out_no_sys;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_ttm_buffer.c
> index 1d78187eaba6..00cef1a3a178 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -742,8 +742,6 @@ static int vmw_init_mem_type(struct ttm_bo_device *=
bdev, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->available_caching =3D TTM_PL_FLAG_CACHED;
> -		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--JuPKyrDSctMwus9fUTfnHZOkDCvzRKQZy--

--VxWXEQe1hPvYruKhh1asNh5XMclc9C4mx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8agxUUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMOyQf/ee6xcFek/bpPxJabhre/KWL3Xs2D
634b7NvmCgA15N+VhnXmdo7HlC4qMd0qNHAT1qSBSUmbN0wukeZl2dhPfOX7Oet+
DY1dgpVUzWh9z1HkKxWgdT7wyGGSpH/LKiE5FqIXJ91K8McuyOcU4C00uwGquPVa
olLR2IVgsa+LIjbdp4qYfmb6zZShJldoOFl6gukLEGLzFdSWKylzgQkfiA35wOwl
PyOE6dtYD5aD/u8lNEmR1Qq4eOfktlq2jWDyLzYqxS0dKKouGeYQmkA2MI1BJNcW
kr0pht1qiNuqlStpNgB4w+8uV88rWKnm+1UdIkRHg0e/ZdmFora84IQZXw==
=ufnZ
-----END PGP SIGNATURE-----

--VxWXEQe1hPvYruKhh1asNh5XMclc9C4mx--

--===============0802110098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0802110098==--
