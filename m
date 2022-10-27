Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0674760EFA1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 07:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BE110E327;
	Thu, 27 Oct 2022 05:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B51810E327
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 05:46:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnXAsVyTGZ97s2yBudsYscVmlkqlKsNmbjKEhniEmnv1feZWaKQoPWqB934XEgUGBOVDuM7X2+T77g6/JXNGuVjSXdUtSx7q88q+HMF8FVltbsB6HyHtnJ2xvMkIrNOfih+xtqrBEAmrifTedGGYj1KVBfjcUseA9gKqwbfHhbStRbXVT6FkEqPVuoKSLf6CfTYN+WJQHtIiRhd967HiRubyAh8qJ7yJIvYa2gfaOYonN4nESx+bX9mLbXx8fnmXuKu+fQ406SXFGPnzIKH/BbclumHLWUGyN84f3pK8vCCSbJWLKwXP1bzCv9M0aBKTss0A04nUqQO81yP5+cIlmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfV/7Wloy1cE3wSBmvGfakekuAHDmQi3bEww1/Dd7jc=;
 b=ZZf7UGBiQLNxEcJ2NWcld+1T1Ci9oVQp/fgnJO/i4LXeDzXSEfVCTXI+HVA0X5iKqinc+J05XH+RRLXnwHKcWUb09WjdPJNOmnHV6alSOeFSQX6C2zNy0Plc65w9/mRkpOAca5R4tkJ/TEjsI95al7MFd8zP/LYORZk+ip3vdwOcWnbrpJ36GSb6ZL5I7mC5ZqTkPkVFxJQbGe8QucxvNBL0sO3BVO11QdO8EAglY8IpNagZ0ktLUvykkpkHn0bZ+OBmBx5grMWkAuNQZqDOOQXpbVOCvxsY2zXGDoavl2v5p1oPY0pFZn48d7h3HISb/VNzRPXm4d5j/2DsPqZtlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfV/7Wloy1cE3wSBmvGfakekuAHDmQi3bEww1/Dd7jc=;
 b=Sz0PgSbEOeY+mXPHaF4z9FE3R7KUnMCOJNeK1BJSkqJhlwR9omvSEaw7yNqeB6wKDmQ8MdzTG67y3Lvf4e+X1c8HhLTBKSVXDoIcRmGg6CgqK7i/485TLB6oabQm2++mtgkiBr0b/Y8+HQIlKQ9XDJEtcvYsuY7PZduQweBfdd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8451.eurprd04.prod.outlook.com (2603:10a6:20b:347::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 05:46:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8%3]) with mapi id 15.20.5746.021; Thu, 27 Oct 2022
 05:46:48 +0000
