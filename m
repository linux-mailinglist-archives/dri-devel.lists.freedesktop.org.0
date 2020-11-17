Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972A2B6F8B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 21:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F2789E86;
	Tue, 17 Nov 2020 20:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8878889E86
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 20:05:25 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id d9so23962168oib.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 12:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TyLMFRDRgAWo88LVLT33NYA0xuWOtkbupfq0735gZww=;
 b=ZYVyo4RbGcwhx6Hr/+czk5yPXqcQ7nAhOX5JkHm100J/m+5gk32gloU5LD0M+XWpAe
 boBm4YtW2KrO5vNNXjSqxiwOelziqhngAc86Si1fm2P6TgC16NERbU2OxnVHkTxyqWQr
 vk6Y5L6eafrFRt9bFgEwH9GohY8kO7fRpl642a+ok+uR578cgvTzujSKiimFDICl6IA1
 3GxK/MpYelUrKOnDkrbUKASfgffz6/M86MQ+xmnFJGNpIoBWArIvH85g3Gfe8ZcRmmeM
 miE/dnpH6OGfuGTAbhh5Ecbws3MM1v1tBBbXPNtLl+qT86WT2rPqIWueG+vBJ8eMkxdr
 1rSw==
X-Gm-Message-State: AOAM530HJ5HEPO0CJmSw59ImRkDlrBBSfYfY/+m7ZdJrubSEJvzcApFb
 s6nrXhdwnjErFQtmkGhQE9FVTMEpvQ==
X-Google-Smtp-Source: ABdhPJy5x2o8jWWMaeb5ZgRgKL1Cv2cLbvuNjOe038T5mmGq70rXXrDyCFT4wz3yHwsW1jKJdMG6bQ==
X-Received: by 2002:aca:4a4e:: with SMTP id x75mr542883oia.45.1605643524125;
 Tue, 17 Nov 2020 12:05:24 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id s14sm6452538oij.4.2020.11.17.12.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 12:05:23 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] dt-bindings: display: Use OF graph schema
Date: Tue, 17 Nov 2020 14:05:22 -0600
Message-Id: <20201117200522.4000817-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have a graph schema, rework the display related schemas to use
it. Mostly this is adding a reference to graph.yaml and dropping duplicate
parts from schemas.

In panel-common.yaml, 'ports' is dropped. Any binding using 'ports'
should be one with more than 1 port node, and the binding must define
what each port is.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Drop 'type: object' where we have a $ref
 - Drop any common properties like 'reg', '#address-cells', "#size-cells',
   'remote-endpoint'
 - Keep description in ti,k2g-dss.yaml
