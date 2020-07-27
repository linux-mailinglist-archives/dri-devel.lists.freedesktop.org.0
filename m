Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24D22E969
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 11:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E152289CE3;
	Mon, 27 Jul 2020 09:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A65789CE3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 09:48:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a5so4205848wrm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dBWUX3EpWSgEOUxoGDbS0MW89eIO9aucs4gWOGGBW8I=;
 b=PQEkEk6s/C1VQIIwYcbH6dygH8Minf3GmqSu46+EFGrm/UBsJJPl0bkwlhqpLUP6vK
 slU7VgV124WZ8BwXr116ueOJhiJKmAIi+uj4Z/D7mTAK2Ljbm7lP6rLpU00Y4KvGwgmW
 hm+cygr8YLsdEFjLAQgInyjTwwaRkZdjFhflk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dBWUX3EpWSgEOUxoGDbS0MW89eIO9aucs4gWOGGBW8I=;
 b=T99eOHzhe/DLxkoOc2f39prpR+bWzMMQAsFTxYcr89LM5VH+mHFKl0jQ5zoobyMUg7
 KBB4fd/6QlyTUDdrQ2v5nfaQOc7XQFwidfPh/7fC8o8zB2Fg4uWziIIRPNUCWzRn5J5G
 YkzCGtbh3ce8bSZDI7Z+nm7Z+cjBZEnCNrlFiIDCg6JeKaHgZxcxEIddIpfJDy3tA18l
 8sgl9hmg4PronDb+BlhRhH723HB1El9Zfu38gbX0twq8B2J3bVv14JUk4xRZkSR5rqDM
 FWdbEvL0Ty5kFUmvsZlRUfpZKgQKxYFp5+sS6/EpFpZoYJ336lytG3tOIDT5GMeY0QFT
 X5TA==
X-Gm-Message-State: AOAM532tcO8ifq3Trt0eA6QeFwpB4hG0cfMs/Bm6/bUNJf33yfpsgeo0
 5jcCtOHeazv1KkY4U9O14VxMsw==
X-Google-Smtp-Source: ABdhPJxTjNsZmB/Vu0vodJa1CqTLbkGwXDKOd8iDpQbm2GH4vADAJoCVKNC89AfFsRAaQ1vT03cWPg==
X-Received: by 2002:adf:ee8e:: with SMTP id b14mr8146462wro.213.1595843285614; 
 Mon, 27 Jul 2020 02:48:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v29sm12724283wrv.51.2020.07.27.02.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:48:05 -0700 (PDT)
Date: Mon, 27 Jul 2020 11:48:03 +0200
From: daniel@ffwll.ch
To: 
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/9] drm/ttm: remove TTM_MEMTYPE_FLAG_FIXED
Message-ID: <20200727094803.GP6419@phenom.ffwll.local>
References: <20200723151621.3536-1-christian.koenig@amd.com>
 <20200723151621.3536-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723151621.3536-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 05:16:14PM +0200, Christian K=F6nig wrote:
> Instead use a boolean field in the memory manager structure.
> =

