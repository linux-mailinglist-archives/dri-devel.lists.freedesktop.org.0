Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED63EE88D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 10:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F696E114;
	Tue, 17 Aug 2021 08:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E4E6E10C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 08:32:22 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qk33so36979004ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=McC8S/bFHuSwRDT9VMEJP32+dSnc9rWytA/mVOlvx/s=;
 b=AIA3jon3fcIEdq7TSD0sgFmfbyrXMgjw5dWIMmxO8hDjibdmLplXn3aTJuYjYcGkg9
 Lx29sA2LQM4NKRhLaBlBZpyCycxDyg2ZoIjZdVvBWjYEQkH+bYa8ZtnKv1TvJWgE1nFA
 rJf0qohjLDPp3pUkTZn84rzH+filXNXRAPz8RCdTKmiMaDaY4/N3q+xVXsm0t1sf7t5b
 RSkC/zcxzrV5yOoh4D+c9+2K+1dSLRVj4E4ICtYFohxsjiDYcpTZGd/j40ClKqB+AtHo
 n5hbOwAf0Y/OXLFQ6LBKukW0DWrmrOBYqG7J9eZ5+mpN4lr3fvdZIluAYafW+hwUypOf
 UnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=McC8S/bFHuSwRDT9VMEJP32+dSnc9rWytA/mVOlvx/s=;
 b=c9Gn54MAZIYMc6RQkFGqC7cb4PHJltbA+z+m+9RMkPnC/OOaCRasP3jq215HHPfHlz
 rqSX55I57flxrqQm4XVEC9kq+uVLOrnDjtJSJtLm1eMXVxx6gBfXpRYAjvYa2e2E+lZL
 vjxgSytKlfbvGBVcGvwvg9ynYn2ER87u6MNoKsLplnx0s3oJFSXAGkHFJkvHf+Zi4cvU
 CDuSFrbrfmsp11XIrj0Ir5MOe4w6YlFK5VZLiRjHTc4xCmdKEvPKM0VawPByEljXD/Sg
 S8kC1fDIEdklJ3Kq/Gp3ObqChJWXUL1zJFRCv4/rugRyN3huJSLny0vVT4gaT6I0tZ1D
 3Ckg==
X-Gm-Message-State: AOAM530iR3fG/G6yAo7U0ITU7K7bpXgxPEmwgXkxSs22DRhcwpBjF0Kf
 MhSIbO3ZE5mVSx7POvh4tzQ8JPq2t0yPNQ==
X-Google-Smtp-Source: ABdhPJx9ULim+GbyMepEG7BJqpc7mloIkbJBf2opDUr1KyybekscBrNW+WTqvS4do7tk1DbPcyO0oA==
X-Received: by 2002:a17:906:dc4:: with SMTP id p4mr171310eji.66.1629189140375; 
 Tue, 17 Aug 2021 01:32:20 -0700 (PDT)
Received: from localhost.localdomain (neth7.eastcode.net. [79.143.160.90])
 by smtp.googlemail.com with ESMTPSA id e22sm675850eds.45.2021.08.17.01.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 01:32:19 -0700 (PDT)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel
Date: Tue, 17 Aug 2021 10:32:01 +0200
Message-Id: <20210817083201.675133-1-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 Aug 2021 08:35:22 +0000
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

The model and make of the LCD panel of the Vivax TPC-9150 is unknown,
hence the panel settings that were retrieved with a FEX dump are named
after the device NOT the actual panel.

The LCD in question is a 50 pin MISO TFT LCD panel of the resolution
1024x600 used by the aforementioned device.

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..97fc3c5740bb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4090,6 +4090,29 @@ static const struct panel_desc arm_rtsm = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode vivax_tpc9150_panel_mode = {
+	.clock = 60000,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 160,
+	.hsync_end = 1024 + 160 + 100,
+	.htotal = 1024 + 160 + 100 + 60,
+	.vdisplay = 600,
+	.vsync_start = 600 + 12,
+	.vsync_end = 600 + 12 + 10,
+	.vtotal = 600 + 12 + 10 + 13,
+};
+
+static const struct panel_desc vivax_tpc9150_panel = {
+	.modes = &vivax_tpc9150_panel_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 223,
+		.height = 125,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+};
+
 static const struct of_device_id platform_of_match[] = {
 	{
 		.compatible = "ampire,am-1280800n3tzqw-t00h",
@@ -4103,6 +4126,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "arm,rtsm-display",
 		.data = &arm_rtsm,
+	}, {
+		.compatible = "vivax,tpc9150-panel",
+		.data = &vivax_tpc9150_panel,
 	}, {
 		.compatible = "armadeus,st0700-adapt",
 		.data = &armadeus_st0700_adapt,
-- 
2.32.0

