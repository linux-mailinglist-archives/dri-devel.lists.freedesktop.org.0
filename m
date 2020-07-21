Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B282227B55
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 11:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB02F6E51A;
	Tue, 21 Jul 2020 09:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149956E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:01:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w3so2079113wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zNj1IGoeKVAb8dC83T2Ghzw4r2YvkDKuOqgG0KELND8=;
 b=ECr74pl3lQhwVc4AlsFxs6zs0Y156iB+4Q/MKXAwYPrd5HzzBjdcCydbV2FgGQkTRo
 mOthk83YDeQnu9n6chamwcpEQYknd4gRKYrNecGpfJzK0+bPWNWiC2pJPS9Ev3Cr1W+L
 bsP1Uko9LZrmqithNCai+N81APFI06IqxggbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zNj1IGoeKVAb8dC83T2Ghzw4r2YvkDKuOqgG0KELND8=;
 b=DZTUWT7DQuSrsq+YZed8LaXI85bGkXrWcpOP8BN/qihPT83QtC/g2Qa78T5Zf7HTSI
 rN3PnXOdicAmLgUceVc+mgkd8y0JqmDl8T1WNLN4fDeMl+hEMvcXbrvg8o9+jTAWG0tt
 8OiPlQXVehafDex4+sYIFReiauBCWFwfY1fJF++F+RJyta08Zgeh4e90T+KJEpU9MXlD
 QKCc/g9Ej52YXzXE+DQXe3ab6DYFjjb0DQfAcEW9SFUymHz9Cy2h8PfSDtYIw/FybaSV
 f3TPgMGsLnO8T6TWZK5ocFit1dYwNgCSowzQ65HNkMc1jdv8TaX6QTaPZy6/Ms9EsfUQ
 bbQA==
X-Gm-Message-State: AOAM532ncfmUO2yW09CozJ5QcfaK04PsStU5giNa7KJFN3FTaiX40Wh4
 jzSoK1s092qQL4MPpYBTqvhS8zL/2Nc=
X-Google-Smtp-Source: ABdhPJyDu8r2W+o3jMDeFXaCPeTmAHfeYsW6xfk9QqKhdgU5EKcGVZFFxQE30XRTE75WNKqX5T211Q==
X-Received: by 2002:a1c:e405:: with SMTP id b5mr3325593wmh.54.1595322095643;
 Tue, 21 Jul 2020 02:01:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z11sm6632492wrw.93.2020.07.21.02.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:01:34 -0700 (PDT)
Date: Tue, 21 Jul 2020 11:01:32 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 05/11] drm/ttm: remove TTM_MEMTYPE_FLAG_CMA
Message-ID: <20200721090132.GD6419@phenom.ffwll.local>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073245.2484-5-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 09:32:39AM +0200, Christian K=F6nig wrote:
> The original intention was to avoid CPU page table unmaps
> when BOs move between the GTT and SYSTEM domain.
> =

> The problem is that this never correctly handled changes
> in the caching attributes or backing pages.
> =

