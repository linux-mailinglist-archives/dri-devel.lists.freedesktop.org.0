Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A486037CD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 04:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC94610F0A0;
	Wed, 19 Oct 2022 02:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B3410F0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 02:02:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDghk5rHJI0jQU0oU0ZCi6NNILHVkIZs9JWw6hRQnpa7GS4elfZotuuxKcOGzp253y0Hum7uB51gVXlS4EIrFYpw9LqztescJULTVAtOPZEfKC7XG9mFf9LsRMeqKSin/NFhsXasIDIcjNFElmnJFwWPISnmQGavnQkOHdZLY1ui4SnYQC+dGb4N3I1Q3NvoTfdJoXe5uNU9MGCstVcadp16LL7Wm2J3KJcQPTq63JJ/N/t2sxiZG6AjrkRy6gJ+y5W1XqinDw7ZQPPuQWE3XBKDq4n66zk+LTggNntvCSvyh0jssCJjWXKb3BszgQFFLYDJRsxODYCQhJ1skSYI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSneSNaoyT1aNAQfLYWrtX9JdXEPqXQGL0Rkwzrf3fM=;
 b=JHEHjAaGpltHEvND8C0vO422YJxEysSV4QeBHPenEAGd1q5qvUO4r5dqfqy4dkNyzozj/ZKwXUQ8Hr2TPC1sB6+ze0op/JH99jImiph7TopMiQeTXh2IBdCMwCWhUk18DVBP7NvVixf101RDM/5xhhchLIFPZduRKQTe2wFEX4jG5cngrNtUtgr7dc5/UklCiWURE1p4OWoXUHp/zyxnrjaIq+2cg7cOwOitzGPzObkGHzm8q5maXVjo8PJ0Ex7pMAbl7sNytv+Q4+cKvZY4wCM+Ezt9fDM0nxPEYJjHRudQUXAXKaBMX0rwwuMw5Spx7z6nsp6dVV6Grw1FwTmzOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSneSNaoyT1aNAQfLYWrtX9JdXEPqXQGL0Rkwzrf3fM=;
 b=ch+hHujYIu6DO112oMiiihOX7pf7c/j44Qg9YZVtm6fhqFCAVLtSuhN7sv5BgaaKri5ixsk27E0Th5bIoPUhSHCE0JJ0fQeuXhx2+cs9P+2i1VZvCHlWvKqLG+hBGF+vYvy4ov56dB7erXn2RLd+tV8kXxPz/NKHOaA0nE2P8NE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 02:02:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 02:02:11 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v13 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM
 driver
