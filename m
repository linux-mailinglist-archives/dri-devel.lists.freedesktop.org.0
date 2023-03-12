Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448AD6B6363
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 06:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CDB10E34B;
	Sun, 12 Mar 2023 05:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF3210E344;
 Sun, 12 Mar 2023 05:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678599855; x=1710135855;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=5rpbwkC/T7Ge8tXMUt4r72Ai90k4S0R5laITXbhGfzQ=;
 b=SMYcPKN4FvM/J/8TH+FY83sjX2tAp9HjDNGKYazeRjrA3gHYNmlFlXSa
 PtwqZ5129qbBkIluPmjx/9Jqj/Vov0M7YHavkgdIx5i13RaRhicnV90X3
 v5Y2dW4yqbZJeLNfQkRAmNi5j3Cmg2rRwcsGgz1rIZWlRstBdNRZpcJo4
 rL9QT08zpGeRatse/grN4BDqOPlNOhAXyo4XDqOVGEmRbXm9YxRiXH43+
 8DhwcY1EraU1FUEhR8uqmwXtLbaATAouR/7nZHxFIwu2ZtvcVoxB5Yvnk
 kB4W9KYalcH/pgGXXKZ71VPSeiEsGUDQ1D5DeWN+ioolrf6jgclhbba1z A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="325319702"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; d="scan'208";a="325319702"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2023 21:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="747203005"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; d="scan'208";a="747203005"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 11 Mar 2023 21:44:13 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pbEVA-00051I-0O;
 Sun, 12 Mar 2023 05:44:12 +0000
Date: Sun, 12 Mar 2023 13:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-tip:drm-tip 5/7]
 drivers/gpu/drm/i915/gt/intel_workarounds.c:1479:34: error: unused variable
 'i915'
Message-ID: <202303121304.7ijxTeDU-lkp@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   b21ced77ae1dbc3d8b01d3aef3c99bba7377a69b
commit: 878ab630c6059f436bdf6bdef59f97eb5753a155 [5/7] Merge remote-tracking branch 'drm-intel/drm-intel-gt-next' into drm-tip
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230312/202303121304.7ijxTeDU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout 878ab630c6059f436bdf6bdef59f97eb5753a155
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121304.7ijxTeDU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_workarounds.c: In function 'dg1_gt_workarounds_init':
>> drivers/gpu/drm/i915/gt/intel_workarounds.c:1479:34: error: unused variable 'i915' [-Werror=unused-variable]
    1479 |         struct drm_i915_private *i915 = gt->i915;
         |                                  ^~~~
   cc1: all warnings being treated as errors


vim +/i915 +1479 drivers/gpu/drm/i915/gt/intel_workarounds.c

f52fa57ae70e2e Matt Roper                  2020-07-16  1475  
da942750928a03 Stuart Summers              2020-10-14  1476  static void
d0a652493abd86 Venkata Sandeep Dhanalakota 2021-09-17  1477  dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
da942750928a03 Stuart Summers              2020-10-14  1478  {
d0a652493abd86 Venkata Sandeep Dhanalakota 2021-09-17 @1479  	struct drm_i915_private *i915 = gt->i915;
d0a652493abd86 Venkata Sandeep Dhanalakota 2021-09-17  1480  
d0a652493abd86 Venkata Sandeep Dhanalakota 2021-09-17  1481  	gen12_gt_workarounds_init(gt, wal);
da942750928a03 Stuart Summers              2020-10-14  1482  
da942750928a03 Stuart Summers              2020-10-14  1483  	/* Wa_1409420604:dg1 */
d1b3657fb5b66a Lucas De Marchi             2023-03-06  1484  	wa_mcr_write_or(wal, SUBSLICE_UNIT_LEVEL_CLKGATE2,
da942750928a03 Stuart Summers              2020-10-14  1485  			CPSSUNIT_CLKGATE_DIS);
da942750928a03 Stuart Summers              2020-10-14  1486  
da942750928a03 Stuart Summers              2020-10-14  1487  	/* Wa_1408615072:dg1 */
da942750928a03 Stuart Summers              2020-10-14  1488  	/* Empirical testing shows this register is unaffected by engine reset. */
d1b3657fb5b66a Lucas De Marchi             2023-03-06  1489  	wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL);
da942750928a03 Stuart Summers              2020-10-14  1490  }
da942750928a03 Stuart Summers              2020-10-14  1491  

:::::: The code at line 1479 was first introduced by commit
:::::: d0a652493abd86180ad0cc0ed44427831d37fabe drm/i915: Make wa list per-gt

:::::: TO: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
:::::: CC: Matt Roper <matthew.d.roper@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
