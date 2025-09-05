Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B095B44C94
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 06:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7CB10E2B2;
	Fri,  5 Sep 2025 04:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bl+X/SuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6ECC10E2B2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 04:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757045245; x=1788581245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4ik2CJTqkP7JyZGKZODFZYdcNPSHjRkjR5R+MPvEcCo=;
 b=bl+X/SuG80+n1Shi6YV3z6wNVopFVmjAAoSZAQIR7R9hTcvcJzFpbLkn
 YmnufhvT/SjXDaHNl/GcBAZ0eZjZH1Kp3O1DWzNExTGiY7EcUCkUl+JSs
 CX1q88aRdaAUO9OgWj0Rf+M2Zc/TuePvq/OnVtWGsQUJ3IykDD19GmjoD
 ODfZYKprRAREcx28B9P0uxkaTyFJKo9IxkTng0/oB2Oadg+lyYzPvu2Rj
 hCRG75/lieahx2L0r4gL00QZaoQ41qIgw7zBJ31LpWAFCnvM7e0vqdip+
 y6ag9RdzjdD15Dfd0sm3hL7F+ccjCrI5PjyoNRSWXXwmH7/KGaRtwjH95 Q==;
X-CSE-ConnectionGUID: YGcU+PeMSj2wNr4fk44YRA==
X-CSE-MsgGUID: ybcCafo1QeOwITgrbynseg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70773230"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="70773230"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 21:07:24 -0700
X-CSE-ConnectionGUID: UzhF1ARWTg+dFKBwSb3SZQ==
X-CSE-MsgGUID: SZdZEBhnTWOI4Prh+5yVeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="195723838"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 04 Sep 2025 21:07:20 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uuNjJ-00001H-2e;
 Fri, 05 Sep 2025 04:07:17 +0000
Date: Fri, 5 Sep 2025 12:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 David Hildenbrand <david@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 5/9] dma-buf: heaps: Add support for Tegra VPR
Message-ID: <202509051132.C0y3nq6E-lkp@intel.com>
References: <20250902154630.4032984-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902154630.4032984-6-thierry.reding@gmail.com>
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

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250902]
[also build test WARNING on v6.17-rc4]
[cannot apply to robh/for-next akpm-mm/mm-everything tegra/for-next linus/master v6.17-rc4 v6.17-rc3 v6.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/dt-bindings-reserved-memory-Document-Tegra-VPR/20250902-235038
base:   next-20250902
patch link:    https://lore.kernel.org/r/20250902154630.4032984-6-thierry.reding%40gmail.com
patch subject: [PATCH 5/9] dma-buf: heaps: Add support for Tegra VPR
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250905/202509051132.C0y3nq6E-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509051132.C0y3nq6E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509051132.C0y3nq6E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/heaps/tegra-vpr.c: In function 'tegra_vpr_protect_pages':
   drivers/dma-buf/heaps/tegra-vpr.c:192:21: error: implicit declaration of function '__ptep_get'; did you mean 'ptep_get'? [-Werror=implicit-function-declaration]
     192 |         pte_t pte = __ptep_get(ptep);
         |                     ^~~~~~~~~~
         |                     ptep_get
   drivers/dma-buf/heaps/tegra-vpr.c:192:21: error: invalid initializer
   drivers/dma-buf/heaps/tegra-vpr.c:194:15: error: implicit declaration of function 'clear_pte_bit'; did you mean 'clear_ptes'? [-Werror=implicit-function-declaration]
     194 |         pte = clear_pte_bit(pte, __pgprot(PROT_NORMAL));
         |               ^~~~~~~~~~~~~
         |               clear_ptes
   In file included from arch/x86/include/asm/paravirt_types.h:11,
                    from arch/x86/include/asm/ptrace.h:175,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:59,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/debugfs.h:15,
                    from drivers/dma-buf/heaps/tegra-vpr.c:12:
   drivers/dma-buf/heaps/tegra-vpr.c:194:43: error: 'PROT_NORMAL' undeclared (first use in this function)
     194 |         pte = clear_pte_bit(pte, __pgprot(PROT_NORMAL));
         |                                           ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:202:48: note: in definition of macro '__pgprot'
     202 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/dma-buf/heaps/tegra-vpr.c:194:43: note: each undeclared identifier is reported only once for each function it appears in
     194 |         pte = clear_pte_bit(pte, __pgprot(PROT_NORMAL));
         |                                           ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:202:48: note: in definition of macro '__pgprot'
     202 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/dma-buf/heaps/tegra-vpr.c:195:15: error: implicit declaration of function 'set_pte_bit'; did you mean 'set_pte_at'? [-Werror=implicit-function-declaration]
     195 |         pte = set_pte_bit(pte, __pgprot(PROT_DEVICE_nGnRnE));
         |               ^~~~~~~~~~~
         |               set_pte_at
   drivers/dma-buf/heaps/tegra-vpr.c:195:41: error: 'PROT_DEVICE_nGnRnE' undeclared (first use in this function)
     195 |         pte = set_pte_bit(pte, __pgprot(PROT_DEVICE_nGnRnE));
         |                                         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:202:48: note: in definition of macro '__pgprot'
     202 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/dma-buf/heaps/tegra-vpr.c:197:9: error: implicit declaration of function '__set_pte'; did you mean 'set_pte'? [-Werror=implicit-function-declaration]
     197 |         __set_pte(ptep, pte);
         |         ^~~~~~~~~
         |         set_pte
   drivers/dma-buf/heaps/tegra-vpr.c: In function 'tegra_vpr_unprotect_pages':
   drivers/dma-buf/heaps/tegra-vpr.c:205:21: error: invalid initializer
     205 |         pte_t pte = __ptep_get(ptep);
         |                     ^~~~~~~~~~
   drivers/dma-buf/heaps/tegra-vpr.c:207:43: error: 'PROT_DEVICE_nGnRnE' undeclared (first use in this function)
     207 |         pte = clear_pte_bit(pte, __pgprot(PROT_DEVICE_nGnRnE));
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:202:48: note: in definition of macro '__pgprot'
     202 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/dma-buf/heaps/tegra-vpr.c:208:41: error: 'PROT_NORMAL' undeclared (first use in this function)
     208 |         pte = set_pte_bit(pte, __pgprot(PROT_NORMAL));
         |                                         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:202:48: note: in definition of macro '__pgprot'
     202 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/dma-buf/heaps/tegra-vpr.c: In function 'tegra_vpr_add_heap':
>> drivers/dma-buf/heaps/tegra-vpr.c:8:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       8 | #define pr_fmt(fmt) "tegra-vpr: " fmt
         |                     ^~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'pr_fmt'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:636:9: note: in expansion of macro 'dynamic_pr_debug'
     636 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/dma-buf/heaps/tegra-vpr.c:715:17: note: in expansion of macro 'pr_debug'
     715 |                 pr_debug("  %2u: %pap-%pap (%lu MiB)\n", i, &start, &end,
         |                 ^~~~~~~~
   cc1: some warnings being treated as errors


vim +8 drivers/dma-buf/heaps/tegra-vpr.c

   > 8	#define pr_fmt(fmt) "tegra-vpr: " fmt
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
