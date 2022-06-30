Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1CA561516
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 10:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09031113494;
	Thu, 30 Jun 2022 08:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A300F11349C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 08:30:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bygmRUWb6cYBtlOu8NMKGQRD40Hm8ZCK/lAnHnQm5MFXirbHnJ3UZKesr3zTs9HPIdbNL34Q7PeuoJ1X/g2PV51GalbyquYk1NU6HDvTZK28qtgHXWqR1DsL0Zbl/RMcDxqo3M4zCZtXUbZZ6EJaY1+D5uqsj2AoUfNBXXo346bZc0IOGhqDPeHgTnHZcvNJsZZQqL3vE/95EoOT8Yc6Dz7KZICj4qETeoGNywj/6jhLgaTWlS2fmDn+iNSU1SYzLKFkVasUDdzZGSorwM5Al3+M23EjjABNjmnXburVo7r6lu8lGZlDEw+Tn/6GoOz9RPvvdRbB3Km+OZ8ZVXcn4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6QwlKq4OZmL4+EXR9jnUc8iofJuop34yPITXcz+H3U=;
 b=QFJqyTka86+kvjYfcklbPYwDG2m5/F/oeob860mlNQZWFljXUJLtRU1fEZw+wK+lE5C2K/k5pVRHCffmO3xNxbXD32FJEdLgMdjpb6Wxi9HAaTjhs/YkwWTHXy0HWLxOCDFWjzAiIAiinecI6rDh54HxVwwvm7GCxV+OiLx13SAw2uxESJltktc28ZxkQSYYsPTmn6zqFAvn1uXXNsG+tYYWwnfafU9PsAFUdTfiweUc84sCsmxllLfYAck9J9nEWgJ/VPLdiEZNIcvbFUHHgNdDwpplWp75IkVEr3LKixfUtMl9jwa3GpABqR9IuBT5wz2fMDG7H7oqGD588ys4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6QwlKq4OZmL4+EXR9jnUc8iofJuop34yPITXcz+H3U=;
 b=ZmrQL7Ge+OZMccKltuV8fdtKY9eARnKtzmFcnZ68NJkUIcnz3kULR5f6Aw/zDvSqRxT973CXqIVeyn+62wJGUeaLqp63HoEt6qcroiQmAtpHXh+FNFm/R24gV93kk7obGllMjtSUhdBtL4q35/ahSMA3xbPfIpWeNy/lbinPdR0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB3198.eurprd04.prod.outlook.com (2603:10a6:802:9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 08:30:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%6]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:30:21 +0000
