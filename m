Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC277F7DA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 15:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31B710E49A;
	Thu, 17 Aug 2023 13:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C1D10E47D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 13:37:58 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRQyS3w3wzkWsb
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 21:36:32 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 21:37:54 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <patrik.r.jakobsson@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <yuehaibing@huawei.com>
Subject: [PATCH -next] drm/gma500: Remove unused declarations
Date: Thu, 17 Aug 2023 21:37:54 +0800
Message-ID: <20230817133754.36524-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These declarations are not implemented now, remove them.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/gma500/gma_display.h   |  1 -
 drivers/gpu/drm/gma500/psb_intel_drv.h | 14 --------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gma_display.h b/drivers/gpu/drm/gma500/gma_display.h
index c8b611a2f6c6..1188a8d61caf 100644
--- a/drivers/gpu/drm/gma500/gma_display.h
+++ b/drivers/gpu/drm/gma500/gma_display.h
@@ -81,7 +81,6 @@ extern void gma_encoder_destroy(struct drm_encoder *encoder);
 
 /* Common clock related functions */
 extern const struct gma_limit_t *gma_limit(struct drm_crtc *crtc, int refclk);
-extern void gma_clock(int refclk, struct gma_clock_t *clock);
 extern bool gma_pll_is_valid(struct drm_crtc *crtc,
 			     const struct gma_limit_t *limit,
 			     struct gma_clock_t *clock);
diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index 0bb85494e3da..c111e933e1ed 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -186,19 +186,13 @@ extern bool psb_intel_ddc_probe(struct i2c_adapter *adapter);
 
 extern void psb_intel_crtc_init(struct drm_device *dev, int pipe,
 			    struct psb_intel_mode_device *mode_dev);
-extern void psb_intel_crt_init(struct drm_device *dev);
 extern bool psb_intel_sdvo_init(struct drm_device *dev, int output_device);
-extern void psb_intel_dvo_init(struct drm_device *dev);
-extern void psb_intel_tv_init(struct drm_device *dev);
 extern void psb_intel_lvds_init(struct drm_device *dev,
 			    struct psb_intel_mode_device *mode_dev);
 extern void psb_intel_lvds_set_brightness(struct drm_device *dev, int level);
 extern void oaktrail_lvds_init(struct drm_device *dev,
 			   struct psb_intel_mode_device *mode_dev);
-extern void oaktrail_wait_for_INTR_PKT_SENT(struct drm_device *dev);
 struct gma_i2c_chan *oaktrail_lvds_i2c_init(struct drm_device *dev);
-extern void mid_dsi_init(struct drm_device *dev,
-		    struct psb_intel_mode_device *mode_dev, int dsi_num);
 
 extern struct drm_encoder *gma_best_encoder(struct drm_connector *connector);
 extern void gma_connector_attach_encoder(struct gma_connector *connector,
@@ -214,11 +208,6 @@ extern struct drm_display_mode *psb_intel_crtc_mode_get(struct drm_device *dev,
 						    struct drm_crtc *crtc);
 extern struct drm_crtc *psb_intel_get_crtc_from_pipe(struct drm_device *dev,
 						 int pipe);
-extern struct drm_connector *psb_intel_sdvo_find(struct drm_device *dev,
-					     int sdvoB);
-extern int intelfb_probe(struct drm_device *dev);
-extern int intelfb_remove(struct drm_device *dev,
-			  struct drm_framebuffer *fb);
 extern bool psb_intel_lvds_mode_fixup(struct drm_encoder *encoder,
 				      const struct drm_display_mode *mode,
 				      struct drm_display_mode *adjusted_mode);
@@ -242,9 +231,6 @@ extern void cdv_intel_dp_set_m_n(struct drm_crtc *crtc,
 					struct drm_display_mode *mode,
 					struct drm_display_mode *adjusted_mode);
 
-extern void psb_intel_attach_force_audio_property(struct drm_connector *connector);
-extern void psb_intel_attach_broadcast_rgb_property(struct drm_connector *connector);
-
 extern int cdv_sb_read(struct drm_device *dev, u32 reg, u32 *val);
 extern int cdv_sb_write(struct drm_device *dev, u32 reg, u32 val);
 extern void cdv_sb_reset(struct drm_device *dev);
-- 
2.34.1

