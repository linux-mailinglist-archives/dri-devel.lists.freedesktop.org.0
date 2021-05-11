Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21D37ABE8
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 18:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457146E15F;
	Tue, 11 May 2021 16:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8DF6E15F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 16:28:29 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b17so23633231ede.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 09:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9eK/Vz3DI6qZNATjyasR1VUwAnkZh+BCxhcut6ViFCw=;
 b=IfYMMUKKLNhSGjJjHHegSP/OsyXvV75T7jBUa8MuLNqUvJA/Kg7bcvgn6JMPfpDRG2
 cK3ZH1uqrg/dbcFV20oWDJDQWaytEMMNSALIe+xX7FBGdNCFMtPeTbZtTE437RJvRxP2
 f6Gyx9AW6peaC7amPkaIc/YbNRGk+CeTeVzIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9eK/Vz3DI6qZNATjyasR1VUwAnkZh+BCxhcut6ViFCw=;
 b=GSk8CETIU3A6CHNeaR61EjM9bDUBa1esiUi1B06QIFyXzGX4aTxvUjAlD6pzIit2f0
 mPYdclRyFRys92/DGYMik7kw1bKsafchoNKgi1+PCC586UscJmhZVaH8aGt+UXqJvbB6
 CABTN8YcA5PkRSvsq+K7VubGAfeH4uRHPq2qY8gfopLUj191lC51OplngqD/b5xPZDfE
 vt07ZkpEKI9oA8ReshT20a8/B+7qc+OOqHHvU6tAb9HBTfUOdaJKX4bzeC/55ApjkObH
 C7yykwV7h5MCcTN1W5Yp+qTCFqvDsgD1C5rypVEQTozlPPK4ZnAdfvV1Rcu6NV8Hmfbz
 5OaA==
X-Gm-Message-State: AOAM533dlrOMQ4LigDZIPgTzdiLsIoZEdPCKpS0bIVmP8ni+bMGbAjCO
 UlIoCDMKsTEZyJlwwXUVwpXSjQ==
X-Google-Smtp-Source: ABdhPJwpGMhk1CBedkcHC46gBwrlov9bBkix8DGUFX0jX1OQADEWDzuxY0dfWXKCiR8ZBd9tOtnTHg==
X-Received: by 2002:a50:ec89:: with SMTP id e9mr37511245edr.347.1620750507862; 
 Tue, 11 May 2021 09:28:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id um28sm12311367ejb.63.2021.05.11.09.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 09:28:27 -0700 (PDT)
Date: Tue, 11 May 2021 18:28:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 74/97] drm/i915/guc: Capture error state
 on context reset
Message-ID: <YJqwqavmfNkz3iuy@phenom.ffwll.local>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-75-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-75-matthew.brost@intel.com>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:14:28PM -0700, Matthew Brost wrote:
> We receive notification of an engine reset from GuC at its
> completion. Meaning GuC has potentially cleared any HW state
> we may have been interested in capturing. GuC resumes scheduling
> on the engine post-reset, as the resets are meant to be transparent,
> further muddling our error state.
> 
> There is ongoing work to define an API for a GuC debug state dump. The
> suggestion for now is to manually disable FW initiated resets in cases
> where debug state is needed.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

This looks a bit backwards to me:

- I figured we should capture error state when we get the G2H, in which
  case I hope we do know which the offending context was that got shot.

- For now we're missing the hw state, but we should still be able to
  capture the buffers userspace wants us to capture. So that could be
  wired up already?

But yeah register state capturing needs support from GuC fw.

I think this is a big enough miss in GuC features that we should list it
on the rfc as a thing to fix.
-Daniel

