Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6709D1149
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBCF10E4D1;
	Mon, 18 Nov 2024 13:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="KLmj6G1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08D810E4BD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:02:49 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICKePf029230;
 Mon, 18 Nov 2024 13:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=c
 PZ9rm162er/TnZeptBWDE184JcGib5AQramdw2qhZY=; b=KLmj6G1B62d5vd/Yp
 lZApZzjFw857dc2BOuEcFjNhS1NCIitB1DUzuFdprxTbc1QIMYrypcrNKZA8tqDs
 7Y6t19r7f605skEpQgzsNrHpMVH7cITrV3LxXDUraKNchlJrbDhhyAwB1ksoha+O
 +bQtwW9Te8B8KTgULEw2jTYouZ0oGO23tW3hp3KqPbRLzwF2aXn0R/axLjjqp2tl
 u4l/h4pE/MCtMwqzTkLF3JSuB8KltzlyLNXal9SJ/cxbfWrojmkQV3fQCsyJav7Z
 we7Jnhy9oqr78BgUVKR17jZKlHddUvhAMT1LLl9cxsnZVbavUMbalRhBTRrwJW7N
 DwFLw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmhv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2024 13:02:32 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:31 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:01:53 +0000
Subject: [PATCH v2 01/21] dt-bindings: gpu: img: More explicit compatible
 strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-1-3fd45d9fb0cf@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3013;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=DpicsLvRYco/Cskx2EYJLwUk9He6m1kHonPNsF2bICE=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz2pnuv2+B/H0/LcrAMqPS39Sw3SdGLX3nkSeXav0
 iOdyYx+HaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCRuoUM/+zi5t1WT93/lXu7
 tVJIt95dni9tsoc+1D30mfr0KI/Yi0CGf5ZF5vO9HuXdmPhVrjj44+usm/y7Z/FEx4Zwd35ceuv
 gd34A
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 7MkrfIZQhJbBM942VtzARgiKbgOx9A6Q
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3ae8 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=nBKxard2HoEgs5BrZHgA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 7MkrfIZQhJbBM942VtzARgiKbgOx9A6Q
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

The current compatible strings are not specific enough to constrain the
hardware in devicetree. For example, the current "img,img-axe" string
refers to the entire family of Series AXE GPUs. The more specific
"img,img-axe-1-16m" string refers to the AXE-1-16M GPU which, unlike the
rest of its family, only uses a single power domain.

While in this instance there is already "ti,am62-gpu" for the more
specific case, the intent here is to draw a line between properties
inherent to the IP core and choices made by the silicon vendor at
integration time. For example, the number of power domains is a property
of the IP core, whereas the decision to use one or three clocks (see
next patch) is a vendor one.

Work is currently underway to add support for volcanic-based Imagination
GPUs, for which bindings will be added in "img,powervr-volcanic.yaml".
The split between rogue and volcanic cores is non-obvious at times, so
add a generic top-level "img,img-rogue" compatible string here to allow
for simpler differentiation in devicetrees without referring back to the
bindings.

Make these changes now before introducing more compatible strings to keep
the legacy versions to a minimum.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- Clarified justification for compatible strings
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-1-4ed30e865892@imgtec.com
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml    | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 256e252f8087fa0d6081f771a01601d34b66fe19..ef7070daf213277d0190fe319e202fdc597337d4 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -12,10 +12,19 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - ti,am62-gpu
-      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
+    oneOf:
+      - items:
+          - enum:
+              - ti,am62-gpu
+          - const: img,img-axe-1-16m
+          - const: img,img-rogue
+
+      # This legacy combination of compatible strings was introduced early on before the more
+      # specific GPU identifiers were used. Keep it around here for compatibility, but never use
+      # "img,img-axe" in new devicetrees.
+      - items:
+          - const: ti,am62-gpu
+          - const: img,img-axe
 
   reg:
     maxItems: 1
@@ -64,7 +73,7 @@ examples:
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
     gpu@fd00000 {
-        compatible = "ti,am62-gpu", "img,img-axe";
+        compatible = "ti,am62-gpu", "img,img-axe-1-16m", "img,img-rogue";
         reg = <0x0fd00000 0x20000>;
         clocks = <&k3_clks 187 0>;
         clock-names = "core";

-- 
2.47.0

