Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C47353A7C36
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 12:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A00789FF9;
	Tue, 15 Jun 2021 10:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 448 seconds by postgrey-1.36 at gabe;
 Tue, 15 Jun 2021 10:41:08 UTC
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8F889FEA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 10:41:08 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 56F61580891;
 Tue, 15 Jun 2021 06:33:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 15 Jun 2021 06:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=h+iaVVuHblnQK
 meS9Tco0cVzpqN/8yNC7UJv6QL74TA=; b=S7LxfNYYi+Dw/zHWdaJoG8IQiME25
 h9Y4tZFYHU1BF1IoYhcG6D6GSggxQtf8K7Uur0lj/A7xS3EDbLGPQh3Uu7WL+a/p
 /+gZjPXb7LA2lPsTusVdvWu8kgPelDyiF2qKskP3efxodrKzei8eXOWSW+JynfTG
 ALYkE3lE5lGTmMLM2t+40VIdA5jw5RDAMAvU8WFkab5ExLT5vjGJeH2ZnY87Mb16
 awx61pCpYCIyS7YHAsxT2qHaRK9EVzH/zBp2JmQIE+SgYtAl1vbpDWoMYUn1Nv8U
 iy7zXNXcfZul5hW5v4mnOVgI2CFg2UjW8wqGSpqDoISR3m8NHSzS/vs2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=h+iaVVuHblnQKmeS9Tco0cVzpqN/8yNC7UJv6QL74TA=; b=Zi+X9MGH
 96CYITySQuomtfE8s3YguaXd2buUD1JDA5DEg2+K1nV5tLT5dABbKpTEj15dCD/6
 3w8hP+zqU3dscYe0tZzdkEOuq8/YVLBVeQp4BG2pHmNr/M6fibcdrQYyMxfIPwtI
 BqDXapWwqCJb1NkOXHvdnHH6GL7scYBBSYe7YcZZIJioRTQvI3Mfza++EWGZTYOP
 jpOvfCOSUPobSaerMZK34OsgbalYmIldtCX3ciaB/JSPw4WAdExx2FvoCl5LCvHZ
 jObGdkVePqtMetA1NLPOZDKVfqiMTDTSVqzgspKfu2Y+fAmXR5xj8OlG1bMLhi8d
 nEYQ0AmTUoBp2A==
X-ME-Sender: <xms:CILIYLiBvRA1bPlBZhZCxVkheJwJF8EpEgZzxvrrE_ujaOfq0FwIGQ>
 <xme:CILIYICn0dChxMVslOW1wrTPWmpyUC_rH37rPTdjUMo9yXti3gk16jOKjQtvn6t0X
 IfTAJrwi-mauQUdoK4>
X-ME-Received: <xmr:CILIYLGpIacfjsqZiHrnj2z1Ef-DPXT0WEu8XqTNhIYbu8xlvqKPc_ToP5346KpEmaC2z6jFhnc8RalH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
 ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeevjeelleejfe
 dvheeuieetfeejfefhhffffefffefhveetffeuudegudduhedtueenucffohhmrghinhep
 vghinhhkrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:CYLIYISy2ZliY_yStpdHqvMWKnKoWz-pyYMkmpUBII3-N9VQIkftUg>
 <xmx:CYLIYIxeB17f4fQaCnuJoailWRnVhxccXQIF44vcDd8-ipiEBpcShg>
 <xmx:CYLIYO6lC7ooM2yG6n5IRixTPB1EsbrW0XP3wotXMR_1Y_fHRpuexw>
 <xmx:CoLIYNLyDYU0eiL-9L1KsDyVqSVAIc6xgxdxVV4e0HFUW3df60lmWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:33:38 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 krzk@kernel.org, shawnguo@kernel.org, daniel@0x0f.com,
 linux@rempel-privat.de, kuninori.morimoto.gx@renesas.com,
 max.Merchel@tq-group.com, geert+renesas@glider.be, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v2 2/2] drm/panel: Add support for E Ink VB3300-KCA
Date: Tue, 15 Jun 2021 20:33:12 +1000
Message-Id: <20210615103312.872-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615103312.872-1-alistair@alistair23.me>
References: <20210615103312.872-1-alistair@alistair23.me>
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
---
v2:
 - Fix build warning
 - Document new string

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
 2 files changed, 31 insertions(+)

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
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index be312b5c04dd..600e054ec521 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2004,6 +2004,32 @@ static const struct panel_desc edt_etm0700g0bdh6 = {
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
@@ -4302,6 +4328,9 @@ static const struct of_device_id platform_of_match[] = {
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

