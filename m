Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3084937E0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 11:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EA710ECA6;
	Wed, 19 Jan 2022 10:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60054.outbound.protection.outlook.com [40.107.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041D710ECA4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 10:01:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXtRKPpoZLgemd/yzlaciYXnEHW/0bbwlKtuZU/mi3zPfV9t4tba9EmjhmCzacl2Insl6YsnI+154siWxsoT3FEwKXhGf4HtWOWP1N5C8E9O0kJHW5zlP43h4hIO2FmkR1rMVz419tTRiIURLup0fy81g++EXsU8FPycUQW8a+rmh9Jhxl7dvOPdgKgDH9QucMqk/wyCtVgTFSiX+9anoOH9ais6jD8ECWQgIqiXmBa+ub/yYLujHM7pe5fLQDga/g9x1PDS1A9szyvE0nrT5ANZTnPy4iUcDjc+6IYhQj7iBdqvXiUY0i1mkeBOmkF4fqCvuOVY2kp5E0rbw+eveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpI/OvvzsJzNG9gqkH31JufC65GNwIs2+MiU3ryh/hU=;
 b=C9kWyT7DpKlczxMgk5E60yJlG0PmsHNzwK13sN61ZjiNvNQi/t/hfDw0QnaFbV/QGgQSo28haMZ7hHfhL7SxSBZ9DmYvlAXFkdjQvWLBIw8agkMwk/TCb1WGSKL0BRnj4eQrkRHkmRmcee28yuSW8hIbIUMjri4NRUq18K9/YP0IQdO9sV8RxjOAY+0JZ/MAUGBOEOu8yJjz3/A/rkpekWtZIlwb1x58mg4WlG5qZLBIU23FNhTP4d7bqDw3I3oz9VAajEHQIQSJc3KcbyhJjhlZ3uNGwvi34YY6D9lV31OAgycidaCdvNmw3nrGx3FopMXGd1QaVmqRQbL0qU2lHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpI/OvvzsJzNG9gqkH31JufC65GNwIs2+MiU3ryh/hU=;
 b=lL/16EIGvabmZ9NLvgPYsJCDm4nBuEZJ/1aJzNEBX3dK19gvIG8UICklrjpEm1yeLve6AaO0XRxfTr34itsRfQARqB9kMJ4FT5QKSfLt2BdbQSRHoPlCj/rdbAkyQPPHDFTkYX5odNBOgCPuYz7vCpX/sG2CyBMHsAjR6JsYPss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3147.eurprd04.prod.outlook.com (2603:10a6:7:25::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 10:01:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 10:01:39 +0000
Message-ID: <8ad2cd76e80056192395ca5b73ff514e59881ba3.camel@nxp.com>
Subject: Re: [PATCH v2] phy: dphy: Correct clk_pre parameter
From: Liu Ying <victor.liu@nxp.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,  linux-rockchip@lists.infradead.org
Date: Wed, 19 Jan 2022 18:01:08 +0800
In-Reply-To: <5a638561-c704-49e7-1fed-70e26fedb186@baylibre.com>
References: <20220119023714.1498508-1-victor.liu@nxp.com>
 <28e3f723-daf0-b3c5-ee10-519c4cabfe17@baylibre.com>
 <5a638561-c704-49e7-1fed-70e26fedb186@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0117.apcprd02.prod.outlook.com
 (2603:1096:4:92::33) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f8f38fb-115f-47a8-169e-08d9db32af81
X-MS-TrafficTypeDiagnostic: HE1PR04MB3147:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB3147479CA3C0EE6CB4DB7C4498599@HE1PR04MB3147.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nxGdPUlfw+7dFEwYuq+Ry8fujZVzkF8ujDxFp0FYPcziv2quUdxqYWvlNRppnqguV0wFrHh3Q9ZvgQ4zOH+7lGo5q6iWe/A/MYfNkhaUd1tIoU1NPB+w16HYRXRUL5ncs7BhEmhzSCHhR0WiFxcZOOFORKCg3FNyBrR7Um7iuwUDC6a0G1hzpmEo4+URchdOv2nKjfnt0fBn0Xjl9ldlZDzfouc27qwtVg1j1yVjB7FHzr7VAr4vDxwjHAp5ebl9tdMEyzH+P2avRL/k8e69zzPqfa3s71d/vJIPvpM4ipe7t5kU83eHDpEx1XVYWOu0c6JnsMHszmzKbDMBKVRA/hyRzzxAj8l8eBMfEwLpLDEfhq2kOciIfclWFI1+E+wm0DSa32gtU+O91L2O2hqzA8ZoptcN8i2IFw0TmobYHmNBpYf57aB/Iw6GSVfpGWY8je8T8CAn0PHQmvnAJ163MFTcPxuB/YYh0oxbZMwNAaPXgT7Iqlh8qyYyq1zdfE0hTbaUVkY1kfh8EDIfsgjkOU1ZyK9qb9HbiC8/hMraOpoOhhvCl/QA8OLB1ZaAXxTNmSAT6ldMYQpoKyv9VtXEWRwduvuJhbCeBKj/Fjw6iZI1kWk0GvY2h6KdCzbYkNiL77bkVgDGpy2UOnpCH0CdsvjRolTYUAU1OUeG7XKxXg5tbfMx5BbLAyGvx+/X9HsNWJS8NUD6weTgiNyInj535A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(66946007)(7416002)(508600001)(54906003)(2616005)(6512007)(26005)(6486002)(66476007)(5660300002)(6666004)(8936002)(53546011)(8676002)(6506007)(86362001)(2906002)(52116002)(83380400001)(36756003)(316002)(66556008)(4326008)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vno5S2VkU1NwQjFoY0NyRUNZcXprSlgzdGN0NTNzSjAxdEFLVVptWnhrd3NG?=
 =?utf-8?B?V3llck8vbmFxMHpwWW9TY0VKcHJBVDYwT1BKL1ZFTWIvTTRFdjJHNWZRalJR?=
 =?utf-8?B?Y2twaFkxeUc4cERFSlY2VW52NkNXNzl1YmtndGRxZC9qYlAyckwrWDFlTHpC?=
 =?utf-8?B?NFN1dGVvcDRKcjhXcXNJMmRwWFhvbVpCSG5aTndZQ1duRkVuOHNsSHg4MTRU?=
 =?utf-8?B?REx2NG9pVjgweDNBVVNWb2JWdWpsU1dPNDNhZFJsNEVEU1c3eThycWYvM2JO?=
 =?utf-8?B?RE0wOGVxcmpOaVhwTVBVUFUzeDdUcGswMzhhVlo4VHBhMmJxZFZ3N1VkOHFu?=
 =?utf-8?B?Y25kbm14UDU5VmZTSEZLOWxPTElpVzNHaDhYdWNvWkN6OVRTTDdWd1pBVFFY?=
 =?utf-8?B?WUJ6L0xnN0c2UXdpUmpVRDRsM1M4QldpZXE3ZllzMllvcTc3dnRHOURWNVBm?=
 =?utf-8?B?dnpEWjZvUHRZREV6SXRSczJPdnBKUnN5RnJkdlI5VTVSWkpkQ0ZObDV1YTFu?=
 =?utf-8?B?bGtDV3JydWdnYWtBa1k2RXZQajY2V0xtVUYvT0ZTYS9PMWNkUVR0M0YvQVRU?=
 =?utf-8?B?NVBTMDZZVWtCQ0l3Z2tnR0s4aXdVVWtDUWJFVGlDTmc3aGMxdHRETUIyVzVq?=
 =?utf-8?B?OTI1Mk1lSDROQU1scTBuVmUzZWxKSjZKWnppVjlrbEtBZ2VlckhmaWlDZnR0?=
 =?utf-8?B?NFRZdFNSTW1xMXVGMm1RMUVMWk1PRTdEWTEwUE84a3pOcTdGWnR3bFlmaUVZ?=
 =?utf-8?B?eGVNdTUrL0duVlppU05QbEZId1hOU1NIemVWSGhxZ1VXSWcya25tQWcvcVhm?=
 =?utf-8?B?a0hieTRHelEvem9HNmhLaThlZExnZFhCU016NnltN05ZNFZkRVJoRUFTQVBv?=
 =?utf-8?B?Tm1hNVBEbC96TXJrL0ZxUjRQcTE3di9ZR3QyZVlrK1lyQTJudDhaaHZSdHhl?=
 =?utf-8?B?MXBXdnJ4TEVna0pWZkRFa0ZqbkNpaDJiWVljUGZmRDNsdUl2Y2cwYSt4WjFB?=
 =?utf-8?B?S29CeWE2QlNyd0dkT0tUUUZ5dVJybVJnNndiY3ptdzJKMlZtaUZSaW0rTUNX?=
 =?utf-8?B?VEp6NjR5ZTViVmJLVHg2cVNNWTVwM1NTSzNrbEtsRVFubEhYQ2pQbXppMy9v?=
 =?utf-8?B?SVIyQWR3WWRjaTIrMmQ4VVRkcGVUd2h2Q2F0b1g0Ukl5N0FnSUhsTnFvSGRD?=
 =?utf-8?B?U2wzcytBdmN0RHd4SDAvQjdkWCtjcEpOUHBzWFdla2tGZ0t4WlFyL0NBN3U1?=
 =?utf-8?B?RWZKQnBYZVdhd05vZnlvY05tUXhQcGlMblliOVU1RkQrYWxJNDVONHhBS1No?=
 =?utf-8?B?M2diWGsyOFN0ZWNzeis3V050QkZmRW84Q3k3dzV1ZnBnTWNNTHV4Y3oxcVFS?=
 =?utf-8?B?dDQwVFplTHM3RUpJWDA1dTZUR2lyUTdVRHlEV2FZckFFMmdkd0ZaNXMwbk5Y?=
 =?utf-8?B?amo3WFFHeSs3cEplRFhuaGpYNThibG95YU1BR3pnNFNQeDhROVZESCtHbXRO?=
 =?utf-8?B?N0Nqb0VLU1BHbERtb21FQWVsVEcwL1B2OXUwUGsvUFBnZm5HNldINjNna1o0?=
 =?utf-8?B?eTc3NW40OUovMzRvZ1cxL1d6RnVBeVh1blQzVENoVGNkUC9nR1htWm45S21n?=
 =?utf-8?B?L2RpTVhvMHNIOWNVN3Q1cmFvUkc4V1FKM2VUMzFBdG0xT2FZUHFsV1pTUStF?=
 =?utf-8?B?VXJEVjdqQkMvK1JMdDJSbWxoOUhoc2lqUFJiSGYvdnFVQlFmekRBcDQ2Vmpv?=
 =?utf-8?B?ZEI0amU4ZXBuSHhuQm9JdGhDeGRCd0VteTh6YXJLVlozWGhXNzhCTWk2OVZO?=
 =?utf-8?B?WEtEellyUXMrbGduV1dNSG5KWEhSQjFtUTlFL0FYb3k4eXZ0ZHFJTEpjUGhW?=
 =?utf-8?B?aEwvT0MyUmk5c1ZabjFMTms2UjRMSnByb2p6TTFrY2w3MHkyK1ZKUHZQTnJw?=
 =?utf-8?B?SWdvempnaXNucmJFdFFmcVpLT3lWVVJ1enQrbElQU0t4cmlLZGMwdTl4MTFq?=
 =?utf-8?B?NG5tZktTdHd4MmUyMi91MUJVaFFrUGFRN2FQcUVGeitRZ0hJTWFRRi9lVlds?=
 =?utf-8?B?OUszMzNBcmo2bEdqdE9CSmkwYklTalRtanNIVEx2d3psNGtyWUF2V1BIY1RT?=
 =?utf-8?B?OWFVWWs3SDN5enhaVWt0bkxXNzYzRHk2ZWh2MVd2YmtKYlJDUERrcTJzQ3Rl?=
 =?utf-8?Q?R4pUxpAZqMxYLd8R7tRmYDg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8f38fb-115f-47a8-169e-08d9db32af81
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 10:01:39.1299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMgZwqfg4vu6qus3+InO1eL9iUzV+aEP3U4MMSvO2OnWvlq8HgZxmGD3up9Fdnzx0rREKFZGjT8TUsddgAtkqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3147
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Robert Foss <robert.foss@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Wed, 2022-01-19 at 10:11 +0100, Neil Armstrong wrote:
> On 19/01/2022 09:40, Neil Armstrong wrote:
> > Hi,
> > 
> > On 19/01/2022 03:37, Liu Ying wrote:
> > > The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
> > > parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
> > > kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
> > > mentions that it should be in UI.  However, the dphy core driver wrongly
> > > sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
> > > And, the kernel doc of the 'clk_pre' member wrongly says the minimum value
> > > is '8 UI', instead of 8.
> > > 
> > > So, let's fix both the dphy core driver and the kernel doc of the 'clk_pre'
> > > member to correctly reflect the T-CLK-PRE parameter's unit and the minimum
> > > value according to the D-PHY specification.
> > > 
> > > I'm assuming that all impacted custom drivers shall program values in
> > > TxByteClkHS cycles into hardware for the T-CLK-PRE parameter.  The D-PHY
> > > specification mentions that the frequency of TxByteClkHS is exactly 1/8
> > > the High-Speed(HS) bit rate(each HS bit consumes one UI).  So, relevant
> > > custom driver code is changed to program those values as
> > > DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE), then.
> > > 
> > > Note that I've only tested the patch with RM67191 DSI panel on i.MX8mq EVK.
> > > Help is needed to test with other i.MX8mq, Meson and Rockchip platforms,
> > > as I don't have the hardwares.
> > > 
> > > Fixes: 2ed869990e14 ("phy: Add MIPI D-PHY configuration options")
> > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > Cc: Robert Foss <robert.foss@linaro.org>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > > Cc: Vinod Koul <vkoul@kernel.org>
> > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Guido Günther <agx@sigxcpu.org>
> > > Tested-by: Liu Ying <victor.liu@nxp.com> # RM67191 DSI panel on i.MX8mq EVK
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > > v1->v2:
> > > * Use BITS_PER_BYTE macro. (Andrzej)
> > > * Drop dsi argument from ui2bc() in nwl-dsi.c.
> > > 
> > >  drivers/gpu/drm/bridge/nwl-dsi.c                 | 12 +++++-------
> > >  drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c    |  3 ++-
> > >  drivers/phy/phy-core-mipi-dphy.c                 |  4 ++--
> > >  drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c |  3 ++-
> > >  include/linux/phy/phy-mipi-dphy.h                |  2 +-
> > >  5 files changed, 12 insertions(+), 12 deletions(-)
> > > 
> [...]
> 
> > > diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> > > index cd2332bf0e31..fdbd64c03e12 100644
> > > --- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> > > +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> > > @@ -9,6 +9,7 @@
> > >  
> > >  #include <linux/bitfield.h>
> > >  #include <linux/bitops.h>
> > > +#include <linux/bits.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/io.h>
> > > @@ -250,7 +251,7 @@ static int phy_meson_axg_mipi_dphy_power_on(struct phy *phy)
> > >  		     (DIV_ROUND_UP(priv->config.clk_zero, temp) << 16) |
> > >  		     (DIV_ROUND_UP(priv->config.clk_prepare, temp) << 24));
> > >  	regmap_write(priv->regmap, MIPI_DSI_CLK_TIM1,
> > > -		     DIV_ROUND_UP(priv->config.clk_pre, temp));
> > > +		     DIV_ROUND_UP(priv->config.clk_pre, BITS_PER_BYTE));
> > >  
> > >  	regmap_write(priv->regmap, MIPI_DSI_HS_TIM,
> > >  		     DIV_ROUND_UP(priv->config.hs_exit, temp) |
> > 
> > I'll try to run a test, currently the calculation gives 2, so this would give 1.
> 
> The Amlogic vendor code does:
> 
> /* >8*ui */
> #define DPHY_TIME_CLK_PRE(ui)       (10 * ui)

This looks like clk_pre time is 10 * ui, which matches the comment
'>8*ui' - longer time 8 * ui.

> 
> t_ui = lcd_timing.bit_rate
> 
> t_ui = (1000000 * 100) / (dsi_ui / 1000); /*100*ns */
> temp = t_ui * 8; /* lane_byte cycle time */

If I read correctly, this temp in vendor code is TxByteClkHS period
time in picoseconds. So...

> 
> dphy->clk_pre = ((DPHY_TIME_CLK_PRE(t_ui) + temp - 1) / temp) & 0xff;

IIUC, 'dphy->clk_pre' essentially means dphy->clk_pre = DIV_ROUND_UP(10
* ui, temp), that is, the time for dphy->clk_pre is no less than 
10 * ui.  The D-PHY spec (v1.2)'s saying is that the minimum time for
dphy->clk_pre is 8 * ui.  So, it looks like meson is stricter than the
spec.

However, the vendor code doesn't seem to match the current meson driver
implementation.  The temp in driver code is also TxByteClkHS period
time in picoseconds. And, without this patch, I'm assuming that
priv->config.clk_pre is 8000.  So, it looks like MIPI_DSI_CLK_TIM1 is
set to DIV_ROUND_UP(8000, temp).  This '8000' does _not_ reflect
'10 * ui'.

So, 3 choices for meson, up to you:
1) If meson really requires the time for clk_pre no less than
10 * ui, then sth like DIV_ROUND_UP(10, BITS_PER_BYTE) can be used.
2) If meson follows the spec's minimum value, then the patch does
things right for meson.
3) Force to use 8000 picoseconds for clk_pre, that is, use sth like
DIV_ROUND_UP(8000, temp).

With this patch applied, do you see any display artifacts by visual
check? Or even checked signals through DSI analyzer?

Regards,
Liu Ying

> 
> PHY Registers only says:
> MIPI_DSI_CLK_TIM1	[31:0]
> 7:0 	R/W	0	 tCLK_PRE
> 
> > Neil
> > 
> 
> [...]

