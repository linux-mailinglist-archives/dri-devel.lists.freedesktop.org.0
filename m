Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224F8600A6C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 11:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC45F10ED09;
	Mon, 17 Oct 2022 09:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EA410ED27
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 09:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AERiTldM/v9kOw67R197lyOJIShP/zrIYw1hKq1n0qXudyAkohUj2ulkQTxpAuiFVObZ2JHdOApShlUtkfTwf65KJuCuYD2AWVhZpEVSv1k2vR+aReHIpOA9kGlsgnG1+C3YMKDJ097JXhMc3YP4HfOvKPzQj/Dlkue2T9AxdY9hDPtx6lp2sy4Y//N+0k4uIjQUxExV1Wz4NvvWi+lwTy/cTEqinunxBCXRNCYNpaodn3VGCuagrW2W327Iuox3J5WnieQxB9CHr/HKmfZ00YqXG0FdNFIAlbWmNhPav9JdyjYO8nyCwMgdyaJPa4jAqRTSS1QGhv9D9l5MM6u9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjbse1ZUUGauO2OD0tJ2rdHrwimlSyCjIlKTEUeb0zQ=;
 b=L8cIuwJbQeYx1Y/VrVvB+T8Kifyz7IFSNuenKj7hsAzxLRc418u0ZIwwjgW8Feu499mNCzCMwj0saOnWeeFJG3eqkpUAiHCvSDCpOf622iW02uS2fTguGVhX4ByYPR4GBfdTmb3R35CLQjCTaS4TzmAF+3VAmg/d8cdpEBBVb8CHYIM71FgTh0kl30d/IOxdyjVTfN2qQqi7V+asagVSDMQVh6aSBf88C4cwxYiGKZNlPXnDIAZvuZizJ/9Jpgn6njcKTJ6dKuxFbXikRzdUN6O0yiG1h1MG9Tr/9EcDoyg0F79sqPWHO9v8Lc2lw9OtXuJNgfwXTIOJ0IesJrdhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjbse1ZUUGauO2OD0tJ2rdHrwimlSyCjIlKTEUeb0zQ=;
 b=khIaactcQk4FfDW+DiRRG4Z590FqCXhyl5ZSaYpaDTjgVIfGiEE25xR0WtNgIbn0aTxPgJyT1UV12l8YtJRkRzsz9J2dcE9mQMtQFPTuH3SOyzCb0Vwxm8CWLKps75D2DlVGXrzR9qMAqy+HW5A2u07hQ7ek+eSjzRpDhWrpYiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:22:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 09:22:06 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v12 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Date: Mon, 17 Oct 2022 17:23:05 +0800