---
 .../allwinner,sun4i-a10-display-backend.yaml  | 21 ++----
 .../allwinner,sun4i-a10-display-frontend.yaml | 17 +----
 .../display/allwinner,sun4i-a10-hdmi.yaml     | 17 +----
 .../display/allwinner,sun4i-a10-tcon.yaml     | 17 +----
 .../allwinner,sun4i-a10-tv-encoder.yaml       |  2 +-
 .../display/allwinner,sun6i-a31-drc.yaml      | 17 +----
 .../display/allwinner,sun6i-a31-mipi-dsi.yaml |  6 +-
 .../allwinner,sun8i-a83t-de2-mixer.yaml       | 17 +----
 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml | 17 +----
 .../display/allwinner,sun8i-r40-tcon-top.yaml | 68 ++----------------
 .../display/allwinner,sun9i-a80-deu.yaml      | 17 +----
 .../bindings/display/brcm,bcm2835-dpi.yaml    |  7 +-
 .../display/bridge/analogix,anx7625.yaml      |  6 +-
 .../display/bridge/analogix,anx7814.yaml      | 19 +----
 .../bindings/display/bridge/anx6345.yaml      | 16 ++---
 .../display/bridge/cdns,mhdp8546.yaml         | 19 +----
 .../display/bridge/chrontel,ch7033.yaml       |  6 +-
 .../display/bridge/intel,keembay-dsi.yaml     | 12 +---
 .../bindings/display/bridge/ite,it6505.yaml   |  2 +-
 .../display/bridge/lontium,lt9611.yaml        | 69 ++-----------------
 .../bindings/display/bridge/lvds-codec.yaml   | 16 +----
 .../bindings/display/bridge/nwl-dsi.yaml      | 34 ++-------
 .../bindings/display/bridge/ps8640.yaml       | 22 ++----
 .../bindings/display/bridge/renesas,lvds.yaml | 16 +----
 .../display/bridge/simple-bridge.yaml         | 16 +----
 .../display/bridge/snps,dw-mipi-dsi.yaml      |  6 +-
 .../display/bridge/thine,thc63lvd1024.yaml    | 17 +----
 .../bindings/display/bridge/ti,sn65dsi86.yaml | 41 ++---------
 .../bindings/display/bridge/ti,tfp410.yaml    | 16 +----
 .../display/bridge/toshiba,tc358762.yaml      | 52 ++------------
 .../display/bridge/toshiba,tc358768.yaml      | 44 ++----------
 .../display/bridge/toshiba,tc358775.yaml      | 18 ++---
 .../connector/analog-tv-connector.yaml        |  1 +
 .../display/connector/dvi-connector.yaml      |  1 +
 .../display/connector/hdmi-connector.yaml     |  1 +
 .../display/connector/vga-connector.yaml      |  1 +
 .../bindings/display/imx/nxp,imx8mq-dcss.yaml |  2 +-
 .../bindings/display/ingenic,lcd.yaml         |  8 +--
 .../display/intel,keembay-display.yaml        |  2 +-
 .../display/panel/advantech,idk-2121wr.yaml   | 15 ++--
 .../bindings/display/panel/panel-common.yaml  | 11 +--
 .../rockchip/rockchip,rk3066-hdmi.yaml        | 14 +---
 .../display/rockchip/rockchip-vop.yaml        |  5 +-
 .../bindings/display/st,stm32-dsi.yaml        | 16 ++---
 .../bindings/display/st,stm32-ltdc.yaml       |  8 +--
 .../bindings/display/ti/ti,am65x-dss.yaml     | 17 +----
 .../bindings/display/ti/ti,j721e-dss.yaml     | 19 +----
 .../bindings/display/ti/ti,k2g-dss.yaml       |  3 +-
 48 files changed, 134 insertions(+), 660 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml
index 86057d541065..122b0b7383aa 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml
@@ -84,35 +84,22 @@ properties:
     const: dma-mem
 
   ports:
-    type: object
-    description: |
-      A ports node with endpoint definitions as defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
-        description: |
+        description:
           Input endpoints of the controller.
 
       port@1:
-        type: object
-        description: |
+        description:
           Output endpoints of the controller.
 
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
index 3eb1c2bbf4e7..0b00e4c177ab 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
@@ -57,34 +57,21 @@ properties:
     maxItems: 1
 
   ports:
-    type: object
-    description: |
-      A ports node with endpoint definitions as defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
         description: |
           Input endpoints of the controller.
 
       port@1:
-        type: object
         description: |
           Output endpoints of the controller.
 
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml
index 75e6479397a5..9262659a3cb7 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml
@@ -76,36 +76,23 @@ properties:
       - const: audio-tx
 
   ports:
-    type: object
-    description: |
-      A ports node with endpoint definitions as defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
         description: |
           Input endpoints of the controller.
 
       port@1:
-        type: object
         description: |
           Output endpoints of the controller. Usually an HDMI
           connector.
 
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 4c15a2644a7c..176902cc9631 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -115,25 +115,14 @@ properties:
           - const: lvds
 
   ports:
-    type: object
-    description: |
-      A ports node with endpoint definitions as defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
         description: |
           Input endpoints of the controller.
 
       port@1:
-        type: object
         description: |
           Output endpoints of the controller.
 
@@ -159,12 +148,10 @@ properties:
             unevaluatedProperties: true
 
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
index 6009324be967..9885839df5eb 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
@@ -24,7 +24,7 @@ properties:
     maxItems: 1
 
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description:
       A port node with endpoint definitions as defined in
       Documentation/devicetree/bindings/media/video-interfaces.txt. The
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
index 0c1ce55940e1..41c379e4701f 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
@@ -46,35 +46,22 @@ properties:
     maxItems: 1
 
   ports:
-    type: object
-    description: |
-      A ports node with endpoint definitions as defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
         description: |
           Input endpoints of the controller.
 
       port@1:
