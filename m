Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D775A762
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C55910E56F;
	Thu, 20 Jul 2023 07:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0342610E56F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:10:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggpUP2JEGMQHR2Z0cu/y/23vps/JwqImy5R3jh+2/amH3lCGyjWlW28s6ftOmu5pn74JoH/+bSWjwLXiud0h9GODfa72cmNNljPULtGWjfPfoR2dx7e9gPFPLzOLHKoU54veVv1OU5vDyTRSVxIF/RBNuTwO9k4c/YiY7PkbQuiXvRkO8Etleg3fgRx8cY8QRUP6YoCcVZtRcZzxh+q6xVueA4x1d5Jrl+u7ZzX+7VUxJOkD5TDe/iD3nmJui2nV91CEgVxndzRL4kWuS/LamtS/hv2i3+VwBG6l079+LXRfMRzapBP5QixOCcTMApcjd4OiHF15ib9xArrqlgg5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht35sNILRuy3JDoTfo8lLosxxMyf2f6Qkc+PxgdkdHs=;
 b=f4plSjK56AG78fN0D+sulI57wToOLt8dteM6eLjr6m/mKrC9dPGyIqP+1mqjwuPQQTGi8BizzvkXpKn1YO0aonCKhmUsjKp399dZhFvt0joYyj8URFm+Km/qEAzJ7001GcHD5IUtxJ9kuDsaTm9zB78vR3OHPl5xmXVvvzzxMDXl3WVvUC+46OKbMx+W34D6keMQjH16yVjCFYN+xdK123z5ReP3BigY4UiqrIJRkuhqe+ua14RUZM9jaPKtUelzDpODlF6mlRYpKxQ9QchprnqRHPQRsQGlutjPN/L8R9ObeNAB6aIzOAijncU6U8WuGUv+5DzYoxEE3iGDaiuJCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht35sNILRuy3JDoTfo8lLosxxMyf2f6Qkc+PxgdkdHs=;
 b=JzugVVPqp80xdQ2GOJnwptg/NAVBzTQOvNxr8QMBpKQCwSFN6vAlFtqpal4sI3Gi6JM0Vblqv64BYL/OlmHoVTNyQO8mioLzvJoy+Jo/klctT25C6BLLQQSeHE3r9OkpfWF/hUNohv9WJ6YP/vw8xlbDFg3WStPANc/NFLkhTaQ=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8415.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 07:10:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 07:10:38 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 8/9] dt-bindings: display: bridge: Document Freescale
 i.MX93 MIPI DSI
Thread-Topic: [PATCH v2 8/9] dt-bindings: display: bridge: Document Freescale
 i.MX93 MIPI DSI
