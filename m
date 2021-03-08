Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE86A330620
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 03:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815226E0A6;
	Mon,  8 Mar 2021 02:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E836E0A6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 02:54:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnoPqSPWm5scTR1zyUFot1xlVnNYFZSYEmM4RLSRfkl4bXCDQOVxCExDunVZHu5P55LgTtG/ON4AxfXHmroFBT+AXbrPYv8AWoojLmbityM6mP+6Xumf8VwDqBHPnn43zqZLl9pd5VDJ9zMC/Yu10KgKu7XLbWlYI5m/F4GotOlQsr2xPzzvVcFn+5oCHGOsTDPiA1xDtJzZzYfJXudOTt8keUiw1wv4HLXugCRqngaBdsrjsMP3IZjDHaJxA28Wx88MunPBCKP6QJscUOb5THRm7NPSYQSz/7xzDSapuRXqNHQyDZMsCw6ZAefndFWLAjn6Vp/zschN8eNZPX6DBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vTCTKuqudHM63WNBiq0dEtaM3+qkgHBWsY5NcdTxd0=;
 b=L99ONO/7A0oVlv8Mob0vIrA1pJkSM5Q9KHLdrqe7JI0vIz9JDzCG8kZhInPNGxPLQ1N+tZ8mECuUazbghBV/liECu7JAEf6vv4EwfHmuX8mq+LCmkTDN0l6XFgh44bGDLiDDOukxCU0tFVcdmWThBMJR50HWQX6gug/UTz6ZhlaX0se8dyEnP1+ec5wZ7gYlN4blQvzt5PJ/VjCzmyyqnxCeKLh6qvSwZ36AhTKkgdRUQ1tZxCt2suRNUoR5Ma/mwxnMIXhfwE5/sTN1PxC8KsLTWkKatUbWtDi44F8Ewl0n1Vq3FOZnUfKktH0znvo4Zyx0XwzjEOoDpCLUMEs8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vTCTKuqudHM63WNBiq0dEtaM3+qkgHBWsY5NcdTxd0=;
 b=EfGKrBOvcRkJs9n6pKnzh4COiawhSiXc/XDishkb8JRl8i5XPfEgDlyAjxMKyfLVit0qAuYijRMcWWD9cPjYXsgOIOJnwChARjcF7CshUvDVT88nAJswis1KCDLnkF6skhgfGm5SQL+rMp0Pb/dMhTlitkJnRGdWlpwrymS5wXU=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7344.eurprd04.prod.outlook.com (2603:10a6:800:1a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Mon, 8 Mar
 2021 02:54:46 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 02:54:46 +0000
Message-ID: <95188cbe469c657047cdee846098e9c9c118f3e2.camel@nxp.com>
Subject: Re: [PATCH v3 2/5] phy: Add LVDS configuration options
From: Liu Ying <victor.liu@nxp.com>
To: Robert Foss <robert.foss@linaro.org>
Date: Mon, 08 Mar 2021 10:53:15 +0800
In-Reply-To: <CAG3jFyvJZkVRs4NnDmPmGk-Qkr0voyvf3JNvKFAKDyxcCNR3Cw@mail.gmail.com>
References: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
 <1607651182-12307-3-git-send-email-victor.liu@nxp.com>
 <CAG3jFyvJZkVRs4NnDmPmGk-Qkr0voyvf3JNvKFAKDyxcCNR3Cw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:203:d0::12) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 HKAPR04CA0002.apcprd04.prod.outlook.com (2603:1096:203:d0::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 02:54:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fc8caac5-308a-4c77-6028-08d8e1dd880d
X-MS-TrafficTypeDiagnostic: VE1PR04MB7344:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73444707D7914BD38B4B7BA298939@VE1PR04MB7344.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nLTayPXjcG6x5E+0/knL7nGIH0TBOY3eiugePbyiH0GdwUorP/45HdeVhFY7K7wmizQnqp2HvTCN3h5h0R0TUkq/37SThEOy1ZbaF6NOOh7SVIbsOE9+942PbxfOBZFLT9rGqZ2HsrzPXEZj9pSwhHxW8jK4Y56kiWQ62Y38Exmb3n2Bs57yjLOHegWsLKO9Wmjc06Vr+zkgtgbBz1dfuF4zQv+sXiWQO31+XRP25Oe0Jfq1UDUazOS5+hr0B1kKq4arXTjZG2YEptONCgIH6SnAg3E2f0c9UziMfLNoPN+xNBh7nywL9L1apufDnhma3e9vWVHv1iVr+RNrFFVG5Hgn3N7PYEvZbYG5y8ofl/cSSdD52LKhiSHxs4sKhVTZhWC+tHjj5AoX9yhfVY1V28WWEFzecdxoG/eTY0z9OvYRsA4jtuJChvTl0dUypG13dAhLoQeDJfSmui86bHfds53S8egpA9Pb+gMuMMonsdJ3qEMmpdUbwushLYmvsAR3SL+jpygHOzGDu4N64PHdCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(316002)(16526019)(26005)(4326008)(6666004)(8936002)(54906003)(6512007)(186003)(83380400001)(6486002)(6506007)(36756003)(66946007)(66556008)(8676002)(2906002)(956004)(66476007)(2616005)(478600001)(52116002)(6916009)(5660300002)(86362001)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEk1Y1VEZVZsRFI1clJ3S1NDeFFDcVAzWlRwak9YTjlYalZndG9zZUNTdElj?=
 =?utf-8?B?cFJJSy95UDRWR1BGYThuT1lhSkJMcEk3TjlyT1RXWm13WGFZNEsrMkRzdVVN?=
 =?utf-8?B?UEdXenF5dXJ0NGZLSCtnd2VhcUlxeWJIcVpTcFFSTzNtc01GWkNKRGEzcGJo?=
 =?utf-8?B?ZjJDWTBvaGtRdEFXaUVrVjFkVmdGSmxtWlduUTkxdEVnd1NBRTIyNW1ZVFhs?=
 =?utf-8?B?QUVwVFdicFM5M28rb05kckZnSzRzclFsQU5WTUNqdlpBaWZmSDBHbEZ3am9l?=
 =?utf-8?B?VUpOR0MyOU5USiszdzA5QkFNWk1pRUk1QklNQUlrZ3VTUFlRL0c5THA4aVNP?=
 =?utf-8?B?c09RTU9zSXJzT1B1SURSRVRBdmtldGJtK285L0VkOHpCTHEwbHdXSktheEoz?=
 =?utf-8?B?My84MktGUWFDYWFKMDFSbWpxc3ZMUzJRcDNoSnUwNUVMNDJTeUZmbzNCQXJG?=
 =?utf-8?B?akpRc2U0SVhhL0RxdnNSdmg5bHIxYi9qQlgrTDhza0VNclVKL0Y3VXRmay95?=
 =?utf-8?B?QmowN0NBY3lhUnBqUU9XQXdYSXkxSHNqZFZWZStlb2VUaFZmY0VwTUp5dkNN?=
 =?utf-8?B?WHM5SVlJZkpUcUMzRDFrWjBFMTcrU3pyY2FzcHcwVW1ZSkVYMERkSlRGRW5o?=
 =?utf-8?B?eHdoYzh5K0t1TWw1dGllcFFHcUVWcWpWVHlrbk1mUC9oRUFqaTQ3SGZqM1hm?=
 =?utf-8?B?VnVRWGh1KzZmY2drcUdIUjBBR1ZxSG02aDJDUzBOdzByZWZydjFGTzlJMEJM?=
 =?utf-8?B?WWdhSG93d21sdkhJbUZwV1Y4YVIzU1g4OFhOUDJaUkZ1Z1hyWXpPUm9JZXBE?=
 =?utf-8?B?RzVZSVMrblNEYkp0UXd1cFFFVysyd25iMkFuS3ZxNExGWHBkQUZpRkF2MlZE?=
 =?utf-8?B?MjJveDFmeUxuMjZzdDQrQUZyaHdXYUEvY0Q5VGJqTjBRandqZWpvSkFHd3p1?=
 =?utf-8?B?YUxoUm5YeGdFNkoxSzRsM3l0ckxob1BNZTZ2TWcwelI4aS8vbHF1c1Y4eXdD?=
 =?utf-8?B?eGlDOEF5YjNqNXB2bzJEditIalBMbTRXK0ZVQmNKL2x4cW9XNU1Uak9Hb1Ez?=
 =?utf-8?B?dXQyckZLR1JUZnpnRXJkUnQvQ09IbDNUZ2dwT3BpK0VoV0tOOFd4ZGpxVVli?=
 =?utf-8?B?Smo1L2I0ME9EZ1I4WEd1U010TmlISjFjaEIvKzlZTFI0MWNldkg2VWw4Vi9u?=
 =?utf-8?B?aUorWU9IZVFjK29OSldRNWlRWXlhQXFrbzF4d0YveFlzRGlaVVROTm5EOFpU?=
 =?utf-8?B?cXh3QnJ4L1hSRDRSamc4NDlLY1BmdURiencrT3pUTERUVjF6eHZ3b1V6TmxU?=
 =?utf-8?B?ODN6dmJnTElCbkpnWVB3MEhoZFZrZWVLc052eWpwRDJ1TDMwTDUxaXNHY0pI?=
 =?utf-8?B?K2dYdUpJbit4WkVHT0JZSklkQ3MyZHBlU1JvZ1R6ZTFPdWw0bUxpZU80allY?=
 =?utf-8?B?Q2oraEIyZ0xsRTFOM1B4cmZrOW84Vy9Kc2Q4YUJZaXpOMmVubEEyYndiYm50?=
 =?utf-8?B?NXpYVVZ4aEM4V1k0elp4Uk43WmwwcXZLNE81ODJxYWszMHcwek82MVR2bVdj?=
 =?utf-8?B?STFORklPaUY2aEZLSFErWEM1RlppQjk2SG1LMzhmejRGUEtZbk1MK01HeGkw?=
 =?utf-8?B?UmZKZFZrc09UMkcwQnpHWmJVR1ZCbWs4ZUV5TVJXdUp1anFGbDh3MGlHUlht?=
 =?utf-8?B?VDVha2ZTb2VZS1VTWktNdWpYcVF6WXo3cUtHU2svRXNZSDQrcGY1eFRpTVJV?=
 =?utf-8?Q?+FV16QcdIkUZRDSVf6pUmg/iS+E9L2QBAsQnYGP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8caac5-308a-4c77-6028-08d8e1dd880d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 02:54:46.4412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUguIGO2oiY7I7CokILHy/O+CPg/iTJBkR/kG+MnViG+UraElHqlK/MX/VD7RsJL9q0oseCMsWNcgC/+N7vOOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7344
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 agx@sigxcpu.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 martin.kepplinger@puri.sm, kishon@ti.com, linux-imx@nxp.com,
 robert.chiras@nxp.com, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, s.hauer@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-03-05 at 16:03 +0100, Robert Foss wrote:
> Hey Liu,
> 
> This patch seems to be included in both this series and the "Add some
> DRM bridge drivers support for i.MX8qm/qxp SoCs" series. Instead of
> having the two series have a conflict I would suggest either merging
> them (if that makes sense) or removing this patch from one of them and
> explicitly stating that there is a dependency on the other series.

I choose not to merge them, because they are self-contained
respectively and splitting them makes the patch number(14) of the "Add
some DRM bridge drivers support for i.MX8qm/qxp SoCs" series look
better.  I guess this series will land prior to the other one, so I
would drop this patch from that series and state the dependency
there(actually, I mentioned I also sent this patch via this series
there).

> 
> (the patch itself still looks good though :) )

