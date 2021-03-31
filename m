Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73C834F900
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396CD6E192;
	Wed, 31 Mar 2021 06:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40045.outbound.protection.outlook.com [40.107.4.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36576E192
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:48:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e30OtJNip65tP0BeU/FhYFQzg0HjiqAVPI2GS7C1vLPLXSH2pxUxRmq7DEzKqIOxQS5Cb8g4YJnGh6lZGqhCFTl/kLOTuXIjZNUViHbdbcjiXq49rFt7ianVUWiRtGDn4U7VFJdXcVOuVTNVrxf5TX4enAcQRLVY/J81vzLjOv2HuKozERPJIAim2PaVDTvwHgLXHD50b8Wp8WA6jxcsiWR5SGmcapZOETXxUvSE82WPVO0upPVaPxfvfSc9I37pZroOlZCESf2P/pMAWRZA6ndEqpsQ/XRmqMT1X4T598PzZZPL76pYgLeWC3+R3/7X46murUgbjSq7oS0BKjHzIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZG8RiSA2vYeh3OME0rGmLqJRlhdJeqQn8DDZbawRW3I=;
 b=jPlnBCbplMJh/QDWwOwgY8HeNs37+l4SI9hBbaYdFdhU5SSn9mQOFHbnktgD7qzMfvP5BENiF9W7yYnCpDOgDRau5qTXAbLiduVso2CtreuUvR5rFuhrvcdkvboVDWHx6jEQ4s7jBlMMVIFDv73xB+gxzIYCjTESly3JdVjLPtD0plttxY0KgI9W8Rvh+KL5B/aJOSlaBHWiIxY/WrCvizAz2BezDWL0QHGkNkfy7w6qCMkGPxNluEC30y6l4NlY1CQNkr/sXMPdAnpzbGbhLmMyX97hzcCuLEYKAXMe9AO220rFb49THOlbUEpf1HA/WK+qyMphqTu13GeH8MhiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZG8RiSA2vYeh3OME0rGmLqJRlhdJeqQn8DDZbawRW3I=;
 b=rRBurJLkWusIulD8ZsYdayZCbSzkAFuiYu6AwjBD34y6/iQsHRoJQz1yylawnZDn/zfkX1X7XlIePYsYnNDsczqN05au+qQtSSCAuv+5z/Vo0cmH9C36DB+bJB5Q5Ib+7q6272z0POyFhrwMZyEiDy0O9/NDPYkDoVAuuaMziK4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 06:48:25 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:48:24 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v7 00/14] Add some DRM bridge drivers support for i.MX8qm/qxp
 SoCs