Message-ID: <2179a7f82a45e5af836ca5bdf28f10cdbeecaf55.camel@oss.nxp.com>
Subject: Re: [PATCH v6 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
From: Liu Ying <victor.liu@oss.nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 30 Jun 2022 16:30:12 +0800
In-Reply-To: <20220624180201.150417-2-marex@denx.de>
References: <20220624180201.150417-1-marex@denx.de>
 <20220624180201.150417-2-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a53fec33-25b7-4657-940d-08da5a72c50e
X-MS-TrafficTypeDiagnostic: VI1PR04MB3198:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dr5K6VJ5W8hB3wIuqHnweTvJvPIqq7dL+iBK0d7KggXcSBjJdBgJUewhn/rA9tEWgoe1XT/7V4KR1vSk5p4pMp7aUtjuuwMGKKiVudjix8hFoDYGbUgGebBd9Fb1jexiwrPS141OrLye23uNSg8hTay2/s6I+q9HUva9t3UCW+OSIZ5pvITXCIF9bFhRskAuWzVYMUSFU/+rb3cudWWDiwLvfd3n42bAmHcKn3zjsa68Tz9WxhTXgLzIwPUWM4m6NgFqNAS46rzYA2sBNsMVQvk7Vi6WQ7UKGw0iwcG1/N6D5/3AKh69J5/4VMOfOHHBKXOy/9r3bsEHlx9mknZ5h2rNYJQqrPz6eUcJDa2turWcv4vOUienszNxAKZeA076gzTJyOoUX28RQsFd9oZHgIE3yBCdoJK11an6+Wrlo8LZAaEH8wFV6m3XYlQ3MN5M58MRLMc3j4qB3NVk3ERhYWtSkfajsoJQKM+2z/Gzk3iCZDq7rWQxglKu3/2pumDYPO24pL6JVQfUqJfIP5599aoRplruC8yGp50M4HFPQIRsK1GrvfsMWEZNdQmSpDqgNjvCqrohJfjJbLv4HwP5/4A3IzCOe3cUmJZLScuslkAVx1kPeKweKcMHPQkRGJ4dVycX+yViN0KCMpHcZKjv48Vk7UHxgLTvbffD9iFcXC/BLvklB/vYR7tcIoA8uxr+atkLEgBFh/8sMAzf4g6633GDJF5HiJRDy68raVoiJkIr65jNTcmJWwUQ6T6Ck5Uuf5C86kM5gbJ5C2O8ps3Kp9N/bpos5upaQCifzdrSGeE+JFzlXVxw+E+tlIzgk8FH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(30864003)(26005)(6666004)(6512007)(8936002)(86362001)(38100700002)(52116002)(6506007)(38350700002)(5660300002)(66556008)(316002)(41300700001)(66946007)(66476007)(83380400001)(2616005)(186003)(6486002)(54906003)(2906002)(478600001)(8676002)(4326008)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVhSU1ZBRTlaTXRkZ2cvTlRKS0kvZ1c1Vld2cm84eXhmNEhHTkZyTVk5VUUy?=
 =?utf-8?B?emVXTHp0SkpRL29Xak9pajlPbEI3TnJ2MUplejBVWlIwN21aNGtmQXdLMisv?=
 =?utf-8?B?enRsNk9haStVYmNZUG1DdmJzaDFpdzhZeW40dE1EYTlBNVcrdlBMcHBpMm91?=
 =?utf-8?B?VTMwUW9QMDRmTHZsNEJ0UWhjMkpFOGVrYUlNd2FVd0lKUEVad3QwaG1NTGlj?=
 =?utf-8?B?QW5QUk95ZDM5TXBCUVUvV29zK1oreGJhVnA4cXZmVlp0K0h6YVRyMlU5N2pl?=
 =?utf-8?B?amp2cnVJaXJoQkJnRjE3QmsxcUx0azF0Qk9DVlRUZC9xMDdDQ1Jsd2ptcVV5?=
 =?utf-8?B?eDhnVzFFSTRlTUtyai95cTI2YzFSRXA1TGgvNUN6WElWNS82ejhESlJ6NGFD?=
 =?utf-8?B?SlluQXRwd2loc09zdzlwMHdyYkdTMEZ3bEdFWlUvRlNqSGhRVWRrMzQ1UDNL?=
 =?utf-8?B?MXlpdlp2blduRmQyS1dkNjdscHpYNjhRSi9lbXdWUUZTUFJtWXdNbzc2ZCtT?=
 =?utf-8?B?Nk0xeEVnQ0xLMlNLZi80OFk5eCtrYUpUdlY2b1o3MlRqUTZ0SURCVDhGMm9Z?=
 =?utf-8?B?R0trQXFNMEpaQldxWGorR0cwVFVoSDIwbEZaMFp4SzROY0drSEo3cE5PcXgy?=
 =?utf-8?B?SlBwN2N0a0pvT1EyNXh5NGF3S091R2JJV3JrVWZaSTZBMHkybnEydTFKQSt2?=
 =?utf-8?B?VzNlVlU4OXZkSXBpTVk0ejVkdGtWUUV1MkdtZGh6ZWVVa0w3UjFBTHhOSkE5?=
 =?utf-8?B?MUFZWlFYMTNCcXNTUGxvdUVhRDlYTkhOVU45cEROYk9PU0JjcW1Oa3Y2MlEv?=
 =?utf-8?B?am1pSkQwV3EwMElFeU5WMDM5TFFXU3I4VjBLK0lqZHpMbm1UL0JIZTg3VTMr?=
 =?utf-8?B?dFF5Y3VOamRVUUc2T3VBakR1US9rbFIxYlVlMnMwelc2UnJUV0hJM0ViMEgz?=
 =?utf-8?B?OUx3QUJZOTdnTnNWa1dOUmIyZ2pOK1VSSEFBYXJpWS83L3dEWndXTXZzMU9w?=
 =?utf-8?B?TWJ6c1B5dVdXblhpRUZpbjJNb0tTaWZ0MEpEdHJtNVI5cjZwVlNNMTVMejNK?=
 =?utf-8?B?Sk4rQ25hZzk1Mi9aeGs0U2U1SWZoWWY1WmI3Q1JqajRBdjg1aUFaVndDYkNH?=
 =?utf-8?B?OEdTSm02T1hoUkxaaVMzemZmZkhCajlKTWl2VW5OZ2RkU1djQ0VsVlYzVFV0?=
 =?utf-8?B?bU92SzFnU3RWYUFPcE5jaXlsMS9OV3dnamVLc1JzaU5RM0JKZFRWWVhpVVUr?=
 =?utf-8?B?citxdWdGV1E5clg4MDQ4cVdPcDFCYzkwOUVVL0tCQkhDdE0zb2xFeEJraG5R?=
 =?utf-8?B?MlpUak9sQlo2bzNUellmZWhIK3FWY1JFSC8xdlQ5R1I2eFlGTHBCMnV3UFBF?=
 =?utf-8?B?ZkRsVm1MUjVCM3dQaU0zMWFEQlR1QmVOa2ZiUHlndkNIVmxYY1JJbXlRWFF4?=
 =?utf-8?B?VVRwM1g5NFZuYzFrVnZMN0JSM3BvRGZ3V0VzUjlDY0x3czRxdkVZUURuOTJI?=
 =?utf-8?B?N2V0YlJ5dmtyb2FBMDcrRUhPQUlVYlhsTXFObHZmcU5LaXg3QW9oQWVXWG1M?=
 =?utf-8?B?ejhRNUF3Uzc4QXJ4Q1dtdUxyenk1YjlpamNnLytJWkxXaFA5dTZuRFUzb2cw?=
 =?utf-8?B?TmNFNzBKMGp6TWRtcERmL1MxNk5EV1RaRDhQNGkyTnMrN2pPS2ZLUEJOWDQ0?=
 =?utf-8?B?SWVNUXRHWDg3VVlsSVpzL0U3bFYybkFKdGFLWGdUQ05kYSs4NjNlWmlHZEJm?=
 =?utf-8?B?VmN3S016dW5sOHgzTytSTDVDQ1lSZXFFc1pSbkpXdjdaMU5YTjdvd25ZNGVU?=
 =?utf-8?B?b3lBOTlpbENKUUNkUGVYdHJFZC9Eck1nSVlWc3BjSmhRSTNYTTE0L1VjcG5s?=
 =?utf-8?B?N0ZzcU5tQ0ZpNGRXTXF0aFlxSGJ2b3hOVUNOOG5BdlFpY08rU3NhdjJmR21x?=
 =?utf-8?B?SUlUWGdPVmpGNXpXQXErcmV0Q2VoZXRtZENLNkhuay9EZFVpNGxZNjhSRXQ1?=
 =?utf-8?B?c1gwV1Y4dGZZMW5XaTZtY0V1Y1RUZW5kVDhEakFCc2krVHdyUG5BZkMxbDF0?=
 =?utf-8?B?cUQvTWFleEhCQnRTdkFsRDJaVTZ1ZkhnaUJaZktteHpkSks2dXlSVkhkb3ZT?=
 =?utf-8?Q?R8DMxrOQT/2Y7cQKy4tcY9Kgl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a53fec33-25b7-4657-940d-08da5a72c50e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:30:21.6131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcffbJ7PLUMEfcrmp0icAC8kC/VvxwrKfeN4Wck0VsI6Pl0ahGJ0MxaDDbfJR4kxPplq0r/AHxT1Hd/hz3pv/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3198
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Fri, 2022-06-24 at 20:02 +0200, Marek Vasut wrote:
> Add support for i.MX8MP LCDIF variant. This is called LCDIFv3 and is
> completely different from the LCDIFv3 found in i.MX23 in that it has
> a completely scrambled register layout compared to all previous LCDIF
> variants. The new LCDIFv3 also supports 36bit address space.
> 
> Add a separate driver which is really a fork of MXSFB driver with the
> i.MX8MP LCDIF variant handling filled in.
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Martyn Welch <martyn.welch@collabora.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
> V2: - Drop the pitch check from lcdif_fb_create()
>     - Drop connector caching
>     - Wait for shadow load bit to be cleared in IRQ handler
>     - Make all clock mandatory and grab them all by name
>     - Wait for EN to be cleared in lcdif_disable_controller
>     - Rename to imx-lcdif
>     - Move shadow load to atomic_flush
> V3: - Invert DE polarity to match MX8MPRM datasheet
>     - Enable CSC in RGB to YUV mode for MEDIA_BUS_FMT_UYVY8_1X16
> V4: - Drop lcdif_overlay_plane_formats, it is unused
> V5: - Add TB from Martyn
>     - Drop lcdif_fb_create in favor of drm_gem_fb_create
>     - Pull in mxsfb/ directory from drm top level Makefile
>     - Drop busy polling of CTRLDESCL0_5_SHADOW_LOAD_EN in irq handler
>     - Use devm_request_irq
>     - Drop useless dev.of_node validity check in probe
>     - Drop lcdif_*_axi_clk() prototypes
>     - Invert HS/VS polarity
>     - Drop polling from lcdif_reset_block()
>     - Add TB from Alexander
> V6: - Use SET_RUNTIME_PM_OPS() to set RPM ops and mark ops __maybe_unused
>     - Include drm/drm_framebuffer.h now required in linux-next
> ---
>  drivers/gpu/drm/Makefile           |   2 +-
>  drivers/gpu/drm/mxsfb/Kconfig      |  16 +
>  drivers/gpu/drm/mxsfb/Makefile     |   2 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c  | 341 ++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/lcdif_drv.h  |  44 +++
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 483 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/lcdif_regs.h | 257 +++++++++++++++

The mxsfb-drm driver is in the mxsfb directory as a successor of the
legacy mxsfb fbdev driver. The fbdev driver is for i.MX23/28 lcdif.
So, in order to avoid confusion, maybe don't put the new lcdifv3 driver
here. I would choose to create a new sub-directory in
drivers/gpu/drm/imx and put it there. The full path can be
drivers/gpu/drm/imx/lcdifv3, which matches the IP name(as called by
design team). If people don't like it because i.MX23 lcdif version
register reads major version3, drivers/gpu/drm/imx/imx8mp-lcdif can be
an alternative, though longer directory name. I tend to use lcdifv3
since separate directory(imx vs mxsfb) hints totally different display
controllers.  

>  7 files changed, 1144 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.c
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.h
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_kms.c
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_regs.h
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 13ef240b3d2b2..75b5ac7c2663c 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -130,7 +130,7 @@ obj-y			+= bridge/
>  obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
>  obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
>  obj-y			+= hisilicon/
> -obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
> +obj-y			+= mxsfb/
>  obj-y			+= tiny/
>  obj-$(CONFIG_DRM_PL111) += pl111/
>  obj-$(CONFIG_DRM_TVE200) += tve200/
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 987170e16ebd6..873551b4552f5 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -19,3 +19,19 @@ config DRM_MXSFB
>  	  i.MX28, i.MX6SX, i.MX7 and i.MX8M).
>  
>  	  If M is selected the module will be called mxsfb.
> +
> +config DRM_IMX_LCDIF

