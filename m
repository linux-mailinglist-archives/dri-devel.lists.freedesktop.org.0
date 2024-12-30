Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24879FE207
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDFE10E45D;
	Mon, 30 Dec 2024 02:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="F3MorFqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCCB10E45D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2r+/JoRBott9YOqVjgnOHNTmPvGO8lmkU9fAoKMyfXDYiC2Hvg0aiqOVb4w6DakagQZIIbHaPCHlx1y0IIEP8+RKql1Ut4Ujjlhjeaf13+bxTRuBg/nEmgRIkYs3rA12aEzuBcWvpfwDouioC6FqbMwzHuNIPSRbNSvIqQAIRXrqJx0J+/YMhVeLRA1Uq6BCVme4F3agXItO4TactsgjHJRiuQJdwVWdYvgAiObB8kjwd02kJYB4YbhHYxiZZVQsNOVtIKQ5zk5z/mMWs7SgvK7NPP1kQNdhCbtOPIrYOjtrvIn/LGyAl4s1w1fnI92119C5jrEdOGna7KWb4l2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XddNlSrj9B4wWvdssJuAzjDY9ULkYuwzHY00hUPMX68=;
 b=A3kwAPnLtdz5PDOmgFcfPBfD5GC57ZIJldyLAOQ2cAFuEEqrkIIuUwrvo5LmKTHEH22MfaHmNVRRntwWDB+dXjpty1e+GkoeytjllMfO/DUMQxi185IZor9cWRTThdlYbOWhhmvHRStVRDDnqVTCxSHM9+mME0dcWCqn6E3VTIXdnJrH7LsVifn+i9M9J4ZrwzilmlQYJncVHxrJvdI4DT+YJKl6qIZNClR2r6gvn+K3K9KXn/aBt4YNzkj0QEAUYXC5VY+wdQO1lMrxyx0ZEU/ckzDgMN4UqS/Zodg3554dWL4rMFtqFv/7CHMyXBERndH9OCIQ+fXV3ilRnNrqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XddNlSrj9B4wWvdssJuAzjDY9ULkYuwzHY00hUPMX68=;
 b=F3MorFqIGkwFFYIfi03n60eh41CZFqS8jmanK2ok5hfJ+iRIoqVp6NdPmiKikNTpHn0y5wsoLy1e5ptBWLXS0Zuc/PyM7axYBoZs+TonTJy7ZvZMGI4Zowa38r/at98EyXU1oKAOyOXBl7UL6JJLJaT1pTrEl0e2iQc5wf13M5gwLb0UGdMSsVSg8sDwM9f1AjCv+E2lJKL+bb+QDvCUwtXSg1VUuIhtJCrtwkot4QhOJJs86aJ9EXPnrCF7ApmnIJSAUMbrhg/6jCkRFd+B7sbcDPLkqYFfdfIZrXCryTgjfv4PuEimVDtpA2bYih6G50VIbiHqOAsTBKssUEfzIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:14:00 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:14:00 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v8 15/19] dt-bindings: firmware: imx: Add SCU
 controlled display pixel link nodes
