Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E705EA4A84C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 04:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919BA10E04A;
	Sat,  1 Mar 2025 03:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTF2I5KO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D84F10E04A;
 Sat,  1 Mar 2025 03:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740799770; x=1772335770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DqOASSh8br7LItQyn0/6NKg+f29Qj62NxoQjE0iAytI=;
 b=TTF2I5KO2Bwj0o43/svvq6g0wlZju23ZDmXLY/T3xuuvLApGXlXxuinY
 79Uq9cOwv0n3ouxcffH9LqM3B0/5Sn9XPYcRmu69v+NJXLM9MQpG2mP16
 omq802RNlqqViqfwl1AoAPCj3FDgSaslmi+7Y080IYqeJzv/wEyvz3ytH
 a8ydMSf3PO01+H0uPwiKg3D847h71z7wBCo82GnXRxbuxPFwUet8w0AM3
 ieZ+tai1RRKplqW0rdPIutZm4/F0FRbFwVE1omwRqCcEYm4YsvjZMfJ6M
 tuWc01fyZ1fnEifc+WMz2L1wS2gfri1dIxP2Skx5BOBIOq4S6H8sF1m8n A==;
X-CSE-ConnectionGUID: EIuxWiqTTSueo4pTH6/pCw==
X-CSE-MsgGUID: /IrICuqmQuuajoxbRbqY/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45656404"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; d="scan'208";a="45656404"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 19:29:26 -0800
X-CSE-ConnectionGUID: UUajc22uQNC46aHIlHDHMg==
X-CSE-MsgGUID: thR1AKQuT8ump/k6QGQEUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; d="scan'208";a="117287693"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 28 Feb 2025 19:29:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1toDXR-000FoA-0S;
 Sat, 01 Mar 2025 03:29:18 +0000
Date: Sat, 1 Mar 2025 11:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/8] drm/client: Constify modes
Message-ID: <202503011150.x8nK9fZM-lkp@intel.com>
References: <20250228211454.8138-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228211454.8138-2-ville.syrjala@linux.intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-client-Constify-modes/20250301-051619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250228211454.8138-2-ville.syrjala%40linux.intel.com
patch subject: [PATCH v2 1/8] drm/client: Constify modes
config: hexagon-randconfig-001-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011150.x8nK9fZM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011150.x8nK9fZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011150.x8nK9fZM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_client_modeset.c:1275:
>> drivers/gpu/drm/tests/drm_client_modeset_test.c:108:7: error: assigning to 'struct drm_display_mode *' from 'const struct drm_display_mode *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     108 |         mode = drm_connector_pick_cmdline_mode(connector);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +108 drivers/gpu/drm/tests/drm_client_modeset_test.c

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
