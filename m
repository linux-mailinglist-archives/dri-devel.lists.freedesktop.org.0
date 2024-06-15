Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E919D90969D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 09:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D77D10E2DB;
	Sat, 15 Jun 2024 07:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dc0xqPkS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DB510E2DC;
 Sat, 15 Jun 2024 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718437551; x=1749973551;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2QWp218TQ6iL7oCIb+G2RdY0JWngZV8m5mtrDf5uuHI=;
 b=Dc0xqPkSqiH3KMJPi5b/K+NX8YRCGPMRIvqzy9WNIsFXQr47ANjLmRs9
 8wEfvJvRXxNZHEQycK/FFDBTJmFyBF7/bFjUqtINtUUWm0Lb7ZDvre7v7
 rzNWLLuiElYYuwf+Y53VokeroXyRD2fAJoV4jCiGfpzr4OluM60YGhc8o
 bLL49t64s0hXhKEKKKNXVWp/P5fP4JIvlq3e/pimwqiAbRfECP4sXx7+A
 XJz0K1dsfkUfwvWFzjnRyA7SqoH8vRkg68NYZC20Yz/o8QhGQHmB+CXc8
 OX/pO4zC8nnK1z6i3vFTdy0bpS/9VuGVfGlMe0NP9QmavwVn6Ni260wdb w==;
X-CSE-ConnectionGUID: uywWAcUIRCiSCDCQ0I6+jg==
X-CSE-MsgGUID: IFTFWReIQruWr6nkW5k1tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="40750871"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; d="scan'208";a="40750871"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2024 00:45:51 -0700
X-CSE-ConnectionGUID: fF81jBCoQIqBE5HIZGhZ+g==
X-CSE-MsgGUID: U2oIDit8R3W6fV2+v0COoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; d="scan'208";a="40579094"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2024 00:45:48 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sIO6c-0002Kl-19;
 Sat, 15 Jun 2024 07:45:46 +0000
Date: Sat, 15 Jun 2024 15:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 01/12] drm/ttm: Allow TTM LRU list nodes of different
 types
Message-ID: <202406151512.Smo5bzLx-lkp@intel.com>
References: <20240614102548.4364-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614102548.4364-2-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on linus/master v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240614-182911
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240614102548.4364-2-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v4 01/12] drm/ttm: Allow TTM LRU list nodes of different types
config: loongarch-randconfig-001-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151512.Smo5bzLx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151512.Smo5bzLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151512.Smo5bzLx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/drm/ttm/ttm_resource.h:29,
                    from drivers/gpu/drm/ttm/tests/ttm_resource_test.c:5:
   drivers/gpu/drm/ttm/tests/ttm_resource_test.c: In function 'ttm_resource_fini_basic':
>> drivers/gpu/drm/ttm/tests/ttm_resource_test.c:201:44: error: passing argument 1 of 'list_empty' from incompatible pointer type [-Werror=incompatible-pointer-types]
     201 |         KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
         |                                            ^~~~~~~~~
         |                                            |
         |                                            struct ttm_lru_item *
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:668:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     668 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1232:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
    1232 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1229:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE_MSG'
    1229 |         KUNIT_ASSERT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_resource_test.c:201:9: note: in expansion of macro 'KUNIT_ASSERT_TRUE'
     201 |         KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
         |         ^~~~~~~~~~~~~~~~~
   include/linux/list.h:371:54: note: expected 'const struct list_head *' but argument is of type 'struct ttm_lru_item *'
     371 | static inline int list_empty(const struct list_head *head)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors
