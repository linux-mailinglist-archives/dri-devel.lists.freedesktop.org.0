Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7EB07CF4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 20:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044CF10E2D2;
	Wed, 16 Jul 2025 18:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FfvuqBR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CDF10E2D2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 18:31:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iklGqS0K9YO10t50LZ2vtZC2tBWe+Bum0PkX46pGBGxBnf7vp8H2rgjzmyn7LgpxJe1YwXOxdnZbh3AHCIJqA1ygfUW0mpdKvJOJ42JRZ2ePsKs7NH1SPCb8nwY4fyfmhuqG5uc39/W/H72CqYq8tERBlFcoC1MDbUfloSlx5RwlFBD5gvgP+JydWQ1wGbfIiMcMFPEMh7XpR4ZRihXU4EeWB4j4R5CKYuzojXaKoGhnpraiKVskWxV3LQOSinFZFlrL2XYdkLXta1XJqOl19beeEdvil3BJC0bmhePqj7qaugUzJp2gyudim7fU5y0RutpKEBVWCuxBsjBDR8TLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQnK/RWZ2Eg8/xsxPeCjmwSMisL2ypD2j6vCNxHhGHk=;
 b=V4FdB25IWEpw92xXX7Muy4LL9Ei/XFS1aDFFozs5nZvuIkw50flkwNN8R5JAqjzI+oMVXmzleqGHa5EgKGCluZlI2/J7VX2IiMR8d8/lz9NAeItX6H69J0CUWVDfeDEkHmIreIiVmX6aJZIZtRtZPCItF4s+18Dx0R2vsaUlqiDlXybtH28eXmYFLq4uP2hfbN29kr3PYvI4ClR4kbYpbiiQMSI/oCV5XkOfZU8fOWP+m0XpssAhNNpkTiMyEz+vpO5RfDQCccW3ZvPhpEykGvE//yYlX2O9llYoUK/xs+tU+NeMEVYtdAtzj7kM4ruTbe5RjNYapKLxZfcTZqAN/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQnK/RWZ2Eg8/xsxPeCjmwSMisL2ypD2j6vCNxHhGHk=;
 b=FfvuqBR/yNMPtk5jMpsoDMJT/A7VITOuekBgRwN03hS7p+bgcDSDMcaQbbsWEufXy/VGEq3SyrYsxP+Tj68oCIY9gW116dHZcvL29T124UdTc1Nh5bKH5SbfCFMA+cven7kHqn4ySoSBsfktxt7qpoZIVfw5psffRVRVFqTFrO7N8D1eMz0k50F71Bv14kGSH/Sj1znavM3+HaQ++1PZC3XJ28HOhqK+hQ9Wx40HC3YZjEdNWmGezK73OfvlsVwHb7YWFjOg/pVdUZ44Emvn790+a2VsexBDQH0A5pxHjrM/m11ipXjr78+D5hi7IdsoLjyLxz72B5/XH/qFl2nI/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 18:31:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 18:31:44 +0000
