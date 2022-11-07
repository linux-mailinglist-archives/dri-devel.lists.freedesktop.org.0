Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50561EAA4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 06:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99B710E1E8;
	Mon,  7 Nov 2022 05:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB2710E1E8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 05:45:53 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 76AA75C00E2;
 Mon,  7 Nov 2022 00:35:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 07 Nov 2022 00:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1667799357; x=1667885757; bh=XO
 S3JN6XNHJjuLSX9mYtAFmUbNNKkKhsMQg7RXfIvl8=; b=lcQTpLQ2lKPVay2JKO
 AA+dZXwjhdR1FAIPE4vfd4d9H5SkVJ5RG1sZjZ4hbIB/qbggMBT66yUs3g3h4aGD
 uCIyTa5TQp15XO87DcuG1aQyZj9mtgZPAZPb5WjHE2Adkxx7oTLzri3i/bv1fPDm
 4w51JMvyDBhCTzwoaSz0S1K6S9AQoWBnpmVKXD16c3/Vss7/Mwri0en+wnyb45Zp
 +Ox4xC+lOK3j0l3HtEjYrcBg2jcjFLFi1Fr4DgohYtZAsJxztVIg467KgcJa3k3s
 xtK0eAvhhY9XKaTOWqtFFvgrO5a4DUHGkdADBQ9qRvhM38PRpXz99xkablY3jX5O
 7Byw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667799357; x=1667885757; bh=XOS3JN6XNHJju
 LSX9mYtAFmUbNNKkKhsMQg7RXfIvl8=; b=dTaH4BYcqDFA+iJYWY4osHn0IA528
 daRlsgfbclwP1n5+wDMzhNKMKkhieWDoEkn+RXUFDeBloKfuBLIltQ7iXfQOxTCx
 ukx17uWmWfLSERGJBAo2SFnWdNp6LIIS8BuLBAztOESAafBxd/Zv9yDTvmPFxK/n
 5SfVTqXPdofDOZjtJ1Q4EKmrcpCZuF+DPoa7KtoQW9p+aWWj7LLcRuEcb0qdplIT
 E14dXws7Wn+A5ZGEbL5qBlm8TRT3TWBpA5Pa8yCADwWwTXhym6JsiOIE/ZyZxwUo
 PLpzGGKDv1iwVMlaQur+hanuyHV1A6h8tf/EHfXM6XbziPgzNdMGVjFug==
X-ME-Sender: <xms:PZloY3DyUPFyhPKPzG7D5i2Xt94NbWgayL4eBfdH6el2yLi2wCF8vg>
 <xme:PZloY9j1fWCIWdfwpLK-JHqBLE69WlxsoOMq2_4Jd0i6JN0HC9bPLrDIOYg7LLNvH
 hxChemo6x5JPpL_iw>
X-ME-Received: <xmr:PZloYykVAiteX8MT3iBI3A-JZPpv0ZUT2BGlfbsmbUTU5svoEbBIqnhvDzojMXgInrzdAwZef1xLmaZ0TcUBelCDTjJPGNwdxMoP_E1nObkofbBNj-BH_gpjCM29CEpnM6mvRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdejgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:PZloY5xElYN5tR-4QRl4FZajZiGppq9UzEKLKoHHLNGAyiWlFkyk_Q>
 <xmx:PZloY8QiRuZLj3OT-n2HOklAjVhXMoev8ZxpUJz9r5Fj2nxGl8mCPQ>
 <xmx:PZloY8aBr5RwbcmZLti9zLJXRbiVmD6ZuBVlwpbJcTVg-QcenkUNgA>
 <xmx:PZloY-AAihe3C2sf2O_BdzNB1KBroXT5NnvE2ZmuEK2pKu1GNEmPPg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 00:35:56 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 2/4] dt-bindings: display: sun6i-dsi: Add the A100 variant
Date: Sun,  6 Nov 2022 23:35:50 -0600
Message-Id: <20221107053552.2330-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221107053552.2330-1-samuel@sholland.org>
References: <20221107053552.2330-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "40nm" MIPI DSI controller found in the A100 and D1 SoCs has the
same register layout as previous SoC integrations. However, its module
clock now comes from the TCON, which means it no longer runs at a fixed
rate, so this needs to be distinguished in the driver.

The controller also now uses pins on Port D instead of dedicated pins,
so it drops the separate power domain.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Removal of the vcc-dsi-supply is maybe a bit questionable. Since there
is no "VCC-DSI" pin anymore, it's not obvious which pin actually does
power the DSI controller/PHY. Possibly power comes from VCC-PD or VCC-IO
or VCC-LVDS. So far, all boards have all of these as always-on supplies,
so it is hard to test.

(no changes since v1)

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index bf9bfe8f88ae..c731fbdc2fe0 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -12,9 +12,14 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - allwinner,sun6i-a31-mipi-dsi
-      - allwinner,sun50i-a64-mipi-dsi
+    oneOf:
+      - enum:
+          - allwinner,sun6i-a31-mipi-dsi
+          - allwinner,sun50i-a64-mipi-dsi
+          - allwinner,sun50i-a100-mipi-dsi
+      - items:
+          - const: allwinner,sun20i-d1-mipi-dsi
+          - const: allwinner,sun50i-a100-mipi-dsi
 
   reg:
     maxItems: 1
@@ -59,7 +64,6 @@ required:
   - phys
   - phy-names
   - resets
-  - vcc-dsi-supply
   - port
 
 allOf:
@@ -68,7 +72,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun6i-a31-mipi-dsi
+            enum:
+              - allwinner,sun6i-a31-mipi-dsi
+              - allwinner,sun50i-a100-mipi-dsi
 
     then:
       properties:
@@ -83,6 +89,18 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun6i-a31-mipi-dsi
+              - allwinner,sun50i-a64-mipi-dsi
+
+    then:
+      required:
+        - vcc-dsi-supply
+
 unevaluatedProperties: false
 
 examples:
-- 
2.37.3

