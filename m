Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F354033398F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 11:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C1D6E9F8;
	Wed, 10 Mar 2021 10:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C9B6E9F8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 10:10:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BE0bxrtHPesx95teEj4Khsu9mSj3XzG55VUY3hgrbKBXs0gvO21vzbyXVbMIwXiylNQDf9f3Tav7yna7voyJrXxgbdTxUD/rugjZAHdY3RTgtmo8bJ39h/MJSkBHvruzQfkatDxTQeh/Gen93bUqPeGlkBYCVIuyGYapuAE+iRvSTzsVEt7qffT2XZTLHTe2XTbXa9+tYo1xJXNdsZmrpAZ3rab504j2oHB0qetUzaV3iX5vbl2n0jGpYM/QfhaPASajCg2pBBvqPGlzvW3FyHwCw4KEHHjQP2PA4agcZiWqLg1qXJhSYhp/B0T5xCrPGXk2L6fn9a6cHm2BmXjdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPaF5b8X7N45kdAHMx4gPk/1keyfewyj7WPwY3+3sHM=;
 b=nYOGBD3GEfP6ELqHwI4pBLckbwJNco0uykEOTLYYt5FL9YtkIvuDpNlVkGBi6FvQ33hQo0q5KEbJxEg5O8rtRjCxky8ZNldyXJQTnKBCgIzV0kw1bkjy2s3iFEsq6VAcy/ZUQgSrSyXLYh3fLcbx3PJLVP65WqgqnRMXnnUx7dGlWuGeRIN+RJ8DyRaG90xaAvnDIz17KM5tWqB60dnLotQEU0ymvlf7rAjJ/aytwmLkQIUCnkOGuuoanoouwYgs0GY61SVrafk98Y529kvgWYYFMIprnwzEDcje1vVBJ7Tbx3YoBh4qQlVKOizlL1hxA50bAAZsNZMXPXXJ3nFiVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPaF5b8X7N45kdAHMx4gPk/1keyfewyj7WPwY3+3sHM=;
 b=Gef5CbAOzIgLxFYY7zdAHmE3PLNZvjVq5nw5NFBVJj0njBkbSY20JMcBJ9ArdMtVwHLciIkLxA0scHSZlZMvO+cMXCkF6AmodYxSqu85AH1cvncihhBqsmTa04XlAvRQ54/oCQTIfVwIHV79yJBhRBiDyL907I5nTS925ouN29s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3952.eurprd04.prod.outlook.com (2603:10a6:803:1c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 10:10:08 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:10:08 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v5 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS
 display bridge binding
Date: Wed, 10 Mar 2021 17:55:35 +0800
Message-Id: <1615370138-5673-12-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:202:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:10:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 33cc9f4a-c804-4bbf-61f6-08d8e3acaf20
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3952EF914FE5E5F7CFA22F7798919@VI1PR0402MB3952.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h6DGt9VNjaJxLQfVPqrNo40beSQyo4F504p8Gm1PsZeLut9xjoko/gly21NcOmZHYCiMu2ocBQTe+HsnhMuw5O3PO0BrsbXlP7/fJpGGIIn6+iktEMz+gPED38ptOOB3Iam+zEYJ4/ByDzvPNyjzh5CS+cGNdvyWJHNUbPfT7makny8Xhzfjcx2GffQ821xJNk6U1/KD+Xf/MbXOSckUBZnlhYUiGI8YHc306i+fDYk2tX1AlPCynN6Lu6Gg9O6eYcVZPou30IDnWoBhAifrlLJwI6T49uArdN3LbcmzrRfUj0wzTzvItaYG4yPXgxAkUDKzDnI8Wsp0UcDcX7OVz0XYajbES+ifZJkQavTQFP/s2G9njk8WWv6lcq+xL5NGv02xfWhabBtGo2+jju4C3J37BAyi1Uh+9BqIgXaz6AKTGofd1f/gUrgMH5N98pYPJ52l+ZkDURpivOGgnkZNHlVz2PnM3SN20EJBtRoSdtgBBK9AI6q7zxBr1qMYGIEqa/S3qyPs76DOdQoWjhuySGZ/DzIH7Dc3BL+b5REwyN2sGpXecGQ0IvEHQpOJwal/ksfbOecp1ydfhwaRLVUTYh+ADJwIqLAxbNzeGLdLpGBGWVxjoD+QirYGMUlVQabdgXxu7ZmnP4byA+9KSRQGuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(478600001)(6666004)(2906002)(66476007)(966005)(66946007)(66556008)(956004)(7416002)(16526019)(2616005)(83380400001)(316002)(8936002)(5660300002)(26005)(6486002)(52116002)(6512007)(36756003)(86362001)(186003)(69590400012)(6506007)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?olYcVkrJktIG9q9o99I0X27lYWhVlVjNMsnaFi/Xmpc5Ehse9SzN3gDXok8J?=
 =?us-ascii?Q?xED7AHUWJXA6kv67nHOVWLlow9wY085BkY2OYACrF2emiS09v/e/OVfixo/b?=
 =?us-ascii?Q?EYsIOisrhjWU3ov28Gjk74gvGSU3nytrfsq042vRhpaY1S9ChJM/+zjNlv8a?=
 =?us-ascii?Q?gCzM2HdZbt8asKl+/EpGaavQPz6w/fw0G84lUPg9E9yb/jWitJoVgTCk0O44?=
 =?us-ascii?Q?PzhGY0TEkxE2eCxRZEa2HE4eOBOyiq2CmhBJj/0II3p6FYEeTUSbTKwFVDko?=
 =?us-ascii?Q?87VDwgaIdh3k5In1/I8AL9q3ljZqtyddA5philBqs0Vz0hfuqr6fpSyhmI1q?=
 =?us-ascii?Q?qXgb5Yun6dS3Axrl+8VEeRKNhGLKEf9kvGbX9jh8Ai+QoTmOv4HcL4TnPJcQ?=
 =?us-ascii?Q?FR2eKCwfYbh6ik3Uxv88Qw3Jnbx09w4VJn9SNRV5rnGA+VXcI6goNO5F6m52?=
 =?us-ascii?Q?IO1llHa4yT2x2p13o7YwVxU/aDgqQWLj8/rRnYb5UfefZkqpvCQ6i8Jx6Yky?=
 =?us-ascii?Q?QoGw+2svFRcEeYE+wUX87IT3oi3/xgcMJoagqBQlpBqfxVJoDinUEl6vqHUz?=
 =?us-ascii?Q?xKMu0+xk/yO3wyDI7JeMsWXDgWVBlV1U96RdCyDOtMKQEj7Rlz2JxS+9eG1C?=
 =?us-ascii?Q?02lVTyUCAUqazMH/4cH2SZBJ4yxnZiBP/qPQk5ZgqaeuqEfk5zxvcy2YB9p+?=
 =?us-ascii?Q?aoClWCxIxlRMxX/kbQzwA3Dm4hsGYu4K2HDucK5aP2jyqBi4kUXqm7P26yY5?=
 =?us-ascii?Q?4Y3Y4DANfAiDoWTcqek/aKrS/l5s0I0pPjYLFyLBT9z6mTSuleRM5oDlOehA?=
 =?us-ascii?Q?qDwRlTW8jaXJ0yIltGrMQDF5m7SHYcUK8bT9FJf0Fiy8rxZs3GBqkmEcvZaG?=
 =?us-ascii?Q?K/Hv9tQROXA1EvUsEbIOEBPxgY4L63c60xThMT0B4hysPyrC5LUShNS4EFpo?=
 =?us-ascii?Q?UKcnC4TB8/+8gTEL6VbOwrfX3BQ5D4a0anPMu/aZOPw5/IA00jcPg9d2+kHl?=
 =?us-ascii?Q?6VlQd86VL7VH03ZY2/cqnr8Kg6W/BFHokq+GOCIGyIo8AtPuU08xj+SkaUfF?=
 =?us-ascii?Q?HZKmESW6+pj/KGyBupXMh9kJGu9qXzOBzkBlWNAPq7Lnyf2c0EUJbM5le85h?=
 =?us-ascii?Q?kYjGrCM+ztvRtrBK5QSWdXD4SglLSb5Ogx/owAkFRwRpqETvE4XMqOjL5bJp?=
 =?us-ascii?Q?4sa0/4g0saRBnhY50gYTMOI1XuHT08ryBnOHaWduo5OcItxwLsgSZaytAm0c?=
 =?us-ascii?Q?WNS8zvilJ0nCF5IBZ2ZAIsZ7XnP8voF0W9So3Ehi0GPVQKhBshicx1NkQSMi?=
 =?us-ascii?Q?R+cRIJgBSYYufLI9dCjubKKo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cc9f4a-c804-4bbf-61f6-08d8e3acaf20
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:10:08.6799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POb8TErakqYjE1ZobnubdXsJJwmwjRqM0jtWG6j6W7Bb3v/ieUsUaLMR+rPpyC/xK0kshpKtJwv6UzqOy+tk2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3952
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, lee.jones@linaro.org, mchehab@kernel.org,
 shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

 .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 173 +++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
new file mode 100644
index 00000000..9454300
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
