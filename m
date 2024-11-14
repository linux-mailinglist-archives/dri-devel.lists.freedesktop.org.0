Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A49C837D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 07:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEE510E348;
	Thu, 14 Nov 2024 06:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="i/NYgLAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA4310E348
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 06:59:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVoov7+TWlTtZ6sAF1gYkdnvaUMAo/kMZlfL8Oa2SDzCqgTqDi03yT4/STORUNCbgpQXFFsyQ7t1Yksd4PIYr34exHiz2KynuHjGB94w0HIhTAK6RSHApP/v7Jdv5PzOCjArh4w2uQqvPq7WJfGnU4d/EzC7YUcK/lE5SARihi3ho5xwXnrIdDT4VhwtJ1lXofjFzlIeOmQnM1QGUIbzRr7xJzAu9qkFSqY2VJOFWLiEXtIBm1Y/PN13cWUR+Q11G4vQg8sAjtOnCio7njlxSO0SYnqbw4SoxJRhEk6PY9Gm/Yda3vf/bfSwUUNvA4oruJqgemOyCsUV+E5pmHuHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RFAx+eG5slTsR1F0c8qXKsjr+VlAIhrhp3hD/H7tAk=;
 b=kMAKZ67ZjmR4HSgQ13EebjnrGkDBCn/T6/KxVcdmU2GJ+1t3Ne2qGsX7Rj9ojug0/i6ooLlx5MYIrpGrgREGu7EjHE02FskAzmfBcZS4sAtDJre3EG8GMTT/1qOP5rF0osMl2FK3lX48Mzxm8wl7GPOhVPWCZ6RW2watOb1vWieW352Dyz2KhzJpuV53Lc5amftXn7wlMkJbpjUnc0/TJYUOtJA7HccQCI/MM9jsHse10xQtMsVQ/YNCaBXFXinJ9NhTYQXRj28TTfwQKC9ScrBAkpFTsLToVMzmE0AxhpBijMGx0x/32avY0H/+4o9WiN90lK3Xs6/xMfSXiKY4ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RFAx+eG5slTsR1F0c8qXKsjr+VlAIhrhp3hD/H7tAk=;
 b=i/NYgLAMxMqHSprGf8jgKMlY55VCKrZN8qScdWTew4E+8IibZAel/qKWoEEj5lEoPotqgaBsFqqtl76gXLQLhr1dUEJfN3/7rMnbeI7JQXflbkAnwYZjX8ZgzjKFkZC9KLXsm+07JIVGWPaZqDlZEqAzt/nF6lYZpi9GgWIJGqEcuERQ07n8rBZ6q6+xeVW7Nb9fiNXRYUECx9TvAK33f8TY/f5nBPj7FXvgCkjRJF6IWExAhzPsAR/aUL/3T0p1iwfVg0iWxbVNXmqTmYoFzSXcvpKehKJOSIMI/F2gqjtuzIYkXJjpD8i9tYwtMi6K/s85coUDqg2mfdVa7W0wGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA2PR04MB10278.eurprd04.prod.outlook.com (2603:10a6:102:408::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:59:08 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:59:08 +0000
From: Liu Ying <victor.liu@nxp.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de, Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v7 7/7] arm64: defconfig: Enable ITE IT6263 driver
Date: Thu, 14 Nov 2024 14:57:59 +0800
Message-Id: <20241114065759.3341908-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114065759.3341908-1-victor.liu@nxp.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA2PR04MB10278:EE_
X-MS-Office365-Filtering-Correlation-Id: 3260269a-3eb3-4795-115a-08dd0479d5a8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5icwBDVgBxeJ/pBB11DRpIHISDptcUh4EKRKhvMrz/P7XzSz5z7w7ZhuoLe8?=
 =?us-ascii?Q?fK9EtzXHUUmPWCEr0vfY6/rCF13PMm8CSCnoC83mfDRv45s1R9zZAOvZi7/I?=
 =?us-ascii?Q?QgrfLg6SaVv8Z/PloveeuooKqSEINVsmVWMXXPUHcWH8b8vfgDKlE1OWkO6Z?=
 =?us-ascii?Q?POyILwyesfi4vm7THMY6Gp0jN3vDs7CovmblC7l27DfMnxjDwT8NUgJfOeTS?=
 =?us-ascii?Q?MztETTfBgfrmiz99ePDsEpo2Itmui/yDeylqJYBpYTM7S5P0tzcohMrvv5lf?=
 =?us-ascii?Q?hbWQY4BBW5mo8l8EYVqb0HLXJjEJ4QgPmL2+AZy7Dqr4x+LKvvlQ3k59S4I5?=
 =?us-ascii?Q?wVaX/0Fr2lnOrBqv6+i0ahjbiBSY1WpJWlM9aNLjfwtg96fs50eZqnZFmEqb?=
 =?us-ascii?Q?w9c4UpeavVXiOA0KI+IIhNHa/EIT1e4k6Rninr5HUA0J6VKVDTgFKmRqPTZt?=
 =?us-ascii?Q?N6A/guswxjGVH44EghHZJXo4gUYTBFN0F3lJGHYQJxYPOc3U7LZ30FSm9lq5?=
 =?us-ascii?Q?tUAZD6LIaCLSa0PNQuHPMftm/14XxBQaj81NB6rMd4P9cTjzrKEhx6+8ucSC?=
 =?us-ascii?Q?2gJyDt6cyYE47CDxkumRdGSeKJvKtA5m8ILCwIJqtcihFRW0J14y3j+Xccq0?=
 =?us-ascii?Q?pvJTcIpriSvfHr996rb3ygWfbKSyqpsqOxuREbQq69xMvrztMrK0NFnBJC03?=
 =?us-ascii?Q?otO0vlJ1Bta7T6tu4OEPhMQ/tkdfUNMjJF79SjkUAKIDVw609rvCQOW5vLsi?=
 =?us-ascii?Q?klps2h7tIEnn7OqmcOfDtuTjVEW2/Bi3TJHF4hB9J0H6YtJvX6c7RXUJvcMB?=
 =?us-ascii?Q?bX4RSqmhqZzP2jvu8LzzlPCGO1tJOn6zU2uDlNd5z6AKPH0u50i5XtpPp8L6?=
 =?us-ascii?Q?/kFq17EiWoW6zN1JCybnXszobI2EfkdD7WEcYusq+KSDfxcR1ll1Yjoa7Wew?=
 =?us-ascii?Q?zGAINLJ/R3/fFKMpGFyNLFHBxkSMN/GG9imPuVCh+ysxDUWYNqHe9DkHx662?=
 =?us-ascii?Q?JJ05VXjaIp/QG54Xyd5vLMGO+7FwI+MOZuwuPAGSexGs8PWyb6EsgeJKJfbI?=
 =?us-ascii?Q?o2XdDcBJI6ENCApnNuJi/fKN1RjdhLGXkitqud27aBpArORGZnacXSv7fHXZ?=
 =?us-ascii?Q?uq/N/P1y/+EQVxIQW5LmOZWYDqMOI42O2ygiWYYey+5LIOVbpVI5n5/k/Nhs?=
 =?us-ascii?Q?uhbGVGax0FaFs0w6ZnCMg1jmM8yFLbHwIiZStOIpG3jwAOVBioXEQkhZ6PkQ?=
 =?us-ascii?Q?jG924GVN6MH6RZXThlecryBy4Q97iirdIT6bDNnpIUweMmUfQPtVS4CL55ii?=
 =?us-ascii?Q?/rR/VO8SaDfa+61DfkVLl/vTBW6ZC1v7zj6woTWb1+ADskSv5FxsH8H2wcVe?=
 =?us-ascii?Q?ndAsJMA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A2dluw3xWi88DUP8C+8ltfsYw+iuSHap4EHc1/mlwMtr450KNaJQ/yl2W8ZS?=
 =?us-ascii?Q?r3ivvNBOlV5qgpDThFUrWq90AKEhUEFM4a4l5s0t0KS0ev/XNbjQbtE2REFa?=
 =?us-ascii?Q?EZjXOnSVEZbNmFHXG6EmFy0K+9kUJCSUnXWAhGfK1Cqm1ZmAGBZRVmTgIh9s?=
 =?us-ascii?Q?2sG2KuRslhxcw7SPzbZLxY4yuB/3It/aRSJjozxivj9KJm4QIlwW3nkA47Jf?=
 =?us-ascii?Q?w5FE8UmUqxWFVec6nlEpvoyCHx8CC9iwxwMzqNxOL9mMvdp4uljRkxo0GHVb?=
 =?us-ascii?Q?iRF730tTlfcD1Sos1VgasP+7UeLWQ4jsfFyuJah75lu+Bw8IbK8mslbBm6np?=
 =?us-ascii?Q?faDe3I/xD/4kYpoKlsFvkFVLRqyzNyrZB90BWxBSU2SRyFiQM8BZ/dvRhUWg?=
 =?us-ascii?Q?RyEKizVvUGWzfLGRVap3rknWJk8BzWfylNrNHK9cyLBzovHHMV7W2amwSFHk?=
 =?us-ascii?Q?l8ZKRPWhyo/ESd3Pya6T07/cW72ghNBkTDYgySOv6Uq/vxOn/TI2JcIQnHNG?=
 =?us-ascii?Q?avJZXQ4Ey85cjSSbtGyeiZ2zhJzo/GXynoH2FSfRCLF0HFlMEs1ixFEKuLQK?=
 =?us-ascii?Q?U2U9NZXcJ+GP0HeUs+RIrDEXpS68eS7Ua4aTywrknKdMi50CgspK+3qQ/gsT?=
 =?us-ascii?Q?NEOZs1HIMubpleBJHiuRgTAlYlH4GeA95LmmVafmai+0Hy+yh9Q6ypdW2z3Y?=
 =?us-ascii?Q?ZQ/Uu4KtyeZnT0vHSZjfG7G9XdgHZ4rjtY/amoPJYmCZnjjnapnUDl8pgkv+?=
 =?us-ascii?Q?uWu9b8ox1H1nz8YeB4rTjbTjBR2uTgohUoEWrGP3wRryEei4n1jfJR1HRl7m?=
 =?us-ascii?Q?Eo8wTtoXPiUl4uHPoouSsv5sv+xL6egaXL0DwNWFdQ8da4+Oy9mTGyIDcwQY?=
 =?us-ascii?Q?rDSPPghtpUv6F5BzaO0LdsuZlrC5ViIwBkze8/RGVRnt7ZcvMGS8zsjvq/QQ?=
 =?us-ascii?Q?yScFg2S144wzRtqQNIWtZe+qjGJ+lE42SGW7nVNna7uJ4yypMtftOY7a+gk4?=
 =?us-ascii?Q?rCDpj/TbCXMmDzal5U7vmpHPddss2Sdmxu3Hs7UOpcG849CcBq9QsdM0R9SW?=
 =?us-ascii?Q?UPy5MvkK0lz0a8O5VnK++UnUpCh1PfNhffZIu1wyq2gucttH6hpV/6KO2pcw?=
 =?us-ascii?Q?IO0AeDPJ9LnpdTv4dkDq9r5mUHp3xr6YSD0iMs3QgLtg5n3u+MkowBWHeaf4?=
 =?us-ascii?Q?nYy2N20v38Imw1JePFUCYa0PgnK6FKwTEaND/+j+FaQzh0wDFGQa7eMmLGLr?=
 =?us-ascii?Q?8CNt56XzdXQO4Si5Ygh//0Fe56FBXrW0djDz9VwkZzux1bp8UZ2T/xwuNGQU?=
 =?us-ascii?Q?R87r1KlUG940sb4aLwC0tCpdTr+HmePPgc3u1wUkI2vCOOi/xdS0oKGNjM2+?=
 =?us-ascii?Q?fDOSigb8JWqCD0b7lfbHNjZmCPX/t5kB7pQWum2BEgcaxiHShpOVd6QjV0ik?=
 =?us-ascii?Q?cXljqO/kg97nFARSfFzUrVKQqIhHrNNZ7Kjh7qp3rz9EFurTrCJ4gwhKK337?=
 =?us-ascii?Q?gVTX232zWg3nZwCmHsfM4jgjcKJuQ3vfHkvhTu1avDJrbgat4reFoSsSVT/G?=
 =?us-ascii?Q?jjwNZSDyhY/n3JJwzWuKPeZwyZCq62AugC5C+rTu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3260269a-3eb3-4795-115a-08dd0479d5a8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:59:08.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kG93EY2GycZKPraTnuTEUWKGZ9XCMBrirFaHeXI2A3m03RVh+aiaANSUI83waa2JbwjpemqRw0SIgHCC2ZRJYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10278
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

ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
and IMX-DLVDS-HDMI adapter cards.  The adapter cards can connect to
i.MX8MP EVK base board to support video output through HDMI connectors.
Build the ITE IT6263 driver as a module.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7:
* Collect Biju's R-b tag.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* No change.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d13218d0c30f..9b20b75f82e2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -901,6 +901,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
-- 
2.34.1