--
   In file included from include/drm/drm_kunit_helpers.h:10,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:13,
                    from drivers/gpu/drm/ttm/tests/ttm_bo_test.c:17:
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_unreserve_basic':
>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:268:38: error: passing argument 1 of 'list_is_last' from incompatible pointer type [-Werror=incompatible-pointer-types]
     268 |                         list_is_last(&res1->lru, &man->lru[bo->priority]), 1);
         |                                      ^~~~~~~~~~
         |                                      |
         |                                      struct ttm_lru_item *
   include/kunit/test.h:707:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     707 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1271:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1271 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1268:9: note: in expansion of macro 'KUNIT_ASSERT_EQ_MSG'
    1268 |         KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:267:9: note: in expansion of macro 'KUNIT_ASSERT_EQ'
     267 |         KUNIT_ASSERT_EQ(test,
         |         ^~~~~~~~~~~~~~~
   In file included from include/linux/mutex.h:15,
                    from include/linux/ww_mutex.h:20,
                    from include/linux/dma-resv.h:42,
                    from drivers/gpu/drm/ttm/tests/ttm_bo_test.c:5:
   include/linux/list.h:352:56: note: expected 'const struct list_head *' but argument is of type 'struct ttm_lru_item *'
     352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:268:38: error: passing argument 1 of 'list_is_last' from incompatible pointer type [-Werror=incompatible-pointer-types]
     268 |                         list_is_last(&res1->lru, &man->lru[bo->priority]), 1);
         |                                      ^~~~~~~~~~
         |                                      |
         |                                      struct ttm_lru_item *
   include/kunit/test.h:707:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     707 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1271:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1271 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1268:9: note: in expansion of macro 'KUNIT_ASSERT_EQ_MSG'
    1268 |         KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:267:9: note: in expansion of macro 'KUNIT_ASSERT_EQ'
     267 |         KUNIT_ASSERT_EQ(test,
         |         ^~~~~~~~~~~~~~~
   include/linux/list.h:352:56: note: expected 'const struct list_head *' but argument is of type 'struct ttm_lru_item *'
     352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_unreserve_pinned':
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:305:38: error: passing argument 1 of 'list_is_last' from incompatible pointer type [-Werror=incompatible-pointer-types]
     305 |                         list_is_last(&res2->lru, &priv->ttm_dev->pinned), 1);
         |                                      ^~~~~~~~~~
         |                                      |
         |                                      struct ttm_lru_item *
   include/kunit/test.h:707:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     707 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1271:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1271 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1268:9: note: in expansion of macro 'KUNIT_ASSERT_EQ_MSG'
    1268 |         KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:304:9: note: in expansion of macro 'KUNIT_ASSERT_EQ'
     304 |         KUNIT_ASSERT_EQ(test,
         |         ^~~~~~~~~~~~~~~
   include/linux/list.h:352:56: note: expected 'const struct list_head *' but argument is of type 'struct ttm_lru_item *'
     352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:305:38: error: passing argument 1 of 'list_is_last' from incompatible pointer type [-Werror=incompatible-pointer-types]
     305 |                         list_is_last(&res2->lru, &priv->ttm_dev->pinned), 1);
         |                                      ^~~~~~~~~~
         |                                      |
         |                                      struct ttm_lru_item *
   include/kunit/test.h:707:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     707 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1271:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1271 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1268:9: note: in expansion of macro 'KUNIT_ASSERT_EQ_MSG'
    1268 |         KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:304:9: note: in expansion of macro 'KUNIT_ASSERT_EQ'
     304 |         KUNIT_ASSERT_EQ(test,
         |         ^~~~~~~~~~~~~~~
   include/linux/list.h:352:56: note: expected 'const struct list_head *' but argument is of type 'struct ttm_lru_item *'
     352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:309:38: error: passing argument 1 of 'list_is_last' from incompatible pointer type [-Werror=incompatible-pointer-types]
     309 |                         list_is_last(&res1->lru, &priv->ttm_dev->pinned), 1);
         |                                      ^~~~~~~~~~
         |                                      |
         |                                      struct ttm_lru_item *
   include/kunit/test.h:707:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     707 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1271:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1271 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1268:9: note: in expansion of macro 'KUNIT_ASSERT_EQ_MSG'
    1268 |         KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:308:9: note: in expansion of macro 'KUNIT_ASSERT_EQ'
     308 |         KUNIT_ASSERT_EQ(test,
         |         ^~~~~~~~~~~~~~~
   include/linux/list.h:352:56: note: expected 'const struct list_head *' but argument is of type 'struct ttm_lru_item *'
     352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:309:38: error: passing argument 1 of 'list_is_last' from incompatible pointer type [-Werror=incompatible-pointer-types]
     309 |                         list_is_last(&res1->lru, &priv->ttm_dev->pinned), 1);
         |                                      ^~~~~~~~~~
         |                                      |
         |                                      struct ttm_lru_item *
   include/kunit/test.h:707:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     707 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1271:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1271 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1268:9: note: in expansion of macro 'KUNIT_ASSERT_EQ_MSG'
    1268 |         KUNIT_ASSERT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:308:9: note: in expansion of macro 'KUNIT_ASSERT_EQ'
     308 |         KUNIT_ASSERT_EQ(test,
         |         ^~~~~~~~~~~~~~~
   include/linux/list.h:352:56: note: expected 'const struct list_head *' but argument is of type 'struct ttm_lru_item *'
     352 | static inline int list_is_last(const struct list_head *list, const struct list_head *head)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +/list_empty +201 drivers/gpu/drm/ttm/tests/ttm_resource_test.c

9afc1e0aa4851e Karolina Stolarek 2023-11-29  180  
9afc1e0aa4851e Karolina Stolarek 2023-11-29  181  static void ttm_resource_fini_basic(struct kunit *test)
9afc1e0aa4851e Karolina Stolarek 2023-11-29  182  {
9afc1e0aa4851e Karolina Stolarek 2023-11-29  183  	struct ttm_resource_test_priv *priv = test->priv;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  184  	struct ttm_resource *res;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  185  	struct ttm_buffer_object *bo;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  186  	struct ttm_place *place;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  187  	struct ttm_resource_manager *man;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  188  
9afc1e0aa4851e Karolina Stolarek 2023-11-29  189  	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  190  	bo = priv->bo;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  191  	place = priv->place;
9afc1e0aa4851e Karolina Stolarek 2023-11-29  192  
9afc1e0aa4851e Karolina Stolarek 2023-11-29  193  	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  194  
9afc1e0aa4851e Karolina Stolarek 2023-11-29  195  	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  196  	KUNIT_ASSERT_NOT_NULL(test, res);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  197  
9afc1e0aa4851e Karolina Stolarek 2023-11-29  198  	ttm_resource_init(bo, place, res);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  199  	ttm_resource_fini(man, res);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  200  
9afc1e0aa4851e Karolina Stolarek 2023-11-29 @201  	KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
9afc1e0aa4851e Karolina Stolarek 2023-11-29  202  	KUNIT_ASSERT_EQ(test, man->usage, 0);
9afc1e0aa4851e Karolina Stolarek 2023-11-29  203  }
9afc1e0aa4851e Karolina Stolarek 2023-11-29  204  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
