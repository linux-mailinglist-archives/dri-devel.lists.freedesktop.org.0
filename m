Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2B7AC44C9
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 23:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD9010E397;
	Mon, 26 May 2025 21:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCyZQptA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFBC10E27C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 21:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748294810; x=1779830810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=izTJpRLc1S6KxFHAdKVD5qbNu8KNoNUHX2UeBgqMpqE=;
 b=MCyZQptA5vXlDMIo+B3BhAJiyyMe0J6JaEKDvTu2E0UKQvjB2oIs97u9
 TVUapOSsMF0w7z+nXKmAzvQExHDxMMysUjxNmV+yAmyqvweKx5XKtHbSq
 Mcq7Zik7yuPiV6DnaUqd7w0OH5zER5ExB0yRJmvgJiR+KVgBaKOYtfmOJ
 Wty9h4kkEoj6erE6+ZBf/xGd603rS+VvZzw2odTZpcpwv0gYU/86BC9ji
 beyMoBiqhCYSjBrKlZIargKtoI6+lu4KY97KxE8CwZhwSGRsOZUo6bHtx
 E8lLW4tkGKYuWGr6TXpCrvvsmtW7Cw75lp5qTrWprEGJEACaiOhzZpa5X Q==;
X-CSE-ConnectionGUID: wkIZ2Jw1QCqOApQw29NQJg==
X-CSE-MsgGUID: JtbyAbZURfKc0O5HgX7Cxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50431275"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="50431275"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:26:48 -0700
X-CSE-ConnectionGUID: XPXKgrLUSKS6R22GBHy8aw==
X-CSE-MsgGUID: R5/MVKnTTqKNENq8UMRTPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="142526922"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 26 May 2025 14:26:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uJfLF-000SiO-2P;
 Mon, 26 May 2025 21:26:41 +0000
Date: Tue, 27 May 2025 05:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andy.yan@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v1 3/3] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <202505270453.H3muv5WW-lkp@intel.com>
References: <20250526120742.3195812-4-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526120742.3195812-4-damon.ding@rock-chips.com>
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

