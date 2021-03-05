Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDC932F6D4
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 00:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E0F6EC9C;
	Fri,  5 Mar 2021 23:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd15177.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 500F46EC9D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 23:51:42 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IK7Ql1dnx4WhhIK7dloTKW; Sat, 06 Mar 2021 00:44:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1614987882; bh=G4k5vo1LJKULxTjDlFPcVz/IRIGSMhDWXp3Oy4gwmqo=;
 h=From:To:Subject:Date:MIME-Version;
 b=h7foF/1pDbZp3ZKQhUbeEQyMl8XYu0P7VbFgw/rzcSU6cVMjLWuEGJQ9YYY8ojVhv
 waYP7gkTHuhue7N30DRNPxbofc7Y1oTYEpxgmFfVMKZG45FZgGZ74zfGfAUKmTzfmj
 i+l2y7i74Bi6bJ61hPR1TWWNhvIM/B878HTGRa4HdycRttea32s6QPSdpYDA/zvdzn
 Z3gv818XfW/BfLYs9gCEIHIt1y+3kh6TKSjSrVHFGDt5yicbC6cGcJXXcwJqR37TH/
 DKzHfu4sUi4J6d+E3Io8BGOug249M9JybnrfvOpK8REkIJ1xsfAAG8mTbGrIy7vvAO
 tYWQn1pZzIUNQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 7/9] drm/panel: simple: add Jenson JT60248-01
Date: Sat,  6 Mar 2021 00:44:24 +0100
Message-Id: <20210305234427.572114-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
References: <20210305225444.GA792026@robh.at.kernel.org>
 <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJOeLgA3G0+TqE2hyF43qMUr6vjetan/RyQDBs71mOxXkXgsNy3mP2zepJO3hA6tK78yYBr6+7ZOlXjYFGKnEIIR1ZxOyqWL6YiUAx2E8RIcYqEkAXo/
 3ifjORztsRPLxQESgo9Sem5ZortEkOlNEjKsaoJ/cVUPRot5fMPAG8FVf/TCOYJXOtxUxbYdQjt/iZhyqC/zkNMXLYriMEVs0Nsa26XSyyzIidDr6sh1Sbjd
 McFsifKbgPCDQd0fXaVHVtalltoebl3hnne9Q7IfVMjuUrzaOgUWDNHwLYxIx+zWuUoHuFBYOsLuj+YGevhZ5EdtPEOe6+8ITFKCPry2GnNWnhuzL/ljtM8f
 EJb8rEUexfaY2kXZaP7rh7nFB02PJw14mO1P/t7P57xiFSVax1MGmcM60nmbdE62PWI0Z/jop7qXPifu6Ek9H8sGNDuH1aI2rFDHzx9h90889B4Pv+Cgm8jQ
 1injLPSP2Fdzx5OShbRgScrETUcLCudCJwK1GulUQMqpr2Nir7xn1SWQYKZRMx/fgVkyKdezp5eYNV/T9gYo8SQSOoSzy+KxZ3ay4ITTY4nOhBp6Erje5rKv
 GLmr4klENo9ZLNFDxvh5h+F/MonZBcYaCJ8whEmp7zO1hLoCNKD2L/h0TIaM5PJhO43ls/x80R2CJDw+mCb+v2h3WfPP8K7jqY3HH+eIqa73DOjY7M/t0XOm
 9bkE9yS0kLMs6/mdyPN7NEl242p4coLUTRQRrGNA3mKI05rPDax37g==
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
Cc: devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 allen <allen.chen@ite.com.tw>, Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Giulio Benetti <giulio.benetti@micronovasrl.com>

This patch adds support for Jenson JT60248-01 480x272 4.3" panel to DRM
simple panel driver.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f63fa75ae4ef..f96f820a890b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2556,6 +2556,30 @@ static const struct panel_desc jenson_jt60245_01 = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
+static const struct drm_display_mode jenson_jt60248_01_mode = {
+	.clock = 9000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 8,
+	.hsync_end = 480 + 8 + 4,
+	.htotal = 480 + 8 + 4 + 43,
+	.vdisplay = 272,
+	.vsync_start = 272 + 8,
+	.vsync_end = 272 + 8 + 4,
+	.vtotal = 272 + 8 + 4 + 12,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc jenson_jt60248_01 = {
+	.modes = &jenson_jt60248_01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 95,
+		.height = 54,
+	},
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+};
+
 static const struct drm_display_mode kingdisplay_kd116n21_30nv_a010_mode = {
 	.clock = 81000,
 	.hdisplay = 1366,
@@ -4328,6 +4352,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "jenson,jt60245-01",
 		.data = &jenson_jt60245_01,
+	}, {
+		.compatible = "jenson,jt60248-01",
+		.data = &jenson_jt60248_01,
 	}, {
 		.compatible = "kingdisplay,kd116n21-30nv-a010",
 		.data = &kingdisplay_kd116n21_30nv_a010,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
