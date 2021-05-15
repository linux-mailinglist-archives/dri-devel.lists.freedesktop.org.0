Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 462C4381AE2
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 21:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D2D6E43B;
	Sat, 15 May 2021 19:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4F96E43A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 19:56:15 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id i9so3072324lfe.13
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 12:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xLPVHzXvZPZqCUFMlT+UaetcRgvb81SJ4rZHo1/l8nY=;
 b=GU5IIubT7CmC5lmDf5QF/AAC62pL1eDpTwPVeJ9ffhvU8ho5taSSdqrLOltENkyCVA
 7u86uLmP8rOerBCD+9+GGXmEISyhXmHRntgXCcpPJNYFwLeu8AzuKnVluhIUCP+pHvnl
 QIYZsQHcJpN6hIRJqQ9R7qkxbcizn9+TssM0sGfDK1XmcgICPqyA7CtXVLfwcY1RMFp+
 imQA/KZJ9FD1/tmDEaakvkOe8g6FE/E89mulrHL99EgT2fWB1fdwbucScmlZD72t313E
 M8dHWetSC+zFnlO+yD5MGPZtTkzKsloySLSg5C0+lDVH62HuBMzFZOgl2wwt//Kthwsi
 fcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xLPVHzXvZPZqCUFMlT+UaetcRgvb81SJ4rZHo1/l8nY=;
 b=V34DZF9amqSILNmOut+YFwhlApyEKa3JIFH4WPhUTOJzavsEMYdQtvwztcs5yV+QB/
 At/KhTg9baVMU2r9umVLax3WfJdBGsVUSg9JyQ+upQwdp8gUTL9GOitKqJkPGOrPqqEh
 BR5o0kKlHde+cA79ZQcjRMmA6RGsSi1clydcLnvYpy3MIYHtLKWfSAmoqOIwMroJfye1
 +baOeQmf54bqnfI/P7yDUj9cd177MeQ6UIrfy3gUjj84UjbSMfdlIGt/5XuXZdlnuyIq
 32QQNTUxQR/r4DDq4o4fX7icUk18peSbaeyud5gwwwZddwhbaFFWs7wsm+TVKQ13gT7h
 9JcA==
X-Gm-Message-State: AOAM533nEZZwjEcNgeqqf5MJhNeA0oJPQrpp6HscDXysyD5WKJgeAHlh
 Told4QnyUQZvTsct6i053wfupw==
X-Google-Smtp-Source: ABdhPJzYPdt7f1LAXcEMzToEyXXFUw9rLsuh54lVh38GVHwxFBRNG2mmHrN0ExeUucT15WYsHHWooA==
X-Received: by 2002:a05:6512:33d0:: with SMTP id
 d16mr10314516lfg.184.1621108574018; 
 Sat, 15 May 2021 12:56:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u21sm1449989lff.66.2021.05.15.12.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 12:56:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH] drm/msm/dp: remove most of usbpd-related remains
Date: Sat, 15 May 2021 22:56:12 +0300
Message-Id: <20210515195612.1901147-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove most of remains of downstream usbpd code. Mainline kernel uses
different approach for managing Type-C / USB-PD, so this remains unused.
Do not touch usbpd callbacks for now, since they look usefull enough as
an example of how to handle connect/disconnect (to be rewritten into .

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile        |  1 -
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |  6 +--
 drivers/gpu/drm/msm/dp/dp_debug.h   |  4 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 36 ++-------------
 drivers/gpu/drm/msm/dp/dp_hpd.c     | 69 -----------------------------
 drivers/gpu/drm/msm/dp/dp_hpd.h     | 51 ---------------------
 drivers/gpu/drm/msm/dp/dp_power.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_power.h   |  3 +-
 10 files changed, 11 insertions(+), 168 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 610d630326bb..8a58c1615d38 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -107,7 +107,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
-	dp/dp_hpd.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
 	dp/dp_parser.o \
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1390f3547fde..7bb0f6a9b731 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1364,7 +1364,7 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
+int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool reset)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
@@ -1379,8 +1379,6 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
-	ctrl->dp_ctrl.orientation = flip;
-
 	if (reset)
 		dp_catalog_ctrl_reset(ctrl->catalog);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index a836bd358447..682c3c511e8e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -14,12 +14,11 @@
 #include "dp_catalog.h"
 
 struct dp_ctrl {
-	bool orientation;
 	atomic_t aborted;
 	u32 pixel_rate;
 };
 