Perhaps, choose a less generic name here in case yet another new IP
with similar name in future... Use DRM_IMX_LCDIFV3? 

> +	tristate "i.MX LCDIFv3 LCD controller"
> +	depends on DRM && OF
> +	depends on COMMON_CLK
> +	select DRM_MXS
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_PANEL
> +	select DRM_PANEL_BRIDGE
> +	help
> +	  Choose this option if you have an LCDIFv3 LCD controller.
> +	  Those devices are found in various i.MX SoC (i.MX8MP,
> +	  i.MXRT).
> +
> +	  If M is selected the module will be called imx-lcdif.

Same here. Use imx-lcdifv3?

Similar comment applies to the entire driver - less generic name.

> diff --git a/drivers/gpu/drm/mxsfb/Makefile b/drivers/gpu/drm/mxsfb/Makefile
> index 26d153896d720..3fa44059b9d85 100644
> --- a/drivers/gpu/drm/mxsfb/Makefile
> +++ b/drivers/gpu/drm/mxsfb/Makefile
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  mxsfb-y := mxsfb_drv.o mxsfb_kms.o
>  obj-$(CONFIG_DRM_MXSFB)	+= mxsfb.o
> +imx-lcdif-y := lcdif_drv.o lcdif_kms.o
> +obj-$(CONFIG_DRM_IMX_LCDIF) += imx-lcdif.o
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> new file mode 100644
> index 0000000000000..76e14ffe84f69
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -0,0 +1,341 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * This code is based on drivers/gpu/drm/mxsfb/mxsfb*
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>

Unused.

> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>

Unused.

> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>

Unused.

> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_mode_config.h>
> +#include <drm/drm_module.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "lcdif_drv.h"
> +#include "lcdif_regs.h"
> +
> +static const struct drm_mode_config_funcs lcdif_mode_config_funcs = {
> +	.fb_create		= drm_gem_fb_create,
> +	.atomic_check		= drm_atomic_helper_check,
> +	.atomic_commit		= drm_atomic_helper_commit,
> +};
> +
> +static const struct drm_mode_config_helper_funcs lcdif_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
> +{
> +	struct drm_device *drm = lcdif->drm;
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
> +					  &bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		bridge = devm_drm_panel_bridge_add_typed(drm->dev, panel,
> +							 DRM_MODE_CONNECTOR_DPI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	}

Use devm_drm_of_get_bridge().

> +
> +	if (!bridge)
> +		return -ENODEV;
> +
> +	ret = drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
> +
> +	lcdif->bridge = bridge;
> +
> +	return 0;
> +}
> +
> +static irqreturn_t lcdif_irq_handler(int irq, void *data)
> +{
> +	struct drm_device *drm = data;
> +	struct lcdif_drm_private *lcdif = drm->dev_private;
> +	u32 reg;
> +
> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	if (!(reg & CTRLDESCL0_5_SHADOW_LOAD_EN)) {
> +		reg = readl(lcdif->base + LCDC_V8_INT_STATUS_D0);
> +
> +		if (reg & INT_STATUS_D0_VS_BLANK)
> +			drm_crtc_handle_vblank(&lcdif->crtc);
> +	}
> +
> +	writel(INT_STATUS_D0_VS_BLANK, lcdif->base + LCDC_V8_INT_STATUS_D0);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int lcdif_load(struct drm_device *drm)
> +{
> +	struct platform_device *pdev = to_platform_device(drm->dev);
> +	struct lcdif_drm_private *lcdif;
> +	struct resource *res;
> +	int ret;
> +
> +	lcdif = devm_kzalloc(&pdev->dev, sizeof(*lcdif), GFP_KERNEL);
> +	if (!lcdif)
> +		return -ENOMEM;
> +
> +	lcdif->drm = drm;
> +	drm->dev_private = lcdif;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	lcdif->base = devm_ioremap_resource(drm->dev, res);
> +	if (IS_ERR(lcdif->base))
> +		return PTR_ERR(lcdif->base);
> +
> +	lcdif->clk = devm_clk_get(drm->dev, "pix");
> +	if (IS_ERR(lcdif->clk))
> +		return PTR_ERR(lcdif->clk);
> +
> +	lcdif->clk_axi = devm_clk_get(drm->dev, "axi");
> +	if (IS_ERR(lcdif->clk_axi))
> +		return PTR_ERR(lcdif->clk_axi);
> +
> +	lcdif->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
> +	if (IS_ERR(lcdif->clk_disp_axi))
> +		return PTR_ERR(lcdif->clk_disp_axi);
> +
> +	platform_set_drvdata(pdev, drm);
> +
> +	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(36));
> +	if (ret)
> +		return ret;
> +
> +	/* Modeset init */
> +	drm_mode_config_init(drm);
> +
> +	ret = lcdif_kms_init(lcdif);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Failed to initialize KMS pipeline\n");
> +		return ret;
> +	}
> +
> +	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Failed to initialise vblank\n");
> +		return ret;
> +	}
> +
> +	/* Start with vertical blanking interrupt reporting disabled. */
> +	drm_crtc_vblank_off(&lcdif->crtc);
> +
> +	ret = lcdif_attach_bridge(lcdif);
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "Cannot connect bridge\n");
> +
> +	drm->mode_config.min_width	= LCDIF_MIN_XRES;
> +	drm->mode_config.min_height	= LCDIF_MIN_YRES;
> +	drm->mode_config.max_width	= LCDIF_MAX_XRES;
> +	drm->mode_config.max_height	= LCDIF_MAX_YRES;
> +	drm->mode_config.funcs		= &lcdif_mode_config_funcs;
> +	drm->mode_config.helper_private	= &lcdif_mode_config_helpers;
> +
> +	drm_mode_config_reset(drm);
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		return ret;
> +	lcdif->irq = ret;
> +
> +	ret = devm_request_irq(drm->dev, lcdif->irq, lcdif_irq_handler, 0,
> +			       drm->driver->name, drm);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Failed to install IRQ handler\n");
> +		return ret;
> +	}
> +
> +	drm_kms_helper_poll_init(drm);
> +
> +	drm_helper_hpd_irq_event(drm);
> +
> +	pm_runtime_enable(drm->dev);
> +
> +	return 0;
> +}
> +
> +static void lcdif_unload(struct drm_device *drm)
> +{
> +	struct lcdif_drm_private *lcdif = drm->dev_private;
> +
> +	pm_runtime_get_sync(drm->dev);
> +
> +	drm_crtc_vblank_off(&lcdif->crtc);
> +
> +	drm_kms_helper_poll_fini(drm);
> +	drm_mode_config_cleanup(drm);
> +
> +	pm_runtime_put_sync(drm->dev);
> +	pm_runtime_disable(drm->dev);
> +
> +	free_irq(lcdif->irq, drm->dev);
> +
> +	drm->dev_private = NULL;
> +}
> +
> +DEFINE_DRM_GEM_CMA_FOPS(fops);
> +
> +static const struct drm_driver lcdif_driver = {
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	DRM_GEM_CMA_DRIVER_OPS,
> +	.fops	= &fops,
> +	.name	= "imx-lcdif",
> +	.desc	= "i.MX LCDIF Controller DRM",
> +	.date	= "20220417",
> +	.major	= 1,
> +	.minor	= 0,
> +};
> +
> +static const struct of_device_id lcdif_dt_ids[] = {
> +	{ .compatible = "fsl,imx8mp-lcdif" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, lcdif_dt_ids);
> +
> +static int lcdif_probe(struct platform_device *pdev)
> +{
> +	struct drm_device *drm;
> +	int ret;
> +
> +	drm = drm_dev_alloc(&lcdif_driver, &pdev->dev);
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
> +
> +	ret = lcdif_load(drm);
> +	if (ret)
> +		goto err_free;
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret)
> +		goto err_unload;
> +
> +	drm_fbdev_generic_setup(drm, 32);
> +
> +	return 0;
> +
> +err_unload:
> +	lcdif_unload(drm);
> +err_free:
> +	drm_dev_put(drm);
> +
> +	return ret;
> +}
> +
> +static int lcdif_remove(struct platform_device *pdev)
> +{
> +	struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +	drm_dev_unregister(drm);
> +	drm_atomic_helper_shutdown(drm);
> +	lcdif_unload(drm);
> +	drm_dev_put(drm);
> +
> +	return 0;
> +}
> +
> +static void lcdif_shutdown(struct platform_device *pdev)
> +{
> +	struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static int __maybe_unused lcdif_rpm_suspend(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct lcdif_drm_private *lcdif = drm->dev_private;
> +
> +	/* These clock supply the DISPLAY CLOCK Domain */

s/These/This/ ?

> +	clk_disable_unprepare(lcdif->clk);
> +	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
> +	clk_disable_unprepare(lcdif->clk_disp_axi);
> +	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
> +	clk_disable_unprepare(lcdif->clk_axi);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused lcdif_rpm_resume(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct lcdif_drm_private *lcdif = drm->dev_private;
> +
> +	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
> +	clk_prepare_enable(lcdif->clk_axi);
> +	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
> +	clk_prepare_enable(lcdif->clk_disp_axi);
> +	/* These clock supply the DISPLAY CLOCK Domain */
> +	clk_prepare_enable(lcdif->clk);
> +
> +	return 0;
> +}
> +
> +static int lcdif_suspend(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = drm_mode_config_helper_suspend(drm);
> +	if (ret)
> +		return ret;
> +
> +	return lcdif_rpm_suspend(dev);
> +}
> +
> +static int lcdif_resume(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +
> +	lcdif_rpm_resume(dev);
> +
> +	return drm_mode_config_helper_resume(drm);
> +}
> +
> +static const struct dev_pm_ops lcdif_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(lcdif_suspend, lcdif_resume)
> +	SET_RUNTIME_PM_OPS(lcdif_rpm_suspend, lcdif_rpm_resume, NULL)
> +};
> +
> +static struct platform_driver lcdif_platform_driver = {
> +	.probe		= lcdif_probe,
> +	.remove		= lcdif_remove,
> +	.shutdown	= lcdif_shutdown,
> +	.driver	= {
> +		.name		= "imx-lcdif",
> +		.of_match_table	= lcdif_dt_ids,
> +		.pm		= &lcdif_pm_ops,
> +	},
> +};
> +
> +drm_module_platform_driver(lcdif_platform_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_DESCRIPTION("Freescale LCDIF DRM/KMS driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> new file mode 100644
> index 0000000000000..cb916341e8454
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * i.MX8MP/i.MXRT LCDIFv3 LCD controller driver.
> + */
> +
> +#ifndef __LCDIF_DRV_H__
> +#define __LCDIF_DRV_H__
> +

Include drm_bridge.h since struct drm_bridge is used in this file.

> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_plane.h>
> +
> +struct clk;
> +
> +struct lcdif_drm_private {
> +	void __iomem			*base;	/* registers */
> +	struct clk			*clk;
> +	struct clk			*clk_axi;
> +	struct clk			*clk_disp_axi;

i.MX8mp RM mentions that clocks are pix_clk, apb_clk and b_clk.
Why not use them?

> +
> +	unsigned int			irq;
> +
> +	struct drm_device		*drm;
> +	struct {
> +		struct drm_plane	primary;
> +		/* i.MXRT does support overlay planes, add them here. */
> +	} planes;
> +	struct drm_crtc			crtc;
> +	struct drm_encoder		encoder;
> +	struct drm_bridge		*bridge;
> +};
> +
> +static inline struct lcdif_drm_private *
> +to_lcdif_drm_private(struct drm_device *drm)
> +{
> +	return drm->dev_private;
> +}
> +
> +int lcdif_kms_init(struct lcdif_drm_private *lcdif);
> +
> +#endif /* __LCDIF_DRV_H__ */
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> new file mode 100644
> index 0000000000000..76a0d7821d942
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -0,0 +1,483 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * This code is based on drivers/gpu/drm/mxsfb/mxsfb*
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_encoder.h>/a/a
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>

Sort the header files alphabetically.

> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "lcdif_drv.h"
> +#include "lcdif_regs.h"
> +
> +/* 1 second delay should be plenty of time for block reset */
> +#define RESET_TIMEOUT		1000000

Unused.

> +
> +/* -----------------------------------------------------------------------------
> + * CRTC
> + */
> +static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
> +			      const u32 bus_format)
> +{
> +	struct drm_device *drm = lcdif->drm;
> +	const u32 format = lcdif->crtc.primary->state->fb->format->format;
> +
> +	writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
> +
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		writel(DISP_PARA_LINE_PATTERN_RGB565,
> +		       lcdif->base + LCDC_V8_DISP_PARA);
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		writel(DISP_PARA_LINE_PATTERN_RGB888,
> +		       lcdif->base + LCDC_V8_DISP_PARA);
> +		break;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +		writel(DISP_PARA_LINE_PATTERN_UYVY_H,
> +		       lcdif->base + LCDC_V8_DISP_PARA);
> +
> +		/* CSC: BT.601 Full Range RGB to YCbCr coefficients. */
> +		writel(CSC0_COEF0_A2(0x096) | CSC0_COEF0_A1(0x04c),
> +		       lcdif->base + LCDC_V8_CSC0_COEF0);
> +		writel(CSC0_COEF1_B1(0x7d5) | CSC0_COEF1_A3(0x01d),
> +		       lcdif->base + LCDC_V8_CSC0_COEF1);
> +		writel(CSC0_COEF2_B3(0x080) | CSC0_COEF2_B2(0x7ac),
> +		       lcdif->base + LCDC_V8_CSC0_COEF2);
> +		writel(CSC0_COEF3_C2(0x795) | CSC0_COEF3_C1(0x080),
> +		       lcdif->base + LCDC_V8_CSC0_COEF3);
> +		writel(CSC0_COEF4_D1(0x000) | CSC0_COEF4_C3(0x7ec),
> +		       lcdif->base + LCDC_V8_CSC0_COEF4);
> +		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
> +		       lcdif->base + LCDC_V8_CSC0_COEF5);
> +
> +		writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,
> +		       lcdif->base + LCDC_V8_CSC0_CTRL);

'checkpatch.pl --strict' says:

CHECK: Avoid CamelCase: <CSC0_CTRL_CSC_MODE_RGB2YCbCr>#559: FILE: drivers/gpu/drm/mxsfb/lcdif_kms.c:72:+               writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,

> +
> +		break;
> +	default:
> +		dev_err(drm->dev, "Unknown media bus format 0x%x\n", bus_format);
> +		break;
> +	}
> +
> +	switch (format) {
> +	case DRM_FORMAT_RGB565:
> +		writel(CTRLDESCL0_5_BPP_16_RGB565,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_RGB888:
> +		writel(CTRLDESCL0_5_BPP_24_RGB888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB1555:

DRM_FORMAT_ARGB1555?

> +		writel(CTRLDESCL0_5_BPP_16_ARGB1555,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB4444:

DRM_FORMAT_ARGB4444?

> +		writel(CTRLDESCL0_5_BPP_16_ARGB4444,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XBGR8888:

DRM_FORMAT_ABGR8888?

> +		writel(CTRLDESCL0_5_BPP_32_ABGR8888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB8888:

DRM_FORMAT_ARGB8888?

> +		writel(CTRLDESCL0_5_BPP_32_ARGB8888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	default:
> +		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
> +		break;
> +	}

lcdif_set_formats() is called in lcdif_crtc_mode_set_nofb(), so no fb,
which means the framebuffer pixel format should be set in plane
callback.

> +}
> +
> +static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
> +{
> +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> +	u32 ctrl = 0;
> +
> +	if (m->flags & DRM_MODE_FLAG_NHSYNC)
> +		ctrl |= CTRL_INV_HS;
> +	if (m->flags & DRM_MODE_FLAG_NVSYNC)
> +		ctrl |= CTRL_INV_VS;
> +	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> +		ctrl |= CTRL_INV_DE;
> +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> +		ctrl |= CTRL_INV_PXCK;
> +
> +	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
> +
> +	writel(DISP_SIZE_DELTA_Y(m->crtc_vdisplay) |
> +	       DISP_SIZE_DELTA_X(m->crtc_hdisplay),
> +	       lcdif->base + LCDC_V8_DISP_SIZE);
> +
> +	writel(HSYN_PARA_BP_H(m->htotal - m->hsync_end) |
> +	       HSYN_PARA_FP_H(m->hsync_start - m->hdisplay),
> +	       lcdif->base + LCDC_V8_HSYN_PARA);

Nit: Mixed usages of crtc_{h,v}display and htotal/hsync_start...
Add 'cr
tc_' to htotal/hsync_start... ?

> +
> +	writel(VSYN_PARA_BP_V(m->vtotal - m->vsync_end) |
> +	       VSYN_PARA_FP_V(m->vsync_start - m->vdisplay),
> +	       lcdif->base + LCDC_V8_VSYN_PARA);
> +
> +	writel(VSYN_HSYN_WIDTH_PW_V(m->vsync_end - m->vsync_start) |
> +	       VSYN_HSYN_WIDTH_PW_H(m->hsync_end - m->hsync_start),
> +	       lcdif->base + LCDC_V8_VSYN_HSYN_WIDTH);
> +
> +	writel(CTRLDESCL0_1_HEIGHT(m->crtc_vdisplay) |
> +	       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
> +	       lcdif->base + LCDC_V8_CTRLDESCL0_1);

CTRLDESCL0_1 is for layer, so probably it should be moved to plane
callback.

> +
> +	writel(CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]),
> +	       lcdif->base + LCDC_V8_CTRLDESCL0_3);

Pitch is not mode related. Put it in plane callback.

> +}
> +
> +static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
> +{
> +	u32 reg;
> +
> +	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
> +	reg |= DISP_PARA_DISP_ON;
> +	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
> +
> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg |= CTRLDESCL0_5_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +}
> +
> +static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
> +{
> +	u32 reg;
> +	int ret;
> +
> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg &= ~CTRLDESCL0_5_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	ret = readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_5,
> +				 reg, !(reg & CTRLDESCL0_5_EN),
> +				 0, 36000);	/* Wait ~2 frame times max */
> +	if (ret)
> +		drm_err(lcdif->drm, "Failed to disable controller!\n");

Isn't CTRLDESCL0_5_EN cleared as soon as the write operation is done?
Why poll on reading this?

Sleep for a time period of ~2 frames?

> +
> +	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
> +	reg &= ~DISP_PARA_DISP_ON;
> +	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
> +}
> +
> +static void lcdif_reset_block(struct lcdif_drm_private *lcdif)
> +{
> +	writel(CTRL_SW_RESET, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +	readl(lcdif->base + LCDC_V8_CTRL);
> +	writel(CTRL_SW_RESET, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> +	readl(lcdif->base + LCDC_V8_CTRL);
> +}
> +
> +static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
> +				     struct drm_bridge_state *bridge_state,
> +				     const u32 bus_format)
> +{
> +	struct drm_device *drm = lcdif->crtc.dev;
> +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> +	u32 bus_flags = 0;
> +
> +	if (lcdif->bridge && lcdif->bridge->timings)
> +		bus_flags = lcdif->bridge->timings->input_bus_flags;
> +	else if (bridge_state)
> +		bus_flags = bridge_state->input_bus_cfg.flags;
> +
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
> +			     m->crtc_clock,
> +			     (int)(clk_get_rate(lcdif->clk) / 1000));
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Connector bus_flags: 0x%08X\n",
> +			     bus_flags);

It's the first bridge's input bus_flags, not connector's.

> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
> +
> +	/* Mandatory eLCDIF reset as per the Reference Manual */
> +	lcdif_reset_block(lcdif);
> +
> +	lcdif_set_formats(lcdif, bus_format);
> +
> +	lcdif_set_mode(lcdif, bus_flags);
> +}
> +
> +static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
> +									  crtc);
> +	bool has_primary = crtc_state->plane_mask &
> +			   drm_plane_mask(crtc->primary);
> +
> +	/* The primary plane has to be enabled when the CRTC is active. */
> +	if (crtc_state->active && !has_primary)
> +		return -EINVAL;
> +
> +	return drm_atomic_add_affected_planes(state, crtc);

