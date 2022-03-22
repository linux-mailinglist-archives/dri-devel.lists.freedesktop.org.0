Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E74E3C3B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 11:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD6110E5F1;
	Tue, 22 Mar 2022 10:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9309D10E5E0;
 Tue, 22 Mar 2022 10:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647944003; x=1679480003;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=F2RiQlzEfCUswh60JQsi5m13MmR56h7ScpC/R50CVWM=;
 b=bTY/QnfzhsnNHcPH/WW5UIMEM+vpu6+g3qq3qD2JhkvQSQHX3+/n/xRU
 aJhl7JTe2VfmDQEGaYT4+BSyho2IyDwdzTU7HJIKnTpC64gL9gX9EKagx
 EQ9qQ4UbxNZP0y4t3NtITDRiz/XUFsf2qTrRiQP7fYmbjmu295S4dgr9V
 wfGmn/zqtWGqKeZiCVcaIWmK2zoPWmxvPYSxsaCutOP0qwFv7QjcnjtIU
 YWXf73r7S2L9AyEjCxdgOnBYhqhfOJri4ACDQn/05ChZw+CPe8Grgdhmn
 fiDTfJKJE40xj9qzM1Qo8GtEYVLw7fMXpak7v2oB/oWox9JzfcvtJYbpd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257970143"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="257970143"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 03:13:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="560316686"
Received: from srobinso-mobl.ger.corp.intel.com (HELO [10.213.230.39])
 ([10.213.230.39])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 03:13:19 -0700
Message-ID: <31310790-4bc5-b9a7-8d35-c0f542b4d658@linux.intel.com>
Date: Tue, 22 Mar 2022 10:13:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] Drop wbinvd_on_all_cpus usage
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <4c86ae70-6f97-7a7c-1fd4-5e73ca29d0ba@linux.intel.com>
 <5db61477-6064-ada0-82a7-c1dc659dacad@linux.intel.com>
 <abdc3b07-a05e-f67d-2135-a30421cb9d12@linux.intel.com>
 <29bde7b0e680e503fbf483a560616e2ce22cdd79.camel@linux.intel.com>
 <210af2db-37ec-2cff-f6a6-7ea0263e135b@linux.intel.com>
 <1bd4ac91f24f6b4322811177f786f4867278ab83.camel@linux.intel.com>
 <b6bb4d03-6229-2419-97dd-f010c9890363@linux.intel.com>
 <d6bc73c04c4c69d3d9e6cf42bd62340a61a7d4c3.camel@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <d6bc73c04c4c69d3d9e6cf42bd62340a61a7d4c3.camel@linux.intel.com>
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
Cc: wayne.boyer@intel.com, daniel.vetter@ffwll.ch, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/03/2022 15:15, Thomas Hellström wrote:
> On Mon, 2022-03-21 at 14:43 +0000, Tvrtko Ursulin wrote:
>>
>> On 21/03/2022 13:40, Thomas Hellström wrote:
>>> Hi,
>>>
>>> On Mon, 2022-03-21 at 13:12 +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 21/03/2022 12:33, Thomas Hellström wrote:
>>>>> On Mon, 2022-03-21 at 12:22 +0000, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 21/03/2022 11:03, Thomas Hellström wrote:
>>>>>>> Hi, Tvrtko.
>>>>>>>
>>>>>>> On 3/21/22 11:27, Tvrtko Ursulin wrote:
>>>>>>>>
>>>>>>>> On 19/03/2022 19:42, Michael Cheng wrote:
>>>>>>>>> To align with the discussion in [1][2], this patch
>>>>>>>>> series
>>>>>>>>> drops
>>>>>>>>> all
>>>>>>>>> usage of
>>>>>>>>> wbvind_on_all_cpus within i915 by either replacing the
>>>>>>>>> call
>>>>>>>>> with certain
>>>>>>>>> drm clflush helpers, or reverting to a previous logic.
>>>>>>>>
>>>>>>>> AFAIU, complaint from [1] was that it is wrong to provide
>>>>>>>> non
>>>>>>>> x86
>>>>>>>> implementations under the wbinvd_on_all_cpus name.
>>>>>>>> Instead an
>>>>>>>> arch
>>>>>>>> agnostic helper which achieves the same effect could be
>>>>>>>> created.
>>>>>>>> Does
>>>>>>>> Arm have such concept?
>>>>>>>
>>>>>>> I also understand Linus' email like we shouldn't leak
>>>>>>> incoherent
>>>>>>> IO
>>>>>>> to
>>>>>>> other architectures, meaning any remaining wbinvd()s should
>>>>>>> be
>>>>>>> X86
>>>>>>> only.
>>>>>>
>>>>>> The last part is completely obvious since it is a x86
>>>>>> instruction
>>>>>> name.
>>>>>
>>>>> Yeah, I meant the function implementing wbinvd() semantics.
>>>>>
>>>>>>
>>>>>> But I think we can't pick a solution until we know how the
>>>>>> concept
>>>>>> maps
>>>>>> to Arm and that will also include seeing how the
>>>>>> drm_clflush_sg for
>>>>>> Arm
>>>>>> would look. Is there a range based solution, or just a big
>>>>>> hammer
>>>>>> there.
>>>>>> If the latter, then it is no good to churn all these reverts
>>>>>> but
>>>>>> instead
>>>>>> an arch agnostic wrapper, with a generic name, would be the
>>>>>> way to
>>>>>> go.
>>>>>
>>>>> But my impression was that ARM would not need the range-based
>>>>> interface
>>>>> either, because ARM is only for discrete and with discrete
>>>>> we're
>>>>> always
>>>>> coherent.
>>>>
>>>> Not sure what you mean here - what about flushing system memory
>>>> objects
>>>> on discrete? Those still need flushing on paths like suspend
>>>> which this
>>>> series touches. Am I missing something?
>>>
>>> System bos on discrete should always have
>>>
>>> I915_BO_CACHE_COHERENT_FOR_READ | I915_BO_CACHE_COHERENT_FOR_WRITE
>>>
>>> either by the gpu being fully cache coherent (or us mapping system
>>> write-combined). Hence no need for cache clflushes or wbinvd() for
>>> incoherent IO.
>>
>> Hmm so you are talking about the shmem ttm backend. It ends up
>> depending on the result of i915_ttm_cache_level, yes? It cannot end
>> up with I915_CACHE_NONE from that function?
> 
> If the object is allocated with allowable placement in either LMEM or
> SYSTEM, and it ends in system, it gets allocated with I915_CACHE_NONE,
> but then the shmem ttm backend isn't used but TTM's wc pools, and the
> object should *always* be mapped wc. Even in system.

