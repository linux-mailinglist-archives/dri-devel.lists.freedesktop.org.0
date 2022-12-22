Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE48653E41
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 11:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BF810E53D;
	Thu, 22 Dec 2022 10:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934B010E071;
 Thu, 22 Dec 2022 10:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671704824; x=1703240824;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sOHceVRJc0ysAtEmrAOf23lFWlDolUWZYEi5mFjL7Sg=;
 b=Kaqx+02quzmc+8lyYZWMTZ3E2LvIElR+cmynWu4cX1YbMjyIIAgtYitb
 BrpJUW9kklediBooJ3uBfN6OXV0+23pe9VEbo4toN9ULLmaliWD0Qjjbo
 tXBC/0rKpIKtNVSA7qsB3FBprxm62ciO3K3ehQdJCsOkR/HrodypMpa2f
 rQ6R8pTV4/VSANV3s9Fc1OAcQ88sDhGSbwPfB5oGBkoSQh5Su+WoJVV64
 XjrpljK7u4DOiEy6ma9K5A8LJJw+9sxQXUD0iML9oWaPsT+CAbsmno0hA
 QKgTsHad8EX7BnX7t0PXRtLTgjeGSini/n0iIUBtFpq44GoU6CtG4XeKc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="317739130"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="317739130"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 02:27:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="653839862"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="653839862"
Received: from cprice2-mobl.ger.corp.intel.com (HELO [10.213.220.27])
 ([10.213.220.27])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 02:27:02 -0800
Message-ID: <2cfeee8a-7b7e-c203-37b4-f7a502123a5a@linux.intel.com>
Date: Thu, 22 Dec 2022 10:27:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] drm/i915/gt: Remove platform comments from workarounds
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221222082557.1364711-1-lucas.demarchi@intel.com>
 <20221222082557.1364711-2-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221222082557.1364711-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/12/2022 08:25, Lucas De Marchi wrote:
> The comments are redundant to the checks being done to apply the
> workarounds and very often get outdated as workarounds need to be
> extended to new platforms or steppings.  Remove them altogether with
> the following matches (platforms extracted from intel_workarounds.c):
> 
> 	find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
> 		's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*/\1/'
> 	find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
> 		's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*\*\//\1
> 
> Same things was executed in the gem directory, omitted here for brevity.

> There were a few false positives that included the workaround
> description. Those were manually patched.

sed -E 's/(Wa[a-zA-Z0-9_]+)[:,]([a-zA-Z0-9,-_\+\[]{2,})/\1/'

Maybe..

Matt recently said he has this worked planned, but more importantly - I 
gather then that the WA lookup tool definitely does not output these 
strings?

Regards,

