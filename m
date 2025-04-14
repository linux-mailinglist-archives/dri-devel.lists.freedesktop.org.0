Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DC0A87667
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD43910E45B;
	Mon, 14 Apr 2025 03:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Fw7jx5YQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A5F10E460
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:50:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aONHCKiZgKysVo7RPq49z9W0zu2wYh64GhUh0d2Uwot+aMhNQy1LYqFu0qkvKGgGePLQhAq01yd4q1BxDoDH9htchukqCBatyG1yncZrax3y1CzJ1bW+Un8BmUjQCRBLzJIfvVBPg5h7GpveDG0I8/dlBoCpZHWqyPXbPwbpPQiopHLbF8IMYHRWinhe9O1xBId9nuDNlP2wlEXScd2rY9xQ5a+GQxARa6j5KPkz9l+E66CLQ/QitGnOddMFrJtDL2NxXbMzr8C5nsqjjBFdxT1/f7uYckbyft+LMcr+LLg6kQZYLUt0H17dDnyHWldEMGa/83jbqRGIPLLuQKLAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WWnpkhy44GORsAcH4BvfMoZN2lBi1ZbIvaJ9rZ4Yn4=;
 b=KV4HwAZPlVnoOC5nQTkyPDrk/qoQqpQy/uYSD+aQxn+xsvyEJvr4rcIFaQm1VaUYfi4trg5ALXGCjuEzAgBD65rvuYfFH417gV2LEY8x+NRRkexpdmrU+U/zu3A0RUItO4RDkL5ZzT8Cv+ug6+RheiWQTySXkeGZyu0aVz3TNM0cQGVMr634USizFgVrHq0R7RX7Yy8F3AdjFoFUbWme/Hv8IgkjAGCa8+m66YDNEEXXDXUnaI4yc6pUM1ghnwyGgiZCzhqxlSXDe1cbM4ylBm8Mfkd5kwOIHIPS0hStNx7il/oJlY9gTOrVYgoGDe2WNvVzQmBQOc0tYTMtws4t4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WWnpkhy44GORsAcH4BvfMoZN2lBi1ZbIvaJ9rZ4Yn4=;
 b=Fw7jx5YQzLRgNzAJMCbQ3wYvNVVzRB5KgWDEf7LmDirjiySfw2a4HOli3LOr832UuInmtQAxdAtWYO4XMZxprlkhRrI52m4/r3lxakN5AEGMwdSdHEHcbtBR7PFy6Xc4kO1nCKVXYfw7tL/ha1ijxPnKQOIiFCBeQ9Sm5G18q1zpBu7eT/5ai7fLdK7KWjcaQLIvLC6r+bXh/SO+zkcQ61oHq4zN+zwuYMLcomYZZwdkPXOaHzJ0Y92dzGSPQticu1SG9ej2eLffmhAlxeZNJoOXo1fwOV73hscWaaG5VMNugtdcMKxRgqorJoqFsOMuZLpXNd0lNePDLNEts5++yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:50:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:50:28 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, dmitry.baryshkov@linaro.org
