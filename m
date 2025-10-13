Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42E7BD5C9D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D896F10E4C9;
	Mon, 13 Oct 2025 18:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ILg3DwyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B030610E4C9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:52:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXFvbzSXfOIJKtmLsZvTsjq2RyJ8BItDpu3HG0N9+watAM6qb3JJlGgTno0a0gxA/VDkLfAnJzImUgIs/+3UYiOtpTtQxos5jXbLTjQbEsi51L8OYFjKvUq4KaJ8eAP7U1dDsfHCCJBwMG8L+9uDBLS7LduXHoUyV4EKozzsrepbBXJs9uM3rdLxG2ba7IFqniB50W644JYa6ARRY/1g5BQVM/b4wEnUa6UsDk/A44k8y0XBOJWtQSsqNbAkk22SPjouPa6JXDEc9foz2sC9IMD5/zCsBY2eYtjt5NphUjk9uudyHc0lf4DmQGqVDDuyZgkNg4Ipo7FzxqKgEiTsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0rmxptq1dB3ZJszdiXPZmZ9JKiRe8gdJhmH3GLJvPQ=;
 b=o2exUo7p1vE9x5ypDqIkOeDFj+Sl0GwJIy+8jx3YgD+jsem3Hjo1/t0t+iglwNEB4Wt6AysqRxDITklTQ2J9Yt7rLT3OaPsVTdl3DVPCkb7Ws6sP4bnyS6OM+NwiWeekDr0/47eM3gZCqJUFHNu0J3Z3svVbdUvuv/z1hFyHYxYCNOnALPnZWGv0RzTNo9qfxWJ1UTY4QpXkWJEKMjcBlZW1uz+CrztMP2jTgLSvARknRnh4fbYvIuIzgLwcnCtLvR4M1mkhIOh1fWlJaf4mT6wAswlGqjPZKROL9FFba9Dj1AvEJfeSZiy1AIPxjSWS6zD/SSK5J2hAUAd15XosgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0rmxptq1dB3ZJszdiXPZmZ9JKiRe8gdJhmH3GLJvPQ=;
 b=ILg3DwySbdOmb77ECc1uk97aiH5WRP8S2jdgCnFaOLrWdkbDGvh83DWLjyxaqO/9lJRFzKvjMHGWQVTQY2l+/ISJdMUUmC3rwfh0ZOuHyH0tTtnUUZ6MMR6NmStEcS5qhqu/x8LItYU1ehAKWoxLyaFb+0apkYdZFdZxn8S2fKGchr/TT8q6cC27HsqNBV5pIkhI7RlWNbi+/6AZf19/JkYvMnGQgp49H4snpSnnFbJ6s1No77/KLBsVKA5OLqFkkNHapqpmlckSKJpuEjYpfMP7YpnRdoGg3jOTkstre3ak2SKJDct4z5yB7sqEILjJEWo+508i6+smd5RQdTvLUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM8PR04MB7410.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 18:52:12 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:52:12 +0000
