Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49AE327A64
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 10:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A43189F3C;
	Mon,  1 Mar 2021 09:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60043.outbound.protection.outlook.com [40.107.6.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF61B89F3C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 09:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPM1G9zVk8S00xjkbG+rNxKPukI5WPJUxyG1rZ82sVvHjmJpUNDGAliNUZTSXDjGuM8snw5a9UROXFo501Yq5Ovb+mBhjFp5lVosBG1HQqRkIhQwNsmuxARcRdp3jUrnWQ9uiK93Wv9J5tUzAmG9L7Th6mSJZ4Rjpj8gqvcs2auA9uvSrz28C6TC+YrnjhJuw9gEn3FUN/++Y2NOYkOzWBBhmDPfUSiLUYvO2tZoRHDa1JyQXubySAwA3KkOO4T/zVGEJCRisoGWR+IgSi1jwY7UTSsDmjxOpk6x/cpjaf5D2AyE5S6wku0nP3jXsgjYR4iyYPIBPjBiWSCSeRzxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arTBBYK2nwNnuLhkN5YZZmaM0fcmMHdmM1mHezooyyk=;
 b=U3ivHis8iNKeBt3Py/jfRbp/StFtPuAwzzYJ3wZatnTquurPvlPn46uJbUEfcIlRdS2ucaaPYljpZ2+Dx1kbae4VPC8D3j+gs1IaVSYWI47M18fZ4xzJ5FcN1cHP8tA/JQvp6uPtQHMMf0H/ZclEE/7B+6Xv9iFGHFRNkzE9VkbhmdAdyqhP46ndDXn9Qj7EyAQ3Yv7PNxkCBmpVCFl9QwvlqLl5mkd97htX27Y97jqciGSjr+DU/oH4ySsoQx/1urOOKyXVWnp+7DDglJNtDM9aiHm8JRHAWW/RdPkppoN08pL9wZcIRMxi94xjiUNcqCp2jhHbSFZLU8gJfT7SUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arTBBYK2nwNnuLhkN5YZZmaM0fcmMHdmM1mHezooyyk=;
 b=Aqia2NEHmlfwQmhlCCgIkXkSq4xcU6yxakbKhfJwDoPww0DV3Lp9E2nSFUlLK9wMWjYaG8VmMx/dOjoug0OjaP6jaqjFybwEBksptQKIW9BlRc/5B6MdYQcvu8roBdKlAtH4XrSCqDAcQPwku6+bAakKteAFWREYdwkLz7fALhY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5871.eurprd04.prod.outlook.com (2603:10a6:803:ea::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 09:07:15 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 09:07:14 +0000
Message-ID: <1ea2261315c8e744ca60a66403c78a3c551d04fe.camel@nxp.com>
Subject: Re: [PATCH v4 05/14] drm/bridge: imx: Add i.MX8qm/qxp pixel
 combiner support
From: Liu Ying <victor.liu@nxp.com>
To: Robert Foss <robert.foss@linaro.org>
Date: Mon, 01 Mar 2021 17:05:41 +0800
In-Reply-To: <CAG3jFyufawQ=0UNgfbTgzkbqCYQ7LS-BMq7mXruX470iYBXMOw@mail.gmail.com>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-6-git-send-email-victor.liu@nxp.com>
 <CAG3jFyufawQ=0UNgfbTgzkbqCYQ7LS-BMq7mXruX470iYBXMOw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0025.apcprd03.prod.outlook.com
 (2603:1096:203:c9::12) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 HKAPR03CA0025.apcprd03.prod.outlook.com (2603:1096:203:c9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.9 via Frontend Transport; Mon, 1 Mar 2021 09:07:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f94752c8-9d03-4f57-bb6c-08d8dc916755
X-MS-TrafficTypeDiagnostic: VI1PR04MB5871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5871A5420AE4C7789D17C551989A9@VI1PR04MB5871.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jU4ejbaiy+cxooMZtobM4A9xXB84W3NkSWHPfGyGi90js/HguwVRIvvGqfvIKRxc40AR5ErKj3DKuwVj9qCBbzteoBGn4iS+3W1efO/Hbm5SRARYrZEUmtcgFSmyPHNLLDmFftmjOalWC/5zSsKju+X2AArzJKDlt1QmH4eEZq64h2efPwnsFECT7s5rdTCv6XuiyasZFTzTSz6bro7cy900eLyOAEKce1R26jEKUpWzbGTtVvGbYZvI0XZCZsCnNL8eAHCKllgbxoMN/PYqAEtjCuZckkQ/r9eyWvjA/q7bieIygUAIBWCP6M23Mxn5iNa+RYAYr25WNY8Orh6bLJWL5hb+/xK4SG6dI9aA4D7jIyi6UsacO1hrD4rAEoM/3S31rJmh0IUtA8V4WL7PSrWL/tkHqIbjgrh8mGitHBgT+S8NZKa8Vh4o4ienNGv1VNmA3qGVQ3ZsTPhMwURjcQUHe/UroUe0rmMcZct03q/vP+3bvtgFj2bq3nf32blIEK8rmnWoKFGqT2KnyEBvlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39850400004)(366004)(136003)(346002)(26005)(6506007)(16526019)(8936002)(6512007)(186003)(6916009)(6666004)(478600001)(66476007)(66556008)(66946007)(6486002)(5660300002)(30864003)(8676002)(2906002)(2616005)(956004)(4326008)(86362001)(7416002)(54906003)(83380400001)(52116002)(316002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UGo5TWNtem1NOGZrZCs2LzNGK3oxelpoYkxUOWZWYmI4QjE5L281YkVrUDh0?=
 =?utf-8?B?TEZIeFlJbFExdWwwWGhXTFk3QmR6Sm5iYVdNNVgzLzVGZUFUeW1ZUzAvKzNH?=
 =?utf-8?B?NGVoL2ZuOU5GSncrWXRSQy9CVzZPNWJhRWtrVXdlekU2NDdQOEJMZmpkbDJu?=
 =?utf-8?B?L1R5aWRmUW5Xa0hUMDJtemE1S0VCSmxmc3gzSk5YOURoMlNzdE9uVnFzckU3?=
 =?utf-8?B?SExybUpzb2tJLzB5VmZ5QnVyNmZUR1NTaWFXZGNWTzczcTNwd3pBc0w1SmRm?=
 =?utf-8?B?SDRzbVRpUEYvelN0L2srcVo1K0JhdjgxMDdxVFBUc1ZBMEQzN1BHUkZRdVdH?=
 =?utf-8?B?eENNYVhyekN0b0kweTNQUUNtS1hmSkptY3Z2N1h0SlBHUGtHRTlpM2swb0tE?=
 =?utf-8?B?ejBkN3Z0anE2MW1CdGlCaFNpWGE5NnpodHJPYUJiZG5wYjMwbnBSd1hGTDU3?=
 =?utf-8?B?TDg4bXhJNFRIWXcySTFBT3VQaXVIREphbzBqUmFNQTZCSFJtZVZzTFdTTnNY?=
 =?utf-8?B?a0hTVG0xUnVlWHdNU283TnYxMU9ER2J4ZVNxVGRJcUlYTFJtbXJtOHNxS0Q4?=
 =?utf-8?B?alpxdDE5NjZLNTc2aEJ4MFFVVE1lQ2c3M1hJSDA3S2tYdFMvellBVjVQOVh2?=
 =?utf-8?B?VnEzQi92SmlHd0x3c0psZjY0ODlOdG8yWWpab1BOTExlZEpUYnJpYjJxSmpJ?=
 =?utf-8?B?Nis5R0t2dkhsN2lRT1FJWEpqNnVQNEdKOHQyN3AwWjJKRXhuSFdIVFBJVGR3?=
 =?utf-8?B?aEJnVko1cUJWcHl1bFNBMG9jdk8wTUovUU9PNDdSdW95clppVmpaR09MUTlK?=
 =?utf-8?B?d0lPREpMZEd5ZmFHeC9LNExpT3dxWXNhMnkxN2RCK3liVkdUZ2pndmhKODEx?=
 =?utf-8?B?a2srNG1XU3R2dXExUEtueFNWNURQUWErbGg4ZXZlQ2tMcG9xVmpaVUhoR1RD?=
 =?utf-8?B?ZklQWXVjQmdkSjB1NnU5ZnBQemhmdnFiU1EzSjZBV01UdWRUZGM3cVNxTERM?=
 =?utf-8?B?VUJPcDBJcXNXaERrL0J1NXUzVU56djdvb3hVQjNSbFFMRlB0VVBUY3pYZlJG?=
 =?utf-8?B?WnlrbHdXdXJHaW44cEQ2NnhUdVZRVTI5UDQzOEdRMlpFTVNCWCs3Yk1jQWw0?=
 =?utf-8?B?citDK3VGOGc0YTRYODhZNitEbkZDN0U3MkZXUjNvZXFHY2VZbVVBRHFPOWMx?=
 =?utf-8?B?LzNzQTQ3UG0vdWRFLzFiK3kvU3hiK0ZOeC9zQ08vSGZaTFZodWszM1Z4Uzhw?=
 =?utf-8?B?bzVuSm41VldJenhTVnIyOWR6UExPZkIvRHQyTmNXNDNBVzV6a3VFOWY3NTdv?=
 =?utf-8?B?YUt4RUJUNFdHa1hHdjJ0QXUzNEhtWno3Q01ndmlKYldjQVBLUjlNTkFuektG?=
 =?utf-8?B?VWQyT0pWR0VWUG5meitlekgrcmgwSTMxL2FyanZ4V2hlOENESU8vUHdpMmtN?=
 =?utf-8?B?clJKN0w3MDQrZ2FyRjR1b051R1l5dzFBOTh0R2t2NUNEc0o5MW1EYW81ZTNs?=
 =?utf-8?B?elBnYmYzVE5NL2Fqd0h1YUx6YXV2dk5kQ0FZczdVQ0N6Vm5GVUgwaXpZNGpV?=
 =?utf-8?B?YzI0SFkwR21tNDcrcldVR3lkZm56a0RjejYycWZYWjViMW1CZXNPYlhvRWYz?=
 =?utf-8?B?aGZPdHYzaW1hT3hZcHIzL2hLUVhRS0xtbXpLUEdETUM3Nmx1NUViQ002MlB0?=
 =?utf-8?B?QlNYRHBxN1EvdG1oc2ZpeWo5cDM2Ym1EbVRZejdXTS9WS3ptRmFQbUllTXl0?=
 =?utf-8?Q?Ee+wKPFpi8Jpr7yAHeduRSso+95Vpc3KOLByTIM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f94752c8-9d03-4f57-bb6c-08d8dc916755
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 09:07:14.6059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+V1UmDpYml5LKz5udQiNJcLrX2fNSSBLPOJelaWvQGFioVXVpFbbW9xlTSmXyA1iGtdHRySA9RbEbWbdVrRdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5871
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
Cc: "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 s.hauer@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kishon@ti.com,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, shawnguo@kernel.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

On Fri, 2021-02-26 at 14:07 +0100, Robert Foss wrote:
> Hey Liu,
> 
> With the below nit straightened out, feel free to add my r-b.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Thanks for reviewing this patch.

> 
> On Thu, 18 Feb 2021 at 04:58, Liu Ying <victor.liu@nxp.com> wrote:
> > This patch adds a drm bridge driver for i.MX8qm/qxp pixel combiner.
> > The pixel combiner takes two output streams from a single display
> > controller and manipulates the two streams to support a number
> > of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured
> > as either one screen, two screens, or virtual screens.  The pixel
> > combiner is also responsible for generating some of the control signals
> > for the pixel link output channel.  For now, the driver only supports
> > the bypass mode.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * No change.
> > 
> >  drivers/gpu/drm/bridge/Kconfig                     |   2 +
> >  drivers/gpu/drm/bridge/Makefile                    |   1 +
> >  drivers/gpu/drm/bridge/imx/Kconfig                 |   8 +
> >  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
> >  .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 452 +++++++++++++++++++++
> >  5 files changed, 464 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
> >  create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> > 
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index e4110d6c..84944e0 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -256,6 +256,8 @@ source "drivers/gpu/drm/bridge/adv7511/Kconfig"
> > 
> >  source "drivers/gpu/drm/bridge/cadence/Kconfig"
> > 
> > +source "drivers/gpu/drm/bridge/imx/Kconfig"
> > +
> >  source "drivers/gpu/drm/bridge/synopsys/Kconfig"
> > 
> >  endmenu
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > index 86e7acc..bc80cae 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -27,4 +27,5 @@ obj-$(CONFIG_DRM_NWL_MIPI_DSI) += nwl-dsi.o
> > 
> >  obj-y += analogix/
> >  obj-y += cadence/
> > +obj-y += imx/
> >  obj-y += synopsys/
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> > new file mode 100644
> > index 00000000..f1c91b6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -0,0 +1,8 @@
> > +config DRM_IMX8QXP_PIXEL_COMBINER
> > +       tristate "Freescale i.MX8QM/QXP pixel combiner"
> > +       depends on OF
> > +       depends on COMMON_CLK
> > +       select DRM_KMS_HELPER
> > +       help
> > +         Choose this to enable pixel combiner found in
> > +         Freescale i.MX8qm/qxp processors.
> > diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> > new file mode 100644
> > index 00000000..7d7c8d6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> > new file mode 100644
> > index 00000000..cd5b1be
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> > @@ -0,0 +1,452 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +/*
> > + * Copyright 2020 NXP
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#include <drm/drm_atomic_state_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_print.h>
> > +
> > +#define PC_CTRL_REG                    0x0
> > +#define  PC_COMBINE_ENABLE             BIT(0)
> > +#define  PC_DISP_BYPASS(n)             BIT(1 + 21 * (n))
> > +#define  PC_DISP_HSYNC_POLARITY(n)     BIT(2 + 11 * (n))
> > +#define  PC_DISP_HSYNC_POLARITY_POS(n) DISP_HSYNC_POLARITY(n)
> > +#define  PC_DISP_VSYNC_POLARITY(n)     BIT(3 + 11 * (n))
> > +#define  PC_DISP_VSYNC_POLARITY_POS(n) DISP_VSYNC_POLARITY(n)
> > +#define  PC_DISP_DVALID_POLARITY(n)    BIT(4 + 11 * (n))
> > +#define  PC_DISP_DVALID_POLARITY_POS(n)        DISP_DVALID_POLARITY(n)
> > +#define  PC_VSYNC_MASK_ENABLE          BIT(5)
> > +#define  PC_SKIP_MODE                  BIT(6)
> > +#define  PC_SKIP_NUMBER_MASK           GENMASK(12, 7)
> > +#define  PC_SKIP_NUMBER(n)             FIELD_PREP(PC_SKIP_NUMBER_MASK, (n))
> > +#define  PC_DISP0_PIX_DATA_FORMAT_MASK GENMASK(18, 16)
> > +#define  PC_DISP0_PIX_DATA_FORMAT(fmt) \
> > +                               FIELD_PREP(PC_DISP0_PIX_DATA_FORMAT_MASK, (fmt))
> > +#define  PC_DISP1_PIX_DATA_FORMAT_MASK GENMASK(21, 19)
> > +#define  PC_DISP1_PIX_DATA_FORMAT(fmt) \
> > +                               FIELD_PREP(PC_DISP1_PIX_DATA_FORMAT_MASK, (fmt))
> > +
> > +#define PC_BUF_PARA_REG                        0x10
> 
> This register is unused, keeping it in here to avoid future headaches
> seems like a good idea.

Yes, for now, this register is unused.
It will be used to set the below PC_BUF_ACTIVE_DEPTH field when
non-bypass modes are enabled, I think.

Though you said 'keeping it', you actually want me to drop it for now,
right?

> 
> > +#define  PC_BUF_ACTIVE_DEPTH_MASK      GENMASK(10, 0)
> > +#define  PC_BUF_ACTIVE_DEPTH(n)                FIELD_PREP(PC_BUF_ACTIVE_DEPTH_MASK, (n))
> > +
> > +#define PC_SW_RESET_REG                        0x20
> > +#define  PC_SW_RESET_N                 BIT(0)
> > +#define  PC_DISP_SW_RESET_N(n)         BIT(1 + (n))
> > +#define  PC_FULL_RESET_N               (PC_SW_RESET_N |                \
> > +                                        PC_DISP_SW_RESET_N(0) |        \
> > +                                        PC_DISP_SW_RESET_N(1))
> > +
> > +#define PC_REG_SET                     0x4
> > +#define PC_REG_CLR                     0x8
> > +
> > +#define DRIVER_NAME                    "imx8qxp-pixel-combiner"
> > +
> > +enum imx8qxp_pc_pix_data_format {
> > +       RGB,
> > +       YUV444,
> > +       YUV422,
> > +       SPLIT_RGB,
> 
> YUV444, YUV422 & SPLIT_RGB are also unused, but if their values are
> compatible with the PC_DISP0_PIX_DATA_FORMAT macro I think keeping
> them around for future reference is a good idea.

Yes, YUV444, YUV422 & SPLIT_RGB are compatible with the
PC_DISP{0, 1}_PIX_DATA_FORMAT macros, so I'll keep them here.

Regards,
Liu Ying

> 
> > +};
> > +
> > +struct imx8qxp_pc_channel {
> > +       struct drm_bridge bridge;
> > +       struct drm_bridge *next_bridge;
> > +       struct imx8qxp_pc *pc;
> > +       unsigned int stream_id;
> > +       bool is_available;
> > +};
> > +
> > +struct imx8qxp_pc {
> > +       struct device *dev;
> > +       struct imx8qxp_pc_channel ch[2];
> > +       struct clk *clk_apb;
> > +       void __iomem *base;
> > +};
> > +
> > +static inline u32 imx8qxp_pc_read(struct imx8qxp_pc *pc, unsigned int offset)
> > +{
> > +       return readl(pc->base + offset);
> > +}
> > +
> > +static inline void
> > +imx8qxp_pc_write(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
> > +{
> > +       writel(value, pc->base + offset);
> > +}
> > +
> > +static inline void
> > +imx8qxp_pc_write_set(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
> > +{
> > +       imx8qxp_pc_write(pc, offset + PC_REG_SET, value);
> > +}
> > +
> > +static inline void
> > +imx8qxp_pc_write_clr(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
> > +{
> > +       imx8qxp_pc_write(pc, offset + PC_REG_CLR, value);
> > +}
> > +
> > +static enum drm_mode_status
> > +imx8qxp_pc_bridge_mode_valid(struct drm_bridge *bridge,
> > +                            const struct drm_display_info *info,
> > +                            const struct drm_display_mode *mode)
> > +{
> > +       if (mode->hdisplay > 2560)
> > +               return MODE_BAD_HVALUE;
> > +
> > +       return MODE_OK;
> > +}
> > +
> > +static int imx8qxp_pc_bridge_attach(struct drm_bridge *bridge,
> > +                                   enum drm_bridge_attach_flags flags)
> > +{
> > +       struct imx8qxp_pc_channel *ch = bridge->driver_private;
> > +       struct imx8qxp_pc *pc = ch->pc;
> > +
> > +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +               DRM_DEV_ERROR(pc->dev,
> > +                             "do not support creating a drm_connector\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (!bridge->encoder) {
> > +               DRM_DEV_ERROR(pc->dev, "missing encoder\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       return drm_bridge_attach(bridge->encoder,
> > +                                ch->next_bridge, bridge,
> > +                                DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +}
> > +
> > +static void
> > +imx8qxp_pc_bridge_mode_set(struct drm_bridge *bridge,
> > +                          const struct drm_display_mode *mode,
> > +                          const struct drm_display_mode *adjusted_mode)
> > +{
> > +       struct imx8qxp_pc_channel *ch = bridge->driver_private;
> > +       struct imx8qxp_pc *pc = ch->pc;
> > +       u32 val;
> > +       int ret;
> > +
> > +       ret = pm_runtime_get_sync(pc->dev);
> > +       if (ret < 0)
> > +               DRM_DEV_ERROR(pc->dev,
> > +                             "failed to get runtime PM sync: %d\n", ret);
> > +
> > +       ret = clk_prepare_enable(pc->clk_apb);
> > +       if (ret)
> > +               DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
> > +                                                               __func__,  ret);
> > +
> > +       /* HSYNC to pixel link is active low. */
> > +       imx8qxp_pc_write_clr(pc, PC_CTRL_REG,
> > +                               PC_DISP_HSYNC_POLARITY(ch->stream_id));
> > +
> > +       /* VSYNC to pixel link is active low. */
> > +       imx8qxp_pc_write_clr(pc, PC_CTRL_REG,
> > +                               PC_DISP_VSYNC_POLARITY(ch->stream_id));
> > +
> > +       /* Data enable to pixel link is active high. */
> > +       imx8qxp_pc_write_set(pc, PC_CTRL_REG,
> > +                               PC_DISP_DVALID_POLARITY(ch->stream_id));
> > +
> > +       /* Mask the first frame output which may be incomplete. */
> > +       imx8qxp_pc_write_set(pc, PC_CTRL_REG, PC_VSYNC_MASK_ENABLE);
> > +
> > +       /* Only support RGB currently. */
> > +       val = imx8qxp_pc_read(pc, PC_CTRL_REG);
> > +       if (ch->stream_id == 0) {
> > +               val &= ~PC_DISP0_PIX_DATA_FORMAT_MASK;
> > +               val |= PC_DISP0_PIX_DATA_FORMAT(RGB);
> > +       } else {
> > +               val &= ~PC_DISP1_PIX_DATA_FORMAT_MASK;
> > +               val |= PC_DISP1_PIX_DATA_FORMAT(RGB);
> > +       }
> > +       imx8qxp_pc_write(pc, PC_CTRL_REG, val);
> > +
> > +       /* Only support bypass mode currently. */
> > +       imx8qxp_pc_write_set(pc, PC_CTRL_REG, PC_DISP_BYPASS(ch->stream_id));
> > +
> > +       clk_disable_unprepare(pc->clk_apb);
> > +}
> > +
> > +static void imx8qxp_pc_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                               struct drm_bridge_state *old_bridge_state)
> > +{
> > +       struct imx8qxp_pc_channel *ch = bridge->driver_private;
> > +       struct imx8qxp_pc *pc = ch->pc;
> > +       int ret;
> > +
> > +       ret = pm_runtime_put(pc->dev);
> > +       if (ret < 0)
> > +               DRM_DEV_ERROR(pc->dev, "failed to put runtime PM: %d\n", ret);
> > +}
> > +
> > +static const u32 imx8qxp_pc_bus_output_fmts[] = {
> > +       MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
> > +       MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
> > +};
> > +
> > +static bool imx8qxp_pc_bus_output_fmt_supported(u32 fmt)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(imx8qxp_pc_bus_output_fmts); i++) {
> > +               if (imx8qxp_pc_bus_output_fmts[i] == fmt)
> > +                       return true;
> > +       }
> > +
> > +       return false;
> > +}
> > +
> > +static u32 *
> > +imx8qxp_pc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +                                       struct drm_bridge_state *bridge_state,
> > +                                       struct drm_crtc_state *crtc_state,
> > +                                       struct drm_connector_state *conn_state,
> > +                                       u32 output_fmt,
> > +                                       unsigned int *num_input_fmts)
> > +{
> > +       u32 *input_fmts;
> > +
> > +       if (!imx8qxp_pc_bus_output_fmt_supported(output_fmt))
> > +               return NULL;
> > +
> > +       *num_input_fmts = 1;
> > +
> > +       input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> > +       if (!input_fmts)
> > +               return NULL;
> > +
> > +       switch (output_fmt) {
> > +       case MEDIA_BUS_FMT_RGB888_1X36_CPADLO:
> > +               input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X30_CPADLO;
> > +               break;
> > +       case MEDIA_BUS_FMT_RGB666_1X36_CPADLO:
> > +               input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X30_CPADLO;
> > +               break;
> > +       default:
> > +               kfree(input_fmts);
> > +               input_fmts = NULL;
> > +               break;
> > +       }
> > +
> > +       return input_fmts;
> > +}
> > +
> > +static u32 *
> > +imx8qxp_pc_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> > +                                       struct drm_bridge_state *bridge_state,
> > +                                       struct drm_crtc_state *crtc_state,
> > +                                       struct drm_connector_state *conn_state,
> > +                                       unsigned int *num_output_fmts)
> > +{
> > +       *num_output_fmts = ARRAY_SIZE(imx8qxp_pc_bus_output_fmts);
> > +       return kmemdup(imx8qxp_pc_bus_output_fmts,
> > +                       sizeof(imx8qxp_pc_bus_output_fmts), GFP_KERNEL);
> > +}
> > +
> > +static const struct drm_bridge_funcs imx8qxp_pc_bridge_funcs = {
> > +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +       .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> > +       .atomic_reset           = drm_atomic_helper_bridge_reset,
> > +       .mode_valid             = imx8qxp_pc_bridge_mode_valid,
> > +       .attach                 = imx8qxp_pc_bridge_attach,
> > +       .mode_set               = imx8qxp_pc_bridge_mode_set,
> > +       .atomic_disable         = imx8qxp_pc_bridge_atomic_disable,
> > +       .atomic_get_input_bus_fmts =
> > +                               imx8qxp_pc_bridge_atomic_get_input_bus_fmts,
> > +       .atomic_get_output_bus_fmts =
> > +                               imx8qxp_pc_bridge_atomic_get_output_bus_fmts,
> > +};
> > +
> > +static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
> > +{
> > +       struct imx8qxp_pc *pc;
> > +       struct imx8qxp_pc_channel *ch;
> > +       struct device *dev = &pdev->dev;
> > +       struct device_node *np = dev->of_node;
> > +       struct device_node *child, *remote;
> > +       u32 i;
> > +       int ret;
> > +
> > +       pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
> > +       if (!pc)
> > +               return -ENOMEM;
> > +
> > +       pc->base = devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(pc->base))
> > +               return PTR_ERR(pc->base);
> > +
> > +       pc->dev = dev;
> > +
> > +       pc->clk_apb = devm_clk_get(dev, "apb");
> > +       if (IS_ERR(pc->clk_apb)) {
> > +               ret = PTR_ERR(pc->clk_apb);
> > +               if (ret != -EPROBE_DEFER)
> > +                       DRM_DEV_ERROR(dev, "failed to get apb clock: %d\n",
> > +                                                                       ret);
> > +               return ret;
> > +       }
> > +
> > +       platform_set_drvdata(pdev, pc);
> > +       pm_runtime_enable(dev);
> > +
> > +       for_each_available_child_of_node(np, child) {
> > +               ret = of_property_read_u32(child, "reg", &i);
> > +               if (ret || i > 1) {
> > +                       ret = -EINVAL;
> > +                       DRM_DEV_ERROR(dev,
> > +                                     "invalid channel(%u) node address\n", i);
> > +                       goto free_child;
> > +               }
> > +
> > +               ch = &pc->ch[i];
> > +               ch->pc = pc;
> > +               ch->stream_id = i;
> > +
> > +               remote = of_graph_get_remote_node(child, 1, 0);
> > +               if (!remote) {
> > +                       ret = -ENODEV;
> > +                       DRM_DEV_ERROR(dev,
> > +                           "channel%u failed to get port1's remote node: %d\n",
> > +                                                                       i, ret);
> > +                       goto free_child;
> > +               }
> > +
> > +               ch->next_bridge = of_drm_find_bridge(remote);
> > +               if (!ch->next_bridge) {
> > +                       of_node_put(remote);
> > +                       ret = -EPROBE_DEFER;
> > +                       DRM_DEV_DEBUG_DRIVER(dev,
> > +                               "channel%u failed to find next bridge: %d\n",
> > +                                                                       i, ret);
> > +                       goto free_child;
> > +               }
> > +
> > +               of_node_put(remote);
> > +
> > +               ch->bridge.driver_private = ch;
> > +               ch->bridge.funcs = &imx8qxp_pc_bridge_funcs;
> > +               ch->bridge.of_node = child;
> > +               ch->is_available = true;
> > +
> > +               drm_bridge_add(&ch->bridge);
> > +       }
> > +
> > +       return 0;
> > +
> > +free_child:
> > +       of_node_put(child);
> > +
> > +       if (i == 1 && pc->ch[0].next_bridge)
> > +               drm_bridge_remove(&pc->ch[0].bridge);
> > +
> > +       pm_runtime_disable(dev);
> > +       return ret;
> > +}
> > +
> > +static int imx8qxp_pc_bridge_remove(struct platform_device *pdev)
> > +{
> > +       struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
> > +       struct imx8qxp_pc_channel *ch;
> > +       int i;
> > +
> > +       for (i = 0; i < 2; i++) {
> > +               ch = &pc->ch[i];
> > +
> > +               if (!ch->is_available)
> > +                       continue;
> > +
> > +               drm_bridge_remove(&ch->bridge);
> > +               ch->is_available = false;
> > +       }
> > +
> > +       pm_runtime_disable(&pdev->dev);
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
> > +{
> > +       struct platform_device *pdev = to_platform_device(dev);
> > +       struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
> > +       int ret;
> > +
> > +       ret = clk_prepare_enable(pc->clk_apb);
> > +       if (ret)
> > +               DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
> > +                                                               __func__,  ret);
> > +
> > +       /* Disable pixel combiner by full reset. */
> > +       imx8qxp_pc_write_clr(pc, PC_SW_RESET_REG, PC_FULL_RESET_N);
> > +
> > +       clk_disable_unprepare(pc->clk_apb);
> > +
> > +       /* Ensure the reset takes effect. */
> > +       usleep_range(10, 20);
> > +
> > +       return ret;
> > +}
> > +
> > +static int __maybe_unused imx8qxp_pc_runtime_resume(struct device *dev)
> > +{
> > +       struct platform_device *pdev = to_platform_device(dev);
> > +       struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
> > +       int ret;
> > +
> > +       ret = clk_prepare_enable(pc->clk_apb);
> > +       if (ret) {
> > +               DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
> > +                                                               __func__, ret);
> > +               return ret;
> > +       }
> > +
> > +       /* out of reset */
> > +       imx8qxp_pc_write_set(pc, PC_SW_RESET_REG, PC_FULL_RESET_N);
> > +
> > +       clk_disable_unprepare(pc->clk_apb);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct dev_pm_ops imx8qxp_pc_pm_ops = {
> > +       SET_RUNTIME_PM_OPS(imx8qxp_pc_runtime_suspend,
> > +                          imx8qxp_pc_runtime_resume, NULL)
> > +};
> > +
> > +static const struct of_device_id imx8qxp_pc_dt_ids[] = {
> > +       { .compatible = "fsl,imx8qm-pixel-combiner", },
> > +       { .compatible = "fsl,imx8qxp-pixel-combiner", },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, imx8qxp_pc_dt_ids);
> > +
> > +static struct platform_driver imx8qxp_pc_bridge_driver = {
> > +       .probe  = imx8qxp_pc_bridge_probe,
> > +       .remove = imx8qxp_pc_bridge_remove,
> > +       .driver = {
> > +               .pm = &imx8qxp_pc_pm_ops,
> > +               .name = DRIVER_NAME,
> > +               .of_match_table = imx8qxp_pc_dt_ids,
> > +       },
> > +};
> > +module_platform_driver(imx8qxp_pc_bridge_driver);
> > +
> > +MODULE_DESCRIPTION("i.MX8QM/QXP pixel combiner bridge driver");
> > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:" DRIVER_NAME);
> > --
> > 2.7.4
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
