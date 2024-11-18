Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047169D1133
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41B510E4C4;
	Mon, 18 Nov 2024 13:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="g5Kr3Sty";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43E810E4B9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:02:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICKePh029230;
 Mon, 18 Nov 2024 13:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=2
 JQ4GtsoCfcAxenq2fsItK5tMFfm9p/xP5BkCrUKQXA=; b=g5Kr3StyvEHbUP0HE
 XEwmaEfDSvIaRjZyoTuVd1/u4qETPLvp/QqqSXWqIPx1/9R1iGgnOjv+OrxzWUuP
 xAQNKoyqmFk49Dj7+7uFGlcbqmmSlQ6I95h0xr/jymv6szd1KPBn0NNsnmSZgw9r
 ZseSfRryvTU79XHJUaHtjOBJvnQKQTYt7fxN53d6dYsgnndcYCChIE036bLjNIyt
 XFVeZpJIEA0K2NXDKksUMhG2Pq4TawFhlftczwN0tXIas36VuT8hue0hGK8e/Go9
 7XMqsdnfEGh+f1wLHbP0yxXbRRaVDZF37eBm+ohwaa/80wLR0HUs9InCvJchODxG
 RPAGQ==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2024 13:02:34 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:33 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:01:55 +0000
Subject: [PATCH v2 03/21] dt-bindings: gpu: img: Power domain details
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-3-3fd45d9fb0cf@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=7vjLrqeVbec/kiwK1+Loh1po9ifOS9rsUyR0/I/IY3Y=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz053CKe9/RyYeJqtd88z6+Lr7n1V0QrS0HE6aC24
 I2jd7gsOkpZGMQ4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAizmsYfrO+7qrLTePp28g2
 Vf+gcqhqknf1uQb7vVssxNhWTr5lN5XhnylPhqzC0ttmfCZ79bK5o9hnK6kZ2AYbT6pfY59Trvy
 MDQA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: mpMDQoUd_fyBH3X77gZaBE9_QoRIEL-H
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3aea cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=Vh8Z_yn72AIZk_KtqmMA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: mpMDQoUd_fyBH3X77gZaBE9_QoRIEL-H
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

The single existing GPU (AXE-1-16M) only requires a single power domain.
Subsequent patches will add support for BXS-4-64 MC1, which has two power
domains. Add infrastructure now to allow for this.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- Simplified power-domains constraints P3
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 25 ++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 3b5a5b966585ac29ad104c7aef19881eca73ce80..c629f54c86c441b4cc9e57925f1d65129cbe285b 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -43,8 +43,15 @@ properties:
   interrupts:
     maxItems: 1
 
-  power-domains:
-    maxItems: 1
+  power-domains: true
+
+  power-domain-names:
+    oneOf:
+      - items:
+          - const: a
+      - items:
+          - const: a
+          - const: b
 
 required:
   - compatible
@@ -52,10 +59,23 @@ required:
   - clocks
   - clock-names
   - interrupts
+  - power-domains
+  - power-domain-names
 
 additionalProperties: false
 
 allOf:
+  # Cores with a single power domain
+  - if:
+      properties:
+        compatible:
+          contains:
+            anyOf:
+              - const: img,img-axe-1-16m
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
   # Vendor integrations using a single clock domain
   - if:
       properties:
@@ -81,4 +101,5 @@ examples:
         clock-names = "core";
         interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+        power-domain-names = "a";
     };

-- 
2.47.0

