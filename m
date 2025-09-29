Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A717CBA98A5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BADA10E438;
	Mon, 29 Sep 2025 14:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LTgy7n3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AA410E433
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:25:26 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-370f3111dedso34065641fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 07:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759155925; x=1759760725; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CR2DRLiDhu+KIUp//MexW+twJoNutw9NX8KBL+bDU8Y=;
 b=LTgy7n3LphZVu4+GZ265nKHNEUWEzNUZ6gLZqm9Jnz78zpyWZHN7hZvsCKBg9UFRTg
 dAkcADd39bKowQ//byPM6Jr8MrK/a466xG/TETARuxzS0z207q5ED8s3ZeFhGJYODQjB
 zOcAr8q1VdpAFDflF0qg7B3l/3X8NE0+HwPA9lop0bnxrtd8heeSGmhf+A1wuWFa9WfU
 KbU87nmJwu8TywXlFeMrOSOGrVjWotiFd6tjGuIxQNMhB/ZO/9KqWB6bCICOHdgIqWoa
 LuMcNMLCEo7xP++LzdQ5sNnE9YKJbMNu0hZN2+S7BRN0jQUzZtO44Z3NObacdIVwzANX
 +CJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759155925; x=1759760725;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CR2DRLiDhu+KIUp//MexW+twJoNutw9NX8KBL+bDU8Y=;
 b=PVpyd6iA07sZcCnwC2f21D8zpMj86y5vOOQLjV0gKPEvYtah5aXHmStyuIyBymUg5H
 mGdVRMp5Dg0IzuBIVKD4qKo0NeZ/W+64EcJfU8rlklriL+rtKpC6kXlmDYgUfeu6bmYe
 ltgr7PmZ4Zbe38lrOtpLh5x1lGLHY8jfX/EjBcn633Ke66PjOq2EIymgPDwGVby6k0KJ
 4P0/n0B+zc03RfFsWX1ET3UAomrsPfn5kVX4eHV+z8ReAuNymiGBDSyQ+0Q9/4PZ5WEQ
 iImplM/LZ623Xmh88pRBTDh4hKHPCpUrt6aGJyLOhA0QGSgti7yMtAHlP6kx6p1y7idm
 WuLQ==
X-Gm-Message-State: AOJu0YxfdQV7QJpk4EnREdRyOlVTIUbi+dmHmtRmrRPYiNA7tU6tfiXF
 lo/MsLO+4ImvXSbP1JgCJqa8ZdmOqj9voxWCUu84Z3P8mCR5I2J0maMv
X-Gm-Gg: ASbGncvRRKNQhwuBJcWeLpj/XM1U//47NUfkeln88xkh4PinXZrMZVVwcVG2JQGFRdl
 bCrsP5Rn+TIRUHXOaBPhVm9Vqrs0YRz/sW4EUawb0oOaXuWDMyPyfxAnbdhFw7KVbdIXfwCX5gT
 2jfUWvBG1Ggal0KZO1v8aNHpV46C+191b5pejJ1Q3/5itc20LXJI2wg6ko0oLjvcSRlp5AxpNGl
 ERoFCqABGf9vbQjGOdYIrggkZHqFwI4NS3Hup7HJlPVgVZYjsSZVBdDbNdoV6C66BvRzyioD8G8
 CNfyfBs8Si/oJmRSQfDGmGMogqc6SPt+OsBAnbRic+ATIKWm+wXw4PfJ1uBiPALxxOxAg3W27ll
 Z6WyUzQDdT48MsbmjwM8O9q37
X-Google-Smtp-Source: AGHT+IFNjIFgX8uVUv3LKnu6a8HZNQrQoOWo+SvjXPGY7p7tT2SghjlapbxzZJoZAFXHw1IMl5Pu2Q==
X-Received: by 2002:a05:651c:1117:10b0:371:7771:9f19 with SMTP id
 38308e7fff4ca-372fa21bdfdmr2079601fa.7.1759155924484; 
 Mon, 29 Sep 2025 07:25:24 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 07:25:24 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 5/8] gpu/drm: panel: simple-panel: add Samsung LTL106AL01
 LVDS panel support
Date: Mon, 29 Sep 2025 17:24:51 +0300
Message-ID: <20250929142455.24883-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250929142455.24883-1-clamor95@gmail.com>
References: <20250929142455.24883-1-clamor95@gmail.com>
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

Samsung LTL106AL01 is a 10.6" FWXGA (1366x768) simple LVDS panel found in
Microsoft Surface RT tablet.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index ea2cdddb9b8f..6626393d7565 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4144,6 +4144,37 @@ static const struct panel_desc samsung_ltl101al01 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing samsung_ltl106al01_timing = {
+	.pixelclock = { 71980000, 71980000, 71980000 },
+	.hactive = { 1366, 1366, 1366 },
+	.hfront_porch = { 56, 56, 56 },
+	.hback_porch = { 106, 106, 106 },
+	.hsync_len = { 14, 14, 14 },
+	.vactive = { 768, 768, 768 },
+	.vfront_porch = { 3, 3, 3 },
+	.vback_porch = { 6, 6, 6 },
+	.vsync_len = { 1, 1, 1 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
+};
+
+static const struct panel_desc samsung_ltl106al01 = {
+	.timings = &samsung_ltl106al01_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 235,
+		.height = 132,
+	},
+	.delay = {
+		.prepare = 5,
+		.enable = 10,
+		.disable = 10,
+		.unprepare = 5,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode samsung_ltn101nt05_mode = {
 	.clock = 54030,
 	.hdisplay = 1024,
@@ -5302,6 +5333,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "samsung,ltl101al01",
 		.data = &samsung_ltl101al01,
+	}, {
+		.compatible = "samsung,ltl106al01",
+		.data = &samsung_ltl106al01,
 	}, {
 		.compatible = "samsung,ltn101nt05",
 		.data = &samsung_ltn101nt05,
-- 
2.48.1

