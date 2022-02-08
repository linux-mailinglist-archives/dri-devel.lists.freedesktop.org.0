Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B94ADF35
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F5810E5CE;
	Tue,  8 Feb 2022 17:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0B10E7D4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:18 +0000 (UTC)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 997784004D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644340756;
 bh=l6GLEJQBNYaUkQu6nP76MmMixqQI8BIhtEzQgNTHbCs=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=jJbR3dD1dR8eB+sF5Af+tbU9bCdma/0rycRMeJKGC41Rti+74nOZsWvxxewxcWkRc
 M6PdKIWlVTu0JqixeceHV1kUC7/cJK6PQjXt9QonPDzWPfYT0NXXyic1mPSts7Gwrs
 Chz/84OZnfX54fuCj+luIIS7vUf8x/WR8E7bJTaBWBbJpMAFAtE+XFae6jE2Brq+nw
 2YMREqJQa9aadshgGGn1tefj7OlleLh5PxEJJ2lyGzK7DV0FOzFFSQvroPeqMBGNfA
 mXL2XJTA5MzDBEqmIFDRyk1GAwNG/HalOsCHuvioSpriTr6XEOtyM4+ducLaSQlh+N
 4d367w/+WOAFA==
Received: by mail-ej1-f71.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so5990324ejw.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 09:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l6GLEJQBNYaUkQu6nP76MmMixqQI8BIhtEzQgNTHbCs=;
 b=5lzdB2JOLDJg2bohUhYm3pkbkKZEvoWgienflkkH0tzKvsxLOnNWYaK4/qO3F97ckf
 5Y6YVPMSYR6it+jzqA3dkTSQEwnIWsdZknFULn3Fn43u3z98kAwBP3j7BWwol7g6OGPC
 qyYU/X7/gSKe9TRBqrezlf2hW5PCEiH40A/OLdDZ15K55yoyvEb0TaSZQKv3ksjU4mRe
 d4G3XyU3ShkcUMj2b9xG5XD6DBWcwYuVZmq8pR/iZasBuqFUTcyLiVxXOzUMntrS5ioX
 U5/WXxZDAFKYVDbHCEfHH9ZdSkaNhZu7MkyWgN3igbQMrPIq2inHge4OqoEbYbKWILoJ
 Hnqw==
X-Gm-Message-State: AOAM530bVKN/S7rXLNMN+AzXsvug9RyV4JeT2/WOZ25bO/N+lA6BZ+6B
 Eyy8ihcZ3bZll6p4Ij10juDGvMlebRN3iaxrTxpkUMHqA3arwvw/I8PfRBAPnfSvasY3JVWHvvK
 aUdhAZXOyHQcwjzQ48lwcxl2oLY+W/dSaLEly7R1OBPX6xA==
X-Received: by 2002:a05:6402:144d:: with SMTP id
 d13mr5605658edx.278.1644340755964; 
 Tue, 08 Feb 2022 09:19:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywRBR8e0kw/RhEs71GGAD57QuTcxgRhdmY0auFh0LiEtWtT2U86ImRk3V9+GHN9os3JiLMhw==
X-Received: by 2002:a05:6402:144d:: with SMTP id
 d13mr5605638edx.278.1644340755766; 
 Tue, 08 Feb 2022 09:19:15 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:19:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 04/10] dt-bindings: display: samsung,
 exynos5433-decon: convert to dtschema
Date: Tue,  8 Feb 2022 18:18:17 +0100
Message-Id: <20220208171823.226211-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Exynos5433 DECON display controller bindings to DT schema
format.

The conversion includes also updates to the bindings, matching the
current DTS and Linux driver:
1. Require "fifo" interrupt.
2. Add "dsd" as a last clock.
3. Document "power-domains" and "iommus" properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../display/exynos/exynos5433-decon.txt       |  60 -------
 .../samsung/samsung,exynos5433-decon.yaml     | 148 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 3 files changed, 149 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-decon.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt b/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