> Also invert the meaning of the field since the use of a TT
> structure is the special case here.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
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
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index e57c49a91b73..406bcb03df48 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -87,15 +87,14 @@ static int amdgpu_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
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
> @@ -104,7 +103,6 @@ static int amdgpu_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>  	case AMDGPU_PL_OA:
>  		/* On-chip GDS memory*/
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED;
>  		man->default_caching =3D TTM_PL_FLAG_UNCACHED;
>  		break;
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_=
gem_vram_helper.c
> index be177afdeb9a..801a14c6e9e0 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1012,7 +1012,6 @@ static int bo_driver_init_mem_type(struct ttm_bo_de=
vice *bdev, uint32_t type,
>  		break;
>  	case TTM_PL_VRAM:
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED |
>  					 TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 53af25020bb2..a3ad66ad3817 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -657,7 +657,6 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, =
uint32_t type,
>  	case TTM_PL_SYSTEM:
>  		break;
>  	case TTM_PL_VRAM:
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED |
>  					 TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
> @@ -685,13 +684,12 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev=
, uint32_t type,
>  		else
>  			man->func =3D &ttm_bo_manager_func;
>  =

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
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index e9b8c921c1f0..abb9fa4d80cf 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -59,7 +59,6 @@ static int qxl_init_mem_type(struct ttm_bo_device *bdev=
, uint32_t type,
>  	case TTM_PL_PRIV:
>  		/* "On-card" video ram */
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index b4cb75361577..9aba18a143e7 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -81,7 +81,7 @@ static int radeon_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>  		man->func =3D &ttm_bo_manager_func;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> -		man->flags =3D 0;
> +		man->use_tt =3D true;
>  #if IS_ENABLED(CONFIG_AGP)
>  		if (rdev->flags & RADEON_IS_AGP) {
>  			if (!rdev->ddev->agp) {
> @@ -98,7 +98,6 @@ static int radeon_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
>  		break;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 1f1f9e463265..6dea56dce350 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -84,7 +84,7 @@ static void ttm_mem_type_debug(struct ttm_bo_device *bd=
ev, struct drm_printer *p
>  =

>  	drm_printf(p, "    has_type: %d\n", man->has_type);
>  	drm_printf(p, "    use_type: %d\n", man->use_type);
> -	drm_printf(p, "    flags: 0x%08X\n", man->flags);
> +	drm_printf(p, "    use_tt: %d\n", man->use_tt);
>  	drm_printf(p, "    size: %llu\n", man->size);
>  	drm_printf(p, "    available_caching: 0x%08X\n", man->available_caching=
);
>  	drm_printf(p, "    default_caching: 0x%08X\n", man->default_caching);
> @@ -159,7 +159,7 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffer_o=
bject *bo,
>  	man =3D &bdev->man[mem->mem_type];
>  	list_add_tail(&bo->lru, &man->lru[bo->priority]);
>  =

> -	if (!(man->flags & TTM_MEMTYPE_FLAG_FIXED) && bo->ttm &&
> +	if (man->use_tt && bo->ttm &&
>  	    !(bo->ttm->page_flags & (TTM_PAGE_FLAG_SG |
>  				     TTM_PAGE_FLAG_SWAPPED))) {
>  		list_add_tail(&bo->swap, &ttm_bo_glob.swap_lru[bo->priority]);
> @@ -286,8 +286,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_o=
bject *bo,
>  	 * Create and bind a ttm if required.
>  	 */
>  =

> -	if (!(new_man->flags & TTM_MEMTYPE_FLAG_FIXED)) {
> -		bool zero =3D !(old_man->flags & TTM_MEMTYPE_FLAG_FIXED);
> +	if (new_man->use_tt) {
> +		bool zero =3D old_man->use_tt;
>  =

>  		ret =3D ttm_tt_create(bo, zero);
>  		if (ret)
> @@ -314,8 +314,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_o=
bject *bo,
>  	if (bdev->driver->move_notify)
>  		bdev->driver->move_notify(bo, evict, mem);
>  =

> -	if (!(old_man->flags & TTM_MEMTYPE_FLAG_FIXED) &&
> -	    !(new_man->flags & TTM_MEMTYPE_FLAG_FIXED))
> +	if (old_man->use_tt && new_man->use_tt)
>  		ret =3D ttm_bo_move_ttm(bo, ctx, mem);
>  	else if (bdev->driver->move)
>  		ret =3D bdev->driver->move(bo, evict, ctx, mem);
> @@ -340,7 +339,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_o=
bject *bo,
>  =

>  out_err:
>  	new_man =3D &bdev->man[bo->mem.mem_type];
> -	if (new_man->flags & TTM_MEMTYPE_FLAG_FIXED) {
> +	if (!new_man->use_tt) {
>  		ttm_tt_destroy(bo->ttm);
>  		bo->ttm =3D NULL;
>  	}
> @@ -1677,6 +1676,7 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
>  	 * Initialize the system memory buffer type.
>  	 * Other types need to be driver / IOCTL initialized.
>  	 */
> +	bdev->man[TTM_PL_SYSTEM].use_tt =3D true;
>  	bdev->man[TTM_PL_SYSTEM].available_caching =3D TTM_PL_MASK_CACHING;
>  	bdev->man[TTM_PL_SYSTEM].default_caching =3D TTM_PL_FLAG_CACHED;
>  	ret =3D ttm_bo_init_mm(bdev, TTM_PL_SYSTEM, 0);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 7fb3e0bcbab4..1f502be0b646 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -384,7 +384,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>  	*old_mem =3D *new_mem;
>  	new_mem->mm_node =3D NULL;
>  =

> -	if (man->flags & TTM_MEMTYPE_FLAG_FIXED) {
> +	if (!man->use_tt) {
>  		ttm_tt_destroy(ttm);
>  		bo->ttm =3D NULL;
>  	}
> @@ -645,7 +645,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_objec=
t *bo,
>  		if (ret)
>  			return ret;
>  =

> -		if (man->flags & TTM_MEMTYPE_FLAG_FIXED) {
> +		if (!man->use_tt) {
>  			ttm_tt_destroy(bo->ttm);
>  			bo->ttm =3D NULL;
>  		}
> @@ -674,7 +674,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_objec=
t *bo,
>  		 * bo to be unbound and destroyed.
>  		 */
>  =

> -		if (!(man->flags & TTM_MEMTYPE_FLAG_FIXED))
> +		if (man->use_tt)
>  			ghost_obj->ttm =3D NULL;
>  		else
>  			bo->ttm =3D NULL;
> @@ -730,7 +730,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
>  		 * bo to be unbound and destroyed.
>  		 */
>  =

> -		if (!(to->flags & TTM_MEMTYPE_FLAG_FIXED))
> +		if (to->use_tt)
>  			ghost_obj->ttm =3D NULL;
>  		else
>  			bo->ttm =3D NULL;
> @@ -738,7 +738,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
>  		dma_resv_unlock(&ghost_obj->base._resv);
>  		ttm_bo_put(ghost_obj);
>  =

> -	} else if (from->flags & TTM_MEMTYPE_FLAG_FIXED) {
> +	} else if (!from->use_tt) {
>  =

>  		/**
>  		 * BO doesn't have a TTM we need to bind/unbind. Just remember
> @@ -768,7 +768,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
>  		if (ret)
>  			return ret;
>  =

> -		if (to->flags & TTM_MEMTYPE_FLAG_FIXED) {
> +		if (!to->use_tt) {
>  			ttm_tt_destroy(bo->ttm);
>  			bo->ttm =3D NULL;
>  		}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_ttm_buffer.c
> index 00cef1a3a178..5d8179d9f394 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -746,7 +746,6 @@ static int vmw_init_mem_type(struct ttm_bo_device *bd=
ev, uint32_t type,
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
>  		man->func =3D &vmw_thp_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_CACHED;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> @@ -760,6 +759,8 @@ static int vmw_init_mem_type(struct ttm_bo_device *bd=
ev, uint32_t type,
>  		man->func =3D &vmw_gmrid_manager_func;
>  		man->available_caching =3D TTM_PL_FLAG_CACHED;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> +		/* TODO: This is most likely not correct */

Comment suggests it's a remapping thing, and I've seen some idr allocator
thing in vmwgfx before, i.e. it allocates remapping ids for bo, instead of
remapping space. So I think this is all ok, and no need for the TODO here.

With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +		man->use_tt =3D true;
>  		break;
>  	default:
>  		DRM_ERROR("Unsupported memory type %u\n", (unsigned)type);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_dri=
ver.h
> index 9b251853afe2..adac4cd0ba23 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -45,8 +45,6 @@
>  =

>  #define TTM_MAX_BO_PRIORITY	4U
>  =

> -#define TTM_MEMTYPE_FLAG_FIXED         (1 << 0)	/* Fixed (on-card) PCI m=
emory */
> -
>  struct ttm_mem_type_manager;
>  =

>  struct ttm_mem_type_manager_func {
> @@ -173,7 +171,7 @@ struct ttm_mem_type_manager {
>  =

>  	bool has_type;
>  	bool use_type;
> -	uint32_t flags;
> +	bool use_tt;
>  	uint64_t size;
>  	uint32_t available_caching;
>  	uint32_t default_caching;
> -- =

> 2.17.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
