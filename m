Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A3149E4A2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014F710E5CF;
	Thu, 27 Jan 2022 14:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A7E10E5CF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 14:30:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E831E5804CD;
 Thu, 27 Jan 2022 09:30:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 27 Jan 2022 09:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=uViCFTZYRvadlAALRyk9WkXYS+f4cerG3geMv8
 9Zk5E=; b=Ol717whbmGJPiLIbzHYmN9unbOFvHVltkvBowaGdNaS8MYWVqmcJdG
 Lon6ThRtxNw4ydNWXndIEJs0dDThzph3n0y5PHvaLPMCxlXPD0PrUuybyVLq9gDR
 T2oJKfIjL5dF9oxdrT0LcBzzJyjOFqc8HJJJ8M63wJlY3rQq9x/k0JLFDLInc1Ee
 sZapqbcZEQOFrX62MN29zpwxR60NspjLGsIcffK2ECAernSNFi96VSC0HVK4dCGz
 dhkT0VBBURFjEmrJPtsGFh41Ppwlt5mjWcKZpblo0OMpgP606oBwnejtkfqRMou1
 ghU5EJTOb+4BONR/3kL3fXzxVGlfyHFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uViCFT
 ZYRvadlAALRyk9WkXYS+f4cerG3geMv89Zk5E=; b=AJcI+LkX4Wc4ticRyErnBV
 TenHbEcKi8lGMoCTuF4+4qSnOMq70WE9Fdvjk4utRgnuHA60G3l8qGnVRe5IMV8F
 kjWxu/um5xcie2fMsmDBhEdSgVkBLfLuv6G8z9RkvrVj0vVF2OFMZ3qfcqY1CGmc
 dRjRVd+lhpBaG7gKHHPW10QQkkVMhdxf7CaLRbKT/SsCYXeVUNYdr9+drgQ9wYrC
 5BIHFYiqn2ttyCRJTVkKAtUarYqHNoa0EQaVvXCCxp7KqurPPL8XulAXK2xKNCAK
 uwlvRXw0KSfQlFpkRd73IohGWk+wAoyyUwVZpIF18CuYbKiyW0SnXO86qm57V1hw
 ==
X-ME-Sender: <xms:mKzyYVMaVOy7CuN1XPddHx_e66MJFrEx6Y63-rNumInVap5QYiDE0g>
 <xme:mKzyYX_j77WAK7tNP5gtTBoC2KR_Kn9Ox-imtlJsqTB-R5QgS9A5guXPWBHGcC8Hc
 IHim90WnUK4zxjBhvc>
X-ME-Received: <xmr:mKzyYURP_M82UnVTh5Ox2V4lGEmAnX60cjUxLv71czCJ1BnXRznibinuU5NHLECuGaE3iEuOJoSgR9FBOqEWJyLe1148IRGOJ1ivU7M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepveeuuddugeevveduledutddtiefffffgveevhfffieefkeejiedtgeffiedvffev
 necuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpfhhrvggvuggvshhkthhoph
 drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mKzyYRtEOI3F1hmlD70GHHD3R0Zoml9jvRW1HHXbygnY8TYlZ_5njw>
 <xmx:mKzyYdcFTR2HypKYRWiJuc0nZv-5rZpVZzhoJ5gCPUZQJVQkNOTflg>
 <xmx:mKzyYd1CJQKWY98qdoI3dM6B7SGy1dDX61wfMvQ3Y05wKN3Xv4QLYw>
 <xmx:mKzyYZ6hImUs0gRKZgesv01jGb47grGg1rYsCJsXS9WjcsXJjc5DOA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 09:30:47 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: display: Turn lvds.yaml into a generic
 schema
Date: Thu, 27 Jan 2022 15:30:44 +0100
Message-Id: <20220127143045.310199-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v3:
  - Adjust documentation a bit

Changes from v2:
  - Fix references to that file

Changes from v1:
  - Moved the schema out of panel
---
 .../bindings/display/bridge/lvds-codec.yaml   |  2 +-
 .../bindings/display/{panel => }/lvds.yaml    | 35 +++----------------
 .../display/panel/advantech,idk-1110wr.yaml   | 19 ++++++++--
 .../display/panel/innolux,ee101ia-01d.yaml    | 23 ++++++++++--
 .../display/panel/mitsubishi,aa104xd12.yaml   | 19 ++++++++--
 .../display/panel/mitsubishi,aa121td01.yaml   | 19 ++++++++--
 .../display/panel/sgd,gktw70sdae4se.yaml      | 19 ++++++++--
 MAINTAINERS                                   |  2 +-
 8 files changed, 95 insertions(+), 43 deletions(-)
 rename Documentation/devicetree/bindings/display/{panel => }/lvds.yaml (84%)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 5079c1cc337b..27b905b81b12 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -67,7 +67,7 @@ properties:
                   - vesa-24
                 description: |
                   The color signals mapping order. See details in
-                  Documentation/devicetree/bindings/display/panel/lvds.yaml
+                  Documentation/devicetree/bindings/display/lvds.yaml
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/lvds.yaml
similarity index 84%
rename from Documentation/devicetree/bindings/display/panel/lvds.yaml
rename to Documentation/devicetree/bindings/display/lvds.yaml
index 49460c9dceea..7cd2ce7e9c33 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/lvds.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/panel/lvds.yaml#
+$id: http://devicetree.org/schemas/display/lvds.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LVDS Display Panel
+title: LVDS Display Common Properties
 
 maintainers:
   - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
@@ -13,8 +13,8 @@ maintainers:
 description: |+
   LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
   incompatible data link layers have been used over time to transmit image data
-  to LVDS panels. This bindings supports display panels compatible with the
-  following specifications.
+  to LVDS devices. This bindings supports devices compatible with the following
+  specifications.
 
   [JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
   1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
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
diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
index 93878c2cd370..3a8c2c11f9bd 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
@@ -11,13 +11,23 @@ maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
 
 allOf:
-  - $ref: lvds.yaml#
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/display/lvds.yaml/#
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: advantech,idk-1110wr
+
+  required:
+    - compatible
 
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
index a69681e724cb..566e11f6bfc0 100644
--- a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
@@ -11,15 +11,26 @@ maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
 
 allOf:
-  - $ref: lvds.yaml#
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/display/lvds.yaml/#
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: innolux,ee101ia-01d
+
+  required:
+    - compatible
 
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
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
index b5e7ee230fa6..5cf3c588f46d 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
@@ -11,13 +11,23 @@ maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
 
 allOf:
-  - $ref: lvds.yaml#
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/display/lvds.yaml/#
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: mitsubishi,aa104xd12
+
+  required:
+    - compatible
 
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
index 977c50a85b67..54750cc5440d 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
@@ -11,13 +11,23 @@ maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
 
 allOf:
-  - $ref: lvds.yaml#
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/display/lvds.yaml/#
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: mitsubishi,aa121td01
+
+  required:
+    - compatible
 
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
index e63a570ae59d..44e02decdf3a 100644
--- a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
@@ -11,13 +11,23 @@ maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
 
 allOf:
-  - $ref: lvds.yaml#
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/display/lvds.yaml/#
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: sgd,gktw70sdae4se
+
+  required:
+    - compatible
 
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
diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..3f679974e3fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6076,7 +6076,7 @@ L:	dri-devel@lists.freedesktop.org
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-lvds.c
-F:	Documentation/devicetree/bindings/display/panel/lvds.yaml
+F:	Documentation/devicetree/bindings/display/lvds.yaml
 
 DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
 M:	Guido Günther <agx@sigxcpu.org>
-- 
2.34.1

