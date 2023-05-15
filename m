Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2C17021FC
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 05:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB2A10E12D;
	Mon, 15 May 2023 03:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0AD10E12A;
 Mon, 15 May 2023 03:03:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34F1kuZm022680; Mon, 15 May 2023 03:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=ajijvsob/QwEH7R/GGz8I5T/SCsAUDM7CeE9pzCNMU4=;
 b=JQTKh7kkcek7oh6hMLRBlJ4ETaBMiKqf/BnKaHPGZlbAPTdzPCDVtPXmGS43VZ4C7T7Q
 0xfwZ/y0EhPck1bl6q41/VIxktISNdoo1R5pFZJX+T5wbVORBeqyrThCfHyYj1589ojF
 +mPAZy9mkcHPgYPxiefwdO44E7G507w6g1zLSwz4c+32zqcnTTPU7sA0rW/Sq2EpaUSk
 y9IRVXDvR5zWAo4wodrwtnqsUE7akWyrGegig7NBclwY2HDAuvg32X0Y4MVw8NMSTSRW
 bayjl+p3cUNENnVntWObJXkDIvCfFE/i7OkFYDZrsJoqOCmkyq2iMaeodIk5m0Wl2wZm XQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qj2sb2kjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 03:03:03 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34F3329b009555
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 03:03:02 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Sun, 14 May 2023 20:03:02 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH 1/3] drm/msm/dp: Drop now unused dp_hpd module
Date: Sun, 14 May 2023 20:02:54 -0700
Message-ID: <20230515030256.300104-1-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: O2pUAAKOeGJ1PBydVIUeCemZ7fRPVf0F
X-Proofpoint-ORIG-GUID: O2pUAAKOeGJ1PBydVIUeCemZ7fRPVf0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-14_18,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1011 mlxscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305150024
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dp_hpd module is a remnant from the downstream design and is now
completely unused. Drop it and all references to it.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_debug.c   |  8 ++-
 drivers/gpu/drm/msm/dp/dp_debug.h   | 12 ++---
 drivers/gpu/drm/msm/dp/dp_display.c | 35 +------------
 drivers/gpu/drm/msm/dp/dp_hpd.c     | 67 -------------------------
 drivers/gpu/drm/msm/dp/dp_hpd.h     | 78 -----------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
 6 files changed, 11 insertions(+), 190 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 5e35033ba3e4..cdd72474197b 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -21,7 +21,6 @@
 struct dp_debug_private {
 	struct dentry *root;
 
-	struct dp_usbpd *usbpd;
 	struct dp_link *link;
 	struct dp_panel *panel;
 	struct drm_connector *connector;
@@ -232,14 +231,14 @@ static void dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 }
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector *connector, struct drm_minor *minor)
+			      struct dp_link *link, struct drm_connector *connector,
+			      struct drm_minor *minor)
 {
 	struct dp_debug_private *debug;
 	struct dp_debug *dp_debug;
 	int rc;
 
-	if (!dev || !panel || !usbpd || !link) {
+	if (!dev || !panel || !link) {
 		DRM_ERROR("invalid input\n");
 		rc = -EINVAL;
 		goto error;
@@ -252,7 +251,6 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	}
 
 	debug->dp_debug.debug_en = false;
-	debug->usbpd = usbpd;
 	debug->link = link;
 	debug->panel = panel;
 	debug->dev = dev;
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 8c0d0b5178fd..d99ef4532c9c 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -32,7 +32,6 @@ struct dp_debug {
  *
  * @dev: device instance of the caller
  * @panel: instance of panel module
- * @usbpd: instance of usbpd module
  * @link: instance of link module
  * @connector: double pointer to display connector
  * @minor: pointer to drm minor number after device registration
@@ -42,9 +41,9 @@ struct dp_debug {
  * for debugfs input to be communicated with existing modules
  */
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector *connector,
-		struct drm_minor *minor);
+			      struct dp_link *link,
+			      struct drm_connector *connector,
+			      struct drm_minor *minor);
 
 /**
  * dp_debug_put()
@@ -59,8 +58,9 @@ void dp_debug_put(struct dp_debug *dp_debug);
 
 static inline
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector *connector, struct drm_minor *minor)
+			      struct dp_link *link,
+			      struct drm_connector *connector,
+			      struct drm_minor *minor)
 {
 	return ERR_PTR(-EINVAL);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0477263bb55c..4df52ad2b462 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,7 +14,6 @@
 
 #include "msm_drv.h"
 #include "msm_kms.h"
-#include "dp_hpd.h"
 #include "dp_parser.h"
 #include "dp_power.h"
 #include "dp_catalog.h"
@@ -92,7 +91,6 @@ struct dp_display_private {
 	struct platform_device *pdev;
 	struct dentry *root;
 
-	struct dp_usbpd   *usbpd;
 	struct dp_parser  *parser;
 	struct dp_power   *power;
 	struct dp_catalog *catalog;
@@ -102,7 +100,6 @@ struct dp_display_private {
 	struct dp_ctrl    *ctrl;
 	struct dp_debug   *debug;
 
-	struct dp_usbpd_cb usbpd_cb;
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
@@ -493,11 +490,6 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 	return dp_display_process_hpd_high(dp);
 }
 
-static int dp_display_usbpd_disconnect_cb(struct device *dev)
-{
-	return 0;
-}
-
 static int dp_display_notify_disconnect(struct device *dev)
 {
 	struct dp_display_private *dp = dev_get_dp_display_private(dev);
@@ -582,13 +574,9 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 
 static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 {
-	struct dp_usbpd *hpd = dp->usbpd;
 	u32 state;
 	int ret;
 
-	if (!hpd)
-		return 0;
-
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
@@ -649,12 +637,8 @@ static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
 
 static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 {
-	struct dp_usbpd *hpd = dp->usbpd;
 	u32 state;
 
-	if (!hpd)
-		return 0;
-
 	mutex_lock(&dp->event_mutex);
 
 	state = dp->hpd_state;
@@ -767,24 +751,10 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 {
 	int rc = 0;
 	struct device *dev = &dp->pdev->dev;
-	struct dp_usbpd_cb *cb = &dp->usbpd_cb;
 	struct dp_panel_in panel_in = {
 		.dev = dev,
 	};
 
-	/* Callback APIs used for cable status change event */
-	cb->configure  = dp_display_usbpd_configure_cb;
-	cb->disconnect = dp_display_usbpd_disconnect_cb;
-	cb->attention  = dp_display_usbpd_attention_cb;
-
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
@@ -1544,9 +1514,8 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 	dev = &dp->pdev->dev;
 
-	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
-					dp->link, dp->dp_display.connector,
-					minor);
+	dp->debug = dp_debug_get(dev, dp->panel, dp->link,
+				 dp->dp_display.connector, minor);
 	if (IS_ERR(dp->debug)) {
 		rc = PTR_ERR(dp->debug);
 		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
deleted file mode 100644
index db98a1d431eb..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_hpd.c
+++ /dev/null
@@ -1,67 +0,0 @@
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
deleted file mode 100644
index 8feec5aa5027..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_hpd.h
+++ /dev/null
@@ -1,78 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DP_HPD_H_
-#define _DP_HPD_H_
-
-//#include <linux/usb/usbpd.h>
-
-#include <linux/types.h>
-#include <linux/device.h>
-
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
-	bool hpd_irq;
-	bool alt_mode_cfg_done;
-	bool debug_en;
-
-	int (*connect)(struct dp_usbpd *dp_usbpd, bool hpd);
-};
-
-/**
- * struct dp_usbpd_cb - callback functions provided by the client
- *
- * @configure: called by usbpd module when PD communication has
- * been completed and the usb peripheral has been configured on
- * dp mode.
- * @disconnect: notify the cable disconnect issued by usb.
- * @attention: notify any attention message issued by usb.
- */
-struct dp_usbpd_cb {
-	int (*configure)(struct device *dev);
-	int (*disconnect)(struct device *dev);
-	int (*attention)(struct device *dev);
-};
-
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
-#endif /* _DP_HPD_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 45208b45eb53..ed1030e17e1b 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -10,7 +10,6 @@
 
 #include "dp_aux.h"
 #include "dp_link.h"
-#include "dp_hpd.h"
 
 struct edid;
 
-- 
2.39.2

