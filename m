Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA2EB8A3A0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D691810EA25;
	Fri, 19 Sep 2025 15:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OhbLc3F3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013001.outbound.protection.outlook.com
 [40.107.162.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6A710EA25
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:16:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxalJgee/ZvH2b83xwD/IOLDNqXhfZVcNJu2xU1TEVKaZ1zoVwBZvj0l7POXv7/KboEgYll9gquvJRqzRx7AVxqSRl0NddsbH3b3O6oKFJwyZH2furBuFqRS4m3aWR/08/E+LSJu7X8UsDLXoaLhI7BCturCZbWhDXOr0dtIRY2CYYrLbgrKb39ZaMxqyyO/obFU2m32nXGh+o1N5bNXIX64LcgEcP2xyss9f8BoHTyxauDXVVBeJOYZ101jSzX/BvERWbEUI/gO/8Xb7SnmuxACiBxDkPI8j+B70qbaPjfvNVcSQJYhsqgy8EpGZt5+36rOT2fljK+YfphB7z8vtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0F0kWVp8WUFpVYipH6dGf+4Ikdnj8kgxay9EQyBs6s=;
 b=lWdj3I7GC8DbDRrQhR3GctZWE7UJJvF7Rn1lkHRZb7CwIstDAM3l1F/5dTe02VcZUXswjwvJ/9vT430nw+u/ZGxBZW8GcuK331MSICs4yPQuS3qJWlpUyo32Q045s0TwOKkqVSRJUFslvCGgPtMG27hjxe1JHex+Y6uuLRLdNtNkcsF2EpNK44Fh+79YXd/KZ6O9pYGpaphNumyNy8Eq+GGZ1Bdu+vfhl2o0Ytnl5fFriMWX/JUArE84bEtjbRjwtGcHJbm6QJkZc07uT7OWb8gI7Rtw36pcDOMx4Lb55J72fX2fuHsLZLAH+q4CpbfpqXouNUIKjBmDdWRxAKT6VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0F0kWVp8WUFpVYipH6dGf+4Ikdnj8kgxay9EQyBs6s=;
 b=OhbLc3F324YeW10rgIa8w7tBSVaLbgJMOxQ2ATvN/qignXMlj+nJ5x4CgFykcvgR/lagVJo4BWQDhg7fLIT7qe7ZDD9fiolIrBbKjFUqyXkQQESyP7zhK3hZwfqDV1Q3o04fCVM04iwoCGm6wMJjoubzRh9chtYLR/XsQYlPK8t+R36LVoAYfvXxc8nbIaaRVeJaBt8G4Q2R8QEhd7vjtU3puEWTisxLdNQsiaRNRTIlMygnrU0/ScG7Tze4R639oqA8wGkhKhKxbcIhUuGuidQcIiWyrp4nyr2xS9SkIa3k9h37LrRpgwSHK35dj/sotwS9gkCE9OTEGK+uYYIJLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10964.eurprd04.prod.outlook.com (2603:10a6:102:490::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 15:16:04 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 15:16:04 +0000
Date: Fri, 19 Sep 2025 11:15:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/14] drm/imx: dc: Add DPR channel support
Message-ID: <aM1zrOdM1pj5jq/z@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-7-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-imx8-dc-prefetch-v1-7-784c03fd645f@nxp.com>
X-ClientProxiedBy: PH8PR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::16) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10964:EE_
X-MS-Office365-Filtering-Correlation-Id: be42fe6d-aa96-4cae-53e4-08ddf78f7354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mmp8lgm2B345FAobK6vyBnBS2G+wXaxaLBhg7R35xqSY+0N0eo0Sxz+Rk2IG?=
 =?us-ascii?Q?QHRcwwsz6oK+5xybv0YOXzMhgPDSHlUbH7gFonn4ovXJG5Wmn7Cy5vM3Owzg?=
 =?us-ascii?Q?PzSX+cqqS7P2h+oo9CzsaF459OHbhgW6vTjzfseGbQdX3tzcCiHRpt5XxCWX?=
 =?us-ascii?Q?qbd8CT+kIVDB9pUWtm31XDkaW5M6l3tBI5N2HABb6TNd8R5W8x9ZyCDpAQhR?=
 =?us-ascii?Q?AjIOlFNgrZ2fo5aUg0JF2I/ebEY61RySci9viHfV0nnOIGU8bbHyjWrgUGuf?=
 =?us-ascii?Q?6G6ve6PEtwizvlStbQsQxKks3iRSDhoSi91tgRjwGWvHZMLu5PUBEiXkltyn?=
 =?us-ascii?Q?z6kyZnITjC0jh/2SCr1khQLSNGAsL9bp62BBDlmt8rpisuRVacdXnkgCdjs5?=
 =?us-ascii?Q?a6lr/NDlULOsYV98l5bAA+ogQbIJQEeaWe8kM3DWh3+operXovDBlJLLlPhG?=
 =?us-ascii?Q?4pb3SjyIW9spS4w7sJXFAeQvfF8Dtejtc/nqhHs3itMBKUefh8JAkofUuqPK?=
 =?us-ascii?Q?yEUMFUjbdEBMi3RxGMTUfU451ukWHRl69dwFbIn2lrBj4bVb4hSNnNgAOa/q?=
 =?us-ascii?Q?OKEH/z5O3yN+CzzXm29tdnZu47Z233VZI6ZeloUHe7TWsVnMa5P2S3kU2PMO?=
 =?us-ascii?Q?icXhioHdWlpBDuJ1PoqyrOqosNVM4ka6CubfpniRgvFtRJ+QDiynPOpkjhXm?=
 =?us-ascii?Q?eMgaL5rDI8kbySlwMzis3c5eiOFc1bDCJ461Al042egQZW0MAgDQ+UENjtHf?=
 =?us-ascii?Q?84fKpoZz0ucPNkhoeWiz5V6eEWcRYKgajClMYK7SxOw5TrbBewGQdmjyiItL?=
 =?us-ascii?Q?rS19mTHHFrCwI6+M9uD3NofXHYRmle3f8KjY936ZzxRLK6zVG2SE+D20kiVO?=
 =?us-ascii?Q?Af236vn5pyNTQHxizSN+hojDiXji3sqjV/GiXA+c/iDsTyE/qLad67JEUZ9K?=
 =?us-ascii?Q?nqBBgYyryy2+Zu/j5QK6U//w8oNGH513Ixy/W0NTG61FZycku8FgTJQhSo5z?=
 =?us-ascii?Q?uqhsvZbA8WVh8aABPWbaTViaA18G00xbNRPQuBJPimuZXqIOyde5gzs7uax7?=
 =?us-ascii?Q?4mS4xwcO4w+5O5PXelN8tby4hQTQ0UYVwabdLM7dGqzfkVAlMvfsy034Fm51?=
 =?us-ascii?Q?NgQd9vo/rMAFnBB957x5DklG0WL2uH840uAd58paIU1Sw9ejzYqG0L65bX+A?=
 =?us-ascii?Q?rnJSgED1mKpNFTd/n0/JCOxFK/9knQVnp7mEUFNdFGleO1btS4WQEXxFca51?=
 =?us-ascii?Q?gMx86VmtT3MDrrqrXeXRZGatgP3zrt32W5zd99rXqj2XyK7UDFPzy5K00uyX?=
 =?us-ascii?Q?N116WKJM5JZMxmgCq5VE+8+CsbNmvSD2pWRQZhzkiHHE7DPezgMjBVB1sOxG?=
 =?us-ascii?Q?/jo+XBMxNqydny5edk6QCSEUMv1C6u++X1uTuXPrVpUAwjixy7MzqAG0YWl2?=
 =?us-ascii?Q?O7KzUBHhU4UdbcIbE+Z7RrD7dKTD20QSZwikNmyYtgdDXHW8onilwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pThVDbZ6YcrHsynY3HcGJlPWQF4wlAvCFyoAWq4lMMUHi0K0zIkhP8NCTXZ1?=
 =?us-ascii?Q?zO9/5nFkIwF67dgrRdmg8wZ56nSZHOSrWZxc0yMTEtLSRNKfLj1OAVn57R45?=
 =?us-ascii?Q?qXeb/GdIaZ5cSC+MXXTXJgS76P0raHKf0eKngypkhQaxVghJHf5VZJMaLopI?=
 =?us-ascii?Q?jV7BrqmztvH1Ct1ihry4e99QXnRPUYLRfc187DaXONW6oVzPpoL3TjtK43kB?=
 =?us-ascii?Q?qUIVaV4v3xyyIt1KC8hkmLmf+MJg5wU3kWhhWCie9hAm2w5fbsv8aEz3Jke7?=
 =?us-ascii?Q?SvshLvsuppNDdT1wBNudAY6yDNwA4LYnBsfoBASQ1gdSdbNEumuZhdl6qqSg?=
 =?us-ascii?Q?FKQnkV2MGWe8qY9bbcb8R8C65nC21kpHD1PvNZShAOAO2sk4dLxGR+4dR5Sg?=
 =?us-ascii?Q?J3ARr1t1rrMKwCYB0akVWgJGAXVqUGFpGFz1Ask6pwiGT/Ouc46bGH3+umrP?=
 =?us-ascii?Q?1W4PTp+D6JTpzHMGY3PVo8Xml0RMLPlNmy2LURx9ROBdCZeyKiQ4A8z3gi0G?=
 =?us-ascii?Q?OPhuRsYPOZr7lC0InvJEo2LwcwWDYDG1v6dM3iLaqjqTsaIwDjk5JFxnDnLL?=
 =?us-ascii?Q?/D1/9mzIYP8dwmOqgXlaw3saHSZ5MZ1tJxvwUbRmoZ+R1d1jwp2TdccmaFi/?=
 =?us-ascii?Q?0KbDmQLfIQR49X0CCBpT56kgQAkJ5eAyqzME1DQEnkH2l+zEtpeseYDZ/jRu?=
 =?us-ascii?Q?x1ciFaKokCbsf/RltjIZTwJZfGS0OyfyCtfzefCrFRTpBko4V0GBOxsTGUL2?=
 =?us-ascii?Q?wXgSqQ4LgTRRzld2hlkZq7ydFUK7k+hsfZrIArYyFkILuhWEURWwt9xxRCyG?=
 =?us-ascii?Q?K1aY/0IlfK7YZ5kVFDy5jq8MXxUCLxKeNZGM/xzFbyvT6knBW0dpgltSgwrE?=
 =?us-ascii?Q?OwbActDDiAN8XVhn0rHeRQUpFj0F14p+P2CMzhb5Jmaxgf3CiKkr9jesPfGT?=
 =?us-ascii?Q?jsYmKiO6Ye/1Zs0z+igGqw0HRf/Vsg5Zvah8K8kBFYbLzOD6wlUjERvol4yn?=
 =?us-ascii?Q?jPZ7EDrDNw+VJiy4DYqgmYfprmZ24EL6dTxMtCUlNoNoBbExlltgi81l6htj?=
 =?us-ascii?Q?9svophXewLzQHzUNm5BJ6UjOk1j8aYEp36hYA5cWnuWUl8fsQmWAzl/cPDke?=
 =?us-ascii?Q?RDGGf617jSMoeQROPjy7m2ndCTHp033NTbdhNvFhNXwXBd6xphHFLbPFNi3g?=
 =?us-ascii?Q?jWAsqXlzmty903eh9qO0W4IThmpLaDyZ9f2bQbm52I8Fqh5Nd4yW5X8fSg/V?=
 =?us-ascii?Q?Rcz1cVak0KSTsdma6egPtmn1qbkvLYqYeHJritWKm4IVcfqIV3Hb+f2KkyOv?=
 =?us-ascii?Q?uuoG2KGJ2tqCUeS/XfeDRIo7XonoNsTNgzkm9c6Bjh72m1Kgj3rLuR6xNTLe?=
 =?us-ascii?Q?uB3B8BvuFjgnCtIMqIONe/jfQjfadONLOUCXCaHdHE0b8sG8PMu5WnSH0s/c?=
 =?us-ascii?Q?MsVqrBAs8BMBvnIkn1F+WrrEo/rgVZ+IpnUy1iqpG82vLHM1WDXp+GpSgiTN?=
 =?us-ascii?Q?CN3l6gttaW5dPcBWggzaO6AHv0NOjqVu13sdOBFiE1Y6cwVU6+R062b3plrq?=
 =?us-ascii?Q?N+H9HMK6ZyLts/ao18MAcW17sLifiaWtC3a1ty24?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be42fe6d-aa96-4cae-53e4-08ddf78f7354
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 15:16:04.6310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlFCKlD30Jfqo2TRW+kSFVQq3gy2NhCIZaOcOCzhJ4WxX6sAuX1CAWxAjMvLt0H843WcW21EK0zgrgcBb81jJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10964
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

