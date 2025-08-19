Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1987BB2C4A8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F2110E5DD;
	Tue, 19 Aug 2025 13:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="MdiZtMud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8813A10E157
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:08:24 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JD8Bpw2898662;
 Tue, 19 Aug 2025 08:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755608891;
 bh=ECY0T638c1KZ6ND2Cy0e9ISpZNxxtCUFnZoH1Z46FKE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=MdiZtMudLCmshUaB7biwqgMztd+MEetcuzowg61hBe8cfdqrywNaVePVlFBFfZiiM
 fw7KHvTdNmVib0oXpLwzSCbVniE085zDAmMtCWhaWTDsLIhwRyMf9xMhp4CJa3aytA
 2g7Sq3F+QIXKeBchEDPzdHs9n+o/Ac6BRXlrmBJ4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JD8BUm605552
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 19 Aug 2025 08:08:11 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 08:08:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 08:08:10 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JD8AfY3034870;
 Tue, 19 Aug 2025 08:08:10 -0500
From: Nishanth Menon <nm@ti.com>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, <afd@ti.com>,
 <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, Nishanth Menon <nm@ti.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V4 1/5] dt-bindings: display: bridge: it66121: Add compatible
 string for IT66122
Date: Tue, 19 Aug 2025 08:08:03 -0500
Message-ID: <20250819130807.3322536-2-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250819130807.3322536-1-nm@ti.com>
References: <20250819130807.3322536-1-nm@ti.com>
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

Add a new ite,it66122 compatible string to the IT66121 binding
documentation, since the two chips are practically same except for id
register difference.

Signed-off-by: Nishanth Menon <nm@ti.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Andrew Davis <afd@ti.com>
---
Changes in V4:
* Picked Andrew's review

V3: https://lore.kernel.org/all/20250815034105.1276548-2-nm@ti.com/
V2: https://lore.kernel.org/all/20250813204106.580141-2-nm@ti.com/
V1: https://lore.kernel.org/all/20250813190835.344563-2-nm@ti.com/

 .../devicetree/bindings/display/bridge/ite,it66121.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
index a7eb2603691f..c99b67f0bb73 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - ite,it66121
+      - ite,it66122
       - ite,it6610
 
   reg:
-- 
2.47.0

