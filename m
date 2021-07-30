Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A303DB86D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 14:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54AE6EDD9;
	Fri, 30 Jul 2021 12:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C925D6EDD9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 12:13:27 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 46B16580A67;
 Fri, 30 Jul 2021 08:13:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 30 Jul 2021 08:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=x45utzlm+I7LrH8ONZBODJozoR
 9FeoJBITa/+rubT3U=; b=eo9zfwKlAVXNANjwmyhN7WFznBQ4fS7eYSfJGEEcmM
 fFAbxuKuoZfNVRxqqRIuIZ/rt1m6NC+T6JcZUg7paU2FUieDo4GtLbY66w1s5OwF
 evK3YL8p2ECWXsUDYHfDs4VUzIKuvYgbJjVznSEualkYUM/HE8rIXzsZexhMd3y9
 JSMpMuq2/ibdmK2z74rzudwhqV6hSx4FR7Eu5kPkFTY2+5J2FAdrgF82VVHhAgOD
 qmDpsD9J2GfFocN3BeU5x1r28Bxe5EdRE7RFHbPff1NTAcqEFphcBou9O9mc6Uxa
 q6T5xsGITcOWiuU0xMe3CwPTsPjQoGICqcTF9Bfz3quQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=x45utzlm+I7LrH8ON
 ZBODJozoR9FeoJBITa/+rubT3U=; b=LcUdOX3Pc9Azq97zQxEqR4AFItkJYY/zm
 ds/MONvHH1WEh1A2eBNixHMDM3qwyYVE2KY5FP/Q5gtPZSfkAr39AklMJQk18akW
 tj+NE5mWl40VGX4XncHUDoQrkiF8rs91+BNIy+66Ps2k+DgoMYIX174Wm8RFlrKZ
 x/cyuA//VnHGP0H9AovSid85/FiIRAQZ6diPs9u4Y9Ij70Zo8ZtVlyi6UAxZK4t0
 c7QJwS16eKxmmDmASsjWlx3aRZTk1+LMB4kX72F4JlsAxwum5pE1dhb/Lg2zib8+
 kkvwLfyL8F+8ZTlXS8q8JbxlHxGSzKoQtuolS1tZEhjFeycaG/mcg==
X-ME-Sender: <xms:4-wDYRcNbeXAJImrKVzm1ssXhJWPqq4yO_guaex22bOYuvTEx9Fvyg>
 <xme:4-wDYfNYW_R_a6t0vzf_bCDX9ka5xFaqHuM6hXLvDBPsPLz_5f4FpzmN8vXLEqJ_Q
 3ZuWn_nLdghg3-EN-U>
X-ME-Received: <xmr:4-wDYaiJM87oHU5dELNL8Qx7ktsn1_ebPlgNnEBPIO-fnzOIOxLObdmsllB6z5-Qndcpsu9SboAWH6xE-dySiLsiGvzM435XXDtx5Hw7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheehgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehlihhsthgrihhr
 ucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqeenuc
 ggtffrrghtthgvrhhnpefghfegkeejtddvfeekjeelgeffhefhvddvvddtvefgfffftdek
 geeljeefvdeiudenucffohhmrghinhepvghinhhkrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishht
 rghirhdvfedrmhgv
X-ME-Proxy: <xmx:4-wDYa_4YfXIKT7bHHOvDaK1h1eGPAab96Wa8aaw2UzrS9o17THhQQ>
 <xmx:4-wDYdvgu78Mufgq-oS7IJRB0nGp3A3tP75FkFigv1znadG0xjxMdg>
 <xmx:4-wDYZEbziNTM6ugR8dxegpBnO9je7QsVK4GwjbNaktwiYfUjo1qcw>
 <xmx:5ewDYdNAov7PpYv9K5a8n32mD21GBPuWIVe47phUT6Wqt3xmUJAp-w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jul 2021 08:13:17 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 krzk@kernel.org, shawnguo@kernel.org, daniel@0x0f.com,
 linux@rempel-privat.de, kuninori.morimoto.gx@renesas.com,
 max.Merchel@tq-group.com, geert+renesas@glider.be, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v5] drm/panel: Add support for E Ink VB3300-KCA
Date: Fri, 30 Jul 2021 22:13:10 +1000
Message-Id: <20210730121310.131-1-alistair@alistair23.me>
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
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
v5:
 - Add .connector_type

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 30 +++++++++++++++++++
 3 files changed, 34 insertions(+)

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
index 21939d4352cf..90d96091f09f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2046,6 +2046,33 @@ static const struct panel_desc edt_etm0700g0bdh6 = {
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
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing evervision_vgg804821_timing = {
 	.pixelclock = { 27600000, 33300000, 50000000 },
 	.hactive = { 800, 800, 800 },
@@ -4350,6 +4377,9 @@ static const struct of_device_id platform_of_match[] = {
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

