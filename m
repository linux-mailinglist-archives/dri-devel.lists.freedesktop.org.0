Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816028D20D4
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 17:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A09710E2AD;
	Tue, 28 May 2024 15:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXI2zp7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7743810E2AD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716911617; x=1748447617;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bebSNINfLGRXjEL3kdOR1gvaAlgvXerHGRc6bFG72XM=;
 b=mXI2zp7ZQsjXBHVXtYpJrC69a+8aA8pC0S8WUYaiFM2Pkq3wdjgnsgwp
 muH2iu30ZziNXJcf4RVfSX+4XwEAlscmI5vTzOY/+JiLwBeJW4djuvZ+F
 Mu0EmMsUDoZjCqE/U8176H66cr8LNbuYKUls/NazKFWPOXvrpBMNI82/T
 PyYa0j1UfHdgNbOdddApK5wCv6D5q5nk7u/O0eZlsKrRTW068cnS7tMqa
 2Zf18H1tZIZYbmF9m4LSpI6RyUK0ZYKtmk5xJ6H0qjlOITJJB7yIHe3O7
 BvE6jrn2yBpMmkurlmdyH3hTMSVDnBenFUZ5qLm83wlEE4EdUc7ZFEhYq Q==;
X-CSE-ConnectionGUID: 4nA2Z8NsQTaEgBBDfvAoag==
X-CSE-MsgGUID: uALxSDheSdeEcUK6/lEusw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13488878"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13488878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 08:53:36 -0700
X-CSE-ConnectionGUID: MtRu17F0SRKNFeJRdnL+dw==
X-CSE-MsgGUID: 1Akhkm+dTiWzxcfzcudOOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="72551972"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 28 May 2024 08:53:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sBz7l-000CPL-0V;
 Tue, 28 May 2024 15:53:04 +0000
Date: Tue, 28 May 2024 23:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/bridge: imx93-mipi-dsi: Use dev_err_probe
Message-ID: <202405282314.dvr8cFY0-lkp@intel.com>
References: <20240528093922.194684-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528093922.194684-1-alexander.stein@ew.tq-group.com>
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

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.10-rc1 next-20240528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/drm-bridge-imx93-mipi-dsi-Use-dev_err_probe/20240528-174332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240528093922.194684-1-alexander.stein%40ew.tq-group.com
patch subject: [PATCH 1/1] drm/bridge: imx93-mipi-dsi: Use dev_err_probe
config: arm-randconfig-001-20240528 (https://download.01.org/0day-ci/archive/20240528/202405282314.dvr8cFY0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405282314.dvr8cFY0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405282314.dvr8cFY0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c: In function 'imx93_dsi_probe':
>> drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c:837:13: warning: unused variable 'ret' [-Wunused-variable]
     837 |         int ret;
         |             ^~~


vim +/ret +837 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c

ce62f8ea7e3f8a8 Liu Ying        2023-08-21  831  
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  832  static int imx93_dsi_probe(struct platform_device *pdev)
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  833  {
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  834  	struct device *dev = &pdev->dev;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  835  	struct device_node *np = dev->of_node;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  836  	struct imx93_dsi *dsi;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21 @837  	int ret;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  838  
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  839  	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  840  	if (!dsi)
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  841  		return -ENOMEM;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  842  
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  843  	dsi->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,media-blk-ctrl");
b407e810c9a5b87 Alexander Stein 2024-05-28  844  	if (IS_ERR(dsi->regmap))
b407e810c9a5b87 Alexander Stein 2024-05-28  845  		return dev_err_probe(dev, PTR_ERR(dsi->regmap),
b407e810c9a5b87 Alexander Stein 2024-05-28  846  				     "failed to get block ctrl regmap");
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  847  
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  848  	dsi->clk_pixel = devm_clk_get(dev, "pix");
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  849  	if (IS_ERR(dsi->clk_pixel))
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  850  		return dev_err_probe(dev, PTR_ERR(dsi->clk_pixel),
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  851  				     "failed to get pixel clock\n");
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  852  
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  853  	dsi->clk_cfg = devm_clk_get(dev, "phy_cfg");
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  854  	if (IS_ERR(dsi->clk_cfg))
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  855  		return dev_err_probe(dev, PTR_ERR(dsi->clk_cfg),
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  856  				     "failed to get phy cfg clock\n");
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  857  
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  858  	dsi->clk_ref = devm_clk_get(dev, "phy_ref");
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  859  	if (IS_ERR(dsi->clk_ref))
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  860  		return dev_err_probe(dev, PTR_ERR(dsi->clk_ref),
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  861  				     "failed to get phy ref clock\n");
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  862  
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  863  	dsi->ref_clk_rate = clk_get_rate(dsi->clk_ref);
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  864  	if (dsi->ref_clk_rate < REF_CLK_RATE_MIN ||
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  865  	    dsi->ref_clk_rate > REF_CLK_RATE_MAX) {
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  866  		dev_err(dev, "invalid phy ref clock rate %lu\n",
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  867  			dsi->ref_clk_rate);
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  868  		return -EINVAL;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  869  	}
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  870  	dev_dbg(dev, "phy ref clock rate: %lu\n", dsi->ref_clk_rate);
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  871  
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  872  	dsi->dev = dev;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  873  	dsi->pdata.max_data_lanes = 4;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  874  	dsi->pdata.mode_valid = imx93_dsi_mode_valid;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  875  	dsi->pdata.mode_fixup = imx93_dsi_mode_fixup;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  876  	dsi->pdata.get_input_bus_fmts = imx93_dsi_get_input_bus_fmts;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  877  	dsi->pdata.phy_ops = &imx93_dsi_phy_ops;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  878  	dsi->pdata.host_ops = &imx93_dsi_host_ops;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  879  	dsi->pdata.priv_data = dsi;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  880  	platform_set_drvdata(pdev, dsi);
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  881  
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  882  	dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  883  	if (IS_ERR(dsi->dmd))
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  884  		return dev_err_probe(dev, PTR_ERR(dsi->dmd),
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  885  				     "failed to probe dw_mipi_dsi\n");
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  886  
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  887  	return 0;
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  888  }
ce62f8ea7e3f8a8 Liu Ying        2023-08-21  889  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
