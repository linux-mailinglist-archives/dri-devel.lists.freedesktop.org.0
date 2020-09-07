Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF27725F4D3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AB26E342;
	Mon,  7 Sep 2020 08:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6A16E342
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:18:34 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id v4so13273146wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/0HsauPurP4GLwNBopn5TZUsUZJKLkyzLDWrJr/4s5U=;
 b=J66KLzlOYfq63rz/EDI2/aR4JNB6BbshNVdCF0X7BoOXx8o3cPwwoD4FA2dtwXw66D
 jIQX9rFkKLZQ9wB/HmiYiMdhuY4afx3UkS2sDyJnZu0cMaNbusqbjiQIaKGtQQuXz/aa
 USbX4T2elF97eM1fMje7fNj8+x9bGo1er6L1qzB42H+G5T3xhG7wbmSuRMy4NbGjnGP8
 d8HEDEEl/qOiT2DY8wQmCwFr4N1VqNLmqeCNyDoHy6g+yjWDcH5WQuUuOsQRrzFxUOaZ
 DnkA/kuikMDBtrB6ybir6wiFs8/gED3EDAbZlYM+oj1M8wV5mSGFFw49l7vloRbfEFTX
 L+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/0HsauPurP4GLwNBopn5TZUsUZJKLkyzLDWrJr/4s5U=;
 b=t6QTIuuwcOzqJShsxD4lIkKRNPM2YEhiQdQlQnfs9sfCETV3X2IlNV3aV03QIZdf6x
 UqHpexFxw/geC8RT1N1P2ApluxzsZmvxzCUTmAkc/Rzn831kYxYMC6MZWoWcu+lJ1EO3
 BBUYjSojziAgAj7bocwDD9GhJ1g+e5myiMJ0MHk6Ndzu+bDj2+cRVszQfHusxv53kdgW
 VWz8GYurx9WvAYgVzWNHtT4TgpinUdkIBbzIKJmlnx+aXOSRhU4KfDzgS8mPS0bimAPL
 ezirpUv/IArbb439OYEtCeTWlx7vHks8iUtVl8f+QhdKypvD4zjgBTzNQ5E91fDLAeae
 b5qw==
X-Gm-Message-State: AOAM53239qVp4pLVA0++6gN9mWIdiSM3rUB8Y0OqPsnCoWYPRiBuuSYA
 NFevuAdZiUnM8ukNGSjWkoTPZA==
X-Google-Smtp-Source: ABdhPJwT5w0cdNog5hvbeofOd9g2nUaa5JeJ2ZchwmHJ7pv5qSRDx2+v0cWfcXr2DTx0d7DcEDFbEA==
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr19294990wmj.116.1599466713146; 
 Mon, 07 Sep 2020 01:18:33 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id q186sm28032205wma.45.2020.09.07.01.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:18:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	devicetree@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Date: Mon,  7 Sep 2020 10:18:21 +0200
Message-Id: <20200907081825.1654-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907081825.1654-1-narmstrong@baylibre.com>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
Amlogic SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
new file mode 100644
index 000000000000..6177f45ea1a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/amlogic,meson-dw-mipi-dsi.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Amlogic Meson Synopsys Designware Integration is composed of
+  - A Synopsys DesignWare MIPI DSI Host Controller IP
+  - A TOP control block controlling the Clocks & Resets of the IP
+
+allOf:
+  - $ref: dsi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-axg-dw-mipi-dsi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: pclk
+      - const: px_clk
+      - const: meas_clk
+
+  resets:
+    minItems: 1
+
+  reset-names:
+    items:
+      - const: top
+
+  phys:
+    minItems: 1
+
+  phy-names:
+    items:
+      - const: dphy
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description: Input node to receive pixel data.
+      port@1:
+        type: object
+        description: DSI output node to panel.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi@7000 {
+          compatible = "amlogic,meson-axg-dw-mipi-dsi";
+          reg = <0x6000 0x400>;
+          resets = <&reset_top>;
+          reset-names = "top";
+          clocks = <&clk_pclk>, <&clk_px>;
+          clock-names = "pclk", "px_clk";
+          phys = <&mipi_dphy>;
+          phy-names = "dphy";
+
+          ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              /* VPU VENC Input */
+              mipi_dsi_venc_port: port@0 {
+                  reg = <0>;
+
+                  mipi_dsi_in: endpoint {
+                       remote-endpoint = <&dpi_out>;
+                  };
+              };
+
+              /* DSI Output */
+              mipi_dsi_panel_port: port@1 {
+                  reg = <1>;
+
+                  mipi_out_panel: endpoint {
+                      remote-endpoint = <&mipi_in_panel>;
+                  };
+              };
+          };
+    };
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
