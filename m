Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E061F500660
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 08:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A5A112098;
	Thu, 14 Apr 2022 06:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30066.outbound.protection.outlook.com [40.107.3.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C751112098
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 06:47:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5K9i2OmlZJqsqQQKFBWNLQf0/sPIg2RxE6T0/xv/lgOTkjPrnLUTABsapcob7bi7iNbyiW3P3WWBJEVhDYd6G957BTseP2nzKC8GnUHxzyPmNIzdXEWDF+ABmV6H/mBcSAM/h5g5ioqJpfJU7mOzqilbiFuOZBJcr71MGercmDjN2D8zWb4hpE2P7jUkHVzc0xLYi1ISEG+NJ9H0tM4ElL+Kj++L2UDLHqy1hGklfHj5sbOqpLfxb5QVSBTdjtk4exAp2Pt+VXFZgS9DRTprYRmmsYf4qc3RdbWxeId/c/wRhmS+1DQ9kEHDaITCrvyR/hCNuQjxFBJu3u+/Ro+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1NQuLWQmGo8PY4g1WlzZd8VjCk1WnNjcOgPsLF3YTU=;
 b=Eoe6nkA3U8wA3xp8o1W+yLFbk0eseZGACqp5CIaPVDw2yMeHSAY/J/XhF5eRFWtrO02ra5+CGmb6cIN3C1qNzzwwuYxdl4W2UPTLwM99hT81drPs3DOvrSDHP63W/BJ1//fiiUfSJUmJLENZym7o/Q5UnPo3oCmJWIHVzxBeeijX05oJzv0XOywP7Eew5N64DEIifbYWkdFGf2Po30VuDZcVKSAwIhRe/aOoz0x5bZb6wv9gsLdjOJ/Ldj3OWti0SZRB4oRl04EA2pNEMBt/GVFJhVOB+fGfu2oRDtoO05jjlF3+jzvjz1h4zvrRph9/jI+CqSjGIJiu4fgC/vzuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1NQuLWQmGo8PY4g1WlzZd8VjCk1WnNjcOgPsLF3YTU=;
 b=R5mGTerrcBOZsPccJ1KKlvIGHtTD70yl0hqqTFmECkydbJhM6J/nhh9S3W90LMz/VAiktb/fRZ+uCAxB6aLF1GMMebn/J1Q07qvoCZOX7UpisBQhyPxUkgU/q7RtdhFVCKkHWUd/PGstf8yFDp7ybCREdYYp4ZOwjUoLq6QBauE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB4744.eurprd04.prod.outlook.com (2603:10a6:20b:5::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Thu, 14 Apr
 2022 06:47:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 06:47:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 3/5] dt-bindings: phy: Convert mixel,
 mipi-dsi-phy to json-schema
Date: Thu, 14 Apr 2022 14:48:56 +0800
Message-Id: <20220414064858.405096-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414064858.405096-1-victor.liu@nxp.com>
References: <20220414064858.405096-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb1a901b-4c27-45fe-f14d-08da1de2ace7
X-MS-TrafficTypeDiagnostic: AM6PR04MB4744:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB47440E3DA0ED60B99D8B235998EF9@AM6PR04MB4744.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3OjWEkhC/qyPAwg1Jhm3gHT4niLiXVkxAYgE5NT1nA/iR6L7qkNbsIjqdxci0qP82d4L/WmbeLfj/oQqzrtlskFW1WQUYXk62kvL0myi3f8987bMIrc1Lslgcpck6M2OiFoAoDFVMNGPDGQ2PKWdCB0kimeioynQo9eBLO3jszTPmizqsCkSPzte8D1YCczRsEPFJKH8SgwiS5qg8LylaloOH6JjorZ/58lPhn+JIBkWtITRRY1So4n/djC10YX5sIOte4AWrOMpXBAm82YwCHU+nZ3b9zEhp9gnwh5GhHSfOpBKuLjLjQVStaT2aCgQLbwpapkZOqPtlFbixGxtv5JawPdwXNlBcri9qxdHFOi6uFJ1Due7PyIau+KCV96olRqrzotK2REM00lTi+xkw+IKN2OEe0e/AFM9p8Q7g+/MVrwF/wNWY/68rBHFc8petcwzDFsyHtdf/ma13dHJfd7iYJi0UdTk1Y2aekiZlOWriuMqAY/8cskKbgjomgTay/Tr4CTnG4u4Qf+6EUXpShsr5893sBNN9pET7wZBSBsMi4DRV/WZETMG2m/dPZO3Cj8stDM/CHTVRIBr2C4UG8OubINXQzzkIQR4CByXHPmQPTS5sX9CQatFhvgyHPUXJoHKYb+oQM4sNvBcj/mn6qfjOEaRl+KsF0Qj3qFGBv/dh/+VbfYBlXmpCVYkuyNp+UMXmvjyChUUIk6WF1M03iCB0SrDpKEK/FPKs1V9+ySwF9MaavFDGUJpkX/So5pEhx+GQnD3OTUdQneWz+LDfTglk7eBT3+TvCsi0av9MnLQW/jdmBQ+3uruKqbvW+o6Tl6PewxfiMbkfPJKdC7aNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(7416002)(36756003)(38350700002)(8676002)(5660300002)(6512007)(83380400001)(66946007)(1076003)(66556008)(66476007)(66574015)(186003)(2616005)(6506007)(86362001)(4326008)(26005)(2906002)(966005)(6486002)(8936002)(38100700002)(6666004)(508600001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWwwYlN0NmZxdW5jeXpUMmY3THpxS0gxcnZUYlRWUVIya3VraGxsWnI1WEJz?=
 =?utf-8?B?TzBvczR0NlhrV1NNY2NlTlRmNTNqRGxMRC8yOEZjOCtkRVNWb05nMEd5cTFB?=
 =?utf-8?B?em5Wa3YyTXMwK3NZL2lzTHVQd3ArWW83QlliRXdVdGNXNzE4YWN4VW9IVlVo?=
 =?utf-8?B?bnQ4SVNFTFhSMnNGbHNIa3dRYlU4bGw1Y1lsY3hlamlnQkhDYWxiTUZGL2Iv?=
 =?utf-8?B?Y2dKeDBqbkNvMkpuQXM1Uk9CRkpZUlAvS2F6ekRLR2YzbDkrcml6STFwaXRv?=
 =?utf-8?B?aHlmbWJpd2pLRDN4TWRBeDA3UmQxRG1MWFR4U0RWeEowSHlhcmlSSVM5NDk1?=
 =?utf-8?B?eEw0QW1EZXhDR2JNR0tON1ptdnN3UEc0a3ZJTExYWC9ER0xmSFhBNDlaZXVG?=
 =?utf-8?B?VWNHcDNnZWJ5d1FBS1hIbEpQWlVLNURMSTZyanR0bkVJaTJyMGt4VVh1cnFV?=
 =?utf-8?B?aWdBSEpoZ0F0WUR0dlEyazM1VHJMTHdsMkZ5Q2I2V3BqK0l2THNZTWk3bVp0?=
 =?utf-8?B?SDdGWU5OdTA4eE5UbE1WRVpYcFptMHJzWUlMbmVnRWw2STNhYXFRa3NEaHg5?=
 =?utf-8?B?eVNpWHM1N1gwME9JN2FZNDRDU25YWEFHbGNMTlJkR3BrTnRWRmo0bnlIc1Fj?=
 =?utf-8?B?eFVnZnN6UkZXejFXeDhwUDlTRXd6dHczS3h1eEZrSEQyZE9lcjQ3YlRoZFVz?=
 =?utf-8?B?TDFTSWJYWG5tL3BUekx6cGNESE9MVFB6OG5OVXZpQlRGd0VtMVJoZmY1VjlG?=
 =?utf-8?B?ZWdrcFJ2bm82ZENoYldzcTZXcERmaGFVOWpvN0ZTTTAzR2xhaUVVeHo1L0Zy?=
 =?utf-8?B?VGpndjdEMHh6ZVRNMVdOTmJjNXFyOU00SjNaNWZJNlZaVkdtQ0VadFZSdHdy?=
 =?utf-8?B?RlY0ekphQVRYazFEb2luQUNVLzhvYi9LaStIZm9nODVZNStIYVFIOVcyR2E1?=
 =?utf-8?B?RlhLYURjTWJSYWo2aEJDWjRpa0RscmdWN2pLWnpxRWRicDdFNUxPV3dpWVFn?=
 =?utf-8?B?SWdiKzM0QkFROE5Tb014SGErVWJLWmtzOThGbTZnNUpPR2RpcE1ncEl2VGUx?=
 =?utf-8?B?RUExTksvNGhESjdCRnNCVVlXSkdNdDFORXB5Q1Y0Q0h4R1lCbnk1bWpQZ0Yy?=
 =?utf-8?B?T0tmb3J4anFSNlduNGl3ZSs5MjZUbEU5cC9EY3daUEErR1daNUN0Q2FES2t1?=
 =?utf-8?B?eXBtMCtxT3ZWb3JOaDJCS1ZOdUVLWkRmT21DdHpuMXk1TmJxK29ER0NnSzI0?=
 =?utf-8?B?Ry9jTG9lQXhHUWg3ditLNEoySk5BV010TE45SXZmRGQ0RjZLZ3JvUkRBWmRh?=
 =?utf-8?B?R0xocTdJNW1tbExLMVlYNzZvOGJodnhzMldGbWFOYU1idTBMQnYwRXY0Q3d5?=
 =?utf-8?B?OGxqelV4Ny81a2hKWXVsWXJtY29yY3NSWFNLVzNsZ2tuSGUvcFpQV3hpUDNH?=
 =?utf-8?B?U2E0NTd1dUxEU3ozTTdxQnhLaCtQS1lQZ0ZCNUFyK2dqekJDS28vNTZvYVc2?=
 =?utf-8?B?WG5Cb1cyUFAyVkZ0UnZzN3dCUDN1cE5kUUdIakg3TzR3eDE5TFhnZ0diRnRB?=
 =?utf-8?B?S2ZEdHYvdDlqYkU0bTFOZXFUVWdNSHJxbDNnQThXaFJXbzJTVldZZm12REF3?=
 =?utf-8?B?elRXSGF5QVNjZmlkUnFHRUYxTFFtb2tyb25zckplb1RjNTZXVXBvaktLOHVK?=
 =?utf-8?B?aWpKc3pRSVhxNnRkb2NQcWhNcVVDR1RPTlhIL0x2dzhnOWR2bVpPQ1FmRnV5?=
 =?utf-8?B?Unk2TFptSksyb2pEcm5ETnJtYS9YbG14ckJPdGtRSXZDWW5nQWZlY29Ud2xi?=
 =?utf-8?B?Sm8wZkZZY08wNTNnNldFSENvMS9aQ1dsd0ZLbnVOZys3MzlIRndJWHBIMXM2?=
 =?utf-8?B?OERJSS9WakVhdWU0eFl6WDRlbnlQT3ZENXNSTDBJOVU0YmluZUw0RHIvcGdT?=
 =?utf-8?B?ZDJKZzdlQkFTenlnVnkxL3FMa2JHekhHcWQwT3RqaUFCUlZveGNGQ1hnRnZY?=
 =?utf-8?B?LzNRT1lXdUFmSGRTcGp2Nm5DZ1ZZTVdqeWpJaG9Rb3U0TVJqY2hQNmxsRjlI?=
 =?utf-8?B?M1I2cCt5aEkxOUZkTkh0L1BwM1cwMnJ4UTF1S1YxcnpoenNGV1g4WG1PYndu?=
 =?utf-8?B?SWk4TDN4RHpsNU5BN0xtVkcwOGo3MFNrSW1VSXRoeEl3dGt4eWRHL2ZUM2ZO?=
 =?utf-8?B?RVY4dWoya2FZVG1IMzh4elZWRGduU2p5eExRYWtjbU1oWFJDTk53djhvay84?=
 =?utf-8?B?L2haY3hQRS83Y09YSjR6MzVyK01YSUxtampRQWdqRitJS1RVTG5yTHNZWlY3?=
 =?utf-8?B?dURPTCtLeW5lQnIrSGNsSmF3dy9xdVpPQkJTanl3elpDMmxSbkJ5dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1a901b-4c27-45fe-f14d-08da1de2ace7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 06:47:42.9385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+2K5ux2CfGwFxZTJGCfi3krU73bsw85h/ik1OZwbzvAst6ChUgRxrzAicmVcwwovjde4fX/JZWNJlujPF+ASA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4744
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

