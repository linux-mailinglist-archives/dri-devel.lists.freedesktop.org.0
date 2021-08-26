Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4998D3F87D7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689556E839;
	Thu, 26 Aug 2021 12:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABEF6E839
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 12:44:35 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id i21so6030288ejd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 05:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AncdcBFmuzAW0S8RILLAlGBUQ7Ut1dIil3TO3zOlI84=;
 b=CWmnzOSoCGBgZIa1pKTXX5LDctxAuk9AS+UshcdrpkENmcE23zQuFawHH2V4E8nfFv
 PuGHxieJp0Zz2jrfGVak94cvf/6S7070vqQUnfO99tI3QkyrIo99+A66uuRN7Igjq4uN
 fdkdRUxp0mCr15BjOxjJZCdnGULFSFM0ka618=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AncdcBFmuzAW0S8RILLAlGBUQ7Ut1dIil3TO3zOlI84=;
 b=C8TlzAzfokK6zBBbWzbfWRkzDOtU5DEM3mEr9H+GmVLGi2pRKPKxHgQCX7Wi5e5wU3
 mQXm7KEIPxLzLCey5DDL1kIJPTnbDoLQt3mIQWy3iO/UBHqsXGEOx0AkIH6d8xrD/KqI
 Vf5joTWpjmuedaaMRaeUPJxoI/4QbgulRA4PY1Yi+YDMPanrs6NPVFG+8ZuU1V+nmETW
 8S0t5Dbi/Gq4T/EQJd3pQl1TNR+l/64Dx02tMW6i9ObbzUMB+kTvAokWfonrs3q/pq6V
 uYumDcxP7jmJHHrTZDdZcrTP7aFz3vBQij7F4EPF63l+SnSA04NsCsWkgxEB7Kz+T1y5
 +Yyw==
X-Gm-Message-State: AOAM531Hjb4tl3jVTXJkjwYqfuSOfLiJ0neUBc4mW0MGYWN6jgRmCgwr
 hqHxWYGCLvBzG782EV+qFNb1fw==
X-Google-Smtp-Source: ABdhPJxKZ536xW29fxXwWEdQNiY1SePBxAwxXiiNHUMx7EQzpeshLrFEVw2A/hOqixiFqYliaf+MNQ==
X-Received: by 2002:a17:907:76d8:: with SMTP id
 kf24mr4074832ejc.404.1629981874269; 
 Thu, 26 Aug 2021 05:44:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id gl2sm1366348ejb.110.2021.08.26.05.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 05:44:33 -0700 (PDT)
Date: Thu, 26 Aug 2021 14:44:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Brost Matthew <matthew.brost@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/gt: Register the migrate
 contexts with their engines
Message-ID: <YSeMr9cBPLOMXhyL@phenom.ffwll.local>
References: <20210826104514.400352-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210826104514.400352-1-thomas.hellstrom@linux.intel.com>
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

On Thu, Aug 26, 2021 at 12:45:14PM +0200, Thomas Hellström wrote:
> Pinned contexts, like the migrate contexts need reset after resume
> since their context image may have been lost. Also the GuC needs to
> register pinned contexts.
> 
> Add a list to struct intel_engine_cs where we add all pinned contexts on
> creation, and traverse that list at resume time to reset the pinned
> contexts.
> 
> This fixes the kms_pipe_crc_basic@suspend-read-crc-pipe-a selftest for now,
> but proper LMEM backup / restore is needed for full suspend functionality.
> However, note that even with full LMEM backup / restore it may be
> desirable to keep the reset since backing up the migrate context images
> must happen using memcpy() after the migrate context has become inactive,
> and for performance- and other reasons we want to avoid memcpy() from
> LMEM.
> 
> Also traverse the list at guc_init_lrc_mapping() calling
> guc_kernel_context_pin() for the pinned contexts, like is already done
> for the kernel context.
> 
> v2:
> - Don't reset the contexts on each __engine_unpark() but rather at
>   resume time (Chris Wilson).
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Brost Matthew <matthew.brost@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I guess it got lost, but I few weeks ago I stumbled over this and wondered
why we're even setting up a separate context or at least why a separate vm
compared to the gt->vm we have already?

Even on chips with bazillions of copy engines the plan is that we only
reserve a single one for kernel migrations, so there's not really a need
for quite this much generality I think. Maybe check with Jon Bloomfield on
this.

Iirc I had also a few other questions on simplifying this area.
-Daniel


