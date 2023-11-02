Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB77DEF11
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 10:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EEE10E842;
	Thu,  2 Nov 2023 09:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0974C10E842;
 Thu,  2 Nov 2023 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698917977; x=1730453977;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aVYau0xGfa6jlJMZE2EfC6oVaomiUgxKmXYJa8Erip4=;
 b=iD/LALqykGF1O+ym7szwxGYHUoy78tZVay8ODwkzmYx8AKsI2eYsBz5o
 6FxY9PgakyBY4lGvA49vIruYLdQXGJeNjy8xmEdUivaKmcqRmdMMy1JV4
 g+ZRV3B8WDO2NUpWFO8jBE7gGynOGYqXWLL29PbERxB3ylGZyl3a9D8Tm
 bEH30CaApQlBEu1D+wpbAmfKLVaD0W9m76Y78GZuOE/oTMZfBmU81PxBL
 06EhigV4Kssb4bU7FqcAV3tFduOu4yJs59+XQNjBXIG218nh3YFfQKZLp
 9qVJW6KybtyFCHkigEhxnXY67GDyjFMy0+SH5ftZu8sdi1R2nrPtz8nb1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452974846"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="452974846"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="878174372"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="878174372"
Received: from stevenwo-mobl1.ger.corp.intel.com (HELO [10.213.233.30])
 ([10.213.233.30])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:39:34 -0700
Message-ID: <59d78f4e-45e2-4fb6-ad17-d44f82af9b69@linux.intel.com>
Date: Thu, 2 Nov 2023 09:39:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Remove unused for_each_uabi_class_engine
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20231101100124.303739-1-tvrtko.ursulin@linux.intel.com>
 <87sf5p4wjx.fsf@intel.com>
 <1d8b9bb8-1368-436f-9fb6-125e6bb04e40@linux.intel.com>
 <87a5rw4if4.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87a5rw4if4.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/11/2023 09:24, Jani Nikula wrote:
> On Wed, 01 Nov 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>> On 01/11/2023 10:06, Jani Nikula wrote:
>>> On Wed, 01 Nov 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Unused macro after 99919be74aa3 ("drm/i915/gem: Zap the i915_gem_object_blt code")
>>>> removed some code.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> \o/
>>>
>>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> Could I persuade you to move for_each_engine(),
>>> for_each_engine_masked(), rb_to_uabi_engine(), and
>>> for_each_uabi_engine() to a more suitable header?
>>
>> Former to intel_gt.h, but latter a better place is not coming to me. Like:
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
>> index d68675925b79..1d97c435a015 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
>> @@ -10,6 +10,7 @@
>>    #include "i915_request.h"
>>    #include "intel_engine_types.h"
>>    #include "intel_wakeref.h"
>> +#include "intel_gt.h"
>>    #include "intel_gt_pm.h"
>>    
>>    static inline bool
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
>> index 9ffdb05e231e..b0e453e27ea8 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>> @@ -171,6 +171,20 @@ void intel_gt_release_all(struct drm_i915_private *i915);
>>                (id__)++) \
>>                   for_each_if(((gt__) = (i915__)->gt[(id__)]))
>>    
>> +/* Simple iterator over all initialised engines */
>> +#define for_each_engine(engine__, gt__, id__) \
>> +       for ((id__) = 0; \
>> +            (id__) < I915_NUM_ENGINES; \
>> +            (id__)++) \
>> +               for_each_if ((engine__) = (gt__)->engine[(id__)])
>> +
>> +/* Iterator over subset of engines selected by mask */
>> +#define for_each_engine_masked(engine__, gt__, mask__, tmp__) \
>> +       for ((tmp__) = (mask__) & (gt__)->info.engine_mask; \
>> +            (tmp__) ? \
>> +            ((engine__) = (gt__)->engine[__mask_next_bit(tmp__)]), 1 : \
>> +            0;)
>> +
>>    void intel_gt_info_print(const struct intel_gt_info *info,
>>                            struct drm_printer *p);
>>    
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
>> index 8f9b874fdc9c..3aa1d014c14d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
>> @@ -6,8 +6,8 @@
>>    
>>    #include <drm/drm_print.h>
>>    
>> -#include "i915_drv.h" /* for_each_engine! */
>>    #include "intel_engine.h"
>> +#include "intel_gt.h"
>>    #include "intel_gt_debugfs.h"
>>    #include "intel_gt_engines_debugfs.h"
>>    
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 744c8c4a50fa..3feec04a2b1c 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -396,20 +396,6 @@ static inline struct intel_gt *to_gt(const struct drm_i915_private *i915)
>>           return i915->gt[0];
>>    }
>>    
>> -/* Simple iterator over all initialised engines */
>> -#define for_each_engine(engine__, gt__, id__) \
>> -       for ((id__) = 0; \
>> -            (id__) < I915_NUM_ENGINES; \
>> -            (id__)++) \
>> -               for_each_if ((engine__) = (gt__)->engine[(id__)])
>> -
>> -/* Iterator over subset of engines selected by mask */
>> -#define for_each_engine_masked(engine__, gt__, mask__, tmp__) \
>> -       for ((tmp__) = (mask__) & (gt__)->info.engine_mask; \
>> -            (tmp__) ? \
>> -            ((engine__) = (gt__)->engine[__mask_next_bit(tmp__)]), 1 : \
>> -            0;)
>> -
>>    #define rb_to_uabi_engine(rb) \
>>           rb_entry_safe(rb, struct intel_engine_cs, uabi_node)
>>    
>> diff --git a/drivers/gpu/drm/i915/selftests/intel_uncore.c b/drivers/gpu/drm/i915/selftests/intel_uncore.c
>> index 7a5f4adc1b8b..c998f15d505c 100644
>> --- a/drivers/gpu/drm/i915/selftests/intel_uncore.c
>> +++ b/drivers/gpu/drm/i915/selftests/intel_uncore.c
>> @@ -24,6 +24,8 @@
>>    
>>    #include "../i915_selftest.h"
>>    
>> +#include "gt/intel_gt.h"
>> +
>>    static int intel_fw_table_check(const struct intel_forcewake_range *ranges,
>>                                   unsigned int num_ranges,
>>                                   bool is_watertight)
>>
>> Beneficial?
> 
> Yeah, I'd like to have less gem/gt/display in i915_drv.h, and focus on
> the generic driver stuff.

Okay, sent.

For for_each_uabi_engine&co problem is how do we define what is what. 
Historically we weren't saying that everything not display is GEM, and 
uabi engines are not per GT. Even though engines themselves are, just 
that historically we were putting stuff into GT which operates on a GT. 
Perhaps with factoring out the display goal the requirements change a 
bit and old boundaries/placement rules need tweaking. Or the sore point 
will go away as/when display code is better isolated (less hacks, more 
interfaces) from both i915 and xe. Anyway, for now I don't see a nice 
and easy place to move them to, which wouldn't be wrong from some aspect.

Regards,

Tvrtko
