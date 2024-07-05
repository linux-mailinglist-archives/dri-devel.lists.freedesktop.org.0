Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6564928456
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD78910E09C;
	Fri,  5 Jul 2024 09:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GaYB3Mn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D811310E09C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:00:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8Pe3qDFtQWRpUGp5tZ92vJ8tqU5WTgWzkULrBmrQznhwM/o3Q6KaCtq8p9RuFOqHQOIc5IJhuEMW5bd1AP2RoekqLKKqS1f041fxvCCa6Wsqcp35uoRTPDNGw8jczn3BdIZev6Wq7w3UmrdNhF06QutK2V3ofG0mJJIZmRJCGxPfl5oCMvwlqOXRcKkWrGzXI6dExrwn3UyZYBWgukIJ3eGbSnGkiNj6FcebHtpd8qJZeN2aNbUx7i8Yx1Jy12o3E3Lb7TUgpl8jgOs95AqH706Vk8AqQBjt7eQUL7u0FXy34C2fKSYAFtKYmkjcJ+vZvaCwyNeFksdOvrmULSWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KObJPtIxDcEuTdyVQVipNVkzzWvvHidot0Iw2eB+U8=;
 b=B5E5tHoslkk/wp0bPVJHd1DD35mFTXfgTHmB6Djd8i6RTovTe69HV0ji6CBP576IkDvii8h1+XIr81NRHnUuHkkVWjFUphixvnOJ6iXZtjr6pm64j+eOb5XejbxTSf0q2Pr0MAgKSm3CclweOalPpkHOjK9XHsLcDvhdG40Z5lAPPXROEUx1cBkHGduQAYkuw6hYvGjdsb92sGSvWlpvymHYRC1FYhvEJQpwcJz/+SKzcNxakiXczfxXm0BYPCN4PvonMdlQ0by8Cff8MWvZo2kwnNpjh2H7iwkLWRiU0UGoi22o+6I6YD/wsBizPZhI01vrBSuvIADZY4mwklqnug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KObJPtIxDcEuTdyVQVipNVkzzWvvHidot0Iw2eB+U8=;
 b=GaYB3Mn9lUxv5Hkfi2pMYOXkvYa4nSU+HJEgeIumQnL+Ng90ZUAWitFXEuvKuieYA3nyu6RXK2A8vvXVvzql5NLlUp9aF/XuEk5yfwVzff1g0LcLYLSMn08rie5FhBgb8dOAWBCA4eAH7TXORhlaOzRMT3Py99LuU1qw+yMuR0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9073.eurprd04.prod.outlook.com (2603:10a6:102:225::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 09:00:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 09:00:45 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
Subject: [PATCH 00/10] Add Freescale i.MX8qxp Display Controller support
Date: Fri,  5 Jul 2024 17:09:22 +0800
Message-Id: <20240705090932.1880496-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:4:91::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d19b182-6206-4270-cfd8-08dc9cd0f494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qf2SrbXtRRnGoxoEfz4fq+77dlnXjFGnkd4B5Op0ib/zyQmV8MpG11aD5yIl?=
 =?us-ascii?Q?QsZ/bqKHVDlGomg8yB/gngaebhf4+YliIzyHpwcE4qkNFk4ay1cm64blEYfY?=
 =?us-ascii?Q?AxHO3F3c33eQRxaBbdz/bgMZed1T3S33APuRQQoSFeiYYwnmnDDiMj8KD4P9?=
 =?us-ascii?Q?2xWeNgquRvTzdflvCuimcAyqbxy4wZDVeB4paTQSmDUi3LYNjlaxjMkpGDhI?=
 =?us-ascii?Q?GXIxWFLNvuNY0p+pqwrAdNkttBUNhbzvEZPwXv9MzHZ69GC3JVrQ5dBIYXjX?=
 =?us-ascii?Q?FRrvp+OTqW4/ewy7m1Du2pPvvOrtN7pZ1XDzXk/8/u+4K3XpTQ5Fi9TaHEdk?=
 =?us-ascii?Q?ldt7uFv4ZNNrTKS3iH0K+mainfGYou4WzTJNtzRPc7JfcDe4BBijUny4An3Q?=
 =?us-ascii?Q?o5ycBt6Xg7rQSmo8enZ5XTarSGT7cwfWOW8o/UkV8+gb3D9gUVAJDByhNwI9?=
 =?us-ascii?Q?PL+ZoBjx0km8m+5Qsp82roMcEgcolVX+gu5V9tGzVBOjOKOGrEaFhuhCd+21?=
 =?us-ascii?Q?Jxrd+0TeUouOdJQwCk4P4/X6xcoVBmE69AS1hUcRlv8SLTKiXFjXEvC2rxY3?=
 =?us-ascii?Q?9FVXmcEsEInR84tw12kJCGRic7F75P2P/uzJ/EvhgIBgK6SQ8/Elf+6n+MRI?=
 =?us-ascii?Q?6QsgOsnAYSfw7lNYKLe29M1EkJSFjqUiTMCHMWIYx6TOnsttIbHll3d7CYeF?=
 =?us-ascii?Q?xjPkvBh7pyyEUCsPmobMaa7+2/DEatq+KeaV30jPQtU2RzyV6o5NHSKulyOP?=
 =?us-ascii?Q?QUGbZ5w3MgahBPMte1Wb4AW3Mviy18ETFcVo6IHmAWwrg+Iug33eD8JN4fbm?=
 =?us-ascii?Q?e9+xEXoniSCFzyy2g0gftQIvk/M247At1khNLi60se+e9Ev/S/2iU5wMzQDr?=
 =?us-ascii?Q?AzDpxqk3vQG9BEe0P0THgdvdcz+W9SBRSaFTVG7fug7y5WMJnPaAFnvG6Qlm?=
 =?us-ascii?Q?12NYZG8eiNMqoH32L/X8senPE8cYEgd/Sad0EDp/4hca19WXIoR/cx1yea9L?=
 =?us-ascii?Q?wKfFydeVBw5lX6ETR24GIX9g2QOOxDEAQ/iw2OqKco8CgtgLhnqQzWwdeP5P?=
 =?us-ascii?Q?U+AtdczD7x+QaXk1nf7BBpbTPbkmMCrj3P5UCSOK//76RFfbj0xQNyMyBTpO?=
 =?us-ascii?Q?YNi4uAbBfWCqlG9hljA/v6WaHuh42gi2Ux6g4cgJMad+fga+z03UjD2DuXM3?=
 =?us-ascii?Q?hGLrwEWurZ2WjKI6w0EFK87v9GW2s7rGw1FWQuhlATG5Wfa+Jvx29wwp6c3E?=
 =?us-ascii?Q?0+Guo/pePjeOUpAnde+YwaB4Zsif/fEXJ6wOTh2JjEPCao0GElg5uHPYdqTp?=
 =?us-ascii?Q?+9dQ5RqqLmlWJQlWPt//0/k9eH7vTv7r6sNFg7EPMpwPlA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O97bhfqXHvdQMUTnjYKigzFyNO1YjspA+o94KRXi3I4CcRF+O4ULJ/hVG8v3?=
 =?us-ascii?Q?0hpo/DrN7WYpEGp92TnTMuqY4SN62dHLotp8ZFwCpwJCEAdPqBg+ugMI++qj?=
 =?us-ascii?Q?34PvS4HtmNMtxTwrJo6+T3uE6bO3E5qN9TXjJP6O1s3tM5n6XFfQX64krNyp?=
 =?us-ascii?Q?XN7QU7CYE84HPcDhhBdoW5G7r0YiO/b1Q8uu7GusxVTlsqPtfmnJWevNIPn8?=
 =?us-ascii?Q?lkbWlr+frgf6G0JyHpFzpA839x3AM0i0h4rs4tKUDjs5no+ZkFxZngIOvzYO?=
 =?us-ascii?Q?a4FLvxtCiKJdeEmBT66dRbW0hKZ30LGV4vv67GgTwnqP5ReoA4OB5rUCL64X?=
 =?us-ascii?Q?Hupg4+u6PRL04Va8LBT0UHLcZmso/SZ7elQlr4nIN7AMC0orn2r3PZM0Nu6M?=
 =?us-ascii?Q?Va/Dky0vZcq4/8ef9JK9Sh9CwynQa6CaIPB+j2RJC6HaSNU8L4GpziOalXuV?=
 =?us-ascii?Q?F82uEglzs/shYZjf+RGslTsaJiAhQmZRFiBjCm6leV3An8FwG7P35IIywyff?=
 =?us-ascii?Q?ZuwebckAqD4DnwYkHPQwll37yZY8LwhkJYgk9amt7BKkAVbjWxWHt6xcIhkw?=
 =?us-ascii?Q?Py/4GNAiLvgW/JiyLlIbEnHD488QHxvNDs9FZ3XVCZfbKP2WV9/atwapy8T/?=
 =?us-ascii?Q?gCZyfwoQJEGWn7Rf5EXLLFQBCPOVPQkHlAkNWHkyrZQQZPol3w2xnTpENknA?=
 =?us-ascii?Q?s+4SmXBfIrR/AJbJReyD/T+x1uwbagDe+onvlud66GucpJjC0Lg8Yj0WBcdN?=
 =?us-ascii?Q?8faLYi7mkFjHDR/XCUxKd40Ep5gGV5SyRdzDw7wTrWlDJEMMrIH8P9t+E4jo?=
 =?us-ascii?Q?puIBQ5QsX5T4xUqGT8IMYsOGSZUiHPvCYRfMV5sGPeJR9df0T1heaSYtnzjO?=
 =?us-ascii?Q?qe/U7mXQylTUEsURrLJLeKNRBRyS/NvZEf+irT142JMxB/gxBkrGSjbztTmF?=
 =?us-ascii?Q?vIhYwTjc2wxrB5l5FSOfZzsdEVSpFbNs4PKR7lTs8tTNJU1XcNydVGkgotjp?=
 =?us-ascii?Q?VLbKTT5oCl9ErZM7PtLKnbq+LoNIHJiuK1V9v4+46uro3lweuqQkk0afpcj7?=
 =?us-ascii?Q?oEEQvzdhPc1Oa8KGtAN0OTAN6/3VRODyeMXAACdLEyLh5spcGxcVsnVj/VmT?=
 =?us-ascii?Q?Vt1wapk2cPoINh+oFIXln6CN4AciRU+KdHhJ+6o9eTA+wcvB/L0KGKToeDmN?=
 =?us-ascii?Q?uiMhOfvtudr6BwExixDtB9Ml57ZkhYBSRVhkUEmRs4UUCNi3mbfIi3KJi0W5?=
 =?us-ascii?Q?GS9/q3lQ2hwo1IY1zwyrhIajAf2f7uuMXCo4iZYuQJwE/IVkFcwzgN3keqU2?=
 =?us-ascii?Q?KgchVeegO4l2OhFOJuVdJPY6jsAVGUHy7VVLaucpD3y/dWYFaBUbuOZkN7Op?=
 =?us-ascii?Q?QKb9rrXHUeeXTyuBvH3SZyi7LV2vhHuRt+fn64iHhkEO2tlEpKtFGwML+gHB?=
 =?us-ascii?Q?DtBrGIoEzSs5Q0y9N8MxoghJ2t8fuxjjpyVvIQPYFwovcV4budr0faaBmnyE?=
 =?us-ascii?Q?qgQmOrsyV9nVMQh2TB2aTao6mFeXIywjorMihjBDTERGE7LqBl6pJjo8ihdJ?=
 =?us-ascii?Q?txk/QIwKRajXQg41+VdnuAcHUSQfPuldQwpmP9dO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d19b182-6206-4270-cfd8-08dc9cd0f494
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:00:45.2946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9WEmOrXWhztQmWWojZoV/341WfF7kncfWnswXJMJ8zeANLpVdiVNpa1CWBsuTIZp3E7U/9F1vEWjAENvjAgjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9073
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

Hi,

This patch series aims to add Freescale i.MX8qxp Display Controller support.

The controller is comprised of three main components that include a blit
engine for 2D graphics accelerations, display controller for display output
processing, as well as a command sequencer.

Previous patch series attempts to do that can be found at:
https://patchwork.freedesktop.org/series/84524/

This series addresses Maxime's comments on the previous one:
a. Split the display controller into multiple internal devices.
   1) List display engine, pixel engine, interrupt controller and more as the
      controller's child devices.
   2) List display engine and pixel engine's processing units as their child
      devices.

