Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD71ABA115
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349C810EB29;
	Fri, 16 May 2025 16:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B42E10EB28
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 16:53:30 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-442ec3ce724so18728155e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747414409; x=1748019209;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SfHWyDzdYdPgseWM8in4Xga6BH3ORUK0taNjKDi8WrU=;
 b=FoDW7Qe+YULcXYW8CdSU3+86BPlKv1/VtjkkNE9YrzXnhS0ZAN3pc+CbdNfkiqmeGr
 ixpFhg/C3I6xVFJDr6BtOvbmiUTe7BsbNpUowqrLmDkr6nTpNQymBySBN7hP8QdIamCX
 oLriNcOYm8m3+qlgme73E58RD44QM1Jn9iesBMqsJKoUU6sViK5GOt4XJ13OTyjWwmS6
 Z7m78ey+MeY7RKnT1pIVpJwNkvfcQ6ZaSy/ICISpSX9vfnsBBy4V/oVZVLcf0NGMmoTN
 QcAy9vORd+NLJRTuiHnUqQzz7tY5TRdWpsydQCNAjqpeffXFxat7+vFqq72SSPp37UZP
 Ma6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu0Ir/wpqre/GpWIY29IRgcXC1M7JevXfSUu7ZaRMf5kSgYwz0ZEaqwmSrRytTP80UVKDzthdbhPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZIn5DuMfP8UsknGAl++ADFw0zvH3eBXIK8d8aeaEGeVP5uOh6
 8oKSf0koNWRqQ6Mzz+0WQovnXdx7lCybOfdTf49HzZSKYYWwCEy6XtgF
X-Gm-Gg: ASbGnct8e8RpjZak5emdaAzWYd4QwPxh87sSFjLov5H6m8TW5HClvVg1vKdG3cG8sbe
 Z15mj7P5ySAitzL6MGtWPc36WYXxw3tG0VuR5IiGXNGAp7vtFbjQfaOcHk4tZs1AhaQEUJ9SQn4
 GY313CKn929AfKkgEmmTNgVVJSQTgVqozP/elBjzyIZKuADA2KMRJysMGZhKlanF8ZpDjT2yGP+
 mdpvturnyEuj/JW9lKDSN010WQyOAizUulX3JeaY7ifPBp5t4/WjHwgzm9e8aQinu4oee4B4vEp
 5aCOfE3BsO7UpT0triM2Ri8sftNcsxRnrrUweKWyvHRXD6mzeNyBiErvHcVo/FJoqeb7l/7UItq
 EDkJpuZkqcrgFsa0T6Xdy
X-Google-Smtp-Source: AGHT+IEyqMrmDea7JavBMgkK3wvxNcoS+lcm9iLW6qMl0usvxOeRCVB8F+OJbgGXLnn2gpefZQpWQA==
X-Received: by 2002:a05:600c:4f42:b0:43b:cb12:ba6d with SMTP id
 5b1f17b1804b1-442fd60b543mr50449995e9.3.1747414408596; 
 Fri, 16 May 2025 09:53:28 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 09:53:28 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 18:53:15 +0200
Subject: [PATCH v3 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-6-10-rocket-v3-1-7051ac9225db@tomeuvizoso.net>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
In-Reply-To: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
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

v3:
- Split register block in its constituent subblocks, and only require
  the ones that the kernel would ever use (Nicolas Frattaroli)
- Group supplies (Rob Herring)
- Explain the way in which the top core is special (Rob Herring)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/npu/rockchip,rknn-core.yaml           | 162 +++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4572fb777f1454d0147da29791033fc27c53b8d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
@@ -0,0 +1,162 @@
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
+  There is to be a node per each core in the NPU. In Rockchip's design there
+  will be one core that is special and needs to be powered on before any of the
+  other cores can be used. This special core is called the top core and should
+  have the compatible string that corresponds to top cores.
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
+      - items:
+          - enum:
+              - rockchip,rk3588-rknn-core
+
+  reg:
+    minItems: 3
+
+  reg-names:
+    minItems: 3
+    items:
+      - const: pc
+      - const: cna
+      - const: core
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
+  - power-domains
+  - resets
+  - reset-names
+  - npu-supply
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
2.49.0

