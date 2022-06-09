Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A70E54441B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75004113DB8;
	Thu,  9 Jun 2022 06:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140052.outbound.protection.outlook.com [40.107.14.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2DE113DBD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7u6jc+SyvTzEildZTw5vxVtxLcG9P0TGb5ZmNc9bRxpGxC+vpvzbxCZfRelgcK3Xww2ZxgQlAnWagxDgWP937fcvBNJ5PL5Ur1em0rByvhCQF695DgzMkxVoXzmR6jbU8X7Fhl0oEDbCb5E5MrlDnP/3NcicX+Eef2yLTJgwD40uYjlpPo2RgxlwqRPLeXumq19UIhYCLxvStKQMrFmMo6fQad8/j+0FNRxx5eJMouCWoKgMFxpWeJTuLtRqroJ5j25rB+IP51vxEix/Z1erB2+sYaJVWzdcatX480ctC9fXVPKf/AwqM7t+Zo+74IG7k2yzpF+Puxfzrl1pLWFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9lZxfh7Kx0EClppGsByNGol639KodSHlmwoFOq+kpw=;
 b=fRQrzlggZBndQnaG43ibWgQjvXVPnvwhZmkFEDJkVjlwe33+Gbf3zcKapep40XX+6t2q//6y/AU7yg0USSj0cyYBI12MgAYJzVssVfbUGd1Iz+0HLYgvvS0A65PJM1aVcOXRnxaI5+baGohGovkctygvtu33qcChlSW+Lx/ESXSOvaZLN0Nr0WEF13qGdT0Pa/B8HhnQYoQLihX1lo4S7kKtzlwiuxNd7S+SnG+KkjvEMdAYCgfHMSajQQCoAu6sENpsw9Q8DX8szzqEID86Wy/UmYXcjT1K774tMdjrAKQxu6/9yuYoBlZ6OO5D9B8RkAvDMwnrqdkNUx5s0qf7pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9lZxfh7Kx0EClppGsByNGol639KodSHlmwoFOq+kpw=;
 b=II1YW59mdg3f4XuWi6oo3Zy+JbmRNU1Lrx9bP0VDOCN4st0naeLFpzLawABBocmxtWhDKGqn5ju7UmJyxcusWxqnhhaT7WfX5ewQ5FsbYkZExHSD/lGJxnySGYXZdmgYIneKGm+TGbb06cO3WHnq4Ng4q+bls/mLc9M2LVWc6uU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR0402MB3518.eurprd04.prod.outlook.com (2603:10a6:803:4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:49:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:49:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 10/14] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS
 display bridge binding
Date: Thu,  9 Jun 2022 14:49:27 +0800
Message-Id: <20220609064931.3068601-11-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a797404f-8f91-4c21-0451-08da49e42918
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3518:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3518EBAE254444FA97C46E9C98A79@VI1PR0402MB3518.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4EzefD39V7XI+iGRACbf4yQpfLjXvK67Lt3GBBdp6MFkWiIV9Gd8NSaMvV1Ccc1BMzPum/zDkIMfo+wlXftZNSUGHEnomhmzdWf9MsgbMF3voMyIuhqdavqEIweUxTw12tMgvxSDv0hWyYMc0jqj9+rJggpW3ofB4OIrAWqfP19kU932wRktxBtmjC9kB0NqIlAIzbzSvaQgO/H+uBt4Ljb9HyQgWS7uO2Dt2A8g/9+ColMMeEZT7NAlmvfvJ/hlcGHVDuR9uF2t92EHRpW5qTOMj+fmu3y3XMRyDohob3xm2xbgQj7AWqUq1V2XXQFEN52Jr8o3W4BhCpSC/ViRP30h/8+CfThZwVuaT+h4AaAQJ6CkCye66A4qniieaELI5nWEczMP+ajwieHEGyMqkEgSw1ZU98f1vFSPIyl40g1TxfpeQ6R2CTlkiOPpjom5LC9WHPKZpXqSyibEItVWQ94iuDpVCPFDWCwCc1wd23tgaybITALRRuySThRlnHmTVtgOeU0/c8kv76pvLkZmGlvKeYnW4L2CQ72byAqWZWHH7ldqk0HhYGnULCZmdO29EWN3aW5xX0numeo2MPRirwA/Ry73nRrnFhlGMANuZlNC8ha+ObvZevi584Ibcz/+0KGrCUw7APxIxU1HRyeoIHUL/+ZwRZjw33taTWqBC81QYMRLEf60KpxplwEFvV4azpYxygSCxv6XfrS8n99hIpGe+PuAbPwZ3bX2FUtH3v//qSsX3kaB9rVXC2ouf5vLXhA5x8Asb+8H9PvkkZPJZ2KGlbqoijAALwGnGUFLuhpexGDEaNX5ZQKBzljcVtbxoYPEg3D6N7+JE2hhPVWNkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(2616005)(38350700002)(186003)(26005)(38100700002)(6512007)(6486002)(83380400001)(36756003)(316002)(1076003)(7416002)(66946007)(8676002)(8936002)(66556008)(52116002)(6506007)(66476007)(4326008)(86362001)(5660300002)(508600001)(6666004)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y8hR9tgXc7R551putStP4uFygGTgKbsVlPZy6j2b08/cvQOWq1sh9jtsZyAF?=
 =?us-ascii?Q?cCTJttr9sUzksUTLGFqoMZEPYYjFaUfzOSc8ovxKG4k5Fvp61rfKdciET1WB?=
 =?us-ascii?Q?ZEQoYOwuk/Jv++C6vWPZppuYL+85XMiSJxXs9pOhcMJ4EyBr7P1b3JGBNJB+?=
 =?us-ascii?Q?YDhcv0SiDy/OYnOSfGsYqTpdBgN/wnXvouiX6FnpmuK2ut01g6bGdnMNYstm?=
 =?us-ascii?Q?zR/PCvUvO7PXMehq8nPFgQxWpG+8GJ6LR8UgsCatLi2BBOqRfuYneyQEpS76?=
 =?us-ascii?Q?VZAdUHjaIV5rTVUwowlArgilSP0wHdVpVF6ccBxXg7uPxfPpmuJu/DdkjIbM?=
 =?us-ascii?Q?nJlgZVwMIs8NG0uRyzR1sODcAW3RqrS1iVoGj76Bzrb/kgHi7cOsH8b34PiV?=
 =?us-ascii?Q?xebo9ywG2uA6463SavFZxWPPhWzS/mWIvYxfSnLmnmqBodOuzaGLVglM6Nr7?=
 =?us-ascii?Q?fjODOnCzowRmUoWB84hWe5vwmy5vZhfDFcm5pWrbLHRq6Vc0hPwc1R77uRgW?=
 =?us-ascii?Q?5BpG/rJZIKdMruW3vjGVAJuOWGAdqK6grQ2VT05gfeq1Wv4/OQQsRIlxIzKZ?=
 =?us-ascii?Q?FlsO6calNaQgpszM1FmVPJgE2Yk3k+Hl6MicUIu/eSUPGzAU42ByW7/U64Ka?=
 =?us-ascii?Q?ZTE7HG+B0AGvmsSRqwdwu42Z9RGr98eS0x/NlRlg6vZVl4k0+rqc8alfR8Yv?=
 =?us-ascii?Q?FB1ysJFS80pqegxs9sr28IeLybKso5a/l3dCq0j3X5k2CXtBTikGFRYrAfqr?=
 =?us-ascii?Q?A/SIynRQ1j81mu7O65olYJNeUgQCQOOx9VizdTJRkOB6srffEarK4RLtqyUR?=
 =?us-ascii?Q?ZEPu+e+nz7b0fuqoL7LQJORTNKDi1fBFygV4XF3SYKphL2sJf7qOsswEXDAV?=
 =?us-ascii?Q?k4M8pYNqxIFXTP8MH3BKiv5s2OkJjaxpwqjL/U9iW1zFW6lshmlRurU7iLCS?=
 =?us-ascii?Q?oe/iqaU4Tje9BrXGvpSLIBYTrFGZpF3A1YPhQe4IUw4rbZA10jO2NJ3SleU+?=
 =?us-ascii?Q?WznsOykfZDUSeXH6uiumKltlh5VgYUXfRRxvYg9ZtjhQVeVx3+5+6NnOfJcf?=
 =?us-ascii?Q?2CkXvOP7ay2rwHtk2MF6EqSP6G/du4SN0fDsFd8tMSeEAZ9j5DzGEKP0aboX?=
 =?us-ascii?Q?1hGKjYXk+rPICNW/ANJ1X1ChY7a+0KUrVvFETiRPt0HpQ1F6G+Ql1ir1xETf?=
 =?us-ascii?Q?XSd3299WpbZ5qDReG4LqE/nzc2ycDORWVaSXZidjmyhRqy9zFLWTZa908WIe?=
 =?us-ascii?Q?eogNIivbHoe6GFg8ohChQatBxnAURnD/vZr7O6FfJ3AKfQzDz9ApYXoeaqWC?=
 =?us-ascii?Q?xWZstPiPY/JQkoSkmw9oml1CBfVfM/kbuqNouJApKQhOlj/4+td02nKbH/Kl?=
 =?us-ascii?Q?YPQucB8uDmceKel7ScK7u8FaxvO1CZwhvaIDvVRsKD5h0fbSXx/r1uHdW818?=
 =?us-ascii?Q?Gpgf704rKN77xi6OQEHSdhv88Ufctgs1JDtDwxQgq4ww1q0iubQc4Q2oHtqs?=
 =?us-ascii?Q?Jp9LzeGsj3hQFEnZhsiOtUhB7i3OLlkWp57ATAiSbzn0xrxTO/qbFJfHs6RD?=
 =?us-ascii?Q?zIX/qOQG19NLZKn1iuAYMItGZeKZGNFC94Epld4s914NzS0BTjpTpcsYfGYa?=
 =?us-ascii?Q?+y/UCWwPF8RMUZyUCx75o/C7z2fzijKQ3JG/aw4soA/5mXb2U4A4HYThh7/z?=
 =?us-ascii?Q?S+OKWaKL1oXCXGuQxm/xS1p43EBqsgSirqrNaaYTBV+Jx6R7PgdiDQprTtDU?=
 =?us-ascii?Q?jPABbvkn+Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a797404f-8f91-4c21-0451-08da49e42918
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:49:11.9344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7K8KQ6RIbTExrW+ohMOV+oNn131Fl+zcA28hO9NsACAeXZptVkFoFse9xsXUOPXzpAKx7NYgqtfkW5CmY2SBcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3518
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).

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
* Add Rob's R-b tag.

