Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69E2AD8EE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 15:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FCD89AB9;
	Tue, 10 Nov 2020 14:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C8D89AB9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 14:38:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 23so12897015wrc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 06:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q0r5qwuurGTtMotrgPOXSQIGm7QuobkCW5f+HQqa3gI=;
 b=BM9LwHbxU2UNjz2YTSpsRUYQJwAt2Xf3ndi1f8i9vSRbttfa+UZRXgQYYBoZKa5n5L
 i8SfSQjDQXHCDLhn3G40V4/lZ02NkVNoGdufnpLoC1MvbwMKkdY9Fcrk5bipm/nDmKl2
 +O7paUwBRxee2zc7hYC+lAO/bbHFrOjw3zggQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q0r5qwuurGTtMotrgPOXSQIGm7QuobkCW5f+HQqa3gI=;
 b=cGcQ6lVFNlJ101g2niSb5ZipauQBpWhn4tUGbfQi4uMBO4YY4HCHRdqk/OwTE+h/OR
 yefakB1JBqOwL6t8LXqNc2uy3oISHVdcK4j0aj6SF1M1rH4lcV393Zkdvb9I7XafsLtx
 DK8bRUF6eX+gPx7zfJm8o2FL86cm6IMeXqhwNHM5EP+CunRljLY5rl0q8QAZ6CAl3KZH
 l/fDRW1RfPNftd546ohfkt8VQoMLW+xyp+/iyWD253psgUq0ABzr/yWNjyAfZR189XL5
 6oTXoGcE7xZpLeKDXWJhRGRCcCSGEhGd+LrRS3hzUb3gZFWBFaAif6qqna2XWHuneReq
 SotQ==
X-Gm-Message-State: AOAM533zMLX8Ji8cUdIzFjp7xaqvhYAbNDqEwejch3jmtwAhfCV05Yum
 kmVNKVQ9FX3CkAVFXkWAa0qJjA==
X-Google-Smtp-Source: ABdhPJyVxA2Z458++KZ7iFo739dPx+YP1JlM0BNlp8MK8XJ7QZmOBKHQRSsslvr//CYjIxbe5uCDng==
X-Received: by 2002:adf:edc5:: with SMTP id v5mr23805565wro.112.1605019085375; 
 Tue, 10 Nov 2020 06:38:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w11sm3410177wmg.36.2020.11.10.06.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 06:38:04 -0800 (PST)
Date: Tue, 10 Nov 2020 15:38:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 2/4] drm/amdgpu/ttm: use multihop
Message-ID: <20201110143802.GL401619@phenom.ffwll.local>
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-3-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109005432.861936-3-airlied@gmail.com>
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

On Mon, Nov 09, 2020 at 10:54:30AM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This removes the code to move resources directly between
> SYSTEM and VRAM in favour of using the core ttm mulithop code.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 136 +++---------------------
>  1 file changed, 13 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index ce0d82802333..e1458d575aa9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -512,119 +512,6 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
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
> @@ -664,6 +551,17 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
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

Helper for this might be neat, but total overkill. Like ttm_insert_tt_hop
and you pass the 2 other mem_types. Or maybe fully parametrized with
ttm_insert_hop:

	if (ttm_insert_tt_hope(old_mem, new_mem, TTM_PL_SYSTEM,
			TTM_PL_VRAM, hope))
		return -EMULTIPHOP;

Anyway real big bikeshed this one :-) Since Christian already checked the
details for the 3 driver patches from me just

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

on those three.
-Daniel

> +	}
> +
>  	if (new_mem->mem_type == TTM_PL_TT) {
>  		r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, new_mem);
>  		if (r)
> @@ -717,16 +615,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
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
