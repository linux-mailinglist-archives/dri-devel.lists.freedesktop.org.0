Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A6847D89A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028F410E263;
	Wed, 22 Dec 2021 21:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2665F10E263
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:13:24 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id bm14so13479396edb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4N9dl2DiDWMzSA/M/e16oaDz3lPQeFUTxmhThb+1lJs=;
 b=RfflxoalWQ5fQmXA7oAU1a/53HgvzRvOCnSWhJuPyvQ4joNsvhoeYpFzFBM4WA/ADT
 0SX7FHWiNb34AHZg87Gbpn6ZPZLBqex/72DOvI3VpfSKJYv5o+lBgtlSpGtdt2NXEvf4
 /ovKhmURM3dfSdVKRun1B6aRKgbvRCuwOETHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4N9dl2DiDWMzSA/M/e16oaDz3lPQeFUTxmhThb+1lJs=;
 b=Dyt61CztKHx/cY500N9SGOOae6fg466ZlpPI7HWYu2mLkqhrsKM0WaQkjZLH04qR55
 3HcL9ro/xa9bpTV5Z63HHBZX4x1r3Z9sGh/coPe4dUxJupWBpRK6jguePHyoqu9WG+vR
 Z1e4Vqn/tZNW5SsxzMKsLT6nzYYFZ7Ozj8K9sISW5oBryjm7ibkQ3rkAt2J2LFYiVYHd
 1lvwZ8ffgcwOqgSlXKsyG4JW/OCYdC2hsskdiK+HgS9cCSzpmQZpO7h6sLmLGYjNw0Pp
 5jMWmYWehFyx5fc26819vZzussGGSMTqtv9vdiafqjgfU2R5ue5cvBaEZuCniMBaC+Y6
 o/eA==
X-Gm-Message-State: AOAM530CkpCHkPa8p9lEbUxFWXMZICheDn7Z5q2Eg1RivZ6AtoC+8qhz
 n+ZyeSwnrYlSACJGJyehgusE8Q==
X-Google-Smtp-Source: ABdhPJwuZUIVeo1LKXQnEDdj5Oi/LBPTPxhNyyiNXANmjCVEhiQX8zHmyLKD3pkyqrV5t4EQJKvkUQ==
X-Received: by 2002:a17:906:1c0e:: with SMTP id
 k14mr3779926ejg.670.1640207602630; 
 Wed, 22 Dec 2021 13:13:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r8sm294325edd.74.2021.12.22.13.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:13:22 -0800 (PST)
Date: Wed, 22 Dec 2021 22:13:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 03/24] dma-buf: drop excl_fence parameter from
 dma_resv_get_fences
Message-ID: <YcOU8CJq83TzaD1+@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-4-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 01:33:50PM +0100, Christian König wrote:
> Returning the exclusive fence separately is no longer used.
> 
> Instead add a write parameter to indicate the use case.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c                   | 48 ++++++++------------
>  drivers/dma-buf/st-dma-resv.c                | 26 ++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c  |  6 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c      |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  3 +-
>  include/linux/dma-resv.h                     |  4 +-
>  6 files changed, 31 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index a12a3a39f280..480c305554a1 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -611,57 +611,45 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
>   * dma_resv_get_fences - Get an object's shared and exclusive
>   * fences without update side lock held
>   * @obj: the reservation object
> - * @fence_excl: the returned exclusive fence (or NULL)
> - * @shared_count: the number of shared fences returned
> - * @shared: the array of shared fence ptrs returned (array is krealloc'd to
> - * the required size, and must be freed by caller)
> - *
> - * Retrieve all fences from the reservation object. If the pointer for the
> - * exclusive fence is not specified the fence is put into the array of the
> - * shared fences as well. Returns either zero or -ENOMEM.
> + * @write: true if we should return all fences

I'm assuming that this will be properly documented later on in the series
...

