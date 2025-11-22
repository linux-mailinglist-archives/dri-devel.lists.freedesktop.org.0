Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B1C7D71A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 21:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6F510E085;
	Sat, 22 Nov 2025 20:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctaXiPVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8273C10E085
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 20:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763843248; x=1795379248;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ObiTUSwbFQULS2XDHsAkyys5us0yTnnbDv+Hij4t7MM=;
 b=ctaXiPVbbC6Di9wtph/+XbgEPBmaWTQ2Hdb6i3Y4j4FioD+Q7KhWauxL
 mU9WJ/7CZLcJy3GwydIolJ444+acWY+NY9lBC7X9FN9tLNG1rZAR2AIGZ
 DfhKVGZPdvvv34MNNF5mwlDrdvoig6LPoTwlpXfyB4YzhFJY4SmUb0oQ5
 o2IT13v+1FD95M7YRcaHrQOazesX6poVWoAw/jWoKLLeFY1VGGUSkJ6R4
 vuE7d5M06AbMugqJi9nnuyZWR+irgNLsMgC0wiOhSxQNjZUTR2uqRhXrv
 /n6iiN19dJ9B6mOPLYOQ9TGmc1Huk/2cijsSVPg6Ouw8tBDORlyxCouNG w==;
X-CSE-ConnectionGUID: mVeAu5w7R+mDbRL1gehI7w==
X-CSE-MsgGUID: Iers00+oSFObHgs1y4QTtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="83292232"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="83292232"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 12:27:27 -0800
X-CSE-ConnectionGUID: sO25ePunS2m/nGj4gEKxeA==
X-CSE-MsgGUID: lCKu+usDRVaKpezRRsP4/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="196267371"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 22 Nov 2025 12:27:22 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vMuCW-0007oL-2h;
 Sat, 22 Nov 2025 20:27:20 +0000
Date: Sun, 23 Nov 2025 04:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH REGRESSION] drm/panel: simple: restore connector_type
 fallback
Message-ID: <202511230354.nHRvfjDz-lkp@intel.com>
References: <20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4@microchip.com>
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

Hi Ludovic,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b]

url:    https://github.com/intel-lab-lkp/linux/commits/Ludovic-Desroches/drm-panel-simple-restore-connector_type-fallback/20251121-212613
base:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
patch link:    https://lore.kernel.org/r/20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4%40microchip.com
patch subject: [PATCH REGRESSION] drm/panel: simple: restore connector_type fallback
config: arm-randconfig-002-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230354.nHRvfjDz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230354.nHRvfjDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230354.nHRvfjDz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-simple.c:648:7: warning: variable 'panel' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     648 |         case DRM_MODE_CONNECTOR_eDP:
         |              ^~~~~~~~~~~~~~~~~~~~~~
   include/uapi/drm/drm_mode.h:417:33: note: expanded from macro 'DRM_MODE_CONNECTOR_eDP'
     417 | #define DRM_MODE_CONNECTOR_eDP          14
         |                                         ^~
   drivers/gpu/drm/panel/panel-simple.c:749:6: note: uninitialized use occurs here
     749 |         if (panel->ddc)
         |             ^~~~~
   drivers/gpu/drm/panel/panel-simple.c:615:28: note: initialize the variable 'panel' to silence this warning
     615 |         struct panel_simple *panel;
         |                                   ^
         |                                    = NULL
   1 warning generated.


vim +/panel +648 drivers/gpu/drm/panel/panel-simple.c

