Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C53AAB43DD
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D46410E491;
	Mon, 12 May 2025 18:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Htxxfht6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D3A10E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:43:12 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a0b9625735so2506099f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747075391; x=1747680191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kd8ToXBYqgNmbVcyeLHk5NPIyHmj3DKveR0qgHKffVY=;
 b=Htxxfht6x7bZAC1UWZ0wWrFqDsJ6g4i32VX/o/ZObQTyP8PyEGcuc8dWKU6UnqbEwX
 Sd8cwLc2f92xyzeM7guwclxgRvViOSBE/dvrAYJbHsTwHkJC/A3oGk9pfKIPIauBhAif
 9mOFEWYWx6ElD73lnpFJgG4aMEoLPT4pxYtFla2H/YI/biXYobK20pgSB3Mo067EJU7c
 bAz7d38eknOIkIt6NXY7N5WqGiSPeG31NiTNgP0Xqaysj7aAGg01LOZvMTTgdvkic+yN
 5hvDLyQ7IEU7fp8zOj/0QZJ4o2HsKv5QFHJ9boqF87v1nw84TJs5QfIm4eCpPiECz4C2
 OoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747075391; x=1747680191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kd8ToXBYqgNmbVcyeLHk5NPIyHmj3DKveR0qgHKffVY=;
 b=kislw9uYSnNCvPbAuklgVaY1fC8yLVW7kZJSPWCbKhjMOPLcLkQ5IggltFIFFN4wSh
 C4HSxtKimJJkdsr+z3iITvbp5yXXu9fLkvTDNnsLdWlbvGYo6BiIwqctrBx4qJ/0LE5k
 sYUMtGawjD6kXCCI5sF7H8B11P4i0Axonjxpb/p1oy79d/Kia95ysTssMvaKCmRy4Mx4
 r6NeGrmahMQE2xDaL3vzoO3P2WG0BS2Rahw1n8lfP+VkiXko4QjP9wddnw08YaIgxRpI
 P8xteexUmrvoJYrBjtpYfzqX0FwCxcZJdmTvN+Z/uWsYA720UHm16+x1KP/ry3hbjBxA
 zU4A==
X-Gm-Message-State: AOJu0YzDcF38oP5gWoh8f5ob8ZIIkCSwXHSf63WmQ2z3G6XIZpR92PZ/
 FiKFhfCygk1J5q1qjaL7VLMNZIe9c3SwTB3UiJc0John57vNXO/y
X-Gm-Gg: ASbGncvhj/y6vLupFISer2nbjJwESlMOhK7/rVYHxMlp+o81qCCYP7hxmRjObCX0N9Z
 PCX+Z+x4ipljygBZctju8PKWNQZOu5xkLB4uOCBitCUvYG4J6iyriXeoNbpjHVC216LSceTQoNb
 Flnrvl1k0dripfkIfDSVxDJYMKDKfnb9HO+LAZwwjriu8CEvjgwoJtIhfhwFaaBpg5JbFdj6QQC
 14J5lyNk8Dbr7y2rQUUGgaQcdZfeTUjv2z1zq+N00uvMRkTXSa9IiPZ2ZNWhcmd1CGmAymOF60k
 GXrNzRUIl6TVaV9HyezhmaDuFom9qB4lxhOQgBb9o0QOJsepn6eKnS8/xNarZb4kBUc0cs18psA
 q
X-Google-Smtp-Source: AGHT+IGI/+dH/CdURfxD6W7eKPlxKN1PN9yE2+rZsr9QKCyZcAYXw2DqE75q2i4hHMhdjtyzGe26ew==
X-Received: by 2002:a05:6000:1868:b0:3a0:b392:c2f with SMTP id
 ffacd0b85a97d-3a1f648782cmr10654178f8f.44.1747075390143; 
 Mon, 12 May 2025 11:43:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f57ddd53sm13309203f8f.1.2025.05.12.11.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:43:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/4] dt-bindings: display: bridge: renesas,
 dsi: Add support for RZ/V2H(P) SoC
