Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23238A8527
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B507C11353A;
	Wed, 17 Apr 2024 13:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ah5XqZkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DDF113535;
 Wed, 17 Apr 2024 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713361581; x=1744897581;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6Y3I7dMu0CHkT1MGFZPqzXREn5uyDxUsVpGjUEs2n8Y=;
 b=Ah5XqZkwV8DL5ZpkkXi3nQ77bdsAN+AeuTqp81J5TqGyFKy/ewz7sO8F
 i5bHRzHUnf6wic2dxeNJEcmhxDk3lzZDu58+8CDUU9S/m7m2MpHMVYzqO
 WP/LDGR3STghTNoCxH1ZpPdzGnuFRA43XbqVqh5UletD4sQ9vNTGmKLew
 SCq1JYM050cxhtZ22EhGa0r+5oqMoFi+gttxuPJ340Y3EBN/wJf53GBmc
 bLjqLBx6VfJl+4YQaSzZ97BzlWBzkk/C3XP+BjTWPCUh5ujV//6thj8w2
 rT6CweoZzwa2cL7FV7WrFXZ1b5613z9gbMvzQ7lo9/Zg6Klvq8J430h5y Q==;
X-CSE-ConnectionGUID: ghiH8f/6So+nFFbjQWEXWA==
X-CSE-MsgGUID: +qsIn5KbTnSb4T8gbSmw1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8777665"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8777665"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:46:21 -0700
X-CSE-ConnectionGUID: xY2rl+WLTr65nyI9RjioFA==
X-CSE-MsgGUID: BeOiUiAbSqyXW5WcmhAKCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="23221560"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 17 Apr 2024 06:46:19 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rx5c8-0006do-0M;
 Wed, 17 Apr 2024 13:46:16 +0000
Date: Wed, 17 Apr 2024 21:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 9/9] drm/xe: Add a shrinker for xe bos
Message-ID: <202404172100.qxirErE7-lkp@intel.com>
References: <20240416100730.6666-10-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416100730.6666-10-thomas.hellstrom@linux.intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.9-rc4 next-20240417]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240416-181717
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240416100730.6666-10-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v2 9/9] drm/xe: Add a shrinker for xe bos
config: powerpc-randconfig-001-20240417 (https://download.01.org/0day-ci/archive/20240417/202404172100.qxirErE7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404172100.qxirErE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404172100.qxirErE7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from include/drm/ttm/ttm_tt.h:30,
                    from drivers/gpu/drm/xe/xe_bo.h:9,
                    from drivers/gpu/drm/xe/xe_bo.c:6:
   drivers/gpu/drm/xe/tests/xe_bo.c: In function 'shrink_test_run_device':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/kunit/test.h:527:17: note: in expansion of macro 'printk'
     527 |                 printk(lvl fmt, ##__VA_ARGS__);                         \
         |                 ^~~~~~
   include/kunit/test.h:533:9: note: in expansion of macro 'kunit_log'
     533 |         kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
         |         ^~~~~~~~~
   include/kunit/test.h:546:9: note: in expansion of macro 'kunit_printk'
     546 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/kunit/test.h:546:22: note: in expansion of macro 'KERN_INFO'
     546 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |                      ^~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_bo.c:381:9: note: in expansion of macro 'kunit_info'
     381 |         kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |         ^~~~~~~~~~
   In file included from drivers/gpu/drm/xe/tests/xe_bo.c:6,
                    from drivers/gpu/drm/xe/xe_bo.c:2420:
>> include/kunit/test.h:50:41: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      50 | #define KUNIT_SUBTEST_INDENT            "    "
         |                                         ^~~~~~
   include/kunit/test.h:528:57: note: in definition of macro 'kunit_log'
     528 |                 kunit_log_append((test_or_suite)->log,  fmt,            \
         |                                                         ^~~
   include/kunit/test.h:533:30: note: in expansion of macro 'KUNIT_SUBTEST_INDENT'
     533 |         kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
         |                              ^~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:546:9: note: in expansion of macro 'kunit_printk'
     546 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_bo.c:381:9: note: in expansion of macro 'kunit_info'
     381 |         kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |         ^~~~~~~~~~


vim +50 include/kunit/test.h

6d2426b2f258da David Gow        2021-06-24  43  
c3bba690a26432 Alan Maguire     2020-03-26  44  /*
c3bba690a26432 Alan Maguire     2020-03-26  45   * TAP specifies subtest stream indentation of 4 spaces, 8 spaces for a
c3bba690a26432 Alan Maguire     2020-03-26  46   * sub-subtest.  See the "Subtests" section in
c3bba690a26432 Alan Maguire     2020-03-26  47   * https://node-tap.org/tap-protocol/
c3bba690a26432 Alan Maguire     2020-03-26  48   */
b1eaa8b2a55c9d Michal Wajdeczko 2023-05-17  49  #define KUNIT_INDENT_LEN		4
c3bba690a26432 Alan Maguire     2020-03-26 @50  #define KUNIT_SUBTEST_INDENT		"    "
c3bba690a26432 Alan Maguire     2020-03-26  51  #define KUNIT_SUBSUBTEST_INDENT		"        "
c3bba690a26432 Alan Maguire     2020-03-26  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
