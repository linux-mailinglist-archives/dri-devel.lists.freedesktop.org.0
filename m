Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7AA93DA8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA79F10E3AB;
	Fri, 18 Apr 2025 18:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OJTklh9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1A310E275
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso20299045e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002032; x=1745606832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kZNBBcR2M8Y/5VP20+u5ALNuftmnVQQo1BWxYc8E9fQ=;
 b=OJTklh9NXAwYpVbbBDmcZ/HcLp6OfZNLZsSGMhypThJ+bF+1B71Owh1IyhCNNJXT1u
 HV9fvojPkLrcTqKzJsGRh9OLBQWxXYpn9/kHfcPEe0q3Slfd4SDQvd09hEA3xJW/FV67
 jc6xfOIJATqVj/E61x+nj6uD29wk8L7ACm9rhCe5wMgcyDSp0zAH0/mlenRaPNxXqcha
 SvuEUr8hj/xniM2uIlQSvPGZx1UYldE/sJjbTK4nTPbhiMF3kiNbmxuLCnNwhQ6TEQCB
 zvBeoxqcCeqozb5+R+CW7AaZunCu9bDViewX2G1DHOqPh2LLLe/YSaH5NzgSEN/L6/GA
 4nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002032; x=1745606832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kZNBBcR2M8Y/5VP20+u5ALNuftmnVQQo1BWxYc8E9fQ=;
 b=EyOThdT/FBmmi/RsXktBSgUarUCAKtlc59iYNf9wDesC5Qus4T0IiYz6xc3teYWv7w
 KmSWuTDtmyBb2gjcJfopZogM+B2QaSEuMoxXjvMzjkTsEBM4G9ewIPDgdZE699r/H2DE
 a1m8IdcW9q8y1fk0Xc8RBBpNTICt3BB5EDoUl1g6kRQMJrd/U0mzm0AOVw/+I0zqltf/
 teRFCjpx40msDWiInMLdAl9uYnXAdFXElo6jAiFoUbSPzDLL5YxrWOZHe31o6ipmfkof
 OILMt58I8QQGVHsdC6s3S/54T4WLGWjKj5cyql0M04TW4sbHQfz6+Api8R4fmAf9Dapv
 i1Ng==
X-Gm-Message-State: AOJu0YziGWlUz2bYP9hSdfqnSdG1zr0aywWSNWdM+y1Ylp4N3XAIksGO
 ctOJ+5lpitWHvIhrvjjftMPxHc03seacAlcLidJ8HASXx6wUN+Jz
X-Gm-Gg: ASbGncsWZqzBEl7ZurjPkZkaDHZj910zvSczKiVplSPBnTZoxTXipAfNUc3Y2R5cKH6
 aQRZRZJysI496/bth9g13aQfGmGW8RNQMrZp6XFwHObMHuEWldI7SYuge/vkNORHP1K6tCoy/tq
 4D8Skjyq50P5tvuLSj7mFYwdLdIxPiGT+U3eDhIL6UpnXfGviIlgMUE16kIJxuoYzDqKA5AgQUM
 VOaLcOV4zjDZuEhvmeJ5GDbILl1+4D05MgGSLptKXEloQfgNJBa2Pfdzl/cDmEM2mmhaBLM5/Yf
 Ega7ngh11+4zHuY1SO6Fx8cIg5GaHov0fFLjd43i1akhbSi3mngkNa7koOX3hSeB/w==
X-Google-Smtp-Source: AGHT+IFfw7ZnSqeRFrgYbx7UP4/0/xBnRaa4Kr11SsYoKPv+VoyqssOKgGovJp9wgMdTTWAUrP1fiQ==
X-Received: by 2002:a05:600c:1e15:b0:43d:82c:2b23 with SMTP id
 5b1f17b1804b1-4406abfaae3mr27038495e9.23.1745002031599; 
 Fri, 18 Apr 2025 11:47:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:11 -0700 (PDT)
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
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 04/15] dt-bindings: display: bridge: renesas,
 dsi: Add support for RZ/V2H(P) SoC
Date: Fri, 18 Apr 2025 19:46:47 +0100
Message-ID: <20250418184658.456398-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- No changes

v1->v2:
- Added enum for RZ/V2H as suggested by Krzysztof as the list
  will grow in the future (while adding RZ/G3E SoC).
- Added Reviewed-by tag from Krzysztof.
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

