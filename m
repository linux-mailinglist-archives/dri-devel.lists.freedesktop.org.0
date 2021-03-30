Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C689E34E2BF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 10:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0606E86E;
	Tue, 30 Mar 2021 08:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48F76E869
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 07:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1617088109; x=1619680109;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jt+/S3UrL+Gkr+sv4rTAeuYQp6C5y4tCuV4BT5eP5Gk=;
 b=W5LJtocW+YJjUel0OzIYCrYnmFdjUO/95Uzoc4OvoAsta2aIYC3SH4XNyyXN3PQh
 96fJSz6WnjX8GzPDnFMYZ+w8wff1nmrD6eJ8z6lQ47wub5qA2WhFY2ZWzRowtSP4
 MCQ2T+3ddcSjuYAOvKkU5mucfJjV+p1Mzbeqp874Ylo=;
X-AuditID: c39127d2-85cb770000001c91-00-6062ce6d3b8a
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 63.73.07313.D6EC2606;
 Tue, 30 Mar 2021 09:08:29 +0200 (CEST)
Received: from lws-ybas.phytec.de ([172.16.21.122])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021033009082952-261599 ;
 Tue, 30 Mar 2021 09:08:29 +0200 
From: Yunus Bas <y.bas@phytec.de>
To: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Subject: [PATCH 2/2] drm/panel: simple: Add support for EDT ETM0350G0DH6 panel
Date: Tue, 30 Mar 2021 09:09:07 +0200
Message-Id: <20210330070907.11587-2-y.bas@phytec.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210330070907.11587-1-y.bas@phytec.de>
References: <20210330070907.11587-1-y.bas@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 30.03.2021 09:08:29,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.03.2021 09:08:29
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWyRoCBSzf3XFKCwcGVeha9504yWfzfNpHZ
 Yv6Rc6wWV76+Z7No3XuE3WLFz62MFj93zWNxYPfY+20Bi8fOWXfZPTat6mTz2P7tAavH/e7j
 TB5Lpl1l8/i8SS6APYrLJiU1J7MstUjfLoEr482E+0wF98Uq5r28xtLA+ESoi5GTQ0LAROLE
 vW9MXYxcHEIC2xgl7r18wwzhnGeU2Pj6DytIFZuAosT522/BbBEBf4kNt9eyg9jMAqESdyZs
 ZwKxhQX8JNo2nQaLswioSlzfcJ0ZxOYF2nDl7WYmiG3yEifXHgazOQVMJZ4veMUCYgsB1ayd
 2cEKUS8ocXLmExaQIyQErjBKrP7+kxmiWUji9OKzzBCLtSWWLXzNPIFRYBaSnllIUgsYmVYx
 CuVmJmenFmVm6xVkVJakJuulpG5iBIb34Ynql3Yw9s3xOMTIxMF4iFGCg1lJhFf4QGKCEG9K
 YmVValF+fFFpTmrxIUZpDhYlcd4NvCVhQgLpiSWp2ampBalFMFkmDk6pBkbjs7UWf98Uftle
 Pvlf5pln2np+PjtN71THepgl/n8Z/IZ9kq31C7NFaw7ukPG3XPzuXh0jw7l9pvKH0n9LKORt
 ntFSmdFow82/XHXuzUzHW9JvuBhNQlIntXbHfshXs3t6fEZVRKXx7tRIH7m+fP3319Jf2W4v
 2f/WJv7mveLyaaVBBZ4uH5RYijMSDbWYi4oTAXxI7MZdAgAA
X-Mailman-Approved-At: Tue, 30 Mar 2021 08:07:38 +0000
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
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stefan Riedmueller <s.riedmueller@phytec.de>

This patch adds support for the EDT ETM0350G0DH6 3.5" (320x240) lcd
panel to DRM simple panel driver.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Signed-off-by: Yunus Bas <y.bas@phytec.de>
---
 .../bindings/display/panel/panel-simple.yaml  |  3 ++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 57be1fa39728..9a6b42f911d1 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -107,6 +107,9 @@ properties:
       - dlc,dlc1010gig
         # Emerging Display Technology Corp. 3.5" QVGA TFT LCD panel
       - edt,et035012dm6
+        # Emerging Display Technology Corp. 3.5" WVGA TFT LCD panel with
+        # capacitive multitouch
+      - edt,etm0350g0dh6
         # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel
       - edt,et057090dhu
       - edt,et070080dh6
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 283c17a75376..70c25f6e642b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1847,6 +1847,32 @@ static const struct panel_desc edt_et035012dm6 = {
 	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
+static const struct drm_display_mode edt_etm0350g0dh6_mode = {
+	.clock = 6520,
+	.hdisplay = 320,
+	.hsync_start = 320 + 20,
+	.hsync_end = 320 + 20 + 68,
+	.htotal = 320 + 20 + 68,
+	.vdisplay = 240,
+	.vsync_start = 240 + 4,
+	.vsync_end = 240 + 4 + 18,
+	.vtotal = 240 + 4 + 18,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc edt_etm0350g0dh6 = {
+	.modes = &edt_etm0350g0dh6_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 70,
+		.height = 53,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode edt_etm043080dh6gp_mode = {
 	.clock = 10870,
 	.hdisplay = 480,
@@ -4243,6 +4269,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,et035012dm6",
 		.data = &edt_et035012dm6,
+	}, {
+		.compatible = "edt,etm0350g0dh6",
+		.data = &edt_etm0350g0dh6,
 	}, {
 		.compatible = "edt,etm043080dh6gp",
 		.data = &edt_etm043080dh6gp,
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
