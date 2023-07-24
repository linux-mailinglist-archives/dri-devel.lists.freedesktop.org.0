Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A2575F834
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 15:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C0110E317;
	Mon, 24 Jul 2023 13:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D6610E316;
 Mon, 24 Jul 2023 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690205178; x=1721741178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rRj9ZIINSZVCOZEchPBNGd+/TGphUXr/fqbiJ4Ays80=;
 b=OgUOImOSsyXt44AhBRzxo/V4gGfQhIEuI1LiW5FsNMHSzzjdF/fRes9d
 tkk2YMFjYioMgUEoXlJvee99cSK7Q77q2ATZt9fnToSXEMDgh+5mI1Y6T
 2uiHAdZ9F/ZuEzweasy3HVnIaUyOn+FcZa8IxBN94vuA2bSjw+7o6BcWE
 DMpkfGoOmKLOTSFxq51BHK7h03x7ZoF4ft0U7KKp/GwkPqmOiObrmBSew
 U+BGHS5IcqU2vM+goN19tb9KPHFDliGVtpYkFbc0RkL3iLaV05LsgXY/+
 X+ibiaVc6CsIarjyvoatnMF8mGPuQL0UtQKK2nhKj+UZy8NQUZMLhkafk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="453816689"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="453816689"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 06:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="790962677"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="790962677"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 24 Jul 2023 06:26:15 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qNvZi-0009jv-1T;
 Mon, 24 Jul 2023 13:26:11 +0000
Date: Mon, 24 Jul 2023 21:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: sunran001@208suo.com, alexander.deucher@amd.com
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in sienna_cichlid_ppt.c
Message-ID: <202307242115.Lz6daJQo-lkp@intel.com>
References: <ea1cf43d5545fa917127694a294a57da@208suo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea1cf43d5545fa917127694a294a57da@208suo.com>
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
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc3 next-20230724]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunran001-208suo-com/drm-amd-pm-Clean-up-errors-in-sienna_cichlid_ppt-c/20230724-153134
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/ea1cf43d5545fa917127694a294a57da%40208suo.com
patch subject: [PATCH] drm/amd/pm: Clean up errors in sienna_cichlid_ppt.c
config: riscv-randconfig-r014-20230724 (https://download.01.org/0day-ci/archive/20230724/202307242115.Lz6daJQo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242115.Lz6daJQo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307242115.Lz6daJQo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:595:28: error: use of undeclared identifier 'smu_table'; did you mean 'smu_tabl'?
                   (SmuMetricsExternal_t *)(smu_table->metrics_table);
                                            ^~~~~~~~~
                                            smu_tabl
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:593:28: note: 'smu_tabl' declared here
           struct smu_table_context *smu_tabl = &smu->smu_table;
                                     ^
   1 error generated.


vim +595 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c

b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c      Likun Gao            2020-05-29  590  
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  591  static uint32_t sienna_cichlid_get_throttler_status_locked(struct smu_context *smu)
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  592  {
34af41f9a039153 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c sunran001@208suo.com 2023-07-24  593  	struct smu_table_context *smu_tabl = &smu->smu_table;
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  594  	SmuMetricsExternal_t *metrics_ext =
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06 @595  		(SmuMetricsExternal_t *)(smu_table->metrics_table);
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  596  	uint32_t throttler_status = 0;
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  597  	int i;
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  598  
1d789535a03679e drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Alex Deucher         2021-10-04  599  	if ((smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
7952fa0d3e18750 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Danijel Slivka       2022-03-02  600  	     (smu->smc_fw_version >= 0x3A4900)) {
7952fa0d3e18750 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Danijel Slivka       2022-03-02  601  		for (i = 0; i < THROTTLER_COUNT; i++)
7952fa0d3e18750 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Danijel Slivka       2022-03-02  602  			throttler_status |=
7952fa0d3e18750 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Danijel Slivka       2022-03-02  603  				(metrics_ext->SmuMetrics_V3.ThrottlingPercentage[i] ? 1U << i : 0);
7952fa0d3e18750 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Danijel Slivka       2022-03-02  604  	} else if ((smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  605  	     (smu->smc_fw_version >= 0x3A4300)) {
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  606  		for (i = 0; i < THROTTLER_COUNT; i++)
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  607  			throttler_status |=
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  608  				(metrics_ext->SmuMetrics_V2.ThrottlingPercentage[i] ? 1U << i : 0);
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  609  	} else {
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  610  		throttler_status = metrics_ext->SmuMetrics.ThrottlerStatus;
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  611  	}
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  612  
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  613  	return throttler_status;
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  614  }
be22e2b9f4f92ed drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c Evan Quan            2021-07-06  615  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
