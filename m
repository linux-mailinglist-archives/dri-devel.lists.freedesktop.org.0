Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A5AB32D6C
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 06:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB5410E0DF;
	Sun, 24 Aug 2025 04:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZoEGjzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAAA10E0DF
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 04:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756008101; x=1787544101;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DSbsqCo62f2I7cUW/NtdCvveyEi8icWUS2ub9JnZtGc=;
 b=QZoEGjzXPoAZP4xFGJZcWFO2rEdYQzdo7M43uzibk6BdWkeTIsdksqWK
 k9SjusuYFCQIP3Mw92j2m0WChi7+Wid4Qr9rZzgf61P7Myv9S4EERXfzi
 Vvzgl9MB/VE1UJmaLRZIfouZ0WGNseE/hhW8HoaKb3o0biZOwW53rOEqj
 PeZ8vpSouIwC7R3jbXuhIR73OvCxlfo+wt1dKmnmWzliugup9935UxTcG
 7gx2lruAOKlnhShLTKiYFszp/kK0PxjZgpVdzPPUMnvDbNwSFWplOVQ2f
 D49QKSRxrErKxtxMOvoYPVB1ICg9j/IkRt1tRB6HNDfm5XWIaxFQvwl1g w==;
X-CSE-ConnectionGUID: dnkAmNjRTvK6gzeHtlWREQ==
X-CSE-MsgGUID: ZdJOMseFS1Gwkp4IYOngoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58121312"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58121312"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2025 21:01:40 -0700
X-CSE-ConnectionGUID: D5G9j+PIT+mcR8bJXuzjyA==
X-CSE-MsgGUID: IJW2c3yTRDyfxGZmqkI1pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="192681177"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 23 Aug 2025 21:01:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uq1v0-000MkN-1X;
 Sun, 24 Aug 2025 04:01:24 +0000
Date: Sun, 24 Aug 2025 12:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: Faith Ekstrand <faith@gfxstrand.net>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH 6/7] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
Message-ID: <202508241157.XlCVeP0d-lkp@intel.com>
References: <20250822142954.902402-7-faith.ekstrand@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822142954.902402-7-faith.ekstrand@collabora.com>
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

Hi Faith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Faith-Ekstrand/drm-shmem-Add-a-drm_gem_shmem_sync_mmap-helper/20250822-223306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250822142954.902402-7-faith.ekstrand%40collabora.com
patch subject: [PATCH 6/7] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
config: um-randconfig-r133-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241157.XlCVeP0d-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241157.XlCVeP0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241157.XlCVeP0d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panfrost/panfrost_drv.c:664:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/panfrost/panfrost_drv.c:665:9: sparse:   also defined here

vim +664 drivers/gpu/drm/panfrost/panfrost_drv.c

f3ba91228e8e917 Rob Herring     2018-09-10  650  
f3ba91228e8e917 Rob Herring     2018-09-10  651  static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
f3ba91228e8e917 Rob Herring     2018-09-10  652  #define PANFROST_IOCTL(n, func, flags) \
f3ba91228e8e917 Rob Herring     2018-09-10  653  	DRM_IOCTL_DEF_DRV(PANFROST_##n, panfrost_ioctl_##func, flags)
f3ba91228e8e917 Rob Herring     2018-09-10  654  
c1572b756066235 Emil Velikov    2019-11-01  655  	PANFROST_IOCTL(SUBMIT,		submit,		DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  656  	PANFROST_IOCTL(WAIT_BO,		wait_bo,	DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  657  	PANFROST_IOCTL(CREATE_BO,	create_bo,	DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  658  	PANFROST_IOCTL(MMAP_BO,		mmap_bo,	DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  659  	PANFROST_IOCTL(GET_PARAM,	get_param,	DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  660  	PANFROST_IOCTL(GET_BO_OFFSET,	get_bo_offset,	DRM_RENDER_ALLOW),
7786fd1087774c6 Boris Brezillon 2019-06-18  661  	PANFROST_IOCTL(PERFCNT_ENABLE,	perfcnt_enable,	DRM_RENDER_ALLOW),
7786fd1087774c6 Boris Brezillon 2019-06-18  662  	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
013b6510131568c Rob Herring     2019-08-05  663  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
2f684bbbcb27048 Adrián Larumbe  2025-05-20 @664  	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
0f6b6cfee96633e Faith Ekstrand  2025-08-22  665  	PANFROST_IOCTL(SYNC_BO,		sync_bo,	DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  666  };
f3ba91228e8e917 Rob Herring     2018-09-10  667  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
