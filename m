Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9B9D080F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 04:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA8210E08E;
	Mon, 18 Nov 2024 03:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTPjmhDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67D710E08E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 03:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731899348; x=1763435348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dDwWUVNnirjI1/hTh+Mdh9it9Mka4TIEqAcLGcL9fCU=;
 b=OTPjmhDyxL48onOjSNy5bl5JtVE4j4y7Tr/tfzjtksFAuJanbA4cVgTZ
 qcJec5HUyNyOLmNmu6HfO1NRJMBl1paP89DnEZcl5Sn5YZZImTCH2NWjc
 4o+VzA6rPuUUpLyXNKVVhXOZWmgNnGtBCk0v+4J4c7mrWuHthk9NYMk7F
 xCED2O8zOVb+OrsoxjYGXMTXIBzg7qWi3D+0brtmOuMwo8CdtHtyuCk+L
 w7eX4s4i1KuMKYtzfcxJ2oPCDIH3CwFosOUAOQZcnjj90+ftGev+04fvu
 ZmbKztkq7aUSKwGMcxXI4rNbKQu1/LjAhBjlq8SXvhFSspztPVmwKopUv g==;
X-CSE-ConnectionGUID: qeGFpd/PR9uInE6tEPxBuA==
X-CSE-MsgGUID: yEBcunEgTb+gcNmKu0Hd5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31246724"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31246724"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 19:09:07 -0800
X-CSE-ConnectionGUID: kQg4B/iuSJSn7pQnY/lZhg==
X-CSE-MsgGUID: ZjlL5zuxQ/eTsxWn/0Lw+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="94025082"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 17 Nov 2024 19:09:03 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tCs8K-0002Eb-1o;
 Mon, 18 Nov 2024 03:09:00 +0000
Date: Mon, 18 Nov 2024 11:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: =?unknown-8bit?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 =?unknown-8bit?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: register size of internal objects
 through fdinfo
