Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FF89F38D0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7FE10E753;
	Mon, 16 Dec 2024 18:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqVsBykE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07BD10E74E;
 Mon, 16 Dec 2024 18:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734373378; x=1765909378;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iKU5yVrn5hqkJE+UB+SfyYpkwyNwGfC1ks+EOS8fcPA=;
 b=UqVsBykErR+B3i5c/fJ1rdfzLWkXwjEhA+A90cnRCGmnWGd+M1qlTpbk
 THzA9pEyw3RCvccOyFv+E/n5OgJB9jfvM2U8fifY0w8FCHkyUga0hkimg
 EtweaXVGBCw300x43ceYM5aKlNzQdswtVxQQuCtJ4JCt24R2lrVn27fZa
 fbBDwbg0GbYtBnFEMifIANz/rB0CCv38i9WoebUf4R7lGUoMrsoTji82T
 LVJYv0P1fpAMFkyCCtgVE7qLDgUxm+sD4IDectgnWxA0QODzk8XG1tDBy
 E9TEuV9UREGIMqR730XoxftVp/OqYeIZbm3rlKE0u6Pa62Ewy8EMrBgor A==;
X-CSE-ConnectionGUID: 5rOd8ifBQU+hytzKoP09Mw==
X-CSE-MsgGUID: O/c3LfQfTkKdusdZ6WvYsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34929915"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="34929915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 10:22:58 -0800
X-CSE-ConnectionGUID: vMjSlv4pTD6/BOBC1qvF9g==
X-CSE-MsgGUID: 7xtVY/fsRpKCA2MSiQVx/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101426816"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.246]) ([10.245.244.246])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 10:22:57 -0800
Message-ID: <e26daaa7-253a-4753-a5a8-f8f0c045c583@intel.com>
Date: Mon, 16 Dec 2024 18:22:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/buddy: Add a testcase to verify the multiroot fini
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 "Lin . Cao" <lincao12@amd.com>
References: <20241216130735.314298-1-Arunpravin.PaneerSelvam@amd.com>
 <20241216130735.314298-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241216130735.314298-2-Arunpravin.PaneerSelvam@amd.com>
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

On 16/12/2024 13:07, Arunpravin Paneer Selvam wrote:
> - Added a testcase to verify the multiroot force merge fini.
> - Added a new field in_use to track the mm freed status.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Signed-off-by: Lin.Cao <lincao12@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c            | 20 ++++++++++++++++-
>   drivers/gpu/drm/tests/drm_buddy_test.c | 30 ++++++++++++++++++--------
>   include/drm/drm_buddy.h                |  2 ++
>   3 files changed, 42 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index ca42e6081d27..39ce918b3a65 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -102,6 +102,18 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>   	return s1 <= s2 && e1 >= e2;
>   }
>   
> +static bool is_roots_freed(struct drm_buddy *mm)
> +{
> +	int i;
> +
> +	for (i = 0; i < mm->n_roots; ++i) {
> +		if (!drm_buddy_block_is_free(mm->roots[i]))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static struct drm_buddy_block *
>   __get_buddy(struct drm_buddy_block *block)
>   {
> @@ -303,6 +315,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   		i++;
>   	} while (size);
>   
> +	mm->in_use = true;
> +
>   	return 0;
>   
>   out_free_roots:
> @@ -335,13 +349,17 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   		start = drm_buddy_block_offset(mm->roots[i]);
>   		__force_merge(mm, start, start + size, order);
>   
> -		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));

So does this warn not pop? Or it does but kunit ignores it or something?

>   		drm_block_free(mm, mm->roots[i]);
>   
>   		root_size = mm->chunk_size << order;
>   		size -= root_size;
>   	}
>   
> +	mm->in_use = false;
> +
> +	if (WARN_ON(!is_roots_freed(mm)))

This looks like UAF under normal operation, since each root pointer 
within mm->roots is already gone.

How about something like this:

+ #include <kunit/test-bug.h>
+
  #include <linux/kmemleak.h>
  #include <linux/module.h>
  #include <linux/sizes.h>
@@ -335,7 +337,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
                 start = drm_buddy_block_offset(mm->roots[i]);
                 __force_merge(mm, start, start + size, order);

-               WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
+               if (WARN_ON(!drm_buddy_block_is_free(mm->roots[i])))
+                       kunit_fail_current_test("buddy_fini() root");
+
                 drm_block_free(mm, mm->roots[i]);

                 root_size = mm->chunk_size << order;

And then also drop the in_use stuff. As a follow up could do that for 
all warnings in this file that don't result in error being returned to 
the caller...

> +		mm->in_use = true;
> +
>   	WARN_ON(mm->avail != mm->size);

...like this one.

 >   >   	kfree(mm->roots);
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 9662c949d0e3..694b058ddd6d 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -385,19 +385,31 @@ static void drm_test_buddy_alloc_clear(struct kunit *test)
>   	drm_buddy_fini(&mm);
>   
>   	/*
> -	 * Create a new mm with a non power-of-two size. Allocate a random size, free as
> -	 * cleared and then call fini. This will ensure the multi-root force merge during
> -	 * fini.
> +	 * Create a new mm with a non power-of-two size. Allocate a random size from each
> +	 * root, free as cleared and then call fini. This will ensure the multi-root
> +	 * force merge during fini.
>   	 */
> -	mm_size = 12 * SZ_4K;
> -	size = max(round_up(prandom_u32_state(&prng) % mm_size, ps), ps);
> +	mm_size = (SZ_4K << max_order) + (SZ_4K << (max_order - 2));
> +
>   	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
> -	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> -							    size, ps, &allocated,
> -							    DRM_BUDDY_TOPDOWN_ALLOCATION),
> -				"buddy_alloc hit an error size=%u\n", size);
> +	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K << max_order,
> +							    4 * ps, ps, &allocated,
> +							    DRM_BUDDY_RANGE_ALLOCATION),
> +				"buddy_alloc hit an error size=%lu\n", 4 * ps);
> +	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K << max_order,
> +							    2 * ps, ps, &allocated,
> +							    DRM_BUDDY_CLEAR_ALLOCATION),
> +				"buddy_alloc hit an error size=%lu\n", 2 * ps);
> +	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, SZ_4K << max_order, mm_size,
> +							    ps, ps, &allocated,
> +							    DRM_BUDDY_RANGE_ALLOCATION),
> +				"buddy_alloc hit an error size=%lu\n", ps);
>   	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>   	drm_buddy_fini(&mm);
> +	KUNIT_EXPECT_EQ(test, mm.in_use, false);
>   }
>   
>   static void drm_test_buddy_alloc_contiguous(struct kunit *test)
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 9689a7c5dd36..d692d831ffdd 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -86,6 +86,8 @@ struct drm_buddy {
>   	unsigned int n_roots;
>   	unsigned int max_order;
>   
> +	bool in_use;
> +
>   	/* Must be at least SZ_4K */
>   	u64 chunk_size;
>   	u64 size;

