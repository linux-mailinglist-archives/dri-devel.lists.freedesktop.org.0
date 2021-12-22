Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F0E47D880
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0956110E2AF;
	Wed, 22 Dec 2021 21:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D0E10E2AF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:05:49 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id bm14so13416414edb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IQ8ss5cLkN0OPC63IPdBeU3liG7P/Ww64z/LebsIY2w=;
 b=jOAFEbuBAhj/reb9IQTIUNL+eVriPEapr96s9Pcjc8dBjFsapOITkfRryqtSr8GJqg
 qW8h7sFiaY16oLLhjNKiIQKkSM/bI1XMZJ04Cie4CYLGobuvnju/nMu6cr7NI0Zmz7rk
 4ZK3+roGl3rxTOtfUcZcrgQ5ZAxykXjXUr4dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IQ8ss5cLkN0OPC63IPdBeU3liG7P/Ww64z/LebsIY2w=;
 b=SotnzzCTpsK1qdWg/miDdANoeyh0iC3lzl+LJEsbuEATbr1HmELGT+4hzHjB2I4kCJ
 M2T6EfqBkyHmoR7SQ6/7qHRuZm95cLnU8R8iPZNYic4MNDkznuW7hJkPpRbfQ4OnCtPM
 0exrQtbOsFDCsc5iv48EFdUi2bltX7Mivy4grDHIFhm5tqPYJmQJ0URsFmriEcU1bawF
 Jk/XSGQb801ILYaGzjztenQMTxEUy/gX5OqFYaFXD47JhMmuzkWjZPToNt2PLt5DEDv+
 eG4JPyDJbYT243W+MewDlYFtfvvrXmTBFtcrVMr8bFsDrEKD0IfW5UEDNS5aQ9YiK0a7
 ULjA==
X-Gm-Message-State: AOAM533oeyAuUv/X4Olsu3Ny764Wt4DW74h8ivGk6x2OabAZL2I4T1ue
 SYAMdgJ9hHKhay4U/00lHU/Ydw==
X-Google-Smtp-Source: ABdhPJy16fia4p0Y93NWGi3JF1DLRQj6DXz7tKsGUA5K+83EAZceIlpmfFearrRDhArZk+srL2QzXg==
X-Received: by 2002:a05:6402:518c:: with SMTP id
 q12mr4542433edd.312.1640207147443; 
 Wed, 22 Dec 2021 13:05:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o1sm1274867edv.2.2021.12.22.13.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:05:47 -0800 (PST)
Date: Wed, 22 Dec 2021 22:05:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 01/24] dma-buf: add dma_resv_replace_fences
Message-ID: <YcOTKYkEcu7MG2sY@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-2-christian.koenig@amd.com>
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

