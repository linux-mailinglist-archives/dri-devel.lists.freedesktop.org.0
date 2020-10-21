Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195DA29495D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 10:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6B76EA88;
	Wed, 21 Oct 2020 08:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2596EA88
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:33:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x7so2065346wrl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5zH1lBhnlIaD4LLa1vB73X8XACJfNyHigLZOvvF86og=;
 b=BSC+Se6E9BTlh28k/zea6VRJ8q2KPXdA5Fg4eH+2wm59rqteWdYpctUcSB5tw6tPuA
 F7NTGsp4Phr1fh3k+6ZT/syYZUaFeaVCXfBFCH1+s51Ov0IZQAMmv13QRPj0zmhqHP5X
 2FfqtEp+APWSiQNRclY7dQhAd7eO5ixnfpXsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5zH1lBhnlIaD4LLa1vB73X8XACJfNyHigLZOvvF86og=;
 b=IdoscwlmA5XpFtNYm+WfP+x5/Cw17kV+fy4ltvhXHFL3dq9EgjqE8cWc+vsPN3wXYp
 SPGLjgaLNE1V3LkND+pDVTPBnLqiMg2A3K1OweonVgZ8BAv1yLtRbluaM2e16aM86lOI
 U5Z288SIokheXUIIBwdQ+/CWa03JtzUcprPXxtSW64040WaqzygSRI23Lx2/Llp+cgP2
 XFzyporCcLg3pm+rtZ73UBs2QnAMh7yrNZTvoZb/MVEm4nT+vywmHlvXREyorQOrwNoC
 n6S/1UYRr/QemK9Nfk66ErDkqiL1sC9QxgotAQZau8Sbxqd2ZwSmhWpQ0sLQeJ3eKR10
 NwNg==
X-Gm-Message-State: AOAM532UFwxKzqBaNUZ+7ZG/bnh48cXLSu3tLxHPsN58wBfL4v15/+S/
 1awMWrSbrIvjJ3s1y+nmA6w8MA==
X-Google-Smtp-Source: ABdhPJx4T8Z7V45va8kN8PogU7BqblweX5kzEfgtHUCDtxQmKw5yu6OlOKSkTi6UtytkR76zAVOm+w==
X-Received: by 2002:a5d:69ce:: with SMTP id s14mr3551202wrw.39.1603269203624; 
 Wed, 21 Oct 2020 01:33:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i14sm2083977wml.24.2020.10.21.01.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:33:22 -0700 (PDT)
Date: Wed, 21 Oct 2020 10:33:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 3/3] drm/ttm: avoid multihop moves in drivers.
Message-ID: <20201021083320.GM401619@phenom.ffwll.local>
References: <20201021044031.1752624-1-airlied@gmail.com>
 <20201021044031.1752624-4-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021044031.1752624-4-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 02:40:31PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Currently drivers get called to move a buffer, but if they have to
> move it temporarily through another space (SYSTEM->VRAM via TT)
> then they can end up with a lot of ttm->driver->ttm call stacks,
> if the temprorary space moves requires eviction.
> 
> Instead of letting the driver do all the placement/space for the
> temporary, allow it to report back (-EMULTIHOP) a placement (hop)
> to the move code, which will then do the temporary move, and the
> correct placement move afterwards.
> 
> This removes a lot of code from drivers, at the expense of
> adding some midlayering. I've some further ideas on how to turn
> it inside out, but I think this is a good solution to the call
> stack problems.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

So at first I freaked out about this a bit on irc, as in "this is horrible
midlayer madness". But it does look a lot cleaner, it's definitely a step
in the right direction, and I guess for most drivers it's going to be good
enough. Maybe there's going to be drivers which want to have even better
control over where buffers are placed, who's victimized, and what
intermediate steps to take. But doing that demidlayering can be done when
there's a need, I think all the building blocks with the in-flight
untangling are there now.

