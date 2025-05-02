Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F496AA74E2
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 16:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F2210E93D;
	Fri,  2 May 2025 14:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8lvIh9E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550CD10E93D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 14:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746195954; x=1777731954;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sMDIVEpmzzZsg8Vw0VMY7gk8A5TS0aYI5ic94kJp8rE=;
 b=H8lvIh9EpsWPY0ai14eO77NjaPg+iZh2VJbzJMraujCBRuOWvx+q5tEs
 /p5pZ8J6G3a4SAG/N86EmaLuhHy85etyR6ebxMyHB4teereaOpAXnQBOj
 W8dlYXA4sn9Ep4w5j30l8FkEPRg8XyYJ0jb39FhF02MVVJcu7zrK42Mrj
 KILEfCz9MTULOBvW6eBhZLtQ6MjGiPk1pNniFfjHq1dT76Bsd64zcvWOn
 tgOJ/tZJddUVWpM7yfBIopizqXdtZxELGAUWcMpqvJNxQhCgm9yAvC4Jb
 yofztbw9bYKy+MBOIsWFbivo5hviPb4Q0/p6T9jjK7a7sEIP5umCJlnK+ w==;
X-CSE-ConnectionGUID: Lmwlhr/0RxGzMoVqvPgusw==
X-CSE-MsgGUID: Z8riXtyMSuaCzXOzjJIR+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="59261846"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="59261846"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 07:25:54 -0700
X-CSE-ConnectionGUID: nePlqO1UReus5rdz7izWkQ==
X-CSE-MsgGUID: tXIfgF0SRwGLv7DYdsH0nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="139796751"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 02 May 2025 07:25:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uArKl-0004nV-0N;
 Fri, 02 May 2025 14:25:47 +0000
