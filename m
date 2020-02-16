Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAFB16053B
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 19:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D445E6E107;
	Sun, 16 Feb 2020 18:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6825E6E107
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 18:15:36 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q8so16165425ljj.11
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 10:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z1FS8LRkofyBHE69m1Zyhg/WI9Rx8nKgyKT0srC+cRo=;
 b=qMH1yGMxnCKf2wH9KEXgnVlplNDlwcNW8UjPMMuxLoMRJId7YEwuO5/GrebUE8S+FH
 Sulh5RCJXkyD00QMCbqYPWO52rjCXUPi/jl9orH33edagfA6DAOTn6wsLYiG+XduCji8
 aoNtZk0tDrzyzuS1+JsmMdhSlMHnmJoZ40KHbtmx2G1XznVZ6NG72oZKY3qnrK/j+PLE
 HhpxIZNq2DUiFM+2jNwfATIABI8tQv7BOPLUFC5PlFcO02yjsWibyzk+dkYGk/OYTPr4
 shSY3YmGo4zkHReFAz4+5tAvMM7P5mm1Sl5peLTFNwUPQBDmRLY+ucQPhoHzrsy3o6R1
 zTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z1FS8LRkofyBHE69m1Zyhg/WI9Rx8nKgyKT0srC+cRo=;
 b=inDDYsBURQmhz7xDsEbCaYuL/vxT8HiS69GsS/v8vVA4AWDLuRui7yxUd78PWyb3vG
 r2Xo+5sPFgyUpb2NHKWUL7XYLmI1m+wYAxjPmrEIFeTjR6Q5lbDYBgqjYDvOiM8RoHwp
 HKkh/kzmXQxpNuHVsUQr38Zb+XDSCa8jKOCTseHQ8OjUV7bYiujaClmh0I8xD6Sj3XgR
 Fu3Xi8t8iwBomrnPwKa7tUwZNWJM5uXvdKZabwEiBJUPPlg1JHJSPpZJhvlZyIXu4g/3
 M+ohTsz6VAIuTSzLiey+lyKuke1aJXGViYkUPrbYIJpW8m7/fFOpncLdUj5I7rfPSJMC
 f+mA==
X-Gm-Message-State: APjAAAWiYA/chMkqRdlDcFgt1b1bLAiP0Ev/piwnhynMv/+cyjVCBveI
 q+V2XAogyC86JsOlNSMlrbU=
X-Google-Smtp-Source: APXvYqxJJ7oR4UI999iQrrb/Jue334NRNSViCmiMcgqZ+R5dLrf1D0klzF0tUR5OQPr7XEGmtlVYlw==
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr7953969lji.214.1581876934785; 
 Sun, 16 Feb 2020 10:15:34 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u15sm6157431lfl.87.2020.02.16.10.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 10:15:33 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: display: add panel-timing.yaml
Date: Sun, 16 Feb 2020 19:15:09 +0100
Message-Id: <20200216181513.28109-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200216181513.28109-1-sam@ravnborg.org>
References: <20200216181513.28109-1-sam@ravnborg.org>
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add meta-schema variant of panel-timing and
reference it from panel-common.yaml.

Part of this came form other files with other
licenses - original commits:

cc3f414cf2e4 ("video: add of helper for display timings/videomode")
86f46565dff3 ("dt-bindings: display: display-timing: Add property to configure sync drive edge")
9cad9c95d7e8 ("Documentation: DocBook DRM framework documentation")

The original authors acked the license change to:
(GPL-2.0-only OR BSD-2-Clause)

v2:
  - Got OK from original authors for re-license
    Huge thanks for the quick replies!
  - Typo fixes (Oleksandr)
  - Drop -array variant when not needed (Maxime)
  - Replace oneOf:... with enum (Maxime)
  - Drop type from clock-frequency (Rob)
  - Drop "|" when not needed (Rob)

v3:
  - Added comment to acks that are only for the license change
  - Add yaml document terminator "..."
  - Updated description (removed reference to native-mode)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> [license change]
Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com> [license change]
Acked-by: Steffen Trumtrar <s.trumtrar@pengutronix.de> [license change]
Acked-by: Philipp Zabel <p.zabel@pengutronix.de> [license change]
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/panel/panel-common.yaml  |   7 +-
 .../bindings/display/panel/panel-timing.yaml  | 227 ++++++++++++++++++
 2 files changed, 230 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-timing.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index ef8d8cdfcede..8070c439adbd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -54,13 +54,12 @@ properties:
 
   # Display Timings
   panel-timing:
-    type: object
     description:
       Most display panels are restricted to a single resolution and
       require specific display timings. The panel-timing subnode expresses those
