Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB371853313
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 15:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF7A10E6CE;
	Tue, 13 Feb 2024 14:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9H4v5ba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF30510E6CE;
 Tue, 13 Feb 2024 14:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707834533; x=1739370533;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=h9+hc5YJ9Unb7vZbnOPpY53cs/MhvhvVf5tdqt+CPmY=;
 b=O9H4v5baqR3Evus2NpmGmUCyYH1BgogkHUbrBKncRGbX20LqzBBMJLp6
 DNRYrgWqwXkFrOKjWVPXY6uGwUSKEEFEZf2WenjwsfDfuTO8rQJgMfpLQ
 10W+M5QgjJwIeIOO9Y+kfyPhiX322jvbyE/USY3w1WRbzXDYlTUbwiTX2
 nZ5wcc2UzsU1gUVhxAkmu5f0faEFNSOiQKe7SAJwFNyo+rX6lnYKRWyL2
 zXn4UuEfsB50vO2uocwvfjQRLSpqbBj1XicllLleqXsKrzAcsJ4oVsYpo
 zTS27dE7p/qyLGMeP09f67Wg2hHzntO0N6IxAbgvJyqnP0zrXmjO9xuBi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13236545"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="13236545"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 06:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2853774"
Received: from gfmckenx-mobl.ger.corp.intel.com (HELO [10.252.21.42])
 ([10.252.21.42])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 06:28:49 -0800
Message-ID: <3c648d2f-07d3-4b4d-bf7b-c4c91b5163a3@intel.com>
Date: Tue, 13 Feb 2024 14:28:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/tests/drm_buddy: add alloc_contiguous test
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com, daniel@ffwll.ch
References: <20240213135203.348050-1-Arunpravin.PaneerSelvam@amd.com>
 <20240213135203.348050-2-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240213135203.348050-2-Arunpravin.PaneerSelvam@amd.com>
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

On 13/02/2024 13:52, Arunpravin Paneer Selvam wrote:
> Sanity check DRM_BUDDY_CONTIGUOUS_ALLOCATION.
> 
> References: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

It looks like you changed the patch authorship here.

> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Cc: Limonciello <mario.limonciello@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 89 ++++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index ea2af6bd9abe..fee6bec757d1 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -8,6 +8,7 @@
>   
>   #include <linux/prime_numbers.h>
>   #include <linux/sched/signal.h>
> +#include <linux/sizes.h>
>   
>   #include <drm/drm_buddy.h>
>   
> @@ -18,6 +19,93 @@ static inline u64 get_size(int order, u64 chunk_size)
>   	return (1 << order) * chunk_size;
>   }
>   
> +static void drm_test_buddy_alloc_contiguous(struct kunit *test)
> +{
> +	u64 mm_size, ps = SZ_4K, i, n_pages, total;
> +	struct drm_buddy_block *block;
> +	struct drm_buddy mm;
> +	LIST_HEAD(left);
> +	LIST_HEAD(middle);
> +	LIST_HEAD(right);
> +	LIST_HEAD(allocated);
> +
> +	mm_size = 16 * 3 * SZ_4K;
> +
> +	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
> +
> +	/*
> +	 * Idea is to fragment the address space by alternating block
> +	 * allocations between three different lists; one for left, middle and
> +	 * right. We can then free a list to simulate fragmentation. In
> +	 * particular we want to exercise the DRM_BUDDY_CONTIGUOUS_ALLOCATION,
> +	 * including the try_harder path.
> +	 */
> +
> +	i = 0;
> +	n_pages = mm_size / ps;
> +	do {
> +		struct list_head *list;
> +		int slot = i % 3;
> +
> +		if (slot == 0)
> +			list = &left;
> +		else if (slot == 1)
> +			list = &middle;
> +		else
> +			list = &right;
> +		KUNIT_ASSERT_FALSE_MSG(test,
> +				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							      ps, ps, list, 0),
> +				       "buddy_alloc hit an error size=%d\n",
> +				       ps);
> +	} while (++i < n_pages);
> +
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   3 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%d\n", 3 * ps);
> +
> +	drm_buddy_free_list(&mm, &middle);
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   3 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   2 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
> +
> +	drm_buddy_free_list(&mm, &right);
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   3 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +	/*
> +	 * At this point we should have enough contiguous space for 2 blocks,
> +	 * however they are never buddies (since we freed middle and right) so
> +	 * will require the try_harder logic to find them.
> +	 */
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							    2 * ps, ps, &allocated,
> +							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc hit an error size=%d\n", 2 * ps);
> +
> +	drm_buddy_free_list(&mm, &left);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							    3 * ps, ps, &allocated,
> +							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc hit an error size=%d\n", 3 * ps);
> +
> +	total = 0;
> +	list_for_each_entry(block, &allocated, link)
> +		total += drm_buddy_block_size(&mm, block);
> +
> +	KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
> +
> +	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_fini(&mm);
> +}
> +
>   static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   {
>   	u64 mm_size, size, start = 0;
> @@ -280,6 +368,7 @@ static struct kunit_case drm_buddy_tests[] = {
>   	KUNIT_CASE(drm_test_buddy_alloc_optimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pathological),
> +	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>   	{}
>   };
>   
