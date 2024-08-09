Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE4C94D30E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 17:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A5710E94D;
	Fri,  9 Aug 2024 15:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="xhUXh7Qg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA5E10E94D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 15:13:34 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4799oVn4020207;
 Fri, 9 Aug 2024 17:13:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=DFo1fYl9nCcaq9Zjb9msp/
 A8hQ7oocxj4j73HSkUytY=; b=xhUXh7QgMtiq51FQ2PBRFBr2JxHE7/pXl9qbL7
 tnH2StFkY0LSOnB8gF7gQHH9VSNIpTa+f/F8rUS9GK8/O4omf0y2yHcTl/EPINAj
 3/bLMF/JmoeSuLP62Gt7o4tPL11RHQ/df5NnxEekZGZV4jyhHIu/NqNMd3Hsa6cC
 /aPK1wxjGac1SH/0/OzkZ9R5/6KQ/oE8tA6/1wzAcJO5i/Mpy7JbeqKGx3L8xTmu
 dWADCQqmXgX/Y2sEEr46fbSoZlPest5CLVnZLNKPGYlMYqGkSVBbSakq27p4FhBE
 oQIPaFVCoFSkg7CV0UsCETtuDrHQLNKm04M61ucNw3IhGZAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40tu6nwcx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2024 17:13:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 49C7140046;
 Fri,  9 Aug 2024 17:13:17 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACEC12612A9;
 Fri,  9 Aug 2024 17:13:17 +0200 (CEST)
Received: from localhost (10.252.26.60) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 9 Aug
 2024 17:13:17 +0200
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] dt-bindings: display: st,
 stm32-ltdc: Document stm32mp25 compatible
Date: Fri, 9 Aug 2024 17:13:14 +0200
Message-ID: <20240809151314.221746-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.26.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_12,2024-08-07_01,2024-05-17_01
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

Add "st,stm32mp25-ltdc" compatible for SOC MP25. This new SOC introduce
new clocks (bus, ref & lvds). Bus clock was separated from lcd clock.
New sources are possible for lcd clock (lvds / ref).

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
Changes in v2: Rework clock property.
 .../bindings/display/st,stm32-ltdc.yaml       | 51 +++++++++++++++----
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
index d6ea4d62a2cf..cc578ad9f040 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
@@ -12,7 +12,9 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32-ltdc
+    enum:
+      - st,stm32-ltdc
+      - st,stm32mp25-ltdc
 
   reg:
     maxItems: 1
@@ -23,13 +25,6 @@ properties:
       - description: errors interrupt line.
     minItems: 1
 
-  clocks:
-    maxItems: 1
-
-  clock-names:
-    items:
-      - const: lcd
-
   resets:
     maxItems: 1
 
@@ -46,11 +41,47 @@ required:
   - compatible
   - reg
   - interrupts
-  - clocks
-  - clock-names
   - resets
   - port
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp25-ltdc
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+          items:
+            - description: Lcd Clock
+            - description: Bus Clock
+            - description: Reference Clock
+            - description: Lvds Clock
+        clock-names:
+          items:
+            - const: lcd
+            - const: bus
+            - const: ref
+            - const: lvds
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+          items:
+            - description: Lcd Clock
+        clock-names:
+          items:
+            - const: lcd
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

