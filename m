Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C39F0E47
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 15:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B4A10F02E;
	Fri, 13 Dec 2024 14:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OK/K0M/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092A210F01A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:03:24 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23C8DF89;
 Fri, 13 Dec 2024 15:02:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734098568;
 bh=s8GnwIastABqRYEgykdh0qV/3mI75TJf2ezU8ZRKyls=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OK/K0M/gdrW8l2SKVhlE4xSB7HFjh3NAUDxd7Su+XtFDnpWo1NXFUctBuR1Mwp55Y
 UQGu/nqBUV+mKjLq1w7PVftoHrJGxu3tDzA+b3W8WYKz9/6db4ST9LNzBjXazOn0oW
 dPAu0wUOm1+jvUJQPT4zMw46uk3zelobtWFVEVCo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 13 Dec 2024 16:03:00 +0200
Subject: [PATCH v4 4/7] dt-bindings: display: renesas,du: Add r8a779h0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-rcar-gh-dsi-v4-4-f8e41425207b@ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
In-Reply-To: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2567;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=DlMcRdYcnOPSOXZIM2VtaP0Ahd5x/Ya+ls1XSUX4y2M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnXD6glDgmqkhLH0IZeJC6ZrUOcPFWbnQ8ITbod
 zDTExHobMOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1w+oAAKCRD6PaqMvJYe
 9eQgD/0TndBrULvtWLewQlxlpLdHIAMKwdolvYhHdA0mb7+bQqGmB61hZi7nPPFJyH3z1IeqM9d
 jq1+D6h6xPtY8O5wa7ESWEelrLMnukisV7zv8+zGAeb3N7VOdS7qNdxhcYsMjMHfH7r3Xxkj+xX
 Ge1ttqhiNuVbhvi/Lm3A8QW2wD3NVWNTeL2GgawKFVrmK19QRQ6taIuY2oQ7vy8oV7AsW+FpWTB
 Zx5KPfhtGlqIrLU1r19bZuOt33em/6Qn9c+EsGIBTpORaaOxRqxqdEIUJKSt1xGR403MZIzGXz3
 y35KGsiDWsdlXAtCzs9UqPv4Cesv4zJZQbKlG4eHfPIfE8EDrV0VXdt0N9nBiS99nwat5YbyAiW
 8WR2ocArMjBg8vTB0eJHYlyVr5uGmVm4ddnpYXmLjzb8IvjFhNBW9EGO37DyThwztgE4EiX9fC4
 TV/KJjGmWJZD9SXFqDdTKyxUV4uR5AhzBRQ/OnxBAkCEF5U5ky6mzEFDGuBhXWV8evWYj7gOdMq
 u43jWUskHcRYe5efqRzYtE5ZM1RCtT1bu0puJSyKmECmR/BWLeA/gSqnUAh+3lg3Errqo4fsy8o
 Zlfk0EiAN/EHQkiIyMLDZol01nqr/MUxo9VAo8nPH5g12EaaoQOtGAiaz1/JEzGEF6QQQeQDlmn
 /3NM6jTJpsvAChQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Extend the Renesas DU display bindings to support the r8a779h0 V4M.

Note that we remove the requirement for two ports from the global part
of the bindings, as each conditional part defines the number of required
ports already. This came up with r8a779h0 as it's the first one that has
only one port.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/display/renesas,du.yaml    | 53 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index e5fbc4ffe29c..1b4cd8fac825 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -41,6 +41,7 @@ properties:
       - renesas,du-r8a77995 # for R-Car D3 compatible DU
       - renesas,du-r8a779a0 # for R-Car V3U compatible DU
       - renesas,du-r8a779g0 # for R-Car V4H compatible DU
+      - renesas,du-r8a779h0 # for R-Car V4M compatible DU
 
   reg:
     maxItems: 1
@@ -69,10 +70,6 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         unevaluatedProperties: false
 
-    required:
-      - port@0
-      - port@1
-
     unevaluatedProperties: false
 
   renesas,cmms:
@@ -817,6 +814,54 @@ allOf:
         - reset-names
         - renesas,vsps
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a779h0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Functional clock
+
+        clock-names:
+          items:
+            - const: du.0
+
+        interrupts:
+          maxItems: 1
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DSI 0
+            port@1: false
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+
+        renesas,vsps:
+          minItems: 1
+          maxItems: 1
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

