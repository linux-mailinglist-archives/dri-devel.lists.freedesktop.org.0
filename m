Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 434993E4721
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 16:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896A989BAC;
	Mon,  9 Aug 2021 14:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F8489856
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:03:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id n12so11561280wrr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6+a1df4/v+4x1PK+l0WiB9skK1GF9oyB8o/31IMfSG0=;
 b=d/EvWpREmFYzMY6eyF2mCQGL+M7npmweGbi4Hs3YfJ4W0rwuX4Sl6o0o3JVuPXPjAf
 gXnMGYZDS4iUxzhNA/2hUNcGHg38r5lcWT76Rl4dEUd19z7yDQkaJYk6UcUZ1qs2HQJ3
 QCsvu5l8BI2Fp9JKMkIriiOKhx2uXoER6kTzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6+a1df4/v+4x1PK+l0WiB9skK1GF9oyB8o/31IMfSG0=;
 b=eYqVLVdNuqAmsguXekqa7eSbeqBp/VIjuZ0TnhQhPT1biHlyK3NwJHZN2TScNyxxuw
 6DMJ2M2poZm7eJWcS6T5P5IpEA9SUmtnW+sNZw0kE6FKdsYk5vZ49ocbJynFkFiTpmCr
 ZjOmPqQDd41u8sygheQGwAyRbdvCnrfGVKTYfQ+sLEVtEyqH6m13PWWr6q0YhBxsPlF0
 iSzBxMydn5xGNJqLmqqOc2H+tSYRNcLJbGf6ExdI5y2rdusU+7tatFjrgBen71CgmliT
 k0+1yuP9hYt041vLRnEYQHVg3j1uUPVZKKT5vzpgYVgA/JQb7QCHNBMtMifmtU9i43zz
 dC3w==
X-Gm-Message-State: AOAM5314MgOjRcob2V3+1FfZl9cUWQUmBuUt6QZeuepTmcFw+yeIJQHL
 3mGL4VIVcpvxxLvOGcsqYIb1+w==
X-Google-Smtp-Source: ABdhPJw4h9i8fLyaYWaeOEueUlJXfKLfWffaBtP9F3PBVv6wUkyzjJ7e2wO+x7VHJ+COWqg+k1F2Eg==
X-Received: by 2002:a5d:4d0c:: with SMTP id z12mr24501530wrt.275.1628517810841; 
 Mon, 09 Aug 2021 07:03:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e10sm2190169wrt.82.2021.08.09.07.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 07:03:30 -0700 (PDT)
Date: Mon, 9 Aug 2021 16:03:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/selftests: Add initial GuC
 selftest for scrubbing lost G2H
Message-ID: <YRE1sP6aelWMJaY8@phenom.ffwll.local>
References: <20210808180757.81440-1-matthew.brost@intel.com>
 <20210808180757.81440-4-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210808180757.81440-4-matthew.brost@intel.com>
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