-        type: object
         description: |
           Output endpoints of the controller.
 
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index 7aa330dabc44..a738d7c12a97 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -47,11 +47,9 @@ properties:
     const: dphy
 
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description:
-      A port node with endpoint definitions as defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt. That
-      port should be the input endpoint, usually coming from the
+      The port should be the input endpoint, usually coming from the
       associated TCON.
 
 required:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index c040eef56518..1fada61ff65e 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -43,34 +43,21 @@ properties:
     maxItems: 1
 
   ports:
-    type: object
-    description: |
-      A ports node with endpoint definitions as defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
         description: |
           Input endpoints of the controller.
 
       port@1:
-        type: object
         description: |
           Output endpoints of the controller.
 
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
index fa4769a0b26e..ad97fb0b2c63 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
@@ -93,37 +93,24 @@ properties:
       The VCC power supply of the controller
 
   ports:
-    type: object
-    description: |
-      A ports node with endpoint definitions as defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
         description: |
           Input endpoints of the controller. Usually the associated
           TCON.
 
       port@1:
-        type: object
         description: |
           Output endpoints of the controller. Usually an HDMI
           connector.
 
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index b98ca609824b..5f4aa0c626c3 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -80,39 +80,17 @@ properties:
     maxItems: 1
 
   ports:
-    type: object
-    description: |
-      A ports node with endpoint definitions as defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
-      All ports should have only one endpoint connected to
-      remote endpoint.
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
         description: |
           Input endpoint for Mixer 0 mux.
 
       port@1:
-        type: object
         description: |
           Output endpoint for Mixer 0 mux
 
-        properties:
-          "#address-cells":
-            const: 1
-
-          "#size-cells":
-            const: 0
-
-          reg: true
-
         patternProperties:
           "^endpoint@[0-9]$":
             type: object
@@ -125,31 +103,16 @@ properties:
             required:
               - reg
 
-        required:
-          - "#address-cells"
-          - "#size-cells"
-
-        additionalProperties: false
+        unevaluatedProperties: false
 
       port@2:
-        type: object
         description: |
           Input endpoint for Mixer 1 mux.
 
       port@3:
-        type: object
         description: |
           Output endpoint for Mixer 1 mux
 
-        properties:
-          "#address-cells":
-            const: 1
-
-          "#size-cells":
-            const: 0
-
-          reg: true
-
         patternProperties:
           "^endpoint@[0-9]$":
             type: object
@@ -162,26 +125,12 @@ properties:
             required:
               - reg
 
-        required:
-          - "#address-cells"
-          - "#size-cells"
-
-        additionalProperties: false
+        unevaluatedProperties: false
 
       port@4:
-        type: object
         description: |
           Input endpoint for HDMI mux.
 
-        properties:
-          "#address-cells":
-            const: 1
-
-          "#size-cells":
-            const: 0
-
-          reg: true
-
         patternProperties:
           "^endpoint@[0-9]$":
             type: object
@@ -194,26 +143,19 @@ properties:
             required:
               - reg
 
-        required:
-          - "#address-cells"
-          - "#size-cells"
-
-        additionalProperties: false
+        unevaluatedProperties: false
 
       port@5:
-        type: object
         description: |
           Output endpoint for HDMI mux
 
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@1
       - port@4
       - port@5
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - "#clock-cells"
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml b/Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml
index 96de41d32b3e..261c6ab20f28 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml
@@ -40,35 +40,22 @@ properties:
     maxItems: 1
 
   ports:
-    type: object
-    description: |
-      A ports node with endpoint definitions as defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
         description: |
           Input endpoints of the controller.
 
       port@1:
-        type: object
         description: |
           Output endpoints of the controller.
 
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
index 5c1024bbc1b3..c9ad0ecc9b6d 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
@@ -27,10 +27,9 @@ properties:
       - const: pixel
 
   port:
-    type: object
-    description: >
-      Port node with a single endpoint connecting to the panel, as
-      defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Port node with a single endpoint connecting to the panel.
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 60585a4fc22b..de9c7bcce9a7 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -35,16 +35,14 @@ properties:
     maxItems: 1
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
-        type: object
         description:
           Video port for MIPI DSI input.
 
       port@1:
