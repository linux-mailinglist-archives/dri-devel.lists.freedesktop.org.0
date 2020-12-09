Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A05502D3D7E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7D26E9D6;
	Wed,  9 Dec 2020 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10053.outbound.protection.outlook.com [40.107.1.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DC66E9CC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 01:22:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmxTcNYxKpoq7Rp4WxBbwymWC0FHxxnMKl7+fusVq31Yva1yY6y9jOmYsj0Pa4RK2//jEZLXAk+0M+5aHg9ytfW1KRBFkK72Hnen6dptfr85AtuZUqe7qn46RvPRTaNGUDsqq9EWf5j1iuR0jJg6uYEMpDmLiV5hWOsvACLlcJdzFYzlQCalTifOQXJDLqz44Pnva7wBY1nkZA3k3t01tnEElcJUOpM9r6jyTzI2kYGuxm5cFi34FFdlJgaT+eXUkUL+8Bkg32zBsLNKGj7LCSRVa6k8D7eTJnEdy3BRJ/KDI0QI5m2o9p4epjBiEwPFJWZxMMr8GaDzrlwZNjDKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1Iw3rxj86ImFzbcRAJr26U4EZB9uf0XuxSV/PoU7pw=;
 b=P6f+ZVmlMFpEXUa7GFeKZf+8hhbYKxG7t5Ync1h92Xl8QObmAVL/KntqNTjorJSaSSSJXgD4Fi6VY5/6/CZXNLcCvbkI/NaOsj+4nL4241H7cnuz+ru9Ez2BSh4CMlgYgLwVdEOPSJBkZOKp0uz6J5/6hocvJiSQ7kQnfiSXZy6DJg6tULNdawTrqnUjFYNVHiZzPr0L2fPlKjcNO1Ptvw+D3qmyQxUMvEvKi5SViqajbT9scESbeXQjboh/rzNQyNnRrP5bSocGxyajt7YHOfyLt6nauhHjlWSBpiR2SJX805sCS50PxB7944wzOCXhh4SAzjz/Vm4hJ5TCHLCXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1Iw3rxj86ImFzbcRAJr26U4EZB9uf0XuxSV/PoU7pw=;
 b=ng5kUXjZpTxaTF82EXdY2G1OyQ860JXhKqh1hm7QycVPXIQFFe01JAKCbD8LnPB4GGOCbGh/zG+a4VK6WRDDwjJ0ZmZstLyrndo8R7HYbMlL3Pg88jVcLqIzDzenArFnRCKSg4g+3NOpQ/1tUZADxPZSU+L+OgBEoaEksGuLuDg=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (10.171.182.16) by
 VI1PR0402MB3423.eurprd04.prod.outlook.com (52.134.4.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.19; Wed, 9 Dec 2020 01:22:33 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 01:22:32 +0000
Message-ID: <c0077d1152adf2110cdbcf3f0b3e7fa20ad8256c.camel@nxp.com>
Subject: Re: [PATCH 2/4] phy: Add LVDS configuration options
From: Liu Ying <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 09 Dec 2020 09:20:40 +0800
In-Reply-To: <X89z3czlY1yxgsX3@pendragon.ideasonboard.com>
References: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
 <1607067224-15616-3-git-send-email-victor.liu@nxp.com>
 <X89z3czlY1yxgsX3@pendragon.ideasonboard.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0181.apcprd04.prod.outlook.com
 (2603:1096:4:14::19) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR04CA0181.apcprd04.prod.outlook.com (2603:1096:4:14::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 01:22:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e0afbfd6-c7c6-49f7-920d-08d89be0e6fa
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3423:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB342325B1A4BC5CF319CAFDB498CC0@VI1PR0402MB3423.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QT40KPGVCxsDS46jlyHyKFj3py+Hn9H1Pu6hkOOEOTF71c2LO12K7yOPUL2aKTgEfZ73eEL6dy34tgbgRGmkxVFoL8erCQlkqcy8W7YPqP5jG55rVLa16h7KwWCtHI2cPBjAGAUW5GTfq8huALMXvRL6vK5iFSHqbvil0hln2hLGWzRst+p28Qmr3oSApPndO9Tp5zbPml/hLSKm9UUdtYG5e6CZSkObNSjlsy806d/EoLR8PjPrVgi7WR5/8LjhzT+RbPryySHqVk6ogZP8P/VT7vh8N14CM310h5LF7ZrLfWxX3bb02+G+SHJ4NB6yHUL1acDvc5nw1yTWKkHR+XTY/c9wI4cFid68YB9aYhq9TTqaKyZUQonMkYPuoYLn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(6666004)(6916009)(6486002)(956004)(2616005)(7416002)(8676002)(4326008)(83380400001)(508600001)(86362001)(2906002)(8936002)(6512007)(66556008)(5660300002)(16526019)(66476007)(52116002)(26005)(36756003)(186003)(6506007)(66946007)(34490700003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?am1WWHpLR0kwQzNqb3NFVkw5d3Z6Rnd2b2tUVVpjSXE4d01yQXZxM0FqNEdO?=
 =?utf-8?B?TWYrbjg5T1dUSjFyUG8yNHVIRml1TFErbEtOUDE1bFVtUUtWWlBZVkpKQTNR?=
 =?utf-8?B?VGllZm1DTHZTa1JHTFZCRnV0cjZGNGpWblkvd3lUbnV1N3dpVmIyb1pGY01j?=
 =?utf-8?B?Qk5EeUg2RHo5UlJ4L0xxaXJlY2ZCbVIxZDArbHlqVlB4L3lFeTYyTWR4Q3Bu?=
 =?utf-8?B?cm9LQlU3R0pleW5GTE1Fc05tQjlYZ0U0TmFEWXpjZFJndmd0V1lCVExzK2RI?=
 =?utf-8?B?c0VKeEt1TnVURjFhVWY3a1dtN3hDbmUrQm1JK0VJN2Y5WSt5OENSVFJ4alVm?=
 =?utf-8?B?NmxpQkpFTnpBMk5lclVMajdwckVhYUJaMU1LRzE0UGk5NUNSdENrNGRxU2tq?=
 =?utf-8?B?elNkVUxhRWdlOG9SZ3BPVFhUYVlsVWZWZHkvOWNvellWOUtuQUQwREJkMHZ2?=
 =?utf-8?B?TmJCUmdGa1ZVTTRFQjBmR016S0dtNWV4alhoY0RzRmZZL1pIWnc4ZnYzRmVO?=
 =?utf-8?B?RGVWM0RYbHorblRYeEw3akZ6cjJkUU9pSUI3RXVxaTdBVEVIeXhqbEdyNUxK?=
 =?utf-8?B?a2kxMEFGTVhRWXEvTzNVam1pT0F6eGxTcmtQNUhDY29qVkkvdElHSi9oM0do?=
 =?utf-8?B?b3lKZFZ4V283OWptdW1ScG0wNU1RZkdnQ3l3bmkyVDBrSHpwZ3hZbHFRTmpX?=
 =?utf-8?B?YXdyWWFvZXViRm11cWRqSjhDemluM0xVbmF3VmZmUnh1eXVBUWx0UjRLcHRE?=
 =?utf-8?B?c1U3NHZkZVRBK3YxMnNOSG8xUWxHZ3Jldm05a2tFQ1didmovOW9hdUFrTis0?=
 =?utf-8?B?NU02SzZNMUxqdHRlL1E3K2hoSFZJQ3Fjd2g5N1BiK0lYMVF1WlVjQ1h1dUlC?=
 =?utf-8?B?ajI4UldTTVliemRQV3ZqWExVOXNHKytCdDIyZFdjaG5hSklRTk90NWdTNWdR?=
 =?utf-8?B?SlBia09GeEN2SHFYbWwvV0VWdlBDZytZTWV3NnpEMjJVajZNQXFuSHo0NXNL?=
 =?utf-8?B?VXU3bldUT3RuMUhHa1E2c1dkclNsbjNMc29YNURTclljdGRnMVpYdkNlUkFv?=
 =?utf-8?B?S280UFkwWFVoY0RnV1luUmoxdWlBb2JseDJmMzBWcE91RlpDNU0vUEswdHlw?=
 =?utf-8?B?WDhJQjBPNkphNE9TSkRqWGlQa3d2MUc1ZTExMDA4NWJxNTA0VUs2YmcwUXRU?=
 =?utf-8?B?Qkw4bElsV3VkZ2RzNHBjeXZXS1dqaWQrTlZTUVpxYWNldVdhdklNMlFCY0lo?=
 =?utf-8?B?d1JzMVBrMnI4NHJRVUlKMWJ0WFdNanJqNlRCWUdOS2hHSE5SN1EybEl5Qm5T?=
 =?utf-8?Q?sO4eMpIWmj9OI9HN59qRUaKD+vle/AU17N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 01:22:32.1346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: e0afbfd6-c7c6-49f7-920d-08d89be0e6fa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qg5UQAWdWcaiWHEi8n6Uvy8JSXqPkiqjdHNGoi4PkWFRmKC6ClnOe2h1ura1RHC7EcxNtPL/WXYk5IftzhYplA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3423
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org,
 linux-imx@nxp.com, robert.chiras@nxp.com, martin.kepplinger@puri.sm,
 shawnguo@kernel.org, agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Tue, 2020-12-08 at 14:38 +0200, Laurent Pinchart wrote:
> Hi Liu,
> 
> Thank you for the patch.
> 
> On Fri, Dec 04, 2020 at 03:33:42PM +0800, Liu Ying wrote:
> > This patch allows LVDS PHYs to be configured through
> > the generic functions and through a custom structure
> > added to the generic union.
> > 
> > The parameters added here are based on common LVDS PHY
> > implementation practices.  The set of parameters
> > should cover all potential users.
> > 
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  include/linux/phy/phy-lvds.h | 48 ++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/phy/phy.h      |  4 ++++
> >  2 files changed, 52 insertions(+)
> >  create mode 100644 include/linux/phy/phy-lvds.h
> > 
> > diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-lvds.h
> > new file mode 100644
> > index 00000000..1b5b9d6
> > --- /dev/null
> > +++ b/include/linux/phy/phy-lvds.h
> > @@ -0,0 +1,48 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright 2020 NXP
> > + */
> > +
> > +#ifndef __PHY_LVDS_H_
> > +#define __PHY_LVDS_H_
> > +
> > +/**
> > + * struct phy_configure_opts_lvds - LVDS configuration set
> > + *
> > + * This structure is used to represent the configuration state of a
> > + * LVDS phy.
> > + */
> > +struct phy_configure_opts_lvds {
> > +	/**
> > +	 * @bits_per_lane_and_dclk_cycle:
> > +	 *
> > +	 * Number of bits per data lane and differential clock cycle.
> > +	 */
> > +	unsigned int bits_per_lane_and_dclk_cycle;
> 
> I see in patch 4/4 that you only support 7, can the value be any
> different ?

Patch 4/4 is for the Mixel combo PHY embedded in i.MX8qxp SoC.
This PHY can only do 7.

i.MX8qm SoC embeds another type of Mixel LVDS PHY which can do either 7
or 10(configurable with a register bit called 'NB').  A PHY driver for
it is yet to be upstreamed.

Regards,
Liu Ying

> 
> > +
> > +	/**
> > +	 * @differential_clk_rate:
> > +	 *
> > +	 * Clock rate, in Hertz, of the LVDS differential clock.
> > +	 */
> > +	unsigned long differential_clk_rate;
> > +
> > +	/**
> > +	 * @lanes:
> > +	 *
> > +	 * Number of active, consecutive, data lanes, starting from
> > +	 * lane 0, used for the transmissions.
> > +	 */
> > +	unsigned int lanes;
> > +
> > +	/**
> > +	 * @is_slave:
> > +	 *
> > +	 * Boolean, true if the phy is a slave which works together
> > +	 * with a master phy to support dual link transmission,
> > +	 * otherwise a regular phy or a master phy.
> > +	 */
> > +	bool is_slave;
> > +};
> > +
> > +#endif /* __PHY_LVDS_H_ */
> > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > index e435bdb..d450b44 100644
> > --- a/include/linux/phy/phy.h
> > +++ b/include/linux/phy/phy.h
> > @@ -17,6 +17,7 @@
> >  #include <linux/regulator/consumer.h>
> >  
> >  #include <linux/phy/phy-dp.h>
> > +#include <linux/phy/phy-lvds.h>
> >  #include <linux/phy/phy-mipi-dphy.h>
> >  
> >  struct phy;
> > @@ -51,10 +52,13 @@ enum phy_mode {
> >   *		the MIPI_DPHY phy mode.
> >   * @dp:		Configuration set applicable for phys supporting
> >   *		the DisplayPort protocol.
> > + * @lvds:	Configuration set applicable for phys supporting
> > + *		the LVDS phy mode.
> >   */
> >  union phy_configure_opts {
> >  	struct phy_configure_opts_mipi_dphy	mipi_dphy;
> >  	struct phy_configure_opts_dp		dp;
> > +	struct phy_configure_opts_lvds		lvds;
> >  };
> >  
> >  /**

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
