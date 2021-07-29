Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9943DA11C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 12:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E366E0C6;
	Thu, 29 Jul 2021 10:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B256E0C6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 10:34:20 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 094EE580CD9;
 Thu, 29 Jul 2021 06:34:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 29 Jul 2021 06:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=V4C55hsRueWa8C1kkzjddTo5uH
 zR8ZYH9nUiecGcVuk=; b=g+/XtHHoj3CfrBsfqDX/52EObavJ6dr8GOdOXNlJXB
 wUmP46oD+pYDLpPRhXUL8HvVo6ZWLOPZZdlt0rTkuwj6LKta5dMfYHdjdsIEEiw4
 Gy9NoN98v4UGCjDA4iKpderM3SF/vih4XagQKyI1gBXg5FISeTzQjdup0UqoG5Ln
 dJE96WL5fqfare0QQCBW3AmreJZRGYJ4hOLyxI5/ZOEVncWzaOxibp6RqglMEWiA
 P1XI+MlSCjnVnS18/6kSei9oirsRzS69LjjIFQvRy3zUd3BUrKEk8wQGRwbs5c9Z
 gY0ToJlOKJx5AKqXFz13fn25JIQtZx1EFwNn2d6/Ujnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=V4C55hsRueWa8C1kk
 zjddTo5uHzR8ZYH9nUiecGcVuk=; b=GrHseugRFsVX7h2G58XQ7y1K5rZAGKwrN
 Eiw3KAZm87qiiDSyQgT8XtpWPZmAupJ7euCdeiBbKHq1T8jCGaowENUU9+gXB7zd
 93Zao0mxxGJWWCKTeW0obIYRSPO+FpCeKN9lkWuBepIR01exzPHG+/N87zLJZS5p
 d+FaVNa3IfnXilEW0qXx165JAhqsASUhxdxBNi/cAepx3eDIIg5k9tDVjp2NC61Q
 f3RuPTTVLSKueyWIUENklDwE8b2/+ywAD6T9IGXlSkxYJAcUyfQPOYRJeoPlBgzW
 8T8JDvngxmM54/KumZkWxhNuuFsDj6jhHwDDQiQaPXkjCCIWezzNQ==
X-ME-Sender: <xms:J4QCYR8L6XPQ8MERFwA4-FnXTX5NkjqCuP4DsO-u_QXRPTU6IxYH5A>
 <xme:J4QCYVuywSTSMtVD8_ddIyoCipbLVhRdcz0MwcJ2A78CU54RJBvppZSSD4bwi-Zwt
 ebFYcmfzPF3LEX6LTQ>
X-ME-Received: <xmr:J4QCYfAK-_mYamets8ftnz4zct_LDxMGi9r1KiIxIM9h17ylmy_gxw2qR3SfDyY2GB2jNUahXkKfcp2nthU1BuxqWKmZEwGXei99DiGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrhedugddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehlihhsthgrihhr
 ucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqeenuc
 ggtffrrghtthgvrhhnpefghfegkeejtddvfeekjeelgeffhefhvddvvddtvefgfffftdek
 geeljeefvdeiudenucffohhmrghinhepvghinhhkrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishht
 rghirhdvfedrmhgv
X-ME-Proxy: <xmx:J4QCYVe02nXhSMk0zWzqSkERFmklr-Rj0DyB70Y6j6mSmZ5QEJcG6g>
 <xmx:J4QCYWO3nJr2iz34JRFe_38l047YF9KQE5dysCYn5MVXO8LDaxYg8w>
 <xmx:J4QCYXmjpwvPQap6kgZMNVjAN0zvilueH-uJ37r08cdML3tneSLrCQ>
 <xmx:KoQCYTvJB0tKhA5yeCNgIAdREBGd69MS684CWuztX_alZgWgPNt20w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jul 2021 06:34:07 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 krzk@kernel.org, shawnguo@kernel.org, daniel@0x0f.com,
 linux@rempel-privat.de, kuninori.morimoto.gx@renesas.com,
 max.Merchel@tq-group.com, geert+renesas@glider.be, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v4] drm/panel: Add support for E Ink VB3300-KCA
Date: Thu, 29 Jul 2021 20:33:58 +1000
Message-Id: <20210729103358.209-1-alistair@alistair23.me>
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
Cc: devicetree@vger.kernel.org, Alistair Francis <alistair@alistair23.me>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alistair23@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 10.3" E Ink panel described at:
https://www.eink.com/product.html?type=productdetail&id=7

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Acked-by: Rob Herring <robh@kernel.org>
---
v4:
 - Fixup alphebetical sorting

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index b3797ba2698b..799e20222551 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -128,6 +128,8 @@ properties:
         # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
       - edt,etm0700g0dh6
       - edt,etm0700g0edh6
+        # E Ink VB3300-KCA
+      - eink,vb3300-kca
         # Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
       - evervision,vgg804821
         # Foxlink Group 5" WVGA TFT LCD panel
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 71da86e7b3a2..31745c45dd92 100644
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
index 21939d4352cf..8d6317b85465 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2046,6 +2046,32 @@ static const struct panel_desc edt_etm0700g0bdh6 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
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
+};
+
 static const struct display_timing evervision_vgg804821_timing = {
 	.pixelclock = { 27600000, 33300000, 50000000 },
 	.hactive = { 800, 800, 800 },
@@ -4350,6 +4376,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,etm0700g0edh6",
 		.data = &edt_etm0700g0bdh6,
+	}, {
+		.compatible = "eink,vb3300-kca",
+		.data = &eink_vb3300_kca,
 	}, {
 		.compatible = "evervision,vgg804821",
 		.data = &evervision_vgg804821,
-- 
2.31.1

