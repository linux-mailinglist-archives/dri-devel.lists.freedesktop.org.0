Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01838D7005
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 15:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14D010E15D;
	Sat,  1 Jun 2024 13:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HuHx4KWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB1A10E15D
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717247593;
 bh=evQjzendhCTVDwbxItOsj1lGHwRt7EcxvTuj1w7337E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HuHx4KWnzYf4g1IdO50vhHuxDFNsG/EF3JnR92wZ6GJYja7mwo8oHyDXMSYz1SZwl
 smQLi+cbI5BLL+k0jX7WolM/PtwE1fadb4+aHpSDx1mYveQp1o0VMSNLmF5aEDCLlS
 i02CvHHo85r41LPleA4dD7D5qGk77OuKv7fUkVnl7fVQ+vTJug3UdaCizU4JlCN9U+
 hYk6fhGDBgBIV7+8ZND6Qmo2ujW1gk7I1SGh4cEv3KJmiGPvKTaI8u9brOfY5xma9U
 8JWQY8l/qjRqHtczCXBnPhezOv39ZMZdEaze9/R3FGDaGgg/p3ujwduJ072PNGEta/
 LBaXs2ODKy35A==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2AB8637821EA;
 Sat,  1 Jun 2024 13:13:13 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 01 Jun 2024 16:12:34 +0300
Subject: [PATCH 12/14] dt-bindings: display: rockchip,dw-hdmi: Add
 compatible for RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240601-b4-rk3588-bridge-upstream-v1-12-f6203753232b@collabora.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>
X-Mailer: b4 0.14-dev-f7c49
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX controller
found on Rockchip RK3588 SoC family.

Since RK3588 uses different clocks than previous Rockchip SoCs and also
requires a couple of reset lines and some additional properties, provide
the required changes in the binding to accommodate all variants.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../display/rockchip/rockchip,dw-hdmi.yaml         | 127 +++++++++++++++------
 1 file changed, 90 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index 2aac62219ff6..60d6b815227f 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -10,12 +10,10 @@ maintainers:
   - Mark Yao <markyao0591@gmail.com>
 
 description: |
-  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
-  with a companion PHY IP.
-
-allOf:
-  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
-  - $ref: /schemas/sound/dai-common.yaml#
+  For SoCs up to RK3568, the HDMI transmitter is a Synopsys DesignWare
+  HDMI 1.4 TX controller IP with a companion PHY IP.
+  The RK3588 SoC integrates the Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP)
+  TX controller IP and a HDMI/eDP TX Combo PHY based on a Samsung IP block.
 
 properties:
   compatible:
@@ -25,6 +23,7 @@ properties:
       - rockchip,rk3328-dw-hdmi
       - rockchip,rk3399-dw-hdmi
       - rockchip,rk3568-dw-hdmi
+      - rockchip,rk3588-dw-hdmi
 
   reg-io-width:
     const: 4
@@ -40,36 +39,6 @@ properties:
       A 1.8V supply that powers up the SoC internal circuitry. The pin name on the
       SoC usually is HDMI_TX_AVDD_1V8.
 
-  clocks:
-    minItems: 2
-    items:
-      - {}
-      - {}
-      # The next three clocks are all optional, but shall be specified in this
-      # order when present.
-      - description: The HDMI CEC controller main clock
-      - description: Power for GRF IO
-      - description: External clock for some HDMI PHY (old clock name, deprecated)
-      - description: External clock for some HDMI PHY (new name)
-
-  clock-names:
-    minItems: 2
-    items:
-      - {}
-      - {}
-      - enum:
-          - cec
-          - grf
-          - vpll
-          - ref
-      - enum:
-          - grf
-          - vpll
-          - ref
-      - enum:
-          - vpll
-          - ref
-
   ddc-i2c-bus:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -131,13 +100,97 @@ properties:
 required:
   - compatible
   - reg
-  - reg-io-width
   - clocks
   - clock-names
   - interrupts
   - ports
   - rockchip,grf
 
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3588-dw-hdmi
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        clocks:
+          minItems: 1
+          items:
+            - description: APB system interface clock
+            # The next clocks are optional, but shall be specified in this
+            # order when present.
+            - description: TMDS/FRL link clock
+            - description: EARC RX biphase clock
+            - description: Reference clock
+            - description: Audio interface clock
+            - description: Video datapath clock
+
+        clock-names:
+          minItems: 1
+          items:
+            - const: pclk
+            - enum: [hdp, earc, ref, aud, hclk_vo1]
+            - enum: [earc, ref, aud, hclk_vo1]
+            - enum: [ref, aud, hclk_vo1]
+            - enum: [aud, hclk_vo1]
+            - const: hclk_vo1
+
+        resets:
+          minItems: 2
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: ref
+            - const: hdp
+
+        interrupts:
+          minItems: 1
+          maxItems: 5
+
+        rockchip,vo1_grf:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description: Some QP related data is accessed through VO1 GRF regs
+
+      required:
+        - resets
+        - reset-names
+        - rockchip,vo1_grf
+
+    else:
+      $ref: ../bridge/synopsys,dw-hdmi.yaml#
+
+      properties:
+        clocks:
+          minItems: 2
+          items:
+            - {}
+            - {}
+            # The next three clocks are all optional, but shall be specified in this
+            # order when present.
+            - description: The HDMI CEC controller main clock
+            - description: Power for GRF IO
+            - description: External clock for some HDMI PHY (old clock name, deprecated)
+            - description: External clock for some HDMI PHY (new name)
+
+        clock-names:
+          minItems: 2
+          items:
+            - {}
+            - {}
+            - enum: [cec, grf, vpll, ref]
+            - enum: [grf, vpll, ref]
+            - enum: [vpll, ref]
+
+      required:
+        - reg-io-width
+
 unevaluatedProperties: false
 
 examples:

-- 
2.45.0

