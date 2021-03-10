Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0377333396F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 11:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F86B6E303;
	Wed, 10 Mar 2021 10:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130052.outbound.protection.outlook.com [40.107.13.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA7C6E303
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 10:09:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUb9W/LOzmEjidXweTqypkoi/Nq+Ns7JZ3Sm/QiH1HK44JuGDaJHYNYJz43A+T8TpOgvtNicSThWH2dujfkSwCevKcb9Pg58dgpyUIIyBWaEEC1iddhjM3ZF7DMTKs64+n0VOMusYUtHuuDp4gG9ZHiypb3SUeewXO1JlqK+ThoXYhuGnFclkFNaftHIQz6rJ7uN4A5Li1Q+l38AmiwYTLhIlaA4ylOdcmtj7fRv68UIDPXAQAZ1KuZCOpr/5KrdbUnqbUCM7SRBj+4kEWTZgpJYLAzeSzTC/LI1HeB4y52WhbHh+qZwWkO+7uAAv/86GRJC5rTJlCvzNrTNi5N9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwwtrOIhnNZ1OcZd69TbVCOxPkqpkcuWcJr8omph3Sc=;
 b=Ra6/Hm+OK0IXDRRWAoiYiQHU/ARvgayAZv5wU4NYh2XEwSWQ6AFZbfSguIQBV80t/ROmf7TRtTc+OqBTnwc+Qvfma8QVoeAmHiISCh5I18iUOxCDld33tCSCs0lwpQ5kDc4eL4l7fbolNb7kMufvDHRP+S1nAW6nd0UEXx2goRRjRFtyW1gli7nErCdpaoRplLeQpqBDCTjMv5EYneSLD2xf0HqC3ZZvqn2Z8ATV4N9YR+qE/6LXMMBIHPVUBqgOzHvTXpE2ra6ejnIb0fdHjceYs8oXDhl63bXsWmokz9el5d1H/Q7FsNaqtEU8787EPowlRscor2NzdZ6H/8vK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwwtrOIhnNZ1OcZd69TbVCOxPkqpkcuWcJr8omph3Sc=;
 b=DndL7iuuH0zcS61D+hV0h6u/vqrJWsIFCxOkKfQF3Uj9jvw8dV1Ra2de1PXeg/0QjY5c8S8Dx6SZR0n3+lX7ysm/4waPtAG5pCLU6/r98uKf+tDd7xL9peQrV+m5Y0yd93+klo6bDEpzuI89N7CH1Y4/3ESjzel4OCPnfGl+/nU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2318.eurprd04.prod.outlook.com (2603:10a6:800:27::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 10:08:57 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:08:57 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v5 00/14] Add some DRM bridge drivers support for i.MX8qm/qxp
 SoCs
Date: Wed, 10 Mar 2021 17:55:24 +0800
Message-Id: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:202:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:08:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d3612e21-d246-4bbc-bc66-08d8e3ac84a7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2318B15E9ABC97B1FD57048998919@VI1PR0401MB2318.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hGB78jFM+9XHjZJgtVjxvbHM9HQZCuNLah1C4V4QrRWhDOO6DnauvEfHb0yBujPhUfjQZ88cWS2KGBpspsv9ZOCbVHVjnvI0g1rREdm43NxM8jYGKIQ59+so5HnElanGdgtG4eokahz3qroXnYk5U5I7LtVWJD4buYGcOl8Vd8h2sQxGImsm1LTYGb8mziL8lteuiFyJTn5vbczYDkiOT+QdpJTVzrBweZQIcX/Nf4U1vEOwlushxnINMjfHtctIi4Ek/q8hVaPk+apdMa5PeHGPYAI1XiHWFRJilkqQwSK9N8fAh8bO1X7AZ5A816JhidGvlfT1SHOxPZ7R4nD4s/hB98baeGUcdAa8rj2JtNWuYPL1VZzcFzOnCffUvlfz7T496RxB/LrXzpsqnkL7OF9TZ7yfFoGNLRd9S4yXyII/V/D1+mPg84/be54Bsx8fG58YeyW4377Q8ndQFXMM80JLxY64kqjJ/0CNBTx+P4I7Fh3+l0wSKOrzIJZWfFNpEBH9bZjsXeHtWG+kIjhdpQA/lZUu0bwpbec5QBZ0whYLZyPFiQ0OvVcFWis0e5zKbxNX2XWRSr8JX+HV9ah4sGz1r9HOGW5by1z12JquAlkNXfBIltPI606eN7r9qL7lDn+h1DaJ/an3iLIogoIrqVorg2+CLqo/IFEnZVaHkjw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(6666004)(66476007)(83380400001)(66556008)(8936002)(6512007)(966005)(2616005)(36756003)(6506007)(316002)(66946007)(69590400012)(956004)(4326008)(86362001)(16526019)(5660300002)(478600001)(8676002)(2906002)(52116002)(6486002)(186003)(7416002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qq+Q0PIe+0rzE55E1k67N2TOo0biPYIW4AJXZBPjV1HqH/Y8GcKVxN9YqP6E?=
 =?us-ascii?Q?fK8PmNmlzI3A6H5gaHFuFTii1XQ7PCNsy91xECgMYa4zylGmI5YVSn4Ce2Hy?=
 =?us-ascii?Q?M1Piyc6o3Ppxq6UvENOYahuXboeYCN2N07GTp1RkI8TGlyQtvsqqgblohnqn?=
 =?us-ascii?Q?f4XiplaZq5lM9M9Ed6GBVr/CsRBSqwvYKPNhM0lls9ikKD3R/pTLGfv8Nguh?=
 =?us-ascii?Q?q7u4/9p+c3ABCtmBIjQ3vLC4OW4W8ttO71ZvpClidttatM/juvli0/6+iCb8?=
 =?us-ascii?Q?Uo/xSGiRE5Jgs/7LSwqDKOVZWUTstv0d73dTiKHu3OLiQrHI6oxtkXFX7ydT?=
 =?us-ascii?Q?OSNpcFkukKsO9MdPmYim2QmRzKtDeuBedEOsLLexlhWVpqhXTNNZpQf8ViYR?=
 =?us-ascii?Q?KVZ+ssed6ZThB4SIfTxUcolGYn0ajbHf+tPd3vkjHvyuC9tPH5Dtz/bKNljI?=
 =?us-ascii?Q?qoXNixlTIBBkRwrowOGM/MaDCDv4InDE5SwKFfT6VM8z36GPDweWGk8xaZxu?=
 =?us-ascii?Q?un+nX0JG4mJisGX4gqXPihiLPBvfHsSslL4nGrBt6KJ+ZY+DP8A00tkI32Ut?=
 =?us-ascii?Q?lz1ngIsi/kN9jqDkpe7aZSoGnEB0tiE36TEs5b1tjF83WcMzwBlUCSvv5o5s?=
 =?us-ascii?Q?1i3vBuOOr+xhw7hSDt9GMPyHhOEZkjb71yiQbHnS1oKLOmff/VzYH5OHTKSn?=
 =?us-ascii?Q?aLOnDZNO0oUJvXuj/eLDG7WC2lgiLhsSUXixqhJ2wSYBEBJBNZ7a3kmjQMjW?=
 =?us-ascii?Q?IjucdGavOVzk2cwr72/n/4RST4DIGbpgDV65GIcx+Rtw/PZ9Ah4PlEVr+BuJ?=
 =?us-ascii?Q?GtYKuNN35yVM8v/byAfDCEN/YQXsnyELYfmniNxzZ9gMyPeVmQ+IGBoHzDT2?=
 =?us-ascii?Q?4Q5AgvEDpERuT/Q48jPKwt0OiGqQ2zlFh/RX5GxcjybgKgqCtCEPoFZQC/uV?=
 =?us-ascii?Q?vdM/SThZPTW/GA7sTXwCuBUx04BH7o6UDROCIwX+SUSic8rk16TM0tQEO4NV?=
 =?us-ascii?Q?BnAdxPisSjv2xm7YpsisOhQ/iegT96IbmoXc7zlEmYZGDsyX1x6u/mRzfuFY?=
 =?us-ascii?Q?W/dKdVuHzLiqsVGnJ4ojy5GgCz1+Gb0KQ4qhJQoczwKUGF+HIRxMYiVXtA04?=
 =?us-ascii?Q?CNf52yrPbWFwWfATZZ3v1gWPEXgBB2X7YUkU+YUfR64QpOoOqpPSchYUuLUJ?=
 =?us-ascii?Q?mc3NcNXvDWdjxqU69utLHLCYt1dNTw4VI5md2hcEjd6ckquwDWbPI/bSQsGd?=
 =?us-ascii?Q?ECzOLM7i3Z12bC1uAABnKK6MwwGvfxl/jiws62AobVA/MSht9M9SlAZvxPYr?=
 =?us-ascii?Q?U963V86aRjTfZSFcmR65PkdW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3612e21-d246-4bbc-bc66-08d8e3ac84a7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:08:57.6718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJBF+DGVAAhGD64QJECgnXz9qDX9JybgAMc7dPonJJR3dVdCINtxdfjWFRMg3CUENKSW8L6OEuZseRAnGFLQKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2318
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, lee.jones@linaro.org, mchehab@kernel.org,
 shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the v5 series to add some DRM bridge drivers support
for i.MX8qm/qxp SoCs.

The bridges may chain one by one to form display pipes to support
LVDS displays.  The relevant display controller is DPU embedded in
i.MX8qm/qxp SoCs.

The DPU KMS driver can be found at:
https://www.spinics.net/lists/arm-kernel/msg878542.html

This series supports the following display pipes:
1) i.MX8qxp:
prefetch eng -> DPU -> pixel combiner -> pixel link ->
pixel link to DPI(PXL2DPI) -> LVDS display bridge(LDB)

2) i.MX8qm:
prefetch eng -> DPU -> pixel combiner -> pixel link -> LVDS display bridge(LDB)