-int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
+int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool reset);
 void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 2f6247e80e9d..eb6288dcabde 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -21,7 +21,6 @@
 struct dp_debug_private {
 	struct dentry *root;
 
-	struct dp_usbpd *usbpd;
 	struct dp_link *link;
 	struct dp_panel *panel;
 	struct drm_connector **connector;
@@ -390,14 +389,14 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 }
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
+		struct dp_link *link,
 		struct drm_connector **connector, struct drm_minor *minor)
 {
 	int rc = 0;
 	struct dp_debug_private *debug;
 	struct dp_debug *dp_debug;
 
-	if (!dev || !panel || !usbpd || !link) {
+	if (!dev || !panel || !link) {
 		DRM_ERROR("invalid input\n");
 		rc = -EINVAL;
 		goto error;
@@ -410,7 +409,6 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	}
 
 	debug->dp_debug.debug_en = false;
-	debug->usbpd = usbpd;
 	debug->link = link;
 	debug->panel = panel;
 	debug->dev = dev;
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 7eaedfbb149c..c5da109143da 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -42,7 +42,7 @@ struct dp_debug {
  * for debugfs input to be communicated with existing modules
  */
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
+		struct dp_link *link,
 		struct drm_connector **connector,
 		struct drm_minor *minor);
 
@@ -59,7 +59,7 @@ void dp_debug_put(struct dp_debug *dp_debug);
 
 static inline
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
+		struct dp_link *link,
 		struct drm_connector **connector, struct drm_minor *minor)
 {
 	return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1784e119269b..ee227c69f9f2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -88,7 +88,6 @@ struct dp_display_private {
 	struct platform_device *pdev;
 	struct dentry *root;
 
-	struct dp_usbpd   *usbpd;
 	struct dp_parser  *parser;
 	struct dp_power   *power;
 	struct dp_catalog *catalog;
@@ -361,20 +360,15 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 
 static void dp_display_host_init(struct dp_display_private *dp, int reset)
 {
-	bool flip = false;
-
 	if (dp->core_initialized) {
 		DRM_DEBUG_DP("DP core already initialized\n");
 		return;
 	}
 
-	if (dp->usbpd->orientation == ORIENTATION_CC2)
-		flip = true;
-
 	dp_display_set_encoder_mode(dp);
 
-	dp_power_init(dp->power, flip);
-	dp_ctrl_host_init(dp->ctrl, flip, reset);
+	dp_power_init(dp->power);
+	dp_ctrl_host_init(dp->ctrl, reset);
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
 }
@@ -502,7 +496,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 	int rc = 0;
 	u32 sink_request;
 	struct dp_display_private *dp;
-	struct dp_usbpd *hpd;
 
 	if (!dev) {
 		DRM_ERROR("invalid dev\n");
@@ -516,8 +509,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		return -ENODEV;
 	}
 
-	hpd = dp->usbpd;
-
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
 	if (!rc) {
@@ -533,14 +524,10 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 
 static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 {
-	struct dp_usbpd *hpd = dp->usbpd;
 	u32 state;
 	u32 tout = DP_TIMEOUT_5_SECOND;
 	int ret;
 
-	if (!hpd)
-		return 0;
-
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
@@ -563,11 +550,8 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 
 	dp->hpd_state = ST_CONNECT_PENDING;
 
-	hpd->hpd_high = 1;
-
 	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
 	if (ret) {	/* link train failed */
-		hpd->hpd_high = 0;
 		dp->hpd_state = ST_DISCONNECTED;
 
 		if (ret == -ECONNRESET) { /* cable unplugged */
@@ -619,12 +603,8 @@ static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
 
 static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 {
-	struct dp_usbpd *hpd = dp->usbpd;
 	u32 state;
 
-	if (!hpd)
-		return 0;
-
 	mutex_lock(&dp->event_mutex);
 
 	state = dp->hpd_state;
@@ -646,8 +626,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK
 				| DP_DP_IRQ_HPD_INT_MASK, false);
 
-	hpd->hpd_high = 0;
-
 	/*
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
@@ -744,14 +722,6 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	cb->disconnect = dp_display_usbpd_disconnect_cb;
 	cb->attention  = dp_display_usbpd_attention_cb;
 
-	dp->usbpd = dp_hpd_get(dev, cb);
-	if (IS_ERR(dp->usbpd)) {
-		rc = PTR_ERR(dp->usbpd);
-		DRM_ERROR("failed to initialize hpd, rc = %d\n", rc);
-		dp->usbpd = NULL;
-		goto error;
-	}
-
 	dp->parser = dp_parser_get(dp->pdev);
 	if (IS_ERR(dp->parser)) {
 		rc = PTR_ERR(dp->parser);
@@ -1380,7 +1350,7 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 	dev = &dp->pdev->dev;
 
-	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
+	dp->debug = dp_debug_get(dev, dp->panel,
 					dp->link, &dp->dp_display.connector,
 					minor);
 	if (IS_ERR(dp->debug)) {
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
deleted file mode 100644
index e1c90fa47411..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_hpd.c
+++ /dev/null
@@ -1,69 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
- */
-
-#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
-
-#include <linux/slab.h>
-#include <linux/device.h>
-
-#include "dp_hpd.h"
-
-/* DP specific VDM commands */
-#define DP_USBPD_VDM_STATUS	0x10
-#define DP_USBPD_VDM_CONFIGURE	0x11
-
-/* USBPD-TypeC specific Macros */
-#define VDM_VERSION		0x0
-#define USB_C_DP_SID		0xFF01
-
-struct dp_hpd_private {
-	struct device *dev;
-	struct dp_usbpd_cb *dp_cb;
-	struct dp_usbpd dp_usbpd;
-};
-
-int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
-{
-	int rc = 0;
-	struct dp_hpd_private *hpd_priv;
-
-	hpd_priv = container_of(dp_usbpd, struct dp_hpd_private,
-					dp_usbpd);
-
-	dp_usbpd->hpd_high = hpd;
-
-	if (!hpd_priv->dp_cb || !hpd_priv->dp_cb->configure
-				|| !hpd_priv->dp_cb->disconnect) {
-		pr_err("hpd dp_cb not initialized\n");
-		return -EINVAL;
-	}
-	if (hpd)
-		hpd_priv->dp_cb->configure(hpd_priv->dev);
-	else
-		hpd_priv->dp_cb->disconnect(hpd_priv->dev);
-
-	return rc;
-}
-
-struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
-{
-	struct dp_hpd_private *dp_hpd;
-
-	if (!cb) {
-		pr_err("invalid cb data\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	dp_hpd = devm_kzalloc(dev, sizeof(*dp_hpd), GFP_KERNEL);
-	if (!dp_hpd)
-		return ERR_PTR(-ENOMEM);
-
-	dp_hpd->dev = dev;
-	dp_hpd->dp_cb = cb;
-
-	dp_hpd->dp_usbpd.connect = dp_hpd_connect;
-
-	return &dp_hpd->dp_usbpd;
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_hpd.h
index 5bc5bb64680f..1d16cc49b5b7 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.h
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.h
@@ -11,42 +11,6 @@
 #include <linux/types.h>
 #include <linux/device.h>
 
-enum plug_orientation {
-	ORIENTATION_NONE,
-	ORIENTATION_CC1,
-	ORIENTATION_CC2,
-};
-
-/**
- * struct dp_usbpd - DisplayPort status
- *
- * @orientation: plug orientation configuration
- * @low_pow_st: low power state
- * @adaptor_dp_en: adaptor functionality enabled
- * @multi_func: multi-function preferred
- * @usb_config_req: request to switch to usb
- * @exit_dp_mode: request exit from displayport mode
- * @hpd_high: Hot Plug Detect signal is high.
- * @hpd_irq: Change in the status since last message
- * @alt_mode_cfg_done: bool to specify alt mode status
- * @debug_en: bool to specify debug mode
- * @connect: simulate disconnect or connect for debug mode
- */
-struct dp_usbpd {
-	enum plug_orientation orientation;
-	bool low_pow_st;
-	bool adaptor_dp_en;
-	bool multi_func;
-	bool usb_config_req;
-	bool exit_dp_mode;
-	bool hpd_high;
-	bool hpd_irq;
-	bool alt_mode_cfg_done;
-	bool debug_en;
-
-	int (*connect)(struct dp_usbpd *dp_usbpd, bool hpd);
-};
-
 /**
  * struct dp_usbpd_cb - callback functions provided by the client
  *
@@ -62,19 +26,4 @@ struct dp_usbpd_cb {
 	int (*attention)(struct device *dev);
 };
 
-/**
- * dp_hpd_get() - setup hpd module
- *
- * @dev: device instance of the caller
- * @cb: struct containing callback function pointers.
- *
- * This function allows the client to initialize the usbpd
- * module. The module will communicate with HPD module.
- */
-struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb);
-
-int dp_hpd_register(struct dp_usbpd *dp_usbpd);
-void dp_hpd_unregister(struct dp_usbpd *dp_usbpd);
-int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd);
-
 #endif /* _DP_HPD_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 3961ba4efc3c..6e3bcf582308 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -338,7 +338,7 @@ void dp_power_client_deinit(struct dp_power *dp_power)
 
 }
 
-int dp_power_init(struct dp_power *dp_power, bool flip)
+int dp_power_init(struct dp_power *dp_power)
 {
 	int rc = 0;
 	struct dp_power_private *power = NULL;
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 7d0327bbc0d5..7c445f51b0f8 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -26,13 +26,12 @@ struct dp_power {
  * dp_power_init() - enable power supplies for display controller
  *
  * @power: instance of power module
- * @flip: bool for flipping gpio direction
  * return: 0 if success or error if failure.
  *
  * This API will turn on the regulators and configures gpio's
  * aux/hpd.
  */
-int dp_power_init(struct dp_power *power, bool flip);
+int dp_power_init(struct dp_power *power);
 
 /**
  * dp_power_deinit() - turn off regulators and gpios.
-- 
2.30.2

