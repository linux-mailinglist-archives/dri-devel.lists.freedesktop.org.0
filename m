Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 749213510F4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 10:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2126E0FE;
	Thu,  1 Apr 2021 08:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130085.outbound.protection.outlook.com [40.107.13.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC256E0FE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 08:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pc675tHkb+z7knXXUS85FnXRSeSVLZf8LIhBp3xc+wSxSOLq8PRB2f8lu17EPz/Pi/DPcAdf6G0ba4wHzAavdGPu5aK9kWlg/lpGJwm8GkHKVt5VzhYCZ2rqlZLIhItBvR76aeTBj/btPuIWPRC2L66Qw58TVzkVHs87Su0VRg1YcoreyfAwM2T4Bb068SgcgDPXBAOq54rfszZfIpOsxh5nv6OT5+AraX2dQbZIn23fwH027I1OBspxvn2afBbvFQfJUuRUvy/TFZfNeFsI3XNFL1vVL7684P6QJanMLPurGHcxvEmMXAFBcXxfS4T94zZ/8DsRkjvr2DFF548KhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx7/f5KilkhTswljjwpfTP1FvazxmUqZQ0IOY54qz2M=;
 b=gad6fk8MENzOxpwL91D0jnGH8g/f4OAuDlsK5xP5BpQIXaKaJdQhT+vyb36wFDfphU4v1z3NlWmNbGaAhBXO0wcbbsjoBi68LMV7JC6g/SMrnMKco8WGcG4f+sqYlAYFpUG36ZVJtQYlTPWhID1ELNAUt4/NnaqQzfWEuUIAgJ7znZJdBpPeApN9JTixES7cRtfqMGvfA3hD1dQvTaU+bI5C6+2ukcgcUmnsqFgNKt1gXBOxezohx4fxjdZC9KOA2klIWNgT7CtcD6j/m2XkNkndZLF2u+y1SADuxKYkX/0ik3hQH1OW111ffq+6wdgAMWL0bZp2bXEqa5tC0AvHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx7/f5KilkhTswljjwpfTP1FvazxmUqZQ0IOY54qz2M=;
 b=k8/hwogQVnznEkv+QVXgzqSooqBUiVz8Tg5P0rYAPdrhDKBnyL7PRkAYb41c2FXK53cEOAfuiu3WNp4PhFPBgMGKkVu1QlkeItL/AjLylnY9jm/8PX8IkHfyurQn/0vOnVOyrjVFz/5Y8vgxQ7tOxlSazvHGQ8wuWg449aM4C7w=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com (2603:10a6:209:50::12)
 by AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 1 Apr
 2021 08:38:13 +0000
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::d5b8:9b56:794b:21ce]) by AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::d5b8:9b56:794b:21ce%7]) with mapi id 15.20.3999.027; Thu, 1 Apr 2021
 08:38:13 +0000
