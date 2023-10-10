Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78517BFDCA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0604710E37E;
	Tue, 10 Oct 2023 13:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C1910E378
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:38:54 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39A6U2sC016249; Tue, 10 Oct 2023 14:38:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=Fz5QMoXlbfoIoN9GHQeMfeqK97VCo+7CNN545Zt13BQ=; b=Z8s
 kfBwGUZbM8SE0vxn1M9ZzY5Z1RnffGEJrqMZJh+FcCc1SIuzrEEjQQpVknn9rdBz
 6qreH48oT2pFVlujZqZoXhrXWIlOkzJSkLVGq3pC7cdTSYgzFNKE3qH1/tfC30v2
 OjLa8lL7JIqvVo0azTfdbu+D0oMCZd2A9P538fXQuxQUvMY/rfzhv3nrA4VfMCQo
 nPTLBw19rqRITj3R21wix5e6yuYk0Gv9kBci6VsVMpodS9vZ7zGT2pVL2QZC214j
 KUAA8oiR0cV3bVqtkOH51g4MACUmqrNtjb87rrl9Db+geyLU7zkbI3qz4nDc0o3O
 6h5q/K9aKvoTlrgZMCQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3tjydrt72f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Oct 2023 14:38:09 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 10 Oct 2023 14:38:08 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Tue, 10 Oct 2023 14:38:07 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHtU2PtcKb8UajIUwkI0Akqi0Jh3gnUyH1DGAl10eAhSsd9Zl7JTPLYICJjisrgOimBKi5KOSI/zAbfED6oUTaBUrjx9WgkFsUCJb3trIuzWyipZmh6KZ82yI7HJJ/ExCeSihn8wkzNciEiEthj7trmYU93UlJ8tnPzfM+e+0qJq7zJg27DogSYB6EvwSBS7fI+vj/G0D9Kz2mdd76u5acLZwod/ZAZxWs16RYPCAO5D8cF28GEAdHn2PuDvE64UukDEQ4GqvPmy7NBCwqm9JnCpgMOMr8l26trZBy5cNJcCwujGjMovg6qFD7ot3p/seczN0/fISgUewY5AOFyrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz5QMoXlbfoIoN9GHQeMfeqK97VCo+7CNN545Zt13BQ=;
 b=J/ppfujKQIvEzkwi2RGlGvlJv/FmwAPY41UGJIJHRM7GeG/JIKMwSpZzy5IFtSklx951BOOKEoFev4oUsDO6ZFH2QiY5hfp5fFdXsEoM7ZThCsDpnZ+/AA6B6qxYdtXYgbXIIgp4V4PlQuNemHrw9Fhkf2oFuBVZ9eBKjawADvmmphJc7jJvNRYqZMaM56SjHKXHdM5llBcfr79H3HzgJAEIOzQUFpWAClp88chKYscMpPB+HS5nJ8DfC4wQQO3wH/ANH7iGFewxsdfp2hSN8XZSrKKVznzVjDP94MHKQFH9UyLpL6D9sBcjHcWhDbSEVc+MaG3YOYJP1+5odHclZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fz5QMoXlbfoIoN9GHQeMfeqK97VCo+7CNN545Zt13BQ=;
 b=dfr8iKJ9GHzgkbdR8MUCMwirBzsI15nKqpkkVQ86ul29EPlRrWVuXngk+HTaCl/gI6mTTkVs23TWb23eBKjXRcXHKGRioMnsX+pYh4wAjQcju/2lSHHsU1IsVM30hjaJczG/RDtw4jvoHSexu8LfCLcnU1lnY4RKxnHAj79xWEU=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2442.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:38:07 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:38:07 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
