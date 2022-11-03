Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCD2617961
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 10:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C17B10E5C9;
	Thu,  3 Nov 2022 09:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80042.outbound.protection.outlook.com [40.107.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC85E10E254
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 09:08:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjvoCjpJI7Rz9DJGx2jEgLYyNid2xK6rIvc/U3a3XB/S/dVuOZyna3y245pNycH4EcaFxeZaMIxvN189A1SFGFNyI+8Vw2b3BkqEfOL3s3LOtivlfSRQNyQfdH89V6TjpzLv9jriIcYR0z6CnYNV7Oc+IL96JnpAZplA13OKHe8UgWClWdS3rqIHnRdqBlYjoxCRL0TUPVlI4Uda0QtemGhUeskrdcWxTBTFkIHqGxKFh0+FZS5AVRjCanyOwGfk7JrKdZuQC9QjulGvC+So0Z6XFPGm2q9lAbz74JgnjE144P74nZrb57BXcW5Z2j25lTqhVx+tseDVApVQLKrNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsqiXveQapu7iU1qnUQsoxJaGptG1hb09Wcp6DbrpbQ=;
 b=NXMhl1+vhRqAAw4I42WM8nVrn7hifO7X7p+FMh53u7jzS/5lM4whcHbDHwiGdyAfvDWb2qQ82+u90LFZCLl5IJwyinRXD+c7lH4W8AjrVvf/D+rsx8fQQp0VLgM2UXCz+lUvuioVcXBmAhhk73Esxqb3DYp1LzuxOt4bX3dwFpn7NWsHr/2nQDeYidxwj1qpgYOtt9AavJGbTCj05XnB8UmPNFqNU93xF46zJn+cZrfGqiLs/xI0dLYs+LXHsvdFXv2UMlLHemFlS4fJta+PVazmlMCyRi/FK1Bwwd4QThN1gWyBf3kRYjr7G6KZCHl9A1tCeqZpQp7bTUrrW3HpoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsqiXveQapu7iU1qnUQsoxJaGptG1hb09Wcp6DbrpbQ=;
 b=gMljllSegHtzHRY8C5RlRBKgtiKp4mkoEASN6dG5WjkeTRNk5OPkA95YA04Y042qYeHIus/i0zWzp/5d/+NhSco/L9pf+A5lRKTOiFmqZBprFGVkwCLGMt6Xlg5gvbKQnpZzQ+X2Xk9Qpx9DEwMSgXd8FLPA3UFojuTL+olKtgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9639.eurprd04.prod.outlook.com (2603:10a6:102:260::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 09:07:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::dcca:b62f:206b:dcf8%3]) with mapi id 15.20.5769.019; Thu, 3 Nov 2022
 09:07:59 +0000