Message-ID: <2e9368bcc1c354ff01e63b9c451d839aa6a7a36f.camel@nxp.com>
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 27 Oct 2022 13:45:54 +0800
In-Reply-To: <20221026212002.542375-1-marex@denx.de>
References: <20221026212002.542375-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6d78c6-604a-48d9-144c-08dab7dea3aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IAB/PsXCZVHBpiYw0HLdKE/ALOxc9EUymmj4SLA7XPPkIpI57n0DUGYpawW+qAMnkvjmks/vJ0yBCNfLw4NumVSRiuhICOMC1I5QTSN8Tb24MNRrgP8UBQ1lmIddyxn5gOCOimPv65Qv0SF2elf5PqEJeIksqzrpeiM/7XVY9bM4Bp0vFNqKHyBHQFgQwHsne+edRY766vYi+txuipaqdaOL0xyNwpNWBhLi53xOPKzcxFzJKC3ZlJffxWGTpYv5imJ4xzLcEvmy7vaJoQI6fgMs1A/ITZd9jCdwWFNiS88/7JUTQCwmsc5jB/ldFervDP3mpRT4oVyvzxYnH3Y9gsyURTxu5vBDM6cyxgc8n9BqwZhnWr0KoDI/OxohwkfWE72c+rfoyWGcRJkGmeITjWmdJ0mzFJUCqDjjW519yIZ/tf8YSQVSj/+d4kFIXiqtd9ieCGoHgAEJsQv1BWw8VMXftHMpL1O5CWlRfxUjQdsmL4S8n4onBbsAQe95gbuPYpOPqD6ahY4Wr7CuOr5PeNBcDXnzBqO3SJRKSmDzeNKXRWr3qnTURhbfMoR4bcRzHSZRtck4TNitVb0eJxPVbdM6ntGTcuQjP42dCZnj8QHM6S1r/Ur4QkRCDwH/iRYCfJt10gPshQ92w7khtGvVu6nah9vV65ftDy084gdZ6CLTSQOWM3TdMjBXuHq8VeUqi7LX4Cf9WYcUDUVCottbpBVd7M+MEQGCg5hBeusp3x400aXfloXmpEcUSru5fVVb9y6RKvYBbA9OCFvTQqfnog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199015)(4326008)(36756003)(2616005)(8676002)(66556008)(66476007)(66946007)(5660300002)(86362001)(8936002)(186003)(41300700001)(478600001)(52116002)(6666004)(26005)(6486002)(6512007)(54906003)(316002)(6506007)(38100700002)(38350700002)(83380400001)(4001150100001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0xOKzlwcU9TQlBnT2xDVno3eFZDSDV5RzhsaFExejB2M1FOTzBiK0R6VWpP?=
 =?utf-8?B?K05GcVJpZjhhdnh2dVB6OHRTWTN3cDI4ZThpbU82SVVmUFNCMndmZGVZQkhR?=
 =?utf-8?B?MEFadWFTaTdCZS9uSW04VVZMVmh5eVV2UEJEd2xoamZiVkpETjA0ZGtBaTl0?=
 =?utf-8?B?ZEVTVThyQ0liRExtcENLa3VyVEhncnVXTVhYTjFiZllnVlhKN0w3RW5MZUYz?=
 =?utf-8?B?OWVSTkJsV1B3eEk2eHdCYmJ5eG4rWXFsVTZsRFRpTkt4eEEzMDZvOEphSThV?=
 =?utf-8?B?QkdlTEtGSzNBK0gxc3M1TGlqMFR4MTJTODVHcEdqT1J4NXdmcnVjcTI0V2tC?=
 =?utf-8?B?Wi95T2lvS3pZbUJxWGEwUnR1ZmdhVjljM3ZKV0NnamZJY1VHNjdiNmt3MERH?=
 =?utf-8?B?QjludWluVWtzNHF4RzV0VUF0SUJvYUNTcTYvYWtmakpHN1dCMXRwTmtIQU1L?=
 =?utf-8?B?NWlBTlBkSzRubkFHY1JFMzJ6My9nZjF4T21MMW4xd3d3SnhuM0w4RlpPVDdl?=
 =?utf-8?B?WlRya3pBcUJSV29IZS9wNDQ1Uk9qTDNPRkdLdFk1b0JzUUxYZ0NzWTl3dkli?=
 =?utf-8?B?a05Nc0ZvWndaK3lWZGNhWXNOTlZrK2gyUDdIckczbXpTTlUyZmhuL0pqS3I2?=
 =?utf-8?B?MU1lNGJ6dW1GcWc1eC8xL1hhVWJzdHZka3FwMEtBK3cza3FmZXgwaElTVyt3?=
 =?utf-8?B?U1ZiWHNZMHdEYzAwbVJORlZtSktiTjZmWjFHY3BvRGpLU1N2UU0rUDY3YjNl?=
 =?utf-8?B?cVA2NEhQVXFKc2FTQ0tBT1RDb0hwNkdsN1g5alFFTDlZOElJZGVSa1RBSmdm?=
 =?utf-8?B?WmpSV1lPSGd0WTJhdHl3R1hmcHJ5RVJNblhGaVFDQ0tFRUhxdWFncTBLMjRI?=
 =?utf-8?B?T3hPSytGblR2cmpBUlRqQUtyanhrblY4VlpDZjBSRjZmWWVNdExoYlpXSWk5?=
 =?utf-8?B?Z0w1SUZ3MVBXcjI2ZmpKc29vT3ZqRU42QU9VakRWdWphZHgyUUZXRlZUTmYw?=
 =?utf-8?B?ejM2endYNTV3S1drRG42RCs5Uy9IREFVV1oveEc2UjBzYURBbnJUTi9mSDZN?=
 =?utf-8?B?NVlNMU4wUVBNK0l3Zys5WFVYRGFTVjZwR1EzSDlFZTNmd1l5NjA4M2tKNFhH?=
 =?utf-8?B?cGdXa1J6QnNMUzFnRFRwcy9XV2ZteHVyUFFBUzErdmFNQWsvUnJ3ZHhtZXBl?=
 =?utf-8?B?NXo3NXhwTGtuUW45QzJMMnY3TVBMM1FQUzErV2c0bnlQNCtSMkRJUFJWOHFh?=
 =?utf-8?B?cXlkdmhaVS9ERmxQQkZmNGE3bFNwZVRiaklTWVBCeUtHTURKd1pEdmxhNEcy?=
 =?utf-8?B?MjUwcE4wbGJYRjRVcHhaeVkvNmdrdllid0YvTlNOVTdqTEZZcVZBNFlhNEdH?=
 =?utf-8?B?UWZKL2svTE1FQUxBWGliTGh6dlFxV0dtbXQzSFB1WnNxdlFrWGhpeTYxOHpP?=
 =?utf-8?B?dS80SlZFK0NSZkZkVkIxdjBMUDVZYi9ZRWs0U1ZNUnAxOEJkVEpQVEg4MzNH?=
 =?utf-8?B?ZkFpKzRUWGxZQ3NEeE9yYmxZeks0QVhmbjg5WUJ2aDhkYnpWMVVvenJrR3Ro?=
 =?utf-8?B?dlJ1enpWSkhhL0lCdmlvL0xhNFRoR3BtMkdhZXIwK1VEcTQwbG05Q3RjUVRP?=
 =?utf-8?B?d3FKbkRKcDhCdUUwNDlKQSs3b0I3ajVFWldxb3ZOWmJkaG4xdENsRTB1TEVu?=
 =?utf-8?B?eGRibm1VajdXdGRKU0lOWVp1QUJFa3Q1U1B5U1dNSDNnZW1UMVcxcVBJa2FS?=
 =?utf-8?B?WHpvYzh3dHJxVEQ5dnZQMGdkM2IzVVd5R1FBRHlqamxmQzFoeWtUVnhMWmlw?=
 =?utf-8?B?dVg1MDZtdlJWSnpPR1Nnek5XRXJJZGxUYjhsSG1MM3hwcWdhK2wyRE1XWEQy?=
 =?utf-8?B?K1hvVmJiS1phdDNoTkNKN3pTczBTaFZ4cC9QbU1QMlRXUEh3ci9sSHpCY0dr?=
 =?utf-8?B?YUQxUkw2ZzhKSm81OTc5Z1dmZE5RQUt2MjdJc3dlNm5tZkZ3czZZRmJVOGl0?=
 =?utf-8?B?bk9mOURZS0txS3V4ZG1XRUlBUXM1SGVidFYyZTRnbXgyNW4zZTRESkNFdDk3?=
 =?utf-8?B?K2dLM1FlNGcvRWo2SFNSb2hXaUJOSTBUYkkzN2hUeXZodVh6cEhkMm5HbExT?=
 =?utf-8?Q?QeVTp1Dsv+kos3uQ1bYznv73f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6d78c6-604a-48d9-144c-08dab7dea3aa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 05:46:48.6082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jkz4l/8W9yisl7v50rOmHYiFzi0pk55ehK+CUO2WHEqk5pGEa1JmcDF8SgWvPiU+F+cxSrmd4vqo5jOPiGkJ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8451
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
Cc: Peng Fan <peng.fan@nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, "jian.li" <jian.li@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 2022-10-26 at 23:20 +0200, Marek Vasut wrote:
> In case the LCDIFv3 is used to drive a 4k panel via i.MX8MP HDMI bridge,
> the LCDIFv3 becomes susceptible to FIFO underflows, which lead to nasty

s/lead/leads/

> flicker of the image on the panel, or image being shifted by half frame
> horizontally every second frame. The flicker can be easily triggered by
> running 3D application on top of weston compositor, like neverball or
> chromium. Surprisingly glmark2-es2-wayland or glmark2-es2-drm does not
> trigger this effect so easily.
> 
> Configure the FIFO Panic threshold register and enable the FIFO Panic
> mode, which internally boosts the NoC interconnect priority for LCDIFv3
> transactions in case of possible underflow. This mitigates the flicker
> effect on 4k panels as well.
> 
> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Martyn Welch <martyn.welch@collabora.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 15 +++++++++++++++
>  drivers/gpu/drm/mxsfb/lcdif_regs.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index a5302006c02cd..aee7babb5fa5c 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -341,6 +341,18 @@ static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
>  	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
>  	reg |= CTRLDESCL0_5_EN;
>  	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
> +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_RANGE / 3) |
> +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_RANGE / 3),

