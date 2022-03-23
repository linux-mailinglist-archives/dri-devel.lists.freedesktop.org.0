Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082884E52D0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 14:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1665610E29A;
	Wed, 23 Mar 2022 13:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6BD10E29A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 13:10:02 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id u26so1739644eda.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 06:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BHKRXGLFJLJwr2vVnk30DlMo7FwjXFwLvqhOhLHyFQc=;
 b=ipo1MLJYOh4d+0F2G6fww6qyoAAV3YNpc019r7y08+9FwhGBROEjXPD4nXzB8KUx7H
 fIfP8wsHxA7lSv7a5kxJbLMD6ANLNe1EE6ciNOouQoxIKgGtlvwwwAURp8lVzgJxr6vI
 ytgXAA+xptPYzyfZm7W4MIh7QX2kflvCSG4LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BHKRXGLFJLJwr2vVnk30DlMo7FwjXFwLvqhOhLHyFQc=;
 b=bgZkKgotxOJlLMEG4uQietsGaIL/1FVK5vskyP/7GyRWoykwIhGo/dZFkNbwiJUmnR
 gV7YL8plT7F/l2vhMX0ZQ+wcxIzaU0lUlyJpoYwrQJmCiC6aKct6LHpIfyO7mqRyxcYo
 qptmWXmXoL2SXThkG++7emd8l4liSa9G/hpv52URHjBLNQdYRoympswYVgQ70xprnHYl
 pr66+YVM67F90aNfppnQN/CICNepwdjw2bK0wQ6ryl5Orc+kcKbm0WDWpQLOlg4WlT36
 j5EAgEeHDNpNAiCOMnQ4VzBumJuEacVq4aAf2z/dVUl2zzGGfAFvoWSBpE+FJa7sJjTO
 G9JA==
X-Gm-Message-State: AOAM532I5pgT9eUWpdL3e8LWXQtRhS/tABp8HhLsSvvV9p8s4jWntmFA
 jYRmr5d3lG/Ew39KK/Z3FKHTFw==
X-Google-Smtp-Source: ABdhPJy6fwZD1CGmqnpxg3kmgenyfWn6MkIPD67DB9cmlevlXMbKBFuBAIy1fDz1VnZpQVcHcaQFlg==
X-Received: by 2002:a05:6402:909:b0:416:6f3c:5c1d with SMTP id
 g9-20020a056402090900b004166f3c5c1dmr35008909edz.108.1648041001097; 
 Wed, 23 Mar 2022 06:10:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a056402278c00b004195a50759fsm2872803ede.84.2022.03.23.06.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:10:00 -0700 (PDT)
Date: Wed, 23 Mar 2022 14:09:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 01/23] dma-buf: add dma_resv_replace_fences v2
Message-ID: <YjscJsEhTCBxIQwJ@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
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

On Mon, Mar 21, 2022 at 02:58:34PM +0100, Christian König wrote:
> This function allows to replace fences from the shared fence list when
> we can gurantee that the operation represented by the original fence has
> finished or no accesses to the resources protected by the dma_resv
> object any more when the new fence finishes.
> 
> Then use this function in the amdkfd code when BOs are unmapped from the
> process.
> 
> v2: add an example when this is usefull.

Yeah this makes a looooot more sense now :-)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>


> ---
>  drivers/dma-buf/dma-resv.c                    | 45 +++++++++++++++++
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 49 +++----------------
>  include/linux/dma-resv.h                      |  2 +
>  3 files changed, 54 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index b51416405e86..509060861cf3 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -289,6 +289,51 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
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
> + * operation represented by the original fence has no longer access to the
> + * resources represented by the dma_resv object when the new fence completes.
> + *
> + * And example for using this is replacing a preemption fence with a page table
> + * update fence which makes the resource inaccessible.
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
> index f9bab963a948..b6f266f612ea 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -253,53 +253,18 @@ void amdgpu_amdkfd_release_notify(struct amdgpu_bo *bo)
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
> index afdfdfac729f..3f53177bdb46 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -468,6 +468,8 @@ void dma_resv_init(struct dma_resv *obj);
>  void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
> +void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> +			     struct dma_fence *fence);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>  int dma_resv_get_fences(struct dma_resv *obj, bool write,
>  			unsigned int *num_fences, struct dma_fence ***fences);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
