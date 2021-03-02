Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA1632967F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 07:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486CD6E8EF;
	Tue,  2 Mar 2021 06:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00052.outbound.protection.outlook.com [40.107.0.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA226E8EF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 06:46:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQkUDKKwF1s/BJ5KrYnPKNQsHoXkqASwW14rOB3nQ6UMWmJGVMjim+TG7+5nEDHrYY/9zyEpjA5jSe0NzKM5cIj3vERdgofEYENekHy1hXSnfG8POSZ03WUcprJ/0AWPY/9oudrODZrPDHMawyy0AKePChqcyVwKt2wx5MTE+4XmOjowfHRSilAIpIRkWlgT7azTIYRm01q4H5HdK5jUVLnkLsQvrcMdiYI18C8aQyEqp04874SubU80BMtXPfICxdg1XZHBANBnLBdqJ/IhZLVho4cZSNdBHk/knTWSUCZ5HgzCaKtgob1pW8fRE4E+pMA0+Se/XsJ5sDMVFzm9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lh9rqLx5vGmpHboakKTQD0I67xxhIXeYH/+a7UiuuIk=;
 b=KWSK6plh1FjeCmXTJUQ3g1R1rKwfHDa8MtkmIf0AeH9EdUTrfk/oclSnbYNpMEto1J65wsfkaDlyy3s2L/i5dCbaAZL47pR8CMad97D0HcL5APyT+IHtN/puQpOkgeW5mCdkuAqmi4dXfenf2YJXc1XfpA8JLqr/eLVqiPVXxps5t/NlVIiXyix8Akxy1MCscE0I8zvCy7JE9Cko265gpecFMxzdLH706o8RHVJWhji50uHgp2VmcIb1YSD+TTxETEbGUTOG9XFnlrw9CGWgg46R/EXYqNrPKAXI4OShGHBXj/AVF6zX0sdbjlwk+7tieoiD+qK0wPEpJU9PkLn3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lh9rqLx5vGmpHboakKTQD0I67xxhIXeYH/+a7UiuuIk=;
 b=pf8kHTiPp6+pm5XDHZxzIFJ/hNlw08X4nK8eTE/gvvwiLmJ6S+bfckbC8HzbRgW8yf0LEXvCU61z5llQr4NZe44h8f9ylISAmAxjiKhVuV2KIp2IKj6JQH92qzDJ/C5XfpN4IwMNczhm+NT7tso1YftFxGhgUHpafpuGNR8bO0c=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 2 Mar
 2021 06:46:20 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 06:46:20 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel
 binding
Date: Tue,  2 Mar 2021 14:33:13 +0800
Message-Id: <1614666796-19374-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614666796-19374-1-git-send-email-victor.liu@nxp.com>
References: <1614666796-19374-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0191.apcprd02.prod.outlook.com
 (2603:1096:201:21::27) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0191.apcprd02.prod.outlook.com (2603:1096:201:21::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3890.28 via Frontend Transport; Tue, 2 Mar 2021 06:46:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c57bfe9a-54b3-48a4-bc30-08d8dd46e2fa
X-MS-TrafficTypeDiagnostic: VI1PR04MB6816:
X-MS-Exchange-MinimumUrlDomainAge: devicetree.org#4161
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6816D3DD793045D9F96F6AFC98999@VI1PR04MB6816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9lBijeG3NR1rXj3Hj/5PxcAn8BSVw/ToMSpj1NYTdt7XR6IWYeF2luvR8XbSYZ+jJqUGeDgNPgtiBfyyphObPF7ALHo6BQ3NufNqKbVKZRv0oIUhRX1msxz62odXruM54/I3o3tg+owHT1D5w1yu2fwOMn48Jc1x7P+Yyg4Tgsrold49p2EHERuZ7bwXKya8PU03FjGM4cKSbZ/NVokSymbGMn4v4RK71eL54mg7tsuLBKCvYvqI2ldi94AWNmZKdxJJYQkJjogr4Im+Y+H32Of5QmImcJmqNv5/8eej274DbPy2qZ7mmBzCa8tJ4tjXX8nTHrXmPPLL+AJYOdzlP4LpcKe5a7dZq3RxK21HDynn3SRTokMW7V3KunRLWkZ4qVwugV3kOh19kQbGtOUaTNtLOUozCKXMPnXdW7JCfkVMe0YibrZw2NygH7t9TrBc6NRGCekLTEPM1SUuPiIYLa3O3FhYqTd8e82drDklIS8yzc9JtImpjnhiIL3ozcLhA6WNzqTyGQDOgtRHfpQnRASwVglYLISkxwHJpHfXSO1day8x8nvCaUpa45yvz2MGwR6j1G9TwavPmGA+KLfSoPBuCfY9W5re/skBf4Y1DNzQs7XgBDR5bZEgz5/0MVRf6Jx1M7k2laApjsRLJu5oCwGWZRxRYnRpM4PYuCu9/o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(956004)(69590400012)(66476007)(16526019)(52116002)(83380400001)(186003)(6486002)(966005)(2616005)(66946007)(7416002)(26005)(66556008)(86362001)(36756003)(8676002)(6506007)(6512007)(478600001)(4326008)(2906002)(316002)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6QU7AzlSDGZ8/gGBOhK11NToiava+bKixLgTzI78i7TgF45ss9ACtxRpYQc1?=
 =?us-ascii?Q?BO5OZIpW5hvliQHs/acXZqfVFTpYE3aTxulGnth4S1pF2eAN00GR2OWgyYuo?=
 =?us-ascii?Q?Xj0adawILiNLhuN3s8og4b1qb9FdMdkzb54JiX4phpNbqrAOqI/XCEP269wN?=
 =?us-ascii?Q?/65sKJd5QZ/Zi1bMj+tfyDKRtJWKahGIwpPJgugfyPL2s1rbXU0FugZFDUdl?=
 =?us-ascii?Q?d6F2tx3X/7+uTVmAkJCHk23RqTaj9W07uHeoQNn4XmTGCbBGdnRdByGwDDW5?=
 =?us-ascii?Q?YVipQAn16OGvAqoQpgAcvqu7eQKMKxs7tsNX3yr5IXpCQ5hGbFiMdvF97Is7?=
 =?us-ascii?Q?TXDAeuhkW3wji+jQ1HVjNOs74ta9DhGTmCyWdY7nFDnVdB30UQUM7ZfPEFJS?=
 =?us-ascii?Q?zlKrhArhmi2qjLRWHKb0PqJhfi6YBaPvpr0pC1/kvRNFsQ/6ckJ50/+DvTug?=
 =?us-ascii?Q?BKrMwxxXMk5dY8RlaYC2cY9ibSHvPhfDc9vFVGz5iV6f0R4Meuh02qyGdGq8?=
 =?us-ascii?Q?ZnVl9WYbvPgopdNCVrKbeY4PwXFfd0irw9Zjab3gm2OfXP77Ds4M7tvQpmHg?=
 =?us-ascii?Q?TRULn0EUmKgs5hytcW3LVXlLICcdGRV3bKQQXPXwB+RkAjZYmFDD6d3gDX3O?=
 =?us-ascii?Q?OLP01GdQVWQQvVbIxsBmCij2JGXGta3ncmFVyEEXdhTII6uLfX1zPWzpUe7e?=
 =?us-ascii?Q?HsSfiekOhGvVZSmlkyqFzfek1cCc0rPJoojTX7Oyu8xmGUx3gNRp9wsEfCsD?=
 =?us-ascii?Q?rBl4aChRlw9pDIsP5izq1NeBBsgMaGGmimHqbCtdLrdUULkzuUOIuVl/wKvN?=
 =?us-ascii?Q?VcME9teN3jg+YCMp+4sx1NzV73Kd1rX2vaigoj+CKzKD9ZUe5cRpSR/R9Siz?=
 =?us-ascii?Q?O8j1krdceMSLSAnIOxTG2tqvTluCqrGCUlLlvJ9mSOd/4y8D7HWJxg8qmPmp?=
 =?us-ascii?Q?C2UKwk5AT502F2OUWVAOavTA2/GW1qYC4vUiUDag6mPEUkVVs2M56jaiXk+L?=
 =?us-ascii?Q?73hngA3nGDYYvORDVO9Ani7g/bjfrNhRlkGShMVDmNsD4UGiwoCVN6ws3Lgs?=
 =?us-ascii?Q?DdLGchjpoT8JhgzVWR/kAQzfGkcxKan47Z1KXs+VAWqjFoInCNwPKZlEiyld?=
 =?us-ascii?Q?kweICmKMEgvty6jHwZXK3M05wbqG9loMMbJSbjVS4twgMlt0aDS2/3lJSpLc?=
 =?us-ascii?Q?4T9CgfPS2cR21mItc1KvpHr2hC+EXTcmGqk2oCB7F8nlNCEx4mDBbaeQWE/Y?=
 =?us-ascii?Q?93zQoHfHymKYyuCVFPXuF66gBHtU560/xRaZNoCLW6Oae8p/MTdiQbG46XQx?=
 =?us-ascii?Q?mVkHBXM83LyM7LDl1SGAo2B7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57bfe9a-54b3-48a4-bc30-08d8dd46e2fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 06:46:20.0466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhItDH5MIevbYVEqu8XjthvFkBKTV4uYsaikefNKNJ+YtVVz0ldwoRYi+pUJnaxYc+LT2hIc6OIunicBQjN5mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 00000000..9e05c83
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dprc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Channel
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Display Prefetch Resolve Channel(DPRC) is an engine which
+  fetches display data before the display pipeline needs the data to drive
+  pixels in the active display region.  This data is transformed, or resolved,
+  from a variety of tiled buffer formats into linear format, if needed.
+  The DPR works with a double bank memory structure.  This memory structure is
+  implemented in the Resolve Tile Memory(RTRAM) and the banks are referred to
+  as A and B.  Each bank is either 4 or 8 lines high depending on the source
+  frame buffer format.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dpr-channel
+      - fsl,imx8qm-dpr-channel
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: apb clock
+      - description: b clock
+      - description: rtram clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: b
+      - const: rtram
+
+  fsl,sc-resource:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The SCU resource ID associated with this DPRC instance.
+
+  fsl,prgs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to Prefetch Resolve Gaskets(PRGs)
+      associated with this DPRC instance.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - fsl,sc-resource
+  - fsl,prgs
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dpr-channel@56100000 {
+        compatible = "fsl,imx8qxp-dpr-channel";
+        reg = <0x56100000 0x10000>;
+        interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
+                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "apb", "b", "rtram";
+        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
