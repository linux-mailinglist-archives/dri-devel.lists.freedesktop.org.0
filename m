Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E5D1432BB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 21:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3CC6EA8B;
	Mon, 20 Jan 2020 20:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735E36EA8B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 20:07:05 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a13so352980ljm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 12:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5DDZtG0fHm3Few9S3Ffbq1g5h/5cEUnOZq02EIkZMN4=;
 b=k9MTg2sRV2KVG7dtOpDwpnuC9u0WBO7odLoXJLo+Hlhi0TUO2Iy5199QRUBysm1uFZ
 RJBqN46N1a8YzrGDuir5KvzCb0lmFBvskHuVXiSFr01Vm3yolctLTnm0xb+eHC2jKGkq
 3Zfsf3+X2oUQ7ci9qmuRg/1GM6tgpls3/Hqdf6XvmO701IGvAUgKSwnHbCxJkNoZ045Y
 zy9QaA5JivtGuoFhHTklA34UfVXtlwPyVKM/GuONRegX4n55qPlT5w1eP6rxZW9ivEIU
 wIG27r0uAdGHVJLR0kQE60ulxyn5nER3O+FyZXOOccvCdwzjIt7BwmvAniFabaEgeq5L
 LUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5DDZtG0fHm3Few9S3Ffbq1g5h/5cEUnOZq02EIkZMN4=;
 b=jKjj3bFZq4Dx0wRu01IhK8MPVxYl/bIXAwrILnvv0G+5GkMqAYd7qhbrUsJJVpT0Y2
 tUd0ugFDcorVxEJOeLb6OoliRBPSfGHOLO1myk+A+J/VMt+XphUPgkE3ya+sPANHxtg0
 8WlKK1c7srQH7Mvba2mM+QAChSTE+JWWarZId3KNBypWKBMHq6lKu/nmdWIWpDsr6/85
 KoBwH01bFWFlA3UlgxGqbvPd1uYKYphvXPQxzbQw540h67ut53ILjC45+DnUgZ03aG6p
 hB/PKuk5ZdtVuJuM5oVdaD8Z80d5xOJXAgCpeWxnzALxCRPmYAATJNMlOS1RyuDq9vxH
 GbEg==
X-Gm-Message-State: APjAAAWI0CFeHzAliOzt2kx5KvAzFxLK8w38ao2cH8s10cPPkJJdAJ3w
 8k0iMmqLtRGjBiQa2zmI4LE=
X-Google-Smtp-Source: APXvYqy7uL9isd/QPuSfvQwX04TrXJYyvG/X1Gk0wKohh3D6Kwz/SfyK68wqwkG2dRohF8Fe3rHYNg==
X-Received: by 2002:a2e:943:: with SMTP id 64mr14479161ljj.17.1579550823843;
 Mon, 20 Jan 2020 12:07:03 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o12sm17332476ljj.79.2020.01.20.12.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 12:07:03 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: display: add panel-timing.yaml
Date: Mon, 20 Jan 2020 21:06:39 +0100
Message-Id: <20200120200641.15047-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200120200641.15047-1-sam@ravnborg.org>
References: <20200120200641.15047-1-sam@ravnborg.org>
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
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add meta-schema variant of panel-timing and
reference it from panel-common.yaml.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/panel/panel-common.yaml  |   7 +-
 .../bindings/display/panel/panel-timing.yaml  | 253 ++++++++++++++++++
 2 files changed, 256 insertions(+), 4 deletions(-)
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
index 000000000000..59891c7a58ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
@@ -0,0 +1,253 @@
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
+  There are different ways of describing the timing data data of a panel. The
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
+   $ref: /schemas/types.yaml#/definitions/uint32
+   description: |
+     Panel clock in Hz
+
+  hactive:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+       Horizontal panel resolution in pixels
+
+  vactive:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Verical panel resolution in pixels
+
+  hfront-porch:
+    description: |
+      Horizontal front porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    description: |
+      Horizontal back porch timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    description: |
+      Horizontal sync length panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    description: |
+      Vertical front porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    description: |
+      Vertical back porch panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    description: |
+      Vertical sync length panel timing
+    oneOf:
+      - allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32-array
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
+      If omitted then it is not used by the hardware
+    oneOf:
+      - const: 0
+        description: active low
+      - const: 1
+        description: active high
+
+  vsync-active:
+    description: |
+      Vertical sync pulse.
+      If omitted then it is not used by the hardware
+    oneOf:
+      - const: 0
+        description: active low
+      - const: 1
+        description: active high
+
+  de-active:
+    description: |
+      Data enable.
+      If omitted then it is not used by the hardware
+    oneOf:
+      - const: 0
+        description: active low
+      - const: 1
+        description: active high
+
+  pixelclk-active:
+    description: |
+      Data driving on rising or falling edge
+    oneOf:
+      - const: 0
+        description: |
+          Drive pixel data on falling edge and
+          sample data on rising edge
+      - const: 1
+        description: |
+          Drive pixel data on rising edge and
+          sample data on falling edge
+
+  syncclk-active:
+    description: |
+      Drive sync on rising or sample sync on falling edge.
+      If not specified then the same as pixelclk-active
+    oneOf:
+      - const: 0
+        description: |
+          Drive sync on falling edge and
+          sample sync on rising edge of pixel clock
+      - const: 1
+        description: |
+          Drive sync on rising edge and
+          sample sync on falling edge of pixel clock
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