-        type: object
         description:
           Video port for panel or connector.
 
@@ -52,6 +50,8 @@ properties:
         - port@0
         - port@1
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
index 3ba477aefdd7..c1a46350a154 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
@@ -42,35 +42,22 @@ properties:
     description: Regulator for 1.0V digital core power.
 
   ports:
-    type: object
-    description:
-      A node containing input and output port nodes with endpoint
-      definitions as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
-      Documentation/devicetree/bindings/graph.txt
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
-        type: object
         description: Video port for HDMI input.
 
-        properties:
-          reg:
-            const: 0
-
       port@1:
-        type: object
         description:
           Video port for SlimPort, DisplayPort, eDP or MyDP output.
 
-        properties:
-          reg:
-            const: 1
-
     required:
       - port@0
       - port@1
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
index 8c0e4f285fbc..e4c8b924e851 100644
--- a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
@@ -34,30 +34,22 @@ properties:
     description: Regulator for 2.5V digital core power.
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
-
       port@0:
-        type: object
-        description: |
+        description:
           Video port for LVTTL input
 
       port@1:
-        type: object
-        description: |
+        description:
           Video port for eDP output (panel or connector).
           May be omitted if EDID works reliably.
 
     required:
       - port@0
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index 74d675fc6e7b..69b70bed82b2 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -57,47 +57,34 @@ properties:
     maxItems: 1
 
   ports:
-    type: object
-    description:
-      Ports as described in Documentation/devicetree/bindings/graph.txt.
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
-
       port@0:
-        type: object
         description:
           First input port representing the DP bridge input.
 
       port@1:
-        type: object
         description:
           Second input port representing the DP bridge input.
 
       port@2:
-        type: object
         description:
           Third input port representing the DP bridge input.
 
       port@3:
-        type: object
         description:
           Fourth input port representing the DP bridge input.
 
       port@4:
-        type: object
         description:
           Output port representing the DP bridge output.
 
     required:
       - port@0
       - port@4
-      - '#address-cells'
-      - '#size-cells'
+
+    unevaluatedProperties: false
 
 allOf:
   - if:
diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
index 9f38f55fc990..a634f8368cda 100644
--- a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
@@ -19,16 +19,14 @@ properties:
     description: I2C address of the device
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
-        type: object
         description: |
           Video port for RGB input.
 
       port@1:
-        type: object
         description: |
           DVI port, should be connected to a node compatible with the
           dvi-connector binding.
@@ -37,6 +35,8 @@ properties:
       - port@0
       - port@1
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
index ab5be2625224..ed118dd7b29f 100644
--- a/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
@@ -35,28 +35,20 @@ properties:
       - const: clk_mipi_cfg
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      '#address-cells':
-       const: 1
-
-      '#size-cells':
-       const: 0
-
       port@0:
-        type: object
         description: MIPI DSI input port.
 
       port@1:
-        type: object
         description: DSI output port.
 
     required:
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index efbb3d0117dc..eedf8b7f5173 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -55,7 +55,7 @@ properties:
     description: extcon specifier for the Power Delivery
 
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description: A port node pointing to DPI host port node
 
 required:
diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index 7a1c89b995e2..e2d4f13efd46 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -38,85 +38,28 @@ properties:
     description: Regulator for 3.3V IO power.
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
-        description: |
+        description:
           Primary MIPI port-1 for MIPI input
 
-        properties:
-          reg:
-            const: 0
-
-        patternProperties:
-          "^endpoint(@[0-9])$":
-            type: object
-            additionalProperties: false
-
-            properties:
-              remote-endpoint:
-                $ref: /schemas/types.yaml#/definitions/phandle
-
-        required:
-          - reg
-
       port@1:
-        type: object
-        description: |
+        description:
           Additional MIPI port-2 for MIPI input, used in combination
           with primary MIPI port-1 to drive higher resolution displays
 
-        properties:
-          reg:
-            const: 1
-
-        patternProperties:
-          "^endpoint(@[0-9])$":
-            type: object
-            additionalProperties: false
-
-            properties:
-              remote-endpoint:
-                $ref: /schemas/types.yaml#/definitions/phandle
-
-        required:
-          - reg
-
       port@2:
