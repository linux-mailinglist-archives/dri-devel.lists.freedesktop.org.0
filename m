Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295F1A9205D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 16:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB08910EB40;
	Thu, 17 Apr 2025 14:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="m3IyPNV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D54110EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 14:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQuJvKZ9a5E0hffIOheAMTi/OXx06k6/Y674cXfRBnYE2ZfRxzWGDUeQHUXqKBCGkPlL0ngFk2m/9dnuvhBpqK67L2Q2YWoDfX/TsN4EpU5ES174xKQKD+tJK+oaszpGhrvHlVQkobi2ZSvyZWWotGQCQD6TUDDiWhpKXdCVe7FsXqxvSz5RGpyOIH4uxE/1LZ7wjqW5nKExOrRif7waxza58fP5gbVlREQruIMKZIS76IOMYwhSvRSCwY5/4kkIbNVeJGRmfMhFT3ETy0B07eiR9ThbKlQ75k7+BqeZICxBzq+U2rHZOWXEtQIgrqDPLhOGzjRvS1P9EHffjU8igQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q84IkEPMpqSOBlm5UmYmQLhggw7ll6HBtAnErTlTk2c=;
 b=MlJeEQojxZJVBIlHp7sO7Rc8lU5Yfw7nJ3+aoZdPYkIXn4/T9j0Cx6oo8Ve6XY55mxGNYfNQmCHBNfMvBI2XrO+w1g4AbrmvcLuSRjbqwzjugWajtth1oHywK6h0b7y62hemf6XoRPx271dlRWz6GJt87yhNWDrIyZUFnOpZvuEEzs3M9FA8ualBK2Vl4Vjy3XRfec1EkWYGZszYm6SvywYMvz9SgzWj6Xtr7px6FSLZqxxza7inCzZltHjnvUxKDf14wgYsrmkkN6+sLgb/6Lfi4vkBA3lzZ246VeAkfhcX1hcGfQC/OsKbu/G1V6/kqDEa7LfLrT0E9rq7WdzTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q84IkEPMpqSOBlm5UmYmQLhggw7ll6HBtAnErTlTk2c=;
 b=m3IyPNV5T+5SRjiA9LL+pqVsF1B3FlgzWmyFMEjQz8M0m7wB0yYv+xl/uppfANYm1cAGWHTlxaViP678x9tW5m0sHcbVX+pIywGPXKWG7jzw5g3mK5FVJoH4QYbZ0s7Dx+BaokJNI6JlwjeSsuflqjYPOvw3ZnKMjRro5jQVqwbfLtsProrM88fxqwHa05A1MIoNwkD3P/5ToMzVALPk5iSxlBvjcaEWn5y/mdMSBrq4IF/EGUVpuEpWtzl2RoWf4OP7gba/YdofOSVm5AfrvHUDgihVdlFZkRTCUaBe2onOaBN/OWbYQvcMXFeUmAmwW2fHyDPL91cXL8YZaZM70A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10603.eurprd04.prod.outlook.com (2603:10a6:102:484::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Thu, 17 Apr
 2025 14:58:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 14:58:01 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR FREESCALE IMX 5/6), 
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: display: imx: convert ldb.txt to yaml
 format
