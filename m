Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AF9878AFB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 23:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0563710ED22;
	Mon, 11 Mar 2024 22:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iiL+Fz0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A249310ED22
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 22:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710197584; x=1741733584;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=BeNcdnK2fnWOl260VivqAU111bCuji+mDZBnf03mY9M=;
 b=iiL+Fz0RSSUV3Q92rpb8z8nRfuYM/FFheFw6O/XR8kJhmOfrFOPm98cO
 DLNY/94jcL+lgzN0rgCRvjajcmDdBg/QrYa0Cn7LiF3NqnlA1VHkfR+U4
 oAwYKuS6hYpYiYQNp4IWZX2K+7ldJ4h5/Gku5ZTfl6zrT2HTBXKkILkzo
 VOM8zG3mCchwL8AkkcNVTbB709+P56UwknBhpSj78wW34zfLGOehWNFvW
 4MB1Ab3HiM415JwFavsdkdqsRODVRhEt6Agpq92uqTv+AMgR2DIjI2zoY
 eAzFdpNR5IosjYWtiEfj7PtSG3BP1n95OPDYZoeDM84n+HLUyvWlA1XzC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="27360714"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="27360714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 15:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11386364"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2024 15:53:01 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rjoVv-0009WR-1a;
 Mon, 11 Mar 2024 22:52:59 +0000
Date: Tue, 12 Mar 2024 06:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>
Subject: [drm-misc:drm-misc-next 3/3] drivers/iommu/Kconfig:14:error:
 recursive dependency detected!
Message-ID: <202403120656.GMVNLWml-lkp@intel.com>
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

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   b33651a5c98dbd5a919219d8c129d0674ef74299
commit: 674dc7f61aefea81901c21402946074927e63f1a [3/3] drm/panthor: Fix undefined panthor_device_suspend/resume symbol issue
config: x86_64-rhel-8.3-rust (attached as .config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120656.GMVNLWml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120656.GMVNLWml-lkp@intel.com/

Note: the drm-misc/drm-misc-next HEAD b33651a5c98dbd5a919219d8c129d0674ef74299 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/iommu/Kconfig:14:error: recursive dependency detected!
   drivers/iommu/Kconfig:14:	symbol IOMMU_SUPPORT is selected by DRM_PANTHOR
   drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on PM
   kernel/power/Kconfig:183:	symbol PM is selected by PM_SLEEP
   kernel/power/Kconfig:117:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
   kernel/power/Kconfig:35:	symbol HIBERNATE_CALLBACKS is selected by XEN_SAVE_RESTORE
   arch/x86/xen/Kconfig:67:	symbol XEN_SAVE_RESTORE depends on XEN
   arch/x86/xen/Kconfig:6:	symbol XEN depends on PARAVIRT
   arch/x86/Kconfig:781:	symbol PARAVIRT is selected by HYPERV
   drivers/hv/Kconfig:5:	symbol HYPERV depends on X86_LOCAL_APIC
   arch/x86/Kconfig:1106:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
   arch/x86/Kconfig:1081:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
   drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
   drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +14 drivers/iommu/Kconfig

68255b628776df Joerg Roedel    2011-06-14 @14  menuconfig IOMMU_SUPPORT
68255b628776df Joerg Roedel    2011-06-14  15  	bool "IOMMU Hardware Support"
e5144c93758519 Arnd Bergmann   2015-01-28  16  	depends on MMU
68255b628776df Joerg Roedel    2011-06-14  17  	default y
a7f7f6248d9740 Masahiro Yamada 2020-06-14  18  	help
68255b628776df Joerg Roedel    2011-06-14  19  	  Say Y here if you want to compile device drivers for IO Memory
68255b628776df Joerg Roedel    2011-06-14  20  	  Management Units into the kernel. These devices usually allow to
68255b628776df Joerg Roedel    2011-06-14  21  	  remap DMA requests and/or remap interrupts from other devices on the
68255b628776df Joerg Roedel    2011-06-14  22  	  system.
68255b628776df Joerg Roedel    2011-06-14  23  

:::::: The code at line 14 was first introduced by commit
:::::: 68255b628776dfafa7f67ca3afd66bd4ba377307 iommu: Move iommu Kconfig entries to submenu

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
