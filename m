Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106AFBCF898
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6948110E30E;
	Sat, 11 Oct 2025 17:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="W9L18Xf/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BgHJ0C3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098A110E30A
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:02 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ckVKw5yb3z9tYT;
 Sat, 11 Oct 2025 19:03:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4YPJPdQiVhw9NqJsDPC+3PQv9/PFHD3QyzwquWac6k=;
 b=W9L18Xf/lUvHePM1L/7Qx9Uazpeg9ag4Q41hDfNaCSnJI2EBeuo2UnIMg/+Q+vYna8NQs7
 C9cQ2P8pYdctkB68hETu7T+EgU1fV7VnzUIq06aLsg1mQUr08k9Q7NV23+HbfP6sbqZHHi
 5MZqX0N+fyJ5Cto6ZPct1VR3p+0kfNRSXKVXAkuObaT/A4UmgLCiBxfBCuN7uuGXAGrTvj
 m94dqIg39TRfWKFvR0lmQ0L+FeN3S13CpCitep31XtKRRh9PolC94sXy+9qbytTlmxHpQs
 2sRMG8agz8g23XtKlaqEaW0solrrL0GGxxdqKHl3WvMxbvOeP/+NIid4BOSiEg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=BgHJ0C3w;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4YPJPdQiVhw9NqJsDPC+3PQv9/PFHD3QyzwquWac6k=;
 b=BgHJ0C3wdQdx7H+rA8LO5qpnQkOwqQAtu/RgqcYWkG2/QJhQ7K0R7vZ3cI/R3STI86Nj5R
 rWMRH0A5E1da/mo0Zks8/ELmH3wWitd/8l5u8ym49SDnuyz+LJJx+PoWx3z21QHD9TKSqF
 AqcutYu8WSkxcJhd3ro0THFrxxWm3ccBO44dMGUZttMXJWYL5UPz8f1MtNbO8lOQjoEG31
 VMHtdcuXZj9SoH25jsPTJB9uWV7iQdrU9ckdiyhVaMQ/me6tPinuwVPmobtW6JNd6iEv9Y
 m62VKRTVPJA5wxOvwzbk3MIYuaRWssPd3vQUk20wGcc2gSvKRDbiBgH2EaxWCQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
Date: Sat, 11 Oct 2025 18:51:18 +0200
Message-ID: <20251011170213.128907-4-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a534c7c1c8bbdbaffdb
X-MBO-RS-META: gkgwfxqpfm3goitg9wuaor9w9666d9h4
X-Rspamd-Queue-Id: 4ckVKw5yb3z9tYT
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

Freescale i.MX95 Display Controller is implemented as construction set of
building blocks with unified concept and standardized interfaces. Document
all new processing units present in i.MX95.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  4 +-
 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 45 +++++++++++++---
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  4 +-
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml |  1 +
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  | 13 ++++-
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  4 +-
 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 52 +++++++++++++++---
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  5 +-
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 53 ++++++++++++++++---
 9 files changed, 153 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
index 94f6785636085..3a585b3b9a789 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
@@ -18,7 +18,9 @@ maintainers:
 
 properties:
   compatible:
-    const: fsl,imx8qxp-dc-constframe
+    enum:
+      - fsl,imx8qxp-dc-constframe
+      - fsl,imx95-dc-constframe
 
   reg:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
index 91f3bb77d8d0d..aba818546028b 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
@@ -16,7 +16,9 @@ maintainers:
 
 properties:
   compatible:
-    const: fsl,imx8qxp-dc-display-engine
+    enum:
+      - fsl,imx8qxp-dc-display-engine
+      - fsl,imx95-dc-display-engine
 
   reg:
     maxItems: 2
@@ -42,10 +44,10 @@ properties:
     maxItems: 1
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 1
+    enum: [1, 2]
 
   ranges: true
 
@@ -58,13 +60,23 @@ patternProperties:
       compatible:
         const: fsl,imx8qxp-dc-dither
 
+  "^domainblend@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx95-dc-domainblend
+
   "^framegen@[0-9a-f]+$":
     type: object
     additionalProperties: true
 
     properties:
       compatible:
-        const: fsl,imx8qxp-dc-framegen
+        enum:
+          - fsl,imx8qxp-dc-framegen
+          - fsl,imx95-dc-framegen
 
   "^gammacor@[0-9a-f]+$":
     type: object
@@ -90,13 +102,15 @@ patternProperties:
       compatible:
         const: fsl,imx8qxp-dc-signature
 
-  "^tcon@[0-9a-f]+$":
+  "^tcon(@[0-9a-f]+)?$":
     type: object
     additionalProperties: true
 
     properties:
       compatible:
-        const: fsl,imx8qxp-dc-tcon
+        enum:
+          - fsl,imx8qxp-dc-tcon
+          - fsl,imx95-dc-tcon
 
 required:
   - compatible
@@ -109,6 +123,25 @@ required:
   - "#size-cells"
   - ranges
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-dc-display-engine
+    then:
+      properties:
+        "#address-cells":
+          const: 2
+        "#size-cells":
+          const: 2
+    else:
+      properties:
+        "#address-cells":
+          const: 1
+        "#size-cells":
+          const: 1
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
index dfc2d4f94f8eb..82a748b0024d4 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
@@ -32,7 +32,9 @@ maintainers:
 
 properties:
   compatible:
-    const: fsl,imx8qxp-dc-extdst
+    enum:
+      - fsl,imx8qxp-dc-extdst
+      - fsl,imx95-dc-extdst
 
   reg:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
