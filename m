Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1D060D0E3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 17:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B40510E3D9;
	Tue, 25 Oct 2022 15:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2480110E3F3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 15:41:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id bp11so21230043wrb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 08:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ARqyqo3HxwELLENCNcBHViWWddo+7tDukUTLtjIqP7Q=;
 b=yhR26ByW8L4aOLdLVfAVHO3mGe5c+VYr6fgBSxajZmTlR4gezi7235ziAvX7MOtvXU
 QqOY22m28l196CJrJvhw88bFI2zUblULB9PnTPabSgkreG8/17sUkNnL4xLqIwKs3mlO
 e64PcPZNq42Vtq/vTRMMrIByHlCksqy85JZxYxBXdcT5rzorPYmYC3aeR5DFdQ/bkeNz
 0yIOLCjzNBb7XCPsJeLX3mB25TN6U+oqSKiv4N1jJt5IWnfZgTOUmIv30OQ5ddLZQU/c
 fTtF8cxPaTaJT57PhrjhQCCEKwGesIun5k+BR9iyFiZmZXW9O8KxWzQKUMGAGZJKz3tE
 6nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ARqyqo3HxwELLENCNcBHViWWddo+7tDukUTLtjIqP7Q=;
 b=7Wp1BgUiJkDgSYtmSY0IN1ZJKiNK7fPH7ie2dF11cmVKEDXt5VuAHLgK7a/0nra9j3
 5aUoGtKc7ihKz0ZkWCnz8KeAsfhlbmGrwEMsMc+eauYBVtU8g7YEC2YpjmPxm079jNKi
 tfKVthZ8rbjtFeFId4SFbdoynpjI35uKmvzwmqODxLjCIp2PD4MjUXk8ojZdAme88LUx
 Mrofhk+ncx3A2HgkVi6hJI8950B9Yh0Vehz3LlMc5w5HRjOFNB3C15s/MKuwcoZkff0y
 R35lvO6P5dTMtDyyP30sbctFBJu3wgz6FzBNrADLhMVJnyvEGepE9SOo5Aic8Kgz5RCj
 C/BA==
X-Gm-Message-State: ACrzQf3qTUSDDe4hY7dPlb9Utm9Um+QCLbo30xM0LxPtTWWC4TEnEwnW
 8TYqLHcfU0qYlHChhMqUND8LBw==
X-Google-Smtp-Source: AMsMyM7hU8P1pHqEnztNH+cnBBDz+KOlEdjcte6dDTB7t1Y0VcQSmnanSySLd0xIEg8izkZjTIX5Sg==
X-Received: by 2002:a5d:5a0c:0:b0:22f:608:48b with SMTP id
 bq12-20020a5d5a0c000000b0022f0608048bmr26205512wrb.84.1666712508652; 
 Tue, 25 Oct 2022 08:41:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a5d591a000000b0022cd96b3ba6sm3541463wrd.90.2022.10.25.08.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 08:41:48 -0700 (PDT)
From: neil.armstrong@linaro.org
To: Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/panel: khadas-ts050: update timings to achieve 60Hz
 refresh rate
Date: Tue, 25 Oct 2022 17:41:45 +0200
Message-Id: <20221025-ts050-timings-v1-0-c95a60acf935@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.1
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Neil Armstrong <neil.armstrong@linaro.org>

This updates the panel timings to achieve a clean 60Hz refresh rate.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
To: Sam Ravnborg <sam@ravnborg.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
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
