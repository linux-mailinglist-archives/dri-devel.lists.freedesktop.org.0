Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596B088CB42
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 18:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8AC10F190;
	Tue, 26 Mar 2024 17:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIgo3dZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CFF10F190;
 Tue, 26 Mar 2024 17:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711475230; x=1743011230;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=rKBF7AufZh5+n13raPhJxVltRhoyL+tmHyicIqdVe1E=;
 b=DIgo3dZYgJeUIdebUq69a8KGGjK+Lv+uqWbtB7qJZER9K2+9JnGNIicx
 QjS7rFL9UiMK6TtA2E35RMh7FVPsalvPeJGxUwDp4hzScT3m6cycKv0TP
 mh5h4/XTijIa2/hTFW4VexvJYeKFA9aWnwLxRcqJjSxCwx+jPz0eLGDwR
 zgUUgib9eN661cbJzgzfpb9du81bmJqbm29Mfny+ULkYTGKV6nikNX44/
 rwCdZNGlGJEsQCWoAatcF30/uq8A3GCO8FauJo5d2pQ4RAOD7AI79HXds
 u97+bw0qGBp6fXFvJ2OZMv6mcfXonHLoR6s+EyE6eXyytGp0z4Ko0mcbW g==;
X-CSE-ConnectionGUID: e3tAeDMcRgieePku9xv2iQ==
X-CSE-MsgGUID: XUqsGj3xQj6TmoYDaKdrxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17091346"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17091346"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 10:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20755932"
Received: from unknown (HELO [10.245.245.97]) ([10.245.245.97])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 10:47:01 -0700
Message-ID: <7936855e-f4f4-4b60-a2ff-146782607b16@intel.com>
Date: Tue, 26 Mar 2024 17:46:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v9 3/3] drm/tests: Add a test case for drm buddy clear
 allocation
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <20240318214058.2014-3-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
In-Reply-To: <20240318214058.2014-3-Arunpravin.PaneerSelvam@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/03/2024 21:40, Arunpravin Paneer Selvam wrote:
> Add a new test case for the drm buddy clear and dirty
> allocation.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 127 +++++++++++++++++++++++++
>   1 file changed, 127 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 454ad9952f56..d355a6e61893 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -19,6 +19,132 @@ static inline u64 get_size(int order, u64 chunk_size)
>   	return (1 << order) * chunk_size;
>   }
>   
> +static void drm_test_buddy_alloc_clear(struct kunit *test)
> +{
> +	unsigned long n_pages, total, i = 0;
> +	const unsigned long ps = SZ_4K;
> +	struct drm_buddy_block *block;
> +	const int max_order = 12;
> +	LIST_HEAD(allocated);
> +	struct drm_buddy mm;
> +	unsigned int order;
> +	u64 mm_size, size;

Maybe just make these two u32 or unsigned long. That should be big 
enough, plus avoids any kind of 32b compilation bugs below.

> +	LIST_HEAD(dirty);
> +	LIST_HEAD(clean);
> +
> +	mm_size = PAGE_SIZE << max_order;

s/PAGE_SIZE/SZ_4K/ below also.

> +	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
> +
> +	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
> +
> +	/**

Drop the extra *, since is not actual kernel-doc. Below also.

> +	 * Idea is to allocate and free some random portion of the address space,
> +	 * returning those pages as non-dirty and randomly alternate between
> +	 * requesting dirty and non-dirty pages (not going over the limit
> +	 * we freed as non-dirty), putting that into two separate lists.
> +	 * Loop over both lists at the end checking that the dirty list
> +	 * is indeed all dirty pages and vice versa. Free it all again,
> +	 * keeping the dirty/clear status.
> +	 */
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							    5 * ps, ps, &allocated,
> +							    DRM_BUDDY_TOPDOWN_ALLOCATION),
> +				"buddy_alloc hit an error size=%u\n", 5 * ps);
> +	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
> +
> +	n_pages = 10;
> +	do {
> +		unsigned long flags;
> +		struct list_head *list;
> +		int slot = i % 2;
> +
> +		if (slot == 0) {
> +			list = &dirty;
> +			flags = 0;
> +		} else if (slot == 1) {

Could just be else {

> +			list = &clean;
> +			flags = DRM_BUDDY_CLEAR_ALLOCATION;
> +		}
> +
> +		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +								    ps, ps, list,
> +								    flags),
> +					"buddy_alloc hit an error size=%u\n", ps);
> +	} while (++i < n_pages);
> +
> +	list_for_each_entry(block, &clean, link)
> +		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), true);
> +
> +	list_for_each_entry(block, &dirty, link)
> +		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
> +
> +	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
> +
> +	/**
> +	 * Trying to go over the clear limit for some allocation.
> +	 * The allocation should never fail with reasonable page-size.
> +	 */
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							    10 * ps, ps, &clean,
> +							    DRM_BUDDY_CLEAR_ALLOCATION),
> +				"buddy_alloc hit an error size=%u\n", 10 * ps);
> +
> +	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
> +	drm_buddy_free_list(&mm, &dirty, 0);
> +	drm_buddy_fini(&mm);
> +
> +	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
> +
> +	/**
> +	 * Create a new mm. Intentionally fragment the address space by creating
> +	 * two alternating lists. Free both lists, one as dirty the other as clean.
> +	 * Try to allocate double the previous size with matching min_page_size. The
> +	 * allocation should never fail as it calls the force_merge. Also check that
> +	 * the page is always dirty after force_merge. Free the page as dirty, then
> +	 * repeat the whole thing, increment the order until we hit the max_order.
> +	 */
> +
> +	order = 1;
> +	do {
> +		size = PAGE_SIZE << order;
> +		i = 0;
> +		n_pages = mm_size / ps;
> +		do {
> +			struct list_head *list;
> +			int slot = i % 2;
> +
> +			if (slot == 0)
> +				list = &dirty;
> +			else if (slot == 1)

else

> +				list = &clean;
> +
> +			KUNIT_ASSERT_FALSE_MSG(test,
> +					       drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +								      ps, ps, list, 0),
> +					       "buddy_alloc hit an error size=%u\n",
> +					       ps);
> +		} while (++i < n_pages);

