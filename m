Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD39B0BFDA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E05110E4AF;
	Mon, 21 Jul 2025 09:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324E510E4B4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:18:19 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aec5a714ae9so495955166b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 02:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753089498; x=1753694298;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s0shnpD272LCTIcktSbOwec73NOpSSL15XOo8LgFeXc=;
 b=ZKoiAATY/775MFI/Hl1SRV876drpJpXyC1LAT7ZxgYJUlucIlZrKv7BEPBLrmZUsnt
 GjV45a4Vxt9jY7PM06kaUy6XGCId6K5w9QhPDE4gzH/SoVNy9b90YZpTGuPBVZzdwFHw
 tiXwinJfHf0Mw1gegD6dHaDORSwvDL+SkxfVvakDTeEdpX5DQrbR9wk7pFq+3P/IeikJ
 qZoVoFmJIsxxNah4oeMjN8UQttwkEmKkT5dZww1YoVGXSCCm2oFXQxBsA76bAanN8nuN
 0eWUeimaJJFiyzkrnorJoAhUmteuArqm3WFiDr5M9oNRvw0+fZz7IUJD7yxxYV0spiQQ
 WBaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOwlZq+N8sQRVZRbQ4HIMvKjJYj1KlMDafUwYrh4nmp9oVGCUOyjM3f5GE/r0aNlCpf3+UoFO67Nk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNRNA0vjST/HS/gEe+Qh7GmwkCj/b/BiMAawFHhK/xW4f4Z4MM
 H2eEF6bMH80X8vTPna/9W/C6xVU5xPvW3hnJpo9wb1hIgb+1Hk59Z/go
X-Gm-Gg: ASbGncumXWWnkBnJOnmAMTi4xyLJoyRf3R0C7sVxKpN1t3apvmCGiiF1XWVGd/UUd5Y
 MgQ71cbu0VF4y/ENtcLmd2RIf/rbWFL4BxYYAZZV8E40rmqRD1jpPvxgfXJod/HEVXKzk+958Z9
 K+Sr8MQbrXXcu6ef3JK0g/d7RxC5IQyl/cHWZYXiN3pcxFgn+LJp/lpEpnQ73f2YpwKVeirp9ii
 01fPPlOjWVwJEiQheqC/L1AILVRbD8r3lejKh5NATJIOmHCmDIQ0fjr1Nk/VNuAzlCHlhRrEWaf
 uk5cJPTg7Y0SSu84u3quq96phY+8PY4EhcGG79UwogRX/EYVl1k1OOiDTTlSNQ6MMsCUmC9/OKc
 55maSFvlB/4a9wjSPEhs49NIc4QPfLugVm4dT7q4OAuCD43K+dBNtkOik
X-Google-Smtp-Source: AGHT+IE++yQ6J3zklxF4MKp/EF/leIEps5+hFjKqjdF7o1BmnbGKHkCjf3wy7jm1GMw4qcEy+y+sJw==
X-Received: by 2002:a17:906:d263:b0:ad8:9a3b:b26e with SMTP id
 a640c23a62f3a-ae9c9b5ddd4mr1870923966b.56.1753089497441; 
 Mon, 21 Jul 2025 02:18:17 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 02:18:16 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:33 +0200
Subject: [PATCH v9 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250721-6-10-rocket-v9-6-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

v4:
- Change required node name to npu@ (Rob Herring and Krzysztof Kozlowski)
- Remove unneeded items: (Krzysztof Kozlowski)
- Fix use of minItems/maxItems (Krzysztof Kozlowski)
- Add reg-names to list of required properties (Krzysztof Kozlowski)
- Fix example (Krzysztof Kozlowski)

v5:
- Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
- Streamline compatible property (Krzysztof Kozlowski)

v6:
- Remove mention to NVDLA, as the hardware is only incidentally related
  (Kever Yang)
- Mark pclk and npu clocks as required by all clocks (Rob Herring)

v7:
- Remove allOf section, not needed now that all nodes require 4 clocks
  (Heiko Stübner)

v8:
- Remove notion of top core (Robin Murphy)

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 112 +++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..caca2a4903cd1556226fd2bff6ea9a63dbd375c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Neural Processing Unit IP from Rockchip
+
+maintainers:
+  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
+
+description:
+  Rockchip IP for accelerating inference of neural networks.
+
+  There is to be a node per each NPU core in the SoC, and each core should reference all the
+  resources that it needs to function, such as clocks, power domains, and resets.
+
+properties:
+  $nodename:
+    pattern: '^npu@[a-f0-9]+$'
+
+  compatible:
+    enum:
+      - rockchip,rk3588-rknn-core
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: pc # Program Control-related registers
+      - const: cna # Convolution Neural Network Accelerator registers
+      - const: core # Main NPU core processing unit registers
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: npu
+      - const: pclk
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
+  - reg-names
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
+      npu@fdab0000 {
+        compatible = "rockchip,rk3588-rknn-core";
+        reg = <0x0 0xfdab0000 0x0 0x1000>,
+              <0x0 0xfdab1000 0x0 0x1000>,
+              <0x0 0xfdab3000 0x0 0x1000>;
+        reg-names = "pc", "cna", "core";
+        clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
+                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
+        clock-names = "aclk", "hclk", "npu", "pclk";
+        interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+        iommus = <&rknn_mmu_0>;
+        npu-supply = <&vdd_npu_s0>;
+        power-domains = <&power RK3588_PD_NPUTOP>;
+        resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
+        reset-names = "srst_a", "srst_h";
+        sram-supply = <&vdd_npu_mem_s0>;
+      };
+    };
+...

-- 
2.50.0

