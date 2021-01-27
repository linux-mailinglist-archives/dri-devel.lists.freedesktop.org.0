Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014CC3070F0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE40D6E91F;
	Thu, 28 Jan 2021 08:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FDD6E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/6hczwx/JJNO46sS1g9qsRFZXhe9QZT457IZ/kkwUHzyCPiEgLA35IRJTvYuaLdsCcDm/FkBaHOUEptWoHTb6nrlXqS58cGUGRjAfSB3xLDEFi1wFltjH29Lx8MCy2cWBhpGuYGrrAbd56uAvKd/NG+19eMKs8DMQbi56yuL58kS+ijM1zm0XpvFoJyoUbLuBjhPPVXGScyRawLpp/jFzsfYxxyNE1TzYJVD0o5vvsUZmh1sjL54ZnxYyK99v9F6F8v9jGTAL5cfl6CzlwrX8TwH0HdDIOAKNMNgObKhalFEg9tJDfRWwrS86ugnQEKaIunCEwChmPhxoTi+JWWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5u8QQ2V+PfszvuIyyswuYKaKPVOFhSlmcgTBJ5xrdU=;
 b=PsnR74V2T/IJWHmIVRKs/cG58eWCRWpGGTgryAqEGNUdRM43nQkJRLX7fEG7zo/GaBCwFr6q/5uvCSALAEhisGdWRGqu8FS/nq9hUF0FpTl36xBB704eYm+hD8mDo5t1rKUhTWH3DDJo/XFvgwr0xilg9zIzrMqhxlweEDFf8dQTxd7tWzmSnPT32Zp059vUd2M9rCc2WDTNdTkqVbwJZ+c4146ldJCSg6Hus2Tb3oXxDnrrI6u6x66+0xx/FEtLKUVywKGRGILVC02sbbdJ73hwcHjJLXVZFnHse0fw+26fbxlhYvTlTUh4OdLzkGb5hdhMYXlQh+I2qSAkV8rBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5u8QQ2V+PfszvuIyyswuYKaKPVOFhSlmcgTBJ5xrdU=;
 b=N4xuaRXceRP2bC8rw3MZRMe/dOCWnvjfEEqjbQVVg+0gPbAL3ydjwrXQwITIlJEuarjQg4lC0DPk7GfR+S+ETjj0O8JUS6FjHAG95glXhej3UEHMhUTFkfnhfB+4akPZmwRBZZ1t6Uy4vUY/dgxTqPukrx9BN6jDJRmboc8ypUs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:03:30 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:03:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS
 display bridge binding
