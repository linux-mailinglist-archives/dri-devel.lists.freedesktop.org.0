Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EDBB4A173
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 07:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC0C10E056;
	Tue,  9 Sep 2025 05:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ClG7FGkY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A560810E056
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 05:46:49 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5895kVxH217479;
 Tue, 9 Sep 2025 00:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757396791;
 bh=yjJby7j9yt/5+ggjhTawrBW65UMydPYpCjdJvSOfSss=;
 h=From:To:CC:Subject:Date;
 b=ClG7FGkYrrZ+zYbEBaa27ZHWY53bSj6x0WAKPrKB+OqR6v3IKWTbAEww1RcLTzc79
 SZ8zgidrlJtYLfNYTM2RTb0sGuBzDTdwOvy6OzgMUsxOIsbZXub8W0xhNVjP2IPjm1
 gqowYtuBss3nCqdJ179D1rq4NFzAHX4pICsg2A44=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5895kU4E3553049
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 9 Sep 2025 00:46:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 00:46:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 00:46:30 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5895kMi32114917;
 Tue, 9 Sep 2025 00:46:23 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <sjakhade@cadence.com>, <yamonkar@cadence.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
 <s-jain1@ti.com>
CC: <h-shenoy@ti.com>
Subject: [PATCH v4] dt-bindings: drm/bridge: MHDP8546 bridge binding changes
 for DSC
Date: Tue, 9 Sep 2025 11:16:22 +0530
Message-ID: <20250909054622.1439487-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
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
Changelog v3 -> v4:
-Remove maxItems as item list is mentioned for reg-names, resolves 
dt_bindings_check warning.
Log link- <https://gist.github.com/h-shenoy/5391ea514bb58a6cba3f39248d20916b>
Link to v3- https://lore.kernel.org/all/20250908054609.1113360-1-h-shenoy@ti.com/

 .../bindings/display/bridge/cdns,mhdp8546.yaml | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index c2b369456e4e..b40630de6d89 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -27,6 +27,8 @@ properties:
           Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
       - description:
           Register block of mhdptx sapb registers.
+      - description:
+          Register block for mhdptx DSC encoder registers.
 
   reg-names:
     minItems: 1
@@ -34,6 +36,7 @@ properties:
       - const: mhdptx
       - const: j721e-intg
       - const: mhdptx-sapb
+      - const: dsc
 
   clocks:
     maxItems: 1
@@ -100,18 +103,25 @@ allOf:
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

