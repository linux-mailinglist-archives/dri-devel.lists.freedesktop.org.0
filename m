Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48678BC3D3A
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 10:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282A210E77D;
	Wed,  8 Oct 2025 08:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="INO7sPYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEFC10E76F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 08:28:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5797c8612b4so9490472e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 01:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759912124; x=1760516924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uV9bEo+jpzFCLNbrvyE91xLWTJAB/c8fcrn62g9WVnM=;
 b=INO7sPYqDUs3m1OB9f9hJQgTAhIWBBdelk8hVcjySeIY1t/x5dkKY5QX1yQxjq0sDw
 +Uyebt93CK4dzJ7VNhbUZSIl/wq9bQnYJeRnlWNcutQvqfXC/kqlC4WsGXObTVCnRQ1A
 04eIGL1AmgDUz+Ehtd2/mdsg8W4naoB0TAu8kE5qBBTkPwNFTxupopRpsn1R5wLFWVV0
 octgDrkINO+0aSjzdsOh/yqnZFr/ocqe0rrrRTgzoJo1GfSFJiSX0+IulnxaZllXv00q
 4Xt5arFSFcUDmBMc1iR/xNHMzGJsQYPC0ykSL1sIXc1PXrU/X+ToVeowOtznLVfdGpgt
 5QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759912124; x=1760516924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uV9bEo+jpzFCLNbrvyE91xLWTJAB/c8fcrn62g9WVnM=;
 b=akULsg/GPJpHXKaxWiE/jMNUCGj3U/CfXc1JTEN/7Bv8QIJBTQgwOObMlNEa4N6Blz
 oQbc2n/IM4gEbNQ6E+z2JZL/MtbrYOxfc5A4m9lkut6hBbV2mNPN9TWfmkFRiDGOw7hX
 WrffXaGEfzYiv9HL3XLt+b4XdUcXtTynC6oVsoqpzhnlqCH2NdurYCM9yxOVoDfmZXC5
 Qpypo+aFxDa3JNxNCf8Digz/YqnJdlHOh0VJPRyGvIuJAZFjyv1t/YvQ+5i+5xSjcARy
 97ytqRpiqAusehkaCk8cTeQrThkfZlUTuEb9ra4v/kTCci9mZfWjX1AsEg7rhtPn1T72
 LfdQ==
X-Gm-Message-State: AOJu0Yx6TGX+61Qr0WHlsI/cddBjwhQiMHLanVomOOfDiVVApgv4T1qe
 +1IJmvk9s/Fl8vgXS/rvsqszTpXx6iIZaYLJF4TngPzC0UiioQNM6gjO
X-Gm-Gg: ASbGncu1ds1ThhJVGOc2X/yJCozDAUk5iKRJIrVef1oq5xNWLLcFY3qLq9l+8mZl74j
 Yl2ZV+4Y3q0PBf3zB7Hjatk8vRcMICxgdyZpbp4EY/Vo+9TT9n3m7RTaDv5eEVZqPnjzXqqqTQk
 ojg4znjz2SQL0Fpgl8Lnr/hc8lyjIRMTIc5i1M7bFrVz0wY0ooXQTE152xOeXgMPdOsQeBz+8VE
 FIPgLXjMh7yujJ1s6M/93FUzsteLDmIpn3sB1C8pmSjcQy2CRKN9fbHiF4fCMCFFd0JMCfBbDC6
 z37GA2NfZivxgnn6zwXuu8YLL7Gz8OtQDA0NCm7vD8hu6WCPcyyjnp4AT/502R+1DY5JevgmQCg
 FYlDLeQUKzePXA4QeeJtD+xkWvOlyJcQnTfgQSw==
X-Google-Smtp-Source: AGHT+IFIW595D9hFhReYazPCYD5IL0kfVrXBukuOyPqDZomqnbAGHxukrmHmJaTHzusxTCMjXJg+5A==
X-Received: by 2002:a05:6512:3e29:b0:57b:cebe:ce04 with SMTP id
 2adb3069b0e04-5906d896bb8mr627734e87.1.1759912123399; 
 Wed, 08 Oct 2025 01:28:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:28:43 -0700 (PDT)
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
Subject: [PATCH v2 5/7] gpu/drm: panel: simple-panel: add Samsung LTL106AL01
 LVDS panel support
Date: Wed,  8 Oct 2025 11:27:57 +0300
Message-ID: <20251008082800.67718-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008082800.67718-1-clamor95@gmail.com>
References: <20251008082800.67718-1-clamor95@gmail.com>
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
index 81350ef50295..753149a9ac3f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4191,6 +4191,37 @@ static const struct panel_desc samsung_ltl101al01 = {
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
@@ -5355,6 +5386,9 @@ static const struct of_device_id platform_of_match[] = {
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

