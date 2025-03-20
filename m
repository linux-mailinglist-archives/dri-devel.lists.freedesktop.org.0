Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D9AA6A4F7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7514310E206;
	Thu, 20 Mar 2025 11:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="NDeKYbTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4499D10E5F6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:32:47 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K7I9lQ006831;
 Thu, 20 Mar 2025 11:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=l
 r5SMVo6ot4cized530mm/a6X85tNB6jtCSyH+fzzrg=; b=NDeKYbTaiFjYW9XHm
 K281VDwv65xd0jrvpEcGpjQ0zOPEmEr2/c6dJMAqrieKV0P2ZfXdxb1DzN78kFy3
 HPfaeLXAAN+9qfVlAmxoTVKcGmP2EJK/cHUf/kFjiQkOdzoFlT5OLZhP+EYQBlCy
 SOBJwqk33JntastXqBDcNlKjQSDGttG0JmCYMMADPf3y00yaOiSrHf6hUCtFjQqA
 6hKmrqC070AiQRiNFtxsTct7KO2XfJFa7P/dVe7SbkIeYpy9S4cCit/ZNrTQ3ShF
 sSri1qdI2vRcVEfBr6n/uMJfGEFFw2xM7jaT/woSdoU9xJmJGlUIwX4buc6FPrlW
 WcDOg==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45d2h1kwg1-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 Mar 2025 11:32:25 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.0.133) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 11:32:24 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 20 Mar 2025 11:32:12 +0000
Subject: [PATCH v4 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-sets-bxs-4-64-patch-v1-v4-2-d987cf4ca439@imgtec.com>
References: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
In-Reply-To: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
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
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, "Michal
 Wilczynski" <m.wilczynski@samsung.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2831;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=oco6EOI0oRzuxssXPEMpwZfSQ4MFd+tIvIEa69emjI4=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaTf/nNk37SVAvcXnNzQvG6y3uk1v3csXrjRx3EZM2/Yz
 G/ZBvf1tneUsjCIcTDIiimy7FhhuULtj5qWxI1fxTBzWJlAhjBwcQrARLLnMjI8nLvim6aYdPHS
 38XHn2550Pxtxy3LblFRr/n/c/7qvxFdy8hwYsYDFs7nq5RZtm00mjat1vHXjMh5kW4Jj2LnMK9
 XDUvjAwA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: Ggy77VPNKh9aNxMtqWe8QxSJrY5hHW_W
X-Proofpoint-ORIG-GUID: Ggy77VPNKh9aNxMtqWe8QxSJrY5hHW_W
X-Authority-Analysis: v=2.4 cv=V8Z90fni c=1 sm=1 tr=0 ts=67dbfcc9 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=Jpv7S-64fNqZkc0ws1sA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

Unlike AXE-1-16M, BXS-4-64 uses two power domains.

Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
integration in the TI k3-j721s2.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v4:
- Add minItems: 1 to power-domain-names so we don't break single domain
  bindings
- Add back power-domains to conditional constraints to match
  power-domain-names
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-2-143b3dbef02f@imgtec.com
Changes in v3:
- Include adding the second power domain so it's in context
- Remove unnecessary example
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-8-3fd45d9fb0cf@imgtec.com
Changes in v2:
- Use normal reg syntax for 64-bit values
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 37 ++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 2a692feb5bcd526788117fce7934eef9521b364d..f82139f3b2c897bafd36e794cb7466941cc14e65 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -21,6 +21,11 @@ properties:
           # work with newer dts.
           - const: img,img-axe
           - const: img,img-rogue
+      - items:
+          - enum:
+              - ti,j721s2-gpu
+          - const: img,img-bxs-4-64
+          - const: img,img-rogue
 
       # This legacy combination of compatible strings was introduced early on
       # before the more specific GPU identifiers were used.
@@ -49,11 +54,13 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 1
+    maxItems: 2
 
   power-domain-names:
     items:
       - const: a
+      - const: b
+    minItems: 1
 
   dma-coherent: true
 
@@ -83,7 +90,33 @@ allOf:
       properties:
         compatible:
           contains:
-            const: ti,am62-gpu
+            const: img,img-axe-1-16m
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+        power-domain-names:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: img,img-bxs-4-64
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+        power-domain-names:
+          minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            anyOf:
+              - const: ti,am62-gpu
+              - const: ti,j721s2-gpu
     then:
       properties:
         clocks:

-- 
2.49.0

