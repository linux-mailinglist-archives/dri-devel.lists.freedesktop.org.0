Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549363070E6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CA36E913;
	Thu, 28 Jan 2021 08:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA996E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:02:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmuDS6E589Lcyh4wA296pmgYdbKrZUdq/NyFX7L/elUG/Og0YxDH1jqpPPJRwGrCEGClbGFyansXAEIgFPNMXcXsKmpeYr3K6Utpl+lmeS2otx2BmW1+eJi8Z2v9NHAc3xQaksuo00LFQtfEEaVe+9VYcQ1qoCd+04hfMEIAadpul1DYo0h7lzHwcgAnaFrthE8nxQSmL4SjoNt48aPx3EoQcbwSDod0LCdBvQj/PfJxetl4dA9L3/dZtn4mkgabI3vd6Z1rJYTQjrFOMfSmYfrTpyXMoFq1ShlGap827T2ZHJ8FCaUCMVo/J13Z/Y69UFMUlh5vniiPoxjMIfpRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oO3TjI55cSnmiAjpu2YKIX1yPPUt67vQMRYd5hoaRQ=;
 b=ZrB/ffotegXW9Uy1bqTUr9rTRoQfhYy5Va9EuK5v6ZNtNwm0m/j2jRWEcL9r3OcUXD71ZEQIeCAhBsOuXmgRlPAzRV4q4IjdwGisjUSqTSYqslHzNASS9uNHcvtmn1vbt1qg6Qf2D7cX3z8ZWa6DHxNgDl0e0ShkpJfjp15d1l1UPTVkF9qEFlTo6H3e333khUaDTIQ6Qy1UFoBJR1mufmd7J8tS0aQvkV8Ov0SL82CPL9Qcb2/n0nAlD8B3TI9s39w2QZKRCdUAoKGWON0yywSNwxR6++TtABDN35VRE3zqIwZ3lOLJfrSny9hHEwY5hXelhqEYibxMBuV8+jATPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oO3TjI55cSnmiAjpu2YKIX1yPPUt67vQMRYd5hoaRQ=;
 b=DrO9oJVfviSc6BQKvhbmP8HC+wZwwLiei8/lq8Kk2WgyLCpvlU9r03NX8cIVQ51glcaVVZ26frCO8M5xJn4yB6w+BboD3VKpb6QoFZRh/Ao5gEf+6dcP2+DQiPIGoqbRzrhCNJalLAt7TL1bsiZhmeS2A8ZRdjpL9922nSqq/Ao=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:02:17 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:02:17 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 00/14] Add some DRM bridge drivers support for i.MX8qm/qxp
 SoCs
