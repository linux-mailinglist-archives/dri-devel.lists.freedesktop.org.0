Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA5361913C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 07:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9E110E6A2;
	Fri,  4 Nov 2022 06:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B71310E6A2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 06:46:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnlrYuwcSG/GrIxJ/DT/dz1aBmWRMV3z+fy8k3BqgVDOpKn0OZnbPPnzTi1ziILLgcRm/Yp34hJ7EGhYf5Gz/94nu1kTUsdxMehZvFYZw50bdYc0h2pffaHulViyNBTNeVn5lLr5G0Xbf5F4D9jM3w2nSShyJBBMkPu71lg1txZNW7ycZYzFVIqY78/mfw+5ZJc8+iXBLpmNW7khTGOHYxXrtKZM/hWiU1hnmjgO5sBTYK4pgAdW9XsPszQrcIC/82ibWVAtkkf84ojhEW/k9qtqZeafhayIsmgeq4x1U/MtFV6ywnkBbMtBxWCRzwYH07JjCjNVDdSKCS4GEy3ViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptaqgHG+OJO25Vb6vtGNb1qibKtVcIGIRFNXJo1lKMI=;
 b=bTOrn4pRs140N8w7IpBTrc+mO2awqiLREi1CQikcq7cFWyDPbwNOFkkScjkJfbU6E/7fx+Wu09CvHZb8y7B2OwKcBK/hasRmaI3yeZcBWNgU+i+ikQfurVqvdGhXcccVPDFc1olWEoXMikj5ovR1r7t0LAz2BQk+FUfTPGqQVITe3mFSSFA+zhrOmx+ouRU0qjefCjS0JofXqASqDuANAylP8OUJBg625hrd/+h1BM9AcXP3wsnAjPUSSIZzdaJItIxxvEE+pKxBVUDR+rc9gfQEgHeMA+zRP6kMNQpP2qBXTai59cKx40ZWlt+MxI0WX4jDgNv5ifq57LKVBGJvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptaqgHG+OJO25Vb6vtGNb1qibKtVcIGIRFNXJo1lKMI=;
 b=G6eqEMiWw07mAQehxd7EVei4y3mnwGgovtz83xBEhhzKBUeLmb+M15wXab7HpbOTWlAU8/XjbP4ajawIrlU8TQQPsvo+N1kBQAMN3n8sC/ndZi6UKCD0O00MhFyVOfvuODpikJzHLV4dBb6MlcRYxNQGEduGGjRhl+QxdQfenm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 06:46:31 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::88a0:57d8:2a57:3f4f]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::88a0:57d8:2a57:3f4f%9]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 06:46:31 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org
