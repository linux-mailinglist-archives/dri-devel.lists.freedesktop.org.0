Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60867AC9485
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 19:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B236410E821;
	Fri, 30 May 2025 17:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DF6hmorz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D5A10E7F8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:18:56 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a3758b122cso1484685f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748625535; x=1749230335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7h13WzJkQLQSnoZkHLJqQ5H4JRARwyv4OMjokFuUIjs=;
 b=DF6hmorzBWn0hN63y7Dr2bsMxY/yctYcTdCuxIE3w9doKoZpiMk7m8c/VRfx2gFLrC
 pqAqyq+sfuUsNTamiYhIYdKdM9LNNkW+lo1uGJUPFE5WHE7WQtgykrBGMav030/ZK08l
 N2BKX/aRPO0bx6KHjE5CCIBC1uj1taqZwuUtN8lnpVYjH1URg5usM9l6rgCQawGPX8Ev
 OKk8ICMMj77aKmPJmD1+O2s/Tv23LIUY48IOB5jKjAe6w9Ig42/lOAnl/klcNxsoBUDP
 3Lmr6tSCvfqOqfn2luyxG/w6wNRAqOSnGHa05xIslm2ppz4/vf0mpflMC4mHZXiFscew
 JIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748625535; x=1749230335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7h13WzJkQLQSnoZkHLJqQ5H4JRARwyv4OMjokFuUIjs=;
 b=TrkegpVMbsszgu5d/lLOXCdvilZhHKWyieK0dcz3I5eU4REM6ZiPYKUXY5RSYb12hX
 F9wq/ukMfvTKeeSsIRGeVtDpc2p73GsfhBeKR4b/lVMgVLZumA2Ib4h2SBKdl5jcVycU
 7LszUXTImqQZMCaNSG5cB2SNwlsePqMyOPj761OOqFqRizoL2XP979d9y/FfwZyG2xi0
 rrlCvtGu36mGtb1mk0HJxcG3q2J4Sn/cvvcXoONR9EqZXOJSnYqZtLzfn3fQJfQ9a15v
 DK1iiXQDwL0vwWDIScunqX7ML0Rg1Kndu6AAAjfOMzMDQ+E4MYJsgnDiEZby/o/RMbsj
 LC5w==
X-Gm-Message-State: AOJu0YxTvi2KiDWUn1HtRLQ4bNnsyXCWAa8Cq+raVQ8jFM1AvkKHtMjm
 bHrhgjoEQvmnQPxocBzUmB9Ezo366VHTULgF0ZyKRu3Qqns57fxwqSLy
X-Gm-Gg: ASbGncuTpPRLfncklOO360pEbwoVck1t/fjI5uvc2nFpmZ2OthRZAQRbCOGtRKH+TgV
 EIn+3FEa9I2odrepyWceYu45eFNwy0vFzBg425voSajxN7vk1aV5UyrHvWFW05Fi31EsUDti27H
 SgduFA57I1dH0fVz6l2gTsIfjHLqwyuKIkspugLh9xkpwSP9g416CfxsDJeHZj0LPWQBNDq2DCO
 5siELT+gBjlH7h8piCJ+T46iLlsKHSyUcmcvV5UQ7pyxFNIU+AaYAhOHujPKbpeUjk7v107ccNI
 J6E+7JHflYdmksSAZ73NCfRJA4i6KL0u3EOkmXFzvklJJGU11hDi6yNRQdlMNrBgF2GwmAjaFiC
 md8kQLcQDmMmXhFXJgWOj
X-Google-Smtp-Source: AGHT+IH2idWWZFXjlSQOopaIOLY+xY1Y90qwyjkVZC1ZhF8cdwvuECG6UW/WmMELJgLtk/CXIY6DOA==
X-Received: by 2002:a05:6000:2887:b0:3a4:f6d6:3d61 with SMTP id
 ffacd0b85a97d-3a4f7ab160cmr3201827f8f.57.1748625534893; 
 Fri, 30 May 2025 10:18:54 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00972c1sm5395963f8f.68.2025.05.30.10.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 10:18:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 3/4] dt-bindings: display: bridge: renesas,
 dsi: Add support for RZ/V2H(P) SoC
Date: Fri, 30 May 2025 18:18:40 +0100
Message-ID: <20250530171841.423274-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5->v6:
- Preserved the sort order (by part number).
- Added reviewed tag from Geert.

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
index e08c24633926..8c7e2b17ba79 100644
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
+      - items:
+          - enum:
+              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
+              - renesas,r9a07g054-mipi-dsi # RZ/V2L
+          - const: renesas,rzg2l-mipi-dsi
+
       - enum:
-          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
-          - renesas,r9a07g054-mipi-dsi # RZ/V2L
-      - const: renesas,rzg2l-mipi-dsi
+          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
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

