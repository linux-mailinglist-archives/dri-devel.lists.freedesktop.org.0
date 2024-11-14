Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2C59C836E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 07:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CFC10E7A0;
	Thu, 14 Nov 2024 06:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="T8uGMh4W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A456D10E7A0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 06:58:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDkv2g5VtILIolC5YSytaSZsGa2PfZ7WOK262GYQAPZvJT3h8roIvS/A5SrlF8odzpMJrjcQ6Ge9d/inM9sC8NyD1GAm9ff4wPK1s0vBblrldm6kXHrplS2pvSM1gu1gp5RFhJZn1ekdAvUJiYR0xlnt/Iyq7e29jtFJM65nCE4kTvs+vbd6aDYkpprXkPJ01X0PAMynaWYx6Jj8TbrzllMCE1e6aIC37k9saTpNN1DJJ/kDpEDClZHqDT1e66gKOnD7sclQzlNrc+1y/bGuwiNSwJKYVSarB7iH8Gl9e1g26PhBAk0EIiUOrMinlt1OXubwsh1fvEOANGQn61fQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnE6sVd+9Xicb/i9eboO3B6IYiB5VE3HFC4Ua1xPbQ8=;
 b=ZSPVgexP8B+iE7Hh1zecy+kySMiDyzUBBnK1Mh+YGiGi5dtOzjnOXHlqK5+gnL6XheZzEghSXo/wOvAhDxwczeFykaTh3nEzrX1Hcrla+6BdkC4i3x7fXZaivxj9vMqICiEeyh8nGiaLZ1z3arBhUFvUJSBNGlk61fbZ4dJ99AKp9McIcEFxYua2b9tkpTX/7Ggc/gVZsnOS8y3Q/0qJFLfQziUoqttDBn42qqxZzlujxLyLAw3z54+TueW3cWLIRLuIQkP8lfxBgzqoLvmECJMvy+7XBA7Mj50n+MLefDauKeIgLmgCC7pQqWGXlm4uLROrFg5QnDfTzcWC7e14Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnE6sVd+9Xicb/i9eboO3B6IYiB5VE3HFC4Ua1xPbQ8=;
 b=T8uGMh4W7aV0MQQVcwy4e5D1Wra4YJeZekAkAVbCWepwx0U07Ar/TLeZxShM9sWFS5Fh8h68wMoz4EcUeWMvCuuwV2bZB5PFEY6z4UA2SHF2rp38PzBqRUPQYvMW0f6zUOnl7S5pHYyGCwTeLiUQnCa2AHon15qshb4Nb8tcz7DesfDLr9+X7kPBxwyBzrsyHolDboiy2HuiJHZ06pIPqPEJSRULjBp41Xsrk5s3FRUB6LYQFPclsu+JEjHKpm/BzCB+ZsZ/P+M1FgaAkcDW6d/hsamVCwCmRhKAOGH0QSNFS+Cx8Jk0xXiw/bkzB96rm/D5lokJYAJUuEaqwtnGVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:58:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:58:05 +0000
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
 marex@denx.de
Subject: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp pixel
 clock reconfigure parent rate"
