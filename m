Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890CFB2A0BC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 13:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E614A10E1C9;
	Mon, 18 Aug 2025 11:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BomjjbN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5AB10E1C9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 11:50:22 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b471756592cso2699373a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 04:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755517822; x=1756122622;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UulYzIy5HqPnDw6udvrknuDDM9ViKLj7nBVeIIxwUb4=;
 b=BomjjbN3q6s/sDrzqFYfyiMoBXllvhUftu4Culu/+HdMO1JgbpD1NySwjtPWO/qTx4
 TuIdzM/dTjLIS+arsehMyknAO7my/67WAbYneyyPbxQF9RxzoWB/4hbhoW3AWVsWVF9i
 qx4CSfDZHwVCWtT64Nsz1hSQzOEfTpuSCuex8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755517822; x=1756122622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UulYzIy5HqPnDw6udvrknuDDM9ViKLj7nBVeIIxwUb4=;
 b=BjYHf0dqfdE7XI5C0mVMASJcXDMABEjjthRrVcr/L5ClcmFZL1cYSrD68UC978j+M2
 r2cLJiQ4uJalcwn0ZMsa58PYjwuhw4ndRdqvxmjnA8owOuijm/8RMGhFeQBRqL7kpgyu
 3VfunmNHH/AN2pUWnxyUDYZ9+4s6I5+CL4vs3cWFwtW91iAK6vqcWpEntBqKcz4yizez
 i7Su5HAaGi81pbcO27sUsMrLU7iMJnClPxvANaz42rdUKzOt3d78mV7ZQbNp9nKu/cl3
 4Yju/y00NJ24sv9SLzT4QPkLbq2u1k+ehjcWKajROK/Q7FGC+9+YDrKS2xnZTxItS6Uv
 UZvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8ae7ZgIIMzo2TxgdaXf/dP63KodYXx2jEuedmIbKLVHs+ApZgptFvthECxQvl63/szdrKzh5Vic8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywmJm4xXZaqhU0FYJsb0sFSqPJsEdwiXLgNBD5NnJKGZhQQh9g
 xrB28mwBgdSM56aH/rMTsblJ389+ruBJiw8qhArzJtTXIAvbDLHrBiml/q+2ICaDqQ==
X-Gm-Gg: ASbGncvxPh9Pq4/FKGUSNUdUKgBH6ymg943aQlI3pWZXCDKmU93Hh8nPSAtSK/GMMWb
 FIMHSyqGeuREK1I7pxP6rwJ4uDGYl/FK2UfRbHGVBDK2t18tXrHeh3iyWL5OLWPZt2uxo07LpdN
 Lx57ziUpKqn5yjWrbPb8fUM8hvQmksaLqUOWPDPb3R2faOc2kCiORNfFdV31E9PcdMoa5W0hYa8
 2XwD8ZcVDAF4HfvHloxL69/jxDOEN9v3l6V4X/gLmP/ufQL5v2p9DYdlGXjwoJ4uPMTMHYifyhf
 Uu/0JFgAs0km8t3fcjI8x/qVFgH5OTUiMiNm28ooUjGfyHe62zPS31OuV3C9KyzAM6SAkvCzopZ
 fsbmNBAuC/F8Xbq38eB3m4Xqoj7CSH1L79qGCOGm5JF0AiA==
X-Google-Smtp-Source: AGHT+IG4EnK+v1tzuHZnBIDFTu0lhfCNM/6uvRmVxQYPJatcyzYjE+EpdXCPSuVW/Awh7uepbmS4mQ==
X-Received: by 2002:a17:903:4b2f:b0:240:127:85f1 with SMTP id
 d9443c01a7336-2446d722288mr152747785ad.18.1755517821926; 
 Mon, 18 Aug 2025 04:50:21 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:5130:767b:3a09:59d6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9ee03sm78997715ad.15.2025.08.18.04.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 04:50:21 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 linux-input@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 1/2] drm/panel: Allow powering on panel follower after
 panel is enabled
Date: Mon, 18 Aug 2025 19:49:33 +0800
Message-ID: <20250818115015.2909525-1-treapking@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
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

Some touch controllers have to be powered on after the panel's backlight
is enabled. To support these controllers, introduce .panel_enabled() and
.panel_disabling() to panel_follower_funcs and use them to power on the
device after the panel and its backlight are enabled.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v3:
- Update kernel-docs of drm_panel_add_follower() and drm_panel_remove_follower()
- Fix the order of calling .panel_disabling() and .panel_unpreparing()
- Add a blank line before the goto label

Changes in v2:
- Replace after_panel_enabled flag with enabled/disabling callbacks

 drivers/gpu/drm/drm_panel.c | 73 +++++++++++++++++++++++++++++++------
 include/drm/drm_panel.h     | 14 +++++++
 2 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c8bb28dccdc1b..d1e6598ea3bc0 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -134,6 +134,9 @@ void drm_panel_prepare(struct drm_panel *panel)
 	panel->prepared = true;
 
 	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_prepared)
+			continue;
+
 		ret = follower->funcs->panel_prepared(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
@@ -179,6 +182,9 @@ void drm_panel_unprepare(struct drm_panel *panel)
 	mutex_lock(&panel->follower_lock);
 
 	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_unpreparing)
