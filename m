Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10FCAB960A
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 08:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1829810E9AA;
	Fri, 16 May 2025 06:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTbiYbQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC3A10E9AA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 06:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747377312; x=1778913312;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QCZtNJW2TAKa87VLFt4NbNEoeK4ppmMpbEoMRvqP0Vc=;
 b=FTbiYbQfSXy0eLbt9ulIMdrSQw9HL8aZF+EKgFB+VFRA6BHnlgH0F4L0
 dTM3nYZvZwZ59fyR8wodYG4aapj6lAs0aD7HfthXM8+coeNUTOrUsvKG4
 K7FaPRW/TFku0B5YV3NtUvH5DPrZelJ3c4NE96s96ujQER798IPvH4ygs
 mvgOPdr7jz9QtbyludwcdDvgBRVU4HaOWDXNMF2TbmaiUr8uOzgmskBwW
 p4teuT0w/k8UchPdscyi5P4NfUPLSTedGWr5ALwxVCJiNgBjdTNEUEZkq
 6vXVTkPMYu9SuvksV212JzVxkf3mcTX5iYjvHo9aGlNe3sYyU2npHflHz A==;
X-CSE-ConnectionGUID: fOMJV6nASCm1zKxjh49sPg==
X-CSE-MsgGUID: niqtDwsrQva8v/xSMB6eWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53011097"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="53011097"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 23:35:12 -0700
X-CSE-ConnectionGUID: 6i7joXiyRzyfNlAd6YLpEQ==
X-CSE-MsgGUID: CRTgF/3RRkWobcHHH2vTlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="169661158"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 15 May 2025 23:35:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uFoew-000J3L-2d;
 Fri, 16 May 2025 06:35:06 +0000
Date: Fri, 16 May 2025 14:34:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ashley Smith <ashley.smith@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 Ashley Smith <ashley.smith@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Reset queue slots if termination fails
Message-ID: <202505161417.tAUp1jmc-lkp@intel.com>
References: <20250515103314.1682471-1-ashley.smith@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515103314.1682471-1-ashley.smith@collabora.com>
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

