Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7194EFEFE
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 07:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D5810EBBF;
	Sat,  2 Apr 2022 05:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C947A10EBBF
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 05:23:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acDtFvfTJEisL2Dhx7JarTttw1v7RLPKjr/iema8VW6AOrMIiGGfTQqq6+zv+BU1eUdUk3BdBctYEkYfp4gDSGFzo2RKBiZtvbMIsm+kKe41ysq2kDiupwzDWJnSSBA3Gy2fA8Y4zGvfZkTE+hrYRjbvLyM8ZiZxHtQwlbMwidh5zK3UcAy6rhE83hKL0exKesCQeC5k/fbBsef1Ws8IA/hTTcIlPwKKqmz5S41BrppjWd7+Dk17LeOgV1UyRTqsglRpoFje5w90ZTpNoqEGiERqL722VCW148yndtx8XTiBimCP5/DpIMH34ZZ01QtI8pDy7YqEU/zOPKi4jBEBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QMNrjHkSzPkfgPuClD3OGPsGuNeGuSlP1cKorrZli8=;
 b=N4euGZm7yf0USDRpM90POuLyhowuD/hPRtOmPum1kiOSeLoEKfMHZNQf2le1A0t3gwyIf4VEXJMxvvcGfez8hkHx13Jsm0rDdqdeTaZFktui8ubsXTG0wMSIXj3vS/N+p0S58LisN+5ZY4c49hmtCTdYtMGJ9ev6mbc/CrH+Q9mRjfqFwVbomUhKJmNXoOwPDSM3IZvKEel0bGkBk/WNF3WW8LFow/0oNcGrj6vCwo4YDh2tmY60OHU1f+VsrZADN+zuCoS8EABYVAdTtOs7VlwmttEbQmgaU8xayj1p7IeRgzvkRsZdUYtRA5batprLWc+75zFXfLGx0370FvrwrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QMNrjHkSzPkfgPuClD3OGPsGuNeGuSlP1cKorrZli8=;
 b=Mo/faPxyHhYDtgG+0O7mPJ6lo/rFv+QX5Ir8SOTEMrZfhhGJ2nGFKH5+Esj1rEQET53+T9KBGqRVQNphGouSgsMqL5SyKzMlDcxMwBxGIXPlS5z6RMMQL0BfkLN78T8Il0Z3OjIJM+TdkNLoLobmv1SIm/lcbxYi62h318Sk8VM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8750.eurprd04.prod.outlook.com (2603:10a6:102:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 05:23:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 05:23:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 resend 3/5] dt-bindings: phy: Convert mixel,
 mipi-dsi-phy to json-schema
