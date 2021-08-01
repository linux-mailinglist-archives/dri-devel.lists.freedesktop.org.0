Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517AD3DC929
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 02:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7296B6E7D1;
	Sun,  1 Aug 2021 00:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8DD6E7D1
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 00:48:53 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1C9EF580AEE;
 Sat, 31 Jul 2021 20:48:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 31 Jul 2021 20:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=4kp+RTNcULIotxv7Y8MABXti2K
 kmyw3n4dKFvPx9pAs=; b=E3i4nl3tTffiyZB1hElBtzmksg/5O2qVbO1W8kM1zT
 Sxcti9eOe5NUY3mLFXAL3r6G6Pd//lhSEZdlVRbWM4fKfubsT/mYhSjDIgsVIroI
 rsmitmq4mkgEA+ho4qIixf8fzaHszJLh/pqy4Qtu2wTqX/haMHunHM2lQAus9D4Y
 55snZQiphU45sr6kOj2rZJJK8UTf5UsHYTcYp3OyJ0qKqB5/JCEsx4d38VPozu3U
 JRnOGaLVf3SxL5Rs9sK1UC0wV5GkkeY/8sb4dzmhVUgz8UEenbKWfOuP7YKLYoI3
 QWwPmAOa1dxN3ysKoBKlJVZzUp+WgoxpeJ9AN993P2tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4kp+RTNcULIotxv7Y
 8MABXti2Kkmyw3n4dKFvPx9pAs=; b=sjbFOuvv2t9mrAL13a6cOfgtaMAIddcvk
 jRwNcfOds0YAftl2rDgroJeoYaUd219UWNMgq2WlZIGg3NbNjEtd20zSIOjtfwxT
 lx4ol+tINiyC+Ld/yluZsj4P057NRbToLSGk0a3NQJmdq/JP0GEfD7Ve6ZI9qoKH
 i2CUJa7DoJUJYuxXAqx9ll4D3Rk3DQlhEl4mRrjShbvZyaBN7BDFeQ0M4rc4CwRp
 eXqiudHLjmmliXh/DHR1/YPbPMT461QzW1bVA+/BHT6YqTpWTxb01RJVUmP1/BzX
 VfQCT+CKFon26QOcFEGeLQdqA7l0V04Iv8wxYFVQKoaipJ86PlSlA==
X-ME-Sender: <xms:ce8FYf405-tsnOSRLwCS7r0kbll67b7iLBiJyUuyWsUNY7tGIcNjOA>
 <xme:ce8FYU7gK5EM7zsbN2UV1PsPO3HurTFgI-BjiHy3TyMb6TwplKUDbqnBCV_F7kFYM
 J-tBynTEIX2haeVaNY>
X-ME-Received: <xmr:ce8FYWftfJ6PvI6Yu2t-6D9DLE0ju4vDAr6cPT2s67blp0AOEZwb4B710gE_YtuxSXaU9GJlYdy4C9u3GuQbU8g_2m0zBidNLw31RZ36>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheekgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehlihhsthgrihhr
 ucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqeenuc
 ggtffrrghtthgvrhhnpefghfegkeejtddvfeekjeelgeffhefhvddvvddtvefgfffftdek
 geeljeefvdeiudenucffohhmrghinhepvghinhhkrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishht
 rghirhdvfedrmhgv
X-ME-Proxy: <xmx:ce8FYQILUyoedrBPni6yHWRBseKp-xsCbmDgsZDek2eGbNfA1OdHZg>
 <xmx:ce8FYTJAW78v9l9X_xLooaILZY4gWhxXYXdrW9ljejkaI9ZZB5OpyQ>
 <xmx:ce8FYZzdhYAjAkVhrKr6tnNJDxBX8MK8m3fIsM6kNLbW2hCGTvC1RA>
 <xmx:c-8FYU6d5WlBKbnAqqyiX1To-EYR6Ouf81Xa1cVLCDiYQ1OOrS2AjA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Jul 2021 20:48:43 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 krzk@kernel.org, shawnguo@kernel.org, daniel@0x0f.com,
 linux@rempel-privat.de, kuninori.morimoto.gx@renesas.com,
 max.Merchel@tq-group.com, geert+renesas@glider.be, airlied@linux.ie,
 daniel@ffwll.ch
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alistair23@gmail.com,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>
Subject: [PATCH v6] drm/panel: Add support for E Ink VB3300-KCA
Date: Sun,  1 Aug 2021 10:47:00 +1000
Message-Id: <20210801004701.831-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
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

Add support for the 10.3" E Ink panel described at:
https://www.eink.com/product.html?type=productdetail&id=7

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
v6:
 - Rebase on linux-next

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 30 +++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3624363938dd..1f6a04a91a37 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -134,6 +134,8 @@ properties:
         # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel with
         # capacitive touch
       - edt,etmv570g2dhu
+        # E Ink VB3300-KCA
+      - eink,vb3300-kca
         # Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
       - evervision,vgg804821
         # Foxlink Group 5" WVGA TFT LCD panel
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 62cb1d9341f5..e2291aee435d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -339,6 +339,8 @@ patternProperties:
     description: eGalax_eMPIA Technology Inc
   "^einfochips,.*":
     description: Einfochips
+  "^eink,.*":
+    description: E Ink Corporation
   "^elan,.*":
     description: Elan Microelectronic Corp.
   "^element14,.*":
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 461794ae4188..3af7068838d3 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2146,6 +2146,33 @@ static const struct panel_desc edt_etmv570g2dhu = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct display_timing eink_vb3300_kca_timing = {
+	.pixelclock = { 40000000, 40000000, 40000000 },
+	.hactive = { 334, 334, 334 },
+	.hfront_porch = { 1, 1, 1 },
+	.hback_porch = { 1, 1, 1 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 1405, 1405, 1405 },
+	.vfront_porch = { 1, 1, 1 },
+	.vback_porch = { 1, 1, 1 },
+	.vsync_len = { 1, 1, 1 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
+};
+
+static const struct panel_desc eink_vb3300_kca = {
+	.timings = &eink_vb3300_kca_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 157,
+		.height = 209,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing evervision_vgg804821_timing = {
 	.pixelclock = { 27600000, 33300000, 50000000 },
 	.hactive = { 800, 800, 800 },
@@ -4486,6 +4513,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,etmv570g2dhu",
 		.data = &edt_etmv570g2dhu,
+	}, {
+		.compatible = "eink,vb3300-kca",
+		.data = &eink_vb3300_kca,
 	}, {
 		.compatible = "evervision,vgg804821",
 		.data = &evervision_vgg804821,
-- 
2.31.1

