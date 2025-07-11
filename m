Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF43B0121F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 06:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C5B10E990;
	Fri, 11 Jul 2025 04:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SplnPh4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18AE10E990
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:27:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIn/ziz9iYF/gewpr866N8OZhPFzYcR2tu34lRTA7PvTi9UNSD6sfBkPKClJe2Qcx83ypCW8iXEDLuYhZGE8Fgzo5gIws/aIwIeZM76lKeunjyl1//UlVhXmlxrfg/eTFUilt8oiYglUZ97+rISrbNVisMPmTPvW6vkEhkdS2f45e5AVJttiNK+v/e4AyPxlEGn48LERvIhJRoGBAZxY17oHxJmRqpk3ZDCBpSgnWZTMsmX1y4eEtBfd81dE4eZfN8LzMiQymTOmjvv+LW3otCNITGYHs+6CRvIWbJjXboJNSq/4sFFycMNUSeJ4SNUP2ZzIC1w46An9AkOCAg69TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqA35vd6BCRpMXael0oUcOnbH9y/svcw55BZeu7EZYI=;
 b=WikA3uinvXugcBTrCipgrG6+JPugjo8M6FVZnPEjO8R5StCkh3Mn3qmo2lamklQujjZE0SuOw5Q/M7X8gElzed2i3eYMArapigc3vbHvV2aWed22Apjdnjllu24CbDWU5XDjdp0/HL+1iiUtVgAxxF0tmAE4MLInohl5vzTHZYYgpIDzxf4h4tphiX7oAwrpU5erNCBF1iMN+QvbMuYwX8ggQLTMFIjS18vQG2jK+r4DWzSxyNdPV6vXUeAZHb/0qhPR5VfMK9fJ1ccIDsgWcAjaoUgmIKzivXk/g4RgPYN4+E0FbvWY6Ph58psodEwXvlQvgI/t02lBtL1J5Akk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqA35vd6BCRpMXael0oUcOnbH9y/svcw55BZeu7EZYI=;
 b=SplnPh4+kMmHs59VuVEDeHOatIqOZA+zEm/R/OdwyCHP5Xq5bRq+nyTwuWaVEVkyHGpyOiT8/0JDoty1ioj9tfmBZn17G1//ZZXlEuletq84AUWRxd0zj1qjVDruQ0JjSQyXQRbh3aYPzg/k/FrxY8tt448s+7zGVR984xEyl7bn4Swa1sqdd0PX3F/UckcTPc7LGwTBhYKgSazvCcvF85soOa4UYNfHFl2qHlfoie36fNynNW+8osit6wmxoZtyp8Y2QZuKoJaJXr81myLC975vBKSCx9VtUAf5/Ap/kb23RqjK5g92oLVwoqJpd3W4duEFLVyombf4E+nNFLQUDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB11484.eurprd04.prod.outlook.com (2603:10a6:800:2c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Fri, 11 Jul
 2025 04:26:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 04:26:59 +0000
