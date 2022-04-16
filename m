Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9B503288
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 05:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6D610E04D;
	Sat, 16 Apr 2022 03:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C020110E04D
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 03:19:30 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D1DDF83A95;
 Sat, 16 Apr 2022 05:19:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650079169;
 bh=h5ynvPK+HmQZ8EC5dUqC+r8XiVofOuwwqe3aZQAaYxM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u79aM35q4/Ioe6bJGVYdoF/7bcG6fewzyPicNSsfWeEeWRWczPrULbCYglVMmb6mR
 IgXb4pmKjZ1xFx3YAtDnFEpEsxc8kqvocYlYonBfftu7KNsmYfHB6wib5XvJgcSEiN
 7jutBP5yln4X0obnVZwC7vw/NKmNgAVtAsR8dNdi5KQN4vWjyn6G8CY+MX00KYlmhA
 mwcH9xLMjUhUzDev3zELR1Wr9bXj1V+zgQSdXbMZahHr49NLkHCVrRmSO1QbeSGZqU
 ySn8zTUZeO88hSS6J8EA0HxQZtEab8Vjvl/iejdGPNU5Jk2tkIRkkz52EQtUzvlGqg
 bdZ0pkdCrHUaA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panel: simple: Add DataImage FG040346DSSWBG04 panel
 support
Date: Sat, 16 Apr 2022 05:19:19 +0200
Message-Id: <20220416031919.670192-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220416031919.670192-1-marex@denx.de>
References: <20220416031919.670192-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DataImage FG040346DSSWBG04 4.3" 480x272 TFT LCD 24bit DPI panel
support.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a5341..3c35f8a32d327 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1402,6 +1402,31 @@ static const struct panel_desc chunghwa_claa101wb01 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing dataimage_fg040346dsswbg04_timing = {
+	.pixelclock = { 5000000, 9000000, 12000000 },
+	.hactive = { 480, 480, 480 },
+	.hfront_porch = { 12, 12, 12 },
+	.hback_porch = { 12, 12, 12 },
+	.hsync_len = { 21, 21, 21 },
+	.vactive = { 272, 272, 272 },
+	.vfront_porch = { 4, 4, 4 },
+	.vback_porch = { 4, 4, 4 },
+	.vsync_len = { 8, 8, 8 },
+};
+
+static const struct panel_desc dataimage_fg040346dsswbg04 = {
+	.timings = &dataimage_fg040346dsswbg04_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 95,
+		.height = 54,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode dataimage_scf0700c48ggu18_mode = {
 	.clock = 33260,
 	.hdisplay = 800,
@@ -3768,6 +3793,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "chunghwa,claa101wb01",
 		.data = &chunghwa_claa101wb01
+	}, {
+		.compatible = "dataimage,fg040346dsswbg04",
+		.data = &dataimage_fg040346dsswbg04,
 	}, {
 		.compatible = "dataimage,scf0700c48ggu18",
 		.data = &dataimage_scf0700c48ggu18,
-- 
2.35.1

