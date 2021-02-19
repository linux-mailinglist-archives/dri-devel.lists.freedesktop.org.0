Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D587931F670
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 10:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B5C6EAC6;
	Fri, 19 Feb 2021 09:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE9F6EAC9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 09:20:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkEfSE3Z1BVjZpBGo1+3sx2lx17O7YVfhw/WaNzxBwToEPBpox25x0YMvnv9iwAYGgFD50mdBYMjTBNDjIf7Uba2IoMNRPr7gasTb9/rUeIxgiOx5w6o+aeQXPEKYnhu3x4icsdMENAgF3+upIzxYnMs4Quck92v8MdG4l6mfS6jwVtPKTnyNZKaiOW6y1Tev5hu9G9o+r/QlkGyhsXY8PqEAzbTRLatsWDSKpgWes04AAEUGP9NmUnslLRwkwJVV8AYhBfkrVCQuVSVU5/y/2L0bcy6gBSAwqCNem/ygU1L5zNECwXVP2KJZtadZluVUkbC1bXEEzHDJyWVM8yR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3hRf7g8i9gtGcvis3Fn4kxmQ6pxSOnudiiqc6+QEnk=;
 b=GIq2arOKHA86+nedChntmpx6ukzSqlPtin2d4EqHwjt55nlCM6JpHPFMQHnYarQwP27JjY3e40+xElRiRl3KL0kfseLTsevAy4o+t/1dOVmIW0wjGHVlo+QjSsVaBx/Auw4NXWrH4hDQprtKUFYjoRZc2bafW5Vdr0qk2OlFZRyEyr+9Vr49hPd7dMdn24CW8LvP7JxCB7BTW+V2HTqaihd/qdv1bN2OVPhjXHe+3wkMaO1TVLNy1vPifPNOimP1nLaFmXXRDSwh1OEAFP4nMvgXry7Rpph4X8CHQt8QGFdFZRTOGTqmgiGeyRaB6RFk+xYRV1fdVk6zFKuFHgPkIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3hRf7g8i9gtGcvis3Fn4kxmQ6pxSOnudiiqc6+QEnk=;
 b=JYukrAG7K4mWcxlqgct+LKq3r0dZPloMoF224XrvrZs+C9PXfNulksx/20rBR12DhKvTSfq7rnhHi/6UehTwLDgjF7yGtvicaHhGJQfz6OGqbkbC8DZfAZG472rWRcJblyVeknvVjd9RhIjAU5Qua/r3tG7te3o2LVhHVL/2v1E=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7086.eurprd04.prod.outlook.com (2603:10a6:800:121::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Fri, 19 Feb
 2021 09:19:57 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Fri, 19 Feb 2021
 09:19:57 +0000
Message-ID: <a89d5c08c9f0793acfb9d056d5748e4a3cf16c2f.camel@nxp.com>
Subject: Re: [PATCH v3 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS
 PHY mode support
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 19 Feb 2021 17:18:18 +0800
In-Reply-To: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
References: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0105.apcprd02.prod.outlook.com
 (2603:1096:4:92::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR02CA0105.apcprd02.prod.outlook.com (2603:1096:4:92::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Fri, 19 Feb 2021 09:19:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0c03831-4fc0-4eb2-77f2-08d8d4b7866f
X-MS-TrafficTypeDiagnostic: VI1PR04MB7086:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB70869DB3ACB3157E3565F88A98849@VI1PR04MB7086.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxVK+d8lXvf9W3fJ0wDtRk/+f8eWneW3s6/6YLMABPQDVIRAwxqI1I6e/DJqr6Yjyp+lttF8FnhMIbaSNI5fgCJtAjNFOE4F+K4nSJNw9wvEfTlxC7Z4bN10tfFeTaJpChewT0G+FrFfmDqRVKsPBcfFGpwujL6UMv60RO5O6pjzcd52TdmJYlpThkestDMjwDGNpfr47UZkHNyXOcrCfpcUuUKyuFGjCijMYHW7dvdzReLxVZ7qZQSDkv7Vfqo10ePhUNWuz6K1Zk2rW01bcwqFvfI+DfAHdRcB9QQEzNplJRUI2MKvOglt8bQV6zdtw4FZ67vA/dxsohwaRfA8KG+noac3vdv+0GqylGZMPTuuINfOj9CXfumNIf8ZTXN9PJYYiFhcNpPHTJPQRw1HA/DvKlqlh0bl75HE6fNoffOzpF3FsE+UvFT4n4bQhYEzwz2lrBJ8QYBK0KEd60u7Qx3LbMI9cLB4FkDaOGC76yPi7sGYe88b5bgfCN+ynchgZ9WU1ZE8bbUzMzi3s9W3Wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(2616005)(478600001)(8676002)(5660300002)(6486002)(26005)(956004)(52116002)(66946007)(16526019)(186003)(66556008)(66476007)(7416002)(6512007)(316002)(6506007)(8936002)(83380400001)(4001150100001)(86362001)(2906002)(36756003)(4326008)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?KzdpRGdsYy90cEwvcklMZDMxbHlQV25ZN215V3JQcmkzcW0zeWNOSnlLODVa?=
 =?utf-8?B?NVpqeE9TeGQ4MW9RYWh4aFpMVWZ6SkgvdlhnQklzYm9RNFhNZnZoQTNwOHZQ?=
 =?utf-8?B?ejljSi9yR29XS0N5WTcycTNkd2lUQUtFeXZTTWhlTEJEVUNvcEphQzV0ZU83?=
 =?utf-8?B?aTlHR0gydzYvckdRT0pXTkRtYVpoVGNsRWgzTmIyZCtNZXlHZGJDNkhxSFZR?=
 =?utf-8?B?OG1Dc2pBN3hqb3I2d2w2MUdvMEpWTExBSFk3V1BPcTZFdjlJbUpBbVhFUStS?=
 =?utf-8?B?OExGcnMwY2NqQVpBU3IwaURQRjhxTlVZSlBnL24yM3lhRnZMcitBRHpUeUo1?=
 =?utf-8?B?MU9vbmhMNzV0OHFOUGQ5MEhMT1NYejBNL2hiQUpqQjFMdTk1djkwYkdtMkdJ?=
 =?utf-8?B?Wmh1aEpRK3UzZVlBRUNGMm5VSGRqdFEvN1lHa2dqdVRQZC9zTElXSjh4RVZW?=
 =?utf-8?B?S2kvRDFzVjk3ZjRyOEFvWmpBL2pBOGRWZE1FTXZ0VXlMd3htZUIyYU4xR2lh?=
 =?utf-8?B?K0lWcTA4ek1ZWGRIT2pVTzV1RjJMWnJkTXN6b202MnVyV1RTN2FnR0FiZnlY?=
 =?utf-8?B?ZHhEaDJqL1RDaW5ZcVNVaTBmSDZFa3lBd0JXbjJmUUl3NkVvb1lCY21jRytl?=
 =?utf-8?B?dU40N1BXRjFuMWcrTURUbjJRYW1ZSGpYTTcrSHhiR1EvbFc0L0VGbXhYZnlZ?=
 =?utf-8?B?RmVlaUVUK2NUVnhQVjV5UFBiakhWb1NCYjAxaWdyVTVzN1lNcXlHMXRsb0Nr?=
 =?utf-8?B?TWFEUEFrNDRNbU9HYjFhd0dkQ29OWmlwd2pUQU1SK3lKZUlJOEhpbWx5cXd5?=
 =?utf-8?B?UDVXN3hSQzZEWUl5OVJvcCtUVXp1RkVmQWdlUkJENjVYK0hiMitDNncvbjE3?=
 =?utf-8?B?WmVaMFc5RU9OeUdjaS9pRkdrYlNvMUhPUTZ2WlVZRnJFYzV4SldYb0R3ajBo?=
 =?utf-8?B?MWJ2YjBkYkJlaUpuNVJqMVUzRllEbmpmNVRQRmVYVlVka3JIeWQwODFHQWRj?=
 =?utf-8?B?bXJpL2Y1bGZFS2twZCtNWW0yYXVacFFCbWxSczZNSmYwVDdKS1JtdGxaSXlD?=
 =?utf-8?B?d0lLS2hMZ0JhOFp1THhxYk5uVmVzQWFCQkN1UW9UVzh5bks4eHYzU0w1aEkz?=
 =?utf-8?B?b0ZYeWVWL1Mzc0t3YThJVXJ2OEVkdnpnOFZWeHkwbUJoWWFrVW42RE5nLzU3?=
 =?utf-8?B?Y3hxSEtBdnlzWUxQQnJqQlBRYTJzUG9odW8rL3QxSEE5bjBHTFNiNmZSUDNx?=
 =?utf-8?B?S1dCdHVCOWNXNWJ6ZVF1dStZUlJRbHRZdHVnREpZSGVlNklwMm1xNGVkU2Rq?=
 =?utf-8?B?d2lhWkp1aGFpMzYrQ0Rydm5EWExCOFdSd005Y3dva3hsdWpUZE1mekgxUVZ6?=
 =?utf-8?B?N3Y1VlRRR3hBUU5XOStweCtFUU00NVh6WXJScWdxb3FqemFPOTZZTFZkRFpk?=
 =?utf-8?B?akduTHdQRDBHdmpvMk82RWtiTEpQWTZOL2ppdFVKVkkvNGZJa1pWVVdPSkxI?=
 =?utf-8?B?eE1UdWtrckVCUTFicm5LWS9SQzFIU3pyRDViU3hVZWRhS1gxRlZEMUlHUHNK?=
 =?utf-8?B?MFRsTTJsaTIrUVQ4NVlFR0k1K3pGcVNqT1VJelpjVGdDTC9jRm55V2o3UlVH?=
 =?utf-8?B?RjFlRi8rcWFPNk92dS9wUzAzN3FQd0o1VHd2b3pWeVRrTFkxVEpYZ2JlYXh0?=
 =?utf-8?B?bmJmeGpSeU1Ec0VVc1FlQzh6NFhqMTVkK2VxRGN0VXBqUjBNdVFUcnd3anRT?=
 =?utf-8?Q?Nt2krgbHt00YIGR27j3Ch55oOcdMgKjiHYDhP4O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c03831-4fc0-4eb2-77f2-08d8d4b7866f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 09:19:57.6728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kiIKSASNkO6aoNpGW42GjrFNbVFSR2Ua+hKsVdpjYFXrrkeF9NzBRtXADMcI9Qfr6Zrc8gLitS2zzp7sJEkJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7086
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

A gentle ping.

Vinod, Kishon, it would be nice if you may help review this.

Thanks,
Liu Ying

On Fri, 2020-12-11 at 09:46 +0800, Liu Ying wrote:
> Hi,
> 
> This series adds i.MX8qxp LVDS PHY mode support for the Mixel PHY in the
> Freescale i.MX8qxp SoC.
> 
> The Mixel PHY is MIPI DPHY + LVDS PHY combo, which can works in either
> MIPI DPHY mode or LVDS PHY mode.  The PHY mode is controlled by i.MX8qxp
> SCU firmware.  The PHY driver would call a SCU function to configure the
> mode.
> 
> The PHY driver is already supporting the Mixel MIPI DPHY in i.MX8mq SoC,
> where it appears to be a single MIPI DPHY.
> 
> 
> Patch 1/5 sets PHY mode in the Northwest Logic MIPI DSI host controller
> bridge driver, since i.MX8qxp SoC embeds this controller IP to support
> MIPI DSI displays together with the Mixel PHY.
> 
> Patch 2/5 allows LVDS PHYs to be configured through the generic PHY functions
> and through a custom structure added to the generic PHY configuration union.
> 
> Patch 3/5 converts mixel,mipi-dsi-phy plain text dt binding to json-schema.
> 
> Patch 4/5 adds dt binding support for the Mixel combo PHY in i.MX8qxp SoC.
> 
> Patch 5/5 adds the i.MX8qxp LVDS PHY mode support in the Mixel PHY driver.
> 
> 
> Welcome comments, thanks.
> 
> v2->v3:
> * Improve readability of mixel_dphy_set_mode() in the Mixel PHY driver. (Guido)
> * Improve the 'clock-names' property in the PHY dt binding.
> 
> v1->v2:
> * Convert mixel,mipi-dsi-phy plain text dt binding to json-schema. (Guido)
> * Print invalid PHY mode in dmesg from the Mixel PHY driver. (Guido)
> * Add Guido's R-b tag on the patch for the nwl-dsi drm bridge driver.
> 
> Liu Ying (5):
>   drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
>   phy: Add LVDS configuration options
>   dt-bindings: phy: Convert mixel,mipi-dsi-phy to json-schema
>   dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo PHY support for
>     i.MX8qxp
>   phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY mode
>     support
> 
>  .../devicetree/bindings/phy/mixel,mipi-dsi-phy.txt |  29 ---
>  .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 107 ++++++++
>  drivers/gpu/drm/bridge/nwl-dsi.c                   |   6 +
>  drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c     | 269 ++++++++++++++++++++-
>  include/linux/phy/phy-lvds.h                       |  48 ++++
>  include/linux/phy/phy.h                            |   4 +
>  6 files changed, 423 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
>  create mode 100644 include/linux/phy/phy-lvds.h
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