Subject: [v2 0/10] Initial support for Cadence MHDP(HDMI/DP) for i.MX8MQ
Date: Fri,  4 Nov 2022 14:44:50 +0800
Message-Id: <cover.1667463263.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0194.apcprd06.prod.outlook.com (2603:1096:4:1::26)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ab34d1-64be-44e4-7a2f-08dabe304e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2mHU+JtIi1mpXxWs6A0A3YSdZjm9lZkSpa1gLaAf58i/O0KQ9JLS+jtqOnbfM8g9sSQEppe7zxl9/ObrrYpOs+avTk4o+s7K7za+0ebbKz04tuWNYz8UZy240wGU2ZmuclzObcvKGfM5UiTiyB15K4w00lhWIWXhYCOyBoO72d85XQ/tEiGTP3NUbgyK/bhRcyQnnNsjY50OvHTy/KguiZkb4C9X9e98YLOFbaJo32IrOhsMH8E71/B6VL6gbyK9mbdeOyF27A64eU0067toTVhUeJU7z44q7fYekyX+KtF0MdvRrdom6kEdggCX1XnqtKMlfFlkHlkyu6FMfBgaSMleWPAmhCiaQFac+M7UiFAZca3q6vfyJQxrLFaraYdwE/FnZAKvuOmh77TaZCCI+bsvJojBznW2KCrXSWNBW3YcqGyLfj2SE/IrCD4QF762MKCfo33KBCdyzWPcnxeMjSLjVfjqXqwZDzQbdDyZ45HwpQhDFGW4Ds7fd89R66OZMBJMTR8hoY9i5oPCB31Qi3Y94kqbBZivdWtPed7isnI1B+h0ZR+UvJm1I0x80ooaVCE+6eh6h+GPRfi7WovdBCWHjrbtVNj3brPTgleU4yt+hJynBDDXhfkQUggkeYAax34cnWKFLC6UCw5t8RejfqtCCEeJpDXTxFVDVCYP0fG/XNpo8o2B3AquEBpKlLzLMG1kxGbwSU9IfSBJpS55OBb7QEK0V67i+ADDDdHeubLg4zAR8JpVFmPRPOnubdn1yV0YtfkNJ4daKLmAbUyyHrf5hVsp9Zea0in4/9UHHwk5+K3gk1rubomEnThr+Uj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(316002)(8676002)(38350700002)(7416002)(5660300002)(66556008)(66476007)(38100700002)(4326008)(66946007)(36756003)(8936002)(41300700001)(83380400001)(6666004)(921005)(186003)(966005)(2616005)(86362001)(6486002)(26005)(478600001)(6512007)(52116002)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XGhd9JY6vlui4IODOfDa2cGEckcZ3zW4BGO6QtNybWuAdz48vk6h9Ro6llPY?=
 =?us-ascii?Q?lYwMa6GPOWC73punDFNBJ8Mcmo8NJvrVG1/c2Pax6qjpHCaM+9bMew+VJHbb?=
 =?us-ascii?Q?qGC8SrIOgJSPsCeoCTw1dhx+G1JSY2rPo3vmJpegftFtj8lR2+R0IqCcvoKL?=
 =?us-ascii?Q?+LtdDm/i/JVkqSA/n5FGTwd8E8bxSDtDpwHgydQE82KEoBo98TMb9JLucVX0?=
 =?us-ascii?Q?GxGhFmneWkPpgJVhOK1ipJKW14fuwwY7XwAHfwzZ//ImFCrtyjlPrz+0ZGlw?=
 =?us-ascii?Q?4I/p3BAmIxP10wcfaVGLupFYpYSlAEC18KkLfN/2UdJ03/tm+rd7f+IzKawt?=
 =?us-ascii?Q?3ZIyaM5KAnd+di5kL54JN1kLRjeLxVHP0QdJwkbELPaN1w5mIXvzQMbAIOzg?=
 =?us-ascii?Q?0QVvyL/rgBCMV96xz40LpIwAe3tGs7qNg1078uE1sLF2dDC+FiTqPAf7EFHu?=
 =?us-ascii?Q?iwdgnKCcJRlBCtkkhQVnVX4eeXA8Pf3kN/BX6oxZvGNQLPQOF/bq0jtC4HuV?=
 =?us-ascii?Q?4GB+7j79QPeABOSoSbEEjwPprKUIsOiRy/T3xa/bQ/umTCV+fDy2uYcQWZll?=
 =?us-ascii?Q?gp0XKzXtQi+6vffKC6Vv/B1B89J+MBu62zFgLG1XOcMHA2OJy78Je1YQK2SR?=
 =?us-ascii?Q?viVATI1TUSbJPBDpNFY23LtkiNquPQiJ0hc55KUdiXSdzsz2EZ/4INrDvP+f?=
 =?us-ascii?Q?R2Nwghct1o43iAi+jB9uI6zgFzC4MTwR2L6sF6XhC1pZ8aLjqFTgLIHiNWks?=
 =?us-ascii?Q?sH6JOFgGAAMUCSZTu08Ft+v4JItKrcENZ4keCX1aGTzY8NggCEomcdsuEPRq?=
 =?us-ascii?Q?5yN102USnXmHOmU+myU9d80dJ2CZ8r2DVaRwH6gPWyoVTqhnkMBAfaFK7K1N?=
 =?us-ascii?Q?caCPMzik4NMYSs0oSUjLJG0FXcT8bjiuB/eLeOHDDPGO0wITr1opyKwLgkCO?=
 =?us-ascii?Q?1As4O1W6ouw+CVWxknIw5UykQ9Dv3Zd1G4YWf0Iut0OCpsHGEi6iH6SIb91B?=
 =?us-ascii?Q?iHo2DDqJSsQ3nIoxu6inJH9Py9KQpcSeTwM4o81Z3jVjm3cVikebkrGK3SlS?=
 =?us-ascii?Q?yqBmFXSDuiyl1ZB4Z/52XRf2YxBlScOlzbclVvxXI3iaWZU/POu8E56uOkEK?=
 =?us-ascii?Q?ZkGfzBxBvjxOahEdMqjFID5pvJiqEvet3ljXcoZfwjaK99BeJnuyuuAAtXW7?=
 =?us-ascii?Q?nPTZD9SOQQBwneE+lq8gvmZtdXzU+kknWLBl17K0VwyitMjps56w4j7D9fB3?=
 =?us-ascii?Q?QN0WaFzTHFtVh6XmByqmYdU7snA/YoK3oSf0q5eLNQOJDDGU80FZbfswMIbg?=
 =?us-ascii?Q?hsdk+WV0FZkgh6LHUVpNsYiKisnujO8gYwK+0+pZxWWlZdYW3j04hjx8XzFW?=
 =?us-ascii?Q?uyTZeiIkb3RR3QqGbQXdC4o1NfBigmwWpiu/wfOuG57EdWS+p20VUMll0BA3?=
 =?us-ascii?Q?YhSW/Wz6eXSZ5tyVtsujMCijAj82wQR8MDr5VqxPC7zGXOujduN+gnJUiSvo?=
 =?us-ascii?Q?BGl6EZitepL5FIVwTRFzzPmCCcs07AVGq6zEZi9N5xPAed/fnriHH7JrxmXq?=
 =?us-ascii?Q?KlMXYMVuKheoz/EisLt3NVPbJKEcyUt5bMpV9trB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ab34d1-64be-44e4-7a2f-08dabe304e89
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 06:46:31.4030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExuDrOS/9sL6gbn4gldHEpukbP+b3PkMMdrv9qbB0NQ2CGhB1JsyrMGkK+bq1pFCJDvjU+gR4hrqGolW4gs1pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 jani.nikula@intel.com, tzimmermann@suse.de, s.hauer@pengutronix.de,
 javierm@redhat.com, penguin-kernel@I-love.SAKURA.ne.jp, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Sandor.yu@nxp.com,
 shawnguo@kernel.org, p.yadav@ti.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch set initial support for Cadence MHDP(HDMI/DP) DRM bridge
