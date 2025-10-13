Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EEBBD18A3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 07:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929AC10E37D;
	Mon, 13 Oct 2025 05:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L0jPjMcQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F094110E379
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:56:19 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b54f55a290cso511158666b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 22:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760334978; x=1760939778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAf6EGQeqIJGv2EMJ3digEJ7PV9lZXWnKBDi4CC+hkM=;
 b=L0jPjMcQGBjufORpgksCi89iaBySGTsTN2wf/GAHwzeHL5hW4UiR7jB2j9JA0lHbg4
 v0onLx+AR6t5hNA+v7qYXF32zyKxJu59hD0MBC6krP/CyGv4IOb06Hy7J+LeXv366VnX
 c3hWfMOoYrJ0NSv0vkuBsxRjLlV5paVWpCmMyU+zHfj5VXRiBqKm3scxNkoX8es6bINR
 eKHd8GHQIkG0BKeTqCyCipDX7Z6I7WvSSNtb3bF6cBtJGklhFizjaTwyTFHbr2iyBGxL
 TuisiLTAh0U8x8BGG2Te48FR92foGCzZ1Nv+a0dIvZU1PQuFH8p673W8y74HzJYAHZyr
 Alvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760334978; x=1760939778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RAf6EGQeqIJGv2EMJ3digEJ7PV9lZXWnKBDi4CC+hkM=;
 b=wZQzG2nWW5uC2iwMwxRWLErdnPvzjnYP0JdGF2ddKYPBEtsfbH+g9Kel4AexPILN1N
 zCf2lxEabjbmsVVoqXdR7qArshJB/5+obc6SxT6zAMhKwtsL/vo9TiP4aVr77DD8Rg7j
 xIEo5dkPHJrcbZvTO+hVbYs7dOW4CHH1JrDSr79mIeVuzztYYTbnaHjV8Z/sNeFNuGhJ
 Q6oz5ah5CSx6GaU4gTqRwF0BHWvb7O+GKq7By6zCdwj2joLp3QCBy4CvNftftDfbrMuH
 7VjN3HajMdDA1f2krUA+NETwGov5Z2fG4tSm8hxOo5KS4HsXXCTWgtSRKglP4FGH3EZy
 774A==
X-Gm-Message-State: AOJu0YyrVrrx5vzOk5ydIICMQHFngu+ahd5bqnNV4+7PKijEdRiKavt9
 HoNb5ZKY5ql+fuvDBISLXa/5EB0r2XcElQsqQoll99WqZtikQ5555OZ4
X-Gm-Gg: ASbGnctB6uCUkEnhm6AQ8wmFwRYcnwVoB6Icx4nIyfH2WFwx01d0ZSYJ7KcMciAWPAc
 eic5bU1Tqh1vhWDpD8gmLzDS+OGT2Uv2Xe7YnAQsWWUf6AZGD1GTZrONh5B2mGadlWBUn87SrIv
 1SkLmsSfguUaGkXQjvnAOBN3uPZTGLFZGngP5n/DFsblT/WE7fSEYb2mF5k2DaPeNh9scOANh3z
 oD8mrfpeWpbe61mES/Oqltcq+dcCnbF3PMj+eI2OODAwhBThtKBKKRVSETYIG4OG6b0wY63FkeA
 qI+asGV3XnDzoA4tF68Sxru1KNSx9mdeNxG5G/dTxg1T4B7bqXVrwguRZgzHSOHTjp9/0nFfqC9
 1eOQtTtqIiOi4aO5Yu1LK7WpyfpjGPk68F36tnCS/LrI=
X-Google-Smtp-Source: AGHT+IE90eJykgwlLq6LrJzKnujY8LCDyZPy1SZa7XTZkQZFTXfuHu5TUiO7YqD4A1awp1OsNprVEA==
X-Received: by 2002:a17:906:ef04:b0:b44:cfe1:ac93 with SMTP id
 a640c23a62f3a-b50aaa9c403mr2034340066b.26.1760334978370; 
 Sun, 12 Oct 2025 22:56:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d63c9a3csm860912566b.23.2025.10.12.22.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 22:56:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
Subject: [PATCH v3 5/7] gpu/drm: panel: simple-panel: add Samsung LTL106AL01
 LVDS panel support
Date: Mon, 13 Oct 2025 08:55:40 +0300
Message-ID: <20251013055543.43185-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013055543.43185-1-clamor95@gmail.com>
References: <20251013055543.43185-1-clamor95@gmail.com>
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
index 6369e5828189..bdb53824e3ed 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4223,6 +4223,37 @@ static const struct panel_desc samsung_ltl101al01 = {
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
@@ -5390,6 +5421,9 @@ static const struct of_device_id platform_of_match[] = {
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

