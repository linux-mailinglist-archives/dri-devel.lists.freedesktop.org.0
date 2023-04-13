Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C391A6E0BC3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 12:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA0F10E0FC;
	Thu, 13 Apr 2023 10:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 869 seconds by postgrey-1.36 at gabe;
 Thu, 13 Apr 2023 10:49:15 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589F910EABC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 10:49:15 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33D9jA3g027463; Thu, 13 Apr 2023 11:34:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=dk201812;
 bh=+8ut+LhcxC7zEeWx9Tec0AxPcwXEy4AdQOcT8C8qC5c=;
 b=F0H3miTWYQxjIsYI3rlEvvu3t3yo/CuT4rgMS9nmgXWfYQqVN7dnWOddLQYL7DA+k9Zc
 x9WLb7fyvz8jGBgmpFTiRC2N7xtfCzhWSaLkjrsq7IohxotfXQ67dG/FA6FlXVyWX3aN
 ITAlsgYOXXnHpiWKzmhD+ZDFd0CZ/nYbMNO76Qix83iAxU0zY1kYu685npSMBZkT0HQK
 sXqSDtwqT/VXE23i973wvKb6KIFlFH+B0JA3cd0sC0+Ten9ZWfCSvsakai0zHIdQkKw9
 rqPhHmb37C/ggsl7aZCRkaFBDNFoRR0NALMvWyBkTXyMyVbfiQ+iM4pWL0f9MQMWKGRY 7g== 
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3px7e58bq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 13 Apr 2023 11:34:38 +0100
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 11:34:37 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.56) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Thu, 13 Apr 2023 11:34:37 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzIsO9yV/PjerJGY49WtJs2rg9bbYayojSxjsFnJHQLxCH1YsAZaKs+u6qQD5BkxA40O0qFihF5l9XSTqEwC4QKyxqKo2rJwO2jvnFF1of8VJyzKYs3B8OZRPysd2jfVRHSaBzF+kqOAPbjWQILtm/x9+bbclMigNxpBRw09EwVsw3bdAXtKoLhouCxinBYewPfeYRda4Lap4Ue56OV4d90EbPcPaKLt1FO17kZhNa/T4IGlzElo8h+7WPiGNL88Z3Nuzv7AAhJ/jB5owyCryTSzgmjMW3VLNwXhYz0g0HQpwwKdME8+N+ehRaAjnMJdv0v08WUDCGoA3oQk8ApCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8ut+LhcxC7zEeWx9Tec0AxPcwXEy4AdQOcT8C8qC5c=;
 b=Rlpbh7CvxARM2/49TqtEzlnqreFXCDF6LVqGMOZCxmMgT4ahIqlN0QxTGyxt0c0LIhDI7D1155ERmee0iAQ73oyCMoCTJjd78mUqktb2RkaHfmRVLPac8Pmbjyx2DqxJcj9k1ZKWfszOyIpE037mu+VEVgO1x/P3a/S/TMwZYiaTBh/m8PC1vYXDg3W2j9s+l93dSbNwBERMYpq5mzxKOmGfVVQeBxHs4qRbE1I/s4OsIkkPom/DJho8EcGbUFydZu/2a42+IjwF/vMy4ZXVJGKYKrjBjUPV+9Oac5vNh8g11jWF2sxOxBB1I3yZ11W0dJ0eWrFxMLK1QFk9l0Dvag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8ut+LhcxC7zEeWx9Tec0AxPcwXEy4AdQOcT8C8qC5c=;
 b=bmXi3T07cTrIUq/7p3zvfZujhE/Ku5e2zLiEFEIE6MwEtpHxjVSxQjDCbZmS9UjjCge0wlZFWQ+aq0cXNNExbHCVw05tMhc8Rb5QqMs7aBkIHztQXmZTsYA69p1tVA+cakYZG5B51dvGwDj7HVrjFH/Q7tnRWx2JC237WAZtgAk=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO0P265MB6129.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 10:34:36 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ff6a:9fe7:c5a:7f79]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ff6a:9fe7:c5a:7f79%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 10:34:36 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 2/2] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Date: Thu, 13 Apr 2023 11:34:19 +0100
