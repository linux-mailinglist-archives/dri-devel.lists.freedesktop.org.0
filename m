Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18124B1EFA7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 22:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C92310E988;
	Fri,  8 Aug 2025 20:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SDxZUE6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BCA10E988
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 20:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pu/XRNFf+xNUFdF9ReUSgtqNhfdJrYkUjxTL8KFOtGrCv4kaC3IKYvPkH4Rlxcd+2YM4Sv4xyDHi9Q+alFv5CHGw117Ze8BU4ioz4QAcqgyxXv9B1+WbC7SBTFB6X0urV+wDpckYPT6TNfCHm2ONK5KsB4uVY594kcui+9/yt9/3mzYNUuXpyvO+8vJ7AMvy04s7kis4/ZL1gKCl0vXZJ6Bs/CcH+CmpQVkr8IJHdW+e1mNy6SynGH2b9bbxYzHvXvynuaFi3+UaKAVS6f1X6SIBJKAG27wFnziFXQoVOzfHyp1NHjjDLsQHqKfpLkYzXCxiC5F3JeoI/AYoyH6a3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6aXklViFEyyuK/Y6bKkf1b/aIKkdTwKONfGHEdeAPo=;
 b=dSu/Ebqsf/hvBdk36qkdDSaG2bbzCdtAWPYRd6CZ8pGz2xiqaxJFN/CxttuWsynA0VhcYulMDk9WOx2kiKyL8AAN95TSffViQ1lWRIRlzOEMToY24ZYwsU0JyUK5BgcgNpak8o3Racs3Ixwh0hV4NJKerHY3+mJNPthYI79V+F++FsH4rZgJDn9L4/QcARlZKqFIrfCUINM7dXY5mc5yYay/DjVTXbpb+EcKrXIoCP7ZJcvuXIMdasNGnmiA5SUsq+SZbIkfpxWhue8d0tdbmEWb1Sky4AfsIRFEyjH6QrIDU81WhYXU1muf4C9glWE9R0qL/fzcxoYWQiPagdGGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6aXklViFEyyuK/Y6bKkf1b/aIKkdTwKONfGHEdeAPo=;
 b=SDxZUE6DOP6a2bTpBvwWIQHzlIzFKJ/KQ+75zb2TRquaFsaBLB6kg43Ec20K+HsYS7oMHPCvE5GL6Ojv813dV6HRWhL3BS0/FnmyzAosn0tVZjAAjGKlDfqTFHtCQkZehASgy4+WDrcpVotoFf2FeagxuOKSsjd5j6BtGkEiO15DuElrVPJzf8p0YGlxtrXj3s7LuB1ICUW6YI+A16QbMs+4jow9xVaC7FBXhzNcRP5hRCcF2eL/B25oqZ+heotNjFMRZZLdu8CQ1DnHk215AQw8ngEqeijWrB+oUQwgu9es4jD4Iyq9J02rG9iPbfgKu7TPEA8uDbC0RGlUPR4uZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GVXPR04MB10537.eurprd04.prod.outlook.com (2603:10a6:150:21b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Fri, 8 Aug
 2025 20:41:34 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 20:41:34 +0000
Date: Fri, 8 Aug 2025 16:41:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 7/7] arm64: dts: imx8mp-evk: enable hdmi_pai device
Message-ID: <aJZg8Q1mhFVV33yU@lizhi-Precision-Tower-5810>
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
 <20250808080617.2924184-8-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808080617.2924184-8-shengjiu.wang@nxp.com>
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GVXPR04MB10537:EE_
X-MS-Office365-Filtering-Correlation-Id: 342a7047-c25f-4301-81a7-08ddd6bbf64b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VbuibJEM8RjxevYI096LuordqUaK4GDZGERXkcTu9PviKBH482xexhw7gd2i?=
 =?us-ascii?Q?RF596QvolKxAWU2p5xKW6q3Xfd46KSoWTICY9RYJdNnraACZvikVTLmhkRGP?=
 =?us-ascii?Q?Zfi/TLO3txQnF9fH2/UGuFnTWcdpkZCRJYBV4QR62b6XhmhEl/jcKeGFsrgE?=
 =?us-ascii?Q?yH4j12BPGFm90JKzWRu+7Zcfpk0QptB81ACcmZxs+JSqwGrkQxM1LK3MNPw5?=
 =?us-ascii?Q?NcBNRvFxXvz6jKQLKunAXyrZOtPFEQ1/fAAlfLlBLhrJDCjIc+FU9v/sFqsU?=
 =?us-ascii?Q?FJ5Un6rrRpOADPZSErzo40MBCgyS7isIp6Ue7bg1tGy9gWMnN8autxsy9bAt?=
 =?us-ascii?Q?2IwgsR9s8ml3adn0YjHftLT/iLRBGl6QC4CbrilbOGM0+rXciIG/DvUppesv?=
 =?us-ascii?Q?kHyqi7kGkBC5jIZCXtv1wOPjJtYupWQISmWOhTKJfIfu5CQXjFijQ92Y5DtO?=
 =?us-ascii?Q?5erJRrBgIJj0cSHjketLDJEBDehjsV4w0JkaUJ/vbzXUs5d8Pu8GW/e/vEVC?=
 =?us-ascii?Q?2spriFA4nGh+Y6VDQZuOieImAsQIuu8f+GwCU0EL9ewUROgDxyMpuTKGDErQ?=
 =?us-ascii?Q?NyvCRD/VaDwqXxrrthTyZ6CnN+HOkRKDpbnZBY+p/VvT2b5n6B5AwPnEjwRF?=
 =?us-ascii?Q?qtp5WiUnKNm/u4MOtvbr1MCMIn2xpgT59ERdvRDh89/dtFz56epvZ8qGiO9m?=
 =?us-ascii?Q?H0+UPKvlo2Us6LeRB/pJcDoX6IaxXCY2ZhvldSOwYYK2FEofqUebFqvgll3g?=
 =?us-ascii?Q?0u2BMT4h4Q8eGIngdbqFxmFj6wxhV04bJRFdKT8cfuwdRheOiY/SCYVhyK2B?=
 =?us-ascii?Q?67zcfgOVbiWfZd2QStd5NN+ONFvHVlxs8eYRjbr4WGVYiOHJ2iV2dGIZgl8T?=
 =?us-ascii?Q?hbD2LI4jfQOVxnhcHoDffvKjDDTEtxE+nJET4f1Inb/jElHKcqN4Uw628NwM?=
 =?us-ascii?Q?A/IE35o3UdIKmZ6e2KwC8++1mOQP6N6XunWgytwWpfNIAaWTiFe4C7yquJJA?=
 =?us-ascii?Q?/LEK10IBlT0VNHe1d3FvN34oQ1uZIUS5hnT62559I1Z1UaiRyFeQkhHxoDLB?=
 =?us-ascii?Q?dj7Gc03pMURXBK+DMPRvm2Sj6UWboFlG9CmrUoChjzNGbX6wb1fp3/GyRkch?=
 =?us-ascii?Q?0U91WiN9333lb0+IShijYVqhKlT/qGuPtPGjxS1KxxI7uEJBOSZsfxna1Z5z?=
 =?us-ascii?Q?3uV4cmh7DrhUXnsGXM4pL9PXfZH6XI+2j0lklO0lvGbFWxKpcuI95wUSaFt3?=
 =?us-ascii?Q?Pej/KvTBYqcgRC7XP9RWwnhKUU9uMvuiCeQHzFeo04A/M+iJWwjD9X+VwZr6?=
 =?us-ascii?Q?agGIeurWc9jdZDnp5962je12RJ7AJVqijYMClHYxZCIHgnJrImWrHdcA9hVj?=
 =?us-ascii?Q?j66PtGb/2myqMTzZKFz/GTENt2/Cmvnkk/1IaHBxC9I6fxsHw/Jp8+g5/UiX?=
 =?us-ascii?Q?0IBcVWDHZwvUNRIV54B3R6O7bwB2/iZnm1d2eYnzLBXRviLcVM/Zqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YzYqz13PmHc+a4zlhUfQmt0D4cwixZGsOLlmbQZq3EKb07Z5fjBL4E3RVHo8?=
 =?us-ascii?Q?Ho/gkQZDVIKRbzl20XDzT6ntAH19m4Y8L+Vj6qLIWUlIIKZfwGXRLWZtktxm?=
 =?us-ascii?Q?yMGWw6Lft4oVOrr5kyCtweOilRUfKfaOj7NjD5xAFXDmda85xNZYUkJ6G2Uy?=
 =?us-ascii?Q?ZHgDBNYgCVhK4rLWBNgak11gVqH5vjmDU53RAWIRW4dwdKn+hCT2gYpeisr2?=
 =?us-ascii?Q?hFLuSsCbSdoHWbOhgmnbUtGhkY1tU6NtZInbXX4ozlesbINZWsbalwjSxTay?=
 =?us-ascii?Q?h6EV3uw7yCgcFh3Coo/Rghjw2/evo/Mz/2SqB65tHcCkz7JqdcchbrLByzu9?=
 =?us-ascii?Q?Aj59lqwtDxiK+RZBiN/cEeOSdPB0PwOigPP+C7zCOxJKSRlNx7IAzjxtMVl9?=
 =?us-ascii?Q?3C6ef8cRitU0Zt9kVNO/n8LBJIbfZWn93eoC/7dRQ54VEfGnZom4CxtEhs86?=
 =?us-ascii?Q?KliclCAfcwfACcUxKsDOQz8MrtQpHm4tInc+rEaLRJlv0wfsSM3mytPKQN75?=
 =?us-ascii?Q?KaR3BPGdvef0+J2p5E8ShGkCnEcvev5B7ZkhnqNgm8L/9UxljUgKUVj7e60z?=
 =?us-ascii?Q?wKQL8p5zy/Jo2oe3MsFvy+yNVuz/4kdwNahRbGON5iAXvjSrHlMT12/Pv4TP?=
 =?us-ascii?Q?sn9ZX6Vn/0uy3bvhBLZ4eAPMiIHdqFYyQFFz5sYYD8vS9ZmjfxWGA5fv3Hwk?=
 =?us-ascii?Q?l5Q5p3tedNmy7br3holJiuZqiULq+saG52FyLqyS70i0CtxH6vP77hZHUq+6?=
 =?us-ascii?Q?KtvJFag5aVXvFjzqiaEqHSwWfJaWpANgGve1sWbZiWl42x73hKf/7RFor7QQ?=
 =?us-ascii?Q?9a9tx8BYjGXMbxitGAkT1G6FhcZwmgqjqP8tesbBvzbz8kUTzSR+imxNVH9o?=
 =?us-ascii?Q?KbrtI1jLyQo01ci3uxXuG2aZtCcs2mbSmy9s+J4akRY+J931Hi20tUc57zcR?=
 =?us-ascii?Q?6qhdW/4WaQp7MY0kr/kW+/JPivxhrRlAEigeIHbz9t57tydKpPX++T/Um40X?=
 =?us-ascii?Q?fYyTHrD8xVnVXdKM9T2VWJ1a/Ma8vvTb1wKzndyR5+Ccy8jqYm0PeivKFYVn?=
 =?us-ascii?Q?vTX7dZDXnG+2xSAVmcRO4FmByQlC4z3iFnGPg14I1k/GvljZnk0PLGb4SKbs?=
 =?us-ascii?Q?ggGAK0FAOWVwwbNa2g/hnifpxHMaEC1UzKJObYQ9kiq5PHe19bbrg4KSW9t/?=
 =?us-ascii?Q?XrFnhaUDVKluNP1rHzebArefu2PQL2wY8L44jU1n43OT/1llqMnthssx31R4?=
 =?us-ascii?Q?vrVOBPVniVsJEYGNcnh48fS6mfDs2qhhbpkxD2JjsfbwxRX48A15WJ7xYdN1?=
 =?us-ascii?Q?svuA+Pn7dBDpR8Wu3smb6FYbRRMvJu0gKbeNIBSNwVtSze6GVbBmk/m74xvK?=
 =?us-ascii?Q?hlMG7EY062kjD5aoeem36j60MDo7RTAkUHQuAkhpIZSXdS6YfOL8jRVhYeoU?=
 =?us-ascii?Q?twAiuLEP8wsyKC/sjSFujbDxG0SPS0/n8HG7SNx6w4YQ7pssMZEt+1L4zkjr?=
 =?us-ascii?Q?Tv4N4LcZCBrqH+1YQQn8U92L6NGCHB4HTy18LpTKhNVqyEDcKntyk5Ax0Jan?=
 =?us-ascii?Q?0/cZ/ZwtrXJtLiuc+v8taIwDr29W/VkR/XoMqcsq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342a7047-c25f-4301-81a7-08ddd6bbf64b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 20:41:34.0074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJHTE5IwEcF+auM00nPIRzszBCJOdVwbYf/z9VL4rEDVsD5TeOGEttuMr3gJgDKHxSS81oY2yrRZhxQZWJK9xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10537
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

On Fri, Aug 08, 2025 at 04:06:17PM +0800, Shengjiu Wang wrote:
> Enable hdmi_pai device.

nit: need empty line here. betwee two paragraph.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Aud2htx module, hdmi_pai and hdmi controller compose the hdmi audio
> pipeline.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index c0cc5611048e..cc9351a5bd65 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -442,6 +442,10 @@ &flexcan2 {
>  	status = "disabled";/* can2 pin conflict with pdm */
>  };
>
> +&hdmi_pai {
> +	status = "okay";
> +};
> +
>  &hdmi_pvi {
>  	status = "okay";
>  };
> --
> 2.34.1
>
