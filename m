Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80470F1F5
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8803E10E06A;
	Wed, 24 May 2023 09:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17E110E5C7;
 Wed, 24 May 2023 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684919719; x=1716455719;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8VwL6EAHUKow2/jzGvI331f0ZOTE4rdLdYHriRBgqSw=;
 b=ma+ShCPe/4VG+p4eBtVp4GNUVhruESx1EoB8FJ9dc8iFAkJGVw4rxHkL
 OrP5GPmSUk98pNb+5JUcd5SmsfheCpgEZJ1z6WdMmgL5yxv3S5rG/x13H
 iVMSLMj6ozCxAauyOgkmAZzOLEUfncbRrFE7+JFcw5b3CUkVwmkCwEwHa
 +ins+Bxjk5ahCtpalr+RkHbqRgG5hZTpzg8yQv2AIF3gG/o+qnSq1Nx7C
 0+hoV3TYrpnjiQoTVUKejk9eE+jqwLsv53XZAoAxwpsgYqByNsR6yoXV4
 pHXl88b1G5jtYbSZ5ob+J2vPoiojHMxOvNBGJWSQqwzs2xQWLTFhc/77r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="419220736"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="419220736"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 02:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="828494796"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="828494796"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.4.245])
 ([10.213.4.245])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 02:15:01 -0700
Message-ID: <bb7df969-0991-e75b-4ee2-cf5bfd4ddc85@intel.com>
Date: Wed, 24 May 2023 11:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/pmu: Make PMU sample array
 two-dimensional
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230523151918.4170499-1-ashutosh.dixit@intel.com>
 <20230523151918.4170499-3-ashutosh.dixit@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230523151918.4170499-3-ashutosh.dixit@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.05.2023 17:19, Ashutosh Dixit wrote:
