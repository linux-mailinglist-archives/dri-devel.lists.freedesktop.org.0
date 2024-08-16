Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547569551A4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 21:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659E910E83D;
	Fri, 16 Aug 2024 19:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZcs0gCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB24F10E83B;
 Fri, 16 Aug 2024 19:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723837757; x=1755373757;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XqGigbks3xrxaNm5rR66wG5YxGKIQY2yosr2CSwRT6o=;
 b=LZcs0gCGARHDvDfPj93adjzHjzvuMjN/+DX9rr/7UuERZN4GBDFNw9R4
 KswBJMNqsozRRuOKcVGltx2tw0g+xMg4OMbt3ZZjmehEs75qP1enQCTj3
 0QW/D+D5R1h7l/ZJYBvx8CGGL0gikKYKiLmsrg2j36/vPBbPkdF0w5i5x
 O0e2+gTsch4gL74xILLay6owsacOAAWYXDNjeQYr72bxGrzuxmnK6+olX
 bizolJq7PgJZHfQZiv8EpK0DFrFHeg3H0+eXebR/FWE+U790A/R6xJz+v
 Zh5f/EPJzWNXzNYS99HUwAnycL6l8hS0bu+WqtfekKTHLe9eur7N5qCZ9 w==;
X-CSE-ConnectionGUID: GI8vNwzDRu298Jp5Y6EwEQ==
X-CSE-MsgGUID: QKhP/IJvTtWls345GgEhFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32814981"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="32814981"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:49:16 -0700
X-CSE-ConnectionGUID: MXy3/erEQ2SxQPhYWX3qrA==
X-CSE-MsgGUID: gIC+ORd4SnqhPQVNTytNJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59728963"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 16 Aug 2024 12:49:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sf2wh-0006sG-03;
 Fri, 16 Aug 2024 19:49:11 +0000
Date: Sat, 17 Aug 2024 03:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v8 5/6] drm/xe: Add a shrinker for xe bos
Message-ID: <202408170320.SsODtn1a-lkp@intel.com>
References: <20240816133717.3102-6-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816133717.3102-6-thomas.hellstrom@linux.intel.com>
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

