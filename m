Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F973727A0
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 10:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6C86EAB9;
	Tue,  4 May 2021 08:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2C66EAB1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 08:55:25 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id n2so11961975ejy.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 01:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eLw3zrjxweT/h/dyCKcddMcCVHzRlToeGx7lX+e+ESk=;
 b=UU3gW5hJfIDNx2HaBLyhJ2LUOna6lSpd2ig3kWC1r8FbcHVYVh5al7X/lr7CCd4X8e
 SXxBtY+0dOGFFaA1lW8T+qimLHMymhw47M93KYdBbBy85JdCs023N2Q84ebGUiPEVx5B
 acE9VOirFPCHGn5utNTTVLCBDPjx4KPB0xUrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eLw3zrjxweT/h/dyCKcddMcCVHzRlToeGx7lX+e+ESk=;
 b=nHB4tGPo9kro+RgKairw25dKjLELdhHnsASawqe8FZAOXvgpIg+HRA2mPL4WD1VUJp
 pe8Pzl/ZUxsCCp61zf4QxXjk64fZcJIU30UgEvlNJ19TCAoEr1+3b3zI/PUYqkjJFsg5
 XIS6b5vguYe0zesjuhxs2YFt9PCsLoOO2/gFcbGAyyMbldZa+X6XNlY+N4xZVoNh/EHA
 z+z0bOQbr/2Q6FLPqYHft+Pn1Y/Ks4ykJ9YY49Q3sHw0w7cDRTxELzS7vNy8bx7pGIFD
 m/jxfB0KAlKjeVe+YolNFDEnAkFPtWExTplieA1pDrmvD8qHJ+1hFz26kn2wDUgYllt1
 XpUg==
X-Gm-Message-State: AOAM533Yk7jIqE6QjuYPz+d7k2bq5v+L1pEaZcmxPpWVPRvUBejvGSWy
 pRdOqqAJCnO4hM6LjJrW+JvVBw==
X-Google-Smtp-Source: ABdhPJxtpZeyA8d3dxJx5dN1vaaV6s7jD5oOpTtuUcpBXxk1758Hpup8TS3+5LDwwZcHxhBvbl3hKQ==
X-Received: by 2002:a17:906:1e15:: with SMTP id
 g21mr20923427ejj.241.1620118524601; 
 Tue, 04 May 2021 01:55:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 9sm1044621ejv.73.2021.05.04.01.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 01:55:23 -0700 (PDT)
Date: Tue, 4 May 2021 10:55:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 11/27] drm/i915/request: Remove the hook from
 await_execution
Message-ID: <YJEL+gpE4sTL6F0Y@phenom.ffwll.local>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-12-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503155748.1961781-12-jason@jlekstrand.net>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 03, 2021 at 10:57:32AM -0500, Jason Ekstrand wrote:
> This was only ever used for FENCE_SUBMIT automatic engine selection
> which was removed in the previous commit.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