Date: Wed, 27 Jan 2021 16:51:14 +0800
Message-Id: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:02:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 89e17932-44cf-42a5-c7e2-08d8c2a23efa
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB29759EA67B88C1AF524B5DDB98BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 71oNpwt7R4rlZ1kU4fUj6zniem+dpVNXf7z4OfSFMcWJtLCTwvBua59gzfWxCw+oqd2XGjmXIH/uigK0nm25ThbbxwLOKjycQJjGeIviMPe2yBZ+hfc5dkTV/RS1a2XpYznB87GTKlLJBMtAq25jO5pQTeQhm0CyoePxIsUr2tghZqFOx0l7aIrk6Td3juOjAMGi16lb1innaV0QCngmirjCAPT6gv05kKFUPz1ZA2Rg9UB7tZ7lrcWy6RNB5hhON4Uu1EqDafwerqUfuMLCmHpqn/K6BhjaB748RgFaWPWGwQu2RilCeIEQjizsKZnCGAsXfW6LLwlqoDFio6Ya+EX12IzmmSqYT5MjSaZO/vQ9A+RJCc6MpmoZw54awwkH8q+QGy8y6CCavzsziHyBMKu5qX6tTPkZT6cUlXrqukpx8LX6DtTsjImaEhVyczqr3UrT6o5YGZeGnBBLB7ymy0wwiNv/VKS8Te29gNt2x6wJm3wus7O0FcNawA2CarzwOSVd/7KyDqw9hZdCKYCi1e3qabl5DfRuvuLFi0jWHWBYlB1LiQ6jOl6yZx1pOD3m52u2Oz8SzRxfbX7ZlXdZHjhJfLoILomGimZggW6gJLWC37+/HMc1anV16lzgvmjy3plZhnrnKXkSnEuKfl00kmVxgitLa8ZoZQcV+S3hZwg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(956004)(7416002)(4326008)(36756003)(69590400011)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(6512007)(2906002)(52116002)(83380400001)(66556008)(966005)(26005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qkkqqMkCw4umTUHAj5ltBVDML0K+q8HuUfOxZ5YgBrxzc7OlYrbMxqnJkrMR?=
 =?us-ascii?Q?DMwqd0M+BOzFLBaCoX48Q+cpSgBHy+fqBdwhPcb/D7Ij2pjX5EPKwp1KHGEn?=
 =?us-ascii?Q?0fBAOi8p4QLUX2mAyR5aNY8OZOGfvpc327/rU3Lz08+hiomLyEVX2lWJbrjC?=
 =?us-ascii?Q?QkbNpG21ssXfWTUXiZOZJPAnMfHOe3v9sxXN+R6pzLtf28DYh+hIEHhcd7c3?=
 =?us-ascii?Q?x5WjKU6udAbHh8KJ8qryZgMukBUYFr1VMgcFXWWWtKzRVqCFANf/6X6HdEZ+?=
 =?us-ascii?Q?f2GwL7QK6iCfGjlh8Z/ltipqzGat+O6WdKlbJK/+VAIf9K2tChz/8hKRxIQj?=
 =?us-ascii?Q?suVMTRcfrBU1DZxEDn+Pffk2SGEeCtwTl/3V66Q14XeTjGn9WoBrzXA79E+1?=
 =?us-ascii?Q?tEbzGsyKq0AxEGjtP5SZIFmJFSVteuFDrVkD9RVqVeNPz5MQXV2yM9CH8tTH?=
 =?us-ascii?Q?sLbzgwoCtspF+KEl93CT3UXJ6Vbq3Q5qteV/wxT/n6Qv+JiNT54Y6NBnkcSx?=
 =?us-ascii?Q?F1eEc8aC9tLuacclNFLaLLsdDiqOZiNrYVKhx1E3DZ+Kuewk/nz36Ivjd66/?=
 =?us-ascii?Q?ktQ61gbtraAaCq+Nzmq+WjNqCmRib/A1O53gSO+iGpAYUEyMWt24T62RPzgk?=
 =?us-ascii?Q?Z9yz0lrbFJ7rFBTlZIG5pAiWGTXH3IbOy+wy0jnXiLnlzjCOI/Sqq+qJT3sM?=
 =?us-ascii?Q?xPrdhBb/tASqJUiHZrKowR+VH4cdDtmySkUEJ0BI+rV992wclaYO3R4V60S8?=
 =?us-ascii?Q?Ig0DUjqulE5Es2+zWTPIvYwjmvgXmxo3nNp4LCt/8gUhBwA3T8KLv3dQVfQ+?=
 =?us-ascii?Q?uvYov+LE3ffxfTZoQgB5SjnthpfcFG5aoKfoE3UUzfx/YELlQYgKJYy/8Nyi?=
 =?us-ascii?Q?Zx1USSzFk/b04CCZxMOXwYlclSSLhwhfy+F0e41Lg8USOp0ICnbKMFDlxDNn?=
 =?us-ascii?Q?KtWWNNMx9RF70RaN2PgbjOJVD4NCmehxqxJFNBviJX0gryWpvSxN1RPmlA2X?=
 =?us-ascii?Q?9bJBctJL0TfPgIW9pLSdRUPyLFOAqenswwOzdqgHq2LDn9qx+Z8BEZGKBVnA?=
 =?us-ascii?Q?YskBn/CP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e17932-44cf-42a5-c7e2-08d8c2a23efa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:02:17.5615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bD6sBD8Vut48U0pN6vctDumLFkPFM86VzJxdM6DoE+zoJpafjt7RfuNJvQ/gRhowZyZsfOEjmLMgRYSC/3bM/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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

This is the v3 series to add some DRM bridge drivers support
for i.MX8qm/qxp SoCs.

The bridges may chain one by one to form display pipes to support
LVDS displays.  The relevant display controller is DPU embedded in
i.MX8qm/qxp SoCs.

The DPU KMS driver can be found at:
https://www.spinics.net/lists/arm-kernel/msg871357.html

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

 .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 173 +++++
 .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 144 +++++
 .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 106 +++
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 102 +++
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    | 426 ++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       | 488 ++++++++++++++
 include/drm/bridge/imx_ldb_helper.h                |  98 +++
 include/linux/phy/phy-lvds.h                       |  48 ++
 include/linux/phy/phy.h                            |   4 +
 include/uapi/linux/media-bus-format.h              |   6 +-
 20 files changed, 3825 insertions(+), 1 deletion(-)
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