Date: Mon, 13 Oct 2025 14:52:04 -0400
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
Subject: Re: [PATCH 22/39] drm/imx: dc: Keep FU unit running on i.MX95
Message-ID: <aO1KVEO9/c9HEltp@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-23-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-23-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH7P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::24) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM8PR04MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c644525-ec0f-4589-7c4e-08de0a899ede
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fPc+asJlJP/YjwUtHFdotR7ryHtihi8IcSesKel7JZHMED99rEVzK10JL9vP?=
 =?us-ascii?Q?GSAJDRo/TTsrbIBGJHyBuOIp+Ovnq926BawKIS1k4k21YIMBfLx/rwotPpIJ?=
 =?us-ascii?Q?cpt38vK2VFOScgbnnx4ULYyLJJiR2+gOQvRRSBQ8BIA57OVT46qU6adxxeDM?=
 =?us-ascii?Q?0K8ZK5r6usWD1fAKUNaFq96vT6MTPCJUVDxf10yRqwDxt4LJgjZ0ghlDl1dq?=
 =?us-ascii?Q?TwZMx6/2Ybiyqh4eolQQrNHNzpuSjRjIRIoBxqx0/XLUqkEobu5JMFE3xSMh?=
 =?us-ascii?Q?msJU+GGTDlPBgpu/T+D6nio0jxco8NdSTapiFEbVs/ise3FsgWaijQxabjgl?=
 =?us-ascii?Q?sydoYfwpEQYBi0RI5B+lde7IWSKhQWMURVZs2VkDKGIJsRLsT1wAuXnUNn2R?=
 =?us-ascii?Q?/5C1lQ1UzsnYUFp5XPezYXIBp49WkkaxvnkfveyINZCsuHUfjAbn7B8UZCZx?=
 =?us-ascii?Q?uh+rfxoWRzUuQpnmpkoub04wSxkX6W5bIuLfIEZ+GJHb0kCDl14EV3ddStjC?=
 =?us-ascii?Q?phnIendoj7X3Qf+B6hSq/2PT7XHDb3Zdt2X202IwupdnjfjbB+srsKPT7jhd?=
 =?us-ascii?Q?Rv4vas+Yky/SKQ7OUMvD27TgJY0Lfhb2rQUf8TO4ZtqQwcTA1T/VAAXoXe8q?=
 =?us-ascii?Q?CAUpBm2cI6+X12CLDeKMiAViunw6wHOEc/ylpL3BnLm6xoWWmn8J/nyanJPP?=
 =?us-ascii?Q?nv4du5ptlw7p3tXPGMbUj/hPdfUl43jvsdSoI6SEht3oxbcEeuqXz/0hmz1/?=
 =?us-ascii?Q?4Tm3uLJ2Ovc4/9XkvUkrXlNIYm/r7YgUvEsuBUtOMS1cyYKANjwERzVTj0gN?=
 =?us-ascii?Q?Xl4gaB7DBfQb/6McrG45TDlwaVj2/1DmfMARHTQXvOG7EShYT/jglFdTLaNJ?=
 =?us-ascii?Q?0dye/3VBKcbBEygFFPGOs5QmzTK88RuBDACuY8sFxPLiNeauR4msx7SFwOWj?=
 =?us-ascii?Q?uEpjiAkebWmpWQZJ8HMwTZTw5mXvDqJPSZBlKibstzW+y4XANrmdCq28ZQJ2?=
 =?us-ascii?Q?XH9f5kP4XC1cB8rFfp9TuZuYlUbXSqDMz8aUN0k4c55XLYbCnFZIchy6PO03?=
 =?us-ascii?Q?4nPG9ZTeFHBFeJTIPYFhJWkSLyOppOQkojdPzChRjcJpQZqQp7R16gHgaza3?=
 =?us-ascii?Q?xOHtiVLuNF92OpE7hQNLS7kt70Tfji/qEZtZFMEt3CvQ2LzGeF1VbnzIsZWZ?=
 =?us-ascii?Q?bmUF5v9+zye6JE33OqPYPDvUejkhjeQyDs7EQ6k0987jIYtooZgOutLTrgUK?=
 =?us-ascii?Q?oPV2Xhg/STfANjvkhJPZ6iXa+U6xcWwFZb6Wsxwjnxq43B2QU9dmHTdBtqPL?=
 =?us-ascii?Q?DM+Jt7JBjYoT28Mv6wXSXxfkZQ2Xou46jJnifRmS4f+TN+zNQ7af2BiekDwN?=
 =?us-ascii?Q?ilrz+GiKtgLcEhGTcjVaocIL5eR1O9OEk55fQNlgQt3WpUVIFG6kNrmIYRht?=
 =?us-ascii?Q?Lio3MwaU5D4B5Or0Zaa04euDhH/VLsVmb8UD986Ke4qgQYYk0uMnb3AoqWdX?=
 =?us-ascii?Q?dC71Jn0PxJ90nKJfHhLAzeN3K9jXAMBcpP/i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OYYSFuNCaRXLQyJOlIVGJ3dl2145v/jAAw3H0nZj4c2aAWIVGpsRBNlfZhXc?=
 =?us-ascii?Q?BDv2SjfszDYYcKCRs5d+lEy70aHGHc0CctHQ1oBHc148qitoQuGoZoqTD6+w?=
 =?us-ascii?Q?dP1UEOgjFJMJYINa2syvuz+4WATZSEg9Rv8btq68qe/Bm6Nc9Uk5MmG/inB8?=
 =?us-ascii?Q?Kp9UObk9jFZKLWjwfc0v2tP2WtQdERYAtYw23pOHB/9Eed4Wxb4qb4P8HaEg?=
 =?us-ascii?Q?XiDSstiBVc7vw6oz+UVQpqHoEl+ASkGdcs0d7ptKicWrT3Vvbc79k4g3Rk3Z?=
 =?us-ascii?Q?CUN+JTvcSrUqWFgEMsbDAqJc1Dl0TRvzaofWBJxUip0lrrS6hVvd6Lbto+fh?=
 =?us-ascii?Q?TROPZWttqMAZ8+8NsmQQOPZ7w98TliDuOiFqnoOARILBidSFIl5c7DfGZQsB?=
 =?us-ascii?Q?1MpfGcRp3cycNGYyAEEkSbSxPQfciW87SuIDfnoXXnq8twetLH7ZQnW5Hxr7?=
 =?us-ascii?Q?PENXOb2gh+6bzLxB/Taz+guC67NUvGFnD7A3NzksTPJC1QFlEX8tQvppFDGP?=
 =?us-ascii?Q?ISWCuieYduJiqRl9/jqkULb1z7XsoNeCFsOuIuAcCASilCGQeHWZXuKpaiw1?=
 =?us-ascii?Q?6o5V7At6de03C9d9O/wl+wBF77wDYN2xOVS9L5R9dB7is98q8+UlS8bHupd1?=
 =?us-ascii?Q?ftrV+hBfYzymZH3jy6vnlgizIIN09cwHFDeUxZsDpHfRJof+O/ZejCZqFBxm?=
 =?us-ascii?Q?z051v+JyjvaHdK6TT6rvV/zvVyaj6SxwJ00ocj8ZPddWS2/h5QWcggx6AOSa?=
 =?us-ascii?Q?XIw4zgjb8Wa0V6L+sngOm7f809ATr1sGPjKZCcEQ7Q8osi74sYnMtagJ+Ff/?=
 =?us-ascii?Q?JAavlqcNMwjIPjtjVjipdV7v/T40//njT1y9JKfnoSH1K0wROE7ok9H0xqwi?=
 =?us-ascii?Q?x1MTmHHEyVTDfWST5yS6GhwkaYONULOEDqc5OrKUj74aCFBjGAl7E402jSxL?=
 =?us-ascii?Q?1neshEE8p0FGLq1q2HHH1QFgbiDkXpoP/ul6UJpbXj1YJ2/HXuez9i3mrvrp?=
 =?us-ascii?Q?cjErlC7b98sLaYTzzg5HHEvUNG5fSBqYTzc5x916O/1+BrkvFvZNG9/cZS04?=
 =?us-ascii?Q?1h59mv5EBTXFyvV5UtCJeqmK5QhA10Q2VQr3vahvSq0u8uFxQ7rfoHPkzYnM?=
 =?us-ascii?Q?nG2RfaGrtFpjrc7fcUN/HfBJh0hLOcCU3rwdm/Up1bolwRMby/shrUQL+3+/?=
 =?us-ascii?Q?mhy93SLAPqG+IJOEDTy/8QBIVuZCV1LxgvwMTNL2Jje90oJpRJ+0TkZ6Xaoh?=
 =?us-ascii?Q?OQX6JUSPQCLCW9psSR0XM+rofyUheZV5fMM8+oH3P9h9WxyMmJk6vrCkNQVo?=
 =?us-ascii?Q?/3gvlVDxHB/A+pM1Jpq0i3zRD334SNh3cGlNefpBhNJODI5L9o8LAh7yzUgg?=
 =?us-ascii?Q?1d0iqWnCPvlJeA5zp3Yv16XAsemEsZbdid82bNur/bQaaQ1tCQQxDnbDTLMS?=
 =?us-ascii?Q?ulGKslPu+cZtpqaOA/7RxYJjrbrrROpbwnxcnFLN0wBEjoBDYc/8svZMZgCo?=
 =?us-ascii?Q?RtldhIYq44nWRDVzEzfRUoPZPkk1IM2Gwc+t9z5xU9JHuXtDa1++J6RL5fHO?=
 =?us-ascii?Q?eSJNYapPX+0rFUPLvvon2ziEgI3Z9Em058kLZioy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c644525-ec0f-4589-7c4e-08de0a899ede
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:52:12.7801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fc03iQ88Dv3oDYcFOUO9Ekc2vigIZQho7ehZ82SiMc471GvmLQo9euF7/loFdLdaTwtBl1YUWjw/P5sPlebyqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7410
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

