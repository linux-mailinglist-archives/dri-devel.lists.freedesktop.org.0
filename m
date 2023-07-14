Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D5A753D3D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4FE10E89F;
	Fri, 14 Jul 2023 14:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441C610E89D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:26:41 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36EBtqSa022399; Fri, 14 Jul 2023 15:25:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=lJF9YwzBSbKwzuwNVB9O/
 3JaF/reeNNDtpItKVJUM9M=; b=AF7FLPxzTWKokhvzVYCCvqwegF+SVqO9ftfhI
 wVR7eDn+2FxDs8zyT16uXvcEdIe8jdrI6MwlPUBjIMKuX+S0TKL0DInHrKVZN3Fj
 j2IpAmbarWzw3IsgCKQn/d5EAJXJ7GwVAj+iL3E1zE+axwdHMqZr9+WPFf3+nP6J
 EcFkYV/UomoZrgzPHg+UYoSiXpJOr89kHgOwp6iIgFSuzS+vPKy/71iOBJDQmfQS
 XCtgi3m+U8pgSGmsVfbz7trtJS96uNiteLw8KjllpMjUPaMntPV6nePjLbr7VZsA
 8q7c7TYzzHV0fhE34wLcCXdA4WBFD74/O2vDn7NXBd+zzz0Sw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu80m4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 15:25:38 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 15:25:38 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.55) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 15:25:37 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmB689WxLM1xxpTYqVMvzs47PnLyu/DeADmsOtmZD9A8c2QtR0T0Et0whUw7NQr/ScqZbou9PSkZC7evhdfDTvt5FqEoDU2fpYFbOpU21ziDqovonc4yy4oNQjh1vneKzmBU5uQ0TP1Yjab7zECsqLnPYom49Vu4duU7yL//RVcYTybZP6GmQUhe87NeZtHQLJdjS3Kx5JX4URhawVFbf+Xm01VngvMckIWGf6AmZvliAWpsG/OdzaCcNVp2ZQY4l6CVaEquCzyh4b5yqKl3ZYHjnrOtNdlVieb+KrYV6MZ84XatsSW9Zpwbe/9k6QWbaiRBnAJQ8anbGIDdalDUfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJF9YwzBSbKwzuwNVB9O/3JaF/reeNNDtpItKVJUM9M=;
 b=VcDHQsqWA/lWBms3qUWb0zSaQ0GJ1gni8J7kR8YO+IsgVaxu7fMi4iCaJj2qJ4sQJykMNdNqpk6rJa1axyeqNOlwv3Rc/CKH+jcJvp9XiW/+yjJEm+5VYnDDBUAp2QCMQzowskOFuAIv3n16W3NzMk/adE5Ou8D5idpPGa9YF4y138KRFP5e9cbp5Mho3YyOdLRBAJUqpNvGEMbwzD5coXZSRGGibwICw9OjA9DicZTe7KY6L8Vf6NBBBW4c+HoVo7KI0aCT9u0/igTxcGnOXaiyXXiMe3fkPNFNoph1bdF0IW8rJuJquf5lpHmtWYCHrnGK1sgM+2J0+xOHTemfBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJF9YwzBSbKwzuwNVB9O/3JaF/reeNNDtpItKVJUM9M=;
 b=Tb7fovW8cU38Ldjw1b3LcB1ledItzhsBFosP5dyJS57TnHIMr28J18KJGMXRHQbyJEyRW7DnWaMcE8rRfmvBX5M1DJwClpReucRrgBRKhH+zbAFAeO7K0MKoS+TImGif0m4BgNchyjjqMP+ww6yGuyRlgec06ZFRK7tIkS35QIE=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LOYP265MB2077.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:25:37 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:25:37 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Date: Fri, 14 Jul 2023 15:25:26 +0100
