Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC2288C651
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A06C10F02C;
	Tue, 26 Mar 2024 15:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RbjlGWWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E34610EB17;
 Tue, 26 Mar 2024 15:06:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E49476125C;
 Tue, 26 Mar 2024 15:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D485C43390;
 Tue, 26 Mar 2024 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711465603;
 bh=F74sSb1TUT1wdavk14eo4VvZEROfyAVRNFw7tDHtFsc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RbjlGWWxz1Q0bTbF1cr625dy8ZLo4E+JnnlnA511SMawYZIFtK5x+5cwvtNFuJg35
 v4OW8aXBZQGfzd+DIMKwTj/jsQcFuO8QSkEfMPYeIj60WYkC9Csa+EUS6bYBEDPVVy
 4nH3KwoYqRuqT/GOQg2/nh2yrqndl8RaZs2z2ARQshQiJhrpwguypCRdETPgiTVKDf
 GzUjzacCP8gRuif2yCi4JnRJBIa6d1Ge1K7f3ButxLIakmAmM7VSPiaOAsDjcGHaR7
 kMqzGGpW5APzXFDEAdZziZs30tvqmqVmNFZja5noQ7fLo6P4KFWO5H50GjX8NYhsqi
 fy2edAqshlQow==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 26 Mar 2024 08:11:29 -0700
Subject: [PATCH 1/6] drm/msm/dp: Drop unused dp_debug struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-msm-dp-cleanup-v1-1-e775556ecec0@quicinc.com>
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5546;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=3M3qSEuc5xZbhZocgufvkSxT1oRUyTPG9hEV+dTs68o=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmAuWiytUIeRdX1FXogzeoEOBMSa7Q5ATTd+erT
 u7ieVErYuGJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZgLlohUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUFXg//dEX3ua3NRihGVTS7nlhv1GQh2i2xUCWHe774Zak
 bxJhrgvdR3iQYQ1M4a+ydUybhehrAcyB4pfB9ubJz0j+I0aLRv8rAIaLtYXSPCeel5xhpED0X4F
 fV5M3sp/JXu9cQZE4pfFenbQbWRflWpCu+7Jr8B1hcpWr/xYo6aEduqqjJbBpFpv8/kdHwX4wSJ
 zOsIbaHfTpT3Xwc++o5w28KuDRCZ4ANBtxvkvITLlt/kP+E6g6vlNK1slHKfzYtp3lYbU88kAc2
 pAiS+0ho/NpTp0qkr4m8zn/J2he4Z5QlSjzfSmhxAUQAzclLguBolf/UL8OI016buaC/GQz386q
 aZFspCFbG81cwJXkquf/+PInZfD9bQxc6NlKoxQv9BixIAAMZagCKPfTZaQ/VsSspFxPa7glQnI
 kB6RW6sCzMswz/4MfK6mZmG8Vr8bv/ZYzNhfpRsOcT8DIfHXRSZLw5Ehvd/+wLu2+oMEeV0+tBR
 vGWsGdSC9viG5zhjB172cgpcn7YGEDCxAvg3N14NV7AqALqPMSRu1j+h4Bz09jnsWxfZNesQfkU
 S3WUrXexY/aqIsbDIgWtjfhy4P8eeFNCZEaRFIUEcViKzwc7crKnUMS/nokb+4vsiVu4tY2RZ9r
 qvCt6B+erPs2/kl9iXzWpnPvoRLDuR/bUEN922kzrruU=
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
using an int.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_debug.c   | 38 ++++++++++---------------------------
 drivers/gpu/drm/msm/dp/dp_debug.h   | 38 +++++++++++--------------------------
 drivers/gpu/drm/msm/dp/dp_display.c | 10 ++--------
 3 files changed, 23 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index eca5a02f9003..a631cbe0e599 100644
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
@@ -199,11 +197,8 @@ static const struct file_operations test_active_fops = {
 	.write = dp_test_active_write
 };
 
-static void dp_debug_init(struct dp_debug *dp_debug, struct dentry *root, bool is_edp)
+static void dp_debug_init(struct dp_debug_private *debug, struct dentry *root, bool is_edp)
 {
-	struct dp_debug_private *debug = container_of(dp_debug,
-			struct dp_debug_private, dp_debug);
-
 	debugfs_create_file("dp_debug", 0444, root,
 			debug, &dp_debug_fops);
 
@@ -222,39 +217,26 @@ static void dp_debug_init(struct dp_debug *dp_debug, struct dentry *root, bool i
 	}
 }
 
-struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_link *link,
-		struct drm_connector *connector,
-		struct dentry *root, bool is_edp)
+int dp_debug_get(struct device *dev, struct dp_panel *panel,
+		 struct dp_link *link,
+		 struct drm_connector *connector,
+		 struct dentry *root, bool is_edp)
 {
 	struct dp_debug_private *debug;
-	struct dp_debug *dp_debug;
-	int rc;
 
 	if (!dev || !panel || !link) {
 		DRM_ERROR("invalid input\n");
-		rc = -EINVAL;
-		goto error;
+		return -EINVAL;
 	}
 
 	debug = devm_kzalloc(dev, sizeof(*debug), GFP_KERNEL);
-	if (!debug) {
-		rc = -ENOMEM;
-		goto error;
-	}
+	if (!debug)
+		return -ENOMEM;
 
-	debug->dp_debug.debug_en = false;
 	debug->link = link;
 	debug->panel = panel;
 
-	dp_debug = &debug->dp_debug;
-	dp_debug->vdisplay = 0;
-	dp_debug->hdisplay = 0;
-	dp_debug->vrefresh = 0;
-
-	dp_debug_init(dp_debug, root, is_edp);
+	dp_debug_init(debug, root, is_edp);
 
-	return dp_debug;
- error:
-	return ERR_PTR(rc);
+	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 9b3b2e702f65..c57200751c9f 100644
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
+int dp_debug_get(struct device *dev, struct dp_panel *panel,
+		 struct dp_link *link,
+		 struct drm_connector *connector,
+		 struct dentry *root,
+		 bool is_edp);
 
 #else
 
 static inline
-struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-		struct dp_link *link,
-		struct drm_connector *connector,
-		struct dentry *root,
-		bool is_edp)
+int dp_debug_get(struct device *dev, struct dp_panel *panel,
+		 struct dp_link *link,
+		 struct drm_connector *connector,
+		 struct dentry *root,
+		 bool is_edp)
 {
-	return ERR_PTR(-EINVAL);
+	return -EINVAL;
 }
 
 #endif /* defined(CONFIG_DEBUG_FS) */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c4cb82af5c2f..a9187be95166 100644
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
+	rc = dp_debug_get(dev, dp->panel, dp->link, dp->dp_display.connector, root, is_edp);
+	if (rc)
 		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
-		dp->debug = NULL;
-	}
 }
 
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,

-- 
2.43.0

