Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076B0B57656
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6024010E400;
	Mon, 15 Sep 2025 10:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="axBI9NTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F67210E400
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:31:17 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58FAUxZ21539487;
 Mon, 15 Sep 2025 05:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757932259;
 bh=gPbfCrU2+tMJUcXDYrWW9bFsDqt9+EBYv3JCh/FESQI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=axBI9NTTMucjHemvOu+NI6NIyHSbAiVuuKiKDojd2+uhHa3FcFplYs/bGGoy+yDoZ
 DWiJybUv//njKtYqYabIbZpfCW1L53ev1OCngDpS/HywrZRPLj3HdJ53+x2sOY8vLW
 dEYbFxvKP3hHfbNsid6rYMFucXKJ+qNQ0oEMjxxA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58FAUx5k676719
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 15 Sep 2025 05:30:59 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 15
 Sep 2025 05:30:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Sep 2025 05:30:58 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208]
 (may be forged))
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58FAUfRe3600864;
 Mon, 15 Sep 2025 05:30:50 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <sjakhade@cadence.com>, <yamonkar@cadence.com>,
 <lumag@kernel.org>, <dianders@chromium.org>, <jani.nikula@intel.com>,
 <luca.ceresoli@bootlin.com>, <andy.yan@rock-chips.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
 <s-jain1@ti.com>, <tomi.valkeinen@ideasonboard.com>
CC: <h-shenoy@ti.com>
Subject: [PATCH v5 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for DSC
Date: Mon, 15 Sep 2025 16:00:40 +0530
Message-ID: <20250915103041.3891448-2-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915103041.3891448-1-h-shenoy@ti.com>
References: <20250915103041.3891448-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

From: Swapnil Jakhade <sjakhade@cadence.com>

Add binding changes for DSC(Display Stream Compression) in the MHDP8546
DPI/DP bridge.

Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../display/bridge/cdns,mhdp8546.yaml         | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index c2b369456e4e..2a05a7d5847f 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -27,13 +27,12 @@ properties:
           Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
       - description:
           Register block of mhdptx sapb registers.
+      - description:
+          Register block for mhdptx DSC encoder registers.
 
   reg-names:
-    minItems: 1
-    items:
-      - const: mhdptx
-      - const: j721e-intg
-      - const: mhdptx-sapb
+    description:
+      Names corresponding to entries in the reg property.
 
   clocks:
     maxItems: 1
@@ -100,18 +99,25 @@ allOf:
       properties:
         reg:
           minItems: 2
-          maxItems: 3
+          maxItems: 4
         reg-names:
           minItems: 2
-          maxItems: 3
+          items:
+            - const: mhdptx
+            - const: j721e-intg
+            - const: mhdptx-sapb
+            - const: dsc
     else:
       properties:
         reg:
           minItems: 1
-          maxItems: 2
+          maxItems: 3
         reg-names:
           minItems: 1
-          maxItems: 2
+          items:
+            - const: mhdptx
+            - const: mhdptx-sapb
+            - const: dsc
 
 required:
   - compatible
-- 
2.34.1

