Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35733989F12
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 12:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEC610E2E4;
	Mon, 30 Sep 2024 10:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jn9OEqrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBC310E2E4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727690644; x=1759226644;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kzQabB9wWPx6vHacSwQUjdsV2C3XnXIVkzc8nPf5Jqs=;
 b=jn9OEqrtfLfFRQgf5eM1DXlQ0eS21UrAtD8FQbB0T5MQN2PX8NLxeazb
 3Cr9flXYLc3CjRS73fdweQQ9xdfH/Auhpl6KrOIgTo0I3QbjFSRtFvj+n
 yTTZL17IHHwoQQLIa2Fq6e7U0uLQFmik3Cq5uFx6evoKWElNfBooQhSre
 cVXq9wKl/1frRwNFc4OoyEsaU/rNfiAKNIJx+RTXs8mw/k8gNgoSJBtkN
 6m7k7omCLZzMDhcsdArCTbD4y8JLofCJuSsP/V27yewu2aPmyw2S8hOSN
 3lOxkXLsLi7E74EspIiuKqVozkLpT9ywonaWH+pYkIFQWKfe2k8/FWCaL A==;
X-CSE-ConnectionGUID: cf06M/qfQ6qefahBWgfypA==
X-CSE-MsgGUID: WjTTcc3+S328epg8h+qiDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26894885"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26894885"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 03:04:04 -0700
X-CSE-ConnectionGUID: XAxdhGohT3yDXnDB220i1A==
X-CSE-MsgGUID: ueNPT1wPS5WQONBXljr7Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="104042135"
Received: from jpdavis-mobl1.ger.corp.intel.com (HELO [10.246.18.68])
 ([10.246.18.68])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 03:04:02 -0700
Message-ID: <2749a82b-3af0-417a-9066-e3cb9a30f786@linux.intel.com>
Date: Mon, 30 Sep 2024 12:03:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/29] accel/ivpu: Update VPU FW API headers
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>, 
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-2-jacek.lawrynowicz@linux.intel.com>
 <e9dacb7f-19e3-b527-4f44-45ac9116b445@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <e9dacb7f-19e3-b527-4f44-45ac9116b445@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 9/27/2024 10:24 PM, Jeffrey Hugo wrote:
> On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
>> @@ -301,7 +308,14 @@ struct vpu_boot_params {
>>       u32 temp_sensor_period_ms;
>>       /** PLL ratio for efficient clock frequency */
>>       u32 pn_freq_pll_ratio;
>> -    /** DVFS Mode: Default: 0, Max Performance: 1, On Demand: 2, Power Save: 3 */
>> +    /**
>> +     * DVFS Mode:
>> +     * 0 - Default, DVFS mode selected by the firmware
>> +     * 1 - Max Performance
>> +     * 2 - On Demand
>> +     * 3 - Power Save
>> +     * 2 - On Demand Priority Aware
> 
> Should this be 4 ?

Yes.

>> +     */
>>       u32 dvfs_mode;
>>       /**
>>        * Depending on DVFS Mode:
> 
> <snip>
> 
>> @@ -130,7 +171,7 @@
>>   /*
>>    * vpu_jsm_engine_reset_context flag definitions
>>    */
>> -#define VPU_ENGINE_RESET_CONTEXT_FLAG_COLLATERAL_DAMAGE_MASK BIT(0)
>> +#define VPU_ENGINE_RESET_CONTEXT_FLAG_COLLATERAL_DAMAGE_MASK BIT(1)
> 
> This feels like a bug fix. How can this be a FW API update without backwards compatibility?
> 
>>   #define VPU_ENGINE_RESET_CONTEXT_HANG_PRIMARY_CAUSE         0
>>   #define VPU_ENGINE_RESET_CONTEXT_COLLATERAL_DAMAGE         1
>>

This is actually a bug. Thanks for noticing.
 

