Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0395F991378
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 02:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEAC10E296;
	Sat,  5 Oct 2024 00:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oER8DirD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF6310E27B;
 Sat,  5 Oct 2024 00:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728087649; x=1759623649;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S1gqrePsiGPVWs/qXReG4B7NMlMBTe3cwP3ZHwYZFHk=;
 b=oER8DirDq77iWJqnVbgWIdwYNAf1o8nmt6DH5SgVRwn8ynlSmHaLIR+D
 gJjMTZQU8S/GPF6ecrnUPIi4V4EqYZOV6dvdxi1dLwp6pZnaMBLAy42/j
 dN5Rhyrr5LDNx02S8lNUM/A3q6Eg7Njyu6ylcLXZL4WTVo9xi3UiyDV83
 AKyrYXgY757p5OJs8H+eFtIOEM7uIO+tm9fOKWp43WQxpSHeGnQJiyTbv
 QiuKp/if8DWH5duu4FbpZc3BF/AEhw6MtCMwv5CrIMc+YujjP4txNlYHW
 pnbsUrRLgQ1ZPIF/pJweaPn4FHA9zSt/Ii5prHsAJajtsBpl/WgzaVRQ0 w==;
X-CSE-ConnectionGUID: xZsfSnbzRjKdEfVPXGEd3w==
X-CSE-MsgGUID: uzIS2u7STI2Mkwbq8RhJJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="14944339"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="14944339"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 17:20:49 -0700
X-CSE-ConnectionGUID: 1uJDoom6RzKocxLhlpQL9Q==
X-CSE-MsgGUID: HqzTRn8fTraWi5RczqsQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74692676"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 04 Oct 2024 17:20:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1swsXM-0002Mc-1G;
 Sat, 05 Oct 2024 00:20:44 +0000
Date: Sat, 5 Oct 2024 08:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/client: Constify modes
Message-ID: <202410050841.RWs2VIP5-lkp@intel.com>
References: <20241003113304.11700-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003113304.11700-2-ville.syrjala@linux.intel.com>
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

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20241004]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm/drm-next drm-exynos/exynos-drm-next linus/master v6.12-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-client-Constify-modes/20241004-061843
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241003113304.11700-2-ville.syrjala%40linux.intel.com
patch subject: [PATCH 1/8] drm/client: Constify modes
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410050841.RWs2VIP5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050841.RWs2VIP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050841.RWs2VIP5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_client_modeset.c:1266:
   drivers/gpu/drm/tests/drm_client_modeset_test.c: In function 'drm_test_pick_cmdline_res_1920_1080_60':
>> drivers/gpu/drm/tests/drm_client_modeset_test.c:108:14: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     108 |         mode = drm_connector_pick_cmdline_mode(connector);
         |              ^


vim +/const +108 drivers/gpu/drm/tests/drm_client_modeset_test.c

8fc0380f6ba7e9 Maxime Ripard 2022-11-14   84  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   85  static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   86  {
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   87  	struct drm_client_modeset_test_priv *priv = test->priv;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   88  	struct drm_device *drm = priv->drm;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   89  	struct drm_connector *connector = &priv->connector;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   90  	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   91  	struct drm_display_mode *expected_mode, *mode;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   92  	const char *cmdline = "1920x1080@60";
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   93  	int ret;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   94  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   95  	expected_mode = drm_mode_find_dmt(priv->drm, 1920, 1080, 60, false);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   96  	KUNIT_ASSERT_NOT_NULL(test, expected_mode);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   97  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   98  	KUNIT_ASSERT_TRUE(test,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14   99  			  drm_mode_parse_command_line_for_connector(cmdline,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  100  								    connector,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  101  								    cmdline_mode));
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  102  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  103  	mutex_lock(&drm->mode_config.mutex);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  104  	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  105  	mutex_unlock(&drm->mode_config.mutex);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  106  	KUNIT_ASSERT_GT(test, ret, 0);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  107  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14 @108  	mode = drm_connector_pick_cmdline_mode(connector);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  109  	KUNIT_ASSERT_NOT_NULL(test, mode);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  110  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  111  	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  112  }
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