Message-ID: <202411181036.aieis7tj-lkp@intel.com>
References: <20241115191426.3101123-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115191426.3101123-1-adrian.larumbe@collabora.com>
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
[also build test WARNING on next-20241115]
[cannot apply to linus/master v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-register-size-of-internal-objects-through-fdinfo/20241117-000321
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241115191426.3101123-1-adrian.larumbe%40collabora.com
patch subject: [PATCH v2] drm/panthor: register size of internal objects through fdinfo
config: x86_64-buildonly-randconfig-005-20241118 (https://download.01.org/0day-ci/archive/20241118/202411181036.aieis7tj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181036.aieis7tj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181036.aieis7tj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_gem.c:118: warning: Function parameter or struct member 'pfile' not described in 'panthor_kernel_bo_create'
--
>> drivers/gpu/drm/panthor/panthor_heap.c:280: warning: Function parameter or struct member 'pfile' not described in 'panthor_heap_create'
>> drivers/gpu/drm/panthor/panthor_heap.c:538: warning: Function parameter or struct member 'pfile' not described in 'panthor_heap_pool_create'
--
   drivers/gpu/drm/panthor/panthor_fw.c:139: warning: Excess struct member 'start' description in 'panthor_fw_binary_section_entry_hdr'
   drivers/gpu/drm/panthor/panthor_fw.c:139: warning: Excess struct member 'end' description in 'panthor_fw_binary_section_entry_hdr'
   drivers/gpu/drm/panthor/panthor_fw.c:139: warning: Excess struct member 'start' description in 'panthor_fw_binary_section_entry_hdr'
   drivers/gpu/drm/panthor/panthor_fw.c:139: warning: Excess struct member 'end' description in 'panthor_fw_binary_section_entry_hdr'
   drivers/gpu/drm/panthor/panthor_fw.c:196: warning: Excess struct member 'buf' description in 'panthor_fw_section'
   drivers/gpu/drm/panthor/panthor_fw.c:196: warning: Excess struct member 'size' description in 'panthor_fw_section'
   drivers/gpu/drm/panthor/panthor_fw.c:278: warning: Excess struct member 'ping_work' description in 'panthor_fw'
>> drivers/gpu/drm/panthor/panthor_fw.c:456: warning: Function parameter or struct member 'pfile' not described in 'panthor_fw_alloc_queue_iface_mem'
>> drivers/gpu/drm/panthor/panthor_fw.c:495: warning: Function parameter or struct member 'pfile' not described in 'panthor_fw_alloc_suspend_buf_mem'
--
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
   drivers/gpu/drm/panthor/panthor_mmu.c:1035: warning: Function parameter or struct member 'vm' not described in 'panthor_vm_alloc_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1035: warning: Excess function parameter 'VM' description in 'panthor_vm_alloc_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1068: warning: Function parameter or struct member 'vm' not described in 'panthor_vm_free_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1068: warning: Excess function parameter 'VM' description in 'panthor_vm_free_va'
   drivers/gpu/drm/panthor/panthor_mmu.c:1502: warning: Function parameter or struct member 'ptdev' not described in 'panthor_vm_pool_create_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:1502: warning: Function parameter or struct member 'args' not described in 'panthor_vm_pool_create_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:1502: warning: Excess function parameter 'kernel_va_start' description in 'panthor_vm_pool_create_vm'
   drivers/gpu/drm/panthor/panthor_mmu.c:1502: warning: Excess function parameter 'kernel_va_range' description in 'panthor_vm_pool_create_vm'
>> drivers/gpu/drm/panthor/panthor_mmu.c:1919: warning: Function parameter or struct member 'pfile' not described in 'panthor_vm_get_heap_pool'


vim +118 drivers/gpu/drm/panthor/panthor_gem.c

7b8b62a7db49e2 Adrián Larumbe  2024-11-15   99  
8a1cc07578bf42 Boris Brezillon 2024-02-29  100  /**
8a1cc07578bf42 Boris Brezillon 2024-02-29  101   * panthor_kernel_bo_create() - Create and map a GEM object to a VM
8a1cc07578bf42 Boris Brezillon 2024-02-29  102   * @ptdev: Device.
8a1cc07578bf42 Boris Brezillon 2024-02-29  103   * @vm: VM to map the GEM to. If NULL, the kernel object is not GPU mapped.
8a1cc07578bf42 Boris Brezillon 2024-02-29  104   * @size: Size of the buffer object.
8a1cc07578bf42 Boris Brezillon 2024-02-29  105   * @bo_flags: Combination of drm_panthor_bo_flags flags.
8a1cc07578bf42 Boris Brezillon 2024-02-29  106   * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
8a1cc07578bf42 Boris Brezillon 2024-02-29  107   * that are related to map operations).
8a1cc07578bf42 Boris Brezillon 2024-02-29  108   * @gpu_va: GPU address assigned when mapping to the VM.
8a1cc07578bf42 Boris Brezillon 2024-02-29  109   * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
8a1cc07578bf42 Boris Brezillon 2024-02-29  110   * automatically allocated.
8a1cc07578bf42 Boris Brezillon 2024-02-29  111   *
8a1cc07578bf42 Boris Brezillon 2024-02-29  112   * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
8a1cc07578bf42 Boris Brezillon 2024-02-29  113   */
8a1cc07578bf42 Boris Brezillon 2024-02-29  114  struct panthor_kernel_bo *
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  115  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_file *pfile,
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  116  			 struct panthor_vm *vm, size_t size, u32 bo_flags,
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  117  			 u32 vm_map_flags, u64 gpu_va)
8a1cc07578bf42 Boris Brezillon 2024-02-29 @118  {
8a1cc07578bf42 Boris Brezillon 2024-02-29  119  	struct drm_gem_shmem_object *obj;
8a1cc07578bf42 Boris Brezillon 2024-02-29  120  	struct panthor_kernel_bo *kbo;
8a1cc07578bf42 Boris Brezillon 2024-02-29  121  	struct panthor_gem_object *bo;
8a1cc07578bf42 Boris Brezillon 2024-02-29  122  	int ret;
8a1cc07578bf42 Boris Brezillon 2024-02-29  123  
8a1cc07578bf42 Boris Brezillon 2024-02-29  124  	if (drm_WARN_ON(&ptdev->base, !vm))
8a1cc07578bf42 Boris Brezillon 2024-02-29  125  		return ERR_PTR(-EINVAL);
8a1cc07578bf42 Boris Brezillon 2024-02-29  126  
8a1cc07578bf42 Boris Brezillon 2024-02-29  127  	kbo = kzalloc(sizeof(*kbo), GFP_KERNEL);
8a1cc07578bf42 Boris Brezillon 2024-02-29  128  	if (!kbo)
8a1cc07578bf42 Boris Brezillon 2024-02-29  129  		return ERR_PTR(-ENOMEM);
8a1cc07578bf42 Boris Brezillon 2024-02-29  130  
8a1cc07578bf42 Boris Brezillon 2024-02-29  131  	obj = drm_gem_shmem_create(&ptdev->base, size);
8a1cc07578bf42 Boris Brezillon 2024-02-29  132  	if (IS_ERR(obj)) {
8a1cc07578bf42 Boris Brezillon 2024-02-29  133  		ret = PTR_ERR(obj);
8a1cc07578bf42 Boris Brezillon 2024-02-29  134  		goto err_free_bo;
8a1cc07578bf42 Boris Brezillon 2024-02-29  135  	}
8a1cc07578bf42 Boris Brezillon 2024-02-29  136  
8a1cc07578bf42 Boris Brezillon 2024-02-29  137  	bo = to_panthor_bo(&obj->base);
8a1cc07578bf42 Boris Brezillon 2024-02-29  138  	kbo->obj = &obj->base;
8a1cc07578bf42 Boris Brezillon 2024-02-29  139  	bo->flags = bo_flags;
8a1cc07578bf42 Boris Brezillon 2024-02-29  140  
5d01b56f0518d8 Boris Brezillon 2024-10-30  141  	/* The system and GPU MMU page size might differ, which becomes a
5d01b56f0518d8 Boris Brezillon 2024-10-30  142  	 * problem for FW sections that need to be mapped at explicit address
5d01b56f0518d8 Boris Brezillon 2024-10-30  143  	 * since our PAGE_SIZE alignment might cover a VA range that's
5d01b56f0518d8 Boris Brezillon 2024-10-30  144  	 * expected to be used for another section.
5d01b56f0518d8 Boris Brezillon 2024-10-30  145  	 * Make sure we never map more than we need.
5d01b56f0518d8 Boris Brezillon 2024-10-30  146  	 */
5d01b56f0518d8 Boris Brezillon 2024-10-30  147  	size = ALIGN(size, panthor_vm_page_size(vm));
8a1cc07578bf42 Boris Brezillon 2024-02-29  148  	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
8a1cc07578bf42 Boris Brezillon 2024-02-29  149  	if (ret)
8a1cc07578bf42 Boris Brezillon 2024-02-29  150  		goto err_put_obj;
8a1cc07578bf42 Boris Brezillon 2024-02-29  151  
8a1cc07578bf42 Boris Brezillon 2024-02-29  152  	ret = panthor_vm_map_bo_range(vm, bo, 0, size, kbo->va_node.start, vm_map_flags);
8a1cc07578bf42 Boris Brezillon 2024-02-29  153  	if (ret)
8a1cc07578bf42 Boris Brezillon 2024-02-29  154  		goto err_free_va;
8a1cc07578bf42 Boris Brezillon 2024-02-29  155  
ff60c8da0aaf7e Boris Brezillon 2024-05-02  156  	kbo->vm = panthor_vm_get(vm);
8a1cc07578bf42 Boris Brezillon 2024-02-29  157  	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
8a1cc07578bf42 Boris Brezillon 2024-02-29  158  	drm_gem_object_get(bo->exclusive_vm_root_gem);
8a1cc07578bf42 Boris Brezillon 2024-02-29  159  	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  160  
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  161  	INIT_LIST_HEAD(&kbo->private_obj);
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  162  
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  163  	/* Only FW regions are not bound to an open file */
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  164  	if (pfile) {
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  165  		mutex_lock(&ptdev->private_obj_list_lock);
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  166  		list_add(&kbo->private_obj, &pfile->private_file_list);
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  167  		mutex_unlock(&ptdev->private_obj_list_lock);
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  168  	}
7b8b62a7db49e2 Adrián Larumbe  2024-11-15  169  
8a1cc07578bf42 Boris Brezillon 2024-02-29  170  	return kbo;
8a1cc07578bf42 Boris Brezillon 2024-02-29  171  
8a1cc07578bf42 Boris Brezillon 2024-02-29  172  err_free_va:
8a1cc07578bf42 Boris Brezillon 2024-02-29  173  	panthor_vm_free_va(vm, &kbo->va_node);
8a1cc07578bf42 Boris Brezillon 2024-02-29  174  
8a1cc07578bf42 Boris Brezillon 2024-02-29  175  err_put_obj:
8a1cc07578bf42 Boris Brezillon 2024-02-29  176  	drm_gem_object_put(&obj->base);
8a1cc07578bf42 Boris Brezillon 2024-02-29  177  
8a1cc07578bf42 Boris Brezillon 2024-02-29  178  err_free_bo:
8a1cc07578bf42 Boris Brezillon 2024-02-29  179  	kfree(kbo);
8a1cc07578bf42 Boris Brezillon 2024-02-29  180  	return ERR_PTR(ret);
8a1cc07578bf42 Boris Brezillon 2024-02-29  181  }
8a1cc07578bf42 Boris Brezillon 2024-02-29  182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
