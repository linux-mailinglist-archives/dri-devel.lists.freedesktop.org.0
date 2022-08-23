Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5928559ED21
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 22:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5458610E170;
	Tue, 23 Aug 2022 20:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD6F10E170
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661285408; x=1692821408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qUek0yzz0Bu36AI+YwRz9stP5BrJ7LDmDGEbCrutpCI=;
 b=UBnQg16KJTR7/c3d8q4fU4hQvF8Sg4Qs4MuURMB+hFdqykyBF652e/eF
 EbHji0SoAjqLUwkNDviBO/RjrGIaUga/yCxa2qsLqPE71Tm6TDLZ4pItF
 uwsfuPj+/Hr2xdlnpDppjSk37uH2g3bUS6fNnPM61tAmtpoHlWeCzcYox
 Dr1zHqC+n0LZfn+QQ5G4zYGCFj12Suts045SK1BLQld3rtO2uzHTpDQm/
 gmG0CWrglphKghn1cVcWqYbEbInr5oQb3AQJz40X+qS/oBA9Auo67aCx0
 bprzsfpKuRz1anlv1oBaIyKUCQMYaffky/x7g5kxXGKM89aimhOnd4dU6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="292530359"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="292530359"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 13:10:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="670185770"
Received: from lkp-server02.sh.intel.com (HELO 9bbcefcddf9f) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2022 13:10:02 -0700
Received: from kbuild by 9bbcefcddf9f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oQaDq-0000Ux-0L;
 Tue, 23 Aug 2022 20:10:02 +0000
Date: Wed, 24 Aug 2022 04:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm: rcar-du: lvds: Rename pclk enable/disable
 functions
Message-ID: <202208240422.wr7amM6Y-lkp@intel.com>
References: <20220822130513.119029-5-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822130513.119029-5-tomi.valkeinen@ideasonboard.com>
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
Cc: kbuild-all@lists.01.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

I love your patch! Yet something to improve:

[auto build test ERROR on pinchartl-media/drm/du/next]
[also build test ERROR on linus/master v6.0-rc2 next-20220823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/drm-rcar-du-DSI-fixes/20220822-210756
base:   git://linuxtv.org/pinchartl/media.git drm/du/next
config: arm-defconfig (https://download.01.org/0day-ci/archive/20220824/202208240422.wr7amM6Y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2c77c282d07b279cf94254b358b048d48a8a745b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tomi-Valkeinen/drm-rcar-du-DSI-fixes/20220822-210756
        git checkout 2c77c282d07b279cf94254b358b048d48a8a745b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/rcar-du/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/clk.h:13,
                    from drivers/gpu/drm/rcar-du/rcar_lvds.c:10:
>> drivers/gpu/drm/rcar-du/rcar_lvds.c:326:19: error: 'rcar_lvds_clk_enable' undeclared here (not in a function); did you mean 'rcar_lvds_pclk_enable'?
     326 | EXPORT_SYMBOL_GPL(rcar_lvds_clk_enable);
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:98:23: note: in definition of macro '___EXPORT_SYMBOL'
      98 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:160:41: note: in expansion of macro '__EXPORT_SYMBOL'
     160 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:164:41: note: in expansion of macro '_EXPORT_SYMBOL'
     164 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_lvds.c:326:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     326 | EXPORT_SYMBOL_GPL(rcar_lvds_clk_enable);
         | ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/rcar-du/rcar_lvds.c:341:19: error: 'rcar_lvds_clk_disable' undeclared here (not in a function); did you mean 'rcar_lvds_pclk_disable'?
     341 | EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:98:23: note: in definition of macro '___EXPORT_SYMBOL'
      98 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:160:41: note: in expansion of macro '__EXPORT_SYMBOL'
     160 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:164:41: note: in expansion of macro '_EXPORT_SYMBOL'
     164 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_lvds.c:341:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     341 | EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
         | ^~~~~~~~~~~~~~~~~


vim +326 drivers/gpu/drm/rcar-du/rcar_lvds.c

02f2b30032c12b Laurent Pinchart 2019-01-17  303  
02f2b30032c12b Laurent Pinchart 2019-01-17  304  /* -----------------------------------------------------------------------------
02f2b30032c12b Laurent Pinchart 2019-01-17  305   * Clock - D3/E3 only
02f2b30032c12b Laurent Pinchart 2019-01-17  306   */
02f2b30032c12b Laurent Pinchart 2019-01-17  307  
2c77c282d07b27 Tomi Valkeinen   2022-08-22  308  int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
02f2b30032c12b Laurent Pinchart 2019-01-17  309  {
02f2b30032c12b Laurent Pinchart 2019-01-17  310  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
02f2b30032c12b Laurent Pinchart 2019-01-17  311  	int ret;
02f2b30032c12b Laurent Pinchart 2019-01-17  312  
02f2b30032c12b Laurent Pinchart 2019-01-17  313  	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
02f2b30032c12b Laurent Pinchart 2019-01-17  314  		return -ENODEV;
02f2b30032c12b Laurent Pinchart 2019-01-17  315  
02f2b30032c12b Laurent Pinchart 2019-01-17  316  	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
02f2b30032c12b Laurent Pinchart 2019-01-17  317  
02f2b30032c12b Laurent Pinchart 2019-01-17  318  	ret = clk_prepare_enable(lvds->clocks.mod);
02f2b30032c12b Laurent Pinchart 2019-01-17  319  	if (ret < 0)
02f2b30032c12b Laurent Pinchart 2019-01-17  320  		return ret;
02f2b30032c12b Laurent Pinchart 2019-01-17  321  
02f2b30032c12b Laurent Pinchart 2019-01-17  322  	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
02f2b30032c12b Laurent Pinchart 2019-01-17  323  
02f2b30032c12b Laurent Pinchart 2019-01-17  324  	return 0;
02f2b30032c12b Laurent Pinchart 2019-01-17  325  }
02f2b30032c12b Laurent Pinchart 2019-01-17 @326  EXPORT_SYMBOL_GPL(rcar_lvds_clk_enable);
02f2b30032c12b Laurent Pinchart 2019-01-17  327  
2c77c282d07b27 Tomi Valkeinen   2022-08-22  328  void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
02f2b30032c12b Laurent Pinchart 2019-01-17  329  {
02f2b30032c12b Laurent Pinchart 2019-01-17  330  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
02f2b30032c12b Laurent Pinchart 2019-01-17  331  
02f2b30032c12b Laurent Pinchart 2019-01-17  332  	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
02f2b30032c12b Laurent Pinchart 2019-01-17  333  		return;
02f2b30032c12b Laurent Pinchart 2019-01-17  334  
02f2b30032c12b Laurent Pinchart 2019-01-17  335  	dev_dbg(lvds->dev, "disabling LVDS PLL\n");
02f2b30032c12b Laurent Pinchart 2019-01-17  336  
02f2b30032c12b Laurent Pinchart 2019-01-17  337  	rcar_lvds_write(lvds, LVDPLLCR, 0);
02f2b30032c12b Laurent Pinchart 2019-01-17  338  
02f2b30032c12b Laurent Pinchart 2019-01-17  339  	clk_disable_unprepare(lvds->clocks.mod);
02f2b30032c12b Laurent Pinchart 2019-01-17  340  }
02f2b30032c12b Laurent Pinchart 2019-01-17 @341  EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
02f2b30032c12b Laurent Pinchart 2019-01-17  342  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