deleted file mode 100644
index 775193e1c641..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-Device-Tree bindings for Samsung Exynos SoC display controller (DECON)
-
-DECON (Display and Enhancement Controller) is the Display Controller for the
-Exynos series of SoCs which transfers the image data from a video memory
-buffer to an external LCD interface.
-
-Required properties:
-- compatible: value should be one of:
-	"samsung,exynos5433-decon", "samsung,exynos5433-decon-tv";
-- reg: physical base address and length of the DECON registers set.
-- interrupt-names: should contain the interrupt names depending on mode of work:
-		video mode: "vsync",
-		command mode: "lcd_sys",
-		command mode with software trigger: "lcd_sys", "te".
-- interrupts or interrupts-extended: list of interrupt specifiers corresponding
-		to names privided in interrupt-names, as described in
-		interrupt-controller/interrupts.txt
-- clocks: must include clock specifiers corresponding to entries in the
-	  clock-names property.
-- clock-names: list of clock names sorted in the same order as the clocks
-	       property. Must contain "pclk", "aclk_decon", "aclk_smmu_decon0x",
-	       "aclk_xiu_decon0x", "pclk_smmu_decon0x", "aclk_smmu_decon1x",
-	       "aclk_xiu_decon1x", "pclk_smmu_decon1x", clk_decon_vclk",
-	       "sclk_decon_eclk"
-- ports: contains a port which is connected to mic node. address-cells and
-	 size-cells must 1 and 0, respectively.
-- port: contains an endpoint node which is connected to the endpoint in the mic
-	node. The reg value muset be 0.
-
-Example:
-SoC specific DT entry:
-decon: decon@13800000 {
-	compatible = "samsung,exynos5433-decon";
-	reg = <0x13800000 0x2104>;
-	clocks = <&cmu_disp CLK_ACLK_DECON>, <&cmu_disp CLK_ACLK_SMMU_DECON0X>,
-		<&cmu_disp CLK_ACLK_XIU_DECON0X>,
-		<&cmu_disp CLK_PCLK_SMMU_DECON0X>,
-		<&cmu_disp CLK_ACLK_SMMU_DECON1X>,
-		<&cmu_disp CLK_ACLK_XIU_DECON1X>,
-		<&cmu_disp CLK_PCLK_SMMU_DECON1X>,
-		<&cmu_disp CLK_SCLK_DECON_VCLK>,
-		<&cmu_disp CLK_SCLK_DECON_ECLK>;
-	clock-names = "aclk_decon", "aclk_smmu_decon0x", "aclk_xiu_decon0x",
-		"pclk_smmu_decon0x", "aclk_smmu_decon1x", "aclk_xiu_decon1x",
-		"pclk_smmu_decon1x", "sclk_decon_vclk", "sclk_decon_eclk";
-	interrupt-names = "vsync", "lcd_sys";
-	interrupts = <0 202 0>, <0 203 0>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-			decon_to_mic: endpoint {
-				remote-endpoint = <&mic_to_decon>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-decon.yaml
new file mode 100644
index 000000000000..6f796835ea03
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-decon.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/samsung/samsung,exynos5433-decon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos5433 SoC Display and Enhancement Controller (DECON)
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Joonyoung Shim <jy0922.shim@samsung.com>
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
+  - Kyungmin Park <kyungmin.park@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  DECON (Display and Enhancement Controller) is the Display Controller for the
+  Exynos5433 series of SoCs which transfers the image data from a video memory
+  buffer to an external LCD interface.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos5433-decon
+      - samsung,exynos5433-decon-tv
+
+  clocks:
+    minItems: 11
+    maxItems: 11
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: aclk_decon
+      - const: aclk_smmu_decon0x
+      - const: aclk_xiu_decon0x
+      - const: pclk_smmu_decon0x
+      - const: aclk_smmu_decon1x
+      - const: aclk_xiu_decon1x
+      - const: pclk_smmu_decon1x
+      - const: sclk_decon_vclk
+      - const: sclk_decon_eclk
+      - const: dsd
+
+  interrupts:
+    minItems: 3
+    maxItems: 4
+    description: |
+      Interrupts depend on mode of work:
+       - video mode: vsync
+       - command mode: lcd_sys
+       - command mode with software trigger: lcd_sys, te
+
+  interrupt-names:
+    minItems: 3
+    items:
+      - const: fifo
+      - const: vsync
+      - const: lcd_sys
+      - const: te
+
+  iommus:
+    minItems: 2
+    maxItems: 2
+
+  iommu-names:
+    items:
+      - const: m0
+      - const: m1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Contains a port which is connected to mic node.
+
+  power-domains:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  samsung,disp-sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to DISP system controller interface.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - ports
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5433.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display-controller@13800000 {
+        compatible = "samsung,exynos5433-decon";
+        reg = <0x13800000 0x2104>;
+        clocks = <&cmu_disp CLK_PCLK_DECON>,
+                 <&cmu_disp CLK_ACLK_DECON>,
+                 <&cmu_disp CLK_ACLK_SMMU_DECON0X>,
+                 <&cmu_disp CLK_ACLK_XIU_DECON0X>,
+                 <&cmu_disp CLK_PCLK_SMMU_DECON0X>,
+                 <&cmu_disp CLK_ACLK_SMMU_DECON1X>,
+                 <&cmu_disp CLK_ACLK_XIU_DECON1X>,
+                 <&cmu_disp CLK_PCLK_SMMU_DECON1X>,
+                 <&cmu_disp CLK_SCLK_DECON_VCLK>,
+                 <&cmu_disp CLK_SCLK_DECON_ECLK>,
+                 <&cmu_disp CLK_SCLK_DSD>;
+        clock-names = "pclk",
+                      "aclk_decon",
+                      "aclk_smmu_decon0x",
+                      "aclk_xiu_decon0x",
+                      "pclk_smmu_decon0x",
+                      "aclk_smmu_decon1x",
+                      "aclk_xiu_decon1x",
+                      "pclk_smmu_decon1x",
+                      "sclk_decon_vclk",
+                      "sclk_decon_eclk",
+                      "dsd";
+        power-domains = <&pd_disp>;
+        interrupt-names = "fifo", "vsync", "lcd_sys";
+        interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+        samsung,disp-sysreg = <&syscon_disp>;
+        iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;
+        iommu-names = "m0", "m1";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                decon_to_mic: endpoint {
+                    remote-endpoint = <&mic_to_decon>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ddcee331dc09..a0ad276b3159 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6417,6 +6417,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
 F:	Documentation/devicetree/bindings/display/exynos/
+F:	Documentation/devicetree/bindings/display/samsung/
 F:	drivers/gpu/drm/exynos/
 F:	include/uapi/drm/exynos_drm.h
 
-- 
2.32.0

