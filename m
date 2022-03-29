Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E54D4EB0F4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 17:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7B510E8BF;
	Tue, 29 Mar 2022 15:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7299610E8CC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 15:47:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w4so25404544wrg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EvTEWzkFoxP8WWeIegh6ObO2cfannpVnLZykshsID/Q=;
 b=TkDBobyeINMNTrhx3lYhEU09d2Yx47P9aX7vYf/rlI6C0PPZ2XTmAnXBM4ATe/aDUT
 PLznvB+gOoVn8TIxHVjA70qviR+Wh3DFtkjcbQviR+BcE0JLdnGA4j+vs+ykJ3Jz0Pmy
 m6BOmRqhBSGjq+ZpOZIaciDYzIBV9UujGZi+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EvTEWzkFoxP8WWeIegh6ObO2cfannpVnLZykshsID/Q=;
 b=UK9yyZMJGGKYDnXHm1SBzK47A7WWx5wjyNrI0G4R+MCBXv95Lu60EYfeqg2nvHEuAp
 JNZTIugTvJUX2r06dkGwXjXOyrHM8Phc3nQKmNcNpEVYRubnJ5HzEWbLX2/OQhbA/XY6
 yqCUkgX7gCR1Y8lQaRH5gMVyGpSkpZhXyRvmayYP+dAuoKYXiub93o8HbSsuWbTKffRB
 RAlGoNK2PhvxxO/tLx/nfMHi5Yr05YQrdjnV+lIsXjUfN9Hst6omb0H6d4YvppcfSm8f
 35NZnK6YI9MUecHtQiuFrdI13RwE0fP3vg5A6skzyCQykZiHENWD69uZTsq8S08qLom3
 5wHQ==
X-Gm-Message-State: AOAM531dVqrOOEKL0z5KXgeqAgDflJEpabML8MVSmRJuh1dx5z11sG8C
 0IbNBC5GMVGgCAGc3tsEUWE4GuMThO7axK05
X-Google-Smtp-Source: ABdhPJwGpzlgYGF9M5GoWjX/+K6QHIkW6+jMi6p1b9qLJoFFSewXfB22+83v0b9xyzrB4HsPPj7X/g==
X-Received: by 2002:a5d:6b0d:0:b0:1f0:6497:b071 with SMTP id
 v13-20020a5d6b0d000000b001f06497b071mr32275358wrw.638.1648568838956; 
 Tue, 29 Mar 2022 08:47:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a7bcb54000000b0037fa63db8aasm2510199wmj.5.2022.03.29.08.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 08:47:18 -0700 (PDT)
Date: Tue, 29 Mar 2022 17:47:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 18/23] drm/amdgpu: remove dma_resv workaround
Message-ID: <YkMqBNsPA94elLaD@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-18-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135856.1331-18-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 02:58:51PM +0100, Christian König wrote:
> We can now add multiple writers to the dma_resv object.
> 
> Also enable the check for not adding containers in dma_resv.c again.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org

It's a bit much magic, but that's the entire point of your huge prep
series to be able to have all the fences on a dma-resv :-)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-resv.c                  |  6 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 51 ++-------------------
>  3 files changed, 8 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 26257ba1527e..10d70812373c 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -308,10 +308,10 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
>  
>  	dma_resv_assert_held(obj);
>  
> -	/* TODO: Drivers should not add containers here, instead add each fence
> -	 * individually. Disabled for now until we cleaned up amdgpu/ttm.
> +	/* Drivers should not add containers here, instead add each fence
> +	 * individually.
>  	 */
> -	/* WARN_ON(dma_fence_is_container(fence)); */
> +	WARN_ON(dma_fence_is_container(fence));
>  
>  	fobj = dma_resv_fences_list(obj);
>  	count = fobj->num_fences;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> index 044b41f0bfd9..529d52a204cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> @@ -34,7 +34,6 @@ struct amdgpu_fpriv;
>  struct amdgpu_bo_list_entry {
>  	struct ttm_validate_buffer	tv;
>  	struct amdgpu_bo_va		*bo_va;
> -	struct dma_fence_chain		*chain;
>  	uint32_t			priority;
>  	struct page			**user_pages;
>  	bool				user_invalidated;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 1c039db976a9..88009833f523 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -575,14 +575,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>  
>  		e->bo_va = amdgpu_vm_bo_find(vm, bo);
> -
> -		if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
> -			e->chain = dma_fence_chain_alloc();
> -			if (!e->chain) {
> -				r = -ENOMEM;
> -				goto error_validate;
> -			}
> -		}
>  	}
>  
>  	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
> @@ -633,13 +625,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  	}
>  
>  error_validate:
> -	if (r) {
> -		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -			dma_fence_chain_free(e->chain);
> -			e->chain = NULL;
> -		}
> +	if (r)
>  		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
> -	}
>  out:
>  	return r;
>  }
> @@ -679,17 +666,9 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
>  {
>  	unsigned i;
>  
> -	if (error && backoff) {
> -		struct amdgpu_bo_list_entry *e;
> -
> -		amdgpu_bo_list_for_each_entry(e, parser->bo_list) {
> -			dma_fence_chain_free(e->chain);
> -			e->chain = NULL;
> -		}
> -
> +	if (error && backoff)
>  		ttm_eu_backoff_reservation(&parser->ticket,
>  					   &parser->validated);
> -	}
>  
>  	for (i = 0; i < parser->num_post_deps; i++) {
>  		drm_syncobj_put(parser->post_deps[i].syncobj);
> @@ -1264,29 +1243,9 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  
>  	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
>  
> -	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -		struct dma_resv *resv = e->tv.bo->base.resv;
> -		struct dma_fence_chain *chain = e->chain;
> -		struct dma_resv_iter cursor;
> -		struct dma_fence *fence;
> -
> -		if (!chain)
> -			continue;
> -
> -		/*
> -		 * Work around dma_resv shortcommings by wrapping up the
> -		 * submission in a dma_fence_chain and add it as exclusive
> -		 * fence.
> -		 */
> -		dma_resv_for_each_fence(&cursor, resv,
> -					DMA_RESV_USAGE_WRITE,
> -					fence) {
> -			break;
> -		}
> -		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
> -		dma_resv_add_fence(resv, &chain->base, DMA_RESV_USAGE_WRITE);
> -		e->chain = NULL;
> -	}
> +	/* Make sure all BOs are remembered as writers */
> +	amdgpu_bo_list_for_each_entry(e, p->bo_list)
> +		e->tv.num_shared = 0;
>  
>  	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
>  	mutex_unlock(&p->adev->notifier_lock);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
