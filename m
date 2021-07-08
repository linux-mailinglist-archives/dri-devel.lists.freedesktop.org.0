Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9B83BF96C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 13:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A840F6E8B3;
	Thu,  8 Jul 2021 11:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2936E8B3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 11:57:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0E86C580583;
 Thu,  8 Jul 2021 07:57:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 08 Jul 2021 07:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=TDZ9TqyEzhFi4Z160/490nIKbT
 svjWH1kG4Ng2NyjUM=; b=DF61YvdQA9GzPniZ3TVEmvA7JQkqB8Km6NX2VGdG+L
 00GuxI/2wd3UP5N0gbYgm0x48UFqkzXbEu8LhjNaWbZCjynnYK/OHZVYo4dbhZGw
 s4bv6ERKqY9VyTxP2AiSBIm2eORwgx+ps8HcoQucWYNWhyIWLo19AMvG6CknhEEe
 OJGpT7SQYrdgnxKmpPuPdCt50NGk52uQY8Sq47M8Dv209/e4lYjU0hAdXf056ZLG
 /ElxKUdvAxlH3+bKrM627LhnvkYCV93yweL76v2jFXr9xzSe5eUyFF4ZlK+GNIzi
 YHhVGojZtOoSh22e6DFdrxiTgfYFXEGKyFdpsmpiHaFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TDZ9TqyEzhFi4Z160
 /490nIKbTsvjWH1kG4Ng2NyjUM=; b=pWwPnF9cXGqG1Fe4PkktmEGW/Ne2vejVg
 TQHNASYqzxjWZqHZZHDCzdfWiRvrOALCWeje3mBh9IbpGMLIhUwJyJSX1KbuDGtw
 iel8f01p7qmzXIEIbSgMLcvDdeR3neIa08bfuTRoYWvlGafDWMZkAJxV5gW46S77
 rT4vlBIVEDbt5fUrxyzGo2ebYoYWYR9FlynKzLU/MC6txKMO6tBPYLjJj/dmbVoD
 n/nphEjcRxZZYT1U7fg73UCp0cIQbPKeqWJprZmBvEsy9vK00hV/CVUzcHA6eqH1
 YoBijNLXl45GZproVWz0WVxkYqRxbq9Vrx6OGXCPCv0uOERXQrfqw==
X-ME-Sender: <xms:QejmYHSS_PncIBBNYVb3moguaqCMqcqkyfhEXMNhSJg2WkWjFjh7Xw>
 <xme:QejmYIyvBD_9yRVFJlHt1ps5cevBkMcqpB97w_Sg6BvN7aWYUt8iQXtfTfq3dhsaS
 XEI8JrIa2ezumcRn9A>
X-ME-Received: <xmr:QejmYM3eJj9W2YiDEvyrrMmFTbuHkcCXr7iwthffSYdYam7RPpABsFKxD_zUiSTGNMQdK8L55ELCfwRZQxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehlihhsthgrihhr
 ucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqeenuc
 ggtffrrghtthgvrhhnpefghfegkeejtddvfeekjeelgeffhefhvddvvddtvefgfffftdek
 geeljeefvdeiudenucffohhmrghinhepvghinhhkrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishht
 rghirhdvfedrmhgv
X-ME-Proxy: <xmx:QejmYHB3mD8O3fPyaatydnPI5DQ0dZSpxgBEohvUFOrKN9_5QlCDQg>
 <xmx:QejmYAg_vYYGNeXAnZycQn68wsYYOad8pfpBTMYH3RKP_mXC6EEIBQ>
 <xmx:QejmYLqie_G32bxkjwFw093WE_b5a26YIlZbjaevsqJb8L-hyMlPSg>
 <xmx:ROjmYMwRHi30dL8cVS4GluEBiNcruMJJXrBLz5ZUvL0iwH3SUSgAvQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:57:48 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 krzk@kernel.org, shawnguo@kernel.org, daniel@0x0f.com,
 linux@rempel-privat.de, kuninori.morimoto.gx@renesas.com,
 max.Merchel@tq-group.com, geert+renesas@glider.be, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v3] drm/panel: Add support for E Ink VB3300-KCA
Date: Thu,  8 Jul 2021 21:57:35 +1000
Message-Id: <20210708115735.142-1-alistair@alistair23.me>
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
index 0199728d2eaf..3612c6020fe4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -335,6 +335,8 @@ patternProperties:
     description: eGalax_eMPIA Technology Inc
   "^einfochips,.*":
     description: Einfochips
+  "^eink,.*":
+    description: E Ink Corporation
   "^elan,.*":
     description: Elan Microelectronic Corp.
   "^element14,.*":
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 21939d4352cf..210377b03f6f 100644
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
@@ -4344,6 +4370,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,etm0700g0dh6",
 		.data = &edt_etm0700g0dh6,
+	}, {
+		.compatible = "eink,vb3300-kca",
+		.data = &eink_vb3300_kca,
 	}, {
 		.compatible = "edt,etm0700g0bdh6",
 		.data = &edt_etm0700g0bdh6,
-- 
2.31.1