I am not familiar with neither TTM backend or wc pools so maybe a missed 
question - if obj->cache_level can be set to none, and 
obj->cache_coherency to zero, then during object lifetime helpers which 
consult those fields (like i915_gem_cpu_write_needs_clflush, 
__start_cpu_write, etc) are giving out incorrect answers? That is, it is 
irrelevant that they would say flushes are required, since in actuality 
those objects can never ever and from anywhere be mapped other than WC 
so flushes aren't actually required?

>> I also found in i915_drm.h:
>>
>>           * As caching mode when specifying `I915_MMAP_OFFSET_FIXED`,
>> WC or WB will
>>           * be used, depending on the object placement on creation. WB
>> will be used
>>           * when the object can only exist in system memory, WC
>> otherwise.
>>
>> If what you say is true, that on discrete it is _always_ WC, then
>> that needs updating as well.
> 
> If an object is allocated as system only, then it is mapped WB, and
> we're relying on the gpu being cache coherent to avoid clflushes. Same
> is actually currently true if the object happens to be accessed by the
> cpu while evicted. Might need an update for that.

Hmm okay, I think I actually misunderstood something here. I think the 
reason for difference bbtween smem+lmem object which happens to be in 
smem and smem only object is eluding me.

>>>
>>> That's adhering to Linus'
>>>
>>> "And I sincerely hope to the gods that no cache-incoherent i915
>>> mess
>>> ever makes it out of the x86 world. Incoherent IO was always a
>>> historical mistake and should never ever happen again, so we should
>>> not spread that horrific pattern around."
>>
>> Sure, but I was not talking about IO - just the CPU side access to
>> CPU side objects.
> 
> OK, I was under the impression that clflushes() and wbinvd()s in i915
> was only ever used to make data visible to non-snooping GPUs.
> 
> Do you mean that there are other uses as well? Agreed the wb cache
> flush on on suspend only if gpu is !I915_BO_CACHE_COHERENT_FOR_READ?
> looks to not fit this pattern completely.

Don't know, I was first trying to understand handling of the 
obj->cache_coherent as discussed in the first quote block. Are the flags 
consistently set and how the Arm low level code will look.

> Otherwise, for architectures where memory isn't always fully coherent
> with the cpu cache, I'd expect them to use the apis in
> asm/cacheflush.h, like flush_cache_range() and similar, which are nops
> on x86.

Hm do you know why there are no-ops? Like why wouldn't they map to clflush?

Regards,

Tvrtko
