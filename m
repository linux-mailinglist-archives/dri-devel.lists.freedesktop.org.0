Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A709DF927
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C602B10E40D;
	Mon,  2 Dec 2024 02:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dkkL52TH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2051.outbound.protection.outlook.com [40.107.249.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D5D10E40D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:57:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBP1vhISjf75gEsvKqLwi2dXLpPNF5NK+0ljvvJveinclBtiBq3kC85qIKIGQOPD07WfNXh4HIlS/saSVeC1fZQNJB8fi9nf3kK3Zeh1LfwUY58Tr/krWJSfBWdApnfbJYM2r0SbajYWIAacbcCV+Y6XAwguBB0b8I4KwBnT7/JktR7M/F83kdebJ6EACSBnG73AMi3MfcXFNgxqUiBYjb1JPMdJCgcF+8VzorkycDWIA/ozkIsv9GkzcrjLIiTn1S2XqPl1i/vJo+zve+m//a88oSxlUVJ2UmdCAWv9vC4Zc+LPrfelAI7tjBkXwk6PKUXASQdP5Gc7Mud3Qy4Acw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TspDlAGAo547NwgAFno/jIClDZr2pKfdfxf0JB2YyAY=;
 b=dpxqVlzYOHtjr3A5mpt+2NcNRYUlDZ9aauqwTc1BcpvBwIBNn5+kZT6M9s3X67xRctfPYcmJTnHOcuq0z3rGfI3/7hwmh3iN1HFhz0UN9d9dQlg7MHjuFAmdv0bznzR6CWRG3u7xoi8r0Ql1ArwBMCDJSGx6vDoUvSgj+4Iq8iL2G9kA8aZlYUPU6bj48JCXi6GGtO01f5LVdCNyX9iS6yHQlf/qp3UlIVhgM7SMRjFP+Df1lUSd7SGTI+8VOWXjVh7bECMIDn9hIv6lJDM4BRgt3CH1eFhPIPzUpK/YWFDDE3sYr7twsM5EBAJxmWf/D5AML7J4EqP0CkPDMp7p1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TspDlAGAo547NwgAFno/jIClDZr2pKfdfxf0JB2YyAY=;
 b=dkkL52THqoHBfFhQZwABNuPimaZhNdqGR3lH8D7IF6qOV9KxaomdpasOXQbcKKhPsjQcm2vvqQw+ZkWxpaZm42YHlVo/SR1cRoKpBxV/NCdJuNn1DsjqDIUG2JsewlKDCQBrjTs3rmUU4PVKaYoYKvDb7JQcqAToA9Ck/ipEpRWFLOIypMadUe2QDSTxNJPLOi3Fi7rESOu9avfvuCUHPHanNIR3cifCi3r58eXx3ZaKCyaAudh64OogwCXjkYVfe6fD/3MuJ0dTQqB0YPMt60oM480pgc0rQeqke3eE304ZphqLoBf6kLMEGu+qAuJv8YJAc6deojNk67Z9U6TMlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:57:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:57:20 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [PATCH v5 07/19] dt-bindings: interrupt-controller: Add i.MX8qxp
 Display Controller interrupt controller
Date: Mon,  2 Dec 2024 10:56:23 +0800
Message-Id: <20241202025635.1274467-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: dd0d876a-9f76-4473-a7d9-08dd127d0983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TlORTwG9O1EHYsfuQjqFN9YbW52xEtoVpnIa06+fPUvKESp9Hs/lxvYCHSW+?=
 =?us-ascii?Q?de48k68wkL6K0zCZypyfwTHogOB+Xm2wmSVunbUECQ31b516z9hGCsh4S7d/?=
 =?us-ascii?Q?BG0IoyE+wLDHfCjOi/80aaHMRAIeZo0A7+5S8FepjUXygDtRCWwgaY0I0mkL?=
 =?us-ascii?Q?fNXvdxrpWggpDvcBNw3HUKuMEfoqaIXoKEdz6KBFjacNao8UcjTxCWZ3amfY?=
 =?us-ascii?Q?9Xd8FyMRlB4lnTCuZ+PgJHpmijaTvU2ulWoeQoiAPMwW7uqfkudJaNHOTeEp?=
 =?us-ascii?Q?eInpTdlQp6AhO3sUh8sCYJ3bWCCdwdgPmjGNb+ZdGoho6ca7UAkP/DyKYHIz?=
 =?us-ascii?Q?EG16SioKQNHHdb9DYDjtKFlsP69kJMLsVQHuELrUYFz/fmF6xu4ikRWi5Fit?=
 =?us-ascii?Q?SKBSAbp5h+Kq4eoWDqmVIun62J9ZxRL6UNOoNCdqzzBrPpdM4n9F7I8wGL0z?=
 =?us-ascii?Q?VPDdkBayypmkd/Pvp3tRMASaHNokVWvAvkbXEQ+C/FvmbwM5bEG/YK9It3FU?=
 =?us-ascii?Q?1MtRdROv8L1QtbnNIZT4aG5jOP49GpxFET0a7FDvRcE9s5Ke8HwK6Ywfha3s?=
 =?us-ascii?Q?R9CebjU+ABoHNIv2K2FjKP5Ofl6tzZQBSquTStmeNc8eEgwXXpyPPqQ5TMCS?=
 =?us-ascii?Q?QEQ91X8cUA/i46Aesiw37o7IkaOcRPVWqSGfR3/T36m0par7l8rb3oemwuON?=
 =?us-ascii?Q?Z2FhVGuoXOWuUup9t5bRlEePi07M4wPVg58x7OdLYfJHjnpHtZifEXgZpdr1?=
 =?us-ascii?Q?xV8rA8bNyZ6fO2j29j8fs/bQuGNNOrxgp4tL6KLb7ZMCHK91aCFBYcdG+xOt?=
 =?us-ascii?Q?jI+NytcmgeKiEYbb6dohmPLoYC1c63iZDYfcxcOSNfjbeaCLK1hmVxzzLOwV?=
 =?us-ascii?Q?dvY3MwPidn44DCkPTGO9Y31m0UGRZn53ZPGWS/J25s5kiHlOM4apkVPl0Kik?=
 =?us-ascii?Q?IX66B52BEEVD9kH4bQvR032AtdnnA+EFQyZpUkLJdRTlPCwOPlLFkU85LE3k?=
 =?us-ascii?Q?sJqFTPkP5NwLPmDXr5lP3bGn6wc4CqPXoqbQIltbuoQFhaa/Q48BPSrURkPW?=
 =?us-ascii?Q?YNg58aqpz7pSSoU0WLyc5To+DdBEjoCQHgyxAoAc3Ex69A76SRK4jq6tTmRS?=
 =?us-ascii?Q?ug4vZ2fHtb327sdmfQr4S8jwFzMUw7zH8JvCpHa6NYGN694DCKAv+vYjLbBx?=
 =?us-ascii?Q?mL/7YrJ4rx0N8LXXzWzrV+5v/LHvOvniw8JH+hbef9g3LacAw65ZIrxQ1KKT?=
 =?us-ascii?Q?WxSf50S9voVXWs3AYyhhrUC6LOEkG4s3HIBjgYblIn1jaF9XvnggTzQHA812?=
 =?us-ascii?Q?3wCdsCQNsFjIYniaK7eZTddNA9d/H9HPI4AlWIizZ0f5F0XVunVu0wEhXdmm?=
 =?us-ascii?Q?bPOtpZ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GfXQzSK3UdfePD+hMU3stZW7frki7Lj4uojN1Vy9lr9MdtJtwU7nj7B/KYNk?=
 =?us-ascii?Q?veIMc8y1zcINcCZIT3ufha0SdNXGW0vKilEM5jh+0OXorkCYb+iYp9O/5fK+?=
 =?us-ascii?Q?aZmTJNQzC2II/ja7ZPsQ6GtBu+ZlzKx7cVqeFQtyLorwc7aCi1Iq8okAMmG7?=
 =?us-ascii?Q?/v0fseKGws6Hl4IyYOrZW2NtwPMNukotrib76+LChPZNmypFuWExkzmEZywd?=
 =?us-ascii?Q?NsDOiTG2xaA6/voO0UNTn0TKV27JnLn3kPZtZH8vGTrS35ftz9ga9kXlho51?=
 =?us-ascii?Q?8beu7UY9j7fZPfxCPoKsvJq2lp0sP8xTg2kltSBLdlN/boAInHh0qgzaFD5n?=
 =?us-ascii?Q?gVZm4QkT5xSzLE1rG8uv5Vgru/7iHkrcccomEh4HXsvNYsg8nfQDOg2DhVZ8?=
 =?us-ascii?Q?HAXzqqVPlRC8kM9cCjDEi1oRzlmgiEXVKBqxCULm2yWAPhtj3QYyMcBhElk6?=
 =?us-ascii?Q?6hkeVZfGTR0egQabNKUHsVbDeZTAWv+pIF8bldL7E2i053PLLNMAXukFLBeN?=
 =?us-ascii?Q?2pX2oWSmySPReLKrF8i8jdLQIq1r1L+NHA9kRuG2bqRlEdGEBIDE5icw+io6?=
 =?us-ascii?Q?EGK3ox0PkZzAuWRmPv4zrGNHEKRS6E1QoNUHpQ9rekq3xO+86UARFJC/h2oZ?=
 =?us-ascii?Q?3XQWuloA+JRrii+QG7bBkGyd5dBHp9DBG7pUoiNlVR3AtIrZYONAnWoeXWi5?=
 =?us-ascii?Q?uRPftxhYYXxfW3MZdB1iFuYTrzUSu0wtPwELntRpiUUPRWVYYn+3VLFAocwR?=
 =?us-ascii?Q?N9WCPGoDqetfJm9+hw3PpD4rEV5wGpKkmh2IgnrOyAzEd3l79GSKF1klWjXF?=
 =?us-ascii?Q?ih10h23ldvqY30swPwsNLxjMx5suROgtKtn8Hk01hTFszFNoW4Tekbs7Kqjp?=
 =?us-ascii?Q?k+mGhDZdKkViqYU7tIuUbS7kg67vpwup7MqGkcsYxa58dIuE4gjsc6Hr/dVX?=
 =?us-ascii?Q?f2tV5IBBdGuGlUnwEqvXR6ebeTRM6oBcq5sGd4W8/tSgqoq+ebnYw5CYTMov?=
 =?us-ascii?Q?3Aq/NXOoB3D8oK77AVkakdh7hwFyeFIF/GKxIyYzxtFYmTBWRt+1Lg3f4pu4?=
 =?us-ascii?Q?adfquScwmndqWVbX0dsPznBYx3wfovCiy0s3HtNfY55U1dgB0vCDpw2sO7bz?=
 =?us-ascii?Q?jaz9Pkvv71UdCrDebTlPVd++sdBuUAm228n0l90GHLeGq1Q1PVUAXSFJEZLv?=
 =?us-ascii?Q?RdMFed4uNo+mhfbsJOc3A5MM7tE3UL/xQIrNSzegB60xK4+ERV3eGDR288AG?=
 =?us-ascii?Q?V5zP62g7CA+mdOqjXIWdI5icTUFTVB+0HvbFX9KA9fd0SXkalh9X/GvsDWJk?=
 =?us-ascii?Q?DMgfh+k2uKEeyUzV67O1pOsCwOcrrmzv4xVzdv4zgOVX3X998YbP8cbkC6KI?=
 =?us-ascii?Q?snWRDy+09TCmSctaZlRtETF9F6hYW792AvCWR386t+9X97ed3uGgbZPJU2//?=
 =?us-ascii?Q?g3CIk89XwtzqwxY4ceUZbE247dyF/IxK8FJJ7JwxJYB9MytH8etDkN/dC6ND?=
 =?us-ascii?Q?0ahfmwmjYlEJl1HI59tEiUBHhYyVmUxvfcxxIGyUWMYKOikiDkdlM9EbTOiO?=
 =?us-ascii?Q?Jjw2ptGOLXMmt1ZLjXL6x/7lVjmygTSEKr54dHo9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0d876a-9f76-4473-a7d9-08dd127d0983
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:57:19.9603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15N4/5NnNomLBsrfHCJ2qcf7NEjVXo9XAsUupJyO9q6hpkvB8IdjA71mkidn3L7wqJA5mYdrZFX1lbr0rUdI9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i.MX8qxp Display Controller has a built-in interrupt controller to support
Enable/Status/Preset/Clear interrupt bit.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
* No change.

v4:
* No change.

v3:
* Collect Rob's R-b tag.

v2:
* Drop unneeded "|". (Krzysztof)

 .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++++++++++
 1 file changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
new file mode 100644
index 000000000000..6985ee644a25
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
@@ -0,0 +1,318 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/fsl,imx8qxp-dc-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller interrupt controller
+
+description: |
+  The Display Controller has a built-in interrupt controller with the following
+  features for all relevant HW events:
+
+  * Enable bit (mask)
+  * Status bit (set by an HW event)
+  * Preset bit (can be used by SW to set status)
+  * Clear bit (used by SW to reset the status)
+
+  Each interrupt can be connected as IRQ (maskable) and/or NMI (non-maskable).
+  Alternatively the un-masked trigger signals for all HW events are provided,
+  allowing it to use a global interrupt controller instead.
+
+  Each interrupt can be protected against SW running in user mode. In that case,
+  only privileged AHB access can control the interrupt status.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-intc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupts:
+    items:
+      - description: store9 shadow load interrupt(blit engine)
+      - description: store9 frame complete interrupt(blit engine)
+      - description: store9 sequence complete interrupt(blit engine)
+      - description:
+          extdst0 shadow load interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst0 frame complete interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst0 sequence complete interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst4 shadow load interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst4 frame complete interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst4 sequence complete interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst1 shadow load interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst1 frame complete interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst1 sequence complete interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst5 shadow load interrupt
+          (display controller, safety stream 1)
+      - description:
+          extdst5 frame complete interrupt
+          (display controller, safety stream 1)
+      - description:
+          extdst5 sequence complete interrupt
+          (display controller, safety stream 1)
+      - description:
+          disengcfg0 shadow load interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg0 frame complete interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg0 sequence complete interrupt
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt0
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt1
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt2
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt3
+          (display controller, display stream 0)
+      - description:
+          signature0 shadow load interrupt
+          (display controller, display stream 0)
+      - description:
+          signature0 measurement valid interrupt
+          (display controller, display stream 0)
+      - description:
+          signature0 error condition interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg1 shadow load interrupt
+          (display controller, display stream 1)
+      - description:
+          disengcfg1 frame complete interrupt
+          (display controller, display stream 1)
+      - description:
+          disengcfg1 sequence complete interrupt
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt0
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt1
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt2
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt3
+          (display controller, display stream 1)
+      - description:
+          signature1 shadow load interrupt
+          (display controller, display stream 1)
+      - description:
+          signature1 measurement valid interrupt
+          (display controller, display stream 1)
+      - description:
+          signature1 error condition interrupt
+          (display controller, display stream 1)
+      - description: reserved
+      - description:
+          command sequencer error condition interrupt(command sequencer)
+      - description:
+          common control software interrupt0(common control)
+      - description:
+          common control software interrupt1(common control)
+      - description:
+          common control software interrupt2(common control)
+      - description:
+          common control software interrupt3(common control)
+      - description:
+          framegen0 synchronization status activated interrupt
+          (display controller, safety stream 0)
+      - description:
+          framegen0 synchronization status deactivated interrupt
+          (display controller, safety stream 0)
+      - description:
+          framegen0 synchronization status activated interrupt
+          (display controller, content stream 0)
+      - description:
+          framegen0 synchronization status deactivated interrupt
+          (display controller, content stream 0)
+      - description:
+          framegen1 synchronization status activated interrupt
+          (display controller, safety stream 1)
+      - description:
+          framegen1 synchronization status deactivated interrupt
+          (display controller, safety stream 1)
+      - description:
+          framegen1 synchronization status activated interrupt
+          (display controller, content stream 1)
+      - description:
+          framegen1 synchronization status deactivated interrupt
+          (display controller, content stream 1)
+    minItems: 49
+
+  interrupt-names:
+    items:
+      - const: store9_shdload
+      - const: store9_framecomplete
+      - const: store9_seqcomplete
+      - const: extdst0_shdload
+      - const: extdst0_framecomplete
+      - const: extdst0_seqcomplete
+      - const: extdst4_shdload
+      - const: extdst4_framecomplete
+      - const: extdst4_seqcomplete
+      - const: extdst1_shdload
+      - const: extdst1_framecomplete
+      - const: extdst1_seqcomplete
+      - const: extdst5_shdload
+      - const: extdst5_framecomplete
+      - const: extdst5_seqcomplete
+      - const: disengcfg_shdload0
+      - const: disengcfg_framecomplete0
+      - const: disengcfg_seqcomplete0
+      - const: framegen0_int0
+      - const: framegen0_int1
+      - const: framegen0_int2
+      - const: framegen0_int3
+      - const: sig0_shdload
+      - const: sig0_valid
+      - const: sig0_error
+      - const: disengcfg_shdload1
+      - const: disengcfg_framecomplete1
+      - const: disengcfg_seqcomplete1
+      - const: framegen1_int0
+      - const: framegen1_int1
+      - const: framegen1_int2
+      - const: framegen1_int3
+      - const: sig1_shdload
+      - const: sig1_valid
+      - const: sig1_error
+      - const: reserved
+      - const: cmdseq_error
+      - const: comctrl_sw0
+      - const: comctrl_sw1
+      - const: comctrl_sw2
+      - const: comctrl_sw3
+      - const: framegen0_primsync_on
+      - const: framegen0_primsync_off
+      - const: framegen0_secsync_on
+      - const: framegen0_secsync_off
+      - const: framegen1_primsync_on
+      - const: framegen1_primsync_off
+      - const: framegen1_secsync_on
+      - const: framegen1_secsync_off
+    minItems: 49
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    interrupt-controller@56180040 {
+        compatible = "fsl,imx8qxp-dc-intc";
+        reg = <0x56180040 0x60>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        interrupt-controller;
+        interrupt-parent = <&dc0_irqsteer>;
+        #interrupt-cells = <1>;
+        interrupts = <448>, <449>, <450>,  <64>,
+                      <65>,  <66>,  <67>,  <68>,
+                      <69>,  <70>, <193>, <194>,
+                     <195>, <196>, <197>,  <72>,
+                      <73>,  <74>,  <75>,  <76>,
+                      <77>,  <78>,  <79>,  <80>,
+                      <81>, <199>, <200>, <201>,
+                     <202>, <203>, <204>, <205>,
+                     <206>, <207>, <208>,   <5>,
+                       <0>,   <1>,   <2>,   <3>,
+                       <4>,  <82>,  <83>,  <84>,
+                      <85>, <209>, <210>, <211>,
+                     <212>;
+        interrupt-names = "store9_shdload",
+                          "store9_framecomplete",
+                          "store9_seqcomplete",
+                          "extdst0_shdload",
+                          "extdst0_framecomplete",
+                          "extdst0_seqcomplete",
+                          "extdst4_shdload",
+                          "extdst4_framecomplete",
+                          "extdst4_seqcomplete",
+                          "extdst1_shdload",
+                          "extdst1_framecomplete",
+                          "extdst1_seqcomplete",
+                          "extdst5_shdload",
+                          "extdst5_framecomplete",
+                          "extdst5_seqcomplete",
+                          "disengcfg_shdload0",
+                          "disengcfg_framecomplete0",
+                          "disengcfg_seqcomplete0",
+                          "framegen0_int0",
+                          "framegen0_int1",
+                          "framegen0_int2",
+                          "framegen0_int3",
+                          "sig0_shdload",
+                          "sig0_valid",
+                          "sig0_error",
+                          "disengcfg_shdload1",
+                          "disengcfg_framecomplete1",
+                          "disengcfg_seqcomplete1",
+                          "framegen1_int0",
+                          "framegen1_int1",
+                          "framegen1_int2",
+                          "framegen1_int3",
+                          "sig1_shdload",
+                          "sig1_valid",
+                          "sig1_error",
+                          "reserved",
+                          "cmdseq_error",
+                          "comctrl_sw0",
+                          "comctrl_sw1",
+                          "comctrl_sw2",
+                          "comctrl_sw3",
+                          "framegen0_primsync_on",
+                          "framegen0_primsync_off",
+                          "framegen0_secsync_on",
+                          "framegen0_secsync_off",
+                          "framegen1_primsync_on",
+                          "framegen1_primsync_off",
+                          "framegen1_secsync_on",
+                          "framegen1_secsync_off";
+    };
-- 
2.34.1

