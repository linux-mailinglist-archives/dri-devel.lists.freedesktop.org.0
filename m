Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9473A3D9D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 09:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE976EE43;
	Fri, 11 Jun 2021 07:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EBA6EE44
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:55:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c5so4980623wrq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 00:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DDtceujLgXtlsEUKK5ZRi+EzzoWlzeAeda0TaARUvw8=;
 b=WWhgP98vh2b9jHm6Qo7GwoMpKJK92yvUK5Xc0XbHnWDk7DcgZuAdCydKY64Nxv0C2F
 UJcTGwbOdQ22spxPKcIPHvF+1Oa727o0UtMrgr6gvmxhyuXWQUQ4YYVZmG7FQrTUXI6V
 lYIadztaGmtEc/hZvHnJSqHK2DbttUNzIyf9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DDtceujLgXtlsEUKK5ZRi+EzzoWlzeAeda0TaARUvw8=;
 b=p0fRvKVrlmsBAFwNvi1vHR+pEtOqFvyqL+H5RMdI2IUmtQkQ4S/Yi0OCxKRPyYRdb0
 OnH3obU9UXeyVPI1PkmaXlAzfq+h+wA5eo6vomq1oAklG5ahuT6xQiDGleg9WSOppxrJ
 ZEpRoG05S3zkEUrIS8qEePVJVVJLWKvrkSJ+4OjGbjLPP7a2MNrXUiQ8uDWvTWeKbNvc
 Q2gS7Z3FZFIx0LXCud9k75F2nKT5aE3ok8IU2vfLHWXwdP8DfmKTRFwfC1bwB+zDR3Pi
 lc1FsLP1mcmTLJO1/atc4jB9/cPtGlDa2ka23vcZBa5eRH/qUQo/Bd0eRm+iBWmpzJxY
 ONyA==
X-Gm-Message-State: AOAM531feHcxi7aNkcgwzda62eCFoQICetbHmS0E5uX/O0W5CUbRXCxr
 g0I4gI4gakdkIdJxse3NlN+rqA0ZlYZrwg==
X-Google-Smtp-Source: ABdhPJwGHUmMC/cZ+OZ17i8YtgBJi8wxDu4rN0PjADaFoB/zb1wZ6lxC3P78VXc7L02svJDl0jaMrA==
X-Received: by 2002:a05:6000:6:: with SMTP id h6mr2571417wrx.24.1623398099990; 
 Fri, 11 Jun 2021 00:54:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y26sm5184216wma.33.2021.06.11.00.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 00:54:59 -0700 (PDT)
