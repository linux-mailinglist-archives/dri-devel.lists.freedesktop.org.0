Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E51FD4642EE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10466E867;
	Tue, 30 Nov 2021 23:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02DD6E81D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:20 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id m12so6133620ljj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nt2qbTsx4R5g/N/VYBhOrl2siDQQfrnptMwGepUXSgQ=;
 b=L+xne0cVRct9fmIWP8hgoH8yyP3uaYTqCRqJEMhGnVMwiglELlmZfA7bFRet1hc06U
 fJTX5Kuqix1tnLM0lyWrYljWAVr48GclCvGU90oXWk3QW0MVRZK4/WetfXnq5Hi1umFW
 v1Auc5CjOorJCwS3cCUHlzHAPGVFfxK9OoKQ/1ZuMbquNIP+LkSrTLwovHi7o+P70n1v
 HgUseg/nLFHl2Q81brHfnBp8zOWv5RBk6O7BzdiUcdb1el5wlw1G4E9XYJC8hKzeSWR4
 goWlcXlNtfwrGID7//bL4+ZiqVVPRtVLq1jLNF/3kZ3Uc7f9aFsqfJLCwnHFv09BHYYQ
 SMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nt2qbTsx4R5g/N/VYBhOrl2siDQQfrnptMwGepUXSgQ=;
 b=dcCy0Ft+JjIx/pWkkGYP1fIjA8A/EcUakvrHYyPX8s9lJD/dsO2bc3NG+D5rLR289E
 UmaDRx7VqUvENJN+jhnYomOHXBCILnzhOx0QV3iAmSllSMsIH3yCGBt0UHh4R4cSFGA8
 +2XgSQ9n5Y4xZqispqzOK8Y+JWMbWknhqNum7w2Vxlp1SLjS03d1udD+5APCvpeb3bCk
 u/gwIfKihUhFt7d/erv1w3Fy9x77aQniimzS4NCfznUeC1G6LPRa7D8pU3XFl0WD2S0w
 9HA307EGKlX1U5UccqJdO+aanmpeAo86lUxgGxh/r572k6GD/eQ0+riFfyMjipLpg4Xw
 2MzA==
X-Gm-Message-State: AOAM533fdyCXXaBx+CYKIEyazM/zJZf5U5/lnJN3b8S5JUOXghGBxSl9
 iKFTz5chQ3itsyz99MD0PDc=
X-Google-Smtp-Source: ABdhPJz23pita21nMXWKRfP28/VZa3iQxHi3gHvJ7PlFjxfMNRTAo6GcGKLf+9LlWDgvT9dSNAx6fQ==
X-Received: by 2002:a2e:7319:: with SMTP id o25mr1943965ljc.320.1638314659258; 
 Tue, 30 Nov 2021 15:24:19 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:18 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v16 25/40] media: dt: bindings: tegra-vde: Convert to schema
Date: Wed,  1 Dec 2021 02:23:32 +0300
Message-Id: <20211130232347.950-26-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert NVIDIA Tegra video decoder binding to schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/media/nvidia,tegra-vde.txt       |  64 -----------
 .../bindings/media/nvidia,tegra-vde.yaml      | 107 ++++++++++++++++++
 2 files changed, 107 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
 create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
