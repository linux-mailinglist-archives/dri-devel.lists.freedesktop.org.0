Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1134E2BD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 10:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A596E86A;
	Tue, 30 Mar 2021 08:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Tue, 30 Mar 2021 07:23:36 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBB96E867
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 07:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1617088109; x=1619680109;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SmcnULtbRocuygQNSkUfkwTI14SkLY/pcncpocgGeNk=;
 b=RcVPWWYuwn66YljmUtQWfnk4hPKfNK2BOvIpWlSQPGKvH4Sdj2g+XAcBtI6wjHN4
 Np0fzNUKMGmHGybIK5PUF1pEqFRbSzG3dukCwsJx7KBSp2Ykz4aSjzO6JPeBBWJN
 ViulTVmopYOptpQ8h2JMJlYY8evh95+WHuQH5ZeiFBM=;
X-AuditID: c39127d2-868b870000001c91-ff-6062ce6d56a2
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id E2.73.07313.D6EC2606;
 Tue, 30 Mar 2021 09:08:29 +0200 (CEST)
Received: from lws-ybas.phytec.de ([172.16.21.122])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021033009082926-261598 ;
 Tue, 30 Mar 2021 09:08:29 +0200 
From: Yunus Bas <y.bas@phytec.de>
To: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Subject: [PATCH 1/2] drm/panel: simple: Add support for EDT ETMV570G2DHU panel
Date: Tue, 30 Mar 2021 09:09:06 +0200
Message-Id: <20210330070907.11587-1-y.bas@phytec.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 30.03.2021 09:08:29,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.03.2021 09:08:29
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWyRoCBSzf3XFKCwfb5yha9504yWfzfNpHZ
 Yv6Rc6wWV76+Z7No3XuE3WLFz62MFj93zWNxYPfY+20Bi8fOWXfZPTat6mTz2P7tAavH/e7j
 TB5Lpl1l8/i8SS6APYrLJiU1J7MstUjfLoEr4/ye7UwFT8Uqui+0MDUwPhHqYuTkkBAwkfjz
 ZB0TiC0ksI1RYs899S5GLiD7PKPEoQNPwRJsAooS52+/ZQWxRQT8JTbcXssOYjMLhErcmbAd
 rEZYwE/i8vlPLCA2i4CqxMaNB8BsXqAFB25+ZoZYJi9xcu1hJoi4oMTJmU9YQJZJCFxhlFj9
 /SdUkZDE6cVnmSEWaEssW/iaeQIj3ywkPbOQpBYwMq1iFMrNTM5OLcrM1ivIqCxJTdZLSd3E
 CAzWwxPVL+1g7JvjcYiRiYPxEKMEB7OSCK/wgcQEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwb
 eEvChATSE0tSs1NTC1KLYLJMHJxSDYwKsx/4qh0+LbrSuuSZQ1bJmg3J+u4Kx6eeqfM95N37
 J2R/ROanT3OzzDJt7drZ5sgzFc10Yw6Iveictek5e9LUkJTc8B7LgJTXIQfYri0LunOX88Lj
 41+mHWOX/3Zu4zWZVr+TAtr/XfW2N+39esvyamJlpWOL3AfJTW0nZrF/8oo5H+YxU1eJpTgj
 0VCLuag4EQCekH8sRAIAAA==
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

This patch adds support for the EDT ETMV570G2DHU 5.7" (640x480) lcd panel
to DRM simple panel driver.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Signed-off-by: Yunus Bas <y.bas@phytec.de>
---
 .../bindings/display/panel/panel-simple.yaml  |  3 ++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 62b0d54d87b7..57be1fa39728 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -114,6 +114,9 @@ properties:
       - edt,etm043080dh6gp
         # Emerging Display Technology Corp. 480x272 TFT Display
       - edt,etm0430g0dh6
+        # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel with
+        # capacitive touch
+      - edt,etmv570g2dhu
         # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
         # Same as ETM0700G0DH6 but with inverted pixel clock.
       - edt,etm070080bdh6
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..283c17a75376 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1926,6 +1926,32 @@ static const struct panel_desc edt_et057090dhu = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct drm_display_mode edt_etmv570g2dhu_mode = {
+	.clock = 25175,
+	.hdisplay = 640,
+	.hsync_start = 640,
+	.hsync_end = 640 + 16,
+	.htotal = 640 + 16 + 30 + 114,
+	.vdisplay = 480,
+	.vsync_start = 480 + 10,
+	.vsync_end = 480 + 10 + 3,
+	.vtotal = 480 + 10 + 3 + 35,
+	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
+};
+
+static const struct panel_desc edt_etmv570g2dhu = {
+	.modes = &edt_etmv570g2dhu_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 115,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode edt_etm0700g0dh6_mode = {
 	.clock = 33260,
 	.hdisplay = 800,
@@ -4226,6 +4252,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,et057090dhu",
 		.data = &edt_et057090dhu,
+	}, {
+		.compatible = "edt,etmv570g2dhu",
+		.data = &edt_etmv570g2dhu,
 	}, {
 		.compatible = "edt,et070080dh6",
 		.data = &edt_etm0700g0dh6,
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