Message-Id: <20221017092308.249665-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221017092308.249665-1-victor.liu@nxp.com>
References: <20221017092308.249665-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 6055c069-ff77-45ec-0cb8-08dab0210f23
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8F/QQxJQRuqx6crtpIEzjLgo3aFXHJ6GKBevUVJ0Taqv51Pk7+mPDbqaWCIbunFCYfaVUtVRPbrGo5NlWqN41FpdngZVyUvvvKns1vcn76Vu43APkpCK2lfSYtpVoN3sGBx/tW4wOIRM/wMyp9u0IW8lshfcsGoplgmVw0BY3SkDlgA2JnI8rwz8suWGvD8Q3TI+sxNjpL6DvuXcnPMl99P4OHvPZdqXd2F+6tG5EOWX/6SND4nH8jPbR0j/lyfmFgromPOznDJcIc5skb6dv5QzYUhRmvgQFaBUkS9jbplK3wIrCx37e6dIlODbakjhYb5lpbcp5e+0o041Xo/3Y9CycUczDoUfYQyQocMHImc1VYaRMZLDeZ+9LTEXLT6kF0zXBFedzKWEz1JkCVERuUrZLGcp6GJrze6Z1xYj4Pz9Xlc2IL8wXFyicMlO+3PC6aqXRshxmGHVxDttmKI43r94lTMeRiLkGAMkALNLzSfRAztJZ6NvDqhlUqp1FuIE2NU4+2He0y6hmMJEX/V2zrLn4JisBBoB5BwqFkYuDC3xW4QtVGKlkMUae5PFOIBOLR4grYy/c0s8C1ALDckI5QGxYeRY0CZvvOIcCOs1nYqHwomtSFHtol3IoCw6NmtJ4Zl1xbt0znN+DG4+9181keOFqzzwT+fyJKpSEtGgpIXETIQwp8fQ3iy68HAd+aU0qTFKQYFkLdIisbCYfQpC0EpKLHZAhoj59H9GTK6boqglXPh5Re4cItDzuG0XlCrdOH6AJGkbXzFdwuCfNB1khOcxNbracwdH+tdZlNAhZZSWOCfuDr3oLdOyX/ci8AO9aSqUZt+DoV8tpIbeptRHBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(36756003)(38100700002)(38350700002)(8936002)(5660300002)(83380400001)(86362001)(26005)(6512007)(186003)(1076003)(2616005)(66946007)(7416002)(966005)(478600001)(6486002)(316002)(66556008)(66476007)(41300700001)(8676002)(4326008)(52116002)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uG05iq1U+c5XnrsIdK9GMcQ1PEcH5ZBdli0lH7pWedM652mX3UIn6BUl6m3a?=
 =?us-ascii?Q?mtQYzhJyPBkhc4cIio2jhDVIsnw7PVD8e/dB4At+FU2xYrZfJ0otdwlyA43K?=
 =?us-ascii?Q?/iLsiqggG3hpx4dOEXkb4yNw/xzSutqauYIOZ/L0KwJBzeHn0BgZK5vNc5ef?=
 =?us-ascii?Q?44plErNrx/+lRzIR+WjkE1oIo3+BGU2RjXUDJNw0EVNr8GORn80wZ5CleAXW?=
 =?us-ascii?Q?QPN6i/AwmgE/6AO3jVSrKk2dvMSxuZ4jQitll6OJ8BjxTIbyf8d9LdeV448M?=
 =?us-ascii?Q?AIf8+IdMp95n1hpLhgYRf2qp6+M8F0UwaovacY6sMX8N05feyf0HieYOYXMY?=
 =?us-ascii?Q?FnYeP+Bv7pDqcqciH3+uMbmnO+H88JkfPGJXIauyLmA5JErooYDH5JwdsVSE?=
 =?us-ascii?Q?js0ZZU1LqKr6mno5PrW8cYIwAGnizUsv+9TtKH/vmQW5BS0Dk2HKAhdjoqte?=
 =?us-ascii?Q?Pe2GPsH9KkshviIMyM81BLl4nilF0NrmtZctB+x8nMLbpOq0My/8G8Uv9Fc9?=
 =?us-ascii?Q?XUzvc/ef7Jj5bh7q9xgGNHiNZWFhuyA5Ez+BpNukkh61AmKG9F+5ev/x65w2?=
 =?us-ascii?Q?J3UIy0YIR845zhlBvz+MHKztcTOwYSn2il4toa+8Wlw3hg18mqF3mOpFGcx8?=
 =?us-ascii?Q?PnhgTW5X92uJYmWQ2dJi4zdCvyR1zZJzQtaQ/0z0x3hjSumvmfa42JGDdvhP?=
 =?us-ascii?Q?zaBSgNHtUIDuVKHbciQVqhc/5Ly0fyDD30O81UZ1/RhISVDLzknT8+lNKDkd?=
 =?us-ascii?Q?iXWecvZk22pGUnzcFc2kFB+Z/5Vmq/Ki/b/WDpR+NWr+hdpzeVo08AyA2V71?=
 =?us-ascii?Q?upe5uJGyQiIJwLJ4o8JQyMZ4M4ttLlIkm+tkBccfwlr/CpXa7nfSqMTbbfp+?=
 =?us-ascii?Q?9snPHWjdc2GF0dy306zFe75z2eIQ6Oe1mVLm2YzaFRyeuD/bMRyJ5IYBPoSy?=
 =?us-ascii?Q?oqp2Xi/CU3BokqPj6xZZmgzqLwu7eFdYuRRM5GpzVzp/kSaMo9L2rlUCyXq+?=
 =?us-ascii?Q?XmKgW4QzEe6pDAaqazF/vfXfpzLHjImzgCeAYuBbiV10eVQkxhWXTWemgiCG?=
 =?us-ascii?Q?KXxWbgAOAzlcPMXF0i+OEeyYobrf2ro+9W/XfMNo8LYk49Iu5nZ75yVX6mKo?=
 =?us-ascii?Q?M60GZMgfssbBKErckmMJK0SBOBzQydC/M1mMdkdZc7m/wt44G1/1fDyxcvYf?=
 =?us-ascii?Q?DAWeWHu0QR1AIZPO3HlWvcBsP66Z+uWt8wN1yFzXqLlMPc3T0dLh9Lec6BIB?=
 =?us-ascii?Q?vyDaaQo5f0V3HEXIf4iyw0zvvUHIf0Y/Cjei10yz7NI/HFsHOzwFiQWFrP7Q?=
 =?us-ascii?Q?MDXibEzhIfWuOGOsl+0gAu5N/+5evjhJlj1VpwtEa9vgYvxsxW5zCJ03iXPz?=
 =?us-ascii?Q?1YOqBh/c2wfhcvMTaHPb6hXFhUrsMP9hdsqIrzk0CpQ1SzQfRbDbHqgGbE83?=
 =?us-ascii?Q?ijeWXhkiuNcEadcIFEgnFRM9xwyavnjsCc7VPKETdw15b67Y3gM4KtzUa3Tk?=
 =?us-ascii?Q?AWWTCNMBwrgGDuMhONBI0kW+0vB5+esF91mfGyOu6Jjo+mRACWUeKQvzJ11z?=
 =?us-ascii?Q?5RGEpFWBmgkEDjHE9kNfDW8da8KZp72yWeRibeN2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6055c069-ff77-45ec-0cb8-08dab0210f23
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:22:06.3692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krO0IA2c6wOweNq2BqFGMMWsTo7M5Ue0WgqSLVorHQnuiP9yawbGkPhUAVwedxDxaI3bSU0I+2JbdbSuKLXPeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188
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
Cc: tzimmermann@suse.de, marcel.ziswiler@toradex.com, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v10->v12:
* No change.