Thread-Index: Adm62UlRadPx1sNHokWiUjk2oOWebA==
Date: Thu, 20 Jul 2023 07:10:38 +0000
Message-ID: <20230720071430.259892-9-victor.liu@nxp.com>
References: <20230720071430.259892-1-victor.liu@nxp.com>
In-Reply-To: <20230720071430.259892-1-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
x-mailer: git-send-email 2.37.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM9PR04MB8415:EE_
x-ms-office365-filtering-correlation-id: e1cafc19-3a96-4641-dd0c-08db88f06bd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zd+iqvl2j3CG8WqjKhjPl6G5oUE2wOY0zrEkr8nVDtMMWMCI0QtyRRgpGlNneVHWwk93ezpRPYgtekLPyDXa+RXEtJfEWRC92f1mKu36jTPIuUAB3K7nkkC7VaGjoUWyGcRu0UwiZ5ifffiBBxsxgQQdzrkbWoG12ChGyCAHLOpWDbPwMJf/I90fxuEPv4phGaWBaILLJ1pYk1b+7jC+ZqQBIoWS3eRWqj8BRKfU3NReubRNTarRZtJw1SXe2vJjO78N0tKNuLAbhbsIPm3HVugRzWsRkoybZ0QV1ePq9c1nIeb9xtLa7OPJyfYHkvj0bnjjYSqrHsBSVK/7ZIwmKezICa7dmmNF/5C7NlOiUMXEFSuPb0xBY/g3dXNMUAblUxncKhYPr9Iurlhmh+lxh8yH9uANN5VLn6tCyUJGEvcY5kAhLfGBwnmKX1tvRgYFtGezni15v/MugdQXNTOeg2WJcLe/UW/mUFEFVxahGfH7uGKDcIcLOkqzTa0gcu+LTUZJXJe2sLOqlGrITSf1YmPkigukTHB+y6pwv3a5gxpd7cIs9jxVlQslYPD3GZHuSviJH9f51Ku/6hk/PnitkgMqPRd5hwilN/R1oBjQIOYIM6hXlFCXNFD3NVJkfUy1VpGa7aNqEzSWUgJGLeNwHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199021)(6506007)(478600001)(1076003)(26005)(6486002)(52116002)(2906002)(6512007)(71200400001)(966005)(4326008)(5660300002)(66556008)(316002)(66946007)(66476007)(83380400001)(66446008)(54906003)(110136005)(64756008)(38350700002)(36756003)(38100700002)(7416002)(8936002)(8676002)(86362001)(186003)(2616005)(41300700001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tLqSj8339Ee5LkSEd5UalBWBpM73ZB4in1jZic0nHFAvnkIwW1ThiRm6Jg?=
 =?iso-8859-1?Q?FTN5Jy1dZ66PrTx++uogK32TUB61cf5lk2r5Ls5WelgGh3OIE0zAT2UXPk?=
 =?iso-8859-1?Q?WmhBKVfWK9CQ8tSSWQz2fz8Ui4akLpWDRZaqi0zp3Qqi8FOrWJ7dvTNMLB?=
 =?iso-8859-1?Q?EdsRUk0/oupeSdFvcyKaMWk6zQEnD9OF9D//0ZuPziYBN4PRcagRDT9346?=
 =?iso-8859-1?Q?AFJ+sE+N2Ihj/+KJBWIV473CfH2QFlljuOiYjj9HewQhFZVKsqkU8auu50?=
 =?iso-8859-1?Q?K/qKHk7/tU6kyD0Lv5vD42HFPltU6M/Di4O/iTwKyO+oPyfqPRVymV01zn?=
 =?iso-8859-1?Q?DDazfxMR/Mn1IWN0Bicjr84XiXRcRmoPjmmaSy+ogQwfTSjCBHkFYLdnGZ?=
 =?iso-8859-1?Q?fWyt4tIll7Uw2VIddOLcjgSWd6DDc4gJdy7Xur3thxLjg+6v7SP+H4c0lU?=
 =?iso-8859-1?Q?QYc+8GJ1Sg6u/VmnKh0cygW5mfB/8winfp3Q0LmgLRHvFGQQIF9pRv8JP1?=
 =?iso-8859-1?Q?NTnV32W8DxhXF6zJ50ILLtvGZbMH89PmjqdKssm7rP7mQYnWG03kUN32BT?=
 =?iso-8859-1?Q?bb7h2p5t6/zV4CjvjODHrXnIwfZbRUrFmxGXVMt3c5n5dSwOaHZ9VimKEY?=
 =?iso-8859-1?Q?SWX//BahwLBi0sPTCeaBKiKaEEw2GAtTXO5VqgWUTLYCuViuOQqkbxv62s?=
 =?iso-8859-1?Q?xTte+FV/qi+BOrQPTQ+H7moD2pO4N/hBp7//1al9oN1qosIMjVknv87hpu?=
 =?iso-8859-1?Q?grgv+ubO2D5Hz29WdR4Up0ohWs59uwQy/aUnU8CA90GctQgtbOXom4gIgx?=
 =?iso-8859-1?Q?zUPULnD4zuZDHHsIgRRYL0izdESOW1ZOd0N4SqXZBAb/Zxp+WrOA2Vw4Yr?=
 =?iso-8859-1?Q?80fQz2XshZzp15epClYYsrGM4m7QtlWz8O+zHcT4Mlhs7CnkOjuG+Wl7Tk?=
 =?iso-8859-1?Q?OY0XH2MaphwqUyvdG4Sh3XOzsnD3mbNF1R1+a5YeRMVLnE5wM5oAPJRnry?=
 =?iso-8859-1?Q?Iwf1UCsQCMw95Hx+mjHYoh2CiKvUrsHKg8UQ8vvq7zJyUbSMSSzXJbTlOO?=
 =?iso-8859-1?Q?JuDyrEShb63r7KZE5hk3th8dHnC9y1dWrYF4slAOXWrIz2VXTEYZSbjeys?=
 =?iso-8859-1?Q?hoxpP0wEjmcCCAmjLVXk0Aj/TQaUgn95yE0qGDoozi59zAB4lzWQOmT7t0?=
 =?iso-8859-1?Q?6sIJdelztadF81p7DkC6olyOly/gHaJu06Gkc0HCTDoH806cVc6b11rXZJ?=
 =?iso-8859-1?Q?QkFBZbuJ+t+DO2i6TkFfbBsRcB4kEXIj5uytjtienxs1KfiRAfYFjAKhMV?=
 =?iso-8859-1?Q?iXt2inra0Kp5tH5Apu8YuM65PQqAF2sthJJ53Xdsx4vUqhax3OxZ6zuGlp?=
 =?iso-8859-1?Q?fOqbOxG2yGKHKU4p/BTcTqhOIxq3HpQebS9yY4BClnspphB1psjDUaK5il?=
 =?iso-8859-1?Q?U4v5oUFc546gszEHJvE7NOHlK5gx9p47fln8Kb576RHXzVjdX+hl1fmH4+?=
 =?iso-8859-1?Q?roZEa47MDmjMM/eiEDtptwCMtsk0OI/mVkie2NBGOE9Y03w1ev/ZWl8MZ+?=
 =?iso-8859-1?Q?gICtHN85QNRlaFfWt9LW3pJo8FdoojIe8JUOW39ZE8MRs4hB9xUBt4Vh0h?=
 =?iso-8859-1?Q?NpWN3QelrVYZiNo6jMOv71ZpOp5G2XK+v3?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cafc19-3a96-4641-dd0c-08db88f06bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 07:10:38.5224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7N+PbYYv2L4o+fQQdKKtrTZPXI/AxR97Uo1dVVtvS9jwNctGFPWlamW35OsaVQeDR1rGdBhJsUUNIQRVhQk80w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8415
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
controller and a Synopsys Designware MIPI DPHY.  Some configurations
and extensions to them are controlled by i.MX93 media blk-ctrl.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v1->v2:
* Add Rob's R-b tag.

 .../display/bridge/fsl,imx93-mipi-dsi.yaml    | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,im=
x93-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mip=
i-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mip=
i-dsi.yaml
new file mode 100644
index 000000000000..d6e51d0cf546
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.y=
aml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx93-mipi-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX93 specific extensions to Synopsys Designware MIPI DS=
I
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  There is a Synopsys Designware MIPI DSI Host Controller and a Synopsys
+  Designware MIPI DPHY embedded in Freescale i.MX93 SoC.  Some configurati=
ons
+  and extensions to them are controlled by i.MX93 media blk-ctrl.
+
+allOf:
+  - $ref: snps,dw-mipi-dsi.yaml#
+
+properties:
+  compatible:
+    const: fsl,imx93-mipi-dsi
+
+  clocks:
+    items:
+      - description: apb clock
+      - description: pixel clock
+      - description: PHY configuration clock
+      - description: PHY reference clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: pix
+      - const: phy_cfg
+      - const: phy_ref
+
+  interrupts:
+    maxItems: 1
+
+  fsl,media-blk-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      i.MX93 media blk-ctrl, as a syscon, controls pixel component bit map
+      configurations from LCDIF display controller to the MIPI DSI host
+      controller and MIPI DPHY PLL related configurations through PLL SoC
+      interface.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+  - fsl,media-blk-ctrl
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx93-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/fsl,imx93-power.h>
+
+    dsi@4ae10000 {
+        compatible =3D "fsl,imx93-mipi-dsi";
+        reg =3D <0x4ae10000 0x10000>;
+        interrupts =3D <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+        clocks =3D <&clk IMX93_CLK_MIPI_DSI_GATE>,
+                 <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+                 <&clk IMX93_CLK_MIPI_PHY_CFG>,
+                 <&clk IMX93_CLK_24M>;
+        clock-names =3D "pclk", "pix", "phy_cfg", "phy_ref";
+        fsl,media-blk-ctrl =3D <&media_blk_ctrl>;
+        power-domains =3D <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_DSI>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        panel@0 {
+            compatible =3D "raydium,rm67191";
+            reg =3D <0>;
+            reset-gpios =3D <&adp5585gpio 6 GPIO_ACTIVE_LOW>;
+            dsi-lanes =3D <4>;
+            video-mode =3D <2>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint =3D <&dsi_out>;
+                };
+            };
+        };
+
+        ports {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+
+            port@0 {
+                reg =3D <0>;
+
+                dsi_to_lcdif: endpoint {
+                    remote-endpoint =3D <&lcdif_to_dsi>;
+                };
+            };
+
+            port@1 {
+                reg =3D <1>;
+
+                dsi_out: endpoint {
+                    remote-endpoint =3D <&panel_in>;
+                };
+            };
+        };
+    };
--=20
2.37.1

