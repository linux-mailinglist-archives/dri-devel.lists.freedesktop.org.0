Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC29C22BE43
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 08:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07086E90D;
	Fri, 24 Jul 2020 06:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320A96E90D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 06:51:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59A25AC20;
 Fri, 24 Jul 2020 06:52:01 +0000 (UTC)
Subject: Re: [PATCH 9/9] drm/ttm: remove the init_mem_type callback
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200723151710.3591-1-christian.koenig@amd.com>
 <20200723151710.3591-10-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ac35bb48-7f0e-c164-84f9-09219a2983f2@suse.de>
Date: Fri, 24 Jul 2020 08:51:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723151710.3591-10-christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============1006029270=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1006029270==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dJldWY9OVOlq5u2CkT9Qdhf5LfmRhfF43"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dJldWY9OVOlq5u2CkT9Qdhf5LfmRhfF43
Content-Type: multipart/mixed; boundary="REPPDrISevpAoSWC4TVb1r6fIOJrD3ge3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <ac35bb48-7f0e-c164-84f9-09219a2983f2@suse.de>
Subject: Re: [PATCH 9/9] drm/ttm: remove the init_mem_type callback
References: <20200723151710.3591-1-christian.koenig@amd.com>
 <20200723151710.3591-10-christian.koenig@amd.com>
In-Reply-To: <20200723151710.3591-10-christian.koenig@amd.com>

