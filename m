Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD364CDCD16
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 17:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CD61123CE;
	Wed, 24 Dec 2025 16:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEt+9uhD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FB81123CE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 16:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766592879; x=1798128879;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=puWmGZxXE8UpiT7pGZBgzqUpkzDtlP+dMU+x0yn5VaI=;
 b=AEt+9uhDoPm0eLv2swVfSIMwdJ5XXiwNBRh9/N+fa83DDwMwYnodokMw
 IR79fCgXdukotJgvYZ9c9TXaNdWXxLLF90wiAbLZvzv9LSoh9CWLzYbl/
 Ix+jhDLWVkabQh+p/6zMAaymWqlcNhK6GdF2w8z2rP+cI4L6//vj6BDdp
 7cuK8AbGHFTYAa2mJB2wWfZtmZNdJ/Ldm4+V95RuETjq94fJAkRHXz2xy
 nsHO580nGn9N4WpJcs9PWCUXdHca3qQO+xF+JFyH4JZxzOX8a/9I3XIzG
 cGzLOLx/yw8M/+8gZ346HN0ggjuH4BZSrzg6n+LRGvVcA8kA3byMnnJT6 g==;
X-CSE-ConnectionGUID: rUBcX9hDSk60I9BEi8G8Mw==
X-CSE-MsgGUID: ZB4kmaKgRceKVUOXcJ8vOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="93898562"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="93898562"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 08:14:38 -0800
X-CSE-ConnectionGUID: IbXEZ3XjTeGoaTrUH18k5g==
X-CSE-MsgGUID: BE8WK5MDSv2mgzXQclGqjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="199282595"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 24 Dec 2025 08:14:33 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vYRVN-000000003FJ-2PxI;
 Wed, 24 Dec 2025 16:14:29 +0000
Date: Thu, 25 Dec 2025 00:13:53 +0800
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
Subject: Re: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01
 DDIC
Message-ID: <202512242356.EwESE8Qv-lkp@intel.com>
References: <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
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
patch link:    https://lore.kernel.org/r/20251222-drm-panels-sony-v2-5-82a87465d163%40somainline.org
patch subject: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01 DDIC
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251224/202512242356.EwESE8Qv-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242356.EwESE8Qv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242356.EwESE8Qv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-samsung-sofef01.c:389:20: warning: cast to smaller integer type 'enum panel_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           ctx->panel_type = (enum panel_type)of_device_get_match_data(dev);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +389 drivers/gpu/drm/panel/panel-samsung-sofef01.c

   357	
   358	static int samsung_sofef01_m_probe(struct mipi_dsi_device *dsi)
   359	{
   360		const struct backlight_properties props = {
   361			.type = BACKLIGHT_RAW,
   362			.brightness = 100,
   363			.max_brightness = 1023,
   364		};
   365		struct device *dev = &dsi->dev;
   366		struct samsung_sofef01_m *ctx;
   367		int ret;
   368	
   369		ctx = devm_drm_panel_alloc(dev, struct samsung_sofef01_m, panel,
   370					   &samsung_sofef01_m_panel_funcs,
   371					   DRM_MODE_CONNECTOR_DSI);
   372		if (IS_ERR(ctx))
   373			return PTR_ERR(ctx);
   374	
   375		ret = devm_regulator_bulk_get_const(
   376			dev,
   377			ARRAY_SIZE(samsung_sofef01_m_supplies),
   378			samsung_sofef01_m_supplies,
   379			&ctx->supplies);
   380		if (ret < 0)
   381			return dev_err_probe(dev, ret, "Failed to get regulators\n");
   382	
   383		ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
   384		if (IS_ERR(ctx->reset_gpio))
   385			return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
   386					     "Failed to get reset-gpios\n");
   387	
   388		ctx->dsi = dsi;
 > 389		ctx->panel_type = (enum panel_type)of_device_get_match_data(dev);
   390		if (ctx->panel_type == PANEL_TYPE_TC01)
   391			ctx->mode = &samsung_sofef01_m_61_142_mode;
   392		else if (ctx->panel_type == PANEL_TYPE_DK01)
   393			ctx->mode = &samsung_sofef01_m_61_141_mode;
   394		else
   395			ctx->mode = &samsung_sofef01_m_60_139_mode;
   396		mipi_dsi_set_drvdata(dsi, ctx);
   397	
   398		dsi->lanes = 4;
   399		dsi->format = MIPI_DSI_FMT_RGB888;
   400		dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
   401	
   402		ctx->panel.prepare_prev_first = true;
   403	
   404		ctx->panel.backlight = devm_backlight_device_register(
   405			dev, dev_name(dev), dev, dsi,
   406			&samsung_sofef01_m_bl_ops,
   407			&props);
   408		if (IS_ERR(ctx->panel.backlight))
   409			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
   410					     "Failed to create backlight\n");
   411	
   412		drm_panel_add(&ctx->panel);
   413	
   414		ret = mipi_dsi_attach(dsi);
   415		if (ret < 0) {
   416			dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
   417			drm_panel_remove(&ctx->panel);
   418			return ret;
   419		}
   420	
   421		return 0;
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
