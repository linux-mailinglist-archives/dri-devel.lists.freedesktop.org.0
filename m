Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4E6211CC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5896410E43E;
	Tue,  8 Nov 2022 13:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2046.outbound.protection.outlook.com [40.107.105.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A780A10E43E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9v3i3ZNmuqhTQPGjxTnI14r3S0Za9H/r02zZx6m3qQX1T0I/vFLP9yL63P30g7No5PR1eJVmOl6fitZBT+1M6RgXNsgrkJKZXvYY6CyvdyUoilNjjuUG/PJFutoM1JTb39MLEbHtXfpr0cEHnMFBaGqgIvFuie2CcOPejPj9OB+dwGmBP8A0wTI3UmGaT1CkSVZChsY2vF1Yefg6lVSkTGuj2wUotxG8mN0kx2f874TDTfIqjBUyywpKUXYPbfCF/otdlxSPRRpmMK7QQEZprs/uj15EByYzOCdsJ+HMPcOEVOmvjyHWjqn9kKPbk2bFEgc1ZB4zA8aPoutqUkb7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBzHYuVATvY5Xli3z/8lVrnSUVNhhck3spwexg6xfSQ=;
 b=EYxMCvO0rBXu8AyNv4XnyCgFiVkLvo7DYIHod1yJMMSadPJ2aYVMg1aRJztBsbTULMnbw3e0+zSyn4ShkEeDOkcmQabTIbrCldcYFxBu1/jkjuhTPpDFrIi81N/O03bUOE5EH7keWMgWsz5P94CJI7te/4ix3ZaDDEUsrN6WWCnJK+ZQuFYHsooqv/Y/JvApwPCmHVxSV002Ofhxh1fFVoqv0qtJVkZcPPouTWXkqGI3a8WZHuSGe+TMW/wkiYBXsy0/92Npfsnh1sRctn0pJd6TiPohlxXushwbH00t3JNJ6chHPZ8niYsOBY/C+Z6/wfJcvO2GV3Ysu50vfGZAJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBzHYuVATvY5Xli3z/8lVrnSUVNhhck3spwexg6xfSQ=;
 b=I4dFg9Yb4CGqM3gkM97Bh38F25BuMB+/O/oTPkRnBvtY+gMf1NjAmo6iScHVl2JMR2b1JhrBmlFTTsPHpul3FjL59Yh4Fb+Y6XXPtL0K+07go8lOStX2zv6F8P/z1IlFryRQa4qz3AHjgEdCq/HgYowh9FuzQcacWDZzAsvxFXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB7059.eurprd04.prod.outlook.com (2603:10a6:208:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 13:02:04 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%4]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 13:02:04 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, vkoul@kernel.org
Subject: [PATCH v3 05/10] dt-bindings: display: bridge: Add MHDP DP for i.MX8MQ
Date: Tue,  8 Nov 2022 21:00:08 +0800
Message-Id: <71c504aeb11f55e9dca533cc1b490b8e069c7b7b.1667911321.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667911321.git.Sandor.yu@nxp.com>
References: <cover.1667911321.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0b7377-cdb9-4d7c-70c5-08dac1896ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VLXuy2k+gPdnGp65unYrJB0wZ8WrSTVO55HJQb5agEpPfGtZgXE100wB532sj31+BV/STGRFkptIDK6CmkV5Q5DqMdp5/xhofiMxK4XLF/2+3bxInDiyUEv/+6nZt7a/geYarhDEBribXH8V2HXqMa0RTqTgWbIWFnTOEQh1bZNyjiY/ZM/Bu3T1fEExGF4r8xmxDO1FhPNs5m15DkjJzhlsyeVEkn3HmaXvx6W5Jqa19mdjQqNUAlh1CD0zIrj7bblfQF9VWBCDTSClO86hi74tm4EWkhQtqasOBDOg14GG755KXfb6gntNTvrmRikI4S/18373ybXKGFKn31XVeXbcAddg/79/LxcMyhOnN6/daNZoMaSUEH9KDLPsFSksRqsZSUIXtLiKeeoQULS8pYfcpTC1Rb1KBqIYdXtC3RebgQ1zbfR3LdipiiIEq6FFYkvZ6rXoqehlGXp8mRwQPhiHqldpOOcRDGPYzfAp0h9N2MhD4DOkEqxkyMSlkOHBrZNIM18j6xoIXahAn2thYe+XN1X40OI7Q/CPYzD3iTbwnTxv6PboIqULDVt45e1aqkIxfSIABLX0p8YBHZLKig7CeYluT/9E9+MsPwrsDRKPqikyiEK1OB+m0TK++hs2kxvPTcK4b+Fzos0Kn7j9VVeiqjLtSKlQz0C1APHXea1dTATGlV3+vdxcRi+Qsw8W3vFs03iQ27y6+mYamDMvfp5qKJ6oNbugDSEQgSXKW16xuWFML+imyYsmRQKg04FwpK5bgh4UVro9+O6FgsoMSMznnxfN1M1AYjTW9gQOJuJP5zH8rLZO7evZhZKDSVh2cMnsTYOOrBkR1h2funfGoeRj53YA8b9keSEXLf94uWs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(86362001)(921005)(26005)(6512007)(41300700001)(478600001)(38350700002)(2906002)(38100700002)(36756003)(2616005)(8936002)(186003)(7416002)(5660300002)(8676002)(66556008)(966005)(6486002)(4326008)(316002)(66476007)(83380400001)(52116002)(6506007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fAdIp4fZ1N6NydPCCRrQ7rm+I7nfEDgMwnOfpfSL6PEZEFZw4p8Kwoo8MPLB?=
 =?us-ascii?Q?WJLjCPUNAz9IE28aa0ZQ/eACi0DDaskyjwAQasoH/KlIC/U1Z79O33iL9gLc?=
 =?us-ascii?Q?Ax6z7mGpiU/mO4A8fa/xHwJL4lDburfsd6JykM+61Lv8Q5i55WTe+PPylgCw?=
 =?us-ascii?Q?JR0waWkh28rBkeQPQOTxzSUJSHRX6vG3L0pUN8BndB54wR1d9wXgamDm4DgW?=
 =?us-ascii?Q?EXgkybKw1ODY3HWylXo+qUBYm9dK9tYrfHzYYPRzky9MUEviR3HX5SwD/xm7?=
 =?us-ascii?Q?oRseLIpLWLOjrbr0JucD5PcKWj2be1mHDOpZPjwjl/STKIENuVpEMIo27R2N?=
 =?us-ascii?Q?BfyLgCc09XFXmxJkyZVjA9EiJf/uKgU5zkmE8z9wklEuN3F4J857SFuI7mRd?=
 =?us-ascii?Q?NI3tiorxvXDNpDDCSN1gh8i5YygToQ9oUlhnb8vGQR+XiYgwSYldGGDH8nzg?=
 =?us-ascii?Q?fvqJPjlh6cJByr6c4CyTx7y5OzQ+1QTTZA4KrfuvME/YCyLOpeVKUPUbz1hh?=
 =?us-ascii?Q?qDbOVdsxoy/AM2zJEeyeVbBR8DR2zYjR5AHFw48xc/jkoMzkpMJD4PdTxFGr?=
 =?us-ascii?Q?yDyzHXX/28NNpjm6HjLhyeBsNPbHlX5bwz0Zp86lR4Z0xaaza8MG3b9VGnKC?=
 =?us-ascii?Q?D80BQtl6/AdvNIIwO2w0Nu9tl3RX+chRW5xAyxX3Jn0+I5T22sb+m4k8gELZ?=
 =?us-ascii?Q?U1pVKrNl2oLTdZBMS4qitTvmBrxKmnQtdLHZKbse5WxP80qGa0O3pXDA0Gk9?=
 =?us-ascii?Q?XXySl2U/142Y9lmecdcPiunq+x/tudBJEMhKxRXJqcBpgsqfyRDiASYE58PK?=
 =?us-ascii?Q?F/Dzo4Lc6lpzeuemGhK2u1NM9hPfuYr2D01/TDt6Jk6AkQ3DZa4ob0RBkUiH?=
 =?us-ascii?Q?3OIn8rbkhfG4ejQpjOOZJGSDMncEwiMxkc+rE+cXMEC0a+cF/yx9B1L/JUU+?=
 =?us-ascii?Q?WhBnlj9n1a945XnAfnkGgTCOP/KARz0q8DDNIpUOLZKnzqEl9iZiylk26eAz?=
 =?us-ascii?Q?Id6Iu8Hl7xyUcpe5EySFT57mRePToPwLB1kVHcK1oKA//ox349wsixy0XWNy?=
 =?us-ascii?Q?S+r1sbpbAI6MWPygk+GPj6oLYAddxDLvT/Arz/X62EcoDMbMzGR8Rrp5TH7W?=
 =?us-ascii?Q?veBe+us0q11+bXinvbdJ+dAfBKzMKQxK3F904ZBUNUrhWJCNq7PCtJdFjPBs?=
 =?us-ascii?Q?ejBbqPLzCb3UZ/1lGiT5IRA6VKY0Qcc3Vr18r1+XgX7mgsZbeAF9Lcr320Xg?=
 =?us-ascii?Q?MEjk8I90NrODhsVXSDRaf7BS4wOKi3PTmV3WrzFGNW1pt1I0y8DUWdlo6ybE?=
 =?us-ascii?Q?JSXW7sItAVHjpmlobAXJLmwVfgecs0RGEt7e0rZ8Q+7x26xG1VOXXye1Bdyt?=
 =?us-ascii?Q?Dg1DYOv6BZdyKAhHFaYm+o1dQ4KI/dlNfvWFUNHAPxdMnVfdPym5ZtUBOCAa?=
 =?us-ascii?Q?HaWBI6J6md+lgh9DOfO1A6qmCDE3iQXw4xrrJJ7eEMJewFE19FONCHFTlp5c?=
 =?us-ascii?Q?VnZUveCZQjOaEcyxdZHqg/LSD5csfNA9LYiYnBM3/3e6tflNplRbo2mwsB16?=
 =?us-ascii?Q?3DvVwZbxSN9/nh6nKi+bbgBUv4W1Hs4vRUaae3eT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0b7377-cdb9-4d7c-70c5-08dac1896ee2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 13:02:04.3390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7688D0SnH2K/lVPP8HqzCus9J+Hcr7AgdXwoDeaZZGduiWZB7jl3o49qM20SKvMGWRAdRBruAUOam+1crHBfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7059
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 jani.nikula@intel.com, tzimmermann@suse.de, s.hauer@pengutronix.de,
 javierm@redhat.com, penguin-kernel@I-love.SAKURA.ne.jp, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Sandor.yu@nxp.com,
 shawnguo@kernel.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for i.MX8MQ MHDP DisplayPort.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../display/bridge/cdns,mhdp-imx8mq-dp.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
new file mode 100644
index 000000000000..c4d5362db2b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp-imx8mq-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP Displayport bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  The Cadence MHDP Displayport TX interface.
+
+properties:
+  compatible:
+    enum:
+      - cdns,mhdp-imx8mq-dp
+
+  reg:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Hotplug detect interrupter for cable plugin event.
+      - description: Hotplug detect interrupter for cable plugout event.
+
+  interrupt-names:
+    items:
+      - const: plug_in
+      - const: plug_out
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node pointing to the output port of a display controller.
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mhdp_dp: dp-bridge@32c00000 {
+        compatible = "cdns,mhdp-imx8mq-dp";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        phys = <&dp_phy>;
+
+        port {
+            mhdp_in: endpoint {
+                remote-endpoint = <&dcss_out>;
+            };
+        };
+    };
-- 
2.34.1

