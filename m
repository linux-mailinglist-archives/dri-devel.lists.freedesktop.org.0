Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAE823581B
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 17:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F8E6E114;
	Sun,  2 Aug 2020 15:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC746E0A2;
 Sun,  2 Aug 2020 15:23:46 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1AA7880528;
 Sun,  2 Aug 2020 17:23:43 +0200 (CEST)
Date: Sun, 2 Aug 2020 17:23:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v4] drm/kmb: Add support for KeemBay Display
Message-ID: <20200802152342.GA1764350@ravnborg.org>
References: <1596141884-29868-1-git-send-email-anitha.chrisanthus@intel.com>
 <1596141884-29868-2-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596141884-29868-2-git-send-email-anitha.chrisanthus@intel.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=t7dxTtyAHcKbyJb6i1YA:9 a=hyg3q9u8nue2Xwif:21
 a=WbMtBjjndxEm2EuJ:21 a=CjuIK1q_8ugA:10
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha.

On Thu, Jul 30, 2020 at 01:44:44PM -0700, Anitha Chrisanthus wrote:
> This is a basic KMS atomic modesetting display driver for KeemBay family of
> SOCs. Driver has no 2D or 3D graphics.It calls into the ADV bridge
> driver at the connector level.
> 
> Single CRTC with LCD controller->mipi DSI-> ADV bridge
> 
> Only 1080p resolution and single plane is supported at this time.
> 
> v2: moved extern to .h, removed license text
>     use drm_dev_init, upclassed dev_private, removed HAVE_IRQ.
> 
> v3: Squashed all 59 commits to one
> 
> v4: review changes from Sam Ravnborg
> 	renamed dev_p to kmb
> 	moved clocks under kmb_clock, consolidated clk initializations
> 	use drmm functions
> 	use DRM_GEM_CMA_DRIVER_OPS_VMAP
> 

I have not found time neither energy to take a look at v4.
But I applied locally and ran it through checkpatch
with my options:
checkpatch -q --emacs --strict --show-types --codespell --codespellfile /usr/lib/python3/dist-packages/codespell_lib/data/dictionary.txt

The options are from the dim script used when maintaining drm-misc-next with
codespell options added.

Please try to reproduce locally and fix relevant warnings.

	Sam

-:146: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#146: FILE: drivers/gpu/drm/kmb/kmb_crtc.c:58:
+	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
+			LCD_INT_VERT_COMP);

-:173: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#173: FILE: drivers/gpu/drm/kmb/kmb_crtc.c:85:
+	drm_info(dev,
+		"vfp= %d vbp= %d vsyc_len=%d hfp=%d hbp=%d hsync_len=%d\n",

-:194: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#194: FILE: drivers/gpu/drm/kmb/kmb_crtc.c:106:
+	drm_dbg(dev, "%s : %dactive height= %d vbp=%d vfp=%d vsync-w=%d h-active=%d h-bp=%d h-fp=%d hysnc-l=%d",
+			__func__, __LINE__,

-:199: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#199: FILE: drivers/gpu/drm/kmb/kmb_crtc.c:111:
+	kmb_write_lcd(kmb, LCD_V_ACTIVEHEIGHT,
+			m->crtc_vdisplay - 1);

-:204: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#204: FILE: drivers/gpu/drm/kmb/kmb_crtc.c:116:
+	kmb_write_lcd(kmb, LCD_H_ACTIVEWIDTH,
+			m->crtc_hdisplay - 1);

-:217: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#217: FILE: drivers/gpu/drm/kmb/kmb_crtc.c:129:
+		kmb_write_lcd(kmb,
+				LCD_V_BACKPORCH_EVEN, vm.vback_porch);

-:219: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#219: FILE: drivers/gpu/drm/kmb/kmb_crtc.c:131:
+		kmb_write_lcd(kmb,
+				LCD_V_FRONTPORCH_EVEN, vm.vfront_porch);

-:413: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#413: FILE: drivers/gpu/drm/kmb/kmb_drv.c:60:
+		drm_err(&kmb->drm,
+				"Failed to enable MIPI_ECFG clock: %d\n", ret);

-:420: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#420: FILE: drivers/gpu/drm/kmb/kmb_drv.c:67:
+		drm_err(&kmb->drm,
+				"Failed to enable MIPI_CFG clock: %d\n", ret);

-:427: CHECK:LINE_SPACING: Please don't use multiple blank lines
#427: FILE: drivers/gpu/drm/kmb/kmb_drv.c:74:
+
+

-:463: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#463: FILE: drivers/gpu/drm/kmb/kmb_drv.c:110:
+	kmb->sys_clk_mhz = clk_get_rate(kmb_clk.clk_pll0)/1000000;
 	                                                 ^

-:470: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#470: FILE: drivers/gpu/drm/kmb/kmb_drv.c:117:
+		drm_err(&kmb->drm, "failed to set to clk_lcd to %d\n",
+			  KMB_LCD_DEFAULT_CLK);

-:479: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#479: FILE: drivers/gpu/drm/kmb/kmb_drv.c:126:
+		drm_err(&kmb->drm, "failed to set to clk_mipi to %d\n",
+			  KMB_MIPI_DEFAULT_CLK);

-:506: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#506: FILE: drivers/gpu/drm/kmb/kmb_drv.c:153:
+			drm_err(&kmb->drm,
+					"failed to set clk_mipi_cfg to %d\n",

-:511: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#511: FILE: drivers/gpu/drm/kmb/kmb_drv.c:158:
+		drm_info(&kmb->drm,
+				"Get clk_mipi_cfg after set = %ld\n", clk);

-:561: CHECK:LINE_SPACING: Please don't use multiple blank lines
#561: FILE: drivers/gpu/drm/kmb/kmb_drv.c:208:
+
+

-:688: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#688: FILE: drivers/gpu/drm/kmb/kmb_drv.c:335:
+	if (status & LCD_INT_EOF) {
+

-:701: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_CFG>
#701: FILE: drivers/gpu/drm/kmb/kmb_drv.c:348:
+						    LCD_LAYERn_DMA_CFG

-:706: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#706: FILE: drivers/gpu/drm/kmb/kmb_drv.c:353:
+				kmb_clr_bitmask_lcd(kmb, LCD_CONTROL,
+					    plane_status[plane_id].ctrl);

-:733: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#733: FILE: drivers/gpu/drm/kmb/kmb_drv.c:380:
+
+	}

-:774: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#774: FILE: drivers/gpu/drm/kmb/kmb_drv.c:421:
+			drm_info(&kmb->drm,
+			    "!LAYER0:VL0 DMA UNDERFLOW val = 0x%lx,under_flow=%d",

-:776: WARNING:TYPO_SPELLING: 'inerrupt' may be misspelled - perhaps 'interrupt'?
#776: FILE: drivers/gpu/drm/kmb/kmb_drv.c:423:
+			/* disable underflow inerrupt */

-:787: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#787: FILE: drivers/gpu/drm/kmb/kmb_drv.c:434:
+			kmb_clr_bitmask_lcd(kmb, LCD_LAYERn_DMA_CFG(0),
+				    LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);

-:793: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#793: FILE: drivers/gpu/drm/kmb/kmb_drv.c:440:
+			drm_info(&kmb->drm,
+				"LAYER0:VL0 DMA OVERFLOW val = 0x%lx", val);

-:796: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#796: FILE: drivers/gpu/drm/kmb/kmb_drv.c:443:
+			drm_info(&kmb->drm,
+				"LAYER0:VL0 DMA CB OVERFLOW val = 0x%lx", val);

-:799: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#799: FILE: drivers/gpu/drm/kmb/kmb_drv.c:446:
+			drm_info(&kmb->drm,
+				"LAYER0:VL0 DMA CR OVERFLOW val = 0x%lx", val);

-:807: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#807: FILE: drivers/gpu/drm/kmb/kmb_drv.c:454:
+			drm_info(&kmb->drm,
+			    "!LAYER1:VL1 DMA UNDERFLOW val = 0x%lx, under_flow=%d",

-:809: WARNING:TYPO_SPELLING: 'inerrupt' may be misspelled - perhaps 'interrupt'?
#809: FILE: drivers/gpu/drm/kmb/kmb_drv.c:456:
+			/* disable underflow inerrupt */

-:820: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#820: FILE: drivers/gpu/drm/kmb/kmb_drv.c:467:
+			kmb_clr_bitmask_lcd(kmb, LCD_LAYERn_DMA_CFG(1),
+				    LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);

-:827: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#827: FILE: drivers/gpu/drm/kmb/kmb_drv.c:474:
+			drm_info(&kmb->drm,
+				"LAYER1:VL1 DMA OVERFLOW val = 0x%lx", val);

-:830: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#830: FILE: drivers/gpu/drm/kmb/kmb_drv.c:477:
+			drm_info(&kmb->drm,
+				"LAYER1:VL1 DMA CB OVERFLOW val = 0x%lx", val);

-:833: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#833: FILE: drivers/gpu/drm/kmb/kmb_drv.c:480:
+			drm_info(&kmb->drm,
+				"LAYER1:VL1 DMA CR OVERFLOW val = 0x%lx", val);

-:838: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#838: FILE: drivers/gpu/drm/kmb/kmb_drv.c:485:
+			drm_info(&kmb->drm,
+				"LAYER2:GL0 DMA UNDERFLOW val = 0x%lx", val);

-:841: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#841: FILE: drivers/gpu/drm/kmb/kmb_drv.c:488:
+			drm_info(&kmb->drm,
+				"LAYER2:GL0 DMA OVERFLOW val = 0x%lx", val);

-:846: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#846: FILE: drivers/gpu/drm/kmb/kmb_drv.c:493:
+			drm_info(&kmb->drm,
+				"LAYER3:GL1 DMA UNDERFLOW val = 0x%lx", val);

-:849: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#849: FILE: drivers/gpu/drm/kmb/kmb_drv.c:496:
+			drm_info(&kmb->drm,
+				"LAYER3:GL1 DMA OVERFLOW val = 0x%lx", val);

-:952: WARNING:TYPO_SPELLING: 'procees' may be misspelled - perhaps 'process'?
#952: FILE: drivers/gpu/drm/kmb/kmb_drv.c:599:
+	 *  and then the rest of the driver initialization can procees

-:957: CHECK:BRACES: braces {} should be used on all arms of this statement
#957: FILE: drivers/gpu/drm/kmb/kmb_drv.c:604:
+	if (adv_bridge == ERR_PTR(-EPROBE_DEFER))
[...]
+	else if (IS_ERR(adv_bridge)) {
[...]

-:966: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#966: FILE: drivers/gpu/drm/kmb/kmb_drv.c:613:
+	kmb = devm_drm_dev_alloc(dev, &kmb_driver,
+			struct kmb_drm_private, drm);

-:980: CHECK:BRACES: braces {} should be used on all arms of this statement
#980: FILE: drivers/gpu/drm/kmb/kmb_drv.c:627:
+	if (ret == -EPROBE_DEFER) {
[...]
+	} else if (ret)
[...]

-:990: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#990: FILE: drivers/gpu/drm/kmb/kmb_drv.c:637:
+	drm_info(&kmb->drm, "mode_config.num_crtc=%d\n",
+			kmb->drm.mode_config.num_crtc);

-:1026: WARNING:UNDOCUMENTED_DT_STRING: DT compatible string "intel,kmb_display" appears un-documented -- check ./Documentation/devicetree/bindings/
#1026: FILE: drivers/gpu/drm/kmb/kmb_drv.c:673:
+	{.compatible = "intel,kmb_display"},

-:1122: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#1122: FILE: drivers/gpu/drm/kmb/kmb_drv.h:35:
+	spinlock_t			irq_lock;

-:1360: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#1360: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:95:
+	uint16_t default_bit_rate_mbps;

-:1361: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#1361: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:96:
+	uint8_t hsfreqrange_code;

-:1462: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1462: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:197:
+	if (mode->hdisplay < mode_config->min_width ||
+			mode->hdisplay > mode_config->max_width)

-:1466: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1466: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:201:
+	if (mode->vdisplay < mode_config->min_height ||
+			mode->vdisplay > mode_config->max_height)

-:1477: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1477: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:212:
+	num_modes = drm_add_modes_noedid(connector,
+			 connector->dev->mode_config.max_width,

-:1772: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1772: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:507:
+	drm_dbg(&kmb->drm,
+		 "ctrl=%d frame_id=%d section=%d cfg=%x packed=%d\n",

-:1775: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_FGn_SECTo_PH>
#1775: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:510:
+		       (MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id, section)),

-:1787: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0>
#1787: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:522:
+	    MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(ctrl_no,

-:1792: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1792: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:527:
+	drm_dbg(&kmb->drm,
+		 "unpacked_bytes = %d, wordcount = %d\n", unpacked_bytes,

-:1796: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_FGn_SECTo_LINE_CFG>
#1796: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:531:
+	reg_adr = MIPI_TXm_HS_FGn_SECTo_LINE_CFG(ctrl_no, frame_id, section);

-:1828: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1828: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:563:
+	unpacked_bytes = compute_unpacked_bytes(*wc,
+					data_type_parameters.bits_per_pclk);

-:1868: WARNING:TYPO_SPELLING: 'activ' may be misspelled - perhaps 'active'?
#1868: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:603:
+	drm_dbg(&kmb->drm, "bpp=%d sysclk=%d lane-rate=%d activ-lanes=%d\n",

-:1869: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1869: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:604:
+	drm_dbg(&kmb->drm, "bpp=%d sysclk=%d lane-rate=%d activ-lanes=%d\n",
+		 fg_cfg->bpp, sysclk, fg_cfg->lane_rate_mbps,

-:1873: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_FGn_NUM_LINES>
#1873: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:608:
+	reg_adr = MIPI_TXm_HS_FGn_NUM_LINES(ctrl_no, frame_gen);

-:1883: WARNING:TYPO_SPELLING: 'WIDTHn' may be misspelled - perhaps 'Width'?
#1883: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:618:
+	reg_adr = MIPI_TXm_HS_VSYNC_WIDTHn(ctrl_no, frame_gen / 2);

-:1883: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_VSYNC_WIDTHn>
#1883: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:618:
+	reg_adr = MIPI_TXm_HS_VSYNC_WIDTHn(ctrl_no, frame_gen / 2);

-:1887: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_V_BACKPORCHESn>
#1887: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:622:
+	reg_adr = MIPI_TXm_HS_V_BACKPORCHESn(ctrl_no, frame_gen / 2);

-:1891: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_V_FRONTPORCHESn>
#1891: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:626:
+	reg_adr = MIPI_TXm_HS_V_FRONTPORCHESn(ctrl_no, frame_gen / 2);

-:1895: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_V_ACTIVEn>
#1895: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:630:
+	reg_adr = MIPI_TXm_HS_V_ACTIVEn(ctrl_no, frame_gen / 2);

-:1899: WARNING:TYPO_SPELLING: 'WIDTHn' may be misspelled - perhaps 'Width'?
#1899: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:634:
+	reg_adr = MIPI_TXm_HS_HSYNC_WIDTHn(ctrl_no, frame_gen);

-:1899: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_HSYNC_WIDTHn>
#1899: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:634:
+	reg_adr = MIPI_TXm_HS_HSYNC_WIDTHn(ctrl_no, frame_gen);

-:1904: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_H_BACKPORCHn>
#1904: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:639:
+	reg_adr = MIPI_TXm_HS_H_BACKPORCHn(ctrl_no, frame_gen);

-:1909: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_H_FRONTPORCHn>
#1909: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:644:
+	reg_adr = MIPI_TXm_HS_H_FRONTPORCHn(ctrl_no, frame_gen);

-:1914: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_H_ACTIVEn>
#1914: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:649:
+	reg_adr = MIPI_TXm_HS_H_ACTIVEn(ctrl_no, frame_gen);

-:1923: WARNING:TYPO_SPELLING: 'WIDTHn' may be misspelled - perhaps 'Width'?
#1923: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:658:
+	reg_adr = MIPI_TXm_HS_LLP_HSYNC_WIDTHn(ctrl_no, frame_gen);

-:1923: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_LLP_HSYNC_WIDTHn>
#1923: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:658:
+	reg_adr = MIPI_TXm_HS_LLP_HSYNC_WIDTHn(ctrl_no, frame_gen);

-:1927: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_LLP_H_BACKPORCHn>
#1927: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:662:
+	reg_adr = MIPI_TXm_HS_LLP_H_BACKPORCHn(ctrl_no, frame_gen);

-:1931: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_LLP_H_FRONTPORCHn>
#1931: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:666:
+	reg_adr = MIPI_TXm_HS_LLP_H_FRONTPORCHn(ctrl_no, frame_gen);

-:1947: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "fg_cfg->sections[i]"
#1947: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:682:
+		if (fg_cfg->sections[i] != NULL)

-:1995: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_MC_FIFO_CTRL_EN>
#1995: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:730:
+	kmb_set_bit_mipi(kmb, MIPI_TXm_HS_MC_FIFO_CTRL_EN(ctrl_no),

-:2052: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_SYNC_CFG>
#2052: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:787:
+	kmb_write_mipi(kmb, MIPI_TXm_HS_SYNC_CFG(ctrl_no), sync_cfg);

-:2053: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_CTRL>
#2053: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:788:
+	kmb_write_mipi(kmb, MIPI_TXm_HS_CTRL(ctrl_no), ctrl);

-:2064: CHECK:CAMELCASE: Avoid CamelCase: <TP_SEL_VCm>
#2064: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:799:
+	val = TP_SEL_VCm(vc, tp_sel);

-:2067: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_TEST_PAT_COLOR0>
#2067: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:802:
+	kmb_write_mipi(kmb, MIPI_TXm_HS_TEST_PAT_COLOR0(ctrl_no), color0);

-:2068: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_TEST_PAT_COLOR1>
#2068: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:803:
+	kmb_write_mipi(kmb, MIPI_TXm_HS_TEST_PAT_COLOR1(ctrl_no), color1);

-:2071: CHECK:CAMELCASE: Avoid CamelCase: <TP_EN_VCm>
#2071: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:806:
+	val |= TP_EN_VCm(vc);

-:2072: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_TEST_PAT_CTRL>
#2072: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:807:
+	kmb_write_mipi(kmb, MIPI_TXm_HS_TEST_PAT_CTRL(ctrl_no), val);

-:2074: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#2074: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:809:
+
+}

-:2099: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!frame"
#2099: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:834:
+		if (frame == NULL)

-:2107: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!frame->sections[sect]"
#2107: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:842:
+			if (frame->sections[sect] == NULL)

-:2117: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#2117: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:852:
+
+		}

-:2146: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2146: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:881:
+	drm_dbg(&kmb->drm, "IRQ_STATUS = 0x%x\n",
+		  GET_MIPI_TX_HS_IRQ_STATUS(kmb, MIPI_CTRL6));

-:2259: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#2259: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:994:
+		reg_rd_data = kmb_read_mipi(kmb, DPHY_TEST_DOUT0_3);

-:2261: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#2261: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:996:
+		reg_rd_data = kmb_read_mipi(kmb, DPHY_TEST_DOUT4_7);

-:2263: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#2263: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:998:
+		reg_rd_data = kmb_read_mipi(kmb, DPHY_TEST_DOUT8_9);

-:2338: CHECK:SPACING: spaces preferred around that '*' (ctx:ExV)
#2338: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1073:
+							      *kmb,
 							      ^

-:2351: CHECK:SPACING: spaces preferred around that '*' (ctx:ExV)
#2351: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1086:
+							     *kmb,
 							     ^

-:2518: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#2518: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1253:
+		 kmb_read_mipi(kmb, DPHY_TEST_DOUT4_7));

-:2518: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2518: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1253:
+	drm_dbg(&kmb->drm, "dphy %d fsm_state = 0%x\n", dphy_no,
+		 kmb_read_mipi(kmb, DPHY_TEST_DOUT4_7));

-:2530: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2530: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1265:
+	drm_info(&kmb->drm,
+		"dphy=%d mode=%d active_lanes=%d\n", dphy_no, mode,

-:2533: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2533: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1268:
+	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
+		  kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));

-:2557: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2557: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1292:
+	drm_dbg(&kmb->drm, "DPHY_TEST_CTRL0=0x%x\n",
+		  kmb_read_mipi(kmb, DPHY_TEST_CTRL0));

-:2658: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#2658: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1393:
+
+	}

-:2665: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2665: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1400:
+	drm_dbg(&kmb->drm, "DPHY_FREQ = 0x%x\n",
+		 kmb_read_mipi(kmb, DPHY_FREQ_CTRL0_3 + 4));

-:2667: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2667: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1402:
+	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
+		  kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));

-:2673: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2673: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1408:
+	drm_dbg(&kmb->drm, "DPHY_CFG_CLK_EN = 0x%x\n",
+		 kmb_read_mipi(kmb, DPHY_CFG_CLK_EN));

-:2694: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2694: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1429:
+		drm_dbg(&kmb->drm, "DPHY_INIT_CTRL1 = 0x%x\n",
+			 kmb_read_mipi(kmb, DPHY_INIT_CTRL1));

-:2698: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2698: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1433:
+	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
+		  kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));

-:2739: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2739: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1474:
+	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
+		  kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));

-:2751: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2751: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1486:
+	drm_dbg(&kmb->drm, "DPHY_INIT_CTRL2 = 0x%x\n",
+		 kmb_read_mipi(kmb, DPHY_INIT_CTRL2));

-:2764: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2764: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1499:
+	drm_dbg(&kmb->drm, "MIPI_DPHY_STAT0_4_7 = 0x%x)\n",
+		 kmb_read_mipi(kmb, MIPI_DPHY_STAT4_7));

-:2771: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2771: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1506:
+	drm_dbg(&kmb->drm, "DPHY_INIT_CTRL0 = 0x%x\n",
+		 kmb_read_mipi(kmb, DPHY_INIT_CTRL0));

-:2784: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#2784: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1519:
+		val = GET_TEST_DOUT4_7(kmb, dphy_no);

-:2806: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2806: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1541:
+	drm_dbg(&kmb->drm, "dphy=%d active_lanes=%d data_lanes=%d\n", dphy_no,
+		 active_lanes, data_lanes);

-:2819: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2819: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1554:
+			drm_info(&kmb->drm,
+				"! WAIT_INIT_DONE: TIMING OUT!(err_stat=%d)",

-:2878: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2878: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1613:
+	drm_info(&kmb->drm,
+		"active_lanes=%d lane_rate=%d\n", cfg->active_lanes,

-:2945: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "mode"
#2945: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1680:
+	if (mode != NULL) {

-:2964: CHECK:SPACING: No space is necessary after a cast
#2964: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1699:
+		data_rate = ((((u32) mode->crtc_vtotal *

-:2965: CHECK:SPACING: No space is necessary after a cast
#2965: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1700:
+				(u32) mode->crtc_htotal) *

-:2974: CHECK:SPACING: No space is necessary after a cast
#2974: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1709:
+			 (u32) data_rate, mipi_tx_init_cfg.active_lanes);

-:2986: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2986: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1721:
+		drm_info(&kmb->drm,
+			"lane rate=%d\n", mipi_tx_init_cfg.lane_rate_mbps);

-:2988: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2988: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1723:
+		drm_dbg(&kmb->drm,
+		     "vfp= %d vbp= %d vsyc_len=%d hfp=%d hbp=%d hsync_len=%d lane-rate=%d",

-:2997: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#2997: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1732:
+
+	}

-:3013: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3013: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1748:
+	drm_dbg(&kmb->drm, "IRQ_STATUS = 0x%x\n",
+		 GET_MIPI_TX_HS_IRQ_STATUS(kmb, MIPI_CTRL6));

-:3022: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3022: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1757:
+	drm_dbg(&kmb->drm, "IRQ_STATUS = 0x%x\n",
+		 GET_MIPI_TX_HS_IRQ_STATUS(kmb, MIPI_CTRL6));

-:3028: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3028: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1763:
+	drm_dbg(&kmb->drm, "MIPI_TXm_HS_CTRL = 0x%x\n",
+		 kmb_read_mipi(kmb, MIPI_TXm_HS_CTRL(6)));

-:3030: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3030: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:1765:
+	drm_dbg(&kmb->drm, "MIPI LOOP BACK = %x\n",
+		 kmb_read_mipi(kmb, MIPI_CTRL_DIG_LOOPBACK));

-:3137: CHECK:BIT_MACRO: Prefer using the BIT macro
#3137: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:32:
+#define   PLL_FEEDBACK_DIVIDER_HIGH			(1 << 7)

-:3139: CHECK:BIT_MACRO: Prefer using the BIT macro
#3139: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:34:
+#define   PLL_N_OVR_EN					(1 << 4)

-:3140: CHECK:BIT_MACRO: Prefer using the BIT macro
#3140: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:35:
+#define   PLL_M_OVR_EN					(1 << 5)

-:3362: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3362: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:257:
+	uint8_t size_constraint_pixels;

-:3363: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3363: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:258:
+	uint8_t size_constraint_bytes;

-:3364: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3364: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:259:
+	uint8_t pixels_per_pclk;

-:3365: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3365: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:260:
+	uint8_t bits_per_pclk;

-:3369: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3369: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:264:
+	uint8_t hfp_blank_en;	/*horizontal front porch blanking enable */

-:3370: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3370: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:265:
+	uint8_t eotp_en;	/*End of transmission packet enable */

-:3372: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3372: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:267:
+	uint8_t lpm_last_vfp_line;

-:3374: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3374: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:269:
+	uint8_t lpm_first_vsa_line;

-:3375: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3375: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:270:
+	uint8_t sync_pulse_eventn;	/*sync type */

-:3376: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3376: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:271:
+	uint8_t hfp_blanking;	/*horizontal front porch blanking mode */

-:3377: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3377: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:272:
+	uint8_t hbp_blanking;	/*horizontal back porch blanking mode */

-:3378: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3378: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:273:
+	uint8_t hsa_blanking;	/*horizontal sync active blanking mode */

-:3379: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3379: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:274:
+	uint8_t v_blanking;	/*vertical timing blanking mode */

-:3383: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3383: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:278:
+	uint32_t dma_v_stride;

-:3384: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#3384: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:279:
+	uint16_t dma_v_scale_cfg;

-:3385: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#3385: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:280:
+	uint16_t width_pixels;

-:3386: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#3386: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:281:
+	uint16_t height_lines;

-:3387: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3387: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:282:
+	uint8_t dma_packed;

-:3388: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3388: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:283:
+	uint8_t bpp;

-:3389: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3389: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:284:
+	uint8_t bpp_unpacked;

-:3390: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3390: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:285:
+	uint8_t dma_h_stride;

-:3391: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3391: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:286:
+	uint8_t data_type;

-:3392: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3392: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:287:
+	uint8_t data_mode;

-:3393: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3393: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:288:
+	uint8_t dma_flip_rotate_sel;

-:3397: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3397: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:292:
+	uint32_t bpp;

-:3398: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3398: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:293:
+	uint32_t lane_rate_mbps;

-:3399: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3399: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:294:
+	uint32_t hsync_width;

-:3400: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3400: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:295:
+	uint32_t h_backporch;

-:3401: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3401: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:296:
+	uint32_t h_frontporch;

-:3402: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3402: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:297:
+	uint32_t h_active;

-:3403: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#3403: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:298:
+	uint16_t vsync_width;

-:3404: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#3404: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:299:
+	uint16_t v_backporch;

-:3405: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#3405: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:300:
+	uint16_t v_frontporch;

-:3406: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#3406: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:301:
+	uint16_t v_active;

-:3407: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3407: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:302:
+	uint8_t active_lanes;

-:3411: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3411: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:306:
+	uint32_t wc;

-:3414: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3414: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:309:
+	uint8_t vchannel;

-:3415: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3415: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:310:
+	uint8_t dma_packed;

-:3420: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3420: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:315:
+	uint32_t hsync_width;	/*in pixels */

-:3421: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3421: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:316:
+	uint32_t h_backporch;	/*in pixels */

-:3422: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3422: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:317:
+	uint32_t h_frontporch;	/*in pixels */

-:3423: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#3423: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:318:
+	uint16_t vsync_width;	/*in lines */

-:3424: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#3424: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:319:
+	uint16_t v_backporch;	/*in lines */

-:3425: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#3425: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:320:
+	uint16_t v_frontporch;	/*in lines */

-:3431: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3431: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:326:
+	uint8_t line_sync_pkt_en;

-:3432: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3432: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:327:
+	uint8_t line_counter_active;

-:3433: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3433: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:328:
+	uint8_t frame_counter_active;

-:3434: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3434: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:329:
+	uint8_t tx_hsclkkidle_cnt;

-:3435: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3435: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:330:
+	uint8_t tx_hsexit_cnt;

-:3436: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3436: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:331:
+	uint8_t tx_crc_en;

-:3437: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3437: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:332:
+	uint8_t tx_hact_wait_stop;

-:3438: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3438: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:333:
+	uint8_t tx_always_use_hact;

-:3439: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3439: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:334:
+	uint8_t tx_wait_trig;

-:3440: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3440: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:335:
+	uint8_t tx_wait_all_sect;

-:3446: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3446: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:341:
+	uint8_t index;

-:3447: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3447: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:342:
+	uint8_t type;		/* controller type : MIPI_DSI */

-:3448: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3448: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:343:
+	uint8_t dir;		/* controller direction : MIPI_TX */

-:3449: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3449: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:344:
+	uint8_t active_lanes;	/* # active lanes per controller 2/4 */

-:3450: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3450: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:345:
+	uint32_t lane_rate_mbps;	/*MBPS */

-:3451: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3451: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:346:
+	uint32_t ref_clk_khz;

-:3452: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3452: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:347:
+	uint32_t cfg_clk_khz;

-:3453: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3453: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:348:
+	uint32_t data_if;	/*MIPI_IF_DMA or MIPI_IF_PARALLEL */

-:3459: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#3459: FILE: drivers/gpu/drm/kmb/kmb_dsi.h:354:
+	uint8_t value;

-:3509: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3509: FILE: drivers/gpu/drm/kmb/kmb_plane.c:28:
+const uint32_t layer_irqs[] = {

-:3658: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3658: FILE: drivers/gpu/drm/kmb/kmb_plane.c:177:
+	DRM_INFO_ONCE("%s : %d format=0x%x val=0x%x\n",
+			 __func__, __LINE__, format, val);

-:3696: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_COEFF11>
#3696: FILE: drivers/gpu/drm/kmb/kmb_plane.c:215:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF11(plane_id), csc_coef_lcd[0]);

-:3697: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_COEFF12>
#3697: FILE: drivers/gpu/drm/kmb/kmb_plane.c:216:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF12(plane_id), csc_coef_lcd[1]);

-:3698: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_COEFF13>
#3698: FILE: drivers/gpu/drm/kmb/kmb_plane.c:217:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF13(plane_id), csc_coef_lcd[2]);

-:3699: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_COEFF21>
#3699: FILE: drivers/gpu/drm/kmb/kmb_plane.c:218:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF21(plane_id), csc_coef_lcd[3]);

-:3700: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_COEFF22>
#3700: FILE: drivers/gpu/drm/kmb/kmb_plane.c:219:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF22(plane_id), csc_coef_lcd[4]);

-:3701: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_COEFF23>
#3701: FILE: drivers/gpu/drm/kmb/kmb_plane.c:220:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF23(plane_id), csc_coef_lcd[5]);

-:3702: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_COEFF31>
#3702: FILE: drivers/gpu/drm/kmb/kmb_plane.c:221:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF31(plane_id), csc_coef_lcd[6]);

-:3703: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_COEFF32>
#3703: FILE: drivers/gpu/drm/kmb/kmb_plane.c:222:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF32(plane_id), csc_coef_lcd[7]);

-:3704: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_COEFF33>
#3704: FILE: drivers/gpu/drm/kmb/kmb_plane.c:223:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF33(plane_id), csc_coef_lcd[8]);

-:3705: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_OFF1>
#3705: FILE: drivers/gpu/drm/kmb/kmb_plane.c:224:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF1(plane_id), csc_coef_lcd[9]);

-:3706: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_OFF2>
#3706: FILE: drivers/gpu/drm/kmb/kmb_plane.c:225:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF2(plane_id), csc_coef_lcd[10]);

-:3707: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CSC_OFF3>
#3707: FILE: drivers/gpu/drm/kmb/kmb_plane.c:226:
+	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF3(plane_id), csc_coef_lcd[11]);

-:3756: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_LEN>
#3756: FILE: drivers/gpu/drm/kmb/kmb_plane.c:275:
+	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN(plane_id), dma_len);

-:3757: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_LEN_SHADOW>
#3757: FILE: drivers/gpu/drm/kmb/kmb_plane.c:276:
+	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN_SHADOW(plane_id), dma_len);

-:3758: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_LINE_VSTRIDE>
#3758: FILE: drivers/gpu/drm/kmb/kmb_plane.c:277:
+	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),

-:3760: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_LINE_WIDTH>
#3760: FILE: drivers/gpu/drm/kmb/kmb_plane.c:279:
+	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),

-:3765: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_START_ADDR>
#3765: FILE: drivers/gpu/drm/kmb/kmb_plane.c:284:
+	kmb_write_lcd(kmb, LCD_LAYERn_DMA_START_ADDR(plane_id),

-:3771: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_CB_LINE_VSTRIDE>
#3771: FILE: drivers/gpu/drm/kmb/kmb_plane.c:290:
+		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),

-:3772: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3772: FILE: drivers/gpu/drm/kmb/kmb_plane.c:291:
+		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
+				width*fb->format->cpp[0]);

