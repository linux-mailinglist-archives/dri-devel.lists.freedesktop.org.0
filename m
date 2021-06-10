Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42003A2889
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D398B6E48B;
	Thu, 10 Jun 2021 09:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CD46E48B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 09:40:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J13uCu5BJ6NHcH5O9H7rB41MXbrCMbgkxe1cAP0RDUKx27Uf/uQ9SEurIAaKYIHiREIxkOqOgPvOao3wEYEevSHb9WiNA/XAZqVf4igZ/qSLPVgtGulX6Y0plvzUsxwkOKGTvUhoKvdGL/ZKWDbJmS3SQmogbR8zzse2zD/rCnSfG8Zpr7BHE3ITfDDu8shOw5wkZR1WTxbmmw6dvVVYDgro5+F30rsFkO7BbyZixffcwJtLtaSeLuDZ/8JWQ9MZhYI8b56BvJ/KUSizQM0RC8hyUlred/SbtMmvK0sZ5tpPrabv4vepMvIOCFsmcA19TagqqEsvx6ZcRc1g9GzAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai8TllpWOUew7wXpVUBysvJ5hc3exLlHABhTkSRkq/A=;
 b=fBegfgeKwuEFYVxgOryb1qEbaAdVmMcpKzHYnnSuEuzpHeALiGG3CsS32FIz3SVzSCMrT050tKszjKBuFoj4j5yzTKfVQuPg+nu24R7jKoQKfM8eU8FWZCbiqsWqXy65DCe4dz08hK31cjsUBkJOD8scVrt+TrUXzok5bzxg7QThMRqalj9QfO6IrMY+Fyp4cgMzQU060h2A6giuxrMLstfuppaNfh+kmSugPKFCdC5tvaYSxm9m7Hely+fy8zv6++gsAQdFNPYuwKp5/bAZQFyJdtQbpoOiu6IjL0uoWoB6I0/j1H9IyTnusgJLX+r1jsJIUQp4yY/F5QaDoEB2Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai8TllpWOUew7wXpVUBysvJ5hc3exLlHABhTkSRkq/A=;
 b=RYG8jbeNioQr0BW60nXfs4ZSwQP0WzCB6nsZMozdQbmbvDIqJmO9Kzr+bDoZbDg/MGo4EyG9YGSusmfzRmMFG1VfPDCovNgVTysirKKjWkEB/y/U15HkOuIrxQDKqzUG816frMgiH+4Ue4pzHFeipT8Wq/nwOtpH/QlruJk2tLU=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB4040.eurprd04.prod.outlook.com (2603:10a6:209:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Thu, 10 Jun
 2021 09:40:08 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1d4c:c3f2:dbbb:88f2]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1d4c:c3f2:dbbb:88f2%7]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 09:40:08 +0000
