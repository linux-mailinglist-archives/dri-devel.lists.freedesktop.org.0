Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0DB77478D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 21:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0049D10E1B7;
	Tue,  8 Aug 2023 19:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677DB10E0F8;
 Tue,  8 Aug 2023 19:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691522176; x=1723058176;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g2nPMWJVqJSdxvBU7K5NZtxMaqmdJgy/2x1pLE1f54o=;
 b=BW/Yn+kM/k+1XQ5Qjn4GS6AW3qcgvz9KopLOzPbYjbmZv1H0RkTzVvQ4
 kaoVO6Q97G+YkOpbFB9Cu+OgprLxqlEJoRc2dOO7LzYmzh8YTtTvhQeWf
 FErk77+FQRHocW00oE+C+iIOfC3w7rJMoUimQsOj61YY5IKR7WOzODw5x
 4/FlVjdnOmDknqt1GJgd9ZoEpFbumAdzXnqnTgtgWYugkq06uiQHcVfnt
 S6bcfNmFNQcbNdyYZepZVlKxDexqoMdkCUydr3UX7X23FULEGPaETVo+Q
 fTJ/n0bxuVb1cpJPPi/KUzkiLz6jqxFbivSLtOEZhwyj8aVhXnXQnxMdi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373710785"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="373710785"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 12:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801445416"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="801445416"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2023 12:16:10 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qTSBd-0005Yk-3C;
 Tue, 08 Aug 2023 19:16:09 +0000
Date: Wed, 9 Aug 2023 03:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/3] usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE
Message-ID: <202308090347.sZtwmCUB-lkp@intel.com>
References: <20230802011845.4176631-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802011845.4176631-4-dmitry.baryshkov@linaro.org>
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
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on usb/usb-testing usb/usb-next usb/usb-linus drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc5 next-20230808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-add-transparent-bridge-helper/20230802-091932
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230802011845.4176631-4-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v3 3/3] usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE
config: s390-randconfig-r033-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090347.sZtwmCUB-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090347.sZtwmCUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090347.sZtwmCUB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/simple-bridge.c:212:18: error: no member named 'of_node' in 'struct drm_bridge'
           sbridge->bridge.of_node = pdev->dev.of_node;
           ~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +212 drivers/gpu/drm/bridge/simple-bridge.c

56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  168  
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  169  static int simple_bridge_probe(struct platform_device *pdev)
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  170  {
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  171  	struct simple_bridge *sbridge;
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  172  	struct device_node *remote;
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  173  
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  174  	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  175  	if (!sbridge)
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  176  		return -ENOMEM;
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  177  	platform_set_drvdata(pdev, sbridge);
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  178  
272378ec0eb972 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  179  	sbridge->info = of_device_get_match_data(&pdev->dev);
272378ec0eb972 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  180  
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  181  	/* Get the next bridge in the pipeline. */
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  182  	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  183  	if (!remote)
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  184  		return -EINVAL;
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  185  
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  186  	sbridge->next_bridge = of_drm_find_bridge(remote);
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  187  	of_node_put(remote);
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  188  
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  189  	if (!sbridge->next_bridge) {
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  190  		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  191  		return -EPROBE_DEFER;
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  192  	}
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  193  
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  194  	/* Get the regulator and GPIO resources. */
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  195  	sbridge->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  196  	if (IS_ERR(sbridge->vdd)) {
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  197  		int ret = PTR_ERR(sbridge->vdd);
af948a25ecb214 drivers/gpu/drm/bridge/dumb-vga-dac.c  Chen-Yu Tsai     2016-11-16  198  		if (ret == -EPROBE_DEFER)
af948a25ecb214 drivers/gpu/drm/bridge/dumb-vga-dac.c  Chen-Yu Tsai     2016-11-16  199  			return -EPROBE_DEFER;
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  200  		sbridge->vdd = NULL;
af948a25ecb214 drivers/gpu/drm/bridge/dumb-vga-dac.c  Chen-Yu Tsai     2016-11-16  201  		dev_dbg(&pdev->dev, "No vdd regulator found: %d\n", ret);
af948a25ecb214 drivers/gpu/drm/bridge/dumb-vga-dac.c  Chen-Yu Tsai     2016-11-16  202  	}
af948a25ecb214 drivers/gpu/drm/bridge/dumb-vga-dac.c  Chen-Yu Tsai     2016-11-16  203  
2df6428e290a61 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  204  	sbridge->enable = devm_gpiod_get_optional(&pdev->dev, "enable",
2df6428e290a61 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  205  						  GPIOD_OUT_LOW);
db8496d0b50519 drivers/gpu/drm/bridge/simple-bridge.c Ye Xingchen      2023-03-22  206  	if (IS_ERR(sbridge->enable))
db8496d0b50519 drivers/gpu/drm/bridge/simple-bridge.c Ye Xingchen      2023-03-22  207  		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
db8496d0b50519 drivers/gpu/drm/bridge/simple-bridge.c Ye Xingchen      2023-03-22  208  				     "Unable to retrieve enable GPIO\n");
2df6428e290a61 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  209  
00686ac55d0a21 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-05-26  210  	/* Register the bridge. */
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  211  	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26 @212  	sbridge->bridge.of_node = pdev->dev.of_node;
272378ec0eb972 drivers/gpu/drm/bridge/simple-bridge.c Laurent Pinchart 2020-02-26  213  	sbridge->bridge.timings = sbridge->info->timings;
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  214  
94ded532ffdb42 drivers/gpu/drm/bridge/dumb-vga-dac.c  Laurent Pinchart 2020-02-26  215  	drm_bridge_add(&sbridge->bridge);
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  216  
47e34278549ca4 drivers/gpu/drm/bridge/dumb-vga-dac.c  Inki Dae         2017-07-03  217  	return 0;
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  218  }
56fe8b6f499167 drivers/gpu/drm/bridge/dumb-vga-dac.c  Maxime Ripard    2016-09-30  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
