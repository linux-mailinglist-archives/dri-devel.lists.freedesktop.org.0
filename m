Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A056A2A2B5F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962046E51A;
	Mon,  2 Nov 2020 13:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FE36E51A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 13:22:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w1so14600321wrm.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 05:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iq5D41nICryzc6PImiyAQvFZ/4wc4nDBlfRl3TvSMoo=;
 b=Zk3ie9bF2h1HaRxnCRvvZS43RJf40Cqcdypdz/zN3RyyQ8wRmATZ9eM9Kg+rLLvagY
 OF766Ftxag/GuU8ZMwWx1zR0v9jhrdLNM5zDDxy1bSN2YMybn3RCkdm0Jpw88dmHTYDK
 5lC0frxkVsN+uMwpXfS9KHt0WxPMfk2VzSkyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iq5D41nICryzc6PImiyAQvFZ/4wc4nDBlfRl3TvSMoo=;
 b=FVf5B1R1DjhUcHVjydiwx7uN6O57PyUBEYsz380lf8V5kbO8z0PjQGOSO26WwR5F8f
 emQ+T1BTOA+U6eDgCYihxGR0OiFKbHio+AXtwnBHjIbtLiDzZ/nXYp+MrVo2XN2ZxBmD
 JAfsC2e5yAQU2JF1oYi5RBCGZbrwglKLmxa5C/1EZC+oV5yyuMibiwdEZ6TJkEpB14/M
 y+E/W4UBX+Fz8aoNtuT01/9KJafp3FzceNZYhDykq/ohWn0E8Fs8j20cvP/1+sBswDnk
 lKVQbWv6EnnZHh3XK8Wzyj52FdGOCmOg2BL96boEQeyLwTjKKsTDeMm9vQwQiHEk2oeI
 WVFA==
X-Gm-Message-State: AOAM531Tfl2uBKQI0D+Sai6XMaZ8z0Ym+EfH7AV2abS/Gk776HyFmtwK
 +kK2t+WgyW2j9lDI7N8HFEbvrw==
X-Google-Smtp-Source: ABdhPJxt/gaLl/k5F7IKqhJuwvW5G0jt0nng0LoE5+h2rj9HZODm3452NQPHTWlm80FMieQKsrBobQ==
X-Received: by 2002:a5d:6681:: with SMTP id l1mr20641486wru.356.1604323373578; 
 Mon, 02 Nov 2020 05:22:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a17sm22633728wra.29.2020.11.02.05.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 05:22:52 -0800 (PST)
Date: Mon, 2 Nov 2020 14:22:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] drm/ttm: replace context flags with bools
Message-ID: <20201102132250.GR401619@phenom.ffwll.local>
References: <20201102125808.75130-1-christian.koenig@amd.com>
 <20201102125808.75130-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102125808.75130-2-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 01:58:08PM +0100, Christian K=F6nig wrote:
> The ttm_operation_ctx structure has a mixture of flags and bools. Drop the
> flags and replace them with bools as well.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  5 ++---
>  drivers/gpu/drm/ttm/ttm_bo.c               |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo_vm.c            |  3 +--
>  drivers/gpu/drm/ttm/ttm_memory.c           |  3 ++-
>  drivers/gpu/drm/ttm/ttm_resource.c         |  2 +-
>  include/drm/ttm/ttm_bo_api.h               | 10 ++++------
>  6 files changed, 11 insertions(+), 14 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 52041f48e1c9..c302a2c7982d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -518,9 +518,8 @@ static int amdgpu_bo_do_create(struct amdgpu_device *=
adev,
>  		.no_wait_gpu =3D bp->no_wait_gpu,
>  		/* We opt to avoid OOM on system pages allocations */
>  		.retry_mayfail =3D true,
> -		.resv =3D bp->resv,
> -		.flags =3D bp->type !=3D ttm_bo_type_kernel ?
> -			TTM_OPT_FLAG_ALLOW_RES_EVICT : 0
> +		.allow_res_evict =3D bp->type !=3D ttm_bo_type_kernel,
> +		.resv =3D bp->resv
>  	};
>  	struct amdgpu_bo *bo;
>  	unsigned long page_align, size =3D bp->size;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c63b7ea1cd5d..e2a124b3affb 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -637,7 +637,7 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm=
_buffer_object *bo,
>  =

