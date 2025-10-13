Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F0BD5482
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 18:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB2B10E43D;
	Mon, 13 Oct 2025 16:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OAlk7Vid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D278210E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:56:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q68cIu4ir2PAg0RlILPK1GopWi8r7MzFwVKMkNJSDXzwPasBFiVcFqVdjPjPzDm7yCMuR+zePQitYLdh4xFyn+nsmzNyVkgr1cbBF3RQQSdfc5r2NE6dSEAuAc0IcnfSfSHW9MpUJoyjYnMaNTaObTeyYZV1AUH3iTKw0xIXTwg3gGmPx7grUuu97Dq6zAcBoVR2/f9idV0tCKKviBCTczsPqYOdOkW5XmsF0p3fikGkJHrQuVowPhOtM7ynLQXI5LjbXQwnkm7ayJJi5byGAqYVoqoiJ5qf/McAX48RiL2LX94DPu8FgC3NJN+ovZ5Ir9+XJSmQqtswq5guHHXTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UUc4XCIJv2p1F4wzXgwBQ54c1W5FQ6pc2w8Ias4Mp4=;
 b=Jxjb2RnG/dKbDswCBkW3e+5IOQFhMZzrh6wuFtV1t8UCh/MWev0+Y7PveG3vj1f6EHdxAcDPVjbNnGMN9PtsH49zzhsg1jlphb/beGghLVqN5MBet39JOiwVwhxur9EA4ikGVwC28sXF1TXxdU7vKMSHD9MrwmdfyE1C8o5xyZ9SXWvDUgKWQdTvlxURj9YdGePfI01Y0j2tCcM0DvkluhHe5o6dxxSJLFvKHJSF2sujY6TgfNQ90QZECBSEH4CeDNeXWab0t4wbNNiV9FXVtG0Lh1YJcyUmQFjcgrBaWJmD0UBB+fuZnyFUmpdtgIjFYD9AabhrnGZTm544yvb2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UUc4XCIJv2p1F4wzXgwBQ54c1W5FQ6pc2w8Ias4Mp4=;
 b=OAlk7Vid7UKQC0IlVhDtHPCD8h5dY9UyWhA+rbXG8bwawiRt9YWgZXMax0x4xG7pSTa5Sr5vccoONqWZZnYV7M+S3xiJcvWTTYXxklJCLgtmcsIWzxm8hXmloilXNfdIB2BFCgvqIzl8T0mHGCxGNpmBSJPXZXXb5GozHZdNjekQLrtOjVOnkc0c4/UO4m1eUCIHPCr8YL3qr9Vbceh4zeBFbYvpfnYLeFMyEXQNQqs2AeVV1YQ7d147VxrCeHe+L2T6Dj52GbJGmW+rF6Y1qUgOb2JN6jwBbM+GboFiVFLqO/lIzLwCJzURGFpmSRlJMUlf5N23gBEtZxN4EqEuFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU4PR04MB10551.eurprd04.prod.outlook.com (2603:10a6:10:588::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 16:56:22 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:56:22 +0000
Date: Mon, 13 Oct 2025 12:56:13 -0400
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
Subject: Re: [PATCH 05/39] drm/imx: dc: Rework dc_subdev_get_id() to drop
 ARRAY_SIZE() use
Message-ID: <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-6-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-6-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH8P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::13) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU4PR04MB10551:EE_
X-MS-Office365-Filtering-Correlation-Id: ac051316-e9de-4a8c-3ac6-08de0a796ff4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UaeQJMZKyZuPvQXmpt/xgB7+bJqDcUAN137o3TnoJzfKCj9ZPTRxT+J5ogJW?=
 =?us-ascii?Q?Hi4w8VPxfvu6Wz5qHwy0poOoY17Lig1/U4EOoY5qo0zVTCkMIEpVouSZiq+i?=
 =?us-ascii?Q?Kuf5AipSHl9HgpT7Yo4KoKOCaVZGeASVjkrb8plnDGfL1lC4fqTZIDUDFAoz?=
 =?us-ascii?Q?G9bM7SqNfo4eSrivnSUYjgZn4WTei9NCslfYNav4J/3lpBqA5WgdX+sSpspd?=
 =?us-ascii?Q?OyuAMFppSxcZHvQa6FT8jES4ze6Jss1aDF5XYbQmrymY+tl0TqoNfCO/i3Ow?=
 =?us-ascii?Q?m+vx+vs+LZCUGn4G4oswa/IQDPcFR8QYTiM7xUbKc5OM6jVAq+EYqoPFv8LE?=
 =?us-ascii?Q?6IfmJKN/jObAZIvoB2fR7fJqqPVfEqQE57Ap4L78O8fnx6lA2P+D2pnPCT1m?=
 =?us-ascii?Q?83p1AIWJvMmAWcmttMCp3EwzxGA9K2fmEgA/wB+FKgtH+jRcxkfj8AgOGZ61?=
 =?us-ascii?Q?xIeDFA6ZDnJgdHObVcfduTC8L+bOD0KzOXDRTgAyTj2cApIn6EiK5FQvhN14?=
 =?us-ascii?Q?zk3CQAx2xbswRDVq94dZMdxFlebNXwJf+O4TIX6kKQK03fc9psQLcd8rGqne?=
 =?us-ascii?Q?fMVZhSLs67vxW94ouZexIwF+n8kZfxMkKy4tnwwHOanKHHBKjMn8Jy0nk9eM?=
 =?us-ascii?Q?beoQIP+F7LPTL/v6LcagUjSusnlM39QdClOlhSp44NJ1+4Uz0AY7PkC6BRb/?=
 =?us-ascii?Q?91RsDvQdrUh2f2FFP+HYKXGMyOvj0iK0Osys4sscDg468xbFVqhFxuRYwP0l?=
 =?us-ascii?Q?++b/651p8aSQOomdz0h2RRMIpdyzhYBGY7ASgsfLFVyBjUeA6XPR9o3p+Buy?=
 =?us-ascii?Q?zXkKcyx/TxtxZ0gVvJ4To7pTuenzR64ajGJwKyRNS5uq7U1fv8rBOFFF7W8P?=
 =?us-ascii?Q?hBLcNSs7Agr87PIO9EdtqNrTyJvTPYVj18Hite2K8U5cMVy3EUntMFkdI0gl?=
 =?us-ascii?Q?qhiJSlX7qgffIFk2fmugYJ06OHj8x8gW6puiiNa15y+AwvA/jdQe4Bn4ZPMy?=
 =?us-ascii?Q?mb3x7Iq4o5WHTxwA6ZOyAGvfpGMBJJnZ73qwTRG6BFJ/QiXgJGnmvsTdriLV?=
 =?us-ascii?Q?LebJWQXR2fP2l12qtAT6CZkPLZCksgZC87wZBkvS7zlB9oOO4VCnZKUtTY4J?=
 =?us-ascii?Q?JymdWUj3iiYKE9ao0xNnIEpA2xyu0R51Wd7cK6/G/f0B3WWSEU831w7LrNal?=
 =?us-ascii?Q?26a30Nd3QdZNjXgZQFkOZUiI9PHNlnM9nTg+ks8G3O9VcnW8krbjegccmqpK?=
 =?us-ascii?Q?xQR2bgPp6FTVvKG5F+JDqAFae8P22+OfFvu4wYxN3bjrj5t4V1i9iVQH3SOE?=
 =?us-ascii?Q?hUdEyaC6YjvnTtdTSGXCEbxV7RVN12m7ghxQRO39rtnvLOsKKa5DqO9l3qY2?=
 =?us-ascii?Q?YI0PgjIPVvQOQ82cFixboZy9eeB+WQA+gAImpxBbFaCyqmOpBX26/l+f/uf/?=
 =?us-ascii?Q?2qD8StdSPCg6FriGmbBa9+MzFn9LcfYqoDJJA7fFq2ZhrE8RJjxZjG32gxqE?=
 =?us-ascii?Q?5JrlQVlE3OTYuxGTb0wpjV94g7LB+qsKGGPE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q+3IFpYHbXc7uSCdR3NcWZAd2jkptxYlcPv9A+W1zci0uwpwSIEyjDeEPKKB?=
 =?us-ascii?Q?8n+TPoodjmZ4zfJXrhD6c7M8YLKjddLYT0fTQK5OnVNkLPoNQc5XDGycjWRr?=
 =?us-ascii?Q?AZCDMTmnp4iKcaLH2EdGlb7/aK20p546fjrqaLnK392uUx1HzqXlnOOFeY4A?=
 =?us-ascii?Q?LdfRkcHkxZwipWSezZyK11mNtBsFzt6ZHHjv1IRmvrdsigEjcayrpcr6Jbws?=
 =?us-ascii?Q?VQQrTM4Ksfn7n2SNbMzY6+bTT9gIBPYVW2o+lS3kkCDOe3L4BVK0jI2WYMuy?=
 =?us-ascii?Q?Bb65pvozGveHgxaWxgMLxG5ifvSh0IiLUblvsDOXuVMQ4jZIehDMYCf8OD5X?=
 =?us-ascii?Q?KHeULZLKHNnKyvfl8D0U5l9sWihOtyqnC0gpoOW7NE1LlQhDifns6E58Bf7K?=
 =?us-ascii?Q?EcqfUWWemZskeXdWfk1sT9G/MNQJPcrYV1ezL9n3RdNJSxHUOW1YX8Ngb8my?=
 =?us-ascii?Q?efwP/a2od9ElV43oZZw5VTF4gmbZ1c7xsel+/x+YKKY7gdsIk7lr8uD1R9kB?=
 =?us-ascii?Q?6KYTjhQk1hSqaAhP+sHY0a37SkU/fJYZeQXTjmO0Tqmvad1Hci+djEFfP4BN?=
 =?us-ascii?Q?ERrfdKuUQfqYtV08TzkKzsEvAo47/3DCwYJUBJlvE1ckKvrOQ5/BF9EhBxoP?=
 =?us-ascii?Q?v0+Q3rLlgBhTdXmL561ECgXPvuxDST2ee4wNkF0HttTzeG9OtHcskCHGDx/f?=
 =?us-ascii?Q?XdyBtQ+tY+9nE4xt4DvduP+bd1oiPSXcASHuM5Gh6SwO9RoRuCEyJtroMAAk?=
 =?us-ascii?Q?eZRYvYR0m8sSz8NfaTXU1qA+6LTA49cDUKQJ6VseuV7Fl9uIsNoAq1TxSQBm?=
 =?us-ascii?Q?ldByx1mtooEiy7XO8lrWclSLLGTiGFMZ640cwPnnK4uamsrsbrt/C8O/ho79?=
 =?us-ascii?Q?4mRDns3hDL2Guup2QW/93pE5d3eoOwi93E+gK5Wl4EQTFGckVxrtYf0QFbV6?=
 =?us-ascii?Q?qzXQ0vZMIWjrM7Pa8kRK85YAJLyJZEUn5IeBScKJclsUcD+wIolDTjV+hV7y?=
 =?us-ascii?Q?u5Di6aC1zWBaOayqol2io1jNWSr4eCdfFhIOGehVJT5Fje92hM25K0tbmrF0?=
 =?us-ascii?Q?l9OwhCxkia5RuKdKMiWsGNNzo+wEOSsBxvi6bpfQ15BaD8MzprNjDHKhKads?=
 =?us-ascii?Q?aEJ7X+voOaWUbgmQ+cbjxx26MPhhkCz2n9y5QJVg4RjFmBkvrfGqNBVuXqZW?=
 =?us-ascii?Q?n8I/X+hZqBl8+t5ZEqlBfPjWcPj/uM6TgTySaYDXloQWkmfs4EyCoDCK986T?=
 =?us-ascii?Q?O9u6sDT5fXGFxQlOd2WVLQ8T2CbkPH3BM9DEZXvrl9tCQGyyX+wCcZMz4to7?=
 =?us-ascii?Q?xVcPnfDX5Jufj/mPcBeG4b0jhK7c1jQJKYf6tFAWhF5zx7GoLPiEWcIcSfUw?=
 =?us-ascii?Q?Yku0nxtkkr4IfUJ3U+LONMc3j1Ut3byVzTNKDsyfkMG/awYxL9YQegayJx2X?=
 =?us-ascii?Q?uFECwCa5v9BqumcGy8EWaac5XMwplBZ2xGlSg9Dki7l3ITPChnLfkEkUy+ji?=
 =?us-ascii?Q?JgmYHhtyP/8WeI2kg/XSwg/lexDt/SC2aogqn+/KOeZnwLi0XjI1c0zzOFzq?=
 =?us-ascii?Q?a3PTGu1rHF6dRh/eLI8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac051316-e9de-4a8c-3ac6-08de0a796ff4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 16:56:22.1124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrTmGkO6IwQYqoaemX+huAh5Huxg27nLWgER/lDVsUgzfWBxpqpNPrZMIaRTwuoK+lcya5wXur//Rg3nF+IJKw==
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