Message-Id: <20230714142526.111569-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LOYP265MB2077:EE_
X-MS-Office365-Filtering-Correlation-Id: 3622dca5-bb47-4291-4cc0-08db84763126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1YZ3kQw5xMxm1T8I8yGtOeou3PyXJdHp3Dslxte1+eNHMcS6lGeroZ5+XubopJRp7UIWGnd8yT7VqjYFW/nGPF5o0bW+kM+WyUTe+/9gloI+LsCE1omXpn7w9rkHweq4o0K1K1dTvkk7u8m8ukV3HHkJD3Yis/D9y0J1dDLjgYNI3gWEu2eRMqWmyL3VnFINVofoI6kAsi/TlwZV7L4sj0265yV7B8pZofPVdWH4aLF/+Lqz6iKCdbiX0KCyh5gYTkyedOOureY3krJrD2CYX5u85e1ivPHx4rH+gSyinfV4SOOiXi7lrdbwonKKkprsAb+81IoMUyBupBCPOrwRxH9UtLaEKRUS79eLsgWgdBsmhqBzl7zyMa1bgw72MzohSa+MVltobtwNjx31QXm/7+i6Y0d+9dDZY3LCyED94Y/PDEbpSKemKVpOKXZ+b6mFgwL6AKi8kQl1W4JqIvxUuvd6ZOteJII3f/RsdmhKAmpMpLq2vtz/PLHuqwtYHsI9FKyzlw74N0pnf/igOXwcwnzxbfnk2bTMs9Lg/PMA6nUFh4vvQ7kgh7rcYzlXlB4lMIbwfT7HpAkHOJUC76Wg870Sn/HUCzMSpsh9XTbrAZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39850400004)(451199021)(41300700001)(44832011)(66476007)(7416002)(4326008)(66946007)(66556008)(6916009)(478600001)(5660300002)(2906002)(316002)(8936002)(8676002)(6666004)(6486002)(52116002)(966005)(6512007)(86362001)(1076003)(26005)(6506007)(186003)(83380400001)(36756003)(38350700002)(2616005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P+48hmJ7FMr9tUCHqcpMY2+r/9GkvPurnsOlTmpONZuceeTvvM13UwOmeAzi?=
 =?us-ascii?Q?7R57nzSf1cLZGnwcTde2CmrwcfV03bW5sCINTyEc+qpG491ZSWJTFswTGj1K?=
 =?us-ascii?Q?irOW9e1ICCtwc4Lz05Tifshts1LPuhFo1rqG6+yzQcw/rZJM6hH8/hT1pVjU?=
 =?us-ascii?Q?bKM+cpetbKUMp1y8TRfjEp6qGzwfVg4DQKfJTKM4/WYHyJ9FLf0PVVekLgEv?=
 =?us-ascii?Q?PnC2Ot0GkdVLVhM3DnlV+GQUha1U5b1w/uPhgg48cxAKgA/SrUf9rxw2yb3t?=
 =?us-ascii?Q?C+t3cX0CVzAEQSCTjhath1otfh5NsP9GGC36UkOnis6XyWmBRDRwyte2ryg1?=
 =?us-ascii?Q?nSbAcDW5sgwXF792hjkUXhrfYaQAHuWHse1BvTWP2y3TAvbZ26css8/wC9q3?=
 =?us-ascii?Q?2IHC9j2i1g6EWbs2IkTMyhHYHXodePQMzWrSdhhB4KjLFH8lIHvYoYnmhk3e?=
 =?us-ascii?Q?JV0UgOexdQtiR9dhJSxunAoVBcOkn6KCRrBuK4zCJSefSzCt/ZPOpkHl1Vrk?=
 =?us-ascii?Q?zNqFXPD/SqkQ02hFt+s+gU4RHUVFJi3r3QBP+VEhSoOcpv4A1mV695e0cm87?=
 =?us-ascii?Q?mqFtqhH4pmS7TFeis4hUKMO+PEBim1L5GbQeCcHNe5syUk/2XZp2alK3m94Y?=
 =?us-ascii?Q?R9VEU40FsKA6nHe6VT/NNt/eQ4eBtmau8lpxMHqZBzvPEHq2nLxhKau/kaqL?=
 =?us-ascii?Q?/JOUKP+0FFYftcRA2iErY59A5nM0GclC7YadGhympBP7WSZDu0w1wFPpFqbs?=
 =?us-ascii?Q?Q8gJa8Htyrltc3tWgmUJZ2r25cZtuZ5N2HviZaPUCJcngqx80yOop4gJa4XU?=
 =?us-ascii?Q?hBGg6Sj16CMGZuXOBK26ELg9NQE+m6M3FZH7TDizGZYzwYPzzKdlXLl7cdXZ?=
 =?us-ascii?Q?kmyApdpahE0OxzFXxdOIVPfWyow67yo5V8QlS5Xeu1SozpyDiulbxMw+88wq?=
 =?us-ascii?Q?2bplv2+QawwW0hRIGeTWj0xQiQL3zIIC7BK6kJsoVoYtt/g/Q51HBxTdIT/j?=
 =?us-ascii?Q?3ez6UsAU2vB1j0wUySoOw1WGTp8otfC7z+3OeOx1x+6NU2RqqyvJhxCY5Vvs?=
 =?us-ascii?Q?zydyWZfYzrVAp2XusniELwJD9x0eTmhBILHV7yNByv1XG80/feXSXHPEAcx+?=
 =?us-ascii?Q?dPq1KJFu7kKhVBmRewmHEm6aQD4Ql1X+8suNVF+CuIlL47PqO8BWEOoew8tx?=
 =?us-ascii?Q?AobDkpppR//aSRpmVlCbXYNDukmHvJRNuYYhqTrQOimSblF9HpCDGZQ7+5K2?=
 =?us-ascii?Q?LxvM5jV7nAsofD+LutGVdhQYeFNZYlW6NUU9RZKsciSQPp6TJwRPagqYZmMF?=
 =?us-ascii?Q?uaz+/bP/BcGHRQNkcMiCdQNxPhShugckvKIZfygJQ1v9WEKshHoyCfOqmSdJ?=
 =?us-ascii?Q?ysiz8iyusj+2rKmpp0AAoGZ9RfneMsQVedr/155r6+TIp7XMwho+JSTTQIo8?=
 =?us-ascii?Q?drLQP9jhw0gLNXJenqqBjdv1TGflAOu2B71cpfCTMkXiQ+7LdZKsr70tr3dE?=
 =?us-ascii?Q?3z8jFYfD2sjW0Edt/PnzIl6j3Y9N7+Pmd4lrHZpeLcOvrwsJp/nB3vkZOgLp?=
 =?us-ascii?Q?QLG+b284SlIvDd91tPT5y1BqfcwHlumFEksF0PKGXlruyzXi3rU9x48j+LuC?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3622dca5-bb47-4291-4cc0-08db84763126
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:25:36.9943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+7xIHIMtAIxqulwcUdImp3nlR3ZTgXSgUzdGoYNJujX76cj3j6U8uhA4WaKSzVyo4RKv9qn8BkL+PMYuJqvIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2077
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: FP64EOKhokCop1KTsu6mJuCImfC3KIyE
X-Proofpoint-GUID: FP64EOKhokCop1KTsu6mJuCImfC3KIyE
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, conor+dt@kernel.org,
 tzimmermann@suse.de, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mripard@kernel.org,
 afd@ti.com, robh+dt@kernel.org, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, hns@goldelico.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the device tree binding documentation for the Series AXE GPU used in
TI AM62 SoCs.

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

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 .../devicetree/bindings/gpu/img,powervr.yaml  | 68 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
new file mode 100644
index 000000000000..3292a0440465
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2022 Imagination Technologies Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/img,powervr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination Technologies PowerVR GPU
+
+maintainers:
+  - Sarah Walker <sarah.walker@imgtec.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ti,am62-gpu
+      - const: img,powervr-seriesaxe
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
+    items:
+      - description: GPU interrupt
+
+  interrupt-names:
+    items:
+      - const: gpu
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
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu: gpu@fd00000 {
+        compatible = "ti,am62-gpu", "img,powervr-seriesaxe";
+        reg = <0x0fd00000 0x20000>;
+        power-domains = <&some_pds 187>;
+        clocks = <&k3_clks 187 0>;
+        clock-names = "core";
+        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "gpu";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9852d6bfdb95..0763388b31ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10099,6 +10099,13 @@ IMGTEC IR DECODER DRIVER
 S:	Orphan
 F:	drivers/media/rc/img-ir/
 
+IMGTEC POWERVR DRM DRIVER
+M:	Frank Binns <frank.binns@imgtec.com>
+M:	Sarah Walker <sarah.walker@imgtec.com>
+M:	Donald Robson <donald.robson@imgtec.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+
 IMON SOUNDGRAPH USB IR RECEIVER
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.41.0

