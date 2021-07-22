Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950EE3D272A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 18:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460F86E96B;
	Thu, 22 Jul 2021 16:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EB46EC97
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 14:06:06 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id q16so8717848lfa.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8P+SNIm7ys6Pm3nFiUXaaTArhPHCRQdekLUEbPgIWuY=;
 b=JEm96QwhXUz7bAeQpkiWigh8u7b05RgHuD0u6usLs5C18FXpJmnuutQsR8bGfCqSqj
 vNY1t7JRidi1/S4YbGvF2rDqWj51nRdB+mHSfif3p2IGdckpIcr0wHjm8re5gYKcoF0W
 7QkxlrAkDqn6aI5pUI+mYHOh+XKuZyMjsbj+gA5vJRXSkgs+zd6f9kmsJPhpOyeFVxPf
 jy2cYnaP6s6jy6VVwXA2Toa+Syn6hv0olVcnQJpB0ygAGO0FW0OCVzJGoWhVqUeccRQ1
 IIjLjwOUUwbMKKXfpB0ffpn4v06nbIobYu6mMNnG+2WNdcoolsraWjUj21Vg0b8quGu5
 CVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8P+SNIm7ys6Pm3nFiUXaaTArhPHCRQdekLUEbPgIWuY=;
 b=ohs9rWJzS/wlZkjz8JZ7IuAV4JfB5TGVJEYQLRQmaniBx4Ngm8fADPlxGd/g23/htA
 LnUTwawPgy0MAZpquC1pMJ4XI8OYu+H+gXoUtUcagR8/IBgLnQP2MSEImQWd62LBcYuC
 elQPjmwULTptQTwACgX+1qsT7RDxFx5JOUAWBPQH0+sRqYq3PZLJs+Qp+XFF8QnaqKOg
 bEnLDEaD+8/MPolE8ryXZSzD2Gl2MwCQYQ92o0ijeMEyvxSROe+Yw1qwgvd2MK+c5h98
 DRFmaL2XihAtzXeCItqkMSzhmr8kXJvyObMzOUIIlixn8j/DVDN18vPhEyzVMIDzrhT0
 wViw==
X-Gm-Message-State: AOAM531JlpIm3EfnhyjdPa7+QmEGgLDgIunv1aoh34p72hMSANqCJBeh
 l9xNN6QGTE8JQaBtSkIU9uU=
X-Google-Smtp-Source: ABdhPJwIOUSQmsam9/2wyWQVAgpLviDfVIYK7k0C/PaMYboRYoaohZgwvnmlH0s1teitKY8EPyUcQw==
X-Received: by 2002:a19:771c:: with SMTP id s28mr28487458lfc.358.1626962764736; 
 Thu, 22 Jul 2021 07:06:04 -0700 (PDT)
Received: from akaWolf-PC.. ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id p8sm190584lfu.163.2021.07.22.07.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 07:06:04 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Subject: [PATCH 3/3] drm/panel-simple: add Gopher 2b LCD panel
Date: Thu, 22 Jul 2021 17:04:32 +0300
Message-Id: <20210722140432.1426173-4-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210722140432.1426173-1-akawolf0@gmail.com>
References: <20210722140432.1426173-1-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Jul 2021 16:00:25 +0000
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
It's simple panel with NewVision NV3047 driver,
but SPI lines are not connected.
It has no specific name, since it's unique to that handhelds.
lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG
NV3047 Drive IC 480(RGB)*272 No Touch 24Bit RGB Interface

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 44 ++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b286bd4444f..9cce6b63a147 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4306,6 +4306,47 @@ static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
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
+	.num_modes = 1,
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
 static const struct drm_display_mode arm_rtsm_mode[] = {
 	{
 		.clock = 65000,
@@ -4753,6 +4794,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "yes-optoelectronics,ytc700tlag-05-201c",
 		.data = &yes_optoelectronics_ytc700tlag_05_201c,
+	}, {
+		.compatible = "qishenglong,gopher2b-lcd-panel",
+		.data = &qishenglong_gopher2b_lcd_panel,
 	}, {
 		/* Must be the last entry */
 		.compatible = "panel-dpi",
--
2.32.0
