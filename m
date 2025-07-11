Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E50B01216
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 06:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C11E10E257;
	Fri, 11 Jul 2025 04:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ct7vlc7s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868DE10E257
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:19:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olGkRl4kd8YuO8vEs+FyKkJ+6kAqzfh34W+12Lg/MQYftAjCBlmaEThP7EpqafjfhuwiMWgax9qfcWgtAvPt2sIhixT6jB1PTNTS9yErQGOo124cZ1i9LOW8AXfhWvmtW2WXHNKiYm5P2fY44dDnQucg5isdfCs2g+xUhs8W+ypZ39h0mJI6E0fz2RAcmVF8qtfQH8NjuRMf9Avv1VjrBeVKXPBBvx2MM8I6Alyxu0Mx2hdFbrLHm+sF8pBXrCNszUdKDciFW4l6AAaJxpkBi0uotyaFfS6Y0wYLB/lblWzlqK/EFKHdC0oROlTr5Wg2dWQdi5yyVVF3pI3rPNwscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJ/10NWOLHP4nMNoAoqQ+EZNAElmG84CI8iilA0Y7rc=;
 b=trL8nCG9kjsFqeqG+4Id+mgT98YbfEXEzWIbsZps8uS1dh4ODy7iUhlSg2m7UfEtcdOoXM0uPx11hIaQ+g3zVuUtrfvgeIxnLIhA0CV6h3Ns3AyoIdZ/9bRzu5eEU6jnpTkrzZIw4chchMtKlNEmYbNedfkowIbfXIn9z3NgFPgDZGQyDsdJ/HC+LVq+68LTRn8Kyv+qRQSLuxYv1LtZfohXXEJoKlK2VqL4/Mh/PPBdk9Dl2grgIWivtGq2tEBk2e4DWLKZeHpbQZ3Cld+e2dZIQ8+tWHoBoknxTTLH5XcZh9FW8C1by8UMfUQVnOkXH9VzR2uPwymFUbv385ZUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJ/10NWOLHP4nMNoAoqQ+EZNAElmG84CI8iilA0Y7rc=;
 b=Ct7vlc7s1eZBQNwyPD3GYni4balTP8p1W2xnMnmkzWokq7OCypQEVC0xEhumJqLfzmtjDdKZIETJjHgqjQ7tORM/O27SjsTvmMI0A3rMJwZEscrKdNgOAnZPo0f2uCVSciCWPe7yxufF/CwKhEJDUfGJyJ/vLWXlLok5Bq8SbMauZEql6RK6Ff8RzAsdGD9Fch9/VsU8UtfiQMKmLgf349bWsTaIpPUGoBHzTZV6rm/CPegIQHCRozM3C/IVsBVniWhjcdRxDuoMlrGPInJFc/rBr3jDJkFs88xXD9GniwJGUQYKvKoIY2bXxkZD4hJycPXJlDN3i02UwOCk9QvcBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB9119.eurprd04.prod.outlook.com (2603:10a6:150:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 04:19:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 04:19:27 +0000
Date: Fri, 11 Jul 2025 00:19:21 -0400
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
Subject: Re: [PATCH 3/8] drm/bridge: fsl-ldb: Get the next non-panel bridge
Message-ID: <aHCQyRiPIcOhd7/K@lizhi-Precision-Tower-5810>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-4-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709122332.2874632-4-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR03CA0009.eurprd03.prod.outlook.com
 (2603:10a6:208:14::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB9119:EE_
X-MS-Office365-Filtering-Correlation-Id: 052e25cd-ecbe-4c43-a603-08ddc0321fef
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M4Rtacm0tNT22yL/kqIDRwx33p9x/jqwRyHfoU2IpjIwz80IfG+KkZg0DjYF?=
 =?us-ascii?Q?WjbJyorYPdlHrk1RXoh9adA0d6UkCE1jepbS7x7S2U+lHatUzkRVUZoyOS5n?=
 =?us-ascii?Q?LLDOHOseAIE5O05RcUHpIb6Ve1XautVWd5Jxnyscq+yNKf4PqzaPhJtTZUBx?=
 =?us-ascii?Q?HUo9sn97mcqWUHTfpkOHl9eJtBhUWtHNSQjtfVH78xRPrkg95bQrcoZ4NsTD?=
 =?us-ascii?Q?8tEbDoF/+a4mUBuyfsAKJ/hOIccorCMOoLSZh+J+QDmrf7VJJ+OEim65RGgV?=
 =?us-ascii?Q?Pv2625wkgcDR4tWYuJx9ap3hQkFJluqlBDXP28sb46DTevwHjqk2Ag6ggVKF?=
 =?us-ascii?Q?Ueeb79tuuwrrPrcO61IQJhjQc0v9FzEP7oqNmot2uvHxyJZd8/xiBnMu88Zg?=
 =?us-ascii?Q?x1jwdZRFD4cYl29OiGzhOdS/jB60yx3KmT0aWIOtxsIRDlXIJ95nrthUPt/n?=
 =?us-ascii?Q?hbWaisspW4B5mqMCvxf2JXY68LWHfp7ZE3fZlpqGLhztQAZhlZUQLHsGX3LI?=
 =?us-ascii?Q?ZoBJx3WNOEh7x9E8vdnLgxIqdqc4Y6ocFiSumU0jWiliDXw4L/307237GrVN?=
 =?us-ascii?Q?BJ8bTX5QB9ZWM82cARTygUUs/zFHLZsYWnJfaz01e2+JXbRjJyImFGcxC1OJ?=
 =?us-ascii?Q?9j8Gf0HSftGoOTOPtlMUaTzriqSoZHOgnZV3KLLuuvkq/y55eke7AD2PDb4S?=
 =?us-ascii?Q?gbNnhiCyOCtgtvTu5m1Aaj8Cg7xX6ZSAx8CK7TbzVq9zTaZSV4a8T3saOLWa?=
 =?us-ascii?Q?g6HDHaORcVy50NPUtLEv9/JwXPncI6ruTb2JPNE117f5lRS6FY2OuuhzFCfB?=
 =?us-ascii?Q?mMReeeUoGPfab4Ma7vmX8Z+Yrg6DgQI4bN2v+0seowF1jTB8uETgKlhR32lP?=
 =?us-ascii?Q?loHNDdwXq0LkcDlniglNXXcNY3Kc2q1MzStjMtHkaG5Q/SjfdaaSU1tEmDji?=
 =?us-ascii?Q?OLl7/OdUc369u+C3ouEccCcYGQVPbjCa8/mSYemCZ5f1GexU4gbZg0q1cv8J?=
 =?us-ascii?Q?I1sSG3QSVhF4hE7WhMX/smsfYo6tyKHH0Ke/tIZnfzJwPJhjC+T6eO4HBfeT?=
 =?us-ascii?Q?HP/qwh1YnS3Mvj5nr/U0ufq147PQ6Od2ovWZIq/JG8IM1+iYiy2RMOBO7rZU?=
 =?us-ascii?Q?pFGfxqKZcd15auDNU4PW++au4zR9QjP2eK99U6ZMMRZzmyVnZ8xtwwUZGEiK?=
 =?us-ascii?Q?oTHnV0GaIO2qylAnwc7JKVv9vmkDUX2C60jnb2v+eL2xYbWsDnMieAbZltlQ?=
 =?us-ascii?Q?wyr/bqVTT0TvGZOUTH2ceZY3umwt6XkJ887gyjaWrGquKhQ33GEjRB70Pmr6?=
 =?us-ascii?Q?V4EHQtBMO4vcDW0LURrUi6/4MkQgWq8ELVgu7dj1hfwz+W79F5SK4NEnmEZb?=
 =?us-ascii?Q?e3hl9AZhr/H6kDECROuSO5qmxm+oXoBAoIGS7z2+BTBScZ83tNS81LMg222d?=
 =?us-ascii?Q?/blRrXFwdkFIcYhyavsWvnLgW+xuVUkCcJXU6iz5P1e1sfUQFhvBDw357Umf?=
 =?us-ascii?Q?8ZRohWwGFdT5dnE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ckl+8BjBMZlC6yLUOD6vz70FQxwsMmkRZpxhOg36JZykyC+T88NgBQINqXn5?=
 =?us-ascii?Q?gRvb1XMrED/WwaKATM43cTpSehl3XIqgUGdgCFy9glQwYSsQ4NrI8gTkChXh?=
 =?us-ascii?Q?2uZmNUcN0Jw09POSY6VGDVPDrg5nrfRZhouWMzMeMc6FBAohyg+hpA++YQLE?=
 =?us-ascii?Q?2KhxUYee2i7PAqa5W3LUdgHfDLxRVZr7T4yYRChdEzjUGFZ9CvNUclhfLzhw?=
 =?us-ascii?Q?OuLzbYjcvE+fxaaCNn6Q6l5DQa44PuZt9pdFWPnEsDOVjhnwG/Z1i76Tdgst?=
 =?us-ascii?Q?MSxCe9M1U/hMYUC/GgyRvX0AVJnq90MdgYAvnYcmy6/x1RHlO11R35pCuohl?=
 =?us-ascii?Q?sr/oofjUugwMlxHQrOuqdORFaEjaBGUIcmRNBlhxD6ilppBNsH2OYHG+ts8U?=
 =?us-ascii?Q?O6meZ5mJOW9CwSmAjs7k0gnDerSWMbf0QFWwke4LTgNlMv+D6tYVrCcbxeXh?=
 =?us-ascii?Q?dWqi/u+p7xEv4VvmKZgsPwmkOlRziecu5jtn2f2Nt/aeFaLFIaVtaAwfugMQ?=
 =?us-ascii?Q?RdQ6ggrK+mn/kcs6xd+Jc5La6VwzMlnZxX+ip/EaVnvRCnN5UUo2DNyIJpp6?=
 =?us-ascii?Q?qKgnwHauZJ1l3N3yTuUqsTEqXLjQXI7kDMtiKMxj9rldZCYxGwYpEj8MMRBD?=
 =?us-ascii?Q?ZQoEgWks9Gnp7+Tp+Qv3XgS5wXCqOtcKWP29WK44AWor7aB9I5wIeeIvHlDn?=
 =?us-ascii?Q?naKqbfEfjUPmcx1+Tk9qsgjsHGGUAzWtzPH/XKxLJr0zhGRSiMQ6kwjO3Rmv?=
 =?us-ascii?Q?nUGjIt/OGrETr4F3c65Qhej3neIPwPhn/B97Z0xKC2SvSPa3efEaKJvkYuK7?=
 =?us-ascii?Q?bd8kUoAzx4xSD+NWzwx2/jRZSuX/3JjL/iD7BYCgWd75rabTSijnAKdnipxt?=
 =?us-ascii?Q?/oXMKzoxvP0E0BlWmc0vT77TrtYPl2qW8fxtDMYoJKEJfI8OHwnhvQ19pJFO?=
 =?us-ascii?Q?etBf4E3FoLTItP82LlxLO3r0+waELcmhz7fbi9918ZImu2atmwXDyQmFSCnY?=
 =?us-ascii?Q?puYmSSKP4VwyeNp4H3MacINXLQIpdq0XnEUEmxHot7A3e8leJ8EmcpSNCXpl?=
 =?us-ascii?Q?0DTfTTdNtJjjZ5mPT3ZVjkZ37SnVnu5f6EbR8jI/WU9GAbJ3tEUXCpVdC4Wr?=
 =?us-ascii?Q?zF8xBqkQx9Ix4wz3m84oDXyyTJ9wvujI0NmxK4He2FQSgkIQ24Th10z1tmK3?=
 =?us-ascii?Q?e2boKWJ973SksGT4WA92m3sVUInhjrP7fFK6ym146T26Bw43HSUNAhateyTw?=
 =?us-ascii?Q?UZ7rFdG9y04j+/qrb0fw3gfmMIkPV+NGHeXZdTOtmWLG++c3HvXQlbo4zUAf?=
 =?us-ascii?Q?s1fe0XBXz/HEmzn0+14fUjkzO971haM5PJIH37CFhNKh1Nc3wA8KtzbApBXq?=
 =?us-ascii?Q?TXYzqsjCh5opogjZyUtm0mGgUfhLxwGtjY8zHo72YCsDR/U5/p7Lw8FEMSbv?=
 =?us-ascii?Q?MZukV23wnhJKb8Fn40QUNuZ9r4d+jDF0JKfLKbHhR+miPOgRarMhnRZGBa2M?=
 =?us-ascii?Q?qyToVM8RNjSfT9fTts83QBLdLm87zMC/FBKSg5YlCtKZW0IH4+raRRlh4+eD?=
 =?us-ascii?Q?kZiqaiQOyy+A5JARVBcd+gCDMOPOrp+ADqEyj6w8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 052e25cd-ecbe-4c43-a603-08ddc0321fef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:19:27.5083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WTRoMBZi20D61klmt8+DjutOMibIfOt2RP5+kknK92+ZugCIDfIph1mHBb4ACcTvQkA2wSk9jyAmKOeI+/Vvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9119
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

On Wed, Jul 09, 2025 at 03:23:22PM +0300, Laurentiu Palcu wrote:
> From: Liu Ying <victor.liu@nxp.com>
>
> The next bridge in bridge chain could be a panel bridge or a non-panel
> bridge.  Use devm_drm_of_get_bridge() to replace the combination
         ^ extra space.

> function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
> to get either a panel bridge or a non-panel bridge, instead of getting
> a panel bridge only.

According to code change, devm_drm_of_get_bridge() replace
devm_drm_panel_bridge_add(of_drm_find_panel()).

what relationship with panel bridge or a non-panel bridge?

Frank

>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
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
> 2.46.1
>