This series drops the patch 'phy: Add LVDS configuration options', as suggested
by Robert Foss, because it has already been sent with the following series to
add Mixel combo PHY found in i.MX8qxp:
https://www.spinics.net/lists/arm-kernel/msg879957.html

So, this version depends on that series.


Patch 1/14 and 2/14 add bus formats used by PXL2DPI.

Patch 7/14 adds dt-binding for Control and Status Registers module(a syscon
used by PXL2DPI and LDB), which references the PXL2DPI and LDB schemas.

Patch 10/14 adds a helper for LDB bridge drivers.

Patch 3/14 ~ 6/14, 8/14, 9/14 and 11/14 ~ 13/14 add drm bridge drivers and
dt-bindings support for the bridges.

Patch 14/14 updates MAINTAINERS.


I've tested this series with a koe,tx26d202vm0bwa dual link LVDS panel and
a LVDS to HDMI bridge(with a downstream drm bridge driver).


Welcome comments, thanks.

v4->v5:
* Drop the patch 'phy: Add LVDS configuration options'. (Robert)
* Add Robert's R-b tags on patch 1/14, 2/14, 4/14 and 6/14.
* Drop the 'PC_BUF_PARA_REG' register definition from the pixel combiner bridge
  driver(patch 4/14). (Robert)
