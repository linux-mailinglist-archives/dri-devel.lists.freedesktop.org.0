Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D16AC1EB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 14:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C268110E148;
	Mon,  6 Mar 2023 13:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964C110E140;
 Mon,  6 Mar 2023 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678110850; x=1709646850;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pP8M8/N9pEI5ArmlGHc91Sw6n3NK0+2X+pWghKk+mx8=;
 b=a/EMhzc6niJNqojKEIOjjP9iXE4gTez+kBpMQ6SQGALYudLn6YwQzaZ0
 SwXrmKhpN5K7I+b812kZUSSbn7fwonD64QF/etyeqqPExWsbAbQMmdxBn
 +1j9ZmoztiDBG+QLrZYvmPuk3QYGNXxLl3YHjz1ppqY3fTDIum7naPAqL
 0DeZ0F5C7njcgTwEFJVeoQF0MHT13bE+939k3AtIRkmOot3YJrPNT0mS8
 06uzySg8f08kYX+iOpzoCaGc+K/NeeHvJ4WSj7fr2CG5pR0NwDJQqk+RQ
 8qegbZh4xzQgKkA73+5Jpj/1XvuqtIdMuIGtPUdX6f6iTSwQZrHBVTOm6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="398137459"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="398137459"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:54:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653618514"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="653618514"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.46.174])
 ([10.252.46.174])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:54:07 -0800
Message-ID: <30ad1173-cd45-cc71-276d-fec93e06486e@linux.intel.com>
Date: Mon, 6 Mar 2023 14:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Set I915_BO_ALLOC_USER for
 framebuffer
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 intel-gfx@lists.freedesktop.org
References: <20230306120732.28656-1-nirmoy.das@intel.com>
 <866f81b4-1968-95f8-49be-95b4927d8170@intel.com>
 <e1be8dfd-ea15-15f8-c51c-759221be4188@linux.intel.com>
 <ecbc4fda-b395-0ad5-ff3d-d681df5bb060@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <ecbc4fda-b395-0ad5-ff3d-d681df5bb060@intel.com>
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
Cc: andi.shyti@intel.com, dri-devel@lists.freedesktop.org,
 andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/6/2023 2:49 PM, Matthew Auld wrote:
> On 06/03/2023 13:31, Das, Nirmoy wrote:
>> Hi Matt,
>>
>> On 3/6/2023 1:25 PM, Matthew Auld wrote:
>>> On 06/03/2023 12:07, Nirmoy Das wrote:
>>>> Framebuffer is exposed to userspace so set I915_BO_ALLOC_USER
>>>> flag for it. This also make sure that ttm allocates offset
>>>> for lmem objects.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/display/intel_dpt.c           | 4 +++-
>>>>   drivers/gpu/drm/i915/display/intel_fbdev.c         | 3 ++-
>>>>   drivers/gpu/drm/i915/display/intel_plane_initial.c | 3 ++-
>>>>   3 files changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c 
>>>> b/drivers/gpu/drm/i915/display/intel_dpt.c
>>>> index ad1a37b515fb..2e6238881860 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>>>> @@ -254,7 +254,9 @@ intel_dpt_create(struct intel_framebuffer *fb)
>>>>         size = round_up(size * sizeof(gen8_pte_t), 
>>>> I915_GTT_PAGE_SIZE);
>>>>   -    dpt_obj = i915_gem_object_create_lmem(i915, size, 
>>>> I915_BO_ALLOC_CONTIGUOUS);
>>>> +    dpt_obj = i915_gem_object_create_lmem(i915, size,
>>>> +                          I915_BO_ALLOC_CONTIGUOUS |
>>>> +                          I915_BO_ALLOC_USER);
>>>
>>> AFAICT this is just some driver internal stuff for display 
>>> page-table, which gets mapped through GGTT or something, and is not 
>>> the actual fb. Is it really exposed to the user?
>>
>>
>> I misunderstood this for something else. I will remove this.
>>
>>>
>>>>       if (IS_ERR(dpt_obj) && 
>>>> i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>>>>           dpt_obj = i915_gem_object_create_stolen(i915, size);
>>>>       if (IS_ERR(dpt_obj) && !HAS_LMEM(i915)) {
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c 
>>>> b/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>> index 3659350061a7..98ae3a3a986a 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>> @@ -163,7 +163,8 @@ static int intelfb_alloc(struct drm_fb_helper 
>>>> *helper,
>>>>       obj = ERR_PTR(-ENODEV);
>>>>       if (HAS_LMEM(dev_priv)) {
>>>>           obj = i915_gem_object_create_lmem(dev_priv, size,
>>>> -                          I915_BO_ALLOC_CONTIGUOUS);
>>>> +                          I915_BO_ALLOC_CONTIGUOUS |
>>>> +                          I915_BO_ALLOC_USER);
>>>>       } else {
>>>>           /*
>>>>            * If the FB is too big, just don't use it since fbdev is 
>>>> not very
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c 
>>>> b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>>> index bb6ea7de5c61..4a3680f6a3f5 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>>> @@ -110,7 +110,8 @@ initial_plane_vma(struct drm_i915_private *i915,
>>>>           size * 2 > i915->dsm.usable_size)
>>>>           return NULL;
>>>>   -    obj = i915_gem_object_create_region_at(mem, phys_base, size, 
>>>> 0);
>>>> +    obj = i915_gem_object_create_region_at(mem, phys_base, size,
>>>> +                           I915_BO_ALLOC_USER);
>>>
>>> ALLOC_USER has the side effect of also zeroing the memory 
>>> underneath, IIRC. However this here is the pre-allocated fb (will 
>>> have some boot logo stuff), so we shouldn't ever clear it.
>>
>>
>> This was my concern.  I wonder if there is any other better way than 
>> to use a temp buffer to copy the pre-allocated content and put it 
>> back after getting i915_gem_object_create_region_at().
>
> If we need ALLOC_USER for this buffer then maybe just a new flag like 
> BO_PREALLOCATED which skips all the clearing?


Sounds good, I will look into that.


Thanks,

Nirmoy

>
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>
>>>
>>>>       if (IS_ERR(obj))
>>>>           return NULL;
