Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC99B03003
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 10:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E772510E15F;
	Sun, 13 Jul 2025 08:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8556510E15F
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 08:39:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ae36e88a5daso689028666b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 01:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752395953; x=1753000753;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HOHpT8kGZSJVLxTQMVWR2M9VRzfmT5p8z/9ngbND8fo=;
 b=LC9MDAtaa59EGft+v/6oQ3Qv5AynUBQLL4oiLpTCwKSjSPlVJw3O33SnqqJiERwL0M
 6QrRYj98rydmpWYgj95dBEAAsftJMXdTElIBFtiClU/iyFiIkgbpd5RKOuvXDc+sdDI5
 MFj4q/rp8OiAuisekL/MZSGGEmQaipOjHBPIK0FlrOF7yFcgKeUJqHkP52kUrYb1JRX/
 eSwQ1XOhuZ6JGEBkfLUGu7gPK3zpO1HW8w1u+yL4qAFUB3O9x0xI+DvuRzR2q1sgi1oe
 pJehJICZIbDxxXW6t4vQivrZQNXpLA26sPRhZRAbPB+EtMRuKLNH9NncngQm1wByj7Di
 j4fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGtlQORRMWc0DmUim26ZiQq4SOjtU43H8yObI5a2PRQEGiHARNNNil7Qv/Yxermu3kLv3E4KVqCjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZp3jrUW49XEo6BEnGWQNuHrW+7FC6eF8OV5SvYsn77w9pI2eB
 yUdciCgAJuZei/HYeJ346czUVM8rBs14F2oSgcOUKSWC9dE9bzqauG61
X-Gm-Gg: ASbGncsy27V3yDnPPRjqvIqqhjhVLK6UxOzk2vc5Uw1rkqnlqzSswZeqv+6nI32LbCe
 J4qjQzRSyrT/zIDotThKaim+Y0EMh6BhUuxrrGAThDu6mjxpkobd3XveBMndylkDepBKwHxIwRY
 bHkMMbTSozDZgnFRzKipV4W6S4ePP0d1mwK4AmaQX9YQpGOyl1H2DPCfKlKsKKIXYMqHNtO/J6q
 jWANmRaHSdZViZ+3OYT4r5t/8FF8TmjgCeMF62T5mSaQThFYnuSc2IeIgc5YVlGQcDTOItLmnZf
 f104kg7wXW+ZNbEf3xdDpDVSTx8rCoiErOm7meWSPyI9Cs7Q6dAZ5fxYqwqzmk3Co+h56hpNTvY
 pca7pm+B9A4IKMgCvYhmtdE6+Ty52BljETe9DY75Z3lsw+d8NH7oZiJjF
X-Google-Smtp-Source: AGHT+IHl3nw9qjo4aS5LVukEuyLIVG/s6+0jGJrU9nM4JX0orxt25nmWT7xes/c92JOudJh9cADHRw==
X-Received: by 2002:a17:907:1b08:b0:ad8:a41a:3cd2 with SMTP id
 a640c23a62f3a-ae6fbe71f29mr1117728466b.16.1752395952721; 
 Sun, 13 Jul 2025 01:39:12 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 01:39:12 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:56 +0200
Subject: [PATCH v8 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250713-6-10-rocket-v8-6-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
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
index 0000000000000000000000000000000000000000..a1bdd831a8e665a7c73b73f15a9cde8deb474095
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
2.50.0

