Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB9742C03F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 14:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D366EA4F;
	Wed, 13 Oct 2021 12:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F8E6EA49
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 12:41:38 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e12so7955842wra.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 05:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Tmz1dQkAqru2Sfjg+3pe/Big7RZeqkmBRYMDHwO4iuA=;
 b=SqwkwZYKPdOS2vkhLjgEdEb1Psp/HPpuoH1mqvJ1hvJbQS5ISO89Y3e/WbNT797e2u
 fjLPxIIs2GRgMlaRR/Zkil+2WXb4J8FCEn94amoa3m/q+pSglaONJnZyonI54WErF4so
 HXd8vB+8R5KdCUN13gJJybXA/ptPV1rtfUqFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Tmz1dQkAqru2Sfjg+3pe/Big7RZeqkmBRYMDHwO4iuA=;
 b=vjAvtUThTgJpU/o0rwnA5ft+cvq+CELTJ8evvvPbyWxwOoZL0BlylHxfMUtGHzi8TE
 MgwCW9D2MU/+Nov8iByd+GDw7Rq3XzTc+3ISMJLT1S/LA6z0qXQ8Y4poSHSXH9cMlsVy
 qpPqrhw637hVYG/XmbIc3hWTHxfnsk+xD8QJLUxGJqNcEVPrJJWV1JV4a3Z3irzbhLqj
 SRaloZXmJmlaCzYUogphSa3VaB/9oV6JhLjrnPeSZ/ecsds8Yk+K68JKJScCGoPkJLe1
 eH17a4Tie8xFw4vPrEdhf+UPxMIAW8pIYl4TG2qMoUQeVo0YIv/8T0guOXkq80O/rE2O
 I06w==
X-Gm-Message-State: AOAM532JIWrQgQBjhGtI+HHUK+wkYR0fadRu0RSN2Xm37qd4HXHs2pAA
 cQqSgXFyKcKWfeKivb5Cp65L3thcVuMw9Q==
X-Google-Smtp-Source: ABdhPJxdzpXiTDUhO9gYtRgDFPHeAA49OhrGSqieD/in2v20SOES8ldWo5WErCKrL/1HqgO4Y1ywrw==
X-Received: by 2002:a05:600c:1d1f:: with SMTP id
 l31mr12446896wms.44.1634128897197; 
 Wed, 13 Oct 2021 05:41:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e9sm5253211wme.37.2021.10.13.05.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:41:36 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:41:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com
Subject: Re: [PATCH 1/6] drm/i915: Update dma_fence_work
Message-ID: <YWbT/hqoc5fJo17z@phenom.ffwll.local>
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
 <20211008133530.664509-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008133530.664509-2-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 08, 2021 at 03:35:25PM +0200, Thomas Hellström wrote:
> Move the release callback to after fence signaling to align with
> what's done for upcoming VM_BIND user-fence signaling.
> 
> Finally call the work callback regardless of whether we have a fence
> error or not and update the existing callbacks accordingly. We will
> need this to intercept the error for failsafe migration.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I think before we make this thing more complex we really should either
move this into dma-buf/ as a proper thing, or just open-code.

Minimally at least any new async dma_fence worker needs to have
dma_fence_begin/end_signalling annotations, or we're just digging a grave
here.