> No functional changes but we can remove some unsightly index computation
> and read/write functions if we convert the PMU sample array from a
> one-dimensional to a two-dimensional array.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 60 ++++++++++-----------------------
>   drivers/gpu/drm/i915/i915_pmu.h |  2 +-
>   2 files changed, 19 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index b47d890d4ada1..137e0df9573ee 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -195,33 +195,6 @@ static inline s64 ktime_since_raw(const ktime_t kt)
>   	return ktime_to_ns(ktime_sub(ktime_get_raw(), kt));
>   }
>   
> -static unsigned int
> -__sample_idx(struct i915_pmu *pmu, unsigned int gt_id, int sample)
> -{
> -	unsigned int idx = gt_id * __I915_NUM_PMU_SAMPLERS + sample;
> -
> -	GEM_BUG_ON(idx >= ARRAY_SIZE(pmu->sample));
> -
> -	return idx;
> -}
> -
> -static u64 read_sample(struct i915_pmu *pmu, unsigned int gt_id, int sample)
> -{
> -	return pmu->sample[__sample_idx(pmu, gt_id, sample)].cur;
> -}
> -
> -static void
> -store_sample(struct i915_pmu *pmu, unsigned int gt_id, int sample, u64 val)
> -{
> -	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur = val;
> -}
> -
> -static void
> -add_sample_mult(struct i915_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
> -{
> -	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur += mul_u32_u32(val, mul);
> -}
> -
>   static u64 get_rc6(struct intel_gt *gt)
>   {
>   	struct drm_i915_private *i915 = gt->i915;
> @@ -240,7 +213,7 @@ static u64 get_rc6(struct intel_gt *gt)
>   	spin_lock_irqsave(&pmu->lock, flags);
>   
>   	if (awake) {
> -		store_sample(pmu, gt_id, __I915_SAMPLE_RC6, val);
> +		pmu->sample[gt_id][__I915_SAMPLE_RC6].cur = val;
>   	} else {
>   		/*
>   		 * We think we are runtime suspended.
> @@ -250,13 +223,13 @@ static u64 get_rc6(struct intel_gt *gt)
>   		 * counter value.
>   		 */
>   		val = ktime_since_raw(pmu->sleep_last[gt_id]);
> -		val += read_sample(pmu, gt_id, __I915_SAMPLE_RC6);
> +		val += pmu->sample[gt_id][__I915_SAMPLE_RC6].cur;
>   	}
>   
> -	if (val < read_sample(pmu, gt_id, __I915_SAMPLE_RC6_LAST_REPORTED))
> -		val = read_sample(pmu, gt_id, __I915_SAMPLE_RC6_LAST_REPORTED);
> +	if (val < pmu->sample[gt_id][__I915_SAMPLE_RC6_LAST_REPORTED].cur)
> +		val = pmu->sample[gt_id][__I915_SAMPLE_RC6_LAST_REPORTED].cur;
>   	else
> -		store_sample(pmu, gt_id, __I915_SAMPLE_RC6_LAST_REPORTED, val);
> +		pmu->sample[gt_id][__I915_SAMPLE_RC6_LAST_REPORTED].cur = val;
>   
>   	spin_unlock_irqrestore(&pmu->lock, flags);
>   
> @@ -275,9 +248,8 @@ static void init_rc6(struct i915_pmu *pmu)
>   		with_intel_runtime_pm(gt->uncore->rpm, wakeref) {
>   			u64 val = __get_rc6(gt);
>   
> -			store_sample(pmu, i, __I915_SAMPLE_RC6, val);
> -			store_sample(pmu, i, __I915_SAMPLE_RC6_LAST_REPORTED,
> -				     val);
> +			pmu->sample[i][__I915_SAMPLE_RC6].cur = val;
> +			pmu->sample[i][__I915_SAMPLE_RC6_LAST_REPORTED].cur = val;
>   			pmu->sleep_last[i] = ktime_get_raw();
>   		}
>   	}
> @@ -287,7 +259,7 @@ static void park_rc6(struct intel_gt *gt)
>   {
>   	struct i915_pmu *pmu = &gt->i915->pmu;
>   
> -	store_sample(pmu, gt->info.id, __I915_SAMPLE_RC6, __get_rc6(gt));
> +	pmu->sample[gt->info.id][__I915_SAMPLE_RC6].cur = __get_rc6(gt);
>   	pmu->sleep_last[gt->info.id] = ktime_get_raw();
>   }
>   
> @@ -428,6 +400,12 @@ engines_sample(struct intel_gt *gt, unsigned int period_ns)
>   	}
>   }
>   
> +static void
> +add_sample_mult(struct i915_pmu_sample *sample, u32 val, u32 mul)
> +{
> +	sample->cur += mul_u32_u32(val, mul);
> +}
> +
>   static bool
>   frequency_sampling_enabled(struct i915_pmu *pmu, unsigned int gt)
>   {
> @@ -467,12 +445,12 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>   		if (!val)
>   			val = intel_gpu_freq(rps, rps->cur_freq);
>   
> -		add_sample_mult(pmu, gt_id, __I915_SAMPLE_FREQ_ACT,
> +		add_sample_mult(&pmu->sample[gt_id][__I915_SAMPLE_FREQ_ACT],
>   				val, period_ns / 1000);
>   	}
>   
>   	if (pmu->enable & config_mask(__I915_PMU_REQUESTED_FREQUENCY(gt_id))) {
> -		add_sample_mult(pmu, gt_id, __I915_SAMPLE_FREQ_REQ,
> +		add_sample_mult(&pmu->sample[gt_id][__I915_SAMPLE_FREQ_REQ],
>   				intel_rps_get_requested_frequency(rps),
>   				period_ns / 1000);
>   	}
> @@ -673,14 +651,12 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
>   		switch (config) {
>   		case I915_PMU_ACTUAL_FREQUENCY:
>   			val =
> -			   div_u64(read_sample(pmu, gt_id,
> -					       __I915_SAMPLE_FREQ_ACT),
> +			   div_u64(pmu->sample[gt_id][__I915_SAMPLE_FREQ_ACT].cur,
>   				   USEC_PER_SEC /* to MHz */);
>   			break;
>   		case I915_PMU_REQUESTED_FREQUENCY:
>   			val =
> -			   div_u64(read_sample(pmu, gt_id,
> -					       __I915_SAMPLE_FREQ_REQ),
> +			   div_u64(pmu->sample[gt_id][__I915_SAMPLE_FREQ_REQ].cur,
>   				   USEC_PER_SEC /* to MHz */);
>   			break;
>   		case I915_PMU_INTERRUPTS:
> diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
> index 33d80fbaab8bc..d20592e7db999 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.h
> +++ b/drivers/gpu/drm/i915/i915_pmu.h
> @@ -127,7 +127,7 @@ struct i915_pmu {
>   	 * Only global counters are held here, while the per-engine ones are in
>   	 * struct intel_engine_cs.
>   	 */
> -	struct i915_pmu_sample sample[I915_PMU_MAX_GTS * __I915_NUM_PMU_SAMPLERS];
> +	struct i915_pmu_sample sample[I915_PMU_MAX_GTS][__I915_NUM_PMU_SAMPLERS];
>   	/**
>   	 * @sleep_last: Last time GT parked for RC6 estimation.
>   	 */

