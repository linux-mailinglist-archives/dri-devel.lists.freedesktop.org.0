Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5B0B249CE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 14:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FAB10E708;
	Wed, 13 Aug 2025 12:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dShYqIbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D0910E708
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 12:51:41 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-76bfd457607so6353514b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755089501; x=1755694301;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OaCY6QygZSY7gwTjhsexWl1g6lEhtuzBso3q62sP80I=;
 b=dShYqIbdelt2IwFBVenFHB69ejp+GujjdQ7dgvhC+exRm+yDIgqhZ2Ym2gSzGZH6Lo
 AcwxLURSFfnpS/zpm9SIg2SKDGzq+9dASGC7qrqeWXEULjvf0+rF2G1+syL5E7sbsHFR
 eovDe4Yhb3rjsLtFB4MWmAM1kcNifVu2XxszI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755089501; x=1755694301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OaCY6QygZSY7gwTjhsexWl1g6lEhtuzBso3q62sP80I=;
 b=frdY8+CqO/LOmJq+Bgn+879kNWy47p/TClISxLbYnxaeISnLyO00i3iAfe2o2ONOIj
 Dgu/qVRmR+lBTUsBDbHNLgG4chCWVC6BWYZqb5UQg/2yXoseT9XB0M+MnukEpMXPpQcZ
 1f8E/0EEIEkedO1EobJm7mXQtFs01yYULDQIlN8F1oP+dciiO7v2n79d3TZ2UzO2MliG
 ezSEn+U/744DZLhp8KIU6nm6axO7VK1TL1ybRBEGjZnQKI1mZV8gPSQRdNX130nG15Pd
 JP0X1YDAuAWzJ3sbLmFUIvCt7Dnp7R8tAUowqccqEWpKv6SQG3O0JzkCrirwJm6dRQQY
 //RQ==
X-Gm-Message-State: AOJu0YxcOvhjVTaUzHpf0QmrZQ1rOojh8Jk/Cx7Ej5z2VH7zFFfiMn3V
 KoGFh02FQQT9anL8x/KcvVPa4qN9ZK3WrDA00TFr1ZKZzX4FYgtOvU7NmlhldYqygg==
X-Gm-Gg: ASbGnct11Lhqlx/Zls+qZtxKobzwuxwda8dB2LEF3qADSVIJ5Zu6KOFBtlDizuUlB8k
 RI/FvhWupc283uEz8JUBrSHzubflI52MTE9S7JS2zF7CGVyg9sfsurBYbSo/SGWuRsHx6Sf0z9+
 OAdYxYkfU4IAtiSZMxD7MhSD1X8CsUl4ItH/O3ZvKqwCkWepjz12kVjF8BfqGxNxUkjZsv4HWRF
 yRtWgb3tfzk2J+YZGe7jlx5pBXoqHbyH5LTYeRhdrSGoiIZ2a4QRd8/NONQiv6mt/pjcMA52tc5
 Wlp4Qnr6C4GGm1R9caG8OrQcWPXnZjnXyuU0cbthtCW5/HMh3HqWk8Cx9I3OhG3ZASO8+E4sBdg
 zYsCmOdDiZY0kfkgf2p4L2Nom4I9bZRayKpM8hBx5SOK+u1LH2ZIp7yWG
X-Google-Smtp-Source: AGHT+IHvOWzR+m64NjcSp9Sio+ZwCY5wgCmmRripn14ZHanao1N4GJSYFMYpw0majecA30pcR6AfLQ==
X-Received: by 2002:a05:6a20:7f96:b0:233:4862:753a with SMTP id
 adf61e73a8af0-240a889f530mr5133358637.0.1755089501234; 
 Wed, 13 Aug 2025 05:51:41 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:99fd:826e:7963:bbb0])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b470fd547d0sm740613a12.4.2025.08.13.05.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 05:51:40 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2 1/2] drm/panel: Allow powering on panel follower after
 panel is enabled
Date: Wed, 13 Aug 2025 20:51:24 +0800
Message-ID: <20250813125132.1319482-1-treapking@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
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

Changes in v2:
- Replace after_panel_enabled flag with enabled/disabling callbacks

 drivers/gpu/drm/drm_panel.c | 57 ++++++++++++++++++++++++++++++++++---
 include/drm/drm_panel.h     | 14 +++++++++
 2 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c8bb28dccdc1b..e3682c22c4dd2 100644
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
 
@@ -230,6 +239,18 @@ void drm_panel_enable(struct drm_panel *panel)
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
+exit:
+	mutex_unlock(&panel->follower_lock);
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -243,6 +264,7 @@ EXPORT_SYMBOL(drm_panel_enable);
  */
 void drm_panel_disable(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -262,6 +284,18 @@ void drm_panel_disable(struct drm_panel *panel)
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
@@ -270,9 +304,12 @@ void drm_panel_disable(struct drm_panel *panel)
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
 
@@ -569,12 +606,18 @@ int drm_panel_add_follower(struct device *follower_dev,
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
 
@@ -598,12 +641,18 @@ void drm_panel_remove_follower(struct drm_panel_follower *follower)
 
 	mutex_lock(&panel->follower_lock);
 
-	if (panel->prepared) {
+	if (panel->prepared && follower->funcs->panel_unpreparing) {
 		ret = follower->funcs->panel_unpreparing(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
 				 follower->funcs->panel_unpreparing, ret);
 	}
+	if (panel->enabled && follower->funcs->panel_disabling) {
+		ret = follower->funcs->panel_disabling(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_disabling, ret);
+	}
 	list_del_init(&follower->list);
 
 	mutex_unlock(&panel->follower_lock);
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
2.51.0.rc0.205.g4a044479a3-goog

