Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC7D87600C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 09:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCE110F905;
	Fri,  8 Mar 2024 08:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMTrgmgy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29C910F905
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887669; x=1741423669;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PTZNCNhRJDslkq3RnkGDtpjjrUDk9ero7gQgpBOYRwg=;
 b=VMTrgmgyVmDsK/FWZP/kzqqzf5MSWIVeJa3Nm5W+sjJ0U5fErzYUGAup
 U1UoFJYTV0YBfDNuI5TR9TyAi8D5UKfNh2/4tin9N4h+EmXfKJ0MqUkC2
 ThT3CEETSqbllYz+jmHGZEJxjpetaZsfgyQZRW/qLtKS5b++7/cRxH6RW
 TvXb4jm/xO6U8K5chvHgdNSAUVLKZCF1ucBMcDTfAbA6GFVGhV/yzcZFA
 sRzpOmOCzHRKtOVdS3qYtNtO50tzi7OaobBayHZZrqgug115TRnUbyfyj
 P3TxZQK7WCStVG+pTRjYqbEnW8dch6+LGB242TEz/CTkuknamlOKwg5VB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15166251"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15166251"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="14887475"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 08 Mar 2024 00:47:45 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1riVtG-0006DN-1W;
 Fri, 08 Mar 2024 08:47:42 +0000
Date: Fri, 8 Mar 2024 16:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 boris.brezillon@collabora.com, steven.price@arm.com,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, adrian.larumbe@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH 1/2] drm/panthor: Enable fdinfo for cycle and time
 measurements
Message-ID: <202403081627.Y50ZoOIS-lkp@intel.com>
References: <20240305211000.659103-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305211000.659103-2-adrian.larumbe@collabora.com>
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

[auto build test WARNING on e635b7eb7062b464bbd9795308b1a80eac0b01f5]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-Enable-fdinfo-for-cycle-and-time-measurements/20240306-051418
base:   e635b7eb7062b464bbd9795308b1a80eac0b01f5
patch link:    https://lore.kernel.org/r/20240305211000.659103-2-adrian.larumbe%40collabora.com
patch subject: [PATCH 1/2] drm/panthor: Enable fdinfo for cycle and time measurements
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240308/202403081627.Y50ZoOIS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081627.Y50ZoOIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081627.Y50ZoOIS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_sched.c:321: warning: Excess struct member 'runnable' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:321: warning: Excess struct member 'idle' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:321: warning: Excess struct member 'waiting' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:321: warning: Excess struct member 'has_ref' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:321: warning: Excess struct member 'in_progress' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:321: warning: Excess struct member 'stopped_groups' description in 'panthor_scheduler'
>> drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'nelem' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'mem' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'input' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'output' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'input_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'output_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'gpu_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'ref' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'gt' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'sync64' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'bo' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'offset' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'kmap' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'lock' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'id' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:480: warning: Excess struct member 'in_flight_jobs' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:670: warning: Function parameter or struct member 'max_fragment_cores' not described in 'panthor_group'
>> drivers/gpu/drm/panthor/panthor_sched.c:670: warning: Excess struct member 'bo' description in 'panthor_group'
>> drivers/gpu/drm/panthor/panthor_sched.c:670: warning: Excess struct member 'times_offset' description in 'panthor_group'
>> drivers/gpu/drm/panthor/panthor_sched.c:670: warning: Excess struct member 'data' description in 'panthor_group'
>> drivers/gpu/drm/panthor/panthor_sched.c:670: warning: Excess struct member 'lock' description in 'panthor_group'
   drivers/gpu/drm/panthor/panthor_sched.c:800: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:800: warning: Excess struct member 'size' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:800: warning: Excess struct member 'latest_flush' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:800: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:800: warning: Excess struct member 'end' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:1043: warning: Cannot understand  * @cs_slot_reset_locked() - Reset a queue slot
    on line 1043 - I thought it was a doc line
   drivers/gpu/drm/panthor/panthor_sched.c:1645: warning: expecting prototype for panthor_sched_process_global_irq(). Prototype was for sched_process_global_irq_locked() instead
   drivers/gpu/drm/panthor/panthor_sched.c:1687: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:1687: warning: Function parameter or struct member 'events' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:1711: warning: Cannot understand  */
    on line 1711 - I thought it was a doc line
   drivers/gpu/drm/panthor/panthor_sched.c:2583: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_mmu_fault'