* Make a comment occupy a line in the pixel link bridge driver(patch 6/14).
  (Robert)
* Introduce a new patch(patch 7/14) to add dt-binding for Control and Status
  Registers module. (Rob)
* Make imx-ldb-helper be a pure object to be linked with i.MX8qxp LDB bridge
  driver and i.MX8qm LDB bridge driver, instead of a module.  Correspondingly,
  rename 'imx8{qm, qxp}-ldb.c' to 'imx8{qm, qxp}-ldb-drv.c'. (Robert)
* Move 'imx_ldb_helper.h' to 'drivers/gpu/drm/bridge/imx/imx-ldb-helper.h'.
  (Robert)
* s/__FSL_IMX_LDB__/__IMX_LDB_HELPER__/  for 'imx-ldb-helper.h'.

v3->v4:
* Use 'fsl,sc-resource' DT property to get the SCU resource ID associated with
  the PXL2DPI instance instead of using alias ID. (Rob)
* Add Rob's R-b tag on patch 11/14.

v2->v3:
* Drop 'fsl,syscon' DT properties from fsl,imx8qxp-ldb.yaml and
  fsl,imx8qxp-pxl2dpi.yaml. (Rob)
* Mention the CSR module controls LDB and PXL2DPI in fsl,imx8qxp-ldb.yaml and
  fsl,imx8qxp-pxl2dpi.yaml.
