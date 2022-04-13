Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18C54FF489
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 12:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C455D10EF0A;
	Wed, 13 Apr 2022 10:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF7310EEFF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 10:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbgqTVxNHgehn7Q43OuCogRIzn7bPIHO1TXpG93691va5AVKrFFKgpV7Q3+ISK0VHL5XLtW548Q7c9ntE5/wQQf4+5mIa2KhdwW3Ye9zRiwZlIaiIz+b8Xg/SBb6S61kUvmLMgjnombe/U1k6mmgE3tic5DRy7iSAb4j6it10gC1/JrTOmNpC6MhPNfKbx7E/8D/T8vBeWphn6zVS9H4xJu5hhM4rcxEs+0MHkOeQktAbQXpSRJYsaXK4FqWimH7Te91xEbdHflloCXjreE4ftuB92unrwE6A3GnpE6dKQ37fkT3hU6oW0UmMWNUrp7dt0Gjn1JoWVBUdg2e9tYTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCWpXhMAHX0D7cybjIhjmJt6XxBP0ItiILTpd2ss3rs=;
 b=MEiC8o2xMp6FJCWM5u4nXJTxMEZnhZoTRJpJXmNU6hblyciOEQMVHyxBQukwXwXfr1HsJ8JTtfaD2BN97glVyF4FfpgC2TzyoUeB412XFqrHcv9Vu00xCYJTU7cPUuIsxsDjdjqr+SEQx+bmP818ps+PuYFnT2qMcVXEDyKVFZe2wOZ/3h4FGz92Y2JG4dr+lkRKBe1TaqBShTig645SFZvrhwBO4YhUaa9Qh6jRqJDWsaMNJCRkLrT9nadzpwvBvC0wUAXTUjiuHwGW6sLzF8TodLFqICxTY3K0/cthNyQJREWcQKOoorhmaRlfwnhKR1WTgislTfICZJsa/VzCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCWpXhMAHX0D7cybjIhjmJt6XxBP0ItiILTpd2ss3rs=;
 b=M4E8BqGdtaYTw0u9kPsvwgTQpZhJDlFcXrDK18Mx+baIrp71khwbe08/mMoevGhYgEY1Mx8YZBzTko/TAiZvwS4kaO5LBfIt4mOj27Li6Q8ekz9s4nhqpdHhw7EEbkS0Xf6UlLE3wFGbDApmMbXC1q2evC7mWUI6xVr7w3eBKU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB6118.eurprd04.prod.outlook.com (2603:10a6:20b:b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 13 Apr
 2022 10:17:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 10:17:07 +0000
Message-ID: <54c1b0dd9cd067f326991a8ff874a6e910500aae.camel@nxp.com>
Subject: Re: [PATCH v6 resend 5/5] phy: freescale: phy-fsl-imx8-mipi-dphy:
 Add i.MX8qxp LVDS PHY mode support
From: Liu Ying <victor.liu@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Date: Wed, 13 Apr 2022 18:16:56 +0800
In-Reply-To: <YlZr7bhjw6nwz8IM@matsya>
References: <20220402052451.2517469-1-victor.liu@nxp.com>
 <20220402052451.2517469-6-victor.liu@nxp.com> <YlZr7bhjw6nwz8IM@matsya>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HKAPR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:203:d0::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a041f193-c78b-4bd0-b1a9-08da1d36c38f
X-MS-TrafficTypeDiagnostic: AM6PR04MB6118:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB6118F40E201AE9348C94946998EC9@AM6PR04MB6118.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xE1zM9psi2Njq0fU5im2FAzZec6GuDy/V8Ptv0o88QhIiuwz8i+nZUWXjPHDmn4EZo3v87Te1zcWyA2HuaxXYRfS2vJXOToBA9axfqCZQNe+nIEEQZ64TuwXcAw6XDHZj7jp2MMSFC+6RCA5Aq3idCwrd18JrbfqVkBi6TbvBaYLbtM0e8Kg7zJg6TLETwGaPILIYonxPHenDwfZhECf2477ITprXCY+WRBjNJWv/SwmqPas6dWSCsJgpwDkC+bzqJZj5QG7djqWnX/HFA2E3Y9lcYTG3siRupdVr51OBRvknQIocROptLRZ9x0znUY52ybjGQfmCr5Yd8zadvU2QMVZsXfgiSSxIUxB7142374nK8+AZQPACGmi8ecf0ydq6o0/NsMVALd1gVmTX9+9o1KqstOENk/PAQNpwAqDmIkznd72z3MAP/d1H3/b6Xx+ckHtZYX8yKq9KC0BhUyCPHEpPWtrcm/hWNHFSl51LkrNG/RSXIWitxjLEAgd9gCikViuBxE6vxSlho7X4MbClIHpYDaFZ7JKUoZKoRMDXQuZh7wEW/yMcQqhf0KiIfhZ3mkjPyHIeYyj0DYBahmHOAZ8iggS6xJK7Zypz2Xu8MW63sERGwBiIpb4+jn72N3G7ST6j+A+4url42HRZH90kw4WxPKPrF2ytc8NxH4EwcbVffTQ7mWMqXJFHASbXuKV4jQuAU7jdA99xgahHoNf/BZfkdaWUvUT67wIX6z6T64=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(26005)(316002)(66574015)(5660300002)(6512007)(7416002)(186003)(6506007)(6666004)(6916009)(83380400001)(52116002)(53546011)(2616005)(38100700002)(2906002)(38350700002)(4326008)(8676002)(66946007)(66476007)(66556008)(8936002)(86362001)(6486002)(508600001)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mjg1Zlk3ek16eENCUXUrT0QwUHRoNGdCNEhEOE9ZcFk5bDFCYkNwL3M2Q0tn?=
 =?utf-8?B?R01NTnpwbUhpdEhVVkprT285SkZwdWZzbUVtUUJXMHlLMVZ2NkFvaC9wWi9u?=
 =?utf-8?B?Vkk1czE5OWFzTmZERW9WZFdxaVg0WVhoNStuZ1VzbGJJRXBlK1puSlNRNXIy?=
 =?utf-8?B?cFlITUN1RUxQWnBaZ3BZcW85QkZsT2hvV0ZHU2xQSnlSYnF5SHIxd2Yzc3RR?=
 =?utf-8?B?Q2psbzFmK3lseVp6YUZQR0ZScXFGMVh3d2xPOFFZWGxmT1dTcDNpdTdUTUtw?=
 =?utf-8?B?Um9BczJzQkgvdGd6QnJMVlZoVTI4aW13aE94SHgvZWdyOERvL1ZOL1FQN0JU?=
 =?utf-8?B?cGxScnFQQVRIcmhiWnVnN0lraUFtV1JudkdRQmRpbERUMlFmc0xISTVKRUor?=
 =?utf-8?B?c2t6TkRZZkh6Q2tnYU5EVmlTNWIyUnBtdDF4YkdCdkJhMkF3c3laRTlscmdo?=
 =?utf-8?B?RTBKQ2xwT3RwWVZXMzdya3d2QUUxWDZwUnYzZ3BiSWp6R1NUenM1T3FGUHhq?=
 =?utf-8?B?RHpVaDN0aGNLSTVBZnpJb3Z4SjBVVWpsVnpQSjVyYXd5bFRxZDJGbzJzNzVO?=
 =?utf-8?B?czk1V2lMODRLR1dKUlZ5Rm52Zm1WdzQxU2E3bTFmdHI2bHJXbVNHU2FEeDE1?=
 =?utf-8?B?c0RuQlBSeExmVzh3ZG4xdXpGSmM5ZkMxSU9ZSUgyNnd0bWtSN0w0cXFxWG41?=
 =?utf-8?B?bTVXaEtUOGhka2hhbWEvbUMrd09yTmU3K1JwNnA5TGxHdWE1WW5QaDkzc3Ji?=
 =?utf-8?B?OEJ3U3VYek1BWU82aWFoNTVINTlRRGtqajdORHVhZjRpTmY0Q2MwQjh5R1lN?=
 =?utf-8?B?MU1IVmU1ZFk1NC9aVzhTTlZTSTljeE55WFoxVXR5alg1cTlUTWlxQXVveXl3?=
 =?utf-8?B?RitWdnZpUVZjcWVEV0hTcjFTVUZlZUVXMWVyT0htMzBhWmU4MU04bHhHTzB3?=
 =?utf-8?B?R0dzZ2lWUWM4K0l2UEpnZ0hadkxUSkNMc1FxTy83WEZlRGp0UkpIaDVSd0Y2?=
 =?utf-8?B?R2NjWkN2Yk01em1qZThKL0E1MVB4K2FuSlkzYkF0YmVlOVgwc2xsRkxRYnpo?=
 =?utf-8?B?ck04cTBXRHJaSVMxV2JMN2pSUnVLbFhvWisvOHpFYWRKeUdZai9kbTEzM0F4?=
 =?utf-8?B?ZUhtZU9UaG5ORmdzbHdKcWtHUzBQcWYxYWFwTDMyUytDRjBHV3RieDlWUHhl?=
 =?utf-8?B?YS85d0h3cFZCS3NvdWxaZk1POXFoTkNRNzJLWE41S1ZrSVhrcm55cGRvMFNr?=
 =?utf-8?B?VVdnMWFFQ2hsWlN6alJzb2xtTDNaWi9BVnNpRnA5M0QzM1RGLzhLNkpMQklQ?=
 =?utf-8?B?eXZwcGVXWk92MndlaWd5TlpQRlRTZEorZUpqbHZuaDFlQ0x3NHdzM0FCV2VB?=
 =?utf-8?B?ay92blI1dmZ2RzBXVmsrWld4VSs0NVN6bVRGeFNyWVFsNk0xbXJCOVhvNHpI?=
 =?utf-8?B?bmszV3crM3UzZ2ZXYkF6NTlycWl1ZEwwZk5LeFRSZkRsSTNzOG9Yb2tGeW9F?=
 =?utf-8?B?MHJpdHRjMVNvUHVabkRsQk5mUFVLWVU2WHJHOEJ4a3BEU0JZTFdrZGZ4OC9s?=
 =?utf-8?B?OUhTeS9BUEprRXJ5aU5UQ0NQcjNPUjc1SlZqUVhMcDFSb05tRnVKTCtkUUli?=
 =?utf-8?B?NE1NOExudTg2WmJZOWVMY0hsQ2RkSjFndmJuaGJrNnJDcmpTZFhoYVExSzZk?=
 =?utf-8?B?bXFXK2tSclVDdWFhd0kxbTA5d0xjZXhURmZVbFNuR1ZCeWZIQjVyaXNjd2cv?=
 =?utf-8?B?amVnM3RSN1pWVGlOM0RHQXhFMHR4eCtWNUZPNTEwSGtKMGxuTWMzK3Q3ZUV4?=
 =?utf-8?B?UzI1bTU4dEhCc0FtVUlSVU0zQjhvR2FNNzNrT05ONGJiTFN0UFdlNlNkc2d1?=
 =?utf-8?B?VVBHRVJ1N0ZpWk15MjhlN0w3OUg3c1R4MWRiQm5jZFlGNllhRnRvZkNIWmRz?=
 =?utf-8?B?RTlkckpkSzRDSk5jbjZjd3VIRlhHWlRHeXl2N2dMUTM3S1FHRm9HZ3I5WWpv?=
 =?utf-8?B?NFgzaTFtODNqbU5Ca0dSbUlkRFZITkxhVkxBUDZPQ2NNZGh6ZzI0dThLQUp6?=
 =?utf-8?B?T2g3UlI3M1NrdlZuTDE3WjQ3TUR6UHZYWnBMQjRIUll3ankyNjdzaEdpd1hy?=
 =?utf-8?B?c3p5VGplZXEwNVVIY2gwV296V0szUklqeG9SZ0RQYkFveExCQnFXT2c0U2hZ?=
 =?utf-8?B?enJ3L0MzYjVKalliOGZpeFQ0dkgwby9YL3hBczhWa0FSNUNhanVFVmE4cnF6?=
 =?utf-8?B?OTRqbDNSQzFtdGEyN3MwMmZ0eDFnTnR4c3pBbjkyVElzQkhBN29PZEc5d1FE?=
 =?utf-8?B?MEJZaHlrd2QxYUZvTWlkL09XWHNCeXNyTDdRK2xzbkdIeGhvK2RXdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a041f193-c78b-4bd0-b1a9-08da1d36c38f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 10:17:07.4322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vmBviTptW2kpWvtNQuZkjyfEg2mNZnk9wgCOy8fdkRuIzSt4TyV6ZfNyt+scmyVADcM+qXlvkt2dQg1AzuSHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6118
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, linux-phy@lists.infradead.org,
 martin.kepplinger@puri.sm, jernej.skrabec@gmail.com, kishon@ti.com,
 linux-imx@nxp.com, robert.chiras@nxp.com, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

On Wed, 2022-04-13 at 11:51 +0530, Vinod Koul wrote:
> On 02-04-22, 13:24, Liu Ying wrote:
> > i.MX8qxp SoC embeds a Mixel MIPI DPHY + LVDS PHY combo which
> > supports
> > either a MIPI DSI display or a LVDS display.  The PHY mode is
> > controlled
> > by SCU firmware and the driver would call a SCU firmware function
> > to
> > configure the PHY mode.  The single LVDS PHY has 4 data lanes to
> > support
> > a LVDS display.  Also, with a master LVDS PHY and a slave LVDS PHY,
> > they
> > may work together to support a LVDS display with 8 data
> > lanes(usually, dual
> > LVDS link display).  Note that this patch supports the LVDS PHY
> > mode only
> > for the i.MX8qxp Mixel combo PHY, i.e., the MIPI DPHY mode is yet
> > to be
> > supported, so for now error would be returned from ->set_mode() if
> > MIPI
> > DPHY mode is passed over to it for the combo PHY.
> > 
> > Cc: Guido Günther <agx@sigxcpu.org>
> > Cc: Robert Chiras <robert.chiras@nxp.com>
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Reviewed-by: Guido Günther <agx@sigxcpu.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v5->v6:
> > * No change.
> > 
> > v4->v5:
> > * No change.
> > 
> > v3->v4:
> > * Add Guido's R-b tag.
> > 
> > v2->v3:
> > * Improve readability of mixel_dphy_set_mode(). (Guido)
> > 
> > v1->v2:
> > * Print invalid PHY mode in dmesg. (Guido)
> > 
> >  .../phy/freescale/phy-fsl-imx8-mipi-dphy.c    | 269
> > +++++++++++++++++-
> >  1 file changed, 258 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
> > b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
> > index a95572b397ca..af1ecda091c7 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
> > @@ -4,17 +4,31 @@
> >   * Copyright 2019 Purism SPC
> >   */
> >  
> > +#include <linux/bitfield.h>
> >  #include <linux/clk.h>
> >  #include <linux/clk-provider.h>
> >  #include <linux/delay.h>
> > +#include <linux/firmware/imx/ipc.h>
> > +#include <linux/firmware/imx/svc/misc.h>
> >  #include <linux/io.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > +#include <dt-bindings/firmware/imx/rsrc.h>
> > +
> > +/* Control and Status Registers(CSR) */
> > +#define PHY_CTRL			0x00
> > +#define  CCM_MASK			GENMASK(7, 5)
> > +#define  CCM(n)				FIELD_PREP(CCM_MASK,
> > (n))
> > +#define  CA_MASK			GENMASK(4, 2)
> > +#define  CA(n)				FIELD_PREP(CA_MASK,
> > (n))
> > +#define  RFB				BIT(1)
> > +#define  LVDS_EN			BIT(0)
> >  
> >  /* DPHY registers */
> >  #define DPHY_PD_DPHY			0x00
> > @@ -55,8 +69,15 @@
> >  #define PWR_ON	0
> >  #define PWR_OFF	1
> >  
> > +#define MIN_VCO_FREQ 640000000
> > +#define MAX_VCO_FREQ 1500000000
> > +
> > +#define MIN_LVDS_REFCLK_FREQ 24000000
> > +#define MAX_LVDS_REFCLK_FREQ 150000000
> > +
> >  enum mixel_dphy_devtype {
> >  	MIXEL_IMX8MQ,
> > +	MIXEL_IMX8QXP,
> >  };
> >  
> >  struct mixel_dphy_devdata {
> > @@ -65,6 +86,7 @@ struct mixel_dphy_devdata {
> >  	u8 reg_rxlprp;
> >  	u8 reg_rxcdrp;
> >  	u8 reg_rxhs_settle;
> > +	bool is_combo;	/* MIPI DPHY and LVDS PHY combo */
> >  };
> >  
> >  static const struct mixel_dphy_devdata mixel_dphy_devdata[] = {
> > @@ -74,6 +96,10 @@ static const struct mixel_dphy_devdata
> > mixel_dphy_devdata[] = {
> >  		.reg_rxlprp = 0x40,
> >  		.reg_rxcdrp = 0x44,
> >  		.reg_rxhs_settle = 0x48,
> > +		.is_combo = false,
> > +	},
> > +	[MIXEL_IMX8QXP] = {
> > +		.is_combo = true,
> >  	},
> >  };
> >  
> > @@ -95,8 +121,12 @@ struct mixel_dphy_cfg {
> >  struct mixel_dphy_priv {
> >  	struct mixel_dphy_cfg cfg;
> >  	struct regmap *regmap;
> > +	struct regmap *lvds_regmap;
> >  	struct clk *phy_ref_clk;
> >  	const struct mixel_dphy_devdata *devdata;
> > +	struct imx_sc_ipc *ipc_handle;
> > +	bool is_slave;
> > +	int id;
> >  };
> >  
> >  static const struct regmap_config mixel_dphy_regmap_config = {
> > @@ -317,7 +347,8 @@ static int mixel_dphy_set_pll_params(struct phy
> > *phy)
> >  	return 0;
> >  }
> >  
> > -static int mixel_dphy_configure(struct phy *phy, union
> > phy_configure_opts *opts)
> > +static int
> > +mixel_dphy_configure_mipi_dphy(struct phy *phy, union
> > phy_configure_opts *opts)
> 
> Please dont change things like this.. A patch should do only one
> thing :)

The function name is changed by purpose - the phy in i.MX8qxp SoC is a
combo phy(lvds or mipi dphy). The new function name can be
distinguished from the added function mixel_dphy_configure_lvds_phy().

> 
> >  {
> >  	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
> >  	struct mixel_dphy_cfg cfg = { 0 };
> > @@ -345,15 +376,121 @@ static int mixel_dphy_configure(struct phy
> > *phy, union phy_configure_opts *opts)
> >  	return 0;
> >  }
> >  
> > +static int
> > +mixel_dphy_configure_lvds_phy(struct phy *phy, union
> > phy_configure_opts *opts)
> > +{
> > +	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
> > +	struct phy_configure_opts_lvds *lvds_opts = &opts->lvds;
> > +	unsigned long data_rate;
> > +	unsigned long fvco;
> > +	u32 rsc;
> > +	u32 co;
> > +	int ret;
> > +
> > +	priv->is_slave = lvds_opts->is_slave;
> 
> I think you should check if lvds_opts is valid before dereferencing
> it..

In next verstion, I may check !opts in mixel_dphy_configure() for both
lvds and mipi dphy.

> 
> > +
> > +	/* LVDS interface pins */
> > +	regmap_write(priv->lvds_regmap, PHY_CTRL, CCM(0x5) | CA(0x4) |
> > RFB);
> 
> can we avoid magic numbers?

Will add macros CCM_1_2V and CA_3_51MA in next version.

> 
> > +
> > +	/* enable MODE8 only for slave LVDS PHY */
> > +	rsc = priv->id ? IMX_SC_R_MIPI_1 : IMX_SC_R_MIPI_0;
> > +	ret = imx_sc_misc_set_control(priv->ipc_handle, rsc,
> > IMX_SC_C_DUAL_MODE,
> > +				      lvds_opts->is_slave);
> > +	if (ret) {
> > +		dev_err(&phy->dev, "Failed to configure MODE8: %d\n",
> > ret);
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * Choose an appropriate divider ratio to meet the requirement
> > of
> > +	 * PLL VCO frequency range.
> > +	 *
> > +	 *  -----  640MHz ~ 1500MHz   ------------      ---------------
> > +	 * | VCO | ----------------> | CO divider | -> | LVDS data
> > rate|
> > +	 *  -----       FVCO          ------------      ---------------
> > +	 *                            1/2/4/8 div     7 *
> > differential_clk_rate
> > +	 */
> > +	data_rate = 7 * lvds_opts->differential_clk_rate;
> > +	for (co = 1; co <= 8; co *= 2) {
> > +		fvco = data_rate * co;
> > +
> > +		if (fvco >= MIN_VCO_FREQ)
> > +			break;
> > +	}
> > +
> > +	if (fvco < MIN_VCO_FREQ || fvco > MAX_VCO_FREQ) {
> > +		dev_err(&phy->dev, "VCO frequency %lu is out of
> > range\n", fvco);
> > +		return -ERANGE;
> > +	}
> > +
> > +	/*
> > +	 * CO is configurable, while CN and CM are not,
> > +	 * as fixed ratios 1 and 7 are applied respectively.
> > +	 */
> > +	phy_write(phy, __ffs(co), DPHY_CO);
> > +
> > +	/* set reference clock rate */
> > +	clk_set_rate(priv->phy_ref_clk, lvds_opts-
> > >differential_clk_rate);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mixel_dphy_configure(struct phy *phy, union
> > phy_configure_opts *opts)
> > +{
> > +	if (phy->attrs.mode == PHY_MODE_MIPI_DPHY)
> > +		return mixel_dphy_configure_mipi_dphy(phy, opts);
> > +	else if (phy->attrs.mode == PHY_MODE_LVDS)
> > +		return mixel_dphy_configure_lvds_phy(phy, opts);
> > +
> > +	dev_err(&phy->dev,
> > +		"Failed to configure PHY with invalid PHY mode: %d\n",
> > +							phy-
> > >attrs.mode);
> 
> single line for this please

Will do.

> 
> > +	return -EINVAL;
> > +}
> > +
> > +static int
> > +mixel_dphy_validate_lvds_phy(struct phy *phy, union
> > phy_configure_opts *opts)
> > +{
> > +	struct phy_configure_opts_lvds *lvds_cfg = &opts->lvds;
> > +
> > +	if (lvds_cfg->bits_per_lane_and_dclk_cycle != 7) {
> > +		dev_err(&phy->dev, "Invalid bits per LVDS data lane:
> > %u\n",
> > +					lvds_cfg-
> > >bits_per_lane_and_dclk_cycle);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (lvds_cfg->lanes != 4) {
> > +		dev_err(&phy->dev, "Invalid LVDS data lanes: %u\n",
> > +						lvds_cfg->lanes);
> 
> here too, make it better read

Ok.

> 
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (lvds_cfg->differential_clk_rate < MIN_LVDS_REFCLK_FREQ ||
> > +	    lvds_cfg->differential_clk_rate > MAX_LVDS_REFCLK_FREQ) {
> > +		dev_err(&phy->dev,
> > +			"Invalid LVDS differential clock rate: %lu\n",
> > +					lvds_cfg-
> > >differential_clk_rate);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int mixel_dphy_validate(struct phy *phy, enum phy_mode
> > mode, int submode,
> >  			       union phy_configure_opts *opts)
> >  {
> > -	struct mixel_dphy_cfg cfg = { 0 };
> > +	if (mode == PHY_MODE_MIPI_DPHY) {
> > +		struct mixel_dphy_cfg mipi_dphy_cfg = { 0 };
> >  
> > -	if (mode != PHY_MODE_MIPI_DPHY)
> > -		return -EINVAL;
> > +		return mixel_dphy_config_from_opts(phy, &opts-
> > >mipi_dphy,
> > +							&mipi_dphy_cfg)
> > ;
> 
> the line should be justified to previos line open brace (checkpatch
> --strict will warn you about this style miss)

Ok. Will suppress all 'checkpatch --strict' warnings.

Regards,
Liu Ying