I really how this is now split up and much more decipherable what's going
on. For the three patches leading to here including this one:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  3 +-
>  drivers/gpu/drm/i915/i915_request.c           | 42 ++++---------------
>  drivers/gpu/drm/i915/i915_request.h           |  4 +-
>  3 files changed, 9 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index efb2fa3522a42..7024adcd5cf15 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3473,8 +3473,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  	if (in_fence) {
>  		if (args->flags & I915_EXEC_FENCE_SUBMIT)
>  			err = i915_request_await_execution(eb.request,
> -							   in_fence,
> -							   NULL);
> +							   in_fence);
>  		else
>  			err = i915_request_await_dma_fence(eb.request,
>  							   in_fence);
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index bec9c3652188b..7e00218b8c105 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -49,7 +49,6 @@
>  struct execute_cb {
>  	struct irq_work work;
>  	struct i915_sw_fence *fence;
> -	void (*hook)(struct i915_request *rq, struct dma_fence *signal);
>  	struct i915_request *signal;
>  };
>  
> @@ -180,17 +179,6 @@ static void irq_execute_cb(struct irq_work *wrk)
>  	kmem_cache_free(global.slab_execute_cbs, cb);
>  }
>  
> -static void irq_execute_cb_hook(struct irq_work *wrk)
> -{
> -	struct execute_cb *cb = container_of(wrk, typeof(*cb), work);
> -
> -	cb->hook(container_of(cb->fence, struct i915_request, submit),
> -		 &cb->signal->fence);
> -	i915_request_put(cb->signal);
> -
> -	irq_execute_cb(wrk);
> -}
> -
>  static __always_inline void
>  __notify_execute_cb(struct i915_request *rq, bool (*fn)(struct irq_work *wrk))
>  {
> @@ -517,17 +505,12 @@ static bool __request_in_flight(const struct i915_request *signal)
>  static int
>  __await_execution(struct i915_request *rq,
>  		  struct i915_request *signal,
> -		  void (*hook)(struct i915_request *rq,
> -			       struct dma_fence *signal),
>  		  gfp_t gfp)
>  {
>  	struct execute_cb *cb;
>  
> -	if (i915_request_is_active(signal)) {
> -		if (hook)
> -			hook(rq, &signal->fence);
> +	if (i915_request_is_active(signal))
>  		return 0;
> -	}
>  
>  	cb = kmem_cache_alloc(global.slab_execute_cbs, gfp);
>  	if (!cb)
> @@ -537,12 +520,6 @@ __await_execution(struct i915_request *rq,
>  	i915_sw_fence_await(cb->fence);
>  	init_irq_work(&cb->work, irq_execute_cb);
>  
> -	if (hook) {
> -		cb->hook = hook;
> -		cb->signal = i915_request_get(signal);
> -		cb->work.func = irq_execute_cb_hook;
> -	}
> -
>  	/*
>  	 * Register the callback first, then see if the signaler is already
>  	 * active. This ensures that if we race with the
> @@ -1253,7 +1230,7 @@ emit_semaphore_wait(struct i915_request *to,
>  		goto await_fence;
>  
>  	/* Only submit our spinner after the signaler is running! */
> -	if (__await_execution(to, from, NULL, gfp))
> +	if (__await_execution(to, from, gfp))
>  		goto await_fence;
>  
>  	if (__emit_semaphore_wait(to, from, from->fence.seqno))
> @@ -1284,16 +1261,14 @@ static int intel_timeline_sync_set_start(struct intel_timeline *tl,
>  
>  static int
>  __i915_request_await_execution(struct i915_request *to,
> -			       struct i915_request *from,
> -			       void (*hook)(struct i915_request *rq,
> -					    struct dma_fence *signal))
> +			       struct i915_request *from)
>  {
>  	int err;
>  
>  	GEM_BUG_ON(intel_context_is_barrier(from->context));
>  
>  	/* Submit both requests at the same time */
> -	err = __await_execution(to, from, hook, I915_FENCE_GFP);
> +	err = __await_execution(to, from, I915_FENCE_GFP);
>  	if (err)
>  		return err;
>  
> @@ -1406,9 +1381,7 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
>  
>  int
>  i915_request_await_execution(struct i915_request *rq,
> -			     struct dma_fence *fence,
> -			     void (*hook)(struct i915_request *rq,
> -					  struct dma_fence *signal))
> +			     struct dma_fence *fence)
>  {
>  	struct dma_fence **child = &fence;
>  	unsigned int nchild = 1;
> @@ -1441,8 +1414,7 @@ i915_request_await_execution(struct i915_request *rq,
>  
>  		if (dma_fence_is_i915(fence))
>  			ret = __i915_request_await_execution(rq,
> -							     to_request(fence),
> -							     hook);
> +							     to_request(fence));
>  		else
>  			ret = i915_request_await_external(rq, fence);
>  		if (ret < 0)
> @@ -1468,7 +1440,7 @@ await_request_submit(struct i915_request *to, struct i915_request *from)
>  							&from->submit,
>  							I915_FENCE_GFP);
>  	else
> -		return __i915_request_await_execution(to, from, NULL);
> +		return __i915_request_await_execution(to, from);
>  }
>  
>  static int
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 270f6cd37650c..63b087a7f5707 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -352,9 +352,7 @@ int i915_request_await_object(struct i915_request *to,
>  int i915_request_await_dma_fence(struct i915_request *rq,
>  				 struct dma_fence *fence);
>  int i915_request_await_execution(struct i915_request *rq,
> -				 struct dma_fence *fence,
> -				 void (*hook)(struct i915_request *rq,
> -					      struct dma_fence *signal));
> +				 struct dma_fence *fence);
>  
>  void i915_request_add(struct i915_request *rq);
>  
> -- 
> 2.31.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
