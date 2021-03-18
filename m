Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169E033FD2C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 03:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251FC6E873;
	Thu, 18 Mar 2021 02:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AE56E872
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 02:23:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFMSMLWUNqwwp25+TFDHanHeWKCt8OwTVhmPayrgn2HnHKUS/KYOQnmvhaUhIiCg7T7xedFs3LFvHCfdSbBk/2wyUm1s1IjjKCe4mooKyuKdXYzmSfwponfMEii0REgPvrDNo5KMwbK4LTOadufGKxB0heywEP9SyY1aeSAWp9wN66TrbSr5LfMd1nMmrDaOV4faz+wUr3KEu3brrCLl8ayepib2QOARYeZ0MeWaou89wY1geHGRdT8Z3GUUdTgoWBjXxlktjWz2Q11iGGiZLfzyExuIStBBI0zVuoinMRDWXKShAhFlfSrHScciTOWG/Xilt066wwP0qjb9MSUZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QJ9nFwxo7WOPj1goLWTz/CxKFpWjyAOoFS2h7CZ1UQ=;
 b=HaUgel3hNNuJPFiuWLw0ofHZ9OylSZV2EB6wEDScn7uuNN6WjWW5R2QWSPGL+SgALHpeU2WiM8PbKdKwOKMxbZRaTLAvdnIXhNHd1F4AjPhjIWPIjkdXOxkOCNaSbGODX0/5Cf4JN9Hyj9stD+db40quTIaipFCsTZs9umdHhJWPuJf4BTl0a8EwLCjxpFxjv+MnBM65x8ty8T0rlTN90A3w3RdJt3NhpN9swHJPpBz2CeEY3GEU7+3QbIOdm/Hoys5QpH4OFbWSD4aWYkgrwafdut3BFXEtvRHk7Kq8MptxwtU7Yf9/U5pi8QrefI91H/NyM1V1WRWLxI2NH5LpbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QJ9nFwxo7WOPj1goLWTz/CxKFpWjyAOoFS2h7CZ1UQ=;
 b=YgRGqntGaox9L1tMDHEV9x3tIFUCzibVOW4w1SzoDoK1lGw0eFRjogRpTT7AzrBGLlgvcTJp/doMw8Yc5cDfxtyVYkGlJrQbca3uZr71IhEwyWBwI93bxYMVn+rJmqKRRZn+uJSRi7jLnikvHeqMaevmFTjqWRr0eflNhSf39BQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 02:23:42 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 02:23:42 +0000
