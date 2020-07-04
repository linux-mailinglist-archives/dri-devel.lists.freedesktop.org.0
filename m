Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43942144DF
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 12:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4486E406;
	Sat,  4 Jul 2020 10:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AC46E405
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:28:21 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q4so4061818lji.2
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C5wlEjaiimAhiMOgTbXBv9o5NagLYnP7pgeN7/QqAPI=;
 b=XIRqKQYCa/UTfgcJDFZRIe4yREdW/CHWiTGba7Bnh3IcBNSXGOUQkxMkK8HVkH13x7
 xwHitVh+KadAxHMhKBUcorAEE9JqtsM+3ngLePr5u/MlDZtVRt645TTTuTvrYExn+sW+
 Q1Hx3FpofOoLiizDcui+ljwymGJDshvQfwFleIYiPbeQWbyJX31Io3YdJmPVJWFerrz0
 8Xzh54cz7NjFiKxGjasV4ABRnrvw8IrMUnRwnJCt4cC3LBTvErvYfWJnvt3WAfoWkhww
 BZWYlNb63ODsDET+VnqY/UMnq8IC+HSSYQXFXE2HBmzFrACPC6bDWyjyAdrLvY7ewdKN
 pvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C5wlEjaiimAhiMOgTbXBv9o5NagLYnP7pgeN7/QqAPI=;
 b=kixf49tsGg15WIgHTkZo+qM/aIl4LNVhmF1RJnOcBwwkKb2tc9uFcu3FEY4XQwLzed
 Yrjl3JwWbKxr00O17ea1MTGqEY3uY0LTxKaDvvsa3GRs0PgNipcyDoYx7kAd80vQ17t4
 fxOi+p5MwxEw6oFU0qxntnDAOPiEbdkbtios1b5amGPwFJDQsURlg/CgPxSN1LccWVAa
 14wqkcFYPBOb9fF32lxZFcv6r6x8PhnEc5pKAVtAUibH5yGej1ipi+wQtGnMXxnUMGuX
 vpAT94uzNHBbjuSscF+lLpB6h0ErJmwCmXEa9q4BhPG/ZPlGPD6aTdaroTM5Sfd79h+s
 vNtg==
X-Gm-Message-State: AOAM533oYGxYegGrectOg2NNox/2NwSK68Pporj9kvocStr9kcel0kk/
 h0Jr0VGZ7tjVxRHWYNnCMW603DulqtI=
X-Google-Smtp-Source: ABdhPJw2pRII2hvQP7haETvakQpHBTmpwpIYi/7LgPEz9zqy+9Jw3cTCHDnz4eryWRMsjHO5nPd4oQ==
X-Received: by 2002:a2e:9611:: with SMTP id v17mr10006033ljh.110.1593858499494; 
 Sat, 04 Jul 2020 03:28:19 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id z23sm5366913ljz.3.2020.07.04.03.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:28:19 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/3] dt-bindings: display: convert sharp,
 lq101r1sx01 to DT Schema
Date: Sat,  4 Jul 2020 12:28:06 +0200
Message-Id: <20200704102806.735713-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102806.735713-1-sam@ravnborg.org>
References: <20200704102806.735713-1-sam@ravnborg.org>
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
Cc: Chris Zhong <zyw@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This binding describes a panel with a secondary channel.

v3:
  - Add reg property and unit-address to dsi nodes (Rob)

v2:
  - add check for required properties if link2 is present (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,lq101r1sx01.txt       | 49 -----------
 .../display/panel/sharp,lq101r1sx01.yaml      | 87 +++++++++++++++++++
 2 files changed, 87 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
deleted file mode 100644
index f522bb8e47e1..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Sharp Microelectronics 10.1" WQXGA TFT LCD panel
-
-This panel requires a dual-channel DSI host to operate. It supports two modes:
-- left-right: each channel drives the left or right half of the screen
-- even-odd: each channel drives the even or odd lines of the screen
-
-Each of the DSI channels controls a separate DSI peripheral. The peripheral
-driven by the first link (DSI-LINK1), left or even, is considered the primary
-peripheral and controls the device. The 'link2' property contains a phandle
-to the peripheral driven by the second link (DSI-LINK2, right or odd).
-
-Note that in video mode the DSI-LINK1 interface always provides the left/even
-pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
-is possible to program either link to drive the left/even or right/odd pixels
-but for the sake of consistency this binding assumes that the same assignment
-is chosen as for video mode.
-
-Required properties:
-- compatible: should be "sharp,lq101r1sx01"
-- reg: DSI virtual channel of the peripheral
-
-Required properties (for DSI-LINK1 only):
-- link2: phandle to the DSI peripheral on the secondary link. Note that the
-  presence of this property marks the containing node as DSI-LINK1.
-- power-supply: phandle of the regulator that provides the supply voltage
-
-Optional properties (for DSI-LINK1 only):
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	dsi@54300000 {
-		panel: panel@0 {
-			compatible = "sharp,lq101r1sx01";
-			reg = <0>;
-
-			link2 = <&secondary>;
-
-			power-supply = <...>;
-			backlight = <...>;
-		};
-	};
-
-	dsi@54400000 {
-		secondary: panel@0 {
-			compatible = "sharp,lq101r1sx01";
-			reg = <0>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
new file mode 100644
index 000000000000..a679d3647dbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq101r1sx01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 10.1" WQXGA TFT LCD panel
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+
+description: |
+  This panel requires a dual-channel DSI host to operate. It supports two modes:
+  - left-right: each channel drives the left or right half of the screen
+  - even-odd: each channel drives the even or odd lines of the screen
+
+  Each of the DSI channels controls a separate DSI peripheral. The peripheral
+  driven by the first link (DSI-LINK1), left or even, is considered the primary
+  peripheral and controls the device. The 'link2' property contains a phandle
+  to the peripheral driven by the second link (DSI-LINK2, right or odd).
+
+  Note that in video mode the DSI-LINK1 interface always provides the left/even
+  pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
+  is possible to program either link to drive the left/even or right/odd pixels
+  but for the sake of consistency this binding assumes that the same assignment
+  is chosen as for video mode.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq101r1sx01
+
+  reg: true
+  power-supply: true
+  backlight: true
+
+  link2:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the DSI peripheral on the secondary link. Note that the
+      presence of this property marks the containing node as DSI-LINK1
+
+required:
+  - compatible
+  - reg
+
+if:
+  required:
+    - link2
+then:
+  required:
+    - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi0: dsi@fd922800 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xfd922800 0x200>;
+
+        panel: panel@0 {
+            compatible = "sharp,lq101r1sx01";
+            reg = <0>;
+
+            link2 = <&secondary>;
+
+            power-supply = <&power>;
+            backlight = <&backlight>;
+        };
+    };
+
+    dsi1: dsi@fd922a00 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xfd922a00 0x200>;
+
+        secondary: panel@0 {
+            compatible = "sharp,lq101r1sx01";
+            reg = <0>;
+        };
+    };
+
+...
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
