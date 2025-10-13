Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E79BD5C26
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87A810E0C9;
	Mon, 13 Oct 2025 18:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jel2ETph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013015.outbound.protection.outlook.com
 [52.101.83.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3202810E0C9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVfCYFtryA/uWLS/pr2oaaY0SuZp8xzWs9vEGy6vDGtA3I9OkNj4Kk/V9NzjSTRmKOQqHLAPkdt/8vGvV0pqKYgPJ02qGWLluyPXkecKzH1TlHgbyxisPm8FVw+oIUkh5Z/gFMc3pOyKzblI7gZzsTyK1BoUdc2DcV4cvS+kupUBAzMRuA4bjy99V0Zjx3x0NhQtYPSxGgb2SHEl6qM3bBr80aapTlrYGBFXTg/pEKT52od64jArkZHBqEX/3zw26MmYogReRkKW/Oes0bL3dVDBM6UasrKXFUUkQ4gKBEG6b4gTmh23NVK9odPPZHZRu1s9R0YL1YvlyUC/KeYyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cclUZCokfzkWX/My7pclPq7I3xvSQ4vcLg2ABHvrnHU=;
 b=Kuwro+Q7Y22j+UWlSnx68Yf6DDpu5O1YabQn5k0KL6hFoWixQgQtczaEVFsCxr5qVaVyrF+OhdvOKGMXs8lgJiaJtHK3wmQklL8TPe8ONahXftPhP02SGVnfI9J7GH7DY4sQgIbz8M8KBnkNemWmjQXdU28zUmklr7tu8Ty9olgcgJt+U8Nxk6pmPIlOFIwjdK+Kgd/0Uzn1TCqGwkxKaY4K+wNjwmWJh1MMoNF0/8cqDzHW51FnwLB6eKWOLjrNFhvQ/Y5LIo9b35rvv4G1FYTtPRITyuyFIJb9DoJF1+CMGIzIvzhn0RmdeKD5xh7CEMOgKZvg/2zkDD1/+M+5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cclUZCokfzkWX/My7pclPq7I3xvSQ4vcLg2ABHvrnHU=;
 b=jel2ETphH51iATkZvHV/5EFNu9ACQKn1O2bE36eBXxGVGs4l4xDmFJ+BaWT1LkRl6dDlShpqXf7MOHY2g/NEAoULsitZ7jyiM3bcbaVZuBMGzy5m+oJYK27iYp10ySuNzek+zNWvtdyWWj3zPsWk69U2y8HvEYGYyo7RY34kdW4FMwn/kVueh4IZH/XANmomhEMcdtxH30xItVliLa7jkQXpGQrTzeLXX3i+i0ZRs3HM0oD/UeFNIjodu20X7041pA3yPORCpv7reWQfplaVFMTrBxlWVcKQs0hXT7dbBw1Znnk473WiM3uxEva6GaJriWec8IykUwnvy01thU/ioA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 18:43:59 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:43:59 +0000
Date: Mon, 13 Oct 2025 14:43:51 -0400
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
Subject: Re: [PATCH 15/39] drm/imx: dc: fu: Pass struct
 dc_fu_subdev_match_data via OF match data
Message-ID: <aO1IZ+DfqrzXz4rW@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-16-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-16-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH7P220CA0060.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::29) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DUZPR04MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: 43dd4071-b77f-4e00-ff2e-08de0a8878f4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WD7njMvBMgZ5m6R8kJsBhZnp3ahaIf9Slstl5sUny4+ticRliLy+Xj52yW+E?=
 =?us-ascii?Q?6h+oYzlr7fnddRdp72FdodUpzTW6U16rhTFSo/xAdyo8/4B9rfmntT4HjLwu?=
 =?us-ascii?Q?ndZKTRMZUuErX2zmNkHPWQrsOjS4/IwdVF1bMu9gUHBieRO396ktx3JFCx9v?=
 =?us-ascii?Q?OeYaccrjrUvy4UPqqU5Eqrid5ajAhE80rg6tuRm3i7bitONdC+4WbYpbafHH?=
 =?us-ascii?Q?XygPQUELAnROhW7zm2JkAH5aeaOYf8ClfW1hMi9cG+DxDIm65jpN226kKOYc?=
 =?us-ascii?Q?/N3Vn/z7ewvnORzrjT1sOmHM7kCClr5YyAUGbUHKaO6B0OI7U9l5Omll/Nql?=
 =?us-ascii?Q?iBlduWHWApBgoOUj/39IlnFMjrG3h4ZywDM6OwSc6pTjTeT5u/+74feRfS2d?=
 =?us-ascii?Q?htlm6xM4+P0nNfy2Fsv8O15AnrVk0eeEmKAAbAPRne5PHhP3//NHo5umKSjE?=
 =?us-ascii?Q?Uw0+zIP17eAfgeCKhhmArT2YbmuuxhOYaEMZK4Ja7ziC5cMRcGUG4H7LsT1s?=
 =?us-ascii?Q?b1XdjLBTifVMkqQ3193OKlwptyBt84rqkMotBJVafz6YhBstCbLrI1q0fay8?=
 =?us-ascii?Q?HZjEDVUNkwMPxHlZtuWsWvukuc4x+XrC1QI5G9/dlczZarAJsli6o/WYNUqJ?=
 =?us-ascii?Q?BiWHAxPRV79nu15xahmmhytrC78b9Aok5xwzkcDUHfoaB4ZL6GqRCXWbwIkU?=
 =?us-ascii?Q?XCiyQzbTdevuw9ORt8c7wuO2JEk0MQcUbeTM7eSArHPWrO54pMPWrw7jm5RL?=
 =?us-ascii?Q?EvsbU4KDJO8c/sSw6pGcyNe95yc8DgYbpzmE3CQduz73Wc71d//N3/3i0qAz?=
 =?us-ascii?Q?hhr8AfMHGaFwc+Ci5lDXX4YuZFBOGJC8f8x84ho8JIqOV3jHsuvTwgKFT5tt?=
 =?us-ascii?Q?0nfaZPftSxo3dJyB5+4wHhfOjVN/TyqqUFv3iDwCw4gooRR6k41cWdkLroJQ?=
 =?us-ascii?Q?RgNQYQFlucJK9eVqMVYFPQf9fhjEedMXbq/9N6CvFIXitMtd/botyGYLfbiV?=
 =?us-ascii?Q?twnWj8MuN/kKfdaShyhRsCex5rz+99O3dUmwCL08R3DpP6QDGYLyKD0WDLXT?=
 =?us-ascii?Q?+xAPXxk1Q5/1ltGnOOpvJby4Sgfjdz/fmZ3JdkThsjT8Uv4yi2Eq2BXMKuQi?=
 =?us-ascii?Q?F0WG9+vDvrjlVqzLiO66eEge7FSRF169LCo8WaO1jBCGkKsp1aeic3ighkce?=
 =?us-ascii?Q?zXxvzeEjySTZdJTNNAtiVg7EVkRXzZZnyKHlcXiQ9PTQ5aZujR9yFvm99mt1?=
 =?us-ascii?Q?/IvbS7rkEIJhbRtL6NsgME0GXIt7XU/46dam0imP74lQTonA5HByrCPvVoGU?=
 =?us-ascii?Q?mJGze/xTqhRBtsIVLGkAnvGLxPda3UjknmJOeg8YbFO2/4A6uw8lz70G6iY5?=
 =?us-ascii?Q?K8zZrNcqPZvsvm4WkfkIUs7AXjhGvitYnSpQHFQP3q/PJCdaVhL9Ins9so1n?=
 =?us-ascii?Q?0lsTNfZp+hmcG1M7Px8+ohgeloTCfAhKkefBe6ySwGqvohdwg3tMd/T5IXL9?=
 =?us-ascii?Q?DpZ+t+umrM1gs8S6xtfIt+kEgLrC5wnFHhjO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QthykxPbY17eq5lDWkUdRqH8tBRR0D7rXXysu2VBk9wi0f1Nl0NzDpbwPtTD?=
 =?us-ascii?Q?KmkgEDKc7abEyLm22DpVVjmrk49N4Ge5Byf+MDuRh4HSeqZLrIbSZdYK+ObU?=
 =?us-ascii?Q?wRi9q8wl6VorlKf6P0X9KdqpN+ijon0S6TOfwpLZeuiAZCsA6bUbj6Um+PGp?=
 =?us-ascii?Q?bjurYgqd9R5DKGdOYQxtmAsVumGzRwORWWi0tCCIM9N8ZwxROFDxBgUmW+3s?=
 =?us-ascii?Q?0hcICYG2tLZ/XpwjaPXXQDi5AWvl+eP/fmwTSiUrPhBNs/ZbYjYoj35AVtL3?=
 =?us-ascii?Q?tkLDqwgVayOqLQLvm2kf15pwtmrDITQQT5w1iRsTNmoK9mlnN6n/94rTLXyZ?=
 =?us-ascii?Q?MGREBgUdeHvGz19W3YlS4yK/zaDs2r8lvdVI8Mg4qzHYTiO8didWaqL2DwwJ?=
 =?us-ascii?Q?etzb1gI4rJyVoq19KydOc7y3Gp/TFBLMujeGiBGHNgOppbU8T9KhqZupF6z9?=
 =?us-ascii?Q?sMVjVo4Amdj3zSstgNzXt4kkmkToqcJNppE1MZnmX3mo4eORpHzZIvIuKaMY?=
 =?us-ascii?Q?WRemSvhLIOn12oWFtqUjzcvxLv+wnR/uSAdyYEoEtVZAHDJ044VN+E+NwjGi?=
 =?us-ascii?Q?q4A12KUM/YtfAU+VxN1T8E4NbvcD6BXFwHXpguHa2mbWqtPqPwvOAyxGH40x?=
 =?us-ascii?Q?wkDUioKkP+TnQ5yw0IpFg6tExTWUuhd6B3Z5K7uLlLh0W+hzcKGT6KxX4XVz?=
 =?us-ascii?Q?2jZ4xtDlJV6WzKRpEDQI5pH+yiak4pj0BGoJnZduU+D2x/N1vVa0CFFIpkMr?=
 =?us-ascii?Q?uZN5hJDyXEi5P6zhWWr5JdLm7SyKkzRcUxgbhhCs8gUWhm5FkarUMTX+1BMF?=
 =?us-ascii?Q?RuXy4ShOKRmy5NGF5dI0ciZFa+OmTmyfnLSKSDCVzg1jPrksCgB9o2chzv1+?=
 =?us-ascii?Q?kVRUh3mn94Vk7TKugo5K466udQpZAgvIhFkSuBdnLpl14rO0NmcYzxGZb6W4?=
 =?us-ascii?Q?MQtzhcAXjOHTfF911qigQWEPCRX/UwRPCCu3AlZi0U3L9ClWsfHospRtokcR?=
 =?us-ascii?Q?JJo8RO/8J8/EKNavQVargE77ZOT811AqeiHPjQe19TTlZxGcXflgAQ3PWH2e?=
 =?us-ascii?Q?PcbGhGFbmp69juZM9kf/tuokPFFfQBpGJV9oH0Oa453b2PKYPPQCf2mRGvlx?=
 =?us-ascii?Q?wsktboPxj0kHJDa3A3A4fGQ8IJ94n9G5fsKpa4rAtV/IJr3H6mekd03VhNMC?=
 =?us-ascii?Q?+1heJVUsyehzZjdtq3AsW8sLhY9QYFEMKZ02/UYaI9YjQfjxprFkYYmQioEn?=
 =?us-ascii?Q?1Qs/qWGzsSjjyaPTBTT/FN+f7PbLo0lU4tIchT3udL9ci9EhdcfS7crTF+2n?=
 =?us-ascii?Q?zJjyGQDc7YtvEDo61/MuWH47NmKT9VpLIJD43aGR32hxsMP9gT38cUhBBxmj?=
 =?us-ascii?Q?H4kTtyKE/cewWcfKVmr/SqLVzFIEhNxFM9CjHY8vbFA6V15MMtK+pRxlurFF?=
 =?us-ascii?Q?bCbmed9JBOG1uJ4989oDM1RFrUSlpMvsERaGfoN82Bd+UuwATMaAbgcgCzdz?=
 =?us-ascii?Q?ekAGsUsil5ty0JHS0gNPy5pHMbqUxDDxuTq6ZdLfMZadSxVZ9uY6aahMUuTc?=
 =?us-ascii?Q?3WZpkcck2oZ8QPzrG9g=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43dd4071-b77f-4e00-ff2e-08de0a8878f4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:43:59.5861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvO4fJfEILkuGz5BL1RKCoIoAMXJVniY1cKXhP0RhiVlhfjZq9CqjMr7XLCjmAG66zav2kWL3DcsG1irghQw1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9948
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