> Just drop this for now and simply unmap the CPU page
> tables in all cases.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_bo.c       |  3 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c        |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c               | 34 ++++------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
>  include/drm/ttm/ttm_bo_driver.h            |  1 -
>  6 files changed, 11 insertions(+), 35 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 9c0f12f74af9..44fa8bc49d18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -93,7 +93,7 @@ static int amdgpu_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>  		man->func =3D &amdgpu_gtt_mgr_func;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE | TTM_MEMTYPE_FLAG_CMA;
> +		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
>  		break;
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
> @@ -108,7 +108,7 @@ static int amdgpu_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>  	case AMDGPU_PL_OA:
>  		/* On-chip GDS memory*/
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED | TTM_MEMTYPE_FLAG_CMA;
> +		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED;
>  		man->default_caching =3D TTM_PL_FLAG_UNCACHED;
>  		break;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index a1037478fa3f..7883341f8c83 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -695,8 +695,7 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, =
uint32_t type,
>  				TTM_PL_FLAG_WC;
>  			man->default_caching =3D TTM_PL_FLAG_WC;
>  		} else {
> -			man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE |
> -				     TTM_MEMTYPE_FLAG_CMA;
> +			man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
>  			man->available_caching =3D TTM_PL_MASK_CACHING;
>  			man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		}
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 73085523fad7..54af06df865b 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -84,7 +84,7 @@ static int radeon_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>  		man->func =3D &ttm_bo_manager_func;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE | TTM_MEMTYPE_FLAG_CMA;
> +		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
>  #if IS_ENABLED(CONFIG_AGP)
>  		if (rdev->flags & RADEON_IS_AGP) {
>  			if (!rdev->ddev->agp) {
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 8b9e7f62bea7..0768a054a916 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -272,20 +272,15 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer=
_object *bo,
>  				  struct ttm_operation_ctx *ctx)
>  {
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> -	bool old_is_pci =3D ttm_mem_reg_is_pci(bdev, &bo->mem);
> -	bool new_is_pci =3D ttm_mem_reg_is_pci(bdev, mem);
>  	struct ttm_mem_type_manager *old_man =3D &bdev->man[bo->mem.mem_type];
>  	struct ttm_mem_type_manager *new_man =3D &bdev->man[mem->mem_type];
> -	int ret =3D 0;
> +	int ret;
>  =

> -	if (old_is_pci || new_is_pci ||
> -	    ((mem->placement & bo->mem.placement & TTM_PL_MASK_CACHING) =3D=3D =
0)) {
> -		ret =3D ttm_mem_io_lock(old_man, true);
> -		if (unlikely(ret !=3D 0))
> -			goto out_err;
> -		ttm_bo_unmap_virtual_locked(bo);
> -		ttm_mem_io_unlock(old_man);
> -	}

Fastpath for when there's no mapping at all might be a more reasonable
idea than trying to keep it around. Lots of one-shot upload or indirect
upload buffers generally, and maybe avoiding the ttm_mem_type_manager io
mutex is worth it. Anyway totally different thing.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	ret =3D ttm_mem_io_lock(old_man, true);
> +	if (unlikely(ret !=3D 0))
> +		goto out_err;
> +	ttm_bo_unmap_virtual_locked(bo);
> +	ttm_mem_io_unlock(old_man);
>  =

>  	/*
>  	 * Create and bind a ttm if required.
> @@ -1698,23 +1693,6 @@ EXPORT_SYMBOL(ttm_bo_device_init);
>   * buffer object vm functions.
>   */
>  =

> -bool ttm_mem_reg_is_pci(struct ttm_bo_device *bdev, struct ttm_mem_reg *=
mem)
> -{
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
> -
> -	if (!(man->flags & TTM_MEMTYPE_FLAG_FIXED)) {
> -		if (mem->mem_type =3D=3D TTM_PL_SYSTEM)
> -			return false;
> -
> -		if (man->flags & TTM_MEMTYPE_FLAG_CMA)
> -			return false;
> -
> -		if (mem->placement & TTM_PL_FLAG_CACHED)
> -			return false;
> -	}
> -	return true;
> -}
> -
>  void ttm_bo_unmap_virtual_locked(struct ttm_buffer_object *bo)
>  {
>  	struct ttm_bo_device *bdev =3D bo->bdev;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_ttm_buffer.c
> index bfd0c54ec30a..6bea7548aee0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -762,7 +762,7 @@ static int vmw_init_mem_type(struct ttm_bo_device *bd=
ev, uint32_t type,
>  		 *  slots as well as the bo size.
>  		 */
>  		man->func =3D &vmw_gmrid_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_CMA | TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
>  		man->available_caching =3D TTM_PL_FLAG_CACHED;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_dri=
ver.h
> index 45522e4fbd6b..71b195e78c7c 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -47,7 +47,6 @@
>  =

>  #define TTM_MEMTYPE_FLAG_FIXED         (1 << 0)	/* Fixed (on-card) PCI m=
emory */
>  #define TTM_MEMTYPE_FLAG_MAPPABLE      (1 << 1)	/* Memory mappable */
> -#define TTM_MEMTYPE_FLAG_CMA           (1 << 3)	/* Can't map aperture */
>  =

>  struct ttm_mem_type_manager;
>  =

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
