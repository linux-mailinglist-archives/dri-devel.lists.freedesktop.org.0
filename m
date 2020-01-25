Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6B91497D3
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 21:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D563D6E915;
	Sat, 25 Jan 2020 20:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785946E919
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 20:35:14 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v17so6535034ljg.4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 12:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=616GkDLKCe/U3CfyfuKWOwx6GNFhn6D9HB9446hFwxA=;
 b=u4PPegTRp5U5zD5Mndy+n/oYek6H2HPn5G19wdRckNmdsXZq4ijJY+Zqh3hLEhPFzu
 fTRQYhNyIXVitEv4mUkNlTD1msO/nVM521skUOVq/p3hvJvLhKuUqsUgT4I7Ev9lcyON
 pslFX03t2qxRcdpZp/DOVcZj6cY+euyAuvw8sRjt1UcmH6r6Ar383uU2runZ5DmsnZPw
 jrNKmp6dUIRmFsvNesJjblkx6pNQrWrQgGEcfVMjKL0Rzx9BkeyGLs84Ve68Vs+9Ua0n
 4oT8rlAVv5OPjZ1Su75VaIGgaH0Frg1KFdemP1h3RhmSO4in6AdirmoWbYGHv3lV4E5r
 9jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=616GkDLKCe/U3CfyfuKWOwx6GNFhn6D9HB9446hFwxA=;
 b=pX9RdA/mEbAqH/9Jwl3aLXdP26iKC/0jNpNFRz54pQ2hhcq1MpfOy6+QdaPWsLymPS
 6YyR8uHUiSmi4WxJrnRiCg0aPLlVQtZ2R3VCZoCMycQrWPQOfYpcfYFwrPc0hX8kt0ks
 VKhoBsKMdxQnztU6ciz4EF86OR770U9GzemRk3767jygneCeEE/6fNLOGM97r+YQHVJO
 5/WqYIvvx3wSMf3PQx0l3LWD1cwH785bsg9I5iW5x+u7T4Q4uifBL2Krjq9RIFsqbU91
 8EDh7j16PrLJimnc4+ax7hS/O1td7vI7Cd3StIte3YN+umCGl/RDI1mx5QMogko7iQKn
 2FSg==
X-Gm-Message-State: APjAAAWc7nsVGL7xnqAlnVMNEFJKKWKB4fJN8nQZqKDJfGujtoOFKMoy
 UTBDB48hetAqIXL9iYvom50=
X-Google-Smtp-Source: APXvYqz1RrNTSgTP701VuceE9GYA9D76hrwcopdtSbfjFqRMH49aZHXC192fN/7R22rPMcT5TsNpUw==
X-Received: by 2002:a2e:b4ef:: with SMTP id s15mr6186338ljm.20.1579984512873; 
 Sat, 25 Jan 2020 12:35:12 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u17sm5393937ljk.62.2020.01.25.12.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2020 12:35:12 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: display: convert display-timings to DT
 schema
Date: Sat, 25 Jan 2020 21:34:53 +0100
Message-Id: <20200125203454.7450-3-sam@ravnborg.org>
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

Add display-timings.yaml - that references panel-timings.yaml.
display-timings.yaml will be used for display bindings
when they are converted to meta-schema format.

For now the old display-timing.txt points to the new
display-timings.yaml - and all users are left as-is.

v2:
  - Updated native-mode description

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/panel/display-timing.txt | 124 +-----------------
 .../display/panel/display-timings.yaml        |  68 ++++++++++
 2 files changed, 69 insertions(+), 123 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/display-timings.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/display-timing.txt b/Documentation/devicetree/bindings/display/panel/display-timing.txt
