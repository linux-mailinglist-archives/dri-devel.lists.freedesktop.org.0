Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1BB385F1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B820310E854;
	Wed, 27 Aug 2025 15:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MSPdAfpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0231910E852
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:13:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 57EA560263;
 Wed, 27 Aug 2025 15:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89081C4CEF5;
 Wed, 27 Aug 2025 15:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307602;
 bh=tWsxGVcKib0fDaqq91LOvavfQcyKFv9WvHc0m6iqCjE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MSPdAfpA0B7jrV3ompE5nBjGJRykUUdfgTIxjZth+odWmE+phyecL7T/ZYDQEVjA2
 VTn1ZIlxRSP0XIHkiwYgwfNhPr4ZKGVOX3RRW5yT7d83XlGaUr2lCnpMRUv+k5A+Cn
 PkJxmKlkDN9t1Wgo3PMpLkpQwym2xYI64UxsTibjxUlE7ndEG4DU/ggUE1reHtboKt
 f5OMRn1pLxIu5ec969IHciWCgSufYaibp+4Uo8dZSpxrkGmdG7WQa23h3Dprx42/d1
 GmkYEm2HM0hFlC9FSyLQpqYDSyN6d+O1abUljdHMgO+QdSJRvY1FSwe/8XGVi0ZoHs
 ZilbMl5nGQMng==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Aug 2025 17:12:45 +0200
Subject: [PATCH v3 14/14] drm/tidss: dispc: Define field masks being used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-drm-tidss-field-api-v3-14-7689b664cc63@kernel.org>
References: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
In-Reply-To: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=27100; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tWsxGVcKib0fDaqq91LOvavfQcyKFv9WvHc0m6iqCjE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFTI1wx8tbQ7QeLDqu2CZZP2vQMYZu9Rqix0237qYI
 fnJ62xNx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIsQdjnaaZwiyxh3cW/Gs8
 PtP6qevvRfmaCv+0z95vSdkw+0A/2/7P4RG/GHs3ZgWExXl8CO5OYmyY2dNwX1/u5J6ry3wnKjT
 OUi01WvC93m3ZI4OtZ9wkOhpCRG+ZyMWsfjr9wqMPBzw5XQwB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Now that we have all the accessors taking masks, we can create defines
for them and reuse them as needed.

It makes the driver easier to read, less prone to consistency issues,
and allows to reuse defines when needed.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c      | 139 +++++++++++++++++--------------
 drivers/gpu/drm/tidss/tidss_dispc_regs.h |  76 +++++++++++++++++
 2 files changed, 154 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 9ecbea60d37cf981c8ce00f075f19f925cce44be..97e2cd7b1e209ed9181a8a5e7d70f03a2470ba1c 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1112,11 +1112,11 @@ static void dispc_set_num_datalines(struct dispc_device *dispc,
 		WARN_ON(1);
 		v = 3;
 	}
 
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, v,
-		       GENMASK(10, 8));
+		       DISPC_VP_CONTROL_DATALINES_MASK);
 }
 
 static void dispc_enable_am65x_oldi(struct dispc_device *dispc, u32 hw_videoport,
 				    const struct dispc_bus_format *fmt)
 {
@@ -1135,11 +1135,12 @@ static void dispc_enable_am65x_oldi(struct dispc_device *dispc, u32 hw_videoport
 		dev_warn(dispc->dev, "%s: %d port width not supported\n",
 			 __func__, fmt->data_width);
 
 	oldi_cfg |= BIT(7); /* DEPOL */
 
-	FIELD_MODIFY(GENMASK(3, 1), &oldi_cfg, fmt->am65x_oldi_mode_reg_val);
+	FIELD_MODIFY(DISPC_VP_DSS_OLDI_CFG_MAP_MASK, &oldi_cfg,
+		     fmt->am65x_oldi_mode_reg_val);
 
 	oldi_cfg |= BIT(12); /* SOFTRST */
 
 	oldi_cfg |= BIT(0); /* ENABLE */
 
@@ -1197,18 +1198,18 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 	vfp = mode->crtc_vsync_start - mode->crtc_vdisplay;
 	vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
 	vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_TIMING_H,
-		       FIELD_PREP(GENMASK(7, 0), hsw - 1) |
-		       FIELD_PREP(GENMASK(19, 8), hfp - 1) |
-		       FIELD_PREP(GENMASK(31, 20), hbp - 1));
+		       FIELD_PREP(DISPC_VP_TIMING_H_SYNC_PULSE_MASK, hsw - 1) |
+		       FIELD_PREP(DISPC_VP_TIMING_H_FRONT_PORCH_MASK, hfp - 1) |
+		       FIELD_PREP(DISPC_VP_TIMING_H_BACK_PORCH_MASK, hbp - 1));
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_TIMING_V,
-		       FIELD_PREP(GENMASK(7, 0), vsw - 1) |
-		       FIELD_PREP(GENMASK(19, 8), vfp) |
-		       FIELD_PREP(GENMASK(31, 20), vbp));
+		       FIELD_PREP(DISPC_VP_TIMING_V_SYNC_PULSE_MASK, vsw - 1) |
+		       FIELD_PREP(DISPC_VP_TIMING_V_FRONT_PORCH_MASK, vfp) |
+		       FIELD_PREP(DISPC_VP_TIMING_V_BACK_PORCH_MASK, vbp));
 
 	ivs = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
 
 	ihs = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
 
