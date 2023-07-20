Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF3575A75A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3070610E564;
	Thu, 20 Jul 2023 07:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1B810E564
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVfe2O7T2bZMj20KK+9oaMJZ0GWcTNK8OVt6kT4JMLgy5j5P/gEUFT5SU2IE4kmXpxpJVKrI5skNwL9g91BKrnqGwqfDA4QpQC6TlbPU8Rf17DdEqDW5ssdMJMuez8g8GAf/dZDR9wC9eJkYMtP4PxrL4bMYHEeUatdCMP0K6swEqey6lHoyoOSOU5z9ChwtKa+H4jXHuv6e2pzqRfzXO0Fr6VYlRw/17M6IMUiIsBE6EJwlLIwDEhB0EY6Xob6NgZSI38nmVh8uCMv57zSTYHp72DlW6UVn0V8MggdUklw5c94Zbxbfd5qswU0f1N8B7G/1tntZXrKh2ih8AjXisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTikT+lLOdcAIu+1OgkQFehZiVXaH14sjKWwZMk6FwE=;
 b=gWKDmWnDa21kCd3cnUCZ/Ug94xLXwgzsfgbeWnJAGttiHyqCgGbtzyLuLy85WcAApOpPvypydnOEU9xx4rWoAYwn+XmNp+ZBTuICptncUmY/b5oC69hNgGaUT2QoMLfRGWMm+Y50QX7jd3SzqluCgwoqxBC9XMKANZvi5YJzaw2K4xGXJFYhP4b4Zo0+MICA63WWrbp6RPLVHuXCzwGJpGGIMHCnWjT8VYkuu+K3BvBsZT6cbu0DdRiVDFN9jz/JYPjpHLIjyRrSnW4lK6cGeWs9Y/WAn1/Fe9FsxX1vyUec7uM5oFYGe3ipbOfK7V5AVhqW69p3cJRp2xabF25v7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTikT+lLOdcAIu+1OgkQFehZiVXaH14sjKWwZMk6FwE=;
 b=Gw1nmM2NXyeAxj/8A7KI3iuda6wgJ8P2+f6dRQqUtwnq6rXT0t+5eS2wzAhkToFXvzS9KqygedDIID+ZiAG47lQjCpCgel01yO0UQNPII4QQ4G2nY1Mhzu+QpmRsSRX1Kmcw3sn97et27HaG/uU/shZ52nuPYHCOarVLhlSsMkA=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8307.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 07:09:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 07:09:47 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Topic: [PATCH v2 0/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Index: Adm62SsbW7tBlN2lJUmtK7I8QFCDJA==
Date: Thu, 20 Jul 2023 07:09:47 +0000
Message-ID: <20230720071430.259892-1-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
x-mailer: git-send-email 2.37.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM9PR04MB8307:EE_
x-ms-office365-filtering-correlation-id: f4a069a8-d882-4126-f68d-08db88f04d9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BUktiwZfd9/2Dgh2G9ujh6HKzNotC/mw//BHbQAs91wc+7r+yzgB+un44RemrsKj2wTdhs19f0Sry4DC32HSZ7xSADHdto+0fTuh+IykNFNkOgCozPl50DtnhyQi+nARlOzzpcqYBu2gO5mPGXGEDLZKpCoQBdM4+ajNwyJiGCk4TJEIvyIB/T50nfYLk5Urc/22wH6knoIIp7cUxdDo872BaiVeTxeDWNXLzKGAlMEagRFOLc4+cDgO1s0nrKEltUnAscLze4D2m6KIv1mDvn3kTdaBr4I08Rye92FzHSfVAPAJuOEESl8kuS1fD46/jRpa7NixbVJ2vf3SDK/ohzbvAFoLgVVGUIv4Qjofb5MYiDR7QXzY2FHPvD7kKXuOTBnqYCsc0is2gtsptj98QRZ5xeFeH3ggmMfh+Vf5t+AMjmACm0ilYdQW9dA+zuu+cTDGsgT6lDbKiIegEwyGgXkkI0SOy5qm9bNq382nsOR8QFhlLYQKeNxhbLaL+VgPy73crmXlKqWalP2+DgITHBmGMeY1oigwxEFPPFSJzXbfV8crPEd7ILUl+l/7IJW29+sbJrf2FQabOGaq826aGlhtTAnCj49Y2EIVY7YdXjLLvPrfgIc7jufU2Ur1x0Kf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(86362001)(478600001)(83380400001)(1076003)(38100700002)(186003)(41300700001)(26005)(71200400001)(110136005)(54906003)(8936002)(8676002)(7416002)(316002)(2906002)(122000001)(4326008)(36756003)(6512007)(66556008)(64756008)(66946007)(6486002)(66476007)(66446008)(6506007)(2616005)(52116002)(38350700002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?9q1BglqgYTZDPVn8wxZpgkN/SSrgH9sJgr+oDy0VQy6akjjzxSpOSgwuQt?=
 =?iso-8859-1?Q?YEV4LniYa6uvlWAiUN+Dpdrjp7NSC7YOeNkSKQoRefuRZLZA2GxAM3dGE2?=
 =?iso-8859-1?Q?cFmxXcRQhOr0+LjaShqzT7Wl2Glyv3XqEstZJgAxc5ZDmy/F0++OrdTmyY?=
 =?iso-8859-1?Q?0rVhgX8tn3EZGCFvfYZaoYN2w+DP+Jb4xzPQnb5p67Y8vp2Rn1BKSuMW9C?=
 =?iso-8859-1?Q?UCE8RaUhj5H+pqzSC1gvXlbtMoLsa0shaaFE9sdmd3TWREIiUvsIuM3QOY?=
 =?iso-8859-1?Q?lmrJim/iLfXdKfibWooxz1D0BdTRYCDIZR8Mz+Aug3kIjcyVKGYoxKHtDv?=
 =?iso-8859-1?Q?HCS4uaBwybhRS7IeRoVTjDYeA1TbowwhFhFB+tOH3mb66rRdtKNbiTUh/j?=
 =?iso-8859-1?Q?UjQLmPU2BzCGkSVTMfnBWyHN44AcHP+uo3vVt9uleG1wO/0bYaDTHtcn26?=
 =?iso-8859-1?Q?IlCRO68nSR3R3L+mqCxbbM2gs59Zd7MfuzhX32HAdLHTYrxpA+0nEqJ5Bb?=
 =?iso-8859-1?Q?l0fM+/Yg5X8VsoKfVvlKf6hbT/sJHyM6FxADpIzwWo1uGXtUMbhEWDNnoq?=
 =?iso-8859-1?Q?39nYv+dBhPrSZoK2EeuuD0OV6W+LKlG8SuNXa2BuaZAT+6gYQnov4p242R?=
 =?iso-8859-1?Q?7BSZz4wCT6Pxq2UtZCxMr1fASgoyWh6Sf3RR3XWSnBeI3mEclTvLArQb8Y?=
 =?iso-8859-1?Q?1+NHfyLINLfYYdpPKYSUdNIBCApPZDJS3lhYocO5eV37Bd6OCY6n7z/YGa?=
 =?iso-8859-1?Q?p3/Ls12hA3FV9SesS8y7gsYoCRhG0UdD2220ITGGhECImylHzWsdGXOlu1?=
 =?iso-8859-1?Q?bps5K4l/KExrL0gU7bHv+8YItZ77kvYEFIDjFpuPt+l+PnXtJhiXe7aWaJ?=
 =?iso-8859-1?Q?9uZUWepXBS+iUcgqbIV+fPpj6s2VbOpTWE2RpjjNy/3PMWC871UifcoHwW?=
 =?iso-8859-1?Q?9Oj90wmur2bDSI8wITr0LixjQR7qeoKQXUKoDhtPVArNEyBTPROcYIDHmw?=
 =?iso-8859-1?Q?sDiDToyxWJOLH13GLNhM30OooOOUHo20wYwlc2KgnjG0ZH27t39yJII/uV?=
 =?iso-8859-1?Q?cm3TkX/FNprndnzW1m/0OOSy/1F2CzXo3jT26bL0/Swllra7akOr/KMFjg?=
 =?iso-8859-1?Q?YvlGsK/SUmg4CFtVDsNSH7NR12OUJgg9fbchqrT+UrIp42udWAtgaFCAzI?=
 =?iso-8859-1?Q?FQ6fgxWy9TtWwfUAH2lYYI+tc4NBQzdC8NhHQ9tFBC2CSvtF6ahFgEVBYu?=
 =?iso-8859-1?Q?A05CLlswg4K5/3vUBL7i27W1JhX93OsVAjERHc3u19MKg8fQxvJVNMqJek?=
 =?iso-8859-1?Q?nLpmCMdMnbCan/R46tHjX31izCLGWsxKjhwiXMDFWzmnvYoEoqE6JLDus4?=
 =?iso-8859-1?Q?5SHxe+ajmtOLzy2BsRoIwcrmRBTsmJx+Xl4NOTr0dAVWI8huU67ubEt7UP?=
 =?iso-8859-1?Q?aClAhM3cEiwXMWcapYNdQyVEPCPlPWyIF12vCUT6eo1KPXyTC+rW5KgjxA?=
 =?iso-8859-1?Q?fRXMtl3J22zEFdEDfPJtwqgy0cgd3yhraCAghb4MUoTqrbWQcOXZjFA2Of?=
 =?iso-8859-1?Q?+gjJC2zCqVtpmrTyxLvJhTiepwOMZFgDB7cBiKHhQWFnyGg+meBknDRevy?=
 =?iso-8859-1?Q?nLYDeTm9BAeZTFXQJaH12pGjoso1++84LW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a069a8-d882-4126-f68d-08db88f04d9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 07:09:47.8689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Qcz9C40WP9mnaMgeQCtQ+xJ4QQ7aiVT34r0bKJXl8csIUNGpv961W8gRWXuKbw1h7clOMR9hcyYHK2zm2mkYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8307
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
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

Patch 1 ~ 7 do preparation work for adding i.MX93 MIPI DSI DRM bridge drive=
r.

Patch 8 adds DT-binding documentation for i.MX93 MIPI DSI.

Patch 9 adds i.MX93 MIPI DSI DRM bridge.

v1->v2:
* Add Rob's R-b tag on patch 8.
* Use dev_err_probe() to replace DRM_DEV_ERROR() in patch 9.  (Sam and Alex=
ander)
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
 drivers/gpu/drm/bridge/imx/Kconfig            |  10 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c   | 917 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  91 +-
 include/drm/bridge/dw_mipi_dsi.h              |  16 +
 6 files changed, 1146 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,im=
x93-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c

--=20
2.37.1

