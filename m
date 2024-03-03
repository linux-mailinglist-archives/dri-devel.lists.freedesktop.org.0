Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A886F372
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 03:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840C410E474;
	Sun,  3 Mar 2024 02:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2dYWilS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BAF10E474
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 02:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709434509; x=1740970509;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=MUUDNlyQC9V568FLfV8HabwDat8X4P2p2cnsj0mA5j8=;
 b=I2dYWilSZUIJn5YM/SpzrleFpr5ObMquHTolEwAEatVA8p21vTIKP2c9
 vboF0SHaGogApD/AhQvBzoemd6G6MsprefzkPm+gqUu/D8vGGiwhPFDLQ
 uPyNNm+FLE7Nbfp4Rc02woEIaFpGmIRVF/nHhgIUcrY+sqgleUEIqzkLs
 pLAQ34EBsdMNuTjogZeDi25sNV8hscsG+Ct2v4x5C9iwJoQzDjGiNKLGW
 DM8NrJirCLH+/+utHAvMq8/gGnEL6sSxskdGGkEIedfOIqcmspefu+rv7
 hPTLsPEbYb2EX624VnJ1Ob0CJ1QXxyHGgpGPN6h3cNvkW4kwbSjn0+3m0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4116711"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4116711"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2024 18:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; d="scan'208";a="13287621"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 02 Mar 2024 18:55:07 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rgc0F-0000Su-2k;
 Sun, 03 Mar 2024 02:55:03 +0000
Date: Sun, 3 Mar 2024 10:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Subject: [drm-misc:drm-misc-next 12/14]
 drivers/gpu/drm/panthor/panthor_devfreq.c:45: warning: Function parameter or
 struct member 'lock' not described in 'panthor_devfreq'
Message-ID: <202403031019.6jvrOqGT-lkp@intel.com>
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

Hi Boris,

