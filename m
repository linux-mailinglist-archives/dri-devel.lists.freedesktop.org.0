Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD5506178
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 03:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B8D10E1FB;
	Tue, 19 Apr 2022 01:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A71810E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 01:07:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBfCidynRtAwbJMstiuDkmscrWPNZ+X72vxuFD3M32pMu9ga7Vn570hM0oWCgkAk2J3ogVhh2MBcyQo8ZDIXno3mb46DuRUgTf1qebblfSnFmPQgNW5WpYLlNa8PtMOHpGEL5OOcdOFwvFp42jNjFUvzfUFczGmmwSBTXSjivzDL266McyS/ThwNja2BG6gnq5sRLGntF6CUPm1cjwj6Lq0xQh/zCPzkD0y1CwTBsqh9KCArdMfYgJihAdu3IIEX9n38TIFtcjRQdmk4wK3QFXyerhjyht5hRjqSlsdnMviPDSejgFWnE1Crpae8zvCgTCbpGTbjTHqaRbl3eqZ9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2oGElILzCk+igiUTrOVzfcg+9IEz0ALDeKTJRlftv0=;
 b=Fezq8evn7PGTALQGOq8cdhU2PZhZkMXUO3XkqkiP+5fqgAUaau/n4Dl5rpbnWpAxwwcIRBvyq5fsRsm50kmIzxvu0pgy4S8JsBtF9j1V2LOpPYj83sEsLmiy5Ma3ebL2If0icEh7ySwOkxC5GwisXfBS+sXr7QNOcmiGQYAO3F2blSXIxvlnqCJC+W5FxmAjbxke+UwK0lpEDakdBeeyIDHR1n5M55sNl5M90wq81d9fJGME+BtwG9Ljg4XZabD3c4AJho2lznVB3CUHMOpNF17K7An8Q/QOSRFDzS+w8pJo0WBrczu6r41Few8fFODRiZxtVvMK/XbWuZT1IbevDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2oGElILzCk+igiUTrOVzfcg+9IEz0ALDeKTJRlftv0=;
 b=OdjNptzfmi6MnV//wOORAI6uycLJIMob+2GhwnEv6GUu5tmiCysita+I8Wte1KFZST3PMlX2OKvAYDvlkO6q7G/Y+2C5TrsIa0J3xzjtMn+U3tD9Hw3hKNCA8Y/XnqsbLyJr55FFrcxK75ZdOsaXoOcplR24D9IGoGOQ9WHrDnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3291.eurprd04.prod.outlook.com (2603:10a6:7:18::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 01:07:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 01:07:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH resend v8 3/5] dt-bindings: phy: Convert mixel,
 mipi-dsi-phy to json-schema
