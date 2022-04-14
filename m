Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DAB500658
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 08:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7172F112093;
	Thu, 14 Apr 2022 06:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9168C112095
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 06:47:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5aK5LY5DwV/+3D7ntVtqlS5josmpGk8o5gkhscNefQIHucmHUebhcX3AZt34NMNfrVZvtJ+2skdcBma2SqQxAS7pBFDpUIUASSurRZjtbjYklN2t3AqFVY9zer6nIcwFXC3TZbWdQA/dyn5bnKJzt9RsgeCxHC7yApuJxH4F+qNB4b4qBdq5VLiH8c4PhWGfF3jN5fZUOgrfCPWfTuw2ZolpbthGSyLwJo45E43q3oZCwVtI+22LOHfdnh6I/HVYm2yPnAHAVyGLIrxVDahAp2Rfl+e0W2mLzoJYti8zgUL8hzV9EUX3EN/OjHbAT4yGAVihGvhuOFCtG0KtTcASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sr/askMcV2Q6af5YTRXJENxQQnbMseqrb4B1SrvjQgg=;
 b=aRotABROQDB39nPWkmMtZFBgGGpFPlykZt9XF0s02mJWWqSp9Q1/2+jkTb6Of81Rxo6H60j/9Jj90gMPLRqfQ28zXNiWHMyB/iUEK8UY4/0PZuT/qnaZgSemwbR0KVoydao3jpXQpML7OpdLGfrgGTeUjiLtwJA0ZQx8fObLz8PSaSa05UfaWg4UonTbKzyVtADjQTsAg2e96C8Ulq710mvcpfsha0vdIgyIov/I/0HnL4DmtbsnnucDU/P/hI9RLTE69bsuC47CMWdM5pJ9Dnj8OL0dEo29/jqDUURwYBTWlgM4zxjs/kHLTc45we0eoRleO5Qz+M1Z6+AQRUKU3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sr/askMcV2Q6af5YTRXJENxQQnbMseqrb4B1SrvjQgg=;
 b=ZZ48dtyuXFwnNqDaxzKZpBuTqz7QnRN8aZ14ujYsGkdtnaGphWFMoCCoZ0AbjtwahlfKNz5+oBsaGutTb7F2PQLYzIGiAT+FrTQtw6prsJkQaJ6dUL6RWzzt90y7eDZN8NW7SbGCMWaUNe4Y0xB7AZ3lmFYsjZVZJaRROEDqAzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9381.eurprd04.prod.outlook.com (2603:10a6:20b:4db::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 06:47:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 06:47:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY
 mode support
Date: Thu, 14 Apr 2022 14:48:53 +0800
Message-Id: <20220414064858.405096-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b97d01a3-3fc1-40b7-8fae-08da1de29fd7
X-MS-TrafficTypeDiagnostic: AS1PR04MB9381:EE_
X-Microsoft-Antispam-PRVS: <AS1PR04MB9381C8639310D32ADFA9118998EF9@AS1PR04MB9381.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfCPe/+5udyn/ICJ3MNqENKu7Yc4Nn7e2+ozRkQDDlFGnGeweCwHyo7+wFeW7nMe0jWsm9V5q8IBLYNfuwvRVeiWF7B++ThNpNDFvMT4EF+GEu1WNOox0PnVoWXSQB945+tEW9ehFqVi+H3BUBsflzgP4OrBqtC7pYnIKVKX7r0dufXxp8d+oepTJ4RhDvF647XrR2v9U6et6zUKpZ9SNg3p+5cxLYxON1ZUCUeaIYpZwQcVAlLmg/DNaBj6AiccqmE2exuyCBRALIJMNXg5e89RvfzOtGholmxI1I2hz96lkY/dLsBkDTc1h64s5lnyDdz/PBhnZeZfBrKFDT0CIwBIilreVVIz9yAvC9UfuM/VCHjs0RDswZZHhkKDpoQ5gd+b0+c80ooFx9ZUed1i6779sb7OnEN7TQPF5/zzqpPF9ZkM90XOIkwsNSaJj6ODgJl3/95RO75cFQdR3LKy461dN4xuq1dj1NwjrmvcQw9KIkhHG3Ps6iH7vrIj3aM3jHoFRB6+sZiAjXIOiOq46kgC0titp2x7mORfSPbxjT2Ol9FW43ka4/er4hOkkwSWaoohCDMnyBuJGcg8MktGtmC1LZfY3pVj16n7jMe7dBMlhrXxYVBiZtUFTSxUb3y4kzjAayBaNhDBAu5tPLl7CrmtpPpT/t6AQOZNepo4mghP9C+BBwxB79VG1a3dcY8FArVHmNZQnbnwidUVSy1dmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(6666004)(6506007)(2906002)(508600001)(38100700002)(38350700002)(86362001)(6486002)(5660300002)(8936002)(6512007)(316002)(186003)(7416002)(8676002)(4326008)(52116002)(66556008)(36756003)(66476007)(66946007)(2616005)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUo1NGpRbWFKWStmRGZGTWQxNDZIcFROSGFiZ2VwTjlpNkoxU2p3VVd5K0lW?=
 =?utf-8?B?S2ZhbkJQZ2ptSzV6WWJSVXA3RHkzK3NCNWY1d0MrZlo0ajBJdDVRQzI2Wlow?=
 =?utf-8?B?NW5kWW5QMGRIWkxuK3dQOTgzR0N6VlRmWmJXNXJITWczY1JmSGtLc2ZoQVB1?=
 =?utf-8?B?ZGVzYjRoMGE0SUlvZzlvNzh3a0xzZXJEcmtKbGFJU2VsNnNrUm5rYkpTTHhy?=
 =?utf-8?B?bTA5TWxmQVpoU0dVVVdIU0NiYTNpYzBNeHFRUW1hN1pEYjJmS21IZERmbDhC?=
 =?utf-8?B?SXY2TDJIZFlWa2MxV2JhSWYvWWV6NFVpRFA5QkkrKzkvTXZCNE1YTEY4TVFE?=
 =?utf-8?B?cEVhOHBFWFo5dGc1WGpsVHZncS9uYnMzaHZvOHQwYURrWGgvdFBYSkJSUFli?=
 =?utf-8?B?bjk3UWZpNXdabzYrTmY4bGt4K3ArZUd0MWM5eHBMN01wTGhKTGFPUEwra09z?=
 =?utf-8?B?d1NkS3pDS3pLSDM2WlJqWUVEYWN6cm5RWDRvSG5xZlYvMnIvSUhBZHZrZ0xR?=
 =?utf-8?B?N1U5dERYRmZ6TzNFNFZoYXk2aEt1NDNhcDNDM005UFlHSFdFTDlBTUJYajBY?=
 =?utf-8?B?SnBhcFFGWFBxK2orMkVTUWtqanF3cE5GS3VvNmNNbktPTld5UVNWWkFXQVVj?=
 =?utf-8?B?ZGlFam1oUzFSYlhURVpvcFFjblp6SjhEZHM4VnAxR3k4WndMNWkvZCtoeWJp?=
 =?utf-8?B?VnFyTXNjbHlZRVZWeXZrRFo1SGFpcy9WWjlzbTlTYmhzdVBTRHBsMDJieTdi?=
 =?utf-8?B?VzVESzZtVGFoRUNWdU1MbWZUQ2xhWTh0VWxDNGZjQkUyRmVTRGp6Mlk0SDk5?=
 =?utf-8?B?aUczZlZMV0xpUjhhNGxQR1o0N3VHNjVPTlpMSWVrOVh6SzRjKzFZMWwzNzd2?=
 =?utf-8?B?a1Q3Q0ZzajFpTmpzSGVUSXFLajNMMEMyTDFENzd4cytKOTdWcERRRSt6cGE1?=
 =?utf-8?B?bTJHdEpxTVFybGUwK0dDRTJuelhYVExxeFhOZ3JPSG1ZMGYxSHRoVXBpM3VN?=
 =?utf-8?B?RjZDQWVuaTNsM0o0amRTaWdoUWhhcWlvcjErZW93c0hKVGJKNUlGMkV6b2tN?=
 =?utf-8?B?T2J5WFpFT1owZUlJeHErSXExL09pdjdiblEzV1doZVV5aktXQ1FQWnMzOFlJ?=
 =?utf-8?B?Q3ZxMjVJNnFXZEszMVhKbThRSWU2a2xnZmIvRytwRmpuVk9xMHZlRk05MjV5?=
 =?utf-8?B?WS9IYUF1RXJmR1ZOQVdOKzFFcll3SUFUVld3TFpsdkQxSTlmMUlLYjY2dE9t?=
 =?utf-8?B?Y3lFUlpyUDcvNllvV2x3VkZkTytXbEJhZUgxUFFJbVZmTlhXb0luTWtoRzNP?=
 =?utf-8?B?Rmkrb1hoWjJrLzJpMXpKU3I0OGlUZUp0VHJETFVEWUJPeENNbWg3T3Q0WUF1?=
 =?utf-8?B?VTY3ekVROHRld2JVTUgrQ3VGeUhQNk95aTRDWXFCNDREdW1BNzJzTFQxUCs2?=
 =?utf-8?B?NjVVNlROZENhMmZTMFlMWHBDcVkyQVRPMWVrcXVPZnBIYUNEcXB6cXFGMVl1?=
 =?utf-8?B?Skx4R2VoRVJTU3M0VTBYZ2RZQjkwTUxiSTNBM0h1WGNHUExPamxjaUQzU1Nz?=
 =?utf-8?B?UlFrL2hRWEpLQ0FndERXcTB2S1gzUy9GVXJqdFRNK2xwNEZQRjBOcHluclNI?=
 =?utf-8?B?c1FTSGVZR0kwN0RZMVZaalIzT2FRaW9GYjZSR1N2UVh5ZVF6NXN1RGpXbzIv?=
 =?utf-8?B?QkN2eVh3WkRzbm5UMExXdEwyRUFFNlNteGc1RmwzMkxhNDNNTzAwUE1wR1lG?=
 =?utf-8?B?YXNNTkU3d2VacWxvNGpNQ2E5STB2OHkrNkFZejJIL3MwLzc0VFVCYWdCL2Zk?=
 =?utf-8?B?RFlQSk5lVGpxWjYwd2xUYVdXZUVUaThMYWI5dCt0eEZTVDJJZXNWd2pzNExw?=
 =?utf-8?B?enRaeFVOLzkzWlM1L1hWa3ZXNGw1VEFiWXBheExiVERDRXR6Ymw2eXFUUHJ5?=
 =?utf-8?B?bncrTCtQQUJNZEpWUzB2dHNHaEhQSTV3T0hNVDJ1WHVjc1dBT2toUGoyaXg4?=
 =?utf-8?B?ZkUvbnJNWk10cWlXM0tjaWZqdEdUcFltUUVUa08xeXhYSENETk4xRUlkRUo4?=
 =?utf-8?B?TmYzNGc4Y2FWMkFPaVhwdHdXVVlZa2xFeGFmUTJMV1dyQWluQmtvTGdXWUo2?=
 =?utf-8?B?aVMzcW0waTVyeTJtNnZjMU9yTW5NT05GMi9CbWg1cHRxY0c2STl5NnlQbXFa?=
 =?utf-8?B?T1VudWZldFYzdjlTNGVkbE84Slp2ZGZneWVGQWF6M091NjBKNTVBbEdRamJi?=
 =?utf-8?B?d2t1TVkveXRqZ2tqaFZwKzVNUVRhWjhQZFczOE4rVjFUMDZwQXIyN1E3QXhT?=
 =?utf-8?B?c0dIM01xdDNTdFZBSzRiZmZ6YndPQW9QQ25ZQW1CNlhFV3plZUU5Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97d01a3-3fc1-40b7-8fae-08da1de29fd7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 06:47:21.0208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OWY3W3Ct9CMZMhzJz+4JFKwKa0ag7q3eclL/H/Bheynm6JPM69mign0NorlusU4zW/bkdxbzHZqTELg7VHI/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9381
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the v7 series to add i.MX8qxp LVDS PHY mode support for the Mixel
PHY in the Freescale i.MX8qxp SoC.

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

v6->v7:
* Update the year of copyright for patch 2/5.
* Better variable explaination for bits_per_lane_and_dclk_cycle in patch 2/5.
* Use marco instead of magic number for CCM and CA values for patch 5/5.
* Suppress 'checkpatch --strict' warnings for patch 5/5.

v5->v6:
* Rebase the series upon v5.17-rc1.
* Set PHY mode in ->mode_set() instead of ->pre_enable() in the nwl-dsi
  bridge driver in patch 1/5 due to the rebase.
* Drop Guido's R-b tag on patch 1/5 due to the rebase.

v4->v5:
* Align kernel-doc style of include/linux/phy/phy-lvds.h to
  include/linux/phy/phy.h for patch 2/5. (Vinod)
* Trivial tweaks on patch 2/5.
* Drop Robert's R-b tag on patch 2/5.

v3->v4:
* Add all R-b tags received from v3 on relevant patches and respin. (Robert)

v2->v3:
* Improve readability of mixel_dphy_set_mode() in the Mixel PHY driver. (Guido)
* Improve the 'clock-names' property in the PHY dt binding.

v1->v2:
* Convert mixel,mipi-dsi-phy plain text dt binding to json-schema. (Guido)
* Print invalid PHY mode in dmesg from the Mixel PHY driver. (Guido)
* Add Guido's R-b tag on the patch for the nwl-dsi drm bridge driver.

Liu Ying (5):
  drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_mode_set()
  phy: Add LVDS configuration options
  dt-bindings: phy: Convert mixel,mipi-dsi-phy to json-schema
  dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo PHY support for
    i.MX8qxp
  phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY mode
    support

 .../bindings/phy/mixel,mipi-dsi-phy.txt       |  29 --
 .../bindings/phy/mixel,mipi-dsi-phy.yaml      | 107 +++++++
 drivers/gpu/drm/bridge/nwl-dsi.c              |   6 +
 .../phy/freescale/phy-fsl-imx8-mipi-dphy.c    | 276 +++++++++++++++++-
 include/linux/phy/phy-lvds.h                  |  32 ++
 include/linux/phy/phy.h                       |   4 +
 6 files changed, 414 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.25.1

