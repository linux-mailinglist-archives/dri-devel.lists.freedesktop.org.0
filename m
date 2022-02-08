Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09514ADF36
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C539810E8FE;
	Tue,  8 Feb 2022 17:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E3410E8F3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:25 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E6FF54004D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644340763;
 bh=kMaTNaBI2iO4IYdjvaEgTk0fgCfiFl3MO+VYGfyVvmE=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=lnBdMxEWMYw7AaM8GtmPI2mq4l9HHdv92EUan5YECg5hr/6jkwQRCnnzvySe2y/y7
 CpiDA5xnf2DIHS6du1h/7LHqAFvHelfpoJLMW+XUe/jeoz1y1us9eTJzY05dWhMG1g
 vmA1BWE5o7sTnkNXf2Za8N3FuOKdnXn8G6auP6Uw0HYwCgC5l9kbCkWuaAUWtC7arz
 zTbHFJSWhO5rVxRHCSUUed3ZYWMEScU7DNLUcoQ9KDd759Ih2YJ9KrwKKvz3gdcueR
 4WrTU+5TBVST4GxCteBRkMgPDmN1NTam28m//WN2KkXMvaUZd3CW4gC9mCVYZL043d
 6GDXkU4c2DIYQ==
Received: by mail-ej1-f72.google.com with SMTP id
 hr36-20020a1709073fa400b006cd2c703959so889309ejc.14
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 09:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kMaTNaBI2iO4IYdjvaEgTk0fgCfiFl3MO+VYGfyVvmE=;
 b=6DjRGqgAFWpu+kF23GqkS2GDJ3adNYYqT1HXN2QVS9d0qxi/TFR7kpY2YjFKty0JeV
 pmeOgZs3+XwozFKG+3bp+2PemokWp9CUJRlcOWav+1X+X230bOwNp8rebkoLUB+Ua4Yw
 h7CbYp+uD+4k8MxXTBx69NWSsTYNdOFWQKUULeKxQRYEAb6Pb6XI4LJRnxKwcKl4ode4
 M0qdKjOmXxpMpIk2250IkBNK6H6wMdNzQfHoJPY02ogueiDH2MQR1QK49KRXeWpBL4Pd
 kHWbINVOB2UBdieioGYMB1+qRLrs9FCOylYNvy92Ar5Ur+7YPy1iW1esBGaGe+lod23n
 pObw==
X-Gm-Message-State: AOAM533ihGu0cxo2IakR5PmRLtBBES3mo3GNdBfg76WOE1Q5C6fhHK/f
 z+pV0Ch2MHiMQrngMMC37VF5qAfioKsDm6KHH9K19WrqXDpm7c7AOR+yDtmkD4Dd2LXci2x/ldT
 tXGt5U82j2Oyp3PcK1SE82RxOlBikDK8klEWBwvZNktUxdg==
X-Received: by 2002:aa7:d809:: with SMTP id v9mr5652418edq.2.1644340763450;
 Tue, 08 Feb 2022 09:19:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlLGYgUd+Cr4yCQlVE0VWHIHMy+r8JCbb5AQJa47VNi9iyYKn2B1Q1E+kn15abkGcHd22WRg==
X-Received: by 2002:aa7:d809:: with SMTP id v9mr5652400edq.2.1644340763212;
 Tue, 08 Feb 2022 09:19:23 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:19:22 -0800 (PST)
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
Subject: [PATCH 09/10] dt-bindings: display: samsung,
 exynos5433-mic: convert to dtschema
Date: Tue,  8 Feb 2022 18:18:22 +0100
Message-Id: <20220208171823.226211-10-krzysztof.kozlowski@canonical.com>
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

Convert the Exynos5433 MIC bindings to DT schema format.

