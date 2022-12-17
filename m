Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C9B64F875
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 10:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BBB10E071;
	Sat, 17 Dec 2022 09:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2066.outbound.protection.outlook.com [40.107.247.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225F210E071
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 09:28:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyT1pPq6cFyBNbwOnuV/BaV5piNQyGZzu20k4ZPnfsJuCidXrEMx7dYnny6Rc8KOPLcSnYYGuRLly1BFdGq+ERbp5rkjAAak7Rz+dN08iiPJVEexpkO+ZqMH+QDUu/lPrLZK2cSTirUX628YTJyyfUe70WLIcmRBp5/5JP9ru720EFkwWhYp7sjf+i2UEQep4YrkyCisfHmPzQMU+vVgJbpJHgnjHyjKAkbp24Cw39fIRN/EGqYbDPwZXv53k0QxRYOXej7vsxFCGvmYhKNqizVaSsj0GI9RYkA/omPvjVc6XMHZDsOsy/ZJEb5oRI3pessoWBxKffBF37eOS9C8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/e7Jl9gfNxXsSBapt6K51q8N9+MkxvfMcAs623BIJc=;
 b=anjKurZSCbmEEW1esYpSUSVGqbyMr74iTU5tfJpATWbCknKb+qMWxhcaRpgf1w3tJ+FGeTDrVFrJnDKfXWU84PoduDwGL0q+ChyU0qWDW5yBaO7qh0cR7WUIegeNmlaBVFiKAv7a95PyHdGtiQdJzm1zV48w4BWlUNTeJ7AL6to+fBp71FlRapvL/yfAYy06UdGZbV7JItFJ7J0fRcBYhn0Ptvd29VnibhYmB6QKCw/mmtvWU7A1C3K8lugvEpC5k3c1a0QPppc6wusxqBOfF4u2MLGQe4vuU4z6nsYJVlyDZXBcIladLlJDcV5V8mL6LaTbnA1LKjMHV0rxW+ZPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/e7Jl9gfNxXsSBapt6K51q8N9+MkxvfMcAs623BIJc=;
 b=Xpon+xToyj8NvaXrDkmZ+pKbMS9RzQv2hSEHnMuON9m4BtgbCOexybuYrDKekp9H+OJqBDrjMouBrYK2QL8UTT8sBp2q40c/PehKDZl2tD/tEIRiHZmWUK3RkEuiVf94OEC25TdZE1sT/ziwxkzNbMCyXm2GhnwPlYw60InvrRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8832.eurprd04.prod.outlook.com (2603:10a6:102:20f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.21; Sat, 17 Dec
 2022 09:28:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ce5b:991d:5f5e:388]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ce5b:991d:5f5e:388%7]) with mapi id 15.20.5924.016; Sat, 17 Dec 2022
 09:28:16 +0000