On Sat, Oct 11, 2025 at 06:51:30PM +0200, Marek Vasut wrote:
> Introduce struct dc_fu_subdev_match_data which describes the differences
> between i.MX8QXP and i.MX95, which in this case register offsets as well
> as address space offsets, and pass it as OF match data into the driver, so
> the driver can use the match data to correctly access registers on each SoC.
> This is a preparatory patch for i.MX95 addition. No functional change.
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
>  drivers/gpu/drm/imx/dc/dc-fl.c | 61 +++++++++++++++++++++++-----------
>  1 file changed, 41 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
> index a76825dc75fe1..53647e3a395b4 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fl.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fl.c
> @@ -15,8 +15,6 @@
>  #include "dc-drv.h"
>  #include "dc-fu.h"
>
> -#define FRAC_OFFSET			0x28
> -
>  #define BURSTBUFFERMANAGEMENT		0xc
>  #define BASEADDRESS			0x10
>  #define SOURCEBUFFERATTRIBUTES		0x14
> @@ -28,35 +26,55 @@
>  #define CLIPWINDOWDIMENSIONS		0x2c
>  #define CONSTANTCOLOR			0x30
>  #define LAYERPROPERTY			0x34
> -#define FRAMEDIMENSIONS			0x150
> +#define FRAMEDIMENSIONS_IMX8QXP		0x150
>
>  struct dc_fl {
>  	struct dc_fu fu;
>  };
>
> -static const struct dc_subdev_info dc_fl_info[] = {
> +struct dc_fl_subdev_match_data {
> +	const struct regmap_config	*regmap_config;
> +	unsigned int			reg_offset_bbm;
> +	unsigned int			reg_offset_base;
> +	unsigned int			reg_offset_rest;
> +	unsigned int			reg_framedimensions;
> +	unsigned int			reg_frac_offset;
> +	const struct dc_subdev_info	*info;
> +};
> +
> +static const struct dc_subdev_info dc_fl_info_imx8qxp[] = {
>  	{ .reg_start = 0x56180ac0, .id = 0, },
>  	{ /* sentinel */ },
>  };
>
> -static const struct regmap_range dc_fl_regmap_ranges[] = {
> -	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS),
> +static const struct regmap_range dc_fl_regmap_ranges_imx8qxp[] = {
> +	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS_IMX8QXP),
>  };
>
> -static const struct regmap_access_table dc_fl_regmap_access_table = {
> -	.yes_ranges = dc_fl_regmap_ranges,
> -	.n_yes_ranges = ARRAY_SIZE(dc_fl_regmap_ranges),
> +static const struct regmap_access_table dc_fl_regmap_access_table_imx8qxp = {
> +	.yes_ranges = dc_fl_regmap_ranges_imx8qxp,
> +	.n_yes_ranges = ARRAY_SIZE(dc_fl_regmap_ranges_imx8qxp),
>  };
>
> -static const struct regmap_config dc_fl_cfg_regmap_config = {
> +static const struct regmap_config dc_fl_cfg_regmap_config_imx8qxp = {
>  	.name = "cfg",
>  	.reg_bits = 32,
>  	.reg_stride = 4,
>  	.val_bits = 32,
>  	.fast_io = true,
> -	.wr_table = &dc_fl_regmap_access_table,
> -	.rd_table = &dc_fl_regmap_access_table,
> -	.max_register = FRAMEDIMENSIONS,
> +	.wr_table = &dc_fl_regmap_access_table_imx8qxp,
> +	.rd_table = &dc_fl_regmap_access_table_imx8qxp,
> +	.max_register = FRAMEDIMENSIONS_IMX8QXP,
> +};
> +
> +static const struct dc_fl_subdev_match_data dc_fl_match_data_imx8qxp = {
> +	.regmap_config = &dc_fl_cfg_regmap_config_imx8qxp,
> +	.reg_offset_bbm = 0,
> +	.reg_offset_base = 0,
> +	.reg_offset_rest = 0,
> +	.reg_framedimensions = FRAMEDIMENSIONS_IMX8QXP,
> +	.reg_frac_offset = 0x28,
> +	.info = dc_fl_info_imx8qxp,
>  };
>
>  static void dc_fl_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
> @@ -99,9 +117,11 @@ static void dc_fl_set_ops(struct dc_fu *fu)
>
>  static int dc_fl_bind(struct device *dev, struct device *master, void *data)
>  {
> +	const struct dc_fl_subdev_match_data *dc_fl_match_data = device_get_match_data(dev);
> +	const struct dc_subdev_info *dc_fl_info = dc_fl_match_data->info;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct dc_drm_device *dc_drm = data;
> -	unsigned int off_base, off_regs;
> +	unsigned int off, off_base, off_regs;
>  	struct resource *res_pec;
>  	void __iomem *base_cfg;
>  	struct dc_fl *fl;
> @@ -121,7 +141,7 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
>  		return PTR_ERR(base_cfg);
>
>  	fu->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
> -					    &dc_fl_cfg_regmap_config);
> +					    dc_fl_match_data->regmap_config);
>  	if (IS_ERR(fu->reg_cfg))
>  		return PTR_ERR(fu->reg_cfg);
>
> @@ -134,9 +154,10 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
>  	fu->link_id = LINK_ID_FETCHLAYER0;
>  	fu->id = DC_FETCHUNIT_FL0;
>  	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
> -		off_base = i * FRAC_OFFSET;
> +		off = i * dc_fl_match_data->reg_frac_offset;
> +		off_base = off + dc_fl_match_data->reg_offset_base;
>  		fu->reg_baseaddr[i]		  = BASEADDRESS + off_base;
> -		off_regs = i * FRAC_OFFSET;
> +		off_regs = off + dc_fl_match_data->reg_offset_rest;
>  		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES + off_regs;
>  		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION + off_regs;
>  		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS + off_regs;
> @@ -147,8 +168,8 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
>  		fu->reg_constantcolor[i]	  = CONSTANTCOLOR + off_regs;
>  		fu->reg_layerproperty[i]	  = LAYERPROPERTY + off_regs;
>  	}
> -	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT;
> -	fu->reg_framedimensions = FRAMEDIMENSIONS;
> +	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT + dc_fl_match_data->reg_offset_bbm;
> +	fu->reg_framedimensions = dc_fl_match_data->reg_framedimensions;
>  	snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", id);
>
>  	dc_fl_set_ops(fu);
> @@ -180,7 +201,7 @@ static void dc_fl_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id dc_fl_dt_ids[] = {
> -	{ .compatible = "fsl,imx8qxp-dc-fetchlayer" },
> +	{ .compatible = "fsl,imx8qxp-dc-fetchlayer", .data = &dc_fl_match_data_imx8qxp },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_fl_dt_ids);
> --
> 2.51.0
>
