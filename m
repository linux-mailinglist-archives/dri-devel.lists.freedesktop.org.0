Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BEA5E6854
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AF410E36D;
	Thu, 22 Sep 2022 16:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A807C10E36D;
 Thu, 22 Sep 2022 16:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663864005; x=1695400005;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aFZVdvC2vAMHXMyo9Dq9HIaxk3ZrOiZBZU5QvyOabH8=;
 b=XS5rt9daJicJvoNVvlo9tc7KXQuwG3Q+qqpjRfK51hlmBLVGo+tvvwek
 Zqlo6pzVNgcvj3AR7oBTsLtir7iEPltpaGStoAq7chN//xPzErEZPszCC
 YoVfczJ0IViOvUryiys5hfHKQvDgcX/wduDvQ35gLArGaXDm6sLUAjIYV
 S3k+GQl7Sjq9uqxAeWMDeJ+t55Xus0lLhZkql51m31RHAks1VWrnMIKfb
 RD/NqEI/f8TA4OyFFSnIOkF74Y7Z4qVSG074I6001jg6YWM82yp1JxzFs
 +k5MjBPsSEOCnHesVx52UPenk4FyQUS+q8OnXA1wPrZkz0/o/kkpDX8M+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="297948986"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="297948986"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 09:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="597501468"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 22 Sep 2022 09:26:29 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1obP1w-0004nA-2Q;
 Thu, 22 Sep 2022 16:26:28 +0000
Date: Fri, 23 Sep 2022 00:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Improve debug print in vm_fault_ttm
Message-ID: <202209230001.og3h9EMY-lkp@intel.com>
References: <20220922120908.10352-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922120908.10352-1-nirmoy.das@intel.com>
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
Cc: kbuild-all@lists.01.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Nirmoy-Das/drm-i915-Improve-debug-print-in-vm_fault_ttm/20220922-201041
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20220923/202209230001.og3h9EMY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/e1a426a9e14837ada7e883d20af7c9abdf59823c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nirmoy-Das/drm-i915-Improve-debug-print-in-vm_fault_ttm/20220922-201041
        git checkout e1a426a9e14837ada7e883d20af7c9abdf59823c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/drm/drm_mm.h:51,
                    from include/drm/ttm/ttm_bo_driver.h:33,
                    from drivers/gpu/drm/i915/gem/i915_gem_ttm.c:8:
   drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function 'vm_fault_ttm':
>> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:1037:38: error: format '%p' expects argument of type 'void *', but argument 4 has type 'int' [-Werror=format=]
    1037 |                         drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n", err);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~
         |                                                                                             |
         |                                                                                             int
   include/drm/drm_print.h:461:63: note: in definition of macro 'drm_dbg'
     461 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |                                                               ^~~
   drivers/gpu/drm/i915/gem/i915_gem_ttm.c:1037:85: note: format string is defined here
    1037 |                         drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n", err);
         |                                                                                    ~^
         |                                                                                     |
         |                                                                                     void *
         |                                                                                    %d
   cc1: all warnings being treated as errors


vim +1037 drivers/gpu/drm/i915/gem/i915_gem_ttm.c

   986	
   987	static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
   988	{
   989		struct vm_area_struct *area = vmf->vma;
   990		struct ttm_buffer_object *bo = area->vm_private_data;
   991		struct drm_device *dev = bo->base.dev;
   992		struct drm_i915_gem_object *obj;
   993		intel_wakeref_t wakeref = 0;
   994		vm_fault_t ret;
   995		int idx;
   996	
   997		obj = i915_ttm_to_gem(bo);
   998		if (!obj)
   999			return VM_FAULT_SIGBUS;
  1000	
  1001		/* Sanity check that we allow writing into this object */
  1002		if (unlikely(i915_gem_object_is_readonly(obj) &&
  1003			     area->vm_flags & VM_WRITE))
  1004			return VM_FAULT_SIGBUS;
  1005	
  1006		ret = ttm_bo_vm_reserve(bo, vmf);
  1007		if (ret)
  1008			return ret;
  1009	
  1010		if (obj->mm.madv != I915_MADV_WILLNEED) {
  1011			dma_resv_unlock(bo->base.resv);
  1012			return VM_FAULT_SIGBUS;
  1013		}
  1014	
  1015		if (i915_ttm_cpu_maps_iomem(bo->resource))
  1016			wakeref = intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
  1017	
  1018		if (!i915_ttm_resource_mappable(bo->resource)) {
  1019			int err = -ENODEV;
  1020			int i;
  1021	
  1022			for (i = 0; i < obj->mm.n_placements; i++) {
  1023				struct intel_memory_region *mr = obj->mm.placements[i];
  1024				unsigned int flags;
  1025	
  1026				if (!mr->io_size && mr->type != INTEL_MEMORY_SYSTEM)
  1027					continue;
  1028	
  1029				flags = obj->flags;
  1030				flags &= ~I915_BO_ALLOC_GPU_ONLY;
  1031				err = __i915_ttm_migrate(obj, mr, flags);
  1032				if (!err)
  1033					break;
  1034			}
  1035	
  1036			if (err) {
> 1037				drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n", err);
  1038				dma_resv_unlock(bo->base.resv);
  1039				ret = VM_FAULT_SIGBUS;
  1040				goto out_rpm;
  1041			}
  1042		}
  1043	
  1044		if (drm_dev_enter(dev, &idx)) {
  1045			ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
  1046						       TTM_BO_VM_NUM_PREFAULT);
  1047			drm_dev_exit(idx);
  1048		} else {
  1049			ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
  1050		}
  1051	
  1052		if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
  1053			goto out_rpm;
  1054	
  1055		/* ttm_bo_vm_reserve() already has dma_resv_lock */
  1056		if (ret == VM_FAULT_NOPAGE && wakeref && !obj->userfault_count) {
  1057			obj->userfault_count = 1;
  1058			mutex_lock(&to_gt(to_i915(obj->base.dev))->lmem_userfault_lock);
  1059			list_add(&obj->userfault_link, &to_gt(to_i915(obj->base.dev))->lmem_userfault_list);
  1060			mutex_unlock(&to_gt(to_i915(obj->base.dev))->lmem_userfault_lock);
  1061		}
  1062	
  1063		if (wakeref & CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND)
  1064			intel_wakeref_auto(&to_gt(to_i915(obj->base.dev))->userfault_wakeref,
  1065					   msecs_to_jiffies_timeout(CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND));
  1066	
  1067		i915_ttm_adjust_lru(obj);
  1068	
  1069		dma_resv_unlock(bo->base.resv);
  1070	
  1071	out_rpm:
  1072		if (wakeref)
  1073			intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, wakeref);
  1074	
  1075		return ret;
  1076	}
  1077	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
