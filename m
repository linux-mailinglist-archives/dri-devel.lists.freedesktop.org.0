Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC364CD1B6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 10:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606A310E487;
	Fri,  4 Mar 2022 09:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E728710E487
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 09:55:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 74CBE1F46487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646387707;
 bh=W1KTW2CWyMdr19QkjPQg8o2j2a0glYmu9KmpaTzLlJQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U8h6fKGarbLhNENlnKxF678hCfPO3VPlX2ffHPxn0x23NBVX80Z2ZXpjDuE1QpULa
 zhx5+GvF4XSfqN3PayHhxXQF69YwDcVuLzprvXeTTkZ9AOSRNpDyRmY1tMEhK+9HxX
 3slfY8LwDs3vcAxs4CuzoimqdDuZda9lGBy297yeBkcBOzeRtI46ItxHXjTbHbkDm4
 8YdJLP1f9zEtGY/qFeoMrfbXa10l76ui2K9itbHvsIHi5nrCMu+2KkCNPMGtSu0dLT
 LE5nsU+ykFmRVUBQX0liOwU1rMRbaEKtJGyKVh+BFTkTcyeDU16Vai7ehNzpbmhsv/
 hzo3X6Upn887w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 3/3] dt-bindings: display: mediatek: Fix examples on new
 bindings
Date: Fri,  4 Mar 2022 10:54:58 +0100
Message-Id: <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, jason-jh.lin@mediatek.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To avoid failure of dt_binding_check perform a slight refactoring
of the examples: the main block is kept, but that required fixing
the address and size cells, plus the inclusion of missing dt-bindings
headers, required to parse some of the values assigned to various
properties.

Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,aal.yaml        | 24 +++--
 .../display/mediatek/mediatek,ccorr.yaml      | 23 +++--
 .../display/mediatek/mediatek,color.yaml      | 23 +++--
 .../display/mediatek/mediatek,dither.yaml     | 23 +++--
 .../display/mediatek/mediatek,dpi.yaml        |  3 +-
 .../display/mediatek/mediatek,dsc.yaml        | 23 +++--
 .../display/mediatek/mediatek,ethdr.yaml      | 99 ++++++++++---------
 .../display/mediatek/mediatek,gamma.yaml      | 23 +++--
 .../display/mediatek/mediatek,merge.yaml      | 49 +++++----
 .../display/mediatek/mediatek,mutex.yaml      | 25 +++--
 .../display/mediatek/mediatek,od.yaml         | 14 ++-
 .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++--
 .../display/mediatek/mediatek,ovl.yaml        | 26 +++--
 .../display/mediatek/mediatek,postmask.yaml   | 23 +++--
 .../display/mediatek/mediatek,rdma.yaml       | 28 ++++--
 .../display/mediatek/mediatek,split.yaml      | 17 +++-
 .../display/mediatek/mediatek,ufoe.yaml       | 19 ++--
 .../display/mediatek/mediatek,wdma.yaml       | 26 +++--
 18 files changed, 316 insertions(+), 178 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 225f9dd726d2..4fdc9b3283b0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -66,12 +66,22 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
 
-    aal@14015000 {
-        compatible = "mediatek,mt8173-disp-aal";
-        reg = <0 0x14015000 0 0x1000>;
-        interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_AAL>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        aal@14015000 {
+           compatible = "mediatek,mt8173-disp-aal";
+           reg = <0 0x14015000 0 0x1000>;
+           interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
+           power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+           clocks = <&mmsys CLK_MM_DISP_AAL>;
+           mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+       };
     };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 6894b6999412..0ed53b6238f0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -65,12 +65,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
 
