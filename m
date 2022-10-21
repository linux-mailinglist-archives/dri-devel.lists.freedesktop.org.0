Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD85607D50
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 19:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFC710E411;
	Fri, 21 Oct 2022 17:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4214810E411
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 17:18:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29LHITus034150;
 Fri, 21 Oct 2022 12:18:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1666372710;
 bh=WHTNduQTN6mCQRbvGwsq1IEXZt28FceTbWv2qs0q8yk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=HsDzePiFIjgem4lz537c1wlvpiB+jCyklWl3ZsmMuX7kmaYG1tQFmDvdw73fXWflH
 O8cVn6y5kP6pDplfJRdVHD7P4bNWvbStRaIXedXORt3p7hm6Qta/EO0ZpyHs9Eo1OP
 fakJKmU0nMU0CnquG9M3Zf+UdpNWumB6CWiblI1M=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29LHIT1i017572
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 21 Oct 2022 12:18:29 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 21
 Oct 2022 12:18:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 21 Oct 2022 12:18:29 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29LHISse129481;
 Fri, 21 Oct 2022 12:18:29 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <dri-devel@lists.freedesktop.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v8 2/5] dt-bindings: display: bridge: cdns,
 dsi: Add compatible for dsi on j721e
Date: Fri, 21 Oct 2022 22:48:17 +0530
Message-ID: <20221021171820.15984-3-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221021171820.15984-1-r-ravikumar@ti.com>
References: <20221021171820.15984-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 jpawar@cadence.com, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, vigneshr@ti.com, devicetree@vger.kernel.org,
 robert.foss@linaro.org, andrzej.hajda@intel.com, sjakhade@cadence.com,
 lee.jones@linaro.org, Rahul T R <r-ravikumar@ti.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible to support dsi bridge on j721e

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/cdns,dsi.yaml     | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
index 3161c33093c1..23060324d16e 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
@@ -16,9 +16,15 @@ properties:
   compatible:
     enum:
       - cdns,dsi
+      - ti,j721e-dsi
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description:
+          Register block for controller's registers.
+      - description:
+          Register block for wrapper settings registers in case of TI J7 SoCs.
 
   clocks:
     items:
@@ -67,6 +73,23 @@ properties:
 allOf:
   - $ref: ../dsi-controller.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,j721e-dsi
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+        power-domains:
+          maxItems: 1
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.38.0

