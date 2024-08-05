Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044E2947F28
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 18:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEBC10E248;
	Mon,  5 Aug 2024 16:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4980710E247
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 16:22:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.09,265,1716217200"; d="scan'208";a="214738307"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 06 Aug 2024 01:22:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.197])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 19EF34009403;
 Tue,  6 Aug 2024 00:52:50 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: display: renesas,
 rzg2l-du: Document RZ/G2UL DU bindings
Date: Mon,  5 Aug 2024 16:52:35 +0100
Message-ID: <20240805155242.151661-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
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

Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
SoC, but has only DPI interface.

While at it, add missing required property port@1 for RZ/G2L and RZ/V2L
SoCs. Currently there is no user for the DPI interface and hence there
won't be any ABI breakage for adding port@1 as required property for
RZ/G2L and RZ/V2L SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Replaced ports->port property for RZ/G2UL as it supports only DPI.
   and retained ports property for RZ/{G2L,V2L} as it supports both DSI
   and DPI output interface.
 * Added missing blank line before example.
 * Dropped tags from Conor and Geert as there are new changes.
v1->v2:
 * Updated commit description related to non ABI breakage.
 * Added Ack from Conor.
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 35 +++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 08e5b9478051..ca01bf26c4c0 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
       - items:
           - enum:
@@ -60,8 +61,9 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         unevaluatedProperties: false
 
-    required:
-      - port@0
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Connection to the DU output video port.
 
     unevaluatedProperties: false
 
@@ -83,11 +85,38 @@ required:
   - clock-names
   - resets
   - power-domains
-  - ports
   - renesas,vsps
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g043u-du
+    then:
+      properties:
+        port:
+          description: DPI
+
+      required:
+        - port
+    else:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1:
+              description: DPI
+
+          required:
+            - port@0
+            - port@1
+      required:
+        - ports
+
 examples:
   # RZ/G2L DU
   - |
-- 
2.43.0

