Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85120A127FF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 16:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7143E10E772;
	Wed, 15 Jan 2025 15:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+de3O35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F65010E762
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736956780; x=1768492780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8vlFs6tJAMXQftSFTlBcg1lsGzojXUysHpzJICY1Hns=;
 b=j+de3O35jP1B+2k432CxG9v09bO8zJUW+/ioFJ3hC+7cYGF9+vSjZE8q
 Wb0FR+yRPmV5gYDi6L8LaD8IUmssj+EAdbasbVo0CNZD2+7RfMpafFpCE
 /hE76VtgxQu10w1brwegMfb5ZrCdB24DupWarSFeddeyIrw1B0TCgVb2/
 QlXe47LD5T4WfSd0KCcSr5XHnom6MrbVz1JbZI3KDGTzL3eIdH36XGkpg
 ckwdX9JlT0o/PPD8EHijAplDrqTd1+8dGzxjw8n5pX3ZK3eTeGC7Vc73j
 Ah9GRj3fMQjRlBWWf48PyK/uCA8lpeR/Z7krSqc/Crtc38D8RJxMpqFeR w==;
X-CSE-ConnectionGUID: pbXflFmKRoe8smQy+L3T1Q==
X-CSE-MsgGUID: Nswp6d/eRA6LR9yBF2gIXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41234507"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="41234507"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:59:39 -0800
X-CSE-ConnectionGUID: 6HPW/xJ8SiaECSXZrip+rw==
X-CSE-MsgGUID: bhqepUMcRtmWFrVbJywAzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="105125000"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 15 Jan 2025 07:59:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tY5nq-000QXj-36;
 Wed, 15 Jan 2025 15:59:34 +0000
