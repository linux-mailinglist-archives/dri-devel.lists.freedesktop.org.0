Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0186AC0374
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 06:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696B910E25A;
	Thu, 22 May 2025 04:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmnQAhMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4272BC40
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 02:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747881588; x=1779417588;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tJa218YJznchBKmH8pkjmRJlLbcFFReHZvXbiFmUK7M=;
 b=RmnQAhMMo9NZEdgn9jnzPzXqe/UZtCdM0W9HII6Ln06E4PEvlB79Vr+5
 DJmsEm4rqyQKp6/AnipIlPmTbVgQkDpVKwZBiGx/Bu7/qnaRi/bWAgvt7
 xVGryhTZXe45uiepI6zysHYBLoE+PchkFN5H+Q8WxjxlGgZ6OTrs01I+p
 59EnqFKJ29LHW0x6ZTLBcBIm2EIyGhvA3gVInRuXwcn1lfp7M0VMampgY
 v0Yhb1pX0VRtXoASrqx/QW9GbEcoXmcE+5qG40vFqfenzka9+zWBpIzlc
 mypEBoRBv3bn5mr+hFNMHSQ+2cJ4f+iGipx+0fdm0vtEoG4DY3aEwCfQn w==;
X-CSE-ConnectionGUID: tKKJI/IjRZCsiKLP3LdOeQ==
X-CSE-MsgGUID: Jv45g9dBQPqv6nXGSqCU7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49764034"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="49764034"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 19:39:47 -0700
X-CSE-ConnectionGUID: kXgw0RPcSpyruLMDx5AROQ==
X-CSE-MsgGUID: +TwBY0PnS5uvPayB96zIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140212392"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 21 May 2025 19:39:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uHvqP-000Oqm-1J;
 Thu, 22 May 2025 02:39:41 +0000
Date: Thu, 22 May 2025 10:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 tvrtko.ursulin@igalia.com, Felix.Kuehling@amd.com,
 David.YatSin@amd.com, Chris.Freehill@amd.com,
 Christian.Koenig@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de,
 David Francis <David.Francis@amd.com>
Subject: Re: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
Message-ID: <202505221029.1z5ok2nQ-lkp@intel.com>
References: <20250521140649.4058526-3-David.Francis@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521140649.4058526-3-David.Francis@amd.com>
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

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on next-20250521]
[cannot apply to drm-exynos/exynos-drm-next linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Francis/drm-amdgpu-Adding-amdgpu-CRIU-ioctl/20250521-230706
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250521140649.4058526-3-David.Francis%40amd.com
patch subject: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
config: arm-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221029.1z5ok2nQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221029.1z5ok2nQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221029.1z5ok2nQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:160:42: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
     160 |                 bo_bucket->alloc_flags = bo->flags & (!AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
         |                                                        ^
   include/uapi/drm/amdgpu_drm.h:146:51: note: expanded from macro 'AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE'
     146 | #define AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE  (1 << 9)
         |                                                    ^
   1 warning generated.


vim +160 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c

   119	
   120		struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)data->driver_priv)->vm;
   121		struct drm_amdgpu_criu_bo_bucket *bo_buckets;
   122		struct drm_amdgpu_criu_vm_bucket *vm_buckets;
   123		struct drm_gem_object *gobj;
   124		int vm_priv_index = 0;
   125		int bo_index = 0;
   126		int num_bos = 0;
   127		int fd, id, ret;
   128	
   129		spin_lock(&data->table_lock);
   130		idr_for_each_entry(&data->object_idr, gobj, id)
   131			num_bos += 1;
   132		spin_unlock(&data->table_lock);
   133	
   134		if (args->num_bos != num_bos) {
   135			ret = -EINVAL;
   136			goto exit;
   137		}
   138	
   139		bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
   140		if (!bo_buckets) {
   141			ret = -ENOMEM;
   142			goto free_buckets;
   143		}
   144	
   145		vm_buckets = kvzalloc(args->num_vms * sizeof(*vm_buckets), GFP_KERNEL);
   146		if (!vm_buckets) {
   147			ret = -ENOMEM;
   148			goto free_vms;
   149		}
   150	
   151		idr_for_each_entry(&data->object_idr, gobj, id) {
   152			struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
   153			struct drm_amdgpu_criu_bo_bucket *bo_bucket;
   154			struct amdgpu_vm_bo_base *vm_bo_base;
   155	
   156			bo_bucket = &bo_buckets[bo_index];
   157	
   158			bo_bucket->size = amdgpu_bo_size(bo);
   159			bo_bucket->offset = amdgpu_bo_mmap_offset(bo);
 > 160			bo_bucket->alloc_flags = bo->flags & (!AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
   161			bo_bucket->preferred_domains = bo->preferred_domains;
   162	
   163			if (is_import(bo))
   164				bo_bucket->flags |= AMDGPU_CRIU_BO_FLAG_IS_IMPORT;
   165	
   166			drm_gem_prime_handle_to_fd(dev, data, id, 0, &fd);
   167			if (fd)
   168				bo_bucket->dmabuf_fd = fd;
   169	
   170			vm_bo_base = bo->vm_bo;
   171	
   172			while (vm_bo_base) {
   173				struct amdgpu_bo_va *bo_va = container_of(vm_bo_base, struct amdgpu_bo_va, base);
   174				struct amdgpu_bo_va_mapping *mapping;
   175	
   176				if (vm_bo_base->vm == avm) {
   177					list_for_each_entry(mapping, &bo_va->invalids, list) {
   178						vm_buckets[vm_priv_index].start = mapping->start;
   179						vm_buckets[vm_priv_index].last = mapping->last;
   180						vm_buckets[vm_priv_index].offset = mapping->offset;
   181						vm_buckets[vm_priv_index].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
   182						vm_buckets[vm_priv_index].gem_handle = id;
   183						vm_priv_index += 1;
   184	
   185						bo_bucket->addr = mapping->start * AMDGPU_GPU_PAGE_SIZE;
   186					}
   187					list_for_each_entry(mapping, &bo_va->valids, list) {
   188						vm_buckets[vm_priv_index].start = mapping->start;
   189						vm_buckets[vm_priv_index].last = mapping->last;
   190						vm_buckets[vm_priv_index].offset = mapping->offset;
   191						vm_buckets[vm_priv_index].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
   192						vm_buckets[vm_priv_index].gem_handle = id;
   193						vm_priv_index += 1;
   194	
   195						bo_bucket->addr = mapping->start * AMDGPU_GPU_PAGE_SIZE;
   196					}
   197				}
   198	
   199				vm_bo_base = vm_bo_base->next;
   200			}
   201	
   202			bo_index += 1;
   203		}
   204	
   205		ret = copy_to_user((void __user *)args->bos, bo_buckets, num_bos * sizeof(*bo_buckets));
   206		if (ret) {
   207			pr_debug("Failed to copy BO information to user\n");
   208			ret = -EFAULT;
   209			goto free_vms;
   210		}
   211	
   212		ret = copy_to_user((void __user *)args->vms, vm_buckets, args->num_vms * sizeof(*vm_buckets));
   213		if (ret) {
   214			pr_debug("Failed to copy BO information to user\n");
   215			ret = -EFAULT;
   216			goto free_vms;
   217		}
   218	
   219	free_vms:
   220		kvfree(vm_buckets);
   221	free_buckets:
   222		kvfree(bo_buckets);
   223	exit:
   224	
   225		return ret;
   226	}
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
