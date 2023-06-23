Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D0B73C307
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C6210E6C7;
	Fri, 23 Jun 2023 21:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1E910E6D9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 21:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687556543; x=1719092543;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cASyFpEHf1nLL9Cr4ppq2AcWwmICv2n4T/LBtYoOVdQ=;
 b=hNo84x/5JHsDYoDziqZwhoi+A8f4QIUHGcgcQRcss1p966W++17z24ro
 gbcaQkZ1vsx7BPiTwN0bqSuLuIJlo/a5rmqFiPsn0X+osHH5gmNqb0iDC
 LZ0oVuFVluo3jI6yiT21p+hKIN5fwxw8Eny3ZCmXGPYhqDWoijZv855Fr
 jCI+zHcGOXhnFMquPmiKXGvr6+iYzmaid+GCdW0hU9ijbsdU7T6/8uasV
 jZs4nZx7EXzIQAkESM35JET3uSfc1xtHEuul7Ttv/Ea24E1b+RGyQZXIr
 VVxPvzafii+YcrbhWz1+s+mHG5lCC83S55Un5eaNJCX8k2kU9fZwlNoh+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="358358827"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="358358827"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 14:42:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="745131233"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="745131233"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 23 Jun 2023 14:42:20 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qCoXr-0008YN-1c;
 Fri, 23 Jun 2023 21:42:19 +0000
Date: Sat, 24 Jun 2023 05:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] dma-buf: allow nested dma_resv_reserve_fences
Message-ID: <202306240508.nAff52YL-lkp@intel.com>
References: <20230623200113.62051-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623200113.62051-1-Yunxiang.Li@amd.com>
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunxiang,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20230624-040209/Yunxiang-Li/drm-amdgpu-fix-missing-fence-reserve-in-amdgpu_vm_sdma_commit/20230622-002915
base:   the 2th patch of https://lore.kernel.org/r/20230621162652.10875-3-Yunxiang.Li%40amd.com
patch link:    https://lore.kernel.org/r/20230623200113.62051-1-Yunxiang.Li%40amd.com
patch subject: [PATCH v2] dma-buf: allow nested dma_resv_reserve_fences
config: arc-randconfig-r006-20230622 (https://download.01.org/0day-ci/archive/20230624/202306240508.nAff52YL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240508.nAff52YL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240508.nAff52YL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma-buf/dma-resv.c: In function 'dma_resv_add_fence':
   drivers/dma-buf/dma-resv.c:326: error: unterminated #else
     326 | #ifdef CONFIG_DEBUG_MUTEXES
         | 
   drivers/dma-buf/dma-resv.c:327:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     327 |         else
         |         ^~~~
   drivers/dma-buf/dma-resv.c:327:9: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/mutex.h:15,
                    from include/linux/ww_mutex.h:20,
                    from include/linux/dma-resv.h:42,
                    from drivers/dma-buf/dma-resv.c:36:
>> include/linux/compiler.h:24:39: error: expected declaration or statement at end of input
      24 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:125:9: note: in expansion of macro 'unlikely'
     125 |         unlikely(__ret_warn_on);                                        \
         |         ^~~~~~~~
   drivers/dma-buf/dma-resv.c:328:17: note: in expansion of macro 'WARN_ON'
     328 |                 WARN_ON(1); // missing fence slot allocation
         |                 ^~~~~~~


vim +24 include/linux/compiler.h

1f0d69a9fc815d Steven Rostedt          2008-11-12  21  
d45ae1f7041ac5 Steven Rostedt (VMware  2017-01-17  22) #define __branch_check__(x, expect, is_constant) ({			\
2026d35741f2c3 Mikulas Patocka         2018-05-30  23  			long ______r;					\
134e6a034cb004 Steven Rostedt (VMware  2017-01-19 @24) 			static struct ftrace_likely_data		\
e04462fb82f8dd Miguel Ojeda            2018-09-03  25  				__aligned(4)				\
33def8498fdde1 Joe Perches             2020-10-21  26  				__section("_ftrace_annotated_branch")	\
1f0d69a9fc815d Steven Rostedt          2008-11-12  27  				______f = {				\
134e6a034cb004 Steven Rostedt (VMware  2017-01-19  28) 				.data.func = __func__,			\
134e6a034cb004 Steven Rostedt (VMware  2017-01-19  29) 				.data.file = __FILE__,			\
134e6a034cb004 Steven Rostedt (VMware  2017-01-19  30) 				.data.line = __LINE__,			\
1f0d69a9fc815d Steven Rostedt          2008-11-12  31  			};						\
d45ae1f7041ac5 Steven Rostedt (VMware  2017-01-17  32) 			______r = __builtin_expect(!!(x), expect);	\
d45ae1f7041ac5 Steven Rostedt (VMware  2017-01-17  33) 			ftrace_likely_update(&______f, ______r,		\
d45ae1f7041ac5 Steven Rostedt (VMware  2017-01-17  34) 					     expect, is_constant);	\
1f0d69a9fc815d Steven Rostedt          2008-11-12  35  			______r;					\
1f0d69a9fc815d Steven Rostedt          2008-11-12  36  		})
1f0d69a9fc815d Steven Rostedt          2008-11-12  37  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
