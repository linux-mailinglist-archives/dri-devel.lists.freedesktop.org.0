Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1930C7F4D93
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297E710E697;
	Wed, 22 Nov 2023 16:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEE010E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 16:56:54 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AM7kZhh006720; Wed, 22 Nov 2023 16:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=e1lAbGIm/0ApJNRayBFj8OYj2RXVHEx225GzUpRY+K0=; b=Wct
 bhDxaw0VDSPyVleE67jIN4ZThIo1IwxdeFRu1s+3BU8Q+gt0VZq6yRcHiHxPD6Wk
 nZwfcWk+b3ZFdBaQK95j1ApjXTZBrKoq6xtaWRWMuf56aB/XGEqLqzzvUtmolHoh
 pDGf4k5PT4d8EQK8EI/X2AXwWOAihc+sXyF9/QaWbKYD/4IqQ+4clN0wu1nu3zSm
 wEjJUos6vdLf3c4a2VkFGwidXJfwlq8IW6/leEcz7SvjEWdOncFNSn6rv1GFKBYN
 mNw8rxEHqRq66j3CbItZsGtRLQo/H2/miUS9exj8UfW2whfW4FIEGlzE8OQzN/Uj
 MAKAQoOSOY2t4mKOUJg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3ug99gsf31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Nov 2023 16:35:08 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 16:35:08 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 16:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQckUnmZJkk25+AIbDwx0zqMzS6LlOCvvldZXhUSLbFKSb7pHLQm9tzL8yMTL8AzypJJoZkdh/hwQbb4vLKBwTP6B3UK0pim3AwNLUPW/+03no3pmPROqGeidK/vSQjY1fTtGoWHJI1DuobZ1iN0WYt8r7LrOO5FP3XSMAV5LWJc+AVtK2cm5adsrSUh/d6GVWlC4AupFXUVYnYRGqh7Ar1PVC3t7CBefV196i74gBVnZe2r0NFgCaUIqFbMP7J/pqJ+82iVDLglwp0qBFTonMuxRr2yWdTFKMsIPlBhzRjhJUsR2ZjN0++TpzeywCfHldu+25nqd8l457oI2Qqa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1lAbGIm/0ApJNRayBFj8OYj2RXVHEx225GzUpRY+K0=;
 b=Ldh/qipD1vo36F829eey7BU8C+k9ne/UZS/PMcpNLkXYmbteQvSXO03fcW61t0pRc4uOLLPwrgEVEfKdM0Api+mwk0RdwuUixUv1c6Wv9QHEG/vRnijC0rPe/RoU+itAbE2qHUpqAS6TIjsIljfq6JiJMmEVE0vToH7o7AiWLQBzFS46ZbZnYMFunFCymlbsVDwQx1OZ4+frTEMSXr/hUS4iGWRtUB/PaUmO/+/AqIByDZb9BLU/RUwCvKLhtStkEcsNg3JHe/fQo4b6wWM+p40Cyi5ZeL9EKO2mzwOeL4Vji3K9bWUk1k4xaKvh5YUYO9BaSErgiG7zD/czUEAJnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1lAbGIm/0ApJNRayBFj8OYj2RXVHEx225GzUpRY+K0=;
 b=VY9d7DXVt9eqQNZWJy94Jhd28iFgiU2ueRjx/gPPf635dYN/ZwYr3FkTmJHb5zH4kEKD9yd0mitLBsK9ZInMA6rKWWBY65PE5vNCssRnqIhi20RWXZz+D/UNDC6y2Q0wfAA5EnrayiAfHnCCUb/JzW/LEr0KPF8ufKQr6JxJEhc=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB5329.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 16:35:06 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 16:35:06 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
