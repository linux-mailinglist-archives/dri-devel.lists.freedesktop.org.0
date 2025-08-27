Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B23DB380FC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D370B10E7B7;
	Wed, 27 Aug 2025 11:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="SYs+iG/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C016410E7B7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 11:25:53 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57RBPiNI1268705;
 Wed, 27 Aug 2025 06:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756293944;
 bh=67d1xSHgvTczyND6wpoY8zEcVZHuf8z3HXN6q3PA9oI=;
 h=From:To:Subject:Date;
 b=SYs+iG/Hfj7/8g2qrhGY+rXsDDkNdwbUr//N9Puhhwq1iGKZ2syRh34shPHNixbbb
 uWoczHwzqZSPLXYidqTbTmaOkub1b2Pjnv1nAM53rBJCU9H6sIIbFCZQTkne8zcSKw
 j4DwWQH+bjLWlAW4CobV66glI6jDsB57czQpRbXI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57RBPhPh2102283
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 27 Aug 2025 06:25:43 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 27
 Aug 2025 06:25:43 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Wed, 27 Aug
 2025 06:25:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 27 Aug 2025 06:25:43 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57RBPd6G3016433;
 Wed, 27 Aug 2025 06:25:40 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <linus.walleij@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v2] dt-bindings: display: dsi-controller: add bridge to
 patternProperties
Date: Wed, 27 Aug 2025 16:55:39 +0530
Message-ID: <20250827112539.4001513-1-h-shenoy@ti.com>
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

Extend the DSI controller schema to allow bridge child nodes.
This makes it possible to describe external bridge devices directly
connected as DSI peripherals.

Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
Changelog v1 --> v2:
- Updated patternProperties regex.
- Improved commit message.

 Documentation/devicetree/bindings/display/dsi-controller.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
index 67ce10307ee0..bb4d6e9e7d0c 100644
--- a/Documentation/devicetree/bindings/display/dsi-controller.yaml
+++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
@@ -46,7 +46,7 @@ properties:
     const: 0
 
 patternProperties:
-  "^panel@[0-3]$":
+  "^(panel|bridge)@[0-3]$":
     description: Panels connected to the DSI link
     type: object
 
-- 
2.34.1

