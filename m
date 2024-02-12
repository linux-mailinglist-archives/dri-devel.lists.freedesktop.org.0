Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB72850F6A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 10:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812D110E8F5;
	Mon, 12 Feb 2024 09:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRbEmBMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1263D10E8F5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707729169; x=1739265169;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f1IjCLcD7GLwi06C3CamdOa+baqlCOo1ZzjbhtyyJ+A=;
 b=HRbEmBMTaDQs2G5bltzFh2abj/noCuHQ2VuRR5orSgk4E/2ZZ8vnmW/j
 GeP545Echlqa8nRONmj0CTP0UI/N4uINLnM8C1w33GgnueQqaI8kLQqf3
 DdauRLeyu5KTjoYVrhJ6BznsmxbXkR+9NLhvqq7wFu/8tG5GRnbwubRGv
 u0I9Y1gSnAa/lrJtcvrgAiG81DvhFofsltin7mRHU4tAX8tDY4IRf+i/4
 jIpks6loGbbjjfMTkwk6ipBohgSgNkrNmqTSv22mOJysx1diK9DcLOJsU
 5TM0MYw6TI+/GEj9l2qVCfjbhRIP1vcZ0HPEqirKB3MyemfqUSxWI532b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1576606"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1576606"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 01:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2541893"
Received: from sdepeste-mobl.ger.corp.intel.com (HELO [10.252.21.18])
 ([10.252.21.18])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 01:12:42 -0800
Message-ID: <a3c6dcf9-265b-4c9a-90fb-145f6d6693a0@intel.com>
Date: Mon, 12 Feb 2024 09:12:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests/drm_buddy: add alloc_contiguous test
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
References: <20240208143618.247048-2-matthew.auld@intel.com>
 <81c1db17-e324-6e45-5d55-4308dba99605@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <81c1db17-e324-6e45-5d55-4308dba99605@amd.com>
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

On 12/02/2024 08:23, Arunpravin Paneer Selvam wrote:
> Hi Matthew,
> 
> Can I push this test case along with the bug fix patch.

Sure. Please go ahead.

> 
> Thanks,
> Arun.
> 
> On 2/8/2024 8:06 PM, Matthew Auld wrote:
>> Sanity check DRM_BUDDY_CONTIGUOUS_ALLOCATION.
>>
>> References: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Cc: Limonciello <mario.limonciello@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/tests/drm_buddy_test.c | 89 ++++++++++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index ea2af6bd9abe..4215d8b5fcf0 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/prime_numbers.h>
>>   #include <linux/sched/signal.h>
>> +#include <linux/sizes.h>
>>   #include <drm/drm_buddy.h>
>> @@ -18,6 +19,93 @@ static inline u64 get_size(int order, u64 chunk_size)
>>       return (1 << order) * chunk_size;
>>   }
>> +static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>> +{
>> +    u64 mm_size, ps = SZ_4K, i, n_pages, total;
>> +    struct drm_buddy_block *block;
>> +    struct drm_buddy mm;
>> +    LIST_HEAD(left);
>> +    LIST_HEAD(middle);
>> +    LIST_HEAD(right);
>> +    LIST_HEAD(allocated);
>> +
>> +    mm_size = 16 * 3 * SZ_4K;
>> +
>> +    KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
>> +
>> +    /*
>> +     * Idea is to fragment the address space by alternating block
>> +     * allocations between three different lists; one for left, 
>> middle and
>> +     * right. We can then free a list to simulate fragmentation. In
>> +     * particular we want to exercise the 
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION,
>> +     * including the try_harder path.
>> +     */
>> +
>> +    i = 0;
>> +    n_pages = mm_size / ps;
>> +    do {
>> +        struct list_head *list;
>> +        int slot = i % 3;
>> +
>> +        if (slot == 0)
>> +            list = &left;
>> +        else if (slot == 1)
>> +            list = &middle;
>> +        else
>> +            list = &right;
>> +        KUNIT_ASSERT_FALSE_MSG(test,
>> +                       drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                                  ps, ps, list, 0),
>> +                       "buddy_alloc hit an error size=%d\n",
>> +                       ps);
>> +    } while (++i < n_pages);
>> +
>> +    KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                               3 * ps, ps, &allocated,
>> +                               DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc didn't error size=%d\n", 3 * ps);
>> +
>> +    drm_buddy_free_list(&mm, &middle);
>> +    KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                               3 * ps, ps, &allocated,
>> +                               DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc didn't error size=%llu\n", 3 * ps);
>> +    KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                               2 * ps, ps, &allocated,
>> +                               DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc didn't error size=%llu\n", 2 * ps);
>> +
>> +    drm_buddy_free_list(&mm, &right);
>> +    KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                               3 * ps, ps, &allocated,
>> +                               DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc didn't error size=%llu\n", 3 * ps);
>> +    /*
>> +     * At this point we should have enough contiguous space for 2 
>> blocks,
>> +     * however they are never buddies (since we freed middle and 
>> right) so
>> +     * will require the try_harder logic to find them.
>> +     */
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                               2 * ps, ps, &allocated,
>> +                               DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc hit an error size=%d\n", 2 * ps);
>> +
>> +    drm_buddy_free_list(&mm, &left);
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>> +                               3 * ps, ps, &allocated,
>> +                               DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> +                   "buddy_alloc hit an error size=%d\n", 3 * ps);
>> +
>> +    total = 0;
>> +    list_for_each_entry(block, &allocated, link)
>> +        total += drm_buddy_block_size(&mm, block);
>> +
>> +    KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
>> +
>> +    drm_buddy_free_list(&mm, &allocated);
>> +    drm_buddy_fini(&mm);
>> +}
>> +
>>   static void drm_test_buddy_alloc_pathological(struct kunit *test)
>>   {
>>       u64 mm_size, size, start = 0;
>> @@ -280,6 +368,7 @@ static struct kunit_case drm_buddy_tests[] = {
>>       KUNIT_CASE(drm_test_buddy_alloc_optimistic),
>>       KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
>>       KUNIT_CASE(drm_test_buddy_alloc_pathological),
>> +    KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>>       {}
>>   };
> 