Better to define PANIC0_THRES_{LOW,HIGH}(n) macros in lcdif_regs.h?

Downstream kernel uses the below threshold values:
a) i.MX8mp EVK board with LPDDR4
1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in driver
1/2 and 3/4 for LCDIF3 + HDMI - set in device tree

b) i.MX8mp EVK board with DDR4
1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in driver
2/3 and 3/3 for LCDIF3 + HDMI - set in devic tree

Jian told me that LCDIF3 needs different sets of threshold values for
different types of DDR to avoid 4k HDMI display issues and the
threshold values impact overall DDR/bus utilization(?), so downstream
kernel chooses to get optional threshold value properties from LCDIF DT
node.

Instead of always using 1/3 and 2/3, maybe there are three options:
1) Same to downstream kernel, take 1/3 and 2/3 as default values and
get optional threshold values from DT properties - no additional
properties are acceptable in the existing DT binding doc?
2) Check pixel clock rate, and if it is greater than a certain value,
use 2/3 and 3/3.  Otherwise, use 1/3 and 2/3.
3) Always use 2/3 and 3/3.

> +	       lcdif->base + LCDC_V8_PANIC0_THRES);
> +
> +	/*
> +	 * Enable FIFO Panic, this does not generate interrupt, but
> +	 * boosts NoC priority based on FIFO Panic watermarks.
> +	 */
> +	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
> +	       lcdif->base + LCDC_V8_INT_ENABLE_D1);

This should be enabled _before_ LCDIF controller starts to fetch
pixels, otherwise, there is chance that the FIFO still underflows. 

>  }
>  
>  static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
> @@ -348,6 +360,9 @@ static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
>  	u32 reg;
>  	int ret;
>  
> +	/* Disable FIFO Panic NoC priority booster. */
> +	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D1);

Similar to enablement, this should be disabled _after_ LCDIF controller
stops fetching pixels.

> +
>  	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
>  	reg &= ~CTRLDESCL0_5_EN;
>  	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> index fb74eb5ccbf1d..3d2f81d6f995e 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -255,6 +255,7 @@
>  
>  #define PANIC0_THRES_LOW_MASK		GENMASK(24, 16)
>  #define PANIC0_THRES_HIGH_MASK		GENMASK(8, 0)
> +#define PANIC0_THRES_RANGE		512

Should be 511? If high threshold is 3/3 and PANIC0_THRES_RANGE = 512,
PANIC0_THRES_HIGH will overflow and zero is set.

Regards,
Liu Ying

[...]

