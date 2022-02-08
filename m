Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2127A4ACFE4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 04:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4741110E148;
	Tue,  8 Feb 2022 03:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C5A10E148;
 Tue,  8 Feb 2022 03:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644292332; x=1675828332;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gni8ZAnSjS2QQ6jPRCIKsoiZCM6QkQtCXQebf87OVz0=;
 b=OPgkXkG/Tz2r0QpriTOs98J0k6UFR5tVlseRjJT/aR0R5oM/37pbWLv/
 yXyx/NG2L4ytwh+yGnntJ6fAaywXjBrovs+LQSKjbhY1x/SBZLHKHiQdg
 IhlvXnRGDRDz78qbzW503ms1tGMZg1QfUtVA4+7GLYEz3FH4nrhU4ZdYU
 M86GeTCmGI17jOSpJZI4CF8MuhPyMRypCmjFYHsjpMsuzKyXBZaaOi34b
 JeMCOGLDe/0dgcXh1TCmdKBpjDSAGQzpPnHlOHSTnXpJgBe8jEogzVBt1
 kjwLCbWOuO/GgI1V4Rpm4SXrO9dhuBHiJmNTnUQdk+IZMBswjc3nm6I1Y w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="309608509"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="309608509"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 19:52:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="484669090"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 07 Feb 2022 19:52:09 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nHHY0-0001JL-DI; Tue, 08 Feb 2022 03:52:08 +0000
Date: Tue, 8 Feb 2022 11:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Cheng <michael.cheng@intel.com>,
	intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v6 6/6] drm: Add arch arm64 for
 drm_clflush_virt_range
Message-ID: <202202081151.wYD1tE4p-lkp@intel.com>
References: <20220207201127.648624-7-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207201127.648624-7-michael.cheng@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: lucas.demarchi@intel.com, michael.cheng@intel.com, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm/drm-next v5.17-rc3 next-20220207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Cheng/Use-drm_clflush-instead-of-clflush/20220208-041326
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: arm64-randconfig-r005-20220207 (https://download.01.org/0day-ci/archive/20220208/202202081151.wYD1tE4p-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/f2fb6ade1531d88b046e245e8b854a7422a05a14
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Cheng/Use-drm_clflush-instead-of-clflush/20220208-041326
        git checkout f2fb6ade1531d88b046e245e8b854a7422a05a14
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_cache.c:182:25: error: passing 'void' to parameter of incompatible type 'unsigned long'
           flush_tlb_kernel_range(*addr, *end);
                                  ^~~~~
   arch/arm64/include/asm/tlbflush.h:374:57: note: passing argument to parameter 'start' here
   static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end)
                                                           ^
   1 error generated.


vim +182 drivers/gpu/drm/drm_cache.c

   151	
   152	/**
   153	 * drm_clflush_virt_range - Flush dcache lines of a region
   154	 * @addr: Initial kernel memory address.
   155	 * @length: Region size.
   156	 *
   157	 * Flush every data cache line entry that points to an address in the
   158	 * region requested.
   159	 */
   160	void
   161	drm_clflush_virt_range(void *addr, unsigned long length)
   162	{
   163	#if defined(CONFIG_X86)
   164		if (static_cpu_has(X86_FEATURE_CLFLUSH)) {
   165			const int size = boot_cpu_data.x86_clflush_size;
   166			void *end = addr + length;
   167	
   168			addr = (void *)(((unsigned long)addr) & -size);
   169			mb(); /*CLFLUSH is only ordered with a full memory barrier*/
   170			for (; addr < end; addr += size)
   171				clflushopt(addr);
   172			clflushopt(end - 1); /* force serialisation */
   173			mb(); /*Ensure that every data cache line entry is flushed*/
   174			return;
   175		}
   176	
   177		if (wbinvd_on_all_cpus())
   178			pr_err("Timed out waiting for cache flush\n");
   179	
   180	#elif defined(CONFIG_ARM64)
   181		void *end = addr + length;
 > 182		flush_tlb_kernel_range(*addr, *end);
   183	#else
   184		pr_err("Architecture has no drm_cache.c support\n");
   185		WARN_ON_ONCE(1);
   186	#endif
   187	}
   188	EXPORT_SYMBOL(drm_clflush_virt_range);
   189	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