Date: Thu, 14 Nov 2024 14:57:54 +0800
Message-Id: <20241114065759.3341908-3-victor.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d4c226-bcac-4744-72d7-08dd0479b088
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sAlztiED4coEkMcStXU2NsH6jntbPw7312Y0/TU6N6/MGk7h0brhadLHhxTx?=
 =?us-ascii?Q?oWrKYbSasD0T7VqIvvUYE2ehL7qese61mrQnqRr+XO6a1tiliIXVH9OQ0zt+?=
 =?us-ascii?Q?/3P6jjc9XWHxUlKWcpNboDmovv3pxnfyRskV/AAC+AC+MrdNlEJjFNZHTGUI?=
 =?us-ascii?Q?AMGc9fN5nZss8JNrtsLWFEAGe9GSengutnHPz9xNaaVSe2qEJ6XTm5ixlnik?=
 =?us-ascii?Q?/YxkaQMnavXwkWRK24eZsYzIAHYDmaXR9RXzNlpdrLhG3ruToZAxpqam/NxD?=
 =?us-ascii?Q?b9g0kveChWXlTGlfuIXuYerNf9I2hnsR1c/1xrsiPyWj+BSWqp/8NovI6Ow3?=
 =?us-ascii?Q?3t++H+JReAwQrYNHkgf1WImiPiBN4qPSOy9RqULBZqalBCwLAHF3l+1x7mQ1?=
 =?us-ascii?Q?z6UxHkhkGukFxpecu8rfjuD2ShRBHRWKvSL5uKzWiUnNCzGdYdCMfOmgLvh3?=
 =?us-ascii?Q?i5Nd+aWhhO01877XceuObr1h2o5ar0dTl7IIsHwjGh0voBkFn6Jr/Tg1xnFf?=
 =?us-ascii?Q?5I3Cq+vsckv23zhDOFH0TUoaxS227xHDG3NIREqs2H0ySo8J6AYuWJGQ6InR?=
 =?us-ascii?Q?D7m1eg+OdtU324djImxLKl09GyWrLx/V/q9fWAjd5qPLWxUHw5IdhuEU2dr7?=
 =?us-ascii?Q?vZitcBd5y8ouhAVhGU20zactaU2q6U1yYkTR7fq1IIGHppbSa1xBH/OaX2TO?=
 =?us-ascii?Q?vO8y6mQPHQQR4wXlkLyeayjMWXcgXLlLbBJZzAVsFESFG1okxNUCTeEIEU2B?=
 =?us-ascii?Q?hRSzEXy1687RR04omoegXdTbDic9f3qk8EHP5mmmvfidoElBJkb7uF4dihpx?=
 =?us-ascii?Q?uBFprZJ/1LRPnJ3JTkhm64M6OfIsy7h5PH/WIf1VtkxiztoHJlV9GVz9dizV?=
 =?us-ascii?Q?ToJMoEd2Fuh3yAc5pFKjsxIN7vMrE33WVBFu5N1aZxKzk5Wc3phkv0y1aV3x?=
 =?us-ascii?Q?v0ax9Jd3uuNkXABAR7sWQ8mfCvtnxZTTxD8xqHamC5pBS+Xc7vIS8WZnMJ9p?=
 =?us-ascii?Q?RjBFdaZlpX3pxN/jk0AXxWE9EEW6fYsEE6ZWOQpK0CoLgz01/2zmvMbsGaTA?=
 =?us-ascii?Q?QgP/hjv4VTnBc4lAncG33xYh4uW6jaQRWM+9Kic90+0sLXhS9fInzBJ0P479?=
 =?us-ascii?Q?Ua9oHNt9avdnv6ZInsUNRiKb6dW+9Hx4uH2lS8DYy4zaYikd+6bpmQEu13I0?=
 =?us-ascii?Q?cp7oaOujG9vixE7Qap3zlnBYhjojPUa8LzfQMKjfJobCAGRGY4LGu2CLKn7x?=
 =?us-ascii?Q?qvMJuBaSVlYIPOQyX1LrPUE5lysmMoB9DIpW+5uQxZKDzWWBg+gN2cRPOaw4?=
 =?us-ascii?Q?XHLaehK/UnYhnYPT2sFSovTV74cBcMWtwuAFZjN9W7fhnrYEQdAFXcfSnZzb?=
 =?us-ascii?Q?7PqAFl8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UVvPMVH0Yyr8dRTjZFCLbBf9g9Q1f8Wrc5YYoP8D3vk7D0waSOTaKigOnf9v?=
 =?us-ascii?Q?8oc9zS+bOC0qTJWoXWi8KJWIjMJ9rr4hfxGkP3s+mNd59iJm6YG3eSkdqKZj?=
 =?us-ascii?Q?RnG3oM6fF53/MvYil3BgBfoAzQjlQ/jPqG3Sr/zQpoog7S64Ih0MFrh+MOKv?=
 =?us-ascii?Q?y6PworgaA2e8RNvDEboXcCtTmGzLuEUw3PCjqBGm6ahLeifV+UaFaCwCCfKL?=
 =?us-ascii?Q?5ycY9fEipGiderVD+oXXmSNGsps/QUc9M+4Qmqy5mgI0092OXSKjwxoD2rVg?=
 =?us-ascii?Q?21uNmJjRPt4g+a72ifWWnGG7KygGGP4S5XmuQhhAJRlCdHBjrEwHoONyquDs?=
 =?us-ascii?Q?oBhFQ2VHMRbA7ElxZgL92vJMphWN3IUP2MIxHZCeMo1o3N1mHHZz7vuHfxMt?=
 =?us-ascii?Q?SuJTrzNOWgYwD2lfefXyqSxLJo41LHzlBrMCnT0fGYxIM013r0BQ4X68qfZD?=
 =?us-ascii?Q?xRywQP4zz9VI62PQ1HgYIJ/7K9cwzlcAjNEAK9W2GYOtQqBS7YQ9tB7b+zQ+?=
 =?us-ascii?Q?Cyl49qWWxYPdgPyt66COecEA4s4BOmnzM6Fx5G6CXqmy0FzVD7T6gkPubDU3?=
 =?us-ascii?Q?/mtSlUTXQqw1tFWGzsdvjMkt65qc3u02R42yVMsarVXY5E+S2GGypVDudAkJ?=
 =?us-ascii?Q?OmavyJ7bzQji9qrqM6P/3GfwH4OgMfdbRnqcnE8H3YUageLQFYxZOXgfxvuE?=
 =?us-ascii?Q?O9E6uYr2RUduGuyNjO3RZRAwSWiHa38uInsa0LQJak9PljZiyhvj0Q2hhYnQ?=
 =?us-ascii?Q?NMghi6PGu5mKy8y68f4BdXCAMbV2cA8SIH6mDPoJkRV133pcyR5CgqsAAUMM?=
 =?us-ascii?Q?tbfglIAwQyz+P40Emu7KOGu+cvOHRHMs4VwaQ2o0UnPdqKJ5ZpKNprkUs8PZ?=
 =?us-ascii?Q?2TLRfL8orkFsMIWCO3diOjbFm8Yz8lOcX4KAUWUxsj25+KcGOPqQ/J8jcqew?=
 =?us-ascii?Q?QpwA6Km7qJQBqqMXAKCfxTzKiu9nfdQCAFbNAp7Bs8XdMfDYHU9n+vH6vANv?=
 =?us-ascii?Q?P/PMhwi5EsPttxcsQs1/G+hStovi+vbhUBwRqtiTMUKD39F7cm8yXjMikL5o?=
 =?us-ascii?Q?l5sxzrcJLrZA7B/NSgfGP69A5FWmwTsqyoJZHaYYkJIIf041gU9+01FfPnjE?=
 =?us-ascii?Q?3MXPDX6LSLBRihlRYczVMqyCVQLWKufmWdr+r/DAWQjklnZyg9mlHuJjUPDL?=
 =?us-ascii?Q?FSCSo8COYDcTyE5mVtx6htk49fi6UIbQ318RiJa1Y+NJzdqyFltY1qUGbu2W?=
 =?us-ascii?Q?8S6kmJ27swRZvQV1zlAq8GgVgi8QlEArK+eeBGEPIpSVD0fDH7Xao4rZVPvL?=
 =?us-ascii?Q?qXiGgXa9pfFdu67Fx9SEQbdsXPgLc7qhBrUhimay+rLPbKmyt46G1eSEBVyR?=
 =?us-ascii?Q?9zvXZHiY/ZeRTMqZaEoR7eFyfQ21Lnk+qOlcTq08kvg2pH31R7L1dxWwBsE0?=
 =?us-ascii?Q?9f22CjNc4cS7eQCyLjB5OYygPrC9xCRR0w7kJG3ROpEVDan+s/jLpKZYavAt?=
 =?us-ascii?Q?FGtmUUmN0FnSk4qE0aP1Mact8VOKE/J1YLX6IYCXf2C+EG3OCGbjvDw70gN6?=
 =?us-ascii?Q?9Lc8Y2nm/zsb2W5mHwKNkcOZRiM3eA9Xjy5nxXLk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d4c226-bcac-4744-72d7-08dd0479b088
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:58:05.8962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9wSQEcro7MqVaJPQVFBg2NIA9crcvkezh3CGtfO0J2QPxSPRWsK7TykC3C10E/zDG9d9L50+AY9qoMk9CU6FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510
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