Date: Thu, 17 Apr 2025 10:57:41 -0400
Message-Id: <20250417145742.3568572-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:510:23d::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10603:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee0f721-77e4-4c2b-476b-08dd7dc03f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aXKL57rnm/9j+DEULveSwslXJzr0a6y6qHAhDXJfIB9VUU5ZIo92IbWCrxrq?=
 =?us-ascii?Q?Yc1azda/P6VHXXLZFao0WSxyKLqSsLzeGp3DiNcatgsS9emO36I5pwyCL1bD?=
 =?us-ascii?Q?98IooiV6L3Q6piFcsQfUmbMiQnvPhZX2rv/iuWA753utmmEvosGqsNklKi/J?=
 =?us-ascii?Q?6QNshPVpjoRtI/nURxGmbtQTb2lSgyNzSpGQEV5Zal6fBBg6acMkqCvrODGU?=
 =?us-ascii?Q?TUqH9E43yq7+h4PtRTQB1avOK0+Lb08HTvdmYR5Wn/+iJmYxCd3kSYqWS+Ul?=
 =?us-ascii?Q?ZgcYippQFVeXqpnpSncZE7mcc6ujrrSv6WWDg0ROvx7Ks9soYtyOj5rFCzkt?=
 =?us-ascii?Q?WuaGARmk9GrHN1eoJUVHQZ9yoAhPgbT5jEVyrcB39GXFc0WaxzN5wEHvM8JQ?=
 =?us-ascii?Q?KG2jLtsKC3iQDmw7lA9rocClUestYgrOeEz67zLfmeHzPyeTnJmeIDy4oksb?=
 =?us-ascii?Q?Wx9Ebm5FBm4+qdQKW0gvjAaD2/w9XapZE66QQPONiHVgSI0ZNW4oQpTXRFw2?=
 =?us-ascii?Q?OQsao2ZUFmQCsez0dbvLxNB4oMIXM4JuftfpKC/WGhWX9fz1TMXomW8tEMJJ?=
 =?us-ascii?Q?Q97PR/JU4zIcjr8hrfF1iJ8Dxf9f5rst2nTj+pvG1/niNk7nvCzH7PpcSYyO?=
 =?us-ascii?Q?LvyxrF2OK3FMyvvtda8FPEudYqK/JOueaDTRG99ExNUzI3wEgPQ/dKzmgN0C?=
 =?us-ascii?Q?x819Hu1eHh7tou6C52Q2jjXdX8KD3Q/rw+RazLCqt9xnvYKGNMwrBty08fPo?=
 =?us-ascii?Q?DpdlBJywzzVS3qLy+XMcSyTtSm5F4Drld4hixgBnSfUHquCRKHyImEgfznBF?=
 =?us-ascii?Q?njlSL/Ef4J5u2rKz9jq0+UXA5GVhW+LR5GhRMeGVqKzL1HbVtLgfK+/tMgxu?=
 =?us-ascii?Q?buhrm+A9B6Aww9QiZMaB014OPq+a+RArGHgtwr9tEgMnG8S7MUJ7VP0oeG7Z?=
 =?us-ascii?Q?AO/UrUZOwLoSycl6fjBLSeBwsWrx1JRF4yyvpvaQvBCYk2eMu8NQFBjK3/cL?=
 =?us-ascii?Q?NcEhjJcQiLHrHlmZ+AvdNsnfMuXPhuq61jHupomI5zVBTgQLt0R0+Y1EISwW?=
 =?us-ascii?Q?O4+M7LVp0sZjH+9xOdDONX+jBq6t8CpV04jGQ/YNfLfm7JD3kcloyd+veTtI?=
 =?us-ascii?Q?ObibH9ApK7ZR99c+QhsYexgSD9QcJ6z8+WVeciSVJecsCyjA/POBeZ6rj+6U?=
 =?us-ascii?Q?Zsb4i/lfmfrRndUPGBia/6gmm996P9E5l+J4Yu9d57t7z+S/0v3tqvKGavnv?=
 =?us-ascii?Q?SEJ5J0MhC8H5dcC4VnMnYMAlEAvHE0ouajpqRNgLcHf+zQ85CSjO/lLrpvqe?=
 =?us-ascii?Q?/4ZXRIJC7JeHHfOMwnTecNC/gcJCO0L1a2ttKNyxKowYCcL38tKctQIgflak?=
 =?us-ascii?Q?bgu0HCqr1whm1NCjJUVpKxqNAZTuklzvxU8lV8xFFzk7GV2kWO78f1o7D86T?=
 =?us-ascii?Q?LTHVajm2bCY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k8gAkKZVSIYit0d7P2TLw+ps5+wImqiGVggPuJ74DVjmVOXptuKYU4cq2yBI?=
 =?us-ascii?Q?k+XPdWS2R/OPZK2HdduMhy1ukhv1Wx0ptmkayr+KVizSUcJx5UGSevgwZyQK?=
 =?us-ascii?Q?14anDpSB6lglWpofAhiQAs9H4CHqV/IwJXsLr4M1/r/P4AGFVKO6tDm087jA?=
 =?us-ascii?Q?scaKg0q2JWI9aFsS0/iH9fVakV4UgCKsRviW43vDgroXgtPTyn05RRpSYyt6?=
 =?us-ascii?Q?QthGWenVgZ3rnOaQCri1u9dN9dv6s7FL1ZMXhi76pveWOgsEuz4MLafdtLOR?=
 =?us-ascii?Q?aHwFn594qTjglg3lI+22uT0OreKyrPxRgS7NJskfTA9KRsY6CnyvEWpwRDzE?=
 =?us-ascii?Q?obkn7xKmiw1XpQ19Fk5rfaNnqFWiiLYIy6Aq7UqMasUlLOdHaDIooapBDBSm?=
 =?us-ascii?Q?eIK5gYv9VwZAnPPDFaZBdOWd4oek9yv1ktH57tSLmjzisjNfiBoWQz8gNX4b?=
 =?us-ascii?Q?2mhqeo7Z0q8782EBOijto+N8gCeSPrFvTvRBeXOHMkHsHUdqw06w/J5v8SfV?=
 =?us-ascii?Q?spAX8BLk5XAsW7jHrYmIhWQ058U6ePT3+IVzWjb4XVEANgSKd3nsgW776zss?=
 =?us-ascii?Q?MnuFObv3FoCaMGJROjyAeFl2q7YnJy9G2xb7Pk3KFx4VY3zyixTIkndhiPIL?=
 =?us-ascii?Q?mHEirxzfeRw2BlSBgoNyq5ZtMYGu9pyrNJg+3OmjtvEcLSKoJYkBJpQ88Dmr?=
 =?us-ascii?Q?M+jO0fmxEYUJ/d+j6SdWCwi3Tx19uHi/D6Ll+yVGXxTBAom9QmoGImwnWSKd?=
 =?us-ascii?Q?ycqgsbrNXJlmf8qc0D5aeyLaSEexyvW1TzVsM4GuCH/jCZ9ZSHree4D9eOsE?=
 =?us-ascii?Q?ce/bbqpTGH0d/9/f88RV6LA+WBFXYlUFarkq4xw7GlBzihNcoXNRIcAbS5rN?=
 =?us-ascii?Q?SrXn/ulCCx6NXzuWjIob4EeR0YPH+/WXwkipwSCA88CVcj/Gq85YP40OZIqL?=
 =?us-ascii?Q?ZfK5juKrQrMw/E7JxX8cmmYCt7zyGJcHjwHp9Ktboe8sFIChmJ1o5MNzkbIo?=
 =?us-ascii?Q?FU94PMUnzrNX7iyTFw7NJ3FkVtTZ2kEx872Jd6VADMhhEB+Uo2WY28OGa1ki?=
 =?us-ascii?Q?FAFonjKt5L6ZHqmq78MIDhOIiUq+/5gskyD1/O/U+TYpirKpvF66myO36hve?=
 =?us-ascii?Q?h4pDZ/+b8lGl+ZQk7+Gi7hp5wFdlLHy+nlOjdOYoosQ2WNxkM080icFYWRrd?=
 =?us-ascii?Q?j3FiI9bw1BB4uhScow34uc0kzp2GedlSuGdSOncGaCDZuDzrd7npcEyRIj8B?=
 =?us-ascii?Q?5Uzo6Oe9q5BhlRwmMXv0YRH7tZVx936VQy3HxnMWlLMHR0G539QgUkkDBGX2?=
 =?us-ascii?Q?2eRcH+M/vx8xgEJHvaB2KJDEwsJ3IFGVN/1Uhm2shbIPi8evX2izBaYHpyMm?=
 =?us-ascii?Q?Q3nf6NSv15mKf2sReAeDE7KSsldnmYtuRwPz32ZrYf+I2BhfZbuS7S3pFTLc?=
 =?us-ascii?Q?OxiNVfMQXnFNWQMLKDFhanZWIUCZkBm1yTBDw+dxob/jjAPLX54/ZdUOks+5?=
 =?us-ascii?Q?S/Yu7CiYSRpQ7wnUusgtCFOzJHju811v9Lj0lvwmgYELMehx9l5EhL7JBPvG?=
 =?us-ascii?Q?NwGjJ7rm6fsHblqp8YE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee0f721-77e4-4c2b-476b-08dd7dc03f85
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:58:01.3742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XM2Bg6L8svV2ZYZXugM4lHfoOUufrmfQVAvBbVAJcdmpdby855s6mG2pu0OJn5NDbCl0Oy6fZuuLjnd3VpQLWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10603
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