Date: Fri, 11 Jun 2021 09:54:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/7] dma-buf: add dma_fence_chain_alloc/free
Message-ID: <YMMW0ROMlgJQyTdU@phenom.ffwll.local>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210610091800.1833-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 11:17:55AM +0200, Christian König wrote:
> Add a common allocation helper. Cleaning up the mix of kzalloc/kmalloc
> and some unused code in the selftest.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/st-dma-fence-chain.c          | 16 ++++----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 ++--
>  drivers/gpu/drm/drm_syncobj.c                 |  6 ++---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++---
>  drivers/gpu/drm/msm/msm_gem_submit.c          |  6 ++---
>  include/linux/dma-fence-chain.h               | 22 +++++++++++++++++++
>  6 files changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
> index 9525f7f56119..8ce1ea59d31b 100644
> --- a/drivers/dma-buf/st-dma-fence-chain.c
> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> @@ -58,28 +58,20 @@ static struct dma_fence *mock_fence(void)
>  	return &f->base;
>  }
>  
> -static inline struct mock_chain {
> -	struct dma_fence_chain base;
> -} *to_mock_chain(struct dma_fence *f) {
> -	return container_of(f, struct mock_chain, base.base);
> -}
> -
>  static struct dma_fence *mock_chain(struct dma_fence *prev,
>  				    struct dma_fence *fence,
>  				    u64 seqno)
>  {
> -	struct mock_chain *f;
> +	struct dma_fence_chain *f;
>  
> -	f = kmalloc(sizeof(*f), GFP_KERNEL);
> +	f = dma_fence_chain_alloc();
>  	if (!f)
>  		return NULL;
>  
> -	dma_fence_chain_init(&f->base,
> -			     dma_fence_get(prev),
> -			     dma_fence_get(fence),
> +	dma_fence_chain_init(f, dma_fence_get(prev), dma_fence_get(fence),
>  			     seqno);
>  
> -	return &f->base.base;
> +	return &f->base;
>  }
>  
>  static int sanitycheck(void *arg)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 90136f9dedd6..325e82621467 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1124,7 +1124,7 @@ static int amdgpu_cs_process_syncobj_timeline_out_dep(struct amdgpu_cs_parser *p
>  
>  		dep->chain = NULL;
>  		if (syncobj_deps[i].point) {
> -			dep->chain = kmalloc(sizeof(*dep->chain), GFP_KERNEL);
> +			dep->chain = dma_fence_chain_alloc();
>  			if (!dep->chain)
>  				return -ENOMEM;
>  		}
> @@ -1132,7 +1132,7 @@ static int amdgpu_cs_process_syncobj_timeline_out_dep(struct amdgpu_cs_parser *p
>  		dep->syncobj = drm_syncobj_find(p->filp,
>  						syncobj_deps[i].handle);
>  		if (!dep->syncobj) {
> -			kfree(dep->chain);
> +			dma_fence_chain_free(dep->chain);
>  			return -EINVAL;
>  		}
>  		dep->point = syncobj_deps[i].point;
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index fdd2ec87cdd1..1c5b9ef6da37 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -861,7 +861,7 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>  				     &fence);
>  	if (ret)
>  		goto err;
> -	chain = kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
> +	chain = dma_fence_chain_alloc();
>  	if (!chain) {
>  		ret = -ENOMEM;
>  		goto err1;
> @@ -1402,10 +1402,10 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>  		goto err_points;
>  	}
>  	for (i = 0; i < args->count_handles; i++) {
> -		chains[i] = kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
> +		chains[i] = dma_fence_chain_alloc();
>  		if (!chains[i]) {
>  			for (j = 0; j < i; j++)
> -				kfree(chains[j]);
> +				dma_fence_chain_free(chains[j]);
>  			ret = -ENOMEM;
>  			goto err_chains;
>  		}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 66789111a24b..a22cb86730b3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2983,7 +2983,7 @@ __free_fence_array(struct eb_fence *fences, unsigned int n)
>  	while (n--) {
>  		drm_syncobj_put(ptr_mask_bits(fences[n].syncobj, 2));
>  		dma_fence_put(fences[n].dma_fence);
> -		kfree(fences[n].chain_fence);
> +		dma_fence_chain_free(fences[n].chain_fence);
>  	}
>  	kvfree(fences);
>  }
> @@ -3097,9 +3097,7 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>  				return -EINVAL;
>  			}
>  
> -			f->chain_fence =
> -				kmalloc(sizeof(*f->chain_fence),
> -					GFP_KERNEL);
> +			f->chain_fence = dma_fence_chain_alloc();
>  			if (!f->chain_fence) {
>  				drm_syncobj_put(syncobj);
>  				dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 5480852bdeda..6ff6df6c4791 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -586,9 +586,7 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>  				break;
>  			}
>  
> -			post_deps[i].chain =
> -				kmalloc(sizeof(*post_deps[i].chain),
> -				        GFP_KERNEL);
> +			post_deps[i].chain = dma_fence_chain_alloc();
>  			if (!post_deps[i].chain) {
>  				ret = -ENOMEM;
>  				break;
> @@ -605,7 +603,7 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>  
>  	if (ret) {
>  		for (j = 0; j <= i; ++j) {
> -			kfree(post_deps[j].chain);
> +			dma_fence_chain_free(post_deps[j].chain);
>  			if (post_deps[j].syncobj)
>  				drm_syncobj_put(post_deps[j].syncobj);
>  		}
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index 9d6a062be640..5f45689a6d2e 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -12,6 +12,7 @@
>  
>  #include <linux/dma-fence.h>
>  #include <linux/irq_work.h>
> +#include <linux/slab.h>
>  
>  /**
>   * struct dma_fence_chain - fence to represent an node of a fence chain
> @@ -53,6 +54,27 @@ to_dma_fence_chain(struct dma_fence *fence)
>  	return container_of(fence, struct dma_fence_chain, base);
>  }
>  
> +/**
> + * dma_fence_chain_alloc
> + *
> + * Returns a new dma_fence_chain object

... or NULL on failure.

> + */
> +static inline struct dma_fence_chain *dma_fence_chain_alloc(void)
> +{
> +	return kmalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
> +};
> +
> +/**
> + * dma_fence_chain_free
> + * @chain: chain node to free
> + *
> + * Frees up an allocated but not used dma_fence_chain node.
> + */
> +static inline void dma_fence_chain_free(struct dma_fence_chain *chain)
> +{
> +	kfree(chain);

kfree_rcu, and I guess this means this patch here should be cc: stable.

This is kinda why I'm questioning whether this "dma_fence are protected by
rcu" cross driver api is really a good idea. We largely get it wrong in
the details in a _ton_ of places.

With the details fixed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  /**
>   * dma_fence_chain_for_each - iterate over all fences in chain
>   * @iter: current fence
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
