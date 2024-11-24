Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0ED9D708B
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDE810E4DC;
	Sun, 24 Nov 2024 13:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ESPo5Isd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B549310E4DC
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 13:36:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7E5D05C53E4;
 Sun, 24 Nov 2024 13:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67476C4CECC;
 Sun, 24 Nov 2024 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455362;
 bh=CoaBSk0RDtcGQxzKDaGecO8qf+wAmLmoES3HG7mGQa0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ESPo5IsdkdSQEgR2t1mmc7kJFT95APJqUU8a7VfwK5nPSZkKhqN1bB53uxvVIrxyY
 4sT3DZlRygvX/GpOjGHzkZqqOfL7AC6ZevvLp5r7W+adeBG2u6L44UXkp/YUkAxunK
 STbtVz2Rx5NsamzaQy6AX42dVcx/KLFXxjDoL/HJcKS7WsuSxoE2Bos811hCfYREJC
 BverRXpNcNdFO2Zuka7KW0GdmkNq8VQhZurY8isQ1G6Lgr5l82uRu+JuNQUbYk23B0
 7wMx6oijy94n9E/h4JjxZ/AjvGY2rFmhsdRSUr2VCtruv0LbzZvQStx4hAbjRDIF9H
 4K2pU/F3+d0VQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sasha Levin <sashal@kernel.org>, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 055/107] drm/panel: simple: Add Microchip
 AC69T88A LVDS Display panel
Date: Sun, 24 Nov 2024 08:29:15 -0500
Message-ID: <20241124133301.3341829-55-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Manikandan Muralidharan <manikandan.m@microchip.com>

[ Upstream commit 40da1463cd6879f542238b36c1148f517927c595 ]

Add support for Microchip AC69T88A 5 inch TFT LCD 800x480
Display module with LVDS interface.The panel uses the Sitronix
ST7262 800x480 Display driver

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20240919091548.430285-2-manikandan.m@microchip.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 86735430462fa..06381c6282097 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4565,6 +4565,31 @@ static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct drm_display_mode mchp_ac69t88a_mode = {
+	.clock = 25000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 88,
+	.hsync_end = 800 + 88 + 5,
+	.htotal = 800 + 88 + 5 + 40,
+	.vdisplay = 480,
+	.vsync_start = 480 + 23,
+	.vsync_end = 480 + 23 + 5,
+	.vtotal = 480 + 23 + 5 + 1,
+};
+
+static const struct panel_desc mchp_ac69t88a = {
+	.modes = &mchp_ac69t88a_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 108,
+		.height = 65,
+	},
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode arm_rtsm_mode[] = {
 	{
 		.clock = 65000,
@@ -5048,6 +5073,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "yes-optoelectronics,ytc700tlag-05-201c",
 		.data = &yes_optoelectronics_ytc700tlag_05_201c,
+	}, {
+		.compatible = "microchip,ac69t88a",
+		.data = &mchp_ac69t88a,
 	}, {
 		/* Must be the last entry */
 		.compatible = "panel-dpi",
-- 
2.43.0

