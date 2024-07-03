Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD83926C77
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 01:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12BB10E110;
	Wed,  3 Jul 2024 23:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="RFFHRHL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473D410E110
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 23:32:24 +0000 (UTC)
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1720049542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lZlEw+Fn9hl8WVVU5TGBdkPfXk1IUsyRsh6CxIbbcHo=;
 b=RFFHRHL/BIMNa+DJmfGc3RiA6ssbcnwsNILQ5RSm+yVVf+MIQc37InYfNhMEbA0Kwc/UJM
 Y4SzsE2LedBnsxnSsA1EIHLblLXP45j3Dfc+AebWa3PYWFu0YkbzdoP29WKobyieSTAmtL
 rllL+pjdULYQwPC+98TvkIgliMkqcr5zmCuXdtS90UCbdi7i1wNuiM+QzRHPOIxdY6sXeE
 My4UesB4b8ECB7zZ2xHw78T1UIWPiz+fBFGlEEJjZdpIKhypS7ZT+RnaeotvVwWy8PSSGM
 TqgmWqB12TqLdTLMq3OKOvQHSpBgSJhbOaeboYqWYBmrhl86dlCQBgk427Ds0A==
To: linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: cdn-dp: Clean up a few logged messages
Date: Thu,  4 Jul 2024 01:32:20 +0200
Message-Id: <92db74a313547c087cc71059428698c4ec37a9ae.1720048818.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

Clean up a few logged messages, which were previously worded as rather
incomplete sentences separated by periods.  This was both a bit unreadable
and grammatically incorrect, so convert them into partial sentences separated
(or connected) by semicolons, together with some wording improvements.

Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index bd7aa891b839..ee9def197095 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -969,46 +969,44 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 
 	/* Not connected, notify userspace to disable the block */
 	if (!cdn_dp_connected_port(dp)) {
-		DRM_DEV_INFO(dp->dev, "Not connected. Disabling cdn\n");
+		DRM_DEV_INFO(dp->dev, "Not connected; disabling cdn\n");
 		dp->connected = false;
 
 	/* Connected but not enabled, enable the block */
 	} else if (!dp->active) {
-		DRM_DEV_INFO(dp->dev, "Connected, not enabled. Enabling cdn\n");
+		DRM_DEV_INFO(dp->dev, "Connected, not enabled; enabling cdn\n");
 		ret = cdn_dp_enable(dp);
 		if (ret) {
-			DRM_DEV_ERROR(dp->dev, "Enable dp failed %d\n", ret);
+			DRM_DEV_ERROR(dp->dev, "Enabling dp failed: %d\n", ret);
 			dp->connected = false;
 		}
 
 	/* Enabled and connected to a dongle without a sink, notify userspace */
 	} else if (!cdn_dp_check_sink_connection(dp)) {
-		DRM_DEV_INFO(dp->dev, "Connected without sink. Assert hpd\n");
+		DRM_DEV_INFO(dp->dev, "Connected without sink; assert hpd\n");
 		dp->connected = false;
 
 	/* Enabled and connected with a sink, re-train if requested */
 	} else if (!cdn_dp_check_link_status(dp)) {
 		unsigned int rate = dp->max_rate;
 		unsigned int lanes = dp->max_lanes;
 		struct drm_display_mode *mode = &dp->mode;
 
-		DRM_DEV_INFO(dp->dev, "Connected with sink. Re-train link\n");
+		DRM_DEV_INFO(dp->dev, "Connected with sink; re-train link\n");
 		ret = cdn_dp_train_link(dp);
 		if (ret) {
 			dp->connected = false;
-			DRM_DEV_ERROR(dp->dev, "Train link failed %d\n", ret);
+			DRM_DEV_ERROR(dp->dev, "Training link failed: %d\n", ret);
 			goto out;
 		}
 
 		/* If training result is changed, update the video config */
 		if (mode->clock &&
 		    (rate != dp->max_rate || lanes != dp->max_lanes)) {
 			ret = cdn_dp_config_video(dp);
 			if (ret) {
 				dp->connected = false;
-				DRM_DEV_ERROR(dp->dev,
-					      "Failed to config video %d\n",
-					      ret);
+				DRM_DEV_ERROR(dp->dev, "Failed to configure video: %d\n", ret);
 			}
 		}
 	}
