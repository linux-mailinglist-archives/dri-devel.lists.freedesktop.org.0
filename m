Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33986A0026D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 02:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110D110E7D2;
	Fri,  3 Jan 2025 01:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmFTjNvN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA28610E7D2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 01:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735867669; x=1767403669;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ptRUqwZs3s6gGOiimsjKiQ6EY7//h/g0YuvC6G6iYxE=;
 b=RmFTjNvNoTzTrrwgwtGxsbUcV9BUv0yq1aVSooKaJdGU7oBtoRRFkVd2
 TtotcgIsgRikYU9RyAgjMOfpnxn8QMtMJ2TCvSCxAkmZT75hAS3aOZ3G2
 3Wk+MM9RwTiOG5RmXw2SY3T4YwqnLOKrj0b//SSlkXfg2cQ3NJPAqtigB
 hdPBDRruX+dNoJ6WmrN3bKb+FbKI7vt0RGGbLOLSzXohCCO/bF/ahMil6
 VSz10RIrUN9yt7c9WjHSMcr+BNTIgq6GHHVKUl7SU6Ep82VX9ry5ldt8q
 gb9wFWcVLLgyN9PnNIIK7J/AsGulfMM3AZnh9zIpc3sel4RZaFJxeUjln A==;
X-CSE-ConnectionGUID: swgoKPxNQluM8cCdqQGRww==
X-CSE-MsgGUID: KFv7UkZUSvyOsjV8DP5aWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36021497"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="36021497"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 17:27:47 -0800
X-CSE-ConnectionGUID: 8H6QjGfNSfG4Yao3s4pKeA==
X-CSE-MsgGUID: N2XSNvqySGyr/B0oG5ciJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132577781"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 02 Jan 2025 17:27:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tTWTU-00092N-1n;
 Fri, 03 Jan 2025 01:27:40 +0000
Date: Fri, 3 Jan 2025 09:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] drm/panthor: Expose size of driver internal BO's
 over fdinfo
Message-ID: <202501030900.s8FkUPV1-lkp@intel.com>
References: <20250102203817.956790-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250102203817.956790-2-adrian.larumbe@collabora.com>
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