This reverts commit ff06ea04e4cf3ba2f025024776e83bfbdfa05155.

media_disp1_pix clock is the pixel clock of the first i.MX8MP LCDIFv3
display controller, while media_disp2_pix clock is the pixel clock of
the second i.MX8MP LCDIFv3 display controller.  The two display
controllers connect with Samsung MIPI DSI controller and LVDS Display
Bridge(LDB) respectively.  Since the two display controllers are driven
by separate DRM driver instances and the two pixel clocks may be derived
from the same video_pll1_out clock(sys_pll3_out clock could be already
used to derive audio_axi clock), there is no way to negotiate a dynamically
changeable video_pll1_out clock rate to satisfy both of the two display
controllers.  In this case, the only solution to drive them with the
single video_pll1_out clock is to assign a sensible/unchangeable clock
rate for video_pll1_out clock.  Thus, there is no need to set the
CLK_SET_RATE_PARENT flag for media_disp{1,2}_pix clocks, drop it then.

Fixes: ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
* No change.

v6:
* New patch.

 drivers/clk/imx/clk-imx8mp.c | 4 ++--
 drivers/clk/imx/clk.h        | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a..e561ff7b135f 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -547,7 +547,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_AHB] = imx8m_clk_hw_composite_bus_critical("ahb_root", imx8mp_ahb_sels, ccm_base + 0x9000);
 	hws[IMX8MP_CLK_AUDIO_AHB] = imx8m_clk_hw_composite_bus("audio_ahb", imx8mp_audio_ahb_sels, ccm_base + 0x9100);
 	hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] = imx8m_clk_hw_composite_bus("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
-	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET_RATE_PARENT);
+	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300);
 
 	hws[IMX8MP_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb_root", ccm_base + 0x9080, 0, 1);
 
@@ -609,7 +609,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_USDHC3] = imx8m_clk_hw_composite("usdhc3", imx8mp_usdhc3_sels, ccm_base + 0xbc80);
 	hws[IMX8MP_CLK_MEDIA_CAM1_PIX] = imx8m_clk_hw_composite("media_cam1_pix", imx8mp_media_cam1_pix_sels, ccm_base + 0xbd00);
 	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
-	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
+	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00);
 	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
 	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
 	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..adb7ad649a0d 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -442,10 +442,6 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *name,
 	_imx8m_clk_hw_composite(name, parent_names, reg, \
 			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
 
-#define imx8m_clk_hw_composite_bus_flags(name, parent_names, reg, flags) \
-	_imx8m_clk_hw_composite(name, parent_names, reg, \
-			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAULT | flags)
-
 #define imx8m_clk_hw_composite_bus_critical(name, parent_names, reg)	\
 	_imx8m_clk_hw_composite(name, parent_names, reg, \
 			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
-- 
2.34.1