-:3772: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#3772: FILE: drivers/gpu/drm/kmb/kmb_plane.c:291:
+				width*fb->format->cpp[0]);
 				     ^

-:3773: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_CB_LINE_WIDTH>
#3773: FILE: drivers/gpu/drm/kmb/kmb_plane.c:292:
+		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),

-:3777: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3777: FILE: drivers/gpu/drm/kmb/kmb_plane.c:296:
+		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state,
+				U_PLANE);

-:3779: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'num_planes == 3'
#3779: FILE: drivers/gpu/drm/kmb/kmb_plane.c:298:
+		if ((num_planes == 3) && (val & LCD_LAYER_CRCB_ORDER))

-:3781: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3781: FILE: drivers/gpu/drm/kmb/kmb_plane.c:300:
+			kmb_write_lcd(kmb,
+					LCD_LAYERn_DMA_START_CR_ADR(plane_id),

-:3781: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_START_CR_ADR>
#3781: FILE: drivers/gpu/drm/kmb/kmb_plane.c:300:
+					LCD_LAYERn_DMA_START_CR_ADR(plane_id),

-:3785: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3785: FILE: drivers/gpu/drm/kmb/kmb_plane.c:304:
+			kmb_write_lcd(kmb,
+					LCD_LAYERn_DMA_START_CB_ADR(plane_id),

-:3785: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_START_CB_ADR>
#3785: FILE: drivers/gpu/drm/kmb/kmb_plane.c:304:
+					LCD_LAYERn_DMA_START_CB_ADR(plane_id),

-:3790: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3790: FILE: drivers/gpu/drm/kmb/kmb_plane.c:309:
+			kmb_write_lcd(kmb,
+				LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),

-:3790: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_CR_LINE_VSTRIDE>
#3790: FILE: drivers/gpu/drm/kmb/kmb_plane.c:309:
+				LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),

-:3791: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#3791: FILE: drivers/gpu/drm/kmb/kmb_plane.c:310:
+				((width)*fb->format->cpp[0]));
 				        ^

-:3794: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3794: FILE: drivers/gpu/drm/kmb/kmb_plane.c:313:
+			kmb_write_lcd(kmb,
+				LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),

-:3794: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_CR_LINE_WIDTH>
#3794: FILE: drivers/gpu/drm/kmb/kmb_plane.c:313:
+				LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),

-:3795: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#3795: FILE: drivers/gpu/drm/kmb/kmb_plane.c:314:
+				((width)*fb->format->cpp[0]));
 				        ^

-:3798: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3798: FILE: drivers/gpu/drm/kmb/kmb_plane.c:317:
+			addr[V_PLANE] = drm_fb_cma_get_gem_addr(fb,
+					plane->state, V_PLANE);