Hi Damon,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20250526]
[cannot apply to linus/master v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Formalize-the-struct-analogid_dp_device/20250526-201358
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250526120742.3195812-4-damon.ding%40rock-chips.com
patch subject: [PATCH v1 3/3] drm/bridge: analogix_dp: Apply drm_bridge_connector helper
config: arm64-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270453.H3muv5WW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270453.H3muv5WW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270453.H3muv5WW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/exynos/exynos_dp.c: In function 'exynos_dp_probe':
>> drivers/gpu/drm/exynos/exynos_dp.c:240:16: error: 'struct analogix_dp_plat_data' has no member named 'skip_connector'; did you mean 'connector'?
     dp->plat_data.skip_connector = !!bridge;
                   ^~~~~~~~~~~~~~
                   connector


vim +240 drivers/gpu/drm/exynos/exynos_dp.c

f37cd5e8098441a drivers/gpu/drm/exynos/exynos_dp_core.c Inki Dae                 2014-05-09  194  
f37cd5e8098441a drivers/gpu/drm/exynos/exynos_dp_core.c Inki Dae                 2014-05-09  195  static int exynos_dp_probe(struct platform_device *pdev)
f37cd5e8098441a drivers/gpu/drm/exynos/exynos_dp_core.c Inki Dae                 2014-05-09  196  {
5f1dcd8b7ec8189 drivers/gpu/drm/exynos/exynos_dp_core.c Ajay Kumar               2014-07-31  197  	struct device *dev = &pdev->dev;
ebc9446135671b8 drivers/gpu/drm/exynos/exynos_dp.c      Rob Herring              2017-03-29  198  	struct device_node *np;
5f1dcd8b7ec8189 drivers/gpu/drm/exynos/exynos_dp_core.c Ajay Kumar               2014-07-31  199  	struct exynos_dp_device *dp;
ebc9446135671b8 drivers/gpu/drm/exynos/exynos_dp.c      Rob Herring              2017-03-29  200  	struct drm_panel *panel;
ebc9446135671b8 drivers/gpu/drm/exynos/exynos_dp.c      Rob Herring              2017-03-29  201  	struct drm_bridge *bridge;
ebc9446135671b8 drivers/gpu/drm/exynos/exynos_dp.c      Rob Herring              2017-03-29  202  	int ret;
df5225bc9a87f15 drivers/gpu/drm/exynos/exynos_dp_core.c Inki Dae                 2014-05-29  203  
5f1dcd8b7ec8189 drivers/gpu/drm/exynos/exynos_dp_core.c Ajay Kumar               2014-07-31  204  	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
5f1dcd8b7ec8189 drivers/gpu/drm/exynos/exynos_dp_core.c Ajay Kumar               2014-07-31  205  			  GFP_KERNEL);
5f1dcd8b7ec8189 drivers/gpu/drm/exynos/exynos_dp_core.c Ajay Kumar               2014-07-31  206  	if (!dp)
5f1dcd8b7ec8189 drivers/gpu/drm/exynos/exynos_dp_core.c Ajay Kumar               2014-07-31  207  		return -ENOMEM;
5f1dcd8b7ec8189 drivers/gpu/drm/exynos/exynos_dp_core.c Ajay Kumar               2014-07-31  208  
152cce0006abf7e drivers/gpu/drm/exynos/exynos_dp.c      Marek Szyprowski         2020-03-10  209  	dp->dev = dev;
3424e3a4f844c0a drivers/gpu/drm/exynos/exynos_dp_core.c Yakir Yang               2016-03-29  210  	/*
3424e3a4f844c0a drivers/gpu/drm/exynos/exynos_dp_core.c Yakir Yang               2016-03-29  211  	 * We just use the drvdata until driver run into component
3424e3a4f844c0a drivers/gpu/drm/exynos/exynos_dp_core.c Yakir Yang               2016-03-29  212  	 * add function, and then we would set drvdata to null, so
3424e3a4f844c0a drivers/gpu/drm/exynos/exynos_dp_core.c Yakir Yang               2016-03-29  213  	 * that analogix dp driver would take charge of the drvdata.
3424e3a4f844c0a drivers/gpu/drm/exynos/exynos_dp_core.c Yakir Yang               2016-03-29  214  	 */
1df6e5fb79f6141 drivers/gpu/drm/exynos/exynos_dp_core.c Andrzej Hajda            2014-11-17  215  	platform_set_drvdata(pdev, dp);
1df6e5fb79f6141 drivers/gpu/drm/exynos/exynos_dp_core.c Andrzej Hajda            2014-11-17  216  
a9fa852886fd5a7 drivers/gpu/drm/exynos/exynos_dp_core.c Inki Dae                 2015-11-26  217  	/* This is for the backward compatibility. */
37e110625eeeaba drivers/gpu/drm/exynos/exynos_dp_core.c Javier Martinez Canillas 2016-01-29  218  	np = of_parse_phandle(dev->of_node, "panel", 0);
37e110625eeeaba drivers/gpu/drm/exynos/exynos_dp_core.c Javier Martinez Canillas 2016-01-29  219  	if (np) {
3424e3a4f844c0a drivers/gpu/drm/exynos/exynos_dp_core.c Yakir Yang               2016-03-29  220  		dp->plat_data.panel = of_drm_find_panel(np);
5fa8e4a22182df8 drivers/gpu/drm/exynos/exynos_dp.c      Boris Brezillon          2018-05-09  221  
37e110625eeeaba drivers/gpu/drm/exynos/exynos_dp_core.c Javier Martinez Canillas 2016-01-29  222  		of_node_put(np);
5fa8e4a22182df8 drivers/gpu/drm/exynos/exynos_dp.c      Boris Brezillon          2018-05-09  223  		if (IS_ERR(dp->plat_data.panel))
5fa8e4a22182df8 drivers/gpu/drm/exynos/exynos_dp.c      Boris Brezillon          2018-05-09  224  			return PTR_ERR(dp->plat_data.panel);
5fa8e4a22182df8 drivers/gpu/drm/exynos/exynos_dp.c      Boris Brezillon          2018-05-09  225  
37e110625eeeaba drivers/gpu/drm/exynos/exynos_dp_core.c Javier Martinez Canillas 2016-01-29  226  		goto out;
37e110625eeeaba drivers/gpu/drm/exynos/exynos_dp_core.c Javier Martinez Canillas 2016-01-29  227  	}
37e110625eeeaba drivers/gpu/drm/exynos/exynos_dp_core.c Javier Martinez Canillas 2016-01-29  228  
ebc9446135671b8 drivers/gpu/drm/exynos/exynos_dp.c      Rob Herring              2017-03-29  229  	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
ebc9446135671b8 drivers/gpu/drm/exynos/exynos_dp.c      Rob Herring              2017-03-29  230  	if (ret)
ebc9446135671b8 drivers/gpu/drm/exynos/exynos_dp.c      Rob Herring              2017-03-29  231  		return ret;
ebc9446135671b8 drivers/gpu/drm/exynos/exynos_dp.c      Rob Herring              2017-03-29  232  
37e110625eeeaba drivers/gpu/drm/exynos/exynos_dp_core.c Javier Martinez Canillas 2016-01-29  233  	/* The remote port can be either a panel or a bridge */
ebc9446135671b8 drivers/gpu/drm/exynos/exynos_dp.c      Rob Herring              2017-03-29  234  	dp->plat_data.panel = panel;
152cce0006abf7e drivers/gpu/drm/exynos/exynos_dp.c      Marek Szyprowski         2020-03-10  235  	dp->plat_data.dev_type = EXYNOS_DP;
6d4618ad04e1a14 drivers/gpu/drm/exynos/exynos_dp.c      Lucas Stach              2024-06-19  236  	dp->plat_data.power_on = exynos_dp_poweron;
152cce0006abf7e drivers/gpu/drm/exynos/exynos_dp.c      Marek Szyprowski         2020-03-10  237  	dp->plat_data.power_off = exynos_dp_poweroff;
152cce0006abf7e drivers/gpu/drm/exynos/exynos_dp.c      Marek Szyprowski         2020-03-10  238  	dp->plat_data.attach = exynos_dp_bridge_attach;
152cce0006abf7e drivers/gpu/drm/exynos/exynos_dp.c      Marek Szyprowski         2020-03-10  239  	dp->plat_data.get_modes = exynos_dp_get_modes;
2e9b3e74b4a184f drivers/gpu/drm/exynos/exynos_dp.c      Marek Szyprowski         2018-03-05 @240  	dp->plat_data.skip_connector = !!bridge;
152cce0006abf7e drivers/gpu/drm/exynos/exynos_dp.c      Marek Szyprowski         2020-03-10  241  
ebc9446135671b8 drivers/gpu/drm/exynos/exynos_dp.c      Rob Herring              2017-03-29  242  	dp->ptn_bridge = bridge;
801855671ad1dc7 drivers/gpu/drm/exynos/exynos_dp_core.c Ajay Kumar               2015-01-20  243  
a9fa852886fd5a7 drivers/gpu/drm/exynos/exynos_dp_core.c Inki Dae                 2015-11-26  244  out:
152cce0006abf7e drivers/gpu/drm/exynos/exynos_dp.c      Marek Szyprowski         2020-03-10  245  	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
152cce0006abf7e drivers/gpu/drm/exynos/exynos_dp.c      Marek Szyprowski         2020-03-10  246  	if (IS_ERR(dp->adp))
152cce0006abf7e drivers/gpu/drm/exynos/exynos_dp.c      Marek Szyprowski         2020-03-10  247  		return PTR_ERR(dp->adp);
152cce0006abf7e drivers/gpu/drm/exynos/exynos_dp.c      Marek Szyprowski         2020-03-10  248  
3424e3a4f844c0a drivers/gpu/drm/exynos/exynos_dp_core.c Yakir Yang               2016-03-29  249  	return component_add(&pdev->dev, &exynos_dp_ops);
f37cd5e8098441a drivers/gpu/drm/exynos/exynos_dp_core.c Inki Dae                 2014-05-09  250  }
f37cd5e8098441a drivers/gpu/drm/exynos/exynos_dp_core.c Inki Dae                 2014-05-09  251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