On Tue, Dec 07, 2021 at 01:33:48PM +0100, Christian König wrote:
> This function allows to replace fences from the shared fence list when
> we can gurantee that the operation represented by the original fence has
> finished or no accesses to the resources protected by the dma_resv
> object any more when the new fence finishes.
> 
> Then use this function in the amdkfd code when BOs are unmapped from the
> process.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c                    | 43 ++++++++++++++++
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 49 +++----------------
>  include/linux/dma-resv.h                      |  2 +
>  3 files changed, 52 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 4deea75c0b9c..a688dbded3d3 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -284,6 +284,49 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>  }
>  EXPORT_SYMBOL(dma_resv_add_shared_fence);
>  
> +/**
> + * dma_resv_replace_fences - replace fences in the dma_resv obj
> + * @obj: the reservation object
> + * @context: the context of the fences to replace
> + * @replacement: the new fence to use instead
> + *
> + * Replace fences with a specified context with a new fence. Only valid if the
> + * operation represented by the original fences is completed or has no longer
> + * access to the resources protected by the dma_resv object when the new fence
> + * completes.
> + */
> +void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> +			     struct dma_fence *replacement)
> +{
> +	struct dma_resv_list *list;
> +	struct dma_fence *old;
> +	unsigned int i;
> +
> +	dma_resv_assert_held(obj);
> +
> +	write_seqcount_begin(&obj->seq);
> +
> +	old = dma_resv_excl_fence(obj);
> +	if (old->context == context) {
> +		RCU_INIT_POINTER(obj->fence_excl, dma_fence_get(replacement));
> +		dma_fence_put(old);
> +	}
> +
> +	list = dma_resv_shared_list(obj);
> +	for (i = 0; list && i < list->shared_count; ++i) {
> +		old = rcu_dereference_protected(list->shared[i],
> +						dma_resv_held(obj));
> +		if (old->context != context)
> +			continue;
> +
> +		rcu_assign_pointer(list->shared[i], dma_fence_get(replacement));
> +		dma_fence_put(old);

Since the fences are all guaranteed to be from the same context, maybe we
should have a WARN_ON(__dma_fence_is_later()); here just to be safe?

With that added:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	}
> +
> +	write_seqcount_end(&obj->seq);
> +}
> +EXPORT_SYMBOL(dma_resv_replace_fences);
> +
>  /**
>   * dma_resv_add_excl_fence - Add an exclusive fence.
>   * @obj: the reservation object
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 71acd577803e..b558ef0f8c4a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -236,53 +236,18 @@ void amdgpu_amdkfd_release_notify(struct amdgpu_bo *bo)
>  static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>  					struct amdgpu_amdkfd_fence *ef)
>  {
> -	struct dma_resv *resv = bo->tbo.base.resv;
> -	struct dma_resv_list *old, *new;
> -	unsigned int i, j, k;
> +	struct dma_fence *replacement;
>  
>  	if (!ef)
>  		return -EINVAL;
>  
> -	old = dma_resv_shared_list(resv);
> -	if (!old)
> -		return 0;
> -
> -	new = kmalloc(struct_size(new, shared, old->shared_max), GFP_KERNEL);
> -	if (!new)
> -		return -ENOMEM;
> -
> -	/* Go through all the shared fences in the resevation object and sort
> -	 * the interesting ones to the end of the list.
> +	/* TODO: Instead of block before we should use the fence of the page
> +	 * table update and TLB flush here directly.
>  	 */
> -	for (i = 0, j = old->shared_count, k = 0; i < old->shared_count; ++i) {
> -		struct dma_fence *f;
> -
> -		f = rcu_dereference_protected(old->shared[i],
> -					      dma_resv_held(resv));
> -
> -		if (f->context == ef->base.context)
> -			RCU_INIT_POINTER(new->shared[--j], f);
> -		else
> -			RCU_INIT_POINTER(new->shared[k++], f);
> -	}
> -	new->shared_max = old->shared_max;
> -	new->shared_count = k;
> -
> -	/* Install the new fence list, seqcount provides the barriers */
> -	write_seqcount_begin(&resv->seq);
> -	RCU_INIT_POINTER(resv->fence, new);
> -	write_seqcount_end(&resv->seq);
> -
> -	/* Drop the references to the removed fences or move them to ef_list */
> -	for (i = j; i < old->shared_count; ++i) {
> -		struct dma_fence *f;
> -
> -		f = rcu_dereference_protected(new->shared[i],
> -					      dma_resv_held(resv));
> -		dma_fence_put(f);
> -	}
> -	kfree_rcu(old, rcu);
> -
> +	replacement = dma_fence_get_stub();
> +	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
> +				replacement);
> +	dma_fence_put(replacement);
>  	return 0;
>  }
>  
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index eebf04325b34..e0be34265eae 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -457,6 +457,8 @@ void dma_resv_init(struct dma_resv *obj);
>  void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
> +void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> +			     struct dma_fence *fence);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>  int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>  			unsigned *pshared_count, struct dma_fence ***pshared);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
