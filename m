Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A63989FE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0016EC90;
	Wed,  2 Jun 2021 12:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4856EC90
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 12:47:44 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id f17so1206798wmf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 05:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=x8cYutjMf+bEkjbjESgKFNPWUTa5t2NSipNDBrN3cPM=;
 b=WCk6zu5YzuKbuCCfYJ9mG9kytrknq7WhfLJQ6/yuwpZfcrtcjfimV4iHnpGNQU/4Sn
 DP40vYIbQtf5w3qkqbYZ1Hhrc3AutYdAqDYUkyJashro/wm2FpDSNucljxFSn81mi+km
 xmkI2glDKyFpAt0DowU419hrUQZp3HsbFMSMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=x8cYutjMf+bEkjbjESgKFNPWUTa5t2NSipNDBrN3cPM=;
 b=mUMt2QeHnmrJFw2c7SZurO+eTQxRlMpA6gGVqbOz4qI2BL3HDI3WcXUP04sa/0MQRZ
 jeBfffQAEaxjM8zU6+c8sFiFLW/cTtnJKSJMbi+qdDfLTADFEp2ngZc65unm+OwSb7Xw
 iCMTX9EsylgGwSwZNwnpOwMhdpbTM6SVNbvitfiHmjJZkyRHFeEq/Dd0fMM3/jkrEgMB
 Pp3zmW61cPBJnfXLxufI2Ku7voia14eZtgp/r0ZaD5ULDQrlR+wj8JHj77z0TdEtJN2h
 E9r6NK7TzpFZZSVYrbS1Swt2eRlR6estUhQPzTXmWrFf3AP9BJuMYmjy9qri6rRyxvC/
 Bk0g==
X-Gm-Message-State: AOAM530LMMvHNmMkkoYH6EXOhBGCY6zQM7UEusS1fRZgEEO1vUDEJb3C
 ITiZ98131q/d7DQyIcUxA1GGaw==
X-Google-Smtp-Source: ABdhPJztMFy6z0CjMI9MPAmRQg7AVTvfMb7lDSKOMf/3xrN4ydxhT+1e3Y6DXrUqfSAfTWn7XP7dCw==
X-Received: by 2002:a1c:5f09:: with SMTP id t9mr3832920wmb.42.1622638063661;
 Wed, 02 Jun 2021 05:47:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n9sm2653048wmc.20.2021.06.02.05.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 05:47:43 -0700 (PDT)
Date: Wed, 2 Jun 2021 14:47:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 6/7] dma-buf: rename dma_resv_get_excl_rcu to _unlocked
Message-ID: <YLd97ZWH7X6PqRyU@phenom.ffwll.local>
References: <20210602111714.212426-1-christian.koenig@amd.com>
 <20210602111714.212426-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602111714.212426-6-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 01:17:13PM +0200, Christian König wrote:
