Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FBB9F9B55
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 22:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FCC10EFE5;
	Fri, 20 Dec 2024 21:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtzcdZJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6521610EFE5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 21:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734728848; x=1766264848;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=js+YfcCcMcufD5w+lNqGTv5DFyTTEygL2Ql5FS4RerU=;
 b=XtzcdZJ+iqZzkebMe2ANWrMs4Rek9ylUtGeEb5HNyyL1LIvm53fKPaPR
 m71Yl38yTfXIOiR+HoY/Ce5mOiBn9ByVlPEpisAanuTJ8ds8au6uiqL4e
 +GNVv1BoQGmUWSHilrNN8Nh6tEcPZTNbLQ9DbOoIFP8ownje3f5f5Wwh5
 1TGFJ+vFX9k352WHzjPP1cKtcTWsMehdfbPwqg+LeIErt2a6yhHDpaiJs
 WSPfUUBRKYiHDnQvDrNd0VHWyfyN+2P7f//UgI1YUlYlC3eZGF+yTsO+1
 xPw+fCwmQoDQNiaur0kd0lsnv3xMZXRDAS933HkVeo/v5mrKbF1nU6dZc w==;
X-CSE-ConnectionGUID: Kt+bnnwPSzaGcZsD863L2A==
X-CSE-MsgGUID: QsPevq8wRr2TSqn/p9M7fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57760694"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="57760694"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:07:26 -0800
X-CSE-ConnectionGUID: txe2fn+WRImAHT1ZowMA+g==
X-CSE-MsgGUID: z8sJg2wsQ1KiLhvxgmy+WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99088592"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 20 Dec 2024 13:07:21 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tOkDJ-0001fj-1e;
 Fri, 20 Dec 2024 21:07:13 +0000
Date: Sat, 21 Dec 2024 05:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n_Mart=EDnez?= Larumbe
 <adrian.larumbe@collabora.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, "Cc:kernel" <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] drm/panthor: Expose size of driver internal BO's
 over fdinfo
Message-ID: <202412210405.NpsdRCQY-lkp@intel.com>
References: <20241218181844.886043-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218181844.886043-2-adrian.larumbe@collabora.com>
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

[auto build test WARNING on 6a8d72b80807ad45229c0f5a17e3be843b15a703]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Mart-nez-Larumbe/drm-panthor-Expose-size-of-driver-internal-BO-s-over-fdinfo/20241219-022128
base:   6a8d72b80807ad45229c0f5a17e3be843b15a703
patch link:    https://lore.kernel.org/r/20241218181844.886043-2-adrian.larumbe%40collabora.com
patch subject: [PATCH v5 1/2] drm/panthor: Expose size of driver internal BO's over fdinfo
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241221/202412210405.NpsdRCQY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210405.NpsdRCQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210405.NpsdRCQY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Function parameter or struct member 'as' not described in 'panthor_mmu'
   drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'slots_lock' description in 'panthor_mmu'
   drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'alloc_mask' description in 'panthor_mmu'
   drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'faulty_mask' description in 'panthor_mmu'
   drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'slots' description in 'panthor_mmu'
   drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'lru_list' description in 'panthor_mmu'
   drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'lock' description in 'panthor_mmu'
   drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'list' description in 'panthor_mmu'
   drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'reset_in_progress' description in 'panthor_mmu'
   drivers/gpu/drm/panthor/panthor_mmu.c:102: warning: Excess struct member 'wq' description in 'panthor_mmu'
   drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'count' description in 'panthor_vm_op_ctx'
   drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'ptr' description in 'panthor_vm_op_ctx'
   drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'page' description in 'panthor_vm_op_ctx'
   drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'addr' description in 'panthor_vm_op_ctx'
   drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'range' description in 'panthor_vm_op_ctx'
   drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'vm_bo' description in 'panthor_vm_op_ctx'
   drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'bo_offset' description in 'panthor_vm_op_ctx'
   drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'sgt' description in 'panthor_vm_op_ctx'
   drivers/gpu/drm/panthor/panthor_mmu.c:217: warning: Excess struct member 'new_vma' description in 'panthor_vm_op_ctx'
   drivers/gpu/drm/panthor/panthor_mmu.c:389: warning: Excess struct member 'start' description in 'panthor_vm'
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
   drivers/gpu/drm/panthor/panthor_mmu.c:707: warning: Function parameter or struct member 'vm' not described in 'panthor_vm_active'
   drivers/gpu/drm/panthor/panthor_mmu.c:707: warning: Excess function parameter 'VM' description in 'panthor_vm_active'
   drivers/gpu/drm/panthor/panthor_mmu.c:816: warning: Function parameter or struct member 'vm' not described in 'panthor_vm_idle'
   drivers/gpu/drm/panthor/panthor_mmu.c:816: warning: Excess function parameter 'VM' description in 'panthor_vm_idle'
   drivers/gpu/drm/panthor/panthor_mmu.c:1037: warning: Function parameter or struct member 'vm' not described in 'panthor_vm_alloc_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1037: warning: Excess function parameter 'VM' description in 'panthor_vm_alloc_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1070: warning: Function parameter or struct member 'vm' not described in 'panthor_vm_free_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1070: warning: Excess function parameter 'VM' description in 'panthor_vm_free_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1504: warning: Function parameter or struct member 'ptdev' not described in 'panthor_vm_pool_create_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:1504: warning: Function parameter or struct member 'args' not described in 'panthor_vm_pool_create_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:1504: warning: Excess function parameter 'kernel_va_start' description in 'panthor_vm_pool_create_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:1504: warning: Excess function parameter 'kernel_va_range' description in 'panthor_vm_pool_create_vm'
>> drivers/gpu/drm/panthor/panthor_mmu.c:1954: warning: expecting prototype for panthor_vm_heaps_size(). Prototype was for panthor_vm_heaps_sizes() instead
--
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
>> drivers/gpu/drm/panthor/panthor_sched.c:701: warning: Excess struct member 'bo_sizes' description in 'panthor_group'
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


vim +1954 drivers/gpu/drm/panthor/panthor_mmu.c

  1943	
  1944	/**
  1945	 * panthor_vm_heaps_size() - Calculate size of all heap chunks across all
  1946	 * heaps over all the heap pools in a VM
  1947	 * @pfile: File.
  1948	 * @status: Memory status to be updated.
  1949	 *
  1950	 * Calculate all heap chunk sizes in all heap pools bound to a VM. If the VM
  1951	 * is active, record the size as active as well.
  1952	 */
  1953	void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *status)
> 1954	{
  1955		struct panthor_vm *vm;
  1956		unsigned long i;
  1957	
  1958		if (!pfile->vms)
  1959			return;
  1960	
  1961		xa_for_each(&pfile->vms->xa, i, vm) {
  1962			size_t size;
  1963	
  1964			mutex_lock(&vm->heaps.lock);
  1965			if (!vm->heaps.pool) {
  1966				mutex_unlock(&vm->heaps.lock);
  1967				continue;
  1968			}
  1969			size = panthor_heap_pool_size(vm->heaps.pool);
  1970			mutex_unlock(&vm->heaps.lock);
  1971	
  1972			status->resident += size;
  1973			status->private += size;
  1974			if (vm->as.id >= 0)
  1975				status->active += size;
  1976		}
  1977	}
  1978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
