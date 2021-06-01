Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F438FD12
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 10:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89166E9C6;
	Tue, 25 May 2021 08:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C826E9C1;
 Tue, 25 May 2021 08:45:03 +0000 (UTC)
IronPort-SDR: dRQ6EgKwdlMeAo8XkquC/DiZZoIaGGTmlsTd1XpTftVFor3JQiOcvzVHDGlAm0oL+PnSl+h+eY
 FZt6e95oyJuw==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="287713518"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="287713518"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 01:45:02 -0700
IronPort-SDR: MrBfGAxUizBeLbI4/L/Nnp6RQE8eN0h+YHiAUfS4NJ6e/bp3q8Q2n8wm+Ai6MEoLip98pnq6DV
 cZQNNxy2VE8g==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="442449772"
Received: from tomeara-mobl.ger.corp.intel.com (HELO [10.213.211.66])
 ([10.213.211.66])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 01:45:01 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 02/97] drm/i915/gt: Move submission_method
 into intel_gt
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-3-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <4e07bb45-09af-68bf-1cff-47e9cb1db9c5@linux.intel.com>
Date: Tue, 25 May 2021 09:44:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06/05/2021 20:13, Matthew Brost wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Since we setup the submission method for the engines once, it is easy to
> assign an enum and use that instead of probing into the backends.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Same, this patch had my r-b already so I'll repeat it:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/gt/intel_engine.h               |  8 +++++++-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c            | 12 ++++++++----
>   drivers/gpu/drm/i915/gt/intel_execlists_submission.c |  8 --------
>   drivers/gpu/drm/i915/gt/intel_execlists_submission.h |  3 ---
>   drivers/gpu/drm/i915/gt/intel_gt_types.h             |  7 +++++++
>   drivers/gpu/drm/i915/gt/intel_reset.c                |  7 +++----
>   drivers/gpu/drm/i915/gt/selftest_execlists.c         |  2 +-
>   drivers/gpu/drm/i915/gt/selftest_ring_submission.c   |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    |  5 -----
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h    |  1 -
>   drivers/gpu/drm/i915/i915_perf.c                     | 10 +++++-----
>   11 files changed, 32 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 47ee8578e511..8d9184920c51 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -13,8 +13,9 @@
>   #include "i915_reg.h"
>   #include "i915_request.h"
>   #include "i915_selftest.h"
> -#include "gt/intel_timeline.h"
>   #include "intel_engine_types.h"
> +#include "intel_gt_types.h"
> +#include "intel_timeline.h"
>   #include "intel_workarounds.h"
>   
>   struct drm_printer;
> @@ -262,6 +263,11 @@ void intel_engine_init_active(struct intel_engine_cs *engine,
>   #define ENGINE_MOCK	1
>   #define ENGINE_VIRTUAL	2
>   
> +static inline bool intel_engine_uses_guc(const struct intel_engine_cs *engine)
> +{
> +	return engine->gt->submission_method >= INTEL_SUBMISSION_GUC;
> +}
> +
>   static inline bool
>   intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 6dbdbde00f14..0618379b68ca 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -909,12 +909,16 @@ int intel_engines_init(struct intel_gt *gt)
>   	enum intel_engine_id id;
>   	int err;
>   
> -	if (intel_uc_uses_guc_submission(&gt->uc))
> +	if (intel_uc_uses_guc_submission(&gt->uc)) {
> +		gt->submission_method = INTEL_SUBMISSION_GUC;
>   		setup = intel_guc_submission_setup;
> -	else if (HAS_EXECLISTS(gt->i915))
> +	} else if (HAS_EXECLISTS(gt->i915)) {
> +		gt->submission_method = INTEL_SUBMISSION_ELSP;
>   		setup = intel_execlists_submission_setup;
> -	else
> +	} else {
> +		gt->submission_method = INTEL_SUBMISSION_RING;
>   		setup = intel_ring_submission_setup;
> +	}
>   
>   	for_each_engine(engine, gt, id) {
>   		err = engine_setup_common(engine);
> @@ -1479,7 +1483,7 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
>   		drm_printf(m, "\tIPEHR: 0x%08x\n", ENGINE_READ(engine, IPEHR));
>   	}
>   
> -	if (intel_engine_in_guc_submission_mode(engine)) {
> +	if (intel_engine_uses_guc(engine)) {
>   		/* nothing to print yet */
>   	} else if (HAS_EXECLISTS(dev_priv)) {
>   		struct i915_request * const *port, *rq;
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 1108c193ab65..9d2da5ccaef6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -1768,7 +1768,6 @@ process_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
>   	 */
>   	GEM_BUG_ON(!tasklet_is_locked(&execlists->tasklet) &&
>   		   !reset_in_progress(execlists));
> -	GEM_BUG_ON(!intel_engine_in_execlists_submission_mode(engine));
>   
>   	/*
>   	 * Note that csb_write, csb_status may be either in HWSP or mmio.
> @@ -3884,13 +3883,6 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
>   	spin_unlock_irqrestore(&engine->active.lock, flags);
>   }
>   
> -bool
> -intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine)
> -{
> -	return engine->set_default_submission ==
> -	       execlists_set_default_submission;
> -}
> -
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftest_execlists.c"
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> index fd61dae820e9..4ca9b475e252 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> @@ -43,7 +43,4 @@ int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
>   				     const struct intel_engine_cs *master,
>   				     const struct intel_engine_cs *sibling);
>   
> -bool
> -intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
> -
>   #endif /* __INTEL_EXECLISTS_SUBMISSION_H__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 0caf6ca0a784..fecfacf551d5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -31,6 +31,12 @@ struct i915_ggtt;
>   struct intel_engine_cs;
>   struct intel_uncore;
>   
> +enum intel_submission_method {
> +	INTEL_SUBMISSION_RING,
> +	INTEL_SUBMISSION_ELSP,
> +	INTEL_SUBMISSION_GUC,
> +};
> +
>   struct intel_gt {
>   	struct drm_i915_private *i915;
>   	struct intel_uncore *uncore;
> @@ -118,6 +124,7 @@ struct intel_gt {
>   	struct intel_engine_cs *engine[I915_NUM_ENGINES];
>   	struct intel_engine_cs *engine_class[MAX_ENGINE_CLASS + 1]
>   					    [MAX_ENGINE_INSTANCE + 1];
> +	enum intel_submission_method submission_method;
>   
>   	/*
>   	 * Default address space (either GGTT or ppGTT depending on arch).
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index a377c4588aaa..d5094be6d90f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1118,7 +1118,6 @@ static int intel_gt_reset_engine(struct intel_engine_cs *engine)
>   int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
>   {
>   	struct intel_gt *gt = engine->gt;
> -	bool uses_guc = intel_engine_in_guc_submission_mode(engine);
>   	int ret;
>   
>   	ENGINE_TRACE(engine, "flags=%lx\n", gt->reset.flags);
> @@ -1134,10 +1133,10 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
>   			   "Resetting %s for %s\n", engine->name, msg);
>   	atomic_inc(&engine->i915->gpu_error.reset_engine_count[engine->uabi_class]);
>   
> -	if (!uses_guc)
> -		ret = intel_gt_reset_engine(engine);
> -	else
> +	if (intel_engine_uses_guc(engine))
>   		ret = intel_guc_reset_engine(&engine->gt->uc.guc, engine);
> +	else
> +		ret = intel_gt_reset_engine(engine);
>   	if (ret) {
>   		/* If we fail here, we expect to fallback to a global reset */
>   		ENGINE_TRACE(engine, "Failed to reset, err: %d\n", ret);
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index 1081cd36a2bd..1f93591a8c69 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -4716,7 +4716,7 @@ int intel_execlists_live_selftests(struct drm_i915_private *i915)
>   		SUBTEST(live_virtual_reset),
>   	};
>   
> -	if (!HAS_EXECLISTS(i915))
> +	if (i915->gt.submission_method != INTEL_SUBMISSION_ELSP)
>   		return 0;
>   
>   	if (intel_gt_is_wedged(&i915->gt))
> diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> index 99609271c3a7..c12e74171b63 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> @@ -291,7 +291,7 @@ int intel_ring_submission_live_selftests(struct drm_i915_private *i915)
>   		SUBTEST(live_ctx_switch_wa),
>   	};
>   
> -	if (HAS_EXECLISTS(i915))
> +	if (i915->gt.submission_method > INTEL_SUBMISSION_RING)
>   		return 0;
>   
>   	return intel_gt_live_subtests(tests, &i915->gt);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index f72faa0b8339..17b551a0c89f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -745,8 +745,3 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
>   {
>   	guc->submission_selected = __guc_submission_selected(guc);
>   }
> -
> -bool intel_engine_in_guc_submission_mode(const struct intel_engine_cs *engine)
> -{
> -	return engine->set_default_submission == guc_set_default_submission;
> -}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index 5f7b9e6347d0..3f7005018939 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -20,7 +20,6 @@ void intel_guc_submission_fini(struct intel_guc *guc);
>   int intel_guc_preempt_work_create(struct intel_guc *guc);
>   void intel_guc_preempt_work_destroy(struct intel_guc *guc);
>   int intel_guc_submission_setup(struct intel_engine_cs *engine);
> -bool intel_engine_in_guc_submission_mode(const struct intel_engine_cs *engine);
>   
>   static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
>   {
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 85ad62dbabfa..66f1f25119b5 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -1257,11 +1257,7 @@ static int oa_get_render_ctx_id(struct i915_perf_stream *stream)
>   	case 8:
>   	case 9:
>   	case 10:
> -		if (intel_engine_in_execlists_submission_mode(ce->engine)) {
> -			stream->specific_ctx_id_mask =
> -				(1U << GEN8_CTX_ID_WIDTH) - 1;
> -			stream->specific_ctx_id = stream->specific_ctx_id_mask;
> -		} else {
> +		if (intel_engine_uses_guc(ce->engine)) {
>   			/*
>   			 * When using GuC, the context descriptor we write in
>   			 * i915 is read by GuC and rewritten before it's
> @@ -1280,6 +1276,10 @@ static int oa_get_render_ctx_id(struct i915_perf_stream *stream)
>   			 */
>   			stream->specific_ctx_id_mask =
>   				(1U << (GEN8_CTX_ID_WIDTH - 1)) - 1;
> +		} else {
> +			stream->specific_ctx_id_mask =
> +				(1U << GEN8_CTX_ID_WIDTH) - 1;
> +			stream->specific_ctx_id = stream->specific_ctx_id_mask;
>   		}
>   		break;
>   
> 
