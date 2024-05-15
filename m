Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB1A8C6441
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 11:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A84410E4FC;
	Wed, 15 May 2024 09:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="DkoCiYvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032A010E408
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 09:51:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44F9pja9021145;
 Wed, 15 May 2024 04:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715766705;
 bh=+Im48V8StjmmVMV/wSC1fpPAJfkvp4PeLDmO6kGm1C0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=DkoCiYvFrBJmSrDmcEjzUgKjr9K3T6j1ni75K7rNFbnWXtNh/JDnEYfBUmakUO6u2
 foThoTMopqZbs8oHiiCYAAnJESxCyV9JsO3FG5CJkZlmI9TlCvFzi//NtB6Pze2Qtp
 5WeyzPlJh+kPb9vQ3hKA5Dq0FvJbhGkU5/pXcWxM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44F9pjVZ121595
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 May 2024 04:51:45 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 15
 May 2024 04:51:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 15 May 2024 04:51:45 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44F9piRD125507;
 Wed, 15 May 2024 04:51:45 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Devicetree List
 <devicetree@vger.kernel.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH v3 6/6] drm/panel: simple: Add Microtips Technology
 MF-103HIEB0GA0 panel
Date: Wed, 15 May 2024 15:21:33 +0530
Message-ID: <20240515095133.745492-7-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515095133.745492-1-a-bhatia1@ti.com>
References: <20240515095133.745492-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Add support for Microtips Technology USA MF-103HIEB0GA0 10.25"[0],
1920x720, 8-bit TFT LCD with LVDS interface. Its a Dual-LVDS Panel and
does not support touch.

[0]: Panel Datasheet
https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2660/13-103HIEB0GA0-S_V1.0_20211206.pdf

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3a0d8f0ff267..1b0a6b4e034c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3084,6 +3084,35 @@ static const struct panel_desc microtips_mf_101hiebcaf0_c = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct drm_display_mode microtips_mf_103hieb0ga0_mode = {
+	.clock = 93301,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 72,
+	.hsync_end = 1920 + 72 + 72,
+	.htotal = 1920 + 72 + 72 + 72,
+	.vdisplay = 720,
+	.vsync_start = 720 + 3,
+	.vsync_end = 720 + 3 + 3,
+	.vtotal = 720 + 3 + 3 + 2,
+};
+
+static const struct panel_desc microtips_mf_103hieb0ga0 = {
+	.modes = &microtips_mf_103hieb0ga0_mode,
+	.bpc = 8,
+	.num_modes = 1,
+	.size = {
+		.width = 244,
+		.height = 92,
+	},
+	.delay = {
+		.prepare = 50,
+		.disable = 50,
+	},
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
 	.clock = 30400,
 	.hdisplay = 800,
@@ -4726,6 +4755,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "microtips,mf-101hiebcaf0",
 		.data = &microtips_mf_101hiebcaf0_c,
+	}, {
+		.compatible = "microtips,mf-103hieb0ga0",
+		.data = &microtips_mf_103hieb0ga0,
 	}, {
 		.compatible = "mitsubishi,aa070mc01-ca1",
 		.data = &mitsubishi_aa070mc01,
-- 
2.34.1