Date: Tue, 10 Oct 2023 14:37:21 +0100
Message-Id: <20231010133738.35274-4-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010133738.35274-1-sarah.walker@imgtec.com>
References: <20231010133738.35274-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0183.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::8) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LNXP265MB2442:EE_
X-MS-Office365-Filtering-Correlation-Id: bde7e5ee-ef3c-42ab-5c78-08dbc99622be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQpoVu6roBOQe2evxj6KRdRv/YoPUVi5rp13CBHQo5oDP3ab/zFfLbmHwWlBLo61XGO7Zh35gSZRSNxTNebfu6yQfSz6g/u2p3Yib34SVdjozC0dctLQsTX72QGZuSyZjYen0wqXQplIl7JUWkASH9qbYmCvLKlqG9z4oDvHKBFQwMOKvBJrf5Dv2sdZ46Y+aXzrmVUeZ7TmiaABHEvB6uIUZGGCNFrlfnT9mqgaf1wcZf0YMYeQ6eyW9FPZGABmQjo8OnSEBeds54cXx880cxp2YyKXbvnp2nsbpfGt5nrf7R/rbGDRqFWYJuOS2AKjoTCKfJhadl7Nyv/y+V33I+lPM4wpSG0kZ6ArAdKK7zSNTH6BE6LIQCfDaFBC8cwMrha7OAoAQi6GxbDjw0NMbtKW/lUoyMDoqwJd0nidsZgr40g81r3TmZFg8yKKM1hk5E8vF+5rGk1JZDTWskKzhLmEuuvVs8ccakvMjPc93HcrBAGc3qwUIcmNIf1tND4uFW3lWnR6QbNsDnfZ/0xdzUpQahU1Pz7vPekw89k9iHNUrWsJ8dIWzuj0L0cmuxlmJPlDoR7nEtNx3iNCmXJKFxIVuxYU5C2P/yh6p5XmtHk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39850400004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6512007)(52116002)(1076003)(6506007)(2616005)(478600001)(966005)(6486002)(6666004)(44832011)(26005)(83380400001)(7416002)(2906002)(5660300002)(66556008)(54906003)(66946007)(66476007)(8676002)(8936002)(6916009)(4326008)(41300700001)(316002)(36756003)(38350700002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r3Ey+2/Vgpjsp3MbpF02TXnc9umUTYBS3JTh5ElLosogwuj/XXokQVYyVt1u?=
 =?us-ascii?Q?/E5M1YnkhUZJBrJEuYgg3wcEzg1gOvd+h+VGPZ7cxWWiJu64JgPuY1URCBzO?=
 =?us-ascii?Q?1O0YHpHmgjCpKoaNezhRBlPNmOdqBD8U9u34/EJAQ9vD4MJf6dDGkQGCaIF4?=
 =?us-ascii?Q?FbvpjOL/I1n3oxuf0duzHe6mx/4JfjdYkN38fCGEbtsdpz/DTN/7P7CWIaFu?=
 =?us-ascii?Q?L9PqdpJM3SP6Bg5mpX2i/CxJuH0DV5OGGdLxFh6I8I+T7SaUsgK2ZhRCzwXv?=
 =?us-ascii?Q?3hOnhfvZYfLR++TTpk8KolEl+L5aPY+gwdmAa0sXN81MEFoU3a7SUN3s8njk?=
 =?us-ascii?Q?pSOOS7n7PU5CS4d9LMqTFqb+t/TI5FT8ASXNeCiv8a2TILOSxRcfqMzfT8sb?=
 =?us-ascii?Q?2P9KErCrzrRxpwCKp+oHJQJONZ7/zSc1y6IQ2AIY2YUcgfArF2pdExqxS6ID?=
 =?us-ascii?Q?FU4d2URkTXOzKtxuI9g6EdZiJoVN5EwI+Mk4SeRcktVqmB7QYGKIrVN7Lfnj?=
 =?us-ascii?Q?h7IOg26SDEMQyxEsOsiWx6HTfvUpVJ2TL0sWFh08w+LSGI2aTg9cAxewB9kN?=
 =?us-ascii?Q?nQRj2n6THdIyAeFaSqN3M9aiRtEj1RoACFIfLbS0TBtEEvFN6sCkRJWV65cS?=
 =?us-ascii?Q?/tnOF99LA5fmTaf4MO9v3affQsvr8d/4jFSea/s30b8EDAY70l2PjPk38laQ?=
 =?us-ascii?Q?s3fEEbyCk0cGcKSj0zrGsdxGx/87sKJ0L7Uiqu5JUEsggbEt2dm93SMVPtj2?=
 =?us-ascii?Q?RvKqaQL3TLk/yiIk5jAWo/8yXDCvMu6BECQPi3yt9eeLwjRYAPnrGuag5r78?=
 =?us-ascii?Q?YsMT66B5OdHpntGBe9PRBodY89/WOP/rN5RmLwvV1jtnRAmkOHtIH4DtYfsP?=
 =?us-ascii?Q?LD4CsUHV+Bj4nzp3vag9P7H0KQA4+bMLN1sRWiaJduTiAuWduYMCMLIPCGcy?=
 =?us-ascii?Q?tju+wyMsCu6SPbU+h8ObQJ8+xa3jmxKsYa1UoI1IRA1RFYKhaKutjLoB42/y?=
 =?us-ascii?Q?cE6Tdd9XxAQqi+j1xkmWRN5MYc4CIhXc+JjolotgGAJ8FIY+67Hrb6GKXyR6?=
 =?us-ascii?Q?uf8hwOpb2kIcGcktjHVYlNBXnhHQRzGydTEUELdsSiNRwubWfsxyiFz38gor?=
 =?us-ascii?Q?nwdkxn4h4GaTnr4fLeqshrMbhDwF4iovqehUDHYQS09fJR+WsgEMfKoEDnEL?=
 =?us-ascii?Q?1PKwWHVrZhTzQpK/tvyFLxiMRlMfnLMVWOLdcxzGVippk8Mb7MA/5IR8cGNi?=
 =?us-ascii?Q?Z4qnLn9E65FUoqPDHyekGSXFi9bHHS39Xe5+6rn3Ir4uuSLhtixSbS9aGxPm?=
 =?us-ascii?Q?lFAR+0afp5xpe9B4woUl5w0253bgGRGfocSPQEcnNz/tSPaKC/M2wb5IR7Zl?=
 =?us-ascii?Q?C5L3UMG/B/cGj5v+NQTQY5Lmg9VqcHd2e0uzMKaH0MuKoCdIEopH6KJ67Je3?=
 =?us-ascii?Q?/aKSRq94+5hMv2z2KpbwLpTOsLodgeVX1P5uvQQhbKTKGGKIEU8k0O4kWd2d?=
 =?us-ascii?Q?KDTwiK1OnCxQqgPq0BDw8wQOkdMGO7ae5FC9Ax3VrwFfr5aqzvZ9CSizfb83?=
 =?us-ascii?Q?lsBV8hmg3mmHdnWqFew27KjefHg2f0+qW59KEJ5H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bde7e5ee-ef3c-42ab-5c78-08dbc99622be
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:38:06.9372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFtl5XLDvCEwtbU+cu56DMxTsla3HIZSVnikA2Lvdf21iDARfGmewNOBLu7bEaaVqyBGs6GHI0oyxbZWs6wVQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2442
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: DM4VFoAV_r56_mAckm134o4ZC1W85U8a
X-Proofpoint-ORIG-GUID: DM4VFoAV_r56_mAckm134o4ZC1W85U8a
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
 donald.robson@imgtec.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mripard@kernel.org, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the device tree binding documentation for the IMG AXE GPU used in
TI AM62 SoCs.

Co-developed-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
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
 MAINTAINERS                                   |  6 ++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
new file mode 100644
index 000000000000..e81db87a1f46
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
+  - Donald Robson <donald.robson@imgtec.com>
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
index e05506ea8917..eea8e618746a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10228,6 +10228,12 @@ IMGTEC IR DECODER DRIVER
 S:	Orphan
 F:	drivers/media/rc/img-ir/
 
+IMGTEC POWERVR DRM DRIVER
+M:	Frank Binns <frank.binns@imgtec.com>
+M:	Donald Robson <donald.robson@imgtec.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+
 IMON SOUNDGRAPH USB IR RECEIVER
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.42.0

