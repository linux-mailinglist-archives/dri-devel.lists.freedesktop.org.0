Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B9550062F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 08:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FB510FEC8;
	Thu, 14 Apr 2022 06:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150081.outbound.protection.outlook.com [40.107.15.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349C10FEC8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 06:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzdmnTZQp+LmK+yLgvCpGH9B27ojtqxVbA7EWmdoIrnkhEa0CFnX/yEsUgOmYTnTioLRBcrhBfpesWPBAzuIgDEihgAOo6MJmUZzIdnIGBnEhSH+fmFSnd6moTmbgfkaEiYuvmcoA4CYGed4wE8acLEpheeeVlJ8iU+11ztmVhbf7323xxd98R25ZyL9fiK+IX+0m4lLkdzxTmtXW+Q02sXR08WqzuqtC1MIK2Ssdxv9iO7nXCDzs5PgQsuEjVIDFHJVHCwbp6lrnokTwDdMOiDWExjdKS5xxPxF8kE3iHC+TzflycRpA2sE0ytRR4b4T+vOchonSpvm3h9ic4kIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZEH8pckfb45IjilW+y76+7EinGytbJHFblhK2lI1kg=;
 b=I6+qSffDFzzQBRXlpyMOj6pO2PbnwCYrhVTAC8bU6jsGuGCZC0/M9BUkNmOhGuqgymS/8tuk2r649n9BeF46khsAligxflvBr03MLkOJEvFxNo0ARiOMsOkEg0IZi0gCamyMHFW7gvmGyEaQ3GBqLRqtsJ/gA/eMVt6ZyoMIdByAwrtwQhMcwimuXarH1rljyDqbSJGuZC4ARZMlVCP+7uBqmk+ZdeYI0oZn7uHafzoy20hJV75RzujIttDeEvYXGVgJJJh19WuvE89OkcSXaGS2LAJYyV1TS3V5v45rOxaQ4flHVJEw1rMuQXl8b55MZGOu2JsB1oqSfuunBn6tVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZEH8pckfb45IjilW+y76+7EinGytbJHFblhK2lI1kg=;
 b=hOgHyyR5ddakCU3CI8p/0spOcwzWX2HfjrIBuBUTpLpu9+NKS4q/R27vGSTCfxYzKPBuFRL0YiaeKqgntLUhvt5ihbd4woy/gHkbwtOjtokVv6kdwqdohJ1X5GsIVLPKHUaiM3NKgqGugkQoUPZYsAsgCgz3FIf+CeJJx0/VfWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB5782.eurprd04.prod.outlook.com (2603:10a6:20b:aa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Thu, 14 Apr
 2022 06:35:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 06:35:41 +0000
Message-ID: <1bd1ab210eae96fdd0280b9ef6876ae918d48cb3.camel@nxp.com>
Subject: Re: [PATCH v6 resend 2/5] phy: Add LVDS configuration options
From: Liu Ying <victor.liu@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 14 Apr 2022 14:35:29 +0800
In-Reply-To: <YlezKAw+W8HOa322@matsya>
References: <20220402052451.2517469-1-victor.liu@nxp.com>
 <20220402052451.2517469-3-victor.liu@nxp.com> <YlZpnrKt9NbHZv26@matsya>
 <d77b41d911e126331138ddaca146a581d316bd09.camel@nxp.com>
 <YlaqwoFCfusFgIIe@matsya>
 <a2731b2d77f9bf2adf36f0c05cb5e3b14a5a91a9.camel@nxp.com>
 <YlezKAw+W8HOa322@matsya>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HKAPR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:203:d0::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b21b07f-45e4-4a59-7091-08da1de0ff04
X-MS-TrafficTypeDiagnostic: AM6PR04MB5782:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB5782C49E5919CDB84D5617A798EF9@AM6PR04MB5782.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DfXLCfGGtFzWQSedK/1qqAyfZzMlFfPXbsMtYteOxpifr3f9NHafhFxPZwftOIpHUO8IxThpjYVIeULasP2dLv1c6vOfSuFjILOwSYe62J/tWRWAifNw9v4IxQQEi4oUvD0GcKRx+ADmVAjdUDhi6gOLG62WWGiKpOZNW2yklOkD9Fe/7SIlzT+EnXxMxf6tVllG0FX21jgRfrN8eR3lzCalSqVDA5EPVP0GmQ/NGWrTDgFGepAuZZI1aEIXREbyPEaa0MCAI9cqETumObSBdRRUuNvfVF+1F25+4IIudXU42owrEQni7ltY71HWWGTH5wYkONMA134KC0Wl0X9vpufbwnUAC00NpzRXxWKq3g3TNCvB+97fmIjCK+MQMPhm2/xW0HCtZuGvSBUqzIbPo+vr+lH4hhBQ8YBtEUeYe2HP/1Uwn2xRSRbbpIwIUhk60COq6cysKfPp7mlNUf4SZa9/iRXXX5eOmOj0Zm4lubr8dvz44B65aMM9bZSDqBhhb69aeg0761R/uawYvwy5BrXu9rJI8iknQOxvjxHQxvV9tlybiBa3DSSFE2BDoVDNHJpYVcWUGQENssc0lBY6EhZxydHrTk1AuZkuLYnclBvKqjQQSgFcJ5hhWkSIHdyfLn7QQFTlgcWi+dF3qPc/3TxqrtBSCa2MFuixLgxeYYIKc0HTT6DTD1KFXniJpDSIXdz/VJmo0ybCvLJ6LYLiHCOzVpE/uoHbiXjPisyg/b0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(66476007)(66946007)(66556008)(26005)(186003)(86362001)(8676002)(4326008)(508600001)(6486002)(8936002)(36756003)(316002)(7416002)(2906002)(2616005)(6512007)(83380400001)(6916009)(52116002)(6666004)(6506007)(53546011)(38350700002)(5660300002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0JZQTA4dTRRaFZDOXdmNGFDcUlFRXhpU1dEeml6eG5zWkNDUTVoYlJLR2Fa?=
 =?utf-8?B?azNVY3UxbVg2Z2JUM2hOMlNpblFZRFhLeHI1MW13OWViUmRCaHcrUk9JY25a?=
 =?utf-8?B?RHd4NU45cDRWcU9NL2tpM04xcEpTQmc2UDdhYzM5QUtBWXdmSFFhbTl4T3dh?=
 =?utf-8?B?UGl4T3dqSncvSllQcVBid1NpQlFNSWprTUluRHdSTlJDcm85ZHNIM3FuWjht?=
 =?utf-8?B?MUcrYnd2RDlSZzlvQlkvbzF0aGRKcDM2L2xlN0tuUmxienJKeDRHVS9Jd3ZT?=
 =?utf-8?B?MlhsN1h0Rkk2akx6Ym11L2QxQXRkYVRXQ0s2V1pJN1FUb0k0K1FoK1kyOStX?=
 =?utf-8?B?WkExd2RwanhvQ0pHWGFDaDRkZW43bERvUkR2RHFvUUtheEk0T2FWb2RkZUZ5?=
 =?utf-8?B?VXRwdi9ZREhvbFA3OHJqaGpRWXJBVXJwQW5MMjBMMnFqRFF2dXBNbXhBdDFB?=
 =?utf-8?B?cXNEU2RaK2pGZGhKY01Qck1LY2drZkcvM2ZxNUdNTXRpOTZHcEZQWEM0N1V0?=
 =?utf-8?B?d2VuS25wUUJhc3BHanZJdjNBbEk3YTBXeUxGdnoxa1ViTVBVUDhsOWF3M2hW?=
 =?utf-8?B?OEp0b2llUTczbnFTTVg4Y2VlY0I2bnRKMFNEbjVqSWd3OTcvY0JYNW1hZjJu?=
 =?utf-8?B?MEdsK1oyalZZaVVqbmpsWDR3ZU5kVFFZYzVzVGd5WlVTVEd1QkZNeDlySXpk?=
 =?utf-8?B?WDNpREw3SVFnLzcza0I0b3F5dTV5VWpDRkhiaG1iOVh1VGx5TG5jbXBZczRl?=
 =?utf-8?B?N2NUdk9XRmFoM2lCaGQ5TUlQQXc0Q2Q4d2daVzZRMTBuTk5LL0ZuUGVMM1BB?=
 =?utf-8?B?c0VIQ1pzZVNKekZ2di9sV1pkcW5TcWFEeDRhb012dmhxeVYvN1RuaS8zNVdq?=
 =?utf-8?B?dXZPTkFtcGc5djFuWm5yRnlrUFRHazhEdUJWMkN0N2tLdXhQR25hUUVLZjQz?=
 =?utf-8?B?MGJlZDFRSDlLUTBCbWNpRjVjZzZDLy9HYXhEWHRXMm83b2hKcXVNOUN4dlFU?=
 =?utf-8?B?aWwvQzdhVWdUbk04c1lNTjMvRkYrT1A4RHdCSzZvVDNscmZ2Si81TzNIYWxw?=
 =?utf-8?B?ZnRLWi9ISlNrVm9XRE5vMnJsREJPTWhMMjJOTjI2bklSaHdGWVEvSlgrRytS?=
 =?utf-8?B?SCt0Vy93MTlxZ25CdFc1VFY1aDloM2FKL2g1TUV3eDNUUVdYZTFaMWp6bldP?=
 =?utf-8?B?My9ZZEN0Tk5uV2hhY0h4RnBtU1dMbnY3U1N5c2swY3NOTFYyNlZEd20vRHZj?=
 =?utf-8?B?Y2pJeVVPU2x0bE51dmYzTHRYUHloNXIxd2hjNlppQWEwaFVuQTM5bjNQRzRv?=
 =?utf-8?B?aUFNUVhSZ2czU2J5UXBXamVlWEc1ZDdOeTlSTnZkUE1lRUtNOEgxQWgxekR1?=
 =?utf-8?B?WCs2ZUJFRDI2MDFVZXlqRU9LcnFsRTVuZUxXYURZRE9DRjlCaWd1UjRQOFU2?=
 =?utf-8?B?aHhqdUZkSXlydjVrY2I5QUhPNWgyM0VRWXZuZE43b2l3b1ZHbU5RY1IwWEky?=
 =?utf-8?B?Z2pkaTdjbXVFS1NzeDhkbTdlV2VTM0pVVFZ2S1dJZVhhZFNmbUlBclkvdXBz?=
 =?utf-8?B?SGdaN2Z0VURLN0FNL0ZOWmRlWkRldXpGbUoxVUN6aFlYbUZQd0hDajd5S0Iz?=
 =?utf-8?B?NXlPY1I1a3JnVCtFUHRpU2M3Z2kvam42QXFEejBtUmRtSWxYcXpJZEJnWlEy?=
 =?utf-8?B?SVIwVTBCNm1zZ0wyMHVXeEhZanh1MDNXbFg3bHp5UXkydGNJNU1LMHFxbzkw?=
 =?utf-8?B?eWFNUDVVUHMrWHVvbHQvdmZzVUg1RWVURFAzUkVVMVhCTmdVck92N25ZY2dp?=
 =?utf-8?B?ZmlOUWxDeFJqQWhwT2ZrUmF2MzRERUY3SytNbGlUN3djMFJMbFNnTXF0UWhE?=
 =?utf-8?B?YWxoWHhNdVI1SzlRU2hCWklNeHcrS1d1OWN1Y0txUGV2SEtjVXMrdmpFUkVU?=
 =?utf-8?B?MU1LZE94WVoxc2xTRzdNblNPa29aampZQStncnZYM0JTcXkyanVzdlBkK2o1?=
 =?utf-8?B?cDF2TWRIcXEyWmxGUXlsM29XbGVKcisrZXB5Szk0N1NRdkI0K2VhNWVtRkVF?=
 =?utf-8?B?cEVkdHg0WmFkS2FFb2pwQkxRWTd3cnpiWmFDdmw4bm4rY3VUbW9lVUFCRXdS?=
 =?utf-8?B?ZjgxVnZDcGlkUjdvMU5YMndLUkxtNldseVh2N2ExNzJGN29nVFpOUUEwa1Yx?=
 =?utf-8?B?TjZKZTVCbGhqSFc5Vk82R29ZTHZ1YnRJYy82UDlac1U1VnVlSkhyUGRYOUpY?=
 =?utf-8?B?eG1NS0oydHc2bjcvTlNabndodVFRTFhyelo1eWhvWVREbXNHTEpNZEF4aWFH?=
 =?utf-8?B?eHc3UXVBRURTZFc5dXZuTWltV3cwT0lETEpVTW5vTWRyZDVIWU1FQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b21b07f-45e4-4a59-7091-08da1de0ff04
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 06:35:41.8000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkB7V2kZiy1fMV8ODwU9rssbVnAXIalaG7qZ4g4nOgQBGm8mgPVBwAffjquBeUSvRD5el5Lh0/zdVYk6U34lHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5782
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

On Thu, 2022-04-14 at 11:07 +0530, Vinod Koul wrote:
> On 13-04-22, 20:39, Liu Ying wrote:
> > On Wed, 2022-04-13 at 16:19 +0530, Vinod Koul wrote:
> > > On 13-04-22, 18:04, Liu Ying wrote:
> > > > Hi Vinod,
> > > > 
> > > > On Wed, 2022-04-13 at 11:41 +0530, Vinod Koul wrote:
> > > > > On 02-04-22, 13:24, Liu Ying wrote:
> > > > > > This patch allows LVDS PHYs to be configured through
> > > > > > the generic functions and through a custom structure
> > > > > > added to the generic union.
> > > > > > 
> > > > > > The parameters added here are based on common LVDS PHY
> > > > > > implementation practices.  The set of parameters
> > > > > > should cover all potential users.
> > > > > > 
> > > > > > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > > > > > Cc: Vinod Koul <vkoul@kernel.org>
> > > > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > > > ---
> > 
> > [...]
> > 
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef __PHY_LVDS_H_
> > > > > > +#define __PHY_LVDS_H_
> > > > > > +
> > > > > > +/**
> > > > > > + * struct phy_configure_opts_lvds - LVDS configuration set
> > > > > > + * @bits_per_lane_and_dclk_cycle:	Number of bits per data
> > > > > > lane
> > > > > > and
> > > > > > + *					differential clock
> > > > > > cycle.
> > > > > 
> > > > > What does it mean by bits per data lane and differential
> > > > > clock
> > > > > cycle?
> > > > 
> > > > Please check
> > > > Documentation/devicetree/bindings/display/panel/lvds.yaml.
> > > > lvds.yaml metions slot.  'bits_per_lane_and_dclk_cycle' means
> > > > the
> > > > number of slots.  But, I don't find the word 'slot' in my lvds
> > > > relevant
> > > > specs which mentioned in lvds.yaml, so 'slots' is probably not
> > > > a
> > > > generic name(lvds.yaml is for display panel).  So, I use
> > > > 'bits_per_lane_and_dclk_cycle' as the name tells what it means.
> > > 
> > > variable name is fine, explanation for bit per lane and
> > > differential
> > > clock cycle didnt help, maybe add better explanation of what this
> > > variable means
> > 
> > I may add an example diagram as below...
> 
> Not really a diagram, you can add if you like.. But something which
> explains in a sentence or few about the variable.

Ok, no diagram.

> 
> bits per lane per differential clock cycle ?

Ok, will use this explaination.

Regards,
Liu Ying

