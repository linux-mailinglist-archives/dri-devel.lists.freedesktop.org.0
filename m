Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E29383FC03
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 03:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0CF10F524;
	Mon, 29 Jan 2024 02:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFE410F524;
 Mon, 29 Jan 2024 02:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706494019; x=1738030019;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=OreHuBXkBG4VFOVG4didQY23mWqAzh19dWlc2+4rZ/c=;
 b=oG+3QwzGE0GU+nVNjZQcM23a6Im6Z7jzaHqqVhJ84AV6gyM+QCP7DWWD
 w52mDcO9a5LP5X6WOJQNVyGjEq3Kn0J5D10FEVWokxAjcf04mzmOEFcLC
 BzQuSmvjBhAea5UVAPDJHP5T93gHpXJbcqzI+YXcfcQEnugXchQjnzkKV
 fSl5YCDmy4aMoMx0uxcBUElXYarJjSjO8Owhu3FE1RMjrTt85myIFyQdA
 ew9/gF+BAd/hA4s/zOeCNVO1YJsa17JsIto/1xt9A2OtaFZqROR4mR56K
 Mi/URJBIepwspuCOkgKaVpPgnspacCEQulu+QEQUi8HTg1D3AyvTAlkNl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9503356"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9503356"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2024 18:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="29627460"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 28 Jan 2024 18:06:55 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rUH2z-0003xE-0z;
 Mon, 29 Jan 2024 02:06:53 +0000
Date: Mon, 29 Jan 2024 10:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Subject: [drm-tip:drm-tip 1/7] drivers/gpu/drm/bridge/samsung-dsim.c:1504:3:
 error: implicit declaration of function 'samsung_dsim_set_stop_state' is
 invalid in C99
Message-ID: <202401291018.WgYuxgMh-lkp@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   0f1b42b9d395bd4097b2846230a13869dc638216
commit: cd3a0e22e5de2867cd98b5223094a467a5b0993d [1/7] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240129/202401291018.WgYuxgMh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291018.WgYuxgMh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291018.WgYuxgMh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/samsung-dsim.c:1504:3: error: implicit declaration of function 'samsung_dsim_set_stop_state' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   samsung_dsim_set_stop_state(dsi, true);
                   ^
   drivers/gpu/drm/bridge/samsung-dsim.c:1504:3: note: did you mean 'samsung_dsim_set_phy_ctrl'?
   drivers/gpu/drm/bridge/samsung-dsim.c:749:13: note: 'samsung_dsim_set_phy_ctrl' declared here
   static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
               ^
   drivers/gpu/drm/bridge/samsung-dsim.c:1629:22: error: use of undeclared identifier 'samsung_dsim_atomic_disable'; did you mean 'samsung_dsim_atomic_enable'?
           .atomic_disable                 = samsung_dsim_atomic_disable,
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                                             samsung_dsim_atomic_enable
   drivers/gpu/drm/bridge/samsung-dsim.c:1487:13: note: 'samsung_dsim_atomic_enable' declared here
   static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
               ^
   2 errors generated.


vim +/samsung_dsim_set_stop_state +1504 drivers/gpu/drm/bridge/samsung-dsim.c

e7447128ca4a25 Jagan Teki     2023-03-08  1497  
e7447128ca4a25 Jagan Teki     2023-03-08  1498  static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
e7447128ca4a25 Jagan Teki     2023-03-08  1499  					     struct drm_bridge_state *old_bridge_state)
e7447128ca4a25 Jagan Teki     2023-03-08  1500  {
e7447128ca4a25 Jagan Teki     2023-03-08  1501  	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
e7447128ca4a25 Jagan Teki     2023-03-08  1502  
b2fe2292624ac4 Dario Binacchi 2023-12-18  1503  	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
b2fe2292624ac4 Dario Binacchi 2023-12-18 @1504  		samsung_dsim_set_stop_state(dsi, true);
e7447128ca4a25 Jagan Teki     2023-03-08  1505  
e7447128ca4a25 Jagan Teki     2023-03-08  1506  	dsi->state &= ~DSIM_STATE_ENABLED;
e7447128ca4a25 Jagan Teki     2023-03-08  1507  	pm_runtime_put_sync(dsi->dev);
e7447128ca4a25 Jagan Teki     2023-03-08  1508  }
e7447128ca4a25 Jagan Teki     2023-03-08  1509  

:::::: The code at line 1504 was first introduced by commit
:::::: b2fe2292624ac4fc98dcdaf76c983d3f6e8455e5 drm: bridge: samsung-dsim: enter display mode in the enable() callback

:::::: TO: Dario Binacchi <dario.binacchi@amarulasolutions.com>
:::::: CC: Robert Foss <rfoss@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