Date: Wed, 15 Jan 2025 23:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jani Nikula <jani.nikula@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/tests/buddy: fix build with unused prng
Message-ID: <202501152356.FZ1YODaP-lkp@intel.com>
References: <20250115123734.154243-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115123734.154243-2-matthew.auld@intel.com>
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

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next linus/master drm-misc/drm-misc-next v6.13-rc7 next-20250115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/drm-tests-buddy-fix-build-with-unused-prng/20250115-204228
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250115123734.154243-2-matthew.auld%40intel.com
patch subject: [PATCH] drm/tests/buddy: fix build with unused prng
config: i386-buildonly-randconfig-001-20250115 (https://download.01.org/0day-ci/archive/20250115/202501152356.FZ1YODaP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501152356.FZ1YODaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501152356.FZ1YODaP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_buddy_test.c:392:41: error: use of undeclared identifier 'prng'
     392 |         size = max(round_up(prandom_u32_state(&prng) % mm_size, ps), ps);
         |                                                ^
>> drivers/gpu/drm/tests/drm_buddy_test.c:392:41: error: use of undeclared identifier 'prng'
>> drivers/gpu/drm/tests/drm_buddy_test.c:392:41: error: use of undeclared identifier 'prng'
>> drivers/gpu/drm/tests/drm_buddy_test.c:392:41: error: use of undeclared identifier 'prng'
>> drivers/gpu/drm/tests/drm_buddy_test.c:392:41: error: use of undeclared identifier 'prng'
>> drivers/gpu/drm/tests/drm_buddy_test.c:392:41: error: use of undeclared identifier 'prng'
   6 errors generated.


vim +/prng +392 drivers/gpu/drm/tests/drm_buddy_test.c

c70703320e557f Matthew Auld             2024-02-19  260  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  261  static void drm_test_buddy_alloc_clear(struct kunit *test)
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  262  {
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  263  	unsigned long n_pages, total, i = 0;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  264  	const unsigned long ps = SZ_4K;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  265  	struct drm_buddy_block *block;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  266  	const int max_order = 12;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  267  	LIST_HEAD(allocated);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  268  	struct drm_buddy mm;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  269  	unsigned int order;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  270  	u32 mm_size, size;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  271  	LIST_HEAD(dirty);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  272  	LIST_HEAD(clean);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  273  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  274  	mm_size = SZ_4K << max_order;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  275  	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  276  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  277  	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  278  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  279  	/*
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  280  	 * Idea is to allocate and free some random portion of the address space,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  281  	 * returning those pages as non-dirty and randomly alternate between
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  282  	 * requesting dirty and non-dirty pages (not going over the limit
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  283  	 * we freed as non-dirty), putting that into two separate lists.
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  284  	 * Loop over both lists at the end checking that the dirty list
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  285  	 * is indeed all dirty pages and vice versa. Free it all again,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  286  	 * keeping the dirty/clear status.
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  287  	 */
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  288  	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  289  							    5 * ps, ps, &allocated,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  290  							    DRM_BUDDY_TOPDOWN_ALLOCATION),
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  291  				"buddy_alloc hit an error size=%lu\n", 5 * ps);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  292  	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  293  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  294  	n_pages = 10;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  295  	do {
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  296  		unsigned long flags;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  297  		struct list_head *list;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  298  		int slot = i % 2;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  299  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  300  		if (slot == 0) {
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  301  			list = &dirty;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  302  			flags = 0;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  303  		} else {
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  304  			list = &clean;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  305  			flags = DRM_BUDDY_CLEAR_ALLOCATION;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  306  		}
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  307  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  308  		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  309  								    ps, ps, list,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  310  								    flags),
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  311  					"buddy_alloc hit an error size=%lu\n", ps);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  312  	} while (++i < n_pages);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  313  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  314  	list_for_each_entry(block, &clean, link)
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  315  		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), true);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  316  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  317  	list_for_each_entry(block, &dirty, link)
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  318  		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  319  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  320  	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  321  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  322  	/*
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  323  	 * Trying to go over the clear limit for some allocation.
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  324  	 * The allocation should never fail with reasonable page-size.
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  325  	 */
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  326  	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  327  							    10 * ps, ps, &clean,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  328  							    DRM_BUDDY_CLEAR_ALLOCATION),
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  329  				"buddy_alloc hit an error size=%lu\n", 10 * ps);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  330  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  331  	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  332  	drm_buddy_free_list(&mm, &dirty, 0);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  333  	drm_buddy_fini(&mm);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  334  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  335  	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  336  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  337  	/*
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  338  	 * Create a new mm. Intentionally fragment the address space by creating
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  339  	 * two alternating lists. Free both lists, one as dirty the other as clean.
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  340  	 * Try to allocate double the previous size with matching min_page_size. The
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  341  	 * allocation should never fail as it calls the force_merge. Also check that
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  342  	 * the page is always dirty after force_merge. Free the page as dirty, then
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  343  	 * repeat the whole thing, increment the order until we hit the max_order.
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  344  	 */
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  345  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  346  	i = 0;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  347  	n_pages = mm_size / ps;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  348  	do {
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  349  		struct list_head *list;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  350  		int slot = i % 2;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  351  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  352  		if (slot == 0)
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  353  			list = &dirty;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  354  		else
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  355  			list = &clean;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  356  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  357  		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  358  								    ps, ps, list, 0),
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  359  					"buddy_alloc hit an error size=%lu\n", ps);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  360  	} while (++i < n_pages);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  361  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  362  	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  363  	drm_buddy_free_list(&mm, &dirty, 0);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  364  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  365  	order = 1;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  366  	do {
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  367  		size = SZ_4K << order;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  368  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  369  		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  370  								    size, size, &allocated,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  371  								    DRM_BUDDY_CLEAR_ALLOCATION),
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  372  					"buddy_alloc hit an error size=%u\n", size);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  373  		total = 0;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  374  		list_for_each_entry(block, &allocated, link) {
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  375  			if (size != mm_size)
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  376  				KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  377  			total += drm_buddy_block_size(&mm, block);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  378  		}
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  379  		KUNIT_EXPECT_EQ(test, total, size);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  380  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  381  		drm_buddy_free_list(&mm, &allocated, 0);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  382  	} while (++order <= max_order);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  383  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  384  	drm_buddy_fini(&mm);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  385  
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  386  	/*
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  387  	 * Create a new mm with a non power-of-two size. Allocate a random size, free as
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  388  	 * cleared and then call fini. This will ensure the multi-root force merge during
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  389  	 * fini.
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  390  	 */
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  391  	mm_size = 12 * SZ_4K;
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19 @392  	size = max(round_up(prandom_u32_state(&prng) % mm_size, ps), ps);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  393  	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  394  	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  395  							    size, ps, &allocated,
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  396  							    DRM_BUDDY_TOPDOWN_ALLOCATION),
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  397  				"buddy_alloc hit an error size=%u\n", size);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  398  	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  399  	drm_buddy_fini(&mm);
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  400  }
c1696bf8d5f538 Arunpravin Paneer Selvam 2024-04-19  401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
