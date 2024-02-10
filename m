Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7DC8505CE
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 18:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0F010E750;
	Sat, 10 Feb 2024 17:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHIHXamE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC7B10E853
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 17:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707587737; x=1739123737;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=VfspoZeLDw+gMbfpb+YortTTyn8kYXp16ONGeZ2wWcg=;
 b=HHIHXamECxeUsqufewyzencKql4CnMlOgxa1htoIo8TFs9UU7oIE9oaf
 dXhQbC6UYLEfsGSHguNvTEhbNjZP/qTolCLNNsgmRVzr9ePst8iowOQqb
 stU8vwZfPai99h5cOy2cAI1z6wrZ/jn/mBDPD6hSB8F8K2GlmpuHdJUpC
 9ei3pPaufjwaTRIcF3/lgO9mPMjNN7F87wxoq8WMOSti+V+Ouq5DUBGzZ
 f7YEm/wiGAHDO53dLFIvPu8hMkaCS0bnoc7boBvy/+QhK0gBCpYtD1Y4i
 4bvGcsvalvoCAgg6tnurceMQJRQRYp+YxdE9YzsPQyLqPZCnvqDCj6vAo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="24049932"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; d="scan'208";a="24049932"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2024 09:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; d="scan'208";a="32991309"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 10 Feb 2024 09:55:33 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rYrZb-0005wQ-1c;
 Sat, 10 Feb 2024 17:55:31 +0000
Date: Sun, 11 Feb 2024 01:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>
Subject: [drm-misc:for-linux-next 49/49]
 drivers/gpu/drm/tests/drm_mm_test.c:191:32: error: implicit declaration of
 function 'drm_debug_printer'; did you mean 'drm_dbg_printer'?
Message-ID: <202402110116.HJg3I4nn-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   7edd06233958d9086a9e3eb723a8768d3c5a9ce1
commit: e154c4fc7bf2d5c3f86d07628ab1cb03e8085c25 [49/49] drm: remove drm_debug_printer in favor of drm_dbg_printer
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240211/202402110116.HJg3I4nn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110116.HJg3I4nn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110116.HJg3I4nn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tests/drm_mm_test.c: In function 'drm_test_mm_debug':
>> drivers/gpu/drm/tests/drm_mm_test.c:191:32: error: implicit declaration of function 'drm_debug_printer'; did you mean 'drm_dbg_printer'? [-Werror=implicit-function-declaration]
     191 |         struct drm_printer p = drm_debug_printer(test->name);
         |                                ^~~~~~~~~~~~~~~~~
         |                                drm_dbg_printer
>> drivers/gpu/drm/tests/drm_mm_test.c:191:32: error: invalid initializer
   cc1: some warnings being treated as errors


vim +191 drivers/gpu/drm/tests/drm_mm_test.c

393b50f30566ba drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  188  
961bcdf956a464 drivers/gpu/drm/tests/drm_mm_test.c     Maíra Canal      2022-09-11  189  static void drm_test_mm_debug(struct kunit *test)
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  190  {
3eb791c891aa91 drivers/gpu/drm/tests/drm_mm_test.c     Michał Winiarski 2024-01-16 @191  	struct drm_printer p = drm_debug_printer(test->name);
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  192  	struct drm_mm mm;
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  193  	struct drm_mm_node nodes[2];
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  194  
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  195  	/* Create a small drm_mm with a couple of nodes and a few holes, and
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  196  	 * check that the debug iterator doesn't explode over a trivial drm_mm.
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  197  	 */
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  198  	drm_mm_init(&mm, 0, 4096);
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  199  
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  200  	memset(nodes, 0, sizeof(nodes));
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  201  	nodes[0].start = 512;
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  202  	nodes[0].size = 1024;
fc8d29e298cf47 drivers/gpu/drm/tests/drm_mm_test.c     Arthur Grillo    2022-07-08  203  	KUNIT_ASSERT_FALSE_MSG(test, drm_mm_reserve_node(&mm, &nodes[0]),
fc8d29e298cf47 drivers/gpu/drm/tests/drm_mm_test.c     Arthur Grillo    2022-07-08  204  			       "failed to reserve node[0] {start=%lld, size=%lld)\n",
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  205  			       nodes[0].start, nodes[0].size);
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  206  
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  207  	nodes[1].size = 1024;
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  208  	nodes[1].start = 4096 - 512 - nodes[1].size;
fc8d29e298cf47 drivers/gpu/drm/tests/drm_mm_test.c     Arthur Grillo    2022-07-08  209  	KUNIT_ASSERT_FALSE_MSG(test, drm_mm_reserve_node(&mm, &nodes[1]),
fc8d29e298cf47 drivers/gpu/drm/tests/drm_mm_test.c     Arthur Grillo    2022-07-08  210  			       "failed to reserve node[0] {start=%lld, size=%lld)\n",
fc8d29e298cf47 drivers/gpu/drm/tests/drm_mm_test.c     Arthur Grillo    2022-07-08  211  			       nodes[0].start, nodes[0].size);
3eb791c891aa91 drivers/gpu/drm/tests/drm_mm_test.c     Michał Winiarski 2024-01-16  212  
3eb791c891aa91 drivers/gpu/drm/tests/drm_mm_test.c     Michał Winiarski 2024-01-16  213  	drm_mm_print(&mm, &p);
3eb791c891aa91 drivers/gpu/drm/tests/drm_mm_test.c     Michał Winiarski 2024-01-16  214  	KUNIT_SUCCEED(test);
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  215  }
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  216  

:::::: The code at line 191 was first introduced by commit
:::::: 3eb791c891aa91603a5fbbfea940f8acf5f17d45 drm/tests: mm: Call drm_mm_print in drm_test_mm_debug

:::::: TO: Michał Winiarski <michal.winiarski@intel.com>
:::::: CC: Maxime Ripard <mripard@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
