Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246E037AD53
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 19:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0786EAA0;
	Tue, 11 May 2021 17:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3E26EA9F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 17:45:59 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id n2so31007242ejy.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=udpYQjf9aHNChwwHGSrBRgYPTaRzCIbcVJnJIo69O8w=;
 b=fhcbDRSc7QMsW1xEvUjpbebGwi6MqOWF9NUY1MtIXz9omlWId4UuJP5f+TDWkcP6bK
 7wrXH+QylcsShTdKGBzgkTa61X3oznXFD7AJGUbdfdhFpA4xdbp1sTJyknE30iY66CXy
 BWwLbJLGcAVegeSzwPscb30d4kyqo7494lAg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=udpYQjf9aHNChwwHGSrBRgYPTaRzCIbcVJnJIo69O8w=;
 b=iMlRCALZjOERmy9M7Io44Kt0N5kO3wKPuYUfqY5SuOiji1nlqWeJ7Z2eeoWgygKNZM
 iHkGiV4ZGC796QIkLhygdN7AxlBI2bwghvPOEysltEXfHdaR33ums1mDaAZrKvWaYYf/
 +NIzEVwa+7gT4SJNT3AqX6izNjL9YHYCQxsgvkMmbzigrNRQmPQmLCiNZTmqPewuuVS1
 PHnLrtHUWO+MC9fTLwdK6oy+SuAC1AvM71NMSS3MsCTcC75z+69lt37veRKBt0Oh6uNJ
 oD0JFalRi8jDAv08erThHnoQ+szu5wxU+QijoksfFo9J1xwXF0o7K10OzWu5wICT+oq8
 UCIA==
X-Gm-Message-State: AOAM533zJxbH+kFB30py0JK06WRrpZTsaP303JsdO8SqQQalnq/8uS/N
 AjCJRGWWgbJyho03cVVuXEBouw==
X-Google-Smtp-Source: ABdhPJzHMbzsNSggXYZ2cuwNU3IVjtnqC1/gZvwRIfW3kMkz5GvYJJMFUhxLZHOtUXxQbDuy9CX3lg==
X-Received: by 2002:a17:907:628d:: with SMTP id
 nd13mr32652008ejc.299.1620755157728; 
 Tue, 11 May 2021 10:45:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c5sm9498040eds.94.2021.05.11.10.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 10:45:57 -0700 (PDT)
Date: Tue, 11 May 2021 19:45:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 74/97] drm/i915/guc: Capture error state
 on context reset
Message-ID: <YJrC092WXSgvXNP1@phenom.ffwll.local>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-75-matthew.brost@intel.com>
 <YJqwqavmfNkz3iuy@phenom.ffwll.local>
 <20210511171230.GA363@sdutt-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511171230.GA363@sdutt-i7>
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

On Tue, May 11, 2021 at 10:12:32AM -0700, Matthew Brost wrote:
> On Tue, May 11, 2021 at 06:28:25PM +0200, Daniel Vetter wrote:
> > On Thu, May 06, 2021 at 12:14:28PM -0700, Matthew Brost wrote:
> > > We receive notification of an engine reset from GuC at its
> > > completion. Meaning GuC has potentially cleared any HW state
> > > we may have been interested in capturing. GuC resumes scheduling
> > > on the engine post-reset, as the resets are meant to be transparent,
> > > further muddling our error state.
> > > 
> > > There is ongoing work to define an API for a GuC debug state dump. The
> > > suggestion for now is to manually disable FW initiated resets in cases
> > > where debug state is needed.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > This looks a bit backwards to me:
> > 
> 
> Definitely a bit hacky but this patch does the best to capture the error as it
> can,
> 
> > - I figured we should capture error state when we get the G2H, in which
> >   case I hope we do know which the offending context was that got shot.
> >
> 
> We know which context was shot based on the G2H. See 'hung_ce' in this patch.

Ah maybe I should read more. Would be good to have comments on how the
locking works here, especially around reset it tends to be tricky.
Comments in the data structs/members.

> 
> > - For now we're missing the hw state, but we should still be able to
> >   capture the buffers userspace wants us to capture. So that could be
> >   wired up already?
> 
> Which buffers exactly? We dump all buffers associated with the context. 

There's an opt-in list that userspace can set in execbuf. Maybe that's the
one you mean.
-Daniel