-:3803: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3803: FILE: drivers/gpu/drm/kmb/kmb_plane.c:322:
+				kmb_write_lcd(kmb,
+					LCD_LAYERn_DMA_START_CB_ADR(plane_id),

-:3807: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3807: FILE: drivers/gpu/drm/kmb/kmb_plane.c:326:
+				kmb_write_lcd(kmb,
+					LCD_LAYERn_DMA_START_CR_ADR(plane_id),

-:3812: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_WIDTH>
#3812: FILE: drivers/gpu/drm/kmb/kmb_plane.c:331:
+	kmb_write_lcd(kmb, LCD_LAYERn_WIDTH(plane_id), src_w - 1);

-:3813: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_HEIGHT>
#3813: FILE: drivers/gpu/drm/kmb/kmb_plane.c:332:
+	kmb_write_lcd(kmb, LCD_LAYERn_HEIGHT(plane_id), src_h - 1);

-:3814: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_COL_START>
#3814: FILE: drivers/gpu/drm/kmb/kmb_plane.c:333:
+	kmb_write_lcd(kmb, LCD_LAYERn_COL_START(plane_id), crtc_x);

-:3815: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_ROW_START>
#3815: FILE: drivers/gpu/drm/kmb/kmb_plane.c:334:
+	kmb_write_lcd(kmb, LCD_LAYERn_ROW_START(plane_id), crtc_y);

-:3826: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CFG>
#3826: FILE: drivers/gpu/drm/kmb/kmb_plane.c:345:
+	kmb_write_lcd(kmb, LCD_LAYERn_CFG(plane_id), val);

-:3869: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3869: FILE: drivers/gpu/drm/kmb/kmb_plane.c:388:
+	drm_dbg(&kmb->drm, "dma_cfg=0x%x LCD_DMA_CFG=0x%x\n", dma_cfg,
+		  kmb_read_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id)));

-:3951: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#3951: FILE: drivers/gpu/drm/kmb/kmb_plane.c:470:
+	const uint32_t *plane_formats;

-:3978: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3978: FILE: drivers/gpu/drm/kmb/kmb_plane.c:497:
+			drm_err(drm, "drm_universal_plane_init failed (ret=%d)",
+				  ret);

