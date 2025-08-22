Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BC7B32240
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 20:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FEF10E0B9;
	Fri, 22 Aug 2025 18:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="xRTKwQBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8779A10E0B9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 18:24:05 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MINvRm306643;
 Fri, 22 Aug 2025 13:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755887037;
 bh=3vp4u9E91bDnJI9ZnVKLu6phUXs9zAW+YqhtjTBNiYA=;
 h=From:To:Subject:Date;
 b=xRTKwQBdq9BI5pFShYGPstDI1bwkM5B/kufPKGUIDLZB1UJpD8eYID+JzSz6pLJMc
 YA4sEAvvyQ2sAE/yLA14cOf0uGy159kXle/x4qnO1kyvNJVue2wxs72PaNbwZvB3iM
 cKH3eOXN0nUk/i0EGAoypC+RaH1xDgzwym/NLOpY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MINvYc3099791
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 22 Aug 2025 13:23:57 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 13:23:56 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.55; Fri, 22 Aug
 2025 13:23:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 13:23:56 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MINqVp3948777;
 Fri, 22 Aug 2025 13:23:53 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <linus.walleij@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH] dt-bindings: display: dsi-controller: add bridge to
 patternProperties
Date: Fri, 22 Aug 2025 23:53:52 +0530
Message-ID: <20250822182352.2006834-1-h-shenoy@ti.com>
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

This patch extends the binding schema by adding a new `bridge@[0-3]` to
represent any bridge devices attached as DSI peripheral.

Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../bindings/display/dsi-controller.yaml       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
index 67ce10307ee0..d7ca700070a9 100644
--- a/Documentation/devicetree/bindings/display/dsi-controller.yaml
+++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
@@ -73,6 +73,24 @@ patternProperties:
     required:
       - reg
 
+  "^bridge@[0-3]$":
+    description: Bridge connected to the DSI link
+    type: object
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+        description:
+          The virtual channel number of a DSI peripheral. Must be in the range
+          from 0 to 3, as DSI uses a 2-bit addressing scheme. Some DSI
+          peripherals respond to more than a single virtual channel. In that
+          case the reg property can take multiple entries, one for each virtual
+          channel that the peripheral responds to.
+
+    required:
+      - reg
+
 additionalProperties: true
 
 examples:
-- 
2.34.1