On Sat, Oct 11, 2025 at 06:51:20PM +0200, Marek Vasut wrote:
> Rework dc_subdev_get_id() to drop ARRAY_SIZE() use and use empty trailing
> entry in each ID look up array instead. This allows passing of those arrays
> around as OF match data, which will be useful when using this pipeline on
> i.MX95, which has different address-to-ID mapping.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

This change is okay. but my questions is why need map register to id.

Frank

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
>  drivers/gpu/drm/imx/dc/dc-cf.c  | 3 ++-
>  drivers/gpu/drm/imx/dc/dc-db.c  | 3 ++-
>  drivers/gpu/drm/imx/dc/dc-de.c  | 3 ++-
>  drivers/gpu/drm/imx/dc/dc-drv.h | 8 +++++---
>  drivers/gpu/drm/imx/dc/dc-ed.c  | 3 ++-
>  drivers/gpu/drm/imx/dc/dc-fg.c  | 3 ++-
>  drivers/gpu/drm/imx/dc/dc-fl.c  | 3 ++-
>  drivers/gpu/drm/imx/dc/dc-fw.c  | 3 ++-
>  drivers/gpu/drm/imx/dc/dc-lb.c  | 3 ++-
>  drivers/gpu/drm/imx/dc/dc-tc.c  | 3 ++-
>  10 files changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
> index 2f077161e9126..846705534546a 100644
> --- a/drivers/gpu/drm/imx/dc/dc-cf.c
> +++ b/drivers/gpu/drm/imx/dc/dc-cf.c
> @@ -29,6 +29,7 @@ static const struct dc_subdev_info dc_cf_info[] = {
>  	{ .reg_start = 0x561809e0, .id = 1, },
>  	{ .reg_start = 0x561809a0, .id = 4, },
>  	{ .reg_start = 0x56180a20, .id = 5, },
> +	{ /* sentinel */ },
>  };
>
>  static const struct regmap_range dc_cf_regmap_ranges[] = {
> @@ -106,7 +107,7 @@ static int dc_cf_bind(struct device *dev, struct device *master, void *data)
>  	if (IS_ERR(cf->reg_cfg))
>  		return PTR_ERR(cf->reg_cfg);
>
> -	id = dc_subdev_get_id(dc_cf_info, ARRAY_SIZE(dc_cf_info), res_pec);
> +	id = dc_subdev_get_id(dc_cf_info, res_pec);
>  	if (id < 0) {
>  		dev_err(dev, "failed to get instance number: %d\n", id);
>  		return id;
> diff --git a/drivers/gpu/drm/imx/dc/dc-db.c b/drivers/gpu/drm/imx/dc/dc-db.c
> index 789942d1c446d..3958a2c4ec934 100644
> --- a/drivers/gpu/drm/imx/dc/dc-db.c
> +++ b/drivers/gpu/drm/imx/dc/dc-db.c
> @@ -74,6 +74,7 @@ enum dc_db_shadow_sel {
>  static const struct dc_subdev_info dc_db_info[] = {
>  	{ .reg_start = 0x4b6a0000, .id = 0, },
>  	{ .reg_start = 0x4b720000, .id = 1, },
> +	{ /* sentinel */ },
>  };
>
>  static const struct regmap_range dc_db_regmap_ranges[] = {
> @@ -176,7 +177,7 @@ static int dc_db_bind(struct device *dev, struct device *master, void *data)
>  	if (IS_ERR(db->reg_cfg))
>  		return PTR_ERR(db->reg_cfg);
>
> -	db->id = dc_subdev_get_id(dc_db_info, ARRAY_SIZE(dc_db_info), res_cfg);
> +	db->id = dc_subdev_get_id(dc_db_info, res_cfg);
>  	if (db->id < 0) {
>  		dev_err(dev, "failed to get instance number: %d\n", db->id);
>  		return db->id;
> diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
> index 23b0cea68d325..81334c0088219 100644
> --- a/drivers/gpu/drm/imx/dc/dc-de.c
> +++ b/drivers/gpu/drm/imx/dc/dc-de.c
> @@ -21,6 +21,7 @@
>  static const struct dc_subdev_info dc_de_info[] = {
>  	{ .reg_start = 0x5618b400, .id = 0, },
>  	{ .reg_start = 0x5618b420, .id = 1, },
> +	{ /* sentinel */ },
>  };
>
>  static const struct regmap_range dc_de_regmap_ranges[] = {
> @@ -90,7 +91,7 @@ static int dc_de_bind(struct device *dev, struct device *master, void *data)
>  	if (ret)
>  		return ret;
>
> -	id = dc_subdev_get_id(dc_de_info, ARRAY_SIZE(dc_de_info), res_top);
> +	id = dc_subdev_get_id(dc_de_info, res_top);
>  	if (id < 0) {
>  		dev_err(dev, "failed to get instance number: %d\n", id);
>  		return id;
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
> index 17ce2d748262b..a7ad17680a9b2 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.h
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.h
> @@ -85,16 +85,18 @@ extern struct platform_driver dc_pe_driver;
>  extern struct platform_driver dc_tc_driver;
>
>  static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
> -				   int info_cnt, struct resource *res)
> +				   struct resource *res)
>  {
> -	int i;
> +	int i = 0;
>
>  	if (!res)
>  		return -EINVAL;
>
> -	for (i = 0; i < info_cnt; i++)
> +	while (info[i].reg_start) {
>  		if (info[i].reg_start == res->start)
>  			return info[i].id;
> +		i++;
> +	}
>
>  	return -EINVAL;
>  }
> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
> index 86ecc22d0a554..a63c387a4c023 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -40,6 +40,7 @@ static const struct dc_subdev_info dc_ed_info[] = {
>  	{ .reg_start = 0x56180a00, .id = 1, },
>  	{ .reg_start = 0x561809c0, .id = 4, },
>  	{ .reg_start = 0x56180a40, .id = 5, },
> +	{ /* sentinel */ },
>  };
>
>  static const struct regmap_range dc_ed_pec_regmap_write_ranges[] = {
> @@ -226,7 +227,7 @@ static int dc_ed_bind(struct device *dev, struct device *master, void *data)
>
>  	ed->dev = dev;
>
> -	id = dc_subdev_get_id(dc_ed_info, ARRAY_SIZE(dc_ed_info), res_pec);
> +	id = dc_subdev_get_id(dc_ed_info, res_pec);
>  	if (id < 0) {
>  		dev_err(dev, "failed to get instance number: %d\n", id);
>  		return id;
> diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
> index 7f6c1852bf724..5fadd67aa911b 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fg.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fg.c
> @@ -92,6 +92,7 @@ enum dc_fg_dm {
>  static const struct dc_subdev_info dc_fg_info[] = {
>  	{ .reg_start = 0x5618b800, .id = 0, },
>  	{ .reg_start = 0x5618d400, .id = 1, },
> +	{ /* sentinel */ },
>  };
>
>  static const struct regmap_range dc_fg_regmap_write_ranges[] = {
> @@ -326,7 +327,7 @@ static int dc_fg_bind(struct device *dev, struct device *master, void *data)
>  		return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
>  				     "failed to get display clock\n");
>
> -	id = dc_subdev_get_id(dc_fg_info, ARRAY_SIZE(dc_fg_info), res);
> +	id = dc_subdev_get_id(dc_fg_info, res);
>  	if (id < 0) {
>  		dev_err(dev, "failed to get instance number: %d\n", id);
>  		return id;
> diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
> index 3ce24c72aa13e..d4e746f8c4297 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fl.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fl.c
> @@ -33,6 +33,7 @@ struct dc_fl {
>
>  static const struct dc_subdev_info dc_fl_info[] = {
>  	{ .reg_start = 0x56180ac0, .id = 0, },
> +	{ /* sentinel */ },
>  };
>
>  static const struct regmap_range dc_fl_regmap_ranges[] = {
> @@ -120,7 +121,7 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
>  	if (IS_ERR(fu->reg_cfg))
>  		return PTR_ERR(fu->reg_cfg);
>
> -	id = dc_subdev_get_id(dc_fl_info, ARRAY_SIZE(dc_fl_info), res_pec);
> +	id = dc_subdev_get_id(dc_fl_info, res_pec);
>  	if (id < 0) {
>  		dev_err(dev, "failed to get instance number: %d\n", id);
>  		return id;
> diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
> index acb2d4d9e2ecd..c1131b7b17c2f 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fw.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fw.c
> @@ -35,6 +35,7 @@ struct dc_fw {
>
>  static const struct dc_subdev_info dc_fw_info[] = {
>  	{ .reg_start = 0x56180a60, .id = 2, },
> +	{ /* sentinel */ },
>  };
>
>  static const struct regmap_range dc_fw_pec_regmap_access_ranges[] = {
> @@ -157,7 +158,7 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
>  	if (IS_ERR(fu->reg_cfg))
>  		return PTR_ERR(fu->reg_cfg);
>
> -	id = dc_subdev_get_id(dc_fw_info, ARRAY_SIZE(dc_fw_info), res_pec);
> +	id = dc_subdev_get_id(dc_fw_info, res_pec);
>  	if (id < 0) {
>  		dev_err(dev, "failed to get instance number: %d\n", id);
>  		return id;
> diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
> index 38f966625d382..34ea61c2de87d 100644
> --- a/drivers/gpu/drm/imx/dc/dc-lb.c
> +++ b/drivers/gpu/drm/imx/dc/dc-lb.c
> @@ -76,6 +76,7 @@ static const struct dc_subdev_info dc_lb_info[] = {
>  	{ .reg_start = 0x56180bc0, .id = 1, },
>  	{ .reg_start = 0x56180be0, .id = 2, },
>  	{ .reg_start = 0x56180c00, .id = 3, },
> +	{ /* sentinel */ },
>  };
>
>  static const struct regmap_range dc_lb_pec_regmap_access_ranges[] = {
> @@ -273,7 +274,7 @@ static int dc_lb_bind(struct device *dev, struct device *master, void *data)
>  	if (IS_ERR(lb->reg_cfg))
>  		return PTR_ERR(lb->reg_cfg);
>
> -	lb->id = dc_subdev_get_id(dc_lb_info, ARRAY_SIZE(dc_lb_info), res_pec);
> +	lb->id = dc_subdev_get_id(dc_lb_info, res_pec);
>  	if (lb->id < 0) {
>  		dev_err(dev, "failed to get instance number: %d\n", lb->id);
>  		return lb->id;
> diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
> index 0bfd381b2cea1..f44b68c0a5e6d 100644
> --- a/drivers/gpu/drm/imx/dc/dc-tc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-tc.c
> @@ -28,6 +28,7 @@
>  static const struct dc_subdev_info dc_tc_info[] = {
>  	{ .reg_start = 0x5618c800, .id = 0, },
>  	{ .reg_start = 0x5618e400, .id = 1, },
> +	{ /* sentinel */ },
>  };
>
>  static const struct regmap_range dc_tc_regmap_ranges[] = {
> @@ -91,7 +92,7 @@ static int dc_tc_bind(struct device *dev, struct device *master, void *data)
>  	if (IS_ERR(tc->reg))
>  		return PTR_ERR(tc->reg);
>
> -	id = dc_subdev_get_id(dc_tc_info, ARRAY_SIZE(dc_tc_info), res);
> +	id = dc_subdev_get_id(dc_tc_info, res);
>  	if (id < 0) {
>  		dev_err(dev, "failed to get instance number: %d\n", id);
>  		return id;
> --
> 2.51.0
>
