Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED0EBD544F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 18:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A28A10E394;
	Mon, 13 Oct 2025 16:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kx/mkKfL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010004.outbound.protection.outlook.com [52.101.84.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF3E10E394
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqYON3ZCKy56lCpO8yuBUtQz1cVlcgLLmRErJxmuiNclhJfM3b+jp5bUiAEcM1q14TI7dEufYO+32EBuegFcAPc5XS/CtBUIHxSlI8sEWMOee+tvhFkJuH/+DyjkzIp2vK774sGwpXyDirCmUL6n7jBiXrgIMdgL7TuVB9md9gchtIbsQ/Y0/YNLkZjUJ7lRKRryMAxAykieKJ4Pf4lqaihzQ1lHUL4u0NlLBGD6c7xY535+DRLl/g+VLMSWfZjK04yPqmQieugkXrWPHYCt6hD072uh2Q2kqeeJVFDKUT7VMrqCtgBZ/0jvgH6dXrUKELMQ1B7f6cWaiUc7akh9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ax6rEfrPSJPWPdSN2tgWF7Ps4xuf2Pg+CbODUGAF5s=;
 b=tr4Pgu+VS9NeqY6za3ZG8BpXk8LYdsuSebGRRRBVhvkfU5yQFIvzqGBUaeVdGbJvN5L9knspi/Ousm6FGThmUvP0OrA5e4uamfqxyJ5X/Ld32neBtyorJGaumYSr2UJ4wB6bR8TAERNSYvP7RgmPSwad3W5CC5AkMml3ACjDx9idPKWha3ubzjCWZ3dm2dUTx7b0dY1c9zp/YgBrFiQ+SQxmNBMrl6WBMyCRlRqlWUhs0SoWjLBuFpgdoCBr/p4NDP+ZwAHFl9oQr96EG1Ev1Rc+xF9hVlrgYa+C0jNv9lUTAmVeHQSq6zpxZY4ZL1xqLud0hvZqg2c+yB/61mmsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ax6rEfrPSJPWPdSN2tgWF7Ps4xuf2Pg+CbODUGAF5s=;
 b=kx/mkKfLwlVcQdJpZMS8zu9PPfJf7bR2CBPAjGlL08hb14ZRzEwAjcVP8UAwuYyANKjQXD3Wtt1Kpxy246IvFPHsh2Ms0T+N1h5XrVQqToHoul2ZKOyRavIxwpzooYayVOISjRw51Yo4uFLfEYbXuBZ+QDiox3tmJmrKE7Iu/1zDSksWnbgs9u7De5E6SuwPSodyc6B5Yg69S2Mhl0AtNd2hvCjFAA2Dc8gzWhbGSfYtxzT9WbskiYMbL298pAJt6Ap2yzDST/MpznIuDV6XGoVUI3xFOCItNKSp+T0ZQs+m+Ax4+XELpZpBZly7fsc+a+j+4Fxkfrt29oYMx2qpgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 16:54:23 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:54:22 +0000
Date: Mon, 13 Oct 2025 12:54:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 04/39] drm/imx: dc: Use bulk clock
Message-ID: <aO0utF930vhlJFl8@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-5-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-5-marek.vasut@mailbox.org>
X-ClientProxiedBy: BYAPR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:74::39) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ae8843-9930-4f82-8220-08de0a79286e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gcUayU1dl8wyFR7nZboG6lGU90CnyAtEmsdNBgNGt8ApdXQ9Q7i1gTz7iqpk?=
 =?us-ascii?Q?HJnbJg0h/oKYXhfKkxZj5AL9XFaIuTycgV20iV7Jopel0uU1x9fZYhHWzGOh?=
 =?us-ascii?Q?iU1Lzn3mEnEqmAE0I1ermEttRZW5qj8ypGqcYQqD8ttE9+ZzdckMbNr8k22R?=
 =?us-ascii?Q?EqGVUj51rjuZJUtV8ePj31gGLNLW1MKL3IpHw4vUJXHmWtwYxXF3GVxJ/r1E?=
 =?us-ascii?Q?NZTkbKRK9VNnUGiYqjhNT76ebDmx4agJYTDf/IakLycgHKpF4J+xaVmlSmKZ?=
 =?us-ascii?Q?4t5JOJkn6+fjMC1W0xD2uBJHPK5jgIPWEgotTb6s/b0FGemcSNC2Zsho6i6i?=
 =?us-ascii?Q?Rri8wg+xpJmJ62gpVKmbHKBiVd2qv93Pkb77rxFGK+vfJ5D4iy1QxXsPiS8a?=
 =?us-ascii?Q?/EEq3eTXQ9DG0ZzVI9ujpZFtBWbItB49Wr7l1km1lADA5Kn2l3Wpntw9OO6I?=
 =?us-ascii?Q?xI/SS/zQCWmu2KCONW0q1PWjT4eFXjnMHpxGcK5IUrQAzWf3SkOEmCL8MuOI?=
 =?us-ascii?Q?D0seLHY/eIhd3SosLzkpwOczS52KngRHpwPs9LUtEuUYZe1FXyS1V+qWpYKk?=
 =?us-ascii?Q?nMOPmrfVyjKORpY3qOV+vOQP5j9z72pRD/b5/lNlfvjtwAioOqi+1+klLk5F?=
 =?us-ascii?Q?gwVF4+7EtDEAxWhLo/N6c+SUjAoYEDSZg7PxMaKLVqYmi6BainsdiY7EmZMu?=
 =?us-ascii?Q?GgBRstco+B9FRVbUw4xm/P7r8J/IHJrVpOxp2kUN2hB+r5kraKxR3mPduCil?=
 =?us-ascii?Q?dUsTfUP8vurhDkXSpny0LxYS6bwTSsBHmM6yXTajQGGJnH7JKu040+rHAR+Y?=
 =?us-ascii?Q?VWZxfzsQIErZKC4DQJxzt0pYTVVz8iI5LuRZGLP4KqeLiLzl8Cj9euwLCkiX?=
 =?us-ascii?Q?mYYhh/L9jsfEXb+o0BClAFvwHQxCPzpU6gZpoSoe2ajopRCRVLl4Q2CBuENF?=
 =?us-ascii?Q?tMkR1Jf5/C+9ftqKr8Z4ex119v2HVpc63H81x9+hW0ujOWA8OXGfFLBlEbtk?=
 =?us-ascii?Q?cPwJA3mqCCJm1lpkfaSmMUBO66kTj8enUVtkJJA/cUKQWHZZurYvpKD/EufE?=
 =?us-ascii?Q?mBpJEywTA0s1QI8RYar26Hxg59GfXRQMFHXa0DI3PEV2XGx95YCvxswLiYDr?=
 =?us-ascii?Q?68DTqHadu3E/u9xTD8HgitEAb4ZzTSuHBbkXGfuNsabGhHXCQcAzdwdug+qo?=
 =?us-ascii?Q?XHYVt7PJP+H89XT15jfS0aIKAZy56ye5xndw3oJMZriE2pcLhymwEWGEzPZd?=
 =?us-ascii?Q?cU4X3NUJovZALqYeFgp0CKDl9KEsRBhgOYnnq2aNUoe36Xl7d+moIdcWGSCO?=
 =?us-ascii?Q?v80JsNRlTwp+hDUrRi9cysKetYhbpxcZ2DG6t51honSww0ET2Cu7Lg1/e4jB?=
 =?us-ascii?Q?rAmvpfDSvYPO0EmOdfaLv/nQCosdAnLzsHk9cuG9kzrWoJDFo2EEOrQ09OSw?=
 =?us-ascii?Q?qsgYbjU7/wZWp+jWfNbhIQqB4ye7zcIeqRw7hhhSs8DSz5BHQCk5/Yve4QBt?=
 =?us-ascii?Q?vRXJbFXQyoiHqaO04ulZ1rsdWrlX4FJF84w0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BSjtIHLSSOUIeOMhyK3xjhRj9w7jNnaSxjTR9/QR9Xugii7CHTnozg+vBVq0?=
 =?us-ascii?Q?auqYOpuoBYzcK0YLzNO/vjP8QSbWq4xe1nkWyUbtUUwaW1JVhUnL18mo9VJ3?=
 =?us-ascii?Q?zDBsiQCRW2cDfxyuqA+MQ/zdBSF1wF19ArmxGw8pwvJb/ef4hnT3VgpgvgZz?=
 =?us-ascii?Q?d/nK5p1p6S7UVCt2fALdlN2eWRHuMLIBwQszT6gkzVqH/rJWvQcBST7kMOa1?=
 =?us-ascii?Q?5Wc+L7RKb5WBSRTRRaGBBTvHHZ+F8DuIXjTZiHHVE1R6TcQjmQeog5OqqHWf?=
 =?us-ascii?Q?yYwvWblij0RryPA7ahMYTJ4PBUDxZ5rG4fnAPJWLHOrT3848Oc6N100TCz4C?=
 =?us-ascii?Q?tunJjVT9DG6yFQjQViOpXbxvAWadAZoLrMCXEnhAF7scmh3ZJ/K2Wsk3JDGj?=
 =?us-ascii?Q?0yHYKrj+cZlOfZt7PvZdX/dxE82qyOgyMrl1ivNcIZZnQtoObvqV1QhPUImG?=
 =?us-ascii?Q?hVKVBg+Bo/H/g5YK7pSCq6F0yKlyP5wRvuyqelUNlqz0qi9BGremS7ohB7M2?=
 =?us-ascii?Q?BfUeDDOacflS1Ba1OKNToNFGHNCQax/+cZUXq3HwNJdR1L95yCpByCZaChLN?=
 =?us-ascii?Q?v88La7QSh/LmBb+We7Kza5HQb/xzZyuEu3RrlIeVk3h4GztNayJ9/idTO3/S?=
 =?us-ascii?Q?h8iBvJUShy3n7RAAaVNcmPUSLv1LcHTo2fNc9eokAVa3ikfSViepPDQ7HIpi?=
 =?us-ascii?Q?jsAgRKN7g2/x9Wc7ATiKCwHtY1MvkPvhwkLt6MnJZtTAG+mn1KIyyijM3Bqa?=
 =?us-ascii?Q?4gped90eK/ucIyM7lauYyLKTCnMyH11yOnromPbn7YbtAtEv6xhnJFNiyhCo?=
 =?us-ascii?Q?MaWgmkpkYWyH7BpO2TCaK273uVW/aSh2wiC7F0ikU4b5QzPY+eYJYPiXmJvC?=
 =?us-ascii?Q?zSoEXT2L6ufveHk4H+5010aS/RqD+acaKh0eNHU4VrXRnlWDI57ipOVxlxa3?=
 =?us-ascii?Q?84thqdB8uUU8rzbW3gznOhqC4QbCZm2t4hicaDYZy1rGbe+ED/L+Eratm6To?=
 =?us-ascii?Q?8TfGE5SHwcvwiMGPR7UfTBQBTZ2qKXVNDKHJVTS0RY29RfOdhMR4q5B3d+Ay?=
 =?us-ascii?Q?oO54D/0UWBcIvr+foE1KRmp5Fx2RVSf1Zl4TGjrAplqB1LFGsIZ2j3jUMlk5?=
 =?us-ascii?Q?t5ZMvpOhCNKktacfiQXfQ6GdfQ1OsS+XOpiFhMJcnPGh8hgAe7PrTrpS3QQb?=
 =?us-ascii?Q?F4gzFAMiWrD8Yo2YBlu/Yexvn7SmnaXvQTnau1HdgS8yXg/gg+8ZXY5QA6zA?=
 =?us-ascii?Q?rMitDJSCWYH8nckeIY4ZoYvvLAVzmKUl6FIigvxwn7DzY7LZvNnrBhZSsjFl?=
 =?us-ascii?Q?GupxLfR2gDC2YGjej0XzImvWmxWWE8MCIQ2RMmAE7o5dXddn1MHTOxYM5Yfp?=
 =?us-ascii?Q?BnKyVA/7WvOJBVVg4rpAcD76gVO8r+oDSJ4QAzVu0r8eoN0/zzgF8/fM0AhE?=
 =?us-ascii?Q?StfB7UlA8rVmYypZ1dRT1QCDcVQSq0BsLyKQ8YCgqQoAcroElx/L7uw4KYcP?=
 =?us-ascii?Q?YfQAfIzR9hfeH2M2nQWr9PusENpUdd54q/jPAsr3SLvViU9p7sUUXb3WI5sM?=
 =?us-ascii?Q?4XWSLm0BscT4G24QB10fqbsD1re2d+J878KM7TNf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ae8843-9930-4f82-8220-08de0a79286e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 16:54:22.3372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEgvavYCYODhc0PFENH0RB/WDPkpJj2ptqewHZgpjTsmrGIHfP+QAlcj0kb8fBqhim8C97wouDfgw5ZqUAzoVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197
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

