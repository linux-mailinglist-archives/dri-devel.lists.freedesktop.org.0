Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BE29A1DA2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 10:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7B010E303;
	Thu, 17 Oct 2024 08:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="Foxwse/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2148110E300
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 08:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1729155405; x=1731747405;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7FTIXUBTbKyS5duZobcY1RpkOFb9rEz3FlKeAXNHRxY=;
 b=Foxwse/qk5NDWw7eoxIPZhU6F8SJd353ef2SOtmD+vAZKuwHDZmmf1ZF52V3MfcG
 GLj0pUCy3YxfxH+vQ8PBVH0/g3jTRwM5MSIbyrUl6zfkrRGMB2R8k0+0MfydTJEq
 T4R1RYNFNK9bjosWldgStweGNUmy4q8E+A4ApJ1UzZY=;
X-AuditID: ac14000a-ecaea24000004e2a-87-6710d14d63d7
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 31.81.20010.D41D0176;
 Thu, 17 Oct 2024 10:56:45 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 17 Oct
 2024 10:56:44 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>
CC: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bbrezillon@kernel.org>, <conor+dt@kernel.org>, <krzk+dt@kernel.org>,
 <robh@kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: sil,
 sii9022: Add bus-width
Date: Thu, 17 Oct 2024 10:55:55 +0200
Message-ID: <20241017085556.3045686-2-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241017085556.3045686-1-w.egorov@phytec.de>
References: <20241017085556.3045686-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsWyRpKBR9f3okC6QctyVosT1xcxWdxf/JnF
 YnXLdEaLNXvPMVnMP3KO1eLK1/dsFs/nr2O0OPnmKovFy1n32Cw6Jy5ht7i8aw6bxcKPW1ks
 2jqXsVq833mL0WLSvJusFv/37GC3mP1uP7vFljcTWS2636k7CHvs/baAxWPnrLvsHrM7ZrJ6
 LN7zkslj06pONo8TEy4xedy5tofNY97JQI/73ceZPPq7W1g9Np+u9vi8SS6AJ4rLJiU1J7Ms
 tUjfLoEr49Gvg4wFm3kqDq/ZzdrAuJGzi5GTQ0LAROLrxd/MXYxcHEICS5gk5v18wArhPGaU
 eHGtiRGkik1AXeLOhm+sILaIgJ/ErS/72EGKmAU2MUt8fr0bLCEsECBx7tVboFEcHCwCqhL7
 vkeBmLwClhLTLwRBLJOXmHnpOzuIzSlgJfHp31VmEFsIqGTDj+NsIDavgKDEyZlPWEBsZqD6
 5q2zmSFsCYmDL15A1ctLvLi0nAVm5rRzr5kh7FCJI5tWM01gFJqFZNQsJKNmIRm1gJF5FaNQ
 bmZydmpRZrZeQUZlSWqyXkrqJkZQHIswcO1g7JvjcYiRiYPxEKMEB7OSCO+kLt50Id6UxMqq
 1KL8+KLSnNTiQ4zSHCxK4ryrO4JThQTSE0tSs1NTC1KLYLJMHJxSDYxNfMr75U8vOhy49LK/
 tku70D6/7/mOfKdsNu0KUTwrqNaQ+F275/jbPu43SsZN9V9+LXhX3WX8Ycm0qFONin53vh64
 fyGz7JRwg+ap5Y13Lmet8RGzCfj1IkdYmNPA4kHAOv0/p3d+DAlkVV5T63PKr+hC80r9/WGT
 H2vqzpqxQjrxUPLuNwuUWIozEg21mIuKEwFC3R1V0QIAAA==
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

The SI9022 HDMI transmitter can be configured with a bus-width of 16,
18, or 24 bits. Introduce a bus-width property to the input endpoint,
specifying the number of parallel RGB input bits connected to the
transmitter.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v3: Add Reviewed-by tag from Krzysztof
---
 .../bindings/display/bridge/sil,sii9022.yaml      | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
index 5a69547ad3d7..1509c4535e53 100644
--- a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
@@ -81,9 +81,22 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description: Parallel RGB input port
 
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                description:
+                  Endpoint bus width.
+                enum: [ 16, 18, 24 ]
+                default: 24
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: HDMI output port
-- 
2.34.1

