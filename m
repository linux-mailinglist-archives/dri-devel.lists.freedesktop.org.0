Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D432B9BD149
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 16:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A9910E2E7;
	Tue,  5 Nov 2024 15:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="OI9f6FWd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF10610E5D9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 15:58:47 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5EF3v3003827;
 Tue, 5 Nov 2024 15:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=d
 Y/LHP00NtneYQ7ErH5EMOZJIrzL6QTNZfwa2E4UEHA=; b=OI9f6FWdoOpPmVJUH
 3/0nVfPn2xQka1LiEwxYi6FsJPATTT5Kdp8YF52Cx5VgZBB8DosRv7D3/as746nl
 gFwXaN3ZwnzXQb1SQK8sFbqAuphGO3DeRNaxxO2teRZVWi/wxPVWrYM1FnkgKiff
 1p3F9anYAEJ4qMBcU9apNKyWyfPidN0BzUHBpyKcvbuq+QENWjvzCKd4v8RIT1iJ
 wnJIBHrUg7zYwi1EFKIkre5E/cL5tDUrqWJfAWFICNjBuk/mk+I6hY+G5sd68w3b
 B0D01Xf6+G2P91IZh9ZmEGDthhM42lhtltTjVz09RUH2Nkz8J+4okR/lkO94DBCA
 jYulQ==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 42nb7wta0s-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 05 Nov 2024 15:58:27 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 5 Nov 2024 15:58:26 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 5 Nov 2024 15:58:10 +0000
Subject: [PATCH 04/21] dt-bindings: gpu: img: Allow dma-coherent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-sets-bxs-4-64-patch-v1-v1-4-4ed30e865892@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=877; i=matt.coster@imgtec.com; 
 h=from:subject:message-id;
 bh=qEsCNa+I4uXibhOsM8VA0my3x9twcfeY08gntsHzYSU=; 
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRrOcypNTd/fjx6x+3Coinv9n16decIL/fThw/v83Q2e
 3C2pG+60lHKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQAT+dLL8D8jxnp12K9s6zn6
 c061pdkU/n0j0754W4bf3D0La+XLpJkYGeY7dU+1EJt+54AQ57GkwBK+M/8czq10KMmce2fD6y3
 pfEwA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=ddzS3mXe c=1 sm=1 tr=0 ts=672a40a3 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=r_1tXGB3AAAA:8
 a=UMSW3LcNhMnowj35pGIA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 4ZaP-Ltp-wtGIMmkjc3h9GU25WFLuz0y
X-Proofpoint-ORIG-GUID: 4ZaP-Ltp-wtGIMmkjc3h9GU25WFLuz0y
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
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 55f422be1bc5b7564e3e81f24c4b93857f3e12fe..8a1861ca960c48853b2ceef414f588cc343b49b2 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -60,6 +60,8 @@ properties:
           - const: a
           - const: b
 
+  dma-coherent: true
+
 required:
   - compatible
   - reg

-- 
2.47.0

