Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A439E566C28
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 14:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3382F14A23D;
	Tue,  5 Jul 2022 12:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4DD14A236
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 12:11:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 265CBVJS048821;
 Tue, 5 Jul 2022 07:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1657023091;
 bh=JI6LrYkRvcXaKdPV76i9fhijESgbnGvtmEoKh8ex9kQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fOOxsmdR/PfYMpg1mc7Jd3ge66AR2R2ATnSrA7zxC7EDFlMrh2K8yGVBVRTrsstu1
 2OzXvewyCIm/ufanoUmXkadImAhuocipaHzuyOR1FkaZhcYgT4kTHLwEctFwpgbcoh
 tMJvM6aK+N9DObXpGPToTrGa7b3AF8JxL69gC/GE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 265CBVKl008858
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Jul 2022 07:11:31 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Jul 2022 07:11:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Jul 2022 07:11:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 265CBTkL098983;
 Tue, 5 Jul 2022 07:11:30 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <dri-devel@lists.freedesktop.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 2/5] dt-bindings: display: bridge: cdns,
 dsi: Add compatible for dsi on j721e
Date: Tue, 5 Jul 2022 17:41:13 +0530
Message-ID: <20220705121116.24121-3-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705121116.24121-1-r-ravikumar@ti.com>
References: <20220705121116.24121-1-r-ravikumar@ti.com>
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
 tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, vigneshr@ti.com,
 devicetree@vger.kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 jpawar@cadence.com, lee.jones@linaro.org, Rahul T R <r-ravikumar@ti.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible to support dsi bridge on j721e

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 .../bindings/display/bridge/cdns,dsi.yaml     | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
index ccedc73d8c18..33a88b39cf09 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
@@ -14,13 +14,17 @@ description: |
 
 properties:
   compatible:
-    items:
-      - const: cdns,dsi
+    enum:
+      - cdns,dsi
+      - ti,j721e-dsi
 
   reg:
+    minItems: 1
     items:
       - description:
           Register block for controller's registers.
+      - description:
+          Register block for wrapper settings registers in case of TI J7 SoCs.
 
   clocks:
     items:
@@ -74,6 +78,22 @@ properties:
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
+    else:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.36.1