On Sun, Aug 08, 2021 at 11:07:57AM -0700, Matthew Brost wrote:
> While debugging an issue with full GT resets I went down a rabbit hole
> thinking the scrubbing of lost G2H wasn't working correctly. This proved
> to be incorrect as this was working just fine but this chase inspired me
> to write a selftest to prove that this works. This simple selftest
> injects errors dropping various G2H and then issues a full GT reset
> proving that the scrubbing of these G2H doesn't blow up.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_context_types.h |   4 +
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  18 +++
>  drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 126 ++++++++++++++++++
>  .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>  .../i915/selftests/intel_scheduler_helpers.c  |  12 ++
>  .../i915/selftests/intel_scheduler_helpers.h  |   2 +
>  6 files changed, 163 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index e54351a170e2..fec5ff7ef168 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -198,6 +198,10 @@ struct intel_context {
>  	 */
>  	u8 guc_prio;
>  	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
> +

I know the existing stuff isn't following this at all, but for anything
new we really should put some kerneldoc into structures. This probably
means you need to open-code the #ifdef here, since this macro will likely
upset kerneldoc parsing.

> +	I915_SELFTEST_DECLARE(bool drop_schedule_enable);
> +	I915_SELFTEST_DECLARE(bool drop_schedule_disable);
> +	I915_SELFTEST_DECLARE(bool drop_deregister);
>  };
>  
>  #endif /* __INTEL_CONTEXT_TYPES__ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index cd8df078ca87..d13dc56bae43 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2618,6 +2618,11 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>  
>  	trace_intel_context_deregister_done(ce);
>  
> +	if (I915_SELFTEST_ONLY(ce->drop_deregister)) {
> +		I915_SELFTEST_DECLARE(ce->drop_deregister = false;)

This macro wrapping is quite nasty, can't we just #ifdef this? Especially
the _DECLARE name really doesn't expect a statement.

Aside from these bikesheds I don't have a much to say on the test logic
itself, since I'm far from knowledgable on guc stuff ...
-Daniel


> +		return 0;
> +	}
> +
>  	if (context_wait_for_deregister_to_register(ce)) {
>  		struct intel_runtime_pm *runtime_pm =
>  			&ce->engine->gt->i915->runtime_pm;
> @@ -2672,10 +2677,19 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>  	trace_intel_context_sched_done(ce);
>  
>  	if (context_pending_enable(ce)) {
> +		if (I915_SELFTEST_ONLY(ce->drop_schedule_enable)) {
> +			I915_SELFTEST_DECLARE(ce->drop_schedule_enable = false;)
> +			return 0;
> +		}
>  		clr_context_pending_enable(ce);
>  	} else if (context_pending_disable(ce)) {
>  		bool banned;
>  
> +		if (I915_SELFTEST_ONLY(ce->drop_schedule_disable)) {
> +			I915_SELFTEST_DECLARE(ce->drop_schedule_disable = false;)
> +			return 0;
> +		}
> +
>  		/*
>  		 * Unpin must be done before __guc_signal_context_fence,
>  		 * otherwise a race exists between the requests getting
> @@ -3047,3 +3061,7 @@ bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
>  
>  	return false;
>  }
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> +#include "selftest_guc.c"
> +#endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> new file mode 100644
> index 000000000000..46ca6554f65d
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright �� 2021 Intel Corporation
> + */
> +
> +#include "selftests/intel_scheduler_helpers.h"
> +
> +static struct i915_request *nop_user_request(struct intel_context *ce,
> +					     struct i915_request *from)
> +{
> +	struct i915_request *rq;
> +	int ret;
> +
> +	rq = intel_context_create_request(ce);
> +	if (IS_ERR(rq))
> +		return rq;
> +
> +	if (from) {
> +		ret = i915_sw_fence_await_dma_fence(&rq->submit,
> +						    &from->fence, 0,
> +						    I915_FENCE_GFP);
> +		if (ret < 0) {
> +			i915_request_put(rq);
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
> +	i915_request_get(rq);
> +	i915_request_add(rq);
> +
> +	return rq;
> +}
> +
> +static int intel_guc_scrub_ctbs(void *arg)
> +{
> +	struct intel_gt *gt = arg;
> +	int ret = 0;
> +	int i;
> +	struct i915_request *last[3] = {NULL, NULL, NULL}, *rq;
> +	intel_wakeref_t wakeref;
> +	struct intel_engine_cs *engine;
> +	struct intel_context *ce;
> +
> +	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
> +	engine = intel_selftest_find_any_engine(gt);
> +
> +	/* Submit requests and inject errors forcing G2H to be dropped */
> +	for (i = 0; i < 3; ++i) {
> +		ce = intel_context_create(engine);
> +		if (IS_ERR(ce)) {
> +			ret = PTR_ERR(ce);
> +			pr_err("Failed to create context, %d: %d\n", i, ret);
> +			goto err;
> +		}
> +
> +		switch(i) {
> +		case 0:
> +			ce->drop_schedule_enable = true;
> +			break;
> +		case 1:
> +			ce->drop_schedule_disable = true;
> +			break;
> +		case 2:
> +			ce->drop_deregister = true;
> +			break;
> +		}
> +
> +		rq = nop_user_request(ce, NULL);
> +		intel_context_put(ce);
> +
> +		if (IS_ERR(rq)) {
> +			ret = PTR_ERR(rq);
> +			pr_err("Failed to create request, %d: %d\n", i, ret);
> +			goto err;
> +		}
> +
> +		last[i] = rq;
> +	}
> +
> +	for (i = 0; i < 3; ++i) {
> +		ret = i915_request_wait(last[i], 0, HZ);
> +		if (ret < 0) {
> +			pr_err("Last request failed to complete: %d\n", ret);
> +			goto err;
> +		}
> +		i915_request_put(last[i]);
> +		last[i] = NULL;
> +	}
> +
> +	/* Force all H2G / G2H to be submitted / processed */
> +	intel_gt_retire_requests(gt);
> +	msleep(500);
> +
> +	/* Scrub missing G2H */
> +	intel_gt_handle_error(engine->gt, -1, 0, "selftest reset");
> +
> +	ret = intel_gt_wait_for_idle(gt, HZ);
> +	if (ret < 0) {
> +		pr_err("GT failed to idle: %d\n", ret);
> +		goto err;
> +	}
> +
> +err:
> +	for (i = 0; i < 3; ++i)
> +		if (last[i])
> +			i915_request_put(last[i]);
> +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
> +
> +	return ret;
> +}
> +
> +int intel_guc_live_selftests(struct drm_i915_private *i915)
> +{
> +	static const struct i915_subtest tests[] = {
> +		SUBTEST(intel_guc_scrub_ctbs),
> +	};
> +	struct intel_gt *gt = &i915->gt;
> +
> +	if (intel_gt_is_wedged(gt))
> +		return 0;
> +
> +	if (!intel_uc_uses_guc_submission(&gt->uc))
> +		return 0;
> +
> +	return intel_gt_live_subtests(tests, gt);
> +}
> diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> index cfa5c4165a4f..3cf6758931f9 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> @@ -47,5 +47,6 @@ selftest(execlists, intel_execlists_live_selftests)
>  selftest(ring_submission, intel_ring_submission_live_selftests)
>  selftest(perf, i915_perf_live_selftests)
>  selftest(slpc, intel_slpc_live_selftests)
> +selftest(guc, intel_guc_live_selftests)
>  /* Here be dragons: keep last to run last! */
>  selftest(late_gt_pm, intel_gt_pm_late_selftests)
> diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> index 4b328346b48a..310fb83c527e 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> @@ -14,6 +14,18 @@
>  #define REDUCED_PREEMPT		10
>  #define WAIT_FOR_RESET_TIME	10000
>  
> +struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt)
> +{
> +	struct intel_engine_cs *engine;
> +	enum intel_engine_id id;
> +
> +	for_each_engine(engine, gt, id)
> +		return engine;
> +
> +	pr_err("No valid engine found!\n");
> +	return NULL;
> +}
> +
>  int intel_selftest_modify_policy(struct intel_engine_cs *engine,
>  				 struct intel_selftest_saved_policy *saved,
>  				 u32 modify_type)
> diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> index 35c098601ac0..ae60bb507f45 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> @@ -10,6 +10,7 @@
>  
>  struct i915_request;
>  struct intel_engine_cs;
> +struct intel_gt;
>  
>  struct intel_selftest_saved_policy {
>  	u32 flags;
> @@ -23,6 +24,7 @@ enum selftest_scheduler_modify {
>  	SELFTEST_SCHEDULER_MODIFY_FAST_RESET,
>  };
>  
> +struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt);
>  int intel_selftest_modify_policy(struct intel_engine_cs *engine,
>  				 struct intel_selftest_saved_policy *saved,
>  				 enum selftest_scheduler_modify modify_type);
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
