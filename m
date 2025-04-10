Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B921BA83F86
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F8710E889;
	Thu, 10 Apr 2025 09:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="CV0cHlDF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C09710E8D2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:55:38 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A62MMD009620;
 Thu, 10 Apr 2025 10:55:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=s
 cVkhJAXmCTdP0a6fxMbAsiiiW2o8irbfDoDbP6cwlw=; b=CV0cHlDF3JOwzzeNS
 xxjSuaoL+E2Pt0W3ZBfCwXnmxbApN3eJK4HzXfmjvrFVGj64mG8WkWnNIn9a9KjC
 EOZNpsqVeUwgmwsxPQiQ3ySmABwP53u4wRgiDiYBprXoSp37TW3D9V/ILP/u1pvH
 zPPEpfahzXYN0tjuMErAFZEJOgPST0316T9MreH8xtWrSJe91ENxq8npc1Dls737
 peEIhuVpjMeIsMYogqhHFVBqA9rsai5hYI84g+/4foy5kQF0UcuIVpJlH7NbmyMk
 yK0qhggixbgtUq0aB0H/Ta9S+ISV9IQcLtpc/OO7AQGJkuslzuLIfC8VAWLxGTwi
 y/Uew==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45ttssbgdy-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Apr 2025 10:55:18 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Apr 2025 10:55:17 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 10 Apr 2025 10:55:01 +0100
Subject: [PATCH v6 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-sets-bxs-4-64-patch-v1-v6-2-eda620c5865f@imgtec.com>
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
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
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3192;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=fhRK6V4a8oVHsi+Z355xgHItBt9W8Q1EnMu2lgZoUb0=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaR/n9oYcb/lW+WWHM61oq8b+Ot0X13OPaY5YZtzsMH7t
 fYl9XIzO0pZGMQ4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAizvyMDD1TDl53m+2xoKny
 Wo1Z87Yt2U13Dq2/9mHiOu4Px/+nzutkZFi19O10riuVHUE3qyWirj2+8c3afo7M1fU97u7erXM
 cCzgA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: AEYioQ_KxR-IbWnvZwRwBHSSLzKt_PiP
X-Authority-Analysis: v=2.4 cv=I7hlRMgg c=1 sm=1 tr=0 ts=67f79586 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=KKAkSRfTAAAA:8
 a=p7jsAhIcb97OX6hTVYYA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AEYioQ_KxR-IbWnvZwRwBHSSLzKt_PiP
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v6:
- Add Krzysztof's Rb
- Link to v5: https://lore.kernel.org/r/20250326-sets-bxs-4-64-patch-v1-v5-2-e4c46e8280a9@imgtec.com
Changes in v5:
- Replace anyOf/const with enum
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-2-d987cf4ca439@imgtec.com
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
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 38 ++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index e1056bf2af84c3eb43733bdc91124a66aaf51d35..0fb2cd939aa45b48b0a6a95ed7f01e0c6f64a4f3 100644
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
@@ -48,11 +53,14 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   power-domain-names:
     items:
       - const: a
+      - const: b
+    minItems: 1
 
   dma-coherent: true
 
@@ -82,7 +90,33 @@ allOf:
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
+            enum:
+              - ti,am62-gpu
+              - ti,j721s2-gpu
     then:
       properties:
         clocks:

-- 
2.49.0

