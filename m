Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195859E5786
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9372410EE79;
	Thu,  5 Dec 2024 13:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EtoGV4yP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E103E10EE79
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 13:45:34 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3AEB1063;
 Thu,  5 Dec 2024 14:45:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733406305;
 bh=Cj2VeJ8uFjY3w3v+Ynbvv8L6oauOfCaE6Fq+A8xrCKE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EtoGV4yPESKmwBJjWkx/TOSPWqmE02KXG6DgsTn6tU75eEOzBohhcq7DEHd9ir+yU
 8ivY4stnWXlPKy4BDGEWdPWBmhylw3kfANjdd+3Ig0JpJC8T5Q9ZX5k0IZb/ykoZeR
 ttv1a3PkxFPuHrDSE3tlMXU9N3ZosBrUiJE/5sJ0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:44:59 +0200
Subject: [PATCH v2 04/10] dt-bindings: display: renesas,du: Add r8a779h0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-4-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+C1FPFSno+ZBvGJfrkZWI9g3QFl0y7ZqagIAzaX59o8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa5yRvrQv1Nkv4l0aaXGR+R1m8Ps9diRJC2D9
 OJG64sSBGKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GucgAKCRD6PaqMvJYe
 9UN2D/sHIfsWlmb2GoR2sxyQyDbhd/fWXRTAPBso0DgmrSx4e4vTdR9WquOwvnhM4Th5GbvKUds
 zFIFxe9bSYxtDYhnqhAFY7fJ8tXmGNUY1a95GoYwzeLShOuDDkb3MdAmx2C7qBh0Pa4a/cgdoLT
 GeWhF/0i8MEt8GMQWxe09Mn4B8DoEJjhxOPzu8M/K78LjoXSl8uP4RQt4O/yjG4sC8AwftOnZ3b
 DGADS7JLdejrEUpOnW91t9N7T1j+Z68S07067h41PdZpe4Mu0CX9ZthtKEW2N5QZSY+3aWVmeKE
 c+sKJbPMP5M80qctGujaFh43JE8+BtHgEPimaoSXsGrFZer2nKS82ZGeEEL6Sg8AvNZUbkQHGnJ
 5G55joETgVPwZH9DsdBZF+ZNqedEN6Dq/ccnnworGwpANrg7yk/OqCPjU7rwO6Lemz44vnO7hab
 jFJCUHGOXJIZ5HzYVby+m/PzQxro927C+dzQxRPSCHn91Lp60eFscxMyJZ/bnRFmuRBkyJSE9uB
 a0umVevBJrwRL0j4UxZrPFg5yZ0ZF21dROTZULliuXeQCHWpGgnbxg8+SR/FLHqin7pigvk9uA1
 JtULLsFxFY3vEwIZgpHF1H6qDQxA6KNHp1nF/Zw7wxL/NdaI8j1RcTpyqc0lttQEbUEjfCheAkB
 0ihMGj6aJMWYUsA==
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
 .../devicetree/bindings/display/renesas,du.yaml    | 52 ++++++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index c5b9e6812bce..7dec47aea052 100644
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
@@ -807,6 +804,53 @@ allOf:
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

