Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1686C458FD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CF210E364;
	Mon, 10 Nov 2025 09:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WvtoN4dY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B18D10E360
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:15:31 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-37a48fc48deso25464791fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762766130; x=1763370930; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAf6EGQeqIJGv2EMJ3digEJ7PV9lZXWnKBDi4CC+hkM=;
 b=WvtoN4dYFjV4gAOjblboHUcQsMt5qLfDwvkhHZDol77EMr0OZYO2FSUoZQ16FAEbwe
 uLfgMlcmec9A/L6a4klp2urBZGSDAeNWFre9e35ZBs2XTNzUWsDIZw89kt3bau+joMLx
 LcbgN0m1BG5kSNm6NqRWH7cjTzUWsPUAoLA5LobAS0I7pvZUmsfK2eXec9lfThQLuUzt
 /boRlqoGUJPIeIqIf35lLtHfa2vyUCBh1GBpUa7RShPS8kx0BwWEyhwUvKoIsP+LXP/P
 L0U3OM/mDOMbxwB9KraFhb4EroP4wJUjxftUD6tVsNKCIWHZ1HEmxKVuXEFAlnPnZP5t
 6GHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762766130; x=1763370930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RAf6EGQeqIJGv2EMJ3digEJ7PV9lZXWnKBDi4CC+hkM=;
 b=cgZ9T9lcIdPYTDVOrMiNeDqm/kwk5CqYFIv6jKdccjwf0/5bt20WABlRyM8oQaGwq3
 PjRMlWBYii+NJAoEizR0+N5/9/0CdL61PWWEOtJnakiyLp2WaBGC+T6NbsVQItdQZzOK
 nsGKoFdB8SuHirpLw/YhB3mc+AEV/WrS9oCblcBHQmrB8jYGTunVobrA9IU8UGv7NXdp
 u4U/qmXNzPEjagSstGI7BVE0GIQwjQeSVpa6G1b0NLh5l51YxzQcCN6/Sk52yYXWBrP2
 NDXyV/XpOoyO2+yiWS4JBB5UxSPXfRQklIT1OVtRIZAe7A8MfN07BerES1mZK1oNlULO
 V+6w==
X-Gm-Message-State: AOJu0YwwL1IxgPZbFuwhen3OIw0+QxZl+wS2pOpQoPua6RaU/ENe+qTX
 H+bMgyiOFM+xckdAGyDeYEwronvDbyUj8psuOucOxivcwTKnTC19hU8w
X-Gm-Gg: ASbGnctNk/7tNvfaUWJRO0FfyIZbk0cUZiLXs1GLhsI3ew96Dw/U0PW/R3GnCdEgi8L
 AbFNMZAn+LWnS1f5Y6itlg+SY2ennseOELCKvuemEPR2OySbT65CIumF/dpYGkiYKuZgzNVYiys
 KSIv4dAddPMtGBGhxPu3O9xm+aYOPxBrmsZzhaARnFi0bW+XQP4moFbsTasFWgdrfO1z7ZsY8MY
 mLM17/7soJKiYaWX2tRlY3AwDm8BFHQKth0iD172ejQ/Yq//DM1RR5iaQeefwrGbyYdjpKTrV6I
 mvffHrPGXeUL8Gq4o4XT9cBNjVtBWj6V7z6ZIPG9p6Dh7NcZklM5NR84jRxcz+p6swvnakCxsEP
 pR8nT9wr2W+Ev8FViIgl/6pDPpXH50iUhJyrDs4oubTl78TykQTFVrJXRwM8SSTDmiJUcw36F2M
 mS66re5rKh8g==
X-Google-Smtp-Source: AGHT+IHKVA2KBHA8B796GKRYtFtqhfXw7u6AasCbdjSjaT+/hAWyiSuW0TYURDuTx8uldyGjv94z6w==
X-Received: by 2002:a05:6512:308c:b0:594:34b9:a7f4 with SMTP id
 2adb3069b0e04-5945f1b6d56mr1751014e87.29.1762766129518; 
 Mon, 10 Nov 2025 01:15:29 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 01:15:29 -0800 (PST)
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
Subject: [PATCH v3 5/7 RESEND] gpu/drm: panel: simple-panel: add Samsung
 LTL106AL01 LVDS panel support
Date: Mon, 10 Nov 2025 11:14:35 +0200
Message-ID: <20251110091440.5251-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
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