-    ccorr0: ccorr@1400f000 {
-        compatible = "mediatek,mt8183-disp-ccorr";
-        reg = <0 0x1400f000 0 0x1000>;
-        interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-        clocks = <&mmsys CLK_MM_DISP_CCORR0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ccorr0: ccorr@1400f000 {
+            compatible = "mediatek,mt8183-disp-ccorr";
+            reg = <0 0x1400f000 0 0x1000>;
+            interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index bc83155b3b4c..3ad842eb5668 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -75,12 +75,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
 
-    color0: color@14013000 {
-        compatible = "mediatek,mt8173-disp-color";
-        reg = <0 0x14013000 0 0x1000>;
-        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_COLOR0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        color0: color@14013000 {
+            compatible = "mediatek,mt8173-disp-color";
+            reg = <0 0x14013000 0 0x1000>;
+            interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 9d89297f5f1d..6657549af165 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -65,12 +65,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
 
-    dither0: dither@14012000 {
-        compatible = "mediatek,mt8183-disp-dither";
-        reg = <0 0x14012000 0 0x1000>;
-        interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-        clocks = <&mmsys CLK_MM_DISP_DITHER0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dither0: dither@14012000 {
+            compatible = "mediatek,mt8183-disp-dither";
+            reg = <0 0x14012000 0 0x1000>;
+            interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index dd2896a40ff0..843f89d6053f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -70,8 +70,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
+
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index 1ec083eff824..49248864514b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -60,12 +60,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
 
-    dsc0: disp_dsc_wrap@1c009000 {
-        compatible = "mediatek,mt8195-disp-dsc";
-        reg = <0 0x1c009000 0 0x1000>;
-        interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
-        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
-        clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
-        mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x9000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dsc0: disp_dsc_wrap@1c009000 {
+            compatible = "mediatek,mt8195-disp-dsc";
+            reg = <0 0x1c009000 0 0x1000>;
+            interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
+            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+            clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
+            mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x9000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
index 131eed5eeeb7..e16deca0dc2b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -97,51 +97,62 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+    #include <dt-bindings/memory/mt8195-memory-port.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    #include <dt-bindings/reset/mt8195-resets.h>
 
-    disp_ethdr@1c114000 {
-            compatible = "mediatek,mt8195-disp-ethdr";
-            reg = <0 0x1c114000 0 0x1000>,
-                  <0 0x1c115000 0 0x1000>,
-                  <0 0x1c117000 0 0x1000>,
-                  <0 0x1c119000 0 0x1000>,
-                  <0 0x1c11A000 0 0x1000>,
-                  <0 0x1c11B000 0 0x1000>,
-                  <0 0x1c11C000 0 0x1000>;
-            reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
-                        "vdo_be", "adl_ds";
-            mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0xA000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0xB000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0xC000 0x1000>;
-            clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
-                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
-                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
-                     <&vdosys1 CLK_VDO1_26M_SLOW>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
-                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
-                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
-                     <&topckgen CLK_TOP_ETHDR_SEL>;
-            clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
-                          "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
-                          "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
-                          "ethdr_top";
-            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
-            iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
-                     <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
-            interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
-            resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
-                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
-                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
-                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
-                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        disp_ethdr@1c114000 {
+                compatible = "mediatek,mt8195-disp-ethdr";
+                reg = <0 0x1c114000 0 0x1000>,
+                      <0 0x1c115000 0 0x1000>,
+                      <0 0x1c117000 0 0x1000>,
+                      <0 0x1c119000 0 0x1000>,
+                      <0 0x1c11A000 0 0x1000>,
+                      <0 0x1c11B000 0 0x1000>,
+                      <0 0x1c11C000 0 0x1000>;
+                reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+                            "vdo_be", "adl_ds";
+                mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0xA000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0xB000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0xC000 0x1000>;
+                clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
+                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
+                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
+                         <&vdosys1 CLK_VDO1_26M_SLOW>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
+                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
+                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
+                         <&topckgen CLK_TOP_ETHDR>;
+                clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+                              "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
+                              "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
+                              "ethdr_top";
+                power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+                iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
+                         <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
+                interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
+                resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
+                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
+                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
+                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
+                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
+        };
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 247baad147b3..78442339314f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -66,12 +66,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
 
-    gamma@14016000 {
-        compatible = "mediatek,mt8173-disp-gamma";
-        reg = <0 0x14016000 0 0x1000>;
-        interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_GAMMA>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gamma@14016000 {
+            compatible = "mediatek,mt8173-disp-gamma";
+            reg = <0 0x14016000 0 0x1000>;
+            interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index d5cd69b7f501..d635c5dcb68b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -38,18 +38,16 @@ properties:
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
   clocks:
+    minItems: 1
     maxItems: 2
-    items:
-      - description: MERGE Clock
-      - description: MERGE Async Clock
-          Controlling the synchronous process between MERGE and other display
-          function blocks cross clock domain.
 
   clock-names:
-    maxItems: 2
-    items:
-      - const: merge
-      - const: merge_async
+    oneOf:
+      - items:
+          - const: merge
+      - items:
+          - const: merge
+          - const: merge_async
 
   mediatek,merge-fifo-en:
     description:
@@ -88,23 +86,20 @@ additionalProperties: false
 
 examples:
   - |
-
-    merge@14017000 {
-        compatible = "mediatek,mt8173-disp-merge";
-        reg = <0 0x14017000 0 0x1000>;
-        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_MERGE>;
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        merge@14017000 {
+            compatible = "mediatek,mt8173-disp-merge";
+            reg = <0 0x14017000 0 0x1000>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_MERGE>;
+            clock-names = "merge";
+        };
     };
 
-    merge5: disp_vpp_merge5@1c110000 {
-        compatible = "mediatek,mt8195-disp-merge";
-        reg = <0 0x1c110000 0 0x1000>;
-        interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
-        clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
-                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
-        clock-names = "merge","merge_async";
-        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
-        mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x0000 0x1000>;
-        mediatek,merge-fifo-en = <1>;
-        resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
-    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
index 842ba7b07a34..00e6a1041a9b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -71,13 +71,22 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
 
-    mutex: mutex@14020000 {
-        compatible = "mediatek,mt8173-disp-mutex";
-        reg = <0 0x14020000 0 0x1000>;
-        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_MUTEX_32K>;
-        mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
-                              <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mutex: mutex@14020000 {
+            compatible = "mediatek,mt8173-disp-mutex";
+            reg = <0 0x14020000 0 0x1000>;
+            interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_MUTEX_32K>;
+            mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
+                                  <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 7519db315217..853fcb9db2be 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -45,9 +45,15 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
 
-    od@14023000 {
-        compatible = "mediatek,mt8173-disp-od";
-        reg = <0 0x14023000 0 0x1000>;
-        clocks = <&mmsys CLK_MM_DISP_OD>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        od@14023000 {
+            compatible = "mediatek,mt8173-disp-od";
+            reg = <0 0x14023000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_DISP_OD>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index e3cef99d0f98..25d2ac2a4f05 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -66,13 +66,23 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
 
-    ovl_2l0: ovl@14009000 {
-        compatible = "mediatek,mt8183-disp-ovl-2l";
-        reg = <0 0x14009000 0 0x1000>;
-        interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-        clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
-        iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ovl_2l0: ovl@14009000 {
+            compatible = "mediatek,mt8183-disp-ovl-2l";
+            reg = <0 0x14009000 0 0x1000>;
+            interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+            iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index fc691d00c60e..f77094e61443 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -81,13 +81,23 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
 
-    ovl0: ovl@1400c000 {
-        compatible = "mediatek,mt8173-disp-ovl";
-        reg = <0 0x1400c000 0 0x1000>;
-        interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_OVL0>;
-        iommus = <&iommu M4U_PORT_DISP_OVL0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ovl0: ovl@1400c000 {
+            compatible = "mediatek,mt8173-disp-ovl";
+            reg = <0 0x1400c000 0 0x1000>;
+            interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_OVL0>;
+            iommus = <&iommu M4U_PORT_DISP_OVL0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index 6ac1da2e8871..2d769422e29f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -58,12 +58,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/power/mt8192-power.h>
+    #include <dt-bindings/gce/mt8192-gce.h>
 
-    postmask0: postmask@1400d000 {
-        compatible = "mediatek,mt8192-disp-postmask";
-        reg = <0 0x1400d000 0 0x1000>;
-        interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH 0>;
-        power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
-        clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        postmask0: postmask@1400d000 {
+            compatible = "mediatek,mt8192-disp-postmask";
+            reg = <0 0x1400d000 0 0x1000>;
+            interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH 0>;
+            power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index b56e22fbcd52..e8c72afa0630 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -94,14 +94,24 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
 
-    rdma0: rdma@1400e000 {
-        compatible = "mediatek,mt8173-disp-rdma";
-        reg = <0 0x1400e000 0 0x1000>;
-        interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_RDMA0>;
-        iommus = <&iommu M4U_PORT_DISP_RDMA0>;
-        mediatek,rdma-fifosize = <8192>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rdma0: rdma@1400e000 {
+            compatible = "mediatek,mt8173-disp-rdma";
+            reg = <0 0x1400e000 0 0x1000>;
+            interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+            iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+            mediatek,rdma-fifo-size = <8192>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index 4f08e89c1067..35ace1f322e8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -49,10 +49,17 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
-    split0: split@14018000 {
-        compatible = "mediatek,mt8173-disp-split";
-        reg = <0 0x14018000 0 0x1000>;
-        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_SPLIT0>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        split0: split@14018000 {
+            compatible = "mediatek,mt8173-disp-split";
+            reg = <0 0x14018000 0 0x1000>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_SPLIT0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index 6e8748529e73..b8bb135fe96b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -51,11 +51,18 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
 
-    ufoe@1401a000 {
-        compatible = "mediatek,mt8173-disp-ufoe";
-        reg = <0 0x1401a000 0 0x1000>;
-        interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_UFOE>;
+        ufoe@1401a000 {
+            compatible = "mediatek,mt8173-disp-ufoe";
+            reg = <0 0x1401a000 0 0x1000>;
+            interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_UFOE>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index f9f00a518edf..7d7cc1ab526b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -64,13 +64,23 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
 
-    wdma0: wdma@14011000 {
-        compatible = "mediatek,mt8173-disp-wdma";
-        reg = <0 0x14011000 0 0x1000>;
-        interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_WDMA0>;
-        iommus = <&iommu M4U_PORT_DISP_WDMA0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        wdma0: wdma@14011000 {
+            compatible = "mediatek,mt8173-disp-wdma";
+            reg = <0 0x14011000 0 0x1000>;
+            interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_WDMA0>;
+            iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+        };
     };
-- 
2.35.1

