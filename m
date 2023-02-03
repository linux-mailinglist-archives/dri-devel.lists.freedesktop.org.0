Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4D768948A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 11:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EA510E4DC;
	Fri,  3 Feb 2023 10:00:50 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83A210E4DC;
 Fri,  3 Feb 2023 10:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675418447; x=1706954447;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dbf3kWV0PWPfmHs3JQocnWmf0IRhuH15taqJhCi9jNw=;
 b=lwocnjkquJE4hF1scQwMhV8f4erTDOcP3n72fUu4ISFSaxC95x8GOViu
 eJPx9NohVANVpnFS6bBnq1Ft6KJX0/UIkgC/ieNZqcm8hlYA2e7pW6BW7
 qZxRwdaVN5Qc19m7aGRgCCJRYXWAwpXL1yfk4DYbLIuSsifvY0adlQ9ew
 YaktKjIF5exJNjsEXkOPKmcfU4aUemRo6ilMoKb+mczvoKFyulIyIOPaa
 +cDgzRRCnEaJ+9TWh0etFSqs0DYP9x8hAcup4OvpnhJH0HUN8rHFV7fcd
 WhY00CZzrBydARAkN1aIM/4t8tiqk0ADJ/TVjnhkO3ZzvUA99TGGgltfT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="327349298"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="327349298"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 02:00:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="839552283"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="839552283"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga005.jf.intel.com with ESMTP; 03 Feb 2023 02:00:45 -0800
Received: from [10.249.139.149] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.139.149])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6321037833;
 Fri,  3 Feb 2023 10:00:44 +0000 (GMT)
Message-ID: <79f88eff-0a59-e76d-60e9-86130b7eee53@intel.com>
Date: Fri, 3 Feb 2023 11:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 5/6] drm/i915/guc: More debug print updates - GuC SLPC
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
 <20230203001143.3323433-6-John.C.Harrison@Intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230203001143.3323433-6-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03.02.2023 01:11, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Update a bunch more debug prints to use the new GT based scheme.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c   |  8 +--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 60 ++++++++-------------