47c08262f34e1c Maxime Ripard     2025-06-26  611  
47c08262f34e1c Maxime Ripard     2025-06-26  612  static struct panel_simple *panel_simple_probe(struct device *dev)
280921de7241ee Thierry Reding    2013-08-30  613  {
47c08262f34e1c Maxime Ripard     2025-06-26  614  	const struct panel_desc *desc;
280921de7241ee Thierry Reding    2013-08-30  615  	struct panel_simple *panel;
b8a2948fa2b3a5 Sean Paul         2019-07-11  616  	struct display_timing dt;
0fe1564bd61642 Sam Ravnborg      2019-12-07  617  	struct device_node *ddc;
9f069c6fbc7266 Sam Ravnborg      2020-07-26  618  	int connector_type;
ddb8e853dc8507 Sam Ravnborg      2020-07-26  619  	u32 bus_flags;
280921de7241ee Thierry Reding    2013-08-30  620  	int err;
280921de7241ee Thierry Reding    2013-08-30  621  
47c08262f34e1c Maxime Ripard     2025-06-26  622  	desc = panel_simple_get_desc(dev);
47c08262f34e1c Maxime Ripard     2025-06-26  623  	if (IS_ERR(desc))
47c08262f34e1c Maxime Ripard     2025-06-26  624  		return ERR_CAST(desc);
47c08262f34e1c Maxime Ripard     2025-06-26  625  
9f069c6fbc7266 Sam Ravnborg      2020-07-26  626  	connector_type = desc->connector_type;
ddb8e853dc8507 Sam Ravnborg      2020-07-26  627  	/* Catch common mistakes for panels. */
9f069c6fbc7266 Sam Ravnborg      2020-07-26  628  	switch (connector_type) {
ddb8e853dc8507 Sam Ravnborg      2020-07-26  629  	case 0:
ddb8e853dc8507 Sam Ravnborg      2020-07-26  630  		dev_warn(dev, "Specify missing connector_type\n");
9f069c6fbc7266 Sam Ravnborg      2020-07-26  631  		connector_type = DRM_MODE_CONNECTOR_DPI;
ddb8e853dc8507 Sam Ravnborg      2020-07-26  632  		break;
ddb8e853dc8507 Sam Ravnborg      2020-07-26  633  	case DRM_MODE_CONNECTOR_LVDS:
c4715837b02393 Laurent Pinchart  2020-06-30  634  		WARN_ON(desc->bus_flags &
c4715837b02393 Laurent Pinchart  2020-06-30  635  			~(DRM_BUS_FLAG_DE_LOW |
c4715837b02393 Laurent Pinchart  2020-06-30  636  			  DRM_BUS_FLAG_DE_HIGH |
c4715837b02393 Laurent Pinchart  2020-06-30  637  			  DRM_BUS_FLAG_DATA_MSB_TO_LSB |
c4715837b02393 Laurent Pinchart  2020-06-30  638  			  DRM_BUS_FLAG_DATA_LSB_TO_MSB));
1185c406f11a49 Laurent Pinchart  2020-06-30  639  		WARN_ON(desc->bus_format != MEDIA_BUS_FMT_RGB666_1X7X3_SPWG &&
1185c406f11a49 Laurent Pinchart  2020-06-30  640  			desc->bus_format != MEDIA_BUS_FMT_RGB888_1X7X4_SPWG &&
1185c406f11a49 Laurent Pinchart  2020-06-30  641  			desc->bus_format != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA);
1185c406f11a49 Laurent Pinchart  2020-06-30  642  		WARN_ON(desc->bus_format == MEDIA_BUS_FMT_RGB666_1X7X3_SPWG &&
1185c406f11a49 Laurent Pinchart  2020-06-30  643  			desc->bpc != 6);
1185c406f11a49 Laurent Pinchart  2020-06-30  644  		WARN_ON((desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ||
1185c406f11a49 Laurent Pinchart  2020-06-30  645  			 desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA) &&
1185c406f11a49 Laurent Pinchart  2020-06-30  646  			desc->bpc != 8);
ddb8e853dc8507 Sam Ravnborg      2020-07-26  647  		break;
ddb8e853dc8507 Sam Ravnborg      2020-07-26 @648  	case DRM_MODE_CONNECTOR_eDP:
5f04e7ce392db9 Douglas Anderson  2021-09-14  649  		dev_warn(dev, "eDP panels moved to panel-edp\n");
5f04e7ce392db9 Douglas Anderson  2021-09-14  650  		err = -EINVAL;
5f04e7ce392db9 Douglas Anderson  2021-09-14  651  		goto free_ddc;
ddb8e853dc8507 Sam Ravnborg      2020-07-26  652  	case DRM_MODE_CONNECTOR_DSI:
ddb8e853dc8507 Sam Ravnborg      2020-07-26  653  		if (desc->bpc != 6 && desc->bpc != 8)
ddb8e853dc8507 Sam Ravnborg      2020-07-26  654  			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
ddb8e853dc8507 Sam Ravnborg      2020-07-26  655  		break;
ddb8e853dc8507 Sam Ravnborg      2020-07-26  656  	case DRM_MODE_CONNECTOR_DPI:
ddb8e853dc8507 Sam Ravnborg      2020-07-26  657  		bus_flags = DRM_BUS_FLAG_DE_LOW |
ddb8e853dc8507 Sam Ravnborg      2020-07-26  658  			    DRM_BUS_FLAG_DE_HIGH |
ddb8e853dc8507 Sam Ravnborg      2020-07-26  659  			    DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
ddb8e853dc8507 Sam Ravnborg      2020-07-26  660  			    DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
ddb8e853dc8507 Sam Ravnborg      2020-07-26  661  			    DRM_BUS_FLAG_DATA_MSB_TO_LSB |
ddb8e853dc8507 Sam Ravnborg      2020-07-26  662  			    DRM_BUS_FLAG_DATA_LSB_TO_MSB |
ddb8e853dc8507 Sam Ravnborg      2020-07-26  663  			    DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE |
ddb8e853dc8507 Sam Ravnborg      2020-07-26  664  			    DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE;
ddb8e853dc8507 Sam Ravnborg      2020-07-26  665  		if (desc->bus_flags & ~bus_flags)
ddb8e853dc8507 Sam Ravnborg      2020-07-26  666  			dev_warn(dev, "Unexpected bus_flags(%d)\n", desc->bus_flags & ~bus_flags);
ddb8e853dc8507 Sam Ravnborg      2020-07-26  667  		if (!(desc->bus_flags & bus_flags))
ddb8e853dc8507 Sam Ravnborg      2020-07-26  668  			dev_warn(dev, "Specify missing bus_flags\n");
ddb8e853dc8507 Sam Ravnborg      2020-07-26  669  		if (desc->bus_format == 0)
ddb8e853dc8507 Sam Ravnborg      2020-07-26  670  			dev_warn(dev, "Specify missing bus_format\n");
ddb8e853dc8507 Sam Ravnborg      2020-07-26  671  		if (desc->bpc != 6 && desc->bpc != 8)
ddb8e853dc8507 Sam Ravnborg      2020-07-26  672  			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
ddb8e853dc8507 Sam Ravnborg      2020-07-26  673  		break;
ddb8e853dc8507 Sam Ravnborg      2020-07-26  674  	default:
ddb8e853dc8507 Sam Ravnborg      2020-07-26  675  		dev_warn(dev, "Specify a valid connector_type: %d\n", desc->connector_type);
9f069c6fbc7266 Sam Ravnborg      2020-07-26  676  		connector_type = DRM_MODE_CONNECTOR_DPI;
ddb8e853dc8507 Sam Ravnborg      2020-07-26  677  		break;
1185c406f11a49 Laurent Pinchart  2020-06-30  678  	}
c4715837b02393 Laurent Pinchart  2020-06-30  679  
2803eb4aeb2702 Ludovic Desroches 2025-11-21  680  	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
2803eb4aeb2702 Ludovic Desroches 2025-11-21  681  				     &panel_simple_funcs, connector_type);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  682  	if (IS_ERR(panel))
2803eb4aeb2702 Ludovic Desroches 2025-11-21  683  		return ERR_CAST(panel);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  684  
2803eb4aeb2702 Ludovic Desroches 2025-11-21  685  	panel->desc = desc;
2803eb4aeb2702 Ludovic Desroches 2025-11-21  686  
2803eb4aeb2702 Ludovic Desroches 2025-11-21  687  	panel->supply = devm_regulator_get(dev, "power");
2803eb4aeb2702 Ludovic Desroches 2025-11-21  688  	if (IS_ERR(panel->supply))
2803eb4aeb2702 Ludovic Desroches 2025-11-21  689  		return ERR_CAST(panel->supply);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  690  
2803eb4aeb2702 Ludovic Desroches 2025-11-21  691  	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
2803eb4aeb2702 Ludovic Desroches 2025-11-21  692  						     GPIOD_OUT_LOW);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  693  	if (IS_ERR(panel->enable_gpio))
2803eb4aeb2702 Ludovic Desroches 2025-11-21  694  		return dev_err_cast_probe(dev, panel->enable_gpio,
2803eb4aeb2702 Ludovic Desroches 2025-11-21  695  					  "failed to request GPIO\n");
2803eb4aeb2702 Ludovic Desroches 2025-11-21  696  
2803eb4aeb2702 Ludovic Desroches 2025-11-21  697  	err = of_drm_get_panel_orientation(dev->of_node, &panel->orientation);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  698  	if (err) {
2803eb4aeb2702 Ludovic Desroches 2025-11-21  699  		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  700  		return ERR_PTR(err);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  701  	}
2803eb4aeb2702 Ludovic Desroches 2025-11-21  702  
2803eb4aeb2702 Ludovic Desroches 2025-11-21  703  	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  704  	if (ddc) {
2803eb4aeb2702 Ludovic Desroches 2025-11-21  705  		panel->ddc = of_find_i2c_adapter_by_node(ddc);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  706  		of_node_put(ddc);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  707  
2803eb4aeb2702 Ludovic Desroches 2025-11-21  708  		if (!panel->ddc)
2803eb4aeb2702 Ludovic Desroches 2025-11-21  709  			return ERR_PTR(-EPROBE_DEFER);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  710  	}
2803eb4aeb2702 Ludovic Desroches 2025-11-21  711  
2803eb4aeb2702 Ludovic Desroches 2025-11-21  712  	if (!of_device_is_compatible(dev->of_node, "panel-dpi") &&
2803eb4aeb2702 Ludovic Desroches 2025-11-21  713  	    !of_get_display_timing(dev->of_node, "panel-timing", &dt))
2803eb4aeb2702 Ludovic Desroches 2025-11-21  714  		panel_simple_parse_panel_timing_node(dev, panel, &dt);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  715  
2803eb4aeb2702 Ludovic Desroches 2025-11-21  716  	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
2803eb4aeb2702 Ludovic Desroches 2025-11-21  717  		/* Optional data-mapping property for overriding bus format */
2803eb4aeb2702 Ludovic Desroches 2025-11-21  718  		err = panel_simple_override_nondefault_lvds_datamapping(dev, panel);
2803eb4aeb2702 Ludovic Desroches 2025-11-21  719  		if (err)
2803eb4aeb2702 Ludovic Desroches 2025-11-21  720  			goto free_ddc;
2803eb4aeb2702 Ludovic Desroches 2025-11-21  721  	}
2803eb4aeb2702 Ludovic Desroches 2025-11-21  722  
3235b0f20a0a41 Douglas Anderson  2021-04-16  723  	dev_set_drvdata(dev, panel);
3235b0f20a0a41 Douglas Anderson  2021-04-16  724  
3235b0f20a0a41 Douglas Anderson  2021-04-16  725  	/*
3235b0f20a0a41 Douglas Anderson  2021-04-16  726  	 * We use runtime PM for prepare / unprepare since those power the panel
3235b0f20a0a41 Douglas Anderson  2021-04-16  727  	 * on and off and those can be very slow operations. This is important
3235b0f20a0a41 Douglas Anderson  2021-04-16  728  	 * to optimize powering the panel on briefly to read the EDID before
3235b0f20a0a41 Douglas Anderson  2021-04-16  729  	 * fully enabling the panel.
3235b0f20a0a41 Douglas Anderson  2021-04-16  730  	 */
3235b0f20a0a41 Douglas Anderson  2021-04-16  731  	pm_runtime_enable(dev);
3235b0f20a0a41 Douglas Anderson  2021-04-16  732  	pm_runtime_set_autosuspend_delay(dev, 1000);
3235b0f20a0a41 Douglas Anderson  2021-04-16  733  	pm_runtime_use_autosuspend(dev);
3235b0f20a0a41 Douglas Anderson  2021-04-16  734  
0fe1564bd61642 Sam Ravnborg      2019-12-07  735  	err = drm_panel_of_backlight(&panel->base);
d9e74da2f1fc42 Alexander Stein   2022-06-21  736  	if (err) {
d9e74da2f1fc42 Alexander Stein   2022-06-21  737  		dev_err_probe(dev, err, "Could not find backlight\n");
70e12560126685 Douglas Anderson  2021-04-23  738  		goto disable_pm_runtime;
d9e74da2f1fc42 Alexander Stein   2022-06-21  739  	}
0fe1564bd61642 Sam Ravnborg      2019-12-07  740  
c3ee8c65f63799 Bernard Zhao      2020-08-01  741  	drm_panel_add(&panel->base);
280921de7241ee Thierry Reding    2013-08-30  742  
921c41e509746a Maxime Ripard     2025-06-26  743  	return panel;
280921de7241ee Thierry Reding    2013-08-30  744  
70e12560126685 Douglas Anderson  2021-04-23  745  disable_pm_runtime:
a596fcd9cbc781 Douglas Anderson  2021-05-17  746  	pm_runtime_dont_use_autosuspend(dev);
70e12560126685 Douglas Anderson  2021-04-23  747  	pm_runtime_disable(dev);
280921de7241ee Thierry Reding    2013-08-30  748  free_ddc:
5f04e7ce392db9 Douglas Anderson  2021-09-14  749  	if (panel->ddc)
280921de7241ee Thierry Reding    2013-08-30  750  		put_device(&panel->ddc->dev);
280921de7241ee Thierry Reding    2013-08-30  751  
921c41e509746a Maxime Ripard     2025-06-26  752  	return ERR_PTR(err);
280921de7241ee Thierry Reding    2013-08-30  753  }
280921de7241ee Thierry Reding    2013-08-30  754  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
