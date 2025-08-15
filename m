Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D4B276EA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30E710E348;
	Fri, 15 Aug 2025 03:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="LfPY3zRs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421E110E345
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 03:41:16 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57F3f9ei2075242;
 Thu, 14 Aug 2025 22:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755229269;
 bh=LijDDfJj/HnoCFvNR7KrheABUM4ZJ0FRRu4mRC43Pq0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=LfPY3zRsxyCwRu0QikM8lIR+jhzIorh6Q5s68vuND4v54nq647I429JXcWhw+f4dR
 1j2IANOhNbn4MMiZhEfPgnD5P7GjhGK3NL3nb91E8G0XJSJ3SwjY8A3J6iGONd7ZyL
 uAF+fshiCl5WaCPARnl6sxxQ50YBH0WnEaGmXJbU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57F3f9G22167606
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 14 Aug 2025 22:41:09 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 22:41:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 22:41:08 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57F3f8gh419041;
 Thu, 14 Aug 2025 22:41:08 -0500
From: Nishanth Menon <nm@ti.com>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, <afd@ti.com>,
 <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>, Nishanth Menon
 <nm@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 1/4] dt-bindings: display: bridge: it66121: Add compatible
 string for IT66122
Date: Thu, 14 Aug 2025 22:41:02 -0500
Message-ID: <20250815034105.1276548-2-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250815034105.1276548-1-nm@ti.com>
References: <20250815034105.1276548-1-nm@ti.com>
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
---
Changes in V3:
* None.

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

