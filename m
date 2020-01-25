Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CB81497D2
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 21:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D9D6E916;
	Sat, 25 Jan 2020 20:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8AB6E916
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 20:35:12 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b15so3583039lfc.4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 12:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JDsn4U1W83k0QQhjFWJ55QDTTyCPGlXIDjTfXp6DfPY=;
 b=uSYa57wCQlNeJ0M3sliFCTtwUcVkvKfgK8QHDTyTDPEM4MPAiq5eDvlPHqFuG68w9Q
 0GOJPI9ZizuxbR4F2WJNrzwR1Ae0dU1yl7Tsqit8UYKxwm7scvlxS9ufqbz4Ho4HEVlG
 ucHlL37sAC3Zva8/mg6/mqlb+9+1SK4+v8nDzfYg9Zx7sK3RMluP7h69HV2S6hCzXbRX
 /yVZ9I6eJtjqTr4SvjV8+f1B8/B5mKGvDM6Wb6EkvB3zPsRnohv/vHBLa83M3wAEgZzZ
 yoRNK1vI/mzAPSz1duTjqiYRCkAbxv91MGV2RqYQSbZTg2Hr0stY4iSnF7jWfF3LMz3g
 9nOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JDsn4U1W83k0QQhjFWJ55QDTTyCPGlXIDjTfXp6DfPY=;
 b=WToiprP9Cqi1RpddN6tE3GbfQEFo+Ubdx6EkTOfun9Qh3uHiKZzm5T5XcmZbOtNN9E
 nJDyaBKsU8OnW+t/0sasgrHvXYaj3/3HN5op32DkPLVgymte/dJjL9A/M0sMlAH8XgWG
 8TqE5O+PhiCnoFsuO5iqEFnrp6xDMpN24jXUT2hGdYaqJkmUOZ9Ql2bAZQ+1umXI1IHf
 2d1PVOykG/cEKRbDXbOFG1Rl4ayU4QOU6bgafjDfHFZnyHOpQSUjG/U8MQQhA5yJ/rkV
 kNNRUz0EA1UBUlGNY/SuDhItpEOzjPCcGvXaABzKlSGOdTxeTPvNwVL2r5mkhNiWQ/xV
 5ONA==
X-Gm-Message-State: APjAAAW/PXiZGr95BlHqhW7Iolkv6rdX1MHFOChA4bQa27Y1T3EqpMw4
 K89KtuPsAnhkLMl/PU24UA4=
X-Google-Smtp-Source: APXvYqxaTjEwhaYYQxUJKmRMxqnhW2x2YjAGAQVpYon/3NCCUqL1QBgMMWN71yW3eK/Sdrl8I06fqg==
X-Received: by 2002:ac2:544f:: with SMTP id d15mr4520428lfn.126.1579984510739; 
 Sat, 25 Jan 2020 12:35:10 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u17sm5393937ljk.62.2020.01.25.12.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2020 12:35:10 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: display: add panel-timing.yaml
Date: Sat, 25 Jan 2020 21:34:52 +0100
Message-Id: <20200125203454.7450-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200125203454.7450-1-sam@ravnborg.org>
References: <20200125203454.7450-1-sam@ravnborg.org>
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

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Acked-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
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
index 000000000000..bdfb6d461529
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
+  for panels. If a panel supports multiple signal timings, the native-mode
+  can be specified.
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
+    description: |
+      Horizontal front porch panel timing
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
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
