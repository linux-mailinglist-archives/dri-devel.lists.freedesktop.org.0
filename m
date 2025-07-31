Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F249BB16F3F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 12:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF2810E263;
	Thu, 31 Jul 2025 10:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="U6BKDx8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E387F10E263
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 10:13:50 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-76b8d289f73so227547b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753956830; x=1754561630;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tUEg3xcJ3jba8hnyoRSpTU/LFqclls7jlqdJpvyla9c=;
 b=U6BKDx8yHk869LKL/KDF1Gqd2tOle7Qa1wks++fBYV0TPaOFPlZPGV9RqiBl35dgNW
 8BbCJ7WwylmFkTQPXSZ++jtU8zToXp/mGrZ+DJLE+L208iajfekWrOUlwCrXuqSn4KF0
 bqy2bBQ5z3RM1LG2v5PMFy3INf0ukgJ3HGueQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753956830; x=1754561630;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tUEg3xcJ3jba8hnyoRSpTU/LFqclls7jlqdJpvyla9c=;
 b=FBcKgCKrMofe+UHsFn+VVitBsQOt5DhdXJLEGtESpp5b10dx8b8d8frigJov9vDA8b
 rqrPw9IqazdmBcxVEK1nsHJDnaPDwRXzPAgKT7Gn0F1bQSUM/yLbZyzZGk7qKRohAlol
 Qs7jhLqTlfoB47PtVdrIgAKGp4Y9Cs1XCeSh8BVrxAzlKEieoLcyoq2LdGfUl6DpJATr
 1QK5t6y8EH8kCXNDUJi0WlEIa0oIQ928eF5Zb00FTLV3nDN96P2ARLdcNSFwCEHr+iX4
 eeHEv1IQNGQRpXgUeTDkPV+jmmn1mTKFlGvSAYOJrXa0nws3DF/BbegdGDJiJ4ijfE0h
 8y3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDrrLlROv1UI8ejcL71zFlbS51aiFFyrmAMG5R0WLBG84MqyCHnFF874f9j6V9itJwLnnelBgjtEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2uwZmOwhsf168GvJYx+gXhDGzi6FRK+x7Ec50WYjk/Y4lpoPr
 QHBoE15w/WPzmjajITBldwnc3KV5+gN3VSnfoZDefqW6H/UqvLd8ir+0wEjSK7uznWOntwBC7N1
 jhPU=
X-Gm-Gg: ASbGnctOZo+pf1QJ+RCMC++/BIwlVvswOu8EXLfnJICMOdozRPPY+0GEyW3vbwY6ks5
 eVT77glej7+UNkN3a4RX5TXnQPK9SVEn+zR0cVw1+zWFvgzWD9JHS8Z9cwQ52ikfROtICLs1dU2
 4tb2mkJX/WWeLXcayqtmgUsIn2lkAZp/R/xQAWO5Facp1PoUnYTNIa+4Ik51T0Q0+wLZ4K1zAKm
 IX/T6m9h2w95RD2kb8oTKEmro/ayuMlkTotaviSvy+3sKVh+ScXS54veTbozezEjSdQayKtOV0H
 RPobMV3/VqIcD7vponrXP2XjTZlBTYjGS1y5pc160Q4TLHsqTFOStesX8zMLlgYcxSsRQ53vkcn
 Xgt8MRl/hRAv9bM0KAjregOqkCQxeXtV+uhEG6W566iw=
X-Google-Smtp-Source: AGHT+IFZAlHN/nIouijHXQyWsOYKKyTBnU+4hjJh++C618HZ1kK7LQSmICyL09/nAo527xH1aNU/Dw==
X-Received: by 2002:a05:6a20:7d9a:b0:238:3f54:78ec with SMTP id
 adf61e73a8af0-23dc0f6348emr10936788637.46.1753956830368; 
 Thu, 31 Jul 2025 03:13:50 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:8177:f5a7:88a1:4ed9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f5f5sm1229265b3a.10.2025.07.31.03.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 03:13:50 -0700 (PDT)