index 97fb6a4598d96..0e67322627a55 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
@@ -111,6 +111,7 @@ properties:
       - fsl,imx8qxp-dc-fetcheco
       - fsl,imx8qxp-dc-fetchlayer
       - fsl,imx8qxp-dc-fetchwarp
+      - fsl,imx95-dc-fetchlayer
 
   reg:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
index 9d1dc3a9de90e..dd83ac669478b 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
@@ -16,18 +16,27 @@ maintainers:
 
 properties:
   compatible:
-    const: fsl,imx8qxp-dc-framegen
+    enum:
+      - fsl,imx8qxp-dc-framegen
+      - fsl,imx95-dc-framegen
 
   reg:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 6
+
+  clock-names:
+    minItems: 1
+    maxItems: 6
 
   interrupts:
+    minItems: 6
     maxItems: 8
 
   interrupt-names:
+    minItems: 6
     items:
       - const: int0
       - const: int1
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
index 2a6ab8a0ed7fc..6565b7acf47e4 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
@@ -13,7 +13,9 @@ maintainers:
 
 properties:
   compatible:
-    const: fsl,imx8qxp-dc-layerblend
+    enum:
+      - fsl,imx8qxp-dc-layerblend
+      - fsl,imx95-dc-layerblend
 
   reg:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
index 633443a6cc380..2d0ee83e30b25 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
@@ -17,19 +17,28 @@ maintainers:
 
 properties:
   compatible:
-    const: fsl,imx8qxp-dc-pixel-engine
+    oneOf:
+      - const: fsl,imx8qxp-dc-pixel-engine
+      - items:
+          - const: fsl,imx95-dc-pixel-engine
+          - const: fsl,imx8qxp-dc-pixel-engine
 
   reg:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 1
+    enum: [1, 2]
 
   ranges: true
 
@@ -48,7 +57,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: fsl,imx8qxp-dc-constframe
+        enum:
+          - fsl,imx8qxp-dc-constframe
+          - fsl,imx95-dc-constframe
 
   "^extdst@[0-9a-f]+$":
     type: object
@@ -56,7 +67,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: fsl,imx8qxp-dc-extdst
+        enum:
+          - fsl,imx8qxp-dc-extdst
+          - fsl,imx95-dc-extdst
 
   "^fetchdecode@[0-9a-f]+$":
     type: object
@@ -80,7 +93,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: fsl,imx8qxp-dc-fetchlayer
+        enum:
+          - fsl,imx8qxp-dc-fetchlayer
+          - fsl,imx95-dc-fetchlayer
 
   "^fetchwarp@[0-9a-f]+$":
     type: object
@@ -104,7 +119,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: fsl,imx8qxp-dc-layerblend
+        enum:
+          - fsl,imx8qxp-dc-layerblend
+          - fsl,imx95-dc-layerblend
 
   "^matrix@[0-9a-f]+$":
     type: object
@@ -138,6 +155,25 @@ required:
   - "#size-cells"
   - ranges
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-dc-pixel-engine
+    then:
+      properties:
+        "#address-cells":
+          const: 2
+        "#size-cells":
+          const: 2
+    else:
+      properties:
+        "#address-cells":
+          const: 1
+        "#size-cells":
+          const: 1
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
index 7a3b77ea92c73..1f935b342f461 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
@@ -15,7 +15,9 @@ maintainers:
 
 properties:
   compatible:
-    const: fsl,imx8qxp-dc-tcon
+    enum:
+      - fsl,imx8qxp-dc-tcon
+      - fsl,imx95-dc-tcon
 
   reg:
     maxItems: 1
@@ -26,7 +28,6 @@ properties:
 
 required:
   - compatible
-  - reg
   - port
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
index 0a72f9f0b5fda..1e8f559acb4de 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
@@ -48,13 +48,20 @@ maintainers:
 
 properties:
   compatible:
-    const: fsl,imx8qxp-dc
+    enum:
+      - fsl,imx8qxp-dc
+      - fsl,imx95-dc
 
   reg:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 6
+
+  clock-names:
+    minItems: 1
+    maxItems: 6
 
   resets:
     maxItems: 2
@@ -68,10 +75,15 @@ properties:
     maxItems: 1
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 1
+    enum: [1, 2]
+
+  fsl,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to Control and Status Registers (CSR) module.
 
   ranges: true
 
@@ -90,7 +102,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: fsl,imx8qxp-dc-display-engine
+        enum:
+          - fsl,imx8qxp-dc-display-engine
+          - fsl,imx95-dc-display-engine
 
   "^interrupt-controller@[0-9a-f]+$":
     type: object
@@ -98,7 +112,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: fsl,imx8qxp-dc-intc
+        enum:
+          - fsl,imx8qxp-dc-intc
+          - fsl,imx95-dc-intc
 
   "^pixel-engine@[0-9a-f]+$":
     type: object
@@ -106,7 +122,11 @@ patternProperties:
 
     properties:
       compatible:
-        const: fsl,imx8qxp-dc-pixel-engine
+        oneOf:
+          - const: fsl,imx8qxp-dc-pixel-engine
+          - items:
+              - const: fsl,imx95-dc-pixel-engine
+              - const: fsl,imx8qxp-dc-pixel-engine
 
   "^pmu@[0-9a-f]+$":
     type: object
@@ -125,6 +145,25 @@ required:
   - "#size-cells"
   - ranges
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-dc
+    then:
+      properties:
+        "#address-cells":
+          const: 2
+        "#size-cells":
+          const: 2
+    else:
+      properties:
+        "#address-cells":
+          const: 1
+        "#size-cells":
+          const: 1
+
 additionalProperties: false
 
 examples:
-- 
2.51.0