Tvrtko

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   2 +-
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  12 +-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   2 +-
>   .../drm/i915/gt/intel_execlists_submission.c  |   6 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c            |   2 +-
>   drivers/gpu/drm/i915/gt/intel_gtt.c           |   2 +-
>   drivers/gpu/drm/i915/gt/intel_lrc.c           |  20 +-
>   drivers/gpu/drm/i915/gt/intel_mocs.c          |   2 +-
>   drivers/gpu/drm/i915/gt/intel_rc6.c           |   4 +-
>   drivers/gpu/drm/i915/gt/intel_reset.c         |   4 +-
>   .../gpu/drm/i915/gt/intel_ring_submission.c   |  10 +-
>   drivers/gpu/drm/i915/gt/intel_rps.c           |   2 +-
>   drivers/gpu/drm/i915/gt/intel_workarounds.c   | 440 +++++++++---------
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  16 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   4 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   4 +-
>   16 files changed, 266 insertions(+), 266 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index bc9521078807..a2a49cc25ca3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -46,7 +46,7 @@ int i915_gem_stolen_insert_node_in_range(struct drm_i915_private *i915,
>   	if (!drm_mm_initialized(&i915->mm.stolen))
>   		return -ENODEV;
>   
> -	/* WaSkipStolenMemoryFirstPage:bdw+ */
> +	/* WaSkipStolenMemoryFirstPage */
>   	if (GRAPHICS_VER(i915) >= 8 && start < 4096)
>   		start = 4096;
>   
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index e1c76e5bfa82..d7a40ed66d9e 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -42,7 +42,7 @@ int gen8_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		if (GRAPHICS_VER(rq->engine->i915) == 9)
>   			vf_flush_wa = true;
>   
> -		/* WaForGAMHang:kbl */
> +		/* WaForGAMHang */
>   		if (IS_KBL_GRAPHICS_STEP(rq->engine->i915, 0, STEP_C0))
>   			dc_flush_wa = true;
>   	}
> @@ -189,7 +189,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		flags |= PIPE_CONTROL_FLUSH_L3;
>   		flags |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
>   		flags |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
> -		/* Wa_1409600907:tgl,adl-p */
> +		/* Wa_1409600907 */
>   		flags |= PIPE_CONTROL_DEPTH_STALL;
>   		flags |= PIPE_CONTROL_DC_FLUSH_ENABLE;
>   		flags |= PIPE_CONTROL_FLUSH_ENABLE;
> @@ -462,7 +462,7 @@ int gen8_emit_bb_start_noarb(struct i915_request *rq,
>   		return PTR_ERR(cs);
>   
>   	/*
> -	 * WaDisableCtxRestoreArbitration:bdw,chv
> +	 * WaDisableCtxRestoreArbitration
>   	 *
>   	 * We don't need to perform MI_ARB_ENABLE as often as we do (in
>   	 * particular all the gen that do not need the w/a at all!), if we
> @@ -657,7 +657,7 @@ static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
>   	return cs;
>   }
>   
> -/* Wa_14014475959:dg2 */
> +/* Wa_14014475959 */
>   #define CCS_SEMAPHORE_PPHWSP_OFFSET	0x540
>   static u32 ccs_semaphore_offset(struct i915_request *rq)
>   {
> @@ -665,7 +665,7 @@ static u32 ccs_semaphore_offset(struct i915_request *rq)
>   		(LRC_PPHWSP_PN * PAGE_SIZE) + CCS_SEMAPHORE_PPHWSP_OFFSET;
>   }
>   
> -/* Wa_14014475959:dg2 */
> +/* Wa_14014475959 */
>   static u32 *ccs_emit_wa_busywait(struct i915_request *rq, u32 *cs)
>   {
>   	int i;
> @@ -704,7 +704,7 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
>   	    !intel_uc_uses_guc_submission(&rq->engine->gt->uc))
>   		cs = gen12_emit_preempt_busywait(rq, cs);
>   
> -	/* Wa_14014475959:dg2 */
> +	/* Wa_14014475959 */
>   	if (intel_engine_uses_wa_hold_ccs_switchout(rq->engine))
>   		cs = ccs_emit_wa_busywait(rq, cs);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 99c4b866addd..ef45dfc6adae 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1614,7 +1614,7 @@ static void __gpm_wait_for_fw_complete(struct intel_gt *gt, u32 fw_mask)
>   }
>   
>   /*
> - * Wa_22011802037:gen12: In addition to stopping the cs, we need to wait for any
> + * Wa_22011802037
>    * pending MI_FORCE_WAKEUP requests that the CS has initiated to complete. The
>    * pending status is indicated by bits[13:9] (masked by bits[29:25]) in the
>    * MSG_IDLE register. There's one MSG_IDLE register per reset domain. Since we
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 49a8f10d76c7..9f232c743ee7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -683,7 +683,7 @@ static u64 execlists_update_context(struct i915_request *rq)
>   		desc |= map_i915_prio_to_lrc_desc_prio(rq_prio(rq));
>   
>   	/*
> -	 * WaIdleLiteRestore:bdw,skl
> +	 * WaIdleLiteRestore
>   	 *
>   	 * We should never submit the context with the same RING_TAIL twice
>   	 * just in case we submit an empty ring, which confuses the HW.
> @@ -2981,7 +2981,7 @@ static void execlists_reset_prepare(struct intel_engine_cs *engine)
>   	 * Thus assume it is best to stop engines on all gens
>   	 * where we have a gpu reset.
>   	 *
> -	 * WaKBLVECSSemaphoreWaitPoll:kbl (on ALL_ENGINES)
> +	 * WaKBLVECSSemaphoreWaitPoll
>   	 *
>   	 * FIXME: Wa for more modern gens needs to be validated
>   	 */
> @@ -2989,7 +2989,7 @@ static void execlists_reset_prepare(struct intel_engine_cs *engine)
>   	intel_engine_stop_cs(engine);
>   
>   	/*
> -	 * Wa_22011802037:gen11/gen12: In addition to stopping the cs, we need
> +	 * Wa_22011802037
>   	 * to wait for any pending mi force wakeups
>   	 */
>   	if (IS_GRAPHICS_VER(engine->i915, 11, 12))
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 7eeee5a7cb33..5b7244dceb67 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1126,7 +1126,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>   
>   	GT_TRACE(gt, "invalidated engines %08x\n", awake);
>   
> -	/* Wa_2207587034:tgl,dg1,rkl,adl-s,adl-p */
> +	/* Wa_2207587034 */
>   	if (awake &&
>   	    (IS_TIGERLAKE(i915) ||
>   	     IS_DG1(i915) ||
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index e37164a60d37..25d4b554cf25 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -409,7 +409,7 @@ void gtt_write_workarounds(struct intel_gt *gt)
>   	 * called on driver load and after a GPU reset, so you can place
>   	 * workarounds here even if they get overwritten by GPU reset.
>   	 */
> -	/* WaIncreaseDefaultTLBEntries:chv,bdw,skl,bxt,kbl,glk,cfl,cnl,icl */
> +	/* WaIncreaseDefaultTLBEntries */
>   	if (IS_BROADWELL(i915))
>   		intel_uncore_write(uncore,
>   				   GEN8_L3_LRA_1_GPGPU,
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 7771a19008c6..8dc764781b1a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1389,12 +1389,12 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
>   	cs = gen12_emit_cmd_buf_wa(ce, cs);
>   	cs = gen12_emit_restore_scratch(ce, cs);
>   
> -	/* Wa_22011450934:dg2 */
> +	/* Wa_22011450934 */
>   	if (IS_DG2_GRAPHICS_STEP(ce->engine->i915, G10, STEP_A0, STEP_B0) ||
>   	    IS_DG2_GRAPHICS_STEP(ce->engine->i915, G11, STEP_A0, STEP_B0))
>   		cs = dg2_emit_rcs_hang_wabb(ce, cs);
>   
> -	/* Wa_16013000631:dg2 */
> +	/* Wa_16013000631 */
>   	if (IS_DG2_GRAPHICS_STEP(ce->engine->i915, G10, STEP_B0, STEP_C0) ||
>   	    IS_DG2_G11(ce->engine->i915))
>   		cs = gen8_emit_pipe_control(cs, PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE, 0);
> @@ -1417,7 +1417,7 @@ gen12_emit_indirect_ctx_xcs(const struct intel_context *ce, u32 *cs)
>   	cs = gen12_emit_timestamp_wa(ce, cs);
>   	cs = gen12_emit_restore_scratch(ce, cs);
>   
> -	/* Wa_16013000631:dg2 */
> +	/* Wa_16013000631 */
>   	if (IS_DG2_GRAPHICS_STEP(ce->engine->i915, G10, STEP_B0, STEP_C0) ||
>   	    IS_DG2_G11(ce->engine->i915))
>   		if (ce->engine->class == COMPUTE_CLASS)
> @@ -1654,14 +1654,14 @@ gen8_emit_flush_coherentl3_wa(struct intel_engine_cs *engine, u32 *batch)
>    */
>   static u32 *gen8_init_indirectctx_bb(struct intel_engine_cs *engine, u32 *batch)
>   {
> -	/* WaDisableCtxRestoreArbitration:bdw,chv */
> +	/* WaDisableCtxRestoreArbitration */
>   	*batch++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>   
> -	/* WaFlushCoherentL3CacheLinesAtContextSwitch:bdw */
> +	/* WaFlushCoherentL3CacheLinesAtContextSwitch */
>   	if (IS_BROADWELL(engine->i915))
>   		batch = gen8_emit_flush_coherentl3_wa(engine, batch);
>   
> -	/* WaClearSlmSpaceAtContextSwitch:bdw,chv */
> +	/* WaClearSlmSpaceAtContextSwitch */
>   	/* Actual scratch location is at 128 bytes offset */
>   	batch = gen8_emit_pipe_control(batch,
>   				       PIPE_CONTROL_FLUSH_L3 |
> @@ -1707,7 +1707,7 @@ static u32 *emit_lri(u32 *batch, const struct lri *lri, unsigned int count)
>   static u32 *gen9_init_indirectctx_bb(struct intel_engine_cs *engine, u32 *batch)
>   {
>   	static const struct lri lri[] = {
> -		/* WaDisableGatherAtSetShaderCommonSlice:skl,bxt,kbl,glk */
> +		/* WaDisableGatherAtSetShaderCommonSlice */
>   		{
>   			COMMON_SLICE_CHICKEN2,
>   			__MASKED_FIELD(GEN9_DISABLE_GATHER_AT_SET_SHADER_COMMON_SLICE,
> @@ -1731,10 +1731,10 @@ static u32 *gen9_init_indirectctx_bb(struct intel_engine_cs *engine, u32 *batch)
>   
>   	*batch++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>   
> -	/* WaFlushCoherentL3CacheLinesAtContextSwitch:skl,bxt,glk */
> +	/* WaFlushCoherentL3CacheLinesAtContextSwitch */
>   	batch = gen8_emit_flush_coherentl3_wa(engine, batch);
>   
> -	/* WaClearSlmSpaceAtContextSwitch:skl,bxt,kbl,glk,cfl */
> +	/* WaClearSlmSpaceAtContextSwitch */
>   	batch = gen8_emit_pipe_control(batch,
>   				       PIPE_CONTROL_FLUSH_L3 |
>   				       PIPE_CONTROL_STORE_DATA_INDEX |
> @@ -1744,7 +1744,7 @@ static u32 *gen9_init_indirectctx_bb(struct intel_engine_cs *engine, u32 *batch)
>   
>   	batch = emit_lri(batch, lri, ARRAY_SIZE(lri));
>   
> -	/* WaMediaPoolStateCmdInWABB:bxt,glk */
> +	/* WaMediaPoolStateCmdInWABB */
>   	if (HAS_POOLED_EU(engine->i915)) {
>   		/*
>   		 * EU pool configuration is setup along with golden context
> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> index 69b489e8dfed..b7f56a788424 100644
> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> @@ -509,7 +509,7 @@ static unsigned int get_mocs_settings(const struct drm_i915_private *i915,
>   	if (GEM_DEBUG_WARN_ON(table->size > table->n_entries))
>   		return 0;
>   
> -	/* WaDisableSkipCaching:skl,bxt,kbl,glk */
> +	/* WaDisableSkipCaching */
>   	if (GRAPHICS_VER(i915) == 9) {
>   		int i;
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
> index 2ee4051e4d96..9cb04e9a4c13 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> @@ -156,7 +156,7 @@ static void gen9_rc6_enable(struct intel_rc6 *rc6)
>   		set(uncore, GEN10_MEDIA_WAKE_RATE_LIMIT, 150);
>   	} else if (IS_SKYLAKE(rc6_to_i915(rc6))) {
>   		/*
> -		 * WaRsDoubleRc6WrlWithCoarsePowerGating:skl Doubling WRL only
> +		 * WaRsDoubleRc6WrlWithCoarsePowerGating
>   		 * when CPG is enabled
>   		 */
>   		set(uncore, GEN6_RC6_WAKE_RATE_LIMIT, 108 << 16);
> @@ -206,7 +206,7 @@ static void gen9_rc6_enable(struct intel_rc6 *rc6)
>   		GEN6_RC_CTL_EI_MODE(1);
>   
>   	/*
> -	 * WaRsDisableCoarsePowerGating:skl,cnl
> +	 * WaRsDisableCoarsePowerGating
>   	 *   - Render/Media PG need to be disabled with RC6.
>   	 */
>   	if (!NEEDS_WaRsDisableCoarsePowerGating(rc6_to_i915(rc6)))
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index ffde89c5835a..f59d38a5e2a0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -201,7 +201,7 @@ static int g4x_do_reset(struct intel_gt *gt,
>   	struct intel_uncore *uncore = gt->uncore;
>   	int ret;
>   
> -	/* WaVcpClkGateDisableForMediaReset:ctg,elk */
> +	/* WaVcpClkGateDisableForMediaReset */
>   	intel_uncore_rmw_fw(uncore, VDECCLK_GATE_D, 0, VCP_UNIT_CLOCK_GATE_DISABLE);
>   	intel_uncore_posting_read_fw(uncore, VDECCLK_GATE_D);
>   
> @@ -613,7 +613,7 @@ static int gen8_reset_engines(struct intel_gt *gt,
>   	}
>   
>   	/*
> -	 * Wa_22011100796:dg2, whenever Full soft reset is required,
> +	 * Wa_22011100796
>   	 * reset all individual engines firstly, and then do a full soft reset.
>   	 *
>   	 * This is best effort, so ignore any error from the initial reset.
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 827adb0cfaea..704b50467ce3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -317,10 +317,10 @@ static void reset_prepare(struct intel_engine_cs *engine)
>   	 * Thus assume it is best to stop engines on all gens
>   	 * where we have a gpu reset.
>   	 *
> -	 * WaKBLVECSSemaphoreWaitPoll:kbl (on ALL_ENGINES)
> +	 * WaKBLVECSSemaphoreWaitPoll
>   	 *
> -	 * WaMediaResetMainRingCleanup:ctg,elk (presumably)
> -	 * WaClearRingBufHeadRegAtInit:ctg,elk
> +	 * WaMediaResetMainRingCleanup
> +	 * WaClearRingBufHeadRegAtInit
>   	 *
>   	 * FIXME: Wa for more modern gens needs to be validated
>   	 */
> @@ -714,7 +714,7 @@ static int mi_set_context(struct i915_request *rq,
>   	if (IS_ERR(cs))
>   		return PTR_ERR(cs);
>   
> -	/* WaProgramMiArbOnOffAroundMiSetContext:ivb,vlv,hsw,bdw,chv */
> +	/* WaProgramMiArbOnOffAroundMiSetContext */
>   	if (GRAPHICS_VER(i915) == 7) {
>   		*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>   		if (num_engines) {
> @@ -765,7 +765,7 @@ static int mi_set_context(struct i915_request *rq,
>   	*cs++ = i915_ggtt_offset(ce->state) | flags;
>   	/*
>   	 * w/a: MI_SET_CONTEXT must always be followed by MI_NOOP
> -	 * WaMiSetContext_Hang:snb,ivb,vlv
> +	 * WaMiSetContext_Hang
>   	 */
>   	*cs++ = MI_NOOP;
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 9ad3bc7201cb..4eeddd60c95b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1443,7 +1443,7 @@ static bool vlv_rps_enable(struct intel_rps *rps)
>   			      GEN6_RP_UP_BUSY_AVG |
>   			      GEN6_RP_DOWN_IDLE_CONT);
>   
> -	/* WaGsvRC0ResidencyMethod:vlv */
> +	/* WaGsvRC0ResidencyMethod */
>   	rps->pm_events = GEN6_PM_RP_UP_EI_EXPIRED;
>   
>   	vlv_punit_get(i915);
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index bf84efb3f15f..edfa7d98a409 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -314,10 +314,10 @@ static void gen8_ctx_workarounds_init(struct intel_engine_cs *engine,
>   {
>   	wa_masked_en(wal, INSTPM, INSTPM_FORCE_ORDERING);
>   
> -	/* WaDisableAsyncFlipPerfMode:bdw,chv */
> +	/* WaDisableAsyncFlipPerfMode */
>   	wa_masked_en(wal, RING_MI_MODE(RENDER_RING_BASE), ASYNC_FLIP_PERF_DISABLE);
>   
> -	/* WaDisablePartialInstShootdown:bdw,chv */
> +	/* WaDisablePartialInstShootdown */
>   	wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN,
>   			 PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE);
>   
> @@ -325,8 +325,8 @@ static void gen8_ctx_workarounds_init(struct intel_engine_cs *engine,
>   	 * workaround for a possible hang in the unlikely event a TLB
>   	 * invalidation occurs during a PSD flush.
>   	 */
> -	/* WaForceEnableNonCoherent:bdw,chv */
> -	/* WaHdcDisableFetchWhenMasked:bdw,chv */
> +	/* WaForceEnableNonCoherent */
> +	/* WaHdcDisableFetchWhenMasked */
>   	wa_masked_en(wal, HDC_CHICKEN0,
>   		     HDC_DONOT_FETCH_MEM_WHEN_MASKED |
>   		     HDC_FORCE_NON_COHERENT);
> @@ -341,7 +341,7 @@ static void gen8_ctx_workarounds_init(struct intel_engine_cs *engine,
>   	 */
>   	wa_masked_dis(wal, CACHE_MODE_0_GEN7, HIZ_RAW_STALL_OPT_DISABLE);
>   
> -	/* Wa4x4STCOptimizationDisable:bdw,chv */
> +	/* Wa4x4STCOptimizationDisable */
>   	wa_masked_en(wal, CACHE_MODE_1, GEN8_4x4_STC_OPTIMIZATION_DISABLE);
>   
>   	/*
> @@ -364,10 +364,10 @@ static void bdw_ctx_workarounds_init(struct intel_engine_cs *engine,
>   
>   	gen8_ctx_workarounds_init(engine, wal);
>   
> -	/* WaDisableThreadStallDopClockGating:bdw (pre-production) */
> +	/* WaDisableThreadStallDopClockGating */
>   	wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN, STALL_DOP_GATING_DISABLE);
>   
> -	/* WaDisableDopClockGating:bdw
> +	/* WaDisableDopClockGating
>   	 *
>   	 * Also see the related UCGTCL1 write in bdw_init_clock_gating()
>   	 * to disable EUTC clock gating.
> @@ -379,9 +379,9 @@ static void bdw_ctx_workarounds_init(struct intel_engine_cs *engine,
>   			 GEN8_SAMPLER_POWER_BYPASS_DIS);
>   
>   	wa_masked_en(wal, HDC_CHICKEN0,
> -		     /* WaForceContextSaveRestoreNonCoherent:bdw */
> +		     /* WaForceContextSaveRestoreNonCoherent */
>   		     HDC_FORCE_CONTEXT_SAVE_RESTORE_NON_COHERENT |
> -		     /* WaDisableFenceDestinationToSLM:bdw (pre-prod) */
> +		     /* WaDisableFenceDestinationToSLM */
>   		     (IS_BDW_GT3(i915) ? HDC_FENCE_DEST_SLM_DISABLE : 0));
>   }
>   
> @@ -390,7 +390,7 @@ static void chv_ctx_workarounds_init(struct intel_engine_cs *engine,
>   {
>   	gen8_ctx_workarounds_init(engine, wal);
>   
> -	/* WaDisableThreadStallDopClockGating:chv */
> +	/* WaDisableThreadStallDopClockGating */
>   	wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN, STALL_DOP_GATING_DISABLE);
>   
>   	/* Improve HiZ throughput on CHV. */
> @@ -403,7 +403,7 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
>   	struct drm_i915_private *i915 = engine->i915;
>   
>   	if (HAS_LLC(i915)) {
> -		/* WaCompressedResourceSamplerPbeMediaNewHashMode:skl,kbl
> +		/* WaCompressedResourceSamplerPbeMediaNewHashMode
>   		 *
>   		 * Must match Display Engine. See
>   		 * WaCompressedResourceDisplayNewHashMode.
> @@ -414,29 +414,29 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
>   				 GEN9_SAMPLER_HASH_COMPRESSED_READ_ADDR);
>   	}
>   
> -	/* WaClearFlowControlGpgpuContextSave:skl,bxt,kbl,glk,cfl */
> -	/* WaDisablePartialInstShootdown:skl,bxt,kbl,glk,cfl */
> +	/* WaClearFlowControlGpgpuContextSave */
> +	/* WaDisablePartialInstShootdown */
>   	wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN,
>   			 FLOW_CONTROL_ENABLE |
>   			 PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE);
>   
> -	/* WaEnableYV12BugFixInHalfSliceChicken7:skl,bxt,kbl,glk,cfl */
> -	/* WaEnableSamplerGPGPUPreemptionSupport:skl,bxt,kbl,cfl */
> +	/* WaEnableYV12BugFixInHalfSliceChicken7 */
> +	/* WaEnableSamplerGPGPUPreemptionSupport */
>   	wa_mcr_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
>   			 GEN9_ENABLE_YV12_BUGFIX |
>   			 GEN9_ENABLE_GPGPU_PREEMPTION);
>   
> -	/* Wa4x4STCOptimizationDisable:skl,bxt,kbl,glk,cfl */
> -	/* WaDisablePartialResolveInVc:skl,bxt,kbl,cfl */
> +	/* Wa4x4STCOptimizationDisable */
> +	/* WaDisablePartialResolveInVc */
>   	wa_masked_en(wal, CACHE_MODE_1,
>   		     GEN8_4x4_STC_OPTIMIZATION_DISABLE |
>   		     GEN9_PARTIAL_RESOLVE_IN_VC_DISABLE);
>   
> -	/* WaCcsTlbPrefetchDisable:skl,bxt,kbl,glk,cfl */
> +	/* WaCcsTlbPrefetchDisable */
>   	wa_mcr_masked_dis(wal, GEN9_HALF_SLICE_CHICKEN5,
>   			  GEN9_CCS_TLB_PREFETCH_ENABLE);
>   
> -	/* WaForceContextSaveRestoreNonCoherent:skl,bxt,kbl,cfl */
> +	/* WaForceContextSaveRestoreNonCoherent */
>   	wa_masked_en(wal, HDC_CHICKEN0,
>   		     HDC_FORCE_CONTEXT_SAVE_RESTORE_NON_COHERENT |
>   		     HDC_FORCE_CSR_NON_COHERENT_OVR_DISABLE);
> @@ -454,11 +454,11 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
>   	 * a TLB invalidation occurs during a PSD flush.
>   	 */
>   
> -	/* WaForceEnableNonCoherent:skl,bxt,kbl,cfl */
> +	/* WaForceEnableNonCoherent */
>   	wa_masked_en(wal, HDC_CHICKEN0,
>   		     HDC_FORCE_NON_COHERENT);
>   
> -	/* WaDisableSamplerPowerBypassForSOPingPong:skl,bxt,kbl,cfl */
> +	/* WaDisableSamplerPowerBypassForSOPingPong */
>   	if (IS_SKYLAKE(i915) ||
>   	    IS_KABYLAKE(i915) ||
>   	    IS_COFFEELAKE(i915) ||
> @@ -466,7 +466,7 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
>   		wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
>   				 GEN8_SAMPLER_POWER_BYPASS_DIS);
>   
> -	/* WaDisableSTUnitPowerOptimization:skl,bxt,kbl,glk,cfl */
> +	/* WaDisableSTUnitPowerOptimization */
>   	wa_mcr_masked_en(wal, HALF_SLICE_CHICKEN2, GEN8_ST_PO_DISABLE);
>   
>   	/*
> @@ -480,15 +480,15 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
>   	 * while maintaining old contract with userspace.
>   	 */
>   
> -	/* WaDisable3DMidCmdPreemption:skl,bxt,glk,cfl,[cnl] */
> +	/* WaDisable3DMidCmdPreemption */
>   	wa_masked_dis(wal, GEN8_CS_CHICKEN1, GEN9_PREEMPT_3D_OBJECT_LEVEL);
>   
> -	/* WaDisableGPGPUMidCmdPreemption:skl,bxt,blk,cfl,[cnl] */
> +	/* WaDisableGPGPUMidCmdPreemption */
>   	wa_masked_field_set(wal, GEN8_CS_CHICKEN1,
>   			    GEN9_PREEMPT_GPGPU_LEVEL_MASK,
>   			    GEN9_PREEMPT_GPGPU_COMMAND_LEVEL);
>   
> -	/* WaClearHIZ_WM_CHICKEN3:bxt,glk */
> +	/* WaClearHIZ_WM_CHICKEN3 */
>   	if (IS_GEN9_LP(i915))
>   		wa_masked_en(wal, GEN9_WM_CHICKEN3, GEN9_FACTOR_IN_CLR_VAL_HIZ);
>   }
> @@ -545,11 +545,11 @@ static void bxt_ctx_workarounds_init(struct intel_engine_cs *engine,
>   {
>   	gen9_ctx_workarounds_init(engine, wal);
>   
> -	/* WaDisableThreadStallDopClockGating:bxt */
> +	/* WaDisableThreadStallDopClockGating */
>   	wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN,
>   			 STALL_DOP_GATING_DISABLE);
>   
> -	/* WaToEnableHwFixForPushConstHWBug:bxt */
> +	/* WaToEnableHwFixForPushConstHWBug */
>   	wa_masked_en(wal, COMMON_SLICE_CHICKEN2,
>   		     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
>   }
> @@ -561,12 +561,12 @@ static void kbl_ctx_workarounds_init(struct intel_engine_cs *engine,
>   
>   	gen9_ctx_workarounds_init(engine, wal);
>   
> -	/* WaToEnableHwFixForPushConstHWBug:kbl */
> +	/* WaToEnableHwFixForPushConstHWBug */
>   	if (IS_KBL_GRAPHICS_STEP(i915, STEP_C0, STEP_FOREVER))
>   		wa_masked_en(wal, COMMON_SLICE_CHICKEN2,
>   			     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
>   
> -	/* WaDisableSbeCacheDispatchPortSharing:kbl */
> +	/* WaDisableSbeCacheDispatchPortSharing */
>   	wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>   			 GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
>   }
> @@ -576,7 +576,7 @@ static void glk_ctx_workarounds_init(struct intel_engine_cs *engine,
>   {
>   	gen9_ctx_workarounds_init(engine, wal);
>   
> -	/* WaToEnableHwFixForPushConstHWBug:glk */
> +	/* WaToEnableHwFixForPushConstHWBug */
>   	wa_masked_en(wal, COMMON_SLICE_CHICKEN2,
>   		     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
>   }
> @@ -586,11 +586,11 @@ static void cfl_ctx_workarounds_init(struct intel_engine_cs *engine,
>   {
>   	gen9_ctx_workarounds_init(engine, wal);
>   
> -	/* WaToEnableHwFixForPushConstHWBug:cfl */
> +	/* WaToEnableHwFixForPushConstHWBug */
>   	wa_masked_en(wal, COMMON_SLICE_CHICKEN2,
>   		     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
>   
> -	/* WaDisableSbeCacheDispatchPortSharing:cfl */
> +	/* WaDisableSbeCacheDispatchPortSharing */
>   	wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>   			 GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
>   }
> @@ -598,13 +598,13 @@ static void cfl_ctx_workarounds_init(struct intel_engine_cs *engine,
>   static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
>   				     struct i915_wa_list *wal)
>   {
> -	/* Wa_1406697149 (WaDisableBankHangMode:icl) */
> +	/* Wa_1406697149 (WaDisableBankHangMode */
>   	wa_write(wal,
>   		 GEN8_L3CNTLREG,
>   		 intel_uncore_read(engine->uncore, GEN8_L3CNTLREG) |
>   		 GEN8_ERRDETBCTRL);
>   
> -	/* WaForceEnableNonCoherent:icl
> +	/* WaForceEnableNonCoherent
>   	 * This is not the same workaround as in early Gen9 platforms, where
>   	 * lacking this could cause system hangs, but coherency performance
>   	 * overhead is high and only a few compute workloads really need it
> @@ -613,13 +613,13 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
>   	 */
>   	wa_mcr_masked_en(wal, ICL_HDC_MODE, HDC_FORCE_NON_COHERENT);
>   
> -	/* WaEnableFloatBlendOptimization:icl */
> +	/* WaEnableFloatBlendOptimization */
>   	wa_mcr_add(wal, GEN10_CACHE_MODE_SS, 0,
>   		   _MASKED_BIT_ENABLE(FLOAT_BLEND_OPTIMIZATION_ENABLE),
>   		   0 /* write-only, so skip validation */,
>   		   true);
>   
> -	/* WaDisableGPGPUMidThreadPreemption:icl */
> +	/* WaDisableGPGPUMidThreadPreemption */
>   	wa_masked_field_set(wal, GEN8_CS_CHICKEN1,
>   			    GEN9_PREEMPT_GPGPU_LEVEL_MASK,
>   			    GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL);
> @@ -628,13 +628,13 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
>   	wa_mcr_masked_en(wal, GEN10_SAMPLER_MODE,
>   			 GEN11_SAMPLER_ENABLE_HEADLESS_MSG);
>   
> -	/* Wa_1604278689:icl,ehl */
> +	/* Wa_1604278689 */
>   	wa_write(wal, IVB_FBC_RT_BASE, 0xFFFFFFFF & ~ILK_FBC_RT_VALID);
>   	wa_write_clr_set(wal, IVB_FBC_RT_BASE_UPPER,
>   			 0, /* write-only register; skip validation */
>   			 0xFFFFFFFF);
>   
> -	/* Wa_1406306137:icl,ehl */
> +	/* Wa_1406306137 */
>   	wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4, GEN11_DIS_PICK_2ND_EU);
>   }
>   
> @@ -668,7 +668,7 @@ static void gen12_ctx_gt_tuning_init(struct intel_engine_cs *engine,
>   	 * workaround.
>   	 *
>   	 * Note that the programming of this register is further modified
> -	 * according to the FF_MODE2 guidance given by Wa_1608008084:gen12.
> +	 * according to the FF_MODE2 guidance given by Wa_1608008084
>   	 * Wa_1608008084 tells us the FF_MODE2 register will return the wrong
>   	 * value when read. The default value for this register is zero for all
>   	 * fields and there are no bit masks. So instead of doing a RMW we
> @@ -690,21 +690,21 @@ static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
>   	gen12_ctx_gt_tuning_init(engine, wal);
>   
>   	/*
> -	 * Wa_1409142259:tgl,dg1,adl-p
> -	 * Wa_1409347922:tgl,dg1,adl-p
> -	 * Wa_1409252684:tgl,dg1,adl-p
> -	 * Wa_1409217633:tgl,dg1,adl-p
> -	 * Wa_1409207793:tgl,dg1,adl-p
> -	 * Wa_1409178076:tgl,dg1,adl-p
> -	 * Wa_1408979724:tgl,dg1,adl-p
> -	 * Wa_14010443199:tgl,rkl,dg1,adl-p
> -	 * Wa_14010698770:tgl,rkl,dg1,adl-s,adl-p
> -	 * Wa_1409342910:tgl,rkl,dg1,adl-s,adl-p
> +	 * Wa_1409142259
> +	 * Wa_1409347922
> +	 * Wa_1409252684
> +	 * Wa_1409217633
> +	 * Wa_1409207793
> +	 * Wa_1409178076
> +	 * Wa_1408979724
> +	 * Wa_14010443199
> +	 * Wa_14010698770
> +	 * Wa_1409342910
>   	 */
>   	wa_masked_en(wal, GEN11_COMMON_SLICE_CHICKEN3,
>   		     GEN12_DISABLE_CPS_AWARE_COLOR_PIPE);
>   
> -	/* WaDisableGPGPUMidThreadPreemption:gen12 */
> +	/* WaDisableGPGPUMidThreadPreemption */
>   	wa_masked_field_set(wal, GEN8_CS_CHICKEN1,
>   			    GEN9_PREEMPT_GPGPU_LEVEL_MASK,
>   			    GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL);
> @@ -745,44 +745,44 @@ static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
>   {
>   	dg2_ctx_gt_tuning_init(engine, wal);
>   
> -	/* Wa_16011186671:dg2_g11 */
> +	/* Wa_16011186671 */
>   	if (IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
>   		wa_mcr_masked_dis(wal, VFLSKPD, DIS_MULT_MISS_RD_SQUASH);
>   		wa_mcr_masked_en(wal, VFLSKPD, DIS_OVER_FETCH_CACHE);
>   	}
>   
>   	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
> -		/* Wa_14010469329:dg2_g10 */
> +		/* Wa_14010469329 */
>   		wa_mcr_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
>   				 XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE);
>   
>   		/*
> -		 * Wa_22010465075:dg2_g10
> -		 * Wa_22010613112:dg2_g10
> -		 * Wa_14010698770:dg2_g10
> +		 * Wa_22010465075
> +		 * Wa_22010613112
> +		 * Wa_14010698770
>   		 */
>   		wa_mcr_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
>   				 GEN12_DISABLE_CPS_AWARE_COLOR_PIPE);
>   	}
>   
> -	/* Wa_16013271637:dg2 */
> +	/* Wa_16013271637 */
>   	wa_mcr_masked_en(wal, XEHP_SLICE_COMMON_ECO_CHICKEN1,
>   			 MSC_MSAA_REODER_BUF_BYPASS_DISABLE);
>   
> -	/* Wa_14014947963:dg2 */
> +	/* Wa_14014947963 */
>   	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_B0, STEP_FOREVER) ||
>   	    IS_DG2_G11(engine->i915) || IS_DG2_G12(engine->i915))
>   		wa_masked_field_set(wal, VF_PREEMPTION, PREEMPTION_VERTEX_COUNT, 0x4000);
>   
> -	/* Wa_18018764978:dg2 */
> +	/* Wa_18018764978 */
>   	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_C0, STEP_FOREVER) ||
>   	    IS_DG2_G11(engine->i915) || IS_DG2_G12(engine->i915))
>   		wa_masked_en(wal, PSS_MODE2, SCOREBOARD_STALL_FLUSH_CONTROL);
>   
> -	/* Wa_15010599737:dg2 */
> +	/* Wa_15010599737 */
>   	wa_masked_en(wal, CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN);
>   
> -	/* Wa_18019271663:dg2 */
> +	/* Wa_18019271663 */
>   	wa_masked_en(wal, CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE);
>   }
>   
> @@ -955,7 +955,7 @@ static void
>   gen4_gt_workarounds_init(struct intel_gt *gt,
>   			 struct i915_wa_list *wal)
>   {
> -	/* WaDisable_RenderCache_OperationalFlush:gen4,ilk */
> +	/* WaDisable_RenderCache_OperationalFlush */
>   	wa_masked_dis(wal, CACHE_MODE_0, RC_OP_FLUSH_ENABLE);
>   }
>   
> @@ -964,7 +964,7 @@ g4x_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
>   	gen4_gt_workarounds_init(gt, wal);
>   
> -	/* WaDisableRenderCachePipelinedFlush:g4x,ilk */
> +	/* WaDisableRenderCachePipelinedFlush */
>   	wa_masked_en(wal, CACHE_MODE_0, CM0_PIPELINED_RENDER_FLUSH_DISABLE);
>   }
>   
> @@ -984,27 +984,27 @@ snb_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   static void
>   ivb_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
> -	/* Apply the WaDisableRHWOOptimizationForRenderHang:ivb workaround. */
> +	/* Apply the WaDisableRHWOOptimizationForRenderHang */
>   	wa_masked_dis(wal,
>   		      GEN7_COMMON_SLICE_CHICKEN1,
>   		      GEN7_CSC1_RHWO_OPT_DISABLE_IN_RCC);
>   
> -	/* WaApplyL3ControlAndL3ChickenMode:ivb */
> +	/* WaApplyL3ControlAndL3ChickenMode */
>   	wa_write(wal, GEN7_L3CNTLREG1, GEN7_WA_FOR_GEN7_L3_CONTROL);
>   	wa_write(wal, GEN7_L3_CHICKEN_MODE_REGISTER, GEN7_WA_L3_CHICKEN_MODE);
>   
> -	/* WaForceL3Serialization:ivb */
> +	/* WaForceL3Serialization */
>   	wa_write_clr(wal, GEN7_L3SQCREG4, L3SQ_URB_READ_CAM_MATCH_DISABLE);
>   }
>   
>   static void
>   vlv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
> -	/* WaForceL3Serialization:vlv */
> +	/* WaForceL3Serialization */
>   	wa_write_clr(wal, GEN7_L3SQCREG4, L3SQ_URB_READ_CAM_MATCH_DISABLE);
>   
>   	/*
> -	 * WaIncreaseL3CreditsForVLVB0:vlv
> +	 * WaIncreaseL3CreditsForVLVB0
>   	 * This is the hardware default actually.
>   	 */
>   	wa_write(wal, GEN7_L3SQCREG1, VLV_B0_WA_L3SQCREG1_VALUE);
> @@ -1021,7 +1021,7 @@ hsw_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   	       _MASKED_BIT_ENABLE(HSW_ROW_CHICKEN3_L3_GLOBAL_ATOMICS_DISABLE),
>   	       0 /* XXX does this reg exist? */, true);
>   
> -	/* WaVSRefCountFullforceMissDisable:hsw */
> +	/* WaVSRefCountFullforceMissDisable */
>   	wa_write_clr(wal, GEN7_FF_THREAD_MODE, GEN7_FF_VS_REF_CNT_FFME);
>   }
>   
> @@ -1035,7 +1035,7 @@ gen9_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
>   	GEM_BUG_ON(GRAPHICS_VER(i915) != 9);
>   
>   	/*
> -	 * WaProgramMgsrForCorrectSliceSpecificMmioReads:gen9,glk,kbl,cml
> +	 * WaProgramMgsrForCorrectSliceSpecificMmioReads
>   	 * Before any MMIO read into slice/subslice specific registers, MCR
>   	 * packet control register needs to be programmed to point to any
>   	 * enabled s/ss pair. Otherwise, incorrect values will be returned.
> @@ -1068,17 +1068,17 @@ gen9_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
>   	struct drm_i915_private *i915 = gt->i915;
>   
> -	/* WaProgramMgsrForCorrectSliceSpecificMmioReads:glk,kbl,cml,gen9 */
> +	/* WaProgramMgsrForCorrectSliceSpecificMmioReads */
>   	gen9_wa_init_mcr(i915, wal);
>   
> -	/* WaDisableKillLogic:bxt,skl,kbl */
> +	/* WaDisableKillLogic */
>   	if (!IS_COFFEELAKE(i915) && !IS_COMETLAKE(i915))
>   		wa_write_or(wal,
>   			    GAM_ECOCHK,
>   			    ECOCHK_DIS_TLB);
>   
>   	if (HAS_LLC(i915)) {
> -		/* WaCompressedResourceSamplerPbeMediaNewHashMode:skl,kbl
> +		/* WaCompressedResourceSamplerPbeMediaNewHashMode
>   		 *
>   		 * Must match Display Engine. See
>   		 * WaCompressedResourceDisplayNewHashMode.
> @@ -1088,7 +1088,7 @@ gen9_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   			    MMCD_PCLA | MMCD_HOTSPOT_EN);
>   	}
>   
> -	/* WaDisableHDCInvalidation:skl,bxt,kbl,cfl */
> +	/* WaDisableHDCInvalidation */
>   	wa_write_or(wal,
>   		    GAM_ECOCHK,
>   		    BDW_DISABLE_HDC_INVALIDATION);
> @@ -1099,12 +1099,12 @@ skl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
>   	gen9_gt_workarounds_init(gt, wal);
>   
> -	/* WaDisableGafsUnitClkGating:skl */
> +	/* WaDisableGafsUnitClkGating */
>   	wa_write_or(wal,
>   		    GEN7_UCGCTL4,
>   		    GEN8_EU_GAUNIT_CLOCK_GATE_DISABLE);
>   
> -	/* WaInPlaceDecompressionHang:skl */
> +	/* WaInPlaceDecompressionHang */
>   	if (IS_SKL_GRAPHICS_STEP(gt->i915, STEP_A0, STEP_H0))
>   		wa_write_or(wal,
>   			    GEN9_GAMT_ECO_REG_RW_IA,
> @@ -1116,18 +1116,18 @@ kbl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
>   	gen9_gt_workarounds_init(gt, wal);
>   
> -	/* WaDisableDynamicCreditSharing:kbl */
> +	/* WaDisableDynamicCreditSharing */
>   	if (IS_KBL_GRAPHICS_STEP(gt->i915, 0, STEP_C0))
>   		wa_write_or(wal,
>   			    GAMT_CHKN_BIT_REG,
>   			    GAMT_CHKN_DISABLE_DYNAMIC_CREDIT_SHARING);
>   
> -	/* WaDisableGafsUnitClkGating:kbl */
> +	/* WaDisableGafsUnitClkGating */
>   	wa_write_or(wal,
>   		    GEN7_UCGCTL4,
>   		    GEN8_EU_GAUNIT_CLOCK_GATE_DISABLE);
>   
> -	/* WaInPlaceDecompressionHang:kbl */
> +	/* WaInPlaceDecompressionHang */
>   	wa_write_or(wal,
>   		    GEN9_GAMT_ECO_REG_RW_IA,
>   		    GAMT_ECO_ENABLE_IN_PLACE_DECOMPRESS);
> @@ -1144,12 +1144,12 @@ cfl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
>   	gen9_gt_workarounds_init(gt, wal);
>   
> -	/* WaDisableGafsUnitClkGating:cfl */
> +	/* WaDisableGafsUnitClkGating */
>   	wa_write_or(wal,
>   		    GEN7_UCGCTL4,
>   		    GEN8_EU_GAUNIT_CLOCK_GATE_DISABLE);
>   
> -	/* WaInPlaceDecompressionHang:cfl */
> +	/* WaInPlaceDecompressionHang */
>   	wa_write_or(wal,
>   		    GEN9_GAMT_ECO_REG_RW_IA,
>   		    GAMT_ECO_ENABLE_IN_PLACE_DECOMPRESS);
> @@ -1327,13 +1327,13 @@ icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   
>   	icl_wa_init_mcr(gt, wal);
>   
> -	/* WaModifyGamTlbPartitioning:icl */
> +	/* WaModifyGamTlbPartitioning */
>   	wa_write_clr_set(wal,
>   			 GEN11_GACB_PERF_CTRL,
>   			 GEN11_HASH_CTRL_MASK,
>   			 GEN11_HASH_CTRL_BIT0 | GEN11_HASH_CTRL_BIT4);
>   
> -	/* Wa_1405766107:icl
> +	/* Wa_1405766107
>   	 * Formerly known as WaCL2SFHalfMaxAlloc
>   	 */
>   	wa_write_or(wal,
> @@ -1341,30 +1341,30 @@ icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   		    GEN11_LSN_UNSLCVC_GAFS_HALF_SF_MAXALLOC |
>   		    GEN11_LSN_UNSLCVC_GAFS_HALF_CL2_MAXALLOC);
>   
> -	/* Wa_220166154:icl
> +	/* Wa_220166154
>   	 * Formerly known as WaDisCtxReload
>   	 */
>   	wa_write_or(wal,
>   		    GEN8_GAMW_ECO_DEV_RW_IA,
>   		    GAMW_ECO_DEV_CTX_RELOAD_DISABLE);
>   
> -	/* Wa_1406463099:icl
> +	/* Wa_1406463099
>   	 * Formerly known as WaGamTlbPendError
>   	 */
>   	wa_write_or(wal,
>   		    GAMT_CHKN_BIT_REG,
>   		    GAMT_CHKN_DISABLE_L3_COH_PIPE);
>   
> -	/* Wa_1407352427:icl,ehl */
> +	/* Wa_1407352427 */
>   	wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
>   		    PSDUNIT_CLKGATE_DIS);
>   
> -	/* Wa_1406680159:icl,ehl */
> +	/* Wa_1406680159 */
>   	wa_mcr_write_or(wal,
>   			GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
>   			GWUNIT_CLKGATE_DIS);
>   
> -	/* Wa_1607087056:icl,ehl,jsl */
> +	/* Wa_1607087056 */
>   	if (IS_ICELAKE(i915) ||
>   	    IS_JSL_EHL_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
>   		wa_write_or(wal,
> @@ -1405,10 +1405,10 @@ gen12_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
>   	icl_wa_init_mcr(gt, wal);
>   
> -	/* Wa_14011060649:tgl,rkl,dg1,adl-s,adl-p */
> +	/* Wa_14011060649 */
>   	wa_14011060649(gt, wal);
>   
> -	/* Wa_14011059788:tgl,rkl,adl-s,dg1,adl-p */
> +	/* Wa_14011059788 */
>   	wa_mcr_write_or(wal, GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE);
>   }
>   
> @@ -1419,19 +1419,19 @@ tgl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   
>   	gen12_gt_workarounds_init(gt, wal);
>   
> -	/* Wa_1409420604:tgl */
> +	/* Wa_1409420604 */
>   	if (IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
>   		wa_mcr_write_or(wal,
>   				SUBSLICE_UNIT_LEVEL_CLKGATE2,
>   				CPSSUNIT_CLKGATE_DIS);
>   
> -	/* Wa_1607087056:tgl also know as BUG:1409180338 */
> +	/* Wa_1607087056 */
>   	if (IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
>   		wa_write_or(wal,
>   			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
>   			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
>   
> -	/* Wa_1408615072:tgl[a0] */
> +	/* Wa_1408615072 */
>   	if (IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
>   		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
>   			    VSUNIT_CLKGATE_DIS_TGL);
> @@ -1444,19 +1444,19 @@ dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   
>   	gen12_gt_workarounds_init(gt, wal);
>   
> -	/* Wa_1607087056:dg1 */
> +	/* Wa_1607087056 */
>   	if (IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
>   		wa_write_or(wal,
>   			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
>   			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
>   
> -	/* Wa_1409420604:dg1 */
> +	/* Wa_1409420604 */
>   	if (IS_DG1(i915))
>   		wa_mcr_write_or(wal,
>   				SUBSLICE_UNIT_LEVEL_CLKGATE2,
>   				CPSSUNIT_CLKGATE_DIS);
>   
> -	/* Wa_1408615072:dg1 */
> +	/* Wa_1408615072 */
>   	/* Empirical testing shows this register is unaffected by engine reset. */
>   	if (IS_DG1(i915))
>   		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
> @@ -1470,15 +1470,15 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   
>   	xehp_init_mcr(gt, wal);
>   
> -	/* Wa_1409757795:xehpsdv */
> +	/* Wa_1409757795 */
>   	wa_mcr_write_or(wal, SCCGCTL94DC, CG3DDISURB);
>   
> -	/* Wa_16011155590:xehpsdv */
> +	/* Wa_16011155590 */
>   	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
>   		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
>   			    TSGUNIT_CLKGATE_DIS);
>   
> -	/* Wa_14011780169:xehpsdv */
> +	/* Wa_14011780169 */
>   	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_B0, STEP_FOREVER)) {
>   		wa_write_or(wal, UNSLCGCTL9440, GAMTLBOACS_CLKGATE_DIS |
>   			    GAMTLBVDBOX7_CLKGATE_DIS |
> @@ -1509,11 +1509,11 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   			    GAMTLBVEBOX0_CLKGATE_DIS);
>   	}
>   
> -	/* Wa_16012725990:xehpsdv */
> +	/* Wa_16012725990 */
>   	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_FOREVER))
>   		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE, VFUNIT_CLKGATE_DIS);
>   
> -	/* Wa_14011060649:xehpsdv */
> +	/* Wa_14011060649 */
>   	wa_14011060649(gt, wal);
>   }
>   
> @@ -1525,7 +1525,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   
>   	xehp_init_mcr(gt, wal);
>   
> -	/* Wa_14011060649:dg2 */
> +	/* Wa_14011060649 */
>   	wa_14011060649(gt, wal);
>   
>   	/*
> @@ -1539,33 +1539,33 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   		if (engine->class != VIDEO_DECODE_CLASS)
>   			continue;
>   
> -		/* Wa_16010515920:dg2_g10 */
> +		/* Wa_16010515920 */
>   		if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0))
>   			wa_write_or(wal, VDBOX_CGCTL3F18(engine->mmio_base),
>   				    ALNUNIT_CLKGATE_DIS);
>   	}
>   
>   	if (IS_DG2_G10(gt->i915)) {
> -		/* Wa_22010523718:dg2 */
> +		/* Wa_22010523718 */
>   		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
>   			    CG3DDISCFEG_CLKGATE_DIS);
>   
> -		/* Wa_14011006942:dg2 */
> +		/* Wa_14011006942 */
>   		wa_mcr_write_or(wal, GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
>   				DSS_ROUTER_CLKGATE_DIS);
>   	}
>   
>   	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0)) {
> -		/* Wa_14010948348:dg2_g10 */
> +		/* Wa_14010948348 */
>   		wa_write_or(wal, UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS);
>   
> -		/* Wa_14011037102:dg2_g10 */
> +		/* Wa_14011037102 */
>   		wa_write_or(wal, UNSLCGCTL9444, LTCDD_CLKGATE_DIS);
>   
> -		/* Wa_14011371254:dg2_g10 */
> +		/* Wa_14011371254 */
>   		wa_mcr_write_or(wal, XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS);
>   
> -		/* Wa_14011431319:dg2_g10 */
> +		/* Wa_14011431319 */
>   		wa_write_or(wal, UNSLCGCTL9440, GAMTLBOACS_CLKGATE_DIS |
>   			    GAMTLBVDBOX7_CLKGATE_DIS |
>   			    GAMTLBVDBOX6_CLKGATE_DIS |
> @@ -1594,15 +1594,15 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   			    GAMTLBVEBOX1_CLKGATE_DIS |
>   			    GAMTLBVEBOX0_CLKGATE_DIS);
>   
> -		/* Wa_14010569222:dg2_g10 */
> +		/* Wa_14010569222 */
>   		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
>   			    GAMEDIA_CLKGATE_DIS);
>   
> -		/* Wa_14011028019:dg2_g10 */
> +		/* Wa_14011028019 */
>   		wa_mcr_write_or(wal, SSMCGCTL9530, RTFUNIT_CLKGATE_DIS);
>   	}
>   
> -	/* Wa_14014830051:dg2 */
> +	/* Wa_14014830051 */
>   	wa_mcr_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
>   
>   	/*
> @@ -1898,16 +1898,16 @@ whitelist_mcr_reg(struct i915_wa_list *wal, i915_mcr_reg_t reg)
>   
>   static void gen9_whitelist_build(struct i915_wa_list *w)
>   {
> -	/* WaVFEStateAfterPipeControlwithMediaStateClear:skl,bxt,glk,cfl */
> +	/* WaVFEStateAfterPipeControlwithMediaStateClear */
>   	whitelist_reg(w, GEN9_CTX_PREEMPT_REG);
>   
> -	/* WaEnablePreemptionGranularityControlByUMD:skl,bxt,kbl,cfl,[cnl] */
> +	/* WaEnablePreemptionGranularityControlByUMD */
>   	whitelist_reg(w, GEN8_CS_CHICKEN1);
>   
> -	/* WaAllowUMDToModifyHDCChicken1:skl,bxt,kbl,glk,cfl */
> +	/* WaAllowUMDToModifyHDCChicken1 */
>   	whitelist_reg(w, GEN8_HDC_CHICKEN1);
>   
> -	/* WaSendPushConstantsFromMMIO:skl,bxt */
> +	/* WaSendPushConstantsFromMMIO */
>   	whitelist_reg(w, COMMON_SLICE_CHICKEN2);
>   }
>   
> @@ -1920,7 +1920,7 @@ static void skl_whitelist_build(struct intel_engine_cs *engine)
>   
>   	gen9_whitelist_build(w);
>   
> -	/* WaDisableLSQCROPERFforOCL:skl */
> +	/* WaDisableLSQCROPERFforOCL */
>   	whitelist_mcr_reg(w, GEN8_L3SQCREG4);
>   }
>   
> @@ -1941,7 +1941,7 @@ static void kbl_whitelist_build(struct intel_engine_cs *engine)
>   
>   	gen9_whitelist_build(w);
>   
> -	/* WaDisableLSQCROPERFforOCL:kbl */
> +	/* WaDisableLSQCROPERFforOCL */
>   	whitelist_mcr_reg(w, GEN8_L3SQCREG4);
>   }
>   
> @@ -1968,7 +1968,7 @@ static void cfl_whitelist_build(struct intel_engine_cs *engine)
>   	gen9_whitelist_build(w);
>   
>   	/*
> -	 * WaAllowPMDepthAndInvocationCountAccessFromUMD:cfl,whl,cml,aml
> +	 * WaAllowPMDepthAndInvocationCountAccessFromUMD
>   	 *
>   	 * This covers 4 register which are next to one another :
>   	 *   - PS_INVOCATION_COUNT
> @@ -2006,17 +2006,17 @@ static void icl_whitelist_build(struct intel_engine_cs *engine)
>   
>   	switch (engine->class) {
>   	case RENDER_CLASS:
> -		/* WaAllowUMDToModifyHalfSliceChicken7:icl */
> +		/* WaAllowUMDToModifyHalfSliceChicken7 */
>   		whitelist_mcr_reg(w, GEN9_HALF_SLICE_CHICKEN7);
>   
> -		/* WaAllowUMDToModifySamplerMode:icl */
> +		/* WaAllowUMDToModifySamplerMode */
>   		whitelist_mcr_reg(w, GEN10_SAMPLER_MODE);
>   
> -		/* WaEnableStateCacheRedirectToCS:icl */
> +		/* WaEnableStateCacheRedirectToCS */
>   		whitelist_reg(w, GEN9_SLICE_COMMON_ECO_CHICKEN1);
>   
>   		/*
> -		 * WaAllowPMDepthAndInvocationCountAccessFromUMD:icl
> +		 * WaAllowPMDepthAndInvocationCountAccessFromUMD
>   		 *
>   		 * This covers 4 register which are next to one another :
>   		 *   - PS_INVOCATION_COUNT
> @@ -2055,8 +2055,8 @@ static void tgl_whitelist_build(struct intel_engine_cs *engine)
>   	switch (engine->class) {
>   	case RENDER_CLASS:
>   		/*
> -		 * WaAllowPMDepthAndInvocationCountAccessFromUMD:tgl
> -		 * Wa_1408556865:tgl
> +		 * WaAllowPMDepthAndInvocationCountAccessFromUMD
> +		 * Wa_1408556865
>   		 *
>   		 * This covers 4 registers which are next to one another :
>   		 *   - PS_INVOCATION_COUNT
> @@ -2069,13 +2069,13 @@ static void tgl_whitelist_build(struct intel_engine_cs *engine)
>   				  RING_FORCE_TO_NONPRIV_RANGE_4);
>   
>   		/*
> -		 * Wa_1808121037:tgl
> -		 * Wa_14012131227:dg1
> -		 * Wa_1508744258:tgl,rkl,dg1,adl-s,adl-p
> +		 * Wa_1808121037
> +		 * Wa_14012131227
> +		 * Wa_1508744258
>   		 */
>   		whitelist_reg(w, GEN7_COMMON_SLICE_CHICKEN1);
>   
> -		/* Wa_1806527549:tgl */
> +		/* Wa_1806527549 */
>   		whitelist_reg(w, HIZ_CHICKEN);
>   		break;
>   	default:
> @@ -2111,7 +2111,7 @@ static void dg2_whitelist_build(struct intel_engine_cs *engine)
>   	switch (engine->class) {
>   	case RENDER_CLASS:
>   		/*
> -		 * Wa_1507100340:dg2_g10
> +		 * Wa_1507100340
>   		 *
>   		 * This covers 4 registers which are next to one another :
>   		 *   - PS_INVOCATION_COUNT
> @@ -2126,7 +2126,7 @@ static void dg2_whitelist_build(struct intel_engine_cs *engine)
>   
>   		break;
>   	case COMPUTE_CLASS:
> -		/* Wa_16011157294:dg2_g10 */
> +		/* Wa_16011157294 */
>   		if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0))
>   			whitelist_reg(w, GEN9_CTX_PREEMPT_REG);
>   		break;
> @@ -2157,7 +2157,7 @@ static void pvc_whitelist_build(struct intel_engine_cs *engine)
>   {
>   	allow_read_ctx_timestamp(engine);
>   
> -	/* Wa_16014440446:pvc */
> +	/* Wa_16014440446 */
>   	blacklist_trtt(engine);
>   }
>   
> @@ -2279,26 +2279,26 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	struct drm_i915_private *i915 = engine->i915;
>   
>   	if (IS_DG2(i915)) {
> -		/* Wa_1509235366:dg2 */
> +		/* Wa_1509235366 */
>   		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
>   			    GLOBAL_INVALIDATION_MODE);
>   	}
>   
>   	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
> -		/* Wa_14013392000:dg2_g11 */
> +		/* Wa_14013392000 */
>   		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
>   	}
>   
>   	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_B0, STEP_FOREVER) ||
>   	    IS_DG2_G11(i915) || IS_DG2_G12(i915)) {
> -		/* Wa_1509727124:dg2 */
> +		/* Wa_1509727124 */
>   		wa_mcr_masked_en(wal, GEN10_SAMPLER_MODE,
>   				 SC_DISABLE_POWER_OPTIMIZATION_EBB);
>   	}
>   
>   	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0) ||
>   	    IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
> -		/* Wa_14012419201:dg2 */
> +		/* Wa_14012419201 */
>   		wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4,
>   				 GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX);
>   	}
> @@ -2306,19 +2306,19 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_B0, STEP_C0) ||
>   	    IS_DG2_G11(i915)) {
>   		/*
> -		 * Wa_22012826095:dg2
> -		 * Wa_22013059131:dg2
> +		 * Wa_22012826095
> +		 * Wa_22013059131
>   		 */
>   		wa_mcr_write_clr_set(wal, LSC_CHICKEN_BIT_0_UDW,
>   				     MAXREQS_PER_BANK,
>   				     REG_FIELD_PREP(MAXREQS_PER_BANK, 2));
>   
> -		/* Wa_22013059131:dg2 */
> +		/* Wa_22013059131 */
>   		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0,
>   				FORCE_1_SUB_MESSAGE_PER_FRAGMENT);
>   	}
>   
> -	/* Wa_1308578152:dg2_g10 when first gslice is fused off */
> +	/* Wa_1308578152 */
>   	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_B0, STEP_C0) &&
>   	    needs_wa_1308578152(engine)) {
>   		wa_masked_dis(wal, GEN12_CS_DEBUG_MODE1_CCCSUNIT_BE_COMMON,
> @@ -2327,17 +2327,17 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   
>   	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_B0, STEP_FOREVER) ||
>   	    IS_DG2_G11(i915) || IS_DG2_G12(i915)) {
> -		/* Wa_22013037850:dg2 */
> +		/* Wa_22013037850 */
>   		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0_UDW,
>   				DISABLE_128B_EVICTION_COMMAND_UDW);
>   
> -		/* Wa_22012856258:dg2 */
> +		/* Wa_22012856258 */
>   		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2,
>   				 GEN12_DISABLE_READ_SUPPRESSION);
>   
>   		/*
> -		 * Wa_22010960976:dg2
> -		 * Wa_14013347512:dg2
> +		 * Wa_22010960976
> +		 * Wa_14013347512
>   		 */
>   		wa_mcr_masked_dis(wal, XEHP_HDC_CHICKEN0,
>   				  LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK);
> @@ -2345,14 +2345,14 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   
>   	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0)) {
>   		/*
> -		 * Wa_1608949956:dg2_g10
> -		 * Wa_14010198302:dg2_g10
> +		 * Wa_1608949956
> +		 * Wa_14010198302
>   		 */
>   		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN,
>   				 MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE);
>   
>   		/*
> -		 * Wa_14010918519:dg2_g10
> +		 * Wa_14010918519
>   		 *
>   		 * LSC_CHICKEN_BIT_0 always reads back as 0 is this stepping,
>   		 * so ignoring verification.
> @@ -2363,41 +2363,41 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	}
>   
>   	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0)) {
> -		/* Wa_22010430635:dg2 */
> +		/* Wa_22010430635 */
>   		wa_mcr_masked_en(wal,
>   				 GEN9_ROW_CHICKEN4,
>   				 GEN12_DISABLE_GRF_CLEAR);
>   
> -		/* Wa_14010648519:dg2 */
> +		/* Wa_14010648519 */
>   		wa_mcr_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
>   	}
>   
> -	/* Wa_14013202645:dg2 */
> +	/* Wa_14013202645 */
>   	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_B0, STEP_C0) ||
>   	    IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0))
>   		wa_mcr_write_or(wal, RT_CTRL, DIS_NULL_QUERY);
>   
> -	/* Wa_22012532006:dg2 */
> +	/* Wa_22012532006 */
>   	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_C0) ||
>   	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0))
>   		wa_mcr_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
>   				 DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA);
>   
>   	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
> -		/* Wa_14010680813:dg2_g10 */
> +		/* Wa_14010680813 */
>   		wa_write_or(wal, GEN12_GAMSTLB_CTRL, CONTROL_BLOCK_CLKGATE_DIS |
>   			    EGRESS_BLOCK_CLKGATE_DIS | TAG_BLOCK_CLKGATE_DIS);
>   	}
>   
>   	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0) ||
>   	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
> -		/* Wa_14012362059:dg2 */
> +		/* Wa_14012362059 */
>   		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
>   	}
>   
>   	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_B0, STEP_FOREVER) ||
>   	    IS_DG2_G10(i915)) {
> -		/* Wa_22014600077:dg2 */
> +		/* Wa_22014600077 */
>   		wa_mcr_add(wal, GEN10_CACHE_MODE_SS, 0,
>   			   _MASKED_BIT_ENABLE(ENABLE_EU_COUNT_FOR_TDL_FLUSH),
>   			   0 /* Wa_14012342262 write-only reg, so skip verification */,
> @@ -2407,8 +2407,8 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	if (IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
>   	    IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0)) {
>   		/*
> -		 * Wa_1607138336:tgl[a0],dg1[a0]
> -		 * Wa_1607063988:tgl[a0],dg1[a0]
> +		 * Wa_1607138336
> +		 * Wa_1607063988
>   		 */
>   		wa_write_or(wal,
>   			    GEN9_CTX_PREEMPT_REG,
> @@ -2417,8 +2417,8 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   
>   	if (IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0)) {
>   		/*
> -		 * Wa_1606679103:tgl
> -		 * (see also Wa_1606682166:icl)
> +		 * Wa_1606679103
> +		 * (see also Wa_1606682166
>   		 */
>   		wa_write_or(wal,
>   			    GEN7_SARCHKMD,
> @@ -2427,14 +2427,14 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   
>   	if (IS_ALDERLAKE_P(i915) || IS_ALDERLAKE_S(i915) || IS_DG1(i915) ||
>   	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
> -		/* Wa_1606931601:tgl,rkl,dg1,adl-s,adl-p */
> +		/* Wa_1606931601 */
>   		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ);
>   
>   		/*
> -		 * Wa_1407928979:tgl A*
> -		 * Wa_18011464164:tgl[B0+],dg1[B0+]
> -		 * Wa_22010931296:tgl[B0+],dg1[B0+]
> -		 * Wa_14010919138:rkl,dg1,adl-s,adl-p
> +		 * Wa_1407928979
> +		 * Wa_18011464164
> +		 * Wa_22010931296
> +		 * Wa_14010919138
>   		 */
>   		wa_write_or(wal, GEN7_FF_THREAD_MODE,
>   			    GEN12_FF_TESSELATION_DOP_GATE_DISABLE);
> @@ -2443,10 +2443,10 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	if (IS_ALDERLAKE_P(i915) || IS_DG2(i915) || IS_ALDERLAKE_S(i915) ||
>   	    IS_DG1(i915) || IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
>   		/*
> -		 * Wa_1606700617:tgl,dg1,adl-p
> -		 * Wa_22010271021:tgl,rkl,dg1,adl-s,adl-p
> -		 * Wa_14010826681:tgl,dg1,rkl,adl-p
> -		 * Wa_18019627453:dg2
> +		 * Wa_1606700617
> +		 * Wa_22010271021
> +		 * Wa_14010826681
> +		 * Wa_18019627453
>   		 */
>   		wa_masked_en(wal,
>   			     GEN9_CS_DEBUG_MODE1,
> @@ -2456,13 +2456,13 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	if (IS_ALDERLAKE_P(i915) || IS_ALDERLAKE_S(i915) ||
>   	    IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
>   	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
> -		/* Wa_1409804808:tgl,rkl,dg1[a0],adl-s,adl-p */
> +		/* Wa_1409804808 */
>   		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2,
>   				 GEN12_PUSH_CONST_DEREF_HOLD_DIS);
>   
>   		/*
> -		 * Wa_1409085225:tgl
> -		 * Wa_14010229206:tgl,rkl,dg1[a0],adl-s,adl-p
> +		 * Wa_1409085225
> +		 * Wa_14010229206
>   		 */
>   		wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4, GEN12_DISABLE_TDL_PUSH);
>   	}
> @@ -2470,9 +2470,9 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	if (IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
>   	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915) || IS_ALDERLAKE_P(i915)) {
>   		/*
> -		 * Wa_1607030317:tgl
> -		 * Wa_1607186500:tgl
> -		 * Wa_1607297627:tgl,rkl,dg1[a0],adlp
> +		 * Wa_1607030317
> +		 * Wa_1607186500
> +		 * Wa_1607297627
>   		 *
>   		 * On TGL and RKL there are multiple entries for this WA in the
>   		 * BSpec; some indicate this is an A0-only WA, others indicate
> @@ -2487,7 +2487,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   
>   	if (IS_DG1(i915) || IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915) ||
>   	    IS_ALDERLAKE_S(i915) || IS_ALDERLAKE_P(i915)) {
> -		/* Wa_1406941453:tgl,rkl,dg1,adl-s,adl-p */
> +		/* Wa_1406941453 */
>   		wa_mcr_masked_en(wal,
>   				 GEN10_SAMPLER_MODE,
>   				 ENABLE_SMALLPL);
> @@ -2500,7 +2500,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   			     _3D_CHICKEN3_AA_LINE_QUALITY_FIX_ENABLE);
>   
>   		/*
> -		 * Wa_1405543622:icl
> +		 * Wa_1405543622
>   		 * Formerly known as WaGAPZPriorityScheme
>   		 */
>   		wa_write_or(wal,
> @@ -2508,7 +2508,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   			    GEN11_ARBITRATION_PRIO_ORDER_MASK);
>   
>   		/*
> -		 * Wa_1604223664:icl
> +		 * Wa_1604223664
>   		 * Formerly known as WaL3BankAddressHashing
>   		 */
>   		wa_write_clr_set(wal,
> @@ -2521,38 +2521,38 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   				 GEN11_BANK_HASH_ADDR_EXCL_BIT0);
>   
>   		/*
> -		 * Wa_1405733216:icl
> +		 * Wa_1405733216
>   		 * Formerly known as WaDisableCleanEvicts
>   		 */
>   		wa_mcr_write_or(wal,
>   				GEN8_L3SQCREG4,
>   				GEN11_LQSC_CLEAN_EVICT_DISABLE);
>   
> -		/* Wa_1606682166:icl */
> +		/* Wa_1606682166 */
>   		wa_write_or(wal,
>   			    GEN7_SARCHKMD,
>   			    GEN7_DISABLE_SAMPLER_PREFETCH);
>   
> -		/* Wa_1409178092:icl */
> +		/* Wa_1409178092 */
>   		wa_mcr_write_clr_set(wal,
>   				     GEN11_SCRATCH2,
>   				     GEN11_COHERENT_PARTIAL_WRITE_MERGE_ENABLE,
>   				     0);
>   
> -		/* WaEnable32PlaneMode:icl */
> +		/* WaEnable32PlaneMode */
>   		wa_masked_en(wal, GEN9_CSFE_CHICKEN1_RCS,
>   			     GEN11_ENABLE_32_PLANE_MODE);
>   
>   		/*
> -		 * Wa_1408615072:icl,ehl  (vsunit)
> -		 * Wa_1407596294:icl,ehl  (hsunit)
> +		 * Wa_1408615072
> +		 * Wa_1407596294
>   		 */
>   		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
>   			    VSUNIT_CLKGATE_DIS | HSUNIT_CLKGATE_DIS);
>   
>   		/*
> -		 * Wa_1408767742:icl[a2..forever],ehl[all]
> -		 * Wa_1605460711:icl[a0..c0]
> +		 * Wa_1408767742
> +		 * Wa_1605460711
>   		 */
>   		wa_write_or(wal,
>   			    GEN7_FF_THREAD_MODE,
> @@ -2627,31 +2627,31 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	    IS_KABYLAKE(i915) ||
>   	    IS_COFFEELAKE(i915) ||
>   	    IS_COMETLAKE(i915)) {
> -		/* WaEnableGapsTsvCreditFix:skl,kbl,cfl */
> +		/* WaEnableGapsTsvCreditFix */
>   		wa_write_or(wal,
>   			    GEN8_GARBCNTL,
>   			    GEN9_GAPS_TSV_CREDIT_DISABLE);
>   	}
>   
>   	if (IS_BROXTON(i915)) {
> -		/* WaDisablePooledEuLoadBalancingFix:bxt */
> +		/* WaDisablePooledEuLoadBalancingFix */
>   		wa_masked_en(wal,
>   			     FF_SLICE_CS_CHICKEN2,
>   			     GEN9_POOLED_EU_LOAD_BALANCING_FIX_DISABLE);
>   	}
>   
>   	if (GRAPHICS_VER(i915) == 9) {
> -		/* WaContextSwitchWithConcurrentTLBInvalidate:skl,bxt,kbl,glk,cfl */
> +		/* WaContextSwitchWithConcurrentTLBInvalidate */
>   		wa_masked_en(wal,
>   			     GEN9_CSFE_CHICKEN1_RCS,
>   			     GEN9_PREEMPT_GPGPU_SYNC_SWITCH_DISABLE);
>   
> -		/* WaEnableLbsSlaRetryTimerDecrement:skl,bxt,kbl,glk,cfl */
> +		/* WaEnableLbsSlaRetryTimerDecrement */
>   		wa_mcr_write_or(wal,
>   				BDW_SCRATCH1,
>   				GEN9_LBS_SLA_RETRY_TIMER_DECREMENT_ENABLE);
>   
> -		/* WaProgramL3SqcReg1DefaultForPerf:bxt,glk */
> +		/* WaProgramL3SqcReg1DefaultForPerf */
>   		if (IS_GEN9_LP(i915))
>   			wa_mcr_write_clr_set(wal,
>   					     GEN8_L3SQCREG1,
> @@ -2659,7 +2659,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   					     L3_GENERAL_PRIO_CREDITS(62) |
>   					     L3_HIGH_PRIO_CREDITS(2));
>   
> -		/* WaOCLCoherentLineFlush:skl,bxt,kbl,cfl */
> +		/* WaOCLCoherentLineFlush */
>   		wa_mcr_write_or(wal,
>   				GEN8_L3SQCREG4,
>   				GEN8_LQSC_FLUSH_COHERENT_LINES);
> @@ -2674,7 +2674,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	}
>   
>   	if (IS_HASWELL(i915)) {
> -		/* WaSampleCChickenBitEnable:hsw */
> +		/* WaSampleCChickenBitEnable */
>   		wa_masked_en(wal,
>   			     HSW_HALF_SLICE_CHICKEN3, HSW_SAMPLE_C_PERFORMANCE);
>   
> @@ -2685,13 +2685,13 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	}
>   
>   	if (IS_VALLEYVIEW(i915)) {
> -		/* WaDisableEarlyCull:vlv */
> +		/* WaDisableEarlyCull */
>   		wa_masked_en(wal,
>   			     _3D_CHICKEN3,
>   			     _3D_CHICKEN_SF_DISABLE_OBJEND_CULL);
>   
>   		/*
> -		 * WaVSThreadDispatchOverride:ivb,vlv
> +		 * WaVSThreadDispatchOverride
>   		 *
>   		 * This actually overrides the dispatch
>   		 * mode for all thread types.
> @@ -2703,8 +2703,8 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   				 GEN7_FF_VS_SCHED_HW |
>   				 GEN7_FF_DS_SCHED_HW);
>   
> -		/* WaPsdDispatchEnable:vlv */
> -		/* WaDisablePSDDualDispatchEnable:vlv */
> +		/* WaPsdDispatchEnable */
> +		/* WaDisablePSDDualDispatchEnable */
>   		wa_masked_en(wal,
>   			     GEN7_HALF_SLICE_CHICKEN1,
>   			     GEN7_MAX_PS_THREAD_DEP |
> @@ -2712,7 +2712,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	}
>   
>   	if (IS_IVYBRIDGE(i915)) {
> -		/* WaDisableEarlyCull:ivb */
> +		/* WaDisableEarlyCull */
>   		wa_masked_en(wal,
>   			     _3D_CHICKEN3,
>   			     _3D_CHICKEN_SF_DISABLE_OBJEND_CULL);
> @@ -2725,7 +2725,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   		}
>   
>   		/*
> -		 * WaVSThreadDispatchOverride:ivb,vlv
> +		 * WaVSThreadDispatchOverride
>   		 *
>   		 * This actually overrides the dispatch
>   		 * mode for all thread types.
> @@ -2737,7 +2737,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   				 GEN7_FF_VS_SCHED_HW |
>   				 GEN7_FF_DS_SCHED_HW);
>   
> -		/* WaDisablePSDDualDispatchEnable:ivb */
> +		/* WaDisablePSDDualDispatchEnable */
>   		if (IS_IVB_GT1(i915))
>   			wa_masked_en(wal,
>   				     GEN7_HALF_SLICE_CHICKEN1,
> @@ -2745,17 +2745,17 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	}
>   
>   	if (GRAPHICS_VER(i915) == 7) {
> -		/* WaBCSVCSTlbInvalidationMode:ivb,vlv,hsw */
> +		/* WaBCSVCSTlbInvalidationMode */
>   		wa_masked_en(wal,
>   			     RING_MODE_GEN7(RENDER_RING_BASE),
>   			     GFX_TLB_INVALIDATE_EXPLICIT | GFX_REPLAY_MODE);
>   
> -		/* WaDisable_RenderCache_OperationalFlush:ivb,vlv,hsw */
> +		/* WaDisable_RenderCache_OperationalFlush */
>   		wa_masked_dis(wal, CACHE_MODE_0_GEN7, RC_OP_FLUSH_ENABLE);
>   
>   		/*
>   		 * BSpec says this must be set, even though
> -		 * WaDisable4x2SubspanOptimization:ivb,hsw
> +		 * WaDisable4x2SubspanOptimization
>   		 * WaDisable4x2SubspanOptimization isn't listed for VLV.
>   		 */
>   		wa_masked_en(wal,
> @@ -2782,7 +2782,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   		 * order to use MI_WAIT_FOR_EVENT within the CS. It should
>   		 * already be programmed to '1' on all products.
>   		 *
> -		 * WaDisableAsyncFlipPerfMode:snb,ivb,hsw,vlv
> +		 * WaDisableAsyncFlipPerfMode
>   		 */
>   		wa_masked_en(wal,
>   			     RING_MI_MODE(RENDER_RING_BASE),
> @@ -2792,20 +2792,20 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   		/*
>   		 * Required for the hardware to program scanline values for
>   		 * waiting
> -		 * WaEnableFlushTlbInvalidationMode:snb
> +		 * WaEnableFlushTlbInvalidationMode
>   		 */
>   		wa_masked_en(wal,
>   			     GFX_MODE,
>   			     GFX_TLB_INVALIDATE_EXPLICIT);
>   
> -		/* WaDisableHiZPlanesWhenMSAAEnabled:snb */
> +		/* WaDisableHiZPlanesWhenMSAAEnabled */
>   		wa_masked_en(wal,
>   			     _3D_CHICKEN,
>   			     _3D_CHICKEN_HIZ_PLANE_DISABLE_MSAA_4X_SNB);
>   
>   		wa_masked_en(wal,
>   			     _3D_CHICKEN3,
> -			     /* WaStripsFansDisableFastClipPerformanceFix:snb */
> +			     /* WaStripsFansDisableFastClipPerformanceFix */
>   			     _3D_CHICKEN3_SF_DISABLE_FASTCLIP_CULL |
>   			     /*
>   			      * Bspec says:
> @@ -2828,7 +2828,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   				    GEN6_WIZ_HASHING_MASK,
>   				    GEN6_WIZ_HASHING_16x4);
>   
> -		/* WaDisable_RenderCache_OperationalFlush:snb */
> +		/* WaDisable_RenderCache_OperationalFlush */
>   		wa_masked_dis(wal, CACHE_MODE_0, RC_OP_FLUSH_ENABLE);
>   
>   		/*
> @@ -2843,7 +2843,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   	}
>   
>   	if (IS_GRAPHICS_VER(i915, 4, 6))
> -		/* WaTimedSingleVertexDispatch:cl,bw,ctg,elk,ilk,snb */
> +		/* WaTimedSingleVertexDispatch */
>   		wa_add(wal, RING_MI_MODE(RENDER_RING_BASE),
>   		       0, _MASKED_BIT_ENABLE(VS_TIMER_DISPATCH),
>   		       /* XXX bit doesn't stick on Broadwater */
> @@ -2871,7 +2871,7 @@ xcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   {
>   	struct drm_i915_private *i915 = engine->i915;
>   
> -	/* WaKBLVECSSemaphoreWaitPoll:kbl */
> +	/* WaKBLVECSSemaphoreWaitPoll */
>   	if (IS_KBL_GRAPHICS_STEP(i915, STEP_A0, STEP_F0)) {
>   		wa_write(wal,
>   			 RING_SEMA_WAIT_POLL(engine->mmio_base),
> @@ -2883,7 +2883,7 @@ static void
>   ccs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>   {
>   	if (IS_PVC_CT_STEP(engine->i915, STEP_A0, STEP_C0)) {
> -		/* Wa_14014999345:pvc */
> +		/* Wa_14014999345 */
>   		wa_mcr_masked_en(wal, GEN10_CACHE_MODE_SS, DISABLE_ECC);
>   	}
>   }
> @@ -2960,38 +2960,38 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>   				 GEN9_ROW_CHICKEN4,
>   				 GEN12_DISABLE_GRF_CLEAR);
>   
> -		/* Wa_14010670810:xehpsdv */
> +		/* Wa_14010670810 */
>   		wa_mcr_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
>   
> -		/* Wa_14010449647:xehpsdv */
> +		/* Wa_14010449647 */
>   		wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>   				 GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
>   
> -		/* Wa_18011725039:xehpsdv */
> +		/* Wa_18011725039 */
>   		if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
>   			wa_mcr_masked_dis(wal, MLTICTXCTL, TDONRENDER);
>   			wa_mcr_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
>   		}
>   
> -		/* Wa_14012362059:xehpsdv */
> +		/* Wa_14012362059 */
>   		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
>   
> -		/* Wa_14014368820:xehpsdv */
> +		/* Wa_14014368820 */
>   		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
>   				GLOBAL_INVALIDATION_MODE);
>   	}
>   
>   	if (IS_DG2(i915) || IS_PONTEVECCHIO(i915)) {
> -		/* Wa_14015227452:dg2,pvc */
> +		/* Wa_14015227452 */
>   		wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE);
>   
> -		/* Wa_22014226127:dg2,pvc */
> +		/* Wa_22014226127 */
>   		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
>   
> -		/* Wa_16015675438:dg2,pvc */
> +		/* Wa_16015675438 */
>   		wa_masked_en(wal, FF_SLICE_CS_CHICKEN2, GEN12_PERF_FIX_BALANCING_CFE_DISABLE);
>   
> -		/* Wa_18018781329:dg2,pvc */
> +		/* Wa_18018781329 */
>   		wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
>   		wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
>   		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> @@ -3000,12 +3000,12 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>   
>   	if (IS_DG2(i915)) {
>   		/*
> -		 * Wa_16011620976:dg2_g11
> -		 * Wa_22015475538:dg2
> +		 * Wa_16011620976
> +		 * Wa_22015475538
>   		 */
>   		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8);
>   
> -		/* Wa_18017747507:dg2 */
> +		/* Wa_18017747507 */
>   		wa_masked_en(wal, VFG_PREEMPTION_CHICKEN, POLYGON_TRIFAN_LINELOOP_DISABLE);
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index c0b5aa6fde26..2fea87ab9493 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -265,22 +265,22 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	u32 flags = 0;
>   
> -	/* Wa_22012773006:gen11,gen12 < XeHP */
> +	/* Wa_22012773006 */
>   	if (GRAPHICS_VER(gt->i915) >= 11 &&
>   	    GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 50))
>   		flags |= GUC_WA_POLLCS;
>   
> -	/* Wa_16011759253:dg2_g10:a0 */
> +	/* Wa_16011759253 */
>   	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0))
>   		flags |= GUC_WA_GAM_CREDITS;
>   
> -	/* Wa_14014475959:dg2 */
> +	/* Wa_14014475959 */
>   	if (IS_DG2(gt->i915))
>   		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>   
>   	/*
> -	 * Wa_14012197797:dg2_g10:a0,dg2_g11:a0
> -	 * Wa_22011391025:dg2_g10,dg2_g11,dg2_g12
> +	 * Wa_14012197797
> +	 * Wa_22011391025
>   	 *
>   	 * The same WA bit is used for both and 22011391025 is applicable to
>   	 * all DG2.
> @@ -292,14 +292,14 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>   	if (IS_GRAPHICS_VER(gt->i915, 11, 12))
>   		flags |= GUC_WA_PRE_PARSER;
>   
> -	/* Wa_16011777198:dg2 */
> +	/* Wa_16011777198 */
>   	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_C0) ||
>   	    IS_DG2_GRAPHICS_STEP(gt->i915, G11, STEP_A0, STEP_B0))
>   		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
>   
>   	/*
> -	 * Wa_22012727170:dg2_g10[a0-c0), dg2_g11[a0..)
> -	 * Wa_22012727685:dg2_g11[a0..)
> +	 * Wa_22012727170
> +	 * Wa_22012727685
>   	 */
>   	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_C0) ||
>   	    IS_DG2_GRAPHICS_STEP(gt->i915, G11, STEP_A0, STEP_FOREVER))
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 53f7f599cde3..663058a1211b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1621,7 +1621,7 @@ static void guc_engine_reset_prepare(struct intel_engine_cs *engine)
>   	intel_engine_stop_cs(engine);
>   
>   	/*
> -	 * Wa_22011802037:gen11/gen12: In addition to stopping the cs, we need
> +	 * Wa_22011802037
>   	 * to wait for any pending mi force wakeups
>   	 */
>   	intel_engine_wait_for_pending_mi_fw(engine);
> @@ -4201,7 +4201,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   	engine->flags |= I915_ENGINE_HAS_PREEMPTION;
>   	engine->flags |= I915_ENGINE_HAS_TIMESLICES;
>   
> -	/* Wa_14014475959:dg2 */
> +	/* Wa_14014475959 */
>   	if (IS_DG2(engine->i915) && engine->class == COMPUTE_CLASS)
>   		engine->flags |= I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 9a8a1abf71d7..f612b654dc76 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -489,8 +489,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>   
>   	intel_guc_reset_interrupts(guc);
>   
> -	/* WaEnableuKernelHeaderValidFix:skl */
> -	/* WaEnableGuCBootHashCheckNotSet:skl,bxt,kbl */
> +	/* WaEnableuKernelHeaderValidFix */
> +	/* WaEnableGuCBootHashCheckNotSet */
>   	if (GRAPHICS_VER(i915) == 9)
>   		attempts = 3;
>   	else