-      timings as specified in the timing subnode section of the display timing
-      bindings defined in
-      Documentation/devicetree/bindings/display/panel/display-timing.txt.
+      timings.
+    allOf:
+      - $ref: panel-timing.yaml#
 
   # Connectivity
   port:
diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
new file mode 100644
index 000000000000..bd558ad7891f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
@@ -0,0 +1,227 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-timing.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: panel timing bindings
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  There are different ways of describing the timing data of a panel. The
+  devicetree representation corresponds to the one commonly found in datasheets
+  for panels.
+
+  The parameters are defined as seen in the following illustration.
+
+  +----------+-------------------------------------+----------+-------+
+  |          |        ^                            |          |       |
+  |          |        |vback_porch                 |          |       |
+  |          |        v                            |          |       |
+  +----------#######################################----------+-------+
+  |          #        ^                            #          |       |
+  |          #        |                            #          |       |
+  |  hback   #        |                            #  hfront  | hsync |
+  |   porch  #        |       hactive              #  porch   |  len  |
+  |<-------->#<-------+--------------------------->#<-------->|<----->|
+  |          #        |                            #          |       |
+  |          #        |vactive                     #          |       |
+  |          #        |                            #          |       |
+  |          #        v                            #          |       |
+  +----------#######################################----------+-------+
+  |          |        ^                            |          |       |
+  |          |        |vfront_porch                |          |       |
+  |          |        v                            |          |       |
+  +----------+-------------------------------------+----------+-------+
+  |          |        ^                            |          |       |
+  |          |        |vsync_len                   |          |       |
+  |          |        v                            |          |       |
+  +----------+-------------------------------------+----------+-------+
+
+
+  The following is the panel timings shown with time on the x-axis.
+  This matches the timing diagrams often found in data sheets.
+
+              Active                 Front           Sync           Back
+              Region                 Porch                          Porch
+  <-----------------------><----------------><-------------><-------------->
+    //////////////////////|
+   ////////////////////// |
+  //////////////////////  |..................               ................
+                                             _______________
+
+  Timing can be specified either as a typical value or as a tuple
+  of min, typ, max values.
+
+properties:
+
+  clock-frequency:
+   description: Panel clock in Hz
+
+  hactive:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Horizontal panel resolution in pixels
+
+  vactive:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Vertical panel resolution in pixels
+
+  hfront-porch:
+    description: Horizontal front porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of pixels
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of pixels
+
+  hback-porch:
+    description: Horizontal back porch timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of pixels
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of pixels
+
+  hsync-len:
+    description: Horizontal sync length panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of pixels
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of pixels
+
+  vfront-porch:
+    description: Vertical front porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of lines
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of lines
+
+  vback-porch:
+    description: Vertical back porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of lines
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of lines
+
+  vsync-len:
+    description: Vertical sync length panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - maxItems: 1
+          items:
+            description: typical number of lines
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
+        - minItems: 3
+          maxItems: 3
+          items:
+            description: min, typ, max number of lines
+
+  hsync-active:
+    description: |
+      Horizontal sync pulse.
+      0 selects active low, 1 selects active high.
+      If omitted then it is not used by the hardware
+    enum: [0, 1]
+
+  vsync-active:
+    description: |
+      Vertical sync pulse.
+      0 selects active low, 1 selects active high.
+      If omitted then it is not used by the hardware
+    enum: [0, 1]
+
+  de-active:
+    description: |
+      Data enable.
+      0 selects active low, 1 selects active high.
+      If omitted then it is not used by the hardware
+    enum: [0, 1]
+
+  pixelclk-active:
+    description: |
+      Data driving on rising or falling edge.
+      Use 0 to drive pixel data on falling edge and
+      sample data on rising edge.
+      Use 1 to drive pixel data on rising edge and
+      sample data on falling edge
+    enum: [0, 1]
+
+  syncclk-active:
+    description: |
+      Drive sync on rising or sample sync on falling edge.
+      If not specified then the setup is as specified by pixelclk-active.
+      Use 0 to drive sync on falling edge and
+      sample sync on rising edge of pixel clock.
+      Use 1 to drive sync on rising edge and
+      sample sync on falling edge of pixel clock
+    enum: [0, 1]
+
+  interlaced:
+    type: boolean
+    description: Enable interlaced mode
+
+  doublescan:
+    type: boolean
+    description: Enable double scan mode
+
+  doubleclk:
+    type: boolean
+    description: Enable double clock mode
+
+required:
+ - clock-frequency
+ - hactive
+ - vactive
+ - hfront-porch
+ - hback-porch
+ - hsync-len
+ - vfront-porch
+ - vback-porch
+ - vsync-len
+
+additionalProperties: false
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
