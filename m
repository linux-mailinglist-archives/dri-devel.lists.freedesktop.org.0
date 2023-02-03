Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 728D8689423
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 10:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5420710E1FC;
	Fri,  3 Feb 2023 09:43:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF2210E4C2;
 Fri,  3 Feb 2023 09:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675417416; x=1706953416;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H23wQlZBaQK/OHED3GuBj+aFhjl+rE4CYXDlL3O6gfw=;
 b=MrgMeozQdSri6kuSTPazWQAJ90Z7VyAcKiENSzgkyfYMwEOL5svCNM1U
 +OftboepzOH8bRjvwULH1KeRdY65ckLXyjNM5sanSs082fM48L0sH7jmH
 ekPQsEdjF0dmC+74AVbla3Dp0iDJSMiLy5EiHvw+9M5HqXQS2xoK62c4Z
 4oxsmQsFqCr6DrQtqg79RZAwdQ3G/jpVzxU737TBVeJVP0o1nyaixKXOI
 41oLc5h1cXHtdVmSuAhKOblOYbbiULSR+7kLZziT+iIQLexlaSXpnAoW9
 HEE09Kq3+0F0JECmXQsSpOElYjjbHlUqhCR8iT5cXIH4fTgNz3jGEi2zM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393297151"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="393297151"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 01:43:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="665665048"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="665665048"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga002.jf.intel.com with ESMTP; 03 Feb 2023 01:43:34 -0800
Received: from [10.249.139.149] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.139.149])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8F556365DE;
 Fri,  3 Feb 2023 09:43:33 +0000 (GMT)
Message-ID: <3139155b-a8db-6e4b-e619-84743ad9a50b@intel.com>
Date: Fri, 3 Feb 2023 10:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 2/6] drm/i915/guc: More debug print updates - GSC firmware
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
 <20230203001143.3323433-3-John.C.Harrison@Intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230203001143.3323433-3-John.C.Harrison@Intel.com>
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
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 8 +++-----
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c | 7 +++----
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index e73d4440c5e82..8e0c736fa4e94 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -6,6 +6,7 @@
>  #include "gt/intel_engine_pm.h"
>  #include "gt/intel_gpu_commands.h"
>  #include "gt/intel_gt.h"
> +#include "gt/intel_gt_print.h"
>  #include "gt/intel_ring.h"
>  #include "intel_gsc_fw.h"
>  
> @@ -88,9 +89,7 @@ static int gsc_fw_load(struct intel_gsc_uc *gsc)
>  	i915_request_put(rq);
>  
>  	if (err)
> -		drm_err(&gsc_uc_to_gt(gsc)->i915->drm,
> -			"Request submission for GSC load failed (%d)\n",
> -			err);
> +		gt_err(gsc_uc_to_gt(gsc), "Request submission for GSC load failed (%d)\n", err);
>  
>  	return err;
>  }
> @@ -200,8 +199,7 @@ int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc)
>  	/* FW is not fully operational until we enable SW proxy */
>  	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
>  
> -	drm_info(&gt->i915->drm, "Loaded GSC firmware %s\n",
> -		 gsc_fw->file_selected.path);
> +	gt_info(gt, "Loaded GSC firmware %s\n", gsc_fw->file_selected.path);
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> index fd21dbd2663be..6e7d5aa4dcf5e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> @@ -6,6 +6,7 @@
>  #include <linux/types.h>
>  
>  #include "gt/intel_gt.h"
> +#include "gt/intel_gt_print.h"
>  #include "intel_gsc_uc.h"
>  #include "intel_gsc_fw.h"
>  #include "i915_drv.h"
> @@ -59,7 +60,6 @@ int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
>  {
>  	static struct lock_class_key gsc_lock;
>  	struct intel_gt *gt = gsc_uc_to_gt(gsc);
> -	struct drm_i915_private *i915 = gt->i915;
>  	struct intel_engine_cs *engine = gt->engine[GSC0];
>  	struct intel_context *ce;
>  	struct i915_vma *vma;
> @@ -81,8 +81,7 @@ int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
>  						I915_GEM_HWS_GSC_ADDR,
>  						&gsc_lock, "gsc_context");
>  	if (IS_ERR(ce)) {
> -		drm_err(&gt->i915->drm,
> -			"failed to create GSC CS ctx for FW communication\n");
> +		gt_err(gt, "failed to create GSC CS ctx for FW communication\n");
>  		err =  PTR_ERR(ce);
>  		goto out_vma;
>  	}
> @@ -98,7 +97,7 @@ int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
>  out_fw:
>  	intel_uc_fw_fini(&gsc->fw);
>  out:
> -	i915_probe_error(i915, "failed with %d\n", err);
> +	gt_probe_error(gt, "GSC init failed with %d\n", err);
>  	return err;
>  }
>  

Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

but with %pe used for printing errors (where applicable) it would look
even better