Date: Mon, 30 Dec 2024 10:12:03 +0800
Message-Id: <20241230021207.220144-16-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: fceec58c-67c0-4a3d-417e-08dd28779f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9VEsqKBNXOYmuTB8OyykSTSZcxp9BFqiSMO0BzS68W2xdoZ0M2Xd+CUi4G2c?=
 =?us-ascii?Q?5igVhI6Gr54TmNVFCDi7DLT8juMuOabmGX722gbXHnQz3XdQXK1L0gRN87TS?=
 =?us-ascii?Q?mYn/P8Eqme7ZdQnxAkm/BCmkdWzbyn8CQcYg1t4xjXMqbWtc27qMlPsdzMd7?=
 =?us-ascii?Q?xujATE4nn5sJ/Hn/4KZv6+8Ju4bYQxGajxW3L55ucMDfUehCqNBVtPwebQtj?=
 =?us-ascii?Q?LZQwPRT8o0B8vNjeTD8wljqd5yqcons4iRZHd4ZXkBhAeYQsEvmk06AAGHZO?=
 =?us-ascii?Q?KPtX0qeUCu6zHUJhMu+egOGUPIwoslIiSm7pb7PekPM2aBh9scbksfDHgAZa?=
 =?us-ascii?Q?93I9BWJ0VffGErkI5HNXmrCbOXjjVykklvkYD8hpc3JbUz4NW1pdha2s7kyt?=
 =?us-ascii?Q?FjK28FVZ6Gn+NTuKGQzH2pGlq6rasXzBmQiaqiGy9LYzgX5N5NRuAwzIP5Hn?=
 =?us-ascii?Q?7oLVM8ginqHoA+cqsimhLCYi6ghbDmFSiAn/dxrfZxsPsQCDHtj7+3uoMkCM?=
 =?us-ascii?Q?W5mNwcoV9p/oB9e2MpLSPoRXbCMgx9wWBMAFBP4EbcMKdoYMZKR1/WblSKAm?=
 =?us-ascii?Q?i/VB++vDk5pmhHG2D1sGuXjY73RbtODuxw2/HTTw4506EPw3l80YSo+infBl?=
 =?us-ascii?Q?KKJuiw2bSQk9o0XOri9djRQxMfe1L371+B2d2zZdCmVvVuXLAbyV/COclXcJ?=
 =?us-ascii?Q?6FNgcVw0EvCGUSq4M8OoPQ4pkQ1A/pGBO5TFFZoYCoNQHUoBGmbR6pikZA4g?=
 =?us-ascii?Q?8lm7726Ek8lZ5F0uycjVC150GL1c1BcGHL/jmPNqMTTs3aqLs18Ala9jzhtb?=
 =?us-ascii?Q?fdfwkG9mDARoMnTfhAg25/1tJT7aW3/dNhy3Pwvz+ISYpa2bjV+kwekB6Iv8?=
 =?us-ascii?Q?zWcRCoL7Vd/+3UpB71wrLqnH8W+3htOTgFB5kSgMO/qani1dWaQ4B13EFzlO?=
 =?us-ascii?Q?nw2Z0GhAbFTN0PR7IVv67t86JHQAS08hmnVFLM5QVP70VDoK0eIGzlBUbNj1?=
 =?us-ascii?Q?wStdyP9rtlsHzfkwY4pCUCoU0aqvwv0ZdhjA5BsoSxY9N8rkICGEJMjRI4o0?=
 =?us-ascii?Q?e9fmzUZg9upcjZH/bCvRo1Jg4xrV4flMYETOkKyj5P0PGh20iRVBZ8lX0qOW?=
 =?us-ascii?Q?f3sdNn0eKznpm9t6/Oho5DiwpHR5Aq2UeL6E+tlR/BpzdMQK3KLTH/2UOwaA?=
 =?us-ascii?Q?hMOpwWKmGbJVeD8zWgNHe/7Xau7NcXphyDxkPmz9AygBbQxu1K8uqHWP15iz?=
 =?us-ascii?Q?3IaBqzfVW3t7KEsQlF1WPmaAaxvp5BMIsCC/bYa9a2SM8p6DxxFkS9HJYFDi?=
 =?us-ascii?Q?sw25kCovMMePTJ0UAiPKLoHMR602OBnvxadCUrSI5MBTNPuP0nTUs2ps91ct?=
 =?us-ascii?Q?VLjkLittjUyGmHpozGvZdLFbWaKMlVgyikre/DioJMVerXHySOda8Nw/wxlF?=
 =?us-ascii?Q?QRsKcCE8gQcthwAqmt5+nuXqWnEHTEgw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FfqnL6plUdGRg1UDdJf+3/2PWAxQZtAqLnuLYsoaWp2hHn3L1QbYwjrEsjL4?=
 =?us-ascii?Q?7ThHF893hCRCnXa1Mm38gKAcDObaV9xZ9x2wgqEgYnssGLMZd/Ux2eGQN19D?=
 =?us-ascii?Q?eRE55rzxu+Z/xmk6UcduGxnK9T9gol8WKrofnRp9Tb++4OHI70N58WD1QUvu?=
 =?us-ascii?Q?Ivz9t1e2A4wzKj2ZPI8lnjdFMhfjY9IBZnQ0DmXvI9PThSwUOdMnBcdvu6t9?=
 =?us-ascii?Q?f97izA7v50zS2hsCIVN8gbzGT3X5kKVBRbvgnlTsADIreQzESlV1/HdmUpFV?=
 =?us-ascii?Q?NCBxMlDc8pnvUWFJZw5FwbsWnjSWQpoNWDkN05yGXItwMQlSYaCoJFNmcOgu?=
 =?us-ascii?Q?zmh8IBTLrzGVU8K7amZ628EWYQ63xqaP0RtPgOdXM3B1s43VX+nXgIznujqG?=
 =?us-ascii?Q?LiD4WhoisLDnBUN7BXaX1n6n48CIM0aW4J5u+wegctEm1+Aa9NlB/HiYqPMW?=
 =?us-ascii?Q?DLPrGBn4sN1/gysRMvE1A0Veqt41MIkb29msBEcJbIju+xz4+9agjKZiaLoX?=
 =?us-ascii?Q?DjybCA38MIZA0bcryBa/e4/mU+YxV88sfcMXQ+nnkv4bQeG+vXooV9Oq/1gu?=
 =?us-ascii?Q?3Spw7LFsLdkujEbJMo3cOJttorSbpKCUNaVTFGcHIvRJNVjAhVQICM0AWg4K?=
 =?us-ascii?Q?OB6K1DxA/1Nd22aLnkiyG/CFmeJaYB/bAfRM/rtPE7EArmehc90/24kev0sy?=
 =?us-ascii?Q?63euiGito05ldZ11abrRq+7Pu/N4Su5w+t+tfb9C7URqS4AeP+aOvEjgQgpQ?=
 =?us-ascii?Q?2fMVPiI+PNUmAL6NiRTQiMxwKABJHYpJg5wapi+nhlrciZ93aWUHBVSWgevL?=
 =?us-ascii?Q?rXyDGCE5lqppMUXSxb1ciAt7sIcf4qrO1mBhjoF9GxeA+AY7y6A+401HuRUn?=
 =?us-ascii?Q?KjmY0Ts1WonbNaTGO3ZSS/FI1s58/2eEniJfIxryCfqOeTrmcu6golGEAAUa?=
 =?us-ascii?Q?Ls5OlxC9oDrJ4DDlx0FDChCJWoKwCXia69w6VLTaEfBx/vcXfcXHZBjVxesQ?=
 =?us-ascii?Q?3vyx1DSxxtHqz9mdeEJI0oevbfKTWCf/2XGWIZ/I5Hg7Dzb8ZLIA5Emd/0qW?=
 =?us-ascii?Q?94aVXaYTgnSDhhtnRovTgmNiu6ggwas2ScP3AZQjplJhHM6R8SCA0W8kStgZ?=
 =?us-ascii?Q?uqejW8nQQpdvlft7r12/a4cUSEc3rOHClct9T7wW5UFP8U0RKi//ACSc9Tbd?=
 =?us-ascii?Q?vfHNPtXF0QpGrbp6Lxk/y1LM/EFdngCJuKfRoKseTSfg5TMnFzA5DBsNTBlM?=
 =?us-ascii?Q?KBqhhHBeZkfhvsoGoif+ZtpB9PZ2vyByP2gtZvYV9neOBzUnYCu3p8twrghO?=
 =?us-ascii?Q?j2EsfgpJ/EjNympXtGIeksa2eTARLrFf383f1VtaLbEXnmeI1SHPN+Bn4fAl?=
 =?us-ascii?Q?qxp0qagG02DZH0D99YqnghW3TfJjxb6vdIVU+LO6Req99l4wDz299Z3jp+3j?=
 =?us-ascii?Q?/ETvG0ugRD7Z/yolY0/WjeSpNgY8Cn59pmv0k/j7lx36wijIz61D/OYK57BK?=
 =?us-ascii?Q?2Snbs4MJhSyu2KOp9zwDE65NiENKNoIBcFtd6uc0P1hIhZwM6/j+SvkuwEiU?=
 =?us-ascii?Q?rRChq2MNXJ7gCNxeEgReKnd2JRayNiMZ/GTkridp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fceec58c-67c0-4a3d-417e-08dd28779f7c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:14:00.0997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2WIn92vz6DIW80ToN5JRq06j32SVA9kZGc1Xp4SmOEkfHWQFbbaIBZyUoDTr/MBnwWslfvxWSeJTzoO8rwAow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9821
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

Document SCU controlled display pixel link child nodes.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch as needed by display controller subsystem device tree.

 .../devicetree/bindings/firmware/fsl,scu.yaml | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index 557e524786c2..1a920f013ad2 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -30,6 +30,26 @@ properties:
       Clock controller node that provides the clocks controlled by the SCU
     $ref: /schemas/clock/fsl,scu-clk.yaml
 
+  dc0-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc0-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
   gpio:
     description:
       Control the GPIO PINs on SCU domain over the firmware APIs
-- 
2.34.1

