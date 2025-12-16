Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42C8CC2454
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 12:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE22510E704;
	Tue, 16 Dec 2025 11:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTNrrAo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD99210E704;
 Tue, 16 Dec 2025 11:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765884771; x=1797420771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AJ7AIQ/Y67ADOdmVR2elpS/em6+5xguyK7AuzVoIWdI=;
 b=TTNrrAo+UGb8gVzb6OF4RIp5NHVtfeV7mqrbjWfRzjwZNTwVEryOwyJU
 bGiao+810sonNe4qBjwKXJQqLLdB273mN//O0D2M3m+a2tZOTUOJbrto3
 j1lMKIey4EKQMrjKfwcGra1CZAwxlg+leB9S6Vpf3BPGmVorMoFUT8fyi
 6INf67pvK6FCi/wvRayICyhiafTjulGaNLxAqVpVq9y9XZt05A107IEAo
 KPGbCXS5ZqUrsWcPsplOPeFJdu0m2S5f6abvDInvNDgFYcdaEGBSvI6am
 6X4mnr7ssxty3EL5RsCXEu4UhIwr2BfkepK1O41M2oXn3f9I28j4ip8Rp g==;
X-CSE-ConnectionGUID: fI/5doeDR92zQCZikgRAmQ==
X-CSE-MsgGUID: Myu7A89PRrak2mvkuL7U1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79255411"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="79255411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:32:51 -0800
X-CSE-ConnectionGUID: P4ldY8DMSyKa8Efejof1eQ==
X-CSE-MsgGUID: msEJXspjQ5KJVo77OYPbHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="228675151"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 16 Dec 2025 03:32:50 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vVTIN-000000001ke-20Zm;
 Tue, 16 Dec 2025 11:32:47 +0000
Date: Tue, 16 Dec 2025 19:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [CI 2/4] drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
Message-ID: <202512161949.FGqB4Iim-lkp@intel.com>
References: <20251215201806.196514-3-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215201806.196514-3-michal.wajdeczko@intel.com>
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

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.19-rc1 next-20251216]
[cannot apply to daeinki-drm-exynos/exynos-drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wajdeczko/drm-xe-Introduce-IF_ARGS-macro-utility/20251216-042142
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251215201806.196514-3-michal.wajdeczko%40intel.com
patch subject: [CI 2/4] drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
config: sparc-randconfig-001-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161949.FGqB4Iim-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161949.FGqB4Iim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161949.FGqB4Iim-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c:20:
   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c: In function 'pf_gt_migration_check_support':
>> drivers/gpu/drm/xe/xe_guc.h:19:73: error: expected expression before ')' token
    #define MAKE_GUC_VER(maj, min, pat) (((maj) << 16) | ((min) << 8) | (pat))
                                                                            ^
   drivers/gpu/drm/xe/xe_guc.h:23:3: note: in expansion of macro 'MAKE_GUC_VER'
      MAKE_GUC_VER(PICK_ARG1(ver), PICK_ARG2(ver), IF_ARGS(PICK_ARG3(ver), 0, PICK_ARG3(ver))))
      ^~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc.h:30:36: note: in expansion of macro 'MAKE_GUC_VER_ARGS'
     xe_guc_fw_version_at_least((guc), MAKE_GUC_VER_ARGS(ver))
                                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c:1029:7: note: in expansion of macro 'GUC_FIRMWARE_VER_AT_LEAST'
     if (!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 54))
          ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/xe/xe_guc_ads.c:23:
   drivers/gpu/drm/xe/xe_guc_ads.c: In function 'guc_waklv_init':
>> drivers/gpu/drm/xe/xe_guc.h:19:73: error: expected expression before ')' token
    #define MAKE_GUC_VER(maj, min, pat) (((maj) << 16) | ((min) << 8) | (pat))
                                                                            ^
   drivers/gpu/drm/xe/xe_guc.h:23:3: note: in expansion of macro 'MAKE_GUC_VER'
      MAKE_GUC_VER(PICK_ARG1(ver), PICK_ARG2(ver), IF_ARGS(PICK_ARG3(ver), 0, PICK_ARG3(ver))))
      ^~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc.h:30:36: note: in expansion of macro 'MAKE_GUC_VER_ARGS'
     xe_guc_fw_version_at_least((guc), MAKE_GUC_VER_ARGS(ver))
                                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_ads.c:350:6: note: in expansion of macro 'GUC_FIRMWARE_VER_AT_LEAST'
     if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 44) && XE_GT_WA(gt, 16026508708))
         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_guc.h:19:73: error: expected expression before ')' token
    #define MAKE_GUC_VER(maj, min, pat) (((maj) << 16) | ((min) << 8) | (pat))
                                                                            ^
   drivers/gpu/drm/xe/xe_guc.h:23:3: note: in expansion of macro 'MAKE_GUC_VER'
      MAKE_GUC_VER(PICK_ARG1(ver), PICK_ARG2(ver), IF_ARGS(PICK_ARG3(ver), 0, PICK_ARG3(ver))))
      ^~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc.h:30:36: note: in expansion of macro 'MAKE_GUC_VER_ARGS'
     xe_guc_fw_version_at_least((guc), MAKE_GUC_VER_ARGS(ver))
                                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_ads.c:353:6: note: in expansion of macro 'GUC_FIRMWARE_VER_AT_LEAST'
     if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 47) && XE_GT_WA(gt, 16026007364)) {
         ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +19 drivers/gpu/drm/xe/xe_guc.h

dd08ebf6c3525a7 Matthew Brost    2023-03-30  13  
4eb0aab6e4434ad Julia Filipchuk  2024-08-02  14  /*
4eb0aab6e4434ad Julia Filipchuk  2024-08-02  15   * GuC version number components are defined to be only 8-bit size,
4eb0aab6e4434ad Julia Filipchuk  2024-08-02  16   * so converting to a 32bit 8.8.8 integer allows simple (and safe)
4eb0aab6e4434ad Julia Filipchuk  2024-08-02  17   * numerical comparisons.
4eb0aab6e4434ad Julia Filipchuk  2024-08-02  18   */
4eb0aab6e4434ad Julia Filipchuk  2024-08-02 @19  #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
4eb0aab6e4434ad Julia Filipchuk  2024-08-02  20  #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
9100abdb735432b Michal Wajdeczko 2025-12-15  21  #define MAKE_GUC_VER_ARGS(ver...) \
9100abdb735432b Michal Wajdeczko 2025-12-15  22  	(BUILD_BUG_ON_ZERO(COUNT_ARGS(ver) < 2 || COUNT_ARGS(ver) > 3) + \
9100abdb735432b Michal Wajdeczko 2025-12-15  23  	 MAKE_GUC_VER(PICK_ARG1(ver), PICK_ARG2(ver), IF_ARGS(PICK_ARG3(ver), 0, PICK_ARG3(ver))))
9100abdb735432b Michal Wajdeczko 2025-12-15  24  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