On Fri, Jul 04, 2025 at 05:03:54PM +0800, Liu Ying wrote:
> Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
> It fetches display data, transforms it to linear format and stores it
> to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
> a gasket between the RTRAM controller and a FetchUnit.  Add a platform
> driver to support the DPRC.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/imx/dc/Kconfig   |   1 +
>  drivers/gpu/drm/imx/dc/Makefile  |   6 +-
>  drivers/gpu/drm/imx/dc/dc-dprc.c | 499 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
>  drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
>  drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
>  drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
>  drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
>  8 files changed, 556 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
> index 415993207f2e3487f09602050fa9284fd0955cc7..507dc9a92d96be225cd9b10968a037dad286b327 100644
> --- a/drivers/gpu/drm/imx/dc/Kconfig
> +++ b/drivers/gpu/drm/imx/dc/Kconfig

...

> +		return false;
> +
> +	if (!dc_prg_stride_supported(dprc->prg, prg_stride, baddr))
> +		return false;
> +
> +	return true;
> +}
> +
> +static int dc_dprc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct resource *res;
> +	void __iomem *base;
> +	struct dc_dprc *dprc;
> +	int ret, wrap_irq;

If have new version, try keep reverse christmas tree order for nice look.

> +
> +	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
> +	if (!dprc)
> +		return -ENOMEM;
> +
> +	ret = imx_scu_get_handle(&dprc->ipc_handle);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
> +	if (IS_ERR(dprc->reg))
> +		return PTR_ERR(dprc->reg);
> +
> +	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
> +	if (wrap_irq < 0)
> +		return -ENODEV;
> +
> +	dprc->clk_apb = devm_clk_get(dev, "apb");
> +	if (IS_ERR(dprc->clk_apb))
> +		return dev_err_probe(dev, PTR_ERR(dprc->clk_apb),
> +				     "failed to get APB clock\n");
> +
> +	dprc->clk_b = devm_clk_get(dev, "b");
> +	if (IS_ERR(dprc->clk_b))
> +		return dev_err_probe(dev, PTR_ERR(dprc->clk_b),
> +				     "failed to get B clock\n");
> +
> +	dprc->clk_rtram = devm_clk_get(dev, "rtram");
> +	if (IS_ERR(dprc->clk_rtram))
> +		return dev_err_probe(dev, PTR_ERR(dprc->clk_rtram),
> +				     "failed to get RTRAM clock\n");