Message-ID: <d76e1265b0a32de599fa689253c2d3c1ded84553.camel@nxp.com>
Subject: Re: [PATCH v2] drm: lcdif: Set and enable FIFO Panic threshold
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 03 Nov 2022 17:07:22 +0800
In-Reply-To: <20221101152629.21768-1-marex@denx.de>
References: <20221101152629.21768-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:4:54::34) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: 4babf639-e439-4b96-0a3f-08dabd7ae74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UqevZ1vP4kYYGtNlMlbu+yhH42as8ORICfFg/VyYm+CfQjL8uSgg+hnSXLH4Yxu11QmfCA6SGSdJQGgEB8MT+WIooyPJBg9DkGrHvMWGFhoPc/pDOGbcXou6HC4cGjHuekQv4zHioI1OqkJNfrAouVwDljwC/LXsiSDFRR2g2xbYJZCHIxAoFA7jF9evyIHecLv6JBhErqoguk17M78Xs4c6+g/jyC5Xp3/FCcQgfyVQGUf1iedT7kuEnXcWnVwrr23NIaGbPOr0AtTfI7C5XMC+6b6H10gqVtBlWsKjhOA64m9qyoubm2cU5lh60GMWIxtX4Nerpv0ILZakDuVUs5CG3UkeTjZD7Hg5y+epXQTwR8yBVRqetLdV1ViFJ5I5Op8cDb4VoipSaMD3/nHmwvAtDiGC6n3PHc3KOSionp9LmQ8WQJVpkrfNCvCcEJhkHb7lfb6+SkbZJiG3+gXXZErwMAWGrStoIwOxfcfvN8BHhnii9P5KDBQxKaFZxQi10U0OQ3YnuDIYKsabXKjN2Nu2sBcYSJEJ0Ayko3pWhZl4fH1n2Y3uXCgDIgobjjHw7GtsGT2aFx4Zb2E00zuLWQBSw29fDz0QFPz46sqWbCdHN2ToqhvSyVZVgos4dw4hRT9utBO/MrXpErbQmIDWouPeMq/ZiIhU713skJskLykG418k7h+8xHUsv3jz74CwFjggORp+Q4bUZTGhoIsYt0jO2vzAJ7DzD1b1jV8MUPNteZO/9k29/w5zJhj3iaYHiFIvJYhz79gApgDr41zM+/iFihUzdkJY5WuIvyXKWig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(5660300002)(478600001)(316002)(4326008)(66476007)(2906002)(186003)(54906003)(66556008)(36756003)(6506007)(52116002)(8676002)(66946007)(41300700001)(6512007)(8936002)(2616005)(6666004)(38100700002)(26005)(86362001)(38350700002)(6486002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3dLaHQ1REVqaVlMSGhPRThDQUVzQjZDckZ4NFBjMThBN3pUb0FHSUpXNnYv?=
 =?utf-8?B?anlQdTJjdkFuQUJPQXFHV0l2ZUlhUkxWbnhjMlg3czdrUGhVWHgrMG5iUnlt?=
 =?utf-8?B?S2JyR3RSV0pRRWFTYjA5SWVTV2FjKzIyeWpaU2plZ0VLZC9xZE5lTzFqNW56?=
 =?utf-8?B?OFpuQXFhNTl0WEVIajdycEY4NTUxL1U0QXp0cE9IS0RyV2VJNXhBSFpmM2li?=
 =?utf-8?B?YmdGeW9vUXNjWm5PNWJmTExlUU42VzdMTFlENWtxMkFNM3d6TWpzWUp5SmRB?=
 =?utf-8?B?NHlmZ0tvV1FLYm1jY25oSzdBTmpkK29ZTWtPQ0I3WW1icENWL2hEOStVZkJ2?=
 =?utf-8?B?Z0sxd1A3VUt6OFFTZmFPK2toTWNpSXhRWVBha1BNallxR3RjdlI2QnJKWks4?=
 =?utf-8?B?M0ZGZkgzSHozYjVXMnVNa1hjcldjc28yUFpDZGNHWUJmWUxrWmNiWFp0eXhG?=
 =?utf-8?B?WUJRcDFnaGw1RnZUWUZwWm1yQ3QzbVZlankwTTh3VlF0bDNQSUtCdnhzdWJX?=
 =?utf-8?B?SEtxdUZVVUlBZm9vNzlKQjk3WWxBbzBOVFlJK3hTQ09vMHVjeTFPT0N6cHRI?=
 =?utf-8?B?Mlp6QmpXaVArRTVwSi9XWHB5c3Y2b0gzSW9uMllHb3RxTkhWdUFLTGJIcmk5?=
 =?utf-8?B?NVpuWm14SXpjWkw4NlkrUjNJb2FYY0ZoV1hld2NiYmNyVW13SWV4aWF5YzIz?=
 =?utf-8?B?clROQTEyaC9pS2IxYndmblZjMisvVExnOXY0SzkwbGpCTS81L2w0NkZiOUhB?=
 =?utf-8?B?VjcrZWRNS05lTTkxZVZGSzcra2hPWUJEcXYwQUcwUXZzSmhCTjJFa1hRdTRH?=
 =?utf-8?B?Unp0cXQ2U0crN3dYblVIMjZ2ZWsvZUN5VVhyOHFOL2V0MlR1VkwxSDJSZ09U?=
 =?utf-8?B?VG81ektPM1pMWU9mY2pXdmt1Q3JnR3NpOUJNbnFxUEkrUnlmcWhGWngrRW91?=
 =?utf-8?B?Ykp5ZVFpdzlSdUJ1c05kWFB5WE00SVhBZnNRL1E5Q1JpOTVXRWxmY1dTSjFR?=
 =?utf-8?B?RXY5L0d1dTlrMEF1UVJGbC8xNHdrd2VSbDRxRmg5c1BvR0J4UFJFYUp6RmpI?=
 =?utf-8?B?cy84V1kxLzBia2hTUVFERk15MnNPaUdHTldzODlXamM0V3FOZHJHN3k0Wkxz?=
 =?utf-8?B?SHN3VGJQYUE0MFh1TzZZbDdGZ1ZUbUJpQTU0aWNLNHE1blVVY2F5MWtsOU1H?=
 =?utf-8?B?SE1rb3QvK0RjVm12d1RtendBdTBiR29LVDdVYXpuY3hlYVFHVGcvM0hkUVM5?=
 =?utf-8?B?YW1OR0dsa1lobCtTUnlnMm11b09YYmtXdnl1UWtQaDhaSjdaVS95Zy9Fa0ZP?=
 =?utf-8?B?V1BLbmp5aUxOdCtEN2c5dnBPZGVlb3FOZmRDZGx4NElGVHpRUDgrcUFZR3pw?=
 =?utf-8?B?bExvaGFWcXBrVkJ4UkpSd3BXYloxcjhMZGoyL0RpcnRsQ3BYSDEzcEdZOEVS?=
 =?utf-8?B?MHpRcndBYlhMcW9CeE1vdVE4OWVmTytYTGVyV2FVNytTc29jb3NId0dBdUVY?=
 =?utf-8?B?YjZjNTcxYXZsdld3SytwbWFVQnBvaDhjVEFVNTdTRUVEc3FXNkJVMHFuUUln?=
 =?utf-8?B?Sk9OaktjMDlVTG5ieStBZVA5OWZlcHpwamtJd0RnL25UUFBkYXBDMlpNbE5R?=
 =?utf-8?B?cW9FYzNmaHlKdmROSXVsdkNKNnNXakF2cmp6czdYdHJ1ZjR6ZEpHM2h3WGVs?=
 =?utf-8?B?bzlJTUhLeWlld1Z0czRhRFR1WnZkcXN0SncvL3M3aXIvVUpSSDRmeXFXVXRv?=
 =?utf-8?B?NW5KUXVrU3FUL2pxUjdTeVd6RVRtU0sxMGROS3hkNVN6WlRscU1TdEtHM1Uw?=
 =?utf-8?B?S2xjeU9ZZW0yOUw1YWtDZjZ0c2p2Sm5aMWZFTjFEZnpqSWJTSGxnK0ZWSGQz?=
 =?utf-8?B?VFZyd21ueTJZbGhWU1NoUENvUXh6anAvV29aUFU3dDlRQVM5MVVGaEkyamNC?=
 =?utf-8?B?S0xjVjZ5VG9xb0JUbkRQM1BNR29HTktrbExTQTZlU0NHTEYxV1J4SHdPc3R0?=
 =?utf-8?B?aHdqTnN5MThzNG5yb25TM3IrNDJGN3VhK01GVVJLOURtajJkYVRlSnd2NDFw?=
 =?utf-8?B?QWFkY2xDa0pXYTRpTmFuVm1UTFRpdXBnTUM5N09aY0pOYjJqeitnRERxNkdF?=
 =?utf-8?Q?IAR+O4/ALi/Dy5GihEPDNLBs9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4babf639-e439-4b96-0a3f-08dabd7ae74e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 09:07:59.2055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkL0b8ZqfLmmEM1/i607nxlwmNPyFZVoI0O8dSVj32Oe+xt0sIqujtpO8KsfdyXTfA7qNjwgFweuj2lxgIsK/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9639
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
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-11-01 at 16:26 +0100, Marek Vasut wrote:
> In case the LCDIFv3 is used to drive a 4k panel via i.MX8MP HDMI
> bridge,
> the LCDIFv3 becomes susceptible to FIFO underflows, these lead to
> nasty
> flicker of the image on the panel, or image being shifted by half
> frame
> horizontally every second frame. The flicker can be easily triggered
> by
> running 3D application on top of weston compositor, like neverball or
> chromium. Surprisingly glmark2-es2-wayland or glmark2-es2-drm does
> not
> trigger this effect so easily.
> 
> Configure the FIFO Panic threshold register and enable the FIFO Panic
> mode, which internally boosts the NoC interconnect priority for
> LCDIFv3
> transactions in case of possible underflow. This mitigates the
> flicker
> effect on 4k panels as well.
> 
> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF
> variant")
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
> V2: - Include bitfield.h to always obtain FIELD_PREP definition
>     - Rename PANIC0_THRES_RANGE to PANIC0_THRES_MAX and set to 511
>     - Move threshold configuration and enable before FIFO and
>       scanout enable and vice versa for disable
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 16 ++++++++++++++++
>  drivers/gpu/drm/mxsfb/lcdif_regs.h |  1 +
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index a5302006c02cd..09280c6c3bbc1 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -5,6 +5,7 @@
>   * This code is based on drivers/gpu/drm/mxsfb/mxsfb*
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -334,6 +335,18 @@ static void lcdif_enable_controller(struct
> lcdif_drm_private *lcdif)
>  {
>  	u32 reg;
>  
> +	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
> +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_MAX /
> 3) |
> +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_MAX
> / 3),

Like I mentioned in v1 review cycle, I still think it's better to
define PANIC0_THRES_{LOW,HIGH}(n) macros in lcdif_regs.h instead of
using FIELD_PREP here directly.  Otherwise,

Tested-by: Liu Ying <victor.liu@nxp.com> # i.MX8mp EVK
"koe,tx26d202vm0bwa" LVDS panel fb console
Reviewed-by: Liu Ying <victor.liu@nxp.com>

[...]

Regards,
Liu Ying

