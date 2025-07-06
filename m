Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2571AFA6D5
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 19:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1293B10E2C9;
	Sun,  6 Jul 2025 17:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="PD5G3p64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BE610E2C9
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 17:30:11 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 0B68525D7F;
 Sun,  6 Jul 2025 19:30:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gwBGOvTxX10; Sun,  6 Jul 2025 19:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1751823009; bh=oChcwplCN0suk6lHWq6XWl/N6zCbWSAQbXpXzN4LkkE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=PD5G3p64ULwvpSu66WVHHVAgI81CdxKe8wQbB0nrScjLZ8AzFAMltgZbiad/7HVdV
 c+iZnzeiLxG5XiPK68q0zur+edJ3P+mADB/d56iVtHbqIryK827N9m7vpCIYKhahuQ
 2am4ExOUsE77rOe6hqgE+Vggg5oQzh7+fEoFeS50XLQ/UofQGueJQIFad5R/Cx+yAO
 UxB/wCQDBpMqD9b/wf1tNcatpMNfer8IjuEBawuaNeS0asaakJdPGPtITjiua4rPUU
 HckcMdpkk9ap5//cc9Zkdf2fToEGAstgM+1RUqGkdRunzsuvbGzgn2APsTAXo+N0W9
 gFEU0k/acWhIg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 22:59:45 +0530
Subject: [PATCH v4 1/2] dt-bindings: display: samsung,exynos7-decon:
 document iommus, memory-region, and ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynosdrm-decon-v4-1-735fd215f4b3@disroot.org>
References: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
In-Reply-To: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751822991; l=1983;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=oChcwplCN0suk6lHWq6XWl/N6zCbWSAQbXpXzN4LkkE=;
 b=QTmWHnA11sNP8XEsfDTBxLU0bIaujjqcVMgDPt2eNUJ6zRtTgzfMTVb5/FKagmo4PY9yuIt0Z
 h7w03bs+hqbBKkqI0tIDmiVOvAcEzChrFPzdFQvcDhY9DoxhEedLUXp
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
- May optionally require an IOMMU to initialize a display region.
- Outputs image data to another block, say an MIC or a DSI master.

If an IOMMU is present, it may also require to access the reserved
framebuffer region.

Document these bindings in the devicetree schema.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../display/samsung/samsung,exynos7-decon.yaml      | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
index 53916e4c95d8c0369138941a556c23f5d42fbd39..14b954718008e06aa1627fcd116a61927ce29e99 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
@@ -80,6 +80,21 @@ properties:
       - const: vsync
       - const: lcd_sys
 
+  iommus:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+    description:
+      A phandle to a node describing a reserved framebuffer memory region.
+      For example, the splash memory region set up by the bootloader.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port which is connected to either a Mobile Image Compressor
+      (MIC) or a DSI Master device.
+
   power-domains:
     maxItems: 1
 
@@ -92,6 +107,7 @@ required:
   - clock-names
   - interrupts
   - interrupt-names
+  - port
   - reg
 
 additionalProperties: false
@@ -118,4 +134,9 @@ examples:
                       "decon0_vclk";
         pinctrl-0 = <&lcd_clk &pwm1_out>;
         pinctrl-names = "default";
+        port {
+            decon_to_dsi: endpoint {
+                remote-endpoint = <&dsi_to_decon>;
+            };
+        };
     };

-- 
2.49.0