From: Pin-Yen Lin <treapking@chromium.org>
X-Google-Original-From: Pin-Yen Lin <treapking@google.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>, Pin-Yen Lin <treapking@google.com>
Subject: [PATCH 1/2] drm/panel: Allow powering on panel follower after panel
 is enabled
Date: Thu, 31 Jul 2025 18:13:14 +0800
Message-ID: <20250731101344.2761757-1-treapking@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
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
is enabled. To support these controllers, introduce after_panel_enabled
flag to the panel follower and power on the device after the panel and
its backlight are enabled.

Signed-off-by: Pin-Yen Lin <treapking@google.com>
---

 drivers/gpu/drm/drm_panel.c | 47 +++++++++++++++++++++++++++++++++----
 include/drm/drm_panel.h     |  8 +++++++
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 650de4da08537..58125f8418f37 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -133,6 +133,9 @@ void drm_panel_prepare(struct drm_panel *panel)
 	panel->prepared = true;
 
 	list_for_each_entry(follower, &panel->followers, list) {
+		if (follower->after_panel_enabled)
+			continue;
+
 		ret = follower->funcs->panel_prepared(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
@@ -178,6 +181,9 @@ void drm_panel_unprepare(struct drm_panel *panel)
 	mutex_lock(&panel->follower_lock);
 
 	list_for_each_entry(follower, &panel->followers, list) {
+		if (follower->after_panel_enabled)
+			continue;
+
 		ret = follower->funcs->panel_unpreparing(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
@@ -208,6 +214,7 @@ EXPORT_SYMBOL(drm_panel_unprepare);
  */
 void drm_panel_enable(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -218,10 +225,12 @@ void drm_panel_enable(struct drm_panel *panel)
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
 
@@ -229,6 +238,18 @@ void drm_panel_enable(struct drm_panel *panel)
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
 			     ret);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->after_panel_enabled)
+			continue;
+
+		ret = follower->funcs->panel_prepared(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_prepared, ret);
+	}
+exit:
+	mutex_unlock(&panel->follower_lock);
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -242,6 +263,7 @@ EXPORT_SYMBOL(drm_panel_enable);
  */
 void drm_panel_disable(struct drm_panel *panel)
 {
+	struct drm_panel_follower *follower;
 	int ret;
 
 	if (!panel)
@@ -261,6 +283,18 @@ void drm_panel_disable(struct drm_panel *panel)
 		return;
 	}
 
+	mutex_lock(&panel->follower_lock);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		if (!follower->after_panel_enabled)
+			continue;
+
+		ret = follower->funcs->panel_unpreparing(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_unpreparing, ret);
+	}
+
 	ret = backlight_disable(panel->backlight);
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
@@ -269,9 +303,12 @@ void drm_panel_disable(struct drm_panel *panel)
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
 
@@ -537,7 +574,8 @@ int drm_panel_add_follower(struct device *follower_dev,
 	mutex_lock(&panel->follower_lock);
 
 	list_add_tail(&follower->list, &panel->followers);
-	if (panel->prepared) {
+	if ((panel->prepared && !follower->after_panel_enabled) ||
+	    (panel->enabled && follower->after_panel_enabled)) {
 		ret = follower->funcs->panel_prepared(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
@@ -566,7 +604,8 @@ void drm_panel_remove_follower(struct drm_panel_follower *follower)
 
 	mutex_lock(&panel->follower_lock);
 
-	if (panel->prepared) {
+	if ((panel->prepared && !follower->after_panel_enabled) ||
+	    (panel->enabled && follower->after_panel_enabled)) {
 		ret = follower->funcs->panel_unpreparing(follower);
 		if (ret < 0)
 			dev_info(panel->dev, "%ps failed: %d\n",
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 843fb756a2950..aa9b6218702fd 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -183,6 +183,14 @@ struct drm_panel_follower {
 	 * The panel we're dependent on; set by drm_panel_add_follower().
 	 */
 	struct drm_panel *panel;
+
+	/**
+	 * @after_panel_enabled
+	 *
+	 * If true then this panel follower should be powered after the panel
+	 * and the backlight are enabled, instead of after panel is prepared.
+	 */
+	bool after_panel_enabled;
 };
 
 /**
-- 
2.50.1.552.g942d659e1b-goog

