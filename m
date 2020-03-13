Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12331846C9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 13:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7776E290;
	Fri, 13 Mar 2020 12:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62736E290
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 12:24:20 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DCOG7s043307;
 Fri, 13 Mar 2020 07:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584102256;
 bh=4LC52G3Dlu+AliRKNpbA2YnEyulkoxZ5we+H6bAWuTM=;
 h=From:To:CC:Subject:Date;
 b=PYX/DNr3PxOQokC7Ewc9jMIMj4Fa4dgdCaSfVaotS9DTj31O1/XHgAyLQL59uXPlo
 4f1YIX8/KCrHs1WF6NRkSNBPgeP0KhB+qNd08KedX1l/qRzFfUnxK5EWe4i2/oU373
 wALqUTXJ9sNBW279zBpsPk7ZVMJ3uxRb3VN4p0jU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DCOGnB073291
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Mar 2020 07:24:16 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 07:24:16 -0500
Received: from localhost.localdomain (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 07:24:16 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 02DCOEgv126921;
 Fri, 13 Mar 2020 07:24:14 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] omapfb: Remove unused writeback code
Date: Fri, 13 Mar 2020 14:24:10 +0200
Message-ID: <20200313122410.7528-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unused writeback code. This code will never be used, as omapfb is
being deprecated.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 114 -------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.h   |  20 ----
 2 files changed, 134 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index ce37da85cc45..4a16798b2ecd 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -557,11 +557,6 @@ u32 dispc_mgr_get_sync_lost_irq(enum omap_channel channel)
 }
 EXPORT_SYMBOL(dispc_mgr_get_sync_lost_irq);
 
-u32 dispc_wb_get_framedone_irq(void)
-{
-	return DISPC_IRQ_FRAMEDONEWB;
-}
-
 bool dispc_mgr_go_busy(enum omap_channel channel)
 {
 	return mgr_fld_read(channel, DISPC_MGR_FLD_GO) == 1;
@@ -579,30 +574,6 @@ void dispc_mgr_go(enum omap_channel channel)
 }
 EXPORT_SYMBOL(dispc_mgr_go);
 
-bool dispc_wb_go_busy(void)
-{
-	return REG_GET(DISPC_CONTROL2, 6, 6) == 1;
-}
-
-void dispc_wb_go(void)
-{
-	enum omap_plane plane = OMAP_DSS_WB;
-	bool enable, go;
-
-	enable = REG_GET(DISPC_OVL_ATTRIBUTES(plane), 0, 0) == 1;
-
-	if (!enable)
-		return;
-
-	go = REG_GET(DISPC_CONTROL2, 6, 6) == 1;
-	if (go) {
-		DSSERR("GO bit not down for WB\n");
-		return;
-	}
-
-	REG_FLD_MOD(DISPC_CONTROL2, 1, 6, 6);
-}
-
 static void dispc_ovl_write_firh_reg(enum omap_plane plane, int reg, u32 value)
 {
 	dispc_write_reg(DISPC_OVL_FIR_COEF_H(plane, reg), value);
@@ -1028,13 +999,6 @@ static enum omap_channel dispc_ovl_get_channel_out(enum omap_plane plane)
 	}
 }
 