> That describes much better what the function is doing here.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem.c                    | 2 +-
>  drivers/gpu/drm/drm_gem_atomic_helper.c      | 2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_display.c | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h   | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_wait.c     | 4 ++--
>  drivers/gpu/drm/i915/i915_request.c          | 2 +-
>  drivers/gpu/drm/i915/i915_sw_fence.c         | 2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c      | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c      | 2 +-
>  include/linux/dma-resv.h                     | 4 ++--
>  11 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 9989425e9875..263b4fb03303 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1375,7 +1375,7 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
>  
>  	if (!write) {
>  		struct dma_fence *fence =
> -			dma_resv_get_excl_rcu(obj->resv);
> +			dma_resv_get_excl_unlocked(obj->resv);
>  
>  		return drm_gem_fence_array_add(fence_array, fence);
>  	}
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index a005c5a0ba46..a27135084ae5 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -147,7 +147,7 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
>  		return 0;
>  
>  	obj = drm_gem_fb_get_obj(state->fb, 0);
> -	fence = dma_resv_get_excl_rcu(obj->resv);
> +	fence = dma_resv_get_excl_unlocked(obj->resv);
>  	drm_atomic_set_fence_for_plane(state, fence);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index d05c35994579..c942d2a8c252 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -195,7 +195,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  			if (ret)
>  				return ret;
>  		} else {
> -			bo->excl = dma_resv_get_excl_rcu(robj);
> +			bo->excl = dma_resv_get_excl_unlocked(robj);
>  		}
>  
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 384ff0bb6e19..f17c5f54feb6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -11040,7 +11040,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>  		if (ret < 0)
>  			goto unpin_fb;
>  
> -		fence = dma_resv_get_excl_rcu(obj->base.resv);
> +		fence = dma_resv_get_excl_unlocked(obj->base.resv);
>  		if (fence) {
>  			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
>  						   fence);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 2ebd79537aea..7c0eb425cb3b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -500,7 +500,7 @@ i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
>  	struct dma_fence *fence;
>  
>  	rcu_read_lock();
> -	fence = dma_resv_get_excl_rcu(obj->base.resv);
> +	fence = dma_resv_get_excl_unlocked(obj->base.resv);
>  	rcu_read_unlock();
>  
>  	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index 4b9856d5ba14..c13aeddf5aa7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -73,7 +73,7 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>  		 */
>  		prune_fences = count && timeout >= 0;
>  	} else {
> -		excl = dma_resv_get_excl_rcu(resv);
> +		excl = dma_resv_get_excl_unlocked(resv);
>  	}
>  
>  	if (excl && timeout >= 0)
> @@ -170,7 +170,7 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
>  
>  		kfree(shared);
>  	} else {
> -		excl = dma_resv_get_excl_rcu(obj->base.resv);
> +		excl = dma_resv_get_excl_unlocked(obj->base.resv);
>  	}
>  
>  	if (excl) {
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index bec9c3652188..c85494f411f4 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1611,7 +1611,7 @@ i915_request_await_object(struct i915_request *to,
>  			dma_fence_put(shared[i]);
>  		kfree(shared);
>  	} else {
> -		excl = dma_resv_get_excl_rcu(obj->base.resv);
> +		excl = dma_resv_get_excl_unlocked(obj->base.resv);
>  	}
>  
>  	if (excl) {
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index 2744558f3050..7aaf74552d06 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -606,7 +606,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>  			dma_fence_put(shared[i]);
>  		kfree(shared);
>  	} else {
> -		excl = dma_resv_get_excl_rcu(resv);
> +		excl = dma_resv_get_excl_unlocked(resv);
>  	}
>  
>  	if (ret >= 0 && excl && excl->ops != exclude) {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 0cb1f9d848d3..8d048bacd6f0 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -561,7 +561,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  			asyw->image.handle[0] = ctxdma->object.handle;
>  	}
>  
> -	asyw->state.fence = dma_resv_get_excl_rcu(nvbo->bo.base.resv);
> +	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
>  	asyw->image.offset[0] = nvbo->offset;
>  
>  	if (wndw->func->prepare) {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 6003cfeb1322..2df3e999a38d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -203,7 +203,7 @@ static void panfrost_acquire_object_fences(struct drm_gem_object **bos,
>  	int i;
>  
>  	for (i = 0; i < bo_count; i++)
> -		implicit_fences[i] = dma_resv_get_excl_rcu(bos[i]->resv);
> +		implicit_fences[i] = dma_resv_get_excl_unlocked(bos[i]->resv);
>  }
>  
>  static void panfrost_attach_object_fences(struct drm_gem_object **bos,
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 98ac66fecb71..f6b71712c029 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -228,7 +228,7 @@ dma_resv_exclusive(struct dma_resv *obj)
>  }
>  
>  /**
> - * dma_resv_get_excl_rcu - get the reservation object's
> + * dma_resv_get_excl_unlocked - get the reservation object's
>   * exclusive fence, without lock held.
>   * @obj: the reservation object
>   *
> @@ -239,7 +239,7 @@ dma_resv_exclusive(struct dma_resv *obj)
>   * The exclusive fence or NULL if none
>   */
>  static inline struct dma_fence *
> -dma_resv_get_excl_rcu(struct dma_resv *obj)
> +dma_resv_get_excl_unlocked(struct dma_resv *obj)
>  {
>  	struct dma_fence *fence;
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
