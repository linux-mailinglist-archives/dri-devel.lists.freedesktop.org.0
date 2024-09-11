Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9666B9759F9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 20:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D74710EA72;
	Wed, 11 Sep 2024 18:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+OCAJnR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7453B10EA72
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 18:07:04 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-206aee4073cso1582985ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726078024; x=1726682824; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e29IJe4OX+PU/C1llRpEcZxaInprrHCDy7EtqfxxcvM=;
 b=S+OCAJnRGHdrxzP9OmY7bfC9Vivn9GUVPPV/eTCNYmhGTtHM4t+EhE1acZFg0se6+r
 OaZh4eiz7bFR3yqmTuVeX8YG4uFKGKnABshJBfMnLKZrX0biOfJNY1LkX3CcdGWQPgMP
 SFMcFlXqBYJeXzIkYAeqQXcV8mXJ+B+veg/cerlYQFOY9lz4enBZLsNLrLruArE8EKS/
 yPcuYBo/zM2kf//IJzk75h1hXe2I/wDX2pJxF32R1xXd47Wr5NNUsGzzK+tucWGe24CD
 qcpob+bV/nWL3aw2lvvWJEGSWhxE+MtFi11c8VIDj+qfeW/De0nmgcE0ySX19FmZmyYh
 2+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726078024; x=1726682824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e29IJe4OX+PU/C1llRpEcZxaInprrHCDy7EtqfxxcvM=;
 b=XgZlqgzlSHamidLY/l+TVZGheYYJUoAmospEWZQnA7T4GxcwDib3Xm1GgIUFa4EMg+
 fZYqOuEEw6Bbg68L6E4V56Wdhu/y+hg02p/5CxEuJWn54yrokYwsRC9pZZykOd63cn4Z
 /c4Y/OJfafuWzfZPP+8lqn8szgJ0xaClyX5xGXDiHBD1ZOv8GiDYaSYvUDIv9knngt9F
 U/bexdDy1Dvoj5yY5shyNrd5iGEoH2YFXp0VqHlrsSvjcAxKDro8yVdMN7qspu4cQ0L0
 4RhgPipdyXYxtMpO9wgiySHjkTD1X1J8Mtg1lm4R6reJX7gAkfedbTMP3ordsDfFZKG1
 +SgQ==
X-Gm-Message-State: AOJu0YyLvdWlnzNaQDSmjoeI8f+uX0ezgsebHVjUCKaCiN0nuXszcplQ
 YOJicFebdsFhi4afvyeGlj6T2RqME3OC7Ic52/JwgBSzwP/5cf53
X-Google-Smtp-Source: AGHT+IFITG48RrTVtlAYkqFPSN+jaMNopNFWs8XCJNmEJah9MxoHDRjZ/nXArmhftcSKD7KDHO/qJg==
X-Received: by 2002:a17:902:d4c9:b0:202:435b:211a with SMTP id
 d9443c01a7336-2076e3086damr3184355ad.12.1726078023664; 
 Wed, 11 Sep 2024 11:07:03 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9d98sm2326285ad.202.2024.09.11.11.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 11:07:02 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: Laurent.pinchart@ideasonboard.com, patrik.r.jakobsson@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Wed, 11 Sep 2024 23:36:50 +0530
Message-ID: <20240911180650.820598-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi since
monitor HDMI information is available after EDID is parsed. Additionally
rewrite the code the code to have fewer indentation levels.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v2:
    - Use drm_edid instead of edid

Link to v1: https://lore.kernel.org/all/20240910051856.700210-1-tejasvipin76@gmail.com/
---
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index 2d95e0471291..701f8bbd5f2b 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -128,23 +128,25 @@ static enum drm_connector_status cdv_hdmi_detect(
 {
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct mid_intel_hdmi_priv *hdmi_priv = gma_encoder->dev_priv;
-	struct edid *edid = NULL;
+	const struct drm_edid *drm_edid;
+	int ret;
 	enum drm_connector_status status = connector_status_disconnected;
 
-	edid = drm_get_edid(connector, connector->ddc);
+	drm_edid = drm_edid_read_ddc(connector, connector->ddc);
+	ret = drm_edid_connector_update(connector, drm_edid);
 
 	hdmi_priv->has_hdmi_sink = false;
 	hdmi_priv->has_hdmi_audio = false;
-	if (edid) {
-		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
-			status = connector_status_connected;
-			hdmi_priv->has_hdmi_sink =
-						drm_detect_hdmi_monitor(edid);
-			hdmi_priv->has_hdmi_audio =
-						drm_detect_monitor_audio(edid);
-		}
-		kfree(edid);
+	if (ret)
+		return status;
+
+	if (drm_edid_is_digital(drm_edid)) {
+		status = connector_status_connected;
+		hdmi_priv->has_hdmi_sink = connector->display_info.is_hdmi;
+		hdmi_priv->has_hdmi_audio = connector->display_info.has_audio;
 	}
+	drm_edid_free(drm_edid);
+
 	return status;
 }
 
-- 
2.46.0