Message-ID: <6c52ebc6a027cbe309ed2c8848f2ae8cfa6e15f4.camel@nxp.com>
Subject: Re: [PATCH v4 2/5] phy: Add LVDS configuration options
From: Liu Ying <victor.liu@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Date: Thu, 18 Mar 2021 10:22:04 +0800
In-Reply-To: <YFHYeZ/ZVqNiG/yo@vkoul-mobl.Dlink>
References: <1615175541-29009-1-git-send-email-victor.liu@nxp.com>
 <1615175541-29009-3-git-send-email-victor.liu@nxp.com>
 <YFHYeZ/ZVqNiG/yo@vkoul-mobl.Dlink>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:203:d0::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HKAPR04CA0003.apcprd04.prod.outlook.com (2603:1096:203:d0::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 02:23:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 63091aa8-0b49-4f45-5002-08d8e9b4d95d
X-MS-TrafficTypeDiagnostic: VI1PR04MB7183:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7183119E79E41969E44DC11E98699@VI1PR04MB7183.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ocg2NwFu+OAwJtxT1i4/SGQEScuE5MkcrZxv/LPuSkkn2iroQ1WPlgJUIEE041bZ1aj3Ys/KN4wM+L745ScfG6Y9k47r3FHkQyY35u3rg/MGNlHX94uIzSd5MAxGtYq1w70qgZxPWyAGN2Po4YrDlWty4I+EUCOSd2XVsCtjhgZfpgGlDXIwr+2e+49HwTVpY/rBJ6SZPp/oVoGxXFeyfcFFdemviNnKoKTddwPdm65gE5nMUjZ964I+qusgpFaydZ0T9sAgG0pcR/jDWr5r5OysqEK7WSnXpdXskc9dZxHn6rJEsdaSZPl4JuDCeKlQctQWN3L8O4+qVvs5cROvQndfAI9QbtrZNa7hlF5jJ/HwAOMOBXLg3VqNgOt7oAh+W+tCQKJ5NYYXATUK5fafRkcYHfUiEICM8goyw4yVOGUCviiMg0A4X5CG+mpPXbOVq+pWBRqxt/WZH54b9TOd/kvd67xZ7jgadCXbbcuBe1UII7l8gvvKy7aPh0CnZdOJwyRUEwWhjql7hAUxTtrG1AZJmVPMOnAt4EI+bWOnY//xBRlYryXr+PwUTXW39ANFnjV84xMkIZQeP1D4xiQh5YV6gMGeCBS+YrHq178J6yeb17jLgJvxhKJMP2VOvCvIw/uzbda824N2Oi6yV821ClDo2AJy5dPdqhJw76tottErr04aaDg557er7m5iDWAN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(956004)(86362001)(66556008)(66476007)(6496006)(16526019)(52116002)(478600001)(110136005)(7416002)(8676002)(6666004)(36756003)(53546011)(83380400001)(66946007)(966005)(6486002)(26005)(2616005)(2906002)(4326008)(186003)(8936002)(5660300002)(316002)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0YvSWpDVzdtTlZ6Q1AweEtKNEVuUklVR1RUYko4UEN3dlF1WDROekZWRzk0?=
 =?utf-8?B?ejhLZXc4bm80cTdYaER6eHlURi9LNWducnFKQm5RSlI1VWVIN1VLZkRGV2tP?=
 =?utf-8?B?U2ZWQ0ZzNmlMZHFzVTk4eFE2M3o3L3IrbmNkQWJhZHpEV0FjYmVOekR2ZkFN?=
 =?utf-8?B?dFJuL0RoaEh6MzRvc25qRnpWSHRvaHVleDVJQTEyN0djUVZaZEJQS1dzc045?=
 =?utf-8?B?NmFmcXRMZVpZMmNETnhlZnMzbzFGVXVTQVdLNGFlTDNzWExiN3paaVNDKzhO?=
 =?utf-8?B?SVpZQlloa3NiNjZqaVlqOCs5TzZteWZyK0tFSWs1NDZ2THlFNmpJUHJnUEE2?=
 =?utf-8?B?d1hNd2c4K0VlNUpEQTVKK1dEcFBCRFliWTZSUnplQ0tZQjdsRlU2R2xmSnlZ?=
 =?utf-8?B?cTFqK3pmVkF5Ulo3S0NqbVFUR0puUklETnFmMGU0M2RKQ1NnbjBzdDl0dFN5?=
 =?utf-8?B?cUpYOXRtSndDdmg3Uk9tdDhnK1E5VExIRU9na2tRdTdWMjZab3VneVdtaTY2?=
 =?utf-8?B?SUtZMnA5RVZsOXc3cVo5blUrZ2piWGdrNVZUclhZOGNxWmlxV2JpTElTZEta?=
 =?utf-8?B?L1ZIVU1JU0FkblZkVmhTdk15NWVZVFU2cThiR0VTZ0ZlSHM1eXFmUm1uWWtH?=
 =?utf-8?B?Um1mODNYdlByNWZ3WVJSRStraHNpV3VGNWdBNGRwcTdackQwV3pvL2RIUWZn?=
 =?utf-8?B?V1lJcS9Cc3FCSjgwWlBRWWgwT3pxTFRBNmUxUjk4SkFJWVpiMk1zNjUzZzk1?=
 =?utf-8?B?c1hLT0VrL3c5SlFIM25PS0RMdHgycHBVL1A1RjFZWEUvSjd5ejE1WFlObUM3?=
 =?utf-8?B?NlN4Q2prVElYVHloZ0xiWW03dld5d0k4dXBwcnVEcWJQcVk2c1cxTWorOU10?=
 =?utf-8?B?K2VTSjhrR1pFNXBIRFlGK0p6bHRIeGFBeVowazFpenl4OVowbDM4cjVCaWFI?=
 =?utf-8?B?VFJXTW1hdVo3aS80VjQ1eFNta3RxUTNOMTFJNFBaK1J4V2d0amFXUFFFTGcv?=
 =?utf-8?B?QTlxbWpscTVxbkd4bldjay83cC9uOW4rRHB6UXhid0hadGUvREpaVzFIaGRu?=
 =?utf-8?B?SkF0eWtQK1V3OWJ4dEpxMGtTNDE4WWdoVTVnaHVZL1FRLzU2V2RDYTNPSTFM?=
 =?utf-8?B?WG1vd0tQUFRwWnRmOEpNUmhuSldZVWZWc1lyazdueWJ2aVpsdXVnMmUxL2lF?=
 =?utf-8?B?WWdNWWlzTDdqSHovQnk2WU1QM0ZVMlJlakNnVXBiZ0dPa29INTlnVVhyN3ow?=
 =?utf-8?B?MUFEQ2o0QUQ4OW5ENDJEYXZZTWpYcmNaRzFBVTJpbkNIZHdtVGdXNC9LT0t4?=
 =?utf-8?B?S2MyU2VPQ01weHl1SmE0V0hldWxwMmpSZDlQT1ZvT0IxdWJGQ2p1aFE3eWlw?=
 =?utf-8?B?UVhNRHkrYWdNSnNqaVQwV1FNNmtuWjlabm1VNGJCNkVucHo0Ukx0ejJmNTRo?=
 =?utf-8?B?UHBrSVdwc0JhN2U4dm91cm5ETTlQQUh2S2hIYzc1Q1JkUEhvWnZyaDhram9K?=
 =?utf-8?B?aktrb2RiVkpubFFEaENwTGlxTlpocWlkSDZkeEpXR3VlT1lmQUNFMTRwWXlu?=
 =?utf-8?B?TXhjRTdVVUMxbW5Cd3F5clBrVjhjOFU0K0laV25GSDVCSmt2YWU5T1lobUVB?=
 =?utf-8?B?YWpaeGNGV2YyeHUwWTRKUjUyUjV2aTVJNU12aXVUbXBLbWZxWDhqanorNU5h?=
 =?utf-8?B?TGR4MlZFdUNCL1VmZFBHcS9JUDZmZDJwUlN4Uit0ancyTXB2cVk3WWhHVG1G?=
 =?utf-8?Q?1DuTTwVWb1IIyD7AtvODwbhRXIPx3VAruPbU00g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63091aa8-0b49-4f45-5002-08d8e9b4d95d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 02:23:42.8558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5gl4YwpTFQE+tasdtem3wHmZTmoUmnytvYqHf5kT/bGLRXGo6JHRWpI04RYesU+wmtCP+5AEDT0RFEVrkbjaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183
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
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, robert.foss@linaro.org, martin.kepplinger@puri.sm,
 shawnguo@kernel.org, agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

On Wed, 2021-03-17 at 15:52 +0530, Vinod Koul wrote:
> On 08-03-21, 11:52, Liu Ying wrote:
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
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v3->v4:
> > * Add Robert's R-b tag.
> > 
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
> > +	/**
> > +	 * @bits_per_lane_and_dclk_cycle:
> > +	 *
> > +	 * Number of bits per data lane and differential clock cycle.
> > +	 */
> 
> Can we have these in kernel-doc style please, similar to style in linux/phy/phy.h

I take this way of in-line member documentation comment for the below 3
reasons:

1) Members of struct phy_configure_opts_mipi_dphy and
struct phy_configure_opts_dp use the same way of comment.
The structures are defined in linux/phy/phy-mipi-dphy.h and
linux/phy/phy-dp.h respectively.
Aligning to them makes a bit sense, IMHO.

2) In-line member documentation comments[1] are mentioned in kernel-doc 
guide. It says 'The structure members may also be documented in-line
within the definition.'.

3) Even the 'configure' and 'validate' members of struct phy_ops use
the same way of comment.  struct phy_ops is defined in linux/phy/phy.h.

[1] 
https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#in-line-member-documentation-comments

Regards,
Liu Ying

> 
> > +	unsigned int bits_per_lane_and_dclk_cycle;
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
> > -- 
> > 2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
