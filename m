Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124424EFE56
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 06:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18A410E098;
	Sat,  2 Apr 2022 04:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B76110E02A
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 04:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzNxtKm+Iglh9xzLdKS/blLQqykGe36fnimm5QBfD9knLx4bvA0+n3alkTveefn5cB9uVpOMuZl9G/4usAtoB0UBN4uLZ0ikzJJCtQgS7MwNZu5ixMwHJrlGY6p4jUAzChSIB8ONEYm8J+4UnqOvNghxkTbmrzgp08zXYjPAcCJ3nscEWRx2KYyepkk1Oq0gfvcv13cs4i710HmRvLn6+YGJFjX7leaKXDR8Lb5gv6sW/aroXmam1XF5K6crzNhq+FyFhZNAf33eKQzvQR98gPWKgIR+6gOGxsK/t9Fugt9TfIM8LPi716ggDiB5OoUrDw813O1PRT+Z03zUdQkGEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1GZDzO74JfSypjeNswUBQ3ccmJzfPio8vtcxiO1ca8=;
 b=gmjfhi93FSYDFsck+QC0How0z+qOjH8otwSWBF0uXKaKc+Y8/FmF0phFQEUl0PALMYNyH876ODa+QQb37cPnb4GQbS4d8slMiA5PFNEIP6Mg0N+lQfXwLjghJP7cxMM98XYFzZ07fFWxAiRhbkEdwcFkna0cVORTYM93wUnccm/ztnAFCkuuc5r/DAwa7kNSuM1KXnyLf6aJCRCEm3/KUrdxoj7sScY1rl2aWSc/TzgAOslp+Htw4SKIUkTa6nUJce3F6hvOpj70bR7z4NnzsyBH0YyALHn2Oo+h22fDyqp+XlpZXG99BAnnCItF4DjhDIM2NhBPOiJvMLiVxJt3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1GZDzO74JfSypjeNswUBQ3ccmJzfPio8vtcxiO1ca8=;
 b=S8Gyeeo2tcwfBfTVPqp9s7zKMmkuV4xlQukhD3LT8w/Xwcq1nmy4bHSWiS+eTpaKV/+I6XOE8hJktB0ypMdbERuKlo4MV7OhBcZ0P/lVkV5jt93NhLpBxci2FGwscKFa05KsYLbzqQ3Sa6Mb74Qz3XqofHXlYdehCWf5KkeHKVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3210.eurprd04.prod.outlook.com (2603:10a6:7:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 04:01:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 04:01:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY
 mode support
Date: Sat,  2 Apr 2022 12:03:20 +0800
Message-Id: <20220402040325.2465222-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfb1d0e3-c33e-40ae-7478-08da145d8651
X-MS-TrafficTypeDiagnostic: HE1PR04MB3210:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB3210E8F376F0EBB5A2D6D0EA98E39@HE1PR04MB3210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kc3zFgkXkID9s1aPmFF0+J1edjwqQSfAOeE6FFUqOtg93E+8yBj4nn8s/LIPaoTSc92Hbow7BApgcmMOCLCcXyh//63NdtIcGEl1AlKGH3VS3wv3PcdXSKHcjFtjFw7K/SmW0rlUwDoj3wg2nwS7uarKK8X5Tx3umB1n93E4BzSJkDmW3LjcAoe4M5hAcYxPlD6hJ+5QCsKNMNbFaEhy+EF/5gBnIs9Wv0OOz5cGqvmqOHTmOA/FNlh5MOKrb2zIyZ75yOqiUWXxKg8UHFuZErK4VLqFX9Lk1BtpK5F/xSS449B8qTlY8PzfNZ7uF3NysTV2e9iqqYWB251nFfKinyBQHjThKkKw9YmUbjRh/Le1TYI/+WzKNHJCxWUhIfLizHyB4tPd1IlC1vJffNHPCmJh1FY//m1LBC4TA7qoDSlIuGCLEJ7gRmmKYxNCKkO0OliQJSsQjVMN9MXkZYGIgrTzIuSilM+K9TEhWfLkmstBzVhSeJtSgrTEmQHUoAi8uUhvBj5LW4DF5xyzm+Wbh3RQ5zl5JthcOfR2jDe4Ozy66J90i6e+9oq8o3isE/HBanjng7CAXbWnUct+ZL5Pi3LNyBGdd2HcpQqJLX+N8ULZ/WBxH1wQH2j8VA5LRK7MfScPNRzpf3qQUhQELowA67QPmO+uhRAoFNTX0sGbrXUvzL5RL080Go+S54U3u9aY6qcInJcrhsee5QfCjEEcIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6512007)(186003)(26005)(2616005)(1076003)(83380400001)(4326008)(8676002)(66946007)(38350700002)(66556008)(66476007)(38100700002)(2906002)(36756003)(7416002)(5660300002)(8936002)(508600001)(52116002)(6486002)(6666004)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kXNj1ro6vehqfKBU7K3nNC4UxvuS4Jhv+tO1q4yPqpi3lnsWzMI2q29UvIro?=
 =?us-ascii?Q?SByLOz1N7M3bh96l5dpb63RYEjQ6CCKHnSi+UGTGbyJSE+XaaPzgA75FSexe?=
 =?us-ascii?Q?jDwf8QH7X9j0IAYW5syBugJhih5goiABuz831LYeKGgu4IEoIiSaFDe3J55w?=
 =?us-ascii?Q?KJWt34XH/evFZjTzOngvdwC0KQLcnMgAJqDimrXOcfAeiDrabwS++eETx27p?=
 =?us-ascii?Q?hrgBDaDkhjDkOaTeHZOuVOgvcc9PuCN2bj9pHf3tTFca4qtYeXWzpgVWTmVV?=
 =?us-ascii?Q?3LB+0/18wFsYqBNP7mjZ5KRN+2g/nfZko3o1J79gd9zDyJu5nDnDfUEQGoiH?=
 =?us-ascii?Q?bMBcXiXYq2ovq2OiQhVGmmdCnF+AGau0q0GImnr7ze1o9VgKKWbV5HGS15oO?=
 =?us-ascii?Q?6X5NA67KFj6FhhWMoIKfp2hkwB8fTMtbbn8ahTY3M2XAE3IvjafTtnN9ot2z?=
 =?us-ascii?Q?fPkHRNGoFaeKuYXlxXikAUwYgdktsOxmhhgGWDlglRfJXPCjdroyuqIZ+8LX?=
 =?us-ascii?Q?W7ePOgkhc9AF5YgSJJH0zXZ0LuZnji4ETu2IxF0ok1fFqGkJIVclVgy2Xifm?=
 =?us-ascii?Q?iA+4JsCenGjdUDA4X25Ytp4lwnRgKKZOIZ9ifIBAV94Ufx9wX2b3zvKES0fe?=
 =?us-ascii?Q?FNKSheiv7FKsHWfc/qF8J99DXEL2s4R7f4b+KSPT5i5GirazCDgTWWFRVhCC?=
 =?us-ascii?Q?FIeyN6JXgjj0OBesbpgDy4FsPCISIPQLUidU1JWmYNF9Xen9A413iMLA90GX?=
 =?us-ascii?Q?yfczp6GoNKU9aZZc8CCKAFTZAx2rEALPTWRfOQl0+vIP5eNXohKPeWuU9E8a?=
 =?us-ascii?Q?SlLhCt3SHjZWsvm65pNyp3/EevwNXQN22bTEYl1l+izEl8YueNxSbNvfe1c3?=
 =?us-ascii?Q?Yau9s5pXVDELElUfny4FQ7Y06TEVKeRMZemoWB2Np9S3m5ja4cw/AVGi+Gav?=
 =?us-ascii?Q?oudVxwjGm1mtMJhi+VULeaRm3I7f8YdCPu2QlHL3EoWH1MsBUftl2Q3RAGx8?=
 =?us-ascii?Q?HNa/R1H2rw2OAQ/jDOCdcy5G6N0G3Tu2AwXPvcah8aOrqG90sQrTmf/AzEvA?=
 =?us-ascii?Q?gEkUDdKyxbRUIMbDbj+WWMHbT4ZhayPPHrNdHmOil65rrRmzWXKifYeCrDVu?=
 =?us-ascii?Q?yKpwny/fTOSF6e3JfHK2F+bRqLTDZH+pyd9TYuEYxdi96d4y5l0tZoo5I/Fw?=
 =?us-ascii?Q?60B538E9uOWLXn1ztoHsX34xUV2saa28jNK/k4qAse2wJu8Te7hPf0R6M7ee?=
 =?us-ascii?Q?GzMTAtOdmZh8kshsDxbPDilqvTPfi/D3cbxrM5eqBwCZAe9NvxERJ9j3tQRn?=
 =?us-ascii?Q?jplwNZA6kjm9CPNEkmXgP9cMj0BAk6HXQzVyZO7hB/jwrwv8roK9OYItqP4S?=
 =?us-ascii?Q?TNpGjwnUNslHukbnCIowM0UkRlloIOp3GhNISSekXuktvAOpPEgYeIHH9foJ?=
 =?us-ascii?Q?5zcLh2QRZBdb0WFtDilITCIQf0xAmyXSQfGMgm3Mbs4ABXIfboqs6rMnghAL?=
 =?us-ascii?Q?wDeXQYoBhluoq1JXHV5Baa1+QrKRTDewGAXaUZASAQVFqtzJb6FVNgtZqFqO?=
 =?us-ascii?Q?bgPyvcIY//DHRGUgkXoJTt3IeopQv4wkSanvezHRy7DQX/e0fEiRCsT0aoPd?=
 =?us-ascii?Q?AMzRGe1ee/RUxM8SPqTJsG5/1+6wWmB1GkgMKJntdsLStMu/XwXpRgkTpt1D?=
 =?us-ascii?Q?8FzENZVRBybkif/CS6p4hmhrZUl9OG+TjjO3PlCWUJUYgIQCereB0NnHUd7I?=
 =?us-ascii?Q?CpInABAdKw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb1d0e3-c33e-40ae-7478-08da145d8651
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 04:01:55.0282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6aE0/UV172SA94eQ+C5kns2Q72F/Sli8T9sq7WEAi3GHhNNKWpbMwPn4MEaau/j1Y2auXSoXkWwvx/e4GHsvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3210
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the v6 series to add i.MX8qxp LVDS PHY mode support for the Mixel
PHY in the Freescale i.MX8qxp SoC.  Comparing to v5, this version only
rebases the series upon v5.17-rc1.

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
 .../phy/freescale/phy-fsl-imx8-mipi-dphy.c    | 269 +++++++++++++++++-
 include/linux/phy/phy-lvds.h                  |  32 +++
 include/linux/phy/phy.h                       |   4 +
 6 files changed, 407 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.25.1

