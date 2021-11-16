Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF145344A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 15:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0835E6E1B4;
	Tue, 16 Nov 2021 14:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4928D6E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 14:35:12 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 623973200E5F;
 Tue, 16 Nov 2021 09:35:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 16 Nov 2021 09:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=7JZgFqmAlcsRJ2awiJtJSt4of6
 zoDu+OgL/facGVHho=; b=JFvP9g8jKpgoUyPADqeJ109nkYVBVLpzPcjoi91P5P
 vW41XO9gkBo1aLTlrhxIkAyMp2X6mkH5s4HmxlQ25bssifzkr5+7EVYjtlfITVUx
 lgGBRiZBmvi6GpZTEd0jaLR4deX+uKoPkLEtrvRU1VhqPMJqUzsBmiPMm9vp2Wtc
 /UEg6FP6382CulQ2M4kaIS5kz2L2el+Pmvvn7PMWQ3gMsaKSFSNipf4qErVujlWU
 bDEeLaRPy0/uBanelATGhFuj9AoFkRjsMl7HRnDa0LujZJWSDnwPRsNi73kCZjdu
 vd+mfaQAbFZyQuKZBl9jvNCfWGvwVl0nWSrPtTFGZZyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7JZgFqmAlcsRJ2awi
 JtJSt4of6zoDu+OgL/facGVHho=; b=PP7hGHNO/dPsXE0kv8SsRxl4uPllP/eny
 SVZg21LEpgiAw3u0DDc6+qgCHifVbeZZlYDFD1LLlM+5B195YTi7+A+s3lSeV8jj
 h0FSghFDg1yDOAatcEkUmyOL1RaQtQ+7xo2QAfEGduVg19JlDxQJlrBYAaT3pxbl
 6XGfGGReRXN3aeenhzPoH9wpupTx6sl9ymaWw/Y3nSMRNnjxTmy8OSFj4612kxy8
 gYOF/p2e4iNt7MYgkm1DzBk9Mm7SE5/kvZrCrPnDsraKibfPx2wBZjuWXUd9BaQu
 tdWxg6y6P4Zli99CqUvGBFqaMrRQb18ZBIecEciXEhPhJsTgLUcZA==
X-ME-Sender: <xms:m8GTYcH4yI6Q7Q2RSRaSxW45mxZ9LX5D4PJ0DJ2DrnuCRq7NwJL6Gg>
 <xme:m8GTYVVs8VJZn4Hv_DIBo_vhqCCv6wZNkY0wuL4XfFxewDzhvb74vdiokuEmVnaQg
 N9lAWd598klfMGeD2M>
X-ME-Received: <xmr:m8GTYWLW28MCvpehIUTb9mINeJyAxo1tMB5wbBc3JKMxFmb93SXFJYg5HN10BUJnedMBi2gNFRNybWjkNIq0n613AEK7N7fbY1gXrUVd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedvgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffoggfg
 sedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimh
 gvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhephffhhfevtddthefgieei
 geffudehkefgtdeufedvtdduheduieekvddvfedvkeetnecuffhomhgrihhnpeguvghvih
 gtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:m8GTYeG_ccps6GJSXV8qHnw-cmom2tmt5fU97qORWDYILCqDkTKSPg>
 <xmx:m8GTYSWdgqIrUOygmctt2t3ss3aMmjVHuLXHkqw53YCFL-ucaHW43w>
 <xmx:m8GTYRPDzv_it6niUD0o_YoyFPDr4oO_nSWAZ5sAhsozXJaGvVWojQ>
 <xmx:ncGTYWoblY6O3lqjwvz4Z2pu5GCO7liaYoCPbOUo35ififLXTcwjOA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Nov 2021 09:35:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: Turn lvds.yaml into a generic schema
Date: Tue, 16 Nov 2021 15:35:02 +0100
Message-Id: <20211116143503.385807-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
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
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The lvds.yaml file so far was both defining the generic LVDS properties
(such as data-mapping) that could be used for any LVDS sink, but also
the panel-lvds binding.

That last binding was to describe LVDS panels simple enough, and had a
number of other bindings using it as a base to specialise it further.

However, this situation makes it fairly hard to extend and reuse both
the generic parts, and the panel-lvds itself.

Let's remove the panel-lvds parts and leave only the generic LVDS
properties.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../display/panel/advantech,idk-1110wr.yaml   | 17 ++++++++++-
 .../display/panel/innolux,ee101ia-01d.yaml    | 21 +++++++++++++-
 .../bindings/display/panel/lvds.yaml          | 29 +------------------
 .../display/panel/mitsubishi,aa104xd12.yaml   | 17 ++++++++++-
 .../display/panel/mitsubishi,aa121td01.yaml   | 17 ++++++++++-
 .../display/panel/sgd,gktw70sdae4se.yaml      | 17 ++++++++++-
 6 files changed, 85 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
index 93878c2cd370..f27cd2038636 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
@@ -11,13 +11,23 @@ maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
 
 allOf:
+  - $ref: panel-common.yaml#
   - $ref: lvds.yaml#
 