vim +480 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d Boris Brezillon 2024-02-29  396  
de85488138247d Boris Brezillon 2024-02-29  397  	/** @ringbuf: Command stream ring-buffer. */
93e3ba65963905 Adrián Larumbe  2024-03-05  398  	struct {
93e3ba65963905 Adrián Larumbe  2024-03-05  399  		/** @ringbuf: Kernel BO that holds ring buffer. */
93e3ba65963905 Adrián Larumbe  2024-03-05  400  		struct panthor_kernel_bo *bo;
93e3ba65963905 Adrián Larumbe  2024-03-05  401  
93e3ba65963905 Adrián Larumbe  2024-03-05  402  		/** @nelem: Number of slots in the ring buffer. */
93e3ba65963905 Adrián Larumbe  2024-03-05  403  		unsigned int nelem;
93e3ba65963905 Adrián Larumbe  2024-03-05  404  	} ringbuf;
de85488138247d Boris Brezillon 2024-02-29  405  
de85488138247d Boris Brezillon 2024-02-29  406  	/** @iface: Firmware interface. */
de85488138247d Boris Brezillon 2024-02-29  407  	struct {
de85488138247d Boris Brezillon 2024-02-29  408  		/** @mem: FW memory allocated for this interface. */
de85488138247d Boris Brezillon 2024-02-29  409  		struct panthor_kernel_bo *mem;
de85488138247d Boris Brezillon 2024-02-29  410  
de85488138247d Boris Brezillon 2024-02-29  411  		/** @input: Input interface. */
de85488138247d Boris Brezillon 2024-02-29  412  		struct panthor_fw_ringbuf_input_iface *input;
de85488138247d Boris Brezillon 2024-02-29  413  
de85488138247d Boris Brezillon 2024-02-29  414  		/** @output: Output interface. */
de85488138247d Boris Brezillon 2024-02-29  415  		const struct panthor_fw_ringbuf_output_iface *output;
de85488138247d Boris Brezillon 2024-02-29  416  
de85488138247d Boris Brezillon 2024-02-29  417  		/** @input_fw_va: FW virtual address of the input interface buffer. */
de85488138247d Boris Brezillon 2024-02-29  418  		u32 input_fw_va;
de85488138247d Boris Brezillon 2024-02-29  419  
de85488138247d Boris Brezillon 2024-02-29  420  		/** @output_fw_va: FW virtual address of the output interface buffer. */
de85488138247d Boris Brezillon 2024-02-29  421  		u32 output_fw_va;
de85488138247d Boris Brezillon 2024-02-29  422  	} iface;
de85488138247d Boris Brezillon 2024-02-29  423  
de85488138247d Boris Brezillon 2024-02-29  424  	/**
de85488138247d Boris Brezillon 2024-02-29  425  	 * @syncwait: Stores information about the synchronization object this
de85488138247d Boris Brezillon 2024-02-29  426  	 * queue is waiting on.
de85488138247d Boris Brezillon 2024-02-29  427  	 */
de85488138247d Boris Brezillon 2024-02-29  428  	struct {
de85488138247d Boris Brezillon 2024-02-29  429  		/** @gpu_va: GPU address of the synchronization object. */
de85488138247d Boris Brezillon 2024-02-29  430  		u64 gpu_va;
de85488138247d Boris Brezillon 2024-02-29  431  
de85488138247d Boris Brezillon 2024-02-29  432  		/** @ref: Reference value to compare against. */
de85488138247d Boris Brezillon 2024-02-29  433  		u64 ref;
de85488138247d Boris Brezillon 2024-02-29  434  
de85488138247d Boris Brezillon 2024-02-29  435  		/** @gt: True if this is a greater-than test. */
de85488138247d Boris Brezillon 2024-02-29  436  		bool gt;
de85488138247d Boris Brezillon 2024-02-29  437  
de85488138247d Boris Brezillon 2024-02-29  438  		/** @sync64: True if this is a 64-bit sync object. */
de85488138247d Boris Brezillon 2024-02-29  439  		bool sync64;
de85488138247d Boris Brezillon 2024-02-29  440  
de85488138247d Boris Brezillon 2024-02-29  441  		/** @bo: Buffer object holding the synchronization object. */
de85488138247d Boris Brezillon 2024-02-29  442  		struct drm_gem_object *obj;
de85488138247d Boris Brezillon 2024-02-29  443  
de85488138247d Boris Brezillon 2024-02-29  444  		/** @offset: Offset of the synchronization object inside @bo. */
de85488138247d Boris Brezillon 2024-02-29  445  		u64 offset;
de85488138247d Boris Brezillon 2024-02-29  446  
de85488138247d Boris Brezillon 2024-02-29  447  		/**
de85488138247d Boris Brezillon 2024-02-29  448  		 * @kmap: Kernel mapping of the buffer object holding the
de85488138247d Boris Brezillon 2024-02-29  449  		 * synchronization object.
de85488138247d Boris Brezillon 2024-02-29  450  		 */
de85488138247d Boris Brezillon 2024-02-29  451  		void *kmap;
de85488138247d Boris Brezillon 2024-02-29  452  	} syncwait;
de85488138247d Boris Brezillon 2024-02-29  453  
de85488138247d Boris Brezillon 2024-02-29  454  	/** @fence_ctx: Fence context fields. */
de85488138247d Boris Brezillon 2024-02-29  455  	struct {
de85488138247d Boris Brezillon 2024-02-29  456  		/** @lock: Used to protect access to all fences allocated by this context. */
de85488138247d Boris Brezillon 2024-02-29  457  		spinlock_t lock;
de85488138247d Boris Brezillon 2024-02-29  458  
de85488138247d Boris Brezillon 2024-02-29  459  		/**
de85488138247d Boris Brezillon 2024-02-29  460  		 * @id: Fence context ID.
de85488138247d Boris Brezillon 2024-02-29  461  		 *
de85488138247d Boris Brezillon 2024-02-29  462  		 * Allocated with dma_fence_context_alloc().
de85488138247d Boris Brezillon 2024-02-29  463  		 */
de85488138247d Boris Brezillon 2024-02-29  464  		u64 id;
de85488138247d Boris Brezillon 2024-02-29  465  
de85488138247d Boris Brezillon 2024-02-29  466  		/** @seqno: Sequence number of the last initialized fence. */
de85488138247d Boris Brezillon 2024-02-29  467  		atomic64_t seqno;
de85488138247d Boris Brezillon 2024-02-29  468  
de85488138247d Boris Brezillon 2024-02-29  469  		/**
de85488138247d Boris Brezillon 2024-02-29  470  		 * @in_flight_jobs: List containing all in-flight jobs.
de85488138247d Boris Brezillon 2024-02-29  471  		 *
de85488138247d Boris Brezillon 2024-02-29  472  		 * Used to keep track and signal panthor_job::done_fence when the
de85488138247d Boris Brezillon 2024-02-29  473  		 * synchronization object attached to the queue is signaled.
de85488138247d Boris Brezillon 2024-02-29  474  		 */
de85488138247d Boris Brezillon 2024-02-29  475  		struct list_head in_flight_jobs;
de85488138247d Boris Brezillon 2024-02-29  476  	} fence_ctx;
93e3ba65963905 Adrián Larumbe  2024-03-05  477  
93e3ba65963905 Adrián Larumbe  2024-03-05  478  	/** @time_offset: Offset of fdinfo stats structs in queue's syncobj. */
93e3ba65963905 Adrián Larumbe  2024-03-05  479  	unsigned long time_offset;
de85488138247d Boris Brezillon 2024-02-29 @480  };
de85488138247d Boris Brezillon 2024-02-29  481  
de85488138247d Boris Brezillon 2024-02-29  482  /**
de85488138247d Boris Brezillon 2024-02-29  483   * enum panthor_group_state - Scheduling group state.
de85488138247d Boris Brezillon 2024-02-29  484   */
de85488138247d Boris Brezillon 2024-02-29  485  enum panthor_group_state {
de85488138247d Boris Brezillon 2024-02-29  486  	/** @PANTHOR_CS_GROUP_CREATED: Group was created, but not scheduled yet. */
de85488138247d Boris Brezillon 2024-02-29  487  	PANTHOR_CS_GROUP_CREATED,
de85488138247d Boris Brezillon 2024-02-29  488  
de85488138247d Boris Brezillon 2024-02-29  489  	/** @PANTHOR_CS_GROUP_ACTIVE: Group is currently scheduled. */
de85488138247d Boris Brezillon 2024-02-29  490  	PANTHOR_CS_GROUP_ACTIVE,
de85488138247d Boris Brezillon 2024-02-29  491  
de85488138247d Boris Brezillon 2024-02-29  492  	/**
de85488138247d Boris Brezillon 2024-02-29  493  	 * @PANTHOR_CS_GROUP_SUSPENDED: Group was scheduled at least once, but is
de85488138247d Boris Brezillon 2024-02-29  494  	 * inactive/suspended right now.
de85488138247d Boris Brezillon 2024-02-29  495  	 */
de85488138247d Boris Brezillon 2024-02-29  496  	PANTHOR_CS_GROUP_SUSPENDED,
de85488138247d Boris Brezillon 2024-02-29  497  
de85488138247d Boris Brezillon 2024-02-29  498  	/**
de85488138247d Boris Brezillon 2024-02-29  499  	 * @PANTHOR_CS_GROUP_TERMINATED: Group was terminated.
de85488138247d Boris Brezillon 2024-02-29  500  	 *
de85488138247d Boris Brezillon 2024-02-29  501  	 * Can no longer be scheduled. The only allowed action is a destruction.
de85488138247d Boris Brezillon 2024-02-29  502  	 */
de85488138247d Boris Brezillon 2024-02-29  503  	PANTHOR_CS_GROUP_TERMINATED,
de85488138247d Boris Brezillon 2024-02-29  504  };
de85488138247d Boris Brezillon 2024-02-29  505  
de85488138247d Boris Brezillon 2024-02-29  506  /**
de85488138247d Boris Brezillon 2024-02-29  507   * struct panthor_group - Scheduling group object
de85488138247d Boris Brezillon 2024-02-29  508   */
de85488138247d Boris Brezillon 2024-02-29  509  struct panthor_group {
de85488138247d Boris Brezillon 2024-02-29  510  	/** @refcount: Reference count */
de85488138247d Boris Brezillon 2024-02-29  511  	struct kref refcount;
de85488138247d Boris Brezillon 2024-02-29  512  
de85488138247d Boris Brezillon 2024-02-29  513  	/** @ptdev: Device. */
de85488138247d Boris Brezillon 2024-02-29  514  	struct panthor_device *ptdev;
de85488138247d Boris Brezillon 2024-02-29  515  
de85488138247d Boris Brezillon 2024-02-29  516  	/** @vm: VM bound to the group. */
de85488138247d Boris Brezillon 2024-02-29  517  	struct panthor_vm *vm;
de85488138247d Boris Brezillon 2024-02-29  518  
de85488138247d Boris Brezillon 2024-02-29  519  	/** @compute_core_mask: Mask of shader cores that can be used for compute jobs. */
de85488138247d Boris Brezillon 2024-02-29  520  	u64 compute_core_mask;
de85488138247d Boris Brezillon 2024-02-29  521  
de85488138247d Boris Brezillon 2024-02-29  522  	/** @fragment_core_mask: Mask of shader cores that can be used for fragment jobs. */
de85488138247d Boris Brezillon 2024-02-29  523  	u64 fragment_core_mask;
de85488138247d Boris Brezillon 2024-02-29  524  
de85488138247d Boris Brezillon 2024-02-29  525  	/** @tiler_core_mask: Mask of tiler cores that can be used for tiler jobs. */
de85488138247d Boris Brezillon 2024-02-29  526  	u64 tiler_core_mask;
de85488138247d Boris Brezillon 2024-02-29  527  
de85488138247d Boris Brezillon 2024-02-29  528  	/** @max_compute_cores: Maximum number of shader cores used for compute jobs. */
de85488138247d Boris Brezillon 2024-02-29  529  	u8 max_compute_cores;
de85488138247d Boris Brezillon 2024-02-29  530  
de85488138247d Boris Brezillon 2024-02-29  531  	/** @max_compute_cores: Maximum number of shader cores used for fragment jobs. */
de85488138247d Boris Brezillon 2024-02-29  532  	u8 max_fragment_cores;
de85488138247d Boris Brezillon 2024-02-29  533  
de85488138247d Boris Brezillon 2024-02-29  534  	/** @max_tiler_cores: Maximum number of tiler cores used for tiler jobs. */
de85488138247d Boris Brezillon 2024-02-29  535  	u8 max_tiler_cores;
de85488138247d Boris Brezillon 2024-02-29  536  
de85488138247d Boris Brezillon 2024-02-29  537  	/** @priority: Group priority (check panthor_csg_priority). */
de85488138247d Boris Brezillon 2024-02-29  538  	u8 priority;
de85488138247d Boris Brezillon 2024-02-29  539  
de85488138247d Boris Brezillon 2024-02-29  540  	/** @blocked_queues: Bitmask reflecting the blocked queues. */
de85488138247d Boris Brezillon 2024-02-29  541  	u32 blocked_queues;
de85488138247d Boris Brezillon 2024-02-29  542  
de85488138247d Boris Brezillon 2024-02-29  543  	/** @idle_queues: Bitmask reflecting the idle queues. */
de85488138247d Boris Brezillon 2024-02-29  544  	u32 idle_queues;
de85488138247d Boris Brezillon 2024-02-29  545  
de85488138247d Boris Brezillon 2024-02-29  546  	/** @fatal_lock: Lock used to protect access to fatal fields. */
de85488138247d Boris Brezillon 2024-02-29  547  	spinlock_t fatal_lock;
de85488138247d Boris Brezillon 2024-02-29  548  
de85488138247d Boris Brezillon 2024-02-29  549  	/** @fatal_queues: Bitmask reflecting the queues that hit a fatal exception. */
de85488138247d Boris Brezillon 2024-02-29  550  	u32 fatal_queues;
de85488138247d Boris Brezillon 2024-02-29  551  
de85488138247d Boris Brezillon 2024-02-29  552  	/** @tiler_oom: Mask of queues that have a tiler OOM event to process. */
de85488138247d Boris Brezillon 2024-02-29  553  	atomic_t tiler_oom;
de85488138247d Boris Brezillon 2024-02-29  554  
de85488138247d Boris Brezillon 2024-02-29  555  	/** @queue_count: Number of queues in this group. */
de85488138247d Boris Brezillon 2024-02-29  556  	u32 queue_count;
de85488138247d Boris Brezillon 2024-02-29  557  
de85488138247d Boris Brezillon 2024-02-29  558  	/** @queues: Queues owned by this group. */
de85488138247d Boris Brezillon 2024-02-29  559  	struct panthor_queue *queues[MAX_CS_PER_CSG];
de85488138247d Boris Brezillon 2024-02-29  560  
de85488138247d Boris Brezillon 2024-02-29  561  	/**
de85488138247d Boris Brezillon 2024-02-29  562  	 * @csg_id: ID of the FW group slot.
de85488138247d Boris Brezillon 2024-02-29  563  	 *
de85488138247d Boris Brezillon 2024-02-29  564  	 * -1 when the group is not scheduled/active.
de85488138247d Boris Brezillon 2024-02-29  565  	 */
de85488138247d Boris Brezillon 2024-02-29  566  	int csg_id;
de85488138247d Boris Brezillon 2024-02-29  567  
de85488138247d Boris Brezillon 2024-02-29  568  	/**
de85488138247d Boris Brezillon 2024-02-29  569  	 * @destroyed: True when the group has been destroyed.
de85488138247d Boris Brezillon 2024-02-29  570  	 *
de85488138247d Boris Brezillon 2024-02-29  571  	 * If a group is destroyed it becomes useless: no further jobs can be submitted
de85488138247d Boris Brezillon 2024-02-29  572  	 * to its queues. We simply wait for all references to be dropped so we can
de85488138247d Boris Brezillon 2024-02-29  573  	 * release the group object.
de85488138247d Boris Brezillon 2024-02-29  574  	 */
de85488138247d Boris Brezillon 2024-02-29  575  	bool destroyed;
de85488138247d Boris Brezillon 2024-02-29  576  
de85488138247d Boris Brezillon 2024-02-29  577  	/**
de85488138247d Boris Brezillon 2024-02-29  578  	 * @timedout: True when a timeout occurred on any of the queues owned by
de85488138247d Boris Brezillon 2024-02-29  579  	 * this group.
de85488138247d Boris Brezillon 2024-02-29  580  	 *
de85488138247d Boris Brezillon 2024-02-29  581  	 * Timeouts can be reported by drm_sched or by the FW. In any case, any
de85488138247d Boris Brezillon 2024-02-29  582  	 * timeout situation is unrecoverable, and the group becomes useless.
de85488138247d Boris Brezillon 2024-02-29  583  	 * We simply wait for all references to be dropped so we can release the
de85488138247d Boris Brezillon 2024-02-29  584  	 * group object.
de85488138247d Boris Brezillon 2024-02-29  585  	 */
de85488138247d Boris Brezillon 2024-02-29  586  	bool timedout;
de85488138247d Boris Brezillon 2024-02-29  587  
de85488138247d Boris Brezillon 2024-02-29  588  	/**
de85488138247d Boris Brezillon 2024-02-29  589  	 * @syncobjs: Pool of per-queue synchronization objects.
de85488138247d Boris Brezillon 2024-02-29  590  	 *
de85488138247d Boris Brezillon 2024-02-29  591  	 * One sync object per queue. The position of the sync object is
de85488138247d Boris Brezillon 2024-02-29  592  	 * determined by the queue index.
de85488138247d Boris Brezillon 2024-02-29  593  	 */
93e3ba65963905 Adrián Larumbe  2024-03-05  594  
93e3ba65963905 Adrián Larumbe  2024-03-05  595  	struct {
93e3ba65963905 Adrián Larumbe  2024-03-05  596  		/** @bo: Kernel BO holding the sync objects. */
93e3ba65963905 Adrián Larumbe  2024-03-05  597  		struct panthor_kernel_bo *bo;
93e3ba65963905 Adrián Larumbe  2024-03-05  598  
93e3ba65963905 Adrián Larumbe  2024-03-05  599  		/** @times_offset: Beginning of time stats after objects of sync pool. */
93e3ba65963905 Adrián Larumbe  2024-03-05  600  		size_t times_offset;
93e3ba65963905 Adrián Larumbe  2024-03-05  601  	} syncobjs;
93e3ba65963905 Adrián Larumbe  2024-03-05  602  
93e3ba65963905 Adrián Larumbe  2024-03-05  603  	/** @fdinfo: Per-file total cycle and timestamp values reference. */
93e3ba65963905 Adrián Larumbe  2024-03-05  604  	struct {
93e3ba65963905 Adrián Larumbe  2024-03-05  605  		/** @data: Pointer to actual per-file sample data. */
93e3ba65963905 Adrián Larumbe  2024-03-05  606  		struct panthor_gpu_usage *data;
93e3ba65963905 Adrián Larumbe  2024-03-05  607  
93e3ba65963905 Adrián Larumbe  2024-03-05  608  		/**
93e3ba65963905 Adrián Larumbe  2024-03-05  609  		 * @lock: Mutex to govern concurrent access from drm file's fdinfo callback
93e3ba65963905 Adrián Larumbe  2024-03-05  610  		 * and job post-completion processing function
93e3ba65963905 Adrián Larumbe  2024-03-05  611  		 */
93e3ba65963905 Adrián Larumbe  2024-03-05  612  		struct mutex lock;
93e3ba65963905 Adrián Larumbe  2024-03-05  613  	} fdinfo;
de85488138247d Boris Brezillon 2024-02-29  614  
de85488138247d Boris Brezillon 2024-02-29  615  	/** @state: Group state. */
de85488138247d Boris Brezillon 2024-02-29  616  	enum panthor_group_state state;
de85488138247d Boris Brezillon 2024-02-29  617  
de85488138247d Boris Brezillon 2024-02-29  618  	/**
de85488138247d Boris Brezillon 2024-02-29  619  	 * @suspend_buf: Suspend buffer.
de85488138247d Boris Brezillon 2024-02-29  620  	 *
de85488138247d Boris Brezillon 2024-02-29  621  	 * Stores the state of the group and its queues when a group is suspended.
de85488138247d Boris Brezillon 2024-02-29  622  	 * Used at resume time to restore the group in its previous state.
de85488138247d Boris Brezillon 2024-02-29  623  	 *
de85488138247d Boris Brezillon 2024-02-29  624  	 * The size of the suspend buffer is exposed through the FW interface.
de85488138247d Boris Brezillon 2024-02-29  625  	 */
de85488138247d Boris Brezillon 2024-02-29  626  	struct panthor_kernel_bo *suspend_buf;
de85488138247d Boris Brezillon 2024-02-29  627  
de85488138247d Boris Brezillon 2024-02-29  628  	/**
de85488138247d Boris Brezillon 2024-02-29  629  	 * @protm_suspend_buf: Protection mode suspend buffer.
de85488138247d Boris Brezillon 2024-02-29  630  	 *
de85488138247d Boris Brezillon 2024-02-29  631  	 * Stores the state of the group and its queues when a group that's in
de85488138247d Boris Brezillon 2024-02-29  632  	 * protection mode is suspended.
de85488138247d Boris Brezillon 2024-02-29  633  	 *
de85488138247d Boris Brezillon 2024-02-29  634  	 * Used at resume time to restore the group in its previous state.
de85488138247d Boris Brezillon 2024-02-29  635  	 *
de85488138247d Boris Brezillon 2024-02-29  636  	 * The size of the protection mode suspend buffer is exposed through the
de85488138247d Boris Brezillon 2024-02-29  637  	 * FW interface.
de85488138247d Boris Brezillon 2024-02-29  638  	 */
de85488138247d Boris Brezillon 2024-02-29  639  	struct panthor_kernel_bo *protm_suspend_buf;
de85488138247d Boris Brezillon 2024-02-29  640  
de85488138247d Boris Brezillon 2024-02-29  641  	/** @sync_upd_work: Work used to check/signal job fences. */
de85488138247d Boris Brezillon 2024-02-29  642  	struct work_struct sync_upd_work;
de85488138247d Boris Brezillon 2024-02-29  643  
de85488138247d Boris Brezillon 2024-02-29  644  	/** @tiler_oom_work: Work used to process tiler OOM events happening on this group. */
de85488138247d Boris Brezillon 2024-02-29  645  	struct work_struct tiler_oom_work;
de85488138247d Boris Brezillon 2024-02-29  646  
de85488138247d Boris Brezillon 2024-02-29  647  	/** @term_work: Work used to finish the group termination procedure. */
de85488138247d Boris Brezillon 2024-02-29  648  	struct work_struct term_work;
de85488138247d Boris Brezillon 2024-02-29  649  
de85488138247d Boris Brezillon 2024-02-29  650  	/**
de85488138247d Boris Brezillon 2024-02-29  651  	 * @release_work: Work used to release group resources.
de85488138247d Boris Brezillon 2024-02-29  652  	 *
de85488138247d Boris Brezillon 2024-02-29  653  	 * We need to postpone the group release to avoid a deadlock when
de85488138247d Boris Brezillon 2024-02-29  654  	 * the last ref is released in the tick work.
de85488138247d Boris Brezillon 2024-02-29  655  	 */
de85488138247d Boris Brezillon 2024-02-29  656  	struct work_struct release_work;
de85488138247d Boris Brezillon 2024-02-29  657  
de85488138247d Boris Brezillon 2024-02-29  658  	/**
de85488138247d Boris Brezillon 2024-02-29  659  	 * @run_node: Node used to insert the group in the
de85488138247d Boris Brezillon 2024-02-29  660  	 * panthor_group::groups::{runnable,idle} and
de85488138247d Boris Brezillon 2024-02-29  661  	 * panthor_group::reset.stopped_groups lists.
de85488138247d Boris Brezillon 2024-02-29  662  	 */
de85488138247d Boris Brezillon 2024-02-29  663  	struct list_head run_node;
de85488138247d Boris Brezillon 2024-02-29  664  
de85488138247d Boris Brezillon 2024-02-29  665  	/**
de85488138247d Boris Brezillon 2024-02-29  666  	 * @wait_node: Node used to insert the group in the
de85488138247d Boris Brezillon 2024-02-29  667  	 * panthor_group::groups::waiting list.
de85488138247d Boris Brezillon 2024-02-29  668  	 */
de85488138247d Boris Brezillon 2024-02-29  669  	struct list_head wait_node;
de85488138247d Boris Brezillon 2024-02-29 @670  };
de85488138247d Boris Brezillon 2024-02-29  671  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