Thanks for your review :)

Liu Ying

> 
> On Fri, 11 Dec 2020 at 02:56, Liu Ying <victor.liu@nxp.com> wrote:
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
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * No change.
> > 
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
> > +       /**
> > +        * @bits_per_lane_and_dclk_cycle:
> > +        *
> > +        * Number of bits per data lane and differential clock cycle.
> > +        */
> > +       unsigned int bits_per_lane_and_dclk_cycle;
> > +
> > +       /**
> > +        * @differential_clk_rate:
> > +        *
> > +        * Clock rate, in Hertz, of the LVDS differential clock.
> > +        */
> > +       unsigned long differential_clk_rate;
> > +
> > +       /**
> > +        * @lanes:
> > +        *
> > +        * Number of active, consecutive, data lanes, starting from
> > +        * lane 0, used for the transmissions.
> > +        */
> > +       unsigned int lanes;
> > +
> > +       /**
> > +        * @is_slave:
> > +        *
> > +        * Boolean, true if the phy is a slave which works together
> > +        * with a master phy to support dual link transmission,
> > +        * otherwise a regular phy or a master phy.
> > +        */
> > +       bool is_slave;
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
> >   *             the MIPI_DPHY phy mode.
> >   * @dp:                Configuration set applicable for phys supporting
> >   *             the DisplayPort protocol.
> > + * @lvds:      Configuration set applicable for phys supporting
> > + *             the LVDS phy mode.
> >   */
> >  union phy_configure_opts {
> >         struct phy_configure_opts_mipi_dphy     mipi_dphy;
> >         struct phy_configure_opts_dp            dp;
> > +       struct phy_configure_opts_lvds          lvds;
> >  };
> > 
> >  /**
> > --
> > 2.7.4
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
