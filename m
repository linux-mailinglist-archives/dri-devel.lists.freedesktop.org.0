Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F94E310C02
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAE56F41F;
	Fri,  5 Feb 2021 13:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2097.outbound.protection.outlook.com [40.107.93.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3886F6E055
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 11:35:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njfskjpyW7k8VsicY1dgHhNvwsRb0d7VzB9ZJnQVq4/pWWY00nb+0FzSY2VjnzfVupySvINxxMfyAyznilC0ybi+/ngC0kEqA75lGftbzMYBG3s17YrpjpdBPhuI0ew0YBWq/sJfl22RYm6OXYaaNELwbN1X+slTGH2yUkiwDoj1X7YYynvdRHq0ERSPOqDH5eyeT3kab8sH7BtR70VZ1VIliZRDTqSZUBZ1K5eoQ1rS4Z65CFvhhblGb5GbESTsnfgFE/lEGcH6nt5o3XfnCyCSfhdXNg73o8GINpdUiWLS32GbSPXNzRcGZVyBaEe1XYu0q0ZNb2FKEOJsnHgfHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ed9V30V5/1Z1iy083elZfIVD1hfsqkmwVA+M54Sg1mc=;
 b=OOB3OFW6d68U7Rqc7RvCPWOJh2YSVHPkllD7wvStFSkRLVWDV84Fcy6Y4ZTIfLOjq+hJsp+/bYM68d8aSj1caoxXu5Bv15BmEFkUVDepicypRnaG+sM/qAAv5ZmxGkY0L99YEwqy5GqKKuIIJgUWhKMOvwlhFBnjvxfh7pov4nvRgxg1Ug+qB56Wa2s9JboGZQYsg+Nv2Z0p5b1mMfGl8+4qwkxSvHsj+xCQPMG0ptgDfZfCzs/lPq0adu3sy9Scps7dLV3XGmxbdqC1cXiP3IwIXGInVFiZdM8R2hQJrBGA+6WtDFyLC4jnZsEq72FngaHPaVQqrZ3DLGfuWqH8AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ed9V30V5/1Z1iy083elZfIVD1hfsqkmwVA+M54Sg1mc=;
 b=bTtdQhpuruzUFvoS4wxhwgmqpciP08xLpa8PiVdYgebhPkrgOa3KLmFY+daXZ04c3gKlgZQjrBpu54UYe/TdnOh1IuxmwcDXVgY6rJwdqWsU5KR6IobgsBpGlmwwIul3cD18LKkv1slzLNBbwJUqS1yg0dxW4oDcTdDiSJaZXY0=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (10.186.134.72) by
 BYAPR04MB3927.namprd04.prod.outlook.com (52.135.217.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.14; Fri, 5 Feb 2021 11:35:28 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 11:35:28 +0000
Date: Fri, 5 Feb 2021 19:35:16 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH] drm/bridge: anx7625: enable DSI EOTP
Message-ID: <20210205113516.GA18836@zhaomy-pc>
References: <20210205111357.GA18784@zhaomy-pc>
 <CAG3jFys6QoGpo7C2t=P2pgsY1CfwU=vNkx2SZgGfRbzmVneKog@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAG3jFys6QoGpo7C2t=P2pgsY1CfwU=vNkx2SZgGfRbzmVneKog@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR04CA0070.apcprd04.prod.outlook.com
 (2603:1096:202:15::14) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK2PR04CA0070.apcprd04.prod.outlook.com (2603:1096:202:15::14) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3825.20 via Frontend Transport; Fri, 5 Feb 2021 11:35:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 823641ab-a080-45dd-11c9-08d8c9ca2314
X-MS-TrafficTypeDiagnostic: BYAPR04MB3927:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB392781A40D1E086CB40B3D54C7B29@BYAPR04MB3927.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGWeJHqkZcVmCGNLghtV6YtMxmEwNnMctyz34fSZCQrpTudTTqRTrT4lQXQPyt90qIUdKWEeZYSHsZ8eqXxms0zVC5zp1dAt1lm2bxWmoIqljWSVyR65Gcem60TwJtXSTFszVAEXqwyGYrp4S68vRYAWOPmcRf+mo16odz6hfc+bKqew5u8Eh03Q/l73WywbEF317PqvfRG3Gxm4+2QZaapkmLR1jbbJoMjITy1lEmwis5Zmc54RZBX9ZOxfqzDrETeaJHFVLj4PhcCm7EISUnlGCpUQis6OvdJUb/T+s7nHcQ15jc4RY9P2IpHoix2MJWRRjKVSykiyDccJSFgokSrpl5qvaH4K+BgRkf7uv9jvbNWSYiRzxpYhNS/4dmOR8mn+oQher11Fpb5/bypcSwKfwEo3WTl192eWnYQ64t8KdD15aq32z86e2nwYdcm4i2keVPjDZmqPSrLgIWW4z0xnElqHgDvJ/CLlHWJWUjoL0ckTGjGeztVcKB/Sk3I534ZYw+tGtSTcZpzZ9q8GGwBjSwugzcAVxNjANPvtCgabSiS2DdhDw1IJhumcHgY9fQL1KttCXFCXlbLv5G6NoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39840400004)(346002)(366004)(396003)(136003)(66476007)(52116002)(4326008)(6666004)(33656002)(54906003)(83380400001)(316002)(956004)(66556008)(186003)(66946007)(2906002)(5660300002)(26005)(9686003)(1076003)(8676002)(16526019)(33716001)(86362001)(478600001)(8936002)(6916009)(6496006)(7416002)(55016002)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FqZVunS1IzHW9eMp8SvtVLlzenXIYDcfFIgxUmR7cSU+eZT31EkFNC74ep38?=
 =?us-ascii?Q?n4HT70W/y6bQ+XZ2cwpT89yZoxoe6rdYJOB01MNunTUPBylRD7CfEuwMWo4R?=
 =?us-ascii?Q?bbBrxgpT0L0C69ipbJIn8DiGr9Mz5aJrtffzpRdag6NscguWojCPsJ8DEDqH?=
 =?us-ascii?Q?71vX4hUlMcPmtjw5eL1kX8WBjKHazTuPXgsxLBOjDBPYHgsywiWTnVf4wmL6?=
 =?us-ascii?Q?v02g7kvPOY1dQf2attCe7GZkTR4cYO000HODJWzkiXG6xezSze+vfg22sUG+?=
 =?us-ascii?Q?9TAIumwuuRLEGnXIFK2fsan0GBWOtE8ByXf4kbCdKfuT2V5pkv6qLKZGL5sN?=
 =?us-ascii?Q?9TV+fG8i6OVA9PjQBXUFtyYAAgocWaFLaBHIhFeEv8OV+I9mYLkQOU6fj1mt?=
 =?us-ascii?Q?wr3IcrbYZnwBkpi/MV6Q/pHBHNrwaTdpwd7th1wXBHHLoCdHeP8/fad1fMO3?=
 =?us-ascii?Q?vmLAiaUvMmrkKJjPHwAD9ZEdPldwTnZOQK2ryGm+IfMQKkrTJG72wPVlHQj3?=
 =?us-ascii?Q?opdxFUq5+CimX9/z9p+EvsbWUY0ODaeqlk2/K9g65qRBVwWaItYLQmYPUWRU?=
 =?us-ascii?Q?suMAu1vV6fZxbT11N9qybU0Sv6xqUOsn0k1s4U8S4B5qaoRR7DbzGPKCbGnD?=
 =?us-ascii?Q?AdkkSu/XcY9U3tJWD1BivIa6YofZEewL8Lyyol51xqtr9K4j/6UdSexS2+nT?=
 =?us-ascii?Q?7nUbU3HvenMu3sF3qooDL55PxIxaWLyh0Mbz2oGAZmLhCkjFap/elKq6SWko?=
 =?us-ascii?Q?Y/1fGXHroaQpgR12OZJZhnoW+yPIl+/2KINqal/m8Ebfg7SBLuxJwCSDoeZD?=
 =?us-ascii?Q?kYVFf3Dafyplz0wwzlvdNbkIRud+MlPVMYKL6uOZ0hNhYjTaLpdKbk+Mk1sB?=
 =?us-ascii?Q?U9LrWCrrShGEiZsGl6D60qeIVij2ZVLMKM0zk7+aPtELMdMZubT2K40hRBt0?=
 =?us-ascii?Q?p3S2tdoN+Xg6W+5D5A5eNGDtIemC87sDRmbHqg/+dSkuVHB53AiMXNi0CmVl?=
 =?us-ascii?Q?IpcRPEtj1WQ3lF2KkVFyAqfaarIlrxeZ1sZVN5d/avseBp2XfxczR4oYXmU7?=
 =?us-ascii?Q?btfdcv6OLjYqW0M/5QkludavmN6FZv5mO6MFhsGDqSFSeRJTgpSvJK3iYwG1?=
 =?us-ascii?Q?/gpiqL7Hr/wV1QQOB2vtd/aXSekofWe6dNb28YoDFWd/ZkhIaRqo67dguV2s?=
 =?us-ascii?Q?A8RXMHHwqA692VkhqNEVww4aasBT3Fm31FvGTcYi7L8Kfm4QyXOJLYsmwx9X?=
 =?us-ascii?Q?3AmVr4fTfRxXye2/vV9J2k0X0BHbQprAo+pu8iDdwRu8q/ruKEMifwSGckzO?=
 =?us-ascii?Q?jGRt9p+MOlzHYmtpwr/IBCr1?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823641ab-a080-45dd-11c9-08d8c9ca2314
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:35:28.5753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oi6xLf6B7IW7TCmDxmjv4ETw7xNXofbZRxUzFUhobK9E03g00i2uQqCb7ezrzz6i3g3tUya0x9SVAzYn/YMmMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3927
X-Mailman-Approved-At: Fri, 05 Feb 2021 13:42:56 +0000
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 12:30:45PM +0100, Robert Foss wrote:
> Hey Xin,
> 
> Thanks for the quick response. I think this is ok.
> 
> But going forward it is easier for maintainers to keep track of
> patches if they're submitted with a version tag. [PATCH] -> [PATCH v2]
> -> [PATCH v3] etc.
> 
> git send-email -v1
> git send-email -v2
> git send-email -v3
> 
> ^^^ does this for you
> 
> 
> Rob.
Hi Rob, thanks, I'll follow the rules in the next upstream.
Thanks,
xin
> 
> On Fri, 5 Feb 2021 at 12:14, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > Enable DSI EOTP feature for fixing some panel screen constant shift issue.
> > Removing MIPI flag MIPI_DSI_MODE_EOT_PACKET to enable DSI EOTP.
> >
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 65cc059..e31eeb1b 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1334,7 +1334,6 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
> >         dsi->format = MIPI_DSI_FMT_RGB888;
> >         dsi->mode_flags = MIPI_DSI_MODE_VIDEO   |
> >                 MIPI_DSI_MODE_VIDEO_SYNC_PULSE  |
> > -               MIPI_DSI_MODE_EOT_PACKET        |
> >                 MIPI_DSI_MODE_VIDEO_HSE;
> >
> >         if (mipi_dsi_attach(dsi) < 0) {
> > --
> > 2.7.4
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