-        type: object
-        description: |
+        description:
           HDMI port for HDMI output
 
-        properties:
-          reg:
-            const: 2
-
-        patternProperties:
-          "^endpoint(@[0-9])$":
-            type: object
-            additionalProperties: false
-
-            properties:
-              remote-endpoint:
-                $ref: /schemas/types.yaml#/definitions/phandle
-
-        required:
-          - reg
-
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@2
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index e5e3c72630cf..e3b66f192a8d 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -45,25 +45,15 @@ properties:
           - thine,thc63lvdm83d # For the THC63LVDM83D LVDS serializer
 
   ports:
-    type: object
-    description: |
-      This device has two video ports. Their connections are modeled using the
-      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt
-    properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
+    $ref: /schemas/graph.yaml#/properties/ports
 
+    properties:
       port@0:
-        type: object
         description: |
           For LVDS encoders, port 0 is the parallel input
           For LVDS decoders, port 0 is the LVDS input
 
       port@1:
-        type: object
         description: |
           For LVDS encoders, port 1 is the LVDS output
           For LVDS decoders, port 1 is the parallel output
@@ -72,7 +62,7 @@ properties:
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
   powerdown-gpios:
     description:
diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
index a125b2dd3a2f..626a94b826ee 100644
--- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
@@ -84,11 +84,8 @@ properties:
       - const: pclk
 
   ports:
-    type: object
-    description:
-      A node containing DSI input & output port nodes with endpoint
-      definitions as documented in
-      Documentation/devicetree/bindings/graph.txt.
+    $ref: /schemas/graph.yaml#/properties/ports
+
     properties:
       port@0:
         type: object
@@ -97,12 +94,6 @@ properties:
           display controller. Exactly one endpoint must be
           specified.
         properties:
-          '#address-cells':
-            const: 1
-
-          '#size-cells':
-            const: 0
-
           endpoint@0:
             description: sub-node describing the input from LCDIF
             type: object
@@ -111,41 +102,24 @@ properties:
             description: sub-node describing the input from DCSS
             type: object
 
-          reg:
-            const: 0
-
-        required:
-          - '#address-cells'
-          - '#size-cells'
-          - reg
-
         oneOf:
           - required:
               - endpoint@0
           - required:
               - endpoint@1
 
-        additionalProperties: false
+        unevaluatedProperties: false
 
       port@1:
-        type: object
         description:
           DSI output port node to the panel or the next bridge
           in the chain
 
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
-
     required:
-      - '#address-cells'
-      - '#size-cells'
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - '#address-cells'
diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
index 7e27cfcf770d..24d320a19172 100644
--- a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
@@ -43,33 +43,21 @@ properties:
     description: Regulator for 3.3V digital core power.
 
   ports:
-    type: object
-    description:
-      A node containing DSI input & output port nodes with endpoint
-      definitions as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
-      Documentation/devicetree/bindings/graph.txt
-    properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
+    $ref: /schemas/graph.yaml#/properties/ports
 
+    properties:
       port@0:
-        type: object
-        description: |
+        description:
           Video port for DSI input
 
       port@1:
-        type: object
-        description: |
+        description:
           Video port for eDP output (panel or connector).
 
     required:
       - port@0
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
index e5b163951b91..dd6f394fb3e1 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
@@ -49,32 +49,20 @@ properties:
     maxItems: 1
 
   ports:
-    type: object
-    description: |
-      This device has two video ports. Their connections are modelled using the
-      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-      Each port shall have a single endpoint.
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
-
       port@0:
-        type: object
         description: Parallel RGB input port
 
       port@1:
-        type: object
         description: LVDS output port
 
     required:
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
   power-domains:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 3ddb35fcf0a2..6419ec632025 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -30,30 +30,20 @@ properties:
           - ti,ths8135
 
   ports:
-    type: object
-    description: |
-      This device has two video ports. Their connections are modeled using the
-      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-    properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
+    $ref: /schemas/graph.yaml#/properties/ports
 
+    properties:
       port@0:
-        type: object
         description: The bridge input
 
       port@1:
-        type: object
         description: The bridge output
 
     required:
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
   enable-gpios:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
index e42cb610f545..94802014219c 100644
--- a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
@@ -47,20 +47,20 @@ properties:
     const: apb
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
-        type: object
         description: Input node to receive pixel data.
       port@1:
