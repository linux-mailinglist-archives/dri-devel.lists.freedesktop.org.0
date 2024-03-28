Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FF78901EC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 15:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72E6112465;
	Thu, 28 Mar 2024 14:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N/g6lUw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E56112459;
 Thu, 28 Mar 2024 14:35:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 895A461795;
 Thu, 28 Mar 2024 14:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2D2C43390;
 Thu, 28 Mar 2024 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711636524;
 bh=qX+y/C0y9wroOwogb2KVMotUMDlmKrr2lqvWjHDmCwo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=N/g6lUw/V5+Dn1CyziswhSJowu97u4s2RhHaKs24ha2wzOFHMoqhlqX2BSDHlRbnm
 sxw1PaqaqkBiZgk1IpkoVwIj47Q3DkNeVIAuP6fz+GGqC8pD6Dkcup8s7+jAdEZqhe
 4QuVCV8VWhWafV3IRoz+tDEa1zogRKjZTbeptgp1+uYgHl/VkEUcoQ2XAW83PP1uSs
 WIJD30mQp+kr4HcqcJB2vUV4oxy4ZzDnchBxXdDnJZfJPfFfdJlFNRr3hBxiRSS9oS
 VIhScfqaP+TDrsKW8V/z1ezUpqX+HNsg+gsarvUgHqEFPKQo50PYZvZJFT1uFYVgS3
 idaUjqX6hqWqg==
From: Bjorn Andersson <andersson@kernel.org>
Date: Thu, 28 Mar 2024 07:40:00 -0700
Subject: [PATCH v2 1/6] drm/msm/dp: Drop unused dp_debug struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-msm-dp-cleanup-v2-1-a5aed9798d32@quicinc.com>
References: <20240328-msm-dp-cleanup-v2-0-a5aed9798d32@quicinc.com>
In-Reply-To: <20240328-msm-dp-cleanup-v2-0-a5aed9798d32@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5776;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=gRF6CjyySMH8PFcvFDTXJIE5Z9XcpS26yBa7sMbPb1U=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmBYFI0fEm6X/VhX6veAPV4GpPT5Pp0nKWhL7cJ
 GG6nfMN+g2JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZgWBSBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUijA//aLsOsxPQ4eBuQRlVBBO95JgSvcrEFoWsa8unR7u
 mZuelXjP6It8vFchV3wbS8nmeQcHONIo3LChOtkRW8Aqna2FXN0tzsyexU4bZWloYJgR/ycOfyx
 BLSqYot6KxTWnSZ9RiPq9Ntk0fdHj99isEnvaxRfjHEBCBQdohkfxqtSXXWdmlVM3k0kVGk247C
 t7PqiW7vC98HwNwjMT4IkZIGq6yfssP5Vjomm6e/97LBLKDkXprx75NTyISIbp3aBNbhxrDQh69
 cIZ4TOtEo8A/FAlSlNiWpZQEV3DGeN5igqwjxK9fNroZwtJMSPdPlH509B1EGnLEW5o0sHfdN0w
 iXSFzjoZY8L7fLRC6bRAP5dx6+q1EiqKXvfzi7IP/r4wjrbRcyTzlckhdzpJsya6pXPhsWko4/c
 +ClMlN8nJfG5BedVa7nVUHqt0CVmQUq2EZQYok04NsuzyHCXnkrjD3LAuanB8rXl0OGd9m7JhY3
 cmIMXJLyhfi/ZHnTcu3IGl45RJB/scuyl31PGN7Difgpt+SE0XmzZjgjP2JMSF7MTDZBDIgkazm
 512UIWqbkA+FfVLjkKIs4ysOimrzcfjL14d6PVp4Kn0mAvJ2J/SVq3OkKQsJsQzn5yRY/c5doyD
 6z4SYIMiFot3JUaFZUe/S6azMvlSdOMPyVWeZzVgFRSw=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
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

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The members of struct dp_debug are no longer used, so the only purpose
of this struct is as a type of the return value of dp_debug_get(), to
signal success/error.

Drop the struct in favor of signalling the result of initialization
using an int, then merge dp_debug_get() with dp_debug_init() to avoid
the unnecessar boilerplate code.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_debug.c   | 59 +++++++++++--------------------------
 drivers/gpu/drm/msm/dp/dp_debug.h   | 38 +++++++-----------------
 drivers/gpu/drm/msm/dp/dp_display.c | 10 ++-----
 3 files changed, 31 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index eca5a02f9003..b8611f6d2296 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -21,8 +21,6 @@ struct dp_debug_private {
 	struct dp_link *link;
 	struct dp_panel *panel;
 	struct drm_connector *connector;
-
-	struct dp_debug dp_debug;
 };
 
 static int dp_debug_show(struct seq_file *seq, void *p)