Date: Wed, 16 Jul 2025 14:31:39 -0400
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
Subject: Re: [PATCH v2 05/10] drm/bridge: fsl-ldb: Add support for i.MX94
Message-ID: <aHfwC3UYiuQ/YYbj@lizhi-Precision-Tower-5810>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-6-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-6-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM9P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: 244584b4-1dd7-42b6-a455-08ddc49703d8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0LNgJNfFL5Hcu1TR8+tPzZY11GNg1rBcAFqFHWS0IoGb4LwRbCFaOMgQGYju?=
 =?us-ascii?Q?NZTeqsK+k6VDtHHcbHd3wEuNYRHAWKpNJ1VLKJfLRYXPu2bVR+GnBODJ3sKB?=
 =?us-ascii?Q?c2vJgGMjks8O0dP5amG/227PsXlTHY8+iQv573yca3FYS7/oSFkuQAurjcZP?=
 =?us-ascii?Q?yESaK8xU/MD8jjLDdIUWY5/Kju0jAUhfRgNIu0nQgOUrAil+/H1Axwf8nCta?=
 =?us-ascii?Q?i3ul+1zAUCL34jUSIscya+Hw0/jpac1/lYvgMbI2UceUcmNJ9pmtPnqvwMOn?=
 =?us-ascii?Q?eIsyd3ynQNHpHp6HzlI5SKmfFeTeBgOYAuP6OkqbVaeZv1ngRNgkqPr1z/la?=
 =?us-ascii?Q?/V3+oSdEyOBTOOEWzOyrMQ2ph2dno6vaSxm+DzVUGji4DRUqHZPIkyte4MtK?=
 =?us-ascii?Q?xkQ/9j/g2N4pfuFmEQGoHHQOE8DO+e/Z1iTmGIQftVjXNDBMQYm+mEU+R75W?=
 =?us-ascii?Q?YTIZL6jdeygQgjgbKPg+SoNy8qp7Ylv61akia3QgnIPeluwJGnd466Q+HMr8?=
 =?us-ascii?Q?FbcUL+hCCEZ2RaORzczSGTUU9mzjLSlYQ48YlDYmg0TRlxyksY7nL88ERFeW?=
 =?us-ascii?Q?+2X/f4BCHGaOC2af1tnsFbDp+hh+qBGLC4RV8xj6LKD7rJTeHCHuj2NW7caH?=
 =?us-ascii?Q?RpmONYaXmIgJPIt8Q/3LmQRtUHMPZowkpUIRGzBvqc9wRHK4QdYsiPj+u+vE?=
 =?us-ascii?Q?2VPiHLTX8ngoKLrHOD1VRsaSEoivjlQwxzGRIK+4nlTys8e71O21S/4zDFGS?=
 =?us-ascii?Q?lKKjiV0PDCLVOuOYRAyKmi00LkkyJo67wW94MwD59hEMAZNnlJraNc/JViWn?=
 =?us-ascii?Q?8KQ4snOvdPPEEMNpBmvkl5K1mQLjdNYMk4RGW07Nr0q0Cm4lMNMkl1+L98n2?=
 =?us-ascii?Q?Q2HJlX4j6mmBk6n9qq4JkLJjyMOwrIQiHeWX8c5myBWFPiSXQbFrgmpb0zc/?=
 =?us-ascii?Q?pjG7JrbWsJhlJtbyx7LXHn1u8d2cvuj8ViFQM5+m36gwrt69H207jU57G20J?=
 =?us-ascii?Q?h6qKjWjobKagRSiHpIi13F4M+HIsQ0xZkgSNBnu8TBATm4HfyV+F5RTueEn8?=
 =?us-ascii?Q?ZVYw2qFOm5bCzrI70OsYnWW5fEChQZ+EZ9f0g9qi20UfK4r8MdU+pOVU9Dc7?=
 =?us-ascii?Q?h1wz7T6q+y266rhUFY9m6/BmsLzpNWyPNEO7SQsj79ZwgrAPpsUZfRtN7EkJ?=
 =?us-ascii?Q?bCi277yeKjR/oLu6LYzNaHd/pJBMFwQNwbovkt0G+j90YJ51iJFyf1kkk/0j?=
 =?us-ascii?Q?qPKvShg5Y5SMZXmfcvJVgqoPkzNqRk24pwE7juuj+b/DAIVRs4cbZuclntvm?=
 =?us-ascii?Q?3LkjVGTZa8hTdHG1kIQmhab1fwflSzekvJQcf5j+B8db2P4rSGhzEhqWBoBx?=
 =?us-ascii?Q?w0xAX3gYubzSggRguZDrribrTjJW0Y1thzq/bJTJD/7dc2OLR8kvWKMaGV8u?=
 =?us-ascii?Q?1KkXKffuri6wji5n2CS2jfIy/FAibENCX6WneIyFvhMQoV5aOeVUog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XEcYRt8THD9wdNu3Qr+qNHPlVotFExmmw+esOwnzO29WXeoDLE8X0sUEtUgI?=
 =?us-ascii?Q?E1Sl5dw7lnaGcqyfPTZ0Duolhj31pr7UpSykh4K5vvJAdJcaUmnsF/w6se20?=
 =?us-ascii?Q?BeQTBw6OofPxTRvtvIYW0pAVuT/1cVFLYZU/5rE1Lm7FwAcv55Ri29WX/lN9?=
 =?us-ascii?Q?AXFnSCIiXFTc/Hw/4WQfYs8W7pMQwbz8I3GHd6rSAzPoK7gBMbzqE0xDS1mr?=
 =?us-ascii?Q?oEe+okQfKUvSVB7IkpRJLcCcUew5NkPSOX/MiejinCUyJLbMh4VvUujIqURd?=
 =?us-ascii?Q?+4OzUEpTbAD49mSdySNJi4l0DhtNUAZOf3b1JRPQgjGmj10C0NpJo/nOiMo8?=
 =?us-ascii?Q?RT1N7lpEr1Cdv1PMZ0Ws2ra336b6c2nJ3adSipJ1Ury43q6On2vWOH0frWrO?=
 =?us-ascii?Q?XDIjBJOZu7Aqs7Pamb87wKFuTjVbwuHSv6scvQiKRS0hrIP3IISFfhuSXjko?=
 =?us-ascii?Q?G/aBXbgsW2Qhp3FgG3Dra+GurAgGH9uK7lFaAgUByaW+F6WyxIKa4FyqEni+?=
 =?us-ascii?Q?SPSieISEByCpRCY8BJb14CJs0ZmTQ2+/ltURYjNdOdeCIuCZru1QOCdu2v0V?=
 =?us-ascii?Q?LiLsQbFTWXk80y8l6vPlG+Lo0LxCXzsPKm0iOiQAmYhE1tgKTbSXoHlJbHP8?=
 =?us-ascii?Q?BlZQK9lsnjLOAe6AAXMPNfMyJs+WfMvvOgVDFOmdACDthH1W2ueHmVaSfrFU?=
 =?us-ascii?Q?N2fWt+tcHeqUlQXt4Gq8VCNjuWCUgXvxPwv8RFSlQvpFs5LKvkJm5Qf7OzP5?=
 =?us-ascii?Q?d/d30BwycMWkqDK48p1ul+T4aRmyz/fQEXupIwqNH9onQikusclZyHtB0O1Y?=
 =?us-ascii?Q?gxwcLr9/QEALGHvveeK/TQAn4yLWzKMjbBs+iR8jNujzt7zB8Nu7x2odXwFn?=
 =?us-ascii?Q?ERWuSaak4d3s+GxI2+/ZE4ucdFk0CGrwJrgDcmHpP65Ic4xlq8YrXDu08bze?=
 =?us-ascii?Q?uPih7R2YJrPIdI8DpCf5jzIRX4kK0gUx6ogvAx6qeKZVn74x7CVeRCCGoJ38?=
 =?us-ascii?Q?lZOp/BO7Pglfvy+zEV2WaLKnklcLaT4KWcaZy+r2QoE/5OEoVytPZYvU3/25?=
 =?us-ascii?Q?myo5StUy1T0cv95R8OMDKuFtPZysJ8GhoUWrX8ucqb/4GhI2DU5RdG2uBw54?=
 =?us-ascii?Q?YvMfajGtSVFz5RVRmPuiNwyjjfk+/gcK9Jh+PrB1OqScJ5Nu9xWpaOtvhLgc?=
 =?us-ascii?Q?dCSg/CvAN3wQUtq5Dc7vKsCtfywIcwS+HQT/5T45m12soPyvXb/SokeBXTpB?=
 =?us-ascii?Q?RwWssHmEL+CJziaDc22rQcpDfpB9w2HpaPSGIgtwen8fh5rh1xDSQgrh9Pnn?=
 =?us-ascii?Q?Isc58n36InYDdyJonro6ccLs5FHWnIjnaFBumwO12VV70JBwvMxbbUbpyht/?=
 =?us-ascii?Q?EdiFipBbHoVkILIrYb6OI8mA/3hwOFqhBLmHInb+gxGUWA8/ZA5DDy46ACHg?=
 =?us-ascii?Q?xyXFAI89gCzogaMOy9dGHcJwduhv5vP4nwqmfaafYodblDZZjQAk1zGakeFV?=
 =?us-ascii?Q?S/Rx9y8gDmPMmePPEsvNbAMVsu7hlAQTkYn//FNQ6e/hqYuIfiQ1IXynXjut?=
 =?us-ascii?Q?81kKwY0eZlfPyQgFQkE+P/iJ2r2xRy+f2YVGzCdP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244584b4-1dd7-42b6-a455-08ddc49703d8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:31:44.1957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMt2xqtojaTlsUmNtQuHzP9CgrXpOpOZbu8FLdHWbmHs1EUX2/rkI0w31TpJv+TsbynyIPMIEnjLeSwutd/79w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919
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

On Wed, Jul 16, 2025 at 11:15:09AM +0300, Laurentiu Palcu wrote:
> i.MX94 series LDB controller shares the same LDB and LVDS control
> registers as i.MX8MP and i.MX93 but supports a higher maximum clock
> frequency.
>
> Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
> be able to set different max frequencies for other platforms.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

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
> 2.34.1
>
