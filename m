Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AE94AD04E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 05:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503C810E389;
	Tue,  8 Feb 2022 04:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34B110E389;
 Tue,  8 Feb 2022 04:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644294137; x=1675830137;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jJpR/eyRZsZGilrbLub28IVNMNAl8da6THsTHWAmYYo=;
 b=hi4ONtO1fnp0LUJ3pXrJBMOKl1CFfR5r5YytVrOutMk5Mj5VjQV+sFko
 qe8pAfhovycQpYW1tLw4i5VHGRtJjbsF3B6PhGbo96KBPOqjC1tmHC3jU
 crehc7bQnCGdTZB0FCLT5Yz9+hRfDhhoUc/Gu0Hv8N+k5Dib7lzdhCtkq
 Hx8Bp+HoccIDRsFWf5YJXweNNIvEp9JVqwasiu0dl1aBXWnONJjtsMKN9
 libR2UDb7TWSI90bcgt4XJ1FlUOBlWqQch2TMvDxJXI4/gNgo6Y5vk0WK
 DR1hGDw48l5TvKej45gpJMAIQisnbTaioGesSO+5a50gYkFq0tmrAcBJf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="335270928"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="335270928"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 20:22:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="567715938"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 07 Feb 2022 20:22:15 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nHI17-0001LK-L4; Tue, 08 Feb 2022 04:22:13 +0000
Date: Tue, 8 Feb 2022 12:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Cheng <michael.cheng@intel.com>,
	intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v6 6/6] drm: Add arch arm64 for
 drm_clflush_virt_range
Message-ID: <202202081258.VY7Y7JnA-lkp@intel.com>
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
Cc: lucas.demarchi@intel.com, michael.cheng@intel.com, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20220208/202202081258.VY7Y7JnA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f2fb6ade1531d88b046e245e8b854a7422a05a14
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Cheng/Use-drm_clflush-instead-of-clflush/20220208-041326
        git checkout f2fb6ade1531d88b046e245e8b854a7422a05a14
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_cache.c: In function 'drm_clflush_virt_range':
>> drivers/gpu/drm/drm_cache.c:182:32: warning: dereferencing 'void *' pointer
     182 |         flush_tlb_kernel_range(*addr, *end);
         |                                ^~~~~
   drivers/gpu/drm/drm_cache.c:182:39: warning: dereferencing 'void *' pointer
     182 |         flush_tlb_kernel_range(*addr, *end);
         |                                       ^~~~
>> drivers/gpu/drm/drm_cache.c:182:32: error: invalid use of void expression
     182 |         flush_tlb_kernel_range(*addr, *end);
         |                                ^~~~~
   drivers/gpu/drm/drm_cache.c:182:39: error: invalid use of void expression
     182 |         flush_tlb_kernel_range(*addr, *end);
         |                                       ^~~~


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
