Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C0A4C242
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E6F10E415;
	Mon,  3 Mar 2025 13:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JyGo1T/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB33610E14C;
 Mon,  3 Mar 2025 13:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741009346; x=1772545346;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JGVVfQ3VupI7IJUoPfF2V8z0J7v1Nc0wRYy5WCZBnnM=;
 b=JyGo1T/TFDx8r/1li3lItKQp3cdyByx5FOTQXp7czyVxlxWz3j5waP1o
 mH8Kp7YMoKJaC4Vvn9GHziIoyy5cDugzcSxlegr8EIl6MxcNMeVLXhqGp
 qIXWOld6R4Wjv8EioUz/2FQNA69yglMuaH4qCM684QQkWcikQDuFvl/n7
 0tVhBvsz/7JRK+frq645WxGsp44EZkC3m+GR/HX6dD8oFcG/W1zV+/0Hr
 8fRXcTUt8GPWELRauoMBRtmVaR9aASkniedltktnI+GKcyUQjsj1Smkgk
 992vM7UXORsECTOTdbrqqyoVHlP3LjLONlfT4jM7xd4beJeuJ3K4KLHmE g==;
X-CSE-ConnectionGUID: gG8oIP3VQXOPipmoXdoVSg==
X-CSE-MsgGUID: TikdntflSru0U74cMOQu7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41590718"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="41590718"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 05:42:17 -0800
X-CSE-ConnectionGUID: 5JuCmvbWROiG2DgaoCTPdQ==
X-CSE-MsgGUID: ZCXP2DHaRW2hYtzZ15J12Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="118703997"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2025 05:42:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tp62v-000IY7-1D;
 Mon, 03 Mar 2025 13:41:43 +0000
Date: Mon, 3 Mar 2025 21:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
Message-ID: <202503032114.TQkZ0b7R-lkp@intel.com>
References: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
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
[also build test ERROR on linus/master v6.14-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-client-Build-the-tests-with-CONFIG_DRM_KUNIT_TEST-m/20250303-175715
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250303094808.11860-1-ville.syrjala%40linux.intel.com
patch subject: [PATCH] drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
config: riscv-randconfig-002-20250303 (https://download.01.org/0day-ci/archive/20250303/202503032114.TQkZ0b7R-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503032114.TQkZ0b7R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503032114.TQkZ0b7R-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/gpu/drm/drm_client_modeset.o: in function `drm_client_modeset_test_init':
>> drivers/gpu/drm/tests/drm_client_modeset_test.c:59:(.text.drm_client_modeset_test_init+0xa4): undefined reference to `drm_kunit_helper_alloc_device'
   riscv32-linux-ld: drivers/gpu/drm/drm_client_modeset.o: in function `__drm_kunit_helper_alloc_drm_device':
>> include/drm/drm_kunit_helpers.h:63:(.text.drm_client_modeset_test_init+0x198): undefined reference to `__drm_kunit_helper_alloc_drm_device_with_driver'


vim +59 drivers/gpu/drm/tests/drm_client_modeset_test.c

8fc0380f6ba7e9 Maxime Ripard 2022-11-14  52  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  53  static int drm_client_modeset_test_init(struct kunit *test)
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  54  {
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  55  	struct drm_client_modeset_test_priv *priv;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  56  	int ret;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  57  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  58  	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14 @59  	KUNIT_ASSERT_NOT_NULL(test, priv);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  60  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  61  	test->priv = priv;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  62  
9ecd8045bf64f8 Maxime Ripard 2022-12-01  63  	priv->dev = drm_kunit_helper_alloc_device(test);
9ecd8045bf64f8 Maxime Ripard 2022-12-01  64  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
9ecd8045bf64f8 Maxime Ripard 2022-12-01  65  
a9143c5852a7a1 Maxime Ripard 2022-12-01  66  	priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev,
a9143c5852a7a1 Maxime Ripard 2022-12-01  67  							sizeof(*priv->drm), 0,
a9143c5852a7a1 Maxime Ripard 2022-12-01  68  							DRIVER_MODESET);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  69  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  70  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  71  	ret = drmm_connector_init(priv->drm, &priv->connector,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  72  				  &drm_client_modeset_connector_funcs,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  73  				  DRM_MODE_CONNECTOR_Unknown,
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  74  				  NULL);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  75  	KUNIT_ASSERT_EQ(test, ret, 0);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  76  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  77  	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_helper_funcs);
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  78  
fedcaf726f542b Maxime Ripard 2022-11-17  79  	priv->connector.interlace_allowed = true;
fedcaf726f542b Maxime Ripard 2022-11-17  80  	priv->connector.doublescan_allowed = true;
fedcaf726f542b Maxime Ripard 2022-11-17  81  
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  82  	return 0;
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  83  }
8fc0380f6ba7e9 Maxime Ripard 2022-11-14  84  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
