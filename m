Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5522D0C3D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF4E6E570;
	Mon,  7 Dec 2020 08:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20071.outbound.protection.outlook.com [40.107.2.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B8D89E86
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 03:29:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1LyQa+FLsv4nD/Z496EeRFNddN868yBUTjP+Xu3m9xTE7JsR4iE7BbOER63osXhGsYF8nYsHQFjx5AY7s+OIAgyskQtzqjWu9d+eUIHFUMPWk8QVklowiIkeaFhaobEnXiV4b8RqgaqLky6HoNguHHuKE1pZ1ITHXvIjlZeIJOjQWP7ctAnxlzaiSNUAhFPywB9VmHIXoWJAE/qdU9mudpGJwEPwCstzsCzwK54Yf5HP2bkDTOlXtrf3PMaMMsa4/W11bSQcwaSuMcfbK2J9IG6dtOIwVb67M4Facyo7ogwgU8JinL6p1gkmyLZ6bDQTYEYf+YwruxCbm3KwHrkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU3073wibMZf/rMKa3eFXnqH9uMCJtnmrb0w/GEorlQ=;
 b=jlCaJnaa3wlBxK7aEfRfl89EInV8MyRMVz4OGGyAV9kSHrnl7eNzJn+rEW8gHI9x/J7VpGBiJA7PfuigW+ny/QNuIITJ2AvJJtmaHczGjC1lflnLwWUPSrEoThsz15c9EG/UdpSvcs/8WkhxhMT7oGPxKw0+XYgISaYvQR+3tTNq6/uFdPX29aVB7mjPQXOxSBZu+fcG4ofRfWlfdBzeerp0qxhVmP/gMY2sbuj6fOIdKOXjyuJSlhehaAOW5W1eUas8c4WVJPh2lx8NfDc0GW+w5UdBFHq6UNNnAREWftmtZvfYRlinp+z9Yn0mBdQj/nleZSwCTLy3UBj1FuDfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU3073wibMZf/rMKa3eFXnqH9uMCJtnmrb0w/GEorlQ=;
 b=pnsSZ4JH+KgWBOnvr0RQIn9bz7e91xVWGK60MGH3PtvVF9WP9MDyhC4uRMAOCpCId8zgpBQ088jrt7IfByqCBhqY7ZHOyNEoqAIrEHQDl38KnIrs+0U/nCYkYXuPjTVepUXVZJHSrJ2NwYabCPOlcs7HbLyiSXKJkJy0ygd2jpI=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3424.eurprd04.prod.outlook.com (2603:10a6:803:e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 03:29:21 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.038; Mon, 7 Dec 2020
 03:29:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel
 binding
Date: Mon,  7 Dec 2020 11:20:57 +0800
Message-Id: <1607311260-13983-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
References: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0085.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::11) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0085.apcprd01.prod.exchangelabs.com (2603:1096:3:15::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.18 via Frontend
 Transport; Mon, 7 Dec 2020 03:29:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 214e8848-2015-4cea-e4ba-08d89a60497a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3424:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3424AE77896A979AC8A62EB898CE0@VI1PR0402MB3424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFRFu1OJfN4zMft8Bug+H9u2XERxKeTdJgq0Y7c5qrR/K8Orn3AoF0v5f71xyf7zl7RUFH8vCQiUTaayq3usi9cW5OP4uRQhGneUGL7gXsXF6mOYxBtioPzbJ+cWbb08KYK1u4DWGdEnxwEjYl7oJttSk+S/4AUIBSQuO8tMbsZ80IVN3NTbenT6asev0ccOkiV71EzLkHoaSG7IWi6rwInSzesngL4VMuZ4WBgaJrDyKVoXxIWLURJZxK7ifc1ZtIHRpZw5luquLpNWqLUn+ol+K7FYl9eJ+7JrMeB/44xMQQxd4Kap04j2y9rFtNdCArkzdiu2DoQDVSWclOxwJ90lLTFZqg/ks5+oXCzbtvOyfU1tpRz2YQZCHKNiK/iiXH2j3psZh6oR00uCSh2ypYemr6gD7yyibsLKKwb7vAMk9YBi+gDGkStn/B7p0kTveFNpj1jdkwJj5EVozUbeqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(26005)(4326008)(966005)(8676002)(7416002)(5660300002)(83380400001)(316002)(6666004)(8936002)(52116002)(6506007)(478600001)(186003)(6512007)(69590400008)(66556008)(66476007)(2906002)(36756003)(86362001)(956004)(6486002)(2616005)(16526019)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7BIb9Jed+xVwNYGiz039ryg7E7eF1N1oK9F0OYrSAJZ+9aa9K5s29Ia+ApBh?=
 =?us-ascii?Q?MuL0sfPOBS4sS6OzS2wAmXf6TA3AohJbcwHcpAQEEEqtLoM8rJPVbSI/ovIN?=
 =?us-ascii?Q?pPeo54qadyb4My3VnzNoc06xt9V00+jKLrjXjyMJLpt3EiB9wv2zj1ypY/yO?=
 =?us-ascii?Q?8Y017lEobGU4GdK69sK4JK8ZBTKrpu9EHFvqQvo72ySbTBFCjIVJN2UEfXSx?=
 =?us-ascii?Q?Q/Tl3jwYaYCnCnJgaWmJ+Q7T8neqWT1vTVLsl0JYtXV9x7yb5YDjiwdIo0y2?=
 =?us-ascii?Q?+wAhDag7HbSgTo3gKYWFlNHhVCFcD8A1jLfcazNxuz7iquDfrrrsVIr3blw1?=
 =?us-ascii?Q?i64ShAcLCBXrxd1eW2NyBhI6ap5zLFSfa1swStsvAPjY3x74U/+DyHSPi6LC?=
 =?us-ascii?Q?VYNh5a2X6WmjDOcbWiiKGSqdGeImiA6B2jWTljkyTdKrCmfFkRgXbCjW3mAa?=
 =?us-ascii?Q?Zmgu/TtmAKgT5hcO6fPsHZRLbRak/TmIKs6hgJSo1Z8eGZBV6nT+WIMpGfrf?=
 =?us-ascii?Q?fPNFncqGMp/pVzPmM9E5loXDa5SO5nvw8RPAK21bWnGr+pmmOrx7anbUhR7X?=
 =?us-ascii?Q?xCC8yWUbvURH2MTrbFK/CZwSgSxhXLeUPKlH3M56G7/uEbyC0m8iikm1VyRf?=
 =?us-ascii?Q?x9giqAYAqxn5sQA+ERWzkZgV+eh05433CoYPZ5ZcjduXcPFowyNRN93vFu9l?=
 =?us-ascii?Q?bstiRY/daDuawTSO6gDOnfWexT6+dhosZ62tHPB4yy58zwAiL5gbWsvgrvTe?=
 =?us-ascii?Q?6HGFFara9jsUSI6G1vShcF5X+lK+2mXF0KisH7WtHJY45W63750rXcUbBY9e?=
 =?us-ascii?Q?Uto7LHag2yN8Z6qM5Rc5vEk9shNJsjbwW4WNK1WaJpY4auxEUGUcgvNFQDZF?=
 =?us-ascii?Q?0CLWA7CTwkhw+M75/+Da9//b7sXsq3Hl8daJwcXkT6AP9wzNk1ceV9JIreY4?=
 =?us-ascii?Q?Pwfgit8wIVLjtDjAzHWFxcrbCHqwKOvPNpQv7diAxXmSUdoLWHbOMmpWI8Zy?=
 =?us-ascii?Q?WABB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214e8848-2015-4cea-e4ba-08d89a60497a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 03:29:21.5172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7H58fBB1QBMHqUve0q9BkwICw3bc7MCkEI9zADwxXXaVb0+N5QtM3+9Iwl8ycls4d8YRaaHI6CJq7/Z/tyjrsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3424
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
 laurentiu.palcu@oss.nxp.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this depends on the 'two cell binding' clock patch set which has
already landed in Shawn's i.MX clk/imx git branch.  Otherwise, imx8-lpcg.h
won't be found.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 00000000..91e9472
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
+    oneOf:
+      - const: fsl,imx8qxp-dpr-channel
+      - const: fsl,imx8qm-dpr-channel
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