Why do you add affected planes here?

> +}
> +
> +static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
> +				    struct drm_atomic_state *state)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +	struct drm_pending_vblank_event *event;
> +	u32 reg;
> +
> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg |= CTRLDESCL0_5_SHADOW_LOAD_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	event = crtc->state->event;
> +	crtc->state->event = NULL;
> +
> +	if (!event)
> +		return;
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (drm_crtc_vblank_get(crtc) == 0)
> +		drm_crtc_arm_vblank_event(crtc, event);
> +	else
> +		drm_crtc_send_vblank_event(crtc, event);
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
> +static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
> +				     struct drm_atomic_state *state)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
> +									    crtc->primary);
> +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> +	struct drm_bridge_state *bridge_state = NULL;
> +	struct drm_device *drm = lcdif->drm;
> +	u32 bus_format = 0;
> +	dma_addr_t paddr;
> +
> +	/* If there is a bridge attached to the LCDIF, use its bus format */
> +	if (lcdif->bridge) {
> +		bridge_state =
> +			drm_atomic_get_new_bridge_state(state,
> +							lcdif->bridge);
> +		if (!bridge_state)
> +			bus_format = MEDIA_BUS_FMT_FIXED;
> +		else
> +			bus_format = bridge_state->input_bus_cfg.format;
> +
> +		if (bus_format == MEDIA_BUS_FMT_FIXED) {
> +			dev_warn_once(drm->dev,
> +				      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
> +				      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
> +			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +		}
> +	}
> +
> +	/* If all else fails, default to RGB888_1X24 */
> +	if (!bus_format)
> +		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
> +
> +	pm_runtime_get_sync(drm->dev);
> +
> +	lcdif_crtc_mode_set_nofb(lcdif, bridge_state, bus_format);
> +
> +	/* Write cur_buf as well to avoid an initial corrupt frame */

No cur_buf/next_buf registers as found in i.MX23 lcdif.

> +	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> +	if (paddr) {
> +		writel(lower_32_bits(paddr),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> +		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
> +	}
> +	lcdif_enable_controller(lcdif);
> +
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +	struct drm_device *drm = lcdif->drm;
> +	struct drm_pending_vblank_event *event;
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	lcdif_disable_controller(lcdif);
> +
> +	spin_lock_irq(&drm->event_lock);
> +	event = crtc->state->event;
> +	if (event) {
> +		crtc->state->event = NULL;
> +		drm_crtc_send_vblank_event(crtc, event);
> +	}
> +	spin_unlock_irq(&drm->event_lock);
> +
> +	pm_runtime_put_sync(drm->dev);
> +}
> +
> +static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +
> +	/* Clear and enable VBLANK IRQ */
> +	writel(INT_STATUS_D0_VS_BLANK, lcdif->base + LCDC_V8_INT_STATUS_D0);
> +	writel(INT_ENABLE_D0_VS_BLANK_EN, lcdif->base + LCDC_V8_INT_ENABLE_D0);
> +
> +	return 0;
> +}
> +
> +static void lcdif_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +
> +	/* Disable and clear VBLANK IRQ */
> +	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D0);
> +	writel(INT_STATUS_D0_VS_BLANK, lcdif->base + LCDC_V8_INT_STATUS_D0);
> +}
> +
> +static const struct drm_crtc_helper_funcs lcdif_crtc_helper_funcs = {
> +	.atomic_check = lcdif_crtc_atomic_check,
> +	.atomic_flush = lcdif_crtc_atomic_flush,
> +	.atomic_enable = lcdif_crtc_atomic_enable,
> +	.atomic_disable = lcdif_crtc_atomic_disable,
> +};
> +
> +static const struct drm_crtc_funcs lcdif_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank = lcdif_crtc_enable_vblank,
> +	.disable_vblank = lcdif_crtc_disable_vblank,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Encoder
> + */
> +
> +static const struct drm_encoder_funcs lcdif_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Planes
> + */
> +
> +static int lcdif_plane_atomic_check(struct drm_plane *plane,
> +				    struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state,
> +									     plane);
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->dev);
> +	struct drm_crtc_state *crtc_state;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state,
> +						   &lcdif->crtc);
> +