Convert ldb.txt to yaml format.

Additional changes
- fix clock-names order to match existed dts file.
- remove lvds-panel and iomuxc-gpr node in examples.
- fsl,imx6q-ldb fail back to fsl,imx53-ldb.
- add fsl,panel property to match existed dts.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- use oneof in clock-names. imx6dl use imx6q-ldb comaptible string, but
the clock-names is the same as imx53. To reduce dts impact, use oneof to
allow two group clock-names list
- fix typo pannel
---
 .../bindings/display/imx/fsl,imx6q-ldb.yaml   | 194 ++++++++++++++++++
 .../devicetree/bindings/display/imx/ldb.txt   | 146 -------------
 2 files changed, 194 insertions(+), 146 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/imx/ldb.txt

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
new file mode 100644
index 0000000000000..0f0a229956b78
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
@@ -0,0 +1,194 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx6q-ldb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale LVDS Display Bridge (ldb)
+
+description:
+  The LVDS Display Bridge device tree node contains up to two lvds-channel
+  nodes describing each of the two LVDS encoder channels of the bridge.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx53-ldb
+      - items:
+          - enum:
+              - fsl,imx6q-ldb
+          - const: fsl,imx53-ldb
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  gpr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle points to the iomuxc-gpr region containing the LVDS
+      control register.
+
+  clocks:
+    minItems: 6
+    maxItems: 8
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: di0_pll
+          - const: di1_pll
+          - const: di0_sel
+          - const: di1_sel
+          - const: di0
+          - const: di1
+      - items:
+          - const: di0_pll
+          - const: di1_pll
+          - const: di0_sel
+          - const: di1_sel
+          - const: di2_sel
+          - const: di3_sel
+          - const: di0
+          - const: di1
+
+  fsl,dual-channel:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      if it exists, only LVDS channel 0 should
+      be configured - one input will be distributed on both outputs in dual
+      channel mode
+
+patternProperties:
+  '^lvds-channel@[0-1]$':
+    type: object
+    description:
+      Each LVDS Channel has to contain either an of graph link to a panel device node
+      or a display-timings node that describes the video timings for the connected
+      LVDS display as well as the fsl,data-mapping and fsl,data-width properties.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      display-timings:
+        $ref: /schemas/display/panel/display-timings.yaml#
+
+      fsl,data-mapping:
+        enum:
+          - spwg
+          - jeida
+
+      fsl,data-width:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: should be <18> or <24>
+        enum:
+          - 18
+          - 24
+
+      fsl,panel:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: phandle to lcd panel
+
+    patternProperties:
+      '^port@[0-4]$':
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          On i.MX5, the internal two-input-multiplexer is used. Due to hardware
+          limitations, only one input port (port@[0,1]) can be used for each channel
+          (lvds-channel@[0,1], respectively).
+          On i.MX6, there should be four input ports (port@[0-3]) that correspond
+          to the four LVDS multiplexer inputs.
+          A single output port (port@2 on i.MX5, port@4 on i.MX6) must be connected
+          to a panel input port. Optionally, the output port can be left out if
+          display-timings are used instead.
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - gpr
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx5-clock.h>
+
+    ldb@53fa8008 {
+        compatible = "fsl,imx53-ldb";
+        reg = <0x53fa8008 0x4>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpr = <&gpr>;
+        clocks = <&clks IMX5_CLK_LDB_DI0_SEL>,
+                 <&clks IMX5_CLK_LDB_DI1_SEL>,
+                 <&clks IMX5_CLK_IPU_DI0_SEL>,
+                 <&clks IMX5_CLK_IPU_DI1_SEL>,
+                 <&clks IMX5_CLK_LDB_DI0_GATE>,
+                 <&clks IMX5_CLK_LDB_DI1_GATE>;
+        clock-names = "di0_pll", "di1_pll",
+                      "di0_sel", "di1_sel",
+                      "di0", "di1";
+
+        /* Using an of-graph endpoint link to connect the panel */
+        lvds-channel@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&ipu_di0_lvds0>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+               };
+        };
+
+        /* Using display-timings and fsl,data-mapping/width instead */
+        lvds-channel@1 {
+                reg = <1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                fsl,data-mapping = "spwg";
+                fsl,data-width = <24>;
+
+                display-timings {/* ... */
+                };
+
+                port@1 {
+                     reg = <1>;
+
+                     endpoint {
+                         remote-endpoint = <&ipu_di1_lvds1>;
+                     };
+                };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/ldb.txt b/Documentation/devicetree/bindings/display/imx/ldb.txt
deleted file mode 100644
index 03653a291b549..0000000000000
--- a/Documentation/devicetree/bindings/display/imx/ldb.txt
+++ /dev/null
@@ -1,146 +0,0 @@
-Device-Tree bindings for LVDS Display Bridge (ldb)
-
-LVDS Display Bridge
-===================
-
-The LVDS Display Bridge device tree node contains up to two lvds-channel
-nodes describing each of the two LVDS encoder channels of the bridge.
-
-Required properties:
- - #address-cells : should be <1>
- - #size-cells : should be <0>
- - compatible : should be "fsl,imx53-ldb" or "fsl,imx6q-ldb".
-                Both LDB versions are similar, but i.MX6 has an additional
-                multiplexer in the front to select any of the four IPU display
-                interfaces as input for each LVDS channel.
- - gpr : should be <&gpr> on i.MX53 and i.MX6q.
-         The phandle points to the iomuxc-gpr region containing the LVDS
-         control register.
-- clocks, clock-names : phandles to the LDB divider and selector clocks and to
-                        the display interface selector clocks, as described in
-                        Documentation/devicetree/bindings/clock/clock-bindings.txt
-        The following clocks are expected on i.MX53:
-                "di0_pll" - LDB LVDS channel 0 mux
-                "di1_pll" - LDB LVDS channel 1 mux
-                "di0" - LDB LVDS channel 0 gate
-                "di1" - LDB LVDS channel 1 gate
-                "di0_sel" - IPU1 DI0 mux
-                "di1_sel" - IPU1 DI1 mux
-        On i.MX6q the following additional clocks are needed:
-                "di2_sel" - IPU2 DI0 mux
-                "di3_sel" - IPU2 DI1 mux
-        The needed clock numbers for each are documented in
-        Documentation/devicetree/bindings/clock/imx5-clock.yaml, and in
-        Documentation/devicetree/bindings/clock/imx6q-clock.yaml.
-
-Optional properties:
- - pinctrl-names : should be "default" on i.MX53, not used on i.MX6q
- - pinctrl-0 : a phandle pointing to LVDS pin settings on i.MX53,
-               not used on i.MX6q
- - fsl,dual-channel : boolean. if it exists, only LVDS channel 0 should
-   be configured - one input will be distributed on both outputs in dual
-   channel mode
-
-LVDS Channel
-============
-
-Each LVDS Channel has to contain either an of graph link to a panel device node
-or a display-timings node that describes the video timings for the connected
-LVDS display as well as the fsl,data-mapping and fsl,data-width properties.
-
-Required properties:
- - reg : should be <0> or <1>
- - port: Input and output port nodes with endpoint definitions as defined in
-   Documentation/devicetree/bindings/graph.txt.
-   On i.MX5, the internal two-input-multiplexer is used. Due to hardware
-   limitations, only one input port (port@[0,1]) can be used for each channel
-   (lvds-channel@[0,1], respectively).
-   On i.MX6, there should be four input ports (port@[0-3]) that correspond
-   to the four LVDS multiplexer inputs.
-   A single output port (port@2 on i.MX5, port@4 on i.MX6) must be connected
-   to a panel input port. Optionally, the output port can be left out if
-   display-timings are used instead.
-
-Optional properties (required if display-timings are used):
- - display-timings : A node that describes the display timings as defined in
-   Documentation/devicetree/bindings/display/panel/display-timing.txt.
- - fsl,data-mapping : should be "spwg" or "jeida"
-                      This describes how the color bits are laid out in the
-                      serialized LVDS signal.
- - fsl,data-width : should be <18> or <24>
-
-example:
-
-gpr: iomuxc-gpr@53fa8000 {
-	/* ... */
-};
-
-ldb: ldb@53fa8008 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "fsl,imx53-ldb";
-	gpr = <&gpr>;
-	clocks = <&clks IMX5_CLK_LDB_DI0_SEL>,
-		 <&clks IMX5_CLK_LDB_DI1_SEL>,
-		 <&clks IMX5_CLK_IPU_DI0_SEL>,
-		 <&clks IMX5_CLK_IPU_DI1_SEL>,
-		 <&clks IMX5_CLK_LDB_DI0_GATE>,
-		 <&clks IMX5_CLK_LDB_DI1_GATE>;
-	clock-names = "di0_pll", "di1_pll",
-		      "di0_sel", "di1_sel",
-		      "di0", "di1";
-
-	/* Using an of-graph endpoint link to connect the panel */
-	lvds-channel@0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			lvds0_in: endpoint {
-				remote-endpoint = <&ipu_di0_lvds0>;
-			};
-		};
-
-		port@2 {
-			reg = <2>;
-
-			lvds0_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
-
-	/* Using display-timings and fsl,data-mapping/width instead */
-	lvds-channel@1 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <1>;
-		fsl,data-mapping = "spwg";
-		fsl,data-width = <24>;
-
-		display-timings {
-			/* ... */
-		};
-
-		port@1 {
-			reg = <1>;
-
-			lvds1_in: endpoint {
-				remote-endpoint = <&ipu_di1_lvds1>;
-			};
-		};
-	};
-};
-
-panel: lvds-panel {
-	/* ... */
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&lvds0_out>;
-		};
-	};
-};
-- 
2.34.1