index 78222ced1874..7f55ad4a40c4 100644
--- a/Documentation/devicetree/bindings/display/panel/display-timing.txt
+++ b/Documentation/devicetree/bindings/display/panel/display-timing.txt
@@ -1,123 +1 @@
-display-timing bindings
-=======================
-
-display-timings node
---------------------
-
-required properties:
- - none
-
-optional properties:
- - native-mode: The native mode for the display, in case multiple modes are
-		provided. When omitted, assume the first node is the native.
-
-timing subnode
---------------
-
-required properties:
- - hactive, vactive: display resolution
- - hfront-porch, hback-porch, hsync-len: horizontal display timing parameters
-   in pixels
-   vfront-porch, vback-porch, vsync-len: vertical display timing parameters in
-   lines
- - clock-frequency: display clock in Hz
-
-optional properties:
- - hsync-active: hsync pulse is active low/high/ignored
- - vsync-active: vsync pulse is active low/high/ignored
- - de-active: data-enable pulse is active low/high/ignored
- - pixelclk-active: with
-			- active high = drive pixel data on rising edge/
-					sample data on falling edge
-			- active low  = drive pixel data on falling edge/
-					sample data on rising edge
-			- ignored     = ignored
- - syncclk-active: with
-			- active high = drive sync on rising edge/
-					sample sync on falling edge of pixel
-					clock
-			- active low  = drive sync on falling edge/
-					sample sync on rising edge of pixel
-					clock
-			- omitted     = same configuration as pixelclk-active
- - interlaced (bool): boolean to enable interlaced mode
- - doublescan (bool): boolean to enable doublescan mode
- - doubleclk (bool): boolean to enable doubleclock mode
-
-All the optional properties that are not bool follow the following logic:
-    <1>: high active
-    <0>: low active
-    omitted: not used on hardware
-
-There are different ways of describing the capabilities of a display. The
-devicetree representation corresponds to the one commonly found in datasheets
-for displays. If a display supports multiple signal timings, the native-mode
-can be specified.
-
-The parameters are defined as:
-
-  +----------+-------------------------------------+----------+-------+
-  |          |        ^                            |          |       |
-  |          |        |vback_porch                 |          |       |
-  |          |        v                            |          |       |
-  +----------#######################################----------+-------+
-  |          #        ^                            #          |       |
-  |          #        |                            #          |       |
-  |  hback   #        |                            #  hfront  | hsync |
-  |   porch  #        |       hactive              #  porch   |  len  |
-  |<-------->#<-------+--------------------------->#<-------->|<----->|
-  |          #        |                            #          |       |
-  |          #        |vactive                     #          |       |
-  |          #        |                            #          |       |
-  |          #        v                            #          |       |
-  +----------#######################################----------+-------+
-  |          |        ^                            |          |       |
-  |          |        |vfront_porch                |          |       |
-  |          |        v                            |          |       |
-  +----------+-------------------------------------+----------+-------+
-  |          |        ^                            |          |       |
-  |          |        |vsync_len                   |          |       |
-  |          |        v                            |          |       |
-  +----------+-------------------------------------+----------+-------+
-
-Note: In addition to being used as subnode(s) of display-timings, the timing
-      subnode may also be used on its own. This is appropriate if only one mode
-      need be conveyed. In this case, the node should be named 'panel-timing'.
-
-
-Example:
-
-	display-timings {
-		native-mode = <&timing0>;
-		timing0: 1080p24 {
-			/* 1920x1080p24 */
-			clock-frequency = <52000000>;
-			hactive = <1920>;
-			vactive = <1080>;
-			hfront-porch = <25>;
-			hback-porch = <25>;
-			hsync-len = <25>;
-			vback-porch = <2>;
-			vfront-porch = <2>;
-			vsync-len = <2>;
-			hsync-active = <1>;
-		};
-	};
-
-Every required property also supports the use of ranges, so the commonly used
-datasheet description with minimum, typical and maximum values can be used.
-
-Example:
-
-	timing1: timing {
-		/* 1920x1080p24 */
-		clock-frequency = <148500000>;
-		hactive = <1920>;
-		vactive = <1080>;
-		hsync-len = <0 44 60>;
-		hfront-porch = <80 88 95>;
-		hback-porch = <100 148 160>;
-		vfront-porch = <0 4 6>;
-		vback-porch = <0 36 50>;
-		vsync-len = <0 5 6>;
-	};
+See display-timings.yaml in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/display-timings.yaml b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
new file mode 100644
index 000000000000..508302cd307a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: display timing bindings
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+properties:
+  $nodename:
+    const: display-timings
+
+  native-mode:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      The default dispaly timing is the one specified as native-mode.
+      If no native-mode is specified then the first node is assume the
+      native mode.
+
+patternProperties:
+  "^timing.*$":
+    allOf:
+      - $ref: panel-timing.yaml#
+
+additionalProperties: false
+
+examples:
+  - |+
+
+    /*
+     * Example that specifies panel timing using minimum, typical,
+     * maximum values as commonly used in datasheet description.
+     * timing1 is the native-mode.
+     */
+    display-timings {
+      native-mode = <&timing1>;
+      timing0 {
+        /* 1920x1080p24 */
+        clock-frequency = <148500000>;
+        hactive = <1920>;
+        vactive = <1080>;
+        hsync-len = <0 44 60>;
+        hfront-porch = <80 88 95>;
+        hback-porch = <100 148 160>;
+        vfront-porch = <0 4 6>;
+        vback-porch = <0 36 50>;
+        vsync-len = <0 5 6>;
+      };
+      timing1 {
+        /* 1920x1080p24 */
+        clock-frequency = <52000000>;
+        hactive = <1920>;
+        vactive = <1080>;
+        hfront-porch = <25>;
+        hback-porch = <25>;
+        hsync-len = <0 25 25>;
+        vback-porch = <2>;
+        vfront-porch = <2>;
+        vsync-len = <2>;
+        hsync-active = <1>;
+        pixelclk-active = <1>;
+      };
+    };
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
