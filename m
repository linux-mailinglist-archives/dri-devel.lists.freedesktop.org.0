Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D41E723820
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 08:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6864C10E20D;
	Tue,  6 Jun 2023 06:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EA410E20D;
 Tue,  6 Jun 2023 06:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686034204; x=1717570204;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HJEcGOnvHXkQ06r29IlNbWbtbBpgoKOiTCDx8CIrhyU=;
 b=DSu1cyAVBVHxCfF3wVXHDdGzDjfXbRlOeBQWE9nXs1kXNtAalvienC2K
 qvjjELhMBvXRsfybDnEELb+GRiJFEBXkOVFh3HOZ4tWT5yYczDZY0UjaS
 spn5Ej2QhHM2YZLAcvx+YKF2aOtguLUZctV+Nzm65vAqwhNpuJzhR3P1B
 XFBBjI+ASf5fjSlLiSxyuYXt52vtKlxEuywReHn+U5LoquziO2d1XW9n/
 Job4P1rxkQaHKWZ5FJhahIHikJyrxcpxF6l0UHzIV9vL49TDC5krf0Qoh
 dfZHgmfsThdz4XZAOKkeV5fswGn2SUGC2Nf9xq4wGdfxB6E2r7Sm55WpK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420130575"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="420130575"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 23:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798712306"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="798712306"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 23:50:02 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q6QW1-0004ww-2K;
 Tue, 06 Jun 2023 06:50:01 +0000
Date: Tue, 6 Jun 2023 14:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/mtl/gsc: Add a gsc_info
 debugfs
Message-ID: <202306061441.HlzHQi07-lkp@intel.com>
References: <20230606022402.2048235-5-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606022402.2048235-5-daniele.ceraolospurio@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniele,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniele-Ceraolo-Spurio/drm-i915-gsc-fixes-and-updates-for-GSC-memory-allocation/20230606-102510
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230606022402.2048235-5-daniele.ceraolospurio%40intel.com
patch subject: [Intel-gfx] [PATCH v2 4/5] drm/i915/mtl/gsc: Add a gsc_info debugfs
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230606/202306061441.HlzHQi07-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch drm-tip drm-tip
        git checkout drm-tip/drm-tip
        b4 shazam https://lore.kernel.org/r/20230606022402.2048235-5-daniele.ceraolospurio@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061441.HlzHQi07-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c:28:6: warning: no previous prototype for 'intel_gsc_uc_debugfs_register' [-Wmissing-prototypes]
      28 | void intel_gsc_uc_debugfs_register(struct intel_gsc_uc *gsc_uc, struct dentry *root)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/intel_gsc_uc_debugfs_register +28 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c

    27	
  > 28	void intel_gsc_uc_debugfs_register(struct intel_gsc_uc *gsc_uc, struct dentry *root)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
