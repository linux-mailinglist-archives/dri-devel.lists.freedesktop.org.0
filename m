Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A0AD5D4E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 19:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB6388EF0;
	Wed, 11 Jun 2025 17:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kWj8PxcU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7F610E6E5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 17:32:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8AD8A4A2EB;
 Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51EACC4CEEF;
 Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749663159;
 bh=lcbMxrel7jx7H3y2U/66hGI1tYz6FmYR34nQgwcBN2Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=kWj8PxcURxZLp+4hHH80cNJbL7cscBcB93cLT7OfHvIuAl9j/UdQi2VS1cKxWqEF4
 wJdhdWRm5f4VZdieIMl/Lou+KnIy1bA02E+MRBAr/ZUyy6gkHmqubmAv5rHOQQ3YGR
 4iFRb5HW4PjA6m0G997za7Cy5V5ffXjrBk9EyQ+YeVmwAsthezkkLuXB26KP0Gxo9U
 AlZD7xOOoXPy5kS4hhozbZtsxRNDxyHViFS3e9RWHFX7qi9C+q8HkjmWlxMa1S3QYc
 O34PBLmhz6XTb0hOgawcj0g0cgxyStgQ9cUs9uzbqe7nbeobkWnE+jor/jB042D8a5
 VK1Rr3BryBiWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 40AD6C71136;
 Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 11 Jun 2025 19:32:16 +0200
Subject: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
In-Reply-To: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749663157; l=3999;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=fi+oFwK6grJuET9s6/XgeNUQBtm3aO0V1TI3cLg1XnI=;
 b=4rOCqcuSkCjByfXaVGa1rq66T4eyMIn9G13fhEP67cMYbjEegt7HIvdyosrmn19Exxa0b3VKC
 pOjhh0AHclmDaUU8QD/412/FnmibHIF5nfPnZlRLOmsDEFBQsRde4pC
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for the GPU present in Apple SoCs

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 Documentation/devicetree/bindings/gpu/apple,agx.yaml | 95 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                          |  1 +
 2 files changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/apple,agx.yaml b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..23df3ebd689b1e885eb99ca573343fe7f2d09dc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/apple,agx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SoC GPU
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: apple,agx-g13g
+      - items:
+          - enum:
+              - apple,agx-g13s
+              - apple,agx-g13c
+              - apple,agx-g13d
+          - const: apple,agx-g13x
+      - items:
+          - const: apple,agx-g14g
+  reg:
+    items:
+      - description: ASC coprocessor control
+      - description: GPU block MMIO registers
+
+  reg-names:
+    items:
+      - const: asc
+      - const: sgx
+
+  power-domains:
+    maxItems: 1
+
+  mboxes:
+    maxItems: 1
+
+  memory-region:
+    items:
+      - description: Region containing GPU MMU TTBs
+      - description: Region containing GPU MMU page tables
+      - description:
+          Region containing a shared handoff structure for VM
+          management coordination
+      - description: Driver-opaque calibration blob
+      - description: Calibration blob
+      - description: Shared global variables with GPU firmware
+
+  memory-region-names:
+    items:
+      - const: ttbs
+      - const: pagetables
+      - const: handoff
+      - const: hw-cal-a
+      - const: hw-cal-b
+      - const: globals
+
+  apple,firmware-compat:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 3
+    description:
+      MacOS version the current firmware is paired with, used to pick
+      the version of firmware ABI to be used.
+      Bootloader will overwrite this
+
+required:
+  - compatible
+  - reg
+  - mboxes
+  - memory-region
+  - apple,firmware-compat
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    gpu@6400000 {
+        compatible = "apple,agx-g13g";
+        reg = <0x6400000 0x40000>,
+              <0x4000000 0x1000000>;
+        reg-names = "asc", "sgx";
+        mboxes = <&agx_mbox>;
+        power-domains = <&ps_gfx>;
+        memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
+                        <&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
+        memory-region-names = "ttbs", "pagetables", "handoff",
+                              "hw-cal-a", "hw-cal-b", "globals";
+
+        apple,firmware-compat = <0 0 0>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163f9fe8fe3f04bf66426f9a894409..2a32c9c4ee355a1109a3e2031ea3663c39cc8c68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2331,6 +2331,7 @@ F:	Documentation/devicetree/bindings/arm/apple/*
 F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
+F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.49.0


