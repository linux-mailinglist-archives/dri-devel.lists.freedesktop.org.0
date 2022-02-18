Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3584BB666
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6614F10F05A;
	Fri, 18 Feb 2022 10:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2050.outbound.protection.outlook.com [40.107.21.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0278710F05A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 10:08:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWQJHNfRxQHhNFTvvp+GHAzQhyJVLWJyfvB5SSPMPuhHXsYZ6x26VTsv2uiSgulDKp+aLqkG+ee60QfGDvjzrbCcVE1eqjqN5czpCtTf6Bw2cKVq0JgaO/lgpoM9HqjUaAW7iVvQUE3wFDDU3fw9EQ4mgCU9rrdIjdWtEldXyayRi0shDWCOakQ1TMXmY/gtZ2kRa0lfRMOumfPyPLyALwp080GV0IAGtISgtSqysQ5TjLaEpQcRN96ndSUorXb75lxlEzn3ysIDkB497+T+wfUhVqE79hpJ84Q/i/i5vWIIJOUc/sWUskAoHxg/sN7dpgbkbRVHgCMki5lxvbuTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlj4rvcbwCYD/HgmGI16gOAuge6AdgUklR2LZ83DymA=;
 b=Iv1v+MkGnOXPZd0F01swyqKMBCtaKhltJrN11u1CTJOKrTaTRDHocqwO33ji9ONfoVDa4yoidAMIsCO42EXqBXMoZBDHnkj/or77+JIPEjWIWyVz2o98jo/cHFHXUpfLxq3ivRovBQoxqajpOZB/ACGtYKam/H7/YsHZPD4UmGskfYKKWzyObTtNnhkymNFYeDwpULRiqaCe/DNzt8Cj/6d4uxZfm93VWrNKEbpWRx8pbXj8ka1Byul5/dkLGczW10acLO6inGicj7tso6eHrdFYzuS977mDaw8nvAgoCt79L72amwCNckKjxXIEep1wdotTi8wTVBh3+U3TMwLw+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlj4rvcbwCYD/HgmGI16gOAuge6AdgUklR2LZ83DymA=;
 b=LRxZd9vqx9PxjimsqK3CzkWgZkCMk3URoDwYL87SKSf/9HmEnL33IPOW/krNjk/412uiE58lPIxvIrw1URlPxtT1ocgTIeosTLIkFe2KBDqLRJRClaH0PtVLNmOwYNNbUqmnDGH21CDt+3bg0KdmcOvQ/gWSwYo1OuHqI63yQDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by DB3PR0402MB3801.eurprd04.prod.outlook.com
 (2603:10a6:8:3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Fri, 18 Feb
 2022 10:08:26 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::7075:9a92:d8b1:61cf]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::7075:9a92:d8b1:61cf%3]) with mapi id 15.20.4995.017; Fri, 18 Feb 2022
 10:08:26 +0000
