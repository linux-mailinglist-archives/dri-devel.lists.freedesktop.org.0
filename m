Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633233E5874
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 12:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77EB898F5;
	Tue, 10 Aug 2021 10:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA42898F5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 10:36:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 203-20020a1c00d40000b02902e6a4e244e4so563662wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 03:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=406Pfr5R/LtUft8lne98RJjI6XyjkDdwuzXaHYRrFSE=;
 b=O4tfeZGNiVQgg2vXvvsSx7Wm/2vju0wZcMZMuiQGHOn1xf/N7IydF9/p1w8QUte1Rg
 RwhaVXiVteo9rBxIayycTJC+APM1QpWQp35++uWwXCzjWBkruQxbY8wgvpUmo/p6+Ibs
 JuDf4lV4oGh7ukCxqlo/WxmRuJpjqF22iLJk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=406Pfr5R/LtUft8lne98RJjI6XyjkDdwuzXaHYRrFSE=;
 b=CjukrmXFY0OWSWvs2D7VtLPOFID1OSXz8R9ei8+bL4F8yVFHfxEhIrXv2TyJr1nK/H
 CihIK+D/Gp6fX794x0JDcYjyFm2IKP8AwYgiuzXMZxDYooz9Eeb7tvJQTGbYtFzOj8L0
 MdBGySyxM4OM9NePzVUbyVh3saeaamgCneyCd/0o5ASkAbRxubG6l9DCjCNHc4bCrHUW
 cwGbVdtNWmMnk4Atm9MCRCg86hYvkWOAvAb+eF3bcJb83jaoFeZdE6nrnHhhZwpE3R2D
 Y6cSqMBWI8XFgXNk9TD61z2tHHOLTKuG1kKVzpXGr2yw8QLbI2KSlzVddC26glcB4vYe
 b0Nw==
X-Gm-Message-State: AOAM5336/Dpl6lmKPRyo70yVcULSSwF2WcuKYoypJEBCLlhR/QMNOdd5
 8Ysy5ecwcyHfyb5Jd5fqKFPlRO0csIepvA==
X-Google-Smtp-Source: ABdhPJwBAGMd61sy1d0UT+SK2W1IttWcrJ9Ep2d3M8qcc9kZpj30TfVW3zAWJbUuHBTB8+QEX+sl1A==
X-Received: by 2002:a1c:27c2:: with SMTP id n185mr21260947wmn.20.1628591790195; 
 Tue, 10 Aug 2021 03:36:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h4sm5472404wrb.16.2021.08.10.03.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:36:29 -0700 (PDT)
Date: Tue, 10 Aug 2021 12:36:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/selftests: Add initial GuC
 selftest for scrubbing lost G2H
Message-ID: <YRJWq4bI4hpY631U@phenom.ffwll.local>
References: <20210808180757.81440-1-matthew.brost@intel.com>
 <20210808180757.81440-4-matthew.brost@intel.com>
 <YRE1sP6aelWMJaY8@phenom.ffwll.local>
 <20210809194129.GA124324@DUT151-ICLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210809194129.GA124324@DUT151-ICLU.fm.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Aug 09, 2021 at 07:41:29PM +0000, Matthew Brost wrote:
> On Mon, Aug 09, 2021 at 04:03:28PM +0200, Daniel Vetter wrote:
> > On Sun, Aug 08, 2021 at 11:07:57AM -0700, Matthew Brost wrote:
> > > While debugging an issue with full GT resets I went down a rabbit hole
> > > thinking the scrubbing of lost G2H wasn't working correctly. This proved
> > > to be incorrect as this was working just fine but this chase inspired me
> > > to write a selftest to prove that this works. This simple selftest
> > > injects errors dropping various G2H and then issues a full GT reset
> > > proving that the scrubbing of these G2H doesn't blow up.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_context_types.h |   4 +
> > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  18 +++
> > >  drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 126 ++++++++++++++++++
> > >  .../drm/i915/selftests/i915_live_selftests.h  |   1 +
> > >  .../i915/selftests/intel_scheduler_helpers.c  |  12 ++
> > >  .../i915/selftests/intel_scheduler_helpers.h  |   2 +
> > >  6 files changed, 163 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > index e54351a170e2..fec5ff7ef168 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > @@ -198,6 +198,10 @@ struct intel_context {
> > >  	 */
> > >  	u8 guc_prio;
> > >  	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
> > > +
> > 
> > I know the existing stuff isn't following this at all, but for anything
> > new we really should put some kerneldoc into structures. This probably
> > means you need to open-code the #ifdef here, since this macro will likely
> > upset kerneldoc parsing.
> > 
> 
> Ok, got it.
> 
> > > +	I915_SELFTEST_DECLARE(bool drop_schedule_enable);
> > > +	I915_SELFTEST_DECLARE(bool drop_schedule_disable);
> > > +	I915_SELFTEST_DECLARE(bool drop_deregister);
> > >  };
> > >  
> > >  #endif /* __INTEL_CONTEXT_TYPES__ */
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index cd8df078ca87..d13dc56bae43 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -2618,6 +2618,11 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
> > >  
> > >  	trace_intel_context_deregister_done(ce);
> > >  
> > > +	if (I915_SELFTEST_ONLY(ce->drop_deregister)) {
> > > +		I915_SELFTEST_DECLARE(ce->drop_deregister = false;)
> > 
> > This macro wrapping is quite nasty, can't we just #ifdef this? Especially
> > the _DECLARE name really doesn't expect a statement.
> >
> 
> Had it like that originally then remember these marcos and in the past
> people have complained when I didn't use them, so yes pretty much a
> bikeshed. I personally like the ifdef myself.

I think the plain #ifdef is much clearer in the code. The
I915_SELFTEST_ONLY macro makes some sense to compile stuff out in some
cases and make sure it's wrapped in unlikely when enabled, and often
that's good enough. But not here.

Also because it breaks kerneldoc I don't like the macro really in structs
either. Anything that discourages people from writing solid comments is
Not Good at All :-) So another reason to not like I915_SELFTEST_DECLARE()
macro.
-Daniel