b. Add minimal feature support.
   Only support two display pipelines with primary planes with XR24 fb,
   backed by two fetchunits.  No fetchunit dynamic allocation logic(to be done
   when necessary).

c. Use drm_dev_{enter, exit}().

Since this series changes a lot comparing to the previous one, I choose to
send it with a new patch series, not a new version.

To follow up i.MX8qxp TRM, I changed the controller name to "Display Controller"
instead of the previous "DPU".  "DPU" is only mentioned in the SoC block
diagram and represents the whole display subsystem which includes the display
controller and prefech engines, etc.

Liu Ying (10):
  dt-bindings: display: imx: Add some i.MX8qxp Display Controller
    processing units
  dt-bindings: display: imx: Add i.MX8qxp Display Controller display
    engine
  dt-bindings: display: imx: Add i.MX8qxp Display Controller pixel
    engine
  dt-bindings: interrupt-controller: Add i.MX8qxp Display Controller
    interrupt controller
  dt-bindings: display: imx: Add i.MX8qxp Display Controller
  drm/imx: Add i.MX8qxp Display Controller display engine
  drm/imx: Add i.MX8qxp Display Controller pixel engine
  drm/imx: Add i.MX8qxp Display Controller interrupt controller
  drm/imx: Add i.MX8qxp Display Controller KMS
  MAINTAINERS: Add maintainer for i.MX8qxp Display Controller

 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  51 ++
 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 166 +++++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  79 +++
 .../imx/fsl,imx8qxp-dc-fetchlayer.yaml        |  37 ++
 .../imx/fsl,imx8qxp-dc-fetchunit-common.yaml  | 125 ++++
 .../display/imx/fsl,imx8qxp-dc-fetchwarp.yaml |  37 ++
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  71 +++
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  46 ++
 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 264 ++++++++
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  41 ++
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 243 ++++++++
 .../fsl,imx8qxp-dc-intc.yaml                  | 321 ++++++++++
 MAINTAINERS                                   |  19 +
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dc/Kconfig                |   8 +
 drivers/gpu/drm/imx/dc/Makefile               |   7 +
 drivers/gpu/drm/imx/dc/dc-cf.c                | 158 +++++
 drivers/gpu/drm/imx/dc/dc-crtc.c              | 578 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-crtc.h              |  67 ++
 drivers/gpu/drm/imx/dc/dc-de.c                | 152 +++++
 drivers/gpu/drm/imx/dc/dc-de.h                |  64 ++
 drivers/gpu/drm/imx/dc/dc-drv.c               | 280 +++++++++
 drivers/gpu/drm/imx/dc/dc-drv.h               |  54 ++
 drivers/gpu/drm/imx/dc/dc-ed.c                | 267 ++++++++
 drivers/gpu/drm/imx/dc/dc-fg.c                | 367 +++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c                | 137 +++++
 drivers/gpu/drm/imx/dc/dc-fu.c                | 241 ++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h                | 129 ++++
 drivers/gpu/drm/imx/dc/dc-fw.c                | 150 +++++
 drivers/gpu/drm/imx/dc/dc-ic.c                | 249 ++++++++
 drivers/gpu/drm/imx/dc/dc-kms.c               | 143 +++++
 drivers/gpu/drm/imx/dc/dc-kms.h               |  15 +
 drivers/gpu/drm/imx/dc/dc-lb.c                | 301 +++++++++
 drivers/gpu/drm/imx/dc/dc-pe.c                | 140 +++++
 drivers/gpu/drm/imx/dc/dc-pe.h                |  91 +++
 drivers/gpu/drm/imx/dc/dc-plane.c             | 227 +++++++
 drivers/gpu/drm/imx/dc/dc-plane.h             |  37 ++
 drivers/gpu/drm/imx/dc/dc-tc.c                | 137 +++++
 39 files changed, 5501 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
 create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dc/Makefile
 create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c

-- 
2.34.1

