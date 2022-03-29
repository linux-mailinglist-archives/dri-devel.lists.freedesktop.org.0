Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01E4EB122
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 17:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC4E10E8BE;
	Tue, 29 Mar 2022 15:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A13F10E8CC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 15:57:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a1so25472881wrh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uEDMfqAno8QNOQAOu5TceOz4HuNLgVWJ0BNZIybhuE8=;
 b=aLVvL+jUDHXnvMmh9LJeWAmtuPkUalKtpqPc1inVnxs036FypCNUmbsLMSmNSOX4Sl
 6Z603jZWzsv4O98HGMzzpoxEQyIMrsK7/2uAlU3CFVyXBJ6jOHRKgO5vxTh8LRtFXg9q
 Nq5MFmPDTDqyOz0jFhvwPgcTDzX+SVijUa7kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uEDMfqAno8QNOQAOu5TceOz4HuNLgVWJ0BNZIybhuE8=;
 b=N9Jw4KNrB2id+SljMcHEquViE7GeVjrIFyAHVqR+R7bCreLvmPn8nseVKvU5kaY9rB
 WsZM8Lv00PiRYGQl+cquKuBAJNZzX0jpW25rLtax4eu5navgeY9CPOV8c1Y8WaZpuF+P
 XvJQevvPrVqdBFj4KIZ6JSDe2DffaZh4I5gkzh0JRIUgvh1dwSoXmevJKzHCTQYIIA7z
 hyR3MjE5+tmhBvm9r26c+kp/QlTLZQuRfzA7bwUGwVNlKR/gaWpPCdxutfoztf4YBkfe
 KvfKrpgQTUBK8oioxQDfaUHD9J1awO2lI4C5nXgn2I+dj6yvRIFnpNpGB7vhDoMGxIMa
 6Z/Q==
X-Gm-Message-State: AOAM533XsnSHR8jQ8h5PrrlUelRJ7unx/gXKGH7xb9/mOnEsG5FoiKs7
 JUWJK7+R3oqa9Cgs1ENnD58iGA==
X-Google-Smtp-Source: ABdhPJxNamnWXBFwTS1OKQMwEBR142kBagD22eiBnjW/P60N7FoUC/KZ6dBPtk5MNvzvspElpSBwpQ==
X-Received: by 2002:a5d:4245:0:b0:203:dc49:2604 with SMTP id
 s5-20020a5d4245000000b00203dc492604mr33361129wrr.32.1648569435971; 
 Tue, 29 Mar 2022 08:57:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b0038cfb1a43d6sm2577729wmr.24.2022.03.29.08.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 08:57:15 -0700 (PDT)
Date: Tue, 29 Mar 2022 17:57:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 22/23] drm/i915: drop bo->moving dependency
Message-ID: <YkMsWU7Ba1UL/ZlZ@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-22-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135856.1331-22-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 02:58:55PM +0100, Christian König wrote:
> That should now be handled by the common dma_resv framework.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: intel-gfx@lists.freedesktop.org

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c   | 29 ++++++--------------
>  drivers/gpu/drm/i915/gem/i915_gem_object.h   |  5 ++--
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 15 +---------
>  drivers/gpu/drm/i915/i915_vma.c              |  9 +++++-
>  4 files changed, 19 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index d87b508b59b1..fd240435ffef 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -742,18 +742,19 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
>  /**
>   * i915_gem_object_get_moving_fence - Get the object's moving fence if any
>   * @obj: The object whose moving fence to get.
> + * @fence: The resulting fence
>   *
>   * A non-signaled moving fence means that there is an async operation
>   * pending on the object that needs to be waited on before setting up
>   * any GPU- or CPU PTEs to the object's pages.
>   *
> - * Return: A refcounted pointer to the object's moving fence if any,
> - * NULL otherwise.
> + * Return: Negative error code or 0 for success.
>   */
> -struct dma_fence *
> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
> +				     struct dma_fence **fence)
>  {
> -	return dma_fence_get(i915_gem_to_ttm(obj)->moving);
> +	return dma_resv_get_singleton(obj->base.resv, DMA_RESV_USAGE_KERNEL,
> +				      fence);
>  }
>  
>  /**
> @@ -771,23 +772,9 @@ i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
>  int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>  				      bool intr)
>  {
> -	struct dma_fence *fence = i915_gem_to_ttm(obj)->moving;
> -	int ret;
> -
>  	assert_object_held(obj);
> -	if (!fence)
> -		return 0;
> -
> -	ret = dma_fence_wait(fence, intr);
> -	if (ret)
> -		return ret;
> -
> -	if (fence->error)
> -		return fence->error;
> -
> -	i915_gem_to_ttm(obj)->moving = NULL;
> -	dma_fence_put(fence);
> -	return 0;
> +	return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
> +				     intr, MAX_SCHEDULE_TIMEOUT);
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index f66d46882ea7..be57af8bfb31 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -521,9 +521,8 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
>  	i915_gem_object_unpin_pages(obj);
>  }
>  
> -struct dma_fence *
> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
> -
> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
> +				     struct dma_fence **fence);
>  int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>  				      bool intr);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index e4a232e22f9d..4d5d0cd64f23 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -452,19 +452,6 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
>  	return fence;
>  }
>  
> -static int
> -prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> -	  struct i915_deps *deps)
> -{
> -	int ret;
> -
> -	ret = i915_deps_add_dependency(deps, bo->moving, ctx);
> -	if (!ret)
> -		ret = i915_deps_add_resv(deps, bo->base.resv, ctx);
> -
> -	return ret;
> -}
> -
>  /**
>   * i915_ttm_move - The TTM move callback used by i915.
>   * @bo: The buffer object.
> @@ -519,7 +506,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>  		struct i915_deps deps;
>  
>  		i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
> -		ret = prev_deps(bo, ctx, &deps);
> +		ret = i915_deps_add_resv(&deps, bo->base.resv, ctx);
>  		if (ret) {
>  			i915_refct_sgt_put(dst_rsgt);
>  			return ret;
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 52fd6705a518..8737159f4706 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1247,10 +1247,17 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  	if (err)
>  		return err;
>  
> +	if (vma->obj) {
> +		err = i915_gem_object_get_moving_fence(vma->obj, &moving);
> +		if (err)
> +			return err;
> +	} else {
> +		moving = NULL;
> +	}
> +
>  	if (flags & PIN_GLOBAL)
>  		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
>  
> -	moving = vma->obj ? i915_gem_object_get_moving_fence(vma->obj) : NULL;
>  	if (flags & vma->vm->bind_async_flags || moving) {
>  		/* lock VM */
>  		err = i915_vm_lock_objects(vma->vm, ww);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