Subject: [PATCH v9 08/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller
Date: Mon, 14 Apr 2025 11:50:17 +0800
Message-Id: <20250414035028.1561475-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d946ad-59ec-40b5-5543-08dd7b077f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O+J8fUohTxKBpAZF8AbwxhhehHAcGq59iDk2UdVVLmWI9depWN75bZKX0Ye+?=
 =?us-ascii?Q?TaoyurCMyUSHI29DVeAAz8/ghhLDsLrsbyG4Y+aoKFnZz8Nt2n6E5kHV4JGc?=
 =?us-ascii?Q?jnKfBkw/k5n20+q46YEtAa0FGOF5jthBYVUqgObEnAE8p1V1oW70lnYrnTAP?=
 =?us-ascii?Q?ptm1IGUgHDXcrJlqhHO6eFkD/RG0I2U6NkhrmJJFd4LLgmdqRArY6unrOeH7?=
 =?us-ascii?Q?ZeyCMMZcL1VN4guZd0++wBcGLS/sjq4AT5+WtZDVL+8pbfSq727/kRrMTpbq?=
 =?us-ascii?Q?Xq+0bD4HwxUTD1StI6X7JFdOrdwib1jAxeAoi+1bbhVah4ztFPaZjfzdyz8U?=
 =?us-ascii?Q?NDuXFjyFmdUhJrhGbbHCvNO3jhw3KLNoRRfTmV7Tl+gsHKVNd9AO0X6zNJ/+?=
 =?us-ascii?Q?/gW47soG5K1UGgScMkr8QSXTqasg6XgfbL1fiUVqdb0Qnk9zueauO5Gy//j7?=
 =?us-ascii?Q?swiVEBBaH0aMo83n1Sdh70PYJCGer8LKheDxsAj4DKDoJ/0QumsRTiimlzUw?=
 =?us-ascii?Q?rqRg3UwmVEEzxGpT5EEEUkvLerPwrrzPKECPyp9hxzQNo23Wx4X2E1hmiVsH?=
 =?us-ascii?Q?aehOksT+ofyBAabE+IulQLDi1AL6VF1rkaq880RH2fbTqV0P74aWeqaWSeAP?=
 =?us-ascii?Q?fIV0eJV48cY7pmR83pvxAKWgdvHoACDOzgclhvJgc+pcdoI0vOiJmtMsbrkv?=
 =?us-ascii?Q?ZhwWXYcvh1EfwrTdYYBE6PlmBJqHuvhTtZHkh7TX0jnqchrkdcTEjmFFyhOU?=
 =?us-ascii?Q?J1WTz98OHGEMUUA62JeMeo4ujM3j8hMigpmP157Xc/Adq4CesxLZKlfPjzIq?=
 =?us-ascii?Q?uWcswKbiuVxm5LbZP1pOnKbQTXtYyxGb3AX9vhyXmxGo1pNJjXQ0L6utNUpy?=
 =?us-ascii?Q?omGkVz6ETcgrTEdHHVQGNU7PLEh+jlxfncAlhrZuqAkh/VRctrh04ows5b2k?=
 =?us-ascii?Q?y967dPT/9hQE2JpMjgyz3L8ZqjTjw/0FydYGevkKYIO14gGB3azih2zLjJRA?=
 =?us-ascii?Q?BpRniX4uFOBDaVV6mPhMHYuD7hWi8dWe+02ZAlBFCshqyZxFfL5GU8wtd8eX?=
 =?us-ascii?Q?VscyJPRjTXk1ksCPYMJcyPZl5+rKXRmJ/ARtBx1IOB/rshw1EyctZnPyJQsk?=
 =?us-ascii?Q?UWBm9PJkew/6p3InBvUdJIwKOWdSJvw+ZJvlKNgx+F2dVX9gJ5G2bTle6cyP?=
 =?us-ascii?Q?QUngzVSMF0R3nDrBjQ+7WyqLyLvJL4Fj91y6aDdTqulenrCLwtRSoXWBmevA?=
 =?us-ascii?Q?nO7HvrpRH6csHdFJe9qny63UPvIL7j6gPewSgZXR07d/jMclSe8pnQxB9WO+?=
 =?us-ascii?Q?zNTW6cd2+7TPbxcCXl6K77BgadRfFwVE4xnQSomu9UlD/xfEV/Y9HQ+fRxxx?=
 =?us-ascii?Q?9mz4EDMq7tlrg813OZtro4nbY9oPc+f4/nAawRfxUhQO4Xzt/g/+1SNq/EKU?=
 =?us-ascii?Q?I2H7t+4onwY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DI4VOPjHERmV+PP7v1lHd45nuC8EDyc53TVZ04PoDWJKdquKVKNNvEOQ4Mzn?=
 =?us-ascii?Q?x6IjRx4666kLhRwI5QD9V1deWuN6yKvaMpcTKgTnvoerBr+Q3EPGAZEOc7mo?=
 =?us-ascii?Q?XBruhe5BdGIwmFoRjymKmN2/Hr9UhVehUdtqKsiThhSh57mAJ8frPVlGZ7m4?=
 =?us-ascii?Q?6uTDmhbR5P6yamUVZIsvkZi3oXcD25MuDcgcbtK13/xX5XbH0p1liYW3t8fs?=
 =?us-ascii?Q?1RR/CiZYep8eslcnp0f8cy6EUGy8bBeHvL4YNUs1ppve3sjp3kSLdFdLE7R5?=
 =?us-ascii?Q?EMyRe5oBEu8GswYldos3jOacWneBZFPDbqRvuKRPwy7XnV/cccPCXsuuLzZP?=
 =?us-ascii?Q?9Mrlw6z7iZz2AyZh0OaKCZEpFAi2qVo2DWwxJc37XKq91t/Rflq5KEu2eT43?=
 =?us-ascii?Q?WwXAQOaX9mVti1OB8iVhpEIsdEKRiT+nEOwy8u1S6BGrE8F8g8ZjQm1Gh4rl?=
 =?us-ascii?Q?YUWzwF89qGJP7fsZXFF7MzhmYTBvqMibw6GI2eF7COsL5TmBVXc6fV1Nemwg?=
 =?us-ascii?Q?CwA+cyyvm7IZhO1lUfpF1+ifh9TXFQ2XIbGbu+Zx65EEMbN9SKvMwar33uwO?=
 =?us-ascii?Q?fBTmwDqq6lD8r6ry4WeZuTvhJ3ARW33W4I23aKtTE7q1WgP+SYW7SJ+j8kzG?=
 =?us-ascii?Q?Bplk/QBMjDHVTsBoTYD0uZ8LMynN7NBHimpZeVRXFO6/JV/rD5us/AW0K5I2?=
 =?us-ascii?Q?zbynXVBqZ7VTAso5S5GXQbJjrDUGjkye6wNa7hN7EIvnAZn2hrj/iQ9VMzDv?=
 =?us-ascii?Q?gRld8kkASDYM0mRSO55ElCRtq0h5fLdJ7zAZhf0l3UBLXwXMsjHontERjn3I?=
 =?us-ascii?Q?7X2+KND6IlFLBFolc4H7N/19FDos/jQSrH+eVYC3rGYSvUeQlDe0Sl5iqNyB?=
 =?us-ascii?Q?U2WnZpjpTLtTnfhQMb05GHTlN5uAtr4S3lSmC3WtCeljWHGFedH0CK0oglbE?=
 =?us-ascii?Q?aowFAgCrgN1X/3xsA42ehsjyhs/51H6wwIo9vqnubt2O+jwUKyzd1KnUlmkg?=
 =?us-ascii?Q?S6eTfSwsS/lvoo2uzI5u8V/MzGx3koK03bLhLUGVHMFcHAVcXmcDDxq+t5up?=
 =?us-ascii?Q?RwANB43sTXEjfepNmpytb9ttLCws1DR1sUv3M+ANd9ALCdMtDCHN4Wo7a/1G?=
 =?us-ascii?Q?Hah2GINErckORvCEpN87bQuvbpFf4s8xlQ2gPx/ZuekH4y6ZCWXW6wY6SVa7?=
 =?us-ascii?Q?9VtF4cF9rYoSnpXpZR4ZvCpyvWfyDTXQ+n8QKRvudscmYH0/7NyuzYeRB/YT?=
 =?us-ascii?Q?tj8BR9G3wFZV4NNfSyAAsFtcVBVxRFkuhVwM7xOPRhiQP543lCAuOlYIMh66?=
 =?us-ascii?Q?Ez05LcHnPf1wT8drWIbGKcP3ScWKsyeq0H36MOuXEFK8S6/3yQ10mfecd5K5?=
 =?us-ascii?Q?rDff1GeqRNIHJufWj5orEN4a9K7mlyNy57T/OSG8zDt43eXUx3oAzw4zrYQD?=
 =?us-ascii?Q?3msK0GCL9tKVMnk/o60I56YgMh6l8N74QN+uKA1t91c7MQfwIr9FNeM4wjIT?=
 =?us-ascii?Q?7UQFNwQjDjO1djFKhKqdPISz3RNQIk8Dy7ysr6AczCj7Sm3LkhiWdXYSitvj?=
 =?us-ascii?Q?bNSy6eYhiXn+1/uqxVExEetlULiBfnmKqB08nCtp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d946ad-59ec-40b5-5543-08dd7b077f30
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:50:28.8659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiUUnuAwnbExFQVY9Ik+4P+ZAuC7Anc1neObFQGnvoe4b01Y9gW1VJXDIxdsn3bA9tRE4H4YZ9ikquUzkSUK+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803
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

i.MX8qxp Display Controller(DC) is comprised of three main components that
include a blit engine for 2D graphics accelerations, display controller for
display output processing, as well as a command sequencer.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v9:
* No change.

v8:
* Drop instance numbers from compatible strings. This means switching back to
  the patch in v4. So, add Rob's previous R-b tag back. (Dmitry)

v7:
* Drop DT alias documentations and add instance numbers to display engine
  compatible strings. (Rob)

v6:
* No change.

v5:
* Document aliases.  Drop Rob's previous R-b tag. (Maxime)

v4:
* Collect Rob's R-b tag.

v3:
* No change.

v2:
* Drop fsl,dc-*-id DT properties from example. (Krzysztof)
* Use generic pmu pattern property. (Krzysztof)

 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
new file mode 100644
index 000000000000..0a72f9f0b5fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
@@ -0,0 +1,236 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller
+
+description: |
+  The Freescale i.MX8qxp Display Controller(DC) is comprised of three main
+  components that include a blit engine for 2D graphics accelerations, display
+  controller for display output processing, as well as a command sequencer.
+
+                                  Display buffers              Source buffers
+                                 (AXI read master)            (AXI read master)
+                                  | .......... |                  | | |
+      +---------------------------+------------+------------------+-+-+------+
+      | Display Controller (DC)   | .......... |                  | | |      |
+      |                           |            |                  | | |      |
+      |   @@@@@@@@@@@  +----------+------------+------------+     | | |      |
+  A   |  | Command   | |          V            V            |     | | |      |
+  X <-+->| Sequencer | |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |     V V V      |
+  I   |  | (AXI CLK) | |   |                            |   |   @@@@@@@@@@   |
+      |   @@@@@@@@@@@  |   |       Pixel Engine         |   |  |          |  |
+      |       |        |   |         (AXI CLK)          |   |  |          |  |
+      |       V        |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |  |          |  |
+  A   |   ***********  |       |   |            |   |       |  |   Blit   |  |
+  H <-+->| Configure | |       V   V            V   V       |  |  Engine  |  |
+  B   |  | (CFG CLK) | |    00000000000      11111111111    |  | (AXI CLK)|  |
+      |   ***********  |   |  Display  |    |  Display  |   |  |          |  |
+      |                |   |  Engine   |    |  Engine   |   |  |          |  |
+      |                |   | (Disp CLK)|    | (Disp CLK)|   |  |          |  |
+      |   @@@@@@@@@@@  |    00000000000      11111111111    |   @@@@@@@@@@   |
+  I   |  |  Common   | |         |                |         |       |        |
+  R <-+--|  Control  | |         |    Display     |         |       |        |
+  Q   |  | (AXI CLK) | |         |   Controller   |         |       |        |
+      |   @@@@@@@@@@@  +------------------------------------+       |        |
+      |                          |                |       ^         |        |
+      +--------------------------+----------------+-------+---------+--------+
+              ^                  |                |       |         |
+              |                  V                V       |         V
+       Clocks & Resets        Display          Display  Panic   Destination
+                              Output0          Output1 Control    buffer
+                                                              (AXI write master)
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: axi
+      - const: cfg
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^command-sequencer@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-command-sequencer
+
+  "^display-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-display-engine
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-intc
+
+  "^pixel-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-pixel-engine
+
+  "^pmu@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-axi-performance-counter
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    display-controller@56180000 {
+        compatible = "fsl,imx8qxp-dc";
+        reg = <0x56180000 0x40000>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_4>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        interrupt-controller@56180040 {
+            compatible = "fsl,imx8qxp-dc-intc";
+            reg = <0x56180040 0x60>;
+            clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+            interrupt-controller;
+            interrupt-parent = <&dc0_irqsteer>;
+            #interrupt-cells = <1>;
+            interrupts = <448>, <449>, <450>,  <64>,
+                          <65>,  <66>,  <67>,  <68>,
+                          <69>,  <70>, <193>, <194>,
+                         <195>, <196>, <197>,  <72>,
+                          <73>,  <74>,  <75>,  <76>,
+                          <77>,  <78>,  <79>,  <80>,
+                          <81>, <199>, <200>, <201>,
+                         <202>, <203>, <204>, <205>,
+                         <206>, <207>, <208>,   <5>,
+                           <0>,   <1>,   <2>,   <3>,
+                           <4>,  <82>,  <83>,  <84>,
+                          <85>, <209>, <210>, <211>,
+                         <212>;
+            interrupt-names = "store9_shdload",
+                              "store9_framecomplete",
+                              "store9_seqcomplete",
+                              "extdst0_shdload",
+                              "extdst0_framecomplete",
+                              "extdst0_seqcomplete",
+                              "extdst4_shdload",
+                              "extdst4_framecomplete",
+                              "extdst4_seqcomplete",
+                              "extdst1_shdload",
+                              "extdst1_framecomplete",
+                              "extdst1_seqcomplete",
+                              "extdst5_shdload",
+                              "extdst5_framecomplete",
+                              "extdst5_seqcomplete",
+                              "disengcfg_shdload0",
+                              "disengcfg_framecomplete0",
+                              "disengcfg_seqcomplete0",
+                              "framegen0_int0",
+                              "framegen0_int1",
+                              "framegen0_int2",
+                              "framegen0_int3",
+                              "sig0_shdload",
+                              "sig0_valid",
+                              "sig0_error",
+                              "disengcfg_shdload1",
+                              "disengcfg_framecomplete1",
+                              "disengcfg_seqcomplete1",
+                              "framegen1_int0",
+                              "framegen1_int1",
+                              "framegen1_int2",
+                              "framegen1_int3",
+                              "sig1_shdload",
+                              "sig1_valid",
+                              "sig1_error",
+                              "reserved",
+                              "cmdseq_error",
+                              "comctrl_sw0",
+                              "comctrl_sw1",
+                              "comctrl_sw2",
+                              "comctrl_sw3",
+                              "framegen0_primsync_on",
+                              "framegen0_primsync_off",
+                              "framegen0_secsync_on",
+                              "framegen0_secsync_off",
+                              "framegen1_primsync_on",
+                              "framegen1_primsync_off",
+                              "framegen1_secsync_on",
+                              "framegen1_secsync_off";
+        };
+
+        pixel-engine@56180800 {
+            compatible = "fsl,imx8qxp-dc-pixel-engine";
+            reg = <0x56180800 0xac00>;
+            clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+        };
+
+        display-engine@5618b400 {
+            compatible = "fsl,imx8qxp-dc-display-engine";
+            reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+            reg-names = "top", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <15>, <16>, <17>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+            power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+        };
+    };
-- 
2.34.1

