Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9175A47519
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 06:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B0010EA3D;
	Thu, 27 Feb 2025 05:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UeCv6w/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6065510EA31;
 Thu, 27 Feb 2025 05:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740633318; x=1772169318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Uwmrl+1S0SHW5qTEFMHOYvQXcCHiR8luylF2Z/RlQqI=;
 b=UeCv6w/U5p63QbRNQA+q1jaeKv1/s62VQFRBQiJeLj0hj080+Styx2Zz
 TUhjaAJyqPfO6poWdTQtnmzeBzXlwwO1dKlMrwxgbiLK+3iB5Uc9yAqxq
 KrD8VfW0YNayNhoGurIPygHES9wROTc3CevPqYudaiVqxjTBgYQ4m/ALL
 iMt/+mi9E12woN7LapgbfKnFUzdN1AlGZPWPUPhFKpf67hofHSPi4OQS5
 Klwrd3e6h7oFHEdwJphxniXcAlgfnSf1SIbxoXf9kIhI0MByf6lNmHNVC
 NTgOWyoxtvJutuDIKo2y493Ekm5t5QZZwzVbPTs8Ya7dfjASbJ5dQaJOx Q==;
X-CSE-ConnectionGUID: RtSarrS4SQuU0xgrelzXIw==
X-CSE-MsgGUID: kUqQvjoUSP+vPkgeGcM2PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41707758"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41707758"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 21:15:18 -0800
X-CSE-ConnectionGUID: OTpZKtnmQMmmRZ6REjSwuw==
X-CSE-MsgGUID: pZY1eDfFQ7ylcf7NTa8SCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147838913"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 26 Feb 2025 21:15:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tnWEo-000Csg-1O;
 Thu, 27 Feb 2025 05:15:11 +0000
Date: Thu, 27 Feb 2025 13:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <202502271226.qHKoHhA5-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271226.qHKoHhA5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271226.qHKoHhA5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271226.qHKoHhA5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_vm.c: In function 'xe_pagefault_access_type_to_address_type':
>> drivers/gpu/drm/xe/xe_vm.c:3288:9: error: 'vma' undeclared (first use in this function); did you mean 'vm'?
    3288 |         vma = lookup_vma(vm, pf->page_addr);
         |         ^~~
         |         vm
   drivers/gpu/drm/xe/xe_vm.c:3288:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/xe/xe_vm.c:3288:15: error: implicit declaration of function 'lookup_vma' [-Werror=implicit-function-declaration]
    3288 |         vma = lookup_vma(vm, pf->page_addr);
         |               ^~~~~~~~~~
   cc1: some warnings being treated as errors


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