-:3982: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3982: FILE: drivers/gpu/drm/kmb/kmb_plane.c:501:
+		drm_dbg(drm, "%s : %d i=%d type=%d",
+			  __func__, __LINE__,

-:3991: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#3991: FILE: drivers/gpu/drm/kmb/kmb_plane.c:510:
+		drm_dbg(drm, "%s : %d primary=%p\n", __func__, __LINE__,
+			  &primary->base_plane);

-:4160: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4160: FILE: drivers/gpu/drm/kmb/kmb_regs.h:25:
+#define LCD_CTRL_PROGRESSIVE			  (0<<0)
                             			    ^

-:4161: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4161: FILE: drivers/gpu/drm/kmb/kmb_regs.h:26:
+#define LCD_CTRL_INTERLACED			  (1<<0)
                            			    ^

-:4161: CHECK:BIT_MACRO: Prefer using the BIT macro
#4161: FILE: drivers/gpu/drm/kmb/kmb_regs.h:26:
+#define LCD_CTRL_INTERLACED			  (1<<0)

-:4162: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4162: FILE: drivers/gpu/drm/kmb/kmb_regs.h:27:
+#define LCD_CTRL_ENABLE				  (1<<1)
                        				    ^

-:4162: CHECK:BIT_MACRO: Prefer using the BIT macro
#4162: FILE: drivers/gpu/drm/kmb/kmb_regs.h:27:
+#define LCD_CTRL_ENABLE				  (1<<1)

-:4163: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4163: FILE: drivers/gpu/drm/kmb/kmb_regs.h:28:
+#define LCD_CTRL_VL1_ENABLE			  (1<<2)
                            			    ^

-:4163: CHECK:BIT_MACRO: Prefer using the BIT macro
#4163: FILE: drivers/gpu/drm/kmb/kmb_regs.h:28:
+#define LCD_CTRL_VL1_ENABLE			  (1<<2)

-:4164: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4164: FILE: drivers/gpu/drm/kmb/kmb_regs.h:29:
+#define LCD_CTRL_VL2_ENABLE			  (1<<3)
                            			    ^

-:4164: CHECK:BIT_MACRO: Prefer using the BIT macro
#4164: FILE: drivers/gpu/drm/kmb/kmb_regs.h:29:
+#define LCD_CTRL_VL2_ENABLE			  (1<<3)

-:4165: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4165: FILE: drivers/gpu/drm/kmb/kmb_regs.h:30:
+#define LCD_CTRL_GL1_ENABLE			  (1<<4)
                            			    ^

-:4165: CHECK:BIT_MACRO: Prefer using the BIT macro
#4165: FILE: drivers/gpu/drm/kmb/kmb_regs.h:30:
+#define LCD_CTRL_GL1_ENABLE			  (1<<4)

-:4166: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4166: FILE: drivers/gpu/drm/kmb/kmb_regs.h:31:
+#define LCD_CTRL_GL2_ENABLE			  (1<<5)
                            			    ^

-:4166: CHECK:BIT_MACRO: Prefer using the BIT macro
#4166: FILE: drivers/gpu/drm/kmb/kmb_regs.h:31:
+#define LCD_CTRL_GL2_ENABLE			  (1<<5)

-:4167: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4167: FILE: drivers/gpu/drm/kmb/kmb_regs.h:32:
+#define LCD_CTRL_ALPHA_BLEND_VL1		  (0<<6)
                                 		    ^

-:4168: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4168: FILE: drivers/gpu/drm/kmb/kmb_regs.h:33:
+#define LCD_CTRL_ALPHA_BLEND_VL2		  (1<<6)
                                 		    ^

-:4168: CHECK:BIT_MACRO: Prefer using the BIT macro
#4168: FILE: drivers/gpu/drm/kmb/kmb_regs.h:33:
+#define LCD_CTRL_ALPHA_BLEND_VL2		  (1<<6)

-:4169: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4169: FILE: drivers/gpu/drm/kmb/kmb_regs.h:34:
+#define LCD_CTRL_ALPHA_BLEND_GL1		  (2<<6)
                                 		    ^

-:4170: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4170: FILE: drivers/gpu/drm/kmb/kmb_regs.h:35:
+#define LCD_CTRL_ALPHA_BLEND_GL2		  (3<<6)
                                 		    ^

-:4171: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4171: FILE: drivers/gpu/drm/kmb/kmb_regs.h:36:
+#define LCD_CTRL_ALPHA_TOP_VL1			  (0<<8)
                               			    ^

-:4172: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4172: FILE: drivers/gpu/drm/kmb/kmb_regs.h:37:
+#define LCD_CTRL_ALPHA_TOP_VL2			  (1<<8)
                               			    ^

-:4172: CHECK:BIT_MACRO: Prefer using the BIT macro
#4172: FILE: drivers/gpu/drm/kmb/kmb_regs.h:37:
+#define LCD_CTRL_ALPHA_TOP_VL2			  (1<<8)

-:4173: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4173: FILE: drivers/gpu/drm/kmb/kmb_regs.h:38:
+#define LCD_CTRL_ALPHA_TOP_GL1			  (2<<8)
                               			    ^

-:4174: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4174: FILE: drivers/gpu/drm/kmb/kmb_regs.h:39:
+#define LCD_CTRL_ALPHA_TOP_GL2			  (3<<8)
                               			    ^

-:4175: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4175: FILE: drivers/gpu/drm/kmb/kmb_regs.h:40:
+#define LCD_CTRL_ALPHA_MIDDLE_VL1		  (0<<10)
                                  		    ^

-:4176: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4176: FILE: drivers/gpu/drm/kmb/kmb_regs.h:41:
+#define LCD_CTRL_ALPHA_MIDDLE_VL2		  (1<<10)
                                  		    ^

-:4176: CHECK:BIT_MACRO: Prefer using the BIT macro
#4176: FILE: drivers/gpu/drm/kmb/kmb_regs.h:41:
+#define LCD_CTRL_ALPHA_MIDDLE_VL2		  (1<<10)

-:4177: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4177: FILE: drivers/gpu/drm/kmb/kmb_regs.h:42:
+#define LCD_CTRL_ALPHA_MIDDLE_GL1		  (2<<10)
                                  		    ^

-:4178: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4178: FILE: drivers/gpu/drm/kmb/kmb_regs.h:43:
+#define LCD_CTRL_ALPHA_MIDDLE_GL2		  (3<<10)
                                  		    ^

-:4179: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4179: FILE: drivers/gpu/drm/kmb/kmb_regs.h:44:
+#define LCD_CTRL_ALPHA_BOTTOM_VL1		  (0<<12)
                                  		    ^

-:4180: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4180: FILE: drivers/gpu/drm/kmb/kmb_regs.h:45:
+#define LCD_CTRL_ALPHA_BOTTOM_VL2		  (1<<12)
                                  		    ^

-:4180: CHECK:BIT_MACRO: Prefer using the BIT macro
#4180: FILE: drivers/gpu/drm/kmb/kmb_regs.h:45:
+#define LCD_CTRL_ALPHA_BOTTOM_VL2		  (1<<12)

-:4181: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4181: FILE: drivers/gpu/drm/kmb/kmb_regs.h:46:
+#define LCD_CTRL_ALPHA_BOTTOM_GL1		  (2<<12)
                                  		    ^

-:4182: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4182: FILE: drivers/gpu/drm/kmb/kmb_regs.h:47:
+#define LCD_CTRL_ALPHA_BOTTOM_GL2		  (3<<12)
                                  		    ^

-:4183: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4183: FILE: drivers/gpu/drm/kmb/kmb_regs.h:48:
+#define LCD_CTRL_TIM_GEN_ENABLE			  (1<<14)
                                			    ^

-:4183: CHECK:BIT_MACRO: Prefer using the BIT macro
#4183: FILE: drivers/gpu/drm/kmb/kmb_regs.h:48:
+#define LCD_CTRL_TIM_GEN_ENABLE			  (1<<14)

-:4184: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4184: FILE: drivers/gpu/drm/kmb/kmb_regs.h:49:
+#define LCD_CTRL_CONTINUOUS			  (0<<15)
                            			    ^

-:4185: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4185: FILE: drivers/gpu/drm/kmb/kmb_regs.h:50:
+#define LCD_CTRL_ONE_SHOT			  (1<<15)
                          			    ^

-:4185: CHECK:BIT_MACRO: Prefer using the BIT macro
#4185: FILE: drivers/gpu/drm/kmb/kmb_regs.h:50:
+#define LCD_CTRL_ONE_SHOT			  (1<<15)

-:4186: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4186: FILE: drivers/gpu/drm/kmb/kmb_regs.h:51:
+#define LCD_CTRL_PWM0_EN			  (1<<16)
                         			    ^

-:4186: CHECK:BIT_MACRO: Prefer using the BIT macro
#4186: FILE: drivers/gpu/drm/kmb/kmb_regs.h:51:
+#define LCD_CTRL_PWM0_EN			  (1<<16)

-:4187: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4187: FILE: drivers/gpu/drm/kmb/kmb_regs.h:52:
+#define LCD_CTRL_PWM1_EN			  (1<<17)
                         			    ^

-:4187: CHECK:BIT_MACRO: Prefer using the BIT macro
#4187: FILE: drivers/gpu/drm/kmb/kmb_regs.h:52:
+#define LCD_CTRL_PWM1_EN			  (1<<17)

-:4188: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4188: FILE: drivers/gpu/drm/kmb/kmb_regs.h:53:
+#define LCD_CTRL_PWM2_EN			  (1<<18)
                         			    ^

-:4188: CHECK:BIT_MACRO: Prefer using the BIT macro
#4188: FILE: drivers/gpu/drm/kmb/kmb_regs.h:53:
+#define LCD_CTRL_PWM2_EN			  (1<<18)

-:4189: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4189: FILE: drivers/gpu/drm/kmb/kmb_regs.h:54:
+#define LCD_CTRL_OUTPUT_DISABLED		  (0<<19)
                                 		    ^

-:4190: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4190: FILE: drivers/gpu/drm/kmb/kmb_regs.h:55:
+#define LCD_CTRL_OUTPUT_ENABLED			  (1<<19)
                                			    ^

-:4190: CHECK:BIT_MACRO: Prefer using the BIT macro
#4190: FILE: drivers/gpu/drm/kmb/kmb_regs.h:55:
+#define LCD_CTRL_OUTPUT_ENABLED			  (1<<19)

-:4191: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4191: FILE: drivers/gpu/drm/kmb/kmb_regs.h:56:
+#define LCD_CTRL_BPORCH_ENABLE			  (1<<21)
                               			    ^

-:4191: CHECK:BIT_MACRO: Prefer using the BIT macro
#4191: FILE: drivers/gpu/drm/kmb/kmb_regs.h:56:
+#define LCD_CTRL_BPORCH_ENABLE			  (1<<21)

-:4192: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4192: FILE: drivers/gpu/drm/kmb/kmb_regs.h:57:
+#define LCD_CTRL_FPORCH_ENABLE			  (1<<22)
                               			    ^

-:4192: CHECK:BIT_MACRO: Prefer using the BIT macro
#4192: FILE: drivers/gpu/drm/kmb/kmb_regs.h:57:
+#define LCD_CTRL_FPORCH_ENABLE			  (1<<22)

-:4193: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4193: FILE: drivers/gpu/drm/kmb/kmb_regs.h:58:
+#define LCD_CTRL_PIPELINE_DMA			  (1<<28)
                              			    ^

-:4193: CHECK:BIT_MACRO: Prefer using the BIT macro
#4193: FILE: drivers/gpu/drm/kmb/kmb_regs.h:58:
+#define LCD_CTRL_PIPELINE_DMA			  (1<<28)

-:4194: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4194: FILE: drivers/gpu/drm/kmb/kmb_regs.h:59:
+#define LCD_CTRL_VHSYNC_IDLE_LVL		  (1<<31)
                                 		    ^

-:4194: CHECK:BIT_MACRO: Prefer using the BIT macro
#4194: FILE: drivers/gpu/drm/kmb/kmb_regs.h:59:
+#define LCD_CTRL_VHSYNC_IDLE_LVL		  (1<<31)

-:4198: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4198: FILE: drivers/gpu/drm/kmb/kmb_regs.h:63:
+#define LCD_INT_EOF				  (1<<0)
                    				    ^

-:4198: CHECK:BIT_MACRO: Prefer using the BIT macro
#4198: FILE: drivers/gpu/drm/kmb/kmb_regs.h:63:
+#define LCD_INT_EOF				  (1<<0)

-:4199: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4199: FILE: drivers/gpu/drm/kmb/kmb_regs.h:64:
+#define LCD_INT_LINE_CMP			  (1<<1)
                         			    ^

-:4199: CHECK:BIT_MACRO: Prefer using the BIT macro
#4199: FILE: drivers/gpu/drm/kmb/kmb_regs.h:64:
+#define LCD_INT_LINE_CMP			  (1<<1)

-:4200: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4200: FILE: drivers/gpu/drm/kmb/kmb_regs.h:65:
+#define LCD_INT_VERT_COMP			  (1<<2)
                          			    ^

-:4200: CHECK:BIT_MACRO: Prefer using the BIT macro
#4200: FILE: drivers/gpu/drm/kmb/kmb_regs.h:65:
+#define LCD_INT_VERT_COMP			  (1<<2)

-:4201: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4201: FILE: drivers/gpu/drm/kmb/kmb_regs.h:66:
+#define LAYER0_DMA_DONE				  (1<<3)
                        				    ^

-:4201: CHECK:BIT_MACRO: Prefer using the BIT macro
#4201: FILE: drivers/gpu/drm/kmb/kmb_regs.h:66:
+#define LAYER0_DMA_DONE				  (1<<3)

-:4202: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4202: FILE: drivers/gpu/drm/kmb/kmb_regs.h:67:
+#define LAYER0_DMA_IDLE				  (1<<4)
                        				    ^

-:4202: CHECK:BIT_MACRO: Prefer using the BIT macro
#4202: FILE: drivers/gpu/drm/kmb/kmb_regs.h:67:
+#define LAYER0_DMA_IDLE				  (1<<4)

-:4203: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4203: FILE: drivers/gpu/drm/kmb/kmb_regs.h:68:
+#define LAYER0_DMA_FIFO_OVERFLOW		  (1<<5)
                                 		    ^

-:4203: CHECK:BIT_MACRO: Prefer using the BIT macro
#4203: FILE: drivers/gpu/drm/kmb/kmb_regs.h:68:
+#define LAYER0_DMA_FIFO_OVERFLOW		  (1<<5)

-:4204: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4204: FILE: drivers/gpu/drm/kmb/kmb_regs.h:69:
+#define LAYER0_DMA_FIFO_UNDERFLOW		  (1<<6)
                                  		    ^

-:4204: CHECK:BIT_MACRO: Prefer using the BIT macro
#4204: FILE: drivers/gpu/drm/kmb/kmb_regs.h:69:
+#define LAYER0_DMA_FIFO_UNDERFLOW		  (1<<6)

-:4205: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4205: FILE: drivers/gpu/drm/kmb/kmb_regs.h:70:
+#define LAYER0_DMA_CB_FIFO_OVERFLOW		  (1<<7)
                                    		    ^

-:4205: CHECK:BIT_MACRO: Prefer using the BIT macro
#4205: FILE: drivers/gpu/drm/kmb/kmb_regs.h:70:
+#define LAYER0_DMA_CB_FIFO_OVERFLOW		  (1<<7)

-:4206: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4206: FILE: drivers/gpu/drm/kmb/kmb_regs.h:71:
+#define LAYER0_DMA_CB_FIFO_UNDERFLOW		  (1<<8)
                                     		    ^

-:4206: CHECK:BIT_MACRO: Prefer using the BIT macro
#4206: FILE: drivers/gpu/drm/kmb/kmb_regs.h:71:
+#define LAYER0_DMA_CB_FIFO_UNDERFLOW		  (1<<8)

-:4207: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4207: FILE: drivers/gpu/drm/kmb/kmb_regs.h:72:
+#define LAYER0_DMA_CR_FIFO_OVERFLOW		  (1<<9)
                                    		    ^

-:4207: CHECK:BIT_MACRO: Prefer using the BIT macro
#4207: FILE: drivers/gpu/drm/kmb/kmb_regs.h:72:
+#define LAYER0_DMA_CR_FIFO_OVERFLOW		  (1<<9)

-:4208: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4208: FILE: drivers/gpu/drm/kmb/kmb_regs.h:73:
+#define LAYER0_DMA_CR_FIFO_UNDERFLOW		  (1<<10)
                                     		    ^

-:4208: CHECK:BIT_MACRO: Prefer using the BIT macro
#4208: FILE: drivers/gpu/drm/kmb/kmb_regs.h:73:
+#define LAYER0_DMA_CR_FIFO_UNDERFLOW		  (1<<10)

-:4209: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4209: FILE: drivers/gpu/drm/kmb/kmb_regs.h:74:
+#define LAYER1_DMA_DONE				  (1<<11)
                        				    ^

-:4209: CHECK:BIT_MACRO: Prefer using the BIT macro
#4209: FILE: drivers/gpu/drm/kmb/kmb_regs.h:74:
+#define LAYER1_DMA_DONE				  (1<<11)

-:4210: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4210: FILE: drivers/gpu/drm/kmb/kmb_regs.h:75:
+#define LAYER1_DMA_IDLE				  (1<<12)
                        				    ^

-:4210: CHECK:BIT_MACRO: Prefer using the BIT macro
#4210: FILE: drivers/gpu/drm/kmb/kmb_regs.h:75:
+#define LAYER1_DMA_IDLE				  (1<<12)

-:4211: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4211: FILE: drivers/gpu/drm/kmb/kmb_regs.h:76:
+#define LAYER1_DMA_FIFO_OVERFLOW		  (1<<13)
                                 		    ^

-:4211: CHECK:BIT_MACRO: Prefer using the BIT macro
#4211: FILE: drivers/gpu/drm/kmb/kmb_regs.h:76:
+#define LAYER1_DMA_FIFO_OVERFLOW		  (1<<13)

-:4212: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4212: FILE: drivers/gpu/drm/kmb/kmb_regs.h:77:
+#define LAYER1_DMA_FIFO_UNDERFLOW		  (1<<14)
                                  		    ^

-:4212: CHECK:BIT_MACRO: Prefer using the BIT macro
#4212: FILE: drivers/gpu/drm/kmb/kmb_regs.h:77:
+#define LAYER1_DMA_FIFO_UNDERFLOW		  (1<<14)

-:4213: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4213: FILE: drivers/gpu/drm/kmb/kmb_regs.h:78:
+#define LAYER1_DMA_CB_FIFO_OVERFLOW		  (1<<15)
                                    		    ^

-:4213: CHECK:BIT_MACRO: Prefer using the BIT macro
#4213: FILE: drivers/gpu/drm/kmb/kmb_regs.h:78:
+#define LAYER1_DMA_CB_FIFO_OVERFLOW		  (1<<15)

-:4214: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4214: FILE: drivers/gpu/drm/kmb/kmb_regs.h:79:
+#define LAYER1_DMA_CB_FIFO_UNDERFLOW		  (1<<16)
                                     		    ^

-:4214: CHECK:BIT_MACRO: Prefer using the BIT macro
#4214: FILE: drivers/gpu/drm/kmb/kmb_regs.h:79:
+#define LAYER1_DMA_CB_FIFO_UNDERFLOW		  (1<<16)

-:4215: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4215: FILE: drivers/gpu/drm/kmb/kmb_regs.h:80:
+#define LAYER1_DMA_CR_FIFO_OVERFLOW		  (1<<17)
                                    		    ^

-:4215: CHECK:BIT_MACRO: Prefer using the BIT macro
#4215: FILE: drivers/gpu/drm/kmb/kmb_regs.h:80:
+#define LAYER1_DMA_CR_FIFO_OVERFLOW		  (1<<17)

-:4216: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4216: FILE: drivers/gpu/drm/kmb/kmb_regs.h:81:
+#define LAYER1_DMA_CR_FIFO_UNDERFLOW		  (1<<18)
                                     		    ^

-:4216: CHECK:BIT_MACRO: Prefer using the BIT macro
#4216: FILE: drivers/gpu/drm/kmb/kmb_regs.h:81:
+#define LAYER1_DMA_CR_FIFO_UNDERFLOW		  (1<<18)

-:4217: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4217: FILE: drivers/gpu/drm/kmb/kmb_regs.h:82:
+#define LAYER2_DMA_DONE				  (1<<19)
                        				    ^

-:4217: CHECK:BIT_MACRO: Prefer using the BIT macro
#4217: FILE: drivers/gpu/drm/kmb/kmb_regs.h:82:
+#define LAYER2_DMA_DONE				  (1<<19)

-:4218: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4218: FILE: drivers/gpu/drm/kmb/kmb_regs.h:83:
+#define LAYER2_DMA_IDLE				  (1<<20)
                        				    ^

-:4218: CHECK:BIT_MACRO: Prefer using the BIT macro
#4218: FILE: drivers/gpu/drm/kmb/kmb_regs.h:83:
+#define LAYER2_DMA_IDLE				  (1<<20)

-:4219: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4219: FILE: drivers/gpu/drm/kmb/kmb_regs.h:84:
+#define LAYER2_DMA_FIFO_OVERFLOW		  (1<<21)
                                 		    ^

-:4219: CHECK:BIT_MACRO: Prefer using the BIT macro
#4219: FILE: drivers/gpu/drm/kmb/kmb_regs.h:84:
+#define LAYER2_DMA_FIFO_OVERFLOW		  (1<<21)

-:4220: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4220: FILE: drivers/gpu/drm/kmb/kmb_regs.h:85:
+#define LAYER2_DMA_FIFO_UNDERFLOW		  (1<<22)
                                  		    ^

-:4220: CHECK:BIT_MACRO: Prefer using the BIT macro
#4220: FILE: drivers/gpu/drm/kmb/kmb_regs.h:85:
+#define LAYER2_DMA_FIFO_UNDERFLOW		  (1<<22)

-:4221: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4221: FILE: drivers/gpu/drm/kmb/kmb_regs.h:86:
+#define LAYER3_DMA_DONE				  (1<<23)
                        				    ^

-:4221: CHECK:BIT_MACRO: Prefer using the BIT macro
#4221: FILE: drivers/gpu/drm/kmb/kmb_regs.h:86:
+#define LAYER3_DMA_DONE				  (1<<23)

-:4222: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4222: FILE: drivers/gpu/drm/kmb/kmb_regs.h:87:
+#define LAYER3_DMA_IDLE				  (1<<24)
                        				    ^

-:4222: CHECK:BIT_MACRO: Prefer using the BIT macro
#4222: FILE: drivers/gpu/drm/kmb/kmb_regs.h:87:
+#define LAYER3_DMA_IDLE				  (1<<24)

-:4223: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4223: FILE: drivers/gpu/drm/kmb/kmb_regs.h:88:
+#define LAYER3_DMA_FIFO_OVERFLOW		  (1<<25)
                                 		    ^

-:4223: CHECK:BIT_MACRO: Prefer using the BIT macro
#4223: FILE: drivers/gpu/drm/kmb/kmb_regs.h:88:
+#define LAYER3_DMA_FIFO_OVERFLOW		  (1<<25)

-:4224: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4224: FILE: drivers/gpu/drm/kmb/kmb_regs.h:89:
+#define LAYER3_DMA_FIFO_UNDERFLOW		  (1<<26)
                                  		    ^

-:4224: CHECK:BIT_MACRO: Prefer using the BIT macro
#4224: FILE: drivers/gpu/drm/kmb/kmb_regs.h:89:
+#define LAYER3_DMA_FIFO_UNDERFLOW		  (1<<26)

-:4237: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4237: FILE: drivers/gpu/drm/kmb/kmb_regs.h:102:
+#define LCD_VSTATUS_VERTICAL_STATUS_MASK	  (3<<13)
                                         	    ^

-:4238: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4238: FILE: drivers/gpu/drm/kmb/kmb_regs.h:103:
+#define LCD_VSTATUS_COMPARE_VSYNC		  (0<<13)
                                  		    ^

-:4239: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4239: FILE: drivers/gpu/drm/kmb/kmb_regs.h:104:
+#define LCD_VSTATUS_COMPARE_BACKPORCH		  (1<<13)
                                      		    ^

-:4239: CHECK:BIT_MACRO: Prefer using the BIT macro
#4239: FILE: drivers/gpu/drm/kmb/kmb_regs.h:104:
+#define LCD_VSTATUS_COMPARE_BACKPORCH		  (1<<13)

-:4240: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4240: FILE: drivers/gpu/drm/kmb/kmb_regs.h:105:
+#define LCD_VSTATUS_COMPARE_ACTIVE		  (2<<13)
                                   		    ^

-:4241: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4241: FILE: drivers/gpu/drm/kmb/kmb_regs.h:106:
+#define LCD_VSTATUS_COMPARE_FRONT_PORCH		  (3<<13)
                                        		    ^

-:4256: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4256: FILE: drivers/gpu/drm/kmb/kmb_regs.h:121:
+#define LCD_LAYERn_CFG(N)			(LCD_LAYER0_CFG + (0x400*N))
                          			                        ^

-:4256: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4256: FILE: drivers/gpu/drm/kmb/kmb_regs.h:121:
+#define LCD_LAYERn_CFG(N)			(LCD_LAYER0_CFG + (0x400*N))

-:4257: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4257: FILE: drivers/gpu/drm/kmb/kmb_regs.h:122:
+#define LCD_LAYER_SCALE_H			  (1<<1)
                          			    ^

-:4257: CHECK:BIT_MACRO: Prefer using the BIT macro
#4257: FILE: drivers/gpu/drm/kmb/kmb_regs.h:122:
+#define LCD_LAYER_SCALE_H			  (1<<1)

-:4258: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4258: FILE: drivers/gpu/drm/kmb/kmb_regs.h:123:
+#define LCD_LAYER_SCALE_V			  (1<<2)
                          			    ^

-:4258: CHECK:BIT_MACRO: Prefer using the BIT macro
#4258: FILE: drivers/gpu/drm/kmb/kmb_regs.h:123:
+#define LCD_LAYER_SCALE_V			  (1<<2)

-:4261: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4261: FILE: drivers/gpu/drm/kmb/kmb_regs.h:126:
+#define LCD_LAYER_CSC_EN			  (1<<3)
                         			    ^

-:4261: CHECK:BIT_MACRO: Prefer using the BIT macro
#4261: FILE: drivers/gpu/drm/kmb/kmb_regs.h:126:
+#define LCD_LAYER_CSC_EN			  (1<<3)

-:4262: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4262: FILE: drivers/gpu/drm/kmb/kmb_regs.h:127:
+#define LCD_LAYER_ALPHA_STATIC			  (1<<4)
                               			    ^

-:4262: CHECK:BIT_MACRO: Prefer using the BIT macro
#4262: FILE: drivers/gpu/drm/kmb/kmb_regs.h:127:
+#define LCD_LAYER_ALPHA_STATIC			  (1<<4)

-:4263: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4263: FILE: drivers/gpu/drm/kmb/kmb_regs.h:128:
+#define LCD_LAYER_ALPHA_EMBED			  (1<<5)
                              			    ^

-:4263: CHECK:BIT_MACRO: Prefer using the BIT macro
#4263: FILE: drivers/gpu/drm/kmb/kmb_regs.h:128:
+#define LCD_LAYER_ALPHA_EMBED			  (1<<5)

-:4267: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4267: FILE: drivers/gpu/drm/kmb/kmb_regs.h:132:
+#define LCD_LAYER_ALPHA_PREMULT			  (1<<6)
                                			    ^

-:4267: CHECK:BIT_MACRO: Prefer using the BIT macro
#4267: FILE: drivers/gpu/drm/kmb/kmb_regs.h:132:
+#define LCD_LAYER_ALPHA_PREMULT			  (1<<6)

-:4268: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4268: FILE: drivers/gpu/drm/kmb/kmb_regs.h:133:
+#define LCD_LAYER_INVERT_COL			  (1<<7)
                             			    ^

-:4268: CHECK:BIT_MACRO: Prefer using the BIT macro
#4268: FILE: drivers/gpu/drm/kmb/kmb_regs.h:133:
+#define LCD_LAYER_INVERT_COL			  (1<<7)

-:4269: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4269: FILE: drivers/gpu/drm/kmb/kmb_regs.h:134:
+#define LCD_LAYER_TRANSPARENT_EN		  (1<<8)
                                 		    ^

-:4269: CHECK:BIT_MACRO: Prefer using the BIT macro
#4269: FILE: drivers/gpu/drm/kmb/kmb_regs.h:134:
+#define LCD_LAYER_TRANSPARENT_EN		  (1<<8)

-:4270: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4270: FILE: drivers/gpu/drm/kmb/kmb_regs.h:135:
+#define LCD_LAYER_FORMAT_YCBCR444PLAN		  (0<<9)
                                      		    ^

-:4271: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4271: FILE: drivers/gpu/drm/kmb/kmb_regs.h:136:
+#define LCD_LAYER_FORMAT_YCBCR422PLAN		  (1<<9)
                                      		    ^

-:4271: CHECK:BIT_MACRO: Prefer using the BIT macro
#4271: FILE: drivers/gpu/drm/kmb/kmb_regs.h:136:
+#define LCD_LAYER_FORMAT_YCBCR422PLAN		  (1<<9)

-:4272: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4272: FILE: drivers/gpu/drm/kmb/kmb_regs.h:137:
+#define LCD_LAYER_FORMAT_YCBCR420PLAN		  (2<<9)
                                      		    ^

-:4273: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4273: FILE: drivers/gpu/drm/kmb/kmb_regs.h:138:
+#define LCD_LAYER_FORMAT_RGB888PLAN		  (3<<9)
                                    		    ^

-:4274: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4274: FILE: drivers/gpu/drm/kmb/kmb_regs.h:139:
+#define LCD_LAYER_FORMAT_YCBCR444LIN		  (4<<9)
                                     		    ^

-:4275: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4275: FILE: drivers/gpu/drm/kmb/kmb_regs.h:140:
+#define LCD_LAYER_FORMAT_YCBCR422LIN		  (5<<9)
                                     		    ^

-:4276: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4276: FILE: drivers/gpu/drm/kmb/kmb_regs.h:141:
+#define LCD_LAYER_FORMAT_RGB888			  (6<<9)
                                			    ^

-:4277: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4277: FILE: drivers/gpu/drm/kmb/kmb_regs.h:142:
+#define LCD_LAYER_FORMAT_RGBA8888		  (7<<9)
                                  		    ^

-:4278: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4278: FILE: drivers/gpu/drm/kmb/kmb_regs.h:143:
+#define LCD_LAYER_FORMAT_RGBX8888		  (8<<9)
                                  		    ^

-:4279: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4279: FILE: drivers/gpu/drm/kmb/kmb_regs.h:144:
+#define LCD_LAYER_FORMAT_RGB565			  (9<<9)
                                			    ^

-:4280: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4280: FILE: drivers/gpu/drm/kmb/kmb_regs.h:145:
+#define LCD_LAYER_FORMAT_RGBA1555		  (0xa<<9)
                                  		      ^

-:4281: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4281: FILE: drivers/gpu/drm/kmb/kmb_regs.h:146:
+#define LCD_LAYER_FORMAT_XRGB1555		  (0xb<<9)
                                  		      ^

-:4282: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4282: FILE: drivers/gpu/drm/kmb/kmb_regs.h:147:
+#define LCD_LAYER_FORMAT_RGB444			  (0xc<<9)
                                			      ^

-:4283: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4283: FILE: drivers/gpu/drm/kmb/kmb_regs.h:148:
+#define LCD_LAYER_FORMAT_RGBA4444		  (0xd<<9)
                                  		      ^

-:4284: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4284: FILE: drivers/gpu/drm/kmb/kmb_regs.h:149:
+#define LCD_LAYER_FORMAT_RGBX4444		  (0xe<<9)
                                  		      ^

-:4285: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4285: FILE: drivers/gpu/drm/kmb/kmb_regs.h:150:
+#define LCD_LAYER_FORMAT_RGB332			  (0xf<<9)
                                			      ^

-:4286: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4286: FILE: drivers/gpu/drm/kmb/kmb_regs.h:151:
+#define LCD_LAYER_FORMAT_RGBA3328		  (0x10<<9)
                                  		       ^

-:4287: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4287: FILE: drivers/gpu/drm/kmb/kmb_regs.h:152:
+#define LCD_LAYER_FORMAT_RGBX3328		  (0x11<<9)
                                  		       ^

-:4288: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4288: FILE: drivers/gpu/drm/kmb/kmb_regs.h:153:
+#define LCD_LAYER_FORMAT_CLUT			  (0x12<<9)
                              			       ^

-:4289: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4289: FILE: drivers/gpu/drm/kmb/kmb_regs.h:154:
+#define LCD_LAYER_FORMAT_NV12			  (0x1c<<9)
                              			       ^

-:4290: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4290: FILE: drivers/gpu/drm/kmb/kmb_regs.h:155:
+#define LCD_LAYER_PLANAR_STORAGE		  (1<<14)
                                 		    ^

-:4290: CHECK:BIT_MACRO: Prefer using the BIT macro
#4290: FILE: drivers/gpu/drm/kmb/kmb_regs.h:155:
+#define LCD_LAYER_PLANAR_STORAGE		  (1<<14)

-:4291: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4291: FILE: drivers/gpu/drm/kmb/kmb_regs.h:156:
+#define LCD_LAYER_8BPP				  (0<<15)
                       				    ^

-:4292: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4292: FILE: drivers/gpu/drm/kmb/kmb_regs.h:157:
+#define LCD_LAYER_16BPP				  (1<<15)
                        				    ^

-:4292: CHECK:BIT_MACRO: Prefer using the BIT macro
#4292: FILE: drivers/gpu/drm/kmb/kmb_regs.h:157:
+#define LCD_LAYER_16BPP				  (1<<15)

-:4293: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4293: FILE: drivers/gpu/drm/kmb/kmb_regs.h:158:
+#define LCD_LAYER_24BPP				  (2<<15)
                        				    ^

-:4294: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4294: FILE: drivers/gpu/drm/kmb/kmb_regs.h:159:
+#define LCD_LAYER_32BPP				  (3<<15)
                        				    ^

-:4295: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4295: FILE: drivers/gpu/drm/kmb/kmb_regs.h:160:
+#define LCD_LAYER_Y_ORDER			  (1<<17)
                          			    ^

-:4295: CHECK:BIT_MACRO: Prefer using the BIT macro
#4295: FILE: drivers/gpu/drm/kmb/kmb_regs.h:160:
+#define LCD_LAYER_Y_ORDER			  (1<<17)

-:4296: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4296: FILE: drivers/gpu/drm/kmb/kmb_regs.h:161:
+#define LCD_LAYER_CRCB_ORDER			  (1<<18)
                             			    ^

-:4296: CHECK:BIT_MACRO: Prefer using the BIT macro
#4296: FILE: drivers/gpu/drm/kmb/kmb_regs.h:161:
+#define LCD_LAYER_CRCB_ORDER			  (1<<18)

-:4297: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4297: FILE: drivers/gpu/drm/kmb/kmb_regs.h:162:
+#define LCD_LAYER_BGR_ORDER			  (1<<19)
                            			    ^

-:4297: CHECK:BIT_MACRO: Prefer using the BIT macro
#4297: FILE: drivers/gpu/drm/kmb/kmb_regs.h:162:
+#define LCD_LAYER_BGR_ORDER			  (1<<19)

-:4298: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4298: FILE: drivers/gpu/drm/kmb/kmb_regs.h:163:
+#define LCD_LAYER_LUT_2ENT			  (0<<20)
                           			    ^

-:4299: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4299: FILE: drivers/gpu/drm/kmb/kmb_regs.h:164:
+#define LCD_LAYER_LUT_4ENT			  (1<<20)
                           			    ^

-:4299: CHECK:BIT_MACRO: Prefer using the BIT macro
#4299: FILE: drivers/gpu/drm/kmb/kmb_regs.h:164:
+#define LCD_LAYER_LUT_4ENT			  (1<<20)

-:4300: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4300: FILE: drivers/gpu/drm/kmb/kmb_regs.h:165:
+#define LCD_LAYER_LUT_16ENT			  (2<<20)
                            			    ^

-:4301: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4301: FILE: drivers/gpu/drm/kmb/kmb_regs.h:166:
+#define LCD_LAYER_NO_FLIP			  (0<<22)
                          			    ^

-:4302: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4302: FILE: drivers/gpu/drm/kmb/kmb_regs.h:167:
+#define LCD_LAYER_FLIP_V			  (1<<22)
                         			    ^

-:4302: CHECK:BIT_MACRO: Prefer using the BIT macro
#4302: FILE: drivers/gpu/drm/kmb/kmb_regs.h:167:
+#define LCD_LAYER_FLIP_V			  (1<<22)

-:4303: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4303: FILE: drivers/gpu/drm/kmb/kmb_regs.h:168:
+#define LCD_LAYER_FLIP_H			  (2<<22)
                         			    ^

-:4304: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4304: FILE: drivers/gpu/drm/kmb/kmb_regs.h:169:
+#define LCD_LAYER_ROT_R90			  (3<<22)
                          			    ^

-:4305: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4305: FILE: drivers/gpu/drm/kmb/kmb_regs.h:170:
+#define LCD_LAYER_ROT_L90			  (4<<22)
                          			    ^

-:4306: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4306: FILE: drivers/gpu/drm/kmb/kmb_regs.h:171:
+#define LCD_LAYER_ROT_180			  (5<<22)
                          			    ^

-:4307: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4307: FILE: drivers/gpu/drm/kmb/kmb_regs.h:172:
+#define LCD_LAYER_FIFO_00			  (0<<25)
                          			    ^

-:4308: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4308: FILE: drivers/gpu/drm/kmb/kmb_regs.h:173:
+#define LCD_LAYER_FIFO_25			  (1<<25)
                          			    ^

-:4308: CHECK:BIT_MACRO: Prefer using the BIT macro
#4308: FILE: drivers/gpu/drm/kmb/kmb_regs.h:173:
+#define LCD_LAYER_FIFO_25			  (1<<25)

-:4309: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4309: FILE: drivers/gpu/drm/kmb/kmb_regs.h:174:
+#define LCD_LAYER_FIFO_50			  (2<<25)
                          			    ^

-:4310: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4310: FILE: drivers/gpu/drm/kmb/kmb_regs.h:175:
+#define LCD_LAYER_FIFO_100			  (3<<25)
                           			    ^

-:4311: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4311: FILE: drivers/gpu/drm/kmb/kmb_regs.h:176:
+#define LCD_LAYER_INTERLEAVE_DIS		  (0<<27)
                                 		    ^

-:4312: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4312: FILE: drivers/gpu/drm/kmb/kmb_regs.h:177:
+#define LCD_LAYER_INTERLEAVE_V			  (1<<27)
                               			    ^

-:4312: CHECK:BIT_MACRO: Prefer using the BIT macro
#4312: FILE: drivers/gpu/drm/kmb/kmb_regs.h:177:
+#define LCD_LAYER_INTERLEAVE_V			  (1<<27)

-:4313: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4313: FILE: drivers/gpu/drm/kmb/kmb_regs.h:178:
+#define LCD_LAYER_INTERLEAVE_H			  (2<<27)
                               			    ^

-:4314: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4314: FILE: drivers/gpu/drm/kmb/kmb_regs.h:179:
+#define LCD_LAYER_INTERLEAVE_CH			  (3<<27)
                                			    ^

-:4315: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4315: FILE: drivers/gpu/drm/kmb/kmb_regs.h:180:
+#define LCD_LAYER_INTERLEAVE_V_SUB		  (4<<27)
                                   		    ^

-:4316: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4316: FILE: drivers/gpu/drm/kmb/kmb_regs.h:181:
+#define LCD_LAYER_INTERLEAVE_H_SUB		  (5<<27)
                                   		    ^

-:4317: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4317: FILE: drivers/gpu/drm/kmb/kmb_regs.h:182:
+#define LCD_LAYER_INTERLEAVE_CH_SUB		  (6<<27)
                                    		    ^

-:4318: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4318: FILE: drivers/gpu/drm/kmb/kmb_regs.h:183:
+#define LCD_LAYER_INTER_POS_EVEN		  (0<<30)
                                 		    ^

-:4319: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4319: FILE: drivers/gpu/drm/kmb/kmb_regs.h:184:
+#define LCD_LAYER_INTER_POS_ODD			  (1<<30)
                                			    ^

-:4319: CHECK:BIT_MACRO: Prefer using the BIT macro
#4319: FILE: drivers/gpu/drm/kmb/kmb_regs.h:184:
+#define LCD_LAYER_INTER_POS_ODD			  (1<<30)

-:4322: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4322: FILE: drivers/gpu/drm/kmb/kmb_regs.h:187:
+#define LCD_LAYERn_COL_START(N)		(LCD_LAYER0_COL_START + (0x400*N))
                                		                              ^

-:4322: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4322: FILE: drivers/gpu/drm/kmb/kmb_regs.h:187:
+#define LCD_LAYERn_COL_START(N)		(LCD_LAYER0_COL_START + (0x400*N))

-:4324: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4324: FILE: drivers/gpu/drm/kmb/kmb_regs.h:189:
+#define LCD_LAYERn_ROW_START(N)		(LCD_LAYER0_ROW_START + (0x400*N))
                                		                              ^

-:4324: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4324: FILE: drivers/gpu/drm/kmb/kmb_regs.h:189:
+#define LCD_LAYERn_ROW_START(N)		(LCD_LAYER0_ROW_START + (0x400*N))

-:4326: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4326: FILE: drivers/gpu/drm/kmb/kmb_regs.h:191:
+#define LCD_LAYERn_WIDTH(N)		(LCD_LAYER0_WIDTH + (0x400*N))
                            		                          ^

-:4326: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4326: FILE: drivers/gpu/drm/kmb/kmb_regs.h:191:
+#define LCD_LAYERn_WIDTH(N)		(LCD_LAYER0_WIDTH + (0x400*N))

-:4328: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4328: FILE: drivers/gpu/drm/kmb/kmb_regs.h:193:
+#define LCD_LAYERn_HEIGHT(N)		(LCD_LAYER0_HEIGHT + (0x400*N))
                             		                           ^

-:4328: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4328: FILE: drivers/gpu/drm/kmb/kmb_regs.h:193:
+#define LCD_LAYERn_HEIGHT(N)		(LCD_LAYER0_HEIGHT + (0x400*N))

-:4330: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4330: FILE: drivers/gpu/drm/kmb/kmb_regs.h:195:
+#define LCD_LAYERn_SCALE_CFG(N)		(LCD_LAYER0_SCALE_CFG + (0x400*N))
                                		                              ^

-:4330: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_SCALE_CFG>
#4330: FILE: drivers/gpu/drm/kmb/kmb_regs.h:195:
+#define LCD_LAYERn_SCALE_CFG(N)		(LCD_LAYER0_SCALE_CFG + (0x400*N))

-:4330: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4330: FILE: drivers/gpu/drm/kmb/kmb_regs.h:195:
+#define LCD_LAYERn_SCALE_CFG(N)		(LCD_LAYER0_SCALE_CFG + (0x400*N))

-:4332: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4332: FILE: drivers/gpu/drm/kmb/kmb_regs.h:197:
+#define LCD_LAYERn_ALPHA(N)		(LCD_LAYER0_ALPHA + (0x400*N))
                            		                          ^

-:4332: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_ALPHA>
#4332: FILE: drivers/gpu/drm/kmb/kmb_regs.h:197:
+#define LCD_LAYERn_ALPHA(N)		(LCD_LAYER0_ALPHA + (0x400*N))

-:4332: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4332: FILE: drivers/gpu/drm/kmb/kmb_regs.h:197:
+#define LCD_LAYERn_ALPHA(N)		(LCD_LAYER0_ALPHA + (0x400*N))

-:4334: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4334: FILE: drivers/gpu/drm/kmb/kmb_regs.h:199:
+#define LCD_LAYERn_INV_COLOUR_LS(N)	(LCD_LAYER0_INV_COLOUR_LS + (0x400*N))
                                    	                                  ^

-:4334: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_INV_COLOUR_LS>
#4334: FILE: drivers/gpu/drm/kmb/kmb_regs.h:199:
+#define LCD_LAYERn_INV_COLOUR_LS(N)	(LCD_LAYER0_INV_COLOUR_LS + (0x400*N))

-:4334: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4334: FILE: drivers/gpu/drm/kmb/kmb_regs.h:199:
+#define LCD_LAYERn_INV_COLOUR_LS(N)	(LCD_LAYER0_INV_COLOUR_LS + (0x400*N))

-:4336: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4336: FILE: drivers/gpu/drm/kmb/kmb_regs.h:201:
+#define LCD_LAYERn_INV_COLOUR_MS(N)	(LCD_LAYER0_INV_COLOUR_MS + (0x400*N))
                                    	                                  ^

-:4336: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_INV_COLOUR_MS>
#4336: FILE: drivers/gpu/drm/kmb/kmb_regs.h:201:
+#define LCD_LAYERn_INV_COLOUR_MS(N)	(LCD_LAYER0_INV_COLOUR_MS + (0x400*N))

-:4336: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4336: FILE: drivers/gpu/drm/kmb/kmb_regs.h:201:
+#define LCD_LAYERn_INV_COLOUR_MS(N)	(LCD_LAYER0_INV_COLOUR_MS + (0x400*N))

-:4338: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4338: FILE: drivers/gpu/drm/kmb/kmb_regs.h:203:
+#define LCD_LAYERn_TRANS_COLOUR_LS(N)	(LCD_LAYER0_TRANS_COLOUR_LS + (0x400*N))
                                      	                                    ^

-:4338: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_TRANS_COLOUR_LS>
#4338: FILE: drivers/gpu/drm/kmb/kmb_regs.h:203:
+#define LCD_LAYERn_TRANS_COLOUR_LS(N)	(LCD_LAYER0_TRANS_COLOUR_LS + (0x400*N))

-:4338: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4338: FILE: drivers/gpu/drm/kmb/kmb_regs.h:203:
+#define LCD_LAYERn_TRANS_COLOUR_LS(N)	(LCD_LAYER0_TRANS_COLOUR_LS + (0x400*N))

-:4340: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4340: FILE: drivers/gpu/drm/kmb/kmb_regs.h:205:
+#define LCD_LAYERn_TRANS_COLOUR_MS(N)	(LCD_LAYER0_TRANS_COLOUR_MS + (0x400*N))
                                      	                                    ^

-:4340: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_TRANS_COLOUR_MS>
#4340: FILE: drivers/gpu/drm/kmb/kmb_regs.h:205:
+#define LCD_LAYERn_TRANS_COLOUR_MS(N)	(LCD_LAYER0_TRANS_COLOUR_MS + (0x400*N))

-:4340: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4340: FILE: drivers/gpu/drm/kmb/kmb_regs.h:205:
+#define LCD_LAYERn_TRANS_COLOUR_MS(N)	(LCD_LAYER0_TRANS_COLOUR_MS + (0x400*N))

-:4342: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4342: FILE: drivers/gpu/drm/kmb/kmb_regs.h:207:
+#define LCD_LAYERn_CSC_COEFF11(N)	(LCD_LAYER0_CSC_COEFF11 + (0x400*N))
                                  	                                ^

-:4342: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4342: FILE: drivers/gpu/drm/kmb/kmb_regs.h:207:
+#define LCD_LAYERn_CSC_COEFF11(N)	(LCD_LAYER0_CSC_COEFF11 + (0x400*N))

-:4344: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4344: FILE: drivers/gpu/drm/kmb/kmb_regs.h:209:
+#define LCD_LAYERn_CSC_COEFF12(N)	(LCD_LAYER0_CSC_COEFF12 + (0x400*N))
                                  	                                ^

-:4344: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4344: FILE: drivers/gpu/drm/kmb/kmb_regs.h:209:
+#define LCD_LAYERn_CSC_COEFF12(N)	(LCD_LAYER0_CSC_COEFF12 + (0x400*N))

-:4346: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4346: FILE: drivers/gpu/drm/kmb/kmb_regs.h:211:
+#define LCD_LAYERn_CSC_COEFF13(N)	(LCD_LAYER0_CSC_COEFF13 + (0x400*N))
                                  	                                ^

-:4346: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4346: FILE: drivers/gpu/drm/kmb/kmb_regs.h:211:
+#define LCD_LAYERn_CSC_COEFF13(N)	(LCD_LAYER0_CSC_COEFF13 + (0x400*N))

-:4348: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4348: FILE: drivers/gpu/drm/kmb/kmb_regs.h:213:
+#define LCD_LAYERn_CSC_COEFF21(N)	(LCD_LAYER0_CSC_COEFF21 + (0x400*N))
                                  	                                ^

-:4348: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4348: FILE: drivers/gpu/drm/kmb/kmb_regs.h:213:
+#define LCD_LAYERn_CSC_COEFF21(N)	(LCD_LAYER0_CSC_COEFF21 + (0x400*N))

-:4350: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4350: FILE: drivers/gpu/drm/kmb/kmb_regs.h:215:
+#define LCD_LAYERn_CSC_COEFF22(N)	(LCD_LAYER0_CSC_COEFF22 + (0x400*N))
                                  	                                ^

-:4350: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4350: FILE: drivers/gpu/drm/kmb/kmb_regs.h:215:
+#define LCD_LAYERn_CSC_COEFF22(N)	(LCD_LAYER0_CSC_COEFF22 + (0x400*N))

-:4352: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4352: FILE: drivers/gpu/drm/kmb/kmb_regs.h:217:
+#define LCD_LAYERn_CSC_COEFF23(N)	(LCD_LAYER0_CSC_COEFF23 + (0x400*N))
                                  	                                ^

-:4352: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4352: FILE: drivers/gpu/drm/kmb/kmb_regs.h:217:
+#define LCD_LAYERn_CSC_COEFF23(N)	(LCD_LAYER0_CSC_COEFF23 + (0x400*N))

-:4354: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4354: FILE: drivers/gpu/drm/kmb/kmb_regs.h:219:
+#define LCD_LAYERn_CSC_COEFF31(N)	(LCD_LAYER0_CSC_COEFF31 + (0x400*N))
                                  	                                ^

-:4354: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4354: FILE: drivers/gpu/drm/kmb/kmb_regs.h:219:
+#define LCD_LAYERn_CSC_COEFF31(N)	(LCD_LAYER0_CSC_COEFF31 + (0x400*N))

-:4356: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4356: FILE: drivers/gpu/drm/kmb/kmb_regs.h:221:
+#define LCD_LAYERn_CSC_COEFF32(N)	  (LCD_LAYER0_CSC_COEFF32 + (0x400*N))
                                  	                                  ^

-:4356: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4356: FILE: drivers/gpu/drm/kmb/kmb_regs.h:221:
+#define LCD_LAYERn_CSC_COEFF32(N)	  (LCD_LAYER0_CSC_COEFF32 + (0x400*N))

-:4358: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4358: FILE: drivers/gpu/drm/kmb/kmb_regs.h:223:
+#define LCD_LAYERn_CSC_COEFF33(N)	(LCD_LAYER0_CSC_COEFF33 + (0x400*N))
                                  	                                ^

-:4358: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4358: FILE: drivers/gpu/drm/kmb/kmb_regs.h:223:
+#define LCD_LAYERn_CSC_COEFF33(N)	(LCD_LAYER0_CSC_COEFF33 + (0x400*N))

-:4360: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4360: FILE: drivers/gpu/drm/kmb/kmb_regs.h:225:
+#define LCD_LAYERn_CSC_OFF1(N)		(LCD_LAYER0_CSC_OFF1 + (0x400*N))
                               		                             ^

-:4360: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4360: FILE: drivers/gpu/drm/kmb/kmb_regs.h:225:
+#define LCD_LAYERn_CSC_OFF1(N)		(LCD_LAYER0_CSC_OFF1 + (0x400*N))

-:4362: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4362: FILE: drivers/gpu/drm/kmb/kmb_regs.h:227:
+#define LCD_LAYERn_CSC_OFF2(N)		(LCD_LAYER0_CSC_OFF2 + (0x400*N))
                               		                             ^

-:4362: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4362: FILE: drivers/gpu/drm/kmb/kmb_regs.h:227:
+#define LCD_LAYERn_CSC_OFF2(N)		(LCD_LAYER0_CSC_OFF2 + (0x400*N))

-:4364: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4364: FILE: drivers/gpu/drm/kmb/kmb_regs.h:229:
+#define LCD_LAYERn_CSC_OFF3(N)		(LCD_LAYER0_CSC_OFF3 + (0x400*N))
                               		                             ^

-:4364: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4364: FILE: drivers/gpu/drm/kmb/kmb_regs.h:229:
+#define LCD_LAYERn_CSC_OFF3(N)		(LCD_LAYER0_CSC_OFF3 + (0x400*N))

-:4368: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4368: FILE: drivers/gpu/drm/kmb/kmb_regs.h:233:
+#define LCD_LAYERn_DMA_CFG(N)			(LCD_LAYER0_DMA_CFG + (0x400*N))
                              			                            ^

-:4368: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4368: FILE: drivers/gpu/drm/kmb/kmb_regs.h:233:
+#define LCD_LAYERn_DMA_CFG(N)			(LCD_LAYER0_DMA_CFG + (0x400*N))

-:4369: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4369: FILE: drivers/gpu/drm/kmb/kmb_regs.h:234:
+#define LCD_DMA_LAYER_ENABLE			  (1<<0)
                             			    ^

-:4369: CHECK:BIT_MACRO: Prefer using the BIT macro
#4369: FILE: drivers/gpu/drm/kmb/kmb_regs.h:234:
+#define LCD_DMA_LAYER_ENABLE			  (1<<0)

-:4370: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4370: FILE: drivers/gpu/drm/kmb/kmb_regs.h:235:
+#define LCD_DMA_LAYER_STATUS			  (1<<1)
                             			    ^

-:4370: CHECK:BIT_MACRO: Prefer using the BIT macro
#4370: FILE: drivers/gpu/drm/kmb/kmb_regs.h:235:
+#define LCD_DMA_LAYER_STATUS			  (1<<1)

-:4371: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4371: FILE: drivers/gpu/drm/kmb/kmb_regs.h:236:
+#define LCD_DMA_LAYER_AUTO_UPDATE		  (1<<2)
                                  		    ^

-:4371: CHECK:BIT_MACRO: Prefer using the BIT macro
#4371: FILE: drivers/gpu/drm/kmb/kmb_regs.h:236:
+#define LCD_DMA_LAYER_AUTO_UPDATE		  (1<<2)

-:4372: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4372: FILE: drivers/gpu/drm/kmb/kmb_regs.h:237:
+#define LCD_DMA_LAYER_CONT_UPDATE		  (1<<3)
                                  		    ^

-:4372: CHECK:BIT_MACRO: Prefer using the BIT macro
#4372: FILE: drivers/gpu/drm/kmb/kmb_regs.h:237:
+#define LCD_DMA_LAYER_CONT_UPDATE		  (1<<3)

-:4375: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4375: FILE: drivers/gpu/drm/kmb/kmb_regs.h:240:
+#define LCD_DMA_LAYER_FIFO_ADR_MODE		  (1<<4)
                                    		    ^

-:4375: CHECK:BIT_MACRO: Prefer using the BIT macro
#4375: FILE: drivers/gpu/drm/kmb/kmb_regs.h:240:
+#define LCD_DMA_LAYER_FIFO_ADR_MODE		  (1<<4)

-:4376: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4376: FILE: drivers/gpu/drm/kmb/kmb_regs.h:241:
+#define LCD_DMA_LAYER_AXI_BURST_1		  (1<<5)
                                  		    ^

-:4376: CHECK:BIT_MACRO: Prefer using the BIT macro
#4376: FILE: drivers/gpu/drm/kmb/kmb_regs.h:241:
+#define LCD_DMA_LAYER_AXI_BURST_1		  (1<<5)

-:4377: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4377: FILE: drivers/gpu/drm/kmb/kmb_regs.h:242:
+#define LCD_DMA_LAYER_AXI_BURST_2		  (2<<5)
                                  		    ^

-:4378: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4378: FILE: drivers/gpu/drm/kmb/kmb_regs.h:243:
+#define LCD_DMA_LAYER_AXI_BURST_3		  (3<<5)
                                  		    ^

-:4379: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4379: FILE: drivers/gpu/drm/kmb/kmb_regs.h:244:
+#define LCD_DMA_LAYER_AXI_BURST_4		  (4<<5)
                                  		    ^

-:4380: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4380: FILE: drivers/gpu/drm/kmb/kmb_regs.h:245:
+#define LCD_DMA_LAYER_AXI_BURST_5		  (5<<5)
                                  		    ^

-:4381: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4381: FILE: drivers/gpu/drm/kmb/kmb_regs.h:246:
+#define LCD_DMA_LAYER_AXI_BURST_6		  (6<<5)
                                  		    ^

-:4382: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4382: FILE: drivers/gpu/drm/kmb/kmb_regs.h:247:
+#define LCD_DMA_LAYER_AXI_BURST_7		  (7<<5)
                                  		    ^

-:4383: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4383: FILE: drivers/gpu/drm/kmb/kmb_regs.h:248:
+#define LCD_DMA_LAYER_AXI_BURST_8		  (8<<5)
                                  		    ^

-:4384: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4384: FILE: drivers/gpu/drm/kmb/kmb_regs.h:249:
+#define LCD_DMA_LAYER_AXI_BURST_9		  (9<<5)
                                  		    ^

-:4385: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4385: FILE: drivers/gpu/drm/kmb/kmb_regs.h:250:
+#define LCD_DMA_LAYER_AXI_BURST_10		  (0xa<<5)
                                   		      ^

-:4386: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4386: FILE: drivers/gpu/drm/kmb/kmb_regs.h:251:
+#define LCD_DMA_LAYER_AXI_BURST_11		  (0xb<<5)
                                   		      ^

-:4387: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4387: FILE: drivers/gpu/drm/kmb/kmb_regs.h:252:
+#define LCD_DMA_LAYER_AXI_BURST_12		  (0xc<<5)
                                   		      ^

-:4388: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4388: FILE: drivers/gpu/drm/kmb/kmb_regs.h:253:
+#define LCD_DMA_LAYER_AXI_BURST_13		  (0xd<<5)
                                   		      ^

-:4389: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4389: FILE: drivers/gpu/drm/kmb/kmb_regs.h:254:
+#define LCD_DMA_LAYER_AXI_BURST_14		  (0xe<<5)
                                   		      ^

-:4390: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4390: FILE: drivers/gpu/drm/kmb/kmb_regs.h:255:
+#define LCD_DMA_LAYER_AXI_BURST_15		  (0xf<<5)
                                   		      ^

-:4391: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4391: FILE: drivers/gpu/drm/kmb/kmb_regs.h:256:
+#define LCD_DMA_LAYER_AXI_BURST_16		  (0x10<<5)
                                   		       ^

-:4392: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4392: FILE: drivers/gpu/drm/kmb/kmb_regs.h:257:
+#define LCD_DMA_LAYER_VSTRIDE_EN		  (1<<10)
                                 		    ^

-:4392: CHECK:BIT_MACRO: Prefer using the BIT macro
#4392: FILE: drivers/gpu/drm/kmb/kmb_regs.h:257:
+#define LCD_DMA_LAYER_VSTRIDE_EN		  (1<<10)

-:4395: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4395: FILE: drivers/gpu/drm/kmb/kmb_regs.h:260:
+#define LCD_LAYERn_DMA_START_ADDR(N)		(LCD_LAYER0_DMA_START_ADR \
+						+ (0x400*N))