@@ -1227,30 +1228,32 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 	/* always use DE_HIGH for OLDI */
 	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI_AM65X)
 		ieo = false;
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_POL_FREQ,
-		       FIELD_PREP(GENMASK(18, 18), align) |
-		       FIELD_PREP(GENMASK(17, 17), onoff) |
-		       FIELD_PREP(GENMASK(16, 16), rf) |
-		       FIELD_PREP(GENMASK(15, 15), ieo) |
-		       FIELD_PREP(GENMASK(14, 14), ipc) |
-		       FIELD_PREP(GENMASK(13, 13), ihs) |
-		       FIELD_PREP(GENMASK(12, 12), ivs));
+		       FIELD_PREP(DISPC_VP_POL_FREQ_ALIGN_MASK, align) |
+		       FIELD_PREP(DISPC_VP_POL_FREQ_ONOFF_MASK, onoff) |
+		       FIELD_PREP(DISPC_VP_POL_FREQ_RF_MASK, rf) |
+		       FIELD_PREP(DISPC_VP_POL_FREQ_IEO_MASK, ieo) |
+		       FIELD_PREP(DISPC_VP_POL_FREQ_IPC_MASK, ipc) |
+		       FIELD_PREP(DISPC_VP_POL_FREQ_IHS_MASK, ihs) |
+		       FIELD_PREP(DISPC_VP_POL_FREQ_IVS_MASK, ivs));
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_SIZE_SCREEN,
-		       FIELD_PREP(GENMASK(11, 0), mode->crtc_hdisplay - 1) |
-		       FIELD_PREP(GENMASK(27, 16), mode->crtc_vdisplay - 1));
+		       FIELD_PREP(DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK,
+				  mode->crtc_hdisplay - 1) |
+		       FIELD_PREP(DISPC_VP_SIZE_SCREEN_VDISPLAY_MASK,
+				  mode->crtc_vdisplay - 1));
 
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1,
-		       GENMASK(0, 0));
+		       DISPC_VP_CONTROL_ENABLE_MASK);
 }
 
 void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
 {
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 0,
-		       GENMASK(0, 0));
+		       DISPC_VP_CONTROL_ENABLE_MASK);
 }
 
 void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport)
 {
 	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI_AM65X) {
@@ -1261,18 +1264,19 @@ void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport)
 }
 
 bool dispc_vp_go_busy(struct dispc_device *dispc, u32 hw_videoport)
 {
 	return VP_REG_GET(dispc, hw_videoport, DISPC_VP_CONTROL,
-			  GENMASK(5, 5));
+			  DISPC_VP_CONTROL_GOBIT_MASK);
 }
 
 void dispc_vp_go(struct dispc_device *dispc, u32 hw_videoport)
 {
-	WARN_ON(VP_REG_GET(dispc, hw_videoport, DISPC_VP_CONTROL, GENMASK(5, 5)));
+	WARN_ON(VP_REG_GET(dispc, hw_videoport, DISPC_VP_CONTROL,
+			   DISPC_VP_CONTROL_GOBIT_MASK));
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1,
-		       GENMASK(5, 5));
+		       DISPC_VP_CONTROL_GOBIT_MASK);
 }
 
 enum c8_to_c12_mode { C8_TO_C12_REPLICATE, C8_TO_C12_MAX, C8_TO_C12_MIN };
 
 static u16 c8_to_c12(u8 c8, enum c8_to_c12_mode mode)
@@ -1468,29 +1472,29 @@ static void dispc_am65x_ovr_set_plane(struct dispc_device *dispc,
 				      u32 x, u32 y, u32 layer)
 {
 	u32 hw_id = dispc->feat->vid_info[hw_plane].hw_id;
 
 	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
-			hw_id, GENMASK(4, 1));
+			hw_id, DISPC_OVR_ATTRIBUTES_CHANNELIN_MASK);
 	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer), x,
-			GENMASK(17, 6));
+			DISPC_OVR_ATTRIBUTES_POSX_MASK);
 	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer), y,
-			GENMASK(30, 19));
+			DISPC_OVR_ATTRIBUTES_POSY_MASK);
 }
 
 static void dispc_j721e_ovr_set_plane(struct dispc_device *dispc,
 				      u32 hw_plane, u32 hw_videoport,
 				      u32 x, u32 y, u32 layer)
 {
 	u32 hw_id = dispc->feat->vid_info[hw_plane].hw_id;
 
 	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
-			hw_id, GENMASK(4, 1));
+			hw_id, DISPC_OVR_ATTRIBUTES_CHANNELIN_MASK);
 	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(layer), x,
-			GENMASK(13, 0));
+			DISPC_OVR_ATTRIBUTES2_POSX_MASK);
 	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(layer), y,