drivers and Cadence HDP-TX PHY(HDMI/DP) drivers for iMX8MQ.

v2 is a completely different version compared to v1.
Previous v1 can be available here [1].

v1->v2:
- Reuse Cadence mailbox access functions from mhdp8546 instead of
  rockchip DP.
- Mailbox access functions be convert to marco functions
  that will be referenced by HDP-TX PHY(HDMI/DP) driver too.
- Plain bridge instead of component driver.
- Standalone Cadence HDP-TX PHY(HDMI/DP) driver.
- Audio driver are removed from the patch set, it will be add in another
  patch set later.

The patch set compose of DRM bridge drivers and PHY drivers.
Both of them need the followed two patches to pass build.
  drm: bridge: cadence: convert mailbox functions to macro functions
  phy: Add HDMI configuration options

DRM bridges driver patches:
  dts-bingings: display: bridge: Add MHDP HDMI bindings for i.MX8MQ
  drm: bridge: cadence: Add MHDP DP driver for i.MX8MQ
  dts-bindings: display: bridge: Add MHDP DP bindings for i.MX8MQ
  drm: bridge: cadence: Add MHDP HDMI driver for i.MX8MQ

PHY driver patches:
  dts-bindings: phy: Add Cadence HDP-TX DP PHY bindings
  phy: cadence: Add driver for HDP-TX DisplyPort PHY
  dts-bindings: phy: Add Cadence HDP-TX HDMI PHY bindings
  phy: cadence: Add driver for HDP-TX HDMI PHY

[1] https://patchwork.kernel.org/project/linux-rockchip/cover/cover.1590982881.git.Sandor.yu@nxp.com/

Sandor Yu (10):
  drm: bridge: cadence: convert mailbox functions to macro functions
  dts-bingings: display: bridge: Add MHDP HDMI bindings for i.MX8MQ
  drm: bridge: cadence: Add MHDP DP driver for i.MX8MQ
  phy: Add HDMI configuration options
  dts-bindings: display: bridge: Add MHDP DP bindings for i.MX8MQ
  drm: bridge: cadence: Add MHDP HDMI driver for i.MX8MQ
  dts-bindings: phy: Add Cadence HDP-TX DP PHY bindings
  phy: cadence: Add driver for HDP-TX DisplyPort PHY
  dts-bindings: phy: Add Cadence HDP-TX HDMI PHY bindings
  phy: cadence: Add driver for HDP-TX HDMI PHY

 .../display/bridge/cdns,mhdp-imx8mq-dp.yaml   |   67 ++
 .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml |   67 ++
 .../bindings/phy/phy-cadence-hdptx-dp.yaml    |   70 ++
 .../bindings/phy/phy-cadence-hdptx-hdmi.yaml  |   54 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   25 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    3 +
 drivers/gpu/drm/bridge/cadence/cdns-dp-core.c | 1070 +++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-hdmi-core.c   | 1038 ++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp-common.h |  402 +++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  197 +--
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |    1 -
 drivers/phy/cadence/Kconfig                   |   16 +
 drivers/phy/cadence/Makefile                  |    2 +
 drivers/phy/cadence/phy-cadence-hdptx-dp.c    |  774 ++++++++++++
 drivers/phy/cadence/phy-cadence-hdptx-hdmi.c  |  948 +++++++++++++++
 include/drm/bridge/cdns-mhdp-mailbox.h        |  240 ++++
 include/linux/phy/phy-hdmi.h                  |   33 +
 include/linux/phy/phy.h                       |    7 +-
 18 files changed, 4817 insertions(+), 197 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/phy-cadence-hdptx-dp.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/phy-cadence-hdptx-hdmi.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dp-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
 create mode 100644 drivers/phy/cadence/phy-cadence-hdptx-dp.c
 create mode 100644 drivers/phy/cadence/phy-cadence-hdptx-hdmi.c
 create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.34.1

