Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6971F2FC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 21:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D6A10E5B2;
	Thu,  1 Jun 2023 19:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C25910E5B2
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 19:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685648023; x=1717184023;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kcZJ3+qNx8leUOO/Kenv3qu0LykWwuGfFkR6Pl0R91o=;
 b=dNAPRB3FHeU0XqOEd02yiJAcnbfIEUSBkqF+U25/PaHYi/ZIpiwrbzWu
 IygaM0GJSCTq/LCis5dVl8NtCTqzwwGZzSx05C79UhDnq1sAKKsx45xqo
 dT7fpv83RqbroRg99iVIj9AJ3QnaBdHyAgeFnP8KYJVKeFeh3my9STW6W
 Oodn+O8WZI8SnRekCy3171iwjMfTc2/FjEVDeiA5bBNBg76jTyhnnVGa0
 T2Zx+wGpHfnIlAVRU7KQUO3UcfMaXj0l4n4537Jfq8BZqC15k4cbthQiZ
 OkExUXo/aysf78CG8WxSaz5t23As6OjjdDAMA9YfnHR60u04yyoWQ0cDV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353158106"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="353158106"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 12:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="819954904"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="819954904"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2023 12:33:39 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q4o3H-0002do-0N;
 Thu, 01 Jun 2023 19:33:39 +0000
Date: Fri, 2 Jun 2023 03:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] drm/panel: simple: add support for Rocktech
 RK043FN48H panel
Message-ID: <202306020343.jNTWeM0P-lkp@intel.com>
References: <20230601170320.2845218-6-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601170320.2845218-6-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next-fixes]
[also build test WARNING on drm-tip/drm-tip linus/master v6.4-rc4 next-20230601]
[cannot apply to atorgue-stm32/stm32-next drm-misc/drm-misc-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/ARM-dts-stm32-add-ltdc-support-on-stm32f746-MCU/20230602-010536
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20230601170320.2845218-6-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH 5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306020343.jNTWeM0P-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5a692e898df9428078855c58f8e945def084613b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dario-Binacchi/ARM-dts-stm32-add-ltdc-support-on-stm32f746-MCU/20230602-010536
        git checkout 5a692e898df9428078855c58f8e945def084613b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020343.jNTWeM0P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-simple.c:3201:68: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    3201 |         .flags = DISPLAY_FLAGS_VSYNC_LOW + DISPLAY_FLAGS_HSYNC_LOW |
         |                                                                    ^


vim +3201 drivers/gpu/drm/panel/panel-simple.c

  3190	
  3191	static const struct display_timing rocktech_rk043fn48h_timing = {
  3192		.pixelclock = { 6000000, 9000000, 12000000 },
  3193		.hactive = { 480, 480, 480 },
  3194		.hback_porch = { 8, 43, 43 },
  3195		.hfront_porch = { 2, 8, 8 },
  3196		.hsync_len = { 1, 1, 1 },
  3197		.vactive = { 272, 272, 272 },
  3198		.vback_porch = { 2, 12, 12 },
  3199		.vfront_porch = { 1, 4, 4 },
  3200		.vsync_len = { 1, 10, 10 },
> 3201		.flags = DISPLAY_FLAGS_VSYNC_LOW + DISPLAY_FLAGS_HSYNC_LOW |
  3202			 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
  3203	};
  3204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