Message-ID: <1619db59285c707c60e3738c4fc287ebb7a6487a.camel@nxp.com>
Subject: Re: [PATCH v5 2/5] phy: Add LVDS configuration options
From: Liu Ying <victor.liu@nxp.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org
Date: Thu, 01 Apr 2021 16:36:37 +0800
In-Reply-To: <f078a133-de32-0e08-2d87-f2dde7c240ec@ti.com>
References: <1616662832-27048-1-git-send-email-victor.liu@nxp.com>
 <1616662832-27048-3-git-send-email-victor.liu@nxp.com>
 <f078a133-de32-0e08-2d87-f2dde7c240ec@ti.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:203:c9::6) To AM6PR04MB3974.eurprd04.prod.outlook.com
 (2603:10a6:209:50::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HKAPR03CA0019.apcprd03.prod.outlook.com (2603:1096:203:c9::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.8 via Frontend Transport; Thu, 1 Apr 2021 08:38:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4a4fb79-eadf-4b44-eaac-08d8f4e97cd9
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB704653ED7A818FA19485C1F4987B9@AM7PR04MB7046.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXL4LdNF683bx5+Ayosj+7tMV+7sOuEnbC1zFKgo4iUIBrmCVec5mADxSw9azhAeCOjQepLVD9QuppW3dUyd/8NNkejKxnVzjUAogJsLBflXwURENOaFY5mWOPBtZ5uu+51QdUozkDMIxesumWp/HM3XHEjPP2nJWrXZzfehPJRi9pA9kYka/tmlQDBaurFB+UUpyAbYiZa69HBPMbb0djy1zXqbZ7+LTqRKvicrhnAPIvIEvscktdNANJuJMEMx7O3gBikytrviTXr+aZ44F1ZnJ0h9rDJxbTRgMIc6v5i8PNn8kjaYsZOZxSsqRP0kP+QYgI3QoRTJqWvC+/DNn/GuMyers0C4MSNlR1cljKJWv+QlupNk8ZZt4tqYqoNgo7Js6BWMj8KzwUht2p/gnzh3Ey1X3NbcjeXFBSFJkk3Y0+caql/ApET6GQZ2aYj1ZkO+jTB94UoD0YIRGEegoOnn1gCqquBPTpUmwWcnMBI5SzBdUP3iGBFXozbVkTH5p8lAOjABYSodSNWjXqvqQNZCsznM/V53Kvl7yk/nzG03ecQJRwgNU2W6P7ZPlvWCD8f9gHU5+Ly57b6f0Df44ruT8gbX3Xa1YGhVevxFtFLbYWe2JoB5f2TEG15+364ZNnW6t5vY9z9b2xax8MgvpkaggBOgoc7W4AQTmEfaheY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB3974.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(2616005)(6496006)(956004)(53546011)(52116002)(8936002)(4326008)(478600001)(316002)(8676002)(38100700001)(7416002)(2906002)(83380400001)(6666004)(26005)(36756003)(66476007)(16526019)(186003)(6486002)(66556008)(66946007)(86362001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnhLYVNRUkhlWFF0WFB1WTJ6ZHhpZ3dnTFNaOUxtb1ZURk4zVW13TzhkSEwy?=
 =?utf-8?B?Vko5bG1vWENtQ1A5Y2pMOHgyQ0Nsdm41bm9sd3UxUFRsRUZoVndYZlNpWHdE?=
 =?utf-8?B?QU1IK3RETkZseHBZdGVIbENxQnlqVFB2UVJJK21GaDZ4SW41VERDc0dIQWRW?=
 =?utf-8?B?a2d0eFp0dFFUOTRnd251bENEMWRKZjludWpJSmJQWSs2cWE4b3ltYTJ3NkhF?=
 =?utf-8?B?V3M4eXlkM3lLRHVJdDdvYkxQekZobnRLek1aUXhZVTYwTjVjbUQyRUc4VzhN?=
 =?utf-8?B?NjV4T2tnMXQ0TW5oNEo5amRtQVplbW9Yd1c2cXVWdVdvaWd1QzNvQm5QN1lU?=
 =?utf-8?B?OEJIckNZSWV5MERJeGM1Zy94NU1rSGFZSVBpcERYU1hzVXhkaXBhRm03eEpV?=
 =?utf-8?B?RDgwQW5nNDZPblNTYk52eEc4Q29nVjA0WDEyTkNFSjBRM2NYRWI5RzJNS1dq?=
 =?utf-8?B?OVhJQVlJcW1JT0pXQ2ZjZ2E5Nk9zb0ZZeFc1Z1JDQkhmMFZaMzN4aTRXMlF1?=
 =?utf-8?B?V3R2blhsWVhlU204YXFVeVoveDMwTUJzcmJDcDl1ZUVCY1JqUVF5WS9Bd1F5?=
 =?utf-8?B?cVZycGFRaGowVHZ1bjEzQVZVd0wwY0xqczVjMEovUjBwU3licUwwNkx4S1FX?=
 =?utf-8?B?Wm1CZ2FWMVdiaTdrdzZsSWVlZkNHckRjZzNML1FyWk1BcWlhMENTWkFJK0VU?=
 =?utf-8?B?WnFDeWlJV1lkRDBIZHFMWWN0YVZKM0x1YlRNakU2VElQcDdiTWVKMnM0d2Nj?=
 =?utf-8?B?N0h5ZzJkTTFqK0ErQkxwTS9NdVk5QXBTU2Ria1l1bE5HWVdFa0t6R1oxV3Iy?=
 =?utf-8?B?TWsxVjhhdkZxU1V3am8wMTlKb2d2elBucitFTW9WL2d4QW1aVDZucjJhc1NU?=
 =?utf-8?B?TWljREF1WlBtbjh4dEtnU2ttd2dEOHZRZWR3UW5EVnQwQ0Q5VXNHVXRJUDhW?=
 =?utf-8?B?ZjVqdkJlZXlqMkZVNVlpZVUrcmdDTXlpUjlQSXlZVUdHejFlQU5OSFh4c1R2?=
 =?utf-8?B?WldBZU1xdUdhSGE4RUkyRnNnNktXQzV2QlpQZ01hQ0lFUGNaZjFna2pPaGVL?=
 =?utf-8?B?azNidGV0ZGx3cm02RXZmK0FKbjd3ekUvQUVQMi9palZZVU5ra0RBc28vYVMv?=
 =?utf-8?B?MkJpU0hOQzcwSks0WFIxU01nelRtbTMvd29lakxBaTlzMXlNRDQ5dnNXc2wz?=
 =?utf-8?B?THl0c0oyR2pIa2hHTEZUYnJoOGMwN0EzeFAxNnQ3cmZJVC9oRXpvYjR4U0Ni?=
 =?utf-8?B?anZBVWxZS2lMa1dSRHNCbHU0cWxZUlJXVzNDM0tNbUVzSGJlUnNZSUlVeG8v?=
 =?utf-8?B?WUNmNlFLVEhPSjRQVzUxSE1IYU9LeHI3UGFadnNtSFg2ajM4L012b2c5Z1Vu?=
 =?utf-8?B?UUQ2RW5aZVNsa0kwSEFXOVpwbGxGaTlaUjMzM2ZBakVPNng4ZWp6L2dJTTNt?=
 =?utf-8?B?dXBSb05RS1JIUGdOK2FpTnF4bE9ORHR1NVIyUmhIeDU0ZEFvVnNnaUtjZXRz?=
 =?utf-8?B?ZXZXVE44VXI2TzN1K2dKbWxGcDJ6ZFB6cTNFZ3pOckhiOE0zVFJJNHFTZ1R3?=
 =?utf-8?B?aGJaRjhXdFlLZ1owZVFaV1VVZHdrUXI3UTJMVkE3bXBXRS94U3dGb2s4eGlH?=
 =?utf-8?B?ZGdBUGR4MC9PeDVqeGIyMXdOdTRDa0J2aXBybjNISHFLd0U5cFNwQ0h4Szd2?=
 =?utf-8?B?TXdZWUNrdHlhdHIyNWpTcGJ5WHpVYkN2UkdSY0VJdkE0aUYwUlZkUjVJS3U2?=
 =?utf-8?Q?jW1mNHyrmS0+eBrqUDgcwvFjatGJtcZR29B8eog?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a4fb79-eadf-4b44-eaac-08d8f4e97cd9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB3974.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 08:38:13.5926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzYoT0Kkyu2zDFKFucIEWGx7LLyZ2/JG5YmuvUAOpRSN78TKH9v/l6pKo3PrLe7Gcku2NWfjrwWBNd6ehagHMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7046
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 jonas@kwiboo.se, airlied@linux.ie, s.hauer@pengutronix.de,
 narmstrong@baylibre.com, robert.foss@linaro.org, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kishon,

First of all, thanks for your review.

On Wed, 2021-03-31 at 19:02 +0530, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On 25/03/21 2:30 pm, Liu Ying wrote:
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
> > v4->v5:
> > * Align kernel-doc style to include/linux/phy/phy.h. (Vinod)
> > * Trivial tweaks.
> > * Drop Robert's R-b tag.
> > 
> > v3->v4:
> > * Add Robert's R-b tag.
> > 
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * No change.
> > 
> >  include/linux/phy/phy-lvds.h | 32 ++++++++++++++++++++++++++++++++
> >  include/linux/phy/phy.h      |  4 ++++
> >  2 files changed, 36 insertions(+)
> >  create mode 100644 include/linux/phy/phy-lvds.h
> > 
> > diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-lvds.h
> > new file mode 100644
> > index 00000000..7a2f474
> > --- /dev/null
> > +++ b/include/linux/phy/phy-lvds.h
> > @@ -0,0 +1,32 @@
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
> > + * @bits_per_lane_and_dclk_cycle:	Number of bits per data lane and
> > + *					differential clock cycle.
> 
> phy_set_bus_width() instead?

This member aims to configure the number of bits transmitted during a
period of time(a clock cycle). It doesn't sound like a concept of 'bus
width'?

> > + * @differential_clk_rate:		Clock rate, in Hertz, of the LVDS
> > + *					differential clock.
> 
> Please use clk API's to get rate.

I like your idea. But, this rate is likely runtime-configurable, e.g.,
a LVDS to HDMI chip is connected. It seems that there is no appropriate
driver to set the rate by calling clk_set_rate() then?

> > + * @lanes:				Number of active, consecutive,
> > + *					data lanes, starting from lane 0,
> > + *					used for the transmissions.
> > + * @is_slave:				Boolean, true if the phy is a slave
> > + *					which works together with a master
> > + *					phy to support dual link transmission,
> > + *					otherwise a regular phy or a master phy.
> 
> For parameters that are known at design time, it doesn't have to be
> passed from consumer driver. So all these parameters do they really have
> to be passed at runtime?

Yes for all, perhaps. Details below:

1) bits_per_lane_and_dclk_cycle
i.MX8qxp LVDS phy can only do 7, while i.MX8qm LVDS phy(a different IP)
can do either 7 or 10(configurable by setting a phy register).

2) differential_clk_rate
It's likely runtime-configurable, as I mentioned above.

3) lanes
The higher color depth is, the more lanes are used:
RGB666 - 3 lanes
RGB888 - 4 lanes
RGB101010 - 5 lanes

That means a phy with 5 lanes(like i.MX8qm LVDS phy) support up to the
3 types of RGB pixels.

Though the i.MX LVDS phys don't have any register to configure the
lanes to be used, it would be good to define it for phy_validate() or
other potential phys?

4) is_slave
Any i.MX8qxp LVDS phy instance can act as a regular phy or a master phy
or a slave phy. Changing mode at runtime is probably unneeded. But,
it's difficult for the phy driver to get the mode from device tree(see
drm_of_lvds_get_port_pixels_type()), I think. Export an i.MX8qxp LVDS
phy specific function to set this instead?

Regards,
Liu Ying

> 
> Thanks
> Kishon
> > + *
> > + * This structure is used to represent the configuration state of a LVDS phy.
> > + */
> > +struct phy_configure_opts_lvds {
> > +	unsigned int	bits_per_lane_and_dclk_cycle;
> > +	unsigned long	differential_clk_rate;
> > +	unsigned int	lanes;
> > +	bool		is_slave;
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
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