Hi Ashley,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9934ab18051118385c7ea44d8e14175edbe6dc9c]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashley-Smith/drm-panthor-Reset-queue-slots-if-termination-fails/20250515-183502
base:   9934ab18051118385c7ea44d8e14175edbe6dc9c
patch link:    https://lore.kernel.org/r/20250515103314.1682471-1-ashley.smith%40collabora.com
patch subject: [PATCH] drm/panthor: Reset queue slots if termination fails
config: sparc-randconfig-002-20250516 (https://download.01.org/0day-ci/archive/20250516/202505161417.tAUp1jmc-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161417.tAUp1jmc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161417.tAUp1jmc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_sched.c: In function 'panthor_sched_suspend':
>> drivers/gpu/drm/panthor/panthor_sched.c:2736:18: error: expected ';' before 'queue_count'
        for (i = 0; i queue_count; i++) {
                     ^~~~~~~~~~~~
                     ;


vim +2736 drivers/gpu/drm/panthor/panthor_sched.c

  2666	
  2667	void panthor_sched_suspend(struct panthor_device *ptdev)
  2668	{
  2669		struct panthor_scheduler *sched = ptdev->scheduler;
  2670		struct panthor_csg_slots_upd_ctx upd_ctx;
  2671		struct panthor_group *group;
  2672		u32 suspended_slots;
  2673		u32 i;
  2674	
  2675		mutex_lock(&sched->lock);
  2676		csgs_upd_ctx_init(&upd_ctx);
  2677		for (i = 0; i < sched->csg_slot_count; i++) {
  2678			struct panthor_csg_slot *csg_slot = &sched->csg_slots[i];
  2679	
  2680			if (csg_slot->group) {
  2681				csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, i,
  2682							group_can_run(csg_slot->group) ?
  2683							CSG_STATE_SUSPEND : CSG_STATE_TERMINATE,
  2684							CSG_STATE_MASK);
  2685			}
  2686		}
  2687	
  2688		suspended_slots = upd_ctx.update_mask;
  2689	
  2690		csgs_upd_ctx_apply_locked(ptdev, &upd_ctx);
  2691		suspended_slots &= ~upd_ctx.timedout_mask;
  2692	
  2693		if (upd_ctx.timedout_mask) {
  2694			u32 slot_mask = upd_ctx.timedout_mask;
  2695	
  2696			drm_err(&ptdev->base, "CSG suspend failed, escalating to termination");
  2697			csgs_upd_ctx_init(&upd_ctx);
  2698			while (slot_mask) {
  2699				u32 csg_id = ffs(slot_mask) - 1;
  2700				struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
  2701	
  2702				/* If the group was still usable before that point, we consider
  2703				 * it innocent.
  2704				 */
  2705				if (group_can_run(csg_slot->group))
  2706					csg_slot->group->innocent = true;
  2707	
  2708				/* We consider group suspension failures as fatal and flag the
  2709				 * group as unusable by setting timedout=true.
  2710				 */
  2711				csg_slot->group->timedout = true;
  2712	
  2713				csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
  2714							CSG_STATE_TERMINATE,
  2715							CSG_STATE_MASK);
  2716				slot_mask &= ~BIT(csg_id);
  2717			}
  2718	
  2719			csgs_upd_ctx_apply_locked(ptdev, &upd_ctx);
  2720	
  2721			slot_mask = upd_ctx.timedout_mask;
  2722			while (slot_mask) {
  2723				u32 csg_id = ffs(slot_mask) - 1;
  2724				struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
  2725	
  2726				/* Terminate command timedout, but the soft-reset will
  2727				 * automatically terminate all active groups, so let's
  2728				 * force the state to halted here.
  2729				 */
  2730				if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED) {
  2731					csg_slot->group->state = PANTHOR_CS_GROUP_TERMINATED;
  2732	
  2733					/* Reset the queue slots manually if the termination
  2734					 * request failed.
  2735					 */
> 2736					for (i = 0; i queue_count; i++) {
  2737						if (group->queues[i])
  2738							cs_slot_reset_locked(ptdev, csg_id, i);
  2739					}
  2740				}
  2741				slot_mask &= ~BIT(csg_id);
  2742			}
  2743		}
  2744	
  2745		/* Flush L2 and LSC caches to make sure suspend state is up-to-date.
  2746		 * If the flush fails, flag all queues for termination.
  2747		 */
  2748		if (suspended_slots) {
  2749			bool flush_caches_failed = false;
  2750			u32 slot_mask = suspended_slots;
  2751	
  2752			if (panthor_gpu_flush_caches(ptdev, CACHE_CLEAN, CACHE_CLEAN, 0))
  2753				flush_caches_failed = true;
  2754	
  2755			while (slot_mask) {
  2756				u32 csg_id = ffs(slot_mask) - 1;
  2757				struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
  2758	
  2759				if (flush_caches_failed)
  2760					csg_slot->group->state = PANTHOR_CS_GROUP_TERMINATED;
  2761				else
  2762					csg_slot_sync_update_locked(ptdev, csg_id);
  2763	
  2764				slot_mask &= ~BIT(csg_id);
  2765			}
  2766		}
  2767	
  2768		for (i = 0; i < sched->csg_slot_count; i++) {
  2769			struct panthor_csg_slot *csg_slot = &sched->csg_slots[i];
  2770	
  2771			group = csg_slot->group;
  2772			if (!group)
  2773				continue;
  2774	
  2775			group_get(group);
  2776	
  2777			if (group->csg_id >= 0)
  2778				sched_process_csg_irq_locked(ptdev, group->csg_id);
  2779	
  2780			group_unbind_locked(group);
  2781	
  2782			drm_WARN_ON(&group->ptdev->base, !list_empty(&group->run_node));
  2783	
  2784			if (group_can_run(group)) {
  2785				list_add(&group->run_node,
  2786					 &sched->groups.idle[group->priority]);
  2787			} else {
  2788				/* We don't bother stopping the scheduler if the group is
  2789				 * faulty, the group termination work will finish the job.
  2790				 */
  2791				list_del_init(&group->wait_node);
  2792				group_queue_work(group, term);
  2793			}
  2794			group_put(group);
  2795		}
  2796		mutex_unlock(&sched->lock);
  2797	}
  2798	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