Date: Wed, 31 Mar 2021 14:33:11 +0800
Message-Id: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:48:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38ca2193-73ed-4098-8f75-08d8f410fb2f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6349:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB63493A5CD88127809C916325987C9@VE1PR04MB6349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ObqOKfA5oD0n4v/MQhqbqhcL3bCdsctYuDGE8LWmaSGPUcgETqc0F+JqzD74mU9lMPV1T1xgkmdbByVk3yXhGQWIZ5hWpl0y6HWZrpt1xJbBUgg02raSSpm5+D5jZCxkWF/a0lkah0gbLpRCbMoe1NWMBPJWzTTKN7YfPyVhvmb/tTNAmul6UW2vfzt6mVBv4gFI2Cr9p9eCb1I/eSvxr1B4pAtqkM+qaMTag1DlEEmEhbX5cbrMiEM8o0EPEyGBcN+px2VguDf5GEbyfsv1HDHOXMNXtDDeOFLU7OgboXnXWlxmVyZqAse5xAygyDxQWgyw1rBa3GDk12apTkkRlDUW+ghXxbUQay0zPefLMdKLgffdTf5iYmOVKsNAtydaGFfzuXLeYopbZZwyLgDk4QTDnwC+NltWIQwwYK/8lOm2XXgInUUgCOgz5kq476+U0BxFX0EP27mMJC6UPMlXiwYyKSEkUWwYHoqPDRkliy1hlqFrf0gk4tD9/Nj9z9EOn7ovb73XKb+o7NMmRRwrB1xP0lKHLXs425WkfBYrr05pOVpqA3A4a9p3Ld4TC8do8PsH81MS1krYu03WODuZwT2tUyzhJ2CwpL3ytO5sOym0Y5kv6UBDfg5wXtBiQxsxrlromWjHhHWK0TbP61RL+Hl/+Kr+YTfSysPhknhXO9Apb9P9dLw8toTtZZrK+AKYwM3iSK6xc2uO8Fr521nOngdTuykmbuAeOK7G8bkzdqwYxD22vOKFa7dbXFOFZUVytbBmbgcbT7l62kDHbn/wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(16526019)(7416002)(52116002)(966005)(86362001)(6512007)(8676002)(6506007)(69590400012)(186003)(66556008)(5660300002)(26005)(498600001)(66476007)(38100700001)(4326008)(2616005)(956004)(83380400001)(36756003)(2906002)(6666004)(8936002)(6486002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?M1u9qOo4RtNzFfkwJEj3P7heTE2oJS7zUHQ9iV/sMBy9NEF2qsydTWZ4RraK?=
 =?us-ascii?Q?M5TFJ8GX5njfdoUDWdAyAETmBCd7Uj5CqOf/zeGRP8c6S4UgGNsbiWdAVm8H?=
 =?us-ascii?Q?LOL7zbJVv+Q64MlCmeZi6l1ctfNWsO6YVpDv8o/hXA2/8yJEQ3z+xNWyE0rS?=
 =?us-ascii?Q?wDWnNc5giAr/E8MMMKj32JCvOCgYz/F8s1he/L3bZNN+144ylEI2RPv5s2hb?=
 =?us-ascii?Q?Zrs3uoCU55LAaZVRDW6YVncjZo9nO9yjY+miecSvJFkopyVfpRho9mECaajD?=
 =?us-ascii?Q?cGQPbvp9VIZhe5vFpB97weiWbSZ6HC+EG7Q29BrJLwL7SYemb0zUZYORRzSX?=
 =?us-ascii?Q?YxOPgUZtdj9lB8wwsZYvWqfLrS9V2p2AG4oCIQ92cnh1tRU+o4p5N0Otto5n?=
 =?us-ascii?Q?5jJimBQrySnkQftXK3my23fbSZTv5OIYSF3te1auI51Oik7TRADxhfmdgOws?=
 =?us-ascii?Q?NvUhTq2ZajtMyN82PdWoH3XgtFiLY65aaPtRHMYmlHm1aKB+tDwsKSgX71ue?=
 =?us-ascii?Q?L6iHB+muKWiw6JbEAni1rhe+4VGUVRMRFqIL8k6BGnQ/B2fCoZgHfPsYvBTA?=
 =?us-ascii?Q?DO6aJWBdntEZjurSMekKoV929rchmeTclxkX+z039NOxFY+w9ihK1XWaluOF?=
 =?us-ascii?Q?cwViXgj6dbt3NDhCrEuDLWijP6u/79YCcpANlnDkOOYxNHqcTI6l5Wozt3W6?=
 =?us-ascii?Q?9NThRGuu5kpk5lkJtRAeKPyHSEvmPM+yKcITswMlZktNKO0/u7R2LEWTKZ5O?=
 =?us-ascii?Q?adunG7bbwJBPUTqHGuLZoR/PFcDoCZeXLGbOF15MOMtGoMIGb2H2G6GBD1W1?=
 =?us-ascii?Q?NQFxMsZC/BORtDbpkWhJ4zGpQUztIE4cfvSdyWh9lFBo8HQuuTKGrqdHqQg1?=
 =?us-ascii?Q?XqthVwwdVB89BN6RCYIqjgGvWtvZKMfQb75QbpfXDBdkiBAiZHS10ARGQ2lV?=
 =?us-ascii?Q?b4O6CPBioMhSV159dtiK6Xll6TT6Ba+ek6h+QedT2YLYPtByLDz+maKxgUrl?=
 =?us-ascii?Q?ZDUbOg2lLGCxnLIf2BDQnaF6veZWIYLcsfgf5ePpTclpahQPydisDJDLbljN?=
 =?us-ascii?Q?KS/cdCsqf33sgMlyRnQlNdXs0rweYZf7W48qE5QR7eprmtDOaB9fv1DSPZdN?=
 =?us-ascii?Q?Y5TE07jT+ZrjpL5z8P54zoaDoBWD4x2LSJbJ6Y8zeHsCziAehSsaTgww3+65?=
 =?us-ascii?Q?FRBznyicqUDpyIE8q2oX+UnOIIhuWv8OcRIvbiU5oaIAwqkQSOQJ1EFa+6KS?=
 =?us-ascii?Q?ucOI8K8Ugcc9zC/5WvJ4uly9Y0oUrWuBirRxBPWDCSYsFlslf3FuBhV3zEIQ?=
 =?us-ascii?Q?OYXiLK2BQj233cpERl6RynSE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ca2193-73ed-4098-8f75-08d8f410fb2f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:48:24.8114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4p4z3mfrp7rh8DWjhhCBAD969P6bT5haTBgEVT72yWQfs64N8sKDGYFtfmvFwE/Buo4plIVBYMvfSi0bTzXsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6349
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
Cc: jernej.skrabec@siol.net, marcel.ziswiler@toradex.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the v7 series to add some DRM bridge drivers support
for i.MX8qm/qxp SoCs.

The bridges may chain one by one to form display pipes to support
LVDS displays.  The relevant display controller is DPU embedded in
i.MX8qm/qxp SoCs.

The DPU KMS driver can be found at:
https://www.spinics.net/lists/devicetree/msg414766.html

This series supports the following display pipes:
1) i.MX8qxp:
prefetch eng -> DPU -> pixel combiner -> pixel link ->
pixel link to DPI(PXL2DPI) -> LVDS display bridge(LDB)