Date: Fri, 2 May 2025 22:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [PATCH 3/5] ttm: add initial memcg integration. (v2)
Message-ID: <202505022223.9sTn2H1l-lkp@intel.com>
References: <20250502034046.1625896-4-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502034046.1625896-4-airlied@gmail.com>
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on tj-cgroup/for-next]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.15-rc4]
[cannot apply to next-20250502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/memcg-add-hooks-for-gpu-memcg-charging-uncharging/20250502-123650
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20250502034046.1625896-4-airlied%40gmail.com
patch subject: [PATCH 3/5] ttm: add initial memcg integration. (v2)
config: arc-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250502/202505022223.9sTn2H1l-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505022223.9sTn2H1l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505022223.9sTn2H1l-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/tests/ttm_resource_test.c: In function 'ttm_sys_man_free_basic':
>> drivers/gpu/drm/ttm/tests/ttm_resource_test.c:305:39: error: passing argument 3 of 'ttm_resource_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     305 |         ttm_resource_alloc(bo, place, &res, NULL);
         |                                       ^~~~
         |                                       |
         |                                       struct ttm_resource **
   In file included from drivers/gpu/drm/ttm/tests/ttm_resource_test.c:5:
   include/drm/ttm/ttm_resource.h:450:50: note: expected 'struct ttm_operation_ctx *' but argument is of type 'struct ttm_resource **'
     450 |                        struct ttm_operation_ctx *ctx,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/ttm/tests/ttm_resource_test.c:305:9: error: too few arguments to function 'ttm_resource_alloc'
     305 |         ttm_resource_alloc(bo, place, &res, NULL);
         |         ^~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:448:5: note: declared here
     448 | int ttm_resource_alloc(struct ttm_buffer_object *bo,
         |     ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c: In function 'ttm_bo_validate_no_placement_signaled':
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:545:45: error: passing argument 3 of 'ttm_resource_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     545 |         err = ttm_resource_alloc(bo, place, &bo->resource, NULL);
         |                                             ^~~~~~~~~~~~~
         |                                             |
         |                                             struct ttm_resource **
   In file included from drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:8:
   include/drm/ttm/ttm_resource.h:450:50: note: expected 'struct ttm_operation_ctx *' but argument is of type 'struct ttm_resource **'
     450 |                        struct ttm_operation_ctx *ctx,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:545:15: error: too few arguments to function 'ttm_resource_alloc'
     545 |         err = ttm_resource_alloc(bo, place, &bo->resource, NULL);
         |               ^~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:448:5: note: declared here
     448 | int ttm_resource_alloc(struct ttm_buffer_object *bo,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c: In function 'ttm_bo_validate_no_placement_not_signaled':
   drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:606:45: error: passing argument 3 of 'ttm_resource_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     606 |         err = ttm_resource_alloc(bo, place, &bo->resource, NULL);
         |                                             ^~~~~~~~~~~~~
         |                                             |
         |                                             struct ttm_resource **
   include/drm/ttm/ttm_resource.h:450:50: note: expected 'struct ttm_operation_ctx *' but argument is of type 'struct ttm_resource **'
     450 |                        struct ttm_operation_ctx *ctx,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:606:15: error: too few arguments to function 'ttm_resource_alloc'
     606 |         err = ttm_resource_alloc(bo, place, &bo->resource, NULL);
         |               ^~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:448:5: note: declared here
     448 | int ttm_resource_alloc(struct ttm_buffer_object *bo,
         |     ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_unreserve_basic':
>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:261:45: error: passing argument 3 of 'ttm_resource_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     261 |         err = ttm_resource_alloc(bo, place, &res1, NULL);
         |                                             ^~~~~
         |                                             |
         |                                             struct ttm_resource **
   In file included from drivers/gpu/drm/ttm/tests/ttm_bo_test.c:13:
   include/drm/ttm/ttm_resource.h:450:50: note: expected 'struct ttm_operation_ctx *' but argument is of type 'struct ttm_resource **'
     450 |                        struct ttm_operation_ctx *ctx,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:261:15: error: too few arguments to function 'ttm_resource_alloc'
     261 |         err = ttm_resource_alloc(bo, place, &res1, NULL);
         |               ^~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:448:5: note: declared here
     448 | int ttm_resource_alloc(struct ttm_buffer_object *bo,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:267:39: error: passing argument 3 of 'ttm_resource_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     267 |         ttm_resource_alloc(bo, place, &res2, NULL);
         |                                       ^~~~~
         |                                       |
         |                                       struct ttm_resource **
   include/drm/ttm/ttm_resource.h:450:50: note: expected 'struct ttm_operation_ctx *' but argument is of type 'struct ttm_resource **'
     450 |                        struct ttm_operation_ctx *ctx,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:267:9: error: too few arguments to function 'ttm_resource_alloc'
     267 |         ttm_resource_alloc(bo, place, &res2, NULL);
         |         ^~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:448:5: note: declared here
     448 | int ttm_resource_alloc(struct ttm_buffer_object *bo,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_unreserve_pinned':
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:303:45: error: passing argument 3 of 'ttm_resource_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     303 |         err = ttm_resource_alloc(bo, place, &res1, NULL);
         |                                             ^~~~~
         |                                             |
         |                                             struct ttm_resource **
   include/drm/ttm/ttm_resource.h:450:50: note: expected 'struct ttm_operation_ctx *' but argument is of type 'struct ttm_resource **'
     450 |                        struct ttm_operation_ctx *ctx,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:303:15: error: too few arguments to function 'ttm_resource_alloc'
     303 |         err = ttm_resource_alloc(bo, place, &res1, NULL);
         |               ^~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:448:5: note: declared here
     448 | int ttm_resource_alloc(struct ttm_buffer_object *bo,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:308:45: error: passing argument 3 of 'ttm_resource_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     308 |         err = ttm_resource_alloc(bo, place, &res2, NULL);
         |                                             ^~~~~
         |                                             |
         |                                             struct ttm_resource **
   include/drm/ttm/ttm_resource.h:450:50: note: expected 'struct ttm_operation_ctx *' but argument is of type 'struct ttm_resource **'
     450 |                        struct ttm_operation_ctx *ctx,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:308:15: error: too few arguments to function 'ttm_resource_alloc'
     308 |         err = ttm_resource_alloc(bo, place, &res2, NULL);
         |               ^~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:448:5: note: declared here
     448 | int ttm_resource_alloc(struct ttm_buffer_object *bo,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_unreserve_bulk':
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:358:46: error: passing argument 3 of 'ttm_resource_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     358 |         err = ttm_resource_alloc(bo1, place, &res1, NULL);
         |                                              ^~~~~
         |                                              |
         |                                              struct ttm_resource **
   include/drm/ttm/ttm_resource.h:450:50: note: expected 'struct ttm_operation_ctx *' but argument is of type 'struct ttm_resource **'
     450 |                        struct ttm_operation_ctx *ctx,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:358:15: error: too few arguments to function 'ttm_resource_alloc'
     358 |         err = ttm_resource_alloc(bo1, place, &res1, NULL);
         |               ^~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:448:5: note: declared here
     448 | int ttm_resource_alloc(struct ttm_buffer_object *bo,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:366:46: error: passing argument 3 of 'ttm_resource_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     366 |         err = ttm_resource_alloc(bo2, place, &res2, NULL);
         |                                              ^~~~~
         |                                              |
         |                                              struct ttm_resource **
   include/drm/ttm/ttm_resource.h:450:50: note: expected 'struct ttm_operation_ctx *' but argument is of type 'struct ttm_resource **'
     450 |                        struct ttm_operation_ctx *ctx,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:366:15: error: too few arguments to function 'ttm_resource_alloc'
     366 |         err = ttm_resource_alloc(bo2, place, &res2, NULL);
         |               ^~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:448:5: note: declared here
     448 | int ttm_resource_alloc(struct ttm_buffer_object *bo,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_put_basic':
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:404:45: error: passing argument 3 of 'ttm_resource_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     404 |         err = ttm_resource_alloc(bo, place, &res, NULL);
         |                                             ^~~~
         |                                             |
         |                                             struct ttm_resource **
   include/drm/ttm/ttm_resource.h:450:50: note: expected 'struct ttm_operation_ctx *' but argument is of type 'struct ttm_resource **'
     450 |                        struct ttm_operation_ctx *ctx,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:404:15: error: too few arguments to function 'ttm_resource_alloc'
     404 |         err = ttm_resource_alloc(bo, place, &res, NULL);
         |               ^~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:448:5: note: declared here
     448 | int ttm_resource_alloc(struct ttm_buffer_object *bo,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_pin_unpin_resource':
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:521:45: error: passing argument 3 of 'ttm_resource_alloc' from incompatible pointer type [-Werror=incompatible-pointer-types]
     521 |         err = ttm_resource_alloc(bo, place, &res, NULL);
         |                                             ^~~~
         |                                             |
         |                                             struct ttm_resource **
   include/drm/ttm/ttm_resource.h:450:50: note: expected 'struct ttm_operation_ctx *' but argument is of type 'struct ttm_resource **'
     450 |                        struct ttm_operation_ctx *ctx,


vim +/ttm_resource_alloc +305 drivers/gpu/drm/ttm/tests/ttm_resource_test.c

9afc1e0aa4851e Karolina Stolarek 2023-11-29  288  
9afc1e0aa4851e Karolina Stolarek 2023-11-29  289  static void ttm_sys_man_free_basic(struct kunit *test)
9afc1e0aa4851e Karolina Stolarek 2023-11-29  290  {
9afc1e0aa4851e Karolina Stolarek 2023-11-29  291  	struct ttm_resource_test_priv *priv = test->priv;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  292  	struct ttm_resource_manager *man;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  293  	struct ttm_buffer_object *bo;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  294  	struct ttm_place *place;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  295  	struct ttm_resource *res;
07430fa5248964 Karolina Stolarek 2024-06-12  296  	u32 mem_type = TTM_PL_SYSTEM;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  297  
9afc1e0aa4851e Karolina Stolarek 2023-11-29  298  	ttm_init_test_mocks(test, priv, mem_type, 0);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  299  	bo = priv->bo;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  300  	place = priv->place;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  301  
9afc1e0aa4851e Karolina Stolarek 2023-11-29  302  	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  303  	KUNIT_ASSERT_NOT_NULL(test, res);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  304  
2b624a2c18656e Maarten Lankhorst 2024-12-04 @305  	ttm_resource_alloc(bo, place, &res, NULL);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  306  
9afc1e0aa4851e Karolina Stolarek 2023-11-29  307  	man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  308  	man->func->free(man, res);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  309  
9afc1e0aa4851e Karolina Stolarek 2023-11-29  310  	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
9afc1e0aa4851e Karolina Stolarek 2023-11-29  311  	KUNIT_ASSERT_EQ(test, man->usage, 0);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  312  }
9afc1e0aa4851e Karolina Stolarek 2023-11-29  313  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
