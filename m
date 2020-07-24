Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4719022BE3E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 08:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B656E4B0;
	Fri, 24 Jul 2020 06:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E23E6E4B0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 06:50:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71F03AE59;
 Fri, 24 Jul 2020 06:50:37 +0000 (UTC)
Subject: Re: [PATCH 2/9] drm/ttm: remove TTM_MEMTYPE_FLAG_FIXED
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200723151710.3591-1-christian.koenig@amd.com>
 <20200723151710.3591-3-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b41781bd-3f99-85d8-e08a-20fdc8f92488@suse.de>
Date: Fri, 24 Jul 2020 08:50:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723151710.3591-3-christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============1079350836=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1079350836==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YsbPOjcGsU2kNGTxB9Y4iPQSHJoNUivgx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YsbPOjcGsU2kNGTxB9Y4iPQSHJoNUivgx
Content-Type: multipart/mixed; boundary="lRFzL98zPWhWkIEZvfF8EIlbGY5wG7Bvz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <b41781bd-3f99-85d8-e08a-20fdc8f92488@suse.de>
Subject: Re: [PATCH 2/9] drm/ttm: remove TTM_MEMTYPE_FLAG_FIXED
References: <20200723151710.3591-1-christian.koenig@amd.com>
 <20200723151710.3591-3-christian.koenig@amd.com>
In-Reply-To: <20200723151710.3591-3-christian.koenig@amd.com>

--lRFzL98zPWhWkIEZvfF8EIlbGY5wG7Bvz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 23.07.20 um 17:17 schrieb Christian K=C3=B6nig:
> Instead use a boolean field in the memory manager structure.
>=20
> Also invert the meaning of the field since the use of a TT
> structure is the special case here.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