Date: Fri, 11 Jul 2025 00:26:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] drm/bridge: fsl-ldb: Add support for i.MX94
Message-ID: <aHCSjh0xYC1NWLKn@lizhi-Precision-Tower-5810>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-5-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709122332.2874632-5-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:208:1::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB11484:EE_
X-MS-Office365-Filtering-Correlation-Id: 320aab78-b6b7-4a69-004c-08ddc0332d4a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XkBnvfPokM8B5GpOzTNJQSza2iGPptZ/jas8sr9wyY2+EClL100yAe0tsbj6?=
 =?us-ascii?Q?1oqw69oy50mv7h3NGLK8kmsBelmcP1vDE2IcBuD0jUvzWXFzv4hvnYn8+xE+?=
 =?us-ascii?Q?O/wCakl1C8K16aVfckb7NWWncD3yngWbxprMkHFAtyj11ljB6leLyYm0N5cB?=
 =?us-ascii?Q?YELhLQLCOUg0/wCG4aVvy8PST7LT9N8iCZFHLrSZNLau1BvoyER5M6yYobh9?=
 =?us-ascii?Q?dx29YFgo3GbLKwEwWAF2bGNWoBwzoZZinPR8NnVfFW9zRMtBkh9GM3Ap+FLz?=
 =?us-ascii?Q?Fm28PctMMGVS+iIpUF4DB2S6zkDtLtxchCAqMweDH93jsyi0wRTWigXG1mH+?=
 =?us-ascii?Q?Rw1LYk47o8/PH+ctZ+UI+v8MmN9NRI+q9XKeSXjjcQcUx+kZz5VUQJsY+ZE8?=
 =?us-ascii?Q?aafjv9lOH7zgdh39VhLSGgQ5QaY5079oEJfjrWzyELU6i/nchbOv+LqIOlbe?=
 =?us-ascii?Q?sjULlxJ1hD4Y3aCEucwmWeWWadg73UQDRXQ859FnG8BkDBlIcftEJZ1o1zq3?=
 =?us-ascii?Q?pGY69i++vZffEJqAI/6c5nSW8vrtMp3Y0kdfkLRkM+Ypr2R8ixg0uSsuWxGk?=
 =?us-ascii?Q?OUGCchGs48RuS7gRxdbKcZZz/jIgkBSCBDfzHIdDsRrDVy+FiPc11kBHp0Fe?=
 =?us-ascii?Q?y+jFFCFGIQuZ0TPvWRRf7xWsmqwo1I8yEOPQeiiCrLZvoC8l10kLCJt44s9k?=
 =?us-ascii?Q?w9Hq29aVVkV/gnMPKedOQLg29tfyTx3GrDZMPXNvmAamgDb8I47UgueUEg42?=
 =?us-ascii?Q?lfiw915Lc3Xpz3e/PlDaQmsjliIJalCanTWhKp8rBi4rOLjW/z50wgig2yrV?=
 =?us-ascii?Q?nuFHTycWOysNcoMMquw3mR99kTJ1h2kU3Ysg/3//fLZBXwy0larJ91hNLtGT?=
 =?us-ascii?Q?APwBGdZMCPGCqOnngXkUJSwOxArHDeb39i/mo4uVMUciWtEeD8Uh9tIP0VKV?=
 =?us-ascii?Q?nPoMdOHovN12bZgXR4r5EdIZiZ2frVvqkwVQfU2ao9KnE2qc0WvPm4d41mTf?=
 =?us-ascii?Q?FLVphB7XGnrEilPfMIu0KTjGM34/zGHICt/9bgohYLLI0Q94uUMwtLjPSEpX?=
 =?us-ascii?Q?ih3XD3lmFEmg0LtTPym6SisWBJT+ty5YI2RRdNHV/rQU6TwsflrrTy1sftJp?=
 =?us-ascii?Q?ghOk9IlFfxjDZ0K3dns6w6d5IJ475q6lBTleq441fBpknZ24B1mbTKvg0ha/?=
 =?us-ascii?Q?J9g0t2NONqUpoPTcMa8tj6Pjaz4YXPDX35cZqOe8VXKOZjMa59hlv5t+nYu0?=
 =?us-ascii?Q?/UVdqabv/XWp5oZVDAEaqwam/8up+Lj6zZzJsgHJzD9VTZxF7hN5zmhBTFPr?=
 =?us-ascii?Q?45WWsVX3FIgbLFW4eLgipoDH+1ollW2klQFK5+kmKfGN5sXxFCWE9EAzpcCH?=
 =?us-ascii?Q?BStRaUFB3W14TbZeEqVOTHdxkGluqxO70wTwsnmPaiiW1oiU+SuNtPjhyeqm?=
 =?us-ascii?Q?v4pFgEq6+K7nbFibNzJTbuA7CRD8JHwlE+QmRdccZYBGX+lwcByMwyupeCgk?=
 =?us-ascii?Q?qkkSvkAkb3ZiKG8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RYFPhcCCOoB9G0+zBcIiUZUNaOyvw+t0UohNq4PqRxCmW49rHPcM9iRBIKXP?=
 =?us-ascii?Q?BluODVLQ1dUOImqGzFmlZAqP80ifaw381VZwjUeQmcrMnwa8O8dn+1+BMzJd?=
 =?us-ascii?Q?FnlepYdvHq+avPi4HtNcwMldgAGcsN5l9l+Tl5dLS1R0/jzhrw3GVDolEsq1?=
 =?us-ascii?Q?Z3jj2gq5HvDzvKfrYqQ/XrAqBbYVAzA2p2lObcmCVsUpAxXcdGt3za1YzPs5?=
 =?us-ascii?Q?17V9s/OtHoIMHK3Pv+wPJ9A/2iUZSQdYa3l15gE4HWLj5QUN1b7EjjCgRRu/?=
 =?us-ascii?Q?GkmbAi1b2zLDKfLMBQPDCEwq41Q0OVnUrRTc6gF6HE/uBaQ42MW3VOidA34f?=
 =?us-ascii?Q?Ym7N6vkgQKusfJttIVl4F0Xq5MDgM6v8u1l0rd6iP+auhizUDJb3+iwMPkNO?=
 =?us-ascii?Q?r/6dRG7/4KEtDSFxZ62OAKJAd/bXnxYZLxVQXVFSS9FztppUPt64RjodMasD?=
 =?us-ascii?Q?kIQ9GTpfx27vDzeSrzM5C8a6m9ZnwqtDPzsyHl9EE/zCiyeZCRUBU9X0qjTD?=
 =?us-ascii?Q?IE6mv35iB0CYewtEDs2fbVmxqJmV1iWiyxt9cMooQpr26qh0ES08x5Gt95fD?=
 =?us-ascii?Q?yOWxCDNGbv0aieAaMwDEJ3I3gN1oxyxH331eDX7Wu+VBlpcD+0ha1NcbHiqS?=
 =?us-ascii?Q?n7PwyFbtkLEaeH/JEMrtvB1IQDL46MihxDTbtxXOjcAvJJzGBzUdwWpCx0LY?=
 =?us-ascii?Q?zcOE2JyvUnP/e51M/B9pJlQ+nqUr9PVrZVPOz520tK3bcPIeGHyIl7zF9+Wi?=
 =?us-ascii?Q?Y0OeA92RrS7GbzLmCC0MdW+ZgVBeG4Xk6yiIMkMj22Wy91qBB07xQc8Cg8TP?=
 =?us-ascii?Q?8jEqSRgrBPbB6RYvlg48/euBtgXLaamCIqbzMBOQSNxjk6L8i3OFt3c2xhkI?=
 =?us-ascii?Q?srOsFRKZjy6U9UDsf21aj0lEbBPBltk84YBWvTsShnoLdRUmUMxWCAob3HA0?=
 =?us-ascii?Q?ocImoL6ILs9D1Gk+In6TCcVlULgEC/l1wr5ckyeAZ23rQwmKtIsL2LbvqWcb?=
 =?us-ascii?Q?WSRKvmOfBlFsXt0O4ch2SKLPBX7ErXiF9QadvwuLupudFRLsADE4kLbl7M9W?=
 =?us-ascii?Q?6e2cWCINU9SmR9gw6MZ67FvbK+m0EEmp/UwbaohRBKgJJvJQPXpBmsz2gKyU?=
 =?us-ascii?Q?EwJ3ZbpsSzD1GK9fFO1sH4HuYT42sOldJ9Y7LNiwbCvDurQaGrltvyZKWezI?=
 =?us-ascii?Q?igVuCAaqSIRcQgfQOE51+4+hnCoVTaCPEz1CD1lhtmiqlY8pd7JB69CztIza?=
 =?us-ascii?Q?DaxAhv8aq6y1D0CUR9IzDpSz+WtGidTZs78id8PoaTolBuvddwHWLkAX1yXa?=
 =?us-ascii?Q?IXI0R+HaXAkNhivgjRIoQkIAwLP5WsOPP6YdNh+vrWBb12fa0vwZ2PxxQm7Q?=
 =?us-ascii?Q?jWly8xfiaj3Sa7TijUbDtaf4es/Vw+S6NKClTwF4ILB/Wqy+RAzw2hrLXBVS?=
 =?us-ascii?Q?jWGTXbBFY7mG82j2e/pzUHPasX0OBx6YYNKI21Iy8Fz/bdI+oOZ+WtNRw39x?=
 =?us-ascii?Q?MAL6ImgLn6cJw6nedQXJiogbsAFX/PU0QxyexGLRP9b1nDDzUUSBBRo+qpSE?=
 =?us-ascii?Q?BEypdMuKN2zifmpmZ4Cugs5KU6SYMxZ3IfubYNV3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320aab78-b6b7-4a69-004c-08ddc0332d4a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:26:59.4225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hC5AFWvXhEPgBFf2DEDAd0oM/Esn5B0m8Ac44G+t7ICX3w7dZs2a5z988z5BU3QqS2ggxJAyWT4XSNwxUSdpbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11484
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

