Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AC889647D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 08:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E3510FBEC;
	Wed,  3 Apr 2024 06:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/CbTEd/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570510FBEC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 06:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712125456; x=1743661456;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=RDyK31AOeEL/cCCmbPt9zfwDnreb2sRz5FeVRJFgW4k=;
 b=g/CbTEd/+ghxnJHnV5qyGNa87QXKx03BdF8Tl7+iCtw6fE48RwVkmHZl
 ROsMV9DgpwHMLQEZvHSklarSPR5D9izcMDN77Cl9xzbs/vYMsDO19j3Oy
 IfQfikR4Jh6FYq7gROB4Js6eMP00UFBR/qqMzLDIZZbiVYZCSQoVRwIbx
 QS5kzJtb7DcA3r6cNIVCWXpX1fBGLKxPslkLJnP3MkGWbBzEvOVHHWz2s
 WI6UROdC9WecnbsFRU4nPDEN/enpowUY2Z62xU7Xcv8YN3ZUB+A359kNU
 90pKIue/3w+yD+GwQPF/gW95loH/+ghOGyxDzNs4uQhmuHHtvQxJX0Aqj Q==;
X-CSE-ConnectionGUID: 66QJG2xoS1WUBs0ff5pn/A==
X-CSE-MsgGUID: puLlesVpSmaPCcoPo7SLkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7493070"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7493070"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 23:24:16 -0700
X-CSE-ConnectionGUID: yQ41SlkZTjuPPmtk41U2Lw==
X-CSE-MsgGUID: a4yDXplhTUiRPNH+ZpSmng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18748633"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 02 Apr 2024 23:24:14 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rru2d-0001vZ-1y;
 Wed, 03 Apr 2024 06:24:11 +0000
Date: Wed, 3 Apr 2024 14:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 Steven Price <steven.price@arm.com>
Subject: [drm-misc:for-linux-next 3/4]
 drivers/gpu/drm/panthor/panthor_fw.c:979:1: error: unused variable 'cookie'
Message-ID: <202404031446.7Mpki5DV-lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   10021ef27310279c850cf6cb38542c443a995e92
commit: 962f88b9c91647f3ff4a0d3709662641baed5164 [3/4] drm/panthor: Drop the dev_enter/exit() sections in _irq_suspend/resume()
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20240403/202404031446.7Mpki5DV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031446.7Mpki5DV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031446.7Mpki5DV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/panthor/panthor_fw.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panthor/panthor_fw.c:979:1: error: unused variable 'cookie' [-Werror,-Wunused-variable]
     979 | PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_device.h:326:6: note: expanded from macro 'PANTHOR_IRQ_HANDLER'
     326 |         int cookie;                                                                             \
         |             ^~~~~~
>> drivers/gpu/drm/panthor/panthor_fw.c:979:1: error: unused variable 'cookie' [-Werror,-Wunused-variable]
     979 | PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_device.h:336:6: note: expanded from macro 'PANTHOR_IRQ_HANDLER'
     336 |         int cookie;                                                                             \
         |             ^~~~~~
   7 errors generated.
--
   In file included from drivers/gpu/drm/panthor/panthor_gpu.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panthor/panthor_gpu.c:166:1: error: unused variable 'cookie' [-Werror,-Wunused-variable]
     166 | PANTHOR_IRQ_HANDLER(gpu, GPU, panthor_gpu_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_device.h:326:6: note: expanded from macro 'PANTHOR_IRQ_HANDLER'
     326 |         int cookie;                                                                             \
         |             ^~~~~~
>> drivers/gpu/drm/panthor/panthor_gpu.c:166:1: error: unused variable 'cookie' [-Werror,-Wunused-variable]
     166 | PANTHOR_IRQ_HANDLER(gpu, GPU, panthor_gpu_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_device.h:336:6: note: expanded from macro 'PANTHOR_IRQ_HANDLER'
     336 |         int cookie;                                                                             \
         |             ^~~~~~
   7 errors generated.
--
   In file included from drivers/gpu/drm/panthor/panthor_mmu.c:5:
   In file included from include/drm/drm_debugfs.h:38:
   In file included from include/drm/drm_gpuvm.h:34:
   In file included from include/drm/drm_gem.h:42:
   In file included from include/drm/drm_vma_manager.h:27:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panthor/panthor_mmu.c:1689:1: error: unused variable 'cookie' [-Werror,-Wunused-variable]
    1689 | PANTHOR_IRQ_HANDLER(mmu, MMU, panthor_mmu_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_device.h:326:6: note: expanded from macro 'PANTHOR_IRQ_HANDLER'
     326 |         int cookie;                                                                             \
         |             ^~~~~~
>> drivers/gpu/drm/panthor/panthor_mmu.c:1689:1: error: unused variable 'cookie' [-Werror,-Wunused-variable]
    1689 | PANTHOR_IRQ_HANDLER(mmu, MMU, panthor_mmu_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_device.h:336:6: note: expanded from macro 'PANTHOR_IRQ_HANDLER'
     336 |         int cookie;                                                                             \
         |             ^~~~~~
   7 errors generated.


vim +/cookie +979 drivers/gpu/drm/panthor/panthor_fw.c

2718d91816eeed Boris Brezillon 2024-02-29  965  
2718d91816eeed Boris Brezillon 2024-02-29  966  static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
2718d91816eeed Boris Brezillon 2024-02-29  967  {
2718d91816eeed Boris Brezillon 2024-02-29  968  	if (!ptdev->fw->booted && (status & JOB_INT_GLOBAL_IF))
2718d91816eeed Boris Brezillon 2024-02-29  969  		ptdev->fw->booted = true;
2718d91816eeed Boris Brezillon 2024-02-29  970  
2718d91816eeed Boris Brezillon 2024-02-29  971  	wake_up_all(&ptdev->fw->req_waitqueue);
2718d91816eeed Boris Brezillon 2024-02-29  972  
2718d91816eeed Boris Brezillon 2024-02-29  973  	/* If the FW is not booted, don't process IRQs, just flag the FW as booted. */
2718d91816eeed Boris Brezillon 2024-02-29  974  	if (!ptdev->fw->booted)
2718d91816eeed Boris Brezillon 2024-02-29  975  		return;
2718d91816eeed Boris Brezillon 2024-02-29  976  
2718d91816eeed Boris Brezillon 2024-02-29  977  	panthor_sched_report_fw_events(ptdev, status);
2718d91816eeed Boris Brezillon 2024-02-29  978  }
2718d91816eeed Boris Brezillon 2024-02-29 @979  PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
2718d91816eeed Boris Brezillon 2024-02-29  980  

:::::: The code at line 979 was first introduced by commit
:::::: 2718d91816eeed03c09c8abe872e45f59078768c drm/panthor: Add the FW logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
