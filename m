Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6E165AF72
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E0D88668;
	Mon,  2 Jan 2023 10:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C6710E2F2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:19:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 302A9qqU020600;
 Mon, 2 Jan 2023 04:09:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1672654192;
 bh=Mg3AyUN846SUQjhDjid9cnT80rRAdCVQ+lIWPCNutzU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=pkZzgY3EPQPnSgVX9p95IzurRCh8wIpBAfUWmFPmRAvDuTGSU/ou+R/w3DuZYdbYw
 7KeAaWfxpWUQRpfxHYQ7NlYSaJuD0Zzc4SBimG06cEH95IRY/New6+WfZEIP6kQH/y
 5wuyjcltRBILivyqpgcBiMxeeSLIt2Jj9AitHkFw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 302A9qHB019771
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Jan 2023 04:09:52 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 2
 Jan 2023 04:09:52 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 2 Jan 2023 04:09:52 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 302A9olm014119;
 Mon, 2 Jan 2023 04:09:51 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <dri-devel@lists.freedesktop.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 2/5] dt-bindings: display: bridge: cdns,
 dsi: Add compatible for dsi on j721e
Date: Mon, 2 Jan 2023 15:39:39 +0530
Message-ID: <20230102100942.1828-3-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102100942.1828-1-r-ravikumar@ti.com>
References: <20230102100942.1828-1-r-ravikumar@ti.com>
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
2.39.0