-			GENMASK(29, 16));
+			DISPC_OVR_ATTRIBUTES2_POSY_MASK);
 }
 
 void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
 			 u32 hw_videoport, u32 x, u32 y, u32 layer)
 {
@@ -1521,11 +1525,11 @@ void dispc_ovr_enable_layer(struct dispc_device *dispc,
 {
 	if (dispc->feat->subrev == DISPC_K2G)
 		return;
 
 	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
-			!!enable, GENMASK(0, 0));
+			!!enable, DISPC_OVR_ATTRIBUTES_ENABLE_MASK);
 }
 
 /* CSC */
 enum csc_ctm {
 	CSC_RR, CSC_RG, CSC_RB,
@@ -1745,11 +1749,11 @@ static void dispc_vid_csc_setup(struct dispc_device *dispc, u32 hw_plane,
 
 static void dispc_vid_csc_enable(struct dispc_device *dispc, u32 hw_plane,
 				 bool enable)
 {
 	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable,
-			GENMASK(9, 9));
+			DISPC_VID_ATTRIBUTES_COLORCONVENABLE_MASK);
 }
 
 /* SCALER */
 
 static u32 dispc_calc_fir_inc(u32 in, u32 out)
@@ -2003,23 +2007,23 @@ static void dispc_vid_set_scaling(struct dispc_device *dispc,
 				  struct dispc_scaling_params *sp,
 				  u32 fourcc)
 {
 	/* HORIZONTAL RESIZE ENABLE */
 	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, sp->scale_x,
-			GENMASK(7, 7));
+			DISPC_VID_ATTRIBUTES_HRESIZEENABLE_MASK);
 
 	/* VERTICAL RESIZE ENABLE */
 	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, sp->scale_y,
-			GENMASK(8, 8));
+			DISPC_VID_ATTRIBUTES_VRESIZEENABLE_MASK);
 
 	/* Skip the rest if no scaling is used */
 	if (!sp->scale_x && !sp->scale_y)
 		return;
 
 	/* VERTICAL 5-TAPS  */
 	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, sp->five_taps,
-			GENMASK(21, 21));
+			DISPC_VID_ATTRIBUTES_VERTICALTAPS_MASK);
 
 	if (dispc_fourcc_is_yuv(fourcc)) {
 		if (sp->scale_x) {
 			dispc_vid_write(dispc, hw_plane, DISPC_VID_FIRH2,
 					sp->fir_xinc_uv);
@@ -2105,11 +2109,11 @@ static void dispc_plane_set_pixel_format(struct dispc_device *dispc,
 
 	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i) {
 		if (dispc_color_formats[i].fourcc == fourcc) {
 			VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES,
 					dispc_color_formats[i].dss_code,
-					GENMASK(6, 1));
+					DISPC_VID_ATTRIBUTES_FORMAT_MASK);
 			return;
 		}
 	}
 
 	WARN_ON(1);
@@ -2227,11 +2231,12 @@ void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_EXT_0, (u64)dma_addr >> 32);
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_1, dma_addr & 0xffffffff);
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_EXT_1, (u64)dma_addr >> 32);
 
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_PICTURE_SIZE,
-			(scale.in_w - 1) | ((scale.in_h - 1) << 16));
+			FIELD_PREP(DISPC_VID_PICTURE_SIZE_MEMSIZEY_MASK, scale.in_h - 1) |
+			FIELD_PREP(DISPC_VID_PICTURE_SIZE_MEMSIZEX_MASK, scale.in_w - 1));
 
 	/* For YUV422 format we use the macropixel size for pixel inc */
 	if (fourcc == DRM_FORMAT_YUYV || fourcc == DRM_FORMAT_UYVY)
 		dispc_vid_write(dispc, hw_plane, DISPC_VID_PIXEL_INC,
 				pixinc(scale.xinc, cpp * 2));
@@ -2264,12 +2269,14 @@ void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 				       cpp_uv));
 	}
 
 	if (!lite) {
 		dispc_vid_write(dispc, hw_plane, DISPC_VID_SIZE,
-				(state->crtc_w - 1) |
-				((state->crtc_h - 1) << 16));
+				FIELD_PREP(DISPC_VID_SIZE_SIZEY_MASK,
+					   state->crtc_h - 1) |
+				FIELD_PREP(DISPC_VID_SIZE_SIZEX_MASK,
+					   state->crtc_w - 1));
 
 		dispc_vid_set_scaling(dispc, hw_plane, &scale, fourcc);
 	}
 
 	/* enable YUV->RGB color conversion */
@@ -2279,56 +2286,63 @@ void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 	} else {
 		dispc_vid_csc_enable(dispc, hw_plane, false);
 	}
 
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_GLOBAL_ALPHA,
-			0xFF & (state->alpha >> 8));
+			FIELD_PREP(DISPC_VID_GLOBAL_ALPHA_GLOBALALPHA_MASK,
+				   state->alpha >> 8));
 
 	if (state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI)
 		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 1,
