Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699B99D718B
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2AD10E548;
	Sun, 24 Nov 2024 13:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FS1HSVjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3165A10E548
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 13:50:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 52248A40D2E;
 Sun, 24 Nov 2024 13:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B708EC4CECC;
 Sun, 24 Nov 2024 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732456238;
 bh=uln1lei77Pj53kB085hGFKEWhBGmqGJ63WaSDGh13gI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FS1HSVjBntE+8Ji+P+a+N43PQbtcyxYBrgGO6OysXe5hQ/9B0LhC2uM5uKVldM5V9
 WrSBaUTxx6HErlU1vXXoT40H22jh+vrZKwaw1vxPtZCLlmTYeTApf0nnAi5HRtea27
 uLbf/lVgTDMDwUmul+csr0I42Nx6wkKzj/WeB/7cG6s4yaMQHpKEE+LbJ3fxQenQUD
 MYWWELSfhNSuMgfJ7xMndq0HU5dVDPkQCe10zAjRNofHWitnTjBKNZCN0pfT260+W0
 RERcfsm65PXgjGyf275cgquVWC8kWdcMeqvBY+tYEzcCx8ijRWyklFUNNzLecMRyhe
 U/DkasdB/SKiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sasha Levin <sashal@kernel.org>, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 24/48] drm/panel: simple: Add Microchip AC69T88A
 LVDS Display panel
Date: Sun, 24 Nov 2024 08:48:47 -0500
Message-ID: <20241124134950.3348099-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134950.3348099-1-sashal@kernel.org>
References: <20241124134950.3348099-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
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
index b560d62b6e219..a35e94e2ffd06 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3908,6 +3908,31 @@ static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
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
@@ -4325,6 +4350,9 @@ static const struct of_device_id platform_of_match[] = {
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