v2->v3:
* Drop 'fsl,syscon' property. (Rob)
* Mention the CSR module controls LDB.

v1->v2:
* Use graph schema. (Laurent)
* Side note i.MX8qxp LDB official name 'pixel mapper'. (Laurent)

 .../display/bridge/fsl,imx8qxp-ldb.yaml       | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
new file mode 100644
index 000000000000..94543006f5de
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-ldb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp LVDS Display Bridge
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qm/qxp LVDS Display Bridge(LDB) has two channels.
+
+  The i.MX8qm/qxp LDB is controlled by Control and Status Registers(CSR) module.
+  The CSR module, as a system controller, contains the LDB's configuration
+  registers.
+
+  For i.MX8qxp LDB, each channel supports up to 24bpp parallel input color
+  format and can map the input to VESA or JEIDA standards.  The two channels
+  cannot be used simultaneously, that is to say, the user should pick one of
+  them to use.  Two LDB channels from two LDB instances can work together in
+  LDB split mode to support a dual link LVDS display.  The channel indexes
+  have to be different.  Channel0 outputs odd pixels and channel1 outputs
+  even pixels.
+
+  For i.MX8qm LDB, each channel additionally supports up to 30bpp parallel
+  input color format.  The two channels can be used simultaneously, either
+  in dual mode or split mode.  In dual mode, the two channels output identical
+  data.  In split mode, channel0 outputs odd pixels and channel1 outputs even
+  pixels.
+
+  A side note is that i.MX8qm/qxp LDB is officially called pixel mapper in
+  the SoC reference manuals.  The pixel mapper uses logic of LDBs embedded in
+  i.MX6qdl/sx SoCs, i.e., it is essentially based on them.  To keep the naming
+  consistency, this binding calls it LDB.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-ldb
+      - fsl,imx8qxp-ldb
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: pixel clock
+      - description: bypass clock
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: bypass
+
+  power-domains:
+    maxItems: 1
+
+  fsl,companion-ldb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to companion LDB which is used in LDB split mode.
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: Represents a channel of LDB.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      reg:
+        description: The channel index.
+        enum: [ 0, 1 ]
+
+      phys:
+        description: A phandle to the phy module representing the LVDS PHY.
+        maxItems: 1
+
+      phy-names:
+        const: lvds_phy
+
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port of the channel.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output port of the channel.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+      - phys
+      - phy-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - power-domains
+  - channel@0
+  - channel@1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-ldb
+    then:
+      properties:
+        fsl,companion-ldb: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    ldb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "fsl,imx8qxp-ldb";
+        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
+                 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+        clock-names = "pixel", "bypass";
+        power-domains = <&pd IMX_SC_R_LVDS_0>;
+
+        channel@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+            phys = <&mipi_lvds_0_phy>;
+            phy-names = "lvds_phy";
+
+            port@0 {
+                reg = <0>;
+
+                mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
+                };
+            };
+        };
+
+        channel@1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <1>;
+            phys = <&mipi_lvds_0_phy>;
+            phy-names = "lvds_phy";
+
+            port@0 {
+                reg = <0>;
+
+                mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
+                };
+            };
+        };
+    };
-- 
2.25.1

