Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5387B27AB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 23:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAAC10E6B3;
	Thu, 28 Sep 2023 21:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288F110E6B2;
 Thu, 28 Sep 2023 21:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695937405; x=1727473405;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5YnVH148zexJC/P7DVlnd5p7Esc1q30qttcmd59ZLaM=;
 b=iLb0myN8RqbpClde1T2XkMlpbtebjdnsrnLKLDp807x5kDWFC1ZZFMJn
 b7yDAvElib8hT4cUbeZ0ViJmlNakQH3Y5BxWrZMrpEIsGbN2w95jiae6G
 AXro26F9k86edS1/LfdcQtn/F9CVqX2mc8gIwfkiBEh46oJIu6JmVTCbf
 hWkySK5g94NPbU1j1HNxm58WSC5FS8qs6fc7oLYY1c2Uz1iwCXWh2y/XQ
 +J6jbkLLu78OIeupBAjiYUEMq/qpa9fPFYo23L0xf0xo2LVA1cB8XQzYk
 WxENKNTSfw67fhbKZL5Sao94/OsLTaGdt/RKYYo4yqvCv5oYTUdzzYQoS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468464734"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="468464734"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 14:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840066099"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="840066099"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.10.92])
 ([10.213.10.92])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 14:43:23 -0700
Message-ID: <9bf91366-560c-5d4e-32b8-fe12289cb0c3@intel.com>
Date: Thu, 28 Sep 2023 23:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH v7 2/4] drm/i915: Introduce the
 intel_gt_resume_early()
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230928130015.6758-1-nirmoy.das@intel.com>
 <20230928130015.6758-2-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230928130015.6758-2-nirmoy.das@intel.com>
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
Cc: matthew.d.roper@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.09.2023 15:00, Nirmoy Das wrote:
> Move early resume functions of gt to a proper file.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c | 6 ++++++
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h | 1 +
>   drivers/gpu/drm/i915/i915_driver.c    | 6 ++----
>   3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 5a942af0a14e..dab73980c9f1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -216,6 +216,12 @@ void intel_gt_pm_fini(struct intel_gt *gt)
>   	intel_rc6_fini(&gt->rc6);
>   }
>   
> +void intel_gt_resume_early(struct intel_gt *gt)
> +{
> +	intel_uncore_resume_early(gt->uncore);
> +	intel_gt_check_and_clear_faults(gt);
> +}
> +
>   int intel_gt_resume(struct intel_gt *gt)
>   {
>   	struct intel_engine_cs *engine;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index 6c9a46452364..b1eeb5b33918 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -78,6 +78,7 @@ void intel_gt_pm_fini(struct intel_gt *gt);
>   void intel_gt_suspend_prepare(struct intel_gt *gt);
>   void intel_gt_suspend_late(struct intel_gt *gt);
>   int intel_gt_resume(struct intel_gt *gt);
> +void intel_gt_resume_early(struct intel_gt *gt);
>   
>   void intel_gt_runtime_suspend(struct intel_gt *gt);
>   int intel_gt_runtime_resume(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index d50347e5773a..78501a83ba10 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1327,10 +1327,8 @@ static int i915_drm_resume_early(struct drm_device *dev)
>   		drm_err(&dev_priv->drm,
>   			"Resume prepare failed: %d, continuing anyway\n", ret);
>   
> -	for_each_gt(gt, dev_priv, i) {
> -		intel_uncore_resume_early(gt->uncore);
> -		intel_gt_check_and_clear_faults(gt);
> -	}
> +	for_each_gt(gt, dev_priv, i)
> +		intel_gt_resume_early(gt);
>   
>   	intel_display_power_resume_early(dev_priv);
>   

