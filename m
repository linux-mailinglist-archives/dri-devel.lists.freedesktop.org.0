Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA74E905438
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6FA10E7B9;
	Wed, 12 Jun 2024 13:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E5310E3B9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:53:10 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-35f223e7691so624842f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718200389; x=1718805189;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cz9Php77CN5sqNTwFGYv2UDE+c/YCm+M4vWABkPbT/c=;
 b=ATDjQ1h1GTQyc5a6phmmi0UmYuOF6/IBGSYnaLfu5RtdramQGzxdPfF4cazipiolJS
 NtpJauKv1KfJz2BjgrkbT4Mi2GBpUWJuT17Fdgjgu+UDNz2k79fVbBgro1BhCisryePj
 jbVSHHaUo/3uTOh5cXNffcubRS2kc5c4nDgk5AoQHUxEfFIe91qIVSMtpRw7T0gNWlpT
 HmcVKIF/7fUyjhjBXAqGjDjgg371n48pO9CqqLhXD1xBUFCFDImIFoYd7QU9qbBiB6uB
 QKnXJMdLTQMo94hNk/dkCl4VF7ltzK5Ze2zlaMmBawNuERZPgQVEYBFDFilLfjBEQK/k
 CitQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcTkD+O8ZLrUXjz3RSWENyl9aPuSaqd3+vbYyCsi5N4RNhfYx39bzvg4Teq3/8+5mnqTEBPYKWuUubFafGyF6Ozen839p+3WHvakOqv0YE
X-Gm-Message-State: AOJu0YxjmUYjJtEG8D79sM+IXHU2YbdrlOJ/VGJrPZGo1gDe1UAqi09O
 LVUmqfLbVSoBg9lqMPY7ZqRsmVSq37MbKVZ1b7EPmw3ayF6PSmlK
X-Google-Smtp-Source: AGHT+IEqb5Q+XEHVzZbym8NFLwOC3wy9t9R6o2Sd4pfu6UKsad2cWupip8wZTpYH3xU98HUt7kmz6A==
X-Received: by 2002:a05:6000:1250:b0:35f:2551:b967 with SMTP id
 ffacd0b85a97d-35f2b28a77amr5039442f8f.16.1718200389052; 
 Wed, 12 Jun 2024 06:53:09 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 06:53:08 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 15:52:56 +0200
Subject: [PATCH 3/9] dt-bindings: mailbox: rockchip,rknn: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-6-10-rocket-v1-3-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
In-Reply-To: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.13.0
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../devicetree/bindings/npu/rockchip,rknn.yaml     | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn.yaml
new file mode 100644
index 000000000000..570a4889c11c
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rknn.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/rockchip,rknn.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Neural Processing Unit IP from Rockchip, based on NVIDIA's NVDLA
+
+maintainers:
+  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
+
+description: |+
+  Rockchip IP for accelerating inference of neural networks, based on NVIDIA's open source NVDLA IP.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - rockchip,rk3588-rknn
+      - const: rockchip,rknn
+
+  reg:
+    description: Base registers for NPU cores
+    minItems: 1
+    maxItems: 20
+
+  interrupts:
+    minItems: 1
+    maxItems: 20
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 20
+
+  clocks:
+    minItems: 1
+    maxItems: 20
+
+  clock-names:
+    minItems: 1
+    maxItems: 20
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    maxItems: 20
+
+  reset-names:
+    minItems: 1
+    maxItems: 20
+
+  power-domains:
+    minItems: 1
+    maxItems: 20
+
+  power-domain-names:
+    minItems: 1
+    maxItems: 20
+
+  iommus:
+    items:
+      - description: IOMMU for all cores
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-rates
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rknn: npu@fdab0000 {
+          compatible = "rockchip,rk3588-rknn", "rockchip,rknn";
+          reg = <0x0 0xfdab0000 0x0 0x9000>,
+                <0x0 0xfdac0000 0x0 0x9000>,
+                <0x0 0xfdad0000 0x0 0x9000>;
+          interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
+          interrupt-names = "npu0_irq", "npu1_irq", "npu2_irq";
+          clocks = <&scmi_clk 0>, <&cru 1>,
+                   <&cru 2>, <&cru 3>,
+                   <&cru 4>, <&cru 5>,
+                   <&cru 6>, <&cru 7>;
+          clock-names = "clk_npu",
+                  "aclk0", "aclk1", "aclk2",
+                  "hclk0", "hclk1", "hclk2",
+                  "pclk";
+          assigned-clocks = <&scmi_clk 0>;
+          assigned-clock-rates = <200000000>;
+          resets = <&cru 0>, <&cru 1>, <&cru 2>,
+                   <&cru 3>, <&cru 4>, <&cru 5>;
+          reset-names = "srst_a0", "srst_a1", "srst_a2",
+                        "srst_h0", "srst_h1", "srst_h2";
+          power-domains = <&power 0>, <&power 1>, <&power 2>;
+          power-domain-names = "npu0", "npu1", "npu2";
+          iommus = <&rknpu_mmu>;
+          status = "disabled";
+        };
+    };
+...

-- 
2.45.2