> ---
>  drivers/gpu/drm/i915/gt/intel_context_types.h |  8 +++++++
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 ++++
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c     | 23 +++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_engine_pm.h     |  2 ++
>  drivers/gpu/drm/i915/gt/intel_engine_types.h  |  7 ++++++
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  3 +++
>  drivers/gpu/drm/i915/gt/mock_engine.c         |  1 +
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 10 +++++---
>  8 files changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index e54351a170e2..a63631ea0ec4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -152,6 +152,14 @@ struct intel_context {
>  	/** sseu: Control eu/slice partitioning */
>  	struct intel_sseu sseu;
>  
> +	/**
> +	 * pinned_contexts_link: List link for the engine's pinned contexts.
> +	 * This is only used if this is a perma-pinned kernel context and
> +	 * the list is assumed to only be manipulated during driver load
> +	 * or unload time so no mutex protection currently.
> +	 */
> +	struct list_head pinned_contexts_link;
> +
>  	u8 wa_bb_page; /* if set, page num reserved for context workarounds */
>  
>  	struct {
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 332efea696a5..c606a4714904 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -320,6 +320,7 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
>  
>  	BUILD_BUG_ON(BITS_PER_TYPE(engine->mask) < I915_NUM_ENGINES);
>  
> +	INIT_LIST_HEAD(&engine->pinned_contexts_list);
>  	engine->id = id;
>  	engine->legacy_idx = INVALID_ENGINE;
>  	engine->mask = BIT(id);
> @@ -875,6 +876,8 @@ intel_engine_create_pinned_context(struct intel_engine_cs *engine,
>  		return ERR_PTR(err);
>  	}
>  
> +	list_add_tail(&ce->pinned_contexts_link, &engine->pinned_contexts_list);
> +
>  	/*
>  	 * Give our perma-pinned kernel timelines a separate lockdep class,
>  	 * so that we can use them from within the normal user timelines
> @@ -897,6 +900,7 @@ void intel_engine_destroy_pinned_context(struct intel_context *ce)
>  	list_del(&ce->timeline->engine_link);
>  	mutex_unlock(&hwsp->vm->mutex);
>  
> +	list_del(&ce->pinned_contexts_link);
>  	intel_context_unpin(ce);
>  	intel_context_put(ce);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index 1f07ac4e0672..dacd62773735 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -298,6 +298,29 @@ void intel_engine_init__pm(struct intel_engine_cs *engine)
>  	intel_engine_init_heartbeat(engine);
>  }
>  
> +/**
> + * intel_engine_reset_pinned_contexts - Reset the pinned contexts of
> + * an engine.
> + * @engine: The engine whose pinned contexts we want to reset.
> + *
> + * Typically the pinned context LMEM images lose or get their content
> + * corrupted on suspend. This function resets their images.
> + */
> +void intel_engine_reset_pinned_contexts(struct intel_engine_cs *engine)
> +{
> +	struct intel_context *ce;
> +
> +	list_for_each_entry(ce, &engine->pinned_contexts_list,
> +			    pinned_contexts_link) {
> +		/* kernel context gets reset at __engine_unpark() */
> +		if (ce == engine->kernel_context)
> +			continue;
> +
> +		dbg_poison_ce(ce);
> +		ce->ops->reset(ce);
> +	}
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>  #include "selftest_engine_pm.c"
>  #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> index 70ea46d6cfb0..8520c595f5e1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> @@ -69,4 +69,6 @@ intel_engine_create_kernel_request(struct intel_engine_cs *engine)
>  
>  void intel_engine_init__pm(struct intel_engine_cs *engine);
>  
> +void intel_engine_reset_pinned_contexts(struct intel_engine_cs *engine);
> +
>  #endif /* INTEL_ENGINE_PM_H */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index bfbfe53c23dd..5ae1207c363b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -307,6 +307,13 @@ struct intel_engine_cs {
>  
>  	struct intel_context *kernel_context; /* pinned */
>  
> +	/**
> +	 * pinned_contexts_list: List of pinned contexts. This list is only
> +	 * assumed to be manipulated during driver load- or unload time and
> +	 * does therefore not have any additional protection.
> +	 */
> +	struct list_head pinned_contexts_list;
> +
>  	intel_engine_mask_t saturated; /* submitting semaphores too late? */
>  
>  	struct {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index dea8e2479897..c9bae2ef92df 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -192,6 +192,9 @@ static void gt_sanitize(struct intel_gt *gt, bool force)
>  
>  	intel_rps_sanitize(&gt->rps);
>  
> +	for_each_engine(engine, gt, id)
> +		intel_engine_reset_pinned_contexts(engine);
> +
>  	intel_uncore_forcewake_put(gt->uncore, FORCEWAKE_ALL);
>  	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
> index 2c1af030310c..8a14982a9691 100644
> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
> @@ -376,6 +376,7 @@ int mock_engine_init(struct intel_engine_cs *engine)
>  {
>  	struct intel_context *ce;
>  
> +	INIT_LIST_HEAD(&engine->pinned_contexts_list);
>  	engine->sched_engine = i915_sched_engine_create(ENGINE_MOCK);
>  	if (!engine->sched_engine)
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 87d8dc8f51b9..55709206b95e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2385,9 +2385,13 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
>  	 * and even it did this code would be run again.
>  	 */
>  
> -	for_each_engine(engine, gt, id)
> -		if (engine->kernel_context)
> -			guc_kernel_context_pin(guc, engine->kernel_context);
> +	for_each_engine(engine, gt, id) {
> +		struct intel_context *ce;
> +
> +		list_for_each_entry(ce, &engine->pinned_contexts_list,
> +				    pinned_contexts_link)
> +			guc_kernel_context_pin(guc, ce);
> +	}
>  }
>  
>  static void guc_release(struct intel_engine_cs *engine)
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