So I guess I like this now after the initial shock passed :-)
-Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 139 +++------------------
>  drivers/gpu/drm/drm_gem_vram_helper.c      |   3 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.c       | 115 +++--------------
>  drivers/gpu/drm/qxl/qxl_ttm.c              |   3 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c        | 122 +++---------------
>  drivers/gpu/drm/ttm/ttm_bo.c               |  62 +++++++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |   3 +-
>  include/drm/ttm/ttm_bo_driver.h            |   5 +-
>  8 files changed, 108 insertions(+), 344 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 62f9194b1dd1..0fd4f270d794 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -515,119 +515,6 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  	return r;
>  }
>  
> -/**
> - * amdgpu_move_vram_ram - Copy VRAM buffer to RAM buffer
> - *
> - * Called by amdgpu_bo_move().
> - */
> -static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
> -				struct ttm_operation_ctx *ctx,
> -				struct ttm_resource *new_mem)
> -{
> -	struct ttm_resource *old_mem = &bo->mem;
> -	struct ttm_resource tmp_mem;
> -	struct ttm_place placements;
> -	struct ttm_placement placement;
> -	int r;
> -
> -	/* create space/pages for new_mem in GTT space */
> -	tmp_mem = *new_mem;
> -	tmp_mem.mm_node = NULL;
> -	placement.num_placement = 1;
> -	placement.placement = &placements;
> -	placement.num_busy_placement = 1;
> -	placement.busy_placement = &placements;
> -	placements.fpfn = 0;
> -	placements.lpfn = 0;
> -	placements.mem_type = TTM_PL_TT;
> -	placements.flags = 0;
> -	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
> -	if (unlikely(r)) {
> -		pr_err("Failed to find GTT space for blit from VRAM\n");
> -		return r;
> -	}
> -
> -	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> -	if (unlikely(r))
> -		goto out_cleanup;
> -
> -	/* Bind the memory to the GTT space */
> -	r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
> -	if (unlikely(r)) {
> -		goto out_cleanup;
> -	}
> -
> -	/* blit VRAM to GTT */
> -	r = amdgpu_move_blit(bo, evict, &tmp_mem, old_mem);
> -	if (unlikely(r)) {
> -		goto out_cleanup;
> -	}
> -
> -	r = ttm_bo_wait_ctx(bo, ctx);
> -	if (unlikely(r))
> -		goto out_cleanup;
> -
> -	amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
> -	ttm_resource_free(bo, &bo->mem);
> -	ttm_bo_assign_mem(bo, new_mem);
> -out_cleanup:
> -	ttm_resource_free(bo, &tmp_mem);
> -	return r;
> -}
> -
> -/**
> - * amdgpu_move_ram_vram - Copy buffer from RAM to VRAM
> - *
> - * Called by amdgpu_bo_move().
> - */
> -static int amdgpu_move_ram_vram(struct ttm_buffer_object *bo, bool evict,
> -				struct ttm_operation_ctx *ctx,
> -				struct ttm_resource *new_mem)
> -{
> -	struct ttm_resource *old_mem = &bo->mem;
> -	struct ttm_resource tmp_mem;
> -	struct ttm_placement placement;
> -	struct ttm_place placements;
> -	int r;
> -
> -	/* make space in GTT for old_mem buffer */
> -	tmp_mem = *new_mem;
> -	tmp_mem.mm_node = NULL;
> -	placement.num_placement = 1;
> -	placement.placement = &placements;
> -	placement.num_busy_placement = 1;
> -	placement.busy_placement = &placements;
> -	placements.fpfn = 0;
> -	placements.lpfn = 0;
> -	placements.mem_type = TTM_PL_TT;
> -	placements.flags = 0;
> -	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
> -	if (unlikely(r)) {
> -		pr_err("Failed to find GTT space for blit to VRAM\n");
> -		return r;
> -	}
> -
> -	/* move/bind old memory to GTT space */
> -	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> -	if (unlikely(r))
> -		return r;
> -
> -	r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
> -	if (unlikely(r)) {
> -		goto out_cleanup;
> -	}
> -
> -	ttm_bo_assign_mem(bo, &tmp_mem);
> -	/* copy to VRAM */
> -	r = amdgpu_move_blit(bo, evict, new_mem, old_mem);
> -	if (unlikely(r)) {
> -		goto out_cleanup;
> -	}
> -out_cleanup:
> -	ttm_resource_free(bo, &tmp_mem);
> -	return r;
> -}
> -
>  /**
>   * amdgpu_mem_visible - Check that memory can be accessed by ttm_bo_move_memcpy
>   *
> @@ -659,13 +546,25 @@ static bool amdgpu_mem_visible(struct amdgpu_device *adev,
>   */
>  static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>  			  struct ttm_operation_ctx *ctx,
> -			  struct ttm_resource *new_mem)
> +			  struct ttm_resource *new_mem,
> +			  struct ttm_place *hop)
>  {
>  	struct amdgpu_device *adev;
>  	struct amdgpu_bo *abo;
>  	struct ttm_resource *old_mem = &bo->mem;
>  	int r;
>  
> +	if ((old_mem->mem_type == TTM_PL_SYSTEM &&
> +	     new_mem->mem_type == TTM_PL_VRAM) ||
> +	    (old_mem->mem_type == TTM_PL_VRAM &&
> +	     new_mem->mem_type == TTM_PL_SYSTEM)) {
> +		hop->fpfn = 0;
> +		hop->lpfn = 0;
> +		hop->mem_type = TTM_PL_TT;
> +		hop->flags = 0;
> +		return -EMULTIHOP;
> +	}
> +
>  	if (new_mem->mem_type == TTM_PL_TT) {
>  		r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, new_mem);
>  		if (r)
> @@ -719,16 +618,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>  		goto memcpy;
>  	}
>  
> -	if (old_mem->mem_type == TTM_PL_VRAM &&
> -	    new_mem->mem_type == TTM_PL_SYSTEM) {
> -		r = amdgpu_move_vram_ram(bo, evict, ctx, new_mem);
> -	} else if (old_mem->mem_type == TTM_PL_SYSTEM &&
> -		   new_mem->mem_type == TTM_PL_VRAM) {
> -		r = amdgpu_move_ram_vram(bo, evict, ctx, new_mem);
> -	} else {
> -		r = amdgpu_move_blit(bo, evict,
> -				     new_mem, old_mem);
> -	}
> +	r = amdgpu_move_blit(bo, evict,
> +			     new_mem, old_mem);
>  
>  	if (r) {
>  memcpy:
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 9da823eb0edd..c51096cc7fb2 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -965,7 +965,8 @@ static void bo_driver_delete_mem_notify(struct ttm_buffer_object *bo)
>  static int bo_driver_move(struct ttm_buffer_object *bo,
>  			  bool evict,
>  			  struct ttm_operation_ctx *ctx,
> -			  struct ttm_resource *new_mem)
> +			  struct ttm_resource *new_mem,
> +			  struct ttm_place *hop)
>  {
>  	struct drm_gem_vram_object *gbo;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index acff82afe260..623577412d19 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -862,96 +862,6 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
>  	NV_INFO(drm, "MM: using %s for buffer copies\n", name);
>  }
>  
> -static int
> -nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict,
> -		      struct ttm_operation_ctx *ctx,
> -		      struct ttm_resource *new_reg)
> -{
> -	struct ttm_place placement_memtype = {
> -		.fpfn = 0,
> -		.lpfn = 0,
> -		.mem_type = TTM_PL_TT,
> -		.flags = 0
> -	};
> -	struct ttm_placement placement;
> -	struct ttm_resource tmp_reg;
> -	int ret;
> -
> -	placement.num_placement = placement.num_busy_placement = 1;
> -	placement.placement = placement.busy_placement = &placement_memtype;
> -
> -	tmp_reg = *new_reg;
> -	tmp_reg.mm_node = NULL;
> -	ret = ttm_bo_mem_space(bo, &placement, &tmp_reg, ctx);
> -	if (ret)
> -		return ret;
> -
> -	ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> -	if (ret)
> -		goto out;
> -
> -	ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
> -	if (ret)
> -		goto out;
> -
> -	ret = nouveau_bo_move_m2mf(bo, true, ctx, &tmp_reg);
> -	if (ret)
> -		goto out;
> -
> -	ret = ttm_bo_wait_ctx(bo, ctx);
> -	if (ret)
> -		goto out;
> -
> -	nouveau_ttm_tt_unbind(bo->bdev, bo->ttm);
> -	ttm_resource_free(bo, &bo->mem);
> -	ttm_bo_assign_mem(bo, &tmp_reg);
> -out:
> -	ttm_resource_free(bo, &tmp_reg);
> -	return ret;
> -}
> -
> -static int
> -nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict,
> -		      struct ttm_operation_ctx *ctx,
> -		      struct ttm_resource *new_reg)
> -{
> -	struct ttm_place placement_memtype = {
> -		.fpfn = 0,
> -		.lpfn = 0,
> -		.mem_type = TTM_PL_TT,
> -		.flags = 0
> -	};
> -	struct ttm_placement placement;
> -	struct ttm_resource tmp_reg;
> -	int ret;
> -
> -	placement.num_placement = placement.num_busy_placement = 1;
> -	placement.placement = placement.busy_placement = &placement_memtype;
> -
> -	tmp_reg = *new_reg;
> -	tmp_reg.mm_node = NULL;
> -	ret = ttm_bo_mem_space(bo, &placement, &tmp_reg, ctx);
> -	if (ret)
> -		return ret;
> -
> -	ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> -	if (unlikely(ret != 0))
> -		return ret;
> -
> -	ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
> -	if (unlikely(ret != 0))
> -		return ret;
> -
> -	ttm_bo_assign_mem(bo, &tmp_reg);
> -	ret = nouveau_bo_move_m2mf(bo, true, ctx, new_reg);
> -	if (ret)
> -		goto out;
> -
> -out:
> -	ttm_resource_free(bo, &tmp_reg);
> -	return ret;
> -}
> -
>  static void
>  nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
>  		     struct ttm_resource *new_reg)
> @@ -1024,7 +934,8 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
>  static int
>  nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>  		struct ttm_operation_ctx *ctx,
> -		struct ttm_resource *new_reg)
> +		struct ttm_resource *new_reg,
> +		struct ttm_place *hop)
>  {
>  	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>  	struct nouveau_bo *nvbo = nouveau_bo(bo);
> @@ -1032,6 +943,17 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>  	struct nouveau_drm_tile *new_tile = NULL;
>  	int ret = 0;
>  
> +	if ((old_reg->mem_type == TTM_PL_SYSTEM &&
> +	     new_reg->mem_type == TTM_PL_VRAM) ||
> +	    (old_reg->mem_type == TTM_PL_VRAM &&
> +	     new_reg->mem_type == TTM_PL_SYSTEM)) {
> +		hop->fpfn = 0;
> +		hop->lpfn = 0;
> +		hop->mem_type = TTM_PL_TT;
> +		hop->flags = 0;
> +		return -EMULTIHOP;
> +	}
> +
>  	if (new_reg->mem_type == TTM_PL_TT) {
>  		ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, new_reg);
>  		if (ret)
> @@ -1074,15 +996,8 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>  
>  	/* Hardware assisted copy. */
>  	if (drm->ttm.move) {
> -		if (new_reg->mem_type == TTM_PL_SYSTEM)
> -			ret = nouveau_bo_move_flipd(bo, evict, ctx,
> -						    new_reg);
> -		else if (old_reg->mem_type == TTM_PL_SYSTEM)
> -			ret = nouveau_bo_move_flips(bo, evict, ctx,
> -						    new_reg);
> -		else
> -			ret = nouveau_bo_move_m2mf(bo, evict, ctx,
> -						   new_reg);
> +		ret = nouveau_bo_move_m2mf(bo, evict, ctx,
> +					   new_reg);
>  		if (!ret)
>  			goto out;
>  	}
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index b52a4563b47b..103e4f248f37 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -141,7 +141,8 @@ static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
>  
>  static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
>  		       struct ttm_operation_ctx *ctx,
> -		       struct ttm_resource *new_mem)
> +		       struct ttm_resource *new_mem,
> +		       struct ttm_place *hop)
>  {
>  	struct ttm_resource *old_mem = &bo->mem;
>  	int ret;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 321c09d20c6c..ddb04a2dc25f 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -207,110 +207,27 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
>  	return r;
>  }
>  
> -static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
> -				bool evict,
> -				struct ttm_operation_ctx *ctx,
> -				struct ttm_resource *new_mem)
> -{
> -	struct ttm_resource *old_mem = &bo->mem;
> -	struct ttm_resource tmp_mem;
> -	struct ttm_place placements;
> -	struct ttm_placement placement;
> -	int r;
> -
> -	tmp_mem = *new_mem;
> -	tmp_mem.mm_node = NULL;
> -	placement.num_placement = 1;
> -	placement.placement = &placements;
> -	placement.num_busy_placement = 1;
> -	placement.busy_placement = &placements;
> -	placements.fpfn = 0;
> -	placements.lpfn = 0;
> -	placements.mem_type = TTM_PL_TT;
> -	placements.flags = 0;
> -	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
> -	if (unlikely(r)) {
> -		return r;
> -	}
> -
> -	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> -	if (unlikely(r)) {
> -		goto out_cleanup;
> -	}
> -
> -	r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
> -	if (unlikely(r)) {
> -		goto out_cleanup;
> -	}
> -	r = radeon_move_blit(bo, true, &tmp_mem, old_mem);
> -	if (unlikely(r)) {
> -		goto out_cleanup;
> -	}
> -	r = ttm_bo_wait_ctx(bo, ctx);
> -	if (unlikely(r))
> -		goto out_cleanup;
> -
> -	radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
> -	ttm_resource_free(bo, &bo->mem);
> -	ttm_bo_assign_mem(bo, new_mem);
> -out_cleanup:
> -	ttm_resource_free(bo, &tmp_mem);
> -	return r;
> -}
> -
> -static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
> -				bool evict,
> -				struct ttm_operation_ctx *ctx,
> -				struct ttm_resource *new_mem)
> -{
> -	struct ttm_resource *old_mem = &bo->mem;
> -	struct ttm_resource tmp_mem;
> -	struct ttm_placement placement;
> -	struct ttm_place placements;
> -	int r;
> -
> -	tmp_mem = *new_mem;
> -	tmp_mem.mm_node = NULL;
> -	placement.num_placement = 1;
> -	placement.placement = &placements;
> -	placement.num_busy_placement = 1;
> -	placement.busy_placement = &placements;
> -	placements.fpfn = 0;
> -	placements.lpfn = 0;
> -	placements.mem_type = TTM_PL_TT;
> -	placements.flags = 0;
> -	r = ttm_bo_mem_space(bo, &placement, &tmp_mem, ctx);
> -	if (unlikely(r)) {
> -		return r;
> -	}
> -
> -	r = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> -	if (unlikely(r))
> -		goto out_cleanup;
> -
> -	r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
> -	if (unlikely(r))
> -		goto out_cleanup;
> -
> -	ttm_bo_assign_mem(bo, &tmp_mem);
> -	r = radeon_move_blit(bo, true, new_mem, old_mem);
> -	if (unlikely(r)) {
> -		goto out_cleanup;
> -	}
> -out_cleanup:
> -	ttm_resource_free(bo, &tmp_mem);
> -	return r;
> -}
> -
>  static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>  			  struct ttm_operation_ctx *ctx,
> -			  struct ttm_resource *new_mem)
> +			  struct ttm_resource *new_mem,
> +			  struct ttm_place *hop)
>  {
>  	struct radeon_device *rdev;
>  	struct radeon_bo *rbo;
>  	struct ttm_resource *old_mem = &bo->mem;
>  	int r;
>  
> +	if ((old_mem->mem_type == TTM_PL_SYSTEM &&
> +	     new_mem->mem_type == TTM_PL_VRAM) ||
> +	    (old_mem->mem_type == TTM_PL_VRAM &&
> +	     new_mem->mem_type == TTM_PL_SYSTEM)) {
> +		hop->fpfn = 0;
> +		hop->lpfn = 0;
> +		hop->mem_type = TTM_PL_TT;
> +		hop->flags = 0;
> +		return -EMULTIHOP;
> +	}
> +
>  	if (new_mem->mem_type == TTM_PL_TT) {
>  		r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, new_mem);
>  		if (r)
> @@ -351,17 +268,8 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>  		goto memcpy;
>  	}
>  
> -	if (old_mem->mem_type == TTM_PL_VRAM &&
> -	    new_mem->mem_type == TTM_PL_SYSTEM) {
> -		r = radeon_move_vram_ram(bo, evict, ctx, new_mem);
> -	} else if (old_mem->mem_type == TTM_PL_SYSTEM &&
> -		   new_mem->mem_type == TTM_PL_VRAM) {
> -		r = radeon_move_ram_vram(bo, evict, ctx, new_mem);
> -	} else {
> -		r = radeon_move_blit(bo, evict,
> -				     new_mem, old_mem);
> -	}
> -
> +	r = radeon_move_blit(bo, evict,
> +			     new_mem, old_mem);
>  	if (r) {
>  memcpy:
>  		r = ttm_bo_move_memcpy(bo, ctx, new_mem);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 5b411252a857..a8830fdf8bc6 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -231,7 +231,8 @@ EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
>  
>  static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>  				  struct ttm_resource *mem, bool evict,
> -				  struct ttm_operation_ctx *ctx)
> +				  struct ttm_operation_ctx *ctx,
> +				  struct ttm_place *hop)
>  {
>  	struct ttm_bo_device *bdev = bo->bdev;
>  	struct ttm_resource_manager *old_man = ttm_manager_type(bdev, bo->mem.mem_type);
> @@ -259,9 +260,12 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>  		}
>  	}
>  
> -	ret = bdev->driver->move(bo, evict, ctx, mem);
> -	if (ret)
> +	ret = bdev->driver->move(bo, evict, ctx, mem, hop);
> +	if (ret) {
> +		if (ret == -EMULTIHOP)
> +			return ret;
>  		goto out_err;
> +	}
>  
>  	ctx->bytes_moved += bo->num_pages << PAGE_SHIFT;
>  	return 0;
> @@ -596,7 +600,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>  		goto out;
>  	}
>  
> -	ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, ctx);
> +	ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, ctx, NULL);
>  	if (unlikely(ret)) {
>  		if (ret != -ERESTARTSYS)
>  			pr_err("Buffer eviction failed\n");
> @@ -936,11 +940,39 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>  }
>  EXPORT_SYMBOL(ttm_bo_mem_space);
>  
> +static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
> +				     struct ttm_resource *mem,
> +				     struct ttm_operation_ctx *ctx,
> +				     struct ttm_place *hop)
> +{
> +	struct ttm_placement hop_placement;
> +	int ret;
> +	struct ttm_resource hop_mem = *mem;
> +
> +	hop_mem.mm_node = NULL;
> +	hop_mem.mem_type = TTM_PL_SYSTEM;
> +	hop_mem.placement = 0;
> +
> +	hop_placement.num_placement = hop_placement.num_busy_placement = 1;
> +	hop_placement.placement = hop_placement.busy_placement = hop;
> +
> +	/* find space in the bounce domain */
> +	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
> +	if (ret)
> +		return ret;
> +	/* move to the bounce domain */
> +	ret = ttm_bo_handle_move_mem(bo, &hop_mem, false, ctx, NULL);
> +	if (ret)
> +		return ret;
> +	return 0;
> +}
> +
>  static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>  			      struct ttm_placement *placement,
>  			      struct ttm_operation_ctx *ctx)
>  {
>  	int ret = 0;
> +	struct ttm_place hop = {};
>  	struct ttm_resource mem;
>  
>  	dma_resv_assert_held(bo->base.resv);
> @@ -954,12 +986,25 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>  
>  	/*
>  	 * Determine where to move the buffer.
> +	 *
> +	 * If driver determines move is going to need
> +	 * an extra step then it will return -EMULTIHOP
> +	 * and the buffer will be moved to the temporary
> +	 * stop and the driver will be called to make
> +	 * the second hop.
>  	 */
> +bounce:
>  	ret = ttm_bo_mem_space(bo, placement, &mem, ctx);
>  	if (ret)
> -		goto out_unlock;
> -	ret = ttm_bo_handle_move_mem(bo, &mem, false, ctx);
> -out_unlock:
> +		return ret;
> +	ret = ttm_bo_handle_move_mem(bo, &mem, false, ctx, &hop);
> +	if (ret == -EMULTIHOP) {
> +		ret = ttm_bo_bounce_temp_buffer(bo, &mem, ctx, &hop);
> +		if (ret)
> +			return ret;
> +		/* try and move to final place now. */
> +		goto bounce;
> +	}
>  	if (ret)
>  		ttm_resource_free(bo, &mem);
>  	return ret;
> @@ -1435,7 +1480,7 @@ int ttm_bo_swapout(struct ttm_operation_ctx *ctx)
>  		evict_mem.placement = 0;
>  		evict_mem.mem_type = TTM_PL_SYSTEM;
>  
> -		ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, &ctx);
> +		ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, &ctx, NULL);
>  		if (unlikely(ret != 0))
>  			goto out;
>  	}
> @@ -1481,4 +1526,3 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>  	ttm_tt_destroy(bo->bdev, bo->ttm);
>  	bo->ttm = NULL;
>  }
> -
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 88be48ad0344..d48b70605a56 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -731,7 +731,8 @@ static void vmw_swap_notify(struct ttm_buffer_object *bo)
>  static int vmw_move(struct ttm_buffer_object *bo,
>  		    bool evict,
>  		    struct ttm_operation_ctx *ctx,
> -		    struct ttm_resource *new_mem)
> +		    struct ttm_resource *new_mem,
> +		    struct ttm_place *hop)
>  {
>  	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
>  	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 29f6a1d1c853..e4eab7a45ace 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -133,12 +133,15 @@ struct ttm_bo_driver {
>  	 * the graphics address space
>  	 * @ctx: context for this move with parameters
>  	 * @new_mem: the new memory region receiving the buffer
> +	 @ @hop: placement for driver directed intermediate hop
>  	 *
>  	 * Move a buffer between two memory regions.
> +	 * Returns errno -EMULTIHOP if driver requests a hop
>  	 */
>  	int (*move)(struct ttm_buffer_object *bo, bool evict,
>  		    struct ttm_operation_ctx *ctx,
> -		    struct ttm_resource *new_mem);
> +		    struct ttm_resource *new_mem,
> +		    struct ttm_place *hop);
>  
>  	/**
>  	 * struct ttm_bo_driver_member verify_access
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
