Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F899B3D5
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 13:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEBA10E324;
	Sat, 12 Oct 2024 11:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4e4W9l3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6AF10E323;
 Sat, 12 Oct 2024 11:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728732964; x=1760268964;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4vQXp2epcQb8vcQV7IRCgEesIWmN1jPTBLzSzkv3ae4=;
 b=A4e4W9l3I55ZPEjoNoX/cXkx4lCpo9dWr8hcY8/rhDztBPqca2dua1LF
 Y73xQnvfl/tigqmFaakM0nc0o26NAOaLCWUgZzDpbN3QJIufVZLn3417g
 haOjFMsTaATDfKVuXpcc8X7cUVegDluUMvsgtSSA+MKapgID/BB8lAAMg
 5zD0bMhfoET7sQ48PC8Z2ykhwR43LqLbRX2LGgvvLZUwiCRrY7cdyd7yl
 mANmII8gGDWYeCYirO+t73/iCVwq2ElTOrShAoB4R2uBJ5vspMG8I0E2L
 o/6fF6rW8q5yH9DcG/+iipYOG2fa9Z+g8lO7gtRd/XqSk/56iS24GOc+F w==;
X-CSE-ConnectionGUID: Vxlwz5WpQw6wI93iN4gxVQ==
X-CSE-MsgGUID: 6UXGTAY3R2an7NZ3Q4rdZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28263771"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; d="scan'208";a="28263771"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2024 04:36:04 -0700
X-CSE-ConnectionGUID: VF2dQSviQnCTJfGpvqVBUQ==
X-CSE-MsgGUID: UNxMs61SSa+EXsC1/dccQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; d="scan'208";a="114600220"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 12 Oct 2024 04:36:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1szaPf-000DJp-2b;
 Sat, 12 Oct 2024 11:35:59 +0000
Date: Sat, 12 Oct 2024 19:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: jesse.zhang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Alexander.Deucher@amd.com,
 Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: Re: [PATCH 1/2] drm/sched: adding a new scheduling policy
Message-ID: <202410121939.cZrBIAkO-lkp@intel.com>
References: <20241011062136.1019695-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011062136.1019695-1-jesse.zhang@amd.com>
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jesse-zhang-amd-com/drm-amdgpu-add-the-ring-id-schedule-module-parameter-for-amdgpu/20241011-142247
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20241011062136.1019695-1-jesse.zhang%40amd.com
patch subject: [PATCH 1/2] drm/sched: adding a new scheduling policy
config: i386-randconfig-141-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121939.cZrBIAkO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121939.cZrBIAkO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121939.cZrBIAkO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_sched_job.c: In function 'xe_sched_job_arm':
>> drivers/gpu/drm/xe/xe_sched_job.c:284:9: error: too few arguments to function 'drm_sched_job_arm'
     284 |         drm_sched_job_arm(&job->drm);
         |         ^~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_sched_job_types.h:11,
                    from drivers/gpu/drm/xe/xe_sched_job.h:9,
                    from drivers/gpu/drm/xe/xe_sched_job.c:6:
   include/drm/gpu_scheduler.h:556:6: note: declared here
     556 | void drm_sched_job_arm(struct drm_sched_job *job, int ring);
         |      ^~~~~~~~~~~~~~~~~


vim +/drm_sched_job_arm +284 drivers/gpu/drm/xe/xe_sched_job.c

dd08ebf6c3525a Matthew Brost             2023-03-30  239  
dd08ebf6c3525a Matthew Brost             2023-03-30  240  void xe_sched_job_arm(struct xe_sched_job *job)
dd08ebf6c3525a Matthew Brost             2023-03-30  241  {
4fc4899e86f7af Thomas Hellström          2024-03-27  242  	struct xe_exec_queue *q = job->q;
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  243  	struct dma_fence *fence, *prev;
4fc4899e86f7af Thomas Hellström          2024-03-27  244  	struct xe_vm *vm = q->vm;
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  245  	u64 seqno = 0;
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  246  	int i;
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  247  
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  248  	/* Migration and kernel engines have their own locking */
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  249  	if (IS_ENABLED(CONFIG_LOCKDEP) &&
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  250  	    !(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  251  		lockdep_assert_held(&q->vm->lock);
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  252  		if (!xe_vm_in_lr_mode(q->vm))
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  253  			xe_vm_assert_held(q->vm);
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  254  	}
4fc4899e86f7af Thomas Hellström          2024-03-27  255  
4fc4899e86f7af Thomas Hellström          2024-03-27  256  	if (vm && !xe_sched_job_is_migration(q) && !xe_vm_in_lr_mode(vm) &&
4fc4899e86f7af Thomas Hellström          2024-03-27  257  	    (vm->batch_invalidate_tlb || vm->tlb_flush_seqno != q->tlb_flush_seqno)) {
4fc4899e86f7af Thomas Hellström          2024-03-27  258  		xe_vm_assert_held(vm);
4fc4899e86f7af Thomas Hellström          2024-03-27  259  		q->tlb_flush_seqno = vm->tlb_flush_seqno;
4fc4899e86f7af Thomas Hellström          2024-03-27  260  		job->ring_ops_flush_tlb = true;
4fc4899e86f7af Thomas Hellström          2024-03-27  261  	}
4fc4899e86f7af Thomas Hellström          2024-03-27  262  
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  263  	/* Arm the pre-allocated fences */
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  264  	for (i = 0; i < q->width; prev = fence, ++i) {
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  265  		struct dma_fence_chain *chain;
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  266  
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  267  		fence = job->ptrs[i].lrc_fence;
264eecdba211bb Niranjana Vishwanathapura 2024-05-29  268  		xe_lrc_init_seqno_fence(q->lrc[i], fence);
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  269  		job->ptrs[i].lrc_fence = NULL;
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  270  		if (!i) {
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  271  			job->lrc_seqno = fence->seqno;
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  272  			continue;
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  273  		} else {
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  274  			xe_assert(gt_to_xe(q->gt), job->lrc_seqno == fence->seqno);
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  275  		}
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  276  
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  277  		chain = job->ptrs[i - 1].chain_fence;
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  278  		dma_fence_chain_init(chain, prev, fence, seqno++);
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  279  		job->ptrs[i - 1].chain_fence = NULL;
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  280  		fence = &chain->base;
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  281  	}
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  282  
0ac7a2c745e8a4 Thomas Hellström          2024-05-27  283  	job->fence = fence;
dd08ebf6c3525a Matthew Brost             2023-03-30 @284  	drm_sched_job_arm(&job->drm);
dd08ebf6c3525a Matthew Brost             2023-03-30  285  }
dd08ebf6c3525a Matthew Brost             2023-03-30  286  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