Message-Id: <20230413103419.293493-3-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230413103419.293493-1-sarah.walker@imgtec.com>
References: <20230413103419.293493-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::9) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO0P265MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1aec5d-7411-467b-bcb1-08db3c0aad6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4KwwKyEB2pqfjl2S2BtwuRBqG0m7bBH1HNLuzyhUX2KIP4GWlSHCTVUd0Q9lTOGnJZppBGDbaBmrGl0rYyk7nWubmlA7tT1Dou/yDumuuvxuyGeb645rJAeoz1z1y08BPDNZ0s2Ec8x5KdJkZH5ffRFLXXl2xve3FAouupycUL/76Puhgs1qrzGl+cE94SyN9GlvpmCxX2868K/NAoVpBFobIEkCEAT2LQrq3VyGiamRkO1HNokOzHlAq8ZhMG55/jMIALyb0gTxw6XqAztT03enIA9AuW/gO40AmGF2ZM5Zr4mUkQMcjJMqOa73g/dFe30D4tKLiijQqgLLcTHfs9U+ioxAKhkTs4/XEkLyT+gqFIN1ELkvNk367PSavQrI2YMHPUezDGKEJiOerPFeRMU86s3Mb6es5WUGbYL83Cn4zekafTRPppNOFUM9UcbobOvv8Zm0WG4o8wT9bOopr47urFFow/2FLXne3f/PD6QBHPn0UsL9qf5K0Imm0M20EXKIxujtZVlK0DIp1fakeLJz8y3CzcknEgyrPYQ97hxAGkDc6uPX1KiEJX4ciotB/iD4fGzpQemVyavluPFW7mO6QWijSeMtAhT09AsA9Cw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(39850400004)(346002)(376002)(451199021)(5660300002)(38350700002)(41300700001)(38100700002)(36756003)(2906002)(8676002)(86362001)(4326008)(6916009)(66556008)(8936002)(44832011)(66946007)(66476007)(316002)(1076003)(2616005)(83380400001)(6506007)(6512007)(26005)(186003)(478600001)(6486002)(52116002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c7gEX+yS+Mkndf1Mqb1OmsnKQ+STN2q1ZjSC2w/JFeEt7GLZ7n8MDR8v/5YC?=
 =?us-ascii?Q?iWBt+fY148skMYVS7VwMPhxS3Y/LBAHfNPLDFR8h2hKmG8khHFS5l5O/ES5w?=
 =?us-ascii?Q?hLLrsgzTuI5hwG8KNR50SGJIHI2iyzf8mS6GlOz3gkreSLY7/S4nDBcpSeFp?=
 =?us-ascii?Q?ngHPCg28EdEAyizfZOp5Bu9fP5TZesXNio0V7NcVUX4RhiStD6CUH/7/rUwR?=
 =?us-ascii?Q?wzUTI6UHMn75O7xEgBWfbdHNtq3oP4HE55ZH8Usdxlytyao053B3SSKK9+rn?=
 =?us-ascii?Q?2wSzknghbNMg9SjY7c3C0ZJQaMccdPxXMRDEn47ZJcDDoQu8As3mPcMb+3NU?=
 =?us-ascii?Q?RRJe3B8Ona5ZJV6dvzAh9HhC7QnFEpA8cBIk3EWDlXZMIxhlEdYa3FzTXQGD?=
 =?us-ascii?Q?z7YNYvas+2LLeRoZgDDFP5YSjYmExQuSIM2leHdt1dZIeXbWQMuBbZqrxO0z?=
 =?us-ascii?Q?gm2K6/GVQE5bR3BcgBNps+fz0/HfmU+itEAnuUV6akVbmhDOuY3Wh5WG01Nj?=
 =?us-ascii?Q?f3RdvRCsFXO8fXA/yk3MP1xiSw1ZJF5Y4XhHK4BL6gfTLx8OMxKtWryKjD2G?=
 =?us-ascii?Q?kUTS6EPFZbrb9rGHPf2sTiR+pjw6P62I57FVFrn67Ax2WfsV4r+wN1z/tJ8y?=
 =?us-ascii?Q?u2lgYWlLZNToCL/KkLEr8aMVOYP0MS2uyy6pZMUvmBLEJ7+s/sc5Ui5ebPfB?=
 =?us-ascii?Q?mVefeHsg632VajBIsg/ubCIZDrcPwjTPdzrp+HcmkLlGUxeD5RMW5I/UFjV9?=
 =?us-ascii?Q?IuHF8j6i5Y1OjdZwOoNDXJgz0XQMIv/b+cnGmvKr/FlmOEVL3jgi6ZWe2AfM?=
 =?us-ascii?Q?6qambFafAvtk0vyK+fG9nYA2aWIlaVhQcy5ZJJh/JqkIfXFOzqrdIt1TJaJq?=
 =?us-ascii?Q?ZXoSils48VuxbG2Y9ZKKkIKm1wkKf+UA1EFPkGc7RG7KnmtxaOKL80oW5Ze3?=
 =?us-ascii?Q?D5UE/skc7wRG9GNekMvo4Aly184R1VI8Aa2DjdOa0LU/ioK2hPV6Vs995nue?=
 =?us-ascii?Q?1NfVzpfAWj/miaDkEr7V7Zi8O4Rbh3mr+djp5DyLgHrPRRsttfp74AlOypGQ?=
 =?us-ascii?Q?wYVbxRshrsOw2L49kGQ/UoLJrUqO1c4UwTYVMLU/DDCTqaRwx+W82sZSmwra?=
 =?us-ascii?Q?2cMB4x9haz4qcO3SLG6dFzLZlXiwceZMYzdPPkK+H/98AEDJIu7TYgYypBFL?=
 =?us-ascii?Q?lJ2tP+dtnAu0TYoqA/jC+iLaaK2jUn3/JMZ1TuMInf+Z17++SKe7WP/SX4u9?=
 =?us-ascii?Q?6pTwJV2FYdZy9CqwKObb485vxkiR7eC02VwEwjDEM+VEbn9Lcv5hLJzBOKQp?=
 =?us-ascii?Q?/1XQsHIBZD0AJTFWU5k37uqp1jTJzOfalBCYnNoR9FtwPXIMtpR6vn20WFKn?=
 =?us-ascii?Q?cNjr2vynZaBxt0YX0skyNqHykx5wP8KGppZ1VfIHtDEmbdSNtc7TGlqsiFUQ?=
 =?us-ascii?Q?yhLO1AOLEitS3FoToXLR1ZpYzcf4JS7IpwQhuBsiqH5IlZPD45Y1aBDVs1L9?=
 =?us-ascii?Q?uFy1HnYOtKOfzmOX6zkel4DQ2LbiqTV3UsX2LGmgn0APV5a6iBp3C/rnpUGR?=
 =?us-ascii?Q?bTKLJVqVnCNnXW4Y4Lp1NGkJGNnihee4uyEjsTXqQWXZl7mZbS7emW6rYSx1?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1aec5d-7411-467b-bcb1-08db3c0aad6e
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:34:36.1136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcXHjI6Ghx+HrQX2QNUh9SPEvmpPtmPtUmMHTvgBtilYKHmtJ1K4QdqfnW//pP8hL1llRenrk3hbON2OV586Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6129
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: ZuFyTqplLhDROzL0aZuBsx59csp2big5
X-Proofpoint-ORIG-GUID: ZuFyTqplLhDROzL0aZuBsx59csp2big5
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
Cc: gfx-opensource@list.ti.com, airlied@linux.ie, afd@ti.com, detheridge@ti.com,
 boris.brezillon@collabora.com, rs@ti.com, donald.robson@imgtec.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 .../devicetree/bindings/gpu/img,powervr.yaml  | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
new file mode 100644
index 000000000000..f722fd1d4e8f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+# Copyright (c) 2022 Imagination Technologies Ltd.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpu/img-powervr.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Imagination Technologies PowerVR GPU
+
+maintainers:
+  - Sarah Walker <sarah.walker@imgtec.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8173-gpu
+          - const: img,powervr-series6xt
+      - items:
+          - enum:
+              - ti,am62-gpu
+          - const: img,powervr-seriesaxe
+
+  reg:
+    minItems: 1
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core_clk
+      - const: mem_clk
+      - const: sys_clk
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
+  operating-points-v2: true
+  power-supply: true
+
+  "#cooling-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-gpu
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: img,powervr-series6xt
+    then:
+      properties:
+        clocks:
+          minItems: 3
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@13000000 {
+        compatible = "mediatek,mt8173-gpu", "img,powervr-series6xt";
+        reg = <0 0x13000000 0 0xffff>, <0 0x13fff000 0 0x1000>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MFG>;
+        power-supply = <&da9211_vgpu_reg>;
+        operating-points-v2 = <&gpu_opp_table>;
+        clocks = <&gpu_ckgen 0>,
+                 <&gpu_ckgen 1>,
+                 <&gpu_ckgen 2>;
+        clock-names = "core_clk",
+                      "mem_clk",
+                      "sys_clk";
+        interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-names = "gpu";
+    };
+
-- 
2.40.0