Date: Fri, 18 Feb 2022 12:08:21 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Rudi Heitbaum <rudi@heitbaum.com>
Subject: Re: [PATCH] drm/imx/dcss: i.MX8MQ DCSS select DRM_GEM_CMA_HELPER
Message-ID: <20220218100821.xnndumkrhdbg2xlh@fsr-ub1664-121.ea.freescale.net>
References: <20220216212228.1217831-1-rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216212228.1217831-1-rudi@heitbaum.com>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM0PR02CA0088.eurprd02.prod.outlook.com
 (2603:10a6:208:154::29) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8818c59d-da70-4098-7ab5-08d9f2c69a8c
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3801:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3801C9F19E02A478ABF010E2BE379@DB3PR0402MB3801.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iOi5ZdfGlmwcXo5w06YWAkLgzBYvU7nEJwLvT+2js8pSY+taae1taZexe3QMhazXfOj54ZaXhpK4JPZhOSq3PbToB/0chRoHdmPT+HsesYOcfX8psP2Rdks49w7Iuuqqhvns3X8nttXV5Ht86m8rKLJFDqm+UwWnnLQiK8gg+Kh8f3QPvzgoZWR0i44b7H4j4ZC1NaemeFfBIXdutzIc4hMT2qzY83ev5n60XoWhku60tzoiCP6F5kV07RNcr24BtL9EGfDgdBStQVUQ0C4n4qzIqBzjLekUqOWz8cLotVOUJLKYwslOcMJYDM55qJQ+3xp0RzHrYAEFTlGiHYnZSKlP9SRCaAQULa0A9JtLkJJVJ1s/CzkOmqbprdNWgHb4RL7TuUgdNComgJ5Tv46N7FHHAjWAexIKMvek57nOffJA3R8wRbmh/s5gZtuYXksjxyc0JVSc4ifH0ojrc1fgUdKyDKjYrfmZ3PKTV4m8voHgYto8SnkyahOoQi6mLj1htUhN7NjkwyE5FZegOBoxi9zTtP8jC/y7EKsDPxrEhht4c31TIlrPX7/oXYOrfJUFEIEx7MpW5TKssxOdi7zkmDomZPDXc+tk1i1Wkj+Muq+l+r7vYLyxP2sJBsJTfAY6SzeQ8p6na0ldESP2iRcgNLyz+osqi0UJCJLV6jvTCjraeCGvjNXqFMKdvf88RzME015zKuWZWMJMW5+URR6Kxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(7416002)(6486002)(66556008)(6506007)(9686003)(52116002)(8936002)(86362001)(6666004)(8676002)(6512007)(66476007)(6916009)(508600001)(66946007)(5660300002)(4326008)(26005)(54906003)(38350700002)(186003)(44832011)(38100700002)(4744005)(1076003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NrWkWwLZrFCR/atbYVkYyLItKkAp/wnWHtRdPG8PoXbqW1itUUWqxDI5vzy+?=
 =?us-ascii?Q?7nKp33nFIBY8eIqpYq+DKc0E/K8gr/M9w+UWTrtBSCXqDhTIwM10dVWxGm/o?=
 =?us-ascii?Q?F/kM3VmlJOwyoV7OBd9ZwFc6gM9hdGzt+A7B0qW9M4yrh5m8TTMm/rllhWI6?=
 =?us-ascii?Q?8VsansiVuZD09NbqbFbFcT5W+RQZ7YsaqHcEtKYGrzJh4wyUzWG5S0q/0om2?=
 =?us-ascii?Q?htNztzQdh7t3moQ6O0d4OxG2c1A0Fqqeapxh87k/nI8FvCD+tPrY2p1GZIKy?=
 =?us-ascii?Q?DbZ9tzOtdK/RE0xgm8NRJrlsKyQ6g4kg02MgsdoA3l1AmqiZkY4krY//VeYY?=
 =?us-ascii?Q?Joch/GkmvCJZTW/E99V79W7SFEGiiQRuXQERbsAObidIlPwRv1Ft6Sr08KRu?=
 =?us-ascii?Q?+6XwNx7uOOFvb89TaSxAAlYRUWnXD9M7Y88amN196tug+pxr1uVHuwG01mgw?=
 =?us-ascii?Q?HTb0Y3pO27IIek4eDtrQG+BrQRpBe40CpzBjshUwRjXrNqs2s+yoaYqDXXWB?=
 =?us-ascii?Q?EulR2aBSoM2cXd9OGd6NxosXlGRX4s3/AQyqHvsnXWJZ2kkXpuuFECQ40NNg?=
 =?us-ascii?Q?rFrFBjdgEuGADd+LXuaHznWNBdYv/7rbuUgm/59T1DwoFKyaAUjG7mxwL7ty?=
 =?us-ascii?Q?/3OApBedEvmKgHR3vByDM93kR2mFL2pGvSbIc1bp7EjfMtPrpYGCttJ9JL3i?=
 =?us-ascii?Q?5braONEuQYtrkc6zhqSLJA7RiRdVrQzrBIyjjo527ybWBRxEMQBUsNX8/paA?=
 =?us-ascii?Q?ZdGCsg/C/RRynXcRDLEud+vatRge4Ml+gLUO+J5jax+hF45SMfB107P9DuC0?=
 =?us-ascii?Q?WamVF5pTe0l53+XHfpvDR4drnGyxmb0JUFSBKTiO0zLQkm3aKxtccGDb3lOj?=
 =?us-ascii?Q?82PCcCe8FdSbC1OAAxiPQKpIPKOGpvVY1PoPaCNEbMGRehdMek94Hk86XRz7?=
 =?us-ascii?Q?SSXbVHr5n2yGAEc4ZyI9c5N1iGB2KM5ewV+JV5r5iSkgAkxWK8Hy3V/MFpFG?=
 =?us-ascii?Q?MGWENA3YB1IAtnUhOZgN04/YzntQn8gkjmDTwlgFT5slEkgUDLtsjJbdeaL1?=
 =?us-ascii?Q?KQvj2O8J5XMKW9uSYMBcM1PfvFWkCGxW0OEz5RLFRbOkDpO74uwuFBewp1nw?=
 =?us-ascii?Q?tqEqOL4SaGyhfVbGPFAbl/CnYmnavBEdWkqjlGiSR4OuXBYGF2IrjQa15VuC?=
 =?us-ascii?Q?n4v+9695yxrDXxy3PMFdur0BfU5F4Mw8ACdzn9KMnNPVHFDtM63MqZQkVYMm?=
 =?us-ascii?Q?mgRipicQvdTarQfdip6tds6B42tNY9dW+RVf3ucDbYim2/cphMcGp426YNg4?=
 =?us-ascii?Q?f1Q+ia13qiLcMr7KJCkTULVy0ApWVkBmI6qIe3E7NnUGabTdDeIa4g3FL9PD?=
 =?us-ascii?Q?rsDeglD1ixrf9JWqcObCNWgWvj9zVu2Oxqe7aZ/hQ29djTUYX+s9VU136cIJ?=
 =?us-ascii?Q?kqaiFGqO/ihCG6jV29xJ9aUiP7vqFxYqjpaK7+3tN1OGBPCdzkdKKMleP9vU?=
 =?us-ascii?Q?iuCWPTUZ191SBZImaKWkEBs5++4ERh7nGhcqCziXyBvx+sQDvVVUg2auf0M8?=
 =?us-ascii?Q?l7KMleI4ZnRUfTakMVEYIg+0+wGhIjILMZKbiW/cf4dgHKhmOSlGwh2w7UCq?=
 =?us-ascii?Q?sWpZl6dEpyuiDBBRMeuE8QU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8818c59d-da70-4098-7ab5-08d9f2c69a8c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 10:08:26.2167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tq5UB6yMFkt7wQ20FQZ/efSOZMEizu4brQLJUWPtucGjLBG185415bIvhWN9fSXHYtamf7fGbTeVzVIgMxCXPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3801
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rudi,

On Wed, Feb 16, 2022 at 09:22:28PM +0000, Rudi Heitbaum wrote:
> Without DRM_GEM_CMA_HELPER i.MX8MQ DCSS won't build. This needs to be
> there.
> 
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

...and pushed to drm-misc-fixes.

Thanks,
laurentiu

> ---
>  drivers/gpu/drm/imx/dcss/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
> index 7374f1952762..5c2b2277afbf 100644
> --- a/drivers/gpu/drm/imx/dcss/Kconfig
> +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> @@ -2,6 +2,7 @@ config DRM_IMX_DCSS
>  	tristate "i.MX8MQ DCSS"
>  	select IMX_IRQSTEER
>  	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
>  	select VIDEOMODE_HELPERS
>  	depends on DRM && ARCH_MXC && ARM64
>  	help
> -- 
> 2.25.1
> 
