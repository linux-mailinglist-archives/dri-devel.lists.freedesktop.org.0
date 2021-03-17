Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0EB33E7EA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 04:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC986E0B7;
	Wed, 17 Mar 2021 03:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A8D6E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 03:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIyZcMEaUzU4RfxmmVwyE8u6Y+DnoZj4VPDYx+xKHG+/OwgfNb/PMwBhCHidD0UY2pJZKqTiz78D3vGlbcisR0cxH7iCeZTCxakpRc2lRQj/1tbPo3kH+2POMg5siT1HXxV/LmxwndsUHb1upmVkiyar1GdClrV54KpIZEPtq8zMmAL4oHHKvf/N3Taa96DsSe0/bV75yVY6qJknBuFb8Kv6bxpCJRvmPpeOShIt3GTnLs3mAZUrqxhxm8kJVTkzccK0TwzgB1le4HizxwrGyGje3EFOUzR3FqfZlgtSWmV8mZCXyH2fKEJyAdIaujyjPZDhMIo3Y+wp/9zVIELbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjjBcGGqX0AfneVpxD2yY7dPau4VoL7V5g41XBEkJpQ=;
 b=NmK+1lUo/biTQdCtk33og30V1HKBtxceiaqZFQ+PlYHlPOHXlxEUv7yEtZqMzoeRBRBBwzH6dy9jhEZZvhU1S2DQEfVdCi+wZAXHo8ZGXDE77v234rlSlwxv1By+C55q06rbNcZ1SFLttOyNK8+kBbt41UtOoYf2JOYVW0eRVv2K3M9yON+EEn9S16dEO7rXGubn60HAUJB544sfUaG0n0f64VgW597kjTIF1Zp5ygWOJtWgr41LpffSaiYBBtuzw8LewNM3soHcPfKpJfjuxdLI7sr6KNoz07mDI207GSIQcRYudzmWTRhATVU5nQL8kP/VHZo7jbImssuE3jsr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjjBcGGqX0AfneVpxD2yY7dPau4VoL7V5g41XBEkJpQ=;
 b=ZU3sV+JHGXRbLbm9gf7McI774giuoipHisITpwAehZVRCUdouRQnRew/RDfs0ADkThOgl2NaqwekIU0OsW9zhls+jZc5AtSaDG/pO+oVEOt7xO3buxfSBt0BdIBrrzFMEZz2jwf4mj+XD14yZDNjvLY+d7hpdx/Gb4DVl2VRZTk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6991.eurprd04.prod.outlook.com (2603:10a6:803:12d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 03:56:16 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:56:16 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v6 00/14] Add some DRM bridge drivers support for i.MX8qm/qxp
 SoCs