Date: Mon, 12 May 2025 19:43:01 +0100
Message-ID: <20250512184302.241417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to that of
the RZ/G2L SoC. While the LINK registers are the same for both SoCs, the
D-PHY registers differ. Additionally, the number of resets for DSI on
RZ/V2H(P) is two compared to three on the RZ/G2L.

To accommodate these differences, a SoC-specific
`renesas,r9a09g057-mipi-dsi` compatible string has been added for the
RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- Collected reviewed tag from Krzysztof

v1->v2:
- Kept the sort order for schema validation
- Added  `port@1: false` for RZ/V2H(P) SoC
---
 .../bindings/display/bridge/renesas,dsi.yaml  | 116 +++++++++++++-----
 1 file changed, 87 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index e08c24633926..5980df2b389b 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -14,16 +14,17 @@ description: |
   RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
   up to four data lanes.
 
-allOf:
-  - $ref: /schemas/display/dsi-controller.yaml#
-
 properties:
   compatible:
-    items:
+    oneOf:
       - enum:
-          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
-          - renesas,r9a07g054-mipi-dsi # RZ/V2L
-      - const: renesas,rzg2l-mipi-dsi
+          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
+
+      - items:
+          - enum:
+              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
+              - renesas,r9a07g054-mipi-dsi # RZ/V2L
+          - const: renesas,rzg2l-mipi-dsi
 
   reg:
     maxItems: 1
@@ -49,34 +50,56 @@ properties:
       - const: debug
 
   clocks:
-    items:
-      - description: DSI D-PHY PLL multiplied clock
-      - description: DSI D-PHY system clock
-      - description: DSI AXI bus clock
-      - description: DSI Register access clock
-      - description: DSI Video clock
-      - description: DSI D-PHY Escape mode transmit clock
+    oneOf:
+      - items:
+          - description: DSI D-PHY PLL multiplied clock
+          - description: DSI D-PHY system clock
+          - description: DSI AXI bus clock
+          - description: DSI Register access clock
+          - description: DSI Video clock
+          - description: DSI D-PHY Escape mode transmit clock
+      - items:
+          - description: DSI D-PHY PLL multiplied clock
+          - description: DSI AXI bus clock
+          - description: DSI Register access clock
+          - description: DSI Video clock
+          - description: DSI D-PHY Escape mode transmit clock
 
   clock-names:
-    items:
-      - const: pllclk
-      - const: sysclk
-      - const: aclk
-      - const: pclk
-      - const: vclk
-      - const: lpclk
+    oneOf:
+      - items:
+          - const: pllclk
+          - const: sysclk
+          - const: aclk
+          - const: pclk
+          - const: vclk
+          - const: lpclk
+      - items:
+          - const: pllclk
+          - const: aclk
+          - const: pclk
+          - const: vclk
+          - const: lpclk
 
   resets:
-    items:
-      - description: MIPI_DSI_CMN_RSTB
-      - description: MIPI_DSI_ARESET_N
-      - description: MIPI_DSI_PRESET_N
+    oneOf:
+      - items:
+          - description: MIPI_DSI_CMN_RSTB
+          - description: MIPI_DSI_ARESET_N
+          - description: MIPI_DSI_PRESET_N
+      - items:
+          - description: MIPI_DSI_ARESET_N
+          - description: MIPI_DSI_PRESET_N
 
   reset-names:
-    items:
-      - const: rst
-      - const: arst
-      - const: prst
+    oneOf:
+      - items:
+          - const: rst
+          - const: arst
+          - const: prst
+      - items:
+          - const: arst
+          - const: prst
 
   power-domains:
     maxItems: 1
@@ -130,6 +153,41 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: ../dsi-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-mipi-dsi
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+
+        clock-names:
+          maxItems: 5
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          maxItems: 2
+    else:
+      properties:
+        clocks:
+          minItems: 6
+
+        clock-names:
+          minItems: 6
+
+        resets:
+          minItems: 3
+
+        reset-names:
+          minItems: 3
+
 examples:
   - |
     #include <dt-bindings/clock/r9a07g044-cpg.h>
-- 
2.49.0