On Wed, Jul 09, 2025 at 03:23:23PM +0300, Laurentiu Palcu wrote:
> Since i.MX94 series LDB controller is compatible, add support for it.

Add support for the LDB controller in the i.MX94 series. Compared to i.MX93,
the i.MX94 LDB uses different register addresses for ldb_ctrl and lvds_ctrl,
and supports a higher maximum clock frequency.

Introduce max_clk_khz in the driver data to handle the frequency difference.

Frank

>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 665053d0cb79d..4052e1ea9201f 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -57,6 +57,7 @@ enum fsl_ldb_devtype {
>  	IMX6SX_LDB,
>  	IMX8MP_LDB,
>  	IMX93_LDB,
> +	IMX94_LDB,
>  };
>
>  struct fsl_ldb_devdata {
> @@ -64,21 +65,31 @@ struct fsl_ldb_devdata {
>  	u32 lvds_ctrl;
>  	bool lvds_en_bit;
>  	bool single_ctrl_reg;
> +	u32 max_clk_khz;
>  };
>
>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>  	[IMX6SX_LDB] = {
>  		.ldb_ctrl = 0x18,
>  		.single_ctrl_reg = true,
> +		.max_clk_khz = 80000,
>  	},
>  	[IMX8MP_LDB] = {
>  		.ldb_ctrl = 0x5c,
>  		.lvds_ctrl = 0x128,
> +		.max_clk_khz = 80000,
>  	},
>  	[IMX93_LDB] = {
>  		.ldb_ctrl = 0x20,
>  		.lvds_ctrl = 0x24,
>  		.lvds_en_bit = true,
> +		.max_clk_khz = 80000,
> +	},
> +	[IMX94_LDB] = {
> +		.ldb_ctrl = 0x04,
> +		.lvds_ctrl = 0x08,
> +		.lvds_en_bit = true,
> +		.max_clk_khz = 165000,
>  	},
>  };
>
> @@ -270,8 +281,9 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>  		   const struct drm_display_mode *mode)
>  {
>  	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> +	u32 ch_max_clk_khz = fsl_ldb->devdata->max_clk_khz;
>
> -	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
> +	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 * ch_max_clk_khz : ch_max_clk_khz))
>  		return MODE_CLOCK_HIGH;
>
>  	return MODE_OK;
> @@ -377,6 +389,8 @@ static const struct of_device_id fsl_ldb_match[] = {
>  	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
>  	{ .compatible = "fsl,imx93-ldb",
>  	  .data = &fsl_ldb_devdata[IMX93_LDB], },
> +	{ .compatible = "fsl,imx94-ldb",
> +	  .data = &fsl_ldb_devdata[IMX94_LDB], },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, fsl_ldb_match);
> --
> 2.46.1
>