Date: Wed, 22 Nov 2023 16:34:24 +0000
Message-Id: <deb0a4659423a3b8a74addee7178b6df7679575d.1700668843.git.donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1700668843.git.donald.robson@imgtec.com>
References: <cover.1700668843.git.donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|CWLP265MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: 3060ec49-ff8f-43d3-dcae-08dbeb78fc7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gKXebg4zAQNWMrzI5e2OYFVhYbRQIrT3/E0+L2qqnvNDQxr95M9PvOZxLpU2HzD39n8VVfAZ0eWkf8/jbfP/BhOmNaM5axI8OiXrTI3qWl/BgIRcwvKawfQae41UNbCTlP5jJqei113LmzkFlkGNVvVhumav4OptuwmtELZXu6P/IAa0o39pY4ukNX25i9Vs2aHNy479p5tQ8q56XKvXuELWHWzXJadKyzBZNR2V2TJGl8GoZ2VYwYXo5mGls0zunLr4SfljluUOb/IeHA80xhi6Zif0SAg3fP8LxLJ9QWnG+K+1U6RNb6i+WgMKMgzo++oR21eOMewEx+XodNCHgVV8uOi0SRkXZu1Fu/u90456l+ungZtQhh5lk7hq7SF6RizpqPURE5OiVaoY5cehJEzzVyMMa11cHC5j0s4qesBnKcUWmMCD2O2aW23H0SDNySo5K9McBKCnTl5jxp3UfiZHUykbNkJNM+RU7CIXaIz9YaKEkFajd+HjnG0ol9482wbDHpmofjerHNyS1tVVVcN9Z6eJT4iPQSqDly3Jc23vX0T19tSe5DOw8yMyjgxx5Kn/5hNBZ5mmK/vCGwMe8WbhYhs8eJPfuc68MSG+JRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39850400004)(376002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(83380400001)(52116002)(6506007)(6666004)(2616005)(6512007)(6486002)(44832011)(5660300002)(4326008)(8676002)(41300700001)(8936002)(7416002)(2906002)(966005)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(86362001)(38100700002)(36756003)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yw1ZY4fxy2+HsK0UB5oKBpH9mGSdf+a7wVbk1Zj0jt+CVrTepOHb4CeUaE7c?=
 =?us-ascii?Q?exznUW8NBPEsbLA0XKcqVo6rVS3i5ZcNe/EfuuzmzD1g/dpWFKf+gJRGNt2L?=
 =?us-ascii?Q?nMENx5Yju47IkIjO7N/cQt53O6doCTwDO7fERDPnMnl1EYLfXcHze15jhfg8?=
 =?us-ascii?Q?wEP4o2TX2sJt+KCW8Tf0YqtXfuckAA/43yJstHb6YzX987ynCYjgZtJB/rbU?=
 =?us-ascii?Q?7rCcx6S5wO7B3eXTn9+8QopbIbRQemQI8ygTDtcOmJNn4gYbRPCL27h1Z0fN?=
 =?us-ascii?Q?r89iYoLSovSVYKup053zv4sP9nBW8vdh7K4CrBrY2wrGrNu4y4mM12v8wHnp?=
 =?us-ascii?Q?kslBYSb4eOLAI05VqbaV60u6Lc1hJzRFYqCwRAN+g5g5i4vBWc398OTqjsPX?=
 =?us-ascii?Q?zU9mwEh6dBZRgU1FdLwLe4nbaP8hnyRNIjDI8vJIpf/9zVC1SbCy4Xy7wktc?=
 =?us-ascii?Q?+3zkXJWYhADSevkAOiiv6Lh3dF13F7m1aiRQPMAn+69pGR6dx0Zqf5H5cdi0?=
 =?us-ascii?Q?OO30wzIiAyy98GtPGoLQcigVB7kScoRY/hbRks9ySyRHzLwujC1o83bsBwgB?=
 =?us-ascii?Q?Odxd+soNf+GhdDEYtXel10I/tdgCnDinf2Z3Kb3s3JcwNVvB7vJ59oikRaFM?=
 =?us-ascii?Q?krkmZowT9dFCGUIFXwzrpmRTHLrGMsIE63+rfknofTEidagxVgGg6Zq90BAJ?=
 =?us-ascii?Q?9LhQ4fhGgx/hwLRBXQVoQEIA6jJxdWIOoTPLclN3ctBgucewYO0fh5kXqIkx?=
 =?us-ascii?Q?vbP4m7AzncsC/D8fGTiOsdzrhXx0WhNdz7YZANdgMAbc4gFfNWmaJo5Cx/uT?=
 =?us-ascii?Q?pFotM1zdYsOMhTNR5uaSicfiSGBZD1wTxCt9fqYd86zuJDkQrOxVcuFzs+V7?=
 =?us-ascii?Q?AvnoKxcPbLq9sh5jpfIlAmIUu3siOpYy7pQZCmkyYRTp8Z0EuHgblVPRk2iy?=
 =?us-ascii?Q?jZKRKnJvnaTTNwaKBkLv97Da80vPP2AdFIIevj50Zq44CHH6Ez6WhmeMKiKK?=
 =?us-ascii?Q?aZ5w59jMn8BAoHcuYQJ9oQLUB/+MvQSt9EL4Av8/1KKzozZPr9Hx/ixE8vjp?=
 =?us-ascii?Q?yKEF4yiHB9s+Fsxa4pTX/YOqsQmvUHm7fo+dHnzfJHoLd5D0WSHtPYSTMio4?=
 =?us-ascii?Q?t0eqY4VR5yz/chfMRYGZFKY4KRi0SRiakoxV+mQFBfq96LV/4iLU66RIZTVI?=
 =?us-ascii?Q?5i6ehCRuPsyhHib5fkqKFMF5FCwXpKB/wf1DLVKjEO8m9vsXaQ+H8dpCtnT2?=
 =?us-ascii?Q?8fXAyGAIEbMmKY0y8tVWw9B9RLYLiVv1J7bdA7MTZYi7On2C5hUN3QxK9XbE?=
 =?us-ascii?Q?l1NnOBUUK/O6SMGDIe8XanLSWWbiDuvqaBcRHph5Fwk7xV0Hx5J0qPnpJ35A?=
 =?us-ascii?Q?sRiY2FU0MmSR4FDaPk/oswvCXhLDFd9ncglwTyGQqIgqtdNeLg/qfpnvy9Ey?=
 =?us-ascii?Q?f2ZrkUjiSiC1Ig8KJPwXaWHole+DwrmpniB99/psvgoduTJfM0yVjCEj23Lb?=
 =?us-ascii?Q?OW1wnxScHAtzhnJdJnm42FZdoLZQIvxkQbz4bu4hMwZHoYBGArGOlnifDHP3?=
 =?us-ascii?Q?fhSZLytv7r82ho2vU+N3I05SvNF0d4Ik6qotSCqWAGc6Ki0Rrsy2ylzVynmu?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3060ec49-ff8f-43d3-dcae-08dbeb78fc7b
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:35:06.8489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SjwIkjIYaNhsJArvrYMoWWm1z4x06O0GSRl1WI1MV0Hc2Hu2ry4GyIsPwhBS53WNihejqp9S/g8cO96nrCIlMvflgGwsH0yODaOBbA8MJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5329
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: HX3RrrtLg_HfH0YY5NEzrdnMd08_I1H0
X-Proofpoint-ORIG-GUID: HX3RrrtLg_HfH0YY5NEzrdnMd08_I1H0
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 Conor Dooley <conor.dooley@microchip.com>, krzysztof.kozlowski+dt@linaro.org,
 matthew.brost@intel.com, corbet@lwn.net, luben.tuikov@amd.com, dakr@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org,
 Sarah Walker <sarah.walker@imgtec.com>, mripard@kernel.org,
 matt.coster@imgtec.com, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sarah Walker <sarah.walker@imgtec.com>

Add the device tree binding documentation for the IMG AXE GPU used in
TI AM62 SoCs.

Co-developed-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v8:
- Updated maintainer

Changes since v7:
- Updated maintainer

Changes since v6:
- Remove unused gpu label from example
- Updated maintainer

Changes since v5:
- Update compatible string & description to match marketing name
- Remove unnecessary clock-names definition in ti,am62-gpu constraints
- Document that GPU revision is discoverable

Changes since v4:
- Add clocks constraint for ti,am62-gpu
- Remove excess address and size cells in example
- Remove interrupt name and add maxItems
- Make property order consistent between dts and bindings doc
- Update example to match dts

Changes since v3:
- Remove oneOf in compatible property
- Remove power-supply (not used on AM62)

Changes since v2:
- Add commit message description
- Remove mt8173-gpu support (not currently supported)
- Drop quotes from $id and $schema
- Remove reg: minItems
- Drop _clk suffixes from clock-names
- Remove operating-points-v2 property and cooling-cells (not currently
  used)
- Add additionalProperties: false
- Remove stray blank line at the end of file

 .../devicetree/bindings/gpu/img,powervr.yaml  | 73 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
new file mode 100644
index 000000000000..a13298f1a182
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 Imagination Technologies Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/img,powervr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination Technologies PowerVR and IMG GPU
+
+maintainers:
+  - Frank Binns <frank.binns@imgtec.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ti,am62-gpu
+      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: mem
+      - const: sys
+    minItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am62-gpu
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    gpu@fd00000 {
+        compatible = "ti,am62-gpu", "img,img-axe";
+        reg = <0x0fd00000 0x20000>;
+        clocks = <&k3_clks 187 0>;
+        clock-names = "core";
+        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8a70be8f08ee..59c60abf341e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10392,6 +10392,13 @@ IMGTEC IR DECODER DRIVER
 S:	Orphan
 F:	drivers/media/rc/img-ir/
 
+IMGTEC POWERVR DRM DRIVER
+M:	Frank Binns <frank.binns@imgtec.com>
+M:	Donald Robson <donald.robson@imgtec.com>
+M:	Matt Coster <matt.coster@imgtec.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+
 IMON SOUNDGRAPH USB IR RECEIVER
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.25.1

