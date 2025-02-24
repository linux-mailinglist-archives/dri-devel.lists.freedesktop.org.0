Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B13A421DD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A20610E33A;
	Mon, 24 Feb 2025 13:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cwGk/4lF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5646510E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 13:51:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA8EE5C6E05;
 Mon, 24 Feb 2025 13:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A68A9C4CEF9;
 Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740405064;
 bh=9rsK2DyiLn0rGQVW5aqBw0QCdbVsaOqhBOHIuUKMsyw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=cwGk/4lFw/RV2zrHR2vk91lDkKP5hvOnqTQdpmGo2xFPdw3nxcVg9FD0E3a5RHR5Y
 JamEKWh9/tTYr8GO9eETAoDXd5uJQk1xuRB1/nHviJMWUq6ogD5QbqAIIwcR/oSu1h
 Gy+a4iFYyE5iIPNDLc8iy1bDbd8Wil95t9NKUB7wJxita3AiR9pOUd9rq2bTBlCDVH
 kyHn+4o3EW3J5L8281qM4nE4m/c66qnhus0e0fAopXmp2RPjpbK4/bLH1j1AiHdgaF
 8Z4XqC6BPMleA+iSBu7Bf8LQ8nX5fqJw0qCF16OWfrlk3XCAcq4c976SPGAM0LEYHR
 2zamrqgVtKikQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9B318C021BB;
 Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 24 Feb 2025 14:50:58 +0100
Subject: [PATCH 08/14] drm/panel: simple: Add BOE AV123Z7M-N17 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-initial_display-v1-8-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=1908;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=vOVkRssMq+0b54M++/GbRnRh45tiCsN1h3cNEf5At7g=;
 b=mIAf7wLfiBaXHgCEU4/8qvWOFXgtpexk2cgZKBPGdS9xQHEzRlSLaQGkNSxpz1dAA+cZucueh
 uDLvxXs5uZfBwENboFcPxubRl6D9NJ9o9TOrax33cAGbmns59TckZj6
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maudspierings@gocontroll.com>

Add support for the BOE AV123Z7M-N17 12.3" LVDS panel.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a52977ab73dc2edab0d1954c702fd797d6a5b969..232b03c1a259eb15e423b9d452d28e2ff95c70f8 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1403,6 +1403,35 @@ static const struct panel_desc boe_av101hdt_a10 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing boe_av123z7m_n17_timing = {
+	.pixelclock = { 86600000, 88000000, 90800000, },
+	.hactive = { 1920, 1920, 1920, },
+	.hfront_porch = { 10, 10, 10, },
+	.hback_porch = { 10, 10, 10, },
+	.hsync_len = { 9, 12, 25, },
+	.vactive = { 720, 720, 720, },
+	.vfront_porch = { 7, 10, 13, },
+	.vback_porch = { 7, 10, 13, },
+	.vsync_len = { 7, 11, 14, },
+	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
+};
+
+static const struct panel_desc boe_av123z7m_n17 = {
+	.timings = &boe_av123z7m_n17_timing,
+	.bpc = 8,
+	.num_timings = 1,
+	.size = {
+		.width = 292,
+		.height = 110,
+	},
+	.delay = {
+		.prepare = 50,
+		.disable = 50,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode boe_bp101wx1_100_mode = {
 	.clock = 78945,
 	.hdisplay = 1280,
@@ -4845,6 +4874,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,av101hdt-a10",
 		.data = &boe_av101hdt_a10,
+	}, {
+		.compatible = "boe,av123z7m-n17",
+		.data = &boe_av123z7m_n17,
 	}, {
 		.compatible = "boe,bp082wx1-100",
 		.data = &boe_bp082wx1_100,

-- 
2.48.1


