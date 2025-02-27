Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC89A4730B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 03:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDC110EA13;
	Thu, 27 Feb 2025 02:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZr1vxA4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6133C10EA10;
 Thu, 27 Feb 2025 02:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740623831; x=1772159831;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WHMi6LGNT8va9hoBVA6YvjNYhXhJ3jYhOqYG7oiKxbI=;
 b=PZr1vxA4kfs3OUx5HFBlVsMwzt9WnO3OCwMkobXXwoeJQaG8SSPJ2lER
 XdT1dK07y5hsP/CULVwLkBUOufwv0q65OdFQWl5+50fZp4b92hGhvNEYz
 /f31PuCDRIypbW8OVp9MNOTOf8N7WwoDgjZ09bQTLgZDpZG3Wb6vIIVW0
 hufsFPmodCM4wzRhWrPvcBc7rRole4bpQkZEMhBPbkuMCuwWAKf/UzS9T
 kuPvGhrCKWnry3XTjYc+DAeksmSdSmN1jtREtIDGXacZKjb4bBvlOYNT4
 UFPWUneGa5IeNqO2XZdH8N6X1wRfsWTDhki95nV/+NuAw5PF9Q1TSyEQ+ Q==;
X-CSE-ConnectionGUID: iN2WEahASgSfiEjOuwiCdQ==
X-CSE-MsgGUID: hKw5Ck4XTgaBl5m+rzk3Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="63966076"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="63966076"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 18:37:05 -0800
X-CSE-ConnectionGUID: cAPCEPPdRvWuJkuM7CVX1w==
X-CSE-MsgGUID: Dntb8cdETPWhN0cz1LQHJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117806392"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 26 Feb 2025 18:37:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tnTlk-000CkE-16;
 Thu, 27 Feb 2025 02:37:00 +0000
Date: Thu, 27 Feb 2025 10:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 jonathan.cavitt@intel.com, joonas.lahtinen@linux.intel.com,
 matthew.brost@intel.com, jianxun.zhang@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <202502271029.67aYhWm6-lkp@intel.com>
References: <20250226225557.133076-7-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226225557.133076-7-jonathan.cavitt@intel.com>
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

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250226]
[cannot apply to linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-xe-xe_gt_pagefault-Migrate-lookup_vma-to-xe_vm-h/20250227-070008
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250226225557.133076-7-jonathan.cavitt%40intel.com
patch subject: [PATCH 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
config: s390-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271029.67aYhWm6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271029.67aYhWm6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271029.67aYhWm6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_vm.c:3288:2: error: use of undeclared identifier 'vma'; did you mean 'vm'?
    3288 |         vma = lookup_vma(vm, pf->page_addr);
         |         ^~~
         |         vm
   drivers/gpu/drm/xe/xe_vm.c:3283:56: note: 'vm' declared here
    3283 | xe_pagefault_access_type_to_address_type(struct xe_vm *vm, struct xe_pagefault *pf)
         |                                                        ^
>> drivers/gpu/drm/xe/xe_vm.c:3288:8: error: call to undeclared function 'lookup_vma'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3288 |         vma = lookup_vma(vm, pf->page_addr);
         |               ^
>> drivers/gpu/drm/xe/xe_vm.c:3288:6: error: incompatible integer to pointer conversion assigning to 'struct xe_vm *' from 'int' [-Wint-conversion]
    3288 |         vma = lookup_vma(vm, pf->page_addr);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_vm.c:3289:7: error: use of undeclared identifier 'vma'; did you mean 'vm'?
    3289 |         if (!vma)
         |              ^~~
         |              vm
   drivers/gpu/drm/xe/xe_vm.c:3283:56: note: 'vm' declared here
    3283 | xe_pagefault_access_type_to_address_type(struct xe_vm *vm, struct xe_pagefault *pf)
         |                                                        ^
   drivers/gpu/drm/xe/xe_vm.c:3291:23: error: use of undeclared identifier 'vma'; did you mean 'vm'?
    3291 |         if (xe_vma_read_only(vma) && pf->access_type != XE_PAGEFAULT_ACCESS_TYPE_READ)
         |                              ^~~
         |                              vm
   drivers/gpu/drm/xe/xe_vm.c:3283:56: note: 'vm' declared here
    3283 | xe_pagefault_access_type_to_address_type(struct xe_vm *vm, struct xe_pagefault *pf)
         |                                                        ^
   5 errors generated.


vim +3288 drivers/gpu/drm/xe/xe_vm.c

  3281	
  3282	static enum drm_xe_fault_address_type
  3283	xe_pagefault_access_type_to_address_type(struct xe_vm *vm, struct xe_pagefault *pf)
  3284	{
  3285		if (!pf)
  3286			return 0;
  3287	
> 3288		vma = lookup_vma(vm, pf->page_addr);
  3289		if (!vma)
  3290			return DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT;
  3291		if (xe_vma_read_only(vma) && pf->access_type != XE_PAGEFAULT_ACCESS_TYPE_READ)
  3292			return DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT;
  3293		return 0;
  3294	}
  3295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