On Sat, Oct 11, 2025 at 06:51:37PM +0200, Marek Vasut wrote:
> The i.MX95 does not have CF inputs into ED, it must pull inputs from FU
> otherwise the controller crashes into green screen panic mode. Keep the
> FU running on i.MX95.
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
>  drivers/gpu/drm/imx/dc/dc-kms.h   |  2 ++
>  drivers/gpu/drm/imx/dc/dc-plane.c | 10 +++++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
> index 3e61dbb87afe7..af37523ae0be3 100644
> --- a/drivers/gpu/drm/imx/dc/dc-kms.h
> +++ b/drivers/gpu/drm/imx/dc/dc-kms.h
> @@ -130,6 +130,8 @@ struct dc_plane {
>  	struct dc_lb *lb;
>  	/** @ed: content stream extdst */
>  	struct dc_ed *ed;
> +	/** @keep_fu: keep FU running on iMX95 */
> +	bool keep_fu;
>  };
>
>  #endif /* __DC_KMS_H__ */
> diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
> index d8b946fb90de6..18010c2b0bd78 100644
> --- a/drivers/gpu/drm/imx/dc/dc-plane.c
> +++ b/drivers/gpu/drm/imx/dc/dc-plane.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include <linux/container_of.h>
> +#include <linux/of.h>
>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -185,9 +186,11 @@ static void dc_plane_atomic_disable(struct drm_plane *plane,
>  	if (!drm_dev_enter(plane->dev, &idx))
>  		return;
>
> -	/* disable fetchunit in shadow */
> -	fu_ops = dc_fu_get_ops(dplane->fu);
> -	fu_ops->disable_src_buf(dplane->fu, DC_FETCHUNIT_FRAC0);
> +	/* disable fetchunit in shadow on i.MX8QXP */
> +	if (!dplane->keep_fu) {
> +		fu_ops = dc_fu_get_ops(dplane->fu);
> +		fu_ops->disable_src_buf(dplane->fu, DC_FETCHUNIT_FRAC0);
> +	}
>
>  	/* set ExtDst's source to ConstFrame */
>  	dc_ed_pec_src_sel(dplane->ed, dc_cf_get_link_id(dplane->cf));
> @@ -219,6 +222,7 @@ int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane)
>  	dc_plane->cf = dc_drm->pe->cf_cont[plane->index];
>  	dc_plane->lb = dc_drm->pe->lb[plane->index];
>  	dc_plane->ed = dc_drm->pe->ed_cont[plane->index];
> +	dc_plane->keep_fu = of_device_is_compatible(dc_drm->base.dev->of_node, "fsl,imx95-dc");

Put it into drv match data

Frank
>
>  	return 0;
>  }
> --
> 2.51.0
>
