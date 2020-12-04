Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D352CE9EF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA4D6EC93;
	Fri,  4 Dec 2020 08:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00047.outbound.protection.outlook.com [40.107.0.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65576E135
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 07:42:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IW3/OdRJO2v+yFQOmv780ov0tolcsJYvo5Q5QME3sLC/RA+7hsX07sQIS1XKt/TqQlGBve8wC6SuOegBuinT0GLTJPIUdnZiCFi8xJZNmTc7HwLohIV/FAX9T27nTo/N8/lqD/jLlECXc3pqdvszDejTI3jmIUcgLxrc6rDVBAdkUPry+p5fXx2184ayP6cpCKLrb4bdRvH+Y9miS53DqjNOe2CDokFokLNbjn3SNIJBj6+Bk6VINP9iZQlgEVfFlV7zEspmnqdWf68sxCZWAa2mAZzSXi48EZcmFRMTqhH+fHWti75dzBkC0frK2ReU21Qxh+DPTCrOFoD/Fhb5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0cEOFW7tKkEV6WK4zPlv5xQbwB8az6coFiyUC48yTY=;
 b=hiR68VjGh+wEfERxH1Pl4sUAedIlZA7tfi1SxaZBo6LEJ0s6MHAMhe/21dQeOZMU4R60CI0z6fKs2+KARDWB57ijSFGTjAXZukTKgtwSTX1YQFbyarNke6X05pIi03wchcTffwCAaJgIi3aWdtfJRfCxgwCTmIKBhdeJk/FhtibAx8Z0qL5ILpAWbaabBRMyfmQauciC5kt61Lx7lzSks6ectPlKOJpmIRUhVLqNg/YjG1ExHj+Wa2ngCHHJm6uW9SZO/311kMGR4wt+a8V8LpzJw4G6ucRxkpt9Tw2qFwfK0QC5GWITxgyKLXkfZg782muLCdUun6H7xlecff6CdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0cEOFW7tKkEV6WK4zPlv5xQbwB8az6coFiyUC48yTY=;
 b=GmeNhJFRVnuKEm89j6u8BHkT/V7wqWTfT6Ao34BdmkuhypP+zie08yNPkMCU8JePU35e3ilVLXqzCvSN+0Jf4Ur2AE6awBYsclkuWi5h9etIYWDV9KcCFT2dEtj4v3udHDusfYJkX6URSaNXKvYnwg/My1qFxLlXeUp9WSuTcyg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Fri, 4 Dec
 2020 07:42:01 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.025; Fri, 4 Dec 2020
 07:42:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY mode
 support
Date: Fri,  4 Dec 2020 15:33:40 +0800
Message-Id: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0098.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::24) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0098.apcprd01.prod.exchangelabs.com (2603:1096:3:15::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.17 via Frontend
 Transport; Fri, 4 Dec 2020 07:41:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e80bc99f-ef20-41a2-7d4a-08d898281610
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34215EE8093BC5AE2BD29DEB98F10@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: urOciwoREfirDy6fLZtbioiKBvOxAypfVMmS17RE6PzjLXmzKV3tSg3pxT3+c8qgN620Aiz6qVbxrgp9gECiGBqIKBJm05abi5Kgq1sklHFDapcH5qdQ8GkZKgxP5uzasu9izNxzl0Rv0r+0NUeVrvRexkwmGKtYIQP4twJgaWxz854F5dO/PXHdNDaqRpESMA8L1h3DiiZxrrJBrYHAeFLuFKJqOPCyZFq3dh+bIZMtrwXpL0oXfJVwRkYURndEqnjaDGh4eihrLhbFlvRPbjafKFUOYFCqD8hfRSbgFu5TC2ScuhlcMG9KIOP/HzlEfdousNgoDdzy3y9YtoXvwZ83x1DEhN7g4EUosXqMOkbFSDV5PKzNllIfLJ+graFm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(4326008)(66556008)(6512007)(66476007)(69590400008)(66946007)(83380400001)(316002)(8676002)(36756003)(7416002)(2906002)(86362001)(6486002)(8936002)(26005)(186003)(52116002)(16526019)(2616005)(956004)(478600001)(6666004)(5660300002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1fkclGaVG+ITUX/2TyDJiTOCCaygm9iVZpzm/An0P94ifBqdayUVa24nEVnk?=
 =?us-ascii?Q?2KfTCbmANDiqsu1V5xZNQ14g+/K5HUPO3tTYawJ5+iEXBI7GgzAg0rnvIzjx?=
 =?us-ascii?Q?WHd84dRpiwHuAuuwoYtWMVvl6WbZUP0lEFt6IwphKJg/MgObOFJwG9Om8vd5?=
 =?us-ascii?Q?LOtp55SpFTzlOJuPNGfjQJLHbSSPJIc6KW2zsj0TA0HanhXqgrayeULieFe+?=
 =?us-ascii?Q?1thX2aP1UwlAcF1mqqXfLV0okYxJur6FDRZfSfShlwZljJPYtNXU7QvP3Q/B?=
 =?us-ascii?Q?h03xFVP3Mx2iKJFKLaGKvpiv3nxiEejMFXUc25+1EocfsJVUKMtN7BlvdPHf?=
 =?us-ascii?Q?j8+t1IhrUTwnNEtsxlBvH3drg4wtr73OHlzfR/91SikYdCUOFikWf9aP1pYA?=
 =?us-ascii?Q?OKGcpDjfmxIDqFaF0WxwBqip73E5dVmqGazAfuFfpYj16DgXYkLbw20MSAu5?=
 =?us-ascii?Q?/ZrrkuVYRe5ZknmmAz3ifJ70fxpSpCCIsJquiMOhWe949qTCDSbAXAcbtwcX?=
 =?us-ascii?Q?rGIoztjTwvFJiNhTwtqDJyUanFlmhA0d2ARFCTg+iNXCxj+Y6zpfEFqlJ+3S?=
 =?us-ascii?Q?DFKYN5mpl09l4n9Ko05QgeL28WxQufLw3zfgNmGZNZuD0WKaa9x4+LrMaShK?=
 =?us-ascii?Q?YL8rhMVIMSj+mclT/LClsfth2Go9YmeTy13pBlENMCqSZ/ihTVL2nGYyKezQ?=
 =?us-ascii?Q?jFNq4Dt9O8Qs+tLwh4Rhh3XGrhpZJuKIm879l8kudN7v3MwSqvVj3rXDEzBR?=
 =?us-ascii?Q?OTwhlq2JQZIvVHwEKg8BbYchIp3R1gCe1U6n+QgRx9+df9guN8hAnPKABnTZ?=
 =?us-ascii?Q?iAtaBtj72Ra+EJK66DCWulowlbQX8jSkyqUdVkCXQ6Ny+psIm04j52kj2QIU?=
 =?us-ascii?Q?oJ1NqV1LDD1FK1SxRBclBrbQJNOjkb4raZb2t/AUttYTqkEaLQ1dMKKQfAAc?=
 =?us-ascii?Q?K1ofe3T8STIGALl3MmSoK6m7ScRbXN1+YD4g3gQk31WserJB88Nd34Cky2Ra?=
 =?us-ascii?Q?a1e0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80bc99f-ef20-41a2-7d4a-08d898281610
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:42:01.1826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo4S2Hx3+Hd7wERDrq684NsN0OIQetQSuRXRIVzt31PsFw8+12ILwktD79xsmYmxYVOgspcBE4HyiJm+XFTYTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds i.MX8qxp LVDS PHY mode support for the Mixel PHY in the
Freescale i.MX8qxp SoC.

The Mixel PHY is MIPI DPHY + LVDS PHY combo, which can works in either
MIPI DPHY mode or LVDS PHY mode.  The PHY mode is controlled by i.MX8qxp
SCU firmware.  The PHY driver would call a SCU function to configure the
mode.

The PHY driver is already supporting the Mixel MIPI DPHY in i.MX8mq SoC,
where it appears to be a single MIPI DPHY.


Patch 1/4 sets PHY mode in the Northwest Logic MIPI DSI host controller
bridge driver, since i.MX8qxp SoC embeds this controller IP to support
MIPI DSI displays together with the Mixel PHY.

Patch 2/4 allows LVDS PHYs to be configured through the generic PHY functions
and through a custom structure added to the generic PHY configuration union.

Patch 3/4 adds dt binding support for the Mixel combo PHY in i.MX8qxp SoC.

Patch 4/4 adds the i.MX8qxp LVDS PHY mode support in the Mixel PHY driver.


Welcome comments, thanks.


Liu Ying (4):
  drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
  phy: Add LVDS configuration options
  dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo PHY support for
    i.MX8qxp
  phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY mode
    support

 .../devicetree/bindings/phy/mixel,mipi-dsi-phy.txt |   8 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   6 +
 drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c     | 266 ++++++++++++++++++++-
 include/linux/phy/phy-lvds.h                       |  48 ++++
 include/linux/phy/phy.h                            |   4 +
 5 files changed, 320 insertions(+), 12 deletions(-)
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
