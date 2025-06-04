Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E4EACD8E0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 09:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F3A10E215;
	Wed,  4 Jun 2025 07:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A68710E635
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 07:57:26 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d51dso11452767a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 00:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749023845; x=1749628645;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NeqiHaJFVUqzajBPrmH9xxTn9d5bNYR6oESxo/yec5U=;
 b=ZV22Rh+tNhgrFJSVffVcfitV3Pik6rOChfMRUxdcdOudWtx6CZu/xlKXkAavqH04Ii
 q7CAHOwya5lJqi2p6qdEV9svTicsCEa9ViAmk5sAzcKj8C8Cg3nD4kPzzuftk5udCtaq
 tch9NXgd5MTXdKJBDpeRzJRNJJWxYkYrUj7CgRHzBn7RzSNcCDfVLymLsn/FIQceOiXf
 q7sm9Q6SpQ10OtuuoBuAqgu4YW/pBNl0RGP17COZOLig4gGskP7EHOYSzDt3HoCFNBPD
 j4WWP+k8sRbA+y1r2XkomoVdSnOoQfeqhPr3oj11j/IFRkOBArGt/lvEhcC6lkMPlHLp
 TPvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCEI/lgxGiIFpJFr7Vm0accqTBhPgkwX7+zdXgS+KvelA8w5kaOb72W8M8ookNVio2+JKMpI6OYKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhcHwuDtasop1l0KOAtkXWPnbRG+gBBlsO4aYJA3NW86AvpDxV
 WHeZh4hIAWoU+wHkVQAvMV04AU6mUIUnrV7lRRHyq3ZsLS4UnuaUghrk
X-Gm-Gg: ASbGncskbNw5EzqO/bxfvNYW5Cig+DgGSY4Eg1jR4TYcKdI9/VrV7gsizdrS0P9EIBi
 4vz0h2+Qd0B9Obn/MhDTkPMXmxAr1wqpxfgSUq957675fnVa7mKlL5vcP4oa9WtVxD++44/wmkI
 COj5/ZWPwSdyfDHxj3DUrb+tZo3O93WjY0RpQbiJSIxAc05IzsTsHHBZ4EullXjTCpyJBxoYD8T
 CPcVFN3gkIqsUZDbNprHg5xIJCfWNHEBE9fwQNHuMRnYTA6ye5K+/1I/adcs+PWXGYOSSTLxK0D
 CoEkUrtGcWscuEVuYbKI/eBjYV3GD+UAul2r4cuXsyTTgqxdtqm2JmakuGHNfnvAbRKtpfCAMH0
 XBDo80JcAOvpmwyM2yz7d
X-Google-Smtp-Source: AGHT+IG4KhR8Z3k4aQMME4cyMj0++br0TPt481d++GP1kJY/SKddu72lDvPfwX9imdPXq0ET1sOp5w==
X-Received: by 2002:a05:6402:2742:b0:601:f4dd:8572 with SMTP id
 4fb4d7f45d1cf-606ea3b0072mr2031096a12.17.1749023844568; 
 Wed, 04 Jun 2025 00:57:24 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 00:57:24 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:14 +0200
Subject: [PATCH v6 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-1-237ac75ddb5e@tomeuvizoso.net>
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, 
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

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 144 +++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9a5e9e213912d0997da2f6ae26189adf044dcc7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -0,0 +1,144 @@
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
+  There is to be a node per each core in the NPU. In Rockchip's design there
+  will be one core that is special and needs to be powered on before any of the
+  other cores can be used. This special core is called the top core and should
+  have the compatible string that corresponds to top cores.
+
+properties:
+  $nodename:
+    pattern: '^npu@[a-f0-9]+$'
+
+  compatible:
+    enum:
+      - rockchip,rk3588-rknn-core-top
+      - rockchip,rk3588-rknn-core
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: pc
+      - const: cna
+      - const: core
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
+      npu@fdab0000 {
+        compatible = "rockchip,rk3588-rknn-core-top";
+        reg = <0x0 0xfdab0000 0x0 0x1000>,
+              <0x0 0xfdab1000 0x0 0x1000>,
+              <0x0 0xfdab3000 0x0 0x1000>;
+        reg-names = "pc", "cna", "core";
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
+    };
+...

-- 
2.49.0