* Call syscon_node_to_regmap() to get regmaps from LDB bridge helper driver
  and PXL2DPI bridger driver instead of syscon_regmap_lookup_by_phandle().
* Drop two macros from pixel link bridge driver which help define functions
  and define them directly.
* Properly disable all pixel link controls to POR value by calling
  imx8qxp_pixel_link_disable_all_controls() from
  imx8qxp_pixel_link_bridge_probe().
* Add Rob's R-b tags on patch 4/14 and 6/14.

v1->v2:
* Rebase the series upon the latest drm-misc-next branch(5.11-rc2 based).
* Use graph schema in the dt-bindings of the bridges. (Laurent)
* Require all four pixel link output ports in fsl,imx8qxp-pixel-link.yaml.
  (Laurent)
* Side note i.MX8qm/qxp LDB official name 'pixel mapper' in fsl,imx8qxp-ldb.yaml.
  (Laurent)
* Mention pixel link is accessed via SCU firmware in fsl,imx8qxp-pixel-link.yaml.
  (Rob)
* Use enum instead of oneOf + const for the reg property of pixel combiner
  channels in fsl,imx8qxp-pixel-combiner.yaml. (Rob)
* Rewrite the function to find the next bridge in pixel link bridge driver
  by properly using OF APIs and dropping unnecessary DT validation. (Rob)
* Drop unnecessary port availability check in i.MX8qxp pixel link to DPI
  bridge driver.
* Drop unnecessary DT validation from i.MX8qxp LDB bridge driver.
* Use of_graph_get_endpoint_by_regs() and of_graph_get_remote_endpoint() to
  get the input remote endpoint in imx8qxp_ldb_set_di_id() of i.MX8qxp LDB
  bridge driver.
* Avoid using companion_port OF node after putting it in
  imx8qxp_ldb_parse_dt_companion() of i.MX8qxp LDB bridge driver.
* Drop unnecessary check for maximum available LDB channels from
  i.MX8qm LDB bridge driver.
* Mention i.MX8qm/qxp LDB official name 'pixel mapper' in i.MX8qm/qxp LDB
  bridge drivers and Kconfig help messages.

Liu Ying (14):
  media: uapi: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
  media: docs: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
  dt-bindings: display: bridge: Add i.MX8qm/qxp pixel combiner binding
  drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support
  dt-bindings: display: bridge: Add i.MX8qm/qxp display pixel link
    binding
  drm/bridge: imx: Add i.MX8qm/qxp display pixel link support
  dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers module
    binding
  dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
  drm/bridge: imx: Add i.MX8qxp pixel link to DPI support
  drm/bridge: imx: Add LDB driver helper support
  dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS display bridge
    binding
  drm/bridge: imx: Add LDB support for i.MX8qxp
  drm/bridge: imx: Add LDB support for i.MX8qm
  MAINTAINERS: add maintainer for DRM bridge drivers for i.MX SoCs

 .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 173 +++++
 .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 144 +++++
 .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 106 +++
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 108 ++++
 .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 202 ++++++
 .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++
 MAINTAINERS                                        |  10 +
 drivers/gpu/drm/bridge/Kconfig                     |   2 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/imx/Kconfig                 |  42 ++
 drivers/gpu/drm/bridge/imx/Makefile                |   9 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        | 232 +++++++
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |  98 +++
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c        | 586 +++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c       | 720 +++++++++++++++++++++
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 448 +++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    | 427 ++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       | 485 ++++++++++++++
 include/uapi/linux/media-bus-format.h              |   6 +-
 19 files changed, 3954 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
