Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B186EA025B0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 13:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525AF10E206;
	Mon,  6 Jan 2025 12:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3adX2m7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A759D10E206;
 Mon,  6 Jan 2025 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736167226; x=1767703226;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=v0UUsqEhu4Z2w+brQdo2/oYqWGvFzRZHHxEpKiVZjKo=;
 b=P3adX2m7/aRNaBl+UPY9tV94aal+IaQBbem3/oUQljBWccFi0Eecmv6V
 PEirYAMZICCZtw0aRQfTwLkfEJlurZCVA4MnHzsyvE/10FZ4YV7AQzvnd
 5KhyDRS14nXnmT+kWnBC2zSNF4fSWxh9HjGBhAAWGLXWDRWvI5NKIogqo
 oTJXHAJCtxtzRYRmtk1Rs987eVWahjBmswV7dERdZhuoXkZP4xftIi4+q
 xDAhREiK0UXhT8PUHHv9dyQOOnf25D/qOpsMWgl4uj4BzCdIT+nreojCK
 ACNgXUZGBd04q8Tqv04DKSg2wKkUQ8eAr+eIZY3RNCgIVjgbNElKwFH3P Q==;
X-CSE-ConnectionGUID: D0UCPTLHShqAqh3PAZf0tQ==
X-CSE-MsgGUID: 7n6Wf76rRsGMatHhaVG56Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="53731452"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="53731452"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 04:40:26 -0800
X-CSE-ConnectionGUID: tge8y+r1RI+bpq4uKBIo0A==
X-CSE-MsgGUID: uR84ypzHSQO84zYozsVsYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102932402"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.244.64])
 ([10.245.244.64])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 04:40:26 -0800
Message-ID: <043cb503-e05a-4383-95e4-df501c6a206a@intel.com>
Date: Mon, 6 Jan 2025 12:40:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/buddy: Add a testcase to verify the multiroot
 fini
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 "Lin . Cao" <lincao12@amd.com>
References: <20241226070116.309290-1-Arunpravin.PaneerSelvam@amd.com>
 <20241226070116.309290-2-Arunpravin.PaneerSelvam@amd.com>
 <1d22b16a-8d8c-433d-a916-d6bec849f9f8@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <1d22b16a-8d8c-433d-a916-d6bec849f9f8@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On 06/01/2025 12:37, Paneer Selvam, Arunpravin wrote:
> Hi Matthew,
> 
> Ping?

Just got back from time off. I already slapped an r-b here: 
https://lore.kernel.org/dri-devel/aa27455c-04b8-494c-a3b5-c4385a7748bc@intel.com/

> 
> Regards,
> Arun.
> 
> On 12/26/2024 12:31 PM, Arunpravin Paneer Selvam wrote:
>> - Added a testcase to verify the multiroot force merge fini.
>> - Added a new field in_use to track the mm freed status.
>>
>> v2:(Matthew)
>>    - Add kunit_fail_current_test() when WARN_ON is true.
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c            |  6 +++++-
>>   drivers/gpu/drm/tests/drm_buddy_test.c | 29 ++++++++++++++++++--------
>>   2 files changed, 25 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index ca42e6081d27..241c855f891f 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -3,6 +3,8 @@
>>    * Copyright © 2021 Intel Corporation
>>    */
>> +#include <kunit/test-bug.h>
>> +
>>   #include <linux/kmemleak.h>
>>   #include <linux/module.h>
>>   #include <linux/sizes.h>
>> @@ -335,7 +337,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>           start = drm_buddy_block_offset(mm->roots[i]);
>>           __force_merge(mm, start, start + size, order);
>> -        WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
>> +        if (WARN_ON(!drm_buddy_block_is_free(mm->roots[i])))
>> +            kunit_fail_current_test("buddy_fini() root");
>> +
>>           drm_block_free(mm, mm->roots[i]);
>>           root_size = mm->chunk_size << order;
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/ 
>> tests/drm_buddy_test.c
>> index 9662c949d0e3..4b5818f9f2a9 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -385,17 +385,28 @@ static void drm_test_buddy_alloc_clear(struct 
>> kunit *test)
>>       drm_buddy_fini(&mm);
>>       /*
>> -     * Create a new mm with a non power-of-two size. Allocate a 
>> random size, free as
>> -     * cleared and then call fini. This will ensure the multi-root 
>> force merge during
>> -     * fini.
>> +     * Create a new mm with a non power-of-two size. Allocate a 
>> random size from each
>> +     * root, free as cleared and then call fini. This will ensure the 
>> multi-root
>> +     * force merge during fini.
>>        */
>> -    mm_size = 12 * SZ_4K;
>> -    size = max(round_up(prandom_u32_state(&prng) % mm_size, ps), ps);
>> +    mm_size = (SZ_4K << max_order) + (SZ_4K << (max_order - 2));
>> +
>>       KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
>> -    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> -                                size, ps, &allocated,
>> -                                DRM_BUDDY_TOPDOWN_ALLOCATION),
>> -                "buddy_alloc hit an error size=%u\n", size);
>> +    KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K 
>> << max_order,
>> +                                4 * ps, ps, &allocated,
>> +                                DRM_BUDDY_RANGE_ALLOCATION),
>> +                "buddy_alloc hit an error size=%lu\n", 4 * ps);
>> +    drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K 
>> << max_order,
>> +                                2 * ps, ps, &allocated,
>> +                                DRM_BUDDY_CLEAR_ALLOCATION),
>> +                "buddy_alloc hit an error size=%lu\n", 2 * ps);
>> +    drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, SZ_4K << 
>> max_order, mm_size,
>> +                                ps, ps, &allocated,
>> +                                DRM_BUDDY_RANGE_ALLOCATION),
>> +                "buddy_alloc hit an error size=%lu\n", ps);
>>       drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>>       drm_buddy_fini(&mm);
>>   }
> 