Message-ID: <ee1008626f38e90b98c56a4eabcb615e6dcb3653.camel@nxp.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
From: Liu Ying <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 17 Dec 2022 17:27:40 +0800
In-Reply-To: <20221216210742.3233382-4-l.stach@pengutronix.de>
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
 <20221216210742.3233382-4-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ff1d6e-0f1b-4ed2-6f94-08dae01106bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ghmdTb9b1NO2vO31IKbaxbJ6QkQO8flIjheG9sVII01AXsoLgO+OFsy7qlP3ibYR4LxPJK4qG+WebqIh5uu1SXY/uAmVihFQF6J51ECSI0k2vCRO7IsVoWFVoGbe2NY7d2SM5WTnbFNnHpuukdZl5z4l3DMdBBwRSerjjMcQKO/fSA8ybyVlvImrLb2pHRtZTsW8B+BIK5kbyQw26Ecbr72wyq9U2evmjwIA7CtG11tmI7DM2ak7okgngBuhIwPYklgvAUjgy1ZTCpPazM2VQy/S9RmM0aFNtY1JFqP6f8ZobDlaVTNdMv5l39Kz69AXOJ+xqGn7TrJANWkuUfO4ZGLBSTQkaZeCes4K06wpyKCJ1c96LG3m73BIId9qkjTU9gec68mW5f7oHL5+wxmR9P3yWIHEh4uK4SDako508oNcgNKOJ7jbZKpgZGc7FXxpbZwxFnp5J9yyCj1pT3HM4Xk3Msq/5T8xEFPoWXqkmRk2xfmWo01AyZmcp8hBR4vGu45WcHm0Vj8aL1OU38eIAq1Pk4YqEbSjr1Cw3fg6sBcwKZcQhDvUZl7f1/7jER0MiOQlM58yUixGhCbQL6C3VA9d2eyO0FjEsXEcDfuHxATsn7Bmeslg7ud1XheF7hW6enCG4bZU3O66wdZjhM/ECJhFmF/wAgl3wJehUugkc73/8Z9kaEP77eDn+j8o2tG1UBkVUAV2bZNwTbZPJEExlLHgfQYuQ45kcAwrEWvSueg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199015)(4326008)(6666004)(6512007)(186003)(8676002)(66476007)(36756003)(6506007)(86362001)(7416002)(83380400001)(316002)(110136005)(66556008)(66946007)(2906002)(4001150100001)(2616005)(54906003)(8936002)(5660300002)(26005)(478600001)(41300700001)(6486002)(52116002)(38100700002)(38350700002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVJMVWFaRnYxSk02WkJtOFJ3TFZxK3NLQzZJc0ZMbTJxK2tmQ01Ma2FHc3lz?=
 =?utf-8?B?RC9hZzZLTDEyN29RWCtLZGxSMFZxWEl5K3BxWmllY3NlVXlxenBlZUVqRlg5?=
 =?utf-8?B?K1Fyc2dyUGJJNW1yMUdSdUcxVDdSL2Z1cGYzOGF0QUhtTXhqN0VROW9tMElu?=
 =?utf-8?B?YlhmdldPbjVQZzBvQ0Rta1AvdzF3b3NwK0JpR3hxTnVIT2JMSWV2MTZFZ0l1?=
 =?utf-8?B?dXd4MU9LR29Wc2lkbXV3WEhneEZqUHFGNGU3dGdLN201eDBuMGxqd3RzeXF4?=
 =?utf-8?B?KzdZT0FoVHA2OWdZa3lwUWN6UzFhMkE3SFRTK051UStjKzRqQU9jTW9PQitv?=
 =?utf-8?B?VEFRK1JTWU9tZDBIa3N0WGRvK25IU2hpRjBrYjhEVGhVNDh5UXgzMW1qMlE2?=
 =?utf-8?B?MjkrTGhhdHZJQjQ0TDdoQ0s2ZFhKcFdsWVJSSU8wdy9GM0tpcWxHYlN5RlBa?=
 =?utf-8?B?aExNbjdMdFFvM1NpL2lxL0l5cm5sbTUwdjBEOHNqenBvaHFyRkdGZEtyM1U4?=
 =?utf-8?B?ZHh5R1dKbmNRZDZOd0hMaVVNczZpanRhRnRIcFJHRXlQNm5KSUFTUHJRT2Np?=
 =?utf-8?B?eDdYcCtEcVl3S0VIMzRjSjkzSFBoWXhpRWN6UnRDSWcyMzMwMWs0Y0pyYmlW?=
 =?utf-8?B?YnVKVFpxUnFVa0dSQit5WjBzSUFna3lUb09nZWFtaVdyU2dUNm9YM3F3bWc5?=
 =?utf-8?B?bWxqanZaUWRSRVI3QVFnZXk4TzRMQjVJNEV0dmhiVVBoeU1XZk5RLy9sTCt2?=
 =?utf-8?B?OVZLeStmYlRuelNXa3oxM1VJQlFEVDZTa1V1OHd0U0trS1UwMjhCL1FQcGt4?=
 =?utf-8?B?UmV0QlBxMG1wUm42TXpvUEdTZGlEcVJ1Rnc1RTFBTWlJYjZKZDkyZ3hhV2Vr?=
 =?utf-8?B?M1NqSWJhd2JiN0dYM0tCSmEvTk1MUzNYY1hmWGZLWm1uQkhTTzBoUDM5c20r?=
 =?utf-8?B?ZFU1cEo3L2VraTZZV2RFcjdKaElDc0JmUkVCQjBlMDRsSG5qRWVhekdLOFFr?=
 =?utf-8?B?UUNpVlpYWCtwTHFBMWQzZkN0aitSbkR6WmlyRCtwNjZ0TUFhUXQxdE8wMWJu?=
 =?utf-8?B?SVExaENxdHR3Q2FMMEowTEp6Z0VMai9YSDJudEwxTWNUZmlsS3ozOElLMUtS?=
 =?utf-8?B?cWlRaFlFdWZPZWkxUFY2VnBqMDl6N3JwNVp6V0xEYWM3SHFDRjVsTEZZL3NX?=
 =?utf-8?B?Y0RyVnNXakd0ZHVJaXNyeHJqMnlYQXBMT2E3aHJabml0SUFvNUwveXVFd0F3?=
 =?utf-8?B?UURoQjE5TXh0d0FJTlBjbTU4bXZwYkMxUjVjWDB0bFZKRnRsS1BhckVybEFD?=
 =?utf-8?B?eWs1RHBwT29XTHZhYWZuMUFRTHBKQW0xUk1Db0RRczlXamgwQTJob2llZEt2?=
 =?utf-8?B?ZnNaUFZCeDhBV0N5VWlUbTFpM0NRN01XUitmN1NzclgwTkJvYy9Pamp1Kzhi?=
 =?utf-8?B?V09DTjVoY1FkYzRINXhXOXRxMlhZR0RocEhFWjFtU0tYY0U5a0RsUnc5Rzdz?=
 =?utf-8?B?a01GS09DdDBpK0VJVmNkZ042SGxLNTVwTjNJT2FUSHhUWnNWYlMyeW53Zmxy?=
 =?utf-8?B?bDlwZFZmTzNrU2ordW1zY09UbnAwdkh5K0N0Nm9Vd1ByMXNKbnVKWDNON3Rz?=
 =?utf-8?B?bDF6ait2QTlhSllwcU12enkvUGlGTHE3Mi9BYmpqVlMrV3NERndCVWtUaWFm?=
 =?utf-8?B?YThJeVEyUU5XaXlWallmSVRTNEErYkN6QmYxVzBqa0kxSWFqNFA5NmZxSDY4?=
 =?utf-8?B?NjBBVE1XbXNXTkNvcm1PQ1o3MktNa2t1UThiQUxTR0ErUXM1emQxSUJWczFi?=
 =?utf-8?B?MG10dXJoVkZXaW5RbVJ4V0M3NG1PKzYyT0gwb3gvNHFZenhKNFRXWTVpbFhs?=
 =?utf-8?B?RGVJZlFIdENsekdvOFcwM1BmNmdJVEV0L0xjUnhWYk9PeXdyaEsxOGlxcHhi?=
 =?utf-8?B?Slo2Yzk0MFJ5Q3c1ZDhmZFZ4dnVSSDc0aVJ5RGpUbGxZSDRMZHY3QUM5Q1Er?=
 =?utf-8?B?eDBhQ1plTEd4N3dKSXRYcEZILytBMkcyOGJ5TmcvYmRuQjZOTTM5eC9aeEk3?=
 =?utf-8?B?bVIzT1YwMGNZcUZyKzVWYkEydVN4OVNadFZRQnVDK3VFc1BzaStGWk1QRnZB?=
 =?utf-8?Q?2+VP0hXPEeQUCZoPl6Zd7/S4m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ff1d6e-0f1b-4ed2-6f94-08dae01106bc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2022 09:28:16.0924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XT1Jufch3NddIgNrbUSfLNdpzzHXIoXCvyVPkmnv9xRasRgcN61TGF1jhKDzmk/RvTUlbUWh12EC3Caa234D0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8832
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Sandor.yu@nxp.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, patchwork-lst@pengutronix.de,
 NXP Linux Team <linux-imx@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-12-16 at 22:07 +0100, Lucas Stach wrote:
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It
> has a
> full timing generator and can switch between different video sources.
> On
> the i.MX8MP however the only supported source is the LCDIF. The block
> just needs to be powered up and told about the polarity of the video
> sync signals to act in bypass mode.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Marek Vasut <marex@denx.de>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig           |   7 +
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 202
> +++++++++++++++++++
>  3 files changed, 210 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> b/drivers/gpu/drm/bridge/imx/Kconfig
> index d828d8bfd893..e6cc4000bccd 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -53,4 +53,11 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	  Choose this to enable support for the internal HDMI encoder
> found
>  	  on the i.MX8MP SoC.
>  
> +config DRM_IMX8MP_HDMI_PVI

Sort the config names alphabetically.

> +	tristate "i.MX8MP HDMI PVI bridge support"

Add 'Freescale' before 'i.MX8MP' to show prompts in a consistent
fashion.

> +	depends on OF

select DRM_KMS_HELPER

> +	help
> +	  Choose this to enable support for the internal HDMI TX
> Parallel
> +	  Video Interface found on the i.MX8MP SoC.
> +
>  endif # ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile
> b/drivers/gpu/drm/bridge/imx/Makefile
> index 03b0074ae538..b0fd56550dad 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-
> pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
>  
>  obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi.o
> +obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o

Sort the config names alphabetically.

> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> new file mode 100644
> index 000000000000..30d40c21dabb
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright (C) 2022 Pengutronix, Lucas Stach <
> kernel@pengutronix.de>
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/pm_runtime.h>

Header files in linux/ come before those in drm/.

> +
> +#define HTX_PVI_CTL	0x0

Nitpick: One more tab between the macro and '0x0'.

> +#define  PVI_CTL_OP_VSYNC_POL	BIT(18)
> +#define  PVI_CTL_OP_HSYNC_POL	BIT(17)
> +#define  PVI_CTL_OP_DE_POL	BIT(16)
> +#define  PVI_CTL_INP_VSYNC_POL	BIT(14)
> +#define  PVI_CTL_INP_HSYNC_POL	BIT(13)
> +#define  PVI_CTL_INP_DE_POL	BIT(12)
> +#define  PVI_CTL_INPUT_LCDIF	BIT(2)
> +#define  PVI_CTL_EN		BIT(0)
> +
> +struct imx8mp_hdmi_pvi {
> +	struct drm_bridge	bridge;
> +	struct device		*dev;
> +	struct drm_bridge	*next_bridge;
> +	void __iomem		*regs;
> +};
> +
> +static inline struct imx8mp_hdmi_pvi *
> +to_imx8mp_hdmi_pvi(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct imx8mp_hdmi_pvi, bridge);
> +}
> +
> +static int imx8mp_hdmi_pvi_bridge_attach(struct drm_bridge *bridge,
> +					 enum drm_bridge_attach_flags
> flags)
> +{
> +	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, pvi->next_bridge,
> +				 bridge, flags);
> +}
> +
> +static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state
> *bridge_state)
> +{
> +	struct drm_atomic_state *state = bridge_state->base.state;
> +	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
> +	struct drm_connector_state *conn_state;
> +	const struct drm_display_mode *mode;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector *connector;
> +	u32 bus_flags, val;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> bridge->encoder);
> +	conn_state = drm_atomic_get_new_connector_state(state,
> connector);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state-
> >crtc);
> +
> +	if (WARN_ON(pm_runtime_resume_and_get(pvi->dev)))
> +		return;
> +
> +	mode = &crtc_state->adjusted_mode;
> +
> +	val = PVI_CTL_INPUT_LCDIF;
> +
> +	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> +		val |= PVI_CTL_OP_VSYNC_POL | PVI_CTL_INP_VSYNC_POL;
> +
> +	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> +		val |= PVI_CTL_OP_HSYNC_POL | PVI_CTL_INP_HSYNC_POL;
> +
> +	if (pvi->next_bridge->timings)
> +		bus_flags = pvi->next_bridge->timings->input_bus_flags;
> +	else if (bridge_state)
> +		bus_flags = bridge_state->input_bus_cfg.flags;
> +
> +	if (bus_flags & DRM_BUS_FLAG_DE_HIGH)
> +		val |= PVI_CTL_OP_DE_POL | PVI_CTL_INP_DE_POL;
 