--REPPDrISevpAoSWC4TVb1r6fIOJrD3ge3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 23.07.20 um 17:17 schrieb Christian K=C3=B6nig:
> It is a very strange concept to call a function which just
> calls back the caller for the functions parameters.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 7 -------
>  drivers/gpu/drm/drm_gem_vram_helper.c      | 7 -------
>  drivers/gpu/drm/nouveau/nouveau_bo.c       | 8 --------
>  drivers/gpu/drm/qxl/qxl_ttm.c              | 7 -------
>  drivers/gpu/drm/radeon/radeon_ttm.c        | 7 -------
>  drivers/gpu/drm/ttm/ttm_bo.c               | 4 ----
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 7 -------
>  include/drm/ttm/ttm_bo_driver.h            | 6 ------
>  8 files changed, 53 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> index 98a77fc4a90c..da6434ea07f1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -62,12 +62,6 @@
> =20
>  #define AMDGPU_TTM_VRAM_MAX_DW_READ	(size_t)128
> =20
> -static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t t=
ype,
> -				struct ttm_mem_type_manager *man)
> -{
> -	return 0;
> -}
> -
>  static int amdgpu_ttm_init_vram(struct amdgpu_device *adev)
>  {
> =20
> @@ -1727,7 +1721,6 @@ static struct ttm_bo_driver amdgpu_bo_driver =3D =
{
>  	.ttm_tt_create =3D &amdgpu_ttm_tt_create,
>  	.ttm_tt_populate =3D &amdgpu_ttm_tt_populate,
>  	.ttm_tt_unpopulate =3D &amdgpu_ttm_tt_unpopulate,
> -	.init_mem_type =3D &amdgpu_init_mem_type,
>  	.eviction_valuable =3D amdgpu_ttm_bo_eviction_valuable,
>  	.evict_flags =3D &amdgpu_evict_flags,
>  	.move =3D &amdgpu_bo_move,
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index f7f93a49cd7f..5f03c6137ef9 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1004,12 +1004,6 @@ static struct ttm_tt *bo_driver_ttm_tt_create(st=
ruct ttm_buffer_object *bo,
>  	return NULL;
>  }
> =20
> -static int bo_driver_init_mem_type(struct ttm_bo_device *bdev, uint32_=
t type,
> -				   struct ttm_mem_type_manager *man)
> -{
> -	return 0;
> -}
> -
>  static void bo_driver_evict_flags(struct ttm_buffer_object *bo,
>  				  struct ttm_placement *placement)
>  {
> @@ -1069,7 +1063,6 @@ static struct ttm_bo_driver bo_driver =3D {
>  	.ttm_tt_create =3D bo_driver_ttm_tt_create,
>  	.ttm_tt_populate =3D ttm_pool_populate,
>  	.ttm_tt_unpopulate =3D ttm_pool_unpopulate,
> -	.init_mem_type =3D bo_driver_init_mem_type,
>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
>  	.evict_flags =3D bo_driver_evict_flags,
>  	.move_notify =3D bo_driver_move_notify,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> index 23ef9b1aaabc..5efc572c14cc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -646,13 +646,6 @@ nouveau_ttm_tt_create(struct ttm_buffer_object *bo=
, uint32_t page_flags)
>  	return nouveau_sgdma_create_ttm(bo, page_flags);
>  }
> =20
> -static int
> -nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
> -			 struct ttm_mem_type_manager *man)
> -{
> -	return 0;
> -}
> -
>  static void
>  nouveau_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placem=
ent *pl)
>  {
> @@ -1643,7 +1636,6 @@ struct ttm_bo_driver nouveau_bo_driver =3D {
>  	.ttm_tt_create =3D &nouveau_ttm_tt_create,
>  	.ttm_tt_populate =3D &nouveau_ttm_tt_populate,
>  	.ttm_tt_unpopulate =3D &nouveau_ttm_tt_unpopulate,
> -	.init_mem_type =3D nouveau_bo_init_mem_type,
>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
>  	.evict_flags =3D nouveau_bo_evict_flags,
>  	.move_notify =3D nouveau_bo_move_ntfy,
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_tt=
m.c
> index 852089d7f783..32069e4799f3 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -48,12 +48,6 @@ static struct qxl_device *qxl_get_qdev(struct ttm_bo=
_device *bdev)
>  	return qdev;
>  }
> =20
> -static int qxl_init_mem_type(struct ttm_bo_device *bdev, uint32_t type=
,
> -			     struct ttm_mem_type_manager *man)
> -{
> -	return 0;
> -}
> -
>  static void qxl_evict_flags(struct ttm_buffer_object *bo,
>  				struct ttm_placement *placement)
>  {
> @@ -215,7 +209,6 @@ static void qxl_bo_move_notify(struct ttm_buffer_ob=
ject *bo,
> =20
>  static struct ttm_bo_driver qxl_bo_driver =3D {
>  	.ttm_tt_create =3D &qxl_ttm_tt_create,
> -	.init_mem_type =3D &qxl_init_mem_type,
>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
>  	.evict_flags =3D &qxl_evict_flags,
>  	.move =3D &qxl_bo_move,
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> index b0b59c553785..f499d02917ac 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -66,12 +66,6 @@ struct radeon_device *radeon_get_rdev(struct ttm_bo_=
device *bdev)
>  	return rdev;
>  }
> =20
> -static int radeon_init_mem_type(struct ttm_bo_device *bdev, uint32_t t=
ype,
> -				struct ttm_mem_type_manager *man)
> -{
> -	return 0;
> -}
> -
>  static int radeon_ttm_init_vram(struct radeon_device *rdev)
>  {
>  	struct ttm_mem_type_manager *man =3D &rdev->mman.bdev.man[TTM_PL_VRAM=
];
> @@ -753,7 +747,6 @@ static struct ttm_bo_driver radeon_bo_driver =3D {
>  	.ttm_tt_create =3D &radeon_ttm_tt_create,
>  	.ttm_tt_populate =3D &radeon_ttm_tt_populate,
>  	.ttm_tt_unpopulate =3D &radeon_ttm_tt_unpopulate,
> -	.init_mem_type =3D &radeon_init_mem_type,
>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
>  	.evict_flags =3D &radeon_evict_flags,
>  	.move =3D &radeon_bo_move,
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.=
c
> index 6dea56dce350..2a6d8ed6dd86 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1527,10 +1527,6 @@ int ttm_bo_init_mm(struct ttm_bo_device *bdev, u=
nsigned type,
>  	mutex_init(&man->io_reserve_mutex);
>  	spin_lock_init(&man->move_lock);
>  	INIT_LIST_HEAD(&man->io_reserve_lru);
> -
> -	ret =3D bdev->driver->init_mem_type(bdev, type, man);
> -	if (ret)
> -		return ret;
>  	man->bdev =3D bdev;
> =20
>  	if (type !=3D TTM_PL_SYSTEM) {
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_ttm_buffer.c
> index db4b2e2e4edb..0e2897895327 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -736,12 +736,6 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm=
_buffer_object *bo,
>  	return NULL;
>  }
> =20
> -static int vmw_init_mem_type(struct ttm_bo_device *bdev, uint32_t type=
,
> -		      struct ttm_mem_type_manager *man)
> -{
> -	return 0;
> -}
> -
>  static void vmw_evict_flags(struct ttm_buffer_object *bo,
>  		     struct ttm_placement *placement)
>  {
> @@ -817,7 +811,6 @@ struct ttm_bo_driver vmw_bo_driver =3D {
>  	.ttm_tt_create =3D &vmw_ttm_tt_create,
>  	.ttm_tt_populate =3D &vmw_ttm_populate,
>  	.ttm_tt_unpopulate =3D &vmw_ttm_unpopulate,
> -	.init_mem_type =3D vmw_init_mem_type,
>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
>  	.evict_flags =3D vmw_evict_flags,
>  	.move =3D NULL,
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_d=
river.h
> index adac4cd0ba23..f76f1332fdc5 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -157,7 +157,6 @@ struct ttm_mem_type_manager_func {
>   * @move: The fence of the last pipelined move operation.
>   *
>   * This structure is used to identify and manage memory types for a de=
vice.
> - * It's set up by the ttm_bo_driver::init_mem_type method.
>   */
> =20
> =20
> @@ -203,8 +202,6 @@ struct ttm_mem_type_manager {
>   * struct ttm_bo_driver
>   *
>   * @create_ttm_backend_entry: Callback to create a struct ttm_backend.=

> - * @init_mem_type: Callback to initialize a struct ttm_mem_type_manage=
r
> - * structure.
>   * @evict_flags: Callback to obtain placement flags when a buffer is e=
victed.
>   * @move: Callback for a driver to hook in accelerated functions to
>   * move a buffer.
> @@ -247,9 +244,6 @@ struct ttm_bo_driver {
>  	 */
>  	void (*ttm_tt_unpopulate)(struct ttm_tt *ttm);
> =20
> -	int (*init_mem_type)(struct ttm_bo_device *bdev, uint32_t type,
> -			     struct ttm_mem_type_manager *man);
> -
>  	/**
>  	 * struct ttm_bo_driver member eviction_valuable
>  	 *
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--REPPDrISevpAoSWC4TVb1r6fIOJrD3ge3--

--dJldWY9OVOlq5u2CkT9Qdhf5LfmRhfF43
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8ahQgUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPYJQf9FvFy0fxnfo0/u+ns8fUDXU9n+aKg
9t7XAfiTD/zkhlNWf63mBIZFjk4RfaEahHa0H9kQd7HqBCm3haNYn/RJ608Cqqp6
nWPOxK/BT1cZIexvk+SvnvbMLmirWo5PZ0fe9GJ4PUDn9wlRBvYUn50eg9LEcr9M
AhzC/YcZ9NhyxAIzzr9KQOFYaJbMzIoDUffghPCRBmuyGyWWPC4uVKlc1/5r8HFW
jcp9zc3yb2jN/KtAc0Vynvyo4dNvCIB+eqgcoMX7+dFbetC2TucldJwe4i1ZyzA3
DuVRBDrEdibEDqTRIKBMi/v28VI6498H2UTqoqBYU6ex23Zbt/BJWtj/sQ==
=rO1+
-----END PGP SIGNATURE-----

--dJldWY9OVOlq5u2CkT9Qdhf5LfmRhfF43--

--===============1006029270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1006029270==--
