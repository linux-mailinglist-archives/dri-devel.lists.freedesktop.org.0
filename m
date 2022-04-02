Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80FD4EFE59
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 06:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EF210E0A7;
	Sat,  2 Apr 2022 04:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70082.outbound.protection.outlook.com [40.107.7.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3CA10E0A7
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 04:02:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGsD+ecFfvD2qvLVGyrfy7/SgdZIhDDMAsqRnSqr9mnnVjiAV4R3KWNsgF+kAP9zpv/6E3mt3ae2K1UDkF1coiPoph4xKzPM7NnVsCWS2E4D90LVm/D5f+EMK5IJqRveqOwcWAWAvA1b5eUNCeVTSkqOOsz/xyauvQFhzqCWQIo7PLTUcOSakuDYMUpgS7Um3uITRTRi2lGIteo0JBkNSuug6wmE+uOSgZ89G7sGoQMTowkfJALrkryTKioFY7omMjaD2zd33+AZRHztNs/oIbKJC9P9Drctpc3mXZ9mepHpA7t2nV2Q1RUh8LfZFYEQ+ggrIrrkxsR0pHsDWLvLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QMNrjHkSzPkfgPuClD3OGPsGuNeGuSlP1cKorrZli8=;
 b=UeSJL8s69I9fAwnqmJu1LCeFlQV+DE4msiEbRv/KXW0yu6OTuErlKO8emg1SZU+T2tO6SSERH+Wbdoo/wg+JPWM79TN/Q8mZ0PNXiMSG4/zAb41cgZsDERRFKjXetS5xz3D94LFAfNESBokZn/4CJmWD5bTNjiYgBq4V7Lx0QwAIgtUeeJPmSbJy50pUMkMZNT51nmjj2KNyZR1RhHpZ7Q/W2JMKBwdISdzqC7Wms5Nfvqi+QVga1j5OBog5/UU/RcjhXIQiCwKtB/ZVWpWmNH94U0t7AZzN742SO86u8sikytFJqNC4NfFKYbRIni4CiyiZwsQbWSMNE0Jfl9no1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QMNrjHkSzPkfgPuClD3OGPsGuNeGuSlP1cKorrZli8=;
 b=lONfzirIuBpPdAfEN3XS5Y+igA/jX8IdKPnTOpBkbds0gDs7ItRhCwEuf1pwaeqUlVLVy2N6O6rPxKy5Iug4CQuhlmh/LVVLxq4TpzUKmeyOzx27I5Dn4E3uNdMEELxp6IGqV9MbdoBCl4Yetd5LCUIO0f7cwxQC0GINTdR74ro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3210.eurprd04.prod.outlook.com (2603:10a6:7:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 04:02:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 04:02:14 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 3/5] dt-bindings: phy: Convert mixel,
 mipi-dsi-phy to json-schema
Date: Sat,  2 Apr 2022 12:03:23 +0800
Message-Id: <20220402040325.2465222-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402040325.2465222-1-victor.liu@nxp.com>
References: <20220402040325.2465222-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6e833b7-c1f8-45af-920a-08da145d9258
X-MS-TrafficTypeDiagnostic: HE1PR04MB3210:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB321048A4D39712FBE3F2844A98E39@HE1PR04MB3210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0q5Cadw5lKOfDLhUu08aUVsxyWIJUcA8KO+1B0q7vPsuBBac9TIQHxkGqU0258vwZX4vz3KIJn1gzmDQTJmFl+BkpctFUAv3ETcHXCe1X2xKv07VBKTRAgRRD4SlSUuxDI9PObddkV6xfdgaZTWL5duanZCWbWdoj450ih2kYnGPIW8zuO01U22J0vSf2AFDx9kFUtDaoIsFigAZxuCKTtWeLGTkBhDPCdTmpdkglRII3vDq+Msq/q+vRUDWLgzVuTTIAWLg0M5KjQPNwBgtahvMQwNxutXCNMscfShDT/+obMuWxdlMVPSObxKbjTCOqIqtgizPmTRBaDiC4PMlEks6+qjwlGklmcNiqmfjOTNDSUp8BdIZt0RqaBUtPADX3JcXMQgdEAVoJiFa2g72a2kUn72I85r+J+RgbWKDEwG3OjXj6qmZ7iFxdQwQW8q1CEJDruHOBDFGLT/hwO/nyP13IOrYwWzdceHJMHpI28OAC3EOZmlSAsi9t4QLykxamIGhv55KzInSb65S4kG5gsPNOTQlu5k16SHHQALV3XAQv7UrZtfzGR70IorJvkxVnnK82evhFhJbuPwRB8iTmI6F89qHSmSzKAJazhf2HM7Z7Um3H8WL7wGZ2qNQtA9JR+taLwKIFQkTIgVoS5zpqfHlF1VM7SA9OqQCOoLvd1dFRM3clpzblM6RRbaRUQJ+tOO2e7UOeb0n3GoLZ68W3vNV03472mr+5UrBa09sD7oQAFbkJos/1POUUT65T/ZFCS8enOx/H1yYnbLEzCn41kcYDIrUAC5lK/O9ocMmJSs/8bDV1RU+6rgrhQKlfHrxeHhHNNyNn71WzLFc3GvZRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(86362001)(6512007)(186003)(26005)(2616005)(1076003)(83380400001)(4326008)(8676002)(66946007)(38350700002)(66556008)(66476007)(38100700002)(2906002)(36756003)(7416002)(5660300002)(8936002)(508600001)(52116002)(966005)(6486002)(6666004)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVpNaGthV0dzR3EvWXZkRTRiQmlvSmE1S3NYK1VKV2ZKZWtpcHVsL0VBbFhu?=
 =?utf-8?B?LzZnVGRnL09MV3NycnB2eHgzWnFuNVFlM1hNNy9NMGYvL0RmcHB6NWdsQmFq?=
 =?utf-8?B?eEdNQWN2QjVqMTVpOHdiYWl1YVRkUmc3ZmlmTUxnSDlFQjZZT3pFdk1tSSt1?=
 =?utf-8?B?RGR5YjUrTWZZTmorYnlBQko2TXpPSmtPcVVFS0dZdlN2QTF2MWFrZUFuK1Bt?=
 =?utf-8?B?L21UOEZEbCtrcFQ1WEFNTU5xRGg2YkIxS3NwSzhHdmE1NWNJNTliRE1sbXMz?=
 =?utf-8?B?SEQzTVQrcllkaGlWRysyMU1YeVRsZDBOUnVuZjV1YlY3UEZDck5Xc3h6ck9D?=
 =?utf-8?B?eE9vR0xyeTVXRzNreng1aGhkNEVuNHB1VWVXblE1NWY3Zzk1anRFajBvdHAr?=
 =?utf-8?B?UVR1dWt4Y2xCcUFVbDdxVWhua1VEUFA0T09PL2hrOTRIb1FZVzBuV1ZVUlhH?=
 =?utf-8?B?bTVJUXkzNld6Q1ZjNFRUd1pNNkFPaUpjK1ZVcFhEUWFHZncyZldvUjhnaVpI?=
 =?utf-8?B?MnhnenB6VXRXd0tjNXgxekt1dHpoa1dvZmVuL0JMcGhhSnNtaGgwMGhoODZM?=
 =?utf-8?B?cEIrSVhwV28zSWtEK0VGTGgwWDhpT3R0NEw3VWJZNERHQ1lzT0hzOCttcTY1?=
 =?utf-8?B?Wm9WUlZsdWNUVy84ZjdpK0tDRTN4MEEyYTJtdVdZaHc5dVQ0bTNGSm9GdjlL?=
 =?utf-8?B?ZjhYeWxJSmJLaEhpU1lrajZEaTl3R3VkVE8rdVM0VDkwM3kwdlhSdVowMTdx?=
 =?utf-8?B?V0JIby9FOTM5MTJLbmVHdmV3ZGp2V2JwY0lYMFgzY2hRZVJ4Y2dVT2lzUjdR?=
 =?utf-8?B?MUxJK1NWeTVPTzVHOS9HUXk2OUtDV0JjcTBabWJyOCtzNzF2UUp1ZEJmK3NC?=
 =?utf-8?B?RlpBcC9kRlF0RmVnSmZVNjhvTzZlZnloUVp5L2NTdGFnNUNRb3VVWFl6NFU5?=
 =?utf-8?B?eDNuMXM5Y2VMNWxCR2lGQXFUUUkrWmN3cXlzdnJReVBDNVJnRitnMittd09U?=
 =?utf-8?B?VTVJcTNtMnFrdktFa0R1bzFuanB5U3kyT0hRNEhFbm1lbDFBck83dk5JV2tS?=
 =?utf-8?B?NU5KWjBmcklQYkZ1Q3FIcnVpZW9uc0NTWWVzZ0daN0ZIODF0QXpYU1p5emhn?=
 =?utf-8?B?a3J5N0FoeGZVYjZaeVpWOEVCbFJwK3BlM0YweFRMU2dldHZwSXdPTkZ2VlZr?=
 =?utf-8?B?Z3hLYmErNTl3ZjYwT0QyUW9RNlI0TnZ0ajFEOFlINmllM1JHYWx1TnY3MmJT?=
 =?utf-8?B?c3VNck9HbTVTUlEvcC9rYVhCQ2UvM2FvSmZZTWgrbm9pZng5ajZ0QitmekxE?=
 =?utf-8?B?d2NxazVTMEY3RzhNQ0l1WG5PL0IzVGY1bUt6N0M3d1pBNUVkTit3NnkvUTVL?=
 =?utf-8?B?Y0Y4djZUMkJNT2NvS1FxRlZzOUVOaVBrNnFRTGsrdGFvS0I1VExJc1BWSVBM?=
 =?utf-8?B?azd1WFVPU3Z0a1Q4MWxhbFRiTkxQS1YrVk1nZzU5ZTJ0Wk9OZ0gzVCtiZ1ov?=
 =?utf-8?B?MTJBSTEzV05wR3Y4cWlVYWgvc0h1RTNEeWVpd29qTlNTRnB1Z3ZNWDMvV0sr?=
 =?utf-8?B?QlI0SEZFSkxvQW9LQkxNbjVOc0xWYmZodGdmcWFmQ0o2MUZSRzJydzY1NFRW?=
 =?utf-8?B?aHlWN3FMK2NBajdFKzNhZk5yenNSc3c0UUNGRU42ZW8zcGIxY1RXSk9Ya25M?=
 =?utf-8?B?eTU4L0NneFNGeVEvVExpSFJCeWVpanRZV0w1dWU2c2hWemRMUjRCd01JdjNO?=
 =?utf-8?B?RDVzWHNTNVlvbEFPY281SjFlaHFNeHFEZkllUGg5NUxwYUQ4TFI3U2l5d3lj?=
 =?utf-8?B?NFlvODE2bDd0bUJrYnBISSsyTk9UWXF3Yk02SnZXSHR4WnRZMDl1Z2ljeHFL?=
 =?utf-8?B?SW1nRGpKaE5OSmpNK2w1RllUazE3d20zb1RJQjUzcmpGNnNBZWUwdXFXNVhr?=
 =?utf-8?B?bnJ5UzhLYlZxMkRlOFN5VjgySzlDU3ZLRVBFd09BWng2aUpJcTdHZVpWV0ZP?=
 =?utf-8?B?bmF0cFhtb0c5cmVtcDlOcUFMN0pIY0dFdTNrZzhHbzcxeDN1OHkyWHlFK2Fm?=
 =?utf-8?B?MVJBS3VScyt0cUNseklkQjJqQ1NyRWVnNGNkRXQ0dzRWNmdZTklneDdlcmJR?=
 =?utf-8?B?T01qVjBSUlFKbURYdXJrTmtzZjhtWG0rQ2Y2dEFRVWQ1OFpBMXk1OTlHcXpk?=
 =?utf-8?B?Y0FSbzF5WHpyNkdDQmFmTnhmMzN1S0dVaytzT24ySGxEZkRWSWkvcGdCemhL?=
 =?utf-8?B?bDhrOVl4ZmNiajAvUS8xZ253eVd1ZTJNN2QwQnlSS0hheVg1Mkk5MWpVeHVz?=
 =?utf-8?B?a2tCcXhZNzdPWkQ4eDVzTDE5U2xYalV5YjlMMUxzU1BOck5UNlNtZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e833b7-c1f8-45af-920a-08da145d9258
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 04:02:14.9262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikALJfQ7ktJHndft7duLiZ6sEDVZq0VWurDw+1ZIiyrD3gizLSyK8CCJSADFbZdDsuPimz7XHoNp3Hp5rDHjVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3210
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
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