Downstream kernel driver sets bit20 & bit21 to insert background color
when something wrong happens(maybe, it may mitigate the issue), not
sure if this driver should do the same or not.

> +
> +	writel(val, pvi->regs + HTX_PVI_CTL);
> +	val |= PVI_CTL_EN;
> +	writel(val, pvi->regs + HTX_PVI_CTL);
> +}
> +
> +static void imx8mp_hdmi_pvi_bridge_disable(struct drm_bridge
> *bridge,
> +					   struct drm_bridge_state
> *bridge_state)
> +{
> +	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
> +
> +	writel(0x0, pvi->regs + HTX_PVI_CTL);
> +
> +	pm_runtime_put(pvi->dev);
> +}
> +
> +static u32 *imx8mp_hdmi_pvi_bridge_get_input_bus_fmts(struct
> drm_bridge *bridge,
> +					struct drm_bridge_state
> *bridge_state,
> +					struct drm_crtc_state
> *crtc_state,
> +					struct drm_connector_state
> *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)

Please fix the checkpatch.pl warning with --strict parameter:
CHECK: Alignment should match open parenthesis
#151: FILE: drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:99:
+static u32 *imx8mp_hdmi_pvi_bridge_get_input_bus_fmts(struct
drm_bridge *bridge,
+                                       struct drm_bridge_state
*bridge_state,

> +{
> +	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
> +	struct drm_bridge *next_bridge = pvi->next_bridge;
> +	struct drm_bridge_state *next_state;
> +
> +	if (!next_bridge->funcs->atomic_get_input_bus_fmts)
> +		return 0;
> +
> +	next_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +						     next_bridge);
> +
> +	return next_bridge->funcs-
> >atomic_get_input_bus_fmts(next_bridge,
> +							     next_state
> ,
> +							     crtc_state
> ,
> +							     conn_state
> ,
> +							     output_fmt
> ,
> +							     num_input_
> fmts);
> +}
> +
> +static const struct drm_bridge_funcs imx_hdmi_pvi_bridge_funcs = {
> +	.attach		= imx8mp_hdmi_pvi_bridge_attach,
> +	.atomic_enable	= imx8mp_hdmi_pvi_bridge_enable,
> +	.atomic_disable	= imx8mp_hdmi_pvi_bridge_disable,
> +	.atomic_get_input_bus_fmts =
> imx8mp_hdmi_pvi_bridge_get_input_bus_fmts,
> +	.atomic_duplicate_state =
> drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +};
> +
> +static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
> +{
> +	struct device_node *remote;
> +	struct imx8mp_hdmi_pvi *pvi;
> +
> +	pvi = devm_kzalloc(&pdev->dev, sizeof(*pvi), GFP_KERNEL);
> +	if (!pvi)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, pvi);
> +	pvi->dev = &pdev->dev;
> +
> +	pvi->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pvi->regs))
> +		return PTR_ERR(pvi->regs);
> +
> +	/* Get the next bridge in the pipeline. */
> +	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
> +	if (!remote)
> +		return -EINVAL;
> +
> +	pvi->next_bridge = of_drm_find_bridge(remote);
> +	of_node_put(remote);
> +
> +	if (!pvi->next_bridge)
> +		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
> +				     "could not find next bridge\n");
> +
> +	/* Register the bridge. */
> +	pvi->bridge.funcs = &imx_hdmi_pvi_bridge_funcs;
> +	pvi->bridge.of_node = pdev->dev.of_node;
> +	pvi->bridge.timings = pvi->next_bridge->timings;
> +
> +	drm_bridge_add(&pvi->bridge);
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static int imx8mp_hdmi_pvi_remove(struct platform_device *pdev)
> +{
> +	struct imx8mp_hdmi_pvi *pvi = platform_get_drvdata(pdev);
> +
> +	drm_bridge_remove(&pvi->bridge);

Missing the function call for pm_runtime_disable().

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id imx8mp_hdmi_pvi_match[] = {
> +	{
> +		.compatible = "fsl,imx8mp-hdmi-pvi",
> +	}, {
> +		/* sentinel */
> +	},

Nitpick: ',' after the sentinel is not needed since it's the last one.

Regards,
Liu Ying

> +};
> +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pvi_match);
> +
> +static struct platform_driver imx8mp_hdmi_pvi_driver = {
> +	.probe	= imx8mp_hdmi_pvi_probe,
> +	.remove	= imx8mp_hdmi_pvi_remove,
> +	.driver		= {
> +		.name = "imx-hdmi-pvi",
> +		.of_match_table	= imx8mp_hdmi_pvi_match,
> +	},
> +};
> +module_platform_driver(imx8mp_hdmi_pvi_driver);
> +
> +MODULE_DESCRIPTION("i.MX8MP HDMI TX Parallel Video Interface bridge
> driver");
> +MODULE_LICENSE("GPL");

