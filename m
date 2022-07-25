Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 661575801DC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 17:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD36C0641;
	Mon, 25 Jul 2022 15:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A876EC063B;
 Mon, 25 Jul 2022 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658762830; x=1690298830;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CBUXI2+9ETq68GBOm4EGbbXN0OtmNOmJSzf5MbpI2qM=;
 b=FJrg0wfQHmdhmRMwy+owOiu/xhpf/Jty99DGYtjNtXqbyP+LqmcaeioG
 5L8/Tgv0CZ7couRQpjMT4eBasciQChAWYbmXPHLGM2O/gHDWN93SHsBei
 CLbTBsEmQFBinv3UH8qtFXvnwrbVZogHV4M+PpHAYDtxWct1i6ZAcj10o
 m353R9cs+UiMPPRfmHKIYRTnnekAH+jhvihsa9LEOHsKuNNMp2/ZYH4EL
 DIkvesL8N6d9bpQn15BeNNTMG6jrF3Uo3HiI3mH3FI55G5rwRfzFoJm7E
 oFMjwVpYVrW8e0p24TaE23L1g0J4sEGwwuMiVD2d2j/w8U2nlM28kTx2r Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="374028893"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="374028893"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 08:27:10 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="575094723"
Received: from ngobrien-mobl1.ger.corp.intel.com (HELO [10.213.204.5])
 ([10.213.204.5])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 08:27:08 -0700
Message-ID: <3b66f6fe-422a-62e9-ff55-74d9f631d6e3@linux.intel.com>
Date: Mon, 25 Jul 2022 16:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] Revert "drm/amdgpu: move internal vram_mgr function
 into the C file"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
 <a56afc27-3556-38ea-0d10-f7069091967e@suse.de>
 <476c4e58-ba0c-0736-2618-e7899dd5b60f@linux.intel.com>
 <ceba1244-33a8-9b74-6379-4d0569ca9bdb@amd.com>
 <b7b44b45-4143-963c-3279-87bdc6f727c1@suse.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <b7b44b45-4143-963c-3279-87bdc6f727c1@suse.de>
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/07/2022 19:28, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.07.22 um 17:47 schrieb Christian König:
>> Hi Tvrtko,
>>
>> scratching my head what exactly is going on here.
>>
>> I've build tested drm-tip a couple of test in the last week and it 
>> always worked flawlessly.
>>
>> It looks like that some conflict resolution is sometimes not applied 
>> correctly, but I have no idea why.
> 
> It worked last week, but must have been reintroduced meanhwile.
> Please fetch the latest drm-tip and rebuild. The attached config 
> produces the error on my system.

What is the status with this? I hit a conflict on an implicated file 
just now trying to rebuild drm-tip:

Unmerged paths:
   (use "git add/rm <file>..." as appropriate to mark resolution)
         deleted by us:   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h

I had an other i915 conflict to solve and as grep amdgpu_vram_mgr.h 
drivers/gpu/drm/amd produced nothing I just did a git rm on it and 
pushed the resolution.

Let me know if I broke something, re-broke something, or whatever.. 
Build of amdgpu certainly still looks broken on my end, both before and 
after me rebuilding drm-tip so maybe I just preserved the breakage.

Regards,

Tvrtko