deleted file mode 100644
index 602169b8aa19..000000000000
--- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-NVIDIA Tegra Video Decoder Engine
-
-Required properties:
-- compatible : Must contain one of the following values:
-   - "nvidia,tegra20-vde"
-   - "nvidia,tegra30-vde"
-   - "nvidia,tegra114-vde"
-   - "nvidia,tegra124-vde"
-   - "nvidia,tegra132-vde"
-- reg : Must contain an entry for each entry in reg-names.
-- reg-names : Must include the following entries:
-  - sxe
-  - bsev
-  - mbe
-  - ppe
-  - mce
-  - tfe
-  - ppb
-  - vdma
-  - frameid
-- iram : Must contain phandle to the mmio-sram device node that represents
-         IRAM region used by VDE.
-- interrupts : Must contain an entry for each entry in interrupt-names.
-- interrupt-names : Must include the following entries:
-  - sync-token
-  - bsev
-  - sxe
-- clocks : Must include the following entries:
-  - vde
-- resets : Must contain an entry for each entry in reset-names.
-- reset-names : Should include the following entries:
-  - vde
-
-Optional properties:
-- resets : Must contain an entry for each entry in reset-names.
-- reset-names : Must include the following entries:
-  - mc
-- iommus: Must contain phandle to the IOMMU device node.
-
-Example:
-
-video-codec@6001a000 {
-	compatible = "nvidia,tegra20-vde";
-	reg = <0x6001a000 0x1000 /* Syntax Engine */
-	       0x6001b000 0x1000 /* Video Bitstream Engine */
-	       0x6001c000  0x100 /* Macroblock Engine */
-	       0x6001c200  0x100 /* Post-processing Engine */
-	       0x6001c400  0x100 /* Motion Compensation Engine */
-	       0x6001c600  0x100 /* Transform Engine */
-	       0x6001c800  0x100 /* Pixel prediction block */
-	       0x6001ca00  0x100 /* Video DMA */
-	       0x6001d800  0x300 /* Video frame controls */>;
-	reg-names = "sxe", "bsev", "mbe", "ppe", "mce",
-		    "tfe", "ppb", "vdma", "frameid";
-	iram = <&vde_pool>; /* IRAM region */
-	interrupts = <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>, /* Sync token interrupt */
-		     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>, /* BSE-V interrupt */
-		     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
-	interrupt-names = "sync-token", "bsev", "sxe";
-	clocks = <&tegra_car TEGRA20_CLK_VDE>;
-	reset-names = "vde", "mc";
-	resets = <&tegra_car 61>, <&mc TEGRA20_MC_RESET_VDE>;
-	iommus = <&mc TEGRA_SWGROUP_VDE>;
-};
diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
new file mode 100644
index 000000000000..c143aaa06346
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nvidia,tegra-vde.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Video Decoder Engine
+
+maintainers:
+  - Dmitry Osipenko <digetx@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - nvidia,tegra132-vde
+              - nvidia,tegra124-vde
+              - nvidia,tegra114-vde
+      - items:
+          - const: nvidia,tegra30-vde
+          - const: nvidia,tegra20-vde
+      - items:
+          - const: nvidia,tegra20-vde
+
+  reg:
+    maxItems: 9
+
+  reg-names:
+    items:
+      - const: sxe
+      - const: bsev
+      - const: mbe
+      - const: ppe
+      - const: mce
+      - const: tfe
+      - const: ppb
+      - const: vdma
+      - const: frameid
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: vde
+      - const: mc
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: sync-token
+      - const: bsev
+      - const: sxe
+
+  iommus:
+    maxItems: 1
+
+  iram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the SRAM MMIO node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    video-codec@6001a000 {
+      compatible = "nvidia,tegra20-vde";
+      reg = <0x6001a000 0x1000>, /* Syntax Engine */
+            <0x6001b000 0x1000>, /* Video Bitstream Engine */
+            <0x6001c000  0x100>, /* Macroblock Engine */
+            <0x6001c200  0x100>, /* Post-processing Engine */
+            <0x6001c400  0x100>, /* Motion Compensation Engine */
+            <0x6001c600  0x100>, /* Transform Engine */
+            <0x6001c800  0x100>, /* Pixel prediction block */
+            <0x6001ca00  0x100>, /* Video DMA */
+            <0x6001d800  0x300>; /* Video frame controls */
+      reg-names = "sxe", "bsev", "mbe", "ppe", "mce",
+                  "tfe", "ppb", "vdma", "frameid";
+      iram = <&iram>; /* IRAM MMIO region */
+      interrupts = <0  9 4>, /* Sync token */
+                   <0 10 4>, /* BSE-V */
+                   <0 12 4>; /* SXE */
+      interrupt-names = "sync-token", "bsev", "sxe";
+      clocks = <&clk 61>;
+      reset-names = "vde", "mc";
+      resets = <&rst 61>, <&mem 13>;
+      iommus = <&mem 15>;
+    };
-- 
2.33.1