v9->v10:
* Add Rob's R-b tag.

v8->v9:
* Reference 'interrupts-extended' schema instead of 'interrupts' to require
  an additional interrupt(r_rtram_stall) because the reference manual does
  mention it, though the driver doesn't get/use it for now.
  Reference 'interrupt-names' schema to define the two interrupt names -
  'dpr_wrap' and 'r_rtram_stall'.
* Drop Rob's R-b tag, as review is needed.

v4->v8:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../display/imx/fsl,imx8qxp-dprc.yaml         | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 000000000000..bd94254c1288
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
@@ -0,0 +1,100 @@
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
+  interrupts-extended:
+    items:
+      - description: DPR wrap interrupt
+      - description: |
+          'r_rtram_stall' interrupt which indicates relevant i.MX8qm/qxp
+          Prefetch Resolve Gasket(PRG) or PRGs are forcing an underflow
+          condition in the RTRAM.
+
+  interrupt-names:
+    items:
+      - const: dpr_wrap
+      - const: r_rtram_stall
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
+      List of phandle which points to PRG or PRGs associated with
+      this DPRC instance.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
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
+        interrupts-extended = <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+                              <&dc0_irqsteer 324>;
+        interrupt-names = "dpr_wrap", "r_rtram_stall";
+        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
+                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "apb", "b", "rtram";
+        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.37.1