CTRLDESCL0_3 mentions Byte granularity is supported, but SW should
align to 64B boundary. Not sure if a check is needed or not.

CTRLDESCL0_1 mentions 32bit alignment for width.

CTRLDESCL_{LOW,HIGH}0_4 mentions 64bit alignment for layer address.

> +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   false, true);
> +}
> +
> +static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
> +					      struct drm_atomic_state *state)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->dev);
> +	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
> +									    plane);
> +	dma_addr_t paddr;
> +
> +	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> +	if (paddr) {
> +		writel(lower_32_bits(paddr),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> +		writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
> +	}
> +}
> +
> +static bool lcdif_format_mod_supported(struct drm_plane *plane,
> +				       uint32_t format,
> +				       uint64_t modifier)
> +{
> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> +}
> +
> +static const struct drm_plane_helper_funcs lcdif_plane_primary_helper_funcs = {
> +	.atomic_check = lcdif_plane_atomic_check,
> +	.atomic_update = lcdif_plane_primary_atomic_update,
> +};
> +
> +static const struct drm_plane_funcs lcdif_plane_funcs = {
> +	.format_mod_supported	= lcdif_format_mod_supported,
> +	.update_plane		= drm_atomic_helper_update_plane,
> +	.disable_plane		= drm_atomic_helper_disable_plane,
> +	.destroy		= drm_plane_cleanup,
> +	.reset			= drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> +};
> +
> +static const u32 lcdif_primary_plane_formats[] = {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,

Maybe, add all formats mentioned in lcdif_set_formats().
Or drop unsupported ones from lcdif_set_formats().

> +};
> +
> +static const u64 lcdif_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Initialization
> + */
> +
> +int lcdif_kms_init(struct lcdif_drm_private *lcdif)
> +{
> +	struct drm_encoder *encoder = &lcdif->encoder;
> +	struct drm_crtc *crtc = &lcdif->crtc;
> +	int ret;
> +
> +	drm_plane_helper_add(&lcdif->planes.primary,
> +			     &lcdif_plane_primary_helper_funcs);
> +	ret = drm_universal_plane_init(lcdif->drm, &lcdif->planes.primary, 1,
> +				       &lcdif_plane_funcs,
> +				       lcdif_primary_plane_formats,
> +				       ARRAY_SIZE(lcdif_primary_plane_formats),
> +				       lcdif_modifiers, DRM_PLANE_TYPE_PRIMARY,
> +				       NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(crtc, &lcdif_crtc_helper_funcs);
> +	ret = drm_crtc_init_with_planes(lcdif->drm, crtc,
> +					&lcdif->planes.primary, NULL,
> +					&lcdif_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	return drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
> +				DRM_MODE_ENCODER_NONE, NULL);
> +}
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> new file mode 100644
> index 0000000000000..c70220651e3a5
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -0,0 +1,257 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * i.MX8MP/i.MXRT LCDIF LCD controller driver.
> + */
> +
> +#ifndef __LCDIF_REGS_H__
> +#define __LCDIF_REGS_H__
> +
> +#define REG_SET	4
> +#define REG_CLR	8
> +
> +/* V8 register set */

Any doc mentions V8?

> +#define LCDC_V8_CTRL			0x00
> +#define LCDC_V8_DISP_PARA		0x10
> +#define LCDC_V8_DISP_SIZE		0x14
> +#define LCDC_V8_HSYN_PARA		0x18
> +#define LCDC_V8_VSYN_PARA		0x1c
> +#define LCDC_V8_VSYN_HSYN_WIDTH		0x20
> +#define LCDC_V8_INT_STATUS_D0		0x24
> +#define LCDC_V8_INT_ENABLE_D0		0x28
> +#define LCDC_V8_INT_STATUS_D1		0x30
> +#define LCDC_V8_INT_ENABLE_D1		0x34
> +#define LCDC_V8_CTRLDESCL0_1		0x200
> +#define LCDC_V8_CTRLDESCL0_3		0x208
> +#define LCDC_V8_CTRLDESCL_LOW0_4	0x20c
> +#define LCDC_V8_CTRLDESCL_HIGH0_4	0x210
> +#define LCDC_V8_CTRLDESCL0_5		0x214
> +#define LCDC_V8_CSC0_CTRL		0x21c
> +#define LCDC_V8_CSC0_COEF0		0x220
> +#define LCDC_V8_CSC0_COEF1		0x224
> +#define LCDC_V8_CSC0_COEF2		0x228
> +#define LCDC_V8_CSC0_COEF3		0x22c
> +#define LCDC_V8_CSC0_COEF4		0x230
> +#define LCDC_V8_CSC0_COEF5		0x234
> +#define LCDC_V8_PANIC0_THRES		0x238

Any doc mentions LCDC?

> +
> +#define CTRL_SFTRST			BIT(31)
> +#define CTRL_CLKGATE			BIT(30)
> +#define CTRL_BYPASS_COUNT		BIT(19)
> +#define CTRL_VSYNC_MODE			BIT(18)
> +#define CTRL_DOTCLK_MODE		BIT(17)
> +#define CTRL_DATA_SELECT		BIT(16)
> +#define CTRL_BUS_WIDTH_16		(0 << 10)
> +#define CTRL_BUS_WIDTH_8		(1 << 10)
> +#define CTRL_BUS_WIDTH_18		(2 << 10)
> +#define CTRL_BUS_WIDTH_24		(3 << 10)
> +#define CTRL_BUS_WIDTH_MASK		(0x3 << 10)
> +#define CTRL_WORD_LENGTH_16		(0 << 8)
> +#define CTRL_WORD_LENGTH_8		(1 << 8)
> +#define CTRL_WORD_LENGTH_18		(2 << 8)
> +#define CTRL_WORD_LENGTH_24		(3 << 8)
> +#define CTRL_MASTER			BIT(5)
> +#define CTRL_DF16			BIT(3)
> +#define CTRL_DF18			BIT(2)
> +#define CTRL_DF24			BIT(1)
> +#define CTRL_RUN			BIT(0)

Looks like quite a few unused macros are copied from mxsfb_regs.h.

> +
> +#define CTRL1_RECOVER_ON_UNDERFLOW	BIT(24)
> +#define CTRL1_FIFO_CLEAR		BIT(21)
> +#define CTRL1_SET_BYTE_PACKAGING(x)	(((x) & 0xf) << 16)
> +#define CTRL1_GET_BYTE_PACKAGING(x)	(((x) >> 16) & 0xf)
> +#define CTRL1_CUR_FRAME_DONE_IRQ_EN	BIT(13)
> +#define CTRL1_CUR_FRAME_DONE_IRQ	BIT(9)
> +
> +#define CTRL2_SET_OUTSTANDING_REQS_1	0
> +#define CTRL2_SET_OUTSTANDING_REQS_2	(0x1 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_4	(0x2 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_8	(0x3 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_16	(0x4 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_MASK	(0x7 << 21)
> +
> +#define TRANSFER_COUNT_SET_VCOUNT(x)	(((x) & 0xffff) << 16)
> +#define TRANSFER_COUNT_GET_VCOUNT(x)	(((x) >> 16) & 0xffff)
> +#define TRANSFER_COUNT_SET_HCOUNT(x)	((x) & 0xffff)
> +#define TRANSFER_COUNT_GET_HCOUNT(x)	((x) & 0xffff)
> +
> +#define VDCTRL0_ENABLE_PRESENT		BIT(28)
> +#define VDCTRL0_VSYNC_ACT_HIGH		BIT(27)
> +#define VDCTRL0_HSYNC_ACT_HIGH		BIT(26)
> +#define VDCTRL0_DOTCLK_ACT_FALLING	BIT(25)
> +#define VDCTRL0_ENABLE_ACT_HIGH		BIT(24)
> +#define VDCTRL0_VSYNC_PERIOD_UNIT	BIT(21)
> +#define VDCTRL0_VSYNC_PULSE_WIDTH_UNIT	BIT(20)
> +#define VDCTRL0_HALF_LINE		BIT(19)
> +#define VDCTRL0_HALF_LINE_MODE		BIT(18)
> +#define VDCTRL0_SET_VSYNC_PULSE_WIDTH(x) ((x) & 0x3ffff)
> +#define VDCTRL0_GET_VSYNC_PULSE_WIDTH(x) ((x) & 0x3ffff)
> +
> +#define VDCTRL2_SET_HSYNC_PERIOD(x)	((x) & 0x3ffff)
> +#define VDCTRL2_GET_HSYNC_PERIOD(x)	((x) & 0x3ffff)
> +
> +#define VDCTRL3_MUX_SYNC_SIGNALS	BIT(29)
> +#define VDCTRL3_VSYNC_ONLY		BIT(28)
> +#define SET_HOR_WAIT_CNT(x)		(((x) & 0xfff) << 16)
> +#define GET_HOR_WAIT_CNT(x)		(((x) >> 16) & 0xfff)
> +#define SET_VERT_WAIT_CNT(x)		((x) & 0xffff)
> +#define GET_VERT_WAIT_CNT(x)		((x) & 0xffff)
> +
> +#define VDCTRL4_SET_DOTCLK_DLY(x)	(((x) & 0x7) << 29) /* v4 only */
> +#define VDCTRL4_GET_DOTCLK_DLY(x)	(((x) >> 29) & 0x7) /* v4 only */
> +#define VDCTRL4_SYNC_SIGNALS_ON		BIT(18)
> +#define SET_DOTCLK_H_VALID_DATA_CNT(x)	((x) & 0x3ffff)
> +
> +#define DEBUG0_HSYNC			BIT(26)
> +#define DEBUG0_VSYNC			BIT(25)
> +
> +#define AS_CTRL_PS_DISABLE		BIT(23)
> +#define AS_CTRL_ALPHA_INVERT		BIT(20)
> +#define AS_CTRL_ALPHA(a)		(((a) & 0xff) << 8)
> +#define AS_CTRL_FORMAT_RGB565		(0xe << 4)
> +#define AS_CTRL_FORMAT_RGB444		(0xd << 4)
> +#define AS_CTRL_FORMAT_RGB555		(0xc << 4)
> +#define AS_CTRL_FORMAT_ARGB4444		(0x9 << 4)
> +#define AS_CTRL_FORMAT_ARGB1555		(0x8 << 4)
> +#define AS_CTRL_FORMAT_RGB888		(0x4 << 4)
> +#define AS_CTRL_FORMAT_ARGB8888		(0x0 << 4)
> +#define AS_CTRL_ENABLE_COLORKEY		BIT(3)
> +#define AS_CTRL_ALPHA_CTRL_ROP		(3 << 1)
> +#define AS_CTRL_ALPHA_CTRL_MULTIPLY	(2 << 1)
> +#define AS_CTRL_ALPHA_CTRL_OVERRIDE	(1 << 1)
> +#define AS_CTRL_ALPHA_CTRL_EMBEDDED	(0 << 1)
> +#define AS_CTRL_AS_ENABLE		BIT(0)
> +
> +/* V8 register set */
> +#define CTRL_SW_RESET			BIT(31)
> +#define CTRL_FETCH_START_OPTION_FPV	0
> +#define CTRL_FETCH_START_OPTION_PWV	BIT(8)
> +#define CTRL_FETCH_START_OPTION_BPV	BIT(9)
> +#define CTRL_FETCH_START_OPTION_RESV	GENMASK(9, 8)
> +#define CTRL_FETCH_START_OPTION_MASK	GENMASK(9, 8)
> +#define CTRL_NEG				BIT(4)
> +#define CTRL_INV_PXCK			BIT(3)
> +#define CTRL_INV_DE			BIT(2)
> +#define CTRL_INV_VS			BIT(1)
> +#define CTRL_INV_HS			BIT(0)
> +
> +#define DISP_PARA_DISP_ON		BIT(31)
> +#define DISP_PARA_SWAP_EN		BIT(30)
> +#define DISP_PARA_LINE_PATTERN_UYVY_H	(GENMASK(29, 28) | BIT(26))
> +#define DISP_PARA_LINE_PATTERN_RGB565	GENMASK(28, 26)
> +#define DISP_PARA_LINE_PATTERN_RGB888	0
> +#define DISP_PARA_LINE_PATTERN_MASK	GENMASK(29, 26)
> +#define DISP_PARA_DISP_MODE_MASK	GENMASK(25, 24)
> +#define DISP_PARA_BGND_R_MASK		GENMASK(23, 16)
> +#define DISP_PARA_BGND_G_MASK		GENMASK(15, 8)
> +#define DISP_PARA_BGND_B_MASK		GENMASK(7, 0)
> +
> +#define DISP_SIZE_DELTA_Y(n)		(((n) & 0xffff) << 16)
> +#define DISP_SIZE_DELTA_Y_MASK		GENMASK(31, 16)
> +#define DISP_SIZE_DELTA_X(n)		((n) & 0xffff)
> +#define DISP_SIZE_DELTA_X_MASK		GENMASK(15, 0)
> +
> +#define HSYN_PARA_BP_H(n)		(((n) & 0xffff) << 16)
> +#define HSYN_PARA_BP_H_MASK		GENMASK(31, 16)
> +#define HSYN_PARA_FP_H(n)		((n) & 0xffff)
> +#define HSYN_PARA_FP_H_MASK		GENMASK(15, 0)
> +
> +#define VSYN_PARA_BP_V(n)		(((n) & 0xffff) << 16)
> +#define VSYN_PARA_BP_V_MASK		GENMASK(31, 16)
> +#define VSYN_PARA_FP_V(n)		((n) & 0xffff)
> +#define VSYN_PARA_FP_V_MASK		GENMASK(15, 0)
> +
> +#define VSYN_HSYN_WIDTH_PW_V(n)		(((n) & 0xffff) << 16)
> +#define VSYN_HSYN_WIDTH_PW_V_MASK	GENMASK(31, 16)
> +#define VSYN_HSYN_WIDTH_PW_H(n)		((n) & 0xffff)
> +#define VSYN_HSYN_WIDTH_PW_H_MASK	GENMASK(15, 0)
> +
> +#define INT_STATUS_D0_FIFO_EMPTY	BIT(24)
> +#define INT_STATUS_D0_DMA_DONE		BIT(16)
> +#define INT_STATUS_D0_DMA_ERR		BIT(8)
> +#define INT_STATUS_D0_VS_BLANK		BIT(2)
> +#define INT_STATUS_D0_UNDERRUN		BIT(1)
> +#define INT_STATUS_D0_VSYNC		BIT(0)
> +
> +#define INT_ENABLE_D0_FIFO_EMPTY_EN	BIT(24)
> +#define INT_ENABLE_D0_DMA_DONE_EN	BIT(16)
> +#define INT_ENABLE_D0_DMA_ERR_EN	BIT(8)
> +#define INT_ENABLE_D0_VS_BLANK_EN	BIT(2)
> +#define INT_ENABLE_D0_UNDERRUN_EN	BIT(1)
> +#define INT_ENABLE_D0_VSYNC_EN		BIT(0)
> +
> +#define INT_STATUS_D1_PLANE_PANIC	BIT(0)
> +
> +#define INT_ENABLE_D1_PLANE_PANIC_EN	BIT(0)
> +
> +#define CTRLDESCL0_1_HEIGHT(n)		(((n) & 0xffff) << 16)
> +#define CTRLDESCL0_1_HEIGHT_MASK		GENMASK(31, 16)
> +#define CTRLDESCL0_1_WIDTH(n)		((n) & 0xffff)
> +#define CTRLDESCL0_1_WIDTH_MASK		GENMASK(15, 0)
> +
> +#define CTRLDESCL0_3_PITCH(n)		((n) & 0xffff)
> +#define CTRLDESCL0_3_PITCH_MASK		GENMASK(15, 0)
> +
> +#define CTRLDESCL_HIGH0_4_ADDR_HIGH(n)	((n) & 0xf)
> +#define CTRLDESCL_HIGH0_4_ADDR_HIGH_MASK	GENMASK(3, 0)
> +
> +#define CTRLDESCL0_5_EN			BIT(31)
> +#define CTRLDESCL0_5_SHADOW_LOAD_EN	BIT(30)
> +#define CTRLDESCL0_5_BPP_16_RGB565	BIT(26)
> +#define CTRLDESCL0_5_BPP_16_ARGB1555	(BIT(26) | BIT(24))
> +#define CTRLDESCL0_5_BPP_16_ARGB4444	(BIT(26) | BIT(25))
> +#define CTRLDESCL0_5_BPP_YCbCr422	(BIT(26) | BIT(25) | BIT(24))

'checkpatch.pl --strict' says:

CHECK: Avoid CamelCase: <CTRLDESCL0_5_BPP_YCbCr422>
#1180: FILE: drivers/gpu/drm/mxsfb/lcdif_regs.h:204:
+#define CTRLDESCL0_5_BPP_YCbCr422      (BIT(26) | BIT(25) | BIT(24))

> +#define CTRLDESCL0_5_BPP_24_RGB888	BIT(27)
> +#define CTRLDESCL0_5_BPP_32_ARGB8888	(BIT(27) | BIT(24))
> +#define CTRLDESCL0_5_BPP_32_ABGR8888	(BIT(27) | BIT(25))
> +#define CTRLDESCL0_5_BPP_MASK		GENMASK(27, 24)
> +#define CTRLDESCL0_5_YUV_FORMAT_Y2VY1U	0
> +#define CTRLDESCL0_5_YUV_FORMAT_Y2UY1V	BIT(14)
> +#define CTRLDESCL0_5_YUV_FORMAT_VY2UY1	BIT(15)
> +#define CTRLDESCL0_5_YUV_FORMAT_UY2VY1	(BIT(15) | BIT(14))
> +#define CTRLDESCL0_5_YUV_FORMAT_MASK	GENMASK(15, 14)
> +
> +#define CSC0_CTRL_CSC_MODE_RGB2YCbCr	GENMASK(2, 1)
> +#define CSC0_CTRL_CSC_MODE_MASK		GENMASK(2, 1)
> +#define CSC0_CTRL_BYPASS		BIT(0)
> +
> +#define CSC0_COEF0_A2(n)		(((n) << 16) & CSC0_COEF0_A2_MASK)
> +#define CSC0_COEF0_A2_MASK		GENMASK(26, 16)
> +#define CSC0_COEF0_A1(n)		((n) & CSC0_COEF0_A1_MASK)
> +#define CSC0_COEF0_A1_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF1_B1(n)		(((n) << 16) & CSC0_COEF1_B1_MASK)
> +#define CSC0_COEF1_B1_MASK		GENMASK(26, 16)
> +#define CSC0_COEF1_A3(n)		((n) & CSC0_COEF1_A3_MASK)
> +#define CSC0_COEF1_A3_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF2_B3(n)		(((n) << 16) & CSC0_COEF2_B3_MASK)
> +#define CSC0_COEF2_B3_MASK		GENMASK(26, 16)
> +#define CSC0_COEF2_B2(n)		((n) & CSC0_COEF2_B2_MASK)
> +#define CSC0_COEF2_B2_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF3_C2(n)		(((n) << 16) & CSC0_COEF3_C2_MASK)
> +#define CSC0_COEF3_C2_MASK		GENMASK(26, 16)
> +#define CSC0_COEF3_C1(n)		((n) & CSC0_COEF3_C1_MASK)
> +#define CSC0_COEF3_C1_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF4_D1(n)		(((n) << 16) & CSC0_COEF4_D1_MASK)
> +#define CSC0_COEF4_D1_MASK		GENMASK(24, 16)
> +#define CSC0_COEF4_C3(n)		((n) & CSC0_COEF4_C3_MASK)
> +#define CSC0_COEF4_C3_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF5_D3(n)		(((n) << 16) & CSC0_COEF5_D3_MASK)
> +#define CSC0_COEF5_D3_MASK		GENMASK(24, 16)
> +#define CSC0_COEF5_D2(n)		((n) & CSC0_COEF5_D2_MASK)
> +#define CSC0_COEF5_D2_MASK		GENMASK(8, 0)
> +
> +#define PANIC0_THRES_LOW_MASK		GENMASK(24, 16)
> +#define PANIC0_THRES_HIGH_MASK		GENMASK(8, 0)
> +
> +#define LCDIF_MIN_XRES			120
> +#define LCDIF_MIN_YRES			120
> +#define LCDIF_MAX_XRES			0xffff
> +#define LCDIF_MAX_YRES			0xffff

The above 4 are not register related.

> +
> +#endif /* __LCDIF_REGS_H__ */

Regards,
Liu Ying

