Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D144F5DE8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 14:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226C310E391;
	Wed,  6 Apr 2022 12:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1A210E391
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 12:41:33 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id yy13so4033793ejb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 05:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YFMZOoScls27n8DuvhAjFn7iWa+a0ZJvOd/jyQ1mcBU=;
 b=SkF2rqpdAstldafOVF/uTosbnFa2epIZJ3RX1CI3xjkQE8OJ0WUhE0pQlwtbsz0mhO
 elbw0VKHFTT8YSUj7JV6YK9ElQ2dH/sR8Z/Y0zvzr2PMbqdR7PJhbrtwCAUwShF8OdeW
 mZUtQoQZSxN2gROojlqDpDkOFJdfPBdorzLP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YFMZOoScls27n8DuvhAjFn7iWa+a0ZJvOd/jyQ1mcBU=;
 b=4Kd+OKehMsnPhBXpF/XSfymIK6qz4Df47WsUgOOyAsQsgK+LFK4Qmat2Od/oX0OpyX
 QWNud3hrND3AcW7CRHj+4eSYHrj8io6lisRUsnI3Ku7cbb8s8+H1E9BoVJpC1LofDcIH
 xfMgrkndv/ftALLy5EC0Ga0hKhg41Yr7QNnyQNzRNUxKo2xpAS4+Nwotv9swNr8mAP+8
 HsMvG2FSukCvZTXNaJBKg1LyPVMxd78k7YYR4Cls1Y6gqAbWVLcRpjTllj2n9uC0BENJ
 iCqcZRyQ2hi+N9WHRzMP3GdJHMxmU9zB5hnbmQ6ixIdXTk6xTVXidLi6o7EJEq4XzWfw
 d9Mw==
X-Gm-Message-State: AOAM5314eTbDRpz8RTJDGLuC+JBsVrYyKgHqhU6yGwjMIMuFFVahlVEM
 DILnscqNRJ1jmQFewi9olZU1IQ==
X-Google-Smtp-Source: ABdhPJwbViQrR55s0SrwYaH/smRjJUTBarlQA8zLpp66ciy49zBBK+1FJLTxEfO5jg+juBSg2IizPQ==
X-Received: by 2002:a17:907:b590:b0:6cf:48a4:9a4c with SMTP id
 qx16-20020a170907b59000b006cf48a49a4cmr7901444ejc.6.1649248891781; 
 Wed, 06 Apr 2022 05:41:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a170906505600b006da7d71f25csm6539491ejk.41.2022.04.06.05.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 05:41:31 -0700 (PDT)