@@ -199,10 +197,24 @@ static const struct file_operations test_active_fops = {
 	.write = dp_test_active_write
 };
 
-static void dp_debug_init(struct dp_debug *dp_debug, struct dentry *root, bool is_edp)
+int dp_debug_init(struct device *dev, struct dp_panel *panel,
+		  struct dp_link *link,
+		  struct drm_connector *connector,
+		  struct dentry *root, bool is_edp)
 {
-	struct dp_debug_private *debug = container_of(dp_debug,
-			struct dp_debug_private, dp_debug);
+	struct dp_debug_private *debug;
+
+	if (!dev || !panel || !link) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	debug = devm_kzalloc(dev, sizeof(*debug), GFP_KERNEL);
+	if (!debug)
+		return -ENOMEM;
+
+	debug->link = link;
+	debug->panel = panel;
 
 	debugfs_create_file("dp_debug", 0444, root,
 			debug, &dp_debug_fops);
@@ -220,41 +232,6 @@ static void dp_debug_init(struct dp_debug *dp_debug, struct dentry *root, bool i
 				    root,
 				    debug, &dp_test_type_fops);
 	}
-}
 
-struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_link *link,
-		struct drm_connector *connector,
-		struct dentry *root, bool is_edp)
-{
-	struct dp_debug_private *debug;
-	struct dp_debug *dp_debug;
-	int rc;
-
-	if (!dev || !panel || !link) {
-		DRM_ERROR("invalid input\n");
-		rc = -EINVAL;
-		goto error;
-	}
-
-	debug = devm_kzalloc(dev, sizeof(*debug), GFP_KERNEL);
-	if (!debug) {
-		rc = -ENOMEM;
-		goto error;
-	}
-
-	debug->dp_debug.debug_en = false;
-	debug->link = link;
-	debug->panel = panel;
-
-	dp_debug = &debug->dp_debug;
-	dp_debug->vdisplay = 0;
-	dp_debug->hdisplay = 0;
-	dp_debug->vrefresh = 0;
-
-	dp_debug_init(dp_debug, root, is_edp);
-
-	return dp_debug;
- error:
-	return ERR_PTR(rc);
+	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 9b3b2e702f65..7e1aa892fc09 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -9,22 +9,6 @@
 #include "dp_panel.h"
 #include "dp_link.h"
 
-/**
- * struct dp_debug
- * @debug_en: specifies whether debug mode enabled
- * @vdisplay: used to filter out vdisplay value
- * @hdisplay: used to filter out hdisplay value
- * @vrefresh: used to filter out vrefresh value
- * @tpg_state: specifies whether tpg feature is enabled
- */
-struct dp_debug {
-	bool debug_en;
-	int aspect_ratio;
-	int vdisplay;
-	int hdisplay;
-	int vrefresh;
-};
-
 #if defined(CONFIG_DEBUG_FS)
 
 /**
@@ -41,22 +25,22 @@ struct dp_debug {
  * This function sets up the debug module and provides a way
  * for debugfs input to be communicated with existing modules
  */
-struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_link *link,
-		struct drm_connector *connector,
-		struct dentry *root,
-		bool is_edp);
+int dp_debug_init(struct device *dev, struct dp_panel *panel,
+		  struct dp_link *link,
+		  struct drm_connector *connector,
+		  struct dentry *root,
+		  bool is_edp);
 
 #else
 
 static inline
-struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_link *link,
-		struct drm_connector *connector,
-		struct dentry *root,
-		bool is_edp)
+int dp_debug_init(struct device *dev, struct dp_panel *panel,
+		  struct dp_link *link,
+		  struct drm_connector *connector,
+		  struct dentry *root,
+		  bool is_edp)
 {
-	return ERR_PTR(-EINVAL);
+	return -EINVAL;
 }
 
 #endif /* defined(CONFIG_DEBUG_FS) */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c4cb82af5c2f..ba658c1637d1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -93,7 +93,6 @@ struct dp_display_private {
 	struct dp_link    *link;
 	struct dp_panel   *panel;
 	struct dp_ctrl    *ctrl;
-	struct dp_debug   *debug;
 
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
@@ -1431,14 +1430,9 @@ void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, boo
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 	dev = &dp->dp_display.pdev->dev;
 
-	dp->debug = dp_debug_get(dev, dp->panel,
-					dp->link, dp->dp_display.connector,
-					root, is_edp);
-	if (IS_ERR(dp->debug)) {
-		rc = PTR_ERR(dp->debug);
+	rc = dp_debug_init(dev, dp->panel, dp->link, dp->dp_display.connector, root, is_edp);
+	if (rc)
 		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
-		dp->debug = NULL;
-	}
 }
 
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,

-- 
2.43.0

