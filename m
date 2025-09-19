Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BA4B8A4D0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1249F10EA48;
	Fri, 19 Sep 2025 15:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Rh8bx4xZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010059.outbound.protection.outlook.com [52.101.84.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E03510EA48
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:31:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLbisE41HX12TUlRMdYHfQvgH0T8gLf5HrTLbVh4mGutDlaWV36+ZX0MH7GMXmwv5j7C43BkPKCmcbV6fjxTA/1Sj72LcC+GpJfME8FIUOTKuRWBYo7vBGO7wUjnO9cmI0twbimWz1W5N8HatJottLsoPGWOsKiSMTmknu2aTClkNLUjbaJzIQo9vMuyf8f+wUlbq+ZwYVGDEisuQCqkzMgUBgcWMUxE8AR55rjgV5TwiQvEDxVTJUjRMT+5AuvqGWWUsfjH04umfl7sEmRNxRAaFreI8I7fb8dkN9+LiwQKv9rGjMowhfQST5iXXmMLT6AcxDrUInygdfmFYLS39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Rnj+tn5BhghHc2JD00O1Zhp70YUSAiqHu5Xfxsl4+c=;
 b=XR2jnDs74/NEQ3iHfmwQw/6jU7LnSfu/tQOa1Ch8m/CJXfWIUfY3ZZS4S7bXUE0qiWFn0Gh2Gug2EqXksbulsQOIBUcIxyATwk9zo+QTYSF+Ib62ulix9VJZW+72pL9cnQlPv5SdkayKd1iBnQ3Hs7sYxbPIG7XXuthhyMaPtlKJ0ynhXMG6Jigv5LIBDFkvP33zrArHZZdLE8cxPi9CoHh3jTnOjXbYFYE4kBztzsF/ywa4JEu0XrcMo5U8jv/tN3ngHDpn8ChqrFc6XrnQufR/j4jsHK8mnUw7bYGRha/ajqhCswZArwgn5d13xbUHxOUe1wix/v8LgmmATFFg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Rnj+tn5BhghHc2JD00O1Zhp70YUSAiqHu5Xfxsl4+c=;
 b=Rh8bx4xZmuCrjAMG+Pws/QxA+CM1Wa0Or3qorcx21q66ivyeAVbuIGd2hKzG8iVFxa6V5jrtPitcwUEQiO0+28o9/QF9p/S1QmEzQ1hIbn1iY9gPpeqIh+29WjAraI5lyvsxKiggNy8+IgoMDxsag/pyhard6ysVZvMVpq1euCMagsoTn1srdGybh9DhzYPjHuWjkYwIJu/TVktk07qZzDz7+88FAeMOwTx8AWcVftrqmTlXhOLs2Yyg2kMk7b7Or9+eIdTSVV0+wVj2vzXWSLrcxCwjw7VjAWIUpgHE9mG682PP8TN+IjNJzJr0Iw/heSpvGXLZOHIENLyPYA8Gmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAXPR04MB9204.eurprd04.prod.outlook.com (2603:10a6:102:227::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 15:31:56 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 15:31:56 +0000
Date: Fri, 19 Sep 2025 11:31:46 -0400
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
Subject: Re: [PATCH 13/14] drm/imx: dc-fu: Get DPR channel
Message-ID: <aM13Yv9CIkzuLV6N@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-13-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-imx8-dc-prefetch-v1-13-784c03fd645f@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAXPR04MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa047de-f68a-4ea4-6217-08ddf791aa66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yrZiFljFuTx6FtkCyLfAfzXYHL+iJ0VdwdfHqaCqQc2rIi41J3Ms1a3av3Ju?=
 =?us-ascii?Q?xYB/a3kKqIl4IXpOw4KbLH05kwiV02nvq0eR5SBsRkJHBymkTf4SlGFvQnIo?=
 =?us-ascii?Q?9IlhbDJ0m70Jb9O/IaJoj/kQd4GCB69PcnRxapJln5K7fWsUv5e9BIrYit8x?=
 =?us-ascii?Q?gZw0d5Ew8JpaAj00PmsjizMiNjr9/DWzTGED3KWUM+fBm6+4u+QJObWFlhnt?=
 =?us-ascii?Q?2/IbykTKWBFbXaCQrnA67PPz2DeRFjE1y1CRX078MAqYkwZz+QnDS6ENHsiN?=
 =?us-ascii?Q?TfvCkLffUNF/8fPssskBDA/eb/pwG7IVbOmKLWP2uAgPVH4N39ySLf8C25cS?=
 =?us-ascii?Q?j/RShFBD46aDPi/aeEOhf2wGkKB7xKDYThs/ixfjPBgJwM50GFuilGWxasie?=
 =?us-ascii?Q?SN0L3Or5ENhAfV7n+n/97bzj1K5/4kaQDI8WdfCTPjnOxSIgpWyJm6PD1ioH?=
 =?us-ascii?Q?6DBYUvXNgWTYZPpzuekATxqFpgSg5q1Zfag4hvLZerzObonju2tFEnvKOKDX?=
 =?us-ascii?Q?iwkhYpEy8r4hMa/6RetFtqe3IATOKTlJR4kA7Op6RByRXQrZOj4P0gX6r2Z7?=
 =?us-ascii?Q?5f3XKT3HigSrpeReafQGFxKPz7aVt3EQyQk6MZ9UnlvmQ5Rn/KNhSMtLBJGT?=
 =?us-ascii?Q?uDEub6k5MuBtY8jB9T787ZOlnJfhGyz1zH8nB7G9+7qDwTDiUTzWcnDmAz0z?=
 =?us-ascii?Q?XmTRzlTF3ibFtcqcBRZyJMFL8tPR5XvITmSDEEVkYnP/VqiklQvrlioxMSHD?=
 =?us-ascii?Q?lS2ddPNhS0wDGLjtB4re5APw7Mui02M3Ki3/vCleUxfYdqFcIchtSszKzoD/?=
 =?us-ascii?Q?LWDl8H9K+5sfeoPmsVFwyogfBLkf7KhihSmxHidhhDrMfp9Y9avJ52O3fEyt?=
 =?us-ascii?Q?FgXL7786Cv04Sw5t87tiP0UaB1TdDdZOlHkw8+pOvuEdHn3LaRN8yJ1/ohr4?=
 =?us-ascii?Q?mTWv4PmhBHkQX2IGOH6iQ470WNIk8OqZ+jXXMLSUJUtL/Q2O7GCidlqb8Jot?=
 =?us-ascii?Q?pj+6SeLBKKKWoVGfraOkST07702vFOIogoDohteQFejo7bHD9VhwB/h12dED?=
 =?us-ascii?Q?WmPgJRFzEKELFVFCnsIVwiEvzgoQW16uFrYWCS34McVGDLexgFJJ5lyom3kJ?=
 =?us-ascii?Q?HTsL4UYK8FmcXsT8aoxvIUssUOPh8b0wn53RFRzz1VTvGzOrBK7z2P273Xpq?=
 =?us-ascii?Q?I+JxWwmFLRnv+iZab/pqc2ztToWCQuEIsgkhqHC9aKk1vi68kcopqzlvxGkr?=
 =?us-ascii?Q?l722A/tmAmB7Ue4y3hH1vt1RX7+q8kq9+044mf5euGNtcdq2PL4DHwxPrxZw?=
 =?us-ascii?Q?+yvEjVa9ZKkxvKzYqdMH5NOQqLMBJqFOBmyjZsJsteDa5HN/EOp8fHSmx2XJ?=
 =?us-ascii?Q?ISUDhgwvf7prLl1dGAWMRZXENiEpqRjyXVDIZ/T0P6nh1EmGf7jzcA3bbpAx?=
 =?us-ascii?Q?Vdp3KivFtPucyExsVYWY9TVvMo09Snt9y2eMuL3TYVX3b/5eIARC1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uwnmhNIC+Nx00as2H2RCzluU1jg7u3dtcG5FY5uaW1ehNKFowBDu4h8UlG0W?=
 =?us-ascii?Q?fuWnFQB27BFW6J8NEoyDdl/XfTrbAEXFp//IR3C5x/bw+Xp+p2LxYMiUte9O?=
 =?us-ascii?Q?vjvgAVYlOhUNIRJvTf4rA9//AwGk5l/KDJqr/JLGKiKI/tdkTu1SgrpkNAmk?=
 =?us-ascii?Q?rLZ3TJQaVuTxgToxV64kG3afAZDRU0WIFYOeTDMUSj58rzI2CxDZtz+m7PZP?=
 =?us-ascii?Q?NZCghEMSPNX0BBCYxrMYo1tAvCyOilEV0sHcAQyrLcYdrgMB0oS232dBNp3z?=
 =?us-ascii?Q?7DxDXsPVXyJy69lCwKvpYeTbvHVP0VdNIxnThhO6kiLH9Ai1zafMqQWzcKQv?=
 =?us-ascii?Q?aX9hpnuPX4BgDkpcWrjrZ+FpBWqZT71Fqooolz2HlO6sFSoMQxsoKVL2n1kl?=
 =?us-ascii?Q?MN/Cs+Tc+Ya46gE66seN+dfNHkXKczYhp62XvQWPH18QIYvBohWEI0frtmBT?=
 =?us-ascii?Q?VdJuCWWqiZbLM2velHW61cFd/aI5HSVTKlUhIyvy58OBgUFQgjTJQJFNGHcL?=
 =?us-ascii?Q?ATb2QamSCKRUgkFRoxBk81Ks6L/4Llefh47FyW2s5vb6t2o73iNeY84yx/cT?=
 =?us-ascii?Q?rWNB8+U4IF7HILQO7dojHqwbe643Aq2Ff4T87GBXtMp65VZgUl+SWHDNkrYo?=
 =?us-ascii?Q?v1RdZx1DCUAR4znp5z/ap/yOEJ/OgKEUmNNmr7FZXd/NF/q5QAsTnkAgXMf/?=
 =?us-ascii?Q?ufWxT1XpP9WWONXq2LVol4L93IzNoFruOTzn7BsAVngdItfGgkTQRDrORWZF?=
 =?us-ascii?Q?RpFYxL8KaYkeUuNxf+/XazYMH3PFJt08zRJlz8YGVtCROU3utnyZ8cAcmENw?=
 =?us-ascii?Q?m8iTad4wcT8Sa5auTBsj0gAoc3QiwRq0g8+StR1P3txiGF/t560zF+oFmhfq?=
 =?us-ascii?Q?nA7bf66GgiAZBOc1RujvPuaHc3fPu1M5oit1NnscAwrJEFE/eO7EKJ82PIQ7?=
 =?us-ascii?Q?kRSuKC5TfruBlevaQqe7XPFJLu94IRE9+zyRLzGjnUoHk0J0qYfdAomW8vQo?=
 =?us-ascii?Q?GbRu1SOqCv2EUdr7NEg9pWQuItZIh56vHNC8rjmkk5W6zDEe+5NZDVM+N6PO?=
 =?us-ascii?Q?cGcLFOx/WF6iNWAUCY14NQSZzPpkTRXuG8FeyrxwbGseugHU/02LTo50PJNc?=
 =?us-ascii?Q?HE2kA/uVXsNgNFcVWJYV5caUQYkHz+dQ1alRi3qEELsqvmhxRfcKJ5Gybduh?=
 =?us-ascii?Q?TIcakiU41HBD80A1coiHe+ZFKpwWcnI5Yb5mzQxPX5PrOMxYLm4Fgt4LwRuf?=
 =?us-ascii?Q?8X5Jr/7aFveiFYSOFzuh4ttpUr7ZTueARUeB0i7qFYF8FE98MHdavgv63LvO?=
 =?us-ascii?Q?QKG0IGve5qBual2EnfpPxejjgsLZ+E3RVs5elvUxFXGlXAwj1NPYZeEczoJm?=
 =?us-ascii?Q?wG6pzw9OTcgn2IOSfyWWk3iP3kmyvk1OEC6IoS+gmZk8PRapohh++J1YmCWX?=
 =?us-ascii?Q?FjsJz/GsPHKmNbofAe0t/P2+FXHPtoT+Nn/PlR2NY/6uDFpQtWUuIoSqSR+g?=
 =?us-ascii?Q?k56VK0bk890JClJg2ru+5H/naRNo1Ee+eTo4bvLMcJcwd7jSEk2HWh0veoDQ?=
 =?us-ascii?Q?9fCk12+oQnK4gmLsREpxp+2SxcP/IWeC//eA4WxN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa047de-f68a-4ea4-6217-08ddf791aa66
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 15:31:55.9461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0aBT9P0qQam6RB4kaP96QE1Js0+tOqwGfU1zIK1Q+3R8Ojd+VQWfetbxVoUL5HD6EjdaZQb/EnrgKQAECQeHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9204
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

On Fri, Jul 04, 2025 at 05:04:00PM +0800, Liu Ying wrote:
> Add a helper dc_fu_get_dprc() to get DPR channel for FetchUnit.
> And, call it from dc_{fl,fw)_bind() to get DPR channels for
> FetchLayer and FetchWarp.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/gpu/drm/imx/dc/dc-fl.c |  7 ++++++-
>  drivers/gpu/drm/imx/dc/dc-fu.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fu.h |  5 +++++
>  drivers/gpu/drm/imx/dc/dc-fw.c |  7 ++++++-
>  4 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
> index 3ce24c72aa13e8aa150c0152a5a1ea3d0fa90b7e..a1835f43da0dc5cf0c83d93f16658b485011e285 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fl.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fl.c
> @@ -101,13 +101,18 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
>  	void __iomem *base_cfg;
>  	struct dc_fl *fl;
>  	struct dc_fu *fu;
> -	int i, id;
> +	int ret, i, id;
>
>  	fl = devm_kzalloc(dev, sizeof(*fl), GFP_KERNEL);
>  	if (!fl)
>  		return -ENOMEM;
>
>  	fu = &fl->fu;
> +	fu->dev = dev;
> +
> +	ret = dc_fu_get_dprc(fu);
> +	if (ret)
> +		return ret;
>
>  	res_pec = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
> index b36d3034b8d5962eaab212b6b65ebbb5c29f978c..47d436abb65157de7cab74565e44b199be76de52 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
> @@ -10,6 +10,7 @@
>
>  #include "dc-fu.h"
>  #include "dc-pe.h"
> +#include "dc-prg.h"
>
>  /* STATICCONTROL */
>  #define SHDLDREQSTICKY_MASK		GENMASK(31, 24)
> @@ -256,3 +257,20 @@ void dc_fu_common_hw_init(struct dc_fu *fu)
>  		dc_fu_set_pixel_blend_mode(fu, i);
>  	}
>  }
> +
> +int dc_fu_get_dprc(struct dc_fu *fu)
> +{
> +	struct dc_prg *prg;
> +
> +	prg = dc_prg_lookup_by_phandle(fu->dev, "fsl,prg", 0);
> +	if (!prg)
> +		return dev_err_probe(fu->dev, -EPROBE_DEFER,
> +				     "failed to lookup PRG\n");
> +
> +	fu->dprc = dc_prg_get_dprc(prg);
> +	if (!fu->dprc)
> +		return dev_err_probe(fu->dev, -EPROBE_DEFER,
> +				     "failed to get DPR channel\n");
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
> index 518d1af49f5ae9d4f67da5e6c2e80abd7e962120..44b9497e53580589a05bcb180eb2312ea4449da4 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.h
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.h
> @@ -8,11 +8,13 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/device.h>
>  #include <linux/regmap.h>
>  #include <linux/types.h>
>
>  #include <drm/drm_fourcc.h>
>
> +#include "dc-dprc.h"
>  #include "dc-pe.h"
>
>  #define FRAC_OFFSET			0x28
> @@ -99,6 +101,7 @@ struct dc_fu_ops {
>  };
>
>  struct dc_fu {
> +	struct device *dev;
>  	struct regmap *reg_pec;
>  	struct regmap *reg_cfg;
>  	char name[21];
> @@ -114,6 +117,7 @@ struct dc_fu {
>  	enum dc_link_id link_id;
>  	struct dc_fu_ops ops;
>  	struct dc_lb *lb;
> +	struct dc_dprc *dprc;
>  };
>
>  extern const struct dc_fu_ops dc_fu_common_ops;
> @@ -123,6 +127,7 @@ void dc_fu_get_pixel_format_shifts(struct dc_fu *fu, u32 format, u32 *shifts);
>  void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask);
>  void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp);
>  void dc_fu_common_hw_init(struct dc_fu *fu);
> +int dc_fu_get_dprc(struct dc_fu *fu);
>
>  const struct dc_fu_ops *dc_fu_get_ops(struct dc_fu *fu);
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
> index acb2d4d9e2ecd6d36dbab050f25b560d9ec9aba5..c2e60741bc871c6976ead53f132b60f19352aab3 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fw.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fw.c
> @@ -131,13 +131,18 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
>  	void __iomem *base_cfg;
>  	struct dc_fw *fw;
>  	struct dc_fu *fu;
> -	int i, id;
> +	int ret, i, id;
>
>  	fw = devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
>  	if (!fw)
>  		return -ENOMEM;
>
>  	fu = &fw->fu;
> +	fu->dev = dev;
> +
> +	ret = dc_fu_get_dprc(fu);
> +	if (ret)
> +		return ret;
>
>  	base_pec = devm_platform_get_and_ioremap_resource(pdev, 0, &res_pec);
>  	if (IS_ERR(base_pec))
>
> --
> 2.34.1
>