+select:
+  properties:
+    compatible:
+      contains:
+        const: advantech,idk-1110wr
+
+  required:
+    - compatible
+
 properties:
   compatible:
     items:
       - const: advantech,idk-1110wr
-      - {} # panel-lvds, but not listed here to avoid false select
+      - const: panel-lvds
 
   data-mapping:
     const: jeida-24
@@ -35,6 +45,11 @@ additionalProperties: false
 
 required:
   - compatible
+  - data-mapping
+  - width-mm
+  - height-mm
+  - panel-timing
+  - port
 
 examples:
   - |+
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
index a69681e724cb..6e06eecac14e 100644
--- a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
@@ -11,15 +11,26 @@ maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
 
 allOf:
+  - $ref: panel-common.yaml#
   - $ref: lvds.yaml#
 
+select:
+  properties:
+    compatible:
+      contains:
+        const: innolux,ee101ia-01d
+
+  required:
+    - compatible
+
 properties:
   compatible:
     items:
       - const: innolux,ee101ia-01d
-      - {} # panel-lvds, but not listed here to avoid false select
+      - const: panel-lvds
 
   backlight: true
+  data-mapping: true
   enable-gpios: true
   power-supply: true
   width-mm: true
@@ -27,5 +38,13 @@ properties:
   panel-timing: true
   port: true
 
+required:
+  - compatible
+  - data-mapping
+  - width-mm
+  - height-mm
+  - panel-timing
+  - port
+
 additionalProperties: false
 ...
diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index 49460c9dceea..5281a75c8bb5 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/panel/lvds.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LVDS Display Panel
+title: LVDS Display Common Properties
 
 maintainers:
   - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
@@ -26,18 +26,7 @@ description: |+
   Device compatible with those specifications have been marketed under the
   FPD-Link and FlatLink brands.
 
-allOf:
-  - $ref: panel-common.yaml#
-
 properties:
-  compatible:
-    contains:
-      const: panel-lvds
-    description:
-      Shall contain "panel-lvds" in addition to a mandatory panel-specific
-      compatible string defined in individual panel bindings. The "panel-lvds"
-      value shall never be used on its own.
-
   data-mapping:
     enum:
       - jeida-18
@@ -96,22 +85,6 @@ properties:
       If set, reverse the bit order described in the data mappings below on all
       data lanes, transmitting bits for slots 6 to 0 instead of 0 to 6.
 
-  port: true
-  ports: true
-
-required:
-  - compatible
-  - data-mapping
-  - width-mm
-  - height-mm
-  - panel-timing
-
-oneOf:
-  - required:
-      - port
-  - required:
-      - ports
-
 additionalProperties: true
 
 ...
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
index b5e7ee230fa6..e684b9771532 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
@@ -11,13 +11,23 @@ maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
 
 allOf:
+  - $ref: panel-common.yaml#
   - $ref: lvds.yaml#
 
+select:
+  properties:
+    compatible:
+      contains:
+        const: mitsubishi,aa104xd12
+
+  required:
+    - compatible
+
 properties:
   compatible:
     items:
       - const: mitsubishi,aa104xd12
-      - {} # panel-lvds, but not listed here to avoid false select
+      - const: panel-lvds
 
   vcc-supply:
     description: Reference to the regulator powering the panel VCC pins.
@@ -39,6 +49,11 @@ additionalProperties: false
 required:
   - compatible
   - vcc-supply
+  - data-mapping
+  - width-mm
+  - height-mm
+  - panel-timing
+  - port
 
 examples:
   - |+
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
index 977c50a85b67..c0df6ee89c7a 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
@@ -11,13 +11,23 @@ maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
 
 allOf:
+  - $ref: panel-common.yaml#
   - $ref: lvds.yaml#
 
+select:
+  properties:
+    compatible:
+      contains:
+        const: mitsubishi,aa121td01
+
+  required:
+    - compatible
+
 properties:
   compatible:
     items:
       - const: mitsubishi,aa121td01
-      - {} # panel-lvds, but not listed here to avoid false select
+      - const: panel-lvds
 
   vcc-supply:
     description: Reference to the regulator powering the panel VCC pins.
@@ -39,6 +49,11 @@ additionalProperties: false
 required:
   - compatible
   - vcc-supply
+  - data-mapping
+  - width-mm
+  - height-mm
+  - panel-timing
+  - port
 
 examples:
   - |+
diff --git a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
index e63a570ae59d..8bb85701e507 100644
--- a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
@@ -11,13 +11,23 @@ maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
 
 allOf:
+  - $ref: panel-common.yaml#
   - $ref: lvds.yaml#
 
+select:
+  properties:
+    compatible:
+      contains:
+        const: sgd,gktw70sdae4se
+
+  required:
+    - compatible
+
 properties:
   compatible:
     items:
       - const: sgd,gktw70sdae4se
-      - {} # panel-lvds, but not listed here to avoid false select
+      - const: panel-lvds
 
   data-mapping:
     const: jeida-18
@@ -35,6 +45,11 @@ additionalProperties: false
 
 required:
   - compatible
+  - port
+  - data-mapping
+  - width-mm
+  - height-mm
+  - panel-timing
 
 examples:
   - |+
-- 
2.33.1