>  	if (bo->base.resv =3D=3D ctx->resv) {
>  		dma_resv_assert_held(bo->base.resv);
> -		if (ctx->flags & TTM_OPT_FLAG_ALLOW_RES_EVICT)
> +		if (ctx->allow_res_evict)
>  			ret =3D true;
>  		*locked =3D false;
>  		if (busy)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo=
_vm.c
> index eeaca5d1efe3..4cf9628f38ac 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -315,8 +315,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *=
vmf,
>  		struct ttm_operation_ctx ctx =3D {
>  			.interruptible =3D false,
>  			.no_wait_gpu =3D false,
> -			.flags =3D TTM_OPT_FLAG_FORCE_ALLOC
> -
> +			.fource_alloc =3D true
>  		};
>  =

>  		ttm =3D bo->ttm;
> diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_m=
emory.c
> index f9a90bfaa3c1..5ed1fc8f2ace 100644
> --- a/drivers/gpu/drm/ttm/ttm_memory.c
> +++ b/drivers/gpu/drm/ttm/ttm_memory.c
> @@ -542,7 +542,8 @@ ttm_check_under_lowerlimit(struct ttm_mem_global *glo=
b,
>  {
>  	int64_t available;
>  =

> -	if (ctx->flags & TTM_OPT_FLAG_FORCE_ALLOC)
> +	/* We allow over commit during suspend */
> +	if (ctx->force_alloc)
>  		return false;
>  =

>  	available =3D get_nr_swap_pages() + si_mem_available();
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index 4ebc043e2867..29cf905d97b7 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -89,7 +89,7 @@ int ttm_resource_manager_evict_all(struct ttm_bo_device=
 *bdev,
>  	struct ttm_operation_ctx ctx =3D {
>  		.interruptible =3D false,
>  		.no_wait_gpu =3D false,
> -		.flags =3D TTM_OPT_FLAG_FORCE_ALLOC
> +		.fource_alloc =3D true
>  	};
>  	struct ttm_bo_global *glob =3D &ttm_bo_glob;
>  	struct dma_fence *fence;
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 4c7c2d574db6..6315133c69e5 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -196,6 +196,8 @@ struct ttm_bo_kmap_obj {
>   * @interruptible: Sleep interruptible if sleeping.
>   * @no_wait_gpu: Return immediately if the GPU is busy.
>   * @retry_mayfail: Set the __GFP_RETRY_MAYFAIL when allocation pages.
> + * @allow_res_evict: Allow eviction of reserved BOs.
> + * @force_alloc: Fource allocation when serving page faults.

s/Fource/Force/ and I think this would be an excellent application of the
inline kerneldoc style for structs, so that you can spend a few more words
on what exactly these do, and when they're supposed to be used.

I know originally we said we'll do kerneldoc last, but with all the stuff
going on and details being discussed I don't think that makes much sense.
We'll have forgotten it all again :-)

>   * @resv: Reservation object to allow reserved evictions with.
>   * @flags: Including the following flags

Forgot to remove this one here.

With the nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>   *
> @@ -206,16 +208,12 @@ struct ttm_operation_ctx {
>  	bool interruptible;
>  	bool no_wait_gpu;
>  	bool retry_mayfail;
> +	bool allow_res_evict;
> +	bool force_alloc;
>  	struct dma_resv *resv;
>  	uint64_t bytes_moved;
> -	uint32_t flags;
>  };
>  =

> -/* Allow eviction of reserved BOs */
> -#define TTM_OPT_FLAG_ALLOW_RES_EVICT		0x1
> -/* when serving page fault or suspend, allow alloc anyway */
> -#define TTM_OPT_FLAG_FORCE_ALLOC		0x2
> -
>  /**
>   * ttm_bo_get - reference a struct ttm_buffer_object
>   *
> -- =

> 2.25.1
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
