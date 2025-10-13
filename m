Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C05BD54DC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 18:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B47210E190;
	Mon, 13 Oct 2025 16:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ka9ceSSl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B0E10E190
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:59:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ew4ykZSe/nYnBT/K5JzLcP8GzQ+fW1qMvj9/ESyf+mtY0vLu2tPf0TLA+mWRL+cnyTlXxs7vNGIaSAtmdfMYFhfKN1K4sIlre/G+1bUVjm7g0LSTHZkB1bkJ4t4z0m/bmrjTVRzdkBwPGSpC2P3PuN08wItihPbmKcGvP0MdtwNId4fPgn+DFfypAvsYxAQWGAg3PYQXzWxM5Myf9/0ASl2/6XpS9Pb5jzRmVdJMQ5IRmMt6BWKOxs2nxAsRfOMKkDrSC+KrP+fNT4l2WLON/uNO02ltryz4kiLujicMjWEydjldoIn/a3+WMNPpOg/SY5/NLS2HtqNXtx+bDxsXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUL1R8hqctsr29t2JVd9W5kX8d3ERPjmiZs98C5WiqA=;
 b=LUv1Ih+iMKkWQrP98bFxOb3DKRMW2GlDBlqekrTrIy+Uj2C8LYakGXGIZ+fu2O5Pxm0p++Ve9qRSiM/CyHydfjLxvNw3eHKLaavMl/bUz8hmy2yrwdP933K6IIqgSU+aNnyCQujtndPnLbraLQoBTt9mZ7AAhxo0RWSZymZ4CG60rxnxKP2VLZokBM8687XYpIDTeDaTVw51gO2MtsE0/nVEfEOyhhB1CATjXRPTGes3CHjULdPbYtwmZRE+8E+AXr5btKcCATN/M/PtbONoym6syRrWu6Q74Eou2R3zfzwuf1oMdefz1CrgrAtiMB5YPjpaqRgHHd8hYJf6RUPtlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUL1R8hqctsr29t2JVd9W5kX8d3ERPjmiZs98C5WiqA=;
 b=Ka9ceSSltF1+WdufRJO/lTjDisjmBKmcZztBuiLFP1rFZLUQxUaZfwnBNQg90MHCxjf/zQ2DXUrz6yCt/9NM5pbilLmfC3D/aUM0Zygf8D4IYEdb9mCOvlN6xoeXT6GcdPGZUeR3NMmVq9GY1UVws1yNk4FmfG7670gF8xtKtVuXCpHWU9JsZpmXbNB0+BOeIrRZAJ7UPIy2Axejs54f4DFwG0RwMSzXxco2lADliB/nWU0Go77huH79eH4/rJACJkBcHt6k6eOsQOSQNGgRKHUNSjBF7lzZNlGxhpFkoA32aGyg0480hMEXkZo50Fpc0NfAMzlnIEIwIie4nz8gzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU4PR04MB10551.eurprd04.prod.outlook.com (2603:10a6:10:588::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 16:58:59 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:58:59 +0000
Date: Mon, 13 Oct 2025 12:58:52 -0400
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
Subject: Re: [PATCH 06/39] drm/imx: dc: Rename i.MX8QXP specific Link IDs
Message-ID: <aO0vzMp7PaeulD4m@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-7-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-7-marek.vasut@mailbox.org>
X-ClientProxiedBy: CH0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:610:e5::6) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU4PR04MB10551:EE_
X-MS-Office365-Filtering-Correlation-Id: a58eaa80-9f9a-4e85-3c9e-08de0a79cdb7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?57Q139mD4S5idahGRxWc2vfsK0zANzvvx4kZk5pSXI9fNWVFGvsUFbetr/gD?=
 =?us-ascii?Q?ClrPhAVo07fd1tI4e7sFxIqmahLIULb1NfN1Eb6iDiaqgB2mgrnwRcR4/w76?=
 =?us-ascii?Q?WBGptoYKG2s6btV+qA7WegJHlILSFeZvxSzU1gjkbNsYV2OLHFAsSZM2AsOH?=
 =?us-ascii?Q?8WnYJ3W5i8dBh7zfo9IG8Cpa9iB6R2OMZvmCPM/btjKlqrX4TF+3Jvg1GUzV?=
 =?us-ascii?Q?CTE+qu3XcGcBveDx1kpbBCsQz5IlJckLB7x/BAvrsPIUOFO5bUcvJU4cdHct?=
 =?us-ascii?Q?IEvHwUA8f6RfQH9Uidi7UP0ipFE9ZNCZDjW5DCKtTQfqcTFEN+jG+B8JBs7C?=
 =?us-ascii?Q?tnqiaY6zXBNuTC9/BrBrReLQXXMTjowqRrpWHmI4O00FWhoRfAa8DfDide6X?=
 =?us-ascii?Q?/bhF+Sv16rWvv/p/mgX65dqo5tmDEi+FZp/1VRPmh1sGhPP/rpA/TcDuE0P+?=
 =?us-ascii?Q?HIPX3erKAITqB/8W83VZUkKdMjnwmkelH28wtL/ZIfXP5n67+CJMCoD9R3yj?=
 =?us-ascii?Q?YnYOdOHjnEgFqQkzUlz7NHK28UNIwxdL10Jg05b8rMAfs30PfyORRWopvwvP?=
 =?us-ascii?Q?2nwts1seSasNClQPGk7E9Bbd/Q0ApjgAErNyZTt9U+8G9EL5B4040aaxV5Ld?=
 =?us-ascii?Q?kSkfSokJpcjsaLov9JKQdNfwoOjgmR9A1pwO1WRzDY5U77iOctLcvRvcYBQr?=
 =?us-ascii?Q?GJT6EkQbkRZif89+MZ8Us5Z+kbG4BawAooqqGj2RZt6FNla4eIaf8iax7q6y?=
 =?us-ascii?Q?2hEAe4vXpDdK+TqzXRbpmHX7J+0lT4h/z6K6+pTOnqmf5Tg33c1pNHrufYFj?=
 =?us-ascii?Q?j1C9q0nK8/FboArUTs6+qOMm0k95pNFbWkdV1VBivY6RFSFye5pc15WABpDj?=
 =?us-ascii?Q?Xxh7dj1E9MDmOdBHwlHVzIgzCFrw+aIcxm1dPJosU4OZ/ORk5YxR9ATTVjxt?=
 =?us-ascii?Q?ab/TazJuqc80RLlE8QpFhHhWJvj4XuxVmusSvL5uB09Ex5eWzEuO+aMmzMib?=
 =?us-ascii?Q?OJmB+A0t/B22jDMTZKRA36kgD5sn+Ya03Hq1yuo890Y5A64yHKHTYcUFE4SX?=
 =?us-ascii?Q?J6T8IfDNT2bhgO+RceM1CmFhaqZPc/S48G0NbQss9ADdK9q7OO7nqESRivWW?=
 =?us-ascii?Q?wZrvegrQ38oq94yB2xz9/ITztMBXlvzixEWAejCAj5QEN4sjohwR747NQCyu?=
 =?us-ascii?Q?gBTdqz4cJicmkqLSyI4GIEecLDl9tTKTy/shnKfY89Z/SpTGsx/YR6txb6V1?=
 =?us-ascii?Q?OzC32XclMAtXdXxsjAj2tGG2vtt56t1HvEwoGLAVFK5MKfMgU5CvDnE0ZOss?=
 =?us-ascii?Q?YBsnWklTBf9411Ht6aG2VnpHaRtqkpvzw6RzgEzIxJjFPkpVUjoEctSP/lUn?=
 =?us-ascii?Q?pADaQNNblr9uOyJOkT3I1HwF0hsVwamO3u5Jj5eGAwG3qdXcJW0SzRmCf/d+?=
 =?us-ascii?Q?oZV89vfO5F7mb1u1QJO1G5Zj0vahqW+RxE9hU2L3UIBQ8HGLPJNPCM2I07Uy?=
 =?us-ascii?Q?+dmvfqPJM6k6HoaR0fzq+7JnXFYTqT01X95o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lrx1toclsmRPnB159MlPjdQHa/iofYmztS91ZrFpCmB53nIHFhxWsFqPiEjA?=
 =?us-ascii?Q?VQ9UTmXBLNgQGZhmsHIf19dirn1bYBh9pmZR9E4D4DOvIhBZ7vGwXqKVuW/k?=
 =?us-ascii?Q?T7RpQjk/Y23V2BheU02AceJE20BpB5y4L3EKZ3+HkIlpj9Lr1VULAFCj1M4M?=
 =?us-ascii?Q?7k2yOyOu3QLmtA8xHiisVHQOFEqzdMr5KvOopuRqm7KrZcKQI5edQF89D6Sz?=
 =?us-ascii?Q?cAaJQDOZjSMIDqRkYZo6LQsxGQ5yaXP/y0zR73m3finCnsa0dOvmebbkliFb?=
 =?us-ascii?Q?THCwtSjF2bvv4du+/HuGwlFZ7346Q39dSK61wz7eYil0jYAhUHg0ER3lM7hH?=
 =?us-ascii?Q?dTp/Ee+WNM/HtD5eKWVc8WrXChHKC0KWtukudGDpXpbJR3opYvbWnjiT3KQB?=
 =?us-ascii?Q?x8ogH/z7wflov+azauZ5LrqLEZpILqtY9wQ/4KO5HRZyggIawK5LEfdZwBkE?=
 =?us-ascii?Q?a4+TRbUt0HW1kE/AKCPM6b81WYkf2/kvgeJNwRcSmQApViFWcW4MlHDq1nbh?=
 =?us-ascii?Q?s57zVcx1pjq6F+UKXVhJaQoO/TcjHMPWmr9+teDeauSd5/LsRUFg0Jgn+7xF?=
 =?us-ascii?Q?hvLz4MjYN1a1evfo1O7qdpE3Nwwa+IZHxfp1JEAv8RBF0lV4WcAtmmjVSpmP?=
 =?us-ascii?Q?xviGJVz1Qe6DJOcfMe/PduVEfsCMc4qlhuGo9zPa3T4lFYREFAp/Ohhpa6N7?=
 =?us-ascii?Q?0angXTydB8BW/QVZzNmdyWW8zVSgWMm62in+E5hLYrpx8Gl079Bdtjcly11v?=
 =?us-ascii?Q?Vxx1rDoRZy5yNGKQXW7A0HeJ95ZMiNYUbfLWWMLKxhVP/sTQdvhPZSJyMtyW?=
 =?us-ascii?Q?8JD6glW9M+clo1oZwUP+zitFBIzaPGLc5i/3nb61o4Xo3gcLVocu9olreGWn?=
 =?us-ascii?Q?Ad+/Lq+izhnTwgMhc6JRdO64uZdwSaqMMXzAo0oxCZSGBY79PAIJ96RLeJ16?=
 =?us-ascii?Q?t7s0z4T5gsgvUVWfJ2WViHwuV4MRd5JGN0At/tgRJ/CCWmTqwrZ8N8OdxWrh?=
 =?us-ascii?Q?InfgWD15IX13NOvzBpLqfqyC+lhsKCxmJqSLxjlihczDCU6oVE7AnXXz9+Mo?=
 =?us-ascii?Q?QvX4AGNpzzVVz5PNzv06OuBYu+xwDp+OtT2SqxXY/rdox4+PVEg3PTEYVrgg?=
 =?us-ascii?Q?1M9wPYxU0KzK22b4phAXFKBeg+FmTYVs6Mu+PbXEM+XiXaA5zc9U+eNptpmM?=
 =?us-ascii?Q?U+dPbvIXkg3qtsY3Q1qf8Uuo7EfGnd6k1wYLJBwK1QCf2gLc2xU9V70tWtLp?=
 =?us-ascii?Q?CHX07u4goj8D64Y0vqXeVP3xuOV3KAQ8uC0gGC5yBdyYoIstGIqg5OPZtQnp?=
 =?us-ascii?Q?vX/CuZStwqBvMiQ4IGXRtHNQaHw+UokY0AJ98SuC+zLmv2IpZCRXBCw/aq4A?=
 =?us-ascii?Q?ZZ7zwQqbE/Q4D1sKtkcQz9fI5JoAl+Gk16bKGB7QFRKmncaQvC9IMEnRUMMM?=
 =?us-ascii?Q?RvHigaaT+lI8EChUdDg48OXLRdCOouKO6Hsm+TZTbp0G8+14hhiPSZ5f1KCG?=
 =?us-ascii?Q?agdvx6U9bAHnBA98f7/H5zoMt24cg2BhVi/ExHtx7smH0h9epFipBy9IvUP2?=
 =?us-ascii?Q?fLdhwjqbH6kzeooMSBI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a58eaa80-9f9a-4e85-3c9e-08de0a79cdb7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 16:58:59.4494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gh8rmYRdwwu47SNgDyoEN+JHDgPwiI3xhns3BQ8AIkjDzHuG/w7rl11v5NoQ178+pF1bJ22zQ0NE0qOSE1rkNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10551
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

