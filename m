Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0167C794
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 10:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3B510E16C;
	Thu, 26 Jan 2023 09:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0813310E16C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 09:39:56 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so3638343wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 01:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g9aGpJns5SgWg0z8BSWVW6zwSMuvm0bnc+KZO7SfArc=;
 b=IZyGrTIRrDbz4InbWqSNvFY6qwhg9AIIG41TDCGNkDCJQbC3ESdKD3Q8ZMiMc7OFjH
 Fq+tx8k7E2RCQqiRqxrXkuo9bUi5t9BHeQl7Tqgch7rJ2sFyyno7evSNHFU/glk+ZmDP
 OYoetYCtTxPGj754w/ALAL8tOeHD3EKbZxBLgICLjBNe5RKs3OlRAwsbybPlQ8mEFLSY
 2uNBWFgzvkNZNE+YdTz+M0O9tm1N+lwxqSbuUBYdJZrkLDXlWs7lSVwKwt7DBaAgSKyA
 QyEx/6jVJ99ooLFJIxOU+asnKcPapH88CDn9h3XYuIWMk+6Yx5j1E5fVsCfXAvyQm/+J
 fSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g9aGpJns5SgWg0z8BSWVW6zwSMuvm0bnc+KZO7SfArc=;
 b=5ahZVUWPZg7gPR1Fie1StnIW5OXJH67njqiINDGoI8kBdmjzy0BqJkCGVqdBAJWbcN
 Xk9EVfdE2It838+C1Pep4yFwNi8+IzOkfxSlu+ewkcTxL8+3xeW/SxvBf+G+RetuDokk
 UmbhS0KMUf4qDXxhaPdBBikhMuwaYolrYHseoEl1MR3zbUFVsvJd1yb3C11U5+mAcd3d
 gJcO997yrHjp+66Yfr2+bIRTUhdunqSRe3WpKB7ajbZKsRJV+exCIZ0DgM5FhXHoUgeT
 1PuGKOvCdqcTibq4uZd4poA36CW3kqHIXbxr3/YGo1y9HnlTWXfXgpFKRnwhJcs7wk8u
 OvXw==
X-Gm-Message-State: AFqh2kq5tartO4G1mp4oOPbGuXp/mWFXzo+4B1WgxCGm5/vP/5FQV5r+
 6C8H3zSWbJHKFp5vyQzfmVRNBQ==
X-Google-Smtp-Source: AMrXdXvKP7X3PIQgQU+dDO/PF9OYHGMFlxmM7vU//xmZfVh+2o8Pom/JXrLdvx24PmPSikwWmAGxAQ==
X-Received: by 2002:a05:600c:502c:b0:3db:30d:deac with SMTP id
 n44-20020a05600c502c00b003db030ddeacmr34904000wmr.1.1674725994338; 
 Thu, 26 Jan 2023 01:39:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c415100b003da2932bde0sm1182652wmm.23.2023.01.26.01.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 01:39:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 26 Jan 2023 10:39:42 +0100
Subject: [PATCH] drm/panel: khadas-ts050: update timings to achieve 60Hz
 refresh rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221025-ts050-timings-v1-1-5c824bbb24d9@linaro.org>
X-B4-Tracking: v=1; b=H4sIAF1K0mMC/w3LOwqAMAwA0KtIZgMxfhBv09aoAY3QqIt4dzu+4
 b3gklUcpuqFLI+6nlbQ1BWkLdgqqHMxMDE3xD1eTj3hpYfa6shL7CK1XeBhhHJicMGYg6WtLLv
 3/ft+wHXDQWQAAAA=
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This updates the panel timings to achieve a clean 60Hz refresh rate.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-khadas-ts050.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 1ab1ebe30882..e0cebfa14b36 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -568,7 +568,7 @@ static const struct khadas_ts050_panel_cmd init_code[] = {
 	{0xfb, 0x01},
 	/* Select CMD1 */
 	{0xff, 0x00},
-	{0xd3, 0x05}, /* RGBMIPICTRL: VSYNC back porch = 5 */
+	{0xd3, 0x22}, /* RGBMIPICTRL: VSYNC back porch = 34 */
 	{0xd4, 0x04}, /* RGBMIPICTRL: VSYNC front porch = 4 */
 };
 
@@ -717,15 +717,15 @@ static int khadas_ts050_panel_disable(struct drm_panel *panel)
 }
 
 static const struct drm_display_mode default_mode = {
-	.clock = 120000,
-	.hdisplay = 1088,
-	.hsync_start = 1088 + 104,
-	.hsync_end = 1088 + 104 + 4,
-	.htotal = 1088 + 104 + 4 + 127,
+	.clock = 160000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 117,
+	.hsync_end = 1080 + 117 + 5,
+	.htotal = 1080 + 117 + 5 + 160,
 	.vdisplay = 1920,
-	.vsync_start = 1920 + 4,
-	.vsync_end = 1920 + 4 + 2,
-	.vtotal = 1920 + 4 + 2 + 3,
+	.vsync_start = 1920 + 4 ,
+	.vsync_end = 1920 + 4 + 3,
+	.vtotal = 1920 + 4 + 3 + 31 ,
 	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 

---
base-commit: 247f34f7b80357943234f93f247a1ae6b6c3a740
change-id: 20221025-ts050-timings-2fb4b034a268

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