-:4396: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4396: FILE: drivers/gpu/drm/kmb/kmb_regs.h:261:
+						+ (0x400*N))
 						        ^

-:4398: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_START_SHADOW>
#4398: FILE: drivers/gpu/drm/kmb/kmb_regs.h:263:
+#define LCD_LAYERn_DMA_START_SHADOW(N)		(LCD_LAYER0_DMA_START_SHADOW \

-:4398: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4398: FILE: drivers/gpu/drm/kmb/kmb_regs.h:263:
+#define LCD_LAYERn_DMA_START_SHADOW(N)		(LCD_LAYER0_DMA_START_SHADOW \
+						+ (0x400*N))

-:4399: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4399: FILE: drivers/gpu/drm/kmb/kmb_regs.h:264:
+						+ (0x400*N))
 						        ^

-:4401: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4401: FILE: drivers/gpu/drm/kmb/kmb_regs.h:266:
+#define LCD_LAYERn_DMA_LEN(N)			(LCD_LAYER0_DMA_LEN + \
+						(0x400*N))

-:4402: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4402: FILE: drivers/gpu/drm/kmb/kmb_regs.h:267:
+						(0x400*N))
 						      ^

-:4404: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4404: FILE: drivers/gpu/drm/kmb/kmb_regs.h:269:
+#define LCD_LAYERn_DMA_LEN_SHADOW(N)		(LCD_LAYER0_DMA_LEN_SHADOW + \
+						(0x400*N))