> 
> Best regards
> Thomas
> 
>>
>> Regards,
>> Christian.
>>
>> Am 22.07.22 um 16:46 schrieb Tvrtko Ursulin:
>>>
>>> On 14/07/2022 09:45, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 08.07.22 um 11:30 schrieb Arunpravin Paneer Selvam:
>>>>> This reverts commit 708d19d9f362766147cab79eccae60912c6d3068.
>>>>
>>>> This commit is only present in drm-misc-next. Should the revert be 
>>>> cherry-picked into drm-misc-next-fixes?
>>>
>>> Seemed like an appropriate thread to raise this, in case my pings 
>>> about it on #dri-devel and #radeon go un-noticed since it is Friday 
>>> after all.
>>>
>>> So for me dri-tip today fails to build the amdgpu driver.
>>>
>>> I had to revert 925b6e59138cefa47275c67891c65d48d3266d57 to make it 
>>> build. This conflicts a bit but seems trivial. Without this revert 
>>> code seems confused with different versions of struct amdgpu_vram_mgr 
>>> and build fails violently (increase your scroll back buffers to see 
>>> it all).
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>
>>>>> This is part of a revert of the following commits:
>>>>> commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function 
>>>>> into the C file")
>>>>> commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in 
>>>>> amdgpu_vram_mgr_new")
>>>>> commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")
>>>>>
>>>>> [WHY]
>>>>> Few users reported garbaged graphics as soon as x starts,
>>>>> reverting until this can be resolved.
>>>>>
>>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 29 
>>>>> --------------------
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 27 ++++++++++++++++++
>>>>>   2 files changed, 27 insertions(+), 29 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> index 7a5e8a7b4a1b..51d9d3a4456c 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> @@ -50,35 +50,6 @@ to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
>>>>>       return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
>>>>>   }
>>>>> -static inline struct drm_buddy_block *
>>>>> -amdgpu_vram_mgr_first_block(struct list_head *list)
>>>>> -{
>>>>> -    return list_first_entry_or_null(list, struct drm_buddy_block, 
>>>>> link);
>>>>> -}
>>>>> -
>>>>> -static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct 
>>>>> list_head *head)
>>>>> -{
>>>>> -    struct drm_buddy_block *block;
>>>>> -    u64 start, size;
>>>>> -
>>>>> -    block = amdgpu_vram_mgr_first_block(head);
>>>>> -    if (!block)
>>>>> -        return false;
>>>>> -
>>>>> -    while (head != block->link.next) {
>>>>> -        start = amdgpu_vram_mgr_block_start(block);
>>>>> -        size = amdgpu_vram_mgr_block_size(block);
>>>>> -
>>>>> -        block = list_entry(block->link.next, struct 
>>>>> drm_buddy_block, link);
>>>>> -        if (start + size != amdgpu_vram_mgr_block_start(block))
>>>>> -            return false;
>>>>> -    }
>>>>> -
>>>>> -    return true;
>>>>> -}
>>>>> -
>>>>> -
>>>>> -
>>>>>   /**
>>>>>    * DOC: mem_info_vram_total
>>>>>    *
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>>> index 4b267bf1c5db..9a2db87186c7 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>>> @@ -53,6 +53,33 @@ static inline u64 
>>>>> amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>>>>>       return PAGE_SIZE << drm_buddy_block_order(block);
>>>>>   }
>>>>> +static inline struct drm_buddy_block *
>>>>> +amdgpu_vram_mgr_first_block(struct list_head *list)
>>>>> +{
>>>>> +    return list_first_entry_or_null(list, struct drm_buddy_block, 
>>>>> link);
>>>>> +}
>>>>> +
>>>>> +static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct 
>>>>> list_head *head)
>>>>> +{
>>>>> +    struct drm_buddy_block *block;
>>>>> +    u64 start, size;
>>>>> +
>>>>> +    block = amdgpu_vram_mgr_first_block(head);
>>>>> +    if (!block)
>>>>> +        return false;
>>>>> +
>>>>> +    while (head != block->link.next) {
>>>>> +        start = amdgpu_vram_mgr_block_start(block);
>>>>> +        size = amdgpu_vram_mgr_block_size(block);
>>>>> +
>>>>> +        block = list_entry(block->link.next, struct 
>>>>> drm_buddy_block, link);
>>>>> +        if (start + size != amdgpu_vram_mgr_block_start(block))
>>>>> +            return false;
>>>>> +    }
>>>>> +
>>>>> +    return true;
>>>>> +}
>>>>> +
>>>>>   static inline struct amdgpu_vram_mgr_resource *
>>>>>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>>>>   {
>>>>
>>
> 