Message-ID: <63445c4c84c89b70fffb5dfa17c162c3f3abf0f5.camel@nxp.com>
Subject: Re: [PATCH v5 2/5] phy: Add LVDS configuration options
From: Liu Ying <victor.liu@nxp.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Jun 2021 17:38:16 +0800
In-Reply-To: <1619db59285c707c60e3738c4fc287ebb7a6487a.camel@nxp.com>
References: <1616662832-27048-1-git-send-email-victor.liu@nxp.com>
 <1616662832-27048-3-git-send-email-victor.liu@nxp.com>
 <f078a133-de32-0e08-2d87-f2dde7c240ec@ti.com>
 <1619db59285c707c60e3738c4fc287ebb7a6487a.camel@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0096.apcprd06.prod.outlook.com
 (2603:1096:3:14::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 SG2PR06CA0096.apcprd06.prod.outlook.com (2603:1096:3:14::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 09:40:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaf2ea73-0b1e-495a-ff18-08d92bf3bc1d
X-MS-TrafficTypeDiagnostic: AM6PR04MB4040:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4040F130D08E7F67A308A7C598359@AM6PR04MB4040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b26c3sbuidoe+n6XPJzmvd0gfaKeELNAa5TL+lJP+1lT0uD2DyyoawXXta4qe3Z5aOny3br7J65U7FsmZmGyXwX+ofF/jy/PNlB0HOJXTkI4bO7R8mitvoIiKEtFnx1A/dWPkEg2OAbpk7w46V1bIK7HAIWwZfqPQBOPahCdtVcbghS2zOIbdWBK5DJIaPC2w5/50uO+Ea4uXOKbi8it89z5/NzDzJU2YpMsnnGGDPg3xCJbR1praLSWuJ+UxqSvrG4fGc60TTg6W6m0d/gKhuTbsU5CMGf6jSwklp3q25U06NnANEzGY46FWdB6s+fQrrUImILJGhWCH1sVLugk2egMyXGs/2gN4XA0/cURkTGksJ8saGlutalO3rYA51hHAiemT/DsBq5kd4LHNxLpnF1SwUC/9ozLU7LxbeEFkZw9JDbRWzlCSc+4DDVgm6xUuXtfXoMo5xJwC3XR1E/htqbdyOk7eOqyjNMEkrHou6Bshhle6fPBfyesjI+wUfwXhYYhv+OrqT46WJSUjwX4zkK+bm6YmFy8XEJzrYK1eViY+7wwMIl2PMrAUMzvZrgIOp9l6i3k5g8GjfO/qc3IKxt4A1uK4eL2b4Zq7pDFcGE8KVA4p3RJ4mCCax/SUtwCK9eh5RUJkRRtI2zf9/5kfMzbWpiEnKuT+xr7JAOQK0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(8676002)(2616005)(316002)(956004)(478600001)(8936002)(5660300002)(66476007)(66946007)(66556008)(7416002)(4326008)(2906002)(186003)(26005)(83380400001)(53546011)(36756003)(16526019)(38350700002)(52116002)(6666004)(86362001)(6486002)(6496006)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V2p3eVFFZGM3MEdTM3FYbkdiYkFzMnRNZGN0RFdCaFRlMWpNK2cwNGN1VWN3?=
 =?utf-8?B?MW8vMzJKNTRhNlBMaGlobEN4YU1hYWJYSXpHN2NpVFdtOE1ZZU45WkhQQ2dL?=
 =?utf-8?B?VWRZc2RCNjBIYzF0UnY0MGg5bThzODhFeDRxU1RkN2JTTTNQK0xaSEpBUmds?=
 =?utf-8?B?MGtZeEJXMm92aGtOVWFXZkkrMWFnTEU4UWJLSG5IK0lsS0MvejhzN21lOCtu?=
 =?utf-8?B?R2JVZGhIVGpBajNXYktWRFQvN1BNZjNJb2w4blpIZUdvWmJvN0Y5QWQwOVRx?=
 =?utf-8?B?bHJOVDlnNlIyL0twTTBvMXBkWDNBN05sQWd4OUtlTEYxS3VoWisyZkRrLzl1?=
 =?utf-8?B?czNhMlArRkR6SWwvcmdBM2FEeG41TmFLeVMwazllTVAwdzk0SVhJUnJIbmlG?=
 =?utf-8?B?VW1VcjZ6MXNyODBuYWFsajlmSEY5blZCVDAwQzU3S1I3a2VUY3FydUxnYzUx?=
 =?utf-8?B?S0hvZWE5V1F3N3VIVWtmOW1FNmxiQzZKaDNja1FlK2tldEx1d2ZvYmp3d0Na?=
 =?utf-8?B?SGFqTU5uTmJSR0gyc3VkREN4NlRIV0dKK0NBbGh0Zkk4SnVCZjVRVjNtR3o3?=
 =?utf-8?B?aHJTbnArSDQ5UEs2QjhvUDdVNzlQMElrVEZrVFJFQmtpeUhIOHpTVndKSXVJ?=
 =?utf-8?B?dDlGTUZHRkJCbnBWVWVaL2tuNEtUdjhWdndsWDJjUHExVHRUMmNkaHdWUUFw?=
 =?utf-8?B?elFadW80OEZyZXd1YVZVd04xMTVLZXJuOFJrMVdPTlhZTE9OS0xITW5ZVG5t?=
 =?utf-8?B?VE1McnRXSjcyazlpY1MyUWNQM0FwV1YzNHl5RjBDeUdQczJNeExnVlA1WVFh?=
 =?utf-8?B?ekZIcjFsZGxSczdkeEY2K0FwcFUxRlA2M0tlOWNXaThXT3dkZDdNUFBvUm1W?=
 =?utf-8?B?dFlHclNoeUZnQnBaT2Nlb0djQmh3SndWcU1IVkJlcEhyTkFhWEphYVZYWXlJ?=
 =?utf-8?B?UHh2T0hvK3JqS0tWdVRpRkV2YXRDdS9UY05wRWJ6VnhveWJ6WG43RTlqRytn?=
 =?utf-8?B?Nm1VMVg3OTM4OVhucnNWcThWbmxWdlJXVllqQzNhdkZQQVVYeUxTSkx4aWxC?=
 =?utf-8?B?MkQvYWpFWGZFSEw1d2RqTzQ1d2FNV2poVmVPbVRKamUxZUJQZmNPQjMvZFBS?=
 =?utf-8?B?MEh6MDhmVVFCQVFKYUsrcVBkcCtpclNMSzZicFJOajdVamR2aVFXdkJkVmVV?=
 =?utf-8?B?MUFjNWZZSERWSThDaTkwcUxqQzRXWElEUmovS00xVVlWdEZGb2E2V1REZGlB?=
 =?utf-8?B?ZzZPMDB3dVkyQURoeENqL2Z5cXRSVnhMTGJvR3VxWWRVY2VVZkdVR3dra2hs?=
 =?utf-8?B?YWxSa0x0a1h5S3U3ZkZ1dXdGYkdwVC9kVHVORTE5ZFBmVUtVT1FCdDNYMTVz?=
 =?utf-8?B?U0FoanJ2VU9oVjkvVUJaU05GUnBLTThkSHJMWDY2N3pzVjc2R0tnWmM4d1F5?=
 =?utf-8?B?RmF4NlgzTGJRQ2NyYktWajU5dGxrK2VDSW93ZTdkRFRMaFA3QTVyeFdDd29k?=
 =?utf-8?B?dWZpRG9sc1pINkd2NWlLQlZVTHhmTXg5NCtCVWszcGZXejAyVTBtV3ozV3hq?=
 =?utf-8?B?ODd2UWk1WElEMi80TVd2Rks0TWs3OVQwT0Z4U2N2bU1kNGtrSTFQS0tvS210?=
 =?utf-8?B?MUhEWjhySmw3a2I3emhRZDlwU3hxQllCdjB2N2NPaVhuejZoWWJzc0kxVnBv?=
 =?utf-8?B?RXkvYW4ybEJWOEUzdmRoYklFc0Fwb1dkazdxRzdFc2dheUtvYUJraktRK0Ew?=
 =?utf-8?Q?6es1Si0M5yI6z3NRQmM0/u4ndeIphlK0k+tzlAV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf2ea73-0b1e-495a-ff18-08d92bf3bc1d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 09:40:08.6130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWYPdoLpYWKpKd6JV+4HpGeNah0SPUG15rtl4IM/pg95QTQ5XQuevIQi8Tgjao3lvFdA8ge1trSH8FBI/wvbWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4040
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kishon, Vinod,

Any follow-up comments/suggestions based on my previous reply?
Or, perhaps, just keep the patch as-is to support the generic lvds phy
configuration structure?

Thanks,
Liu Ying

On Thu, 2021-04-01 at 16:36 +0800, Liu Ying wrote:
> Hi Kishon,
> 
> First of all, thanks for your review.
> 
> On Wed, 2021-03-31 at 19:02 +0530, Kishon Vijay Abraham I wrote:
> > Hi,
> > 
> > On 25/03/21 2:30 pm, Liu Ying wrote:
> > > This patch allows LVDS PHYs to be configured through
> > > the generic functions and through a custom structure
> > > added to the generic union.
> > > 
> > > The parameters added here are based on common LVDS PHY
> > > implementation practices.  The set of parameters
> > > should cover all potential users.
> > > 
> > > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > > Cc: Vinod Koul <vkoul@kernel.org>
> > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > > v4->v5:
> > > * Align kernel-doc style to include/linux/phy/phy.h. (Vinod)
> > > * Trivial tweaks.
> > > * Drop Robert's R-b tag.
> > > 
> > > v3->v4:
> > > * Add Robert's R-b tag.
> > > 
> > > v2->v3:
> > > * No change.
> > > 
> > > v1->v2:
> > > * No change.
> > > 
> > >  include/linux/phy/phy-lvds.h | 32 ++++++++++++++++++++++++++++++++
> > >  include/linux/phy/phy.h      |  4 ++++
> > >  2 files changed, 36 insertions(+)
> > >  create mode 100644 include/linux/phy/phy-lvds.h
> > > 
> > > diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-lvds.h
> > > new file mode 100644
> > > index 00000000..7a2f474
> > > --- /dev/null
> > > +++ b/include/linux/phy/phy-lvds.h
> > > @@ -0,0 +1,32 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright 2020 NXP
> > > + */
> > > +
> > > +#ifndef __PHY_LVDS_H_
> > > +#define __PHY_LVDS_H_
> > > +
> > > +/**
> > > + * struct phy_configure_opts_lvds - LVDS configuration set
> > > + * @bits_per_lane_and_dclk_cycle:	Number of bits per data lane and
> > > + *					differential clock cycle.
> > 
> > phy_set_bus_width() instead?
> 
> This member aims to configure the number of bits transmitted during a
> period of time(a clock cycle). It doesn't sound like a concept of 'bus
> width'?
> 
> > > + * @differential_clk_rate:		Clock rate, in Hertz, of the LVDS
> > > + *					differential clock.
> > 
> > Please use clk API's to get rate.
> 
> I like your idea. But, this rate is likely runtime-configurable, e.g.,
> a LVDS to HDMI chip is connected. It seems that there is no appropriate
> driver to set the rate by calling clk_set_rate() then?
> 
> > > + * @lanes:				Number of active, consecutive,
> > > + *					data lanes, starting from lane 0,
> > > + *					used for the transmissions.
> > > + * @is_slave:				Boolean, true if the phy is a slave
> > > + *					which works together with a master
> > > + *					phy to support dual link transmission,
> > > + *					otherwise a regular phy or a master phy.
> > 
> > For parameters that are known at design time, it doesn't have to be
> > passed from consumer driver. So all these parameters do they really have
> > to be passed at runtime?
> 
> Yes for all, perhaps. Details below:
> 
> 1) bits_per_lane_and_dclk_cycle
> i.MX8qxp LVDS phy can only do 7, while i.MX8qm LVDS phy(a different IP)
> can do either 7 or 10(configurable by setting a phy register).
> 
> 2) differential_clk_rate
> It's likely runtime-configurable, as I mentioned above.
> 
> 3) lanes
> The higher color depth is, the more lanes are used:
> RGB666 - 3 lanes
> RGB888 - 4 lanes
> RGB101010 - 5 lanes
> 
> That means a phy with 5 lanes(like i.MX8qm LVDS phy) support up to the
> 3 types of RGB pixels.
> 
> Though the i.MX LVDS phys don't have any register to configure the
> lanes to be used, it would be good to define it for phy_validate() or
> other potential phys?
> 
> 4) is_slave
> Any i.MX8qxp LVDS phy instance can act as a regular phy or a master phy
> or a slave phy. Changing mode at runtime is probably unneeded. But,
> it's difficult for the phy driver to get the mode from device tree(see
> drm_of_lvds_get_port_pixels_type()), I think. Export an i.MX8qxp LVDS
> phy specific function to set this instead?
> 
> Regards,
> Liu Ying
> 
> > Thanks
> > Kishon
> > > + *
> > > + * This structure is used to represent the configuration state of a LVDS phy.
> > > + */
> > > +struct phy_configure_opts_lvds {
> > > +	unsigned int	bits_per_lane_and_dclk_cycle;
> > > +	unsigned long	differential_clk_rate;
> > > +	unsigned int	lanes;
> > > +	bool		is_slave;
> > > +};
> > > +
> > > +#endif /* __PHY_LVDS_H_ */
> > > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > > index e435bdb..d450b44 100644
> > > --- a/include/linux/phy/phy.h
> > > +++ b/include/linux/phy/phy.h
> > > @@ -17,6 +17,7 @@
> > >  #include <linux/regulator/consumer.h>
> > >  
> > >  #include <linux/phy/phy-dp.h>
> > > +#include <linux/phy/phy-lvds.h>
> > >  #include <linux/phy/phy-mipi-dphy.h>
> > >  
> > >  struct phy;
> > > @@ -51,10 +52,13 @@ enum phy_mode {
> > >   *		the MIPI_DPHY phy mode.
> > >   * @dp:		Configuration set applicable for phys supporting
> > >   *		the DisplayPort protocol.
> > > + * @lvds:	Configuration set applicable for phys supporting
> > > + *		the LVDS phy mode.
> > >   */
> > >  union phy_configure_opts {
> > >  	struct phy_configure_opts_mipi_dphy	mipi_dphy;
> > >  	struct phy_configure_opts_dp		dp;
> > > +	struct phy_configure_opts_lvds		lvds;
> > >  };
> > >  
> > >  /**
> > > 

