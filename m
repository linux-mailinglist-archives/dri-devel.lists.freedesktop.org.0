Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F94E8720
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 11:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A93610E21E;
	Sun, 27 Mar 2022 09:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1A810E21E
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 09:36:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZ0DBwK8PIvlLQsIt9a1J4flqc7EoJrm0frG6H8PL3gXOG58qx5p9pDLuaUc5fYxbHY6fJdITd8AG9DHLwZQRPk8myGwO9wfnBKXZ2OR3nacQ2L9etO3FX85pHYaDnasIl1GL+JupK58xoQJbtA7Sfw3XdwmFCunFc3zrSwsIgrbYl+WYLuA+7Jedvdv4hCClSwecru5k1yJEPR9Q0zw8qyUENINm1TmM87ekfosYElNI4rVn0Kxjgm+OwAscmoVKKHsYgDiYBqrzAwl07TUDkOuFvLcsYMna/3yHGj7lRi8DGKkfBr8q70n41hAw5FOQS3jS9/U8b8D11Z0KoKnoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4roxD8rOTGN1LHXXb1+I7rSs8WLa8mNphrdw2Jq7LBM=;
 b=Go2J0u4oONOPw/BO3wvHkSKcGttUL0Jnoo7Z67lSBhQJ5yu8HlFEShTJEGLXeMP9QuQ+uAc8JBZJWYjSFGUWXC/WviDFIiaDsnQkbKY908RsfD9RA8ep4Wfvqwk4IGoDkDGG4Uz8lDChhpHmmv4saZ1nsr8PQwW6lOoI7HmXpQB1DCQL+X5aZqgkYShxqga3W0CIiNML/gK3jg+YLVehXWEfjI34u4RBlKr3FdmQ6qMIo40o8GZgjjEkzd+x439VsgP9iLvxigEeHr7tgRGS7ehm9COm7EuCpWp4pJmL2tHzZ86j+7VJGjbmY1hCs7c+VMsZcvWLfhI6retQfbBRAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4roxD8rOTGN1LHXXb1+I7rSs8WLa8mNphrdw2Jq7LBM=;
 b=hQB/LFvsmnRUomRyD/39ky5VppGomMajzzgyV1qn5BjGrrsYI7MVtkvKT0nD5mQEFyUr+pKr/bIGIi31SZ05MutAJsKgITyP6+0zH+FSjWHg33IKDVc7GfAryBSgi9SrZbgaV4JibhEnttOM4E5gbDsqVUVJ75MDdkMYcucrS/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8812.eurprd04.prod.outlook.com (2603:10a6:20b:40b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Sun, 27 Mar
 2022 09:36:00 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5102.022; Sun, 27 Mar 2022
 09:36:00 +0000
Message-ID: <1d5e6ddabe68040039d6ee116c9d1cba2881079f.camel@nxp.com>
Subject: Re: [PATCH v5 2/5] phy: Add LVDS configuration options
From: Liu Ying <victor.liu@nxp.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org
Date: Sun, 27 Mar 2022 17:35:29 +0800
In-Reply-To: <63445c4c84c89b70fffb5dfa17c162c3f3abf0f5.camel@nxp.com>
References: <1616662832-27048-1-git-send-email-victor.liu@nxp.com>
 <1616662832-27048-3-git-send-email-victor.liu@nxp.com>
 <f078a133-de32-0e08-2d87-f2dde7c240ec@ti.com>
 <1619db59285c707c60e3738c4fc287ebb7a6487a.camel@nxp.com>
 <63445c4c84c89b70fffb5dfa17c162c3f3abf0f5.camel@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2P15301CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd99849f-4ff3-44cc-bccf-08da0fd533d0
X-MS-TrafficTypeDiagnostic: AM9PR04MB8812:EE_
X-Microsoft-Antispam-PRVS: <AM9PR04MB88129B3097E6DE26E8E44672981C9@AM9PR04MB8812.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9jFiPDLDE/21fnxbrmYeRZTFjnl8Rg0ITSqtYQ5vN0K6GuJqDaNAUpTlBKc+r2LIlvRFQ+kyY/6VyT/ngbbzKQ0vz5sFBneZAcI9UtHV4IWd2V5oeUD5GOiK0MltL3YI9G5M9hPw5bwuCokLrhetTfS8f+/rpkUTUwAo7nVZo8bk9O0jLWA02mfyerTck5KXgoydt/fHu5xgFwbkbvXHd4VGEqrx6iCLFXyL9KmMvDCMgHKGkNEIG5OCJyt3kx/+0aFOoQyxihNV8DwUB+HPKDkEjBYtnBK/9J0SazCm+ZZIMxXiJZFlyxjICmNzv3ZSMaLYTJZIXGjbjU2ysutx3AdgsGh10ms9GYDh/V1t8hHhLsAsrf/hTkd2fX1vwYbZ2wLNO5ohwIJgZOL1F+INaeti0hvlFbQwrLYsyDJUfJIBOL0mIvnlXkELrBFSLWI+5LQ9KmDpU3grO6sWii5nHb/89JscAUBiVLSrDzmmydnT86hFiR9C1wgcfE5CUAAJAFdrx9drahHpZ3xqyDALtyS+y4SMrGTD2EtjXDsFuDT6L3XLsZEDe05/B0P93qzSHNDfMdFHpd/kZExhYLeaxDIhTYW0F6g6qIPtbv+rV+mFcv6INcZi1kead+Q4WBFo7yUm4pCh9mQcKB6zxcE0TAWYMynYklkYKMiiHAWv72knKO45KTxcVj79O6QHlaLmyk0/EZpolSaSkfy9VOLC3d7BWr+e8DqtKza1nhpLSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(6512007)(53546011)(38100700002)(86362001)(4326008)(38350700002)(8936002)(2906002)(36756003)(66556008)(8676002)(52116002)(508600001)(6506007)(6486002)(66476007)(26005)(6666004)(2616005)(186003)(316002)(83380400001)(66946007)(7416002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RCtiUEtySzFKbUpWUENvVVEvT2hTWWNlbkxqbFlmejdYUmM4SXlVSEVzNDNO?=
 =?utf-8?B?SkNYRmdlNjJPbTA3by9mU3hTa1ZKaTZJYm81T01CdVdFaUxDRGgxV2kzOWp6?=
 =?utf-8?B?ejhXaGNBMUs1UHZYMGNoNmdLbW9LRzg2d2d1dU9YQ2tYVEQxQy9xcUVoNnN0?=
 =?utf-8?B?SFA3TjJFQ0dDUGN6dVpZcFRtSTdYcHF1VHhhM3VnYlBDZmNvQkRDeGw3Q1kv?=
 =?utf-8?B?Vzgra09JOFUwVXI1VXhsUTdzU1ZSQ2JRbTZuOC9EaWI4V3I5UUpZVkVNMGtx?=
 =?utf-8?B?SVNBeHBMbytNdEtrcTg2cnlHaklkU0FnSGNDckkxQTh6VHVadmhFV1ZaY211?=
 =?utf-8?B?aFNoam5wZFQ0NTdIbUoyWFFzc0w1bDNaSjdld0pFSWpZamtRZHE0Y1hZbWQ5?=
 =?utf-8?B?bkw3UUpUb00rQzJxY0FHNGZFaGVrU2FZOFBoeDNEY0taY05GaXI2dXFYcmpr?=
 =?utf-8?B?TUpEc3J4U0VOVVNYVGdETGdlejZidTRsSmdoK2hvNGtiT09IZkd4V2FQR2cy?=
 =?utf-8?B?T2xQdnU3UThNVjE0M0pGaE8xekZHQ29MMGw3NWRvOUZrMFgvbXJKbFJGaHZr?=
 =?utf-8?B?ek9yYzJOZ1Rvb2VRWExxTFlTWjZiWFM5bExZeE1xTUhpazBENnM2b2JSUmNS?=
 =?utf-8?B?MnpFTzRxOVJwRVFnTTFzTzRnbUpxazZDNlRHZ2xYellSVjJObmlqaDYzRDR5?=
 =?utf-8?B?VFgzMktZcWptSkIrRXM0ZGJzQmZIVEpFWUxhMGl1V2xyNjl1cXprd0tKREwx?=
 =?utf-8?B?QzhNcWg4UTVKVjcrQ0d5L1hNbXBDWE1Fb3BOSkd3TVZaN1V2K1dMdTJheVdD?=
 =?utf-8?B?dGk1RTlKMndzMm1FMi9KMlJ1UzdGakpnWXFOdU1Qd0tpa0JFMlFzNjdxY3R1?=
 =?utf-8?B?MXBoME9yTHlRbW5xUmZrMVJhYzc3NXNVQ2hYQjc0aHl5dGYzbGJ2VlpCaEpV?=
 =?utf-8?B?VnlmclNHeDZla3Y0a1o0Mm14dXA5TVFTS1F4N04rOXpkaDBPNUk3clJGQy9B?=
 =?utf-8?B?VzNLMzVEelIyVEZWcjRkZDFCKzVuVXhhVE14YjF4eWRUUUdEU1RMbXJsL3Za?=
 =?utf-8?B?a3poU0huRXpiQ2FnYytRbDVtcWg1SVF2eUhIT05nSlE4bWh0Nk1vS3k2b2VF?=
 =?utf-8?B?L3Rld2ZmWXZEcllrVENkQlV2RE0vUHg2WkpjVVlXMlZEZG5WSUs0TDQyOFd4?=
 =?utf-8?B?VlpENUh0dHdzNFRTeEtqWURVODB0R0czci8ySi9IU2FZdVkvZDZJeXRQQ3RV?=
 =?utf-8?B?cEpWQ1R4N1pnYjZabzN4VlI4d1hsU2RzWlV4OWtsdWhCTE5vZlA1MkYycHZC?=
 =?utf-8?B?REJhQ3pRNnBLdklzRzUvOUxxOTdCb3hCWE5HSEpIbjR5alNoOVMySERXWkdJ?=
 =?utf-8?B?Sm5KbnBHdUtiUzJzWTJsZ3dHOW9iTjZkUW5ZNlNhTis4T0lPcU9YSDVaZUJK?=
 =?utf-8?B?NU9sLzcvRVA4ZVB4aXk3QUNtZmpCUmp2WFdrS0JxdWNZbW1MaGJnRm9iMU16?=
 =?utf-8?B?U3VWWTA2MEQ1MmRsVm40Y0hQMDEwWkZsSjF5ak9ZK3dLMW8wUGRGbDJKenRk?=
 =?utf-8?B?S2FMUW5Ya1F5OFBoTXljVnl4cVppOFVPYW80WkhNbkNtVitTWFhaNTFjRVR3?=
 =?utf-8?B?UXZmTmduMVAxOENmZzhJdVRMTm1rWG83U2l4MTlXZ3hnZDJQTkJ6eVlFMnp4?=
 =?utf-8?B?Q28vUXVSWjUwUWZsRDMrZjRiaTZ4MkpDSk9zeVZEU20zalhhaWNUaW4zZzMz?=
 =?utf-8?B?YWRJUlJOOW02cDZENW5SZmVKOG9xeFpFeFdWMHRJSmU0eWNqNnJvVk1pM3hX?=
 =?utf-8?B?SWpwVWhqM1prZDhjbkRiZzVUcGdEY1BXVmxiV2JDT3VsTmc2dnc2OTMwSUN2?=
 =?utf-8?B?d0JqUmtmUFB4b25mdGQrNk9sZ0FNNUYvZWVGakFWeDFINm54VE5JT0U2Q25P?=
 =?utf-8?B?ZU00cUI5SS96emZnZTVISkk3enE3WjZQZytMendWWTZlOUhNaUZzZElGb21M?=
 =?utf-8?B?K1NFRHMzLzJnNWs2dC91TDB3ZjJnaWx4d2ZyblFmS2Z0TURNV3dZNGNJeXlr?=
 =?utf-8?B?eU9CMVBiUjlaaURFNDJTcXU4UnY5YjNGUVZtelhOVyszcEFmWkVLWVM2cDl6?=
 =?utf-8?B?bnhMNkpCd2JMWVVzL0s1cDBpaWhvbVJLNnBxT3IyVFROQm03dDk3TDd5WG1J?=
 =?utf-8?B?ZkRrMHBsNjZsT1hNZlluaEZIcmxTTzVVcFNRZTlCWkJKbkhQK3lzc0ZzZ202?=
 =?utf-8?B?S1JkOGo4ektudzZEUHhTODBMdzF4eWJ2TVYrY2VWMkpKc3hkTHNpcDlta3Z2?=
 =?utf-8?B?OFJQNnhSVUtDUDN5WmhJSFVhc2Q5ekxkNTFzY2haTHdsV2luU3VKUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd99849f-4ff3-44cc-bccf-08da0fd533d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2022 09:36:00.2489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5cu1WceqXPGNtxq3D+VwjtOfpaAh6OUAe1H7CBoMGWC7iwTMXyqCCT04Tt+NsXY9H2blAfuqMXUPKxYgF1SqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8812
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

On Thu, 2021-06-10 at 17:38 +0800, Liu Ying wrote:
> Hi Kishon, Vinod,
> 
> Any follow-up comments/suggestions based on my previous reply?
> Or, perhaps, just keep the patch as-is to support the generic lvds
> phy
> configuration structure?

Ping... Any follow-up comments/suggestions please?

This series is flying for more than one year and is blocking the series
of adding DRM bridge drivers for the LVDS display pipeline on i.MX8qxp
SoC.

IMHO, the generic lvds phy configuration structure is useful to custom
drivers.  Shall we keep the patch as-is?

I may rebase this series as patch 1/1 for nwl-dsi driver needs to keep
updated with the latest nwl-dsi driver.

Two more comments below...

> 
> Thanks,
> Liu Ying
> 
> On Thu, 2021-04-01 at 16:36 +0800, Liu Ying wrote:
> > Hi Kishon,
> > 
> > First of all, thanks for your review.
> > 
> > On Wed, 2021-03-31 at 19:02 +0530, Kishon Vijay Abraham I wrote:
> > > Hi,
> > > 
> > > On 25/03/21 2:30 pm, Liu Ying wrote:
> > > > This patch allows LVDS PHYs to be configured through
> > > > the generic functions and through a custom structure
> > > > added to the generic union.
> > > > 
> > > > The parameters added here are based on common LVDS PHY
> > > > implementation practices.  The set of parameters
> > > > should cover all potential users.
> > > > 
> > > > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > > > Cc: Vinod Koul <vkoul@kernel.org>
> > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > ---
> > > > v4->v5:
> > > > * Align kernel-doc style to include/linux/phy/phy.h. (Vinod)
> > > > * Trivial tweaks.
> > > > * Drop Robert's R-b tag.
> > > > 
> > > > v3->v4:
> > > > * Add Robert's R-b tag.
> > > > 
> > > > v2->v3:
> > > > * No change.
> > > > 
> > > > v1->v2:
> > > > * No change.
> > > > 
> > > >  include/linux/phy/phy-lvds.h | 32
> > > > ++++++++++++++++++++++++++++++++
> > > >  include/linux/phy/phy.h      |  4 ++++
> > > >  2 files changed, 36 insertions(+)
> > > >  create mode 100644 include/linux/phy/phy-lvds.h
> > > > 
> > > > diff --git a/include/linux/phy/phy-lvds.h
> > > > b/include/linux/phy/phy-lvds.h
> > > > new file mode 100644
> > > > index 00000000..7a2f474
> > > > --- /dev/null
> > > > +++ b/include/linux/phy/phy-lvds.h
> > > > @@ -0,0 +1,32 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * Copyright 2020 NXP
> > > > + */
> > > > +
> > > > +#ifndef __PHY_LVDS_H_
> > > > +#define __PHY_LVDS_H_
> > > > +
> > > > +/**
> > > > + * struct phy_configure_opts_lvds - LVDS configuration set
> > > > + * @bits_per_lane_and_dclk_cycle:	Number of bits per data
> > > > lane and
> > > > + *					differential clock
> > > > cycle.
> > > 
> > > phy_set_bus_width() instead?
> > 
> > This member aims to configure the number of bits transmitted during
> > a
> > period of time(a clock cycle). It doesn't sound like a concept of
> > 'bus
> > width'?
> > 
> > > > + * @differential_clk_rate:		Clock rate, in Hertz,
> > > > of the LVDS
> > > > + *					differential clock.
> > > 
> > > Please use clk API's to get rate.
> > 
> > I like your idea. But, this rate is likely runtime-configurable,
> > e.g.,
> > a LVDS to HDMI chip is connected. It seems that there is no
> > appropriate
> > driver to set the rate by calling clk_set_rate() then?

It doesn't seem to be reasonable to use clk API's to get the rate,
since the phy should generate the clock signal(act as a clk provider).
If the phy drivers do act as a clk provider to register a clk for the
differential clk, the phy drivers still need some way to know the clk
rate. 'assigned-clock-rates' DT property cannot provide the rate
because the rate is likely runtime-configurable like I mentioned. So,
it looks like the differential_clk_rate member is the appropriate way
to provide the rate.  

> > 
> > > > + * @lanes:				Number of active,
> > > > consecutive,
> > > > + *					data lanes, starting
> > > > from lane 0,
> > > > + *					used for the
> > > > transmissions.
> > > > + * @is_slave:				Boolean, true if the
> > > > phy is a slave
> > > > + *					which works together
> > > > with a master
> > > > + *					phy to support dual
> > > > link transmission,
> > > > + *					otherwise a regular phy
> > > > or a master phy.
> > > 
> > > For parameters that are known at design time, it doesn't have to
> > > be
> > > passed from consumer driver. So all these parameters do they
> > > really have
> > > to be passed at runtime?
> > 
> > Yes for all, perhaps. Details below:
> > 
> > 1) bits_per_lane_and_dclk_cycle
> > i.MX8qxp LVDS phy can only do 7, while i.MX8qm LVDS phy(a different
> > IP)
> > can do either 7 or 10(configurable by setting a phy register).
> > 
> > 2) differential_clk_rate
> > It's likely runtime-configurable, as I mentioned above.
> > 
> > 3) lanes
> > The higher color depth is, the more lanes are used:
> > RGB666 - 3 lanes
> > RGB888 - 4 lanes
> > RGB101010 - 5 lanes
> > 
> > That means a phy with 5 lanes(like i.MX8qm LVDS phy) support up to
> > the
> > 3 types of RGB pixels.
> > 
> > Though the i.MX LVDS phys don't have any register to configure the
> > lanes to be used, it would be good to define it for phy_validate()
> > or
> > other potential phys?

Like the lanes member in struct phy_configure_opts_mipi_dphy, the lanes
member is useful for custom drivers to choose/validate lane number.

Regards,
Liu Ying

> > 
> > 4) is_slave
> > Any i.MX8qxp LVDS phy instance can act as a regular phy or a master
> > phy
> > or a slave phy. Changing mode at runtime is probably unneeded. But,
> > it's difficult for the phy driver to get the mode from device
> > tree(see
> > drm_of_lvds_get_port_pixels_type()), I think. Export an i.MX8qxp
> > LVDS
> > phy specific function to set this instead?
> > 
> > Regards,
> > Liu Ying
> > 
> > > Thanks
> > > Kishon
> > > > + *
> > > > + * This structure is used to represent the configuration state
> > > > of a LVDS phy.
> > > > + */
> > > > +struct phy_configure_opts_lvds {
> > > > +	unsigned int	bits_per_lane_and_dclk_cycle;
> > > > +	unsigned long	differential_clk_rate;
> > > > +	unsigned int	lanes;
> > > > +	bool		is_slave;
> > > > +};
> > > > +
> > > > +#endif /* __PHY_LVDS_H_ */
> > > > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > > > index e435bdb..d450b44 100644
> > > > --- a/include/linux/phy/phy.h
> > > > +++ b/include/linux/phy/phy.h
> > > > @@ -17,6 +17,7 @@
> > > >  #include <linux/regulator/consumer.h>
> > > >  
> > > >  #include <linux/phy/phy-dp.h>
> > > > +#include <linux/phy/phy-lvds.h>
> > > >  #include <linux/phy/phy-mipi-dphy.h>
> > > >  
> > > >  struct phy;
> > > > @@ -51,10 +52,13 @@ enum phy_mode {
> > > >   *		the MIPI_DPHY phy mode.
> > > >   * @dp:		Configuration set applicable for phys
> > > > supporting
> > > >   *		the DisplayPort protocol.
> > > > + * @lvds:	Configuration set applicable for phys
> > > > supporting
> > > > + *		the LVDS phy mode.
> > > >   */
> > > >  union phy_configure_opts {
> > > >  	struct phy_configure_opts_mipi_dphy	mipi_dphy;
> > > >  	struct phy_configure_opts_dp		dp;
> > > > +	struct phy_configure_opts_lvds		lvds;
> > > >  };
> > > >  
> > > >  /**
> > > > 

