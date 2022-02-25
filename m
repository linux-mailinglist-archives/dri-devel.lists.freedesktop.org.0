Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3D94C4DFA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673F010E8D4;
	Fri, 25 Feb 2022 18:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3571110E8D4;
 Fri, 25 Feb 2022 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645814562; x=1677350562;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZdogFYisMfN9o/QQATua48vOJiixoKqfukYD079XBec=;
 b=bFE40HmZzxNy1kh3pO3n2h9PIytfH3H7I5D4ne0gFaJa8+QoXYcuB04J
 h1kqEkmnnUZyGXa2e7pb4GIUrwiW7idQJTkF/hwGyNVQTAuCsCV9Luth+
 +VfhtUfw6Helakbj0e0KiO0LZbF0CcfWCq9o9JLcQzARbKfIeh8ulUMfU
 U/mKgp0nbcWVH/VFPadSP7MU4XjapixunuURDnDPjAH+U7H2TWMTAof07
 MeFCON4BvjOYgN2ggBWnEDjxXk/MTOtvpVW0inArKYfkkmlvd99rEk2fT
 uNxTM2h9lDKC2Jl1O7CgBfvYmTzg8vcB5chHtcdD8zIgMwM0wrgGBZlAq g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="239960912"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="239960912"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:42:41 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="549374086"
Received: from pkinsell-mobl.ger.corp.intel.com (HELO [10.213.234.117])
 ([10.213.234.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:42:39 -0800
Message-ID: <5a9b1536-2180-c3b2-d33d-217f112da056@linux.intel.com>
Date: Fri, 25 Feb 2022 18:42:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v12 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220225032436.904942-1-michael.cheng@intel.com>
 <20220225032436.904942-2-michael.cheng@intel.com>
 <011a236d-7ed4-0d48-e8a6-c9bd98740d5b@linux.intel.com>
 <718c6339-4a19-0de0-2666-a32be7c56dd7@intel.com>
 <0b9dd25f-63ea-9121-6326-14087f5f8e63@linux.intel.com>
 <ce1fadfd-4ae3-8639-8b92-4666ac68da14@intel.com>
 <9f8dd83b-ded2-6a75-2857-2a6a3246fa03@linux.intel.com>
 <683a9a0b-4d3b-8424-cb8f-3fa198a65d06@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <683a9a0b-4d3b-8424-cb8f-3fa198a65d06@intel.com>
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
Cc: balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 25/02/2022 18:23, Michael Cheng wrote:
> These seem to be pretty old arch and are day0 warnings, please refer to 
> [1] to see the warnings. Also I am not sure why my patch series didn't 
> append to the old one.
> 
> [1] https://patchwork.freedesktop.org/patch/475829/?series=99450&rev=11

>> include/linux/cacheflush.h:12:46: warning: declaration of 'struct folio' will not be visible outside of this function [-Wvisibility]

That?

Looks like the #else path needs to forward declare struct folio or include the relevant header.

+Matthew Wilcox

Matthew, what do you think fix for this build warning on h8300 and s390 should be? Or perhaps a build environment issue with kernel test robot?

Regards,

Tvrtko
  
> 2022-02-25 10:19 a.m., Tvrtko Ursulin wrote:
>>
>> On 25/02/2022 17:40, Michael Cheng wrote:
>>> Ah, thanks for pointing that out, when I do include it though, it 
>>> causes a few warning other systems such as h8300 and s390.
>>
>> Errors look like? I haven't heard that kernel code is not allowed to 
>> include something from linux/ on some arch yet.
>>
>>> Since it is already pulled is, would it be OK to leave it out for 
>>> this case? Or we could use something like !IS_H8300 and !IS_S390
>>>
>>> around the header file?
>>
>> Unlikely, now you made me curious why it does not work.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> On 2022-02-25 9:33 a.m., Tvrtko Ursulin wrote:
>>>>
>>>> On 25/02/2022 16:52, Michael Cheng wrote:
>>>>> Hi Tvrtko,
>>>>>
>>>>> It seems without cacheflush.h being included, when I build for 
>>>>> arm64 or x86, it stills pulls in cacheflush.h:
>>>>>
>>>>> ./.drm_cache.o.cmd:838: include/linux/cacheflush.h \
>>>>> ./.drm_cache.o.cmd:839: arch/x86/include/asm/cacheflush.h \
>>>>> ./.drm_cache.o.cmd:920: include/asm-generic/cacheflush.h \
>>>>> ./.drm_cache.o.cmd:830: include/linux/cacheflush.h \
>>>>> ./.drm_cache.o.cmd:831: arch/arm64/include/asm/cacheflush.h \
>>>>> ./.drm_cache.o.cmd:1085: include/asm-generic/cacheflush.h \
>>>>> So it seems without including it, cacheflush.h stills get pulled in,
>>>>> I think its because its a required kernel source to build the kernel
>>>>> per specific architecture, but please correct if I am wrong,as I am 
>>>>> still
>>>>> trying to understand how things works!
>>>>
>>>> Probably:
>>>>
>>>> drm_cache.c:
>>>>
>>>> #include <linux/highmem.h>
>>>>
>>>> linux/highmem.h:
>>>>
>>>> #include <linux/cacheflush.h>
>>>>
>>>> But it is more correct to explicitly include what you use. So if 
>>>> drm_cache.c uses stuff declared in cacheflush.h, it should include it.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> Michael Cheng
>>>>> On 2022-02-25 8:28 a.m., Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 25/02/2022 03:24, Michael Cheng wrote:
>>>>>>> Add arm64 support for drm_clflush_virt_range. caches_clean_inval_pou
>>>>>>> performs a flush by first performing a clean, follow by an 
>>>>>>> invalidation
>>>>>>> operation.
>>>>>>>
>>>>>>> v2 (Michael Cheng): Use correct macro for cleaning and 
>>>>>>> invalidation the
>>>>>>>             dcache. Thanks Tvrtko for the suggestion.
>>>>>>>
>>>>>>> v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h
>>>>>>>
>>>>>>> v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc 
>>>>>>> as a
>>>>>>>             symbol that could be use by other modules, thus use
>>>>>>>             caches_clean_inval_pou instead. Also this version
>>>>>>>                 removes include for cacheflush, since its already
>>>>>>>             included base on architecture type.
>>>>>>
>>>>>> What does it mean that it is included based on architecture type? 
>>>>>> Some of the other header already pulls it in?
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Tvrtko
>>>>>>
>>>>>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>>>>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/drm_cache.c | 5 +++++
>>>>>>>   1 file changed, 5 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_cache.c 
>>>>>>> b/drivers/gpu/drm/drm_cache.c
>>>>>>> index c3e6e615bf09..81c28714f930 100644
>>>>>>> --- a/drivers/gpu/drm/drm_cache.c
>>>>>>> +++ b/drivers/gpu/drm/drm_cache.c
>>>>>>> @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned 
>>>>>>> long length)
>>>>>>>         if (wbinvd_on_all_cpus())
>>>>>>>           pr_err("Timed out waiting for cache flush\n");
>>>>>>> +
>>>>>>> +#elif defined(CONFIG_ARM64)
>>>>>>> +    void *end = addr + length;
>>>>>>> +    caches_clean_inval_pou((unsigned long)addr, (unsigned 
>>>>>>> long)end);
>>>>>>> +
>>>>>>>   #else
>>>>>>>       WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>>>>>>>   #endif