-:4405: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4405: FILE: drivers/gpu/drm/kmb/kmb_regs.h:270:
+						(0x400*N))
 						      ^

-:4407: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_STATUS>
#4407: FILE: drivers/gpu/drm/kmb/kmb_regs.h:272:
+#define LCD_LAYERn_DMA_STATUS(N)		(LCD_LAYER0_DMA_STATUS + \

-:4407: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4407: FILE: drivers/gpu/drm/kmb/kmb_regs.h:272:
+#define LCD_LAYERn_DMA_STATUS(N)		(LCD_LAYER0_DMA_STATUS + \
+						(0x400*N))

-:4408: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4408: FILE: drivers/gpu/drm/kmb/kmb_regs.h:273:
+						(0x400*N))
 						      ^

-:4410: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4410: FILE: drivers/gpu/drm/kmb/kmb_regs.h:275:
+#define LCD_LAYERn_DMA_LINE_WIDTH(N)		(LCD_LAYER0_DMA_LINE_WIDTH + \
+						(0x400*N))

-:4411: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4411: FILE: drivers/gpu/drm/kmb/kmb_regs.h:276:
+						(0x400*N))
 						      ^

-:4413: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4413: FILE: drivers/gpu/drm/kmb/kmb_regs.h:278:
+#define LCD_LAYERn_DMA_LINE_VSTRIDE(N)		(LCD_LAYER0_DMA_LINE_VSTRIDE +\
+						(0x400*N))

-:4414: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4414: FILE: drivers/gpu/drm/kmb/kmb_regs.h:279:
+						(0x400*N))
 						      ^

-:4416: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_FIFO_STATUS>
#4416: FILE: drivers/gpu/drm/kmb/kmb_regs.h:281:
+#define LCD_LAYERn_DMA_FIFO_STATUS(N)		(LCD_LAYER0_DMA_FIFO_STATUS + \

-:4416: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4416: FILE: drivers/gpu/drm/kmb/kmb_regs.h:281:
+#define LCD_LAYERn_DMA_FIFO_STATUS(N)		(LCD_LAYER0_DMA_FIFO_STATUS + \
+						(0x400*N))

-:4417: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4417: FILE: drivers/gpu/drm/kmb/kmb_regs.h:282:
+						(0x400*N))
 						      ^

-:4419: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4419: FILE: drivers/gpu/drm/kmb/kmb_regs.h:284:
+#define LCD_LAYERn_CFG2(N)			(LCD_LAYER0_CFG2 + (0x400*N))
                           			                         ^

-:4419: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_CFG2>
#4419: FILE: drivers/gpu/drm/kmb/kmb_regs.h:284:
+#define LCD_LAYERn_CFG2(N)			(LCD_LAYER0_CFG2 + (0x400*N))

-:4419: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4419: FILE: drivers/gpu/drm/kmb/kmb_regs.h:284:
+#define LCD_LAYERn_CFG2(N)			(LCD_LAYER0_CFG2 + (0x400*N))

-:4421: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4421: FILE: drivers/gpu/drm/kmb/kmb_regs.h:286:
+#define LCD_LAYERn_DMA_START_CB_ADR(N)		(LCD_LAYER0_DMA_START_CB_ADR + \
+						(0x20*N))

-:4422: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4422: FILE: drivers/gpu/drm/kmb/kmb_regs.h:287:
+						(0x20*N))
 						     ^

-:4424: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_START_CB_SHADOW>
#4424: FILE: drivers/gpu/drm/kmb/kmb_regs.h:289:
+#define LCD_LAYERn_DMA_START_CB_SHADOW(N)	(LCD_LAYER0_DMA_START_CB_SHADOW\

-:4424: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4424: FILE: drivers/gpu/drm/kmb/kmb_regs.h:289:
+#define LCD_LAYERn_DMA_START_CB_SHADOW(N)	(LCD_LAYER0_DMA_START_CB_SHADOW\
+						+ (0x20*N))

-:4425: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4425: FILE: drivers/gpu/drm/kmb/kmb_regs.h:290:
+						+ (0x20*N))
 						       ^

-:4427: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4427: FILE: drivers/gpu/drm/kmb/kmb_regs.h:292:
+#define LCD_LAYERn_DMA_CB_LINE_WIDTH(N)		(LCD_LAYER0_DMA_CB_LINE_WIDTH +\
+						(0x20*N))

-:4428: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4428: FILE: drivers/gpu/drm/kmb/kmb_regs.h:293:
+						(0x20*N))
 						     ^

-:4430: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4430: FILE: drivers/gpu/drm/kmb/kmb_regs.h:295:
+#define LCD_LAYERn_DMA_CB_LINE_VSTRIDE(N)	(LCD_LAYER0_DMA_CB_LINE_VSTRIDE\
+						+ (0x20*N))

-:4431: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4431: FILE: drivers/gpu/drm/kmb/kmb_regs.h:296:
+						+ (0x20*N))
 						       ^

-:4433: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4433: FILE: drivers/gpu/drm/kmb/kmb_regs.h:298:
+#define LCD_LAYERn_DMA_START_CR_ADR(N)		(LCD_LAYER0_DMA_START_CR_ADR + \
+						(0x20*N))

-:4434: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4434: FILE: drivers/gpu/drm/kmb/kmb_regs.h:299:
+						(0x20*N))
 						     ^

-:4436: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_START_CR_SHADOW>
#4436: FILE: drivers/gpu/drm/kmb/kmb_regs.h:301:
+#define LCD_LAYERn_DMA_START_CR_SHADOW(N)	\

-:4436: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4436: FILE: drivers/gpu/drm/kmb/kmb_regs.h:301:
+#define LCD_LAYERn_DMA_START_CR_SHADOW(N)	\
+						(LCD_LAYER0_DMA_START_CR_SHADOW\
+						 + (0x20*N))

-:4438: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4438: FILE: drivers/gpu/drm/kmb/kmb_regs.h:303:
+						 + (0x20*N))
 						        ^

-:4440: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4440: FILE: drivers/gpu/drm/kmb/kmb_regs.h:305:
+#define LCD_LAYERn_DMA_CR_LINE_WIDTH(N)		(LCD_LAYER0_DMA_CR_LINE_WIDTH +\
+						(0x20*N))

-:4441: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4441: FILE: drivers/gpu/drm/kmb/kmb_regs.h:306:
+						(0x20*N))
 						     ^

-:4443: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4443: FILE: drivers/gpu/drm/kmb/kmb_regs.h:308:
+#define LCD_LAYERn_DMA_CR_LINE_VSTRIDE(N)	(LCD_LAYER0_DMA_CR_LINE_VSTRIDE\
+						+ (0x20*N))

-:4444: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4444: FILE: drivers/gpu/drm/kmb/kmb_regs.h:309:
+						+ (0x20*N))
 						       ^

-:4485: CHECK:BIT_MACRO: Prefer using the BIT macro
#4485: FILE: drivers/gpu/drm/kmb/kmb_regs.h:350:
+#define LCD_OUTF_BGR_ORDER			  (1 << 5)

-:4486: CHECK:BIT_MACRO: Prefer using the BIT macro
#4486: FILE: drivers/gpu/drm/kmb/kmb_regs.h:351:
+#define LCD_OUTF_Y_ORDER			  (1 << 6)

-:4487: CHECK:BIT_MACRO: Prefer using the BIT macro
#4487: FILE: drivers/gpu/drm/kmb/kmb_regs.h:352:
+#define LCD_OUTF_CRCB_ORDER			  (1 << 7)

-:4488: CHECK:BIT_MACRO: Prefer using the BIT macro
#4488: FILE: drivers/gpu/drm/kmb/kmb_regs.h:353:
+#define LCD_OUTF_SYNC_MODE			  (1 << 11)

-:4489: CHECK:BIT_MACRO: Prefer using the BIT macro
#4489: FILE: drivers/gpu/drm/kmb/kmb_regs.h:354:
+#define LCD_OUTF_RGB_CONV_MODE			  (1 << 14)

-:4490: CHECK:BIT_MACRO: Prefer using the BIT macro
#4490: FILE: drivers/gpu/drm/kmb/kmb_regs.h:355:
+#define LCD_OUTF_MIPI_RGB_MODE			  (1 << 18)

-:4520: CHECK:BIT_MACRO: Prefer using the BIT macro
#4520: FILE: drivers/gpu/drm/kmb/kmb_regs.h:385:
+#define LCD_DMA_STATE_ACTIVE			  (1 << 3)

-:4540: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'M' may be better as '(M)' to avoid precedence issues
#4540: FILE: drivers/gpu/drm/kmb/kmb_regs.h:405:
+#define HS_OFFSET(M)				((M + 1) * 0x400)

-:4544: CHECK:BIT_MACRO: Prefer using the BIT macro
#4544: FILE: drivers/gpu/drm/kmb/kmb_regs.h:409:
+#define   HS_CTRL_EN				(1 << 0)

