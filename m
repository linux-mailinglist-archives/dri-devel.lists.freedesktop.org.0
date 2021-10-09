Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EED427DF0
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 00:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F98A6E213;
	Sat,  9 Oct 2021 22:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2006E214
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 22:42:21 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0C4AC834BF;
 Sun, 10 Oct 2021 00:42:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1633819339;
 bh=u9+ACzaISDsBmhCLEnJQY1LzmFxhwkgdWAtWhi+A4O8=;
 h=From:To:Cc:Subject:Date:From;
 b=cJlqcU44nFOsycIPbaiTzrT2e1JE9SdPp8E2vqAC3+5ErmCaSyJVJ7Rpp48ENdoNU
 7YuZkwT3+0s8MILjcXQa6nEwqkVf4OELgRtMIIaC+uBpZrU/1heD1scvCV1Zo5vtzu
 KLTtYL05XyCQFr2TN6S0/eaiLsDj4IrScSf94VgODjVAe8XdW15w3P2ZaITFudByD3
 49/7muf9NETdpdxChQ0X+slVkR5vX59tLIxVRPNDUltfmz3tryI1L7S8IX+1oIyF54
 6Y5AC3vNw5NfNJSfChzCVS6zgT6tlknmTG83BYerKpTZq2zdAuumIG5twZuKRkJ80w
 PJQK1opdEiuwA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: display: bridge: lvds-codec: Document
 LVDS data mapping select
Date: Sun, 10 Oct 2021 00:41:51 +0200
Message-Id: <20211009224152.427219-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

Decoder input LVDS format is a property of the decoder chip or even
its strapping. Add DT property data-mapping the same way lvds-panel
does, to define the LVDS data mapping.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
V2: - Use allOf
    - Move the data-mapping to endpoint
V3: - Rebase on V2 submitted a while ago, reinstate changelog
    - Drop the allOf and un-rebase on previous pclk patch
V4: - port@1, remove $ref: /schemas/graph.yaml#/properties/port and
      add $ref: /schemas/graph.yaml#/$defs/port-base
V5: - Move the data-mapping property to port@0 , decoder LVDS input
    - Add RB from Laurent
---
 .../bindings/display/bridge/lvds-codec.yaml   | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 304a1367faaa..1faae3e323a4 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -49,11 +49,26 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description: |
           For LVDS encoders, port 0 is the parallel input
           For LVDS decoders, port 0 is the LVDS input
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-mapping:
+                enum:
+                  - jeida-18
+                  - jeida-24
+                  - vesa-24
+                description: |
+                  The color signals mapping order. See details in
+                  Documentation/devicetree/bindings/display/panel/lvds.yaml
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: |
@@ -71,6 +86,22 @@ properties:
 
   power-supply: true
 
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          const: lvds-decoder
+then:
+  properties:
+    ports:
+      properties:
+        port@0:
+          properties:
+            endpoint:
+              properties:
+                data-mapping: false
+
 required:
   - compatible
   - ports
-- 
2.33.0

