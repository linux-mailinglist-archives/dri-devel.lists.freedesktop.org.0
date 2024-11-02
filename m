Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E809B9BC4
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 02:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAE110E223;
	Sat,  2 Nov 2024 01:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GATgM/pP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3B910E223
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 01:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730509391; x=1762045391;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1RPbTVtZrNSH2J9kRLVfqqDfG67h+u69mXd0zc4zuto=;
 b=GATgM/pPHiKRkBRpAU/MYPzySKvMyXnmzB0c+wJCoYnWCEKUZzkHi1fb
 NYKe5FK3Cmx8ehbWzryQxyfFlt5UMtfcVd94m/8PsczKgLrND03bepDR4
 A/EWoN6wkFTe18HiniHtpfSKhdH9088GzeetrhcllKz8vT7kEoNHm3AkP
 kxz2U2+E5lLJxr6JJ2105b7x8SkAxQEFi8/4+9RVGzAcOo/17008vS2RC
 hQsliceIlSfQXUG3MrCELVDIYHqY/6gg+45iaKWIglWszaCVD1rSItXS2
 Tu54NvEDtCMupf5xq8DIrwPPmXyeyzT9MXOIRqI7zB23m65UQjOUjYCHa A==;
X-CSE-ConnectionGUID: LoPxnSLgQiSqPsPIQ5dMjg==
X-CSE-MsgGUID: hk6YyIzbRNeiQI4J/t7BIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="34075521"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; d="scan'208";a="34075521"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 18:03:10 -0700
X-CSE-ConnectionGUID: gpFRMeBwRrm2FoiAl4BbUQ==
X-CSE-MsgGUID: X90N9N+iS3WtPcJrfymvwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; d="scan'208";a="82649776"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2024 18:03:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t72Xh-000iFP-18;
 Sat, 02 Nov 2024 01:03:05 +0000
Date: Sat, 2 Nov 2024 09:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, kernel@pengutronix.de,
 Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 3/3] drm/panel: add LXD M9189A panel driver
Message-ID: <202411020816.Nb9aEvtO-lkp@intel.com>
References: <20241025141130.3179166-3-r.czerwinski@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025141130.3179166-3-r.czerwinski@pengutronix.de>
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

Hi Rouven,

kernel test robot noticed the following build errors:

[auto build test ERROR on c2ee9f594da826bea183ed14f2cc029c719bf4da]

url:    https://github.com/intel-lab-lkp/linux/commits/Rouven-Czerwinski/dt-bindings-display-panel-add-YAML-schema-for-LXD-M9189A/20241025-221252
base:   c2ee9f594da826bea183ed14f2cc029c719bf4da
patch link:    https://lore.kernel.org/r/20241025141130.3179166-3-r.czerwinski%40pengutronix.de
patch subject: [PATCH v2 3/3] drm/panel: add LXD M9189A panel driver
config: arm-randconfig-r062-20241102 (https://download.01.org/0day-ci/archive/20241102/202411020816.Nb9aEvtO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020816.Nb9aEvtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020816.Nb9aEvtO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-lxd-m9189a.c:173:29: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
     173 |                 return dev_err_probe(dev, ret, "Failed to get regulator\n");
         |                                           ^~~
   drivers/gpu/drm/panel/panel-lxd-m9189a.c:165:9: note: initialize the variable 'ret' to silence this warning
     165 |         int ret;
         |                ^
         |                 = 0
   1 error generated.


vim +/ret +173 drivers/gpu/drm/panel/panel-lxd-m9189a.c

   160	
   161	static int lxd_m9189_probe(struct mipi_dsi_device *dsi)
   162	{
   163		struct device *dev = &dsi->dev;
   164		struct m9189_panel *m9189;
   165		int ret;
   166	
   167		m9189 = devm_kzalloc(dev, sizeof(*m9189), GFP_KERNEL);
   168		if (!m9189)
   169			return -ENOMEM;
   170	
   171		m9189->supply = devm_regulator_get(dev, "vdd");
   172		if (IS_ERR(m9189->supply))
 > 173			return dev_err_probe(dev, ret, "Failed to get regulator\n");
   174	
   175		m9189->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
   176		if (IS_ERR(m9189->reset_gpio))
   177			return dev_err_probe(dev, PTR_ERR(m9189->reset_gpio),
   178					     "Failed to get reset-gpios\n");
   179	
   180		m9189->standby_gpio = devm_gpiod_get(dev, "standby", GPIOD_OUT_LOW);
   181		if (IS_ERR(m9189->standby_gpio))
   182			return dev_err_probe(dev, PTR_ERR(m9189->standby_gpio),
   183					     "Failed to get standby-gpios\n");
   184	
   185		m9189->dsi = dsi;
   186		mipi_dsi_set_drvdata(dsi, m9189);
   187	
   188		dsi->lanes = 4;
   189		dsi->format = MIPI_DSI_FMT_RGB888;
   190		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
   191	
   192		drm_panel_init(&m9189->panel, dev, &m9189_panel_funcs,
   193			       DRM_MODE_CONNECTOR_DSI);
   194		m9189->panel.prepare_prev_first = true;
   195	
   196		ret = drm_panel_of_backlight(&m9189->panel);
   197		if (ret)
   198			return dev_err_probe(dev, ret, "Failed to get backlight\n");
   199	
   200		drm_panel_add(&m9189->panel);
   201	
   202		ret = mipi_dsi_attach(dsi);
   203		if (ret < 0) {
   204			dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
   205			drm_panel_remove(&m9189->panel);
   206			return ret;
   207		}
   208	
   209		return 0;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