Date: Sat,  2 Apr 2022 13:24:49 +0800
Message-Id: <20220402052451.2517469-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402052451.2517469-1-victor.liu@nxp.com>
References: <20220402052451.2517469-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29da1dc8-4580-4e84-1640-08da1468f048
X-MS-TrafficTypeDiagnostic: PAXPR04MB8750:EE_
X-Microsoft-Antispam-PRVS: <PAXPR04MB87501B6700AE193DB8F7CE4298E39@PAXPR04MB8750.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3j87+0+hCjeDDnjcn2T+8KxOaXQ/DdMF9sS39TKv7T5Tjg/Q6U/r1eTB5ITWORyUbG8D1fim+W625scfcGazyzRC3ABbLDy2FqTEX3hT0hjTB4z9RcqGFdElRf/Vma1HdeMrRFimzV2UQEuR+4wxwBLjq0CTqWDFHv8j9AbnHtiADPsBYv9/bF7GDmqyreHIVgHJv0uvF2Gt+bZ3WsES1XFQl6UcRxasib8CeBbqn/RtKu0kSVHH03Do0q1Zu9oJo1lo3vq6I0DLGW0nnzc4z0ijgukPQQ7yu9BBEy1HQXWfNZpBS6lkb7btSGhNXiFRbvjdnD2M87MF9+K/XoFaopQOkHBAkEwd1JbvVnI82NXYp8KwxvLDW0+TOTGIpfOukJQVbA5ZQYR5IOBo/ZoHpzEbMQTmLGDRjmDpi5NytYaRGJ4Y9y3Ws5CJU3AH4jVsaLCbabpLk5sujMJGg13iHvllH+43SRXi33pgqqugyAB9dJEHJw+zeY86BtGwQRoLHJFUVjJxmuKhPyxWQDvCtb+EwXDVeUC9r7pY1nhL41Zx3zFSIZMEECcse7pJxtyl2pCF+qwGlK58F8KNGVT6H+jG0/YPBZpzSd2M17YmuGVNgKGNDOEVmPlCFBQ3XAEbJ6fs08bifG9kydCl0kjYWvWCEmxkOA/Nf3YTVjMhNjvnxYPMHX2EtlbEglT0FTgNoEK1TpcxzIkC2H+iu6wsU1Aeu8Oq3GEsuUZ/WlBKNLBv0FFpmfMKOGjG+LZDQVDa7R1QQdi38MemQYcuY8e78VGWCvD2YlIl4j/eGif0BRUdgZYGsuuXo9iAWgdSRFM1WxWicdHhSSL5J0VgHkQYCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(966005)(6486002)(83380400001)(316002)(6512007)(52116002)(186003)(26005)(6666004)(6506007)(66574015)(1076003)(2616005)(508600001)(7416002)(8936002)(86362001)(38100700002)(5660300002)(38350700002)(2906002)(66476007)(66946007)(4326008)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTNBQzlkQ285RmgvN0F6dUFBMm5TRU9ib3JtUk9xZnVGNFZYbktMSk50cCt3?=
 =?utf-8?B?NjhEK2NadzZMd01rS3lPVzhHNE9RTnN0aUdRdVQ0OWNaSng0RFFCTDJsTGlK?=
 =?utf-8?B?RnVwc3poalVseXJPVWtqeVJzakVhdnJuV0diY092T0s5Zkp6QTBwWEpjdjF5?=
 =?utf-8?B?UkRiRHNsZHFpT3FWQ2FKcnpFTmxlNHlGcjZPRlpoa1hKWG5ZOE50d09RYWxG?=
 =?utf-8?B?VTc5TWU4TnJ0VWFkSzF4Q2k3N2ZkV0dienNkdk82dUs2WTYvY1ArRTBjbGIy?=
 =?utf-8?B?Qzg3SWRERXZtQTNsQWdGT0NvRzZxaCs1QkxEMW9FZ2FtTGk0UnVGR0F4V2tG?=
 =?utf-8?B?SWV6dDJaNlBTWkw1NkM1elh4cG5WQWFnc1FOKzIxWFNvcGV4bVkzNm1mOE1r?=
 =?utf-8?B?UGw4eEpWWGUrcktjUkswL054aGZWeUFESzYvMDV2bXhPM0xMOE9YcXlyN21G?=
 =?utf-8?B?MVR3N1BLQkZFT1A0d3pHNlRtaFpJQVl5S1lxanVwRVpqbUhXM2o0VUw4QVBo?=
 =?utf-8?B?ckd1b0RqZFRLSmdLS3JUNWVLS1lCUkUrNzNzRVVpN2hyY1lNTUF6c0tVQXd4?=
 =?utf-8?B?NUd6VDFhY0pIdlEwNGcyZWpqY2RsRDBNQnpXUEdrSHBmSDhoMm13OWw4TEY3?=
 =?utf-8?B?R25YblFpbVhvRUc3SUpHbjZrcjJIT1RFa3BSRkxCaFRieWVPNlVkaUIvOWFB?=
 =?utf-8?B?UUpUd0NMdVhhQ2dmWnl0ejZFZ2tYQUdtQTdLWlRWdlBvaFdyem1QUWxJOGFG?=
 =?utf-8?B?bUVzbkg0TlVnQllYQ1FxcURIbkc2MitWTDNyYTdyYitOU256d05tZFZ2RTAy?=
 =?utf-8?B?MHQrazYyNGphTlNZbzU3NTNBbnJ5QUpRaWNIR2JCaUFqaVl3a0ZQTFR0c1FN?=
 =?utf-8?B?RFNDd2p3MjJWL2hRVDQwc1lXdVhmMjhDTFZRendMekZtSlVMeW42ekwxTktP?=
 =?utf-8?B?WXlBTjhhNFlnYzFoVzVXOThrQXJ0OW10c0x6QWxCck5zWEx0VDFrenVaS1py?=
 =?utf-8?B?b0kwRHhqclZCWVlVdUlzR2I0TFBsU2NVN3FXUUZqUlFpZ1ZSL1U5dENHTXQ0?=
 =?utf-8?B?OUFqbHZIT1VjUUZSRHBFOEQzYVp6a3Vjb2tVdkFYTXFxQkZuZm5wUUJFTG9m?=
 =?utf-8?B?bXY2TWYrVTJYNlIva3JOS1FGNkxCbG9SWFBiNmpCMTdtdXVNTEcxczA3LzFM?=
 =?utf-8?B?UVJsUXJIZ28zRmU3NG1NQ0ZsM1lNMnd2QTZCWHgyQ1JKaXUrc09acVRxendX?=
 =?utf-8?B?MjBlWGpTS0tOd1dRRnh2bU9KR0YzdVZqN0s2aW5jT1FiRm5LUDlhZU9PcmVi?=
 =?utf-8?B?SEc5b3ZqQ1ptaWhZdVVrK3ZwSU1zb0g1cHVGZ2NpZmVvbU56UmtidDBjQW1m?=
 =?utf-8?B?Um5Ec2Z0cmltam5YSWEvTWZ1MzA5RjN0RUhBOE1KcGRjbDhEN1d5SE40VHp0?=
 =?utf-8?B?enRnTVhsN2p4aUYyTFcxUlJpa0d2UjY5MGtuRUQyODM4RlF0d2NiVHZHRzdJ?=
 =?utf-8?B?ZHF4cjJKaXhWV2lXeitvL2x6TitFNjRVcFN4UW41RTZVUUhIUmFldWFiWTYv?=
 =?utf-8?B?dkN4dFllRW5zOG8rVTdzZ242NzBzRmMwMlFCRjJUcTU5cUl5K1lPdlVNNGsw?=
 =?utf-8?B?TTFMOThDMldrSXpDSUVISGhHV2dSYlFXR3BwN1dmLzR2WWdRd2tsM212cXlD?=
 =?utf-8?B?SHE5TGM5ZVFJZmpVeVdWMWVzVXpmQURUMnBiWUt1RUtxajBkYkJXVFhsQmh6?=
 =?utf-8?B?TndOSmVvRi9EbmpEY1d4KzBMZVRWRHA0TjRWLy82SS9QbllOVDFmUlBGdnB3?=
 =?utf-8?B?Z1JSY0hTMHdKTmxYYnNGeXdrUnF2K3krT3NPT3ZMZ0xScGpoalFWZUFSWWxX?=
 =?utf-8?B?TmFJcW1OU1JYZUZwUWkwQnMwZEpDKytibVVsNnBuQ1pFNnhLZjYraGx1N01F?=
 =?utf-8?B?aHBLS1NEeHNLSXRiU3dmc05tazlvR2JYVHpWOU5sRThObGRJcFVLWUNadVVI?=
 =?utf-8?B?ZmEvS3pTYW5oeDJBTnovbDRVQXVVUzg5Z1JONkRubVJxM0VXb1VmN3J0MGdz?=
 =?utf-8?B?ejh6TkJmY2hOQTBjNnBDdWlRUFAwd1lTZ3B4UW4reG1zUVJic0M4aGQvNi9t?=
 =?utf-8?B?UVdEV2YwanpCT0RWNGZ5ZWlPeHVzSUMwRk1FUmwzZEx5SGJZcDVFTDdnOEJy?=
 =?utf-8?B?b3Q1clkxc291OUZiN2dzZkN1RnRwMHlWQ3NKcHk5cS9PN29MOTU5UEIxMmIw?=
 =?utf-8?B?bHZQL0lPSkN1WFpPUU5BdGpwWXAwUXdTbUEvbnNrUkM0VEVCekI5SGJxZit5?=
 =?utf-8?B?Wkc0dlAxMmY5aVpxbkNyS2ZhTHlNNlpqSEFRMytlbmphMVlDN25EQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29da1dc8-4580-4e84-1640-08da1468f048
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 05:23:36.9957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UO7g9EGPaD1FJHRvJC6qhJU8EzQotgyoBJFIR/pCD8FB+A3zDwH0Vuy48xR92eBIdAobkECP6RkvlxTLbBkpgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8750
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, narmstrong@baylibre.com,
 airlied@linux.ie, s.hauer@pengutronix.de, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, kernel@pengutronix.de,
 robert.foss@linaro.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch converts the mixel,mipi-dsi-phy binding to