-void dispc_wb_set_channel_in(enum dss_writeback_channel channel)
-{
-	enum omap_plane plane = OMAP_DSS_WB;
-
-	REG_FLD_MOD(DISPC_OVL_ATTRIBUTES(plane), channel, 18, 16);
-}
-
 static void dispc_ovl_set_burst_size(enum omap_plane plane,
 		enum omap_burst_size burst_size)
 {
@@ -2805,74 +2769,6 @@ int dispc_ovl_setup(enum omap_plane plane, const struct omap_overlay_info *oi,
 }
 EXPORT_SYMBOL(dispc_ovl_setup);
 
-int dispc_wb_setup(const struct omap_dss_writeback_info *wi,
-		bool mem_to_mem, const struct omap_video_timings *mgr_timings)
-{
-	int r;
-	u32 l;
-	enum omap_plane plane = OMAP_DSS_WB;
-	const int pos_x = 0, pos_y = 0;
-	const u8 zorder = 0, global_alpha = 0;
-	const bool replication = false;
-	bool truncation;
-	int in_width = mgr_timings->x_res;
-	int in_height = mgr_timings->y_res;
-	enum omap_overlay_caps caps =
-		OMAP_DSS_OVL_CAP_SCALE | OMAP_DSS_OVL_CAP_PRE_MULT_ALPHA;
-
-	DSSDBG("dispc_wb_setup, pa %x, pa_uv %x, %d,%d -> %dx%d, cmode %x, "
-		"rot %d, mir %d\n", wi->paddr, wi->p_uv_addr, in_width,
-		in_height, wi->width, wi->height, wi->color_mode, wi->rotation,
-		wi->mirror);
-
-	r = dispc_ovl_setup_common(plane, caps, wi->paddr, wi->p_uv_addr,
-		wi->buf_width, pos_x, pos_y, in_width, in_height, wi->width,
-		wi->height, wi->color_mode, wi->rotation, wi->mirror, zorder,
-		wi->pre_mult_alpha, global_alpha, wi->rotation_type,
-		replication, mgr_timings, mem_to_mem);
-
-	switch (wi->color_mode) {
-	case OMAP_DSS_COLOR_RGB16:
-	case OMAP_DSS_COLOR_RGB24P:
-	case OMAP_DSS_COLOR_ARGB16:
-	case OMAP_DSS_COLOR_RGBA16:
-	case OMAP_DSS_COLOR_RGB12U:
-	case OMAP_DSS_COLOR_ARGB16_1555:
-	case OMAP_DSS_COLOR_XRGB16_1555:
-	case OMAP_DSS_COLOR_RGBX16:
-		truncation = true;
-		break;
-	default:
-		truncation = false;
-		break;
-	}
-
-	/* setup extra DISPC_WB_ATTRIBUTES */
-	l = dispc_read_reg(DISPC_OVL_ATTRIBUTES(plane));
-	l = FLD_MOD(l, truncation, 10, 10);	/* TRUNCATIONENABLE */
-	l = FLD_MOD(l, mem_to_mem, 19, 19);	/* WRITEBACKMODE */
-	if (mem_to_mem)
-		l = FLD_MOD(l, 1, 26, 24);	/* CAPTUREMODE */
-	else
-		l = FLD_MOD(l, 0, 26, 24);	/* CAPTUREMODE */
-	dispc_write_reg(DISPC_OVL_ATTRIBUTES(plane), l);
-
-	if (mem_to_mem) {
-		/* WBDELAYCOUNT */
-		REG_FLD_MOD(DISPC_OVL_ATTRIBUTES2(plane), 0, 7, 0);
-	} else {
-		int wbdelay;
-
-		wbdelay = min(mgr_timings->vfp + mgr_timings->vsw +
-			mgr_timings->vbp, 255);
-
-		/* WBDELAYCOUNT */
-		REG_FLD_MOD(DISPC_OVL_ATTRIBUTES2(plane), wbdelay, 7, 0);
-	}
-
-	return r;
-}
-
 int dispc_ovl_enable(enum omap_plane plane, bool enable)
 {
 	DSSDBG("dispc_enable_plane %d, %d\n", plane, enable);
@@ -2903,16 +2799,6 @@ bool dispc_mgr_is_enabled(enum omap_channel channel)
 }
 EXPORT_SYMBOL(dispc_mgr_is_enabled);
 
-void dispc_wb_enable(bool enable)
-{
-	dispc_ovl_enable(OMAP_DSS_WB, enable);
-}
-
-bool dispc_wb_is_enabled(void)
-{
-	return dispc_ovl_enabled(OMAP_DSS_WB);
-}
-
 static void dispc_lcd_enable_signal_polarity(bool act_high)
 {
 	if (!dss_has_feature(FEAT_LCDENABLEPOL))
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.h b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
index a2269008590f..21cfcbf74a6d 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.h
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
@@ -89,17 +89,6 @@ enum dss_dsi_content_type {
 	DSS_DSI_CONTENT_GENERIC,
 };
 
-enum dss_writeback_channel {
-	DSS_WB_LCD1_MGR =	0,
-	DSS_WB_LCD2_MGR =	1,
-	DSS_WB_TV_MGR =		2,
-	DSS_WB_OVL0 =		3,
-	DSS_WB_OVL1 =		4,
-	DSS_WB_OVL2 =		5,
-	DSS_WB_OVL3 =		6,
-	DSS_WB_LCD3_MGR =	7,
-};
-
 enum dss_pll_id {
 	DSS_PLL_DSI1,
 	DSS_PLL_DSI2,
@@ -403,15 +392,6 @@ int dispc_mgr_get_clock_div(enum omap_channel channel,
 		struct dispc_clock_info *cinfo);
 void dispc_set_tv_pclk(unsigned long pclk);
 
-u32 dispc_wb_get_framedone_irq(void);
-bool dispc_wb_go_busy(void);
-void dispc_wb_go(void);
-void dispc_wb_enable(bool enable);
-bool dispc_wb_is_enabled(void);
-void dispc_wb_set_channel_in(enum dss_writeback_channel channel);
-int dispc_wb_setup(const struct omap_dss_writeback_info *wi,
-		bool mem_to_mem, const struct omap_video_timings *timings);
-
 u32 dispc_read_irqstatus(void);
 void dispc_clear_irqstatus(u32 mask);
 u32 dispc_read_irqenable(void);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