Date: Wed, 27 Jan 2021 16:51:25 +0800
Message-Id: <1611737488-2791-12-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:03:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 75cd2a5e-f66e-445e-ea89-08d8c2a26a4a
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB2975F6249CFFBA8F4C2E65CB98BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3sGrB5IYTubwRxyJrHndxhDyhsJohjTg3xjrRqdvQoYL+Vr6INPFSxKShH1aJwUxdGMgR1Sj1d5cAUin+UAWbDwchoMxDgh9ZlKQzD0cI54qCXlVdTHPnid96bvMYClS+M1IGaESsG/xLvncrmcgxTlTDrtXF7nY5VrHQI/VsbBi9VBR7nJAC0BU+IsoS7f4bd7jNkmmMKTZaqBwoGnnWfvp190sKglCLCgZQQ7XH88kE1Ypf2+PXT6ezcR+WmcAOWBieWa1wWa4eCXk5sxiHnyXlaxNtcVPzpffLKRGFRNJ/Gfb2XejbnV+5XBqtB+PwxtmcmkokjxPAnb7wD9/mMcAskiZUR59rLZ5UZe6hdobqI6MU1T7SPO0yl4jOgmpo6ZExC16+2CZSPb1ajf/MChlR3JWKrv8piyNby0C/d9kqthD2wI+mgbbTYBqS0IbnafuHUyEiz2RTrvqY84ACJg3qjkIH3BltPkb3aWyytQaqeOa8QaA55pDvDplIhPSvsW28WcrD9csrHBDFS6V4Grm6NxzUZjsELQuZ1e1iwJsXNLsD1omx7nw+W54Detmo0KMfKutbmEz309l4C9eYo6Gll5ahrrRAkDluKxwiHDer9nZidlkutzxpj+G5tACKGFFx46Ip/pBMJ96uRxnfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(956004)(7416002)(4326008)(36756003)(69590400011)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(6512007)(2906002)(52116002)(83380400001)(66556008)(966005)(26005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?srCXo5eXpyoxM0CSZVro+DFydAhLFiizrDS2U5/4QaJ3OnONUPZKW3nLSW9j?=
 =?us-ascii?Q?ETQ4Uz+7Pn+h0ptJyHJEAutliopMpRwIuty+hI3l6qfhWwOgV2ftk4tR9vwc?=
 =?us-ascii?Q?uKXRuHPjDDCV+8XTMmdw9Pig1jqjZHbC8jxpbcp8ZQSOAuoUvUegN3/o+Plk?=
 =?us-ascii?Q?6nHeVVjisXulewT/KkZBLdVjlzNjMyJI4OzOMCh/tXp/hPouc/vzomTzBX6Q?=
 =?us-ascii?Q?mvfy8sf4zlpSsqkW7nhQ+kNMgn4KYiw1QHbiYi4Zxaxl41P0VzCf24jZ4bQH?=
 =?us-ascii?Q?CaPa8gFv2116p2z8IFl8RmSXtZoIuIC1fbU189qqZrGlP1ZFsUW7fuqPrY3i?=
 =?us-ascii?Q?b+uMh0Ad7bxZ+UrX06BfZqE032GJYFrzH11+h8oovyhW7M3AMfUTppRvuJaw?=
 =?us-ascii?Q?1yCWiKbziEE4wiOObt05krz4dICeZy+1x/CF6wtfvobXxPrqhy+VTTdJ53vk?=
 =?us-ascii?Q?fzQFbnnnrLy8YG+mKNx9lj2on0fPfZ30qtLSVBOkoL5VZhcOpO0r4NhDl8dZ?=
 =?us-ascii?Q?YVygooL8gxi4xhiXR8kHJpGcyud9hcIpzU/0aOnuCq2ROKLGcnRi1uc/WCuw?=
 =?us-ascii?Q?32sGepQLuU3hj7Dx0K326OJ6sRfKXEDdqXG1l0cHK2KtuoSS6gxjxN0X8YVQ?=
 =?us-ascii?Q?f1CxsWpzdCrjgejW8BXP4cE4afI3JlRnBh7vyX0vWc+7xwY0gqgT+sPcyH/K?=
 =?us-ascii?Q?iWz+waFu4sj3dR103ZNwJeiF+mMyJlkMwcA/DMRuDizvqckHwNP0xvpUcsf3?=
 =?us-ascii?Q?JpPWv0vwu5sf/A+vTly6XcAZleMAti87YA8eW47dmpsXoLXPwmPF9GyJiNxr?=
 =?us-ascii?Q?ij2eCvKW+9j9DSZaKCePpggy/7fE6wXC8jeSacE879/ogXDJ8vWQ++zjAkzT?=
 =?us-ascii?Q?0Nrm1pGgUWJCX+s12Mtx9MtaGa1q6aEEil5kh4Ljc3dRzhxlyz9b+haqjGlo?=
 =?us-ascii?Q?y5pVf5wJKkMKHEEcU4l/WLbzm3S3a5tbWbD3z+oxqNJR+7kxOsSI2z0ExjjU?=
 =?us-ascii?Q?LfMnQB1AmmhxJIHnUXYk9D5fJ7QPsfT+2rqLNY5ssFNg9hjIMTl9NXXGbsh8?=
 =?us-ascii?Q?L1uVByd0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cd2a5e-f66e-445e-ea89-08d8c2a26a4a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:03:30.2397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MscLWDfOoKaLe1eaAhZuSupvhRgYO2dDo+aScR9RDCX95t5b+aK4Oh5pJm5Y3UosLW9+ilrwXwm5W+awbUdhfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