Hi Adrián,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20241220]
[cannot apply to linus/master v6.13-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-Expose-size-of-driver-internal-BO-s-over-fdinfo/20250103-044151
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250102203817.956790-2-adrian.larumbe%40collabora.com
patch subject: [PATCH v6 1/2] drm/panthor: Expose size of driver internal BO's over fdinfo
config: i386-buildonly-randconfig-004-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030900.s8FkUPV1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030900.s8FkUPV1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030900.s8FkUPV1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'runnable' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'idle' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'waiting' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'has_ref' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'in_progress' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'stopped_groups' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'mem' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'input' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'output' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'input_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'output_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'gpu_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'ref' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'gt' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'sync64' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'bo' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'offset' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'kmap' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'lock' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'id' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'last_fence' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'in_flight_jobs' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'slots' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'slot_count' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:701: warning: Excess struct member 'data' description in 'panthor_group'
   drivers/gpu/drm/panthor/panthor_sched.c:701: warning: Excess struct member 'lock' description in 'panthor_group'
>> drivers/gpu/drm/panthor/panthor_sched.c:701: warning: Excess struct member 'kbo_sizes' description in 'panthor_group'
   drivers/gpu/drm/panthor/panthor_sched.c:837: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:837: warning: Excess struct member 'size' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:837: warning: Excess struct member 'latest_flush' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:837: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:837: warning: Excess struct member 'end' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:837: warning: Excess struct member 'mask' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:837: warning: Excess struct member 'slot' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:1766: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:1766: warning: Function parameter or struct member 'events' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:2659: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_mmu_fault'


vim +701 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d Boris Brezillon 2024-02-29  529  
de85488138247d Boris Brezillon 2024-02-29  530  /**
de85488138247d Boris Brezillon 2024-02-29  531   * struct panthor_group - Scheduling group object
de85488138247d Boris Brezillon 2024-02-29  532   */
de85488138247d Boris Brezillon 2024-02-29  533  struct panthor_group {
de85488138247d Boris Brezillon 2024-02-29  534  	/** @refcount: Reference count */
de85488138247d Boris Brezillon 2024-02-29  535  	struct kref refcount;
de85488138247d Boris Brezillon 2024-02-29  536  
de85488138247d Boris Brezillon 2024-02-29  537  	/** @ptdev: Device. */
de85488138247d Boris Brezillon 2024-02-29  538  	struct panthor_device *ptdev;
de85488138247d Boris Brezillon 2024-02-29  539  
de85488138247d Boris Brezillon 2024-02-29  540  	/** @vm: VM bound to the group. */
de85488138247d Boris Brezillon 2024-02-29  541  	struct panthor_vm *vm;
de85488138247d Boris Brezillon 2024-02-29  542  
de85488138247d Boris Brezillon 2024-02-29  543  	/** @compute_core_mask: Mask of shader cores that can be used for compute jobs. */
de85488138247d Boris Brezillon 2024-02-29  544  	u64 compute_core_mask;
de85488138247d Boris Brezillon 2024-02-29  545  
de85488138247d Boris Brezillon 2024-02-29  546  	/** @fragment_core_mask: Mask of shader cores that can be used for fragment jobs. */
de85488138247d Boris Brezillon 2024-02-29  547  	u64 fragment_core_mask;
de85488138247d Boris Brezillon 2024-02-29  548  
de85488138247d Boris Brezillon 2024-02-29  549  	/** @tiler_core_mask: Mask of tiler cores that can be used for tiler jobs. */
de85488138247d Boris Brezillon 2024-02-29  550  	u64 tiler_core_mask;
de85488138247d Boris Brezillon 2024-02-29  551  
de85488138247d Boris Brezillon 2024-02-29  552  	/** @max_compute_cores: Maximum number of shader cores used for compute jobs. */
de85488138247d Boris Brezillon 2024-02-29  553  	u8 max_compute_cores;
de85488138247d Boris Brezillon 2024-02-29  554  
be7ffc821f5fc2 Liviu Dudau     2024-04-02  555  	/** @max_fragment_cores: Maximum number of shader cores used for fragment jobs. */
de85488138247d Boris Brezillon 2024-02-29  556  	u8 max_fragment_cores;
de85488138247d Boris Brezillon 2024-02-29  557  
de85488138247d Boris Brezillon 2024-02-29  558  	/** @max_tiler_cores: Maximum number of tiler cores used for tiler jobs. */
de85488138247d Boris Brezillon 2024-02-29  559  	u8 max_tiler_cores;
de85488138247d Boris Brezillon 2024-02-29  560  
de85488138247d Boris Brezillon 2024-02-29  561  	/** @priority: Group priority (check panthor_csg_priority). */
de85488138247d Boris Brezillon 2024-02-29  562  	u8 priority;
de85488138247d Boris Brezillon 2024-02-29  563  
de85488138247d Boris Brezillon 2024-02-29  564  	/** @blocked_queues: Bitmask reflecting the blocked queues. */
de85488138247d Boris Brezillon 2024-02-29  565  	u32 blocked_queues;
de85488138247d Boris Brezillon 2024-02-29  566  
de85488138247d Boris Brezillon 2024-02-29  567  	/** @idle_queues: Bitmask reflecting the idle queues. */
de85488138247d Boris Brezillon 2024-02-29  568  	u32 idle_queues;
de85488138247d Boris Brezillon 2024-02-29  569  
de85488138247d Boris Brezillon 2024-02-29  570  	/** @fatal_lock: Lock used to protect access to fatal fields. */
de85488138247d Boris Brezillon 2024-02-29  571  	spinlock_t fatal_lock;
de85488138247d Boris Brezillon 2024-02-29  572  
de85488138247d Boris Brezillon 2024-02-29  573  	/** @fatal_queues: Bitmask reflecting the queues that hit a fatal exception. */
de85488138247d Boris Brezillon 2024-02-29  574  	u32 fatal_queues;
de85488138247d Boris Brezillon 2024-02-29  575  
de85488138247d Boris Brezillon 2024-02-29  576  	/** @tiler_oom: Mask of queues that have a tiler OOM event to process. */
de85488138247d Boris Brezillon 2024-02-29  577  	atomic_t tiler_oom;
de85488138247d Boris Brezillon 2024-02-29  578  
de85488138247d Boris Brezillon 2024-02-29  579  	/** @queue_count: Number of queues in this group. */
de85488138247d Boris Brezillon 2024-02-29  580  	u32 queue_count;
de85488138247d Boris Brezillon 2024-02-29  581  
de85488138247d Boris Brezillon 2024-02-29  582  	/** @queues: Queues owned by this group. */
de85488138247d Boris Brezillon 2024-02-29  583  	struct panthor_queue *queues[MAX_CS_PER_CSG];
de85488138247d Boris Brezillon 2024-02-29  584  
de85488138247d Boris Brezillon 2024-02-29  585  	/**
de85488138247d Boris Brezillon 2024-02-29  586  	 * @csg_id: ID of the FW group slot.
de85488138247d Boris Brezillon 2024-02-29  587  	 *
de85488138247d Boris Brezillon 2024-02-29  588  	 * -1 when the group is not scheduled/active.
de85488138247d Boris Brezillon 2024-02-29  589  	 */
de85488138247d Boris Brezillon 2024-02-29  590  	int csg_id;
de85488138247d Boris Brezillon 2024-02-29  591  
de85488138247d Boris Brezillon 2024-02-29  592  	/**
de85488138247d Boris Brezillon 2024-02-29  593  	 * @destroyed: True when the group has been destroyed.
de85488138247d Boris Brezillon 2024-02-29  594  	 *
de85488138247d Boris Brezillon 2024-02-29  595  	 * If a group is destroyed it becomes useless: no further jobs can be submitted
de85488138247d Boris Brezillon 2024-02-29  596  	 * to its queues. We simply wait for all references to be dropped so we can
de85488138247d Boris Brezillon 2024-02-29  597  	 * release the group object.
de85488138247d Boris Brezillon 2024-02-29  598  	 */
de85488138247d Boris Brezillon 2024-02-29  599  	bool destroyed;
de85488138247d Boris Brezillon 2024-02-29  600  
de85488138247d Boris Brezillon 2024-02-29  601  	/**
de85488138247d Boris Brezillon 2024-02-29  602  	 * @timedout: True when a timeout occurred on any of the queues owned by
de85488138247d Boris Brezillon 2024-02-29  603  	 * this group.
de85488138247d Boris Brezillon 2024-02-29  604  	 *
4700fd3e050da8 Boris Brezillon 2024-10-29  605  	 * Timeouts can be reported by drm_sched or by the FW. If a reset is required,
4700fd3e050da8 Boris Brezillon 2024-10-29  606  	 * and the group can't be suspended, this also leads to a timeout. In any case,
4700fd3e050da8 Boris Brezillon 2024-10-29  607  	 * any timeout situation is unrecoverable, and the group becomes useless. We
4700fd3e050da8 Boris Brezillon 2024-10-29  608  	 * simply wait for all references to be dropped so we can release the group
4700fd3e050da8 Boris Brezillon 2024-10-29  609  	 * object.
de85488138247d Boris Brezillon 2024-02-29  610  	 */
de85488138247d Boris Brezillon 2024-02-29  611  	bool timedout;
de85488138247d Boris Brezillon 2024-02-29  612  
4181576d85c642 Boris Brezillon 2024-12-11  613  	/**
4181576d85c642 Boris Brezillon 2024-12-11  614  	 * @innocent: True when the group becomes unusable because the group suspension
4181576d85c642 Boris Brezillon 2024-12-11  615  	 * failed during a reset.
4181576d85c642 Boris Brezillon 2024-12-11  616  	 *
4181576d85c642 Boris Brezillon 2024-12-11  617  	 * Sometimes the FW was put in a bad state by other groups, causing the group
4181576d85c642 Boris Brezillon 2024-12-11  618  	 * suspension happening in the reset path to fail. In that case, we consider the
4181576d85c642 Boris Brezillon 2024-12-11  619  	 * group innocent.
4181576d85c642 Boris Brezillon 2024-12-11  620  	 */
4181576d85c642 Boris Brezillon 2024-12-11  621  	bool innocent;
4181576d85c642 Boris Brezillon 2024-12-11  622  
de85488138247d Boris Brezillon 2024-02-29  623  	/**
de85488138247d Boris Brezillon 2024-02-29  624  	 * @syncobjs: Pool of per-queue synchronization objects.
de85488138247d Boris Brezillon 2024-02-29  625  	 *
de85488138247d Boris Brezillon 2024-02-29  626  	 * One sync object per queue. The position of the sync object is
de85488138247d Boris Brezillon 2024-02-29  627  	 * determined by the queue index.
de85488138247d Boris Brezillon 2024-02-29  628  	 */
de85488138247d Boris Brezillon 2024-02-29  629  	struct panthor_kernel_bo *syncobjs;
de85488138247d Boris Brezillon 2024-02-29  630  
1026b1b65955e8 Adrián Larumbe  2025-01-02  631  	/** @fdinfo: Per-group total cycle and timestamp values and kernel BO sizes. */
e16635d88fa07b Adrián Larumbe  2024-09-24  632  	struct {
e16635d88fa07b Adrián Larumbe  2024-09-24  633  		/** @data: Total sampled values for jobs in queues from this group. */
e16635d88fa07b Adrián Larumbe  2024-09-24  634  		struct panthor_gpu_usage data;
e16635d88fa07b Adrián Larumbe  2024-09-24  635  
e16635d88fa07b Adrián Larumbe  2024-09-24  636  		/**
e16635d88fa07b Adrián Larumbe  2024-09-24  637  		 * @lock: Mutex to govern concurrent access from drm file's fdinfo callback
e16635d88fa07b Adrián Larumbe  2024-09-24  638  		 * and job post-completion processing function
e16635d88fa07b Adrián Larumbe  2024-09-24  639  		 */
e16635d88fa07b Adrián Larumbe  2024-09-24  640  		struct mutex lock;
1026b1b65955e8 Adrián Larumbe  2025-01-02  641  
1026b1b65955e8 Adrián Larumbe  2025-01-02  642  		/** @kbo_sizes: Aggregate size of private kernel BO's held by the group. */
1026b1b65955e8 Adrián Larumbe  2025-01-02  643  		size_t kbo_sizes;
e16635d88fa07b Adrián Larumbe  2024-09-24  644  	} fdinfo;
e16635d88fa07b Adrián Larumbe  2024-09-24  645  
de85488138247d Boris Brezillon 2024-02-29  646  	/** @state: Group state. */
de85488138247d Boris Brezillon 2024-02-29  647  	enum panthor_group_state state;
de85488138247d Boris Brezillon 2024-02-29  648  
de85488138247d Boris Brezillon 2024-02-29  649  	/**
de85488138247d Boris Brezillon 2024-02-29  650  	 * @suspend_buf: Suspend buffer.
de85488138247d Boris Brezillon 2024-02-29  651  	 *
de85488138247d Boris Brezillon 2024-02-29  652  	 * Stores the state of the group and its queues when a group is suspended.
de85488138247d Boris Brezillon 2024-02-29  653  	 * Used at resume time to restore the group in its previous state.
de85488138247d Boris Brezillon 2024-02-29  654  	 *
de85488138247d Boris Brezillon 2024-02-29  655  	 * The size of the suspend buffer is exposed through the FW interface.
de85488138247d Boris Brezillon 2024-02-29  656  	 */
de85488138247d Boris Brezillon 2024-02-29  657  	struct panthor_kernel_bo *suspend_buf;
de85488138247d Boris Brezillon 2024-02-29  658  
de85488138247d Boris Brezillon 2024-02-29  659  	/**
de85488138247d Boris Brezillon 2024-02-29  660  	 * @protm_suspend_buf: Protection mode suspend buffer.
de85488138247d Boris Brezillon 2024-02-29  661  	 *
de85488138247d Boris Brezillon 2024-02-29  662  	 * Stores the state of the group and its queues when a group that's in
de85488138247d Boris Brezillon 2024-02-29  663  	 * protection mode is suspended.
de85488138247d Boris Brezillon 2024-02-29  664  	 *
de85488138247d Boris Brezillon 2024-02-29  665  	 * Used at resume time to restore the group in its previous state.
de85488138247d Boris Brezillon 2024-02-29  666  	 *
de85488138247d Boris Brezillon 2024-02-29  667  	 * The size of the protection mode suspend buffer is exposed through the
de85488138247d Boris Brezillon 2024-02-29  668  	 * FW interface.
de85488138247d Boris Brezillon 2024-02-29  669  	 */
de85488138247d Boris Brezillon 2024-02-29  670  	struct panthor_kernel_bo *protm_suspend_buf;
de85488138247d Boris Brezillon 2024-02-29  671  
de85488138247d Boris Brezillon 2024-02-29  672  	/** @sync_upd_work: Work used to check/signal job fences. */
de85488138247d Boris Brezillon 2024-02-29  673  	struct work_struct sync_upd_work;
de85488138247d Boris Brezillon 2024-02-29  674  
de85488138247d Boris Brezillon 2024-02-29  675  	/** @tiler_oom_work: Work used to process tiler OOM events happening on this group. */
de85488138247d Boris Brezillon 2024-02-29  676  	struct work_struct tiler_oom_work;
de85488138247d Boris Brezillon 2024-02-29  677  
de85488138247d Boris Brezillon 2024-02-29  678  	/** @term_work: Work used to finish the group termination procedure. */
de85488138247d Boris Brezillon 2024-02-29  679  	struct work_struct term_work;
de85488138247d Boris Brezillon 2024-02-29  680  
de85488138247d Boris Brezillon 2024-02-29  681  	/**
de85488138247d Boris Brezillon 2024-02-29  682  	 * @release_work: Work used to release group resources.
de85488138247d Boris Brezillon 2024-02-29  683  	 *
de85488138247d Boris Brezillon 2024-02-29  684  	 * We need to postpone the group release to avoid a deadlock when
de85488138247d Boris Brezillon 2024-02-29  685  	 * the last ref is released in the tick work.
de85488138247d Boris Brezillon 2024-02-29  686  	 */
de85488138247d Boris Brezillon 2024-02-29  687  	struct work_struct release_work;
de85488138247d Boris Brezillon 2024-02-29  688  
de85488138247d Boris Brezillon 2024-02-29  689  	/**
de85488138247d Boris Brezillon 2024-02-29  690  	 * @run_node: Node used to insert the group in the
de85488138247d Boris Brezillon 2024-02-29  691  	 * panthor_group::groups::{runnable,idle} and
de85488138247d Boris Brezillon 2024-02-29  692  	 * panthor_group::reset.stopped_groups lists.
de85488138247d Boris Brezillon 2024-02-29  693  	 */
de85488138247d Boris Brezillon 2024-02-29  694  	struct list_head run_node;
de85488138247d Boris Brezillon 2024-02-29  695  
de85488138247d Boris Brezillon 2024-02-29  696  	/**
de85488138247d Boris Brezillon 2024-02-29  697  	 * @wait_node: Node used to insert the group in the
de85488138247d Boris Brezillon 2024-02-29  698  	 * panthor_group::groups::waiting list.
de85488138247d Boris Brezillon 2024-02-29  699  	 */
de85488138247d Boris Brezillon 2024-02-29  700  	struct list_head wait_node;
de85488138247d Boris Brezillon 2024-02-29 @701  };
de85488138247d Boris Brezillon 2024-02-29  702  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