> 
> Matt
>  
> > Aside from these bikesheds I don't have a much to say on the test logic
> > itself, since I'm far from knowledgable on guc stuff ...
> > -Daniel
> > 
> > 
> > > +		return 0;
> > > +	}
> > > +
> > >  	if (context_wait_for_deregister_to_register(ce)) {
> > >  		struct intel_runtime_pm *runtime_pm =
> > >  			&ce->engine->gt->i915->runtime_pm;
> > > @@ -2672,10 +2677,19 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
> > >  	trace_intel_context_sched_done(ce);
> > >  
> > >  	if (context_pending_enable(ce)) {
> > > +		if (I915_SELFTEST_ONLY(ce->drop_schedule_enable)) {
> > > +			I915_SELFTEST_DECLARE(ce->drop_schedule_enable = false;)
> > > +			return 0;
> > > +		}
> > >  		clr_context_pending_enable(ce);
> > >  	} else if (context_pending_disable(ce)) {
> > >  		bool banned;
> > >  
> > > +		if (I915_SELFTEST_ONLY(ce->drop_schedule_disable)) {
> > > +			I915_SELFTEST_DECLARE(ce->drop_schedule_disable = false;)
> > > +			return 0;
> > > +		}
> > > +
> > >  		/*
> > >  		 * Unpin must be done before __guc_signal_context_fence,
> > >  		 * otherwise a race exists between the requests getting
> > > @@ -3047,3 +3061,7 @@ bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
> > >  
> > >  	return false;
> > >  }
> > > +
> > > +#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> > > +#include "selftest_guc.c"
> > > +#endif
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> > > new file mode 100644
> > > index 000000000000..46ca6554f65d
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> > > @@ -0,0 +1,126 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright �� 2021 Intel Corporation
> > > + */
> > > +
> > > +#include "selftests/intel_scheduler_helpers.h"
> > > +
> > > +static struct i915_request *nop_user_request(struct intel_context *ce,
> > > +					     struct i915_request *from)
> > > +{
> > > +	struct i915_request *rq;
> > > +	int ret;
> > > +
> > > +	rq = intel_context_create_request(ce);
> > > +	if (IS_ERR(rq))
> > > +		return rq;
> > > +
> > > +	if (from) {
> > > +		ret = i915_sw_fence_await_dma_fence(&rq->submit,
> > > +						    &from->fence, 0,
> > > +						    I915_FENCE_GFP);
> > > +		if (ret < 0) {
> > > +			i915_request_put(rq);
> > > +			return ERR_PTR(ret);
> > > +		}
> > > +	}
> > > +
> > > +	i915_request_get(rq);
> > > +	i915_request_add(rq);
> > > +
> > > +	return rq;
> > > +}
> > > +
> > > +static int intel_guc_scrub_ctbs(void *arg)
> > > +{
> > > +	struct intel_gt *gt = arg;
> > > +	int ret = 0;
> > > +	int i;
> > > +	struct i915_request *last[3] = {NULL, NULL, NULL}, *rq;
> > > +	intel_wakeref_t wakeref;
> > > +	struct intel_engine_cs *engine;
> > > +	struct intel_context *ce;
> > > +
> > > +	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
> > > +	engine = intel_selftest_find_any_engine(gt);
> > > +
> > > +	/* Submit requests and inject errors forcing G2H to be dropped */
> > > +	for (i = 0; i < 3; ++i) {
> > > +		ce = intel_context_create(engine);
> > > +		if (IS_ERR(ce)) {
> > > +			ret = PTR_ERR(ce);
> > > +			pr_err("Failed to create context, %d: %d\n", i, ret);
> > > +			goto err;
> > > +		}
> > > +
> > > +		switch(i) {
> > > +		case 0:
> > > +			ce->drop_schedule_enable = true;
> > > +			break;
> > > +		case 1:
> > > +			ce->drop_schedule_disable = true;
> > > +			break;
> > > +		case 2:
> > > +			ce->drop_deregister = true;
> > > +			break;
> > > +		}
> > > +
> > > +		rq = nop_user_request(ce, NULL);
> > > +		intel_context_put(ce);
> > > +
> > > +		if (IS_ERR(rq)) {
> > > +			ret = PTR_ERR(rq);
> > > +			pr_err("Failed to create request, %d: %d\n", i, ret);
> > > +			goto err;
> > > +		}
> > > +
> > > +		last[i] = rq;
> > > +	}
> > > +
> > > +	for (i = 0; i < 3; ++i) {
> > > +		ret = i915_request_wait(last[i], 0, HZ);
> > > +		if (ret < 0) {
> > > +			pr_err("Last request failed to complete: %d\n", ret);
> > > +			goto err;
> > > +		}
> > > +		i915_request_put(last[i]);
> > > +		last[i] = NULL;
> > > +	}
> > > +
> > > +	/* Force all H2G / G2H to be submitted / processed */
> > > +	intel_gt_retire_requests(gt);
> > > +	msleep(500);
> > > +
> > > +	/* Scrub missing G2H */
> > > +	intel_gt_handle_error(engine->gt, -1, 0, "selftest reset");
> > > +
> > > +	ret = intel_gt_wait_for_idle(gt, HZ);
> > > +	if (ret < 0) {
> > > +		pr_err("GT failed to idle: %d\n", ret);
> > > +		goto err;
> > > +	}
> > > +
> > > +err:
> > > +	for (i = 0; i < 3; ++i)
> > > +		if (last[i])
> > > +			i915_request_put(last[i]);
> > > +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +int intel_guc_live_selftests(struct drm_i915_private *i915)
> > > +{
> > > +	static const struct i915_subtest tests[] = {
> > > +		SUBTEST(intel_guc_scrub_ctbs),
> > > +	};
> > > +	struct intel_gt *gt = &i915->gt;
> > > +
> > > +	if (intel_gt_is_wedged(gt))
> > > +		return 0;
> > > +
> > > +	if (!intel_uc_uses_guc_submission(&gt->uc))
> > > +		return 0;
> > > +
> > > +	return intel_gt_live_subtests(tests, gt);
> > > +}
> > > diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> > > index cfa5c4165a4f..3cf6758931f9 100644
> > > --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> > > +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> > > @@ -47,5 +47,6 @@ selftest(execlists, intel_execlists_live_selftests)
> > >  selftest(ring_submission, intel_ring_submission_live_selftests)
> > >  selftest(perf, i915_perf_live_selftests)
> > >  selftest(slpc, intel_slpc_live_selftests)
> > > +selftest(guc, intel_guc_live_selftests)
> > >  /* Here be dragons: keep last to run last! */
> > >  selftest(late_gt_pm, intel_gt_pm_late_selftests)
> > > diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> > > index 4b328346b48a..310fb83c527e 100644
> > > --- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> > > +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> > > @@ -14,6 +14,18 @@
> > >  #define REDUCED_PREEMPT		10
> > >  #define WAIT_FOR_RESET_TIME	10000
> > >  
> > > +struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt)
> > > +{
> > > +	struct intel_engine_cs *engine;
> > > +	enum intel_engine_id id;
> > > +
> > > +	for_each_engine(engine, gt, id)
> > > +		return engine;
> > > +
> > > +	pr_err("No valid engine found!\n");
> > > +	return NULL;
> > > +}
> > > +
> > >  int intel_selftest_modify_policy(struct intel_engine_cs *engine,
> > >  				 struct intel_selftest_saved_policy *saved,
> > >  				 u32 modify_type)
> > > diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> > > index 35c098601ac0..ae60bb507f45 100644
> > > --- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> > > +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> > > @@ -10,6 +10,7 @@
> > >  
> > >  struct i915_request;
> > >  struct intel_engine_cs;
> > > +struct intel_gt;
> > >  
> > >  struct intel_selftest_saved_policy {
> > >  	u32 flags;
> > > @@ -23,6 +24,7 @@ enum selftest_scheduler_modify {
> > >  	SELFTEST_SCHEDULER_MODIFY_FAST_RESET,
> > >  };
> > >  
> > > +struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt);
> > >  int intel_selftest_modify_policy(struct intel_engine_cs *engine,
> > >  				 struct intel_selftest_saved_policy *saved,
> > >  				 enum selftest_scheduler_modify modify_type);
> > > -- 
> > > 2.28.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
