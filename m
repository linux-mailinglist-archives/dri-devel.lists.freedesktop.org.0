Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 986646211BE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0179A10E439;
	Tue,  8 Nov 2022 13:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2057.outbound.protection.outlook.com [40.107.247.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435E610E439
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:01:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIR2yZCOsR8ZKGM8W/LSZtbSc+y7AcGJkoIXlcOZCrLGBUiIVQNyX8awj2noF0q9G3xGsitzIL9NH8zOspaPxwGY5xCN6py0Pj7d+zf7srG6I/uMu+2xJiUISoSeF3m7L7OXvxKCNhsdKxIX9VvlqnWYpbN7D24IOgw1wY+rtk35V/dCMfBA4Bu9xgpMV6wHUQd6gJvlvjag7yUgpIAkb8C6uI0QWoYx5IGviSBWtPsBkRTgzXScdeBJtZ7gBz+L2X64fQ6a2lLC+hOspwp5hfXhH9fwPE2OuvWrN+fEgYZRe3mX8tflTP+GWkThsD2e18sOttKqhctgUD6djV93jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCnokIBgbE3ipUHXgVJrVSPKXXwFlWn9kBYakHYHknc=;
 b=k/8IklopBBHTWSSF3LhG6PSiIkEOdygJcVWy15wHQNuhjW45icY3v8+3RK5HWR58JlKYLLGGeX/rkwHWp1vzt1fE4A/mMbQgpVrRqroHh8qWAPtTscuOF3mg1+YfZ4vlGGPrX9/c+7f5G8pwn8wB/KH5SicCXJ7wGwRuJBiArzdVbKGxdqjkCgr2rb/TBCcvlcs1y2JgQfBE8D2BkFtAziVEeawiTW/3Rjug2XjxQUns9sqjaSRiqS/TzWKUOP9rjdM2uBGpm4izWAnzjYe17Ov/B02t6g6Pev9z25k4MIjKVvttaBQpSzTWdq9+XYKFQiP8hm7lAULNsf4cfKUPYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCnokIBgbE3ipUHXgVJrVSPKXXwFlWn9kBYakHYHknc=;
 b=T86ci7lYGU+u1/mlA3VCU9OJDFDDwJSWGgCgw/o38jB6hLiBAl0I5CTdbEwFSPDFwZOGPCg2gja0iL0AvGqAKtUi+T0nLnHhfR+EWkcfDbWFMIKLpKJtUF0xb/Vs3ZEBN/EcLB1loI2byf+JtVrl0MpSYTSqqn99gopZvZTUZ10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8895.eurprd04.prod.outlook.com (2603:10a6:102:20e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 13:01:27 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%4]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 13:01:27 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, vkoul@kernel.org
Subject: [PATCH v3 00/10] Initial support for Cadence MHDP(HDMI/DP) for i.MX8MQ
Date: Tue,  8 Nov 2022 21:00:03 +0800
Message-Id: <cover.1667911321.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f4166c-5176-42e6-eb8d-08dac18958ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sGbn1sx5J0D6O5E3P4xDvNsQ3n0eI/qtuM9YCLVWmcULwPOUZNNFcYrRxh18ikIHbPRYkXkC6csfdEviNYM602u1ptSJvXUb3+w3gNZ5SOrVtuE5qGo+qpaL/cSKODc5pcYi4dPPcFStt41vP6IbVovVnIaHzG2KXDfzM+5wQfKd2KqtyQjBVbRt6+hncDEF5yepwoP2/ier171tjU1xcXkq3T1iKMsAMbvheB6QyA+lc1eidN7+sAJzOe1/ILcm3x72FACokV6IKzspQitfdXNCoPOsUPhJpemfA9H+5d7k7gpUt9SSaicgbIFxLm7KbeNTDTf2WcXx6RWw1/IB+BNCwO/UTOqVmjS2dEgZEymdcx9qGHE2kWWS9eT3TUZrr5YgrhA+LPT+TQvqfQ5v86+XSe1cU6m+KLDlzzwyD7K+SSJvm6GkGP5f/hjFjlruiIya0hIsker6pZC+xtG327Mc4ldzfGYpxiGspzkb3d5D4ikhgKwrfryzvD+T5JRnZWTqjf+UWDBYNvYzZXkSDwbpUTqiTkdNcdqrFD+Ae4Tn4dBfEXcSzgupJZel7qY1/dNrG+StG84U8D7j6rH6Vx4XZ8qREk4lwwlnXdCBzImlMS0GzPr6DOvnR53/CTlxLfgN3lDn4Z75AxYVPt7xLF8NZe1a66bTg7z8Qp409syyJ1rWqM4WUh5R7h+CNZvM5GzaQt7BRgglilZCU1TQMM7ZJS0HqbXT4XlNatlrKkOfdPsF8Mr52JbkHFIPNG6OJbUlE2petJGMRXuVGFtj2sqUnnIaZyYmZ437vC5o/vEA0jZjlfNvh63bNZKQT5t1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199015)(66946007)(38350700002)(4326008)(66556008)(66476007)(921005)(8676002)(316002)(86362001)(8936002)(2616005)(5660300002)(41300700001)(6506007)(6666004)(6512007)(26005)(966005)(2906002)(478600001)(83380400001)(186003)(6486002)(7416002)(52116002)(38100700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jV5qy0/ZDcIplRWdoETlg8n1TrNPrzr6H5WyqPP81lX6yyDpf88EDANyLAY4?=
 =?us-ascii?Q?+jdUmfBg6RW6OCImakvFRQPvEpYsXgUnDfFPpt1PfK7LddD+xx4dMRjFmYR1?=
 =?us-ascii?Q?L47P3EPH0TdKApUHpKwO2Fj0wdJz/LLccvfL8lx6QjFAwijKJkD3xoCyaU6+?=
 =?us-ascii?Q?rpzTWUAEUWK2OuYAkVICARGGd/2upUAApxFLpWEwPbmmx/dc//fzEd/4O7da?=
 =?us-ascii?Q?GZ+5nzQybpzjsd4H4gLAhZ2ovynUJSgXdJ/pKDD31IOvuaubUGiNa91+Q2mn?=
 =?us-ascii?Q?mtgzl76VE1A8KafIUH0oKef1QsNZYDOaFGw+ffw6muqwxPBvMp656mnAnS1b?=
 =?us-ascii?Q?7Ckh57dy1fUVIdGKO2Jquueblyw0jvogW+XjOpLFsJ12IOdedQcJ7GL9XF40?=
 =?us-ascii?Q?XMBTnT5JoSDaewZEID+E7pTfGKcsr8GGmV+V1Gp6CmnK5TCzKLEW2eFNFbmx?=
 =?us-ascii?Q?fR3NR8ydVvUy8ZtYoEf8bp5MK2tyai1pK27Z33zZ6bh6RIUQlo3xjUwrpPd4?=
 =?us-ascii?Q?gSQtmGcUEbZXQi3runwSkETRVyO4Hj57KBftrhv7fnom9MWi7Xauxkz4Md0Q?=
 =?us-ascii?Q?eWc181+OtJ5+5BILZTnQVOMDae4YW3GdPJPL00YPXJs7UzrJjTQRCSGSR9nN?=
 =?us-ascii?Q?NCQ6TSU4SRjPNekBndB/21M/FGqAfDCYG/cB12NgvMMv2b3U0+RoFGc5hELB?=
 =?us-ascii?Q?i5fuepHhs5dxBJTRx4t9wQh1uNd/4ysnzzfDodSIk9GQfRpuxxdbkkbPPjtj?=
 =?us-ascii?Q?op7tgMe1EiY4JIegOU1j5iSvtgsHB7rhOQsouoYWwpoYHpSoFEZQg9hrvYsS?=
 =?us-ascii?Q?YTjhHsHYFzBtuSVO3fPZXuWbSYPYsr2vnJ2bmhExb8sH1ucM/SdizWpNzDG7?=
 =?us-ascii?Q?RGp/LSwqJtz16BodSHFPXHd2kn5CnR8dqQzh9HuDTxXEc/urDAgyePuxMQzr?=
 =?us-ascii?Q?/FGXIdXnjsd0r3TFgrPJ0AAi9HGza2eXOnMjUb1urydRIZJreYt0rf6Bv8o4?=
 =?us-ascii?Q?r92imgjeV95p252Nwjv0kD2rcpRpQGXynydW/tuVwfFMOZM/wcCjVtLcPe/t?=
 =?us-ascii?Q?05nYf7a0iRNjzXlGaaC1sAmPquf0Zqgsl/1NdOm2gWBdUf4CK6UIG4WnXpK9?=
 =?us-ascii?Q?D96W6TecLROowrmvQHMOpP29+Ip3FJHgK58/3/fZ0fbRZGDaONWxGc1y54hm?=
 =?us-ascii?Q?xyqnDSKagUR1CBYeeI7SIsk/cGpwM1vnMuvrOwkekCFrEVvDyZHT62qQdemf?=
 =?us-ascii?Q?rKs7kYU26GI7oSXultc+n0SV5DByJA8W2YBZRzGfZW58FGjb3lzfvnKXCRcF?=
 =?us-ascii?Q?fNebn75mcPlePJUdvnhAvjyqIsUKz2Zwy4b8gfEPNSscRwPPrK0Maa2HbUzb?=
 =?us-ascii?Q?NPyPyIrauILlVJtSGumeuSivKUCH9e1bI6P01PW4fvnkbjiHfwUWrKX81Itx?=
 =?us-ascii?Q?ujw8hh+Sj06q+haQcrAszJdzxcq3UbEz8kO1LM+JInP+raCxefvm828eaA/Q?=
 =?us-ascii?Q?wZA+7JNUs4Wq6+1ruIVl0KH3e7igwX5QtNuHgXRDmqgyA229vn693vLozXdO?=
 =?us-ascii?Q?SGZ+0BwHMw0T0nXxPDqeAce1atcASadFi/XnTDdu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f4166c-5176-42e6-eb8d-08dac18958ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 13:01:27.0563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fx1RUp0FX/SNb5ayQfEY7nr5731Z56UyWrR2h+4MzOA4xDj+3Y/xMM9cj8s7/QZbVA69a50zIj7lkEB0yPcqTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8895
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
 shawnguo@kernel.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch set initial support for Cadence MHDP(HDMI/DP) DRM bridge
drivers and Cadence HDP-TX PHY(HDMI/DP) drivers for iMX8MQ.

v2->v3:
Address comments for dt-bindings files.
- Correct dts-bindings file names 
  Rename phy-cadence-hdptx-dp.yaml to cdns,mhdp-imx8mq-dp.yaml
  Rename phy-cadence-hdptx-hdmi.yaml to cdns,mhdp-imx8mq-hdmi.yaml
- Drop redundant words and descriptions.
- Correct hdmi/dp node name.

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
  dt-bindings: display: bridge: Add MHDP HDMI for i.MX8MQ
  drm: bridge: cadence: Add MHDP DP driver for i.MX8MQ
  phy: Add HDMI configuration options
  dt-bindings: display: bridge: Add MHDP DP for i.MX8MQ
  drm: bridge: cadence: Add MHDP HDMI driver for i.MX8MQ
  dt-bindings: phy: Add Cadence HDP-TX DP PHY
  phy: cadence: Add driver for HDP-TX DisplyPort PHY
  dt-bindings: phy: Add Cadence HDP-TX HDMI PHY
  phy: cadence: Add driver for HDP-TX HDMI PHY

 .../display/bridge/cdns,mhdp-imx8mq-dp.yaml   |   59 +
 .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml |   59 +
 .../bindings/phy/cdns,hdptx-dp-phy.yaml       |   66 +
 .../bindings/phy/cdns,hdptx-hdmi-phy.yaml     |   50 +
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
 18 files changed, 4793 insertions(+), 197 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dp-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
 create mode 100644 drivers/phy/cadence/phy-cadence-hdptx-dp.c
 create mode 100644 drivers/phy/cadence/phy-cadence-hdptx-hdmi.c
 create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.34.1