-        type: object
         description: DSI output node to panel.
 
     required:
       - port@0
       - port@1
 
+    unevaluatedProperties: false
+
 required:
   - clock-names
   - clocks
diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
index 469ac4a34273..6e2155bcd6ac 100644
--- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
@@ -25,11 +25,8 @@ properties:
     const: thine,thc63lvd1024
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
     description: |
-      This device has four video ports. Their connections are modeled using the
-      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-
       The device can operate in single-link mode or dual-link mode. In
       single-link mode, all pixels are received on port@0, and port@1 shall not
       contain any endpoint. In dual-link mode, even-numbered pixels are
@@ -37,33 +34,23 @@ properties:
       port@1 shall contain endpoints.
 
     properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
-
       port@0:
-        type: object
         description: First LVDS input port
 
       port@1:
-        type: object
         description: Second LVDS input port
 
       port@2:
-        type: object
         description: First digital CMOS/TTL parallel output
 
       port@3:
-        type: object
         description: Second digital CMOS/TTL parallel output
 
     required:
       - port@0
       - port@2
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
   oe-gpios:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index f8622bd0f61e..b44677258c3a 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -71,54 +71,24 @@ properties:
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
   ports:
-    type: object
-    additionalProperties: false
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
-        additionalProperties: false
-
         description:
           Video port for MIPI DSI input
 
-        properties:
-          reg:
-            const: 0
-
-          endpoint:
-            type: object
-            additionalProperties: false
-            properties:
-              remote-endpoint: true
-
-        required:
-          - reg
-
       port@1:
         type: object
-        additionalProperties: false
-
         description:
           Video port for eDP output (panel or connector).
 
         properties:
-          reg:
-            const: 1
-
           endpoint:
             type: object
-            additionalProperties: false
+            unevaluatedProperties: false
 
             properties:
-              remote-endpoint: true
-
               data-lanes:
                 oneOf:
                   - minItems: 1
@@ -171,15 +141,12 @@ properties:
             dependencies:
               lane-polarities: [data-lanes]
 
-        required:
-          - reg
-
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@1
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
index 605831c1e836..7586aeca2fea 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
@@ -31,11 +31,7 @@ properties:
     maximum: 7
 
   ports:
-    description:
-      A node containing input and output port nodes with endpoint
-      definitions as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
@@ -68,19 +64,13 @@ properties:
 
       port@1:
         description: DVI output port.
-        type: object
-
-        properties:
-          reg:
-            const: 1
-
-          endpoint:
-            type: object
 
     required:
       - port@0
       - port@1
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - ports
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
index 195025e6803c..20fad04e4825 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
@@ -25,65 +25,23 @@ properties:
     description: Regulator for 1.2V internal core power.
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
-        additionalProperties: false
-
-        description: |
+        description:
           Video port for MIPI DSI input
 
-        properties:
-          reg:
-            const: 0
-
-        patternProperties:
-          endpoint:
-            type: object
-            additionalProperties: false
-
-            properties:
-              remote-endpoint: true
-
-        required:
-          - reg
-
       port@1:
-        type: object
-        additionalProperties: false
-
-        description: |
+        description:
           Video port for MIPI DPI output (panel or connector).
 
-        properties:
-          reg:
-            const: 1
-
-        patternProperties:
-          endpoint:
-            type: object
-            additionalProperties: false
-
-            properties:
-              remote-endpoint: true
-
-        required:
-          - reg
-
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@1
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
index c036a75db8f7..836ac6a8411f 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
@@ -42,68 +42,35 @@ properties:
     const: refclk
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
         type: object
-        additionalProperties: false
+        unevaluatedProperties: false
 
         description: |
           Video port for RGB input
 
         properties:
-          reg:
-            const: 0
-
-        patternProperties:
           endpoint:
             type: object
-            additionalProperties: false
+            unevaluatedProperties: false
 
             properties:
               data-lines:
                 enum: [ 16, 18, 24 ]
 
-              remote-endpoint: true
-
-        required:
-          - reg
-
       port@1:
-        type: object
-        additionalProperties: false
-
         description: |
           Video port for DSI output (panel or connector).
 