I'm also not seeing the point in building everything on top of this, for
many cases just an open-coded work_struct should be a lot simpler. It's
just more to clean up later on, that part is for sure.
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c |  5 +++
>  drivers/gpu/drm/i915/i915_sw_fence_work.c   | 36 ++++++++++-----------
>  drivers/gpu/drm/i915/i915_sw_fence_work.h   |  1 +
>  drivers/gpu/drm/i915/i915_vma.c             | 12 +++++--
>  4 files changed, 33 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> index f0435c6feb68..2143ebaf5b6f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> @@ -28,6 +28,11 @@ static void clflush_work(struct dma_fence_work *base)
>  {
>  	struct clflush *clflush = container_of(base, typeof(*clflush), base);
>  
> +	if (base->error) {
> +		dma_fence_set_error(&base->dma, base->error);
> +		return;
> +	}
> +
>  	__do_clflush(clflush->obj);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
> index 5b33ef23d54c..5b55cddafc9b 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
> @@ -6,21 +6,24 @@
>  
>  #include "i915_sw_fence_work.h"
>  
> -static void fence_complete(struct dma_fence_work *f)
> +static void dma_fence_work_complete(struct dma_fence_work *f)
>  {
> +	dma_fence_signal(&f->dma);
> +
>  	if (f->ops->release)
>  		f->ops->release(f);
> -	dma_fence_signal(&f->dma);
> +
> +	dma_fence_put(&f->dma);
>  }
>  
> -static void fence_work(struct work_struct *work)
> +static void dma_fence_work_work(struct work_struct *work)
>  {
>  	struct dma_fence_work *f = container_of(work, typeof(*f), work);
>  
> -	f->ops->work(f);
> +	if (f->ops->work)
> +		f->ops->work(f);
>  
> -	fence_complete(f);
> -	dma_fence_put(&f->dma);
> +	dma_fence_work_complete(f);
>  }
>  
>  static int __i915_sw_fence_call
> @@ -31,17 +34,13 @@ fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
>  	switch (state) {
>  	case FENCE_COMPLETE:
>  		if (fence->error)
> -			dma_fence_set_error(&f->dma, fence->error);
> -
> -		if (!f->dma.error) {
> -			dma_fence_get(&f->dma);
> -			if (test_bit(DMA_FENCE_WORK_IMM, &f->dma.flags))
> -				fence_work(&f->work);
> -			else
> -				queue_work(system_unbound_wq, &f->work);
> -		} else {
> -			fence_complete(f);
> -		}
> +			cmpxchg(&f->error, 0, fence->error);
> +
> +		dma_fence_get(&f->dma);
> +		if (test_bit(DMA_FENCE_WORK_IMM, &f->dma.flags))
> +			dma_fence_work_work(&f->work);
> +		else
> +			queue_work(system_unbound_wq, &f->work);
>  		break;
>  
>  	case FENCE_FREE:
> @@ -84,10 +83,11 @@ void dma_fence_work_init(struct dma_fence_work *f,
>  			 const struct dma_fence_work_ops *ops)
>  {
>  	f->ops = ops;
> +	f->error = 0;
>  	spin_lock_init(&f->lock);
>  	dma_fence_init(&f->dma, &fence_ops, &f->lock, 0, 0);
>  	i915_sw_fence_init(&f->chain, fence_notify);
> -	INIT_WORK(&f->work, fence_work);
> +	INIT_WORK(&f->work, dma_fence_work_work);
>  }
>  
>  int dma_fence_work_chain(struct dma_fence_work *f, struct dma_fence *signal)
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.h b/drivers/gpu/drm/i915/i915_sw_fence_work.h
> index d56806918d13..caa59fb5252b 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence_work.h
> +++ b/drivers/gpu/drm/i915/i915_sw_fence_work.h
> @@ -24,6 +24,7 @@ struct dma_fence_work_ops {
>  struct dma_fence_work {
>  	struct dma_fence dma;
>  	spinlock_t lock;
> +	int error;
>  
>  	struct i915_sw_fence chain;
>  	struct i915_sw_dma_fence_cb cb;
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 4b7fc4647e46..5123ac28ad9a 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -301,6 +301,11 @@ static void __vma_bind(struct dma_fence_work *work)
>  	struct i915_vma_work *vw = container_of(work, typeof(*vw), base);
>  	struct i915_vma *vma = vw->vma;
>  
> +	if (work->error) {
> +		dma_fence_set_error(&work->dma, work->error);
> +		return;
> +	}
> +
>  	vma->ops->bind_vma(vw->vm, &vw->stash,
>  			   vma, vw->cache_level, vw->flags);
>  }
> @@ -333,7 +338,7 @@ struct i915_vma_work *i915_vma_work(void)
>  		return NULL;
>  
>  	dma_fence_work_init(&vw->base, &bind_ops);
> -	vw->base.dma.error = -EAGAIN; /* disable the worker by default */
> +	vw->base.error = -EAGAIN; /* disable the worker by default */
>  
>  	return vw;
>  }
> @@ -416,6 +421,9 @@ int i915_vma_bind(struct i915_vma *vma,
>  		 * part of the obj->resv->excl_fence as it only affects
>  		 * execution and not content or object's backing store lifetime.
>  		 */
> +
> +		work->base.error = 0; /* enable the queue_work() */
> +
>  		prev = i915_active_set_exclusive(&vma->active, &work->base.dma);
>  		if (prev) {
>  			__i915_sw_fence_await_dma_fence(&work->base.chain,
> @@ -424,8 +432,6 @@ int i915_vma_bind(struct i915_vma *vma,
>  			dma_fence_put(prev);
>  		}
>  
> -		work->base.dma.error = 0; /* enable the queue_work() */
> -
>  		if (vma->obj) {
>  			__i915_gem_object_pin_pages(vma->obj);
>  			work->pinned = i915_gem_object_get(vma->obj);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