> 
> > 
> > But yeah register state capturing needs support from GuC fw.
> >
> > I think this is a big enough miss in GuC features that we should list it
> > on the rfc as a thing to fix.
> 
> Agree this needs to be fixed.
> 
> Matt
> 
> > -Daniel
> > 
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_context.c       | 20 +++++++++++
> > >  drivers/gpu/drm/i915/gt/intel_context.h       |  3 ++
> > >  drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++++++++++-
> > >  drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 11 ++++--
> > >  drivers/gpu/drm/i915/gt/intel_engine_types.h  |  2 ++
> > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 35 +++++++++----------
> > >  drivers/gpu/drm/i915/i915_gpu_error.c         | 25 ++++++++++---
> > >  7 files changed, 91 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > > index 2f01437056a8..3fe7794b2bfd 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > > @@ -514,6 +514,26 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
> > >  	return rq;
> > >  }
> > >  
> > > +struct i915_request *intel_context_find_active_request(struct intel_context *ce)
> > > +{
> > > +	struct i915_request *rq, *active = NULL;
> > > +	unsigned long flags;
> > > +
> > > +	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
> > > +
> > > +	spin_lock_irqsave(&ce->guc_active.lock, flags);
> > > +	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
> > > +				    sched.link) {
> > > +		if (i915_request_completed(rq))
> > > +			break;
> > > +
> > > +		active = rq;
> > > +	}
> > > +	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
> > > +
> > > +	return active;
> > > +}
> > > +
> > >  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> > >  #include "selftest_context.c"
> > >  #endif
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > > index 9b211ca5ecc7..d2b499ed8a05 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > > @@ -195,6 +195,9 @@ int intel_context_prepare_remote_request(struct intel_context *ce,
> > >  
> > >  struct i915_request *intel_context_create_request(struct intel_context *ce);
> > >  
> > > +struct i915_request *
> > > +intel_context_find_active_request(struct intel_context *ce);
> > > +
> > >  static inline struct intel_ring *__intel_context_ring_size(u64 sz)
> > >  {
> > >  	return u64_to_ptr(struct intel_ring, sz);
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> > > index 3321d0917a99..bb94963a9fa2 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> > > @@ -242,7 +242,7 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
> > >  				   ktime_t *now);
> > >  
> > >  struct i915_request *
> > > -intel_engine_find_active_request(struct intel_engine_cs *engine);
> > > +intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine);
> > >  
> > >  u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
> > >  
> > > @@ -316,4 +316,23 @@ intel_engine_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
> > >  	return engine->cops->get_sibling(engine, sibling);
> > >  }
> > >  
> > > +static inline void
> > > +intel_engine_set_hung_context(struct intel_engine_cs *engine,
> > > +			      struct intel_context *ce)
> > > +{
> > > +	engine->hung_ce = ce;
> > > +}
> > > +
> > > +static inline void
> > > +intel_engine_clear_hung_context(struct intel_engine_cs *engine)
> > > +{
> > > +	intel_engine_set_hung_context(engine, NULL);
> > > +}
> > > +
> > > +static inline struct intel_context *
> > > +intel_engine_get_hung_context(struct intel_engine_cs *engine)
> > > +{
> > > +	return engine->hung_ce;
> > > +}
> > > +
> > >  #endif /* _INTEL_RINGBUFFER_H_ */
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > index 10300db1c9a6..ad3987289f09 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > @@ -1727,7 +1727,7 @@ void intel_engine_dump(struct intel_engine_cs *engine,
> > >  	drm_printf(m, "\tRequests:\n");
> > >  
> > >  	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> > > -	rq = intel_engine_find_active_request(engine);
> > > +	rq = intel_engine_execlist_find_hung_request(engine);
> > >  	if (rq) {
> > >  		struct intel_timeline *tl = get_timeline(rq);
> > >  
> > > @@ -1838,10 +1838,17 @@ static bool match_ring(struct i915_request *rq)
> > >  }
> > >  
> > >  struct i915_request *
> > > -intel_engine_find_active_request(struct intel_engine_cs *engine)
> > > +intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
> > >  {
> > >  	struct i915_request *request, *active = NULL;
> > >  
> > > +	/*
> > > +	 * This search does not work in GuC submission mode. However, the GuC
> > > +	 * will report the hanging context directly to the driver itself. So
> > > +	 * the driver should never get here when in GuC mode.
> > > +	 */
> > > +	GEM_BUG_ON(intel_uc_uses_guc_submission(&engine->gt->uc));
> > > +
> > >  	/*
> > >  	 * We are called by the error capture, reset and to dump engine
> > >  	 * state at random points in time. In particular, note that neither is
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > index b84562b2708b..bba53e3b39b9 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > > @@ -304,6 +304,8 @@ struct intel_engine_cs {
> > >  	/* keep a request in reserve for a [pm] barrier under oom */
> > >  	struct i915_request *request_pool;
> > >  
> > > +	struct intel_context *hung_ce;
> > > +
> > >  	struct llist_head barrier_tasks;
> > >  
> > >  	struct intel_context *kernel_context; /* pinned */
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index 22f17a055b21..6b3b74e50b31 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -726,24 +726,6 @@ __unwind_incomplete_requests(struct intel_context *ce)
> > >  	spin_unlock_irqrestore(&sched_engine->lock, flags);
> > >  }
> > >  
> > > -static struct i915_request *context_find_active_request(struct intel_context *ce)
> > > -{
> > > -	struct i915_request *rq, *active = NULL;
> > > -	unsigned long flags;
> > > -
> > > -	spin_lock_irqsave(&ce->guc_active.lock, flags);
> > > -	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
> > > -				    sched.link) {
> > > -		if (i915_request_completed(rq))
> > > -			break;
> > > -
> > > -		active = rq;
> > > -	}
> > > -	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
> > > -
> > > -	return active;
> > > -}
> > > -
> > >  static void __guc_reset_context(struct intel_context *ce, bool stalled)
> > >  {
> > >  	struct i915_request *rq;
> > > @@ -757,7 +739,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
> > >  	 */
> > >  	clr_context_enabled(ce);
> > >  
> > > -	rq = context_find_active_request(ce);
> > > +	rq = intel_context_find_active_request(ce);
> > >  	if (!rq) {
> > >  		head = ce->ring->tail;
> > >  		stalled = false;
> > > @@ -2192,6 +2174,20 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
> > >  	return 0;
> > >  }
> > >  
> > > +static void capture_error_state(struct intel_guc *guc,
> > > +				struct intel_context *ce)
> > > +{
> > > +	struct intel_gt *gt = guc_to_gt(guc);
> > > +	struct drm_i915_private *i915 = gt->i915;
> > > +	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
> > > +	intel_wakeref_t wakeref;
> > > +
> > > +	intel_engine_set_hung_context(engine, ce);
> > > +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> > > +		i915_capture_error_state(gt, engine->mask);
> > > +	atomic_inc(&i915->gpu_error.reset_engine_count[engine->uabi_class]);
> > > +}
> > > +
> > >  static void guc_context_replay(struct intel_context *ce)
> > >  {
> > >  	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
> > > @@ -2204,6 +2200,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
> > >  				     struct intel_context *ce)
> > >  {
> > >  	trace_intel_context_reset(ce);
> > > +	capture_error_state(guc, ce);
> > >  	guc_context_replay(ce);
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> > > index 3352f56bcf63..825bdfe44225 100644
> > > --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> > > +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> > > @@ -1435,20 +1435,37 @@ capture_engine(struct intel_engine_cs *engine,
> > >  {
> > >  	struct intel_engine_capture_vma *capture = NULL;
> > >  	struct intel_engine_coredump *ee;
> > > -	struct i915_request *rq;
> > > +	struct intel_context *ce;
> > > +	struct i915_request *rq = NULL;
> > >  	unsigned long flags;
> > >  
> > >  	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
> > >  	if (!ee)
> > >  		return NULL;
> > >  
> > > -	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> > > -	rq = intel_engine_find_active_request(engine);
> > > +	ce = intel_engine_get_hung_context(engine);
> > > +	if (ce) {
> > > +		intel_engine_clear_hung_context(engine);
> > > +		rq = intel_context_find_active_request(ce);
> > > +		if (!rq || !i915_request_started(rq))
> > > +			goto no_request_capture;
> > > +	} else {
> > > +		/*
> > > +		 * Getting here with GuC enabled means it is a forced error capture
> > > +		 * with no actual hang. So, no need to attempt the execlist search.
> > > +		 */
> > > +		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
> > > +			spin_lock_irqsave(&engine->sched_engine->lock, flags);
> > > +			rq = intel_engine_execlist_find_hung_request(engine);
> > > +			spin_unlock_irqrestore(&engine->sched_engine->lock,
> > > +					       flags);
> > > +		}
> > > +	}
> > >  	if (rq)
> > >  		capture = intel_engine_coredump_add_request(ee, rq,
> > >  							    ATOMIC_MAYFAIL);
> > > -	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> > >  	if (!capture) {
> > > +no_request_capture:
> > >  		kfree(ee);
> > >  		return NULL;
> > >  	}
> > > -- 
> > > 2.28.0
> > > 
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
