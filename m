Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16301B15903
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 08:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DED10E3FC;
	Wed, 30 Jul 2025 06:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCyGaUzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCA810E3FC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 06:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753857561; x=1785393561;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=DeNfYpXay6VjnqrhIGbam1Yw5A/Qy+vtg2AJeQozh2w=;
 b=jCyGaUzHWSohmhILO5+JBrU9a3YIaGHFonpC2W10+mLvI50KJAmpjKYC
 30UY/90TAhMAZ+HA0P638uIfReFaK46Ah1hfgZ+sxpu4WQA5kBJVygSxZ
 fg4hSV5WapAYVy9lU3PV/3FYFgiRE3GiPmatpTRnWMAt0iY/5sPUvZgwm
 rOJ62rj2XfqAxg8BmKjWLComNFoQ6sicA0wGJQ0/7zstiG1gyfejB2dHY
 IzksEE8l3BE6ePIR91Pi+nmsl8sCFLXqIZ1k96Y8GwyZ/8DzSCcSeWwTx
 vTddq7jqGiXQ09Gay0L9U32mjsELT9VRnos9rOrSrwMRL9T4MIfQKGO7A A==;
X-CSE-ConnectionGUID: M4mwm3rQRtCoHMrXdQ82RA==
X-CSE-MsgGUID: GBMHZFKrSYOis7qCOvHV1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56295595"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56295595"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:39:20 -0700
X-CSE-ConnectionGUID: +FfgERvXQM6661R7xZqANQ==
X-CSE-MsgGUID: EF47TEmcQEmaoU29rYmZdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163687338"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2025 23:39:19 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uh0T7-00027u-0d;
 Wed, 30 Jul 2025 06:39:17 +0000
Date: Wed, 30 Jul 2025 14:38:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>
Subject: [drm-exynos:exynos-drm-next 3/3]
 drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:13: error: use of undeclared
 identifier 'DSIM_TYPE_EXYNOS7870'
Message-ID: <202507301448.RRNuQS1g-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
head:   3b57713ed0626c2277b871f11de467fdf8d154ef
commit: 3b57713ed0626c2277b871f11de467fdf8d154ef [3/3] drm/exynos: dsi: add support for exynos7870
config: arm64-randconfig-002-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301448.RRNuQS1g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301448.RRNuQS1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301448.RRNuQS1g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:13: error: use of undeclared identifier 'DSIM_TYPE_EXYNOS7870'
     158 |         .hw_type = DSIM_TYPE_EXYNOS7870,
         |                    ^
   1 error generated.


vim +/DSIM_TYPE_EXYNOS7870 +158 drivers/gpu/drm/exynos/exynos_drm_dsi.c

   156	
   157	static const struct samsung_dsim_plat_data exynos7870_dsi_pdata = {
 > 158		.hw_type = DSIM_TYPE_EXYNOS7870,
   159		.host_ops = &exynos_dsi_exynos_host_ops,
   160	};
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
