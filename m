Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB63D6781D6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3B710E1ED;
	Mon, 23 Jan 2023 16:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFD510E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:40:38 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id jm10so11918978plb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 08:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B16MdEZGgWKroaibEVRgjt0AS9SNV+wNt8yTwqMwdvU=;
 b=3luz0yicHkzX9obA6wm0VTILTZd6AjbXSjByNM5YJy6QlQHNa0DGbpHhc2uxPO713/
 u4CpMSROHnkI7Vj/Ay60v+5J8j2bgJvRg1KB+7yxjjlyW9l/RgEk/hiTQQMAma6nNo8I
 YZLEnhwN7hAPCUC1848i88Kyml1DJcV8fH1vFmDGt7BjQ5x7qJVfjg1fwbbj2fKqTNgx
 KEW7uhaaO9KKSsB22Wfa7E0Qk0awybl+SEHB8DvgfvR18vR1hlX7rLfv0h43kJw3NRmd
 vQuVYu9rAYgOCCDBIHFvTpNFg8yM7iQqN7tZ/0Uq6zX94qnfWh3k2Jgb/rN7eraEPFqr
 xuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B16MdEZGgWKroaibEVRgjt0AS9SNV+wNt8yTwqMwdvU=;
 b=f87fbC7pdPC2Ek8X64L5UReU5PLAGLL2X2Hi9Hx+v+rsB6bO1vrozdNusHOGVPapSW
 +6i0GceIo5UnHXdQaDq3RSYd+nFpVP5YEVkP3Nmpd/esKs0b7kDPNEvU4dRgnwYvczRt
 M3EMxvxGkF4FalPy7wk2QRDb1hsOdFtHj2FP6qQGnhdZd23MSuormRaFcsL/MKG4dBal
 56U2MEgmK5CBAmbl26TpMwjsKr8jezxTGSfA4X9+CP04EHVEVhrHmxooxtioKTlU9iDk
 uzQuhR15iTy0nkEgp1z5t8bhQqbRra7QMYU6zvTfmFgjChj6V1VyTJx6MnXxnE4ijpoQ
 tmVA==
X-Gm-Message-State: AFqh2krWXLB+nLBJfNoS4k7wCib1m18IrdNgMbbSg9+ytfP33IZNXenq
 ibZcCz8u/DN8joRkwfeDtn8lZQ==
X-Google-Smtp-Source: AMrXdXuxO08rV+yFhtyvfHzEVpXPc/YDOR3YmKlRE40SimymNJOISGgMbAQsLZ6z1Wkav4ffxz2mbg==
X-Received: by 2002:a17:902:f312:b0:193:678:df13 with SMTP id
 c18-20020a170902f31200b001930678df13mr19832591ple.36.1674492037572; 
 Mon, 23 Jan 2023 08:40:37 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a170902710300b0019269969d14sm17679971pll.282.2023.01.23.08.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 08:40:37 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/4] drm: panel: jadard-jd9365da-h3: Fix panel vendor and model
Date: Mon, 23 Jan 2023 22:10:15 +0530
Message-Id: <20230123164018.403037-1-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
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
Cc: Tom Cubie <tom@radxa.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The initial datasheet claimed that chouzhong designed this 10"
DSI panel on top of JD9365DA IC, but later Radxa mentioned that
chouzhong is the manufacturer.

So the actual design of the panel, gsensor, and customized FPC
is done by Radxa. The panel model named is Radxa Display 10HD
with AD001 is the part number.

Fix the binding and panel driver with the proper panel vendor
and model.

Fixes: <6b818c533dd8> ("drm: panel: Add Jadard JD9365DA-H3 DSI panel")
Fixes: <bb3098eead99> ("dt-bindings: display: Document Jadard
JD9365DA-H3 DSI panel")
Reported-by: Tom Cubie <tom@radxa.com>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 .../bindings/display/panel/jadard,jd9365da-h3.yaml  |  4 ++--
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c    | 13 ++++++++-----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index c06902e4fe70..10ba1b813304 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -16,7 +16,7 @@ properties:
   compatible:
     items:
       - enum:
-          - chongzhou,cz101b4001
+          - radxa,display-10hd-ad001
       - const: jadard,jd9365da-h3
 
   reg: true
@@ -52,7 +52,7 @@ examples:
         #size-cells = <0>;
 
         panel@0 {
-            compatible = "chongzhou,cz101b4001", "jadard,jd9365da-h3";
+            compatible = "radxa,display-10hd-ad001", "jadard,jd9365da-h3";
             reg = <0>;
             vdd-supply = <&lcd_3v3>;
             vccio-supply = <&vcca_1v8>;
diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 48c1702a863b..ea89cecad0cf 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -167,7 +167,7 @@ static const struct drm_panel_funcs jadard_funcs = {
 	.get_modes = jadard_get_modes,
 };
 
-static const struct jadard_init_cmd cz101b4001_init_cmds[] = {
+static const struct jadard_init_cmd radxa_display_10hd_ad001_init_cmds[] = {
 	{ .data = { 0xE0, 0x00 } },
 	{ .data = { 0xE1, 0x93 } },
 	{ .data = { 0xE2, 0x65 } },
@@ -364,7 +364,7 @@ static const struct jadard_init_cmd cz101b4001_init_cmds[] = {
 	{ .data = { 0xE7, 0x0C } },
 };
 
-static const struct jadard_panel_desc cz101b4001_desc = {
+static const struct jadard_panel_desc radxa_display_10hd_ad001_desc = {
 	.mode = {
 		.clock		= 70000,
 
@@ -384,8 +384,8 @@ static const struct jadard_panel_desc cz101b4001_desc = {
 	},
 	.lanes = 4,
 	.format = MIPI_DSI_FMT_RGB888,
-	.init_cmds = cz101b4001_init_cmds,
-	.num_init_cmds = ARRAY_SIZE(cz101b4001_init_cmds),
+	.init_cmds = radxa_display_10hd_ad001_init_cmds,
+	.num_init_cmds = ARRAY_SIZE(radxa_display_10hd_ad001_init_cmds),
 };
 
 static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
@@ -452,7 +452,10 @@ static void jadard_dsi_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id jadard_of_match[] = {
-	{ .compatible = "chongzhou,cz101b4001", .data = &cz101b4001_desc },
+	{
+		.compatible = "radxa,display-10hd-ad001",
+		.data = &radxa_display_10hd_ad001_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jadard_of_match);
-- 
2.25.1

