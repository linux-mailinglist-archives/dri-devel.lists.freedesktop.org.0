Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C78805607
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC20E10E530;
	Tue,  5 Dec 2023 13:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C006F10E52F;
 Tue,  5 Dec 2023 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701783250; x=1733319250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3ZG5O8x+XN9jfQ3hj5aUyeJvVs/G1In0ZVS8u9rOfn8=;
 b=R6bPzUjkI1eOGPThWtKmIifaBXGTOtTDDdIoenbHVTUAfjwcqZkjWuRR
 9bM29kiSsW/CKjlyXVFjUFYVVVkglYKPDJiNCA39n20h3xQbrcmWFZ/fc
 KSmW1zl9Qdhkg9n2u2WSslict2c6m704fjde0SB8y7hdcB0/iFz/csjY1
 yYVhpeqyIQNeFT2w5ckerZDmBG1iFimgighnDl0PIkMP75gM0U/pRhafk
 hmRso7YPc01Xug2UWpPGbnMeTNTyGEvHBppvaXf4OXHghmw6aoSi0O5l9
 HfVl3/+YoNintB2xzjeUCIZbPrQ8Bgp2E/ZWPa4gUxOYYO5SNUZ8kEpZW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="396688883"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="396688883"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 05:34:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747232463"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="747232463"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 05:34:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rAVYp-000939-0g;
 Tue, 05 Dec 2023 13:34:05 +0000
Date: Tue, 5 Dec 2023 21:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/amdgpu: Auto-validate DMABuf imports in compute
 VMs
Message-ID: <202312052136.JfzEpgBw-lkp@intel.com>
References: <20231201233438.1709981-5-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201233438.1709981-5-Felix.Kuehling@amd.com>
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
Cc: oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Felix,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231201]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc3 v6.7-rc2 v6.7-rc1 v6.7-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Kuehling/drm-amdkfd-Export-DMABufs-from-KFD-using-GEM-handles/20231202-073833
base:   next-20231201
patch link:    https://lore.kernel.org/r/20231201233438.1709981-5-Felix.Kuehling%40amd.com
patch subject: [PATCH 5/6] drm/amdgpu: Auto-validate DMABuf imports in compute VMs
config: x86_64-randconfig-161-20231203 (https://download.01.org/0day-ci/archive/20231205/202312052136.JfzEpgBw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052136.JfzEpgBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052136.JfzEpgBw-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.o: in function `amdgpu_gem_object_open':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:208: undefined reference to `amdgpu_amdkfd_bo_validate_and_fence'


vim +208 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

   156	
   157	/*
   158	 * Call from drm_gem_handle_create which appear in both new and open ioctl
   159	 * case.
   160	 */
   161	static int amdgpu_gem_object_open(struct drm_gem_object *obj,
   162					  struct drm_file *file_priv)
   163	{
   164		struct amdgpu_bo *abo = gem_to_amdgpu_bo(obj);
   165		struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
   166		struct amdgpu_fpriv *fpriv = file_priv->driver_priv;
   167		struct amdgpu_vm *vm = &fpriv->vm;
   168		struct amdgpu_bo_va *bo_va;
   169		struct mm_struct *mm;
   170		int r;
   171	
   172		mm = amdgpu_ttm_tt_get_usermm(abo->tbo.ttm);
   173		if (mm && mm != current->mm)
   174			return -EPERM;
   175	
   176		if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID &&
   177		    abo->tbo.base.resv != vm->root.bo->tbo.base.resv)
   178			return -EPERM;
   179	
   180		r = amdgpu_bo_reserve(abo, false);
   181		if (r)
   182			return r;
   183	
   184		bo_va = amdgpu_vm_bo_find(vm, abo);
   185		if (!bo_va)
   186			bo_va = amdgpu_vm_bo_add(adev, vm, abo);
   187		else
   188			++bo_va->ref_count;
   189		amdgpu_bo_unreserve(abo);
   190	
   191		/* Validate and add eviction fence to DMABuf imports with dynamic
   192		 * attachment in compute VMs. Re-validation will be done by
   193		 * amdgpu_vm_validate_evicted_bos and the fence will be updated by
   194		 * amdgpu_vm_fence_imports in amdgpu_amdkfd_gpuvm_restore_process_bos.
   195		 *
   196		 * Nested locking below for the case that a GEM object is opened in
   197		 * kfd_mem_export_dmabuf. Since the lock below is only taken for imports,
   198		 * but not for export, this is a different lock class that cannot lead to
   199		 * circular lock dependencies.
   200		 */
   201		if (!vm->is_compute_context || !vm->process_info)
   202			return 0;
   203		if (!obj->import_attach ||
   204		    !dma_buf_is_dynamic(obj->import_attach->dmabuf))
   205			return 0;
   206		mutex_lock_nested(&vm->process_info->lock, 1);
   207		if (!WARN_ON(!vm->process_info->eviction_fence)) {
 > 208			r = amdgpu_amdkfd_bo_validate_and_fence(abo, AMDGPU_GEM_DOMAIN_GTT,
   209								&vm->process_info->eviction_fence->base);
   210			if (r)
   211				dev_warn(adev->dev, "%d: validate_and_fence failed: %d\n",
   212					 vm->task_info.pid, r);
   213		}
   214		mutex_unlock(&vm->process_info->lock);
   215	
   216		return 0;
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