use clk bulk API will simple clock handlers code, include suspend/resume
codes.

Frank
> +
> +	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
> +	if (ret) {
> +		dev_err(dev, "failed to get SC resource %d\n", ret);
> +		return ret;
> +	}
> +
> +	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
> +	if (!dprc->prg)
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "failed to lookup PRG\n");
> +
> +	dc_prg_set_dprc(dprc->prg, dprc);
> +
> +	dprc->dev = dev;
> +	spin_lock_init(&dprc->lock);
> +
> +	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
> +			       IRQF_SHARED, dev_name(dev), dprc);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
> +			wrap_irq, ret);
> +		return ret;
> +	}
> +
> +	dev_set_drvdata(dev, dprc);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
> +
> +	return 0;
> +}
> +
> +static int dc_dprc_runtime_suspend(struct device *dev)
> +{
> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(dprc->clk_rtram);
> +	clk_disable_unprepare(dprc->clk_b);
> +	clk_disable_unprepare(dprc->clk_apb);
> +
> +	return 0;
> +}
> +
> +static int dc_dprc_runtime_resume(struct device *dev)
> +{
> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(dprc->clk_apb);
> +	if (ret) {
> +		dev_err(dev, "failed to enable APB clock: %d\n", ret);
> +		goto err1;
> +	}
> +
> +	ret = clk_prepare_enable(dprc->clk_b);
> +	if (ret) {
> +		dev_err(dev, "failed to enable B clock: %d\n", ret);
> +		goto err2;
> +	}
> +
> +	ret = clk_prepare_enable(dprc->clk_rtram);
> +	if (ret) {
> +		dev_err(dev, "failed to enable RTRAM clock: %d\n", ret);
> +		goto err3;
> +	}
> +
> +	dc_dprc_reset(dprc);
> +
> +	/* disable all control IRQs and enable all error IRQs */
> +	guard(spinlock_irqsave)(&dprc->lock);
> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
> +
> +	return 0;
> +err3:
> +	clk_disable_unprepare(dprc->clk_b);
> +err2:
> +	clk_disable_unprepare(dprc->clk_apb);
> +err1:
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops dc_dprc_pm_ops = {
> +	RUNTIME_PM_OPS(dc_dprc_runtime_suspend, dc_dprc_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id dc_dprc_dt_ids[] = {
> +	{ .compatible = "fsl,imx8qxp-dpr-channel", },
> +	{ /* sentinel */ }
> +};
> +
> +struct platform_driver dc_dprc_driver = {
> +	.probe = dc_dprc_probe,
> +	.driver = {
> +		.name = "imx8-dc-dpr-channel",
> +		.suppress_bind_attrs = true,
> +		.of_match_table = dc_dprc_dt_ids,
> +		.pm = pm_ptr(&dc_dprc_pm_ops),
> +	},
> +};
> diff --git a/drivers/gpu/drm/imx/dc/dc-dprc.h b/drivers/gpu/drm/imx/dc/dc-dprc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..f977858b57fec2f19775a97dc0baf011ca177c0b
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/dc-dprc.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __DC_DPRC_H__
> +#define __DC_DPRC_H__
> +
> +#include <linux/device.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_fourcc.h>
> +
> +struct dc_dprc;
> +
> +void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
> +		       unsigned int width, unsigned int height,
> +		       unsigned int stride,
> +		       const struct drm_format_info *format,
> +		       dma_addr_t baddr, bool start);
> +
> +void dc_dprc_disable_repeat_en(struct dc_dprc *dprc);
> +
> +void dc_dprc_disable(struct dc_dprc *dprc);
> +
> +void dc_dprc_disable_at_boot(struct dc_dprc *dprc);
> +
> +bool dc_dprc_rtram_width_supported(struct dc_dprc *dprc, unsigned int width);
> +
> +bool dc_dprc_stride_supported(struct dc_dprc *dprc,
> +			      unsigned int stride, unsigned int width,
> +			      const struct drm_format_info *format,
> +			      dma_addr_t baddr);
> +
> +#endif
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
> index 9bdcfc5aee976ef77bea6b3f6f3ac5f11249798f..17b9c4d0953d46be0a2cd276f06298d848fdcbdd 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.c
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
> @@ -269,6 +269,7 @@ static struct platform_driver dc_driver = {
>  static struct platform_driver * const dc_drivers[] = {
>  	&dc_cf_driver,
>  	&dc_de_driver,
> +	&dc_dprc_driver,
>  	&dc_ed_driver,
>  	&dc_fg_driver,
>  	&dc_fl_driver,
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
> index 557e7d90e4ea8ca2af59027b3152163cf7f9a618..93a8ce4e7c314770b64ccb631628b7e79648c791 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.h
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.h
> @@ -74,6 +74,7 @@ int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane);
>
>  extern struct platform_driver dc_cf_driver;
>  extern struct platform_driver dc_de_driver;
> +extern struct platform_driver dc_dprc_driver;
>  extern struct platform_driver dc_ed_driver;
>  extern struct platform_driver dc_fg_driver;
>  extern struct platform_driver dc_fl_driver;
> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-prg.c
> index 9a1a312c0aeebf47bcf50ffa77971aa3bb431a12..bb6c47133e90f9bc5eb3fb0e30c3f338ec82213b 100644
> --- a/drivers/gpu/drm/imx/dc/dc-prg.c
> +++ b/drivers/gpu/drm/imx/dc/dc-prg.c
> @@ -19,6 +19,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>
> +#include "dc-dprc.h"
>  #include "dc-prg.h"
>
>  #define SET			0x4
> @@ -63,6 +64,7 @@ struct dc_prg {
>  	struct list_head list;
>  	struct clk *clk_apb;
>  	struct clk *clk_rtram;
> +	struct dc_dprc *dprc;
>  };
>
>  static DEFINE_MUTEX(dc_prg_list_mutex);
> @@ -217,6 +219,16 @@ dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
>  	return NULL;
>  }
>
> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
> +{
> +	prg->dprc = dprc;
> +}
> +
> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
> +{
> +	return prg->dprc;
> +}
> +
>  static int dc_prg_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
> index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
> --- a/drivers/gpu/drm/imx/dc/dc-prg.h
> +++ b/drivers/gpu/drm/imx/dc/dc-prg.h
> @@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
>  struct dc_prg *
>  dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
>
> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
> +
> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
> +
>  #endif
>
> --
> 2.34.1
>
