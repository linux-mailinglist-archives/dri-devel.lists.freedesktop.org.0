Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB59C89961B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 09:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463271139BA;
	Fri,  5 Apr 2024 07:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OidZ6JdH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A761139BA;
 Fri,  5 Apr 2024 07:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712300497; x=1743836497;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u+pICOztmHPmcaubWio24QXGOGM3pV14s9VZnLdh1yc=;
 b=OidZ6JdHfpZTmNDJj3MqGtWeGvm/kA5zFw3Hmy1nzif07t8wMqRHfOAl
 IGuMz1Tz6GmOr+9CNg3NyeFIjjiewQJwmb1VUg/ksf81NNwA8QEOY1LWO
 8Wq3w5MqV0d4kzDv+dAiCQYxVltApg8BE9R0aVRZkgtOvXufio+vSwtYB
 OI4zI9ExarUsGtS5CvMywdRVAKXcsmePwsoW89gTPCWdi942blmNB0PWj
 QkSv0NWsN1oqIk0WsA4we2TC+jEnfKUJ2rdOgMnXGGlbTb+zx6WkQXxob
 TVxezOOmDuo4rXeeihAaMjjWsweAn626TRL88t+8L1cxDH0J9SwmdauKs g==;
X-CSE-ConnectionGUID: b+DdmXqLTFyXMx3bMJneyQ==
X-CSE-MsgGUID: iME3eidUSzaWJg8lRpjleA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18181393"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="18181393"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 00:01:34 -0700
X-CSE-ConnectionGUID: gHh7ZS9SShOLFwQEiA2V1g==
X-CSE-MsgGUID: sg6P9tFNRVmA1U8TdPuPQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="23744886"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 05 Apr 2024 00:01:32 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rsdZq-0001zx-0N;
 Fri, 05 Apr 2024 07:01:30 +0000
Date: Fri, 5 Apr 2024 15:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 06/12] drm/client: Constify modes
Message-ID: <202404051422.BpYVK6TP-lkp@intel.com>
References: <20240404203336.10454-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404203336.10454-7-ville.syrjala@linux.intel.com>
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
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.9-rc2 next-20240405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-client-Fully-protect-modes-with-dev-mode_config-mutex/20240405-043540
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240404203336.10454-7-ville.syrjala%40linux.intel.com
patch subject: [PATCH 06/12] drm/client: Constify modes
config: i386-randconfig-012-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051422.BpYVK6TP-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051422.BpYVK6TP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051422.BpYVK6TP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_client_modeset.c:1241:0:
   drivers/gpu/drm/tests/drm_client_modeset_test.c: In function 'drm_test_pick_cmdline_res_1920_1080_60':
>> drivers/gpu/drm/tests/drm_client_modeset_test.c:108:7: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     mode = drm_connector_pick_cmdline_mode(connector);
          ^


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
