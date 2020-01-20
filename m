Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7431432BD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 21:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46FC6EA8F;
	Mon, 20 Jan 2020 20:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32826EA8F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 20:07:07 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j26so340510ljc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 12:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wIgJpCggonE7UZ122+IBk6BnPaiF15J3iohjxlO8A6I=;
 b=ofFq177Gkb+pAT23vs0FS88Bbt8L8mirBnSUz4vUffrt5klAOmwmSmkfxBCeq+SDz0
 HHxLajFStNxPM8UxqkH45iPZm+9I2AiGxOxgw5kFV5iBNohL+10d4MQM67NAMfqPCYll
 uNr8PzcbFavrrFqF+WqoqcwLuAyyFfghZQVOPmOYM7f1gYUr902Yo6dpfLiylf369ura
 P7BC37Bx4r6ZMFCTD9Eho04PPSPNOwix7mdxAtyLzu278ZntHVFjhQZQP4Dqgj1jhx/u
 wLieAEpEKuZkGL2t17h5vFhzOmSfjBGn9HALDdreFBGQWwdbhmxawOc3A7GTuigthZJV
 +5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wIgJpCggonE7UZ122+IBk6BnPaiF15J3iohjxlO8A6I=;
 b=Bo/waSuEP0WRdfKxTvgS0dxo7UQ3S7558/YhXNc7Ff7B0JpmFpT+fac3C3G82sPwrg
 pEPsQ6GV4dPHqUALZKKM9AWx5P5wQMFcsjDKCY7ZZLHyiDbi83Gxqyi/jeHMs+a/SYLb
 QM8XC//jn6DyfI8swL1psb9Wrngcvct2oO3nDOKRXJa2W6mm+VmifzS055h7uAE5OmwB
 nHxD2ielndt7HuDjvrvYhLQUSBibz2aeNbUlyVjYQioaN3qOnaKMOuPNVc/Y7HcG0zSR
 lQMq4IVdNOERR57wTEgb9HHYM68qGa6d3ngBjmAcrRKRM7bFQL98riOKbi39tSRxaHQb
 wW+w==
X-Gm-Message-State: APjAAAW2ZTUdjak3Tvjj7dk6AkflefTM2dZp2AJcLJw9nbp226KuLiFU
 NwRoFgxVhP+KC8tX9C4tw3w=
X-Google-Smtp-Source: APXvYqycBA8ReXTb8PzNHUywecDeWVtJdMFf9euEIoEEftx+xsYnhN8B3/TH9qY4MHC3SpJ3zgBMVQ==
X-Received: by 2002:a2e:9883:: with SMTP id b3mr14511352ljj.80.1579550826200; 
 Mon, 20 Jan 2020 12:07:06 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o12sm17332476ljj.79.2020.01.20.12.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 12:07:05 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: display: convert display-timings to DT
 schema
Date: Mon, 20 Jan 2020 21:06:40 +0100
Message-Id: <20200120200641.15047-3-sam@ravnborg.org>
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

Add display-timings.yaml - that references panel-timings.yaml.
display-timings.yaml will be used for display bindings
when they are converted to meta-schema format.

For now the old display-timing.txt points to the new
display-timings.yaml - and all users are left as-is.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/panel/display-timing.txt | 124 +-----------------
 .../display/panel/display-timings.yaml        |  67 ++++++++++
 2 files changed, 68 insertions(+), 123 deletions(-)
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
index 000000000000..4f93a4a287d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
@@ -0,0 +1,67 @@
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
+      The native mode for the display, in case multiple modes are
+      provided. When omitted, assume the first node is the native.
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
