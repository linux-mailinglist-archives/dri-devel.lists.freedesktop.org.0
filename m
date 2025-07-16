Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9BCB07CF3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 20:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2047210E2C9;
	Wed, 16 Jul 2025 18:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="a+Tg0Rji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010063.outbound.protection.outlook.com [52.101.69.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8236410E2C9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 18:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+QlwNnplwEr7UIrCqSYyA3q11hsSEg28n3gSkHDkDFxgOhyEYxbSQUK3JIjzto8oJmcWcqhEZ0w/fNV45G9R7U8oT2gD9iFPIhE7NzLsFlsBSFqQN7/Mc3mTiu8uCllgBKwUZI0j/HwPxzhx5LbgJcbNEkFihqv4WZ2jAFLIZHAFmFYZnfql111vT9eryYmp1mMJrp21fCZSNPpDpRyq5NbZnB8gs6SFmoWYVOO3bro5GZ42gTAE5spSzxCcz8g4VCdxHVQkRU4fT89yP0JwmPj1NlOaoPhSGNFpsjwcSDX4pFbFqHrQpLqq3mThw8aEstlGwE6Le6bt3NA0I7xDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTdCWmTVFmzmVPL9xMShdo60wka31ix1KDWJ5URx3bQ=;
 b=au4nlyPC8+JpQchKTG12CU0zBSkHKQ0d+5AC7PrT5jON65e9PJT6JcVn2qqh+xweNvscENhuFTVxhs9t/6/DIBLLjVch4WkxO3GN55bzHFTqYuGtyoOfQXeQo9AjuoXqjbkHqbqBotW8UpiVDaB+V+RoYstNZbEx2PItv9RZDILu/2YBLXnyXJqpg56iyv4pl+ReLYF/QyoLoryil2aZWKX5lfE+Zwbu1oIR97OCo4JyaXkcPLLYRHatS23Ybb/NNoiC1ZLdB9U6UyHizJ4O9uX9EEQOuiMGxaVl0IEmRM8LJPOfQNNYU2LQ5o+ZzLEFIeLVNP768+aVPxqxwZWSMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTdCWmTVFmzmVPL9xMShdo60wka31ix1KDWJ5URx3bQ=;
 b=a+Tg0RjiwmN80tFa3yGHX0JjHI2L8Kf0n1Dt3sg0Vx8tFXM64w3yCYIiU+6yXBI4FmDhdDIWGYAIYNUVRnikA5SXeZ1x9issu5bC6RMnc0mb4VVQriuEqG9CbmQeVVdRgIw30QZg2x77A6dGb24wmP7M5IiINzxaY3NXxDpZG9GuielfpfVF1lqifSdT7DeiRG5LKCfl5YAwPr9VE9uoyWlbKK0wL2fu8TnYRxP9eVN0YGHl2dScwraP+ofwmZ+Sj8vAHP0f/IPWA6u0uFZqUUY+kk38UuQ8WB7Ip8nzsnXE/Yhbh86SuXQSpNaZH5vyL8IhQ3TwRtH1ymPblVOsaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 18:30:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 18:30:42 +0000
Date: Wed, 16 Jul 2025 14:30:37 -0400
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
 dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] drm/bridge: fsl-ldb: Get the next non-panel
 bridge
