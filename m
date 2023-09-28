Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8A87B187A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 12:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F7910E601;
	Thu, 28 Sep 2023 10:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6504B10E601;
 Thu, 28 Sep 2023 10:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695897958; x=1727433958;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4prNF3X8A5NF7Bh1dtvKt/RzHBfy/h58HJm97GxQ0Vk=;
 b=dq3xc487Uj8aL6RN5PzdEiCPQYxqzLb/NlyLu+ONJqpXhCZKBWvlC3JV
 gWnHzB0RQCOicivOcLQK8fRGPWHSEPAF4ou4pJMshM20uvnrtWfUj9v6f
 kz6g18FIgIT/3O5kBiLCaaYoJpBy9IqT8Zhf15lnWbYEoCAN8i6hi5geU
 Q3G6ivMkzXgMCP0hDBSHeg3dA02mGzHabEx4fXLScIRjUBiB8pg4uUmqY
 M0d3xa9IXvVz8+DUw5OcQornZhzdreFubxh3MgkNZqmW/tGPFM2WTHljx
 0BqXhU9RgafShKsnb8achaL5WAAk3Gq9F4gTHBAfwaN4cc5IocH6sJtj1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="637839"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="637839"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="839807147"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="839807147"
Received: from haykharx-mobl1.ger.corp.intel.com (HELO [10.249.33.32])
 ([10.249.33.32])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:45:52 -0700
Message-ID: <b0b2019b-3a0f-7204-5f5f-556df12776d8@linux.intel.com>
Date: Thu, 28 Sep 2023 12:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Tapani_P=c3=a4lli?= <tapani.palli@intel.com>
References: <20230926142401.25687-1-nirmoy.das@intel.com>
 <f2bbf2f2-a966-d128-93b5-d3d58ea9b1dc@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <f2bbf2f2-a966-d128-93b5-d3d58ea9b1dc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Mark Janes <mark.janes@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tapani,

On 9/27/2023 6:13 AM, Tapani Pälli wrote:
> Fixes all regressions we saw, I also run some extra vulkan and GL 
> workloads, no regressions observed.
>
> Tested-by: Tapani Pälli <tapani.palli@intel.com>


Thanks to testing it. The patch is now merged with" 
<stable@vger.kernel.org> # v5.8+" tag so it should trickle down to

v6.4.10. as normal stable release process.


Thanks,

Nirmoy

>
> On 26.9.2023 17.24, Nirmoy Das wrote:
>> PIPE_CONTROL_FLUSH_L3 is not needed for aux invalidation
>> so don't set that.
>>
>> Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before 
>> invalidation")
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: <stable@vger.kernel.org> # v5.8+
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
>> Cc: Tapani Pälli <tapani.palli@intel.com>
>> Cc: Mark Janes <mark.janes@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> index 0143445dba83..ba4c2422b340 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> @@ -271,8 +271,17 @@ int gen12_emit_flush_rcs(struct i915_request 
>> *rq, u32 mode)
>>           if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
>>               bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
>>   +        /*
>> +         * L3 fabric flush is needed for AUX CCS invalidation
>> +         * which happens as part of pipe-control so we can
>> +         * ignore PIPE_CONTROL_FLUSH_L3. Also PIPE_CONTROL_FLUSH_L3
>> +         * deals with Protected Memory which is not needed for
>> +         * AUX CCS invalidation and lead to unwanted side effects.
>> +         */
>> +        if (mode & EMIT_FLUSH)
>> +            bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>> +
>>           bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>> -        bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>>           bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
>>           bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
>>           /* Wa_1409600907:tgl,adl-p */