[auto build test WARNING on next-20240816]
[cannot apply to drm-xe/drm-xe-next linus/master v6.11-rc3 v6.11-rc2 v6.11-rc1 v6.11-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Add-a-virtual-base-class-for-graphics-memory-backup/20240816-213947
base:   next-20240816
patch link:    https://lore.kernel.org/r/20240816133717.3102-6-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v8 5/6] drm/xe: Add a shrinker for xe bos
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240817/202408170320.SsODtn1a-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170320.SsODtn1a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170320.SsODtn1a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_bo.c:6:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2199:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_bo.c:6:
   In file included from drivers/gpu/drm/xe/xe_bo.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:9:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_bo.c:6:
   In file included from drivers/gpu/drm/xe/xe_bo.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:9:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/xe/xe_bo.c:6:
   In file included from drivers/gpu/drm/xe/xe_bo.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:9:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/xe/xe_bo.c:2496:
>> drivers/gpu/drm/xe/tests/xe_bo.c:462:42: warning: variable 'bo' is uninitialized when used here [-Wuninitialized]
     462 |                 struct xe_ttm_tt *xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
         |                                                        ^~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/gpu/drm/xe/tests/xe_bo.c:460:19: note: initialize the variable 'bo' to silence this warning
     460 |                 struct xe_bo *bo;
         |                                 ^
         |                                  = NULL
   17 warnings generated.


vim +/bo +462 drivers/gpu/drm/xe/tests/xe_bo.c

   430	
   431	/*
   432	 * Try to create system bos corresponding to twice the amount
   433	 * of available system memory to test shrinker functionality.
   434	 * If no swap space is available to accommodate the
   435	 * memory overcommit, mark bos purgeable.
   436	 */
   437	static int shrink_test_run_device(struct xe_device *xe)
   438	{
   439		struct kunit *test = kunit_get_current_test();
   440		LIST_HEAD(bos);
   441		struct xe_bo_link *link, *next;
   442		struct sysinfo si;
   443		size_t total, alloced;
   444		unsigned int interrupted = 0, successful = 0, count = 0;
   445		struct rnd_state prng;
   446		u64 rand_seed;
   447		bool failed = false;
   448	
   449		rand_seed = get_random_u64();
   450		prandom_seed_state(&prng, rand_seed);
   451	
   452		si_meminfo(&si);
   453		total = si.freeram * si.mem_unit;
   454	
   455		kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
   456			   (unsigned long)total);
   457	
   458		total <<= 1;
   459		for (alloced = 0; alloced < total ; alloced += XE_BO_SHRINK_SIZE) {
   460			struct xe_bo *bo;
   461			unsigned int mem_type;
 > 462			struct xe_ttm_tt *xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
   463	
   464			link = kzalloc(sizeof(*link), GFP_KERNEL);
   465			if (!link) {
   466				KUNIT_FAIL(test, "Unexpected link allocation failure\n");
   467				failed = true;
   468				break;
   469			}
   470	
   471			INIT_LIST_HEAD(&link->link);
   472	
   473			/* We can create bos using WC caching here. But it is slower. */
   474			bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
   475					       DRM_XE_GEM_CPU_CACHING_WB,
   476					       ttm_bo_type_device,
   477					       XE_BO_FLAG_SYSTEM);
   478			if (IS_ERR(bo)) {
   479				if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
   480				    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
   481					KUNIT_FAIL(test, "Error creating bo: %pe\n", bo);
   482				kfree(link);
   483				failed = true;
   484				break;
   485			}
   486			xe_bo_lock(bo, false);
   487			xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
   488	
   489			/*
   490			 * If we're low on swap entries, we can't shrink unless the bo
   491			 * is marked purgeable.
   492			 */
   493			if (get_nr_swap_pages() < (XE_BO_SHRINK_SIZE >> PAGE_SHIFT) * 128) {
   494				long num_pages = xe_tt->ttm.num_pages;
   495	
   496				xe_tt->purgeable = true;
   497				xe_shrinker_mod_pages(xe->mem.shrinker, -num_pages,
   498						      num_pages);
   499			} else {
   500				int ret = shrink_test_fill_random(bo, &prng, link);
   501	
   502				if (ret) {
   503					xe_bo_unlock(bo);
   504					xe_bo_put(bo);
   505					KUNIT_FAIL(test, "Error filling bo with random data: %pe\n",
   506						   ERR_PTR(ret));
   507					kfree(link);
   508					failed = true;
   509					break;
   510				}
   511			}
   512	
   513			mem_type = bo->ttm.resource->mem_type;
   514			xe_bo_unlock(bo);
   515			link->bo = bo;
   516			list_add_tail(&link->link, &bos);
   517	
   518			if (mem_type != XE_PL_TT) {
   519				KUNIT_FAIL(test, "Bo in incorrect memory type: %u\n",
   520					   bo->ttm.resource->mem_type);
   521				failed = true;
   522			}
   523			cond_resched();
   524			if (signal_pending(current))
   525				break;
   526		}
   527	
   528		/*
   529		 * Read back and destroy bos. Reset the pseudo-random seed to get an
   530		 * identical pseudo-random number sequence for readback.
   531		 */
   532		prandom_seed_state(&prng, rand_seed);
   533		list_for_each_entry_safe(link, next, &bos, link) {
   534			static struct ttm_operation_ctx ctx = {.interruptible = true};
   535			struct xe_bo *bo = link->bo;
   536			struct xe_ttm_tt *xe_tt;
   537			int ret;
   538	
   539			count++;
   540			if (!signal_pending(current) && !failed) {
   541				bool purgeable, intr = false;
   542	
   543				xe_bo_lock(bo, NULL);
   544	
   545				/* xe_tt->purgeable is cleared on validate. */
   546				xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
   547				purgeable = xe_tt->purgeable;
   548				do {
   549					ret = ttm_bo_validate(&bo->ttm, &tt_placement, &ctx);
   550					if (ret == -EINTR)
   551						intr = true;
   552				} while (ret == -EINTR && !signal_pending(current));
   553	
   554				if (!ret && !purgeable)
   555					failed = shrink_test_verify(test, bo, count, &prng, link);
   556	
   557				xe_bo_unlock(bo);
   558				if (ret) {
   559					KUNIT_FAIL(test, "Validation failed: %pe\n",
   560						   ERR_PTR(ret));
   561					failed = true;
   562				} else if (intr) {
   563					interrupted++;
   564				} else {
   565					successful++;
   566				}
   567			}
   568			xe_bo_put(link->bo);
   569			list_del(&link->link);
   570			kfree(link);
   571		}
   572		kunit_info(test, "Readbacks interrupted: %u successful: %u\n",
   573			   interrupted, successful);
   574	
   575		return 0;
   576	}
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
