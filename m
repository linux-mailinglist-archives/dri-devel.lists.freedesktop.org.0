Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294D5E7518
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141A510E48F;
	Fri, 23 Sep 2022 07:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCAD10E48F;
 Fri, 23 Sep 2022 07:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663919147; x=1695455147;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vbYdclaTceIoqEHplIlajE2dhHjrlVBctIKNTXkm9iA=;
 b=ReQ/ZOH9nuoutQ1OQHtkAbYSGqQBkA8rrTKvqZxzPB0vlbyPe8CIeLSf
 7bPfzG6p4mFwyDRT3tBfznhq4cJjpBKl8zlMg8Bzvc9Dg7FpK4VJaQQPz
 OL/IZ5xSNEiAaJuLTVHt2uIdBz8jyFkSfsHy1GXw47T3Nli4m/HcohYgh
 kfZ87gaSvgmF9r49X2meB5a6TTvnu46WX0ypZ3YPK9v3woKCglfIsyiEo
 j8A38KOhnpcdnYwIDgvZpPeI6MlqAoltdtxRlcV4Ij1U+prx9wi7ROF+8
 +VVhxLaHUWbIglCK4CTNqm+KwZPqLzMNsPBjXG3VXlL4/eIqlEzIvgjw2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386826068"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="386826068"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 00:45:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="745708166"
Received: from ccislaru-mobl.ger.corp.intel.com (HELO [10.213.225.140])
 ([10.213.225.140])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 00:45:44 -0700
Message-ID: <97f2bfc9-5dc8-7f53-c38e-c09e7bb9da24@linux.intel.com>
Date: Fri, 23 Sep 2022 08:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [RFC v4 03/14] drm/i915/vm_bind: Expose
 i915_gem_object_max_page_size()
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-4-niranjana.vishwanathapura@intel.com>
 <578445bc-d804-3f1d-a32d-51cac9460351@linux.intel.com>
 <20220921180040.GD28263@nvishwa1-DESK>
 <e02e34ef-0dca-d61d-e5c4-a6f002baf434@linux.intel.com>
 <1072ee80-13fb-dc72-5416-c7fdded3c80c@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1072ee80-13fb-dc72-5416-c7fdded3c80c@intel.com>
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/09/2022 17:18, Matthew Auld wrote:
> On 22/09/2022 09:09, Tvrtko Ursulin wrote:
>>
>> On 21/09/2022 19:00, Niranjana Vishwanathapura wrote:
>>> On Wed, Sep 21, 2022 at 10:13:12AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 21/09/2022 08:09, Niranjana Vishwanathapura wrote:
>>>>> Expose i915_gem_object_max_page_size() function non-static
>>>>> which will be used by the vm_bind feature.
>>>>>
>>>>> Signed-off-by: Niranjana Vishwanathapura 
>>>>> <niranjana.vishwanathapura@intel.com>
>>>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 20 +++++++++++++++-----
>>>>>  drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
>>>>>  2 files changed, 17 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c 
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>> index 33673fe7ee0a..3b3ab4abb0a3 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>> @@ -11,14 +11,24 @@
>>>>>  #include "pxp/intel_pxp.h"
>>>>>  #include "i915_drv.h"
>>>>> +#include "i915_gem_context.h"
>>>>
>>>> I can't spot that you are adding any code which would need this? 
>>>> I915_GTT_PAGE_SIZE_4K? It is in intel_gtt.h.
>>>
>>> This include should have been added in a later patch for calling
>>> i915_gem_vm_lookup(). But got added here while patch refactoring.
>>> Will fix.
>>>
>>>>
>>>>>  #include "i915_gem_create.h"
>>>>>  #include "i915_trace.h"
>>>>>  #include "i915_user_extensions.h"
>>>>> -static u32 object_max_page_size(struct intel_memory_region 
>>>>> **placements,
>>>>> -                unsigned int n_placements)
>>>>> +/**
>>>>> + * i915_gem_object_max_page_size() - max of min_page_size of the 
>>>>> regions
>>>>> + * @placements:  list of regions
>>>>> + * @n_placements: number of the placements
>>>>> + *
>>>>> + * Calculates the max of the min_page_size of a list of placements 
>>>>> passed in.
>>>>> + *
>>>>> + * Return: max of the min_page_size
>>>>> + */
>>>>> +u32 i915_gem_object_max_page_size(struct intel_memory_region 
>>>>> **placements,
>>>>> +                  unsigned int n_placements)
>>>>>  {
>>>>> -    u32 max_page_size = 0;
>>>>> +    u32 max_page_size = I915_GTT_PAGE_SIZE_4K;
>>>>>      int i;
>>>>>      for (i = 0; i < n_placements; i++) {
>>>>> @@ -28,7 +38,6 @@ static u32 object_max_page_size(struct 
>>>>> intel_memory_region **placements,
>>>>>          max_page_size = max_t(u32, max_page_size, mr->min_page_size);
>>>>>      }
>>>>> -    GEM_BUG_ON(!max_page_size);
>>>>>      return max_page_size;
>>>>>  }
>>>>> @@ -99,7 +108,8 @@ __i915_gem_object_create_user_ext(struct 
>>>>> drm_i915_private *i915, u64 size,
>>>>>      i915_gem_flush_free_objects(i915);
>>>>> -    size = round_up(size, object_max_page_size(placements, 
>>>>> n_placements));
>>>>> +    size = round_up(size, i915_gem_object_max_page_size(placements,
>>>>> +                                n_placements));
>>>>>      if (size == 0)
>>>>>          return ERR_PTR(-EINVAL);
>>>>
>>>> Because of the changes above this path is now unreachable. I suppose 
>>>> it was meant to tell the user "you have supplied no placements"? But 
>>>> then GEM_BUG_ON (which you remove) used to be wrong.
>>>>
>>>
>>> Yah, looks like an existing problem. May be this "size == 0" check
>>> should have been made before we do the round_up()? ie., check input 
>>> 'size'
>>> paramter is not 0?
>>> I think for now, I will remove this check as it was unreachable anyhow.
>>
>> Hm that's true as well. i915_gem_create_ext_ioctl ensures at least one 
>> placement and internal callers do as well.
>>
>> To be safe, instead of removing maybe move to before "size = " and 
>> change to "if (GEM_WARN_ON(n_placements == 0))"? Not sure.. Matt any 
>> thoughts here given the changes in this patch?
> 
> The check is also to reject a zero sized object with args->size = 0, i.e 
> round_up(0, PAGE_SIZE) == 0. So for sure that is still needed here.

Oh yeah sneaky round up.. Thanks, my bad.

Regards,

Tvrtko
