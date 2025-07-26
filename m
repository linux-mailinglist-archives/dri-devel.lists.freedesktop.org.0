Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A09B12A99
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 15:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6679410E118;
	Sat, 26 Jul 2025 13:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4n4lG/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9094510E118;
 Sat, 26 Jul 2025 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753535446; x=1785071446;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MUr2pfCRzwQv/cxIlfRNNx5NuIqzQZytUjrYtJlln3Q=;
 b=e4n4lG/rAE71O/6cM7o+fjou3l0wsDp+ky7w1tBx0bkf/g5vY1PSI3am
 hMXP3P9GA0bIx1ukgDXvLKBc94YsxCgstGhiEPHf8jtvGmXcjkZv7+vSG
 GL5Me6qvpAGtYCD5zGAapihkkfvxzTivZRoT/tuWU7tdGTRgnopcZd3Ak
 lc+MhIxczcUEIhQXxVRMWrd9pRr0pbFUZjMY/BATHUBR0gGYWkMuPzDS8
 /ftu325/0QW5dlSyr7Z7gy5eFAc0E2JP6CPvG+XtQ55KVjsuY0oz5Wfoi
 cPz3FLsmjK0vBk84f2xB5ftJcICQLNsX7xpdABkmDGD3qRL/NBuecL23Q g==;
X-CSE-ConnectionGUID: 0FvMvFMYSEqeG5CCE2sSRQ==
X-CSE-MsgGUID: 5XjlnxegSkuTzqlyIBro1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="56000836"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56000836"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 06:10:45 -0700
X-CSE-ConnectionGUID: +D4fztZ9S2mnFjl5+0kjmA==
X-CSE-MsgGUID: jzqKvswbSSeFtzKVh8YE1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162356963"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 26 Jul 2025 06:10:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ufefg-000Lzj-1H;
 Sat, 26 Jul 2025 13:10:40 +0000
Date: Sat, 26 Jul 2025 21:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>,
 Shankar@kaveri.local, Uma <uma.shankar@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>, victoria@system76.com,
 David Turner <david.turner@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm: Add HW_DONE_DEADLINE immutable atomic CRTC
 property
Message-ID: <202507262035.wxgiJwAZ-lkp@intel.com>
References: <20250724165220.1189129-4-michel@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724165220.1189129-4-michel@daenzer.net>
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

Hi Michel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.16-rc7 next-20250725]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michel-D-nzer/drm-kms-Add-DRM_EVENT_ATOMIC_HW_DONE-event-type/20250725-010202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250724165220.1189129-4-michel%40daenzer.net
patch subject: [PATCH 3/4] drm: Add HW_DONE_DEADLINE immutable atomic CRTC property
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250726/202507262035.wxgiJwAZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507262035.wxgiJwAZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507262035.wxgiJwAZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_crtc.c:963 function parameter 'deadline' not described in 'drm_crtc_set_hw_done_deadline_property'
   Warning: drivers/gpu/drm/drm_crtc.c:963 Excess function parameter 'capable' description in 'drm_crtc_set_hw_done_deadline_property'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
