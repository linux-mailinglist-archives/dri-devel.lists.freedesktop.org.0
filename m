Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6824FF464
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 12:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0EA10E394;
	Wed, 13 Apr 2022 10:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60077.outbound.protection.outlook.com [40.107.6.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95CD10E394
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 10:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqXa3hYQOM7omia6qeh5SaLKMTNcxffGewQ9qhzlwO/NCgGF3BsIcv9F+zR0KNIFtvIwGbZwYeRgX7YeJS23wW5Mcg87qcfbBb2THPbfv9WMJ3uvQQPnrc9seRB/0aBT+dQDIaXWhG7vShFRYojKcLuvpCQvPkVZFpsnQAmsXPvTQ1ft9a3pS1NdHdZoMWpG2GAwxplw0JYqK8VT0/wPPjsKGfi8CbnCK5aoGTzaVOpAOaZC0yhN03iVjmheVDKtiT4UA/URrIdYfCyY7d8oX7oluivCspxsGkbBxfbhK3734ywS6QSKGFlAlyfIpyjhmZH4JnUKBAUfEsYszz32nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8apnvQdKNcuAtc0sVirhIlNhQG9N/iVg4SWmATU20U=;
 b=Y0b3Lm9JlUQAgeZeeUJ4Cb71t+dJUlnlkI9cbUAX5IqBMmfyDYYb4b7bjchGeFIaYIA0J9LktUJr4CmwZiajVxR9QuDIqtn7ZhBQKQ+shuRl0N7titrs42VD3PxBPI2i8kEfNgl3PvmHw1UNyet3se4dxYRBAQl1/HCq9IdZpABS0qq0tvdZqfb9fy2KIz29RswD/I0jq7eWCgrgypFmUWpX5xCDpUOwmQsnd+ybovZmk1O0lzqukFLbIFQyJBiQfBx6YHtJ8iVP58uAWYLMQLLpfLqDvWjtDF2AwxuqUK9s7wAtreilMTVfJFHS7SDHDnsFFnRFFL88FoInVzzprg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8apnvQdKNcuAtc0sVirhIlNhQG9N/iVg4SWmATU20U=;
 b=jracsDCNKYaXj5x1zZHpFQXnFCK/HYwRf7cbQSf5b7/2oKDNO5fXqz8aqw5hh497prVEj5klZX5/iGoPTtxb4VLgHOykWj4anBW7LnY+go+vWFW+O368bxbfjo9Dq1086U4Ywm/BzgBcTZmJC28+VIjakbkPUsgRjKw2mU4AxJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8322.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Wed, 13 Apr
 2022 10:05:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 10:05:09 +0000
Message-ID: <d77b41d911e126331138ddaca146a581d316bd09.camel@nxp.com>
Subject: Re: [PATCH v6 resend 2/5] phy: Add LVDS configuration options
From: Liu Ying <victor.liu@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Date: Wed, 13 Apr 2022 18:04:57 +0800
In-Reply-To: <YlZpnrKt9NbHZv26@matsya>
References: <20220402052451.2517469-1-victor.liu@nxp.com>
 <20220402052451.2517469-3-victor.liu@nxp.com> <YlZpnrKt9NbHZv26@matsya>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a96bf39f-5f64-4c56-546a-08da1d35179b
X-MS-TrafficTypeDiagnostic: AM9PR04MB8322:EE_
X-Microsoft-Antispam-PRVS: <AM9PR04MB83229C178B4D48D309F204B498EC9@AM9PR04MB8322.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPTDz8hMLLTuqb/lVfj5vasyGrEAdkux0W8GQ+hEUpvSa8dHxzNmlDj6KeSzlGMsSefqRtlr+WuQCnIezamX0C1Kpvh/zRXkFawSSEix1aK14WL8tKlu5HPI5UdRiRQ90KhUyQP17wPMO8GIv3zuLwnhiILlMkbZAvQnTmRElqKGiVI5Pqz2bvnSjHInnyy1Rtw6xnNjkrsf7ac4WUZJCV9GNg5Fef1BKk2IbIQQ9qW/mKuH/HbBx0ZtY1k0Y31bVgvJLOuf8hGdtWTHj5eC3Gn6BdCkCR047h9vEwMaH0eFsjeJv8atF6ZAJT7xD+T89TlnJdgvMtlk7lCmxsXni/ih8Y56P3j6hO6lR27x1N0HcZZm8xvdkgPwwsOUjS9LK+7zWGe3eCP3EWV9GYWzBbN8jeqgurTMw/1LpU2xQzvYUZcsg2garFRs3QgDmFckE4PB4gtVqA1Awei1o/eHX/85Eqi+7QRTBWquWwE9382jIPTjMfOXL0yUst2DF5eZRyMcvlRz9Bm+Tx3AKsCnHKk3ABicnFDTCKOcmjKQmLbIFYVH26WnpzwfXGiXkJvKy/Mun4ea3v9GlaEvq1IhJprw/VYE/nh11moWzE1TYwOFwnh0HqFN03+RZfOcrEY+yIPm/V3Ptnev6btcFnCIOYzGu3b2EPMeOauw9UR6K5+WTBZ87VTfbFRXxTgRehIkS5cATkJ7g3Nkl+M7LsTf5elENOk1iOTz7aYVJ4lxdbHggchozSTSD3xhuxcgcBLQEiHZwEM2V4Uph60GHh3OzfBzBNoD8bWxNEWdxHJoBxr0PX9++8CX74qRDPwGtehNWNaDEem7Cnkdx5+rMJN8qdHTJGwsX3EFYLGSNsVUP6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(2616005)(53546011)(52116002)(66556008)(8676002)(66476007)(38350700002)(38100700002)(86362001)(186003)(26005)(4326008)(6916009)(66946007)(316002)(7416002)(36756003)(2906002)(8936002)(6486002)(966005)(6666004)(508600001)(6506007)(6512007)(5660300002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW5jc1JuUTJlUkQrOVZZUmFQajZHODhvZk5PbFJqbXUrdWlDVXNJc2NzN3lm?=
 =?utf-8?B?d3pmUm9xSzBja041RlhDQ1pkUWFoSHFtV3cyd1hOaUhlUWlYRjhDdU5GV0p6?=
 =?utf-8?B?Rkt5UXhUM0JtdzBCOG1SK09VYVZFNWNUdVVMcTJ5OUxsa0NSMVJ0MVJaVnBj?=
 =?utf-8?B?SEhucDlQclY4ZzRXMkRKVm11ajlMalBEc0VkSEtwMjNNN0liRkJEWi9tb3pQ?=
 =?utf-8?B?clNEWU10M0pDMWxES3RwN09CckhwQzlYci95SG9qbnFkTVlDWi8xdUJnMTli?=
 =?utf-8?B?NzZmOUZFQlk3M0RjTVRMbXA5NnJGWTJKL2tUaUhsd2RHVVNDb1k3SW16eU9B?=
 =?utf-8?B?MG5RTEZFQmJpUTNDTVc0MUVrUkZYbklpcDNHNHBvazc3dHVuczJPZ1N0TWVP?=
 =?utf-8?B?QmV0blhlZEVIVzlKTFFrbjJhTStNMC93N1ZUTTE5UDAyWHNQRVY1YXprdWhz?=
 =?utf-8?B?a05LdlJLdzBGcVE2T2pWWTR1L0JyeC9abE9VSEN6cXlWczFFWjlMamJROEti?=
 =?utf-8?B?dE5Ia2J5Y3QySGxGWUxQVmR3eVd6bktLN0I0eWVSUFBHWWpSVWFpclBhR011?=
 =?utf-8?B?VjFXZTNwRyt5QWlua1g5WGQ0L1VqTDZrcS93ZlRKQnFCNkIwWGJMWmZaazJR?=
 =?utf-8?B?bEttcEZxbUp2WTU0ZkhKYWFkek5VSnhsTDFSQ2Fmdnh1MVBGL1NJYWUzYWVw?=
 =?utf-8?B?V1BqZ29pV3k5TFRoNzBkTXRodWF0MWlCclR3cUNnbEI1MGtzRjZxMTlzWjZF?=
 =?utf-8?B?dkFKdEpZS3RuUnpQTnVkZ01ta010QTVZUzBMbW9hQm4wSk82eHlZV1BYcS9U?=
 =?utf-8?B?WFNYbk9qMTRmTzJEZ2kyaXJ1R25yaDZvM1RORmNtWXRhVDc3T2N1SUZVOTlV?=
 =?utf-8?B?OGpzcWhOWG9GWmpmTm5SYUM0Zmo1Rjl0dnBqS2Y3dGV3blEyV3hmOHVjakdW?=
 =?utf-8?B?d1ZsUzhyR29QU1kyUkZtSkpDK043amI4cUx4Q3B3VS8yanZFUjg2R2JhSE14?=
 =?utf-8?B?eWI3WGVLS0cwRzB0dDlnUXNuVGc1eHpBZ1o2SmJvZDJOcFVTdmFEakU3Mmlk?=
 =?utf-8?B?a2VoVEgvcGkzNXlBRGw3Q1VUbGN2eDMwVXU1MWtmK25acFpWSyt5bWhGekdC?=
 =?utf-8?B?LzNUQUVMTUpCZkd4VmVOSVdtMUFOSWNWQUViQ3NJVDNhNFphSUMxaitVNEpL?=
 =?utf-8?B?cnFmSWdraXJlci9sdlhaY1JjdndURnM4Qm1BZzY4TWF0OEhhQlJPT0FJWXdP?=
 =?utf-8?B?RWJGQjZpTGwxSndxVjUvdlphTW40bGQwM3E5NjY0bkw5WEZrVVk5eVhKNDY4?=
 =?utf-8?B?OHcwbnV1dHozTVhkeWZNNVhxZDR1TW1hVnJpT09BYXlFRWQraDhQcVcxb1Yy?=
 =?utf-8?B?UGprc0Mva2JPR1FiOXFmTW9melM3MGFmOU1qdGhESzR2bFJhK2xNWUxFbU5i?=
 =?utf-8?B?dlNDMG9VblF3RjFPNWJweG1pOHVoOXFJQnY2QTB6MFExei9CN0kwL2Z6STBm?=
 =?utf-8?B?NkdyRWtob1RPNWRJamZVWlNYMklhTFZidGNjQ0dNYXI4M3Y3MzU1TjBjdUd3?=
 =?utf-8?B?UTFEalJVWlgzSmpqR3BaYlNjYUtDS3BYKzFtSVF0TjNCWXVBTjZvK1FJQlA5?=
 =?utf-8?B?Q1BqVUJhVXV1ZWhrQWdFRGpMMTVxR1FMbXU3aDd0aTVKbE5qcEdQckVzMG1B?=
 =?utf-8?B?cEl1TnNUTUEzNkNQM1gyWHNoVmRSL3FtOVZiNEhDaHhHS2NUaFZnb0tGd3ZN?=
 =?utf-8?B?YldtcVpNdVBYZm4zRU1sNm5VUGJTOTR1Zy9YUGJjTE5icTE5NlpmTjZmdHAw?=
 =?utf-8?B?M0x4MzNOS0I4VUtLVHllQWY4THBUN0Z2R2F2ZFg0c1p5OW9FZkN1NlNtNzYx?=
 =?utf-8?B?cW52QnpNeXBwWU42S1NqN1RYN2FLdHhvNnN5akUraWU0am9vNUM5Q1BLaldB?=
 =?utf-8?B?ZmltVVhDZlhSempTVlZ2eHNwM2hYYWJ0MWJnV3N6OExEMGJkL2lmdElTZTdZ?=
 =?utf-8?B?OWFzVDJCM1VrQlRjRlRFaUhMV09VQ2NjRGQwQnU1UmV1b0h6ZWVvZzd6NnNp?=
 =?utf-8?B?bXZOaEthVnVUQTZhWFR1bDF5eFdtUVJ5amJaVEV3U2xseFNNM2FsSHZUVURL?=
 =?utf-8?B?cGE1K0psRm9aVVJmbTBnRHBTdk04dmpGbHN2bVRWNU1NOWxvOWRqL0lJV1Bm?=
 =?utf-8?B?bDFSbHEwY24zZlpzcjFLN0I3KzBoMHIyQ1AvbjlTWXJzSCtCbXpkbTRFb05M?=
 =?utf-8?B?d1VXSGhnOExJaEg4c1pWNnhjSHJIY3orR2laQjVLcm4wbTBqTXVtSEVkZTZH?=
 =?utf-8?B?cUhYL2hCelB1TTQ5S0J4dmVWMWtOWVhzTHY3SDBDeTZLeEoyM3A5QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96bf39f-5f64-4c56-546a-08da1d35179b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 10:05:09.6623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tpE5qoH6rl+p4i3PDAfy/JOzNreOvdag2x8Y6m6TvgG6TOOh4/NK174QVGceHtXvvBDH5S3fM2rJNy225+w7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8322
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

On Wed, 2022-04-13 at 11:41 +0530, Vinod Koul wrote:
> On 02-04-22, 13:24, Liu Ying wrote:
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
> > v5->v6:
> > * Rebase upon v5.17-rc1.
> > 
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
> > diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-
> > lvds.h
> > new file mode 100644
> > index 000000000000..7a2f4747f624
> > --- /dev/null
> > +++ b/include/linux/phy/phy-lvds.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright 2020 NXP
> 
> 2022 now

I may change it to 'Copyright 2020,2022 NXP'.

> 
> > + */
> > +
> > +#ifndef __PHY_LVDS_H_
> > +#define __PHY_LVDS_H_
> > +
> > +/**
> > + * struct phy_configure_opts_lvds - LVDS configuration set
> > + * @bits_per_lane_and_dclk_cycle:	Number of bits per data lane
> > and
> > + *					differential clock cycle.
> 
> What does it mean by bits per data lane and differential clock cycle?

Please check Documentation/devicetree/bindings/display/panel/lvds.yaml.
lvds.yaml metions slot.  'bits_per_lane_and_dclk_cycle' means the
number of slots.  But, I don't find the word 'slot' in my lvds relevant
specs which mentioned in lvds.yaml, so 'slots' is probably not a
generic name(lvds.yaml is for display panel).  So, I use
'bits_per_lane_and_dclk_cycle' as the name tells what it means.

> 
> > + * @differential_clk_rate:		Clock rate, in Hertz, of the
> > LVDS
> > + *					differential clock.
> > + * @lanes:				Number of active, consecutive,
> > + *					data lanes, starting from lane
> > 0,
> > + *					used for the transmissions.
> > + * @is_slave:				Boolean, true if the
> > phy is a slave
> > + *					which works together with a
> > master
> > + *					phy to support dual link
> > transmission,
> > + *					otherwise a regular phy or a
> > master phy.
> > + *
> > + * This structure is used to represent the configuration state of
> > a LVDS phy.
> > + */
> > +struct phy_configure_opts_lvds {
> > +	unsigned int	bits_per_lane_and_dclk_cycle;
> > +	unsigned long	differential_clk_rate;
> > +	unsigned int	lanes;
> > +	bool		is_slave;
> > +};
> 
> Where is the user of this new configuration? Can you post that patch
> for
> reference as well please

Patch 5/5 uses it. Also, I posted two drm bridge drivers[1][2] which
use it.

[1] 
https://patchwork.kernel.org/project/dri-devel/patch/1617172405-12962-13-git-send-email-victor.liu@nxp.com/
[2] 
https://patchwork.kernel.org/project/dri-devel/patch/1617172405-12962-14-git-send-email-victor.liu@nxp.com/

Regards,
Liu Ying

