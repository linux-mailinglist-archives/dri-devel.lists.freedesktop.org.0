Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D384508641
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 12:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA18A10F199;
	Wed, 20 Apr 2022 10:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80079.outbound.protection.outlook.com [40.107.8.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534C410F192
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 10:46:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=by/ZEQeT13mB4TcrFOSDA84yb/X91GxJKHkvxQMNFld4THXpqalGNt2I0uYzK/NJVoX/INU8Z6gyhhq1nZ6xBK+FiL8p3JEuOulaYt9UgLANB1pRbpwHkCYbRkgGaB/5/8HA3gq3hSa2cskEda8tzrH485tgEoz4rQKT+qX+/E6Ok3J9XXp9UmE4na51dEFk2BSQyG+L/bymFgS3Iq2E4BWQq44w+v/usswn3xxMpSx/86cnlm3arsEt1LIa+9XCyX7AitqwlLRyDojeI8BtqIleoKQWvn+rWmYcZ7fdCj0atxgqo3Pp6552Qecw2YzY2Wmjcr3vbWknXgQn3xnkTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZSKLZk/gaPaHZFKd+uP88CfE5efqYRIWpIrzN0201s=;
 b=iGO+rd7klOSqIIJH1DrRqhwZpCbjW3Hp3Qffvc/TLLKXMcNyjRznTqXh/TqFWwsXrQF7GQUTQ+uObn39MeSRFdtfSqGo+NNYkzxTQuFlVqRLm6wGDkanGB6OlVbSLi9+7nDxNHf4QkBjUWPDkvVPqaXaktf9pE0kNZAeJAZ7rYrR/LWcNLpdW2FBESdVNnmdd8uKzIs6dKkMADa9NU82bWyDwMi0hp02lrYB2rE9zRfy3RteV7Z6nuIZ/QoZ1L+ialDhdt7O2fDHz7WOfS8umJdo3W+R52BaD1SDXoBPltPwFgAjgCEqmFBUf3DdJyILHwxjBGGlL00L91wOrjLOqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZSKLZk/gaPaHZFKd+uP88CfE5efqYRIWpIrzN0201s=;
 b=aLmS3EbXFzADGk7vU3YDOzQH3TS8+gGdLQh9GHSpR6sA6NamYTFHuuf9mmhuzGJL0Bkl70xZUxFHNB0tAbibTGAT1e8yFwsdRUIK9TLrKxRUSt7EiulYfQP1o2uAHZkDJWt/N74uKWluEnj5JnXsTsM+7RugWqckqr24lHyQOO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB5841.eurprd04.prod.outlook.com (2603:10a6:208:132::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 10:46:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f5d8:2b7b:6f48:51f8]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f5d8:2b7b:6f48:51f8%4]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 10:46:21 +0000