First bad commit (maybe != root cause):

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   216c1282dde38ca87ebdf1ccacee5a0682901574
commit: d72f049087d4f973f6332b599c92177e718107de [12/14] drm/panthor: Allow driver compilation
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240303/202403031019.6jvrOqGT-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031019.6jvrOqGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031019.6jvrOqGT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_devfreq.c:45: warning: Function parameter or struct member 'lock' not described in 'panthor_devfreq'
--
>> drivers/gpu/drm/panthor/panthor_fw.c:133: warning: Excess struct member 'start' description in 'panthor_fw_binary_section_entry_hdr'
>> drivers/gpu/drm/panthor/panthor_fw.c:133: warning: Excess struct member 'end' description in 'panthor_fw_binary_section_entry_hdr'
>> drivers/gpu/drm/panthor/panthor_fw.c:133: warning: Excess struct member 'start' description in 'panthor_fw_binary_section_entry_hdr'
>> drivers/gpu/drm/panthor/panthor_fw.c:133: warning: Excess struct member 'end' description in 'panthor_fw_binary_section_entry_hdr'
>> drivers/gpu/drm/panthor/panthor_fw.c:183: warning: Excess struct member 'buf' description in 'panthor_fw_section'
>> drivers/gpu/drm/panthor/panthor_fw.c:183: warning: Excess struct member 'size' description in 'panthor_fw_section'
>> drivers/gpu/drm/panthor/panthor_fw.c:265: warning: Excess struct member 'ping_work' description in 'panthor_fw'
--
>> drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Function parameter or struct member 'as' not described in 'panthor_mmu'
>> drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'slots_lock' description in 'panthor_mmu'
>> drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'alloc_mask' description in 'panthor_mmu'
>> drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'faulty_mask' description in 'panthor_mmu'
>> drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'slots' description in 'panthor_mmu'
>> drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'lru_list' description in 'panthor_mmu'
>> drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'lock' description in 'panthor_mmu'
>> drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'list' description in 'panthor_mmu'
>> drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'reset_in_progress' description in 'panthor_mmu'
>> drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'wq' description in 'panthor_mmu'
>> drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'count' description in 'panthor_vm_op_ctx'
>> drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'ptr' description in 'panthor_vm_op_ctx'
>> drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'page' description in 'panthor_vm_op_ctx'
>> drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'addr' description in 'panthor_vm_op_ctx'
>> drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'range' description in 'panthor_vm_op_ctx'
>> drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'vm_bo' description in 'panthor_vm_op_ctx'
>> drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'bo_offset' description in 'panthor_vm_op_ctx'
>> drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'sgt' description in 'panthor_vm_op_ctx'
>> drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'new_vma' description in 'panthor_vm_op_ctx'
>> drivers/gpu/drm/panthor/panthor_mmu.c:389: warning: Excess struct member 'start' description in 'panthor_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:389: warning: Excess struct member 'size' description in 'panthor_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:389: warning: Excess struct member 'id' description in 'panthor_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:389: warning: Excess struct member 'active_cnt' description in 'panthor_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:389: warning: Excess struct member 'lru_node' description in 'panthor_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:389: warning: Excess struct member 'pool' description in 'panthor_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:389: warning: Excess struct member 'lock' description in 'panthor_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:412: warning: Cannot understand  * @pt_cache: Cache used to allocate MMU page tables.
    on line 412 - I thought it was a doc line
   drivers/gpu/drm/panthor/panthor_mmu.c:481: warning: Cannot understand  * @free_pt() - Custom page table free function
    on line 481 - I thought it was a doc line
   drivers/gpu/drm/panthor/panthor_mmu.c:701: warning: Function parameter or struct member 'vm' not described in 'panthor_vm_active'
   drivers/gpu/drm/panthor/panthor_mmu.c:701: warning: Excess function parameter 'VM' description in 'panthor_vm_active'
   drivers/gpu/drm/panthor/panthor_mmu.c:810: warning: Function parameter or struct member 'vm' not described in 'panthor_vm_idle'
   drivers/gpu/drm/panthor/panthor_mmu.c:810: warning: Excess function parameter 'VM' description in 'panthor_vm_idle'
   drivers/gpu/drm/panthor/panthor_mmu.c:1012: warning: Function parameter or struct member 'vm' not described in 'panthor_vm_alloc_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1012: warning: Excess function parameter 'VM' description in 'panthor_vm_alloc_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1044: warning: Function parameter or struct member 'vm' not described in 'panthor_vm_free_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1044: warning: Excess function parameter 'VM' description in 'panthor_vm_free_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1466: warning: Function parameter or struct member 'ptdev' not described in 'panthor_vm_pool_create_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:1466: warning: Function parameter or struct member 'args' not described in 'panthor_vm_pool_create_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:1466: warning: Excess function parameter 'kernel_va_start' description in 'panthor_vm_pool_create_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:1466: warning: Excess function parameter 'kernel_va_range' description in 'panthor_vm_pool_create_vm'
--
>> drivers/gpu/drm/panthor/panthor_sched.c:319: warning: Excess struct member 'runnable' description in 'panthor_scheduler'
>> drivers/gpu/drm/panthor/panthor_sched.c:319: warning: Excess struct member 'idle' description in 'panthor_scheduler'
>> drivers/gpu/drm/panthor/panthor_sched.c:319: warning: Excess struct member 'waiting' description in 'panthor_scheduler'
>> drivers/gpu/drm/panthor/panthor_sched.c:319: warning: Excess struct member 'has_ref' description in 'panthor_scheduler'
>> drivers/gpu/drm/panthor/panthor_sched.c:319: warning: Excess struct member 'in_progress' description in 'panthor_scheduler'
>> drivers/gpu/drm/panthor/panthor_sched.c:319: warning: Excess struct member 'stopped_groups' description in 'panthor_scheduler'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'mem' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'input' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'output' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'input_fw_va' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'output_fw_va' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'gpu_va' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'ref' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'gt' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'sync64' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'bo' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'offset' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'kmap' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'lock' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'id' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:469: warning: Excess struct member 'in_flight_jobs' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:640: warning: Function parameter or struct member 'max_fragment_cores' not described in 'panthor_group'
   drivers/gpu/drm/panthor/panthor_sched.c:755: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:755: warning: Excess struct member 'size' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:755: warning: Excess struct member 'latest_flush' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:755: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:755: warning: Excess struct member 'end' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:996: warning: Cannot understand  * @cs_slot_reset_locked() - Reset a queue slot
    on line 996 - I thought it was a doc line
   drivers/gpu/drm/panthor/panthor_sched.c:1598: warning: expecting prototype for panthor_sched_process_global_irq(). Prototype was for sched_process_global_irq_locked() instead
   drivers/gpu/drm/panthor/panthor_sched.c:1640: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:1640: warning: Function parameter or struct member 'events' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:1664: warning: Cannot understand  */
    on line 1664 - I thought it was a doc line
   drivers/gpu/drm/panthor/panthor_sched.c:2536: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_mmu_fault'