+			continue;
+
 		ret = follower->funcs->panel_unpreparing(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
@@ -209,6 +215,7 @@ EXPORT_SYMBOL(drm_panel_unprepare);
  */
 void drm_panel_enable(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -219,10 +226,12 @@ void drm_panel_enable(struct drm_panel *panel)
 		return;
 	}
 
+	mutex_lock(&panel->follower_lock);
+
 	if (panel->funcs && panel->funcs->enable) {
 		ret = panel->funcs->enable(panel);
 		if (ret < 0)
-			return;
+			goto exit;
 	}
 	panel->enabled = true;
 
@@ -230,6 +239,19 @@ void drm_panel_enable(struct drm_panel *panel)
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
 			     ret);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_enabled)
+			continue;
+
+		ret = follower->funcs->panel_enabled(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_enabled, ret);
+	}
+
+exit:
+	mutex_unlock(&panel->follower_lock);
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -243,6 +265,7 @@ EXPORT_SYMBOL(drm_panel_enable);
  */
 void drm_panel_disable(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -262,6 +285,18 @@ void drm_panel_disable(struct drm_panel *panel)
 		return;
 	}
 
+	mutex_lock(&panel->follower_lock);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->funcs->panel_disabling)
+			continue;
+
+		ret = follower->funcs->panel_disabling(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_disabling, ret);
+	}
+
 	ret = backlight_disable(panel->backlight);
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
@@ -270,9 +305,12 @@ void drm_panel_disable(struct drm_panel *panel)
 	if (panel->funcs && panel->funcs->disable) {
 		ret = panel->funcs->disable(panel);
 		if (ret < 0)
-			return;
+			goto exit;
 	}
 	panel->enabled = false;
+
+exit:
+	mutex_unlock(&panel->follower_lock);
 }
 EXPORT_SYMBOL(drm_panel_disable);
 
@@ -539,13 +577,13 @@ EXPORT_SYMBOL(drm_is_panel_follower);
  * @follower_dev: The 'struct device' for the follower.
  * @follower:     The panel follower descriptor for the follower.
  *
- * A panel follower is called right after preparing the panel and right before
- * unpreparing the panel. It's primary intention is to power on an associated
- * touchscreen, though it could be used for any similar devices. Multiple
- * devices are allowed the follow the same panel.
+ * A panel follower is called right after preparing/enabling the panel and right
+ * before unpreparing/disabling the panel. It's primary intention is to power on
+ * an associated touchscreen, though it could be used for any similar devices.
+ * Multiple devices are allowed the follow the same panel.
  *
- * If a follower is added to a panel that's already been turned on, the
- * follower's prepare callback is called right away.
+ * If a follower is added to a panel that's already been prepared/enabled, the
+ * follower's prepared/enabled callback is called right away.
  *
  * The "panel" property of the follower points to the panel to be followed.
  *
@@ -569,12 +607,18 @@ int drm_panel_add_follower(struct device *follower_dev,
 	mutex_lock(&panel->follower_lock);
 
 	list_add_tail(&follower->list, &panel->followers);
-	if (panel->prepared) {
+	if (panel->prepared && follower->funcs->panel_prepared) {
 		ret = follower->funcs->panel_prepared(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
 				 follower->funcs->panel_prepared, ret);
 	}
+	if (panel->enabled && follower->funcs->panel_enabled) {
+		ret = follower->funcs->panel_enabled(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_enabled, ret);
+	}
 
 	mutex_unlock(&panel->follower_lock);
 
@@ -587,7 +631,8 @@ EXPORT_SYMBOL(drm_panel_add_follower);
  * @follower:     The panel follower descriptor for the follower.
  *
  * Undo drm_panel_add_follower(). This includes calling the follower's
- * unprepare function if we're removed from a panel that's currently prepared.
+ * unpreparing/disabling function if we're removed from a panel that's currently
+ * prepared/enabled.
  *
  * Return: 0 or an error code.
  */
@@ -598,7 +643,13 @@ void drm_panel_remove_follower(struct drm_panel_follower *follower)
 
 	mutex_lock(&panel->follower_lock);
 
-	if (panel->prepared) {
+	if (panel->enabled && follower->funcs->panel_disabling) {
+		ret = follower->funcs->panel_disabling(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_disabling, ret);
+	}
+	if (panel->prepared && follower->funcs->panel_unpreparing) {
 		ret = follower->funcs->panel_unpreparing(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 843fb756a2950..2407bfa60236f 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -160,6 +160,20 @@ struct drm_panel_follower_funcs {
 	 * Called before the panel is powered off.
 	 */
 	int (*panel_unpreparing)(struct drm_panel_follower *follower);
+
+	/**
+	 * @panel_enabled:
+	 *
+	 * Called after the panel and the backlight have been enabled.
+	 */
+	int (*panel_enabled)(struct drm_panel_follower *follower);
+
+	/**
+	 * @panel_disabling:
+	 *
+	 * Called before the panel and the backlight are disabled.
+	 */
+	int (*panel_disabling)(struct drm_panel_follower *follower);
 };
 
 struct drm_panel_follower {
-- 
2.51.0.rc1.163.g2494970778-goog