Message-ID: <7554f8419ec9fd0e29db24bbe996fe012633c2ca.camel@nxp.com>
Subject: Re: [PATCH resend v8 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp
 LVDS PHY mode support
From: Liu Ying <victor.liu@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Date: Wed, 20 Apr 2022 18:46:07 +0800
In-Reply-To: <Yl+2hOIcr6CrOv+T@matsya>
References: <20220419010852.452169-1-victor.liu@nxp.com>
 <Yl+2hOIcr6CrOv+T@matsya>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2P15301CA0001.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb88d29e-4b8e-40a7-9737-08da22bb01fa
X-MS-TrafficTypeDiagnostic: AM0PR04MB5841:EE_
X-Microsoft-Antispam-PRVS: <AM0PR04MB58415F742488430391226C6F98F59@AM0PR04MB5841.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36z1cjqEym0tKAzXYEAeDeDKq3XGTWiRILw66Rv1b1Q6gTyI3QpfAMeCGLZJJ4ahzpum3WCD3UxdGzCg3KEAWtwLQmyMjSbVrNxquXQE8UISDFihg3vt1saVFWFLSBZui3nOKIO9YJmrWIsOtH6CafS4oDarxQzs/o0HKGardoZwiUZnO3AXTK7fdtwKtJ1JuMQe0weIEQuDZ+n1UrCwIvD0NisuOpPTPh7uHiiUHz0XkFgAZ9jbfR63hS+tl8tN5yqFvRqxQq/spSUQlRhpUXGXlngF8ZWcYyTDxjNKxDS/56wDpYLOE2iVUMs/ho62/Xf+W6/TqEd9FuuMhgt7sBWzRRsCTOtKje2SV2fepBGWpqmpHJM9GgyZ17F4aSASTCjDnvFlJJkePnj/4Y6H3xs+IZNLs70r5YtP3BWQm1bk+TctP8XG+LcxZDymGQcvdQdRH6jkme7D+/dgWOA8S85VIVxmfRvMXOdinGxr3ZwWtxqC5RTXernRvfSmyUVdRVlTOHbAy01B5NFwg8d6H+jSDi76iMM+pkLV4r6iA1ipWSF+F4Lr+lhNvgR9UZER5xxFIy13JPmNxPx1kAzQBteT3AeBB5hM9O8kEslRBh7D0W8byuh0w1O9m1N9/pHoRBPQnBNPU9NgG6KQdUDlU7+Qh2A3iM46yiyMfk/UyhoNGssZM/+c8S4XgaDLeWeC41zeqk/7ITsuOF/stBf0EsSuA8uGbrE3HC6/QzVBbPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(6486002)(4326008)(6512007)(316002)(38350700002)(38100700002)(2616005)(8676002)(2906002)(66476007)(66556008)(86362001)(8936002)(6506007)(52116002)(6916009)(36756003)(53546011)(7416002)(5660300002)(26005)(186003)(508600001)(66946007)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW1YazlHZU5IUUlaa3JiUi9XSVd1RVhqcHkwU1ZpUS84TTFZanA0SDY1VG83?=
 =?utf-8?B?OXg1TTl0Z0VpdDMvWExzbnBpUm1XejMwVFNCMXdqc3VrSkNpQmNUM0s0Rjkx?=
 =?utf-8?B?QmZTVmJjbzRrTXFqSDUvNHBNTnlTRFJjWURpM1NrR1d4WUR3dlZDZHBUV25N?=
 =?utf-8?B?TjBFY3hhSjZNRkMwM21JUDZqMkp2QmMrTzdLSHdyS3VwY2d4bnNLZld1RlRq?=
 =?utf-8?B?VXM0emJ2ZzRyUFBkbEs1RWVmTWxVeEgyUjJUVjVJUlEzYkxZdmhyRmdGd3Bt?=
 =?utf-8?B?UEdtZUJOZkJobHh6cjNpbTg5OHhqVzlGRVFTSU5NY0xZY1JoOEZGU3VFbTdZ?=
 =?utf-8?B?R05PdWVsekJtZmJHQy83M3Z3LytIZWhBSnFOcFg2bCtoUURvTms2NS9GdmhC?=
 =?utf-8?B?K0FZN3lsVE9QOTB6Q0NyZ1QzTkZDL0V4ODdxSDh0MFJlZHg1Y2paUU5rY0NF?=
 =?utf-8?B?NWt1K2c3TEdJMlVkN0l1RXgzNXV1eG1IT3kwQkNWWmd4UVcycFQ2MkNvbDV2?=
 =?utf-8?B?ekhVTDFVaytxdHNiaGtyQzJSM2c2Ry84NU1rcHNDbTI3OUM2eFJhYVR5MzJs?=
 =?utf-8?B?OUd0YmtHanNIMXVCS0k1U2NibG5JSFVMUzBLNmJKclZMWW0wY1llUHJFVUxq?=
 =?utf-8?B?Q0NYekF3bVJjdU9JODZJM290VmczT01RcTcwSk1VeEc5UDlDSGVTeVIzeFlt?=
 =?utf-8?B?TW1xZTRrQTRta1FIUlVVdXU4aVhScDRPMEJWWUdBUU5MeFExbGhuZkJrQXBs?=
 =?utf-8?B?MVAzZHJBMm1KZ3UzMGFrK0ppdWJ4ZldrRkpIczJ1aWc4WUlvMTJTZUJPNG9I?=
 =?utf-8?B?elpVVmF3VXFmamx4OG5LUVk4c2RxNTdVdGMveFA5RmxyVWlrR2VEYmJGeU5W?=
 =?utf-8?B?cndna001R0F6K0E1b2xRakY1TlJ2dmV2N3pmcXpodFlLdjMwTEQyTUlaTWJh?=
 =?utf-8?B?QnUzbzBlNXFZQTh0cnY3Q2hMMTR5YzFPZlhEajAxSDBRY2JUZTlKZGpSZXhK?=
 =?utf-8?B?N2lWbkpYbExYcHp5T3RYWmlvZEhFeit1dVdPWm5Icm1oMXJXeDdyaTRTaEkw?=
 =?utf-8?B?YzVrTzAzdTlVMUNEY3A1TUI1MngzenBLT1VlakV0RTNSVU1OM09BbytTMWhK?=
 =?utf-8?B?RkI5MUIvMVQzMnd0YjlhRmI2UHQyVWhIT0Fkbnh0azBsSnhENENvbzI0aHc0?=
 =?utf-8?B?UXZLTkFsQUEwNDhPdWR0UkIycGFxL3c1Z0NFd2NkRHZXYndOQW1zaXdUT1Nr?=
 =?utf-8?B?VzNtc3Fjb3NLeFVTbDl0eXd6SlhjempnbEZUaTF0WFhBb2NJajR4TWhUbGNM?=
 =?utf-8?B?ZXhkVTVad3hTVWxsRzIxUjFaRFEzdmJyekNueGtaU0xqbDlHRmlucGxOMk1m?=
 =?utf-8?B?OWtmWUZVVi83YmU2Zmx4YW5aTXJKVEtCTS8wOENPWWN4YXpiMkNUQk5WTmxt?=
 =?utf-8?B?dk1nVWh5OTdZSWxHeTRZNWdrWWp1QldHYnZDTlVTMUtxZWFoVU5mcXhVdHg4?=
 =?utf-8?B?d2tJQzMyYmFPUmJaYnBWd3crR3N3UHc4NStBMXh5Q1hmbXpKSU1RekpHR3Bp?=
 =?utf-8?B?VlVPbHFLaFBJNVNZaWtJQkhZWlRsWnNYelM0Smt4Sk8yOU5nS0RPZFhBL0k4?=
 =?utf-8?B?ZzZQdFBBdGc1bzMyMURDWTZyc1VjVlhOM3JlN1dieFY2M1MrR2VNRGYwaHNH?=
 =?utf-8?B?bEFaT2E3dHoycDQ2cFhYRmphUDR4K28vU2dSOVJONUtrdjFCMHhzTndDa3Az?=
 =?utf-8?B?WDZhWnMyZEZ3NlhmWEVqMHdFMUw5ak91ckJhUmRPNWlTSzBkdS9POU9waDFL?=
 =?utf-8?B?YXVQMFdaR0JleDFpN0ZGL3MrdUdDVTRhQWVGZXg1VG9NdXVadTl1YkdXaEdS?=
 =?utf-8?B?VGNyRVZKSzZrU3Q5d3NrLzhsVFFRZ0VWRXJOaWk0S05aVWJ2dlBDcXMwU2k2?=
 =?utf-8?B?VTdPUEs3cFBDR3VCa0xRcHQ4L0crM0hiYjFsQmhicHlWNmllQ25RVG1qVVln?=
 =?utf-8?B?MEFlcmFPdVkrdjNRanNiT0pzWWlOWEdwdUJnTW5EN1lDS1ZPeHhJKzlqRDJw?=
 =?utf-8?B?R1BZSnRtS2wrUno2YjVCQnVXeWVBRWcrNzB0MEJHbHZPdEdTTVk5ZGRtelF0?=
 =?utf-8?B?NmNCV1VINmRiUThKTU9GdGg4ZCtFT3A1Z05kanRRVE8wU2t0SHByZ2FwRmhW?=
 =?utf-8?B?UFB6VHdxR2FOdnZvZGpQMlJRV1NQS0xxaFBZVE5zc2lWdktIUUhjdlRjUTFn?=
 =?utf-8?B?YlZIb1UraytBWDNFMEFwVzdOTlZvR05qaytJNzE1V1l0UkUvbFVCNVltM0hk?=
 =?utf-8?B?USttL0x0bnNKTGhQN3pjRDN1OTFoZlJuY1dwZlNzNlNraEErSk5UUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb88d29e-4b8e-40a7-9737-08da22bb01fa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 10:46:21.5337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXQDDcLLulXeoY4Du05OcORUdLooM3WvcyFy/wxE1aQls+DV47hzq5raR5tiaRpoltzmhEY/RNinGGmaG6Ymtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5841
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
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, krzk+dt@kernel.org,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-04-20 at 13:00 +0530, Vinod Koul wrote:
> On 19-04-22, 09:08, Liu Ying wrote:
> > Hi,
> > 
> > This is the v8 series to add i.MX8qxp LVDS PHY mode support for the
> > Mixel
> > PHY in the Freescale i.MX8qxp SoC.
> > 
> > The Mixel PHY is MIPI DPHY + LVDS PHY combo, which can works in
> > either
> > MIPI DPHY mode or LVDS PHY mode.  The PHY mode is controlled by
> > i.MX8qxp
> > SCU firmware.  The PHY driver would call a SCU function to
> > configure the
> > mode.
> > 
> > The PHY driver is already supporting the Mixel MIPI DPHY in i.MX8mq
> > SoC,
> > where it appears to be a single MIPI DPHY.
> > 
> > 
> > Patch 1/5 sets PHY mode in the Northwest Logic MIPI DSI host
> > controller
> > bridge driver, since i.MX8qxp SoC embeds this controller IP to
> > support
> > MIPI DSI displays together with the Mixel PHY.
> > 
> > Patch 2/5 allows LVDS PHYs to be configured through the generic PHY
> > functions
> > and through a custom structure added to the generic PHY
> > configuration union.
> > 
> > Patch 3/5 converts mixel,mipi-dsi-phy plain text dt binding to
> > json-schema.
> > 
> > Patch 4/5 adds dt binding support for the Mixel combo PHY in
> > i.MX8qxp SoC.
> > 
> > Patch 5/5 adds the i.MX8qxp LVDS PHY mode support in the Mixel PHY
> > driver.
> 
> Applied patch 2-5 to phy-next, thanks

Now that patch 2-5 landed in phy-next, patch 1 is needed to explicitly
set MIPI DPHY mode in the nwl-dsi drm bridge driver, otherwise, i.MX8mq
MIPI DSI display feature will be broken due to the phy mode check added
in patch 5.

I'm assuming patch 1 should go through drm-misc. Robert/drm folks, can
you please pick it up?

Thanks,
Liu Ying

