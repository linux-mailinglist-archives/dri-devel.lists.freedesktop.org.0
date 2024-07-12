Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D42792FB17
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 15:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6370C10ECFD;
	Fri, 12 Jul 2024 13:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="x559r/oe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F8F10ECFD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 13:17:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46C8X9Vj004034;
 Fri, 12 Jul 2024 15:17:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=GPNNdFG7/0l0CF7aIlpKbg
 MiRxXwV7FSN15i1F01Eo4=; b=x559r/oengxe8fA9Gxt2xYzs2RTPLZiAxGcCKP
 i4WTo+O7D9N+Hb+n3MB4DS/JwuQUxl7xz9sslfRzDJi+bXhxse8yv44ubCDiEZhF
 oG2BW/V0zektHpuMb+rET1zI7rL6+EgvoMWRWrGkSmVk45vSNhcmN2+Ft0NKYwsQ
 86GzbibjScvDRz/knnwvADVUop6aiu02VTuN4OmDi3WfQwnKTSfipdom3rGG9NEt
 tKzzFBkxzYfEk2jP9/MD1BuFQZ7lxZk+0JjZKDK6F4V/RXZ/LIEvroNdoXDKTaBN
 zE3fdvDlpeEKnVyrP0vkBa0kR0mOXGAQ0CJTwqpVGTH4M1sQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 406whg9qj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jul 2024 15:17:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9F5224002D;
 Fri, 12 Jul 2024 15:17:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA15F20D3F5;
 Fri, 12 Jul 2024 15:16:26 +0200 (CEST)
Received: from localhost (10.252.16.177) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 12 Jul
 2024 15:16:26 +0200
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
Subject: [PATCH] dt-bindings: display: st,
 stm32-ltdc: Document stm32mp25 compatible
Date: Fri, 12 Jul 2024 15:16:24 +0200
Message-ID: <20240712131624.98898-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.16.177]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_09,2024-07-11_01,2024-05-17_01
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

Add "st,stm32mp25-ltdc" compatible for SOC MP25. This new SOC introduces
new clocks (bus, ref & lvds). Bus clock was separated from lcd clock.
New sources are possible for lcd clock (lvds / ref).

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 .../bindings/display/st,stm32-ltdc.yaml       | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
index d6ea4d62a2cf..680669c44b80 100644
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
@@ -24,7 +26,9 @@ properties:
     minItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      description: Lcd Clock
 
   clock-names:
     items:
@@ -42,6 +46,27 @@ properties:
       - for internal dpi input of the MIPI DSI host controller.
       Note: These 2 endpoints cannot be activated simultaneously.
 
+
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
+          items:
+            - description: bus clock
+            - description: reference clock
+            - description: lvds clock
+        clock-names:
+          items:
+            - const: bus
+            - const: ref
+            - const: lvds
+
 required:
   - compatible
   - reg
-- 
2.34.1

