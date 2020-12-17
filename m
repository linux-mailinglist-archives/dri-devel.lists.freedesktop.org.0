Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83BD2DDFE0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F104289DB2;
	Fri, 18 Dec 2020 08:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150047.outbound.protection.outlook.com [40.107.15.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3F7898AA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:09:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APvxvwAcfZ4cNYJ1bj8wvf0t9GV6RhSx6ijWXT6g9hPgyKMBSYrUvlcMTGlVYKlydinqIxuoOD2O5+5IueRQV9WgABXc9I2hCCPydZoF4+cRgGetO4ve/mEekHzB2I4tFLhUl6hTMHiZRDRMQQ15W70MGPRsiNHeipdJSTXsK6G1WVUiUDFxIqIaNem4ALFEbdfdl75AQU/FsZm3kpnE0DR6Zai9gyu8/fZ1Kow02Jb7SIxPgQW84+I5vvuiwK8l68l/k1iqE4hGNZr9vuUJRI0r2tN14Y7V95OTzmHOUU8Z5ufjpQo24dOBgeYoFGt2fjz30+dYrbVZ6GXe6z7ojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BF2scDc6uWH+SWMe/NZDGxcEkfuzT3ud9rfhpVjCupY=;
 b=KHj0cdqoTnj1Oa/YRdx+CskxU4pY1PlC6t98BNdrFqRfxpB9s7vwuJTtRFMhQNaUDs4TkgB/c1OZdXu+jJuvgZ6cyam2+Viw2MKsQ2DANfmfPcbcALRA/7p2e3XBtJqeDDz15zKg/r1/9HfNbUNoLqwTYS/hpSeQ8u6SpqFqzsPwnASgnEub3G9B5x5s4JGOFcCWvbCKXrOcWLVBnp98Z2Rs87hP/OYwh5Xx+6zSH4fpqAOHx73LTdwdpvo0aH6NO3nAn3aZzuZzvzP90nteoekU8cX087ayYxJClceCQuuYTHq0fSNdIxMkzByY98tLyo3qCmySbWjN4XK63Rkcxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BF2scDc6uWH+SWMe/NZDGxcEkfuzT3ud9rfhpVjCupY=;
 b=DHJgFatQst1AVReV6kbk58/SI+hZPnO5KnrM4yF8csdO68TkP/1M+ihf4+ql4PqMuUj/A6fc/WIUxR1PU1B0LfXjFT+p00tGOILhmoQfj23jjtlfgpyxj0z1FrEd8BQ7zY2WQU0zyCkj6sHf38m/rav3LXMimvcBoBzv06YGmXk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:09:46 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:09:46 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 14/14] MAINTAINERS: add maintainer for DRM bridge drivers for
 i.MX SoCs
Date: Thu, 17 Dec 2020 17:59:33 +0800
Message-Id: <1608199173-28760-15-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:09:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 84b7ff28-2b27-46e7-9885-08d8a273e1d4
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB731230812B2FA1D3EB77E42598C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iauia470FRizMo+iDTRWovfD15k1jBvQam4d5p9f0k+cV895EvWUBrhF/ql6v5HhAGeDhwYweLUnXJs6mXMyF39eZz0Vt3RiLH6TeT7VmLx23uELXf05sO+M3RnxCLXwaEGI+ayhoU7MqOww77S+fKttUXECketNW6oUKXHT3VdCyQ2ArVPqH4x9Q2VLXIE0rka1Nb5YRhOD4LtQrqf39bxMuAEpaC47IQVsztZ496uFtW2SaGT6r3OrKz8WplK35037nfjhYDMfnXzVe/wwD0lAWF35bI1T67qev/YDXc0pX0Bg7NVl9VT34qkoIHS+4TQsV6QMa/O6RCHv3TRtbnuCqJrWXsRc03/BNr/Xam3Jqc+JsZW/UlXVXedQpDxl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(6666004)(316002)(86362001)(6486002)(2906002)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(66946007)(5660300002)(6512007)(69590400008)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?a83V2e9ZnnLD6JenLvV8qdYlSWa3jtjkjQ/FscPwvdLsJ2enbh9wkNYH2bhu?=
 =?us-ascii?Q?zReWNNKGGl1qsUYE7B/su/0Ce3VB8j2FjCaRyAmTI6hm4LnLf2U+GobaAuYx?=
 =?us-ascii?Q?6rQXCmUJs832FVrOnUHcF0aqgaCnxIST8f+Tn9vSPt9nS4+/Cm5yeAjJ1qnG?=
 =?us-ascii?Q?1LJ1Pw8NB2khlaNn8qJJuviwAdtCyOu2flHAqKtV6NWE1Lrlerl2uwdCYHLx?=
 =?us-ascii?Q?Jos4cU/cVdvnNVI3XhfWdi9VWC9a+9pS/mpglCuifTf2ETka+w6obvUvHqUV?=
 =?us-ascii?Q?WRlkc7cUbDzgtnieRgApDUDtwJJPvKrMJHyJjQT7XpgZa9LLekTC94AJMEV5?=
 =?us-ascii?Q?gKogcBoaY/OLt8fY3V0IbE5Kq2WNAtBCJsduoTwj4vbDML+DN8JU35zK4lqq?=
 =?us-ascii?Q?9Podk3jifLdPphppKE3SvI1bVyHL3cvmcTb6sBOQWPEyLuTg9hSPTYHOc+Lf?=
 =?us-ascii?Q?7pg4TQkD1rvHo6x1/bsQ5BGXFFN//LURW+wMds1yrOU+1HzrzuGl8ZhG6Qec?=
 =?us-ascii?Q?mXFl3gYLMISabj15N1RfF5EcFxEQYIbYUNMDzEDqIxdJ3hWlIahNHk/ZKnta?=
 =?us-ascii?Q?M0+xuyG0xdOiF/SNAXOZudPQfzuY8W4Uwx7X0QGy25Xc1f26+cWeha8pTFAt?=
 =?us-ascii?Q?QrpeNTOr54YH3k2sAUQieGXgg+LACFq81CVM6wdv/PpM5MCb1IJ4h8KWgBk4?=
 =?us-ascii?Q?HlV/dyAoqky6z1kI6b7+2bTJdwBLTsSG5c6o8Kem7SbRqBOmnPhFHy2H3otL?=
 =?us-ascii?Q?UmS0n8xVUCMH6LHeBw8aKONAtJQtP61lY9GB9d/rPoob/7PvudwwFe+YyY2c?=
 =?us-ascii?Q?Hz3olnYBr6Igp9tQM35CGmgAat2jIzrQP70RkBlHiYtYCg1hGImKUDcwSdn/?=
 =?us-ascii?Q?7UAtjUohsxfY/29ssV3DblBjzYbGQeCNHYsyBTIWo1JzQcIIaPm5g4omC/kV?=
 =?us-ascii?Q?UwzEHdyYfAkLLqn9IB+wQYW95ksSs5V/jIb7AoTWr+Pea1y9m5r1FyUoxyx0?=
 =?us-ascii?Q?PApw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:09:46.4841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b7ff28-2b27-46e7-9885-08d8a273e1d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+g+db5M66YyMH4b6NnMxKqIxYCZdUXrz1pPwrMv9pHn2KdMQMCCjU/w6p7SxQ7LRRu+mrjCF+vJl5dS2yHUZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of DRM bridge drivers for i.MX SoCs.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b073c4..4b4e40e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5846,6 +5846,16 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX BRIDGE
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
+F:	drivers/gpu/drm/bridge/imx/
+
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