Date: Wed, 19 Oct 2022 10:02:26 +0800
Message-Id: <20221019020226.2340782-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221019020226.2340782-1-victor.liu@nxp.com>
References: <20221019020226.2340782-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: b815faae-5d8b-4c9c-49de-08dab175ef1b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lqq4CUW5ZsVYZZc9bqjXEKKRR1fkHeMurx3US/iPjSAkpsVFYPu2QF5hBeUU0ONoJD43FIm3FSqSunKdIxCkcPmgqTrq6vNpTi1VibxjMqbjuqoMCQFsbPQTQp/nlx0VGPy+uOR3jfRbBI7KkQWL96X8LcAhkci0LewI92Pb08xIY9vM+ttMTzsbWWGdgsXR4EDH8yWsaLwb5cnWGTeP7cxrr8r/UHNd8JRSSOabwh62GZeSfYo/N8dv3y/qfXLkkRB3SxNtVIpES4hJdUgiR1LfgFunsfsVo84EXLdk+i+8N22cT9S1SdTgN3XUrxmOZ51ENl/7qAwv1A8VMVuCxwqfOLCn69wD3KJARlmS0634OUjuTfOdqlQtPJFcnRfwINQr3UmFcFXMwFouxoSBkJ38rmOY27X4oZoN5fFk1+jYco7D3ln6qyKbp/r8mMFGqxYsknFKQP+6D1xeB72gL2fdAY9W/76FXa/sOli6yMHRyNvtPFAlBV/AjLuQwYW6J910EfMCjaGa9YqXLElJ/PMMESOs8G0SrZlRCfSBxMDi/YAxTUcCFkj1qY1lFMbpoQqXWRH6Q3R5SrcIFkrUPCjuX/usiYTC/pKLEj6ulrd/mVM1iAlD5RSPJ1mjvUouVlbouuHcEyLiwE8qJkTJDdwrFYuwYjwOZuqJpEBSGy+itWFfpGRl+ztuf2b9s/5veFTnakyTU7RKDR+T6QUC48nvQpaQXY5px1mvVgFz0nxMzA9xYaCLLsMqMN6A2GQNzuSQwR7qJqigme+yf1tN+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(316002)(8936002)(6512007)(5660300002)(2906002)(2616005)(1076003)(7416002)(66946007)(66556008)(66476007)(8676002)(86362001)(186003)(52116002)(26005)(41300700001)(4326008)(6666004)(36756003)(6506007)(38100700002)(38350700002)(6486002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lmT6L6f0gOOdHc68ukX5NYob1URZh0ZaXUMYnmJZoj2avqAofZJMvbNzE+KJ?=
 =?us-ascii?Q?2aMaWKcc+51KLI0PrGT+TlpfCDCogGjxfkKpj7tIVhJFwjHu61nQcdgqHn0j?=
 =?us-ascii?Q?jAWJF99MG5mXrgBYP/OPOJvJrJMZeSDxYTMk9bzA1JDRjyzylYWkZopXZLqD?=
 =?us-ascii?Q?x1eYBngFJ7jPaLE0lJz433hnT5txKRbc3vapV2/BRqy60PTv6qdFBjBQ4F9n?=
 =?us-ascii?Q?2AdmYv7ypVLq2pKvC+CUgfRDlpEWbBqxNNwlNWBHgSAQF2XL/TicbRa1XnuF?=
 =?us-ascii?Q?Rfk1Bsyfhba7ik9XUuNPErHH0eNjf/oPC5NH4kwHYjlpg00GH4gTaVThrRRa?=
 =?us-ascii?Q?3jLgjV0thdLQAy+Lm0PdD7fmPWqoga5z9AaOUXsRL3TCMOcnF73nvUTMtTqg?=
 =?us-ascii?Q?sScnkfK9jW5Rb6G/zlpd6q1G6rSWRNQsX8S0iYz4Qg16sSSyPLvZ8cep4zVD?=
 =?us-ascii?Q?Hg1jO7xBBho01OrNp1eibnw/+36u+XcOxoDIstBOZC6mgvCO4/nG5jZL3rHc?=
 =?us-ascii?Q?qWF4xZoOcvzf18yhbtRC0YyFcwlARiRT2HbZvcfmsCiIN50r6hgEmAQOKEUE?=
 =?us-ascii?Q?75VIMLMMZZLCnKepqtUrpt1m38YsmskZv5HPyB93yb8kFxXm2ABXi/ygZwHh?=
 =?us-ascii?Q?2/aOoooTDYGMS6CLAwVyNIBAF/2Zk7/nJhI1wJ9j6OTXDoW9MRxd6JhOXowb?=
 =?us-ascii?Q?kP0bqlCu2egy4bichYtX+jXt+2bI0RZiNl8+g2qeuvlY90mJ4X0sYLsXBISL?=
 =?us-ascii?Q?YiC1in2TehdzgToTCnhl0xgepNZKqImjUsG2oHP9EpEB+A8In8f71MWxRFN5?=
 =?us-ascii?Q?mvWgIh3l52UtvbJeA7GSeac6JLVyAo2P5IuN52GNP7a5yKa5suNb5XWP4di4?=
 =?us-ascii?Q?kCgWZzqmW9dOHtrYI4u9qorQ/yodaHLAi2bwBUqq/v7QeEeL9pCXYjJ0uqHn?=
 =?us-ascii?Q?n88hsxjWF2f7l/V0R/RZSCf/IoAKGnMFRIh69dbJSd0VxTW6LaSUSE8MWAi5?=
 =?us-ascii?Q?dX+TJSamVf8i2QuGUV/YyWlqgKJkicykzt3o/D2w3BPx3f1UMZAioveqz+Tq?=
 =?us-ascii?Q?zZvkaLK3vIrvt2Wkel1nvACibNK5v3A0uf1Sr4cMiF7TZZz8tUZO6OCwvFgm?=
 =?us-ascii?Q?PVOAkWdknLoOMOUq9s5GYfl9f30BEa69J98hPx7d+zaC/H3zZnUbXu5AbETZ?=
 =?us-ascii?Q?XRnb4Y+M7jFk0lEqMT+/80dn6PC+TNasjwrSE2901+cnS4NiC3sTqOEsxTT1?=
 =?us-ascii?Q?EvlKd2zwwO8gPb5MkY/h/3PEgSkq4WryECU2vlFOsDjJAXBCcB7TarK3koDj?=
 =?us-ascii?Q?5dtAQHrg4d24BfWadW/iJCwOZxr5P5wxdNm460RA7FupU7vAGNjqaPxOt2QM?=
 =?us-ascii?Q?KU0UtfRl0whJHo7DfxtzC3fv/c4xvP8DUxGpM3plZl9hFihP70w7JLZVJTqW?=
 =?us-ascii?Q?JItgSsdImmo50w5zeuNzQWZK1c7Z2QFKCBXYoJ1lCKx0ygJId0DGMpp5N/oZ?=
 =?us-ascii?Q?Lt59HdpyeDn7QADep5SJG7nUbNWfa7gb/BkLzy2NV3E9IfCYe50rRh/Qy0my?=
 =?us-ascii?Q?dGkA16b6JXbz42FD+Y087B2KZS9Q7kQ1zjh3elYn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b815faae-5d8b-4c9c-49de-08dab175ef1b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 02:02:11.0459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A51J+RqtB/TbLhJlSnit3zD9+r2Fgmvfn2XatuczyUFONvg0XLbf/Tl5wRr3sqjMolrdqt44o0WovPbi/h3RHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246
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
Cc: tzimmermann@suse.de, marcel.ziswiler@toradex.com, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v11->v13:
* No change.

v10->v11:
* Rebase upon v6.0-rc1.

v9->v10:
* Add Laurentiu's A-b tag.

v1->v9:
* No change.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..a882de9ed4cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6902,6 +6902,15 @@ F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
 F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
 F:	drivers/gpu/drm/bridge/imx/
 
+DRM DRIVERS FOR FREESCALE i.MX8QXP
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
+F:	drivers/gpu/drm/imx/dpu/
+
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.37.1

