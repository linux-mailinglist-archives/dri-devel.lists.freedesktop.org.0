Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01BEB18F88
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 19:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F43E10E3D9;
	Sat,  2 Aug 2025 17:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWLlbqy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B5B10E3D9
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754154627; x=1785690627;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=9OfZsNdzC3A3dlAq/0TjWSxveuh+hxfJig0qqeoFVuY=;
 b=gWLlbqy4feNTB1MneXsO82s1maPzbHu39fbNYrH4ouvOPcomxZ/1G90T
 crCR64uj3Qh3oZDsXrexM8pCIL5fwGbrp5aia2N/oCM5uh+4AKKq2umYe
 bK/QeeBCnpak/8yVyRgU777l3oXa43jMHBkTs6sd7ej65M4YexWjJq+8x
 pM3cYo6KkWsJzzkk9cdDIRb8XoMzdI2FEk8OrTHAA7uJjpachuewQB3k4
 upZk/c8EY4NvnQq8OxJ6S72/P8D7hBev9PdsNvzhP2mfavDAgt0MwHKkH
 0pvobwVJzbgc8LaxzVUnh6W+Jk2Sc8O6pZfe1WYTb4eZk8yb0UniBE6YO w==;
X-CSE-ConnectionGUID: 8ijRmcbJTbSsEqSf4M5d+g==
X-CSE-MsgGUID: LGKEz3jXSFu7AJZRFZ+r2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="44067862"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="44067862"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2025 10:10:27 -0700
X-CSE-ConnectionGUID: ZpCNY1+VQDiArH3vVe2bew==
X-CSE-MsgGUID: nHPFmd7JQ5qLCrQg+/DhCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164269940"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 02 Aug 2025 10:10:25 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uiFkV-0005V2-1W;
 Sat, 02 Aug 2025 17:10:23 +0000
Date: Sun, 3 Aug 2025 01:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>
Subject: drivers/accel/rocket/rocket_drv.c:225:1: sparse: sparse: symbol
 'rocket_pm_ops' was not declared. Should it be static?
Message-ID: <202508030021.uwdr4P08-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-misc-next
head:   01ac6e4e53b6351df42c97d217b0d2dbeef5c917
commit: ed98261b41687323ffa02ca20fef1e60b38fd1aa accel/rocket: Add a new driver for Rockchip's NPU
date:   8 days ago
config: arm64-randconfig-r132-20250802 (https://download.01.org/0day-ci/archive/20250803/202508030021.uwdr4P08-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250803/202508030021.uwdr4P08-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030021.uwdr4P08-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/rocket/rocket_drv.c:225:1: sparse: sparse: symbol 'rocket_pm_ops' was not declared. Should it be static?

vim +/rocket_pm_ops +225 drivers/accel/rocket/rocket_drv.c

   224	
 > 225	EXPORT_GPL_DEV_PM_OPS(rocket_pm_ops) = {
   226		RUNTIME_PM_OPS(rocket_device_runtime_suspend, rocket_device_runtime_resume, NULL)
   227		SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
   228	};
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