-:4546: CHECK:BIT_MACRO: Prefer using the BIT macro
#4546: FILE: drivers/gpu/drm/kmb/kmb_regs.h:411:
+#define   HS_CTRL_CSIDSIN			(1 << 2)

-:4548: CHECK:BIT_MACRO: Prefer using the BIT macro
#4548: FILE: drivers/gpu/drm/kmb/kmb_regs.h:413:
+#define   TX_SOURCE				(1 << 3)

-:4551: CHECK:BIT_MACRO: Prefer using the BIT macro
#4551: FILE: drivers/gpu/drm/kmb/kmb_regs.h:416:
+#define   DSI_EOTP_EN				(1 << 11)

-:4552: CHECK:BIT_MACRO: Prefer using the BIT macro
#4552: FILE: drivers/gpu/drm/kmb/kmb_regs.h:417:
+#define   DSI_CMD_HFP_EN			(1 << 12)

-:4553: CHECK:BIT_MACRO: Prefer using the BIT macro
#4553: FILE: drivers/gpu/drm/kmb/kmb_regs.h:418:
+#define   CRC_EN				(1 << 14)

-:4555: CHECK:BIT_MACRO: Prefer using the BIT macro
#4555: FILE: drivers/gpu/drm/kmb/kmb_regs.h:420:
+#define   HSCLKIDLE_CNT				(1 << 24)

-:4559: CHECK:BIT_MACRO: Prefer using the BIT macro
#4559: FILE: drivers/gpu/drm/kmb/kmb_regs.h:424:
+#define   LINE_SYNC_PKT_ENABLE			(1 << 0)

-:4560: CHECK:BIT_MACRO: Prefer using the BIT macro
#4560: FILE: drivers/gpu/drm/kmb/kmb_regs.h:425:
+#define   FRAME_COUNTER_ACTIVE			(1 << 1)

-:4561: CHECK:BIT_MACRO: Prefer using the BIT macro
#4561: FILE: drivers/gpu/drm/kmb/kmb_regs.h:426:
+#define   LINE_COUNTER_ACTIVE			(1 << 2)

-:4562: CHECK:BIT_MACRO: Prefer using the BIT macro
#4562: FILE: drivers/gpu/drm/kmb/kmb_regs.h:427:
+#define   DSI_V_BLANKING			(1 << 4)

-:4563: CHECK:BIT_MACRO: Prefer using the BIT macro
#4563: FILE: drivers/gpu/drm/kmb/kmb_regs.h:428:
+#define   DSI_HSA_BLANKING			(1 << 5)

-:4564: CHECK:BIT_MACRO: Prefer using the BIT macro
#4564: FILE: drivers/gpu/drm/kmb/kmb_regs.h:429:
+#define   DSI_HBP_BLANKING			(1 << 6)

-:4565: CHECK:BIT_MACRO: Prefer using the BIT macro
#4565: FILE: drivers/gpu/drm/kmb/kmb_regs.h:430:
+#define   DSI_HFP_BLANKING			(1 << 7)

-:4566: CHECK:BIT_MACRO: Prefer using the BIT macro
#4566: FILE: drivers/gpu/drm/kmb/kmb_regs.h:431:
+#define   DSI_SYNC_PULSE_EVENTN			(1 << 8)

-:4567: CHECK:BIT_MACRO: Prefer using the BIT macro
#4567: FILE: drivers/gpu/drm/kmb/kmb_regs.h:432:
+#define   DSI_LPM_FIRST_VSA_LINE		(1 << 9)

-:4568: CHECK:BIT_MACRO: Prefer using the BIT macro
#4568: FILE: drivers/gpu/drm/kmb/kmb_regs.h:433:
+#define   DSI_LPM_LAST_VFP_LINE			(1 << 10)

-:4569: CHECK:BIT_MACRO: Prefer using the BIT macro
#4569: FILE: drivers/gpu/drm/kmb/kmb_regs.h:434:
+#define   WAIT_ALL_SECT				(1 << 11)

-:4570: CHECK:BIT_MACRO: Prefer using the BIT macro
#4570: FILE: drivers/gpu/drm/kmb/kmb_regs.h:435:
+#define   WAIT_TRIG_POS				(1 << 15)

-:4575: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4575: FILE: drivers/gpu/drm/kmb/kmb_regs.h:440:
+#define   MIPI_TXm_HS_FGn_SECTo_PH(M, N, O)	(MIPI_TX0_HS_FG0_SECT0_PH + \
+						HS_OFFSET(M) + (0x2C*N) + (8*O))

-:4575: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'O' may be better as '(O)' to avoid precedence issues
#4575: FILE: drivers/gpu/drm/kmb/kmb_regs.h:440:
+#define   MIPI_TXm_HS_FGn_SECTo_PH(M, N, O)	(MIPI_TX0_HS_FG0_SECT0_PH + \
+						HS_OFFSET(M) + (0x2C*N) + (8*O))

-:4576: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4576: FILE: drivers/gpu/drm/kmb/kmb_regs.h:441:
+						HS_OFFSET(M) + (0x2C*N) + (8*O))
 						                    ^

-:4576: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4576: FILE: drivers/gpu/drm/kmb/kmb_regs.h:441:
+						HS_OFFSET(M) + (0x2C*N) + (8*O))
 						                            ^

-:4584: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4584: FILE: drivers/gpu/drm/kmb/kmb_regs.h:449:
+#define   MIPI_TX_SECT_DMA_PACKED		(1<<26)
                                  		  ^

-:4584: CHECK:BIT_MACRO: Prefer using the BIT macro
#4584: FILE: drivers/gpu/drm/kmb/kmb_regs.h:449:
+#define   MIPI_TX_SECT_DMA_PACKED		(1<<26)

-:4587: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4587: FILE: drivers/gpu/drm/kmb/kmb_regs.h:452:
+#define   MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(M, N)	\
+					(MIPI_TX_HS_FG0_SECT_UNPACKED_BYTES0 \
+					+ HS_OFFSET(M) + (0x2C*N))

-:4589: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4589: FILE: drivers/gpu/drm/kmb/kmb_regs.h:454:
+					+ HS_OFFSET(M) + (0x2C*N))
 					                      ^

-:4591: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4591: FILE: drivers/gpu/drm/kmb/kmb_regs.h:456:
+#define   MIPI_TXm_HS_FGn_SECTo_LINE_CFG(M, N, O)	\
+				(MIPI_TX_HS_FG0_SECT0_LINE_CFG + HS_OFFSET(M) \
+				+ (0x2C*N) + (8*O))

-:4591: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'O' may be better as '(O)' to avoid precedence issues
#4591: FILE: drivers/gpu/drm/kmb/kmb_regs.h:456:
+#define   MIPI_TXm_HS_FGn_SECTo_LINE_CFG(M, N, O)	\
+				(MIPI_TX_HS_FG0_SECT0_LINE_CFG + HS_OFFSET(M) \
+				+ (0x2C*N) + (8*O))

-:4593: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4593: FILE: drivers/gpu/drm/kmb/kmb_regs.h:458:
+				+ (0x2C*N) + (8*O))
 				       ^

-:4593: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4593: FILE: drivers/gpu/drm/kmb/kmb_regs.h:458:
+				+ (0x2C*N) + (8*O))
 				               ^

-:4596: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4596: FILE: drivers/gpu/drm/kmb/kmb_regs.h:461:
+#define   MIPI_TXm_HS_FGn_NUM_LINES(M, N)	\
+				(MIPI_TX_HS_FG0_NUM_LINES + HS_OFFSET(M) \
+				+ (0x2C*N))

-:4598: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4598: FILE: drivers/gpu/drm/kmb/kmb_regs.h:463:
+				+ (0x2C*N))
 				       ^

-:4600: WARNING:TYPO_SPELLING: 'WIDTHn' may be misspelled - perhaps 'Width'?
#4600: FILE: drivers/gpu/drm/kmb/kmb_regs.h:465:
+#define   MIPI_TXm_HS_VSYNC_WIDTHn(M, N)		\

-:4600: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4600: FILE: drivers/gpu/drm/kmb/kmb_regs.h:465:
+#define   MIPI_TXm_HS_VSYNC_WIDTHn(M, N)		\
+				(MIPI_TX_HS_VSYNC_WIDTHS0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4602: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4602: FILE: drivers/gpu/drm/kmb/kmb_regs.h:467:
+				+ (0x4*N))
 				      ^

-:4604: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4604: FILE: drivers/gpu/drm/kmb/kmb_regs.h:469:
+#define   MIPI_TXm_HS_V_BACKPORCHESn(M, N)	\
+				(MIPI_TX_HS_V_BACKPORCHES0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4606: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4606: FILE: drivers/gpu/drm/kmb/kmb_regs.h:471:
+				+ (0x4*N))
 				      ^

-:4608: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4608: FILE: drivers/gpu/drm/kmb/kmb_regs.h:473:
+#define   MIPI_TXm_HS_V_FRONTPORCHESn(M, N)	\
+				(MIPI_TX_HS_V_FRONTPORCHES0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4610: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4610: FILE: drivers/gpu/drm/kmb/kmb_regs.h:475:
+				+ (0x4*N))
 				      ^

-:4612: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4612: FILE: drivers/gpu/drm/kmb/kmb_regs.h:477:
+#define   MIPI_TXm_HS_V_ACTIVEn(M, N)		\
+				(MIPI_TX_HS_V_ACTIVE0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4614: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4614: FILE: drivers/gpu/drm/kmb/kmb_regs.h:479:
+				+ (0x4*N))
 				      ^

-:4616: WARNING:TYPO_SPELLING: 'WIDTHn' may be misspelled - perhaps 'Width'?
#4616: FILE: drivers/gpu/drm/kmb/kmb_regs.h:481:
+#define   MIPI_TXm_HS_HSYNC_WIDTHn(M, N)		\

-:4616: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4616: FILE: drivers/gpu/drm/kmb/kmb_regs.h:481:
+#define   MIPI_TXm_HS_HSYNC_WIDTHn(M, N)		\
+				(MIPI_TX_HS_HSYNC_WIDTH0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4618: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4618: FILE: drivers/gpu/drm/kmb/kmb_regs.h:483:
+				+ (0x4*N))
 				      ^

-:4620: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4620: FILE: drivers/gpu/drm/kmb/kmb_regs.h:485:
+#define   MIPI_TXm_HS_H_BACKPORCHn(M, N)		\
+				(MIPI_TX_HS_H_BACKPORCH0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4622: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4622: FILE: drivers/gpu/drm/kmb/kmb_regs.h:487:
+				+ (0x4*N))
 				      ^

-:4624: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4624: FILE: drivers/gpu/drm/kmb/kmb_regs.h:489:
+#define   MIPI_TXm_HS_H_FRONTPORCHn(M, N)	\
+				(MIPI_TX_HS_H_FRONTPORCH0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4626: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4626: FILE: drivers/gpu/drm/kmb/kmb_regs.h:491:
+				+ (0x4*N))
 				      ^

-:4628: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4628: FILE: drivers/gpu/drm/kmb/kmb_regs.h:493:
+#define   MIPI_TXm_HS_H_ACTIVEn(M, N)		\
+				(MIPI_TX_HS_H_ACTIVE0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4630: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4630: FILE: drivers/gpu/drm/kmb/kmb_regs.h:495:
+				+ (0x4*N))
 				      ^

-:4632: WARNING:TYPO_SPELLING: 'WIDTHn' may be misspelled - perhaps 'Width'?
#4632: FILE: drivers/gpu/drm/kmb/kmb_regs.h:497:
+#define   MIPI_TXm_HS_LLP_HSYNC_WIDTHn(M, N)	\

-:4632: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4632: FILE: drivers/gpu/drm/kmb/kmb_regs.h:497:
+#define   MIPI_TXm_HS_LLP_HSYNC_WIDTHn(M, N)	\
+				(MIPI_TX_HS_LLP_HSYNC_WIDTH0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4634: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4634: FILE: drivers/gpu/drm/kmb/kmb_regs.h:499:
+				+ (0x4*N))
 				      ^

-:4636: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4636: FILE: drivers/gpu/drm/kmb/kmb_regs.h:501:
+#define   MIPI_TXm_HS_LLP_H_BACKPORCHn(M, N)	\
+				(MIPI_TX_HS_LLP_H_BACKPORCH0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4638: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4638: FILE: drivers/gpu/drm/kmb/kmb_regs.h:503:
+				+ (0x4*N))
 				      ^

-:4640: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4640: FILE: drivers/gpu/drm/kmb/kmb_regs.h:505:
+#define   MIPI_TXm_HS_LLP_H_FRONTPORCHn(M, N)	\
+				(MIPI_TX_HS_LLP_H_FRONTPORCH0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4642: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4642: FILE: drivers/gpu/drm/kmb/kmb_regs.h:507:
+				+ (0x4*N))
 				      ^

-:4650: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn>
#4650: FILE: drivers/gpu/drm/kmb/kmb_regs.h:515:
+#define   MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(M, N)	\

-:4650: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4650: FILE: drivers/gpu/drm/kmb/kmb_regs.h:515:
+#define   MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(M, N)	\
+			(MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0 + HS_OFFSET(M) \
+			+ (0x4*N))

-:4652: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4652: FILE: drivers/gpu/drm/kmb/kmb_regs.h:517:
+			+ (0x4*N))
 			      ^

-:4653: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'vc' - possible side-effects?
#4653: FILE: drivers/gpu/drm/kmb/kmb_regs.h:518:
+#define   SET_MC_FIFO_CHAN_ALLOC(dev, ctrl, vc, sz)	\
+		kmb_write_bits_mipi(dev, \
+				MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(ctrl, \
+				vc/2), (vc % 2)*16, 16, sz)

-:4653: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'vc' may be better as '(vc)' to avoid precedence issues
#4653: FILE: drivers/gpu/drm/kmb/kmb_regs.h:518:
+#define   SET_MC_FIFO_CHAN_ALLOC(dev, ctrl, vc, sz)	\
+		kmb_write_bits_mipi(dev, \
+				MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(ctrl, \
+				vc/2), (vc % 2)*16, 16, sz)

-:4656: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#4656: FILE: drivers/gpu/drm/kmb/kmb_regs.h:521:
+				vc/2), (vc % 2)*16, 16, sz)
 				  ^

-:4656: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4656: FILE: drivers/gpu/drm/kmb/kmb_regs.h:521:
+				vc/2), (vc % 2)*16, 16, sz)
 				               ^

-:4659: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn>
#4659: FILE: drivers/gpu/drm/kmb/kmb_regs.h:524:
+#define   MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(M, N)	\

-:4659: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4659: FILE: drivers/gpu/drm/kmb/kmb_regs.h:524:
+#define   MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(M, N)	\
+				(MIPI_TX_HS_MC_FIFO_RTHRESHOLD0 + HS_OFFSET(M) \
+				+ (0x4*N))

-:4661: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4661: FILE: drivers/gpu/drm/kmb/kmb_regs.h:526:
+				+ (0x4*N))
 				      ^

-:4662: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'vc' - possible side-effects?
#4662: FILE: drivers/gpu/drm/kmb/kmb_regs.h:527:
+#define   SET_MC_FIFO_RTHRESHOLD(dev, ctrl, vc, th)	\
+	kmb_write_bits_mipi(dev, MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(ctrl, vc/2), \
+			(vc % 2)*16, 16, th)

-:4662: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'vc' may be better as '(vc)' to avoid precedence issues
#4662: FILE: drivers/gpu/drm/kmb/kmb_regs.h:527:
+#define   SET_MC_FIFO_RTHRESHOLD(dev, ctrl, vc, th)	\
+	kmb_write_bits_mipi(dev, MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(ctrl, vc/2), \
+			(vc % 2)*16, 16, th)

-:4663: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#4663: FILE: drivers/gpu/drm/kmb/kmb_regs.h:528:
+	kmb_write_bits_mipi(dev, MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(ctrl, vc/2), \
 	                                                                 ^

-:4664: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4664: FILE: drivers/gpu/drm/kmb/kmb_regs.h:529:
+			(vc % 2)*16, 16, th)
 			        ^

-:4684: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'M' may be better as '(M)' to avoid precedence issues
#4684: FILE: drivers/gpu/drm/kmb/kmb_regs.h:549:
+#define   SET_MIPI_CTRL_IRQ_ENABLE0(dev, M, N)	kmb_set_bit_mipi(dev, \
+						MIPI_CTRL_IRQ_ENABLE0, M+N)

-:4684: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4684: FILE: drivers/gpu/drm/kmb/kmb_regs.h:549:
+#define   SET_MIPI_CTRL_IRQ_ENABLE0(dev, M, N)	kmb_set_bit_mipi(dev, \
+						MIPI_CTRL_IRQ_ENABLE0, M+N)

-:4685: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#4685: FILE: drivers/gpu/drm/kmb/kmb_regs.h:550:
+						MIPI_CTRL_IRQ_ENABLE0, M+N)
 						                        ^

-:4692: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'M' may be better as '(M)' to avoid precedence issues
#4692: FILE: drivers/gpu/drm/kmb/kmb_regs.h:557:
+#define   SET_MIPI_CTRL_IRQ_CLEAR0(dev, M, N)		\
+		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR0, M+N)

-:4692: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4692: FILE: drivers/gpu/drm/kmb/kmb_regs.h:557:
+#define   SET_MIPI_CTRL_IRQ_CLEAR0(dev, M, N)		\
+		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR0, M+N)

-:4693: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#4693: FILE: drivers/gpu/drm/kmb/kmb_regs.h:558:
+		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR0, M+N)
 		                                             ^

-:4695: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'M' may be better as '(M)' to avoid precedence issues
#4695: FILE: drivers/gpu/drm/kmb/kmb_regs.h:560:
+#define   SET_MIPI_CTRL_IRQ_CLEAR1(dev, M, N)		\
+		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR1, M+N)

-:4695: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4695: FILE: drivers/gpu/drm/kmb/kmb_regs.h:560:
+#define   SET_MIPI_CTRL_IRQ_CLEAR1(dev, M, N)		\
+		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR1, M+N)

-:4696: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#4696: FILE: drivers/gpu/drm/kmb/kmb_regs.h:561:
+		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR1, M+N)
 		                                             ^

