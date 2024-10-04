Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC22991359
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 01:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9413110E1B8;
	Fri,  4 Oct 2024 23:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZ1eSbao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E8A10E198;
 Fri,  4 Oct 2024 23:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728086389; x=1759622389;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pkFs7lkzwnAV7kMzsCAOU0nn92TjwRHRGRSsl5BbEFs=;
 b=RZ1eSbao5OoMKC5AnfmztMyOJgtWpl5yFo/1CAvLF33dXmcZPzG54SF0
 Vy18BZ2WaeUPPtfcCyTaFrCj22BijCQ7BaT9wX7z792SsvFyMko8frBIx
 AdGdjO0+hupEBlLW4SF9h+JJM9Cq8JOkiuvnknJFQPJIp/vU87s4lLNl7
 5EeCB51v2fwbWvI9X4cWe44hMKedp9vftaRTfCqKfhsoBz8BOXYijhUJS
 tBdIGCaWT9YCXRoasY+nN54VbizhRHWTe2KntiDHnAZbAlBkFoqcI9e5f
 +0T33rLiVioFUSvYtTNPbc5oSiEBLyY3VT8AD87Hd5+Y0owXgBPfXcfHu g==;
X-CSE-ConnectionGUID: p4SPtyIOSNas9DORYm5OIA==
X-CSE-MsgGUID: 9dlnChlHSQCL/yHRHskeeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27456444"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="27456444"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 16:59:49 -0700
X-CSE-ConnectionGUID: yyxXa65FQ2iEoW0f05Pnjw==
X-CSE-MsgGUID: YO9UuW43Q5KtpCCGAybLWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="75290559"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 04 Oct 2024 16:59:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1swsD2-0002Ly-0B;
 Fri, 04 Oct 2024 23:59:44 +0000
Date: Sat, 5 Oct 2024 07:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/client: Constify modes
Message-ID: <202410050750.I0iVowt8-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20241004]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm/drm-next drm-exynos/exynos-drm-next linus/master v6.12-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-client-Constify-modes/20241004-061843
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241003113304.11700-2-ville.syrjala%40linux.intel.com
patch subject: [PATCH 1/8] drm/client: Constify modes
config: i386-buildonly-randconfig-002-20241005 (https://download.01.org/0day-ci/archive/20241005/202410050750.I0iVowt8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050750.I0iVowt8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050750.I0iVowt8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_client_modeset.c:1266:
>> drivers/gpu/drm/tests/drm_client_modeset_test.c:108:7: error: assigning to 'struct drm_display_mode *' from 'const struct drm_display_mode *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     108 |         mode = drm_connector_pick_cmdline_mode(connector);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +108 drivers/gpu/drm/tests/drm_client_modeset_test.c

8fc0380f6ba7e94 Maxime Ripard 2022-11-14   84  
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   85  static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   86  {
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   87  	struct drm_client_modeset_test_priv *priv = test->priv;
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   88  	struct drm_device *drm = priv->drm;
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   89  	struct drm_connector *connector = &priv->connector;
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   90  	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   91  	struct drm_display_mode *expected_mode, *mode;
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   92  	const char *cmdline = "1920x1080@60";
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   93  	int ret;
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   94  
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   95  	expected_mode = drm_mode_find_dmt(priv->drm, 1920, 1080, 60, false);
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   96  	KUNIT_ASSERT_NOT_NULL(test, expected_mode);
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   97  
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   98  	KUNIT_ASSERT_TRUE(test,
8fc0380f6ba7e94 Maxime Ripard 2022-11-14   99  			  drm_mode_parse_command_line_for_connector(cmdline,
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  100  								    connector,
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  101  								    cmdline_mode));
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  102  
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  103  	mutex_lock(&drm->mode_config.mutex);
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  104  	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  105  	mutex_unlock(&drm->mode_config.mutex);
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  106  	KUNIT_ASSERT_GT(test, ret, 0);
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  107  
8fc0380f6ba7e94 Maxime Ripard 2022-11-14 @108  	mode = drm_connector_pick_cmdline_mode(connector);
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  109  	KUNIT_ASSERT_NOT_NULL(test, mode);
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  110  
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  111  	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  112  }
8fc0380f6ba7e94 Maxime Ripard 2022-11-14  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