-				GENMASK(28, 28));
+				DISPC_VID_ATTRIBUTES_PREMULTIPLYALPHA_MASK);
 	else
 		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 0,
-				GENMASK(28, 28));
+				DISPC_VID_ATTRIBUTES_PREMULTIPLYALPHA_MASK);
 }
 
 void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable)
 {
 	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable,
-			GENMASK(0, 0));
+			DISPC_VID_ATTRIBUTES_ENABLE_MASK);
 }
 
 static u32 dispc_vid_get_fifo_size(struct dispc_device *dispc, u32 hw_plane)
 {
 	return VID_REG_GET(dispc, hw_plane, DISPC_VID_BUF_SIZE_STATUS,
-			   GENMASK(15, 0));
+			   DISPC_VID_BUF_SIZE_STATUS_BUFSIZE_MASK);
 }
 
 static void dispc_vid_set_mflag_threshold(struct dispc_device *dispc,
 					  u32 hw_plane, u32 low, u32 high)
 {
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_MFLAG_THRESHOLD,
-			FIELD_PREP(GENMASK(31, 16), high) | FIELD_PREP(GENMASK(15, 0), low));
+			FIELD_PREP(DISPC_VID_MFLAG_THRESHOLD_HT_MFLAG_MASK, high) |
+			FIELD_PREP(DISPC_VID_MFLAG_THRESHOLD_LT_MFLAG_MASK, low));
 }
 
 static void dispc_vid_set_buf_threshold(struct dispc_device *dispc,
 					u32 hw_plane, u32 low, u32 high)
 {
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_BUF_THRESHOLD,
-			FIELD_PREP(GENMASK(31, 16), high) | FIELD_PREP(GENMASK(15, 0), low));
+			FIELD_PREP(DISPC_VID_BUF_THRESHOLD_BUFHIGHTHRESHOLD_MASK,
+				   high) |
+			FIELD_PREP(DISPC_VID_BUF_THRESHOLD_BUFLOWTHRESHOLD_MASK,
+				   low));
 }
 
 static void dispc_k2g_plane_init(struct dispc_device *dispc)
 {
 	unsigned int hw_plane;
 
 	dev_dbg(dispc->dev, "%s()\n", __func__);
 
 	/* MFLAG_CTRL = ENABLED */
-	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 2, GENMASK(1, 0));
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 2,
+		    DISPC_GLOBAL_MFLAG_ATTRIBUTE_MFLAG_CTRL_MASK);
 	/* MFLAG_START = MFLAGNORMALSTARTMODE */
-	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, GENMASK(6, 6));
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0,
+		    DISPC_GLOBAL_MFLAG_ATTRIBUTE_MFLAG_START_MASK);
 
 	for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
 		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
 		u32 thr_low, thr_high;
 		u32 mflag_low, mflag_high;
@@ -2361,11 +2375,11 @@ static void dispc_k2g_plane_init(struct dispc_device *dispc)
 		 * Prefetch up to fifo high-threshold value to minimize the
 		 * possibility of underflows. Note that this means the PRELOAD
 		 * register is ignored.
 		 */
 		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 1,
-				GENMASK(19, 19));
+				DISPC_VID_ATTRIBUTES_BUFPRELOAD_MASK);
 	}
 }
 
 static void dispc_k3_plane_init(struct dispc_device *dispc)
 {
@@ -2373,17 +2387,19 @@ static void dispc_k3_plane_init(struct dispc_device *dispc)
 	u32 cba_lo_pri = 1;
 	u32 cba_hi_pri = 0;
 
 	dev_dbg(dispc->dev, "%s()\n", __func__);
 
-	REG_FLD_MOD(dispc, DSS_CBA_CFG, cba_lo_pri, GENMASK(2, 0));
-	REG_FLD_MOD(dispc, DSS_CBA_CFG, cba_hi_pri, GENMASK(5, 3));
+	REG_FLD_MOD(dispc, DSS_CBA_CFG, cba_lo_pri, DSS_CBA_CFG_PRI_LO_MASK);
+	REG_FLD_MOD(dispc, DSS_CBA_CFG, cba_hi_pri, DSS_CBA_CFG_PRI_HI_MASK);
 
 	/* MFLAG_CTRL = ENABLED */
-	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 2, GENMASK(1, 0));
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 2,
+		    DISPC_GLOBAL_MFLAG_ATTRIBUTE_MFLAG_CTRL_MASK);
 	/* MFLAG_START = MFLAGNORMALSTARTMODE */
-	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, GENMASK(6, 6));
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0,
+		    DISPC_GLOBAL_MFLAG_ATTRIBUTE_MFLAG_START_MASK);
 
 	for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
 		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
 		u32 thr_low, thr_high;
 		u32 mflag_low, mflag_high;
@@ -2412,11 +2428,11 @@ static void dispc_k3_plane_init(struct dispc_device *dispc)
 
 		dispc_vid_write(dispc, hw_plane, DISPC_VID_PRELOAD, preload);
 
 		/* Prefech up to PRELOAD value */
 		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 0,