I think we only need to do this once at the beginning, and then just 
loop over each order starting from one? Otherwise on the first iteration 
here we fragment the entire address space, but then only allocate single 
order=1. And then we repeat the whole fragmentation again, which seems 
unnecessary.

> +
> +		drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
> +		drm_buddy_free_list(&mm, &dirty, 0);
> +
> +		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +								    size, size, &allocated,
> +								    DRM_BUDDY_CLEAR_ALLOCATION),
> +					"buddy_alloc hit an error size=%u\n", size);

size=%llu or better just make size u32.

> +		total = 0;
> +		list_for_each_entry(block, &allocated, link) {
> +			KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
> +			total += drm_buddy_block_size(&mm, block);
> +		}
> +		KUNIT_EXPECT_EQ(test, total, size);
> +
> +		drm_buddy_free_list(&mm, &allocated, 0);
> +	} while (++order <= max_order);

I think would be good to also do some non-power-of-two mm size. Just to 
ensure we get some coverage for the multi-root force_merge during fini. 
Something simple like create new mm here, allocate random size, free as 
cleared, then call fini.

Looks good otherwise.

> +
> +	drm_buddy_fini(&mm);
> +}
> +
>   static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   {
>   	const unsigned long ps = SZ_4K, mm_size = 16 * 3 * SZ_4K;
> @@ -368,6 +494,7 @@ static struct kunit_case drm_buddy_tests[] = {
>   	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pathological),
>   	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
> +	KUNIT_CASE(drm_test_buddy_alloc_clear),
>   	{}
>   };
>   
