Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B812D5563
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6626EA54;
	Thu, 10 Dec 2020 08:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60070.outbound.protection.outlook.com [40.107.6.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D086E3DF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 05:36:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B79Izg3tJCkb8pe7wqhR6VdxTb9VcfxTpLHixw3f5sVD/Sp64rhiWJT9tROteJQ9nMBFiVXpgtjFLKNIddc7jxaiDb1OAV95v89i6L00MOQHI0FnhW9krZ0Gf37pCqzxd8Vj080VJABaVaESvAkcYKNKVoSHkMpIiXSCSo0FOb/GcRGIQguNePFLsQGoQ3Bwoph4+/KfyogHKudAIe4hSJ3Oh0bgQfhuML0+g19jbTVuq4QvwW3/JtH0cc522qlwGxZam0Qq4cAmL8Fkq7lJ3asBBqc26K3GFz7szZc99lFtouejSn05utKLedDIjiL4T6HFGu3AQx3Eqx20cuD+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNbQZEvhrYMNuVQjUxJaFuXT2Tg2xlrr39Eb+oqViAw=;
 b=aqRl2i7Q+eL/zzIQTTvVIthGv9LiKcFjsV3Q60hhwmXP9qWjaDsGlmz0j0D399A+lgpOkDp9UL9iNUadTCBdmFFmybSfdoL3CiTzmlNTOmC6TwSeAWOuypsB2UFfRzuFUzNa79EfrrIBJxwDMx3PVThFvttoPzDk5m9HT01mCW2ksUROxdvVinBU1f+wu8Un8FUt7zVj2lNb9zWwVCUUyFWr753r/DaU3+rFbcNQs0U6S/+HxToVKY+/5P5XZoglKnPWvteuSM5NvEUYANqUtGqt9s62LN0vMbAiVo8HGqZg/dTaUYt3HNQWCkr8HMYdXlGUJR4aRFlQL178ye/rXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNbQZEvhrYMNuVQjUxJaFuXT2Tg2xlrr39Eb+oqViAw=;
 b=qcDVM5XrdNW+XO+5rLVw2NJEITppZp8YnXTxJ+S2rSTYEIKFqiYvT8VwkvllsL+NCtNKbzq+S7QLe0wfxHKLe1pXfffnz22PetoUKflqrTdvNz1SvfYQIVKo++4hAYArLiwk+RjFE+z33j7I1h2RUNw1ko0Nzhuy0N3GtoiuWYU=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 05:36:12 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 05:36:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Thu, 10 Dec 2020 13:27:27 +0800
Message-Id: <1607578052-4316-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607578052-4316-1-git-send-email-victor.liu@nxp.com>
References: <1607578052-4316-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 05:36:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b297bdb4-2f16-4db5-3ebb-08d89ccd8138
X-MS-TrafficTypeDiagnostic: VI1PR04MB7117:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7117800BD858ACCA8C1D27CB98CB0@VI1PR04MB7117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fbwHK5UF0o3QAqPYOP6Gdkn/XMSF1Fhes4ilJHtO/uRKtbrxIDJFBUusjsaS0jvIb3V/d6c0eCChiJt19kCMm8pPQiMkPvIfkSYsaZnrqD2WEebQ+7qRVeWX3YekeSFCl4zGgv1lOUrgOOp+WKpEikwiy5c4kc5+4aYNAACYa5+I68njRlG9rYeNIZPlrPHtZnjj7i9LjpBRsyXPI0l0J4z1J/namKE1wmiCUsOkA5vpLhlX0pLA/KjT0gD+vA8R+5Yp4Q57/Q/QvB+whv4+47Oh4HOUgbovp4EApwnAV0wgDkk4OfOe22NBM10z7dB5sfnkIHzcLXVOThwfg0Kuk2IlPCY+08jGqSDXAbueoZZ5hJNey/uc5t7o7MbmoH3kAKMq38uffgvaIY81QGVRoyidLDoQ6Rpi9w5PZ75ppJCZe+9CurEmOEMVXVs21broXhxsHLe8gTWdd3GDcq/Z/B/EnR+i0h/aUIvp5smTwA5nxDhDLor4NXB1/KSBztZb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(4326008)(6512007)(6486002)(66476007)(8936002)(5660300002)(34490700003)(86362001)(16526019)(66946007)(2906002)(966005)(2616005)(6666004)(52116002)(36756003)(7416002)(186003)(66556008)(956004)(83380400001)(6506007)(8676002)(69590400008)(508600001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?m0dNCjdXbMz+5cFBr8CUFod1p3OWnI8SLGztKUSXR1CB576HVGsrgdaPN7as?=
 =?us-ascii?Q?ra7nKHMkus8GyodsGRq3h2V7v+i5rhOd3qIDHxDWq6A4EVf8wSl5dVq3vS7U?=
 =?us-ascii?Q?nROOmJWyxigy9gIL4MPPgxvshf7JtNoS89gpokzcLmapK7A+KFvprYjK9I1l?=
 =?us-ascii?Q?2vO6TBE64cJpdWcuv0ISwdBjgnRMV6DrhFD1xmnXTn9pmcx3FTao/mdr8gbe?=
 =?us-ascii?Q?34A7c9H9+u8KsKzNVt+RPl/OEkoC4dsWvGfv27Yu/VeVXqegFmjLDMV+Lk3Q?=
 =?us-ascii?Q?q+lpn2sFtZ/b0vtWQl8TccFb516yawTPEevb2jhzePW7EE2cEgT5UHAtB+7g?=
 =?us-ascii?Q?272T7VmD06ZA5TGawuSVBcCWtwKdWSw7VleHsD3guckh2QHpnpzg7QBDcA/G?=
 =?us-ascii?Q?UKiGi++mB7xqBiy0yCR5McNYDHtDyD1xYOxBaI32Io0pz/ocwXSRmjd5i1mj?=
 =?us-ascii?Q?t+YggI4MZiJp+6mPo/RIAJVLGnFsT2TKXB0WXkjcNm6dsHw824EIwTMqcLzJ?=
 =?us-ascii?Q?NlVB9ydNeOeDF4XeIPt55cv1/V4+GyLJU5bZ0n2m1JYWFxhZccYLkI06iTIu?=
 =?us-ascii?Q?vWp/mnPr7FFm+txomDDe/ASaopUwN6TTVha9cdXYkX+vEf2cw63mt2+U84TA?=
 =?us-ascii?Q?3N+xwSkP8DuVGve8g2J3Z+/+zvExAWhTdydsE156Z5PCcagBwXDAeEv5oIzv?=
 =?us-ascii?Q?f+deI9+MWrp7JdqD6it5pqwwbxIjw9d4Y0Y2zi4A4MBSyf/WJIbhFtKYOUa9?=
 =?us-ascii?Q?o3KEMHzvjmMEkehvyMmDMRCp86dONf9+0XH5+OHGlXYM7C/gDzdJwnQrHOr0?=
 =?us-ascii?Q?ez0YglUcPiPZSebgayiEnDAei+NBppIf6cA33rQz/dRZnd1o6pTfEDFp0Iy6?=
 =?us-ascii?Q?1bOBFUDxRe7z2S0/4uIJySmnYcKekM6LSUlJ5VzRPvzO8ejOUvHKQLWE7pv2?=
 =?us-ascii?Q?TnzjJs3e3uzG8LD31oT0sykQGrqG84z76mcvtTDo5eLvKTxeeMBkacpHpZCB?=
 =?us-ascii?Q?XOMC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 05:36:11.8333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: b297bdb4-2f16-4db5-3ebb-08d89ccd8138
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7O2TNxWQffXlED6y4YPtVlggBL1PTF416Qgq61v/8di+oZdZGYbx7wnbzlneDzrWuk226sBRPSL66eavQLxlRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:39 +0000
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

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this depends on the 'two cell binding' clock patch set which has
already landed in Shawn's i.MX clk/imx git branch.  Otherwise, imx8-lpcg.h
won't be found.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 00000000..3ff46e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-prg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Gasket
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Prefetch Resolve Gasket (PRG) is a gasket interface between
+  RTRAM controller and Display Controller.  The main function is to convert
+  the AXI interface to the RTRAM interface, which includes re-mapping the
+  ARADDR to a RTRAM address.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-prg
+      - fsl,imx8qm-prg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: rtram clock
+      - description: apb clock
+
+  clock-names:
+    items:
+      - const: rtram
+      - const: apb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    prg@56040000 {
+        compatible = "fsl,imx8qxp-prg";
+        reg = <0x56040000 0x10000>;
+        clocks = <&dc0_prg0_lpcg IMX_LPCG_CLK_0>,
+                 <&dc0_prg0_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "rtram", "apb";
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
