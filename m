Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3361234F918
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700CE6E9F0;
	Wed, 31 Mar 2021 06:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B7D6E9F0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:49:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6kxA0dQrntJ7GqxUxvWT0APUlHqJlOcKhY5VtRqftnEEmafXT9um3fQu5cRR/r/lmPYNTomkX0H0CBdkSikPURHcmhkYAzrrRVcPFbbzSBiORSXRmFJRNxE3btIGws5T6Npqh1LtMW9utYuL5tRgjf7up70u4G/Vrw2czZQm+932f+j9IPXV+Av8nDHl6Nnas7RhyW58wDdKzvpVMpd43R1f3efypqL6i9EuAxF8qtN2lPJ1mTAlpxfD2nDmmjhDkud0iHCJ75AAWrcMzBaDh6/gDSMOslC0Owkl1apegX4MEGaB+Ah2Gc9ekVeoIrDq9avo2SpmG5np6dS4zdOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=620z6n1+DovQARLsjLX3MUSJuUIadFiHq/3JCn4f0ak=;
 b=InatgWUkFUgivZu9FeGCNll8xa1/9mZk8bvQP7obftCuQ+Y83QK3pZlZ64puMTjECAeMO+8KDRA084YQuqavRpOsuQSCwF4HwYEjB4Zd2SmYZsDIdMYg89wWcaBnK3fo6vEQUiBO4JFRhTP+J9yHThskJfBJmKadKuZj0yMkndIykDm7PTP3t5DYj80W2/Xh+PuI4BXstOCPe1DMC/2N96DH7HuBQo1rAGCqm5C+S1Ibb/dcD/RXC17864gOj4tmYGG0KyponQzqFuIds6dPLq8dKtbCC9YCvDeAR05mqwdgql74ynD4KD1UHE+uJ6mDwFWbhUwmDHeF7QV5Jw+YMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=620z6n1+DovQARLsjLX3MUSJuUIadFiHq/3JCn4f0ak=;
 b=atNQcu84n6p8nZsECy9rwee/fpLapPZj5xUaaAgxcraEhWwBAtq/TqMSPL0g2s4SNhFpgyF2KDEhlelAoFn22ukf21yFEO/CjaUVe1uAxCEE/JXWj+ur7vZs4zffx4inHGG9SNOMZTRVrXCzLAIYKqVXXoRjwDleNlJKU95MwV8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2318.eurprd04.prod.outlook.com (2603:10a6:800:27::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 31 Mar
 2021 06:49:43 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:49:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v7 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS
 display bridge binding
Date: Wed, 31 Mar 2021 14:33:22 +0800
Message-Id: <1617172405-12962-12-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:49:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 489e5b47-e35a-4f0f-3b62-08d8f4112a4f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2318:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB231895C7D1A55794CE030E19987C9@VI1PR0401MB2318.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pWdGO/+CT3BxwxR9ltfAE11OvBpFQNJSX2DqoeciudyhlDQV1XBwv8lQXoPIgHRo9iFa6Ejb6KLtWsBcFo3faTjqYHFlUwNuAJ8TRhpwU0AtQpGX6VSE1eYy2OY0/zFx9k7fCWqFmpA8ZDUc3+jOOmi8DUjp9+XLhulOx71d3Efm+YkzWqrm8ekuxSyPhmAATJDamvKilge3a4ZZW2dJPMKL/T/9sYeTXy6xsAbpxydXV7H/1juJssmOGTzReUQKGZH1RfqlS+/jGOvwW4pt0OE3xyipe4By3xWSXj5CVcA9GUJnK2ubaJQKR+0P8+rj9JoOPVmJ9avpn56zBA1mSn+4ORe6m70alUU28Hy0d5sg4/J0Uv1INJ0hZk9iXZifWwpyf1YXf97x+P5+APX0f2Hksi705QCoD89cGokxkqVeczKhpEwgWiUeewgpotsvFxwBJF8cL40QaHHK1/szuMPV7UEEYEM/CNNhNmsdnsA9Ncl3syA3zeHVde0NAARchhZcmeggZ4Bgq6lfGg8qt8uMk6N+Y0bkWRVHx0RKkkrdkHpxZuw9/SIWBsteAytwBNNzCgSBZ1XTuEAQmms/Ch8jGLB2Au+RK9wA8hVE/j1456GuoL//7zU7IEzoPHa9LZS87EfV1Mle4PEKfoO7gLwTjPxN3QkF48ZG+Bix1irDkNA+jUcSQ5fnShxtaEQiKsgKNdI6bUHrPTmOnymhilKdhJNOHdcllkj2xG9MSy7VQgmldZDMN5ia9o90I+ZM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(69590400012)(966005)(36756003)(498600001)(956004)(16526019)(186003)(6486002)(26005)(6506007)(6512007)(66476007)(66946007)(66556008)(38100700001)(2616005)(4326008)(83380400001)(86362001)(5660300002)(7416002)(8676002)(2906002)(52116002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9xS/JllNkKb5/cm18mY1jLGXw1KPrVR0CBKP4FJy7eDZe9xdm6ClkgyTGqK3?=
 =?us-ascii?Q?komZYz2dDwf7yyOtMg5ZRVkf7Fu/WNrciSCr1Uk3YQMewQCoWVpGJZYSI6xm?=
 =?us-ascii?Q?JKIgeCj1o1dmjsRcuUzbd6hnocByrgZB5vAVG6ye7YK5vBFuT7m014q656PV?=
 =?us-ascii?Q?Na8YLGpS+wIaDHcr0kJCnwi+ffop/eLgFYAuRcQcpJ7lrmFw9UB0cEdZzCUd?=
 =?us-ascii?Q?E+1YMa9dYdkqXvs9ASpVucFqP2daOgZprYoxXmYlzec8yWOGXZpecg/Siucb?=
 =?us-ascii?Q?sNxGl5aOShhkjhtiiUHZv63EkaLhlR2OOfjyT5j4aZW8RQ9SUp6hxLQs2sIt?=
 =?us-ascii?Q?P8eIJMBIX5w/wInhMW+OfmO6+eXBw1qTm+O+U8tfLSAOv4vLSwIk75Uv1Bvv?=
 =?us-ascii?Q?gfC6AfJh8q1qfN8/NO0I4sgdA4BA6lE2IPgYQuYZil2lh2R98jJWUlpQRb/a?=
 =?us-ascii?Q?Z4FcGDm1fz+FQkktW2OccByOTcaCJ/2FupsNCjqQmnYOpl8XMcse7VqX11B2?=
 =?us-ascii?Q?agjYZdBvK3ovybps0aL2kGxEMwD0p6AUiGT8pRepm1nG2HWE+QCogtpZ3hfZ?=
 =?us-ascii?Q?6iA7fJUBsyhRONh+egwRfrM7xX9ipvK25EqjFyIyvaFg74S93vxjgCG5kh9/?=
 =?us-ascii?Q?1eVkVhXSdOEf9/XIH2vXV7R+JVj5O5iZXc3i40VLhipFw1ZDa7jUwt2QjT3s?=
 =?us-ascii?Q?NZka/4reEC4hvILF6tbrpSxN5kf/UPCK7RaUoQwt+3DXZoRniRQWzs9oAUF+?=
 =?us-ascii?Q?HXDoOiKvC+mVrjCUHMoMPPfNnxoAi1FaEnnp/qta2FkXzRBJpK2vYeTbpmk9?=
 =?us-ascii?Q?Yp6NREJ7PYn3sNAGAePq7AS4sF/FQsMjT+R7ZrMOeh/Re+AeyTO34gcd91EB?=
 =?us-ascii?Q?tp/EfB6XnCV00FfWL+R8BHnhTGVzRC1s9XaBNHwMYuQETeqwO+fUD6Gnt8QW?=
 =?us-ascii?Q?TLeRETMbh7mGuYsMmFtZynHo12MAR0w8LIyGl2fuGDYl/elH5Twp1XDxf74x?=
 =?us-ascii?Q?gK0eUwXXbluqbShlMGaL66tWaN8V+JXCcF8BrVPmh+aMA/qO+0tqtHmBzzMK?=
 =?us-ascii?Q?dVIcyLSO2+auRMMhWvDXfAdou5Cz06tehlAlJLoWTqpHOk4v5DuDzS/G48Gz?=
 =?us-ascii?Q?kz4FVvt7EtTAZunTgEx0qFP6XrhvJHtvg6Hswt6JouTv0ENTjKgJErktLtBD?=
 =?us-ascii?Q?fOGCrmqRbIaPZJLH4q8JoxO1pe5GkqKxi7B89EJ1t20uT93BeN6g2XQbLrSC?=
 =?us-ascii?Q?Fs4o6QL48K5bILyfWyW2K1XBVtSqAPSAl0IQGT/vYUJl0j9eOZOttsfyVVpp?=
 =?us-ascii?Q?1b+gjAyFAvYzRYoSzAO9wKqN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489e5b47-e35a-4f0f-3b62-08d8f4112a4f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:49:43.7380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +U6xRcRypmnfSj+HSafcaCLdGTFb/i/be5gqIQTeikhIPpVEpu/W6WQZm7w6OdfFCQ741PBVlnXbGSZf+gkM2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2318
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
Cc: jernej.skrabec@siol.net, marcel.ziswiler@toradex.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
