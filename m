Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A68A478C3F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539D410E665;
	Fri, 17 Dec 2021 13:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7E210E682
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 13:25:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BE860580152;
 Fri, 17 Dec 2021 08:25:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 17 Dec 2021 08:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=uIpc+Ec7jMWku5yF1l05fqgc4Y
 WtebFf904nCRvnCXc=; b=GTQsnOPmc1z5YjHlTWa3vGJK3yTFAUHk98469voK1k
 jveip2t10e2nMoMDP64D7t020dro2uBST49m0Ijkj1632cAKXLfgw4Oasr4JPB5Z
 rT8639e/QwKIcd9T2v9oQeTDndq4MoOjFQULzXQVjpsyDuP2jM1K1SMjhSpIfeTg
 gdwG1xJgv6m2aKLq8k5IU7urEQhcNILH32tF4/yuZXBuVOvb/ssVitWfu52yMdWw
 BmsZ6cmnOQYJkRiMACXbUu/2gRP55GGqdyJbcmigw8dqlB5kZl/P7E8t+zzsT8Fr
 +mly8SYbgVAA8zqP2bxKOZbuie56qrj+GhZnOMn4GU/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uIpc+Ec7jMWku5yF1
 l05fqgc4YWtebFf904nCRvnCXc=; b=ko3/VYHhUNIlhR5o2o+o2GP0zxEyga1a+
 T1aiMTkjGkakQfP3VvF7JrsOVwlzqFx/yK8AGjgdXJncwaJ1kNoNOnNsFt2NsAW8
 aryJQcHUHpf8kRv4+x7NaMByo79rVLvHfBZcZLGteyoAwthoacgkjFYAwmpIsdUJ
 7txgR2bUBI/4Tl7yRrGMIKXJZoDNAwm2h7WaJMxwxWY97TBvanANtxrJkg7xyph1
 d6BPrzgz1FK0tzCrsV7AG3uuc77jVIdZ0mekFlqAjF+JqVW93qqD25KPccnuxOkH
 QIFJMTlJKeY5tqSK+gW/zWvl4DWgHZvRcCVYcozjVqaDFha8QouEQ==
X-ME-Sender: <xms:sY-8YYsBMB2DxqBIYQ3CrgHCXTDbvBT77kN8axIJEFRmd05x1R51tg>
 <xme:sY-8YVem7czae9NyqN8MVTzjIr9KZL6rTfj4OHPNfOfnd1lj0Jf830COfaVH4GR3t
 zNdjaRRaBk_kSp2FgY>
X-ME-Received: <xmr:sY-8YTxVNoZCKH0dCc2U0PdxUlBY-vZfbB5DPRgywMM2c7n0lqrWjBIItVtTcroPYJ-O9sZemwEmiBEiQZF84Zhw-vjDsYgKFBhxzLs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffoggfg
 sedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimh
 gvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhephffhhfevtddthefgieei
 geffudehkefgtdeufedvtdduheduieekvddvfedvkeetnecuffhomhgrihhnpeguvghvih
 gtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sY-8YbOe6dVGo7_dx0AZYH5r9i0E4cKBCXmeGbRaEKPj8Go5hW6qhw>
 <xmx:sY-8YY8oVby1-Vl4EAcKlqRArHlhQmPZl0dV7NwgctkgZctakuYyhw>
 <xmx:sY-8YTVbbZk7WH540FB4MDT6GJx2csgZq8ystiCPiLw7lUk9jFU5HA>
 <xmx:so-8YTbSv0n-GZs0oN4PknUbWSAciZncjBpH58ZMEg5HHifMgpTwVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:25:05 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: display: Turn lvds.yaml into a generic
 schema
Date: Fri, 17 Dec 2021 14:25:01 +0100
Message-Id: <20211217132502.95880-1-maxime@cerno.tech>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Moved the schema out of panel
---
 .../bindings/display/{panel => }/lvds.yaml    | 31 ++-----------------
 .../display/panel/advantech,idk-1110wr.yaml   | 19 ++++++++++--
 .../display/panel/innolux,ee101ia-01d.yaml    | 23 ++++++++++++--
 .../display/panel/mitsubishi,aa104xd12.yaml   | 19 ++++++++++--
 .../display/panel/mitsubishi,aa121td01.yaml   | 19 ++++++++++--
 .../display/panel/sgd,gktw70sdae4se.yaml      | 19 ++++++++++--
 6 files changed, 91 insertions(+), 39 deletions(-)
 rename Documentation/devicetree/bindings/display/{panel => }/lvds.yaml (86%)

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/lvds.yaml
similarity index 86%
rename from Documentation/devicetree/bindings/display/panel/lvds.yaml
rename to Documentation/devicetree/bindings/display/lvds.yaml
index 49460c9dceea..55751402fb13 100644
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
-- 
2.33.1

