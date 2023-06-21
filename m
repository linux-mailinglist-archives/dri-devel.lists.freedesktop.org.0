Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3BB738B20
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2F410E202;
	Wed, 21 Jun 2023 16:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC22310E202
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687364895; x=1718900895;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lD08uLgUK9ZigDPBHDtgSA0rj18RciqVRTnE8VS7w1k=;
 b=boRO8UeOhE0YYswiADrGKFhGmPu3YvbR4MfrKcYM6ocD0ifQt35ap8gz
 VMN7V5q4Iz3xuZ1hftePALcwUUP9Gz39qxf+jJQMVSHI5L3qu8XT3ID6R
 OXMWi9HTxnkanjZCtHEC0ruSBFAB2FfdlVM5sstOOlmQ3ZP+WsBthmQay
 sX68hRH5ENwzJQ7W1K725uYb9tdI516kipLRvTwMNFMISZwqCf9eBqh6l
 N/NOujE5AVoofPa+c+zIg6SBV9c5ph7ZCC6npQphFynskUxblgyGF7Ll2
 DZtHvKHzyOzFoeB1KHUBkA6BAu57ePpLNLLjCqFFyo0EtOKAGFJt88/D/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360241097"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="360241097"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 09:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="859040594"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="859040594"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2023 09:28:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qC0gl-0006wT-1v;
 Wed, 21 Jun 2023 16:28:11 +0000
Date: Thu, 22 Jun 2023 00:27:26 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 thomas_os@shipmail.org, boris.brezillon@collabora.com,
 arunpravin.paneerselvam@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm: add drm_exec selftests v4
Message-ID: <202306220013.JRZDDrkO-lkp@intel.com>
References: <20230621133700.7588-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621133700.7588-2-christian.koenig@amd.com>
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.4-rc7 next-20230621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-add-drm_exec-selftests-v4/20230621-213827
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230621133700.7588-2-christian.koenig%40amd.com
patch subject: [PATCH 2/2] drm: add drm_exec selftests v4
config: hexagon-randconfig-r015-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220013.JRZDDrkO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220013.JRZDDrkO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220013.JRZDDrkO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_exec_test.c:134:2: warning: variable '__drm_exec_retry_ptr' set but not used [-Wunused-but-set-variable]
     134 |         drm_exec_until_all_locked(&exec)
         |         ^
   include/drm/drm_exec.h:78:13: note: expanded from macro 'drm_exec_until_all_locked'
      78 |         for (void *__drm_exec_retry_ptr; ({                     \
         |                    ^
   1 warning generated.


vim +/__drm_exec_retry_ptr +134 drivers/gpu/drm/tests/drm_exec_test.c

   121	
   122	static void test_prepare_array(struct kunit *test)
   123	{
   124		struct drm_gem_object gobj1 = { };
   125		struct drm_gem_object gobj2 = { };
   126		struct drm_gem_object *array[] = { &gobj1, &gobj2 };
   127		struct drm_exec exec;
   128		int ret;
   129	
   130		drm_gem_private_object_init(&dev, &gobj1, PAGE_SIZE);
   131		drm_gem_private_object_init(&dev, &gobj2, PAGE_SIZE);
   132	
   133		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 > 134		drm_exec_until_all_locked(&exec)
   135			ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
   136						     1);
   137		KUNIT_EXPECT_EQ(test, ret, 0);
   138		drm_exec_fini(&exec);
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
