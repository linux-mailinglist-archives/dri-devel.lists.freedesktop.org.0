Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DA2330AE2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 11:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA9C6E846;
	Mon,  8 Mar 2021 10:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C892E6E846
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 10:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDc3XbxsYNvUf7d+V9O5QeCNzCQ8ki2kpI2sY34XEFE+Kv7lDA4TR5Ugacga/krLN8jmoEjHfa1APK0X0aCxlw+XnZYWzssd/jarej0so3gA1llC1SPSQ3Rrcu5Q9nEezjYpf++RCeOTlVFzY+prdM1Pl3eb2oyhmHlh2MbPUbNauD+Sh4B48OsrY6S2i836IyaYHAzyDIEuS4I6I3IAayFc8aaT94H6Xw8WjXuBHzT/omwhG4viNTRIB7stwXwReevdJyM2cd7Ph8TsdJctga5+BaMB0SwigXfmHKomvA5LU81eKiaQmq5Y4vhmQuJ2/ORHe2cWx5AdCwYyVwBKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a67sK7LhZCBXK8d5fnBX5Qy/SIKQQpziY8Q6SudrNs4=;
 b=A7ockfuqFsXjCIf9DodFG3dfo9rr9YGocOnTdhPJA8tYc1qXp0cgUV8aQMVvCW2yTsuEwVW5OOxdpQ2l5rUD+z+keHDdCR7Q3F8McZ9ak2Pr++HFUYbK1RZyGR+6WeqLILXj6nJW7/4uFbR2jBNneSLDcXfc+MEbZATrnK8+G6jX7Q3g0Yiv/aEn+fHYdFFI5YEeVDiVZR86YImualPs5JSfVdAx+aGfYlLNGrNMiUqGpjGeqYPcHNzxteG7usai0WlhIsTO8fDg8sQAtn/Z2mdhE/Zz63NaicTyKpysipYRmD365cNTRheRfZ6GBePnVc7ZMuJnG94br9Q6hwKPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a67sK7LhZCBXK8d5fnBX5Qy/SIKQQpziY8Q6SudrNs4=;
 b=Kg3jFOBLu66kQGiljVgjNqp/NB7kX+QjCpuz8pKxIwEVb0yweoDbqVv+uAqShUQDlN833SgNtBEdo0EoprFDqDtACQ8guYmyMvE97uBH4HT8BXepsmf5dkbCwSxlxyA6e7MpSCy9jctSdAlSPPLqiLF9ZoSGslhY/JUvKOrt5GQ=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4237.eurprd04.prod.outlook.com (2603:10a6:803:3e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 8 Mar
 2021 10:11:41 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 10:11:41 +0000
Message-ID: <d13f5cdabf95e734d9a469bbd2824ab4a043e514.camel@nxp.com>
Subject: Re: [PATCH v4 10/14] drm/bridge: imx: Add LDB driver helper support
From: Liu Ying <victor.liu@nxp.com>
To: Robert Foss <robert.foss@linaro.org>
Date: Mon, 08 Mar 2021 18:10:13 +0800
In-Reply-To: <88a27e0d944f990762be9ec6a547403475019eb1.camel@nxp.com>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-11-git-send-email-victor.liu@nxp.com>
 <CAG3jFysTKXsmfx4x=XVdu3X0amE9EUOxN=bYo4eg+XjnqyFsVg@mail.gmail.com>
 <9c437b07a47b14c47f65ac58f6cf9bc95edab169.camel@nxp.com>
 <CAG3jFysCUGWD-a4MabUz12GB3DNZQ2rCEXn60JZ7zQXH=OqDnw@mail.gmail.com>
 <88a27e0d944f990762be9ec6a547403475019eb1.camel@nxp.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR03CA0055.apcprd03.prod.outlook.com
 (2603:1096:202:17::25) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 HK2PR03CA0055.apcprd03.prod.outlook.com (2603:1096:202:17::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.16 via Frontend Transport; Mon, 8 Mar 2021 10:11:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e080732b-e608-44b5-b3ff-08d8e21a90f3
X-MS-TrafficTypeDiagnostic: VI1PR04MB4237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4237652EE56B58F08820F77098939@VI1PR04MB4237.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RK7jIlBxddUOAienVoGmfZuD8XJD8oQx9zIC0zLjViM8QVupGNNk7GKM8fiqPqpC1Cnv1tMpHT/gXz6HDW+Oy0FlYQm+C2BmXGr1t0mM+YcXmY6HeuaukuiabxQupjIEVwB0gZlinlQYk7zWqCev+Lkwge04X5NhGEM/vcHZAxcaBQgTmzHCVd3YZo7PrO12spv0Gow5ulSOAtS198LBEuez5b0WILDFAEtQaUgXJMk4akcHP3Xyf4POGGObZSBX2ieF3s5jbBMZK7liYQN4k15ixvMQSfo1Ppzo2lke4CPyjbeJkMU0TqzFktqr88dXH2WKprKl0Lme8ips9KkItigftYp+yXnTyqGfsLHscg2U1pCS7+LooywnXyznmOopy9zXDL3swRfuwNLxINkKlebQgKbO8KH2MxHjmTitcLsXUasyYjCj7Fc7no6sOXkxk3V7u7wXqo3Nt3mBYlOnkJw5TYDwitQwmdvl55/8h/MW60AwCjHaG6IwTcbs7eLNObmMMxHAsbWPTVm28UltQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39850400004)(136003)(346002)(366004)(52116002)(86362001)(2906002)(4326008)(8936002)(6916009)(316002)(6512007)(5660300002)(7416002)(36756003)(8676002)(6486002)(30864003)(6666004)(186003)(478600001)(66946007)(66476007)(26005)(66556008)(6506007)(956004)(83380400001)(54906003)(2616005)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WGZtNTFMMkJURGV0b05qYTVjQ0pSalR4MGl6bWRIOTh3S3VreWxDZUs4dmQr?=
 =?utf-8?B?cjhLenFrWGZlNTN5WmI0bDlpU3AyQmNVeWlkQkZRNWxZWFMrelpyTDM4SnNv?=
 =?utf-8?B?UE0vUnc4WGRXK3YzMGtmSjYybkFSUXBJQTd5bm9JaGdtbkN5VlQrbUovL3M3?=
 =?utf-8?B?NFRvNG9oZmxOQ1BnSXVrR1gwTXg5YVVCQkJ6U01qWTV0RWNJMHpHMUhuWWlY?=
 =?utf-8?B?RzhlV1ZBOC8vWU4xVm5Tb01MZVNxZzR5MXdBWElZMXJlRzRicXF2WFc4em1v?=
 =?utf-8?B?R25vZFI1TXpYREtJNzNxR25ueDFnMHUzLzZ1UUdRYnpPUld6eGN0cDB6Zk0w?=
 =?utf-8?B?NGNJbzJReFJjSy95SVI1Q1pSRmppNjdHZy9CUCtLY0FJS1BGeGI2eTd0Z2Zx?=
 =?utf-8?B?MzIwOEZiMFhNTTN0NEZkWUl2YldGVktQd0taKytXOWtvOWZZZlgrRlpNS3dp?=
 =?utf-8?B?VUh5TmRFcklxWmNKdnBDKzZTVmRIMDFlQ09XSUtXZDZsWXNHdDNGYy9IUGN6?=
 =?utf-8?B?TWxBTjFCMWVaWjVNS0M4eXBQbExRNzJ2WlkrS0MzekorUGpaWVMyaGxlVk55?=
 =?utf-8?B?bnU4ZlFqZmtQdTNRVmFSYjI0aGk2U1g1Nkd6N2J3ckhsRE9WUXl0WTdJSk9w?=
 =?utf-8?B?U2JtQm83VmQ2RGdmekZrTmJndi85ak1TRGw4NlZ6bjhmRitnWW1OVE9OazlO?=
 =?utf-8?B?WG5uSWhBTlBuQjF3U3NzWU5QNjNjZzViZHpjakt6aE9IZ2JjTFlzUWRGZ0RM?=
 =?utf-8?B?ZURqUm5YSFQvOTlvdktlNzZnZWVkazllc0VzUWVUeG1UMDhBZTg2UnRvME1D?=
 =?utf-8?B?R1lZNUw3VzZvZTQ4eUtQTHo4N2U4RlhlS0c0TEdZMXJiVHdIaGxrbHJ2dnJ4?=
 =?utf-8?B?R05lbGVmMWlVNU5IZzRaeWN1Szk0SGkzSkZFb1YrZjVScFB1UXlTZlhiZlN2?=
 =?utf-8?B?WWVoNzVhMGo4OHpqN0trOGNBR0NlcjZkWC9hWHNSUXZqMDNIYmVGY2xPMC9O?=
 =?utf-8?B?SVJQVk9lRFBtR25sQ2dGT2l4cHhhRUVsenpMbWJRbzRqcFphV0MzampIUFU3?=
 =?utf-8?B?bVJ5OU0ybjNvU2ZJc1dkMDMrazk2dEtPWklid0U3TmwyNWRiZ3BWNks3RklV?=
 =?utf-8?B?UEN5QU9BcFRsWjQ2TXJ2SG5sNTZRMmRDaDdocnNCc0RLd3c5ZzZjVHIzNTRv?=
 =?utf-8?B?QlV1WEl0TUgxdzNzTDBoY3JVYzIrZGdPOFo1bFdxUEpPMUtIVzNGV2EreHJ3?=
 =?utf-8?B?TXhTVkl3Ym5LQklycVpLbGdvUEZUNjhMMDJHZmliUHZTdXJiUUZnODhoVW1h?=
 =?utf-8?B?NGExUkFOYWVGUituS21vQ3VrYWVPZ2F4ZGZSbXNPVnF1dHd0Ujl6MXNKd0Nl?=
 =?utf-8?B?eWNSeVZWSFFacGFQRnlqTmJKWWhtZjB5SEZTYWdxU2RZc1dwU3I0eHVTNThm?=
 =?utf-8?B?TWdSZW93S0Z4ZXNWZHJUOUIrdXltYVJIY1hhVGVvdlBWRjVyd05tMDI4ZTgv?=
 =?utf-8?B?a0cxMnNoTWM5WG9iZGhRbTNaM0VuSkFCMFJkWmRnbWUycmhMczJlekN4ZHBV?=
 =?utf-8?B?OHdqWWY2TkZkM09zR24yUGd3aDJLT1Z6c1EreGtZd1FFWm5mSW14cVdFOC9j?=
 =?utf-8?B?TjI5TjRjbmFqMWIxNUpVOVZzOWJMeUZ5a2pEVkxwWUthVlVlWHZmSE0zYVd5?=
 =?utf-8?B?ZU9VZ3JQVUViQlp3dUNDQUxlcGFOdWxqSjBrSnJ3eVpIUE1tSWtzM3FHK1ZZ?=
 =?utf-8?Q?GMDZZapex27Az/crUbNcU2p6gxl8uNpJ4eaSPWh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e080732b-e608-44b5-b3ff-08d8e21a90f3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 10:11:41.2846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkBF+q2SENYhsDRl0qPV20mQG2lwvRt+i7Uw96AVrwt6jsC+N1Qz14lwn1zqxifGNHAkSqKHpuSyihWMzWrqCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4237
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

On Thu, 2021-03-04 at 11:27 +0800, Liu Ying wrote:
> Hi Robert,
> 
> On Wed, 2021-03-03 at 16:34 +0100, Robert Foss wrote:
> > On Wed, 3 Mar 2021 at 08:23, Liu Ying <victor.liu@nxp.com> wrote:
> > > Hi Robert,
> > > 
> > > On Tue, 2021-03-02 at 15:22 +0100, Robert Foss wrote:
> > > > Hey Liu,
> > > > 
> > > > Thanks for submitting this patch.
> > > 
> > > Thanks for reviewing this patch.
> > > 
> > > > On Thu, 18 Feb 2021 at 04:59, Liu Ying <victor.liu@nxp.com> wrote:
> > > > > This patch adds a helper to support LDB drm bridge drivers for
> > > > > i.MX SoCs.  Helper functions exported from this driver should
> > > > > implement common logics for all LDB modules embedded in i.MX SoCs.
> > > > > 
> > > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > > ---
> > > > > v3->v4:
> > > > > * No change.
> > > > > 
> > > > > v2->v3:
> > > > > * Call syscon_node_to_regmap() to get regmap instead of
> > > > >   syscon_regmap_lookup_by_phandle().
> > > > > 
> > > > > v1->v2:
> > > > > * No change.
> > > > > 
> > > > >  drivers/gpu/drm/bridge/imx/Kconfig          |   8 +
> > > > >  drivers/gpu/drm/bridge/imx/Makefile         |   1 +
> > > > >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 248 ++++++++++++++++++++++++++++
> > > > >  include/drm/bridge/imx_ldb_helper.h         |  98 +++++++++++
> > > > >  4 files changed, 355 insertions(+)
> > > > >  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > > > >  create mode 100644 include/drm/bridge/imx_ldb_helper.h
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > index 1ea1ce7..23e24fd 100644
> > > > > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > @@ -1,3 +1,11 @@
> > > > > +config DRM_IMX_LVDS_BRIDGE_HELPER
> > > > > +       tristate "Freescale i.MX LVDS display bridge helper"
> > > > > +       depends on OF
> > > > > +       select DRM_PANEL_BRIDGE
> > > > > +       help
> > > > > +         Helper to support Freescale i.MX LVDS Display Bridge(LDB).
> > > > > +         This bridge is embedded in a SoC.
> > > > > +
> > > > >  config DRM_IMX8QXP_PIXEL_COMBINER
> > > > >         tristate "Freescale i.MX8QM/QXP pixel combiner"
> > > > >         depends on OF
> > > > > diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> > > > > index e74dd64..902b703 100644
> > > > > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > > > > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > > > > @@ -1,3 +1,4 @@
> > > > > +obj-$(CONFIG_DRM_IMX_LVDS_BRIDGE_HELPER) += imx-ldb-helper.o
> > > > >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> > > > >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
> > > > >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
> > > > > diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > > > > new file mode 100644
> > > > > index 00000000..94d7f9e
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > > > > @@ -0,0 +1,248 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > > +/*
> > > > > + * Copyright (C) 2012 Sascha Hauer, Pengutronix
> > > > > + * Copyright 2019,2020 NXP
> > > > > + */
> > > > > +
> > > > > +#include <linux/mfd/syscon.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/of.h>
> > > > > +#include <linux/regmap.h>
> > > > > +
> > > > > +#include <drm/bridge/imx_ldb_helper.h>
> > > > > +#include <drm/drm_of.h>
> > > > > +#include <drm/drm_panel.h>
> > > > > +#include <drm/drm_print.h>
> > > > > +
> > > > > +bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
> > > > > +{
> > > > > +       return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(ldb_channel_is_single_link);
> > > > > +
> > > > > +bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
> > > > > +{
> > > > > +       return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
> > > > > +              ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(ldb_channel_is_split_link);
> > > > > +
> > > > > +int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> > > > > +                                  struct drm_bridge_state *bridge_state,
> > > > > +                                  struct drm_crtc_state *crtc_state,
> > > > > +                                  struct drm_connector_state *conn_state)
> > > > > +{
> > > > > +       struct ldb_channel *ldb_ch = bridge->driver_private;
> > > > > +
> > > > > +       ldb_ch->in_bus_format = bridge_state->input_bus_cfg.format;
> > > > > +       ldb_ch->out_bus_format = bridge_state->output_bus_cfg.format;
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(ldb_bridge_atomic_check_helper);
> > > > > +
> > > > > +void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> > > > > +                               const struct drm_display_mode *mode,
> > > > > +                               const struct drm_display_mode *adjusted_mode)
> > > > > +{
> > > > > +       struct ldb_channel *ldb_ch = bridge->driver_private;
> > > > > +       struct ldb *ldb = ldb_ch->ldb;
> > > > > +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> > > > > +
> > > > > +       if (is_split)
> > > > > +               ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
> > > > > +
> > > > > +       switch (ldb_ch->out_bus_format) {
> > > > > +       case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> > > > > +               break;
> > > > > +       case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > > > > +               if (ldb_ch->chno == 0 || is_split)
> > > > > +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24;
> > > > > +               if (ldb_ch->chno == 1 || is_split)
> > > > > +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24;
> > > > > +               break;
> > > > > +       case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > > > > +               if (ldb_ch->chno == 0 || is_split)
> > > > > +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24 |
> > > > > +                                        LDB_BIT_MAP_CH0_JEIDA;
> > > > > +               if (ldb_ch->chno == 1 || is_split)
> > > > > +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24 |
> > > > > +                                        LDB_BIT_MAP_CH1_JEIDA;
> > > > > +               break;
> > > > > +       }
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(ldb_bridge_mode_set_helper);
> > > > > +
> > > > > +void ldb_bridge_enable_helper(struct drm_bridge *bridge)
> > > > > +{
> > > > > +       struct ldb_channel *ldb_ch = bridge->driver_private;
> > > > > +       struct ldb *ldb = ldb_ch->ldb;
> > > > > +
> > > > > +       /*
> > > > > +        * Platform specific bridge drivers should set ldb_ctrl properly
> > > > > +        * for the enablement, so just write the ctrl_reg here.
> > > > > +        */
> > > > > +       regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(ldb_bridge_enable_helper);
> > > > > +
> > > > > +void ldb_bridge_disable_helper(struct drm_bridge *bridge)
> > > > > +{
> > > > > +       struct ldb_channel *ldb_ch = bridge->driver_private;
> > > > > +       struct ldb *ldb = ldb_ch->ldb;
> > > > > +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> > > > > +
> > > > > +       if (ldb_ch->chno == 0 || is_split)
> > > > > +               ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
> > > > > +       if (ldb_ch->chno == 1 || is_split)
> > > > > +               ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
> > > > > +
> > > > > +       regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(ldb_bridge_disable_helper);
> > > > > +
> > > > > +int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> > > > > +                            enum drm_bridge_attach_flags flags)
> > > > > +{
> > > > > +       struct ldb_channel *ldb_ch = bridge->driver_private;
> > > > > +       struct ldb *ldb = ldb_ch->ldb;
> > > > > +
> > > > > +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > > > > +               DRM_DEV_ERROR(ldb->dev,
> > > > > +                             "do not support creating a drm_connector\n");
> > > > > +               return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       if (!bridge->encoder) {
> > > > > +               DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
> > > > > +               return -ENODEV;
> > > > > +       }
> > > > > +
> > > > > +       return drm_bridge_attach(bridge->encoder,
> > > > > +                               ldb_ch->next_bridge, bridge,
> > > > > +                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(ldb_bridge_attach_helper);
> > > > > +
> > > > > +int ldb_init_helper(struct ldb *ldb)
> > > > > +{
> > > > > +       struct device *dev = ldb->dev;
> > > > > +       struct device_node *np = dev->of_node;
> > > > > +       struct device_node *child;
> > > > > +       int ret;
> > > > > +       u32 i;
> > > > > +
> > > > > +       ldb->regmap = syscon_node_to_regmap(np->parent);
> > > > > +       if (IS_ERR(ldb->regmap)) {
> > > > > +               ret = PTR_ERR(ldb->regmap);
> > > > > +               if (ret != -EPROBE_DEFER)
> > > > > +                       DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
> > > > > +               return ret;
> > > > > +       }
> > > > > +
> > > > > +       for_each_available_child_of_node(np, child) {
> > > > > +               struct ldb_channel *ldb_ch;
> > > > > +
> > > > > +               ret = of_property_read_u32(child, "reg", &i);
> > > > > +               if (ret || i > MAX_LDB_CHAN_NUM - 1) {
> > > > > +                       ret = -EINVAL;
> > > > > +                       DRM_DEV_ERROR(dev,
> > > > > +                                     "invalid channel node address: %u\n", i);
> > > > > +                       of_node_put(child);
> > > > > +                       return ret;
> > > > > +               }
> > > > > +
> > > > > +               ldb_ch = ldb->channel[i];
> > > > > +               ldb_ch->ldb = ldb;
> > > > > +               ldb_ch->chno = i;
> > > > > +               ldb_ch->is_available = true;
> > > > > +               ldb_ch->np = child;
> > > > > +
> > > > > +               ldb->available_ch_cnt++;
> > > > > +       }
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(ldb_init_helper);
> > > > > +
> > > > > +int ldb_find_next_bridge_helper(struct ldb *ldb)
> > > > > +{
> > > > > +       struct device *dev = ldb->dev;
> > > > > +       struct ldb_channel *ldb_ch;
> > > > > +       int ret, i;
> > > > > +
> > > > > +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > > > > +               ldb_ch = ldb->channel[i];
> > > > > +
> > > > > +               if (!ldb_ch->is_available)
> > > > > +                       continue;
> > > > > +
> > > > > +               ret = drm_of_find_panel_or_bridge(ldb_ch->np, 1, 0,
> > > > > +                                                 &ldb_ch->panel,
> > > > > +                                                 &ldb_ch->next_bridge);
> > > > > +               if (ret) {
> > > > > +                       if (ret != -EPROBE_DEFER)
> > > > > +                               DRM_DEV_ERROR(dev,
> > > > > +                                       "failed to find panel or bridge: %d\n",
> > > > > +                                                                       ret);
> > > > > +                       return ret;
> > > > > +               }
> > > > > +
> > > > > +               if (ldb_ch->panel) {
> > > > > +                       ldb_ch->next_bridge = devm_drm_panel_bridge_add(dev,
> > > > > +                                                               ldb_ch->panel);
> > > > > +                       if (IS_ERR(ldb_ch->next_bridge)) {
> > > > > +                               ret = PTR_ERR(ldb_ch->next_bridge);
> > > > > +                               DRM_DEV_ERROR(dev,
> > > > > +                                       "failed to add panel bridge: %d\n",
> > > > > +                                                                       ret);
> > > > > +                               return ret;
> > > > > +                       }
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(ldb_find_next_bridge_helper);
> > > > > +
> > > > > +void ldb_add_bridge_helper(struct ldb *ldb,
> > > > > +                          const struct drm_bridge_funcs *bridge_funcs)
> > > > > +{
> > > > > +       struct ldb_channel *ldb_ch;
> > > > > +       int i;
> > > > > +
> > > > > +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > > > > +               ldb_ch = ldb->channel[i];
> > > > > +
> > > > > +               if (!ldb_ch->is_available)
> > > > > +                       continue;
> > > > > +
> > > > > +               ldb_ch->bridge.driver_private = ldb_ch;
> > > > > +               ldb_ch->bridge.funcs = bridge_funcs;
> > > > > +               ldb_ch->bridge.of_node = ldb_ch->np;
> > > > > +
> > > > > +               drm_bridge_add(&ldb_ch->bridge);
> > > > > +       }
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(ldb_add_bridge_helper);
> > > > > +
> > > > > +void ldb_remove_bridge_helper(struct ldb *ldb)
> > > > > +{
> > > > > +       struct ldb_channel *ldb_ch;
> > > > > +       int i;
> > > > > +
> > > > > +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > > > > +               ldb_ch = ldb->channel[i];
> > > > > +
> > > > > +               if (!ldb_ch->is_available)
> > > > > +                       continue;
> > > > > +
> > > > > +               drm_bridge_remove(&ldb_ch->bridge);
> > > > > +       }
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(ldb_remove_bridge_helper);
> > > > > +
> > > > > +MODULE_DESCRIPTION("Freescale i.MX LVDS Display Bridge driver helper");
> > > > > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > > > > +MODULE_LICENSE("GPL v2");
> > > > > +MODULE_ALIAS("platform:imx-ldb-helper");
> > > > 
> > > > I'm not entirely sure why this set of helper functions should be a
> > > > module. It's not a driver, but rather a toolbox for the LDB driver,
> > > > which is fine, but there is no situation I can see where this module
> > > > would be unloaded and the LDB driver would be loaded.
> > > 
> > > I can see drivers/gpu/drm/drm_mipi_dbi.c is also a module and
> > > essentially provides helpers to MIPI DBI drivers, but it is not a
> > > driver.  I don't see this imx-ldb-helper can be anything else other
> > > than a module.
> > > 
> > > Or, do you mean that imx-ldb-helper should be only built-in?
> > 
> > My thinking was that it should just be linked together with the rest
> > of the imx8qxp-ldb driver. But this ties in to my next comment.
> 
> This patch set contains _two_ modules which use the imx-ldb-helper,
> i.e., the imx8qxp-ldb driver(patch 12/14) and the imx8qm-ldb
> driver(patch 13/14).  It looks that we cannot link the imx-ldb-helper
> with them respectively.  So, I think keeping imx-ldb-helper as a module
> is the only option.

I need to change my saying here.  I think we can link the
imx-ldb-helper with those two drivers respectively.
So, I assume imx-ldb-helper won't be a module, then.

And, I still don't think this series should touch the i.MX53/6qdl LDB
driver(imx-ldb).

If no strong opinions, I would try the updated option#1 for the next
version:

#1(updated) Make imx-ldb-helper an object that is just linked with the
imx8qxp-ldb driver and the imx8qm-ldb driver.

Regards,
Liu Ying

> 
> > > > > diff --git a/include/drm/bridge/imx_ldb_helper.h b/include/drm/bridge/imx_ldb_helper.h
> > > > > new file mode 100644
> > > > > index 00000000..2a7ba97
> > > > > --- /dev/null
> > > > > +++ b/include/drm/bridge/imx_ldb_helper.h
> > > > 
> > > > This header is specific to this driver, and I would expect it to not
> > > > be useful to other drivers. Additionally the filename has a different
> > > > format than the .c file it corresponds to. I would change the name and
> > > > path to "drivers/gpu/drm/bridge/imx/imx-ldb-helper.h".
> > > 
> > > The i.MX53/6qdl LDB driver(drivers/gpu/drm/imx/imx-ldb.c) can
> > > potentially use this header, but it's a DRM encoder driver.
> > > So, maybe, it's a good idea to move this header to the 'drivers' folder
> > > and rename it to 'imx-ldb-helper.h' ofc.  If no objections, I'll do as
> > > what you're suggesting here in the next version.
> > 
> > Ah I see. If ldb-helper is indeed used by two drivers, making it a
> > module seems reasonable.
> 
> Yes, for now, two drivers(imx8qxp-ldb and imx8qm-ldb) use
> imx-ldb-helper.
> 
> > I think we have two options then.
> > 
> > #1 Make imx-ldb-helper an object that is just linked with the
> > imx8qxp-ldb driver.
> 
> I don't think #1 is a valid option, as we cannot link imx-ldb-helper
> object with imx8qxp-ldb driver and imx8qm-ldb driver respectively.
> 
> > #2 Keep imx-ldb-helper as a module, and implement support for using it
> > in the imx-ldb driver. Ideally I'd like to see the imx-ldb-helper
> > module patch in the same series as as imx53/6qdl switching to using
> > the module. These things have a tendency of not happening if not done
> > right away :)
> 
> As I mentioned before, the i.MX53/6qdl LDB driver(imx-ldb) is a DRM
> encoder driver.  It doesn't look straight-forward to include a header
> for bridge drivers there.
> 
> An alternative is to first convert imx-ldb to be a pure bridge
> driver(called imx53-ldb.c, perhaps) and to put it in
> drivers/gpu/drm/bridge/imx folder.  But, it's not an easy task, because
> the imx-drm for i.MX51/53/6dql IPU display controller needs to create
> DRM encoders & connectors instead, and the other relevant encoder
> drivers (imx-tve, parallel-display and dw_hdmi-imx) needs to be
> converted to bridge drivers as well.  This is not what this patch set
> can cover, IMHO. Perhaps, it will be done later on.
> 
> In all, it looks ok to keep imx-ldb-helper as a module and move the
> header(imx-ldb-helper.h) to the 'drivers' folder.  Agree?
> 
> Regards,
> Liu Ying
> 
> > 
> > > Regards,
> > > Liu Ying
> > > 
> > > > > @@ -0,0 +1,98 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > > > +
> > > > > +/*
> > > > > + * Copyright 2019,2020 NXP
> > > > > + */
> > > > > +
> > > > > +#ifndef __FSL_IMX_LDB__
> > > > > +#define __FSL_IMX_LDB__
> > > > > +
> > > > > +#include <linux/device.h>
> > > > > +#include <linux/kernel.h>
> > > > > +#include <linux/of.h>
> > > > > +#include <linux/regmap.h>
> > > > > +
> > > > > +#include <drm/drm_atomic.h>
> > > > > +#include <drm/drm_bridge.h>
> > > > > +#include <drm/drm_device.h>
> > > > > +#include <drm/drm_encoder.h>
> > > > > +#include <drm/drm_modeset_helper_vtables.h>
> > > > > +#include <drm/drm_panel.h>
> > > > > +
> > > > > +#define LDB_CH0_MODE_EN_TO_DI0         (1 << 0)
> > > > > +#define LDB_CH0_MODE_EN_TO_DI1         (3 << 0)
> > > > > +#define LDB_CH0_MODE_EN_MASK           (3 << 0)
> > > > > +#define LDB_CH1_MODE_EN_TO_DI0         (1 << 2)
> > > > > +#define LDB_CH1_MODE_EN_TO_DI1         (3 << 2)
> > > > > +#define LDB_CH1_MODE_EN_MASK           (3 << 2)
> > > > > +#define LDB_SPLIT_MODE_EN              (1 << 4)
> > > > > +#define LDB_DATA_WIDTH_CH0_24          (1 << 5)
> > > > > +#define LDB_BIT_MAP_CH0_JEIDA          (1 << 6)
> > > > > +#define LDB_DATA_WIDTH_CH1_24          (1 << 7)
> > > > > +#define LDB_BIT_MAP_CH1_JEIDA          (1 << 8)
> > > > > +#define LDB_DI0_VS_POL_ACT_LOW         (1 << 9)
> > > > > +#define LDB_DI1_VS_POL_ACT_LOW         (1 << 10)
> > > > > +
> > > > > +#define MAX_LDB_CHAN_NUM               2
> > > > > +
> > > > > +enum ldb_channel_link_type {
> > > > > +       LDB_CH_SINGLE_LINK,
> > > > > +       LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS,
> > > > > +       LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS,
> > > > > +};
> > > > > +
> > > > > +struct ldb;
> > > > > +
> > > > > +struct ldb_channel {
> > > > > +       struct ldb *ldb;
> > > > > +       struct drm_bridge bridge;
> > > > > +       struct drm_panel *panel;
> > > > > +       struct drm_bridge *next_bridge;
> > > > > +       struct device_node *np;
> > > > > +       u32 chno;
> > > > > +       bool is_available;
> > > > > +       u32 in_bus_format;
> > > > > +       u32 out_bus_format;
> > > > > +       enum ldb_channel_link_type link_type;
> > > > > +};
> > > > > +
> > > > > +struct ldb {
> > > > > +       struct regmap *regmap;
> > > > > +       struct device *dev;
> > > > > +       struct ldb_channel *channel[MAX_LDB_CHAN_NUM];
> > > > > +       unsigned int ctrl_reg;
> > > > > +       u32 ldb_ctrl;
> > > > > +       unsigned int available_ch_cnt;
> > > > > +};
> > > > > +
> > > > > +#define bridge_to_ldb_ch(b)    container_of(b, struct ldb_channel, bridge)
> > > > > +
> > > > > +bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch);
> > > > > +bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch);
> > > > > +
> > > > > +int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> > > > > +                                  struct drm_bridge_state *bridge_state,
> > > > > +                                  struct drm_crtc_state *crtc_state,
> > > > > +                                  struct drm_connector_state *conn_state);
> > > > > +
> > > > > +void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> > > > > +                               const struct drm_display_mode *mode,
> > > > > +                               const struct drm_display_mode *adjusted_mode);
> > > > > +
> > > > > +void ldb_bridge_enable_helper(struct drm_bridge *bridge);
> > > > > +
> > > > > +void ldb_bridge_disable_helper(struct drm_bridge *bridge);
> > > > > +
> > > > > +int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> > > > > +                            enum drm_bridge_attach_flags flags);
> > > > > +
> > > > > +int ldb_init_helper(struct ldb *ldb);
> > > > > +
> > > > > +int ldb_find_next_bridge_helper(struct ldb *ldb);
> > > > > +
> > > > > +void ldb_add_bridge_helper(struct ldb *ldb,
> > > > > +                          const struct drm_bridge_funcs *bridge_funcs);
> > > > > +
> > > > > +void ldb_remove_bridge_helper(struct ldb *ldb);
> > > > > +
> > > > > +#endif /* __FSL_IMX_LDB__ */
> > > > > --
> > > > > 2.7.4
> > > > > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
