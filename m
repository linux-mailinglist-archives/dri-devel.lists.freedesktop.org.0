Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5A3306B9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 05:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304C36E1F6;
	Mon,  8 Mar 2021 04:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70074.outbound.protection.outlook.com [40.107.7.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20EB6E043
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 04:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlYOSc5mKaDKvJcXC0pW4dSZ/Vwgc6LcsHdN+HSBmxe6RKFvz7GH4m9Tdh1c5kLCfnueTCmCwIyQ1iUN95i0EmPy/GoiN6enpFD2Yi4mBf+L9tYberZwNx8vLnrE3CQNC8DMhKXhzORcDYhau0b1kgYMvb0fBraZjfwctNgdhLCZ7b99PjVki69fQ6AQY3PtXLJSjLw31oQJx/K2Etjug3eeK8geRetrnylMW/mgJpF5mtk6tGzJV3O+c9yPjpiAdEKzgMdQF2y8a1l3xGyWDhbwULYoJd5sYJCli+JbYXkla5+2dKRtGxIqZS9xQYJPIFPRq5eqKmgW282klUrM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDu/fEvRn6x3WKFDb2VMctxPyFlhfFHHjNh0W8DORAE=;
 b=C1lW3+Vmw3XIs+JGu6RTS5pTxK4bTtHFTmQ3BvYtrF1Z4OshujpVFrxW8dVllAYjHis5oAfLYWwuGQsXVjqAfE7ngoI4DAlBaNlroJIGhC4NkClgen2wWBffhGDqvOregTwB07CeBM3KezuxN8apjJw3Quq+2NgpVGEyQgvPrnqKE6/8dhkUOBza32tneqSjbuOWv1Dr123Anl6ZPqDOo7RpPu9ma2hkz88HVk7vXqLZ0EKCNnHvyDIOymdKsxbk8F21EjODkkGF35SoVZtXL6j+m7C+mTCoZOYz4COQbQKui3Vhz78TeN9L+aRTfKXuc8JF1I75plDn1Xf2sRZCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDu/fEvRn6x3WKFDb2VMctxPyFlhfFHHjNh0W8DORAE=;
 b=BnpisS8S3Ge8usb0c+kuq5OW+DbwMrX5bk9LP55Q8ed/dmbsgnRk1MOZn8Zg2OTuOKY/QXX4duFsWHfERlX45/XX1Vy3Rb2CaEBhkXB+3mR3UHcUh7erF4i7YrvAbuQTuaG2VFZs+AxPsfuODr+KUdyUOkydNbR2mlTMK2+u1XI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB3310.eurprd04.prod.outlook.com (2603:10a6:802:11::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Mon, 8 Mar
 2021 04:05:43 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 04:05:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY
 mode support
Date: Mon,  8 Mar 2021 11:52:16 +0800
Message-Id: <1615175541-29009-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0088.apcprd04.prod.outlook.com
 (2603:1096:202:15::32) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0088.apcprd04.prod.outlook.com (2603:1096:202:15::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 04:05:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e0fdc639-656b-4f0a-1722-08d8e1e7715f
X-MS-TrafficTypeDiagnostic: VI1PR04MB3310:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB33103E024C066A8C35B2C08098939@VI1PR04MB3310.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1Xd0ZQKHkiijbRWVGB31EiM/5aX5DX5mWqWIKFzpPRbBNJUbrwtv1NIVpKmR3HOzcrfAVaSjoLzV0BYQDO+oQFItNMGV3fr92YLVk+8yKS9e8Cr8NMUkRdxeavNCl58LxRZ33F0MRdosWXQgCvjhOjr+AYb8sYuqYX3/EL72pov19Q07ZwTKX+xfWCv24JnVYdYawOEiHnistORDDPIMkZ8U/0fTcyJEXipBo0GEn6fi9Ea8NoM5oyeq+6smNMp25RPmuBrk9LUUcwxwas5ldw3xEONaLo+cESLeGbCVaEskBm1K1vSQcRwMO91yLSyWUfbZjlDw2kkhJlD8Ham/EPrHI6U+8Ns8PHmxxIysobICSIDhvA1SpAxkQ81CJcKwqyW0YqBB11ITDEqoFD3xuuZh3NTt6dP5SVJXzZJqPhFpFl/6yqKm25xaiRbDSvp1om0hUCJ8fwpMhiybOjwKGNiJ+pdRQykXhfvSmQt9YHlEIZ3MVorO+MLQ0+rAjOqtbP0YxNck8aZbnjR5uVl2KZ0j0MSGoujXp0sl5eaus/sRANNNj4dpTI+vFEkOkYTwBFB0fQMN0gz4bUB5N04ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(66556008)(186003)(16526019)(478600001)(66946007)(2906002)(316002)(66476007)(26005)(5660300002)(52116002)(8936002)(6666004)(6486002)(36756003)(8676002)(6512007)(7416002)(4326008)(956004)(6506007)(83380400001)(2616005)(86362001)(69590400012);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zAjObtTkPJ5sbn7tZPoeZxNml31KmtH+0Tf8UV3oR/yz9qth4IIVjfQdkAzy?=
 =?us-ascii?Q?vbSnHlXjS4Pow8VSrvdHgCxh3beXpmkrjqtTGA/gixEFCHWlJhBtm37bqdio?=
 =?us-ascii?Q?yoS4vqPqxIKsBRMyL4WaAjUPHYtpXr+R7rHkvgW8/mrwBLcJDmwy1whY2reo?=
 =?us-ascii?Q?2YNvwsbFpM24RorIsm/ZxAhNF7gOcu/jMyCAFxZy7Mt7nIpgY5KJZ5ZXAXxm?=
 =?us-ascii?Q?XNrbCEG2zZfohTo2G4wPAZKUdBdlrNyAFCofwh402XhAtMT7MQWSy63rwFih?=
 =?us-ascii?Q?3hJv3xLEHJ90Ljrr7TskJqx/7gSjmaHqOet7N37TJoqbQDTBZ9GrUXnh63pN?=
 =?us-ascii?Q?TGUYjnO4dOn4LSTlXWDa9sHqaCYAU6fYwtBmzonIoOXBbS5ZbvF/ByXRZuX0?=
 =?us-ascii?Q?RxnGFMN+V85WPBT2Cpkcanel80t3TS83ovzmGtDJihpmUwIUkTZMJ4tOzXCV?=
 =?us-ascii?Q?UmtqEVNWnTmfO7nqfDaHrtLNBQ69kWGgLSzwCM5jGWKHEK00fliZ+dlXvwAQ?=
 =?us-ascii?Q?QpayP+C9fjr/dAkwLBfQbEY3zvoZVWqywGX4AgHT6vDibu3CABIQCyc+MfkL?=
 =?us-ascii?Q?G4E3iPVDXHVuu26qvB9Nq7PxJ+JKVkRbvnFEsDdKBObAct4sl6Wnigt8lKOv?=
 =?us-ascii?Q?nle2oY8/nGPk+WMyTwSNGapE7s8eD/lsg57V7JfwxzqEbqN2jVomTN+nvGSt?=
 =?us-ascii?Q?9AfVxom1RA3TTCI8R2NT/fDt5/bWgEzc8iI1/SooIBlMptdlGvvx79v4IKnQ?=
 =?us-ascii?Q?Pv5s8NSPFf96rU/0A2Z6RtZ8y7Y2H3NKaDturGc2HRTD4Ny0NbHdZpTqxlkN?=
 =?us-ascii?Q?f5Jd4MNTgcdAHx7b8OO1iJAL1QikjTv8MIDsbsqDPCJNc5U+WYeods6ar/nA?=
 =?us-ascii?Q?+kb9euBzLhWWh5lDaoDHZ5WHDVUJW4LqmNe/nLlZeR8VdjCXEcN6Kvam7Nl4?=
 =?us-ascii?Q?tkPpyIMZIToGVRYge/gdu+8zRxydnJk8pPZxA73HqUO86ussqETVLuNZthRd?=
 =?us-ascii?Q?HSUShGbqAsYJTAvi8IKzkET4l+3p0q7GNX/4CvaIcJ5dVWjdBNY1tuZClU7W?=
 =?us-ascii?Q?W4+0Xc0BvlmnxYiOqyiSF0tebQmX1lkQ2Ewq0zASDa83sdXSMbS9HZ0S3fXy?=
 =?us-ascii?Q?KOqiVQ4noJzEoUV5sRGnUn6Bm6bsMpvRS98jBTLSwLf1b+yBKUKVlZDRcNqM?=
 =?us-ascii?Q?cVRcabSonF6E2T9nLIJZMJGuDR8W/046iN/mGtWEM9JBAjoixKTEA6Mg2qWN?=
 =?us-ascii?Q?HJ81gI2qzCNirrSAWa0YdXqMS768YjkR5ekdoUwHdYwiHyelS4QniN/BorwL?=
 =?us-ascii?Q?sjRu5X10/HM2I44NCSgUYhHV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fdc639-656b-4f0a-1722-08d8e1e7715f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 04:05:43.1066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWdlz6hbTR8iytfVKVfypDBXbKeZOsvjbsBycIHrn+mN9uh/ML10F0Py0XVF9Zaql4Un8/WbjD5Dpyu6/ynJ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3310
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
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
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


Patch 1/5 sets PHY mode in the Northwest Logic MIPI DSI host controller
bridge driver, since i.MX8qxp SoC embeds this controller IP to support
MIPI DSI displays together with the Mixel PHY.

Patch 2/5 allows LVDS PHYs to be configured through the generic PHY functions
and through a custom structure added to the generic PHY configuration union.

Patch 3/5 converts mixel,mipi-dsi-phy plain text dt binding to json-schema.

Patch 4/5 adds dt binding support for the Mixel combo PHY in i.MX8qxp SoC.

Patch 5/5 adds the i.MX8qxp LVDS PHY mode support in the Mixel PHY driver.


Welcome comments, thanks.

v3->v4:
* Add all R-b tags recieved from v3 on relevant patches and respin. (Robert)

v2->v3:
* Improve readability of mixel_dphy_set_mode() in the Mixel PHY driver. (Guido)
* Improve the 'clock-names' property in the PHY dt binding.

v1->v2:
* Convert mixel,mipi-dsi-phy plain text dt binding to json-schema. (Guido)
* Print invalid PHY mode in dmesg from the Mixel PHY driver. (Guido)
* Add Guido's R-b tag on the patch for the nwl-dsi drm bridge driver.

Liu Ying (5):
  drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
  phy: Add LVDS configuration options
  dt-bindings: phy: Convert mixel,mipi-dsi-phy to json-schema
  dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo PHY support for
    i.MX8qxp
  phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY mode
    support

 .../devicetree/bindings/phy/mixel,mipi-dsi-phy.txt |  29 ---
 .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 107 ++++++++
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   6 +
 drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c     | 269 ++++++++++++++++++++-
 include/linux/phy/phy-lvds.h                       |  48 ++++
 include/linux/phy/phy.h                            |   4 +
 6 files changed, 423 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