Message-ID: <aHfvzYUzGNuh8hwK@lizhi-Precision-Tower-5810>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-5-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-5-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AS4P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a53fca-efc4-42d4-8545-08ddc496def8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wOY7AvMtsXefFPSBQjmlAV2EJatyL993/VvNMvIecxcm4Z/FVfY8deJ95YWA?=
 =?us-ascii?Q?wxHKTSA7aC7YcswNGPZfoWhOS9g/HWviZsISUXjLEpDwOCdsS5lnafwJu1fs?=
 =?us-ascii?Q?k5nzl1rTCUjWJTPNesGmW3kPu2fdK7DRW8/KyRoT1bMp52fdz1gdz8zmUQq3?=
 =?us-ascii?Q?oEuAXG6SSwbUIOrxOjpuBVV4etH09m++XxKBHxmARS1pZ1XGYqGeEKUI1snQ?=
 =?us-ascii?Q?A659/JAFdDJPBnBRuJ6JbSdNYuq6FsSaOpIAuKFcs6AlmW9PKdvJH0thtkE7?=
 =?us-ascii?Q?ZoSYJXJerMymtiTHo6D5jqa6h5oltdPXEEUHzILfouy8keWUTJ8AbjKY2WSa?=
 =?us-ascii?Q?YyrjgVWwlx494sND0PPPUQTIREoHrg5A5Vj6wkDz9PF0TwJ2VfTwq5tYEl0L?=
 =?us-ascii?Q?xeCL9LQWNTpzRgaLH2OkMCyrb7wsPEZg57GI27JmlWf/SY2r6lPBxcmbOeD0?=
 =?us-ascii?Q?hj2s1h2qFGZzh6KPDnPaM4FTWFvfb2WA2WPRyNMk6NKIA9DPGZtgLgF5Q2Oc?=
 =?us-ascii?Q?oAN/eSM2oWPUVW3o5EkDJ7526IWk+U1Fwry/Cj745ohhPhEDeGw59am3cxpa?=
 =?us-ascii?Q?qal3cL0IyUhSnJ22S7AaPhPb8ww13XliQCT34GhIKE7DdzL2vXQbIOjMk1uG?=
 =?us-ascii?Q?jSyyFlWExGuy0A7Y+6iBN4CXfOY3+9zrNsdse0PlCKJllyr4ZJ1Qk6tX2PfJ?=
 =?us-ascii?Q?HPupLsuTdk7QIYFNCDT7nRyhRZlc0hmeH/gpm+eNFT+fD8L4etA+JZDL+e9M?=
 =?us-ascii?Q?JrKRKINqmBLGAQu7IOwHzaGRQt6QGgDk/j48KpEUxrFk4YAjU2ENmbJD3RC4?=
 =?us-ascii?Q?j7Cuf8hm4tKp8n3gk88egpCEWdtlElbbqj5Ks9QwnEGaNVx9DE7x4G6N9lXV?=
 =?us-ascii?Q?4cSOaAKBEVvsBpy9j1bHfZZzgRs3uhWY+aEoAUKB6tXkJynlEpsIAhz32IVY?=
 =?us-ascii?Q?+wpvhj5VQO0pB99pNGG9f0J7RWSiQyHnK7RAfj9RHfcDIkABDo9QqcaV272s?=
 =?us-ascii?Q?BQ/s3eFSLBm4UNSPQTAhYMyaEldypOrH6uq3F0Wl+CWHbip9DEA7ElPt/zr9?=
 =?us-ascii?Q?MjnqUZ4NZxZH/Hojznr7MtBfT6n4H2G/qBtu02umBHDxRiEUxfCVGFQOvRIa?=
 =?us-ascii?Q?vbaUD5lRfKBOlQLAaYZ8acdV1lCgGZrFM8iE2t8L2FBes/Dab+uqBuJTjWI3?=
 =?us-ascii?Q?AhpWn3r2JSPiVbf8hVAUYtzsZhP0eo9MRYq1djFERFCYfBcOQtXLyRM19IMh?=
 =?us-ascii?Q?WLYcvnDxy4BvS52FzRMQ1dcpqbMljnlRiemfvXcmkfvW0nXd9pPK3I6y7vxK?=
 =?us-ascii?Q?oi06ulYj4cayW8Bq6tJqWyBub76HmWfOBM6Ok+adpUlpJXHEeh77yLVmoset?=
 =?us-ascii?Q?FsiHLv4BTUEW0rF9cJ50p5zqzNus1E8SZEc1kXmhx7yD/ex5Ugcp+qcdjuTQ?=
 =?us-ascii?Q?xkrKnV1ADvE+mT2E9l877+yXQFaAzpKv8+wSdv1DVokySC0mOAR5Mg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aSj2qlpUrtkdfSO7Qx14rUiNnGSp7rzQXEegrnAx6Q94Z8uvtYDlxZVpeeag?=
 =?us-ascii?Q?JzQp1kaX/eCg87k+PnuXaWH7LBhWTc7M/tUOG4bwl0E5iq+M2nzV8l0NfAnt?=
 =?us-ascii?Q?BPOk0TNYWA0162nCBHJoqS8UYQRb194vmwbBFiGhzlqKaKizf3MQwGULGRji?=
 =?us-ascii?Q?ZCgPmztxOIfVF1ESv4WpDhgQdUbZzWA8zAS6naRVFXS/YNvtlCZxN+cBOuuu?=
 =?us-ascii?Q?YY0sFKSPaV3P7yvt8onMNfONz3Ct624c/nGOQX1zXnm8SHumRBpQOr+l3q2Q?=
 =?us-ascii?Q?Rz20FZf0mE+RfBmJSjkNzzOodK2v73CDFfsmWr588a5fC67lgnpGm5YlIypb?=
 =?us-ascii?Q?VHK4O1DngCnJOsVMAkuGFQzpnuavJ1sEnc1NvttlTvlMMflBKggtfsVYS94y?=
 =?us-ascii?Q?kVEGlu7Id92WTtPsf/nClsDqajZEbm6EKAcZa43Kriu/AzRO/6B7YHPPdpnq?=
 =?us-ascii?Q?hUKzImGBmXhD227duP2+59uqVyxTvgW1J6UYSyAvrRFxb2uXqDEVsKV5bhw1?=
 =?us-ascii?Q?Uy/gIKhJTa6i9/+HVgxZEZrRwahVce5v96at4IARsvyO0G+NayVeZ/PZx6wG?=
 =?us-ascii?Q?XLRK5SpPHKjUQlo7f/5hlY8JGoKVZtSI48qMQdMGxeJiCZjHfB3v3QP/FvkX?=
 =?us-ascii?Q?+aMUChloObGQydRZvdgjEaGE3h7s+YCxKZqc4pZDs/yQ171ALyhpnfnP8ClW?=
 =?us-ascii?Q?QbSwlr0npCKn0WiKuPD0tatIJ9ESsJmDGMrMbrUAl4/NWfm4YAX6XhBXvQi1?=
 =?us-ascii?Q?Fh+CFuC/4EwjD44W/aPGMXmJ144EEbeXX/M0xIQKTpdZ/NJ7wn7EIC7ukwIY?=
 =?us-ascii?Q?SAYKCmcTtjya8x3aWz8o3Srbe929Xw8bEx5u65ucOZOMCH4w7jJWK19cPdgf?=
 =?us-ascii?Q?VXmU8JsVpYnlDwSPZ9EySH+TAn68oXhVFZdSzOlzR8q4aU5APZoWpXTZXEuK?=
 =?us-ascii?Q?uvSv3R2s3beEl3Yj6Qc2Wrgk6dfgUrGL5/hzP9EzHAVryxstLJDcheVUys7G?=
 =?us-ascii?Q?ezmqn78SMdm/aHiE9bimgKmeAGwUX1IILEcFxSICJEoiSDWnV5nzq5mHvFBT?=
 =?us-ascii?Q?eCq9m2iZohP8bVq1fO54pV1Pmc8gA7Bz1BIJq+Um7NnRdF/cRrT9K1y0QP0L?=
 =?us-ascii?Q?mR8d4GjNriVqJ5zobBjHKjaZwMriqK8WmrIkzGDmD5HU8MYcf57ZNVZpw7+d?=
 =?us-ascii?Q?gc7PCIKqz2Rv4FTW29s9h3n/zVon5+/26RI8kfTqFktomk1rkZA/aSRkXST3?=
 =?us-ascii?Q?H4bV4iBRQPCkuoaGWCfzCMYdDGdz3SO8YM0at7auPDnPe7v2tVr/80vT8NnK?=
 =?us-ascii?Q?R28f5X1kLw/92EBMiIyzpzWiOzstFs+3MyTATSdEvzNhRqdvqMxo1hRDYdxI?=
 =?us-ascii?Q?oIla5JHwCfSXGZpVHsy9r2/ulpeiCpj0j0PwXptX40lgDdKtdULLZMLmILDn?=
 =?us-ascii?Q?wsW9yKGFfhMPZV2IE60L6qz6h5jpKz0wh6UzKicwg1RskhVogiiMRpvZS7f2?=
 =?us-ascii?Q?IQuEKdT4z9wpAcofVhaN+TnedbbpTRfDQfd+uGymzlgwNCdfX9IJvFNEi3wc?=
 =?us-ascii?Q?O6DL++p1sMw9qH/yDOjvTmxD2bPllPbIzmCGr2C7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a53fca-efc4-42d4-8545-08ddc496def8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:30:42.3232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/iqgnqcS80/EKb82P+UJ8ZYUGWFcROMG03sLJvZjhqU0zjPo9w2sYb9bYZbeMYDaVRD1gIWLRvfjbuNOSJqiQ==
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