On Sat, Oct 11, 2025 at 06:51:21PM +0200, Marek Vasut wrote:
> Add _IMX8QXP suffix to Link IDs which are specific to the i.MX8QXP SoC.
> This is an i.MX95 support preparatory patch. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

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
>  drivers/gpu/drm/imx/dc/dc-cf.c |  4 ++--
>  drivers/gpu/drm/imx/dc/dc-ed.c | 12 ++++++------
>  drivers/gpu/drm/imx/dc/dc-lb.c | 14 +++++++-------
>  drivers/gpu/drm/imx/dc/dc-pe.h | 22 +++++++++++-----------
>  4 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
> index 846705534546a..6cb83182a3668 100644
> --- a/drivers/gpu/drm/imx/dc/dc-cf.c
> +++ b/drivers/gpu/drm/imx/dc/dc-cf.c
> @@ -123,11 +123,11 @@ static int dc_cf_bind(struct device *dev, struct device *master, void *data)
>  		dc_drm->cf_cont[1] = cf;
>  		break;
>  	case 4:
> -		cf->link = LINK_ID_CONSTFRAME4;
> +		cf->link = LINK_ID_CONSTFRAME4_MX8QXP;
>  		dc_drm->cf_safe[0] = cf;
>  		break;
>  	case 5:
> -		cf->link = LINK_ID_CONSTFRAME5;
> +		cf->link = LINK_ID_CONSTFRAME5_MX8QXP;
>  		dc_drm->cf_safe[1] = cf;
>  		break;
>  	}
> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
> index a63c387a4c023..9a141c6aa0812 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -110,12 +110,12 @@ static const enum dc_link_id src_sels[] = {
>  	LINK_ID_NONE,
>  	LINK_ID_CONSTFRAME0,
>  	LINK_ID_CONSTFRAME1,
> -	LINK_ID_CONSTFRAME4,
> -	LINK_ID_CONSTFRAME5,
> -	LINK_ID_LAYERBLEND3,
> -	LINK_ID_LAYERBLEND2,
> -	LINK_ID_LAYERBLEND1,
> -	LINK_ID_LAYERBLEND0,
> +	LINK_ID_CONSTFRAME4_MX8QXP,
> +	LINK_ID_CONSTFRAME5_MX8QXP,
> +	LINK_ID_LAYERBLEND3_MX8QXP,
> +	LINK_ID_LAYERBLEND2_MX8QXP,
> +	LINK_ID_LAYERBLEND1_MX8QXP,
> +	LINK_ID_LAYERBLEND0_MX8QXP,
>  };
>
>  static inline void dc_ed_pec_enable_shden(struct dc_ed *ed)
> diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
> index 34ea61c2de87d..619353456743c 100644
> --- a/drivers/gpu/drm/imx/dc/dc-lb.c
> +++ b/drivers/gpu/drm/imx/dc/dc-lb.c
> @@ -124,8 +124,8 @@ static const enum dc_link_id prim_sels[] = {
>  	LINK_ID_NONE,
>  	LINK_ID_CONSTFRAME0,
>  	LINK_ID_CONSTFRAME1,
> -	LINK_ID_CONSTFRAME4,
> -	LINK_ID_CONSTFRAME5,
> +	LINK_ID_CONSTFRAME4_MX8QXP,
> +	LINK_ID_CONSTFRAME5_MX8QXP,
>  	/*
>  	 * special options:
>  	 * layerblend(n) has n special options,
> @@ -133,10 +133,10 @@ static const enum dc_link_id prim_sels[] = {
>  	 * layerblend3 has 3 special options -
>  	 * layerblend0/1/2.
>  	 */
> -	LINK_ID_LAYERBLEND0,
> -	LINK_ID_LAYERBLEND1,
> -	LINK_ID_LAYERBLEND2,
> -	LINK_ID_LAYERBLEND3,
> +	LINK_ID_LAYERBLEND0_MX8QXP,
> +	LINK_ID_LAYERBLEND1_MX8QXP,
> +	LINK_ID_LAYERBLEND2_MX8QXP,
> +	LINK_ID_LAYERBLEND3_MX8QXP,
>  };
>
>  static const enum dc_link_id sec_sels[] = {
> @@ -281,7 +281,7 @@ static int dc_lb_bind(struct device *dev, struct device *master, void *data)
>  	}
>
>  	lb->dev = dev;
> -	lb->link = LINK_ID_LAYERBLEND0 + lb->id;
> +	lb->link = LINK_ID_LAYERBLEND0_MX8QXP + lb->id;
>
>  	dc_drm->lb[lb->id] = lb;
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
> index ffeb1c7af1c9f..866859403a79d 100644
> --- a/drivers/gpu/drm/imx/dc/dc-pe.h
> +++ b/drivers/gpu/drm/imx/dc/dc-pe.h
> @@ -22,17 +22,17 @@
>  #define DC_LB_CNT		4
>
>  enum dc_link_id {
> -	LINK_ID_NONE		= 0x00,
> -	LINK_ID_CONSTFRAME0	= 0x0c,
> -	LINK_ID_CONSTFRAME4	= 0x0e,
> -	LINK_ID_CONSTFRAME1	= 0x10,
> -	LINK_ID_CONSTFRAME5	= 0x12,
> -	LINK_ID_FETCHWARP2	= 0x14,
> -	LINK_ID_FETCHLAYER0	= 0x1a,
> -	LINK_ID_LAYERBLEND0	= 0x21,
> -	LINK_ID_LAYERBLEND1	= 0x22,
> -	LINK_ID_LAYERBLEND2	= 0x23,
> -	LINK_ID_LAYERBLEND3	= 0x24,
> +	LINK_ID_NONE			= 0x00,
> +	LINK_ID_CONSTFRAME0		= 0x0c,
> +	LINK_ID_CONSTFRAME4_MX8QXP	= 0x0e,
> +	LINK_ID_CONSTFRAME1		= 0x10,
> +	LINK_ID_CONSTFRAME5_MX8QXP	= 0x12,
> +	LINK_ID_FETCHWARP2		= 0x14,
> +	LINK_ID_FETCHLAYER0		= 0x1a,
> +	LINK_ID_LAYERBLEND0_MX8QXP	= 0x21,
> +	LINK_ID_LAYERBLEND1_MX8QXP	= 0x22,
> +	LINK_ID_LAYERBLEND2_MX8QXP	= 0x23,
> +	LINK_ID_LAYERBLEND3_MX8QXP	= 0x24,
>  };
>
>  enum dc_lb_mode {
> --
> 2.51.0
>