> + * @num_fences: the number of fences returned
> + * @fences: the array of fence ptrs returned (array is krealloc'd to the
> + * required size, and must be freed by caller)
> + *
> + * Retrieve all fences from the reservation object.
> + * Returns either zero or -ENOMEM.
>   */
> -int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **fence_excl,
> -			unsigned int *shared_count, struct dma_fence ***shared)
> +int dma_resv_get_fences(struct dma_resv *obj, bool write,
> +			unsigned int *num_fences, struct dma_fence ***fences)
>  {
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
>  
> -	*shared_count = 0;
> -	*shared = NULL;
> -
> -	if (fence_excl)
> -		*fence_excl = NULL;
> +	*num_fences = 0;
> +	*fences = NULL;
>  
> -	dma_resv_iter_begin(&cursor, obj, true);
> +	dma_resv_iter_begin(&cursor, obj, write);
>  	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>  
>  		if (dma_resv_iter_is_restarted(&cursor)) {
>  			unsigned int count;
>  
> -			while (*shared_count)
> -				dma_fence_put((*shared)[--(*shared_count)]);
> +			while (*num_fences)
> +				dma_fence_put((*fences)[--(*num_fences)]);
>  
> -			if (fence_excl)
> -				dma_fence_put(*fence_excl);
> -
> -			count = cursor.shared_count;
> -			count += fence_excl ? 0 : 1;
> +			count = cursor.shared_count + 1;
>  
>  			/* Eventually re-allocate the array */
> -			*shared = krealloc_array(*shared, count,
> +			*fences = krealloc_array(*fences, count,
>  						 sizeof(void *),
>  						 GFP_KERNEL);
> -			if (count && !*shared) {
> +			if (count && !*fences) {
>  				dma_resv_iter_end(&cursor);
>  				return -ENOMEM;
>  			}
>  		}
>  
> -		dma_fence_get(fence);
> -		if (dma_resv_iter_is_exclusive(&cursor) && fence_excl)
> -			*fence_excl = fence;
> -		else
> -			(*shared)[(*shared_count)++] = fence;
> +		(*fences)[(*num_fences)++] = dma_fence_get(fence);
>  	}
>  	dma_resv_iter_end(&cursor);
>  
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index bc32b3eedcb6..cbe999c6e7a6 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -275,7 +275,7 @@ static int test_shared_for_each_unlocked(void *arg)
>  
>  static int test_get_fences(void *arg, bool shared)
>  {
> -	struct dma_fence *f, *excl = NULL, **fences = NULL;
> +	struct dma_fence *f, **fences = NULL;
>  	struct dma_resv resv;
>  	int r, i;
>  
> @@ -304,35 +304,19 @@ static int test_get_fences(void *arg, bool shared)
>  	}
>  	dma_resv_unlock(&resv);
>  
> -	r = dma_resv_get_fences(&resv, &excl, &i, &fences);
> +	r = dma_resv_get_fences(&resv, shared, &i, &fences);
>  	if (r) {
>  		pr_err("get_fences failed\n");
>  		goto err_free;
>  	}
>  
> -	if (shared) {
> -		if (excl != NULL) {
> -			pr_err("get_fences returned unexpected excl fence\n");
> -			goto err_free;
> -		}
> -		if (i != 1 || fences[0] != f) {
> -			pr_err("get_fences returned unexpected shared fence\n");
> -			goto err_free;
> -		}
> -	} else {
> -		if (excl != f) {
> -			pr_err("get_fences returned unexpected excl fence\n");
> -			goto err_free;
> -		}
> -		if (i != 0) {
> -			pr_err("get_fences returned unexpected shared fence\n");
> -			goto err_free;
> -		}
> +	if (i != 1 || fences[0] != f) {
> +		pr_err("get_fences returned unexpected fence\n");
> +		goto err_free;
>  	}
>  
>  	dma_fence_signal(f);
>  err_free:
> -	dma_fence_put(excl);
>  	while (i--)
>  		dma_fence_put(fences[i]);
>  	kfree(fences);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 68108f151dad..d17e1c911689 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -200,8 +200,10 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
>  		goto unpin;
>  	}
>  
> -	r = dma_resv_get_fences(new_abo->tbo.base.resv, NULL,
> -				&work->shared_count, &work->shared);
> +	/* TODO: Unify this with other drivers */
> +	r = dma_resv_get_fences(new_abo->tbo.base.resv, true,
> +				&work->shared_count,
> +				&work->shared);
>  	if (unlikely(r != 0)) {
>  		DRM_ERROR("failed to get fences for buffer\n");
>  		goto unpin;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> index b7fb72bff2c1..be48487e2ca7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -112,7 +112,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
>  	unsigned count;
>  	int r;
>  
> -	r = dma_resv_get_fences(resv, NULL, &count, &fences);
> +	r = dma_resv_get_fences(resv, true, &count, &fences);
>  	if (r)
>  		goto fallback;
>  
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index b5e8ce86dbe7..64c90ff348f2 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -189,8 +189,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  			continue;
>  
>  		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
> -			ret = dma_resv_get_fences(robj, NULL,
> -						  &bo->nr_shared,
> +			ret = dma_resv_get_fences(robj, true, &bo->nr_shared,
>  						  &bo->shared);
>  			if (ret)
>  				return ret;
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 3baf2a4a9a0d..fa2002939b19 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -436,8 +436,8 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>  void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>  			     struct dma_fence *fence);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
> -int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
> -			unsigned *pshared_count, struct dma_fence ***pshared);
> +int dma_resv_get_fences(struct dma_resv *obj, bool write,
> +			unsigned int *num_fences, struct dma_fence ***fences);
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>  long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>  			   unsigned long timeout);
> -- 
> 2.25.1
> 


Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
