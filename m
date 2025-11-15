Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9056BC604C2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 13:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B2510E280;
	Sat, 15 Nov 2025 12:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qp5p5xX7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67E710E280
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 12:21:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 24D94432EF;
 Sat, 15 Nov 2025 12:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683ABC16AAE;
 Sat, 15 Nov 2025 12:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763209289;
 bh=CvW3RPjAQHRDOfHqugrlxCPi56fwvh2F4UBJhuXf3jY=;
 h=From:To:Cc:Subject:Date:From;
 b=qp5p5xX7ENbuB1mPVuIYCFnQYSYEPZ5tpWjz30Y0M31mP4b20X/sC9/9ZCzECXwMN
 LDbhsstItv8lHknHCJvXhUcCiRgI2oX4W0rPhrIBFQo/6FWKmqmjRUzhHStlgSZTBn
 NFIxnDFkB4UJsXn3jdPl/pYr3gvX/tk02FY4t8j8NiGRCvhAlWePlAG2r+NYvB7guk
 FzxN7BQbuBeCnKcdDQPItEO9PCTqX+o0od9GC6xr2FFu080JYl86KdwFmMl1xVpms6
 3+C9e4H+4hzDhu3ibGRicQ/fsSc4yLa7tEP36hiAXFcBT6bkudn2Z2RzxhBUdHLDnE
 OjUplpuBVEnZA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Harini Katakam <harini.katakam@amd.com>,
 Shyam Pandey <radhey.shyam.pandey@amd.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/3] dt-bindings: display/ti: Simplify dma-coherent property
Date: Sat, 15 Nov 2025 13:21:21 +0100
Message-ID: <20251115122120.35315-4-krzk@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Common boolean properties need to be only allowed in the binding
(":true"), because their type is already defined by core DT schema.
Simplify dma-coherent property to match common syntax.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 3 +--
 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 361e9cae6896..38fcee91211e 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -84,8 +84,7 @@ properties:
     maxItems: 1
     description: phandle to the associated power domain
 
-  dma-coherent:
-    type: boolean
+  dma-coherent: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
index fad7cba58d39..65ae8a1c3998 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
@@ -103,8 +103,7 @@ properties:
     maxItems: 1
     description: phandle to the associated power domain
 
-  dma-coherent:
-    type: boolean
+  dma-coherent: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1

