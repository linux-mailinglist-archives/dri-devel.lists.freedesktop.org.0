Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC80C3DF8ED
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 02:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD896E993;
	Wed,  4 Aug 2021 00:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99DF6E993
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 00:24:08 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id m18so632275ljo.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 17:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1g5MuhzsF54hdSj2ImZwAhfofgvtlBzMFMtIoIyIQ14=;
 b=C923nqazjsYX2Om3f9YHX28wT7y2y9fyoyMX7/1B3yNMUXYqkA0oiyOR4qWxhNPiM0
 giEEqxAo7L/2+PTgH9GtKsxzjtigEyd+jvFd0hBbD9xc0ejR3h5LUn232ckIvEWtRJgX
 QWuTRNeyzV+BxUU4rB8fK5CpyNUTLKGXRBbZO1SqOq0pIHICa9c53WnBccQiymQ9pL/q
 UWa7kZwygzR6l7plU9a/ZmUczNAX5U39/35LMasH/kh0oiohjhXeemi8bL4SmbgqSYg/
 9M2vXHHcSziFZIFNZM3Wyc9+CcEIK2Imq1Cgng7masCi+/TKLxjq5c+G+iTtes5fXmmN
 t1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1g5MuhzsF54hdSj2ImZwAhfofgvtlBzMFMtIoIyIQ14=;
 b=FuzSyOFVTAeZyQ47Aw8bOXqZWLSJLef3LEiube3QRo6zj7GBqUVj6oaQ2ZPZqKSQj4
 FrbqLmG+gnd5MWjHUd/+cYJoaDDMyRM1xiAEPVHJxdUAjFsF9uw42zwY69o5MHunOg+8
 CjBsA4db41g3DGj0exnIykRdxihFqu5Kg0Z3/E4QrRJ6VntbwY6bKNkY5VMX0cbUJ3Ou
 0LF7jsM46v5UyD6gLlfHscZVcfKIbX6BRWuZsCNXfxjOLm/cMNv/vlR2grKBbOjX5ZyB
 or/XcB2GNPRx74kbDAHei9ERse5o4Irb6KsU6lw+EqDZUpuE1+GvS5KIRwImhDgkM5h1
 4hxg==
X-Gm-Message-State: AOAM530Z9Ne/W9LqRxEdioZb6xxW/pvZEb5uZrytUHqcxBhQKStZJoT9
 5U+0zhPt2dQXHTV6QwWT9Ks=
X-Google-Smtp-Source: ABdhPJy6XR4zq66mb+NBu5WQrZaQXgMILdNI42Uon6XuiuuPp2xYvSMpGAdfRntCklqtCJ9BfHQjTQ==
X-Received: by 2002:a2e:9b4e:: with SMTP id o14mr16373512ljj.270.1628036647079; 
 Tue, 03 Aug 2021 17:24:07 -0700 (PDT)
Received: from akaWolf-PC.. (broadband-5-228-138-51.ip.moscow.rt.ru.
 [5.228.138.51])
 by smtp.gmail.com with ESMTPSA id t17sm40992ljk.102.2021.08.03.17.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 17:24:06 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Cc: thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, akawolf0@gmail.com
Subject: [PATCH v4 3/3] drm/panel-simple: add Gopher 2b LCD panel
Date: Wed,  4 Aug 2021 03:23:53 +0300
Message-Id: <20210804002353.76385-4-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210804002353.76385-1-akawolf0@gmail.com>
References: <20210804002353.76385-1-akawolf0@gmail.com>
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

The Gopher 2b LCD panel is used in Gopher 2b handhelds.
It's simple panel with NewVision NV3047 driver, but SPI lines are not connected.
It has no specific name, since it's unique to that handhelds.
lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG NV3047 Drive IC 480(RGB)*272 No Touch 24Bit RGB Interface

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b286bd4444f..2c391ed6ec1a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3563,6 +3563,46 @@ static const struct panel_desc qd43003c0_40 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode qishenglong_gopher2b_lcd_modes[] = {
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
+static const struct panel_desc qishenglong_gopher2b_lcd = {
+	.modes = qishenglong_gopher2b_lcd_modes,
+	.num_modes = ARRAY_SIZE(qishenglong_gopher2b_lcd_modes),
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
+		.compatible = "qishenglong,gopher2b-lcd",
+		.data = &qishenglong_gopher2b_lcd,
 	}, {
 		.compatible = "rocktech,rk070er9427",
 		.data = &rocktech_rk070er9427,
-- 
2.32.0