Date: Wed, 17 Mar 2021 11:42:35 +0800
Message-Id: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:56:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bbbb4b03-c8d9-41e8-bdfe-08d8e8f89d5b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6991E95492A6BC98D66D9883986A9@VI1PR04MB6991.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +1Hituq9TKOzfYVdf7KKCyUhtND+JlSHZk2iTcfqA5XHoAiJpls4omQFqG+otr42DFB6ZnWknGzM3Jw/433LFuqPt3q3rpJcJDmdwUtH9OmM0FQ0RHVknkJiqXm91vkO7Eh9Sl8WKnapgdYFAeOivUs6zNFiK/gIyjdm/icDokLBQTvvWLy8atTj0411yU4fufC8R2xk1fkuj8wm7CXVe2YsOOF0BolRAS14sSRG6aQMS85ovjNR8CBuj95CVWFIV7JzgPsNes13GcXmx6tTMJvv2fWMOvbQmQpuoMqILVhdHzDiiAn3DZxh7Gr3TZ+ffzPfM1pNQSw28shCDIRmoEVOfRfu940k4Kjyt871plR1SnQN8l30C5+Wuwut28u17avHXKGTo693GznGdePnfr5gBt3dPX+QVsAw9dEPS7ff6OJgrzjQm5FuGqbWISGRdVFyE6Nurl54LCINNLrcH6oGGAdLH4Fr9oH79TdOUtqx8CTNKo5qpiHMnjnqmgxcZmDyPVhibyklsoP+B/qa0Kj6BZ6NRYWitq1p0FX72u+W0NIyUD1l6M921TI2q+4GhHULA+sdIJTVp919sO+uwbKE7fsL6E1x5WWtt3Q1++Jd+zdyoizJnPSa86tfKhQ1TTK599Cc8ybXwTqOBW+qM8Lrl6KYPYgWY9OZEjewJaE34Wp+0F5zGxoRsIIcrnVp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(6506007)(36756003)(2616005)(6512007)(86362001)(6486002)(478600001)(69590400012)(52116002)(186003)(66556008)(66946007)(4326008)(66476007)(6666004)(8676002)(956004)(5660300002)(83380400001)(316002)(966005)(26005)(2906002)(16526019)(8936002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?D1ynhfDj4P3PdbqmHXadIdptw5KrYtcn2JulIjiNLX72HPwVAe60xwHwOmvf?=
 =?us-ascii?Q?ygRM3Y/KjR7mDktINNIet6WyDnUyiiUFcvVCvVmbK0EHHI/WTwKY/1143MYt?=
 =?us-ascii?Q?NW7Kys2KbnUNGBB5kEqd85iZ4Pjffj+LumXzMoCcyqMPpyUJmVM5LZBjJUQM?=
 =?us-ascii?Q?JY8BIVsAcfJlwwdhZeXMdcfrFZsUV9FW8OXaKeOCD6ecrrd5DmKe7G5PlzxY?=
 =?us-ascii?Q?3j0HTY/4lqdyUmePOlxIdMB7kbyiidgTrsLUoP2P7kpU0JuOQEG2T8Er7TG3?=
 =?us-ascii?Q?vGBV4fDS+ecwGwEU2sGIhxwKJPkUgweadErT+B2If4qQgd9sdCyBE410zqyS?=
 =?us-ascii?Q?c3wwv8XdeIwXfg4Yo9msKnctAU3MDo8yHqGqDwaLvAUm01XPaoD5ySl+lL9t?=
 =?us-ascii?Q?LnzYw86YPslO9AsymB3fAvl81yCOssPY3DNLVH6pCrWaVDvXzF+L1LKmtHlG?=
 =?us-ascii?Q?dxzM//8X5Kkf3Wa+KCGoP61zQ2Krug43ymCtzs+C91V9mo3tE+842Iqzz5kn?=
 =?us-ascii?Q?O8NAntMV/2tdHpuBDUeo9XTxKZ2n1b/69U4uR5PuCTNA423LpOW8QeIsbZxM?=
 =?us-ascii?Q?51wDEDY86s+wCK6lL/+vgZfqJIL9jHOB9HmXgz3V7a718lwrw3j415Wj6Bnu?=
 =?us-ascii?Q?bXV2tZaPeZuAF+2GUJZUpaRYTSDXs0vdqqgdocJlTGT+2EX4HnfuLw5vkLSE?=
 =?us-ascii?Q?pXYChEDjhV+Hu2gtfjub4cIK/Kk915Af98YDV2bYWbdvkvRtjJje+o44dM30?=
 =?us-ascii?Q?lbYZJKka0bMDR/FDTSvi7hkwQl0p5cVFQC2jU1oExDHe6Ygf6rRhNGiyW5Qj?=
 =?us-ascii?Q?sptppDwI2Y56oeP2CIPUgoxiw2g5bSzKl0XFPz3Mlu4QZHTm6lfu7DkXcXhU?=
 =?us-ascii?Q?Mu8vXbZKKzvoyXD+Y3LIGL/XHJHIeS/Toi56SaFlLvHg5fmfNOUOIdyKBbAH?=
 =?us-ascii?Q?vig/zhefU2cavcqeNs+BQ1waaBQxGJVXKf+pbvi80Cdlf2rrvOM7TXPGaxdR?=
 =?us-ascii?Q?j78KhRvQXPMgO0VMOn+QaCi27My1bxtEsOcgCijsFYgrxNAGoWete7eGmboG?=
 =?us-ascii?Q?Y4LBbAk1yNZ9/JOcz9IkistnPram0A4wg3P8Smcu7FvJel3f2D/aQM63JUzN?=
 =?us-ascii?Q?WxVC9i4J5xthccjwQn3XHjTP89HBrg5SGQZ57Xk081aNx0G/dA++KApAKkjY?=
 =?us-ascii?Q?Vyr3tKO/DV2JKLRehLjhqBDC8H5Yar3m0Y11uRcqqfjPCGoAd75BR6GqXEDw?=
 =?us-ascii?Q?Lc1XmCA9GYkjUVYpxUS8Ql2e5j+P+RK4JB9dU+2gWZHqw/xQXWYDbuhtDJvn?=
 =?us-ascii?Q?KZ1gjbSweJrN49m7jHIuJ40e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbb4b03-c8d9-41e8-bdfe-08d8e8f89d5b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:56:16.7181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJ8noP4Xn4yxpXc5E2iADCH6ZB4sA/4R8cToIoFjsbk+fQfhYKM/pS2uxRX6ovQ4b7+SbUztlpLKQBTNdjAjkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6991
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

This is the v6 series to add some DRM bridge drivers support
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


This series dropped the patch 'phy: Add LVDS configuration options', as
suggested by Robert Foss, because it has already been sent with the following
series to add Mixel combo PHY found in i.MX8qxp:
https://www.spinics.net/lists/arm-kernel/msg879957.html

So, this version depends on that series.


Patch 1/14 and 2/14 add bus formats used by pixel combiner.

Patch 7/14 adds dt-binding for Control and Status Registers module(a syscon
used by PXL2DPI and LDB), which references the PXL2DPI and LDB schemas.

Patch 10/14 adds a helper for LDB bridge drivers.

Patch 3/14 ~ 6/14, 8/14, 9/14 and 11/14 ~ 13/14 add drm bridge drivers and
dt-bindings support for the bridges.

Patch 14/14 updates MAINTAINERS.


I've tested this series with a koe,tx26d202vm0bwa dual link LVDS panel and
a LVDS to HDMI bridge(with a downstream drm bridge driver).


Welcome comments, thanks.

v5->v6:
* Fix data organizations in documentation(patch 2/14) for
  MEDIA_BUS_FMT_RGB{666,888}_1X30-CPADLO. (Laurent)
* Add Laurent's R-b tags on patch 1/14 and 2/14.
* Drop 'select' schema from the CSR dt-binding documentation(patch 7/14). (Rob)
* Add Rob's R-b tag on patch 8/14.

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
 .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 ++++++
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
 19 files changed, 3944 insertions(+), 1 deletion(-)
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