-				GENMASK(19, 19));
+				DISPC_VID_ATTRIBUTES_BUFPRELOAD_MASK);
 	}
 }
 
 static void dispc_plane_init(struct dispc_device *dispc)
 {
@@ -2442,23 +2458,24 @@ static void dispc_vp_init(struct dispc_device *dispc)
 
 	dev_dbg(dispc->dev, "%s()\n", __func__);
 
 	/* Enable the gamma Shadow bit-field for all VPs*/
 	for (i = 0; i < dispc->feat->num_vps; i++)
-		VP_REG_FLD_MOD(dispc, i, DISPC_VP_CONFIG, 1, GENMASK(2, 2));
+		VP_REG_FLD_MOD(dispc, i, DISPC_VP_CONFIG, 1,
+			       DISPC_VP_CONFIG_GAMMAENABLE_MASK);
 }
 
 static void dispc_initial_config(struct dispc_device *dispc)
 {
 	dispc_plane_init(dispc);
 	dispc_vp_init(dispc);
 
 	/* Note: Hardcoded DPI routing on J721E for now */
 	if (dispc->feat->subrev == DISPC_J721E) {
 		dispc_write(dispc, DISPC_CONNECTIONS,
-			    FIELD_PREP(GENMASK(3, 0), 2) |		/* VP1 to DPI0 */
-			    FIELD_PREP(GENMASK(7, 4), 8)		/* VP3 to DPI1 */
+			    FIELD_PREP(DISPC_CONNECTIONS_DPI_0_CONN_MASK, 2) |		/* VP1 to DPI0 */
+			    FIELD_PREP(DISPC_CONNECTIONS_DPI_1_CONN_MASK, 8)		/* VP3 to DPI1 */
 			);
 	}
 }
 
 static void dispc_k2g_vp_write_gamma_table(struct dispc_device *dispc,
@@ -2676,11 +2693,11 @@ static void dispc_k2g_vp_set_ctm(struct dispc_device *dispc, u32 hw_videoport,
 		dispc_k2g_vp_write_csc(dispc, hw_videoport, &cpr);
 		cprenable = 1;
 	}
 
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONFIG, cprenable,
-		       GENMASK(15, 15));
+		       DISPC_VP_CONFIG_CPR_MASK);
 }
 
 static s16 dispc_S31_32_to_s3_8(s64 coef)
 {
 	u64 sign_bit = 1ULL << 63;
@@ -2742,11 +2759,11 @@ static void dispc_k3_vp_set_ctm(struct dispc_device *dispc, u32 hw_videoport,
 		dispc_k3_vp_write_csc(dispc, hw_videoport, &csc);
 		colorconvenable = 1;
 	}
 
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONFIG, colorconvenable,
-		       GENMASK(24, 24));
+		       DISPC_VP_CONFIG_COLORCONVENABLE_MASK);
 }
 
 static void dispc_vp_set_color_mgmt(struct dispc_device *dispc,
 				    u32 hw_videoport,
 				    const struct drm_crtc_state *state,
@@ -2797,11 +2814,11 @@ int dispc_runtime_resume(struct dispc_device *dispc)
 {
 	dev_dbg(dispc->dev, "resume\n");
 
 	clk_prepare_enable(dispc->fclk);
 
-	if (REG_GET(dispc, DSS_SYSSTATUS, GENMASK(0, 0)) == 0)
+	if (REG_GET(dispc, DSS_SYSSTATUS, DSS_SYSSTATUS_DISPC_FUNC_RESETDONE) == 0)
 		dev_warn(dispc->dev, "DSS FUNC RESET not done!\n");
 
 	dev_dbg(dispc->dev, "OMAP DSS7 rev 0x%x\n",
 		dispc_read(dispc, DSS_REVISION));
 
@@ -2816,11 +2833,11 @@ int dispc_runtime_resume(struct dispc_device *dispc)
 			REG_GET(dispc, DSS_SYSSTATUS, GENMASK(5, 5)),
 			REG_GET(dispc, DSS_SYSSTATUS, GENMASK(6, 6)),
 			REG_GET(dispc, DSS_SYSSTATUS, GENMASK(7, 7)));
 
 	dev_dbg(dispc->dev, "DISPC IDLE %d\n",
-		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(9, 9)));
+		REG_GET(dispc, DSS_SYSSTATUS, DSS_SYSSTATUS_DISPC_IDLE_STATUS));
 
 	dispc_initial_config(dispc);
 
 	dispc->is_enabled = true;
 
@@ -2894,11 +2911,11 @@ static void dispc_softreset_k2g(struct dispc_device *dispc)
 	dispc_read_and_clear_irqstatus(dispc);
 	spin_unlock_irqrestore(&dispc->tidss->irq_lock, flags);
 
 	for (unsigned int vp_idx = 0; vp_idx < dispc->feat->num_vps; ++vp_idx)
 		VP_REG_FLD_MOD(dispc, vp_idx, DISPC_VP_CONTROL, 0,
-			       GENMASK(0, 0));
+			       DISPC_VP_CONTROL_ENABLE_MASK);
 }
 
 static int dispc_softreset(struct dispc_device *dispc)
 {
 	u32 val;
@@ -2908,11 +2925,11 @@ static int dispc_softreset(struct dispc_device *dispc)
 		dispc_softreset_k2g(dispc);
 		return 0;
 	}
 
 	/* Soft reset */