>  2 files changed, 26 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> index b5855091cf6a9..23b287cefb943 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> @@ -6,6 +6,7 @@
>  #include <linux/string_helpers.h>
>  
>  #include "intel_guc_rc.h"
> +#include "intel_guc_print.h"
>  #include "gt/intel_gt.h"
>  #include "i915_drv.h"
>  
> @@ -70,13 +71,12 @@ static int __guc_rc_control(struct intel_guc *guc, bool enable)
>  
>  	ret = guc_action_control_gucrc(guc, enable);
>  	if (ret) {
> -		i915_probe_error(guc_to_gt(guc)->i915, "Failed to %s GuC RC (%pe)\n",
> -				 str_enable_disable(enable), ERR_PTR(ret));
> +		guc_probe_error(guc, "Failed to %s RC (%pe)\n",
> +				str_enable_disable(enable), ERR_PTR(ret));
>  		return ret;
>  	}
>  
> -	drm_info(&gt->i915->drm, "GuC RC: %s\n",
> -		 str_enabled_disabled(enable));
> +	guc_info(guc, "RC: %s\n", str_enabled_disabled(enable));
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 63464933cbceb..91f4fa499cec4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -9,6 +9,7 @@
>  #include "i915_drv.h"
>  #include "i915_reg.h"
>  #include "intel_guc_slpc.h"
> +#include "intel_guc_print.h"
>  #include "intel_mchbar_regs.h"
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_regs.h"
> @@ -171,14 +172,13 @@ static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
>  static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>  {
>  	struct intel_guc *guc = slpc_to_guc(slpc);
> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>  	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
>  	int ret;
>  
>  	ret = guc_action_slpc_query(guc, offset);
>  	if (unlikely(ret))
> -		i915_probe_error(i915, "Failed to query task state (%pe)\n",
> -				 ERR_PTR(ret));
> +		guc_probe_error(guc, "Failed to query task state (%pe)\n",
> +				ERR_PTR(ret));
>  
>  	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
>  
> @@ -188,15 +188,14 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>  static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>  {
>  	struct intel_guc *guc = slpc_to_guc(slpc);
> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>  	int ret;
>  
>  	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>  
>  	ret = guc_action_slpc_set_param(guc, id, value);
>  	if (ret)
> -		i915_probe_error(i915, "Failed to set param %d to %u (%pe)\n",
> -				 id, value, ERR_PTR(ret));
> +		guc_probe_error(guc, "Failed to set param %d to %u (%pe)\n",
> +				id, value, ERR_PTR(ret));
>  
>  	return ret;
>  }
> @@ -212,8 +211,8 @@ static int slpc_unset_param(struct intel_guc_slpc *slpc, u8 id)
>  
>  static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>  {
> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>  	struct intel_guc *guc = slpc_to_guc(slpc);
> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>  	intel_wakeref_t wakeref;
>  	int ret = 0;
>  
> @@ -236,8 +235,7 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>  					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>  					freq);
>  		if (ret)
> -			drm_notice(&i915->drm,
> -				   "Failed to send set_param for min freq(%d): (%d)\n",
> +			guc_notice(guc, "Failed to send set_param for min freq(%d): (%d)\n",
>  				   freq, ret);
>  	}
>  
> @@ -267,7 +265,6 @@ static void slpc_boost_work(struct work_struct *work)
>  int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>  {
>  	struct intel_guc *guc = slpc_to_guc(slpc);
> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>  	int err;
>  
> @@ -275,9 +272,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>  
>  	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, (void **)&slpc->vaddr);
>  	if (unlikely(err)) {
> -		i915_probe_error(i915,
> -				 "Failed to allocate SLPC struct (err=%pe)\n",
> -				 ERR_PTR(err));
> +		guc_probe_error(guc, "Failed to allocate SLPC struct (err=%pe)\n", ERR_PTR(err));
>  		return err;
>  	}
>  
> @@ -338,7 +333,6 @@ static int guc_action_slpc_reset(struct intel_guc *guc, u32 offset)
>  
>  static int slpc_reset(struct intel_guc_slpc *slpc)
>  {
> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>  	struct intel_guc *guc = slpc_to_guc(slpc);
>  	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
>  	int ret;
> @@ -346,15 +340,15 @@ static int slpc_reset(struct intel_guc_slpc *slpc)
>  	ret = guc_action_slpc_reset(guc, offset);
>  
>  	if (unlikely(ret < 0)) {
> -		i915_probe_error(i915, "SLPC reset action failed (%pe)\n",
> -				 ERR_PTR(ret));
> +		guc_probe_error(guc, "SLPC reset action failed (%pe)\n",
> +				ERR_PTR(ret));
>  		return ret;
>  	}
>  
>  	if (!ret) {
>  		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
> -			i915_probe_error(i915, "SLPC not enabled! State = %s\n",
> -					 slpc_get_state_string(slpc));
> +			guc_probe_error(guc, "SLPC not enabled! State = %s\n",
> +					slpc_get_state_string(slpc));
>  			return -EIO;
>  		}
>  	}
> @@ -495,8 +489,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>  			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>  			     val < slpc->rp1_freq);
>  	if (ret) {
> -		i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
> -				 ERR_PTR(ret));
> +		guc_probe_error(slpc_to_guc(slpc), "Failed to toggle efficient freq (%pe)\n",
> +				ERR_PTR(ret));
>  		goto out;
>  	}
>  
> @@ -611,15 +605,12 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>  
>  static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
>  {
> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>  	int slpc_min_freq;
>  	int ret;
>  
>  	ret = intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq);
>  	if (ret) {
> -		drm_err(&i915->drm,
> -			"Failed to get min freq: (%d)\n",
> -			ret);
> +		guc_err(slpc_to_guc(slpc), "Failed to get min freq: (%d)\n", ret);
>  		return false;
>  	}
>  
> @@ -685,9 +676,7 @@ int intel_guc_slpc_override_gucrc_mode(struct intel_guc_slpc *slpc, u32 mode)
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>  		ret = slpc_set_param(slpc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
>  		if (ret)
> -			drm_err(&i915->drm,
> -				"Override gucrc mode %d failed %d\n",
> -				mode, ret);
> +			guc_err(slpc_to_guc(slpc), "Override gucrc mode %d failed %d\n", mode, ret);

nit: in other message this is named as "RC" not "gucrc"

>  	}
>  
>  	return ret;
> @@ -702,9 +691,7 @@ int intel_guc_slpc_unset_gucrc_mode(struct intel_guc_slpc *slpc)
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>  		ret = slpc_unset_param(slpc, SLPC_PARAM_PWRGATE_RC_MODE);
>  		if (ret)
> -			drm_err(&i915->drm,
> -				"Unsetting gucrc mode failed %d\n",
> -				ret);
> +			guc_err(slpc_to_guc(slpc), "Unsetting gucrc mode failed %d\n", ret);
>  	}
>  
>  	return ret;
> @@ -725,7 +712,7 @@ int intel_guc_slpc_unset_gucrc_mode(struct intel_guc_slpc *slpc)
>   */
>  int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  {
> -	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> +	struct intel_guc *guc = slpc_to_guc(slpc);
>  	int ret;
>  
>  	GEM_BUG_ON(!slpc->vma);
> @@ -734,8 +721,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  
>  	ret = slpc_reset(slpc);
>  	if (unlikely(ret < 0)) {
> -		i915_probe_error(i915, "SLPC Reset event returned (%pe)\n",
> -				 ERR_PTR(ret));
> +		guc_probe_error(guc, "SLPC Reset event returned (%pe)\n", ERR_PTR(ret));
>  		return ret;
>  	}
>  
> @@ -743,7 +729,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	if (unlikely(ret < 0))
>  		return ret;
>  
> -	intel_guc_pm_intrmsk_enable(to_gt(i915));
> +	intel_guc_pm_intrmsk_enable(slpc_to_gt(slpc));
>  
>  	slpc_get_rp_values(slpc);
>  
> @@ -753,16 +739,14 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	/* Set SLPC max limit to RP0 */
>  	ret = slpc_use_fused_rp0(slpc);
>  	if (unlikely(ret)) {
> -		i915_probe_error(i915, "Failed to set SLPC max to RP0 (%pe)\n",
> -				 ERR_PTR(ret));
> +		guc_probe_error(guc, "Failed to set SLPC max to RP0 (%pe)\n", ERR_PTR(ret));
>  		return ret;
>  	}
>  
>  	/* Revert SLPC min/max to softlimits if necessary */
>  	ret = slpc_set_softlimits(slpc);
>  	if (unlikely(ret)) {
> -		i915_probe_error(i915, "Failed to set SLPC softlimits (%pe)\n",
> -				 ERR_PTR(ret));
> +		guc_probe_error(guc, "Failed to set SLPC softlimits (%pe)\n", ERR_PTR(ret));
>  		return ret;
>  	}
>  

Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

but better if we should be more consistent when printing error codes and
maybe while around worth to update all to %pe ?