Date: Tue, 19 Apr 2022 09:08:50 +0800
Message-Id: <20220419010852.452169-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419010852.452169-1-victor.liu@nxp.com>
References: <20220419010852.452169-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b3c89ac-798f-4b75-79e4-08da21a0fa4e
X-MS-TrafficTypeDiagnostic: HE1PR04MB3291:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB3291964549CDA215B8E76C4998F29@HE1PR04MB3291.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMWmopOr4beyiq2RJzOTb6KUZprCfaoEnzh4bs7RhhsJ2x7cMN9otIfbfJdzRjfcKkaTAx43L4UYC+fTr8/iGprIsQPFtnczlbZjOAgfCV/ztZSzfpo+494owJbmDZyM8dTuSxB8wn4ZvmevjjTrWGjPOkM8PqkJfVoOOdpoRMBSdRmDG2A7jZi62Z5w7tb53pTInrCd/yfXm8ESZoK7FewtaiNktsFvvc2/CHQ7kbfue4k7Z3TsH/yxFoToj0a55f+7rYq20rYU1fMv+Yy27jRn2P4q+TfXZAGKCk4tHw/WmH+M4g/4CWeUU2wdN9sjvHWD0gHja+PamXQp1JcVWCr6OpCi0xlD2UWeyrYdqWmW19TR0JmhjrPvJfPLeXSA60eYF9y+hQHnH/3wxQC9cG0lDDzba0C/7GogQ5tPZrxO07/XJ44xVbLzMN3hNpKDAgZpaVOvs04REm77BggacJBqVng2TthTVxWEfTPJGTlnjuz7B+dpEzbwljtwmggGmXqESmFEqhkXN5MjqaNa2Ggih8cuA01VxGjiBGxr414AJn6QQsnQcRyB/qtF1CUGuMSntPPdY+St+UMPZyR0J29AJy8jIVpD2w/EaDzT2tIkOQxPzRW7h6ALc7Nac5BilZ7eL6QT0fotokZdE1xp7ctw4C/mFIdegqpL5sBvFmbLjEITrNKuctsIsrkLrCSdvA2231v6nXgWlM00ibRCH3CReiTgsDSS9CQkHnIFpZt0j9EeQWQv0XXaO56DghqQ3r4s6TQcSb/swaJygWMEOgPUNKJwGBVUIBBOgxJiTFlgOpyuJa8GN6JPS8dYr0QHA+uGaa3iv1ZKUvt3Czy6yA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(508600001)(8676002)(4326008)(66574015)(86362001)(966005)(6486002)(36756003)(52116002)(6512007)(6506007)(6666004)(316002)(66556008)(66476007)(2906002)(26005)(186003)(83380400001)(2616005)(1076003)(5660300002)(7416002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGthOVJRMCtsbUV2c0QxZDY3dCtYa0J6ZkwrSmg2anErUGxnQzFZV1M0bGJL?=
 =?utf-8?B?aHRGRkN5b0prK1lqRHJzOStwM05jL2F3MC9pTCtqb25LVHhZUGZLWWMwdUp1?=
 =?utf-8?B?N1FKS2IvL3BaeURBcmlxZzBmd0ViUjVFZEVrR203WXZBT0NreHBhOG82eDU2?=
 =?utf-8?B?TDdTb2tuTVc1dUt1TUZpcFRDcDRpcFhMUnpjSWhhWU1CN2U2dXB6NThFcDBl?=
 =?utf-8?B?YTdFMG9MZDdyalp3SzRHQUFUU04xRVRuMW9hTUJ2S2pmWjBSS0ZjR2p5SC9H?=
 =?utf-8?B?eUhTeFkvcVVQNEtyY3l1WjdPNFZrR2NWRFFCTzNsdzJwaWdQN2g0UFJubGRs?=
 =?utf-8?B?TTI4K3oxRHVFNE1hRXd1ZTl1RW9JNmNaODk0MVpqc1hYMFkxWHdHT1JQSGht?=
 =?utf-8?B?V1lSRjhPTnF0ZUM5UVczRDROVW9aLzZST202SExoRDJRQ3lYWDhleUJmYVRE?=
 =?utf-8?B?RjJvYlhQcTBVQVA1QW9FK3MxcVBYQ09VNHc2UndxSFZENnVDYkFSQnIrbjVk?=
 =?utf-8?B?eWpGZ3RMU1RpZ2tLWGlieGpDU0huZlN2U3FOeWNPMUcyVG91ZkJBOTlmRTdD?=
 =?utf-8?B?bVJpQXBKdHliK3RaeEZHQnk3anpySVpsNmxYeVBDRHV6cmJwTlRseVZWRGE0?=
 =?utf-8?B?eHcrOFhtcFZZUVM4L04vd2NYRTN6c0xXcG9uM01xSTNzZVJxdEpOclVFL0RQ?=
 =?utf-8?B?UjI4WE1qQ0pvR3pZTkNnTXZUdzh3QnkrZ3NJcVZBRThadlRqZWFHeERHMG5k?=
 =?utf-8?B?MW1PSFRqaTA2T1g5ejRQOFRtT3VCcm1aYmh0UnNaTzQxOEhwSForclk0ZjlE?=
 =?utf-8?B?ejJRWnJnVytXVDVoVFNzVHRxMVhWVHQrR3ZRV0d4eGJucUZPdFVEbTZXZGVj?=
 =?utf-8?B?TFU1Rjh2RmYrYVE2UEhZNi9mY2E0ZEd6ZjUvU0RyR0dZS1IvZFRoZForYWdV?=
 =?utf-8?B?cWowM2xDbHYzQnU0bURCQ3V2V0V3ei9Hem9NRy8zQmZWQ3pOdFlwY3NVQVQy?=
 =?utf-8?B?a1VCeG9tSkx2OXAwWUVpdWVFaU9YclhnT3IyK2JlbzhQbUZhMkZUK28yVjJV?=
 =?utf-8?B?U3VWY3FiTlJlWHJpd2llUGJsNHM1bjhTK2FWdnY3aVFlMkJ4UUwzM3c2Kzhy?=
 =?utf-8?B?VGNnUEZLTnpVSlVmd1lRVlVhc2lxWXpxSlJQK0ZiM2VGSnh2cmRpUmpFSi9E?=
 =?utf-8?B?R3daNjZ5YmRVZzBadmp3anFPeFdGWWtMUFpwZmRLMy9wUFlRaERYejlIK3k3?=
 =?utf-8?B?UStaOWc3bkQyVHluMjhYU2diNlJudzJyWDBXQkYrV29FQjRIeS9BUFpiR1hL?=
 =?utf-8?B?QXArQjBTNlJIWkczN0dsWUJ6a3JFNGxQci94T05jYjFQeEVUM3pidlpTNWFy?=
 =?utf-8?B?bGpWaUtBSEcrU2tkK04ralEwYUJBWE5NaFpkbGpOTWNnTFpabk5EQjNIWG9l?=
 =?utf-8?B?Y0VLV0dkbkpKR20zUWZtSUVTSVFyaUdNUkJ2QWNNbWNKbjdoQmJQVysrczRq?=
 =?utf-8?B?UTMzdTdrcnFXUjQzeEdBQ3dkdmI2OEJVWWhMaXg0RjRuZGRMbjhrS1dtb3Rx?=
 =?utf-8?B?Y2dkQ3QyYXFSSjE1alQza0w3RUd0d0JRWGRCNVltQlRDc3VQN0haWGkvR2lF?=
 =?utf-8?B?VFdCTjdZZythYzV5UldVakp1anlrajdia0hjSW13dVBHVnBoRmk1SjhrM3k5?=
 =?utf-8?B?TjdKSlRRdHFMMVhZbEhibmEvWjN3TU1wTlRrWDRiOXZPL2FhaWlQaEVUV1d0?=
 =?utf-8?B?ZzU0NGxMZGpJWDMzUWcyMm5ndVpCL0hucjI2NSs3UnhxenhVS1UyUDB4Ymh2?=
 =?utf-8?B?MmVTVzdXQUszWHZ2VjhMcjZxdEJ4S2VTeXJnN1NiS3FCenFmWjU1KzlGaFpH?=
 =?utf-8?B?RE1LN0RUYy9peXpoU3E4a001M0ZERDAvY1VtWmh2M05ZQ0NiT2pMQ2FzZEFu?=
 =?utf-8?B?NmlqeEp2ckJoTjgzd0ZoMlkyblZxSDg1WFZEMGc3L1BBc0RNbGJMNmZha3Z1?=
 =?utf-8?B?ZHhISWZRa3N1clBacXBMMm80MnhFQmc1c1JidlFPbENQaWlhZTlraDAyK1lT?=
 =?utf-8?B?ZVUrNlAvSTB5cEUva2dUQmduRmhQVSt0ZHMzYjhXdkU1aVcvZjhaRnNjaFc4?=
 =?utf-8?B?Y0ppbUh4dGExdk13NUFnYmtrd1hHZUJ6RHpJcEtQNUxxMzV5YytCT0x6Mk5o?=
 =?utf-8?B?RTA5QkdhZi9NR2JPcS9oWjdORm1BemZMcE84Uncvc3J4VTY0eTBUWFZock5t?=
 =?utf-8?B?RjgrWDlSemdWS2YxWWhpcHJEZWFpQ1VEQ1FmbnFGUnBYN3JuK2lKdmt6Smpj?=
 =?utf-8?B?VVpJQzFNZmR5UktjY2xSMkVrZi93WlFJNFJIaHZ3eks5QmN4aS9ZZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3c89ac-798f-4b75-79e4-08da21a0fa4e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 01:07:30.6789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DJXPlal7BcBcVY32rlFx1lzH2vGFVWK6/RQDOJST+m4xMZGbAseZ70jJVAbIWBUuvwMN2jBXyu9LnXbeblQ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3291
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
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
v7->v8:
* No change.

v6->v7:
* No change.

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

