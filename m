Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D509330630
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 03:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EA76E283;
	Mon,  8 Mar 2021 02:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00047.outbound.protection.outlook.com [40.107.0.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5941F6E1A7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 02:59:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbNVAyICeky4T91G0ug8vdvHEM6OznrPyvRDJYvLLR6ixWqC94TOyjE6aLiqu7G2BeTJlT8oikQ/2BMHMNRXqvSjZQe9tTf0HcIqZowtzunnpyDCmIo2vJ0wvLTUYPkSlX6amf0Er5j5Ekl5uNu0qTUHFDwfJB9DetZbb/rr6uWu5Q0uqoQNzm+7LADR94CcljII9kQIBEHfevaONhaUsffzBO2lHrUw/gBRGQv2BnPwChahoYMMkTMbEsmOVfCLU8SCIqa3w5IX2GT4ix3hno+egvjRkz+nIiTYQaFGVbpf3vjUamPSrM+Fz9WVPbs4NzqHi+onuG3pilaOsmjXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2ZopNTbXY8YACoWMR6OQ1EGo2e7LpJmvtZFUP9FQyA=;
 b=N4Emtcaty9HSht9rerNYjxpT1Kp3UOnmVltB67FExwkM42TKkvrTS68vMiG5eI933AddaupAOHLU+y3zgoDYlxJri6IQTMeutu6mpXKIWtYaa7a3Dd8PszS5zkzIEuUDBGVF08RutGlcojf7hhzzaq7n/w+lKE5UMZ5yrs1ch73syriloYpFImTju7J5vbcC2afgM2JK4fXnbsxrY77bwYohw1RHhXdybsO7nLPrY3BElLDaT+1/849kXQrgg+ZpU4M8yPX+YaH9FDlexioeqquqEPyFVV/JRUepnCz++rTRh/es/G6+wp6nvR8O6uI2PBQU8Kw/eHZbdZBWqZaeaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2ZopNTbXY8YACoWMR6OQ1EGo2e7LpJmvtZFUP9FQyA=;
 b=RMj/9y2xv2Ifb1bXjOtc3VHxeGAFoQrNn0FKhXC2ub6GdVFUx00oiusriSRIBU3gBkAd+0/tcflD+/1/RfPd2h97V7td+831l65b/ltNhE2D13rEaLoH6Zljl4fgi3viFWrW7k9L95jqf5vlvEkgt5PndcmKO1pLl9sSKdlk6xE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2528.eurprd04.prod.outlook.com (2603:10a6:800:56::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 8 Mar
 2021 02:59:09 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 02:59:09 +0000
Message-ID: <b11a9b29b508cc4db4499d01848890643027a36c.camel@nxp.com>
Subject: Re: [PATCH v3 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS
 PHY mode support
From: Liu Ying <victor.liu@nxp.com>
To: Robert Foss <robert.foss@linaro.org>
Date: Mon, 08 Mar 2021 10:57:37 +0800
In-Reply-To: <CAG3jFyvWZV_WVeR1+EvvH0C47CqCtPDMULiOVKzR51ukzFMJwA@mail.gmail.com>
References: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
 <a89d5c08c9f0793acfb9d056d5748e4a3cf16c2f.camel@nxp.com>
 <CAG3jFyvWZV_WVeR1+EvvH0C47CqCtPDMULiOVKzR51ukzFMJwA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MAXPR0101CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::23) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 MAXPR0101CA0013.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 02:59:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 591dbe19-7ad3-4b0f-d2cc-08d8e1de2473
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2528:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB25288C47834B1B99CE84519298939@VI1PR0401MB2528.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pe53asKPh0Xv8EJDpcTDVAZnSAJRWoB3Qtv2eawt7ceTG/aWfUdR3FoMIa0gjmQwMoStot4JPjiMbsCQK/eM31EqZ2lkaFT2SSJn1DyLgV4NJxqeuSSzz4Me10c7V7CYUIU7RlJEBOb0/+ZWwiMQVw7DjUfpzzMoTPFaCvlaQr1h8wE+SMRnHrA+Jzkd1gAvDRXCBoCl5VXroy0445Kq27uevP8Z2C/Yg9bF8Bx2c2Lobh7O6RMA7hVyrU5oqG5inp8hgpeJaoECa+H91RYlYhJ3gGCEAjzeRirQlsNeuocNXpZZnGlFHw8dbW1yO1c5VpxanRbOO/SPYr0HNh96N447FXahFcE2WR4dh/pisHpgTQjs4pr/9r4McPpLznBH9RqD/0iEvYFIe0/ho4ZiAzB2EGFXO1FdW0ok5SSONv/op15HJxNGwGSIDQJ2NcNBXH11EPvTOlnzb7gcn03fye+kckIytFyoW1blBGSeeK7tT79UXFo7Y3KTqanNm3fUd2caEUTf7wZKSTE8vEGOS3/4GFBsrKA/DgV+Hbspzl9mCbq7/x6BT/htUzbwrG8h/Crun2l5Z/5uMTYzYMk81UwqfihS0fb7sFskKM8sGK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(478600001)(6666004)(966005)(36756003)(8676002)(4326008)(6512007)(6506007)(45080400002)(2616005)(956004)(66556008)(86362001)(66946007)(66476007)(6916009)(26005)(186003)(16526019)(8936002)(4001150100001)(52116002)(83380400001)(2906002)(316002)(6486002)(54906003)(7416002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OWNndnF1WitTbEtMNG5Rbklab2h4cW92UDVPSmN6OTVRZk5uODM1WDBKQ29Q?=
 =?utf-8?B?enJ4ZVVyalVMS3dtazFoZGFLd0F3aVcwdWc0S3h3cmppaG4zOEJyU1dhci9S?=
 =?utf-8?B?QndvMjVzQTZUMklvbHR2WGFpQ3pGU2tqZUloOE4wc0FNTXp6cmFmR2RqWlhq?=
 =?utf-8?B?Nm84d29VTkhzQVpRWFFScGpHb3NmamJIU0kydytYS3dPS21qTG9kSGtwRm9w?=
 =?utf-8?B?VGJTM0EvZytBZlZGakRHUHlpZmRtN21UVGRKYXBpQmNNdlIvb1E5R1hDWTZ6?=
 =?utf-8?B?ckdTYlJPb0RIM2tDR2lTay9vb2YyWGw5QVhTZFBHZUxQZjBmYnBYSFhwbUJs?=
 =?utf-8?B?WVpYdkpQYWV3dkhDaGtaaWRYOVB1cktKVmdCNGRHNmYwUTJaLyt0TUZIMlE4?=
 =?utf-8?B?T3p6R2hpRnl3NTZ1QXRqTDl6ZE5yYTcxM1V5VkQ0cFZFSE8vaDNjNXVRTEwx?=
 =?utf-8?B?WDlWNFJOakluclA4bzc5Q2psMkowNVNrVE8zUUkxMzMvU2VVSWVUY1BLN2Q4?=
 =?utf-8?B?bXl3cVNZL295b2JmcTVtaXl4SEFtcVRRSVAzb1N1OEdidW1Na09teTlDZDVt?=
 =?utf-8?B?MFZFZWNkTEh6UzV3eUF1dmd1ckhDS3pJNmVTbVR1R0I3Z1YxRndWbVlmTXNX?=
 =?utf-8?B?Y3dVNEZaTkI2MmlIL0R4b1g5ZXdFbDJGZ2h3ekUyeldSWXB2SXhPTjFhM216?=
 =?utf-8?B?cmVqSEdCTzFReUpnL2hmMmUyYkU1MHVQdWh5Z3ZqWFhOWVpCNGxzSDZ4SGlI?=
 =?utf-8?B?L2ErK1BmbnR0WGVPTlUvczlISUNsQjZ2WlhtSXh2UWtCT09xVkN5UUpCR01V?=
 =?utf-8?B?ZnBTenIwaGpNL0g1Ylh1enh2OUhMaDQvbHQ0MEwyTFRlYjl3d251MGprbVd2?=
 =?utf-8?B?cEthZXVXUTVWeUx6eUdhMWYweGlZdUNFcEc4R2FvRnZiNHhBc2pYY3JXS1p3?=
 =?utf-8?B?dStveENRMnlMNE8vZ2hXS2NMVGd6a0k0a3V4dmxCR1BMYWxkS0xtTDg0WEdD?=
 =?utf-8?B?bVpaZEd4am1kdmFqbUphem1ZSVN5MVVPQkNkd3A2elJyTDcyT01UdEpzQlR6?=
 =?utf-8?B?d3BybWJIQzdRbk5XVnd1UmN0RzFyYy9DTGorUUtxdjRlRUtXUzFhMDB5bFJu?=
 =?utf-8?B?WlFtWGZ4Vkk2eS91c0dNLysxbUc2RWtHV2Q4ZklYY2VGQmJhemowbXZ5RmpJ?=
 =?utf-8?B?Y3dOMXB2OWppR09sRmsvOENzNE5nZWJSOWlZWGhHZEJKd0hQZklQVlVkYUtH?=
 =?utf-8?B?WVhZdHlySFNxZkhXTHIxRzIxTThoVzcvS2tIeEcxS2VheExwckhXdXpKaTRX?=
 =?utf-8?B?azBmWTVKaUt4bU5DUmNqUU44RWZJRC81TzdzU09ab01zeW1kN3QrREdjUXhu?=
 =?utf-8?B?UUU2aUxnVVdiRHZ6dXduUjRxSHJnc3llNm1VajJWQzI1WU5MUWNYdUk1d2Nu?=
 =?utf-8?B?VUs2YjhqZW82TklYVm1JNW5BRkNrVlNyVDRIK2hLRnJJSVJSWWZ2TzdoQjdP?=
 =?utf-8?B?VSs1blJkYlQ5VHFCSURpVkV4MjB4Y2Y2ZnlXQkl0ZzJWZWVZVUdvYnZVNVZT?=
 =?utf-8?B?aEhwNk5tNGtHOHpvclVLTGVlMHoyOCtPSmVDSnZZaWpkenpnVTVTc3BRV2Mz?=
 =?utf-8?B?YS9yOTE5U3lRaEFDbnpGV3hUQUIvbXZhdExyMkdmejI0Z0FNNGRkSit2Z0Fm?=
 =?utf-8?B?b2FuZTNiZXAybHpNbVJrdHNMRER0RVh6VWQwWkU3d0dOUkhKWlJNaG12djV2?=
 =?utf-8?Q?sX9bs7z7C1IU9coTIsI3+3969WJNche/2HoGBfU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 591dbe19-7ad3-4b0f-d2cc-08d8e1de2473
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 02:59:08.8252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLEt05FjQdJfb2HDP8pT593Ph3rFmTT6RrHvyatF8BY2idQZXkEgurzxEimevETRfYi4b2H85aG2SYOQIzzrpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2528
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

On Fri, 2021-03-05 at 16:22 +0100, Robert Foss wrote:
> Hey Liu,
> 
> Looking at this series[1], all but patch#2 has been reviewed, and #2
> looks good to me. So I think this series is ready to have v4 re-spun
> and and all of the r-bs from v3 added to the relevant patches.

Will respin this series soon with all R-b tags added.

Thanks,
Liu Ying

> 
> [1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fdri-devel%2Fcover%2F1607651182-12307-1-git-send-email-victor.liu%40nxp.com%2F&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C36731aa7c5f949c44d0008d8dfea79db%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637505545446542467%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=T5JcZt9YDHHyH%2FCf02ErQZ5rn3qp3N5jayxk9It4knM%3D&amp;reserved=0
> 
> On Fri, 19 Feb 2021 at 10:22, Liu Ying <victor.liu@nxp.com> wrote:
> > A gentle ping.
> > 
> > Vinod, Kishon, it would be nice if you may help review this.
> > 
> > Thanks,
> > Liu Ying
> > 
> > On Fri, 2020-12-11 at 09:46 +0800, Liu Ying wrote:
> > > Hi,
> > > 
> > > This series adds i.MX8qxp LVDS PHY mode support for the Mixel PHY in the
> > > Freescale i.MX8qxp SoC.
> > > 
> > > The Mixel PHY is MIPI DPHY + LVDS PHY combo, which can works in either
> > > MIPI DPHY mode or LVDS PHY mode.  The PHY mode is controlled by i.MX8qxp
> > > SCU firmware.  The PHY driver would call a SCU function to configure the
> > > mode.
> > > 
> > > The PHY driver is already supporting the Mixel MIPI DPHY in i.MX8mq SoC,
> > > where it appears to be a single MIPI DPHY.
> > > 
> > > 
> > > Patch 1/5 sets PHY mode in the Northwest Logic MIPI DSI host controller
> > > bridge driver, since i.MX8qxp SoC embeds this controller IP to support
> > > MIPI DSI displays together with the Mixel PHY.
> > > 
> > > Patch 2/5 allows LVDS PHYs to be configured through the generic PHY functions
> > > and through a custom structure added to the generic PHY configuration union.
> > > 
> > > Patch 3/5 converts mixel,mipi-dsi-phy plain text dt binding to json-schema.
> > > 
> > > Patch 4/5 adds dt binding support for the Mixel combo PHY in i.MX8qxp SoC.
> > > 
> > > Patch 5/5 adds the i.MX8qxp LVDS PHY mode support in the Mixel PHY driver.
> > > 
> > > 
> > > Welcome comments, thanks.
> > > 
> > > v2->v3:
> > > * Improve readability of mixel_dphy_set_mode() in the Mixel PHY driver. (Guido)
> > > * Improve the 'clock-names' property in the PHY dt binding.
> > > 
> > > v1->v2:
> > > * Convert mixel,mipi-dsi-phy plain text dt binding to json-schema. (Guido)
> > > * Print invalid PHY mode in dmesg from the Mixel PHY driver. (Guido)
> > > * Add Guido's R-b tag on the patch for the nwl-dsi drm bridge driver.
> > > 
> > > Liu Ying (5):
> > >   drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
> > >   phy: Add LVDS configuration options
> > >   dt-bindings: phy: Convert mixel,mipi-dsi-phy to json-schema
> > >   dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo PHY support for
> > >     i.MX8qxp
> > >   phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY mode
> > >     support
> > > 
> > >  .../devicetree/bindings/phy/mixel,mipi-dsi-phy.txt |  29 ---
> > >  .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 107 ++++++++
> > >  drivers/gpu/drm/bridge/nwl-dsi.c                   |   6 +
> > >  drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c     | 269 ++++++++++++++++++++-
> > >  include/linux/phy/phy-lvds.h                       |  48 ++++
> > >  include/linux/phy/phy.h                            |   4 +
> > >  6 files changed, 423 insertions(+), 40 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
> > >  create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> > >  create mode 100644 include/linux/phy/phy-lvds.h
> > > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
