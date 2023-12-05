Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246CA8051CE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 12:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450E010E4F4;
	Tue,  5 Dec 2023 11:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93B410E23C;
 Tue,  5 Dec 2023 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701774928; x=1733310928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NtqRqAaSN8bHzbwU6WekMXe7XL+AeersMYsyODUzhOc=;
 b=H6pNfMzHWba/P3WE7f6CVJNcA05UhBWn+JiWHd8jGxUknNKymi+ll1/O
 Aa2mimrVrQyy0Y926QYv226MNS0it3eiDuWimQoMRHQbHBRHBxbhmeyef
 jxmgdrWUwxpwOgQG+vW2mgsbm9ES82yniZDbyxPsPkplWk2uxt1sR0OmE
 /iEuVQvGDyxDpDuzJ4SIUJ/dA6kBgtFBkPKn1WE2c7lbeIUDjbYz8UizS
 nIcgt8MrBrvpaEwaYqX6KoLS7XJ2s3T/ipoH3z+6xtlDRBWM/FTs+M4cZ
 Cs5szoj0eMu+MZMfpjCT84F6MKGnd4kMDD5egkviggbmUYXcrwT5WJU3M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7223274"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="7223274"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:15:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="720663324"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="720663324"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 03:15:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rATOc-0008qM-27;
 Tue, 05 Dec 2023 11:15:22 +0000
Date: Tue, 5 Dec 2023 19:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/amdgpu: Auto-validate DMABuf imports in compute
 VMs
Message-ID: <202312051955.xACUCivN-lkp@intel.com>
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
config: powerpc-randconfig-001-20231203 (https://download.01.org/0day-ci/archive/20231205/202312051955.xACUCivN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051955.xACUCivN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051955.xACUCivN-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.o: in function `amdgpu_gem_object_open':
>> amdgpu_gem.c:(.text.amdgpu_gem_object_open+0x150): undefined reference to `amdgpu_amdkfd_bo_validate_and_fence'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
