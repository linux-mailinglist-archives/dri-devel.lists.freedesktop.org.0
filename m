Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2759D1134
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AB510E4C6;
	Mon, 18 Nov 2024 13:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="k4Kx49DF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DB010E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:02:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICKePi029230;
 Mon, 18 Nov 2024 13:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=5
 0swHImWKQXwqEsla20Z8gC3MyM8KMWAHeZ2xPCj99g=; b=k4Kx49DFB3K9B9IKT
 Y3Id0XVTXwj6ei/xXWXVwyf7cIu9PBDtlIjsAQJylZcNEN9TNzm9jAByu/gslqb2
 J4N4i+0QPxbnsMp8jkoITnCyt9hcr89VanU82gIcSrJnK5rPk/UGRdXHmvq9VGn/
 YODx1kIwQWyfv84mvGK232r+BPCNhH80qRWuHiAq1XeD7JatGZ5MrDXYDeQWGztI
 muq/1sBbV6ZVhy+oZQMcRlqrm684YoCiQLYYsdwfABQ/niqTNO0rK94gD7NtmuMy
 obQsz/3Q8nZfG5X6/x9NqoftBeCWzbhS8R4R3YA0/uXTVh2X99iBdSNgDiU+5Vuo
 N2f0A==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmhy-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2024 13:02:35 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:33 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:01:56 +0000
Subject: [PATCH v2 04/21] dt-bindings: gpu: img: Allow dma-coherent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45d9fb0cf@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=QR/jy18Q3nJy2xtQXtFeNujl4LHlr+a2FMAmw0I4okU=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz35f/qD9UfNSU2rNlUs+15Vd27SKYcWhhnvZQvcv
 D5caV8zr6OUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAm8nQLI8P0+FPzPqjsEll8
 1rXKWMcm0cuqYIVu4u6qPlHfhVmpXusYGSaZ5U0K3CXBuFlglffNg1Hv15gdrGb5vOV8+3UH04u
 cF5kA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: wi5PtOw-yDY1dNKmIzvA_YE45Ce4Qsb9
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3aeb cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=0bZM3z7tgssSke037HYA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: wi5PtOw-yDY1dNKmIzvA_YE45Ce4Qsb9
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

This attribute will be required for the BXS-4-64 MC1 and will be enabled in
the DTS for the TI k3-j721s2 in a subsequent patch; add it now so
dtbs_check doesn't complain later.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- Simplified power-domains constraints
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-4-4ed30e865892@imgtec.com
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index c629f54c86c441b4cc9e57925f1d65129cbe285b..9dc55a6d0d4023983a3fc480340351f3fa974ce5 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -53,6 +53,8 @@ properties:
           - const: a
           - const: b
 
+  dma-coherent: true
+
 required:
   - compatible
   - reg

-- 
2.47.0