2) i.MX8qm:
prefetch eng -> DPU -> pixel combiner -> pixel link -> LVDS display bridge(LDB)


This series dropped the patch 'phy: Add LVDS configuration options', as
suggested by Robert Foss, because it has already been sent with the following
series to add Mixel combo PHY found in i.MX8qxp:
https://www.spinics.net/lists/devicetree/msg414149.html

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

Marcel Ziswiler has tested v6 with two LVDS panels(single link LT170410-2WHC
and dual link LP156WF1) on Toradex Colibri iMX8X.


Welcome comments, thanks.

v6->v7:
* Fix complaints from 'checkpatch.pl --strict' on the LDB DRM bridge helper
  driver(patch 10/14) and some DRM bridge drivers(patch 9/14, 12/14 and 13/14).
  (Robert)
* Fix complaints from 'checkpatch --strict' on the rest DRM bridge
  drivers(patch 4/14 and 6/14).
* A trivial indentation fix for patch 9/14. (Robert)
* Add Robert's R-b tags on patch 9/14, 10/14, 12/14, 13/14 and 14/14.
* Add Marcel's T-b tags on all DRM bridge drivers.
* Add Rob's R-b tag on patch 7/14 for CSR module dt-binding.

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
 .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 144 ++++
 .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 106 +++
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 108 +++
 .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 ++++++
 .../userspace-api/media/v4l/subdev-formats.rst     | 156 +++++
 MAINTAINERS                                        |  10 +
 drivers/gpu/drm/bridge/Kconfig                     |   2 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/imx/Kconfig                 |  42 ++
 drivers/gpu/drm/bridge/imx/Makefile                |   9 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        | 232 +++++++
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |  98 +++
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c        | 587 +++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c       | 722 +++++++++++++++++++++
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 448 +++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    | 429 ++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       | 487 ++++++++++++++
 include/uapi/linux/media-bus-format.h              |   6 +-
 19 files changed, 3951 insertions(+), 1 deletion(-)
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
