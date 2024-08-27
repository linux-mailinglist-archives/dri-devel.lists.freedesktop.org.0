Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F19960D0C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 16:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D2210E304;
	Tue, 27 Aug 2024 14:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="Z4BxGOTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B56910E304
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 14:06:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RBUL10022292;
 Tue, 27 Aug 2024 16:06:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=Ff8eTytbmxual/Q6Fz+3og
 SbrU6ts/Ud/smwAdcvD1s=; b=Z4BxGOTafsPvaVeoMcVA4HSIvefTkhCk69F49t
 e6HP6gA6/fLH0WjKPX7Fzfala5tzrjPk2DyhXPaoQXCaOsEiDWXEGB0Uk+7xvQ5W
 npDoh3j5usl1HoVSHRJknTs1ya8yrbW2lpN3f8SMjSq5jEgeCLUp+v0MwVAnKGhs
 9Bnhy94N+hLZICXYZsfeDtFBC3NyrsL7BHFDqXVTC9VLWECprh3UOCzUcd/lz/GJ
 T2ErZgkVe1Uc4X8eSy9oh9RZE6B2RXWjeQezOhrzVd/R0R6FPLmoK5AacpCvqVJX
 EgQpEsjlZO9WeJLbhai9PLDSjtf0m0slx3gNg1z905Cp7dnQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 419e00rmq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2024 16:06:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EDC9B40044;
 Tue, 27 Aug 2024 16:05:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 435F926C44C;
 Tue, 27 Aug 2024 16:04:58 +0200 (CEST)
Received: from localhost (10.48.86.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 27 Aug
 2024 16:04:58 +0200
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
Subject: [PATCH v3] dt-bindings: display: st,
 stm32-ltdc: Document stm32mp25 compatible
Date: Tue, 27 Aug 2024 16:04:55 +0200
Message-ID: <20240827140455.115182-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.237]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_08,2024-08-27_01,2024-05-17_01
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

Changes in v3: Add max/min Items fields.
'make dt_binding_check' command fails on previous patch, rework fiedls mas/min items
of properties clocks & clock-names.

Changes in v2: Rework clock property.

 .../bindings/display/st,stm32-ltdc.yaml       | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
index d6ea4d62a2cf..940127820de3 100644
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
@@ -24,12 +26,12 @@ properties:
     minItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
 
   clock-names:
-    items:
-      - const: lcd
-
+    minItems: 1
+    maxItems: 4
   resets:
     maxItems: 1
 
@@ -51,6 +53,22 @@ required:
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
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          minItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

