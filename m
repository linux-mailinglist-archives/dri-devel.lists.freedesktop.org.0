Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFE3A50011
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3200F10E7F1;
	Wed,  5 Mar 2025 13:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRVE3pdR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C1810E822;
 Wed,  5 Mar 2025 13:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180559; x=1772716559;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FSA9Ozv525IV5w6+GJaUCX1AAA/L5wOmQaWsfimaaX4=;
 b=bRVE3pdRrPUhBZzx3R3IJwBuZtr0HlF07kq+erI2ly6o1hAch/0BPwOT
 FPFnzBVMkZQjt9+99NG3Nf9rTSh0GX9yTkz9i1+Z25cumgYnsLTze01rq
 siuMmtKvgwz5uZJEL/vSQfbIV+ve6ZAfEcbvEP3GM7YnJ1TwP14LhVc+M
 UmaOO1LyRmNHqvRFB+VjmHAud/+he+tbkripsStcoLSCSMgs/HP6bf4rB
 Rzf7OL1KNxUiZXp0YoNZQrM8quymt8CNpDDmCiYHe48HQN50YCziHFSJ6
 09JMdA69WduG+Dgvm++L6JmEZxAMTQkp/t4fU9ax263pW8heiS1I0nSCl w==;
X-CSE-ConnectionGUID: fnpU1dFrRjiF3aPCjSr8qQ==
X-CSE-MsgGUID: hPtxTECjTlSOfz+hGNE5aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53537157"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="53537157"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:15:59 -0800
X-CSE-ConnectionGUID: +qx5GYliTR65WIshKN7ndw==
X-CSE-MsgGUID: CFm95MOBS+qd55cWAF9+lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118610885"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 05 Mar 2025 05:15:55 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tpobI-000KzO-36;
 Wed, 05 Mar 2025 13:15:52 +0000
Date: Wed, 5 Mar 2025 21:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Su Hui <suhui@nfschina.com>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, Su Hui <suhui@nfschina.com>,
 ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
 michael.j.ruhl@intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/xe: Select INTEL_VSEC to fix build dependency
Message-ID: <202503052153.gQnXU123-lkp@intel.com>
References: <20250227073205.1248282-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227073205.1248282-1-suhui@nfschina.com>
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

Hi Su,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Su-Hui/drm-xe-Select-INTEL_VSEC-to-fix-build-dependency/20250227-153437
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250227073205.1248282-1-suhui%40nfschina.com
patch subject: [PATCH] drm/xe: Select INTEL_VSEC to fix build dependency
config: loongarch-randconfig-001-20250304 (https://download.01.org/0day-ci/archive/20250305/202503052153.gQnXU123-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503052153.gQnXU123-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503052153.gQnXU123-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "intel_vsec_register" [drivers/gpu/drm/xe/xe.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_VSEC
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && PCI [=y]
   Selected by [m]:
   - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=y] || KUNIT [=y]=y [=y])
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
