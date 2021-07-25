Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D92DD3D5062
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 00:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93E36E4CF;
	Sun, 25 Jul 2021 22:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B186E4CD
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 22:16:08 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id r26so12006068lfp.5
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 15:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6B4jEJL67NPET91efGnsWZsqxuxCtq/o5nz6hNotkO4=;
 b=BxSZFFCUwe+jQ8T87WItuzNoJcDlu154rWQJJMghA8dQX0fmzhKsCmr6QRDL0iFKIz
 UVIw3FhQlxabjAxaGoUF7/kUm8Q2mkaEj2HiMhDq4q/sTnyJW7P8qZPsIHo5hIq9FP07
 vHiisc+pC5Vw4cInOEEw7a9b6eeBoDRohH+IaPdi9pd9hrqIbXmde5jeEKxpGHMK0K8a
 1fLEasbCkIJPVrnzNSS0k4frtmAsKx3WtbKySH0Y9X7LKjfTNoMlWDnqr7j6v0xBbI8n
 uMYJonkT5ZRGUye9Dr5lja7Y1jmOeubtfoaBH03TJHW0icvayPE3JbFkf7Q9fYNSrDwd
 2rNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6B4jEJL67NPET91efGnsWZsqxuxCtq/o5nz6hNotkO4=;
 b=JrPbsJHDmOv5Ihk+JJRqmW7hCoxkBLB9VDm/I/vXQUw2BIkbyFQG3HC7hmxEQpaYuq
 TT9JCl11xIOcwXETWqpHhl7hVxBWYNAOfyQlLkBcuvP/NAUft+49ur4vaUBb/CEXn31z
 RAbodCPvjUNXxAU0B3LcpbkIbRmGdEvH8Wp2hhkDR2kuWnD+K71nmTjSTLRjRzBTxr6n
 6a6TMRKhZfYYqkHjt8n64cSOYYWysN9t8DOIruCUuOyXj41mgIzVdTJDQae/zRyO3XRN
 7WT1YNa6sXZyPxeNJFRfzxRqh7QH+hl8QAh0HLT3bUwaPzMTLkRt5IUyVrTnUtPI1/hY
 xN9A==
X-Gm-Message-State: AOAM531EZT/5lPZzwfvWFIFkZaLII9s/ScSRtZV+UyYmsjA6twnUvFS+
 4XDRkdWuxXnK4dO3OWg995MgkSe6UsSQbg==
X-Google-Smtp-Source: ABdhPJxL2L6D6hlrndH5ArxdXn3vZvFTY6HE9Ya6xghjgEv7cqSHBJqJh4TBbw6snIoS0QyU9IdSpQ==
X-Received: by 2002:ac2:4888:: with SMTP id x8mr10406743lfc.19.1627251367371; 
 Sun, 25 Jul 2021 15:16:07 -0700 (PDT)
Received: from akaWolf-PC.. ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id z12sm2862647lfu.53.2021.07.25.15.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 15:16:06 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Subject: [PATCH v3 3/3] drm/panel-simple: add Gopher 2b LCD panel
Date: Mon, 26 Jul 2021 01:15:27 +0300
Message-Id: <20210725221527.1771892-4-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725221527.1771892-1-akawolf0@gmail.com>
References: <20210725221527.1771892-1-akawolf0@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com, akawolf0@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Gopher 2b LCD panel is used in Gopher 2b handhelds.
It's simple panel with NewVision NV3047 driver, but SPI lines are not connected.
It has no specific name, since it's unique to that handhelds.
lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG NV3047 Drive IC 480(RGB)*272 No Touch 24Bit RGB Interface

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b286bd4444f..6b69c0c70814 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3563,6 +3563,46 @@ static const struct panel_desc qd43003c0_40 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode qishenglong_gopher2b_lcd_panel_modes[] = {
+	{ /* 60 Hz */
+		.clock = 10800,
+		.hdisplay = 480,
+		.hsync_start = 480 + 77,
+		.hsync_end = 480 + 77 + 41,
+		.htotal = 480 + 77 + 41 + 2,
+		.vdisplay = 272,
+		.vsync_start = 272 + 16,
+		.vsync_end = 272 + 16 + 10,
+		.vtotal = 272 + 16 + 10 + 2,
+		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+	},
+	{ /* 50 Hz */
+		.clock = 10800,
+		.hdisplay = 480,
+		.hsync_start = 480 + 17,
+		.hsync_end = 480 + 17 + 41,
+		.htotal = 480 + 17 + 41 + 2,
+		.vdisplay = 272,
+		.vsync_start = 272 + 116,
+		.vsync_end = 272 + 116 + 10,
+		.vtotal = 272 + 116 + 10 + 2,
+		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+	},
+};
+
+static const struct panel_desc qishenglong_gopher2b_lcd_panel = {
+	.modes = qishenglong_gopher2b_lcd_panel_modes,
+	.num_modes = ARRAY_SIZE(qishenglong_gopher2b_lcd_panel_modes),
+	.bpc = 8,
+	.size = {
+		.width = 95,
+		.height = 54,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing rocktech_rk070er9427_timing = {
 	.pixelclock = { 26400000, 33300000, 46800000 },
 	.hactive = { 800, 800, 800 },
@@ -4651,6 +4691,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "qiaodian,qd43003c0-40",
 		.data = &qd43003c0_40,
+	}, {
+		.compatible = "qishenglong,gopher2b-lcd-panel",
+		.data = &qishenglong_gopher2b_lcd_panel,
 	}, {
 		.compatible = "rocktech,rk070er9427",
 		.data = &rocktech_rk070er9427,
-- 
2.32.0

