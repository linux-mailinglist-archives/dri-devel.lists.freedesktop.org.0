Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F7E55BFA9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 11:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCE211BF61;
	Tue, 28 Jun 2022 09:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CEF12A974
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 09:00:56 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso12035380pjk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3IiMMMDPLwz9F3UeFSzYtl7u8epQnprjfnqcTqmPDdc=;
 b=fdgeeJCygTbWPCwOcRdRnM5k89FhhxUXjcu7q4k2tnjMEcJyiYkKCYjTsdEAOW87tB
 w/LJTf+LO4X22TFU8tUXrtyWFwDPR52aYVR+q1ZWFT3vqv0NRZ6FGT/wkTLNThyRcp3Q
 UxbI4gGUkWYVxk0iRRZZuIF+HwkJ6wk8YTF/D3o9cVZcPRYr0qY+6SEtx/YsXUU17kBO
 B6v1tbxXZy0Ma72s+vAI2t+od7AWzoe8lR9/YGXO1n+iZcMgUWB2BmjI8JRRUlqjHvfZ
 PV0uHJjVrfaHmbeXn+Ti2vmUY8gbz5CFN/7us+y8mnoWHg41b4t7kDRSXK7lTTAT+M48
 IqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3IiMMMDPLwz9F3UeFSzYtl7u8epQnprjfnqcTqmPDdc=;
 b=b6obRgWNuF/Bz09DrZ7BsoqZXHYeAVkdGyNWxJ+9AutbPa8bVkGyfMAuVhFJJKq7i8
 OexIOaTZL9BXF2p/WuT/wAid6fGqx7RtRwL4tOOaa7DY9u0JblU0mP2KxfaHssdjYO2Q
 o41bmJhLDtW0vx4S7mPK4T/c9VY3+VNStwTdWGyagkjQPQLyKrVpqNXCJVXUbsgK/HyO
 i+ha9vY9d7xOpRsy1SUzfKwkEckURTEdPEX4kXActsPenSSSOygknXJEpNL0wCLCW1B9
 PtPzXATk8cW2x2s4jFZD18PN3qIZ553vrdyWrMhSxx3qooulYFAIcoMIfHGOmvGcUE36
 a4Sw==
X-Gm-Message-State: AJIora8RAT3hxyO1VN62mS77cpxlK/PUF7yLRAsgSW/6+DLcVnRC3yCP
 nEXTCQLBB5aW7+MjEn8pgWg=
X-Google-Smtp-Source: AGRyM1vLfFfPeOT7qcM6D3nurI9ZAJGl2I7PMQ26kHrnlwIMGUzDjswBsg44tVIcX7/8JAqZb+CBTw==
X-Received: by 2002:a17:90b:895:b0:1ec:827c:ef0f with SMTP id
 bj21-20020a17090b089500b001ec827cef0fmr25644802pjb.10.1656406856518; 
 Tue, 28 Jun 2022 02:00:56 -0700 (PDT)
Received: from chrome.huaqin.com ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id
 bf20-20020a056a000d9400b00525392cb386sm8789688pfb.201.2022.06.28.02.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 02:00:56 -0700 (PDT)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] drm/panel-edp: Add eDP innolux panel support
Date: Tue, 28 Jun 2022 16:59:49 +0800
Message-Id: <20220628085949.2147920-1-rexnie3@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, spanda@codeaurora.org, robh+dt@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Rex Nie <rexnie3@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 14" innolux,n140hca-eac eDP panel.

Signed-off-by: Rex Nie <rexnie3@gmail.com>
Acked-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3626469c4cc2..2a8fcdffe80c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1355,6 +1355,29 @@ static const struct panel_desc innolux_n125hce_gn1 = {
 	},
 };
 
+static const struct display_timing innolux_n140hca_eac_timing = {
+	.pixelclock = { 72600000, 76420000, 80240000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 80, 80, 80 },
+	.hback_porch = { 190, 190, 190 },
+	.hsync_len = { 60, 60, 60 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 6, 6, 6 },
+	.vback_porch = { 38, 38, 38 },
+	.vsync_len = { 8, 8, 8 },
+	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
+};
+
+static const struct panel_desc innolux_n140hca_eac = {
+	.timings = &innolux_n140hca_eac_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 309,
+		.height = 174,
+	},
+};
+
 static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
 	.clock = 206016,
 	.hdisplay = 2160,
@@ -1775,6 +1798,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,n125hce-gn1",
 		.data = &innolux_n125hce_gn1,
+	}, {
+		.compatible = "innolux,n140hca-eac",
+		.data = &innolux_n140hca_eac,
 	}, {
 		.compatible = "innolux,p120zdg-bf1",
 		.data = &innolux_p120zdg_bf1,
-- 
2.25.1