-        properties:
-          reg:
-            const: 1
-
-        patternProperties:
-          endpoint:
-            type: object
-            additionalProperties: false
-
-            properties:
-              remote-endpoint: true
-
-        required:
-          - reg
-
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@1
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -156,4 +123,3 @@ examples:
         };
       };
     };
-    
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
index fd3113aa9ccd..128527ac5fbf 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
@@ -44,31 +44,19 @@ properties:
     description: Hardware reset, Low active
 
   ports:
-    type: object
-    description:
-      A node containing input and output port nodes with endpoint definitions
-      as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
-    properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
+    $ref: /schemas/graph.yaml#/properties/ports
 
+    properties:
       port@0:
-        type: object
         description: |
           DSI Input. The remote endpoint phandle should be a
           reference to a valid mipi_dsi_host device node.
 
       port@1:
-        type: object
         description: |
           Video port for LVDS output (panel or connector).
 
       port@2:
-        type: object
         description: |
           Video port for Dual link LVDS output (panel or connector).
 
@@ -76,6 +64,8 @@ properties:
       - port@0
       - port@1
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
index eebe88fed999..a31ca2d52b86 100644
--- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
@@ -25,6 +25,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
 
   port:
+    $ref: /schemas/graph.yaml#/properties/port
     description: Connection to controller providing analog TV signals
 
 required:
diff --git a/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml b/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
index 71cb9220fa59..93eb14294e68 100644
--- a/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
@@ -36,6 +36,7 @@ properties:
     description: the connector has pins for DVI dual-link
 
   port:
+    $ref: /schemas/graph.yaml#/properties/port
     description: Connection to controller providing DVI signals
 
 required:
diff --git a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
index 14d7128af592..83c0d008265b 100644
--- a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
@@ -37,6 +37,7 @@ properties:
     maxItems: 1
 
   port:
+    $ref: /schemas/graph.yaml#/properties/port
     description: Connection to controller providing HDMI signals
 
 required:
diff --git a/Documentation/devicetree/bindings/display/connector/vga-connector.yaml b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
index 5782c4bb3252..25f868002000 100644
--- a/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
@@ -20,6 +20,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
 
   port:
+    $ref: /schemas/graph.yaml#/properties/port
     description: Connection to controller providing VGA signals
 
 required:
diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
index f1f25aa794d9..0091df9dd73b 100644
--- a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
@@ -74,7 +74,7 @@ properties:
       - description: Must be 400 MHz
 
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description:
       A port node pointing to the input port of a HDMI/DP or MIPI display bridge.
 
diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
index 768050f30dba..a27718890137 100644
--- a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
+++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
@@ -39,18 +39,16 @@ properties:
     minItems: 1
 
   port:
-    description: OF graph bindings (specified in bindings/graph.txt).
+    $ref: /schemas/graph.yaml#/properties/port
 
   ports:
-    description: OF graph bindings (specified in bindings/graph.txt).
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
+
     properties:
       port@0:
-        type: object
         description: DPI output, to interface with TFT panels.
 
       port@8:
-        type: object
         description: Link to the Image Processing Unit (IPU).
           (See ingenic,ipu.yaml).
 
diff --git a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
index 0a697d45c2ad..bc6622b010ca 100644
--- a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
+++ b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
@@ -36,7 +36,7 @@ properties:
     maxItems: 1
 
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description: Display output node to DSI.
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
index 6b7fddc80c41..16097ffa4132 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
@@ -37,34 +37,31 @@ properties:
   panel-timing: true
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
+
     properties:
       port@0:
         type: object
         description: The sink for odd pixels.
         properties:
-          reg:
-            const: 0
-
           dual-lvds-odd-pixels: true
 
         required:
-          - reg
           - dual-lvds-odd-pixels
 
       port@1:
         type: object
         description: The sink for even pixels.
         properties:
-          reg:
-            const: 1
-
           dual-lvds-even-pixels: true
 
         required:
-          - reg
           - dual-lvds-even-pixels
 
+    required:
+      - port@0
+      - port@1
+
 additionalProperties: false
 
 required:
diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index cd6dc5461721..5b38dc89cb21 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -68,16 +68,7 @@ properties:
 
   # Connectivity
   port:
-    type: object
-
-  ports:
-    type: object
-    description:
-      Panels receive video data through one or multiple connections. While
-      the nature of those connections is specific to the panel type, the
-      connectivity is expressed in a standard fashion using ports as specified
-      in the device graph bindings defined in
-      Documentation/devicetree/bindings/graph.txt.
+    $ref: /schemas/graph.yaml#/properties/port
 
   ddc-i2c-bus:
     $ref: /schemas/types.yaml#/definitions/phandle
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
index 4110d003ce1f..188a83aef018 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
@@ -43,33 +43,23 @@ properties:
       This soc uses GRF regs to switch the HDMI TX input between vop0 and vop1.
 
   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
         description:
           Port node with two endpoints, numbered 0 and 1,
           connected respectively to vop0 and vop1.
 
       port@1:
-        type: object
         description:
           Port node with one endpoint connected to a hdmi-connector node.
 
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
       - port@1
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
index ed8148e26e24..6f43d885c9b3 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
@@ -70,10 +70,7 @@ properties:
       - const: dclk
 
   port:
-    type: object
-    description:
-      A port node with endpoint definitions as defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/port
 
   assigned-clocks:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
index 327a14d85df8..c4c280a3c367 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
@@ -51,23 +51,23 @@ properties:
       Phandle of the regulator that provides the supply voltage.
 
   ports:
-    type: object
-    description:
-      A node containing DSI input & output port nodes with endpoint
-      definitions as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
-      Documentation/devicetree/bindings/graph.txt
+    $ref: /schemas/graph.yaml#/properties/ports
+
     properties:
       port@0:
-        type: object
         description:
           DSI input port node, connected to the ltdc rgb output port.
 
       port@1:
-        type: object
         description:
           DSI output port node, connected to a panel or a bridge input port"
 
+    required:
+      - port@0
+      - port@1
+
+    unevaluatedProperties: false
+
 required:
   - "#address-cells"
   - "#size-cells"
diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
index bf8ad916e9b0..d54f9ca207af 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
@@ -35,15 +35,13 @@ properties:
     maxItems: 1
 
   port:
-    type: object
-    description:
-      "Video port for DPI RGB output.
+    $ref: /schemas/graph.yaml#/properties/port
+    description: |
+      Video port for DPI RGB output.
       ltdc has one video port with up to 2 endpoints:
       - for external dpi rgb panel or bridge, using gpios.
       - for internal dpi input of the MIPI DSI host controller.
       Note: These 2 endpoints cannot be activated simultaneously.
-      Please refer to the bindings defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt."
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 4dc30738ee57..646588b0f1b3 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -74,29 +74,18 @@ properties:
     type: boolean
 
   ports:
-    type: object
-    description:
-      Ports as described in Documentation/devicetree/bindings/graph.txt
-    properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
+    $ref: /schemas/graph.yaml#/properties/ports
 
+    properties:
       port@0:
-        type: object
         description:
           The DSS OLDI output port node form video port 1
 
       port@1:
-        type: object
         description:
           The DSS DPI output port node from video port 2
 
-    required:
-      - "#address-cells"
-      - "#size-cells"
+    unevaluatedProperties: false
 
   ti,am65x-oldi-io-ctrl:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
index c9a947d55fa4..c1a7e1581476 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
@@ -107,39 +107,26 @@ properties:
     type: boolean
 
   ports:
-    type: object
-    description:
-      Ports as described in Documentation/devicetree/bindings/graph.txt
-    properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
+    $ref: /schemas/graph.yaml#/properties/ports
 
+    properties:
       port@0:
-        type: object
         description:
           The output port node form video port 1
 
       port@1:
-        type: object
         description:
           The output port node from video port 2
 
       port@2:
-        type: object
         description:
           The output port node from video port 3
 
       port@3:
-        type: object
         description:
           The output port node from video port 4
 
-    required:
-      - "#address-cells"
-      - "#size-cells"
+    unevaluatedProperties: false
 
   max-memory-bandwidth:
     $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
index 8f87b82c6695..7ce7bbad5780 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
@@ -54,9 +54,8 @@ properties:
     description: phandle to the associated power domain
 
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description:
-      Port as described in Documentation/devicetree/bindings/graph.txt.
       The DSS DPI output port node
 
   max-memory-bandwidth:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