vim +45 drivers/gpu/drm/panthor/panthor_devfreq.c

fac9b22df4b110 Boris Brezillon 2024-02-29  14  
fac9b22df4b110 Boris Brezillon 2024-02-29  15  /**
fac9b22df4b110 Boris Brezillon 2024-02-29  16   * struct panthor_devfreq - Device frequency management
fac9b22df4b110 Boris Brezillon 2024-02-29  17   */
fac9b22df4b110 Boris Brezillon 2024-02-29  18  struct panthor_devfreq {
fac9b22df4b110 Boris Brezillon 2024-02-29  19  	/** @devfreq: devfreq device. */
fac9b22df4b110 Boris Brezillon 2024-02-29  20  	struct devfreq *devfreq;
fac9b22df4b110 Boris Brezillon 2024-02-29  21  
fac9b22df4b110 Boris Brezillon 2024-02-29  22  	/** @gov_data: Governor data. */
fac9b22df4b110 Boris Brezillon 2024-02-29  23  	struct devfreq_simple_ondemand_data gov_data;
fac9b22df4b110 Boris Brezillon 2024-02-29  24  
fac9b22df4b110 Boris Brezillon 2024-02-29  25  	/** @busy_time: Busy time. */
fac9b22df4b110 Boris Brezillon 2024-02-29  26  	ktime_t busy_time;
fac9b22df4b110 Boris Brezillon 2024-02-29  27  
fac9b22df4b110 Boris Brezillon 2024-02-29  28  	/** @idle_time: Idle time. */
fac9b22df4b110 Boris Brezillon 2024-02-29  29  	ktime_t idle_time;
fac9b22df4b110 Boris Brezillon 2024-02-29  30  
fac9b22df4b110 Boris Brezillon 2024-02-29  31  	/** @time_last_update: Last update time. */
fac9b22df4b110 Boris Brezillon 2024-02-29  32  	ktime_t time_last_update;
fac9b22df4b110 Boris Brezillon 2024-02-29  33  
fac9b22df4b110 Boris Brezillon 2024-02-29  34  	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
fac9b22df4b110 Boris Brezillon 2024-02-29  35  	bool last_busy_state;
fac9b22df4b110 Boris Brezillon 2024-02-29  36  
fac9b22df4b110 Boris Brezillon 2024-02-29  37  	/*
fac9b22df4b110 Boris Brezillon 2024-02-29  38  	 * @lock: Lock used to protect busy_time, idle_time, time_last_update and
fac9b22df4b110 Boris Brezillon 2024-02-29  39  	 * last_busy_state.
fac9b22df4b110 Boris Brezillon 2024-02-29  40  	 *
fac9b22df4b110 Boris Brezillon 2024-02-29  41  	 * These fields can be accessed concurrently by panthor_devfreq_get_dev_status()
fac9b22df4b110 Boris Brezillon 2024-02-29  42  	 * and panthor_devfreq_record_{busy,idle}().
fac9b22df4b110 Boris Brezillon 2024-02-29  43  	 */
fac9b22df4b110 Boris Brezillon 2024-02-29  44  	spinlock_t lock;
fac9b22df4b110 Boris Brezillon 2024-02-29 @45  };
fac9b22df4b110 Boris Brezillon 2024-02-29  46  

:::::: The code at line 45 was first introduced by commit
:::::: fac9b22df4b1108f7fa5a087a77f922489861484 drm/panthor: Add the devfreq logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