On Wed, Jul 16, 2025 at 11:15:08AM +0300, Laurentiu Palcu wrote:
> From: Liu Ying <victor.liu@nxp.com>
>
> The next bridge in bridge chain could be a panel bridge or a non-panel
> bridge.  Use devm_drm_of_get_bridge() to replace the combination
> function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
> to get either a panel bridge or a non-panel bridge, instead of getting
> a panel bridge only.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 5c3cf37200bce..665053d0cb79d 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -15,7 +15,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_of.h>
> -#include <drm/drm_panel.h>
>
>  #define LDB_CTRL_CH0_ENABLE			BIT(0)
>  #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
> @@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>  struct fsl_ldb {
>  	struct device *dev;
>  	struct drm_bridge bridge;
> -	struct drm_bridge *panel_bridge;
> +	struct drm_bridge *next_bridge;
>  	struct clk *clk;
>  	struct regmap *regmap;
>  	const struct fsl_ldb_devdata *devdata;
> @@ -118,7 +117,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
>  {
>  	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>
> -	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
> +	return drm_bridge_attach(encoder, fsl_ldb->next_bridge,
>  				 bridge, flags);
>  }
>
> @@ -292,9 +291,7 @@ static const struct drm_bridge_funcs funcs = {
>  static int fsl_ldb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *panel_node;
>  	struct device_node *remote1, *remote2;
> -	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
>  	int dual_link;
>
> @@ -317,33 +314,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	if (IS_ERR(fsl_ldb->regmap))
>  		return PTR_ERR(fsl_ldb->regmap);
>
> -	/* Locate the remote ports and the panel node */
> +	/* Locate the remote ports. */
>  	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
>  	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
>  	fsl_ldb->ch0_enabled = (remote1 != NULL);
>  	fsl_ldb->ch1_enabled = (remote2 != NULL);
> -	panel_node = of_node_get(remote1 ? remote1 : remote2);
>  	of_node_put(remote1);
>  	of_node_put(remote2);
>
> -	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
> -		of_node_put(panel_node);
> -		return dev_err_probe(dev, -ENXIO, "No panel node found");
> -	}
> +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
> +		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
>
>  	dev_dbg(dev, "Using %s\n",
>  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
>  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
>
> -	panel = of_drm_find_panel(panel_node);
> -	of_node_put(panel_node);
> -	if (IS_ERR(panel))
> -		return PTR_ERR(panel);
> -
> -	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> -	if (IS_ERR(fsl_ldb->panel_bridge))
> -		return PTR_ERR(fsl_ldb->panel_bridge);
> -
> +	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
> +						      fsl_ldb->ch0_enabled ? 1 : 2,
> +						      0);
> +	if (IS_ERR(fsl_ldb->next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
> +				     "failed to get next bridge\n");
>
>  	if (fsl_ldb_is_dual(fsl_ldb)) {
>  		struct device_node *port1, *port2;
> --
> 2.34.1
>
