Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EA12F74B8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E536E18F;
	Fri, 15 Jan 2021 08:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130083.outbound.protection.outlook.com [40.107.13.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F02989872
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgBIkWEsVpEWYXSWqr6QdG/qxPrFMZ+uQe+X8sIhCfkM5MCKy2aWeCs6Q/DE/G7Tu/fOlxry3dY8gclXnh+6PZpoVdpmD99UgqgOGEf/ELc4SepHeZDkIdGHJIfOiN0taFuJngoajDCxIBpAOY6x2xJA8ix2ypJJNnYb4sBrxiHc8UMaaqRuP4sQgkhoan5lhPwMZe8iiSq93CC04N80oRpihauqhIxs/C+vizzyoNAvTkmcpLoGKsl2EryCITOtXKHFPA26A8fVsJfbLY+CmjUjO4XTJq7Y0dd90l7HjkLE2G2jv8JcqhH+JKkYPCTF8d1OWKYcCWTYS3l+Z0Tq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiZqnN7+9VOYONNJ32O3uzNbartJcvcoWkvCJ2DkZdc=;
 b=ZkpW6aqIbQBuj0yuArbN8VOqS0gVBgP3rPsvJhe8tS0oIg3W1f4wEKqns0sOw4Zhvqpy1HbjQrWYOaafxxMnxd1Jw2EuKdEuv0ln9d+J/rddsz9xe84hmH6LL+m5qxRshqjCcMJHOo89YK/QjiCKw0lRzg0xVodZ8MbIR8ytU6wRw6v91d5iz6gwCa0+Y4NyEALJv7Kl+JEK17o0Vci9w6Ce2FPhfFtnWvw6Tx/TBVE8Mk5RnWXQAr2l9lx1b/Jkkocgf+UW0ixcUi5DNWMlwfdWgGEUYiq9kwnNTw2U3OZbH/HKew9oi5m+Lbd7tJerJC7B744f9UMmE5/S46HbwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiZqnN7+9VOYONNJ32O3uzNbartJcvcoWkvCJ2DkZdc=;
 b=H3xeVtoAJCSGM8cj9rFxMotZLApO5t/LQ0QECkfsNQe0zA4YWzzm3snJxa2I/OQ56m6+Q7zYo+pRoJyHWGrUmHBQWbdSP2Y99KKcqXyoIdhdha7LVBR1p58m+alO159YQJDIyqX0hUraFi20xzu2YTi1gJNzOJfv0J2Zy9ye5xU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4893.eurprd04.prod.outlook.com (2603:10a6:803:5c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 09:32:27 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:32:27 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 00/14] Add some DRM bridge drivers support for i.MX8qm/qxp
 SoCs
Date: Thu, 14 Jan 2021 17:21:58 +0800
Message-Id: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR04CA0175.apcprd04.prod.outlook.com (2603:1096:4:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:32:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5bc1b19b-1666-418a-3dc3-08d8b86f4e8d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4893:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB48930FE328957EB6119FE42198A80@VI1PR04MB4893.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cOrfNyiulQKwK87gPbZ+OMbKgPQ7BHpkaGmTMlIYt4S+9huB8YBncMI9T35D3SGYWqx2l7M92jQXTittBAvvVUw2VZw+Ig1iVpNmnooa8vXks/yzG3J3abGtLh+UKIjYUb27ZhHk1xbKgx54+jYFz7DvM9AwJ2ptFwLEIHNgys2z04zG7mWxy786/bQLoTpMI1TfwtWUJC7ia/G1ElFlUFP90OwZw91XVSp2j62roHD4Tearfkx6Zow4KR0LIq67FkfJetr8GqkhfiYIpiF7npdt3ti9Nt1MOXR9pO4H5AFyU9wDAYRBoSNKLh2hJ1wozG2L1aSaRJ7Ox1mSX/pJ80pBYA3SUIyIFo+tXJxrU/S2T5vHqD3J+K3QdqbIIc+WbnQsYcvNxo3s0w7HUodRcNWbTDmsA6gOjfveOXBe2Kr69rErGVNkoIdSRKmVed7QAfVg4miwJk0Mx2Y5Y3zi3l+Rz7uCJllrYkAaRWL7n7zZmSOo1G4kfJkQpFaE4EbxexplFtNsqs3EC1btrU6grA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(36756003)(6486002)(16526019)(186003)(5660300002)(4326008)(478600001)(83380400001)(8676002)(26005)(66946007)(316002)(966005)(52116002)(8936002)(6666004)(6512007)(69590400011)(66556008)(6506007)(66476007)(86362001)(956004)(2616005)(2906002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wq0gIbNqZHuFqKz9W05t45tin9V5zsNZZGcUZMxAfWmknwE2mNFSQ+mjYTEv?=
 =?us-ascii?Q?35JzwNvQ1MXt8MXaBBWRhrPv6TMhjJGu+e049Ei5cCwX+9q07Su/WAjkJAyD?=
 =?us-ascii?Q?0tGdMlUxynBp18ryoClRQZ9cP6ORGrBMJpQKr5T77/QdCQrVsTPUIMjYxKD7?=
 =?us-ascii?Q?DYjJ7O4QaZy1PWzfVmLyBN+Ce0fAuu2V41+fqTvTl9ifMeYNw3FflMmmtNIv?=
 =?us-ascii?Q?h7madsyVSd+QS7k35Tr4ZTg27BVwUugw/9OQWFUmc2Epeoibz5h1SE7CmkRZ?=
 =?us-ascii?Q?kF96fNvM2vmD1urqgOyMdFuVMB1deGwBcqQLeL/Zw4V5f6AeXC+2PFMOBhAD?=
 =?us-ascii?Q?+iNJt763CcbwaM7yTR1XwY9Q68DAlw0QZYSYhqBEfHFeATXnenVtagNpCz41?=
 =?us-ascii?Q?olxlZVx/BYuJNKu+RQ42ow/7qJJtw28IKYbQ+PfyChSBmQkxQFjKO/wPxc1D?=
 =?us-ascii?Q?Uj/6Kup568HpNcDMV0FU/nWFeSfLPOJ4uOp19GwS/RUxGMgtSfF2UZnXgjX8?=
 =?us-ascii?Q?xCnnAEyNzdmx6LrjYyHAqGPvuxXmEKA4X0wGpJl9wKUFM9VGNmqcZfiCjdW8?=
 =?us-ascii?Q?BMlgzmp1hFrSRD2ZR4U8b8hdGr5s+jx9vtQKMHucqVfLp6af3VFEAMWCn/6o?=
 =?us-ascii?Q?YFWeBHOx80jmz/R/98x2JXNetVlljMgtihLQ9fYVVGKDIifA/vUv7Taz7Ytc?=
 =?us-ascii?Q?tEap//ayKDfwg7e9px1ENT+QjNhEdDK/Kd8vtGWsl7NN8TkPk/WY4Y8YORGc?=
 =?us-ascii?Q?QJew4mwFLuiInUb7ubWTmEscCPjxymC3qlTh4tSGFcxVgziXoOJ/5ScKQjvc?=
 =?us-ascii?Q?qbirpxh8/abDHgwSsPq0lSV3v3/I/q8eEHgUbjqB4SFBPgJGP0Sow6phpyTu?=
 =?us-ascii?Q?HoYJfaGTR/8lk1B23TV7iyrtiBFvquiAtF5Pt9QX7QnBw2VZtuov+WD/qImK?=
 =?us-ascii?Q?KeX7Jhs50Qp7kmiSr7XpxCR1wlhenA3U6XBYgzPU2B7qNFER8MroBbVZxFwr?=
 =?us-ascii?Q?2Dg1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:32:26.8886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc1b19b-1666-418a-3dc3-08d8b86f4e8d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APhhBrdFGsi0l43WuU5unh6B8h5K0uvbJHvsSThdOdjPWjA9d12hggzpax+T+B90NzFooeAWm8Z25px1j9/G/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4893
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the v2 series to add some DRM bridge drivers support
for i.MX8qm/qxp SoCs.

The bridges may chain one by one to form display pipes to support
LVDS displays.  The relevant display controller is DPU embedded in
i.MX8qm/qxp SoCs.

The DPU KMS driver can be found at:
https://www.spinics.net/lists/arm-kernel/msg863775.html

This series supports the following display pipes:
1) i.MX8qxp:
prefetch eng -> DPU -> pixel combiner -> pixel link ->
pixel link to DPI(PXL2DPI) -> LVDS display bridge(LDB)

2) i.MX8qm:
prefetch eng -> DPU -> pixel combiner -> pixel link -> LVDS display bridge(LDB)


Patch 1/14 adds LVDS PHY configuration options, which has already been sent
with the following series to add Mixel combo PHY found in i.MX8qxp:
https://www.spinics.net/lists/arm-kernel/msg862560.html

Patch 2/14 and 3/14 add bus formats used by PXL2DPI.

Patch 4/14 ~ 13/14 add drm bridge drivers and dt-bindings support for the bridges.

Patch 14/14 updates MAINTAINERS.


I've tested this series with a koe,tx26d202vm0bwa dual link LVDS panel and
a LVDS to HDMI bridge(with a downstream drm bridge driver).


Welcome comments, thanks.

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
  phy: Add LVDS configuration options
  media: uapi: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
  media: docs: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
  dt-bindings: display: bridge: Add i.MX8qm/qxp pixel combiner binding
  drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support
  dt-bindings: display: bridge: Add i.MX8qm/qxp display pixel link
    binding
  drm/bridge: imx: Add i.MX8qm/qxp display pixel link support
  dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
  drm/bridge: imx: Add i.MX8qxp pixel link to DPI support
  drm/bridge: imx: Add LDB driver helper support
  dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS display bridge
    binding
  drm/bridge: imx: Add LDB support for i.MX8qxp
  drm/bridge: imx: Add LDB support for i.MX8qm
  MAINTAINERS: add maintainer for DRM bridge drivers for i.MX SoCs

 .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 176 +++++
 .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 144 +++++
 .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 106 +++
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 105 +++
 .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++
 MAINTAINERS                                        |  10 +
 drivers/gpu/drm/bridge/Kconfig                     |   2 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/imx/Kconfig                 |  52 ++
 drivers/gpu/drm/bridge/imx/Makefile                |   6 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        | 248 +++++++
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            | 585 +++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           | 719 +++++++++++++++++++++
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 452 +++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    | 369 +++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       | 488 ++++++++++++++
 include/drm/bridge/imx_ldb_helper.h                |  98 +++
 include/linux/phy/phy-lvds.h                       |  48 ++
 include/linux/phy/phy.h                            |   4 +
 include/uapi/linux/media-bus-format.h              |   6 +-
 20 files changed, 3774 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
 create mode 100644 include/drm/bridge/imx_ldb_helper.h
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
