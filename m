Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA447821DC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 05:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656B310E16F;
	Mon, 21 Aug 2023 03:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2060.outbound.protection.outlook.com [40.107.6.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3CA10E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 03:36:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zn8F1uaiBjdbkVhMv/sBNqzFJsGimYf85ioxBbL642QJv4CS9UZrkM0k5ucOwGIvq3h7JjCtOL7qV7SrZ4kw0TvL1UOYMR0caOcdvW34MTj0DI5kNQ7kASfmvaiPFom50o673bqaREuGy3aBrH9N6G333jB9v4zig4qK+pyunjcrV+mrNC60xH2v3sjZCfF4K1VvFapQRLDm91429N7XpagURjqItTv9sIPHGhnPtHVFGcfWgFnA9wjFmeNjDfSJ09d0pr3dBAJXhuG+09RJFTHR9wDYnxRZ0v5bWj3WP9YZQ6Br9CiUEB4QlcvOYbieI1ucEo8Waod3jI4Mn6KTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bhD1OyOCk/b7xDxt1Sh/+n1tKYgcSDjTVOJ/0h9TnU=;
 b=ApsS6AZihdiT125Kfo/J9KE+alk4ulVakvvNPIXgT/55XsP+cISDi6/DTmPRv0rWeQhkoHr43P5ziH/A6fc9zNvpozKR1pVRM3/60orMofCZaaDyCMx0wX+f7K/f3uCc+3g86pb8VFtXwlfuQXjqH4PK/Mok846BZ//NJhvDdDyek4GixHYXXjYc2lcizNOloYNNi8HoRbqE/R2l9ASCWkd7KMkXTZH2Z5RO767+glY7wzTASuFA4LwSBygyJ6jLX1PkgF4W7nyFWfzyXaEfa902Ny7guGTENV/zeRuplXPetAdPPJlBT9YloCPZlIUG0BV2zETmW5mFGCPtE7iuIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bhD1OyOCk/b7xDxt1Sh/+n1tKYgcSDjTVOJ/0h9TnU=;
 b=B38AK5OoTcwLJ0eZYJfmvC49kwM7vj+ccj2uplv6pBlMEfi7N3RIa6vL2tFyxFOMgRJXd6cVTPFBaLKv842tXq943IyWQWnd5ca5jPYTAGLMg4TUiQkOZwOUInoihWptYq8G4sihYTU8hqFzOUgg3TADfZDaEpi77+ZoxoKKmRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7758.eurprd04.prod.outlook.com (2603:10a6:102:c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 03:36:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 03:36:42 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 RESEND 0/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Date: Mon, 21 Aug 2023 11:39:59 +0800
Message-Id: <20230821034008.3876938-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 457c5798-8a49-4f74-c020-08dba1f7d5a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GW0jEmyJiOBXvkubE3AmAz5CSKr8r1AkdLJrW9bmbLomT4WbnB6lrjXoHSTzA3SqXylUyQkYKHvt40HoPXVaEpBYSZt29Rlv4CYToVS+qR+uz6YGsTrWFO/VoCtC3cjcJK6deZ6unEO48rO4e8WDKRWKC2ezY3OZIugrjWt+/iHXVC8vzf3umoS771hqyOkg3ybiHRaDWO684K/3yMuboXN5OI3v5UibNWC8cgnS+d1NaO8R8ZrPlLqALmDSdWJoVDQRklbooCVTUD1mMDF26bYy0pvGM8Dy4zaEVhFbOYEbQ6ZWHSirr7wENeyXx7vHk/pmpriQ5BGaaU0O2TvHpjk2zZAk9ygJPfMw1fGi0lEIawABWAYOpV90aS8+CU0pnAtEoOD/a/ICQ5VPUg960Oqh7/Pe626gJ1kbkUwPPSuC+PQaXXGKnn7NxxV+fH8gW150HWg4BIXM1klYWK/lA8VQ3APSI8LCWEU6SNNN9TD2yAmHnXn1s2Q5CtjzT4VLz+ZYo4ng1dIQ1Wxmj+diSaZlu5oqfiSlJfyS275oBSmfNYp5IST/T6UeKBqx6wxVzUE8yuLwK9sk8fKtaGJlyCWrP7aq7bn0UW0WwohWlaK1lmWAtsKQHY3qGG/Mgd4J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(186009)(1800799009)(451199024)(1076003)(2616005)(26005)(6512007)(38350700002)(38100700002)(36756003)(86362001)(83380400001)(316002)(8936002)(8676002)(41300700001)(66476007)(66556008)(66946007)(2906002)(4326008)(478600001)(7416002)(6506007)(6486002)(6666004)(52116002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QrWdUlQ0vTNALiNJWMiJ+RnLFALido9kbq/NnKdW23Cs/pRGgEEvgtz+4+2u?=
 =?us-ascii?Q?jFHHuJWweh0zXCdLqhhug7tc+raIeZnYGyFthBYwayzJ63NVC8F0j1R1gxxA?=
 =?us-ascii?Q?7GMVdsKDH5szgU0wvHZliVwdcFBZPM82fBlGQfOiZFy1aZMieksHJvpN0qBW?=
 =?us-ascii?Q?5gZ84ZlHZzWD6gP/qZTysCycV2P2hIiUtaIUWdT1tt2W2uAF/QDrp4BiENJE?=
 =?us-ascii?Q?ahd84SdiOsGSuOm29IzUaoxObHliwCvLb8tT0kjLajdM8Vh+dvp/00MWL0Et?=
 =?us-ascii?Q?YXbK9cgqj+fC3sqbm5rZJ0GdZCXv3FCPwTnVVlZT2noSTLamXzpluOw8KKOL?=
 =?us-ascii?Q?v5pdrGPYazV8BjmoL9m3eqoqNyT8hvBrQfT1nTPXuOscrHlrWACrDRMdzQ4U?=
 =?us-ascii?Q?KMngr/DVbKJyBGkKVLQubEThPhgxvFSPAQTGNVZhnq7IxRGbRvkjQUGM6E9q?=
 =?us-ascii?Q?he8H2XC53amagj221pAJDW3Fs5MHg0mtXLI84ewUT6+Ua9ZKkPhveqe3Bp34?=
 =?us-ascii?Q?bODh4L6RpYVBK1UapVJeTCIX1skkMnJl5AldzCElB6bNTCWabjZwqrY1fwXk?=
 =?us-ascii?Q?WHlH3S6YmLkUkBYoY/ZnAo+nlyu5SH1RJusDfGB2oR+iZgYJ6dev8/lMXQB/?=
 =?us-ascii?Q?+4QCiXtbzpiOmoxnIyuSamM33CgCPsndiObcsCOhE/nhdWGanJfJHRozUW31?=
 =?us-ascii?Q?cP9MWMRIfL6E5Xce2tWQh/gXMrRGpOvQOt3DjW6weegFinHNES15XVJCDsEO?=
 =?us-ascii?Q?vXOZKWDcPv39vJXvppnsZz6iXcT1JfShNxu2mOvv2IQ6UBFdc16n9F6rowem?=
 =?us-ascii?Q?IlKX/TUMcCQB8k8S7NB5dptlhRQixF1x1dbalBBAZyhEma03ooRRfSih2+ay?=
 =?us-ascii?Q?Ofwtsj0BWkrFBEBCG6CRaLQ6EiOoA2YD434qtpoGnvBnq/vuIG99rCTtiA3l?=
 =?us-ascii?Q?7ub4GPFRCJ4LIL/kbOif6cJsXjdvO9AZP+rVPszo465t3XgzsRpT98vnt8Fg?=
 =?us-ascii?Q?VzSjDURZbWg7T1Hsp+JQQKXsFZf1VCf4XYLevfrwlnh53CYXwn1W65Kqdcmm?=
 =?us-ascii?Q?mW8dAZC3+HhGP8tt461+tzg04V9+H1f2qQqfuqXwq4X6Z25JBiWEn6QL2ts1?=
 =?us-ascii?Q?KFkM2CXUxgGMGeSljrlrBi77NbVwjJRGb9UVlxw/6pD5JJTNmrx4/9JfuFC2?=
 =?us-ascii?Q?23hKkTBN0RMf25DqMTLQTUt+yu9Ly2mFseITle0wAEjbZW7hMouiv01Xx3EG?=
 =?us-ascii?Q?aqxrnCtdSStTACxvkxzDaWdIVNnXSv1ON2f6hvSKzroATeP7yc/b7L3s9A1E?=
 =?us-ascii?Q?BBq8xb7MF++HSkdPM0C7z1o2MGsyapqTCthmU9hW7JkABOq/l97zU2hGDhJN?=
 =?us-ascii?Q?bC+4T1TtdrB/NJmk2A5Ty4F8yEXM0Sp9Z4SJuc8uqTf4Xk4h3Bk3Fh8VD7tu?=
 =?us-ascii?Q?EjCuroMHUD7izitAOe3moA7nydGVQTmVZVPACjvlbnghiz5qO2pQL2ay2Lut?=
 =?us-ascii?Q?GwkkMS5LSo7g/pkCHncqoIF4e0JC+fkGtFC+ZAXEygDRjjHsSco1/6a9Xm6D?=
 =?us-ascii?Q?IaM0z9AQwb5YGbenB+MmE6PLCCZzQyIlvgCg4Gx1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457c5798-8a49-4f74-c020-08dba1f7d5a3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 03:36:41.9069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJ772wq5VXKf9zwvbiLuHdIWEzufqgH56pLBlPWvBt3Qf1GXkPUXz2lp60rnX7Oqt/CWLwBJMvk+BvNCUoahnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7758
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 zyw@rock-chips.com, rfoss@kernel.org, sam@ravnborg.org,
 raphael.gallais-pou@foss.st.com, jernej.skrabec@gmail.com,
 jagan@amarulasolutions.com, linux-imx@nxp.com, conor+dt@kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yannick.fertre@foss.st.com,
 hjc@rock-chips.com, philippe.cornu@foss.st.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series aims to add MIPI DSI support for Freescale i.MX93 SoC.

There is a Synopsys DesignWare MIPI DSI host controller and a Synopsys
Designware MIPI DPHY embedded in i.MX93.  Some configurations and
extensions to them are controlled by i.MX93 media blk-ctrl.

Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
bridge helpers and implementing i.MX93 MIPI DSI specific extensions.

Note that since this series touches the dw-mipi-dsi driver, tests are
needed to be done for meson, rockchip and stm.

Patch 1 ~ 7 do preparation work for adding i.MX93 MIPI DSI DRM bridge driver.

Patch 8 adds DT-binding documentation for i.MX93 MIPI DSI.

Patch 9 adds i.MX93 MIPI DSI DRM bridge.

v2->v3:
* Add Neil's R-b tags from v1 on patch 5/6/7.
* Select GENERIC_PHY to fix Kconfig warning for GENERIC_PHY_MIPI_DPHY
  dependency in patch 9.
* Cc stm and rockchip folks.
* Resend based on the latest drm-misc-next.

v1->v2:
* Add Rob's R-b tag on patch 8.
* Use dev_err_probe() to replace DRM_DEV_ERROR() in patch 9.  (Sam and Alexander)
* Use dev_*() to replace DRM_*() in patch 9.  (Sam)
* Fix build for arm architecture in patch 9.
  (Reported-by: kernel test robot <lkp@intel.com>)
* Improve error messages for imx93_dsi_phy_init() in patch 9.

Liu Ying (9):
  drm/bridge: synopsys: dw-mipi-dsi: Add dw_mipi_dsi_get_bridge() helper
  drm/bridge: synopsys: dw-mipi-dsi: Add input bus format negotiation
    support
  drm/bridge: synopsys: dw-mipi-dsi: Force input bus flags
  drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup support
  drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate
    lbcc
  drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane byte clock cycles
    for HSA and HBP
  drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and LPRX timeout check
  dt-bindings: display: bridge: Document Freescale i.MX93 MIPI DSI
  drm/bridge: imx: Add i.MX93 MIPI DSI support

 .../display/bridge/fsl,imx93-mipi-dsi.yaml    | 115 +++
 drivers/gpu/drm/bridge/imx/Kconfig            |  11 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c   | 917 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  91 +-
 include/drm/bridge/dw_mipi_dsi.h              |  16 +
 6 files changed, 1147 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c

 base-commit: 25205087df1ffe06ccea9302944ed1f77dc68c6f

-- 
2.37.1