-:4699: CHECK:CAMELCASE: Avoid CamelCase: <MIPI_TX_HS_IRQ_STATUSm>
#4699: FILE: drivers/gpu/drm/kmb/kmb_regs.h:564:
+#define   MIPI_TX_HS_IRQ_STATUSm(M)		(MIPI_TX_HS_IRQ_STATUS + \

-:4703: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4703: FILE: drivers/gpu/drm/kmb/kmb_regs.h:568:
+#define   MIPI_TX_HS_IRQ_LINE_COMPARE			(1<<1)
                                      			  ^

-:4703: CHECK:BIT_MACRO: Prefer using the BIT macro
#4703: FILE: drivers/gpu/drm/kmb/kmb_regs.h:568:
+#define   MIPI_TX_HS_IRQ_LINE_COMPARE			(1<<1)

-:4704: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4704: FILE: drivers/gpu/drm/kmb/kmb_regs.h:569:
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_0			(1<<2)
                                      			  ^

-:4704: CHECK:BIT_MACRO: Prefer using the BIT macro
#4704: FILE: drivers/gpu/drm/kmb/kmb_regs.h:569:
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_0			(1<<2)

-:4705: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4705: FILE: drivers/gpu/drm/kmb/kmb_regs.h:570:
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_1			(1<<3)
                                      			  ^

-:4705: CHECK:BIT_MACRO: Prefer using the BIT macro
#4705: FILE: drivers/gpu/drm/kmb/kmb_regs.h:570:
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_1			(1<<3)

-:4706: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4706: FILE: drivers/gpu/drm/kmb/kmb_regs.h:571:
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_2			(1<<4)
                                      			  ^

-:4706: CHECK:BIT_MACRO: Prefer using the BIT macro
#4706: FILE: drivers/gpu/drm/kmb/kmb_regs.h:571:
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_2			(1<<4)

-:4707: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4707: FILE: drivers/gpu/drm/kmb/kmb_regs.h:572:
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_3			(1<<5)
                                      			  ^

-:4707: CHECK:BIT_MACRO: Prefer using the BIT macro
#4707: FILE: drivers/gpu/drm/kmb/kmb_regs.h:572:
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_3			(1<<5)

-:4708: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4708: FILE: drivers/gpu/drm/kmb/kmb_regs.h:573:
+#define   MIPI_TX_HS_IRQ_DMA_DONE_0			(1<<6)
                                    			  ^

-:4708: CHECK:BIT_MACRO: Prefer using the BIT macro
#4708: FILE: drivers/gpu/drm/kmb/kmb_regs.h:573:
+#define   MIPI_TX_HS_IRQ_DMA_DONE_0			(1<<6)

-:4709: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4709: FILE: drivers/gpu/drm/kmb/kmb_regs.h:574:
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_0			(1<<7)
                                    			  ^

-:4709: CHECK:BIT_MACRO: Prefer using the BIT macro
#4709: FILE: drivers/gpu/drm/kmb/kmb_regs.h:574:
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_0			(1<<7)

-:4710: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4710: FILE: drivers/gpu/drm/kmb/kmb_regs.h:575:
+#define   MIPI_TX_HS_IRQ_DMA_DONE_1			(1<<8)
                                    			  ^

-:4710: CHECK:BIT_MACRO: Prefer using the BIT macro
#4710: FILE: drivers/gpu/drm/kmb/kmb_regs.h:575:
+#define   MIPI_TX_HS_IRQ_DMA_DONE_1			(1<<8)

-:4711: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4711: FILE: drivers/gpu/drm/kmb/kmb_regs.h:576:
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_1			(1<<9)
                                    			  ^

-:4711: CHECK:BIT_MACRO: Prefer using the BIT macro
#4711: FILE: drivers/gpu/drm/kmb/kmb_regs.h:576:
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_1			(1<<9)

-:4712: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4712: FILE: drivers/gpu/drm/kmb/kmb_regs.h:577:
+#define   MIPI_TX_HS_IRQ_DMA_DONE_2			(1<<10)
                                    			  ^

-:4712: CHECK:BIT_MACRO: Prefer using the BIT macro
#4712: FILE: drivers/gpu/drm/kmb/kmb_regs.h:577:
+#define   MIPI_TX_HS_IRQ_DMA_DONE_2			(1<<10)

-:4713: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4713: FILE: drivers/gpu/drm/kmb/kmb_regs.h:578:
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_2			(1<<11)
                                    			  ^

-:4713: CHECK:BIT_MACRO: Prefer using the BIT macro
#4713: FILE: drivers/gpu/drm/kmb/kmb_regs.h:578:
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_2			(1<<11)

-:4714: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4714: FILE: drivers/gpu/drm/kmb/kmb_regs.h:579:
+#define   MIPI_TX_HS_IRQ_DMA_DONE_3			(1<<12)
                                    			  ^

-:4714: CHECK:BIT_MACRO: Prefer using the BIT macro
#4714: FILE: drivers/gpu/drm/kmb/kmb_regs.h:579:
+#define   MIPI_TX_HS_IRQ_DMA_DONE_3			(1<<12)

-:4715: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4715: FILE: drivers/gpu/drm/kmb/kmb_regs.h:580:
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_3			(1<<13)
                                    			  ^

-:4715: CHECK:BIT_MACRO: Prefer using the BIT macro
#4715: FILE: drivers/gpu/drm/kmb/kmb_regs.h:580:
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_3			(1<<13)

-:4716: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4716: FILE: drivers/gpu/drm/kmb/kmb_regs.h:581:
+#define   MIPI_TX_HS_IRQ_MC_FIFO_UNDERFLOW		(1<<14)
                                           		  ^

-:4716: CHECK:BIT_MACRO: Prefer using the BIT macro
#4716: FILE: drivers/gpu/drm/kmb/kmb_regs.h:581:
+#define   MIPI_TX_HS_IRQ_MC_FIFO_UNDERFLOW		(1<<14)

-:4717: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4717: FILE: drivers/gpu/drm/kmb/kmb_regs.h:582:
+#define   MIPI_TX_HS_IRQ_MC_FIFO_OVERFLOW		(1<<15)
                                          		  ^

-:4717: CHECK:BIT_MACRO: Prefer using the BIT macro
#4717: FILE: drivers/gpu/drm/kmb/kmb_regs.h:582:
+#define   MIPI_TX_HS_IRQ_MC_FIFO_OVERFLOW		(1<<15)

-:4718: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4718: FILE: drivers/gpu/drm/kmb/kmb_regs.h:583:
+#define   MIPI_TX_HS_IRQ_LLP_FIFO_EMPTY			(1<<16)
                                        			  ^

-:4718: CHECK:BIT_MACRO: Prefer using the BIT macro
#4718: FILE: drivers/gpu/drm/kmb/kmb_regs.h:583:
+#define   MIPI_TX_HS_IRQ_LLP_FIFO_EMPTY			(1<<16)

-:4719: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4719: FILE: drivers/gpu/drm/kmb/kmb_regs.h:584:
+#define   MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_FULL		(1<<17)
                                                		  ^

-:4719: CHECK:BIT_MACRO: Prefer using the BIT macro
#4719: FILE: drivers/gpu/drm/kmb/kmb_regs.h:584:
+#define   MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_FULL		(1<<17)

-:4720: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4720: FILE: drivers/gpu/drm/kmb/kmb_regs.h:585:
+#define   MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_ERROR	(1<<18)
                                                 	  ^

-:4720: CHECK:BIT_MACRO: Prefer using the BIT macro
#4720: FILE: drivers/gpu/drm/kmb/kmb_regs.h:585:
+#define   MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_ERROR	(1<<18)

-:4721: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4721: FILE: drivers/gpu/drm/kmb/kmb_regs.h:586:
+#define   MIPI_TX_HS_IRQ_LLP_WORD_COUNT_ERROR		(1<<20)
                                              		  ^

-:4721: CHECK:BIT_MACRO: Prefer using the BIT macro
#4721: FILE: drivers/gpu/drm/kmb/kmb_regs.h:586:
+#define   MIPI_TX_HS_IRQ_LLP_WORD_COUNT_ERROR		(1<<20)

-:4776: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'N' may be better as '(N)' to avoid precedence issues
#4776: FILE: drivers/gpu/drm/kmb/kmb_regs.h:641:
+#define   TP_SEL_VCm(M, N)				\
+				(N << (((M) * 0x04) + 1))

-:4795: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'dphy' may be better as '(dphy)' to avoid precedence issues
#4795: FILE: drivers/gpu/drm/kmb/kmb_regs.h:660:
+#define   SET_DPHY_INIT_CTRL0(dev, dphy, offset)	\
+			kmb_set_bit_mipi(dev, DPHY_INIT_CTRL0, (dphy+offset))

-:4795: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'offset' may be better as '(offset)' to avoid precedence issues
#4795: FILE: drivers/gpu/drm/kmb/kmb_regs.h:660:
+#define   SET_DPHY_INIT_CTRL0(dev, dphy, offset)	\
+			kmb_set_bit_mipi(dev, DPHY_INIT_CTRL0, (dphy+offset))

-:4796: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#4796: FILE: drivers/gpu/drm/kmb/kmb_regs.h:661:
+			kmb_set_bit_mipi(dev, DPHY_INIT_CTRL0, (dphy+offset))
 			                                            ^

-:4797: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'dphy' may be better as '(dphy)' to avoid precedence issues
#4797: FILE: drivers/gpu/drm/kmb/kmb_regs.h:662:
+#define   CLR_DPHY_INIT_CTRL0(dev, dphy, offset)	\
+			kmb_clr_bit_mipi(dev, DPHY_INIT_CTRL0, (dphy+offset))

-:4797: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'offset' may be better as '(offset)' to avoid precedence issues
#4797: FILE: drivers/gpu/drm/kmb/kmb_regs.h:662:
+#define   CLR_DPHY_INIT_CTRL0(dev, dphy, offset)	\
+			kmb_clr_bit_mipi(dev, DPHY_INIT_CTRL0, (dphy+offset))

-:4798: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#4798: FILE: drivers/gpu/drm/kmb/kmb_regs.h:663:
+			kmb_clr_bit_mipi(dev, DPHY_INIT_CTRL0, (dphy+offset))
 			                                            ^

-:4805: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dphy' - possible side-effects?
#4805: FILE: drivers/gpu/drm/kmb/kmb_regs.h:670:
+#define   SET_DPHY_FREQ_CTRL0_3(dev, dphy, val)	\
+			kmb_write_bits_mipi(dev, DPHY_FREQ_CTRL0_3 \
+			+ ((dphy/4)*4), (dphy % 4) * 8, 6, val)

-:4805: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'dphy' may be better as '(dphy)' to avoid precedence issues
#4805: FILE: drivers/gpu/drm/kmb/kmb_regs.h:670:
+#define   SET_DPHY_FREQ_CTRL0_3(dev, dphy, val)	\
+			kmb_write_bits_mipi(dev, DPHY_FREQ_CTRL0_3 \
+			+ ((dphy/4)*4), (dphy % 4) * 8, 6, val)

-:4807: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#4807: FILE: drivers/gpu/drm/kmb/kmb_regs.h:672:
+			+ ((dphy/4)*4), (dphy % 4) * 8, 6, val)
 			        ^

-:4807: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4807: FILE: drivers/gpu/drm/kmb/kmb_regs.h:672:
+			+ ((dphy/4)*4), (dphy % 4) * 8, 6, val)
 			           ^

-:4813: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dphy' - possible side-effects?
#4813: FILE: drivers/gpu/drm/kmb/kmb_regs.h:678:
+#define	  GET_STOPSTATE_DATA(dev, dphy)		\
+			(((kmb_read_mipi(dev, MIPI_DPHY_STAT0_3 + (dphy/4)*4)) \
+					>> (((dphy % 4)*8)+4)) & 0x03)

-:4813: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'dphy' may be better as '(dphy)' to avoid precedence issues
#4813: FILE: drivers/gpu/drm/kmb/kmb_regs.h:678:
+#define	  GET_STOPSTATE_DATA(dev, dphy)		\
+			(((kmb_read_mipi(dev, MIPI_DPHY_STAT0_3 + (dphy/4)*4)) \
+					>> (((dphy % 4)*8)+4)) & 0x03)

-:4814: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#4814: FILE: drivers/gpu/drm/kmb/kmb_regs.h:679:
+			(((kmb_read_mipi(dev, MIPI_DPHY_STAT0_3 + (dphy/4)*4)) \
 			                                               ^

-:4814: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4814: FILE: drivers/gpu/drm/kmb/kmb_regs.h:679:
+			(((kmb_read_mipi(dev, MIPI_DPHY_STAT0_3 + (dphy/4)*4)) \
 			                                                  ^

-:4815: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4815: FILE: drivers/gpu/drm/kmb/kmb_regs.h:680:
+					>> (((dphy % 4)*8)+4)) & 0x03)
 					               ^

-:4815: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#4815: FILE: drivers/gpu/drm/kmb/kmb_regs.h:680:
+					>> (((dphy % 4)*8)+4)) & 0x03)
 					                  ^

-:4830: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'dphy' may be better as '(dphy)' to avoid precedence issues
#4830: FILE: drivers/gpu/drm/kmb/kmb_regs.h:695:
+#define   SET_DPHY_TEST_CTRL1_EN(dev, dphy)	\
+			kmb_set_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy+12))

-:4831: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#4831: FILE: drivers/gpu/drm/kmb/kmb_regs.h:696:
+			kmb_set_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy+12))
 			                                            ^

-:4832: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'dphy' may be better as '(dphy)' to avoid precedence issues
#4832: FILE: drivers/gpu/drm/kmb/kmb_regs.h:697:
+#define   CLR_DPHY_TEST_CTRL1_EN(dev, dphy)	\
+			kmb_clr_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy+12))

-:4833: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#4833: FILE: drivers/gpu/drm/kmb/kmb_regs.h:698:
+			kmb_clr_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy+12))
 			                                            ^

-:4837: CHECK:SPACING: spaces preferred around that '%' (ctx:VxV)
#4837: FILE: drivers/gpu/drm/kmb/kmb_regs.h:702:
+			4, ((val) << (((dphy)%4)*8)))
 			                     ^

-:4837: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4837: FILE: drivers/gpu/drm/kmb/kmb_regs.h:702:
+			4, ((val) << (((dphy)%4)*8)))
 			                        ^

-:4838: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#4838: FILE: drivers/gpu/drm/kmb/kmb_regs.h:703:
+#define DPHY_TEST_DOUT0_3			(0x168)

-:4839: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#4839: FILE: drivers/gpu/drm/kmb/kmb_regs.h:704:
+#define   GET_TEST_DOUT0_3(dev, dphy)		\

-:4840: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#4840: FILE: drivers/gpu/drm/kmb/kmb_regs.h:705:
+			(kmb_read_mipi(dev, DPHY_TEST_DOUT0_3) \

-:4841: CHECK:SPACING: spaces preferred around that '%' (ctx:VxV)
#4841: FILE: drivers/gpu/drm/kmb/kmb_regs.h:706:
+			>> (((dphy)%4)*8) & 0xff)
 			           ^

-:4841: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4841: FILE: drivers/gpu/drm/kmb/kmb_regs.h:706:
+			>> (((dphy)%4)*8) & 0xff)
 			              ^

-:4842: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#4842: FILE: drivers/gpu/drm/kmb/kmb_regs.h:707:
+#define DPHY_TEST_DOUT4_7			(0x16C)

-:4843: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#4843: FILE: drivers/gpu/drm/kmb/kmb_regs.h:708:
+#define   GET_TEST_DOUT4_7(dev, dphy)		\

-:4844: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#4844: FILE: drivers/gpu/drm/kmb/kmb_regs.h:709:
+			(kmb_read_mipi(dev, DPHY_TEST_DOUT4_7) \

-:4845: CHECK:SPACING: spaces preferred around that '%' (ctx:VxV)
#4845: FILE: drivers/gpu/drm/kmb/kmb_regs.h:710:
+			>> (((dphy)%4)*8) & 0xff)
 			           ^

-:4845: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#4845: FILE: drivers/gpu/drm/kmb/kmb_regs.h:710:
+			>> (((dphy)%4)*8) & 0xff)
 			              ^

-:4846: WARNING:TYPO_SPELLING: 'DOUT' may be misspelled - perhaps 'DOUBT'?
#4846: FILE: drivers/gpu/drm/kmb/kmb_regs.h:711:
+#define DPHY_TEST_DOUT8_9			(0x170)

-:4850: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'dphy' may be better as '(dphy)' to avoid precedence issues
#4850: FILE: drivers/gpu/drm/kmb/kmb_regs.h:715:
+#define   GET_PLL_LOCK(dev, dphy)		\
+			(kmb_read_mipi(dev, DPHY_PLL_LOCK) \
+			& (1 << (dphy - MIPI_DPHY6)))

-:4859: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4859: FILE: drivers/gpu/drm/kmb/kmb_regs.h:724:
+#define   LCD					(1<<1)
              					  ^

-:4859: CHECK:BIT_MACRO: Prefer using the BIT macro
#4859: FILE: drivers/gpu/drm/kmb/kmb_regs.h:724:
+#define   LCD					(1<<1)

-:4860: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4860: FILE: drivers/gpu/drm/kmb/kmb_regs.h:725:
+#define   MIPI_COMMON				(1<<2)
                      				  ^

-:4860: CHECK:BIT_MACRO: Prefer using the BIT macro
#4860: FILE: drivers/gpu/drm/kmb/kmb_regs.h:725:
+#define   MIPI_COMMON				(1<<2)

-:4861: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#4861: FILE: drivers/gpu/drm/kmb/kmb_regs.h:726:
+#define   MIPI_TX0				(1<<9)
                   				  ^

-:4861: CHECK:BIT_MACRO: Prefer using the BIT macro
#4861: FILE: drivers/gpu/drm/kmb/kmb_regs.h:726:
+#define   MIPI_TX0				(1<<9)

-:4870: WARNING:TYPO_SPELLING: 'PRORITY' may be misspelled - perhaps 'PRIORITY'?
#4870: FILE: drivers/gpu/drm/kmb/kmb_regs.h:735:
+#define LCD_QOS_PRORITY				(0x8)

total: 0 errors, 25 warnings, 695 checks, 4767 lines checked
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