> ---
>  drivers/gpu/drm/i915/gt/intel_context.c       | 20 +++++++++++
>  drivers/gpu/drm/i915/gt/intel_context.h       |  3 ++
>  drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++++++++++-
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 11 ++++--
>  drivers/gpu/drm/i915/gt/intel_engine_types.h  |  2 ++
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 35 +++++++++----------
>  drivers/gpu/drm/i915/i915_gpu_error.c         | 25 ++++++++++---
>  7 files changed, 91 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 2f01437056a8..3fe7794b2bfd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -514,6 +514,26 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
>  	return rq;
>  }
>  
> +struct i915_request *intel_context_find_active_request(struct intel_context *ce)
> +{
> +	struct i915_request *rq, *active = NULL;
> +	unsigned long flags;
> +
> +	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
> +
> +	spin_lock_irqsave(&ce->guc_active.lock, flags);
> +	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
> +				    sched.link) {
> +		if (i915_request_completed(rq))
> +			break;
> +
> +		active = rq;
> +	}
> +	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
> +
> +	return active;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>  #include "selftest_context.c"
>  #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 9b211ca5ecc7..d2b499ed8a05 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -195,6 +195,9 @@ int intel_context_prepare_remote_request(struct intel_context *ce,
>  
>  struct i915_request *intel_context_create_request(struct intel_context *ce);
>  
> +struct i915_request *
> +intel_context_find_active_request(struct intel_context *ce);
> +
>  static inline struct intel_ring *__intel_context_ring_size(u64 sz)
>  {
>  	return u64_to_ptr(struct intel_ring, sz);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 3321d0917a99..bb94963a9fa2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -242,7 +242,7 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
>  				   ktime_t *now);
>  
>  struct i915_request *
> -intel_engine_find_active_request(struct intel_engine_cs *engine);
> +intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine);
>  
>  u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
>  
> @@ -316,4 +316,23 @@ intel_engine_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
>  	return engine->cops->get_sibling(engine, sibling);
>  }
>  
> +static inline void
> +intel_engine_set_hung_context(struct intel_engine_cs *engine,
> +			      struct intel_context *ce)
> +{
> +	engine->hung_ce = ce;
> +}
> +
> +static inline void
> +intel_engine_clear_hung_context(struct intel_engine_cs *engine)
> +{
> +	intel_engine_set_hung_context(engine, NULL);
> +}
> +
> +static inline struct intel_context *
> +intel_engine_get_hung_context(struct intel_engine_cs *engine)
> +{
> +	return engine->hung_ce;
> +}
> +
>  #endif /* _INTEL_RINGBUFFER_H_ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 10300db1c9a6..ad3987289f09 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1727,7 +1727,7 @@ void intel_engine_dump(struct intel_engine_cs *engine,
>  	drm_printf(m, "\tRequests:\n");
>  
>  	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> -	rq = intel_engine_find_active_request(engine);
> +	rq = intel_engine_execlist_find_hung_request(engine);
>  	if (rq) {
>  		struct intel_timeline *tl = get_timeline(rq);
>  
> @@ -1838,10 +1838,17 @@ static bool match_ring(struct i915_request *rq)
>  }
>  
>  struct i915_request *
> -intel_engine_find_active_request(struct intel_engine_cs *engine)
> +intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
>  {
>  	struct i915_request *request, *active = NULL;
>  
> +	/*
> +	 * This search does not work in GuC submission mode. However, the GuC
> +	 * will report the hanging context directly to the driver itself. So
> +	 * the driver should never get here when in GuC mode.
> +	 */
> +	GEM_BUG_ON(intel_uc_uses_guc_submission(&engine->gt->uc));
> +
>  	/*
>  	 * We are called by the error capture, reset and to dump engine
>  	 * state at random points in time. In particular, note that neither is
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index b84562b2708b..bba53e3b39b9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -304,6 +304,8 @@ struct intel_engine_cs {
>  	/* keep a request in reserve for a [pm] barrier under oom */
>  	struct i915_request *request_pool;
>  
> +	struct intel_context *hung_ce;
> +
>  	struct llist_head barrier_tasks;
>  
>  	struct intel_context *kernel_context; /* pinned */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 22f17a055b21..6b3b74e50b31 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -726,24 +726,6 @@ __unwind_incomplete_requests(struct intel_context *ce)
>  	spin_unlock_irqrestore(&sched_engine->lock, flags);
>  }
>  
> -static struct i915_request *context_find_active_request(struct intel_context *ce)
> -{
> -	struct i915_request *rq, *active = NULL;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&ce->guc_active.lock, flags);
> -	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
> -				    sched.link) {
> -		if (i915_request_completed(rq))
> -			break;
> -
> -		active = rq;
> -	}
> -	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
> -
> -	return active;
> -}
> -
>  static void __guc_reset_context(struct intel_context *ce, bool stalled)
>  {
>  	struct i915_request *rq;
> @@ -757,7 +739,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>  	 */
>  	clr_context_enabled(ce);
>  
> -	rq = context_find_active_request(ce);
> +	rq = intel_context_find_active_request(ce);
>  	if (!rq) {
>  		head = ce->ring->tail;
>  		stalled = false;
> @@ -2192,6 +2174,20 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>  	return 0;
>  }
>  
> +static void capture_error_state(struct intel_guc *guc,
> +				struct intel_context *ce)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
> +	intel_wakeref_t wakeref;
> +
> +	intel_engine_set_hung_context(engine, ce);
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> +		i915_capture_error_state(gt, engine->mask);
> +	atomic_inc(&i915->gpu_error.reset_engine_count[engine->uabi_class]);
> +}
> +
>  static void guc_context_replay(struct intel_context *ce)
>  {
>  	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
> @@ -2204,6 +2200,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>  				     struct intel_context *ce)
>  {
>  	trace_intel_context_reset(ce);
> +	capture_error_state(guc, ce);
>  	guc_context_replay(ce);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 3352f56bcf63..825bdfe44225 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1435,20 +1435,37 @@ capture_engine(struct intel_engine_cs *engine,
>  {
>  	struct intel_engine_capture_vma *capture = NULL;
>  	struct intel_engine_coredump *ee;
> -	struct i915_request *rq;
> +	struct intel_context *ce;
> +	struct i915_request *rq = NULL;
>  	unsigned long flags;
>  
>  	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
>  	if (!ee)
>  		return NULL;
>  
> -	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> -	rq = intel_engine_find_active_request(engine);
> +	ce = intel_engine_get_hung_context(engine);
> +	if (ce) {
> +		intel_engine_clear_hung_context(engine);
> +		rq = intel_context_find_active_request(ce);
> +		if (!rq || !i915_request_started(rq))
> +			goto no_request_capture;
> +	} else {
> +		/*
> +		 * Getting here with GuC enabled means it is a forced error capture
> +		 * with no actual hang. So, no need to attempt the execlist search.
> +		 */
> +		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
> +			spin_lock_irqsave(&engine->sched_engine->lock, flags);
> +			rq = intel_engine_execlist_find_hung_request(engine);
> +			spin_unlock_irqrestore(&engine->sched_engine->lock,
> +					       flags);
> +		}
> +	}
>  	if (rq)
>  		capture = intel_engine_coredump_add_request(ee, rq,
>  							    ATOMIC_MAYFAIL);
> -	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>  	if (!capture) {
> +no_request_capture:
>  		kfree(ee);
>  		return NULL;
>  	}
> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