-	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, GENMASK(1, 1));
+	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, DSS_SYSCONFIG_SOFTRESET_MASK);
 	/* Wait for reset to complete */
 	ret = readl_poll_timeout(dispc->base_common + DSS_SYSSTATUS,
 				 val, val & 1, 100, 5000);
 	if (ret) {
 		dev_err(dispc->dev, "failed to reset dispc\n");
diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
index 50a3f28250efe61f1d98a456bf8907000109411c..382027dddce894b3b7d11172e23bf11883e25958 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
@@ -54,11 +54,16 @@ enum dispc_common_regs {
 
 #define REG(r) (dispc_common_regmap[r ## _OFF])
 
 #define DSS_REVISION			REG(DSS_REVISION)
 #define DSS_SYSCONFIG			REG(DSS_SYSCONFIG)
+#define DSS_SYSCONFIG_SOFTRESET_MASK		GENMASK(1, 1)
+
 #define DSS_SYSSTATUS			REG(DSS_SYSSTATUS)
+#define DSS_SYSSTATUS_DISPC_IDLE_STATUS		GENMASK(9, 9)
+#define DSS_SYSSTATUS_DISPC_FUNC_RESETDONE	GENMASK(0, 0)
+
 #define DISPC_IRQ_EOI			REG(DISPC_IRQ_EOI)
 #define DISPC_IRQSTATUS_RAW		REG(DISPC_IRQSTATUS_RAW)
 #define DISPC_IRQSTATUS			REG(DISPC_IRQSTATUS)
 #define DISPC_IRQENABLE_SET		REG(DISPC_IRQENABLE_SET)
 #define DISPC_IRQENABLE_CLR		REG(DISPC_IRQENABLE_CLR)
@@ -68,13 +73,19 @@ enum dispc_common_regs {
 #define DISPC_VP_IRQSTATUS(n)		(REG(DISPC_VP_IRQSTATUS) + (n) * 4)
 #define WB_IRQENABLE			REG(WB_IRQENABLE)
 #define WB_IRQSTATUS			REG(WB_IRQSTATUS)
 
 #define DISPC_GLOBAL_MFLAG_ATTRIBUTE	REG(DISPC_GLOBAL_MFLAG_ATTRIBUTE)
+#define DISPC_GLOBAL_MFLAG_ATTRIBUTE_MFLAG_START_MASK	GENMASK(6, 6)
+#define DISPC_GLOBAL_MFLAG_ATTRIBUTE_MFLAG_CTRL_MASK	GENMASK(1, 0)
+
 #define DISPC_GLOBAL_OUTPUT_ENABLE	REG(DISPC_GLOBAL_OUTPUT_ENABLE)
 #define DISPC_GLOBAL_BUFFER		REG(DISPC_GLOBAL_BUFFER)
 #define DSS_CBA_CFG			REG(DSS_CBA_CFG)
+#define DSS_CBA_CFG_PRI_HI_MASK			GENMASK(5, 3)
+#define DSS_CBA_CFG_PRI_LO_MASK			GENMASK(2, 0)
+
 #define DISPC_DBG_CONTROL		REG(DISPC_DBG_CONTROL)
 #define DISPC_DBG_STATUS		REG(DISPC_DBG_STATUS)
 #define DISPC_CLKGATING_DISABLE		REG(DISPC_CLKGATING_DISABLE)
 #define DISPC_SECURE_DISABLE		REG(DISPC_SECURE_DISABLE)
 
@@ -86,10 +97,13 @@ enum dispc_common_regs {
 #define FBDC_REVISION_6			REG(FBDC_REVISION_6)
 #define FBDC_COMMON_CONTROL		REG(FBDC_COMMON_CONTROL)
 #define FBDC_CONSTANT_COLOR_0		REG(FBDC_CONSTANT_COLOR_0)
 #define FBDC_CONSTANT_COLOR_1		REG(FBDC_CONSTANT_COLOR_1)
 #define DISPC_CONNECTIONS		REG(DISPC_CONNECTIONS)
+#define DISPC_CONNECTIONS_DPI_1_CONN_MASK	GENMASK(7, 4)
+#define DISPC_CONNECTIONS_DPI_0_CONN_MASK	GENMASK(3, 0)
+
 #define DISPC_MSS_VP1			REG(DISPC_MSS_VP1)
 #define DISPC_MSS_VP3			REG(DISPC_MSS_VP3)
 
 /* VID */
 
@@ -100,17 +114,31 @@ enum dispc_common_regs {
 #define DISPC_VID_ACCUV_0		0x10
 #define DISPC_VID_ACCUV_1		0x14
 #define DISPC_VID_ACCUV2_0		0x18
 #define DISPC_VID_ACCUV2_1		0x1c
 #define DISPC_VID_ATTRIBUTES		0x20
+#define DISPC_VID_ATTRIBUTES_PREMULTIPLYALPHA_MASK	GENMASK(28, 28)
+#define DISPC_VID_ATTRIBUTES_VERTICALTAPS_MASK		GENMASK(21, 21)
+#define DISPC_VID_ATTRIBUTES_BUFPRELOAD_MASK		GENMASK(19, 19)
+#define DISPC_VID_ATTRIBUTES_COLORCONVENABLE_MASK	GENMASK(9, 9)
+#define DISPC_VID_ATTRIBUTES_VRESIZEENABLE_MASK		GENMASK(8, 8)
+#define DISPC_VID_ATTRIBUTES_HRESIZEENABLE_MASK		GENMASK(7, 7)
+#define DISPC_VID_ATTRIBUTES_FORMAT_MASK		GENMASK(6, 1)
+#define DISPC_VID_ATTRIBUTES_ENABLE_MASK		GENMASK(0, 0)
+
 #define DISPC_VID_ATTRIBUTES2		0x24
 #define DISPC_VID_BA_0			0x28
 #define DISPC_VID_BA_1			0x2c
 #define DISPC_VID_BA_UV_0		0x30
 #define DISPC_VID_BA_UV_1		0x34
 #define DISPC_VID_BUF_SIZE_STATUS	0x38
+#define DISPC_VID_BUF_SIZE_STATUS_BUFSIZE_MASK	GENMASK(15, 0)
+
 #define DISPC_VID_BUF_THRESHOLD		0x3c
+#define DISPC_VID_BUF_THRESHOLD_BUFHIGHTHRESHOLD_MASK	GENMASK(31, 16)
+#define DISPC_VID_BUF_THRESHOLD_BUFLOWTHRESHOLD_MASK	GENMASK(15, 0)
+
 #define DISPC_VID_CSC_COEF(n)		(0x40 + (n) * 4)
 
 #define DISPC_VID_FIRH			0x5c
 #define DISPC_VID_FIRH2			0x60
 #define DISPC_VID_FIRV			0x64
@@ -135,19 +163,30 @@ enum dispc_common_regs {
 #define DISPC_VID_FIR_COEF_V12(phase)	(0x17c + (phase) * 4)
 #define DISPC_VID_FIR_COEFS_V12_C	0x1bc
 #define DISPC_VID_FIR_COEF_V12_C(phase)	(0x1bc + (phase) * 4)
 
 #define DISPC_VID_GLOBAL_ALPHA		0x1fc
+#define DISPC_VID_GLOBAL_ALPHA_GLOBALALPHA_MASK	GENMASK(7, 0)
+
 #define DISPC_VID_K2G_IRQENABLE		0x200 /* K2G */
 #define DISPC_VID_K2G_IRQSTATUS		0x204 /* K2G */
 #define DISPC_VID_MFLAG_THRESHOLD	0x208
+#define DISPC_VID_MFLAG_THRESHOLD_HT_MFLAG_MASK	GENMASK(31, 16)
+#define DISPC_VID_MFLAG_THRESHOLD_LT_MFLAG_MASK	GENMASK(15, 0)
+
 #define DISPC_VID_PICTURE_SIZE		0x20c
+#define DISPC_VID_PICTURE_SIZE_MEMSIZEY_MASK	GENMASK(27, 16)
+#define DISPC_VID_PICTURE_SIZE_MEMSIZEX_MASK	GENMASK(11, 0)
+
 #define DISPC_VID_PIXEL_INC		0x210
 #define DISPC_VID_K2G_POSITION		0x214 /* K2G */
 #define DISPC_VID_PRELOAD		0x218
 #define DISPC_VID_ROW_INC		0x21c
 #define DISPC_VID_SIZE			0x220
+#define DISPC_VID_SIZE_SIZEY_MASK		GENMASK(27, 16)
+#define DISPC_VID_SIZE_SIZEX_MASK		GENMASK(11, 0)
+
 #define DISPC_VID_BA_EXT_0		0x22c
 #define DISPC_VID_BA_EXT_1		0x230
 #define DISPC_VID_BA_UV_EXT_0		0x234
 #define DISPC_VID_BA_UV_EXT_1		0x238
 #define DISPC_VID_CSC_COEF7		0x23c
@@ -171,15 +210,31 @@ enum dispc_common_regs {
 #define DISPC_OVR_TRANS_COLOR_MAX	0x10
 #define DISPC_OVR_TRANS_COLOR_MAX2	0x14
 #define DISPC_OVR_TRANS_COLOR_MIN	0x18
 #define DISPC_OVR_TRANS_COLOR_MIN2	0x1c
 #define DISPC_OVR_ATTRIBUTES(n)		(0x20 + (n) * 4)
+#define DISPC_OVR_ATTRIBUTES_POSY_MASK		GENMASK(30, 19)
+#define DISPC_OVR_ATTRIBUTES_POSX_MASK		GENMASK(17, 6)
+#define DISPC_OVR_ATTRIBUTES_CHANNELIN_MASK	GENMASK(4, 1)
+#define DISPC_OVR_ATTRIBUTES_ENABLE_MASK	GENMASK(0, 0)
+
 #define DISPC_OVR_ATTRIBUTES2(n)	(0x34 + (n) * 4) /* J721E */
+#define DISPC_OVR_ATTRIBUTES2_POSY_MASK		GENMASK(29, 16)
+#define DISPC_OVR_ATTRIBUTES2_POSX_MASK		GENMASK(13, 0)
+
 /* VP */
 
 #define DISPC_VP_CONFIG				0x0
+#define DISPC_VP_CONFIG_COLORCONVENABLE_MASK		GENMASK(24, 24)
+#define DISPC_VP_CONFIG_CPR_MASK			GENMASK(15, 15)
+#define DISPC_VP_CONFIG_GAMMAENABLE_MASK		GENMASK(2, 2)
+
 #define DISPC_VP_CONTROL			0x4
+#define DISPC_VP_CONTROL_DATALINES_MASK			GENMASK(10, 8)
+#define DISPC_VP_CONTROL_GOBIT_MASK			GENMASK(5, 5)
+#define DISPC_VP_CONTROL_ENABLE_MASK			GENMASK(0, 0)
+
 #define DISPC_VP_CSC_COEF0			0x8
 #define DISPC_VP_CSC_COEF1			0xc
 #define DISPC_VP_CSC_COEF2			0x10
 #define DISPC_VP_DATA_CYCLE_0			0x14
 #define DISPC_VP_DATA_CYCLE_1			0x18
@@ -187,13 +242,32 @@ enum dispc_common_regs {
 #define DISPC_VP_K2G_IRQENABLE			0x3c /* K2G */
 #define DISPC_VP_K2G_IRQSTATUS			0x40 /* K2G */
 #define DISPC_VP_DATA_CYCLE_2			0x1c
 #define DISPC_VP_LINE_NUMBER			0x44
 #define DISPC_VP_POL_FREQ			0x4c
+#define DISPC_VP_POL_FREQ_ALIGN_MASK			GENMASK(18, 18)
+#define DISPC_VP_POL_FREQ_ONOFF_MASK			GENMASK(17, 17)
+#define DISPC_VP_POL_FREQ_RF_MASK			GENMASK(16, 16)
+#define DISPC_VP_POL_FREQ_IEO_MASK			GENMASK(15, 15)
+#define DISPC_VP_POL_FREQ_IPC_MASK			GENMASK(14, 14)
+#define DISPC_VP_POL_FREQ_IHS_MASK			GENMASK(13, 13)
+#define DISPC_VP_POL_FREQ_IVS_MASK			GENMASK(12, 12)
+
 #define DISPC_VP_SIZE_SCREEN			0x50
+#define DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK		GENMASK(11, 0)
+#define DISPC_VP_SIZE_SCREEN_VDISPLAY_MASK		GENMASK(27, 16)
+
 #define DISPC_VP_TIMING_H			0x54
+#define DISPC_VP_TIMING_H_SYNC_PULSE_MASK		GENMASK(7, 0)
+#define DISPC_VP_TIMING_H_FRONT_PORCH_MASK		GENMASK(19, 8)
+#define DISPC_VP_TIMING_H_BACK_PORCH_MASK		GENMASK(31, 20)
+
 #define DISPC_VP_TIMING_V			0x58
+#define DISPC_VP_TIMING_V_SYNC_PULSE_MASK		GENMASK(7, 0)
+#define DISPC_VP_TIMING_V_FRONT_PORCH_MASK		GENMASK(19, 8)
+#define DISPC_VP_TIMING_V_BACK_PORCH_MASK		GENMASK(31, 20)
+
 #define DISPC_VP_CSC_COEF3			0x5c
 #define DISPC_VP_CSC_COEF4			0x60
 #define DISPC_VP_CSC_COEF5			0x64
 #define DISPC_VP_CSC_COEF6			0x68
 #define DISPC_VP_CSC_COEF7			0x6c
@@ -218,10 +292,12 @@ enum dispc_common_regs {
 #define DISPC_VP_SAFETY_SIZE_2			0xf8
 #define DISPC_VP_SAFETY_SIZE_3			0xfc
 #define DISPC_VP_SAFETY_LFSR_SEED		0x110
 #define DISPC_VP_GAMMA_TABLE			0x120
 #define DISPC_VP_DSS_OLDI_CFG			0x160
+#define DISPC_VP_DSS_OLDI_CFG_MAP_MASK			GENMASK(3, 1)
+
 #define DISPC_VP_DSS_OLDI_STATUS		0x164
 #define DISPC_VP_DSS_OLDI_LB			0x168
 #define DISPC_VP_DSS_MERGE_SPLIT		0x16c /* J721E */
 #define DISPC_VP_DSS_DMA_THREADSIZE		0x170 /* J721E */
 #define DISPC_VP_DSS_DMA_THREADSIZE_STATUS	0x174 /* J721E */

-- 
2.50.1