Date: Wed, 6 Apr 2022 14:41:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DMA-resvusage@phenom.ffwll.local
Subject: Re: [PATCH 05/16] dma-buf: add DMA_RESV_USAGE_KERNEL v3
Message-ID: <Yk2KecuuSVhXHHKs@phenom.ffwll.local>
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406075132.3263-6-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 09:51:21AM +0200, Christian König wrote:
> Add an usage for kernel submissions. Waiting for those are mandatory for
> dynamic DMA-bufs.
> 
> As a precaution this patch also changes all occurrences where fences are
> added as part of memory management in TTM, VMWGFX and i915 to use the
> new value because it now becomes possible for drivers to ignore fences
> with the WRITE usage.
> 
> v2: use "must" in documentation, fix whitespaces
> v3: separate out some driver changes and better document why some
>     changes should still be part of this patch.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c                  |  2 +-
>  drivers/dma-buf/st-dma-resv.c               |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo_util.c           |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  2 +-
>  include/linux/dma-resv.h                    | 24 ++++++++++++++++++---
>  7 files changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 378d47e1cfea..f4860e5f2d8b 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -726,7 +726,7 @@ EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
>   */
>  void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq)
>  {
> -	static const char *usage[] = { "write", "read" };
> +	static const char *usage[] = { "kernel", "write", "read" };
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
>  
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index d0f7c2bfd4f0..062b57d63fa6 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -296,7 +296,7 @@ int dma_resv(void)
>  	int r;
>  
>  	spin_lock_init(&fence_lock);
> -	for (usage = DMA_RESV_USAGE_WRITE; usage <= DMA_RESV_USAGE_READ;
> +	for (usage = DMA_RESV_USAGE_KERNEL; usage <= DMA_RESV_USAGE_READ;
>  	     ++usage) {
>  		r = subtests(tests, (void *)(unsigned long)usage);
>  		if (r)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> index f5f2b8b115ea..0512afdd20d8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> @@ -117,7 +117,7 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
>  						i915_fence_timeout(i915),
>  						I915_FENCE_GFP);
>  		dma_resv_add_fence(obj->base.resv, &clflush->base.dma,
> -				   DMA_RESV_USAGE_WRITE);
> +				   DMA_RESV_USAGE_KERNEL);
>  		dma_fence_work_commit(&clflush->base);
>  		/*
>  		 * We must have successfully populated the pages(since we are
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index d74f9eea855e..6bf3fb1c8045 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -739,7 +739,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>  		return ret;
>  	}
>  
> -	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_WRITE);
> +	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
>  
>  	ret = dma_resv_reserve_fences(bo->base.resv, 1);
>  	if (unlikely(ret)) {
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 7a96a1db13a7..99deb45894f4 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -508,7 +508,7 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
>  		return ret;
>  
>  	dma_resv_add_fence(&ghost_obj->base._resv, fence,
> -			   DMA_RESV_USAGE_WRITE);
> +			   DMA_RESV_USAGE_KERNEL);
>  
>  	/**
>  	 * If we're not moving to fixed memory, the TTM object
> @@ -562,7 +562,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>  	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
>  	int ret = 0;
>  
> -	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_WRITE);
> +	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
>  	if (!evict)
>  		ret = ttm_bo_move_to_ghost(bo, fence, man->use_tt);
>  	else if (!from->use_tt && pipeline)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index bec50223efe5..408ede1f967f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -759,7 +759,7 @@ void vmw_bo_fence_single(struct ttm_buffer_object *bo,
>  	ret = dma_resv_reserve_fences(bo->base.resv, 1);
>  	if (!ret)
>  		dma_resv_add_fence(bo->base.resv, &fence->base,
> -				   DMA_RESV_USAGE_WRITE);
> +				   DMA_RESV_USAGE_KERNEL);
>  	else
>  		/* Last resort fallback when we are OOM */
>  		dma_fence_wait(&fence->base, false);
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 7bb7e7edbb6f..a749f229ae91 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -55,11 +55,29 @@ struct dma_resv_list;
>   * This enum describes the different use cases for a dma_resv object and
>   * controls which fences are returned when queried.
>   *
> - * An important fact is that there is the order WRITE<READ and when the
> - * dma_resv object is asked for fences for one use case the fences for the
> - * lower use case are returned as well.
> + * An important fact is that there is the order KERNEL<WRITE<READ and
> + * when the dma_resv object is asked for fences for one use case the fences
> + * for the lower use case are returned as well.
> + *
> + * For example when asking for WRITE fences then the KERNEL fences are returned
> + * as well. Similar when asked for READ fences then both WRITE and KERNEL
> + * fences are returned as well.
>   */
>  enum dma_resv_usage {
> +	/**
> +	 * @DMA_RESV_USAGE_KERNEL: For in kernel memory management only.
> +	 *
> +	 * This should only be used for things like copying or clearing memory
> +	 * with a DMA hardware engine for the purpose of kernel memory
> +	 * management.
> +	 *
> +	 * Drivers *always* must wait for those fences before accessing the
> +	 * resource protected by the dma_resv object. The only exception for
> +	 * that is when the resource is known to be locked down in place by
> +	 * pinning it previously.
> +	 */
> +	DMA_RESV_USAGE_KERNEL,
> +
>  	/**
>  	 * @DMA_RESV_USAGE_WRITE: Implicit write synchronization.
>  	 *
> -- 
> 2.25.1

All the functional changes in drivers make sense to me now.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
