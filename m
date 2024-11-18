Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D669D113E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A117210E4C9;
	Mon, 18 Nov 2024 13:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="uewjUIV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E53810E4C3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:02:55 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICK2L7027979;
 Mon, 18 Nov 2024 13:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=H
 xiyNLoqzCUMiH9mB70tmCdqxixNga/U7MEzXOIWs00=; b=uewjUIV890yslZMCF
 JQD3kW3d2lKXwzJE56rP0WVl4jalKM4LECw0kqr3tn+KM//Phiw4++pGcaovuWLb
 m7eFW6+P0RBddPnz82tb57bsrPYzbVKlGWo5LZ8Tg6euuM7q5rMD9PmZ+YbdV9Q5
 IjJHsKAbsYb/4oSC76e+KbHVhGmILPWra2+pz7P5ovaYfY0hMacGeLsLb5qt9csH
 eEhmpgugzuCMDU2K3NhdogbwgH/aqsfqfj7RO8uXq9OupVVzC9oqpgBDvbpC7rHQ
 +KEfCQup2MRp3K/mAolsA31R+WgUKSxlIJVMMXw/BfcZCmYhumh7f20C1y67L+WO
 YWMlA==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmj1-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2024 13:02:37 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:36 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:02:00 +0000
Subject: [PATCH v2 08/21] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-8-3fd45d9fb0cf@imgtec.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2946;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=81KLNGckOpRcfiS5oiVGCafriEiyYCX0Om9SKUse4WI=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz11y2qYOityypcT5SU+tfYlChYtEXMWCK/UE+WPq
 Dujsm55RykLgxgHg6yYIsuOFZYr1P6oaUnc+FUMM4eVCWQIAxenAEzkXx8jQ9OClZzGxpaa69bK
 sk47dXCxxBbnQs9EK8Fpu9hdTlq2rmb47+oZ820f626P6l9eNhO5bsRaHxFrd4rbbXVr7pRSLv0
 n7AA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: EmQI_Ii6gB5zrTOu_0DCPDXIPwRD9Dqw
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3aed cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=UMqySDzDKqdhnTw82VMA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: EmQI_Ii6gB5zrTOu_0DCPDXIPwRD9Dqw
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

Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
integration in the TI k3-j721s2.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- Use normal reg syntax for 64-bit values
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 9dc55a6d0d4023983a3fc480340351f3fa974ce5..b620baa56a4caa41246f7b53064d0e3309bdda8e 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -18,6 +18,11 @@ properties:
               - ti,am62-gpu
           - const: img,img-axe-1-16m
           - const: img,img-rogue
+      - items:
+          - enum:
+              - ti,j721s2-gpu
+          - const: img,img-bxs-4-64
+          - const: img,img-rogue
 
       # This legacy combination of compatible strings was introduced early on before the more
       # specific GPU identifiers were used. Keep it around here for compatibility, but never use
@@ -78,6 +83,18 @@ allOf:
       properties:
         power-domains:
           maxItems: 1
+  # Cores with two power domains
+  - if:
+      properties:
+        compatible:
+          contains:
+            anyOf:
+              - const: img,img-bxs-4-64
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+          maxItems: 2
   # Vendor integrations using a single clock domain
   - if:
       properties:
@@ -85,6 +102,7 @@ allOf:
           contains:
             anyOf:
               - const: ti,am62-gpu
+              - const: ti,j721s2-gpu
     then:
       properties:
         clocks:
@@ -105,3 +123,26 @@ examples:
         power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
         power-domain-names = "a";
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+
+        gpu@4e20000000 {
+            compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+            reg = <0x4e 0x20000000 0x00 0x80000>;
+            clocks = <&k3_clks 130 1>;
+            clock-names = "core";
+            interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+            power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
+                            <&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
+            power-domain-names = "a", "b";
+            dma-coherent;
+        };
+    };

-- 
2.47.0