On Sat, Oct 11, 2025 at 06:51:19PM +0200, Marek Vasut wrote:
> Switch to bulk clock operations, as many of the blocks present in DC

s/operations/API

> use multiple clock on i.MX95. The use of bulk clock operations allows
> the driver to seamlessly handle one or multiple clock.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/gpu/drm/imx/dc/dc-drv.c | 14 ++++++++------
>  drivers/gpu/drm/imx/dc/dc-ic.c  | 14 ++++++++------
>  drivers/gpu/drm/imx/dc/dc-pe.c  | 12 ++++++------
>  drivers/gpu/drm/imx/dc/dc-pe.h  |  3 ++-
>  4 files changed, 24 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
> index f108964bf89f4..2717c92aba6c5 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.c
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
> @@ -31,7 +31,8 @@
>
>  struct dc_priv {
>  	struct drm_device *drm;
> -	struct clk *clk_cfg;
> +	struct clk_bulk_data *clk_cfg;
> +	int clk_cfg_count;
>  };
>
>  DEFINE_DRM_GEM_DMA_FOPS(dc_drm_driver_fops);
> @@ -163,10 +164,11 @@ static int dc_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>
> -	priv->clk_cfg = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(priv->clk_cfg))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk_cfg),
> +	ret = devm_clk_bulk_get_all(&pdev->dev, &priv->clk_cfg);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
>  				     "failed to get cfg clock\n");
> +	priv->clk_cfg_count = ret;
>
>  	dev_set_drvdata(&pdev->dev, priv);
>
> @@ -201,7 +203,7 @@ static int dc_runtime_suspend(struct device *dev)
>  {
>  	struct dc_priv *priv = dev_get_drvdata(dev);
>
> -	clk_disable_unprepare(priv->clk_cfg);
> +	clk_bulk_disable_unprepare(priv->clk_cfg_count, priv->clk_cfg);
>
>  	return 0;
>  }
> @@ -211,7 +213,7 @@ static int dc_runtime_resume(struct device *dev)
>  	struct dc_priv *priv = dev_get_drvdata(dev);
>  	int ret;
>
> -	ret = clk_prepare_enable(priv->clk_cfg);
> +	ret = clk_bulk_prepare_enable(priv->clk_cfg_count, priv->clk_cfg);
>  	if (ret)
>  		dev_err(dev, "failed to enable cfg clock: %d\n", ret);
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
> index a270ae4030cdc..67441b349a7d2 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ic.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ic.c
> @@ -30,7 +30,8 @@
>
>  struct dc_ic_data {
>  	struct regmap		*regs;
> -	struct clk		*clk_axi;
> +	struct clk_bulk_data	*clk_axi;

I am not sure if "axi' is good name for bulk clks. Maybe use 'clks'. _axi
quite specific to special 'axi' clocks.

Frank

> +	int			clk_axi_count;
>  	int			irq[IRQ_COUNT];
>  	struct irq_domain	*domain;
>  };
> @@ -136,10 +137,11 @@ static int dc_ic_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->regs))
>  		return PTR_ERR(data->regs);
>
> -	data->clk_axi = devm_clk_get(dev, NULL);
> -	if (IS_ERR(data->clk_axi))
> -		return dev_err_probe(dev, PTR_ERR(data->clk_axi),
> +	ret = devm_clk_bulk_get_all(dev, &data->clk_axi);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
>  				     "failed to get AXI clock\n");
> +	data->clk_axi_count = ret;
>
>  	for (i = 0; i < IRQ_COUNT; i++) {
>  		/* skip the reserved IRQ */
> @@ -242,7 +244,7 @@ static int dc_ic_runtime_suspend(struct device *dev)
>  {
>  	struct dc_ic_data *data = dev_get_drvdata(dev);
>
> -	clk_disable_unprepare(data->clk_axi);
> +	clk_bulk_disable_unprepare(data->clk_axi_count, data->clk_axi);
>
>  	return 0;
>  }
> @@ -252,7 +254,7 @@ static int dc_ic_runtime_resume(struct device *dev)
>  	struct dc_ic_data *data = dev_get_drvdata(dev);
>  	int ret;
>
> -	ret = clk_prepare_enable(data->clk_axi);
> +	ret = clk_bulk_prepare_enable(data->clk_axi_count, data->clk_axi);
>  	if (ret)
>  		dev_err(dev, "failed to enable AXI clock: %d\n", ret);
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-pe.c b/drivers/gpu/drm/imx/dc/dc-pe.c
> index 6676c22f3f458..eb96a6206cc6d 100644
> --- a/drivers/gpu/drm/imx/dc/dc-pe.c
> +++ b/drivers/gpu/drm/imx/dc/dc-pe.c
> @@ -27,10 +27,10 @@ static int dc_pe_bind(struct device *dev, struct device *master, void *data)
>  	if (!pe)
>  		return -ENOMEM;
>
> -	pe->clk_axi = devm_clk_get(dev, NULL);
> -	if (IS_ERR(pe->clk_axi))
> -		return dev_err_probe(dev, PTR_ERR(pe->clk_axi),
> -				     "failed to get AXI clock\n");
> +	ret = devm_clk_bulk_get_all(dev, &pe->clk_axi);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get AXI clock\n");
> +	pe->clk_axi_count = ret;
>
>  	pe->dev = dev;
>
> @@ -99,7 +99,7 @@ static int dc_pe_runtime_suspend(struct device *dev)
>  {
>  	struct dc_pe *pe = dev_get_drvdata(dev);
>
> -	clk_disable_unprepare(pe->clk_axi);
> +	clk_bulk_disable_unprepare(pe->clk_axi_count, pe->clk_axi);
>
>  	return 0;
>  }
> @@ -109,7 +109,7 @@ static int dc_pe_runtime_resume(struct device *dev)
>  	struct dc_pe *pe = dev_get_drvdata(dev);
>  	int i, ret;
>
> -	ret = clk_prepare_enable(pe->clk_axi);
> +	ret = clk_bulk_prepare_enable(pe->clk_axi_count, pe->clk_axi);
>  	if (ret) {
>  		dev_err(dev, "failed to enable AXI clock: %d\n", ret);
>  		return ret;
> diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
> index f5e01a6eb9e91..ffeb1c7af1c9f 100644
> --- a/drivers/gpu/drm/imx/dc/dc-pe.h
> +++ b/drivers/gpu/drm/imx/dc/dc-pe.h
> @@ -67,7 +67,8 @@ struct dc_lb {
>
>  struct dc_pe {
>  	struct device *dev;
> -	struct clk *clk_axi;
> +	struct clk_bulk_data *clk_axi;
> +	int clk_axi_count;
>  	struct dc_cf *cf_safe[DC_DISPLAYS];
>  	struct dc_cf *cf_cont[DC_DISPLAYS];
>  	struct dc_ed *ed_safe[DC_DISPLAYS];
> --
> 2.51.0
>
