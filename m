Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE475F3D4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 12:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B48D10E2D0;
	Mon, 24 Jul 2023 10:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11F410E2CF;
 Mon, 24 Jul 2023 10:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690195893; x=1721731893;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yIcwm0FreMsT5sr0ZKxft7njqiXVrmRkrFntxXAABX0=;
 b=PnzeGIGjYpVALRsk7ARMqPCVhnm6BohmgVpVcjP2jyoJkmyZBNnWxgQA
 6CVN6c6BOc2cwA8czde63s+k460u9eNkrtmTE372UtkLU38BTnBC1Q+mA
 S5BH1inusIEFpCT6Ev3tkiAzoQkY6PjBAFj1BfZ/R4KZ3IOUqNLhmCJaV
 ca8mirdu9wLMX4Tsdn76bjz57MrDWF7NETicHZlvnI4G9yCOaLohBxaQG
 Eq5y44Nk2yT69BjaWtyGqM9SavRolCdI09rIN9Cs69ZZTHuorEqGk5b1Z
 U0RtzTT5NHNx78u0mKd2QhakDXuVvz0veWMo8yW+hP+Vvo6N0AbwWnyUz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="367434608"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="367434608"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 03:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="1056385883"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="1056385883"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2023 03:51:15 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qNt9j-0009gl-2I;
 Mon, 24 Jul 2023 10:51:12 +0000
Date: Mon, 24 Jul 2023 18:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: sunran001@208suo.com, alexander.deucher@amd.com
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in sienna_cichlid_ppt.c
Message-ID: <202307241820.VkiRPe2R-lkp@intel.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
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
config: arc-randconfig-r024-20230724 (https://download.01.org/0day-ci/archive/20230724/202307241820.VkiRPe2R-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307241820.VkiRPe2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307241820.VkiRPe2R-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c: In function 'sienna_cichlid_get_throttler_status_locked':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:595:42: error: 'smu_table' undeclared (first use in this function)
     595 |                 (SmuMetricsExternal_t *)(smu_table->metrics_table);
         |                                          ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:595:42: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:593:35: warning: unused variable 'smu_tabl' [-Wunused-variable]
     593 |         struct smu_table_context *smu_tabl = &smu->smu_table;
         |                                   ^~~~~~~~


vim +/smu_table +595 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c

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
