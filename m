Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F07CDCECF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 18:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E14B10FD8D;
	Wed, 24 Dec 2025 17:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGnQbz1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A55110F042
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 17:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766597211; x=1798133211;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XG5dlRwOvowC+M8+nqEdM+9kKwWj2fDGtVuY6Ihq/14=;
 b=eGnQbz1v1CzB00c9DtGvadsZnL2SopULet1PqyRLMV2BXsY1U1JKPY+C
 QmdRpINT2gf6IG22eFCA7md79zjA2PApvusN/yRja/mYwOM1hcfvwLRqz
 g4er/kn2all9O1kj0WLTAHDIAp8KFpnnbjAYl7T7vHnoXVmUj43495jxD
 NcyOQ4fyxiKG+5/bTCziHrnRiBNIu/4OkEeppMUXSOuQHez1IGcR9Bn4x
 W2Bcdn2DcidUmllZMBwz5PFE5P3payFFLBdj6XsdBB+WXOVB1uaVOiB4M
 jkqKI6xq8MHEC/OuAYtbQOMlcWeWxLH/+h3Eu847qKmzngp2IA3i8wOVm g==;
X-CSE-ConnectionGUID: VzYWS6wiTOqXVDSJQJ4pMg==
X-CSE-MsgGUID: pKI4BflISNKfvtjZwGxprQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68415008"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="68415008"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 09:26:50 -0800
X-CSE-ConnectionGUID: WbxWu0zkQAOUpen9vMtANw==
X-CSE-MsgGUID: XSA1HX4rSy6bhh+XTpkEBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="237446533"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 24 Dec 2025 09:26:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vYSdF-000000003K5-1xOA;
 Wed, 24 Dec 2025 17:26:41 +0000
Date: Thu, 25 Dec 2025 01:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Casey Connolly <casey.connolly@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 09/11] drm/panel: Add panel driver for Samsung
 SOUXP00-A DDIC
Message-ID: <202512250101.ljTix9QV-lkp@intel.com>
References: <20251222-drm-panels-sony-v2-9-82a87465d163@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-9-82a87465d163@somainline.org>
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

Hi Marijn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Marijn-Suijten/drm-panel-Clean-up-SOFEF00-config-dependencies/20251222-073548
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20251222-drm-panels-sony-v2-9-82a87465d163%40somainline.org
patch subject: [PATCH v2 09/11] drm/panel: Add panel driver for Samsung SOUXP00-A DDIC
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251225/202512250101.ljTix9QV-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250101.ljTix9QV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250101.ljTix9QV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-samsung-souxp00.c:304:20: warning: cast to smaller integer type 'enum panel_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     304 |         ctx->panel_type = (enum panel_type)of_device_get_match_data(dev);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +304 drivers/gpu/drm/panel/panel-samsung-souxp00.c

   285	
   286	static int samsung_souxp00_a_probe(struct mipi_dsi_device *dsi)
   287	{
   288		const struct backlight_properties props = {
   289			.type = BACKLIGHT_RAW,
   290			.brightness = 400,
   291			.max_brightness = 4095,
   292		};
   293		const u16 hdisplay = enable_4k ? 1644 : 1096;
   294		struct device *dev = &dsi->dev;
   295		struct samsung_souxp00_a *ctx;
   296		int ret;
   297	
   298		ctx = devm_drm_panel_alloc(dev, struct samsung_souxp00_a, panel,
   299					   &samsung_souxp00_a_panel_funcs,
   300					   DRM_MODE_CONNECTOR_DSI);
   301		if (IS_ERR(ctx))
   302			return PTR_ERR(ctx);
   303	
 > 304		ctx->panel_type = (enum panel_type)of_device_get_match_data(dev);
   305	
   306		ret = devm_regulator_bulk_get_const(
   307			dev,
   308			ARRAY_SIZE(samsung_souxp00_a_supplies),
   309			samsung_souxp00_a_supplies,
   310			&ctx->supplies);
   311		if (ret < 0)
   312			return dev_err_probe(dev, ret, "Failed to get regulators\n");
   313	
   314		ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
   315		if (IS_ERR(ctx->reset_gpio))
   316			return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
   317					     "Failed to get reset-gpios\n");
   318	
   319		ctx->dsi = dsi;
   320		mipi_dsi_set_drvdata(dsi, ctx);
   321	
   322		dsi->lanes = 4;
   323		dsi->format = MIPI_DSI_FMT_RGB888;
   324		dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
   325	
   326		ctx->panel.prepare_prev_first = true;
   327	
   328		ctx->panel.backlight = devm_backlight_device_register(
   329			dev, dev_name(dev), dev, dsi,
   330			&samsung_souxp00_a_bl_ops,
   331			&props);
   332		if (IS_ERR(ctx->panel.backlight))
   333			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
   334					     "Failed to create backlight\n");
   335	
   336		drm_panel_add(&ctx->panel);
   337	
   338		/* This panel only supports DSC; unconditionally enable it */
   339		dsi->dsc = &ctx->dsc;
   340	
   341		ctx->dsc.dsc_version_major = 1;
   342		ctx->dsc.dsc_version_minor = 1;
   343	
   344		ctx->dsc.slice_height = 32;
   345		ctx->dsc.slice_count = 2;
   346		/*
   347		 * hdisplay should be read from the selected mode once
   348		 * it is passed back to drm_panel (in prepare?)
   349		 */
   350		WARN_ON(hdisplay % ctx->dsc.slice_count);
   351		ctx->dsc.slice_width = hdisplay / ctx->dsc.slice_count;
   352		ctx->dsc.bits_per_component = 8;
   353		ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
   354		ctx->dsc.block_pred_enable = true;
   355	
   356		ret = mipi_dsi_attach(dsi);
   357		if (ret < 0) {
   358			dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
   359			drm_panel_remove(&ctx->panel);
   360			return ret;
   361		}
   362	
   363		return 0;
   364	}
   365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
