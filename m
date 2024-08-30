Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CA39659DC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A2210E1F9;
	Fri, 30 Aug 2024 08:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c66ZebI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230BF10E1F9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725005764; x=1756541764;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PjHdWePCmnjwILs37Lv5nHxMdYlILMkbkBxzQj+3vB0=;
 b=c66ZebI+wd83jed5PiOKePFSLaqYuOlyr2CD2uOr2AlQRi1h5QgNXc/c
 sbUZebCzQBOU0gOzdtjNnZyqvBBse0bZ0vQkxwD1n/OM3VOGXvhqTJDiA
 66oomZHCpDdb+TQLXrNxGWU/sxepa/uS/GcjjBf75iLv18ppv3jn8Vj5i
 kSIE09htct7n5mxLOADCswpSA+Yen4ell+45BMqvUR7MeN6nj9CJ4Wpig
 oQld0LCTjMOt83VF96AIvm+n5TH80NasmH61CmOTuAAe4kNIZFX5wl9W0
 thZSl6pHKt0SKCQbwivi1eM2bjoI6CXhnyMK+rjw02R0YqVCH8ZmUAL+a w==;
X-CSE-ConnectionGUID: qibNvruPS6atpopFJlQQHw==
X-CSE-MsgGUID: ejf0VMq3QQmlDqrt/gtJqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26533351"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="26533351"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 01:16:03 -0700
X-CSE-ConnectionGUID: TvvbhJ8BQJWBw3Zg/wmMJg==
X-CSE-MsgGUID: moiARIEVTB2TfW5fDJeLHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="64568780"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 30 Aug 2024 01:16:00 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sjwnU-0001FC-38;
 Fri, 30 Aug 2024 08:15:56 +0000
Date: Fri, 30 Aug 2024 16:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, vitaly.prosyak@amd.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Subject: Re: [PATCH 1/4] drm/sched: add optional errno to drm_sched_start()
Message-ID: <202408301653.9umdd9cC-lkp@intel.com>
References: <20240826122541.85663-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826122541.85663-1-christian.koenig@amd.com>
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240826]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.11-rc5 v6.11-rc4 v6.11-rc3 v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-give-examples-of-error-codes-to-use/20240826-202848
base:   next-20240826
patch link:    https://lore.kernel.org/r/20240826122541.85663-1-christian.koenig%40amd.com
patch subject: [PATCH 1/4] drm/sched: add optional errno to drm_sched_start()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240830/202408301653.9umdd9cC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408301653.9umdd9cC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408301653.9umdd9cC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_sched.c:2541:35: error: too few arguments to function call, expected 2, have 1
    2541 |         drm_sched_start(&queue->scheduler);
         |         ~~~~~~~~~~~~~~~                  ^
   include/drm/gpu_scheduler.h:582:6: note: 'drm_sched_start' declared here
     582 | void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
         |      ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +2541 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d0 Boris Brezillon 2024-02-29  2532  
de85488138247d0 Boris Brezillon 2024-02-29  2533  static void queue_start(struct panthor_queue *queue)
de85488138247d0 Boris Brezillon 2024-02-29  2534  {
de85488138247d0 Boris Brezillon 2024-02-29  2535  	struct panthor_job *job;
de85488138247d0 Boris Brezillon 2024-02-29  2536  
de85488138247d0 Boris Brezillon 2024-02-29  2537  	/* Re-assign the parent fences. */
de85488138247d0 Boris Brezillon 2024-02-29  2538  	list_for_each_entry(job, &queue->scheduler.pending_list, base.list)
de85488138247d0 Boris Brezillon 2024-02-29  2539  		job->base.s_fence->parent = dma_fence_get(job->done_fence);
de85488138247d0 Boris Brezillon 2024-02-29  2540  
83b501c1799a96a Christian König 2024-07-19 @2541  	drm_sched_start(&queue->scheduler);
de85488138247d0 Boris Brezillon 2024-02-29  2542  }
de85488138247d0 Boris Brezillon 2024-02-29  2543  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