There's a comment further below. In any case

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 +---
>  drivers/gpu/drm/drm_gem_vram_helper.c      |  1 -
>  drivers/gpu/drm/nouveau/nouveau_bo.c       |  4 +---
>  drivers/gpu/drm/qxl/qxl_ttm.c              |  1 -
>  drivers/gpu/drm/radeon/radeon_ttm.c        |  3 +--
>  drivers/gpu/drm/ttm/ttm_bo.c               | 14 +++++++-------
>  drivers/gpu/drm/ttm/ttm_bo_util.c          | 12 ++++++------
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  3 ++-
>  include/drm/ttm/ttm_bo_driver.h            |  4 +---
>  9 files changed, 19 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> index e57c49a91b73..406bcb03df48 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -87,15 +87,14 @@ static int amdgpu_init_mem_type(struct ttm_bo_devic=
e *bdev, uint32_t type,
>  		break;
>  	case TTM_PL_TT:
>  		/* GTT memory  */
> +		man->use_tt =3D true;
>  		man->func =3D &amdgpu_gtt_mgr_func;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> -		man->flags =3D 0;
>  		break;
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
>  		man->func =3D &amdgpu_vram_mgr_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
>  		break;
> @@ -104,7 +103,6 @@ static int amdgpu_init_mem_type(struct ttm_bo_devic=
e *bdev, uint32_t type,
>  	case AMDGPU_PL_OA:
>  		/* On-chip GDS memory*/
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED;
>  		man->default_caching =3D TTM_PL_FLAG_UNCACHED;
>  		break;
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index be177afdeb9a..801a14c6e9e0 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1012,7 +1012,6 @@ static int bo_driver_init_mem_type(struct ttm_bo_=
device *bdev, uint32_t type,
>  		break;
>  	case TTM_PL_VRAM:
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED |
>  					 TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> index 53af25020bb2..a3ad66ad3817 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -657,7 +657,6 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev=
, uint32_t type,
>  	case TTM_PL_SYSTEM:
>  		break;
>  	case TTM_PL_VRAM:
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED |
>  					 TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
> @@ -685,13 +684,12 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bd=
ev, uint32_t type,
>  		else
>  			man->func =3D &ttm_bo_manager_func;
> =20
> +		man->use_tt =3D true;
>  		if (drm->agp.bridge) {
> -			man->flags =3D 0;
>  			man->available_caching =3D TTM_PL_FLAG_UNCACHED |
>  				TTM_PL_FLAG_WC;
>  			man->default_caching =3D TTM_PL_FLAG_WC;
>  		} else {
> -			man->flags =3D 0;
>  			man->available_caching =3D TTM_PL_MASK_CACHING;
>  			man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		}
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_tt=
m.c
> index e9b8c921c1f0..abb9fa4d80cf 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -59,7 +59,6 @@ static int qxl_init_mem_type(struct ttm_bo_device *bd=
ev, uint32_t type,
>  	case TTM_PL_PRIV:
>  		/* "On-card" video ram */
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> index b4cb75361577..9aba18a143e7 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -81,7 +81,7 @@ static int radeon_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>  		man->func =3D &ttm_bo_manager_func;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> -		man->flags =3D 0;
> +		man->use_tt =3D true;
>  #if IS_ENABLED(CONFIG_AGP)
>  		if (rdev->flags & RADEON_IS_AGP) {
>  			if (!rdev->ddev->agp) {
> @@ -98,7 +98,6 @@ static int radeon_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
>  		break;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.=
c
> index 1f1f9e463265..6dea56dce350 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -84,7 +84,7 @@ static void ttm_mem_type_debug(struct ttm_bo_device *=
bdev, struct drm_printer *p
> =20
>  	drm_printf(p, "    has_type: %d\n", man->has_type);
>  	drm_printf(p, "    use_type: %d\n", man->use_type);
> -	drm_printf(p, "    flags: 0x%08X\n", man->flags);
> +	drm_printf(p, "    use_tt: %d\n", man->use_tt);
>  	drm_printf(p, "    size: %llu\n", man->size);
>  	drm_printf(p, "    available_caching: 0x%08X\n", man->available_cachi=
ng);
>  	drm_printf(p, "    default_caching: 0x%08X\n", man->default_caching);=

> @@ -159,7 +159,7 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffer=
_object *bo,
>  	man =3D &bdev->man[mem->mem_type];
>  	list_add_tail(&bo->lru, &man->lru[bo->priority]);
> =20
> -	if (!(man->flags & TTM_MEMTYPE_FLAG_FIXED) && bo->ttm &&
> +	if (man->use_tt && bo->ttm &&
>  	    !(bo->ttm->page_flags & (TTM_PAGE_FLAG_SG |
>  				     TTM_PAGE_FLAG_SWAPPED))) {
>  		list_add_tail(&bo->swap, &ttm_bo_glob.swap_lru[bo->priority]);
> @@ -286,8 +286,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer=
_object *bo,
>  	 * Create and bind a ttm if required.
>  	 */
> =20
> -	if (!(new_man->flags & TTM_MEMTYPE_FLAG_FIXED)) {
> -		bool zero =3D !(old_man->flags & TTM_MEMTYPE_FLAG_FIXED);
> +	if (new_man->use_tt) {
> +		bool zero =3D old_man->use_tt;

There's little use in copying to zero.

> =20
>  		ret =3D ttm_tt_create(bo, zero);

Maybe rather pass old_man->use_tt directly and leave a comment why that
makes sense.

Best regards
Thomas

>  		if (ret)
> @@ -314,8 +314,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer=
_object *bo,
>  	if (bdev->driver->move_notify)
>  		bdev->driver->move_notify(bo, evict, mem);
> =20
> -	if (!(old_man->flags & TTM_MEMTYPE_FLAG_FIXED) &&
> -	    !(new_man->flags & TTM_MEMTYPE_FLAG_FIXED))
> +	if (old_man->use_tt && new_man->use_tt)
>  		ret =3D ttm_bo_move_ttm(bo, ctx, mem);
>  	else if (bdev->driver->move)
>  		ret =3D bdev->driver->move(bo, evict, ctx, mem);
> @@ -340,7 +339,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer=
_object *bo,
> =20
>  out_err:
>  	new_man =3D &bdev->man[bo->mem.mem_type];
> -	if (new_man->flags & TTM_MEMTYPE_FLAG_FIXED) {
> +	if (!new_man->use_tt) {
>  		ttm_tt_destroy(bo->ttm);
>  		bo->ttm =3D NULL;
>  	}
> @@ -1677,6 +1676,7 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev=
,
>  	 * Initialize the system memory buffer type.
>  	 * Other types need to be driver / IOCTL initialized.
>  	 */
> +	bdev->man[TTM_PL_SYSTEM].use_tt =3D true;
>  	bdev->man[TTM_PL_SYSTEM].available_caching =3D TTM_PL_MASK_CACHING;
>  	bdev->man[TTM_PL_SYSTEM].default_caching =3D TTM_PL_FLAG_CACHED;
>  	ret =3D ttm_bo_init_mm(bdev, TTM_PL_SYSTEM, 0);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/tt=
m_bo_util.c
> index 7fb3e0bcbab4..1f502be0b646 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -384,7 +384,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo=
,
>  	*old_mem =3D *new_mem;
>  	new_mem->mm_node =3D NULL;
> =20
> -	if (man->flags & TTM_MEMTYPE_FLAG_FIXED) {
> +	if (!man->use_tt) {
>  		ttm_tt_destroy(ttm);
>  		bo->ttm =3D NULL;
>  	}
> @@ -645,7 +645,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_obj=
ect *bo,
>  		if (ret)
>  			return ret;
> =20
> -		if (man->flags & TTM_MEMTYPE_FLAG_FIXED) {
> +		if (!man->use_tt) {
>  			ttm_tt_destroy(bo->ttm);
>  			bo->ttm =3D NULL;
>  		}
> @@ -674,7 +674,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_obj=
ect *bo,
>  		 * bo to be unbound and destroyed.
>  		 */
> =20
> -		if (!(man->flags & TTM_MEMTYPE_FLAG_FIXED))
> +		if (man->use_tt)
>  			ghost_obj->ttm =3D NULL;
>  		else
>  			bo->ttm =3D NULL;
> @@ -730,7 +730,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *=
bo,
>  		 * bo to be unbound and destroyed.
>  		 */
> =20
> -		if (!(to->flags & TTM_MEMTYPE_FLAG_FIXED))
> +		if (to->use_tt)
>  			ghost_obj->ttm =3D NULL;
>  		else
>  			bo->ttm =3D NULL;
> @@ -738,7 +738,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *=
bo,
>  		dma_resv_unlock(&ghost_obj->base._resv);
>  		ttm_bo_put(ghost_obj);
> =20
> -	} else if (from->flags & TTM_MEMTYPE_FLAG_FIXED) {
> +	} else if (!from->use_tt) {
> =20
>  		/**
>  		 * BO doesn't have a TTM we need to bind/unbind. Just remember
> @@ -768,7 +768,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *=
bo,
>  		if (ret)
>  			return ret;
> =20
> -		if (to->flags & TTM_MEMTYPE_FLAG_FIXED) {
> +		if (!to->use_tt) {
>  			ttm_tt_destroy(bo->ttm);
>  			bo->ttm =3D NULL;
>  		}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_ttm_buffer.c
> index 00cef1a3a178..5d8179d9f394 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -746,7 +746,6 @@ static int vmw_init_mem_type(struct ttm_bo_device *=
bdev, uint32_t type,
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
>  		man->func =3D &vmw_thp_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_CACHED;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> @@ -760,6 +759,8 @@ static int vmw_init_mem_type(struct ttm_bo_device *=
bdev, uint32_t type,
>  		man->func =3D &vmw_gmrid_manager_func;
>  		man->available_caching =3D TTM_PL_FLAG_CACHED;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> +		/* TODO: This is most likely not correct */
> +		man->use_tt =3D true;
>  		break;
>  	default:
>  		DRM_ERROR("Unsupported memory type %u\n", (unsigned)type);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_d=
river.h
> index 9b251853afe2..adac4cd0ba23 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -45,8 +45,6 @@
> =20
>  #define TTM_MAX_BO_PRIORITY	4U
> =20
> -#define TTM_MEMTYPE_FLAG_FIXED         (1 << 0)	/* Fixed (on-card) PCI=
 memory */
> -
>  struct ttm_mem_type_manager;
> =20
>  struct ttm_mem_type_manager_func {
> @@ -173,7 +171,7 @@ struct ttm_mem_type_manager {
> =20
>  	bool has_type;
>  	bool use_type;
> -	uint32_t flags;
> +	bool use_tt;
>  	uint64_t size;
>  	uint32_t available_caching;
>  	uint32_t default_caching;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lRFzL98zPWhWkIEZvfF8EIlbGY5wG7Bvz--

--YsbPOjcGsU2kNGTxB9Y4iPQSHJoNUivgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8ahLEUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPhBwf9GlytCZ923hr+E1okBK7kpmq+zCKV
zLevQM/Z93h+V8VlH+5RN9i/ikTCSWarv6YHTnie18v8UQbuTGmuiISR6kgDrk9v
QfztYSE/PPTWYLvE0wNNysxMWtPa0usYcv2X0Is8RHocFe/5hVnW2qubaSKudwlD
r+VWo9a368lVWxe2lYExmajUMas6REnw0h84d3EkiE5qZiCoRORxP9MGiwUv0kTi
jzq+8BAAwkGMmQkZiOS98/ME/myvBI8UkxHcsURtGV+ozm2dd+WnHZubIjVUKabb
p1W2SmDynHimmZYUqbfB3Ka/CV0hlSa7bev9AJAtG3D29Z4rQXxNdWwPEg==
=iE3Z
-----END PGP SIGNATURE-----

--YsbPOjcGsU2kNGTxB9Y4iPQSHJoNUivgx--

--===============1079350836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1079350836==--