DT schema format using json-schema.

Comparing to the plain text version, the new binding adds
the 'assigned-clocks', 'assigned-clock-parents' and
'assigned-clock-rates' properites, otherwise 'make dtbs_check'
would complain that there are mis-matches.  Also, the new
binding requires the 'power-domains' property since all potential
SoCs that embed this PHY would provide a power domain for it.
The example of the new binding takes reference to the latest
dphy node in imx8mq.dtsi.

Cc: Guido Günther <agx@sigxcpu.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Add Rob's and Guido's R-b tags.

v2->v3:
* Improve the 'clock-names' property by dropping 'items:'.

v1->v2:
* Newly introduced in v2.  (Guido)

 .../bindings/phy/mixel,mipi-dsi-phy.txt       | 29 --------
 .../bindings/phy/mixel,mipi-dsi-phy.yaml      | 72 +++++++++++++++++++
 2 files changed, 72 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
deleted file mode 100644
index 9b23407233c0..000000000000
--- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Mixel DSI PHY for i.MX8
-
-The Mixel MIPI-DSI PHY IP block is e.g. found on i.MX8 platforms (along the
-MIPI-DSI IP from Northwest Logic). It represents the physical layer for the
-electrical signals for DSI.
-
-Required properties:
-- compatible: Must be:
-  - "fsl,imx8mq-mipi-dphy"
-- clocks: Must contain an entry for each entry in clock-names.
-- clock-names: Must contain the following entries:
-  - "phy_ref": phandle and specifier referring to the DPHY ref clock
-- reg: the register range of the PHY controller
-- #phy-cells: number of cells in PHY, as defined in
-  Documentation/devicetree/bindings/phy/phy-bindings.txt
-  this must be <0>
-
-Optional properties:
-- power-domains: phandle to power domain
-
-Example:
-	dphy: dphy@30a0030 {
-		compatible = "fsl,imx8mq-mipi-dphy";
-		clocks = <&clk IMX8MQ_CLK_DSI_PHY_REF>;
-		clock-names = "phy_ref";
-		reg = <0x30a00300 0x100>;
-		power-domains = <&pd_mipi0>;
-		#phy-cells = <0>;
-        };
diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
new file mode 100644
index 000000000000..c34f2e6d6bd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mixel,mipi-dsi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mixel DSI PHY for i.MX8
+
+maintainers:
+  - Guido Günther <agx@sigxcpu.org>
+
+description: |
+  The Mixel MIPI-DSI PHY IP block is e.g. found on i.MX8 platforms (along the
+  MIPI-DSI IP from Northwest Logic). It represents the physical layer for the
+  electrical signals for DSI.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-mipi-dphy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: phy_ref
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+  - assigned-clock-rates
+  - "#phy-cells"
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    dphy: dphy@30a0030 {
+        compatible = "fsl,imx8mq-mipi-dphy";
+        reg = <0x30a00300 0x100>;
+        clocks = <&clk IMX8MQ_CLK_DSI_PHY_REF>;
+        clock-names = "phy_ref";
+        assigned-clocks = <&clk IMX8MQ_CLK_DSI_PHY_REF>;
+        assigned-clock-parents = <&clk IMX8MQ_VIDEO_PLL1_OUT>;
+        assigned-clock-rates = <24000000>;
+        #phy-cells = <0>;
+        power-domains = <&pgc_mipi>;
+    };
-- 
2.25.1

