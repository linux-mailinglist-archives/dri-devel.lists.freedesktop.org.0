Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEFD158E37
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 13:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0816EA38;
	Tue, 11 Feb 2020 12:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16E96EA38
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 12:17:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BCHQxJ106019;
 Tue, 11 Feb 2020 06:17:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581423446;
 bh=pKaCaSWs3WqVtRRUPTusznn4AwPhMp48z0BGP4Cdd7A=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=sy3LGv2k9+Xb33gLXqkDceDxHyPQx6oWqTCKx2eF47vOYwsHQci3yv61O5Dhqh9al
 7zeCyc1PFerW+AHY6LcCgmiiIDjZQmwfndKxfZS0NrABtRwz5z3miVDgHnYOt/1lhm
 nZd8S9CdU5EkefFZChN/l60EBePBPxd2Ekkd8XRk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BCHQ57048883;
 Tue, 11 Feb 2020 06:17:26 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 06:17:26 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 06:17:26 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BCHJ83092021;
 Tue, 11 Feb 2020 06:17:24 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <sam@ravnborg.org>
Subject: [PATCH v3 2/2] drm/panel: simple: Add Rocktech RK101II01D-CT panel
Date: Tue, 11 Feb 2020 14:17:18 +0200
Message-ID: <b543b77d8af7cbbef852d3df4595f11ac1aa0046.1581423249.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581423249.git.jsarha@ti.com>
References: <cover.1581423249.git.jsarha@ti.com>
MIME-Version: 1.0
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
Cc: praneeth@ti.com, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Rocktech RK101II01D-CT, 10.1" 1280x800 TFT with LVDS
interface, LED backlight and integrated Goodix GT928 capacitive touch
panel.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d901ccb5cf9b..82363d05bad4 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2662,6 +2662,35 @@ static const struct panel_desc rocktech_rk070er9427 = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct drm_display_mode rocktech_rk101ii01d_ct_mode = {
+	.clock = 71100,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 48,
+	.hsync_end = 1280 + 48 + 32,
+	.htotal = 1280 + 48 + 32 + 80,
+	.vdisplay = 800,
+	.vsync_start = 800 + 2,
+	.vsync_end = 800 + 2 + 5,
+	.vtotal = 800 + 2 + 5 + 16,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc rocktech_rk101ii01d_ct = {
+	.modes = &rocktech_rk101ii01d_ct_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 217,
+		.height = 136,
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
 static const struct drm_display_mode samsung_lsn122dl01_c01_mode = {
 	.clock = 271560,
 	.hdisplay = 2560,
@@ -3569,6 +3598,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "rocktech,rk070er9427",
 		.data = &rocktech_rk070er9427,
+	}, {
+		.compatible = "rocktech,rk101ii01d-ct",
+		.data = &rocktech_rk101ii01d_ct,
 	}, {
 		.compatible = "samsung,lsn122dl01-c01",
 		.data = &samsung_lsn122dl01_c01,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