The conversion includes also updates to the bindings, matching the
current DTS and Linux driver: adding optional power-domains.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/display/exynos/exynos-mic.txt    | 51 ----------
 .../samsung/samsung,exynos5433-mic.yaml       | 95 +++++++++++++++++++
 2 files changed, 95 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos-mic.txt
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-mic.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos-mic.txt b/Documentation/devicetree/bindings/display/exynos/exynos-mic.txt
deleted file mode 100644
index 0fba2ee6440a..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos-mic.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-Device-Tree bindings for Samsung Exynos SoC mobile image compressor (MIC)
-
-MIC (mobile image compressor) resides between decon and mipi dsi. Mipi dsi is
-not capable to transfer high resoltuion frame data as decon can send. MIC
-solves this problem by compressing the frame data by 1/2 before it is
-transferred through mipi dsi. The compressed frame data must be uncompressed in
-the panel PCB.
-
-Required properties:
-- compatible: value should be "samsung,exynos5433-mic".
-- reg: physical base address and length of the MIC registers set and system
-       register of mic.
-- clocks: must include clock specifiers corresponding to entries in the
-	  clock-names property.
-- clock-names: list of clock names sorted in the same order as the clocks
-	       property. Must contain "pclk_mic0", "sclk_rgb_vclk_to_mic0".
-- samsung,disp-syscon: the reference node for syscon for DISP block.
-- ports: contains a port which is connected to decon node and dsi node.
-	 address-cells and size-cells must 1 and 0, respectively.
-- port: contains an endpoint node which is connected to the endpoint in the
-	decon node or dsi node. The reg value must be 0 and 1 respectively.
-
-Example:
-SoC specific DT entry:
-mic: mic@13930000 {
-	compatible = "samsung,exynos5433-mic";
-	reg = <0x13930000 0x48>;
-	clocks = <&cmu_disp CLK_PCLK_MIC0>,
-	       <&cmu_disp CLK_SCLK_RGB_VCLK_TO_MIC0>;
-	clock-names = "pclk_mic0", "sclk_rgb_vclk_to_mic0";
-	samsung,disp-syscon = <&syscon_disp>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-			mic_to_decon: endpoint {
-				remote-endpoint = <&decon_to_mic>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-			mic_to_dsi: endpoint {
-				remote-endpoint = <&dsi_to_mic>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-mic.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-mic.yaml
new file mode 100644
index 000000000000..01fccb138ebd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-mic.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/samsung/samsung,exynos5433-mic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos5433 SoC Mobile Image Compressor (MIC)
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Joonyoung Shim <jy0922.shim@samsung.com>
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
+  - Kyungmin Park <kyungmin.park@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  MIC (Mobile Image Compressor) resides between DECON and MIPI DSI. MIPI DSI is
+  not capable of transferring high resoltuion frame data as DECON can send. MIC
+  solves this problem by compressing the frame data by 1/2 before it is
+  transferred through MIPI DSI. The compressed frame data must be uncompressed
+  in the panel PCB.
+
+properties:
+  compatible:
+    const: samsung,exynos5433-mic
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pclk_mic0
+      - const: sclk_rgb_vclk_to_mic0
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
+  samsung,disp-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to DISP system controller interface.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - ports
+  - reg
+  - samsung,disp-syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5433.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    image-processor@13930000 {
+        compatible = "samsung,exynos5433-mic";
+        reg = <0x13930000 0x48>;
+        clocks = <&cmu_disp CLK_PCLK_MIC0>,
+                 <&cmu_disp CLK_SCLK_RGB_VCLK_TO_MIC0>;
+        clock-names = "pclk_mic0",
+                      "sclk_rgb_vclk_to_mic0";
+        power-domains = <&pd_disp>;
+        samsung,disp-syscon = <&syscon_disp>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                mic_to_decon: endpoint {
+                    remote-endpoint = <&decon_to_mic>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                mic_to_dsi: endpoint {
+                    remote-endpoint = <&dsi_to_mic>;
+                };
+            };
+        };
+    };
-- 
2.32.0

