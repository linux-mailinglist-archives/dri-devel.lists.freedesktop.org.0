Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28359A43693
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 08:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADA010E182;
	Tue, 25 Feb 2025 07:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB56810E182
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 07:56:02 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4394a823036so49961275e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 23:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740470161; x=1741074961;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQ8rK/SFPwv0iTdPidLWNwq+goMXwpaEZtcN5vvMS8I=;
 b=OOiOnye+PsKk8bkradvJJKQ+4T4umnSCqNPdliL6IBWuRY9/kbOo0fM50ZaEoQBneV
 L1m/1ZaaO1Yp2gb7upilto6Y7Len6hq3BY5J1UeQIaVA8lz5p9549Jrcp0M5CGhhUCcJ
 CgB+vYYyBtO+lGKyF28+BsnwxFoiKJMwEYC/Kr7NtFLphc9kvtQ8k9t1PIHpQbUJ4d6a
 CXATGZCGr6RMG1xP1MhSxQ4TE/HfGM79J0FukoC+3/MqVA5ZrXqEAzqwPtQWetqhCEMS
 X4xMCXHDejteszZE4rkga7p4zpXNoaHw6kmrLcp9BVtAgBqNVJvXn889xsGkjZ8kEzte
 WvCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO2wqznnP68QJgNnnkFnfRWQ8pf5NrzcCC04f9hBjlRIoLh654DUnIjYfr07SI7LckXmnGG23R2l4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygQa0l3QBo/7qcSOyptrf/XIpNPVo1LU6WtLccFrqhNAdjEuR8
 Q8LFoKzFdKhHzEXvXnlNR7XZ/iIvtBT3YAMpqJY3dZ7LGB5QFabn
X-Gm-Gg: ASbGncslqzGW3Oy3LzyS3IRvbjQEVKG0LaFeN2Q3WyawjsDjiQmvdUUoFHhhYcF+N92
 X9iROYjAb4mRR55zDNSeIe6q3kzfPH3RrOS8bt2z+rYY5MCoLrZHW7LrsOs5PXn3Wefpw3JBZzz
 TnzAlBRP8q+gv8TUmwh19MMcn8lR+cPlAaqauvguJl1q8s9FNbkYh9wX1o1zNqg3q0Y6sM+JByX
 oW62AauiIJawANDnG//8C5kdZS6Audcctz5K/LfRpALbFJ3PdqrGXq/JYe31Agt8Ha/TzljFiSA
 kce/gNS81S4zOMutqPKCqzCQdcYqgmSQ2fowywZBr7ssLUs3t5vUxQBlkg==
X-Google-Smtp-Source: AGHT+IFLYntsPuTOziMl5zbK7YW3u6WRQqcDsC52Yv/3/P2y2cWtuj2SxpqE0RPE7hoOsemVi3pcMQ==
X-Received: by 2002:a05:600c:450d:b0:439:9a43:dd62 with SMTP id
 5b1f17b1804b1-439aebb2d6fmr101608685e9.24.1740470161102; 
 Mon, 24 Feb 2025 23:56:01 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 23:55:59 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 25 Feb 2025 08:55:47 +0100
Subject: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
In-Reply-To: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
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

Add the bindings for the Neural Processing Unit IP from Rockchip.

v2:
- Adapt to new node structure (one node per core, each with its own
  IOMMU)
- Several misc. fixes from Sebastian Reichel

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf13a9f4aa7c1901362a3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Neural Processing Unit IP from Rockchip
+
+maintainers:
+  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
+
+description:
+  Rockchip IP for accelerating inference of neural networks, based on NVIDIA's
+  open source NVDLA IP.
+
+properties:
+  $nodename:
+    pattern: '^npu-core@[a-f0-9]+$'
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - rockchip,rk3588-rknn-core-top
+          - const: rockchip,rknn-core-top
+      - items:
+          - enum:
+              - rockchip,rk3588-rknn-core
+          - const: rockchip,rknn-core
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: npu
+      - const: pclk
+    minItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  npu-supply: true
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: srst_a
+      - const: srst_h
+
+  sram-supply: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - iommus
+  - npu-supply
+  - power-domains
+  - resets
+  - reset-names
+  - sram-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rknn-core-top
+    then:
+      properties:
+        clocks:
+          minItems: 4
+
+        clock-names:
+          minItems: 4
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rknn-core
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      rknn_core_top: npu-core@fdab0000 {
+        compatible = "rockchip,rk3588-rknn-core-top", "rockchip,rknn-core-top";
+        reg = <0x0 0xfdab0000 0x0 0x9000>;
+        assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+        assigned-clock-rates = <200000000>;
+        clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
+                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
+        clock-names = "aclk", "hclk", "npu", "pclk";
+        interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+        iommus = <&rknn_mmu_top>;
+        npu-supply = <&vdd_npu_s0>;
+        power-domains = <&power RK3588_PD_NPUTOP>;
+        resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
+        reset-names = "srst_a", "srst_h";
+        sram-supply = <&vdd_npu_mem_s0>;
+      };
+
+      rknn_core_1: npu-core@fdac0000 {
+        compatible = "rockchip,rk3588-rknn-core", "rockchip,rknn-core";
+        reg = <0x0 0xfdac0000 0x0 0x9000>;
+        clocks = <&cru ACLK_NPU1>, <&cru HCLK_NPU1>;
+        clock-names = "aclk", "hclk";
+        interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
+        iommus = <&rknn_mmu_1>;
+        npu-supply = <&vdd_npu_s0>;
+        power-domains = <&power RK3588_PD_NPU1>;
+        resets = <&cru SRST_A_RKNN1>, <&cru SRST_H_RKNN1>;
+        reset-names = "srst_a", "srst_h";
+        sram-supply = <&vdd_npu_mem_s0>;
+      };
+    };
+...

-- 
2.48.1

