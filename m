Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D0D86F385
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 04:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1AB10F73B;
	Sun,  3 Mar 2024 03:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGarNBz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C1A10F73B
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 03:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709437029; x=1740973029;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=bF7vFyDX5q2OU0jwqgNH0eLxV4EBMU9jpnjH9btEcdw=;
 b=VGarNBz0AL7oGIwzu0Ehu88tsGY9pSt3XZ6dS7vf3yozMDtuy3gyZlf7
 Pt62b1ZrGRoc6jN7GquJMyCy1JAgNJj/+TzhmnE6IQKl0HTv80/Xk1Hlk
 6y6qcm8v+QJtk5kyJhcjszKSldz91KDuFWvmDFQRKfpm4RmsAiKk20VC3
 MmTFTdIlerJv/Q3n5/lwPlpYqTug/y4K3+jKgqEn+bivTNZbUgJzL2de3
 yo4Fj7AtWP+U/5Mj1rWLGMfkejtkBS46BUcwAu8La300B2eQ/f+fM2KOb
 b3aPffcsqMB63qlHM5a283uxxBYohnmuu3RrHdqwjMCQevdIpLncEyait w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4117906"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4117906"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2024 19:37:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8559497"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 02 Mar 2024 19:37:07 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rgceu-0000U0-1D;
 Sun, 03 Mar 2024 03:37:04 +0000
Date: Sun, 3 Mar 2024 11:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Subject: [drm-misc:drm-misc-next 12/14]
 drivers/gpu/drm/panthor/panthor_device.c:355:31: error: implicit declaration
 of function 'virt_to_pfn'; did you mean 'virt_to_kpte'?
Message-ID: <202403031142.Vl4pW7X6-lkp@intel.com>
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
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240303/202403031142.Vl4pW7X6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031142.Vl4pW7X6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031142.Vl4pW7X6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_device.c: In function 'panthor_mmio_vm_fault':
>> drivers/gpu/drm/panthor/panthor_device.c:355:31: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_kpte'? [-Werror=implicit-function-declaration]
     355 |                         pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
         |                               ^~~~~~~~~~~
         |                               virt_to_kpte
   cc1: some warnings being treated as errors


vim +355 drivers/gpu/drm/panthor/panthor_device.c

5fe909cae118a7 Boris Brezillon 2024-02-29  332  
5fe909cae118a7 Boris Brezillon 2024-02-29  333  static vm_fault_t panthor_mmio_vm_fault(struct vm_fault *vmf)
5fe909cae118a7 Boris Brezillon 2024-02-29  334  {
5fe909cae118a7 Boris Brezillon 2024-02-29  335  	struct vm_area_struct *vma = vmf->vma;
5fe909cae118a7 Boris Brezillon 2024-02-29  336  	struct panthor_device *ptdev = vma->vm_private_data;
5fe909cae118a7 Boris Brezillon 2024-02-29  337  	u64 id = (u64)vma->vm_pgoff << PAGE_SHIFT;
5fe909cae118a7 Boris Brezillon 2024-02-29  338  	unsigned long pfn;
5fe909cae118a7 Boris Brezillon 2024-02-29  339  	pgprot_t pgprot;
5fe909cae118a7 Boris Brezillon 2024-02-29  340  	vm_fault_t ret;
5fe909cae118a7 Boris Brezillon 2024-02-29  341  	bool active;
5fe909cae118a7 Boris Brezillon 2024-02-29  342  	int cookie;
5fe909cae118a7 Boris Brezillon 2024-02-29  343  
5fe909cae118a7 Boris Brezillon 2024-02-29  344  	if (!drm_dev_enter(&ptdev->base, &cookie))
5fe909cae118a7 Boris Brezillon 2024-02-29  345  		return VM_FAULT_SIGBUS;
5fe909cae118a7 Boris Brezillon 2024-02-29  346  
5fe909cae118a7 Boris Brezillon 2024-02-29  347  	mutex_lock(&ptdev->pm.mmio_lock);
5fe909cae118a7 Boris Brezillon 2024-02-29  348  	active = atomic_read(&ptdev->pm.state) == PANTHOR_DEVICE_PM_STATE_ACTIVE;
5fe909cae118a7 Boris Brezillon 2024-02-29  349  
5fe909cae118a7 Boris Brezillon 2024-02-29  350  	switch (panthor_device_mmio_offset(id)) {
5fe909cae118a7 Boris Brezillon 2024-02-29  351  	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
5fe909cae118a7 Boris Brezillon 2024-02-29  352  		if (active)
5fe909cae118a7 Boris Brezillon 2024-02-29  353  			pfn = __phys_to_pfn(ptdev->phys_addr + CSF_GPU_LATEST_FLUSH_ID);
5fe909cae118a7 Boris Brezillon 2024-02-29  354  		else
5fe909cae118a7 Boris Brezillon 2024-02-29 @355  			pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
5fe909cae118a7 Boris Brezillon 2024-02-29  356  		break;
5fe909cae118a7 Boris Brezillon 2024-02-29  357  
5fe909cae118a7 Boris Brezillon 2024-02-29  358  	default:
5fe909cae118a7 Boris Brezillon 2024-02-29  359  		ret = VM_FAULT_SIGBUS;
5fe909cae118a7 Boris Brezillon 2024-02-29  360  		goto out_unlock;
5fe909cae118a7 Boris Brezillon 2024-02-29  361  	}
5fe909cae118a7 Boris Brezillon 2024-02-29  362  
5fe909cae118a7 Boris Brezillon 2024-02-29  363  	pgprot = vma->vm_page_prot;
5fe909cae118a7 Boris Brezillon 2024-02-29  364  	if (active)
5fe909cae118a7 Boris Brezillon 2024-02-29  365  		pgprot = pgprot_noncached(pgprot);
5fe909cae118a7 Boris Brezillon 2024-02-29  366  
5fe909cae118a7 Boris Brezillon 2024-02-29  367  	ret = vmf_insert_pfn_prot(vma, vmf->address, pfn, pgprot);
5fe909cae118a7 Boris Brezillon 2024-02-29  368  
5fe909cae118a7 Boris Brezillon 2024-02-29  369  out_unlock:
5fe909cae118a7 Boris Brezillon 2024-02-29  370  	mutex_unlock(&ptdev->pm.mmio_lock);
5fe909cae118a7 Boris Brezillon 2024-02-29  371  	drm_dev_exit(cookie);
5fe909cae118a7 Boris Brezillon 2024-02-29  372  	return ret;
5fe909cae118a7 Boris Brezillon 2024-02-29  373  }
5fe909cae118a7 Boris Brezillon 2024-02-29  374  

:::::: The code at line 355 was first introduced by commit
:::::: 5fe909cae118a757a77afb37174b99436a36d2e2 drm/panthor: Add the device logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
