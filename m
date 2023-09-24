Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2F7AC5F4
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 02:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B60310E0B9;
	Sun, 24 Sep 2023 00:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8989610E0B8;
 Sun, 24 Sep 2023 00:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695513917; x=1727049917;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=WSouqECPSPC84u3gkoW0+QEc4PoxoIKAeR7OAVLs05U=;
 b=b3POLp45cC4UtUPb4P7vcOoqard3AM+z8uNQ1p4T61PZxCQNvGPHpd4r
 xlwYV/3kb4DZpwGWZ35f5wJjsEQ74p4R4LY3HeFHjSznMhEfbpTwrjt7F
 BJeqz06JvIelI97614QpYxUehyb/d8uuEoxOrIRNHHWM/yegu5GK5oEBA
 dxHtCHb/6exOQHiv43Vz7l0nGFdD+XKUg7RFsa6UeCUWnN1dd2/nOw6zv
 Yu3FqanV+osG1nFd5FwBI/QAfrlfS0VF4sfqFz0NhOPdTRi1k7e2Nebqk
 pTs9sLNq82GLKd2lWn9/HHZsxShn477CPJe4kyYsBFLfyjhw0gpHlmXsU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="360454750"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; d="scan'208";a="360454750"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 17:05:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="783045923"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; d="scan'208";a="783045923"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 23 Sep 2023 17:05:14 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qkCca-00031B-1t;
 Sun, 24 Sep 2023 00:05:12 +0000
Date: Sun, 24 Sep 2023 08:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: John Harrison <John.C.Harrison@intel.com>
Subject: [drm-tip:drm-tip 4/6] arch/x86/include/asm/string_32.h:195:29:
 warning: '__builtin_memset' writing 16 bytes into a region of size 0
 overflows the destination
Message-ID: <202309240849.DfoxxSha-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   e1973de2c4516e9130157e538014e79c8aa57b41
commit: a59bb8e436a090adb48ed2723fd6864cd82bf8c8 [4/6] Merge remote-tracking branch 'drm-intel/drm-intel-gt-next' into drm-tip
config: i386-buildonly-randconfig-005-20230924 (https://download.01.org/0day-ci/archive/20230924/202309240849.DfoxxSha-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240849.DfoxxSha-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240849.DfoxxSha-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/string.h:3,
                    from include/linux/string.h:20,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/pm_runtime.h:11,
                    from drivers/gpu/drm/i915/gt/intel_rc6.c:6:
   In function 'rc6_res_reg_init',
       inlined from 'intel_rc6_init' at drivers/gpu/drm/i915/gt/intel_rc6.c:610:2:
>> arch/x86/include/asm/string_32.h:195:29: warning: '__builtin_memset' writing 16 bytes into a region of size 0 overflows the destination [-Wstringop-overflow=]
     195 | #define memset(s, c, count) __builtin_memset(s, c, count)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_rc6.c:584:9: note: in expansion of macro 'memset'
     584 |         memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
         |         ^~~~~~


vim +/__builtin_memset +195 arch/x86/include/asm/string_32.h

^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  186  
^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  187  #define __memset(s, c, count)				\
78d64fc21d2aa4 include/asm-x86/string_32.h      Joe Perches      2008-05-12  188  	(__builtin_constant_p(count)			\
78d64fc21d2aa4 include/asm-x86/string_32.h      Joe Perches      2008-05-12  189  	 ? __constant_count_memset((s), (c), (count))	\
78d64fc21d2aa4 include/asm-x86/string_32.h      Joe Perches      2008-05-12  190  	 : __memset_generic((s), (c), (count)))
^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  191  
^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  192  #define __HAVE_ARCH_MEMSET
6974f0c4555e28 arch/x86/include/asm/string_32.h Daniel Micay     2017-07-12  193  extern void *memset(void *, int, size_t);
6974f0c4555e28 arch/x86/include/asm/string_32.h Daniel Micay     2017-07-12  194  #ifndef CONFIG_FORTIFY_SOURCE
ff60fab71bb3b4 arch/x86/include/asm/string_32.h Arjan van de Ven 2009-09-28 @195  #define memset(s, c, count) __builtin_memset(s, c, count)
6974f0c4555e28 arch/x86/include/asm/string_32.h Daniel Micay     2017-07-12  196  #endif /* !CONFIG_FORTIFY_SOURCE */
^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  197  

:::::: The code at line 195 was first introduced by commit
:::::: ff60fab71bb3b4fdbf8caf57ff3739ffd0887396 x86: Use __builtin_memset and __builtin_memcpy for memset/memcpy

:::::: TO: Arjan van de Ven <arjan@infradead.org>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
