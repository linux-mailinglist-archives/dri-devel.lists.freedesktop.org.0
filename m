Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B19057E336
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 16:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA97318B75D;
	Fri, 22 Jul 2022 14:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3734918AE0E;
 Fri, 22 Jul 2022 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658501212; x=1690037212;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WRH9cIsoUcoRyXjeCoGHzHsa9mEQHzQ7wZmyAbWmTj8=;
 b=nmiUz7mnA7ndkRivlrKxG4wm5zieKlWsSfaisg5hV38sKXIMHcX6k12Q
 nqVg+wz5gtbKEnfXoZq6AvgmSNJUNxJXpigrQp/KcP7J7+NsA6Wd1SFF3
 FiR+W5sgEzZ8gSSEDLhtALnmMV0fnIDsPaFaJ2nVoT3GTizERE9tY3qWp
 TRiEMl6IckWtE5eGoE6YEc5kKBlnORv6o1VE/b5dmPuuB2njWUVWCfV/E
 +tc+9GYTW30/vZfnC0KhtRjkX9i7N8AMRxKkefLeuXTFxa56UelkigKVi
 1OaFhUKIoCNNHNzdwB0z+7igG3UxOLiUBNa33Lafq+75aL4t7oi5jmiVj g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="288081102"
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; d="scan'208";a="288081102"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 07:46:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; d="scan'208";a="574187781"
Received: from lflintof-mobl1.ger.corp.intel.com (HELO [10.213.217.10])
 ([10.213.217.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 07:46:50 -0700
Message-ID: <476c4e58-ba0c-0736-2618-e7899dd5b60f@linux.intel.com>
Date: Fri, 22 Jul 2022 15:46:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] Revert "drm/amdgpu: move internal vram_mgr function
 into the C file"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
 <a56afc27-3556-38ea-0d10-f7069091967e@suse.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <a56afc27-3556-38ea-0d10-f7069091967e@suse.de>
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/07/2022 09:45, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.07.22 um 11:30 schrieb Arunpravin Paneer Selvam:
>> This reverts commit 708d19d9f362766147cab79eccae60912c6d3068.
> 
> This commit is only present in drm-misc-next. Should the revert be 
> cherry-picked into drm-misc-next-fixes?

Seemed like an appropriate thread to raise this, in case my pings about 
it on #dri-devel and #radeon go un-noticed since it is Friday after all.

So for me dri-tip today fails to build the amdgpu driver.

I had to revert 925b6e59138cefa47275c67891c65d48d3266d57 to make it 
build. This conflicts a bit but seems trivial. Without this revert code 
seems confused with different versions of struct amdgpu_vram_mgr and 
build fails violently (increase your scroll back buffers to see it all).

Regards,

Tvrtko

> Best regards
> Thomas
> 
>>
>> This is part of a revert of the following commits:
>> commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function into 
>> the C file")
>> commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in 
>> amdgpu_vram_mgr_new")
>> commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")
>>
>> [WHY]
>> Few users reported garbaged graphics as soon as x starts,
>> reverting until this can be resolved.
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 29 --------------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 27 ++++++++++++++++++
>>   2 files changed, 27 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index 7a5e8a7b4a1b..51d9d3a4456c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -50,35 +50,6 @@ to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
>>       return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
>>   }
>> -static inline struct drm_buddy_block *
>> -amdgpu_vram_mgr_first_block(struct list_head *list)
>> -{
>> -    return list_first_entry_or_null(list, struct drm_buddy_block, link);
>> -}
>> -
>> -static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct 
>> list_head *head)
>> -{
>> -    struct drm_buddy_block *block;
>> -    u64 start, size;
>> -
>> -    block = amdgpu_vram_mgr_first_block(head);
>> -    if (!block)
>> -        return false;
>> -
>> -    while (head != block->link.next) {
>> -        start = amdgpu_vram_mgr_block_start(block);
>> -        size = amdgpu_vram_mgr_block_size(block);
>> -
>> -        block = list_entry(block->link.next, struct drm_buddy_block, 
>> link);
>> -        if (start + size != amdgpu_vram_mgr_block_start(block))
>> -            return false;
>> -    }
>> -
>> -    return true;
>> -}
>> -
>> -
>> -
>>   /**
>>    * DOC: mem_info_vram_total
>>    *
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> index 4b267bf1c5db..9a2db87186c7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> @@ -53,6 +53,33 @@ static inline u64 amdgpu_vram_mgr_block_size(struct 
>> drm_buddy_block *block)
>>       return PAGE_SIZE << drm_buddy_block_order(block);
>>   }
>> +static inline struct drm_buddy_block *
>> +amdgpu_vram_mgr_first_block(struct list_head *list)
>> +{
>> +    return list_first_entry_or_null(list, struct drm_buddy_block, link);
>> +}
>> +
>> +static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct 
>> list_head *head)
>> +{
>> +    struct drm_buddy_block *block;
>> +    u64 start, size;
>> +
>> +    block = amdgpu_vram_mgr_first_block(head);
>> +    if (!block)
>> +        return false;
>> +
>> +    while (head != block->link.next) {
>> +        start = amdgpu_vram_mgr_block_start(block);
>> +        size = amdgpu_vram_mgr_block_size(block);
>> +
>> +        block = list_entry(block->link.next, struct drm_buddy_block, 
>> link);
>> +        if (start + size != amdgpu_vram_mgr_block_start(block))
>> +            return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static inline struct amdgpu_vram_mgr_resource *
>>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>   {
> 
