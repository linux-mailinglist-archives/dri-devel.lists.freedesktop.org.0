Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B2B4547F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 12:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D721210EB6C;
	Fri,  5 Sep 2025 10:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="X8H3fZlw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A8D10EB6C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 10:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757067824; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fORs12r/9P+bFpGppwpXrPNY9ard+PY5cVLBuKdNL3SdN9NZBThRxBIqwBRC3RRlt9JmdS1HgWkXvVGWe1k4WvDv74hVAxzlKBp5Z17eMKIclj4g+cXgXIjTJNVO/YHOiO3dC/b7eFlPCI2Qt+8fOytzOodT60firynnIf+z62M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757067824;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Us0SdR9VkXymGZbNuZ4zsRJNiU5eRP0UPu2QfVitveY=; 
 b=iEcxPCRcnqRrp7tx8S1d9qLPnjZJL+OZkt1xQx4yq4wXFal9F3KPmLmLJYfqW81v8uF1MUKH5fZxmprzD84DMXtNTmEr7rltV0YuwodzKJfaxVECq6B5LVIyv9nuPoNqIYhzTA6dPnnE5EWvel35sIqiWVZ2HMCSJPk7JJ4heZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757067824; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Us0SdR9VkXymGZbNuZ4zsRJNiU5eRP0UPu2QfVitveY=;
 b=X8H3fZlwvrqV2W9DrXWK9DH2likHLKheHzb2jOGK1XKGCSDA3mGwvFcXFXWQfwZV
 0xvKfdth+jiNISINF6+NsEBWJXizf1P5aeUEHkGZfuAYc/jQrXTe+HpChlxbDyUVovd
 vG2bxmWJKpiaycfJ4dB2MDjwcYAQB6pu5b4MlmLo=
Received: by mx.zohomail.com with SMTPS id 1757067820867668.3962305402956;
 Fri, 5 Sep 2025 03:23:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 05 Sep 2025 12:22:57 +0200
Subject: [PATCH RFC 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-mt8196-gpufreq-v1-1-7b6c2d6be221@collabora.com>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
In-Reply-To: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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

The Mali-based GPU on the MediaTek MT8196 SoC is shackled to its concept
of "MFlexGraphics", which in this iteration includes an embedded MCU
that needs to be poked to power on the GPU, and is in charge of
controlling all the clocks and regulators.

In return, it lets us omit the OPP tables from the device tree, as those
can now be enumerated at runtime from the MCU.

Add the mediatek,mt8196-mali compatible, and a performance-controller
property which points to a node representing such setups. It's required
on mt8196 devices.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/gpu/arm,mali-valhall-csf.yaml         | 36 +++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index a5b4e00217587c5d1f889094e2fff7b76e6148eb..6df802e900b744d226395c29f8d87fb6d3282d26 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3588-mali
+              - mediatek,mt8196-mali
           - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
 
   reg:
@@ -53,6 +54,13 @@ properties:
   opp-table:
     type: object
 
+  performance-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle of a device that controls this GPU's power and frequency,
+      if any. If present, this is usually in the form of some specialised
+      embedded MCU.
+
   power-domains:
     minItems: 1
     maxItems: 5
@@ -91,7 +99,6 @@ required:
   - interrupts
   - interrupt-names
   - clocks
-  - mali-supply
 
 additionalProperties: false
 
@@ -105,9 +112,24 @@ allOf:
       properties:
         clocks:
           minItems: 3
+        performance-controller: false
         power-domains:
           maxItems: 1
         power-domain-names: false
+      required:
+        - mali-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,mt8196-mali
+    then:
+      properties:
+        mali-supply: false
+        sram-supply: false
+        operating-points-v2: false
+      required:
+        - performance-controller
 
 examples:
   - |
@@ -143,5 +165,17 @@ examples:
             };
         };
     };
+  - |
+    gpu2: gpu@48000000 {
+        compatible = "mediatek,mt8196-mali", "arm,mali-valhall-csf";
+        reg = <0x48000000 0x480000>;
+        clocks = <&mfgpll 0>;
+        clock-names = "core";
+        interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
+        interrupt-names = "job", "mmu", "gpu";
+        performance-controller = <&gpufreq>;
+    };
 
 ...

-- 
2.51.0

