Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A257631E49C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E10F6E21C;
	Thu, 18 Feb 2021 03:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D626E21C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vn3LoEmoIc6jE5OE5gmZSswdY/+mLH4fJ4F6EXrb2NcHRs3LdWoMzNO5rTk28SdFWCEvWTndeoFPFgsrPq+IYGkaVkDa1y714sxEabVM4pUtXeZd5JOcpmCci5robz2Qjc0mzrZJ1rXTSVEkq2WxHmMfQpe2G8vHvBCsyGX+vTOSNQ1QswmEFHmAT2XsORzPKycgc7/oNcKlE2udz189q4ExerLxe5L9XsLIZIRp/t1ge9r2b6W7Uq09D0lUx4RRf2B2a9nJeh6ZtKpC2UJujMt5UtVcrtmucnoj8iTz3SuJ/Qx7U/CWRQvooNue7vQuPy+xqA9dTaXAzkAb317QCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKzgEmi5Af1YMuPFYMKSTpf6aC8Cj5cJl0lEhkz2Nxw=;
 b=WiappLi1l4kBc0C6Gi0pcacwKhn+vmGT+shkv0HBm/bw8j5M6pKyntCxCyk3fpLRlCi58vW08JKJcMF4ZyhF0Uy0m1FAls49G7qP0X8CF78A9Pqq4McDBmZaE1E5DY4OtFnPQa3PEZ2Gd5UDwhAeV4sq2ijS6oXzMH68Wb5uF9TJURMzgJ9r41wydXvaOfdjtthe3S+v9vROvwYIiKVSyiatMqoiHViacjzCAUyTGwjsgznLksOrkmQkXhe4Ax3cV/3w9n22gLgD3SLm7r2eltTFMxX/aKo0HF14moOeXnpptmPs4farKIlg7MsoMdKc818+46UsapSs2FZbdhw82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKzgEmi5Af1YMuPFYMKSTpf6aC8Cj5cJl0lEhkz2Nxw=;
 b=NdgZ6OZQi3+Vq7xM1gyEcCtxacmZ1wmYXxKgb1QrFKgEXkn5WjG+Q4CXLCqVRu17ftvoN4cq3K2Bz0GFCMr8EJmBAOkeOpb5d8IVMcsvb50U9PNK9gnDoKAwPAQbabS+uUfs2kffQJ33v8VoPiAp1Duo6IOOdP9URPaK/XxpUrs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 03:54:05 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:54:05 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v4 00/14] Add some DRM bridge drivers support for i.MX8qm/qxp
 SoCs
Date: Thu, 18 Feb 2021 11:41:41 +0800
Message-Id: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0144.apcprd06.prod.outlook.com
 (2603:1096:1:1f::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0144.apcprd06.prod.outlook.com (2603:1096:1:1f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:53:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea02861d-1a83-4121-adab-08d8d3c0d5f2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3421181A02F887A0A16D1DC898859@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J7H3vCYfQv7+3fDb6oeedqgyjkyxEMjzDJPRSraM6D1DfN6zJBiwuAUypeVuTcmVNADMqQDd4pU9cAOXyhr2gLEDKH+NPHHVbQutr/9C+ms/trCvvTSUnnn/kYftYU0IRlTL3XWlVM+vAWbQWCu/AgH7OE8Gzuf3m2fwpmfLcr3MIZ/ZTEQqwSikdKEiI7k1V/c9aHLU4eH/Ym8b1ORv+0HNz8+ZygK3O+P57HzikGAADLah7Bn97OwPiL9jqH1LXnxq+yGipuWQLP082Z5WtTEJKjWnFddKzEg5twG+fVgt+5PF+FvBbE2CUNyFO4EGXhLTCXwu+zqrgrY4fCx3527uJIfuDt33pqwQEkijs1e3Dlbrp7o4qlF/lCuA+S+L3MlXY0r8PBTYYhoHGc87HBIZtn96YQ2v8G+Hxe4IKcibuDVmxr9g+pkZ7pNH89GH086GLo+yrUmipwajWPLeOzmxsjv3NZn0k9ZHF2QjKeMVuKPsUEYywhu8D1yClHJydDfwENF6iuXBwpFNIQsjY5p1MmZaqS23Z1TfZw5+FTCrx/whG8C22mrjwiaCn+WToW1fYM0OiU1hzkzdeaIIDvp1DZq7fNe354GTlfCHW39wNcGqPMs45F777BumpLUPWMhOA6tYIwASMIw8gUqWGA3WF8faw32d7LzvHSm2TGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(83380400001)(52116002)(478600001)(86362001)(5660300002)(6666004)(69590400012)(6486002)(8936002)(956004)(186003)(26005)(7416002)(6512007)(2906002)(66946007)(2616005)(8676002)(316002)(66476007)(16526019)(36756003)(66556008)(966005)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uFwZ0Htz0lFrz71dTeXZ1hPoo/BsyUdqKBcB3oGTczwJSINCs7vwcu1O5GBK?=
 =?us-ascii?Q?iG+AbKVR6iOCdjzOVgPzzYuPfw/bNwdGcVX7ULjkKUUuK6iudRYVV1bdAnkA?=
 =?us-ascii?Q?KEhlTNYri5C90buhFoPtc6GN8eWOyIxiQNzVSh6UEX0FD274cEo4wj5r66eo?=
 =?us-ascii?Q?RlWlPgO04KIhvh+pafPDdQP8GeL2YElBoAnd55dqIdPSIwQ+nqr5PEdRKHVl?=
 =?us-ascii?Q?PLTiZkJokZnqjfPyhfJ+xJ9Xj2j2K/Em+P5RSnnNaYue1Jjxxw63zCCUK0Fx?=
 =?us-ascii?Q?U2dghe16H0OW+hMwl4uwW+5Fc+WwSI4hA1KqB6AHH7AGBhAOp+nMBC6T++Aw?=
 =?us-ascii?Q?fjs2SG5piBSyeBkDmi9x0Cgn3GZztZs5Umd1rHx/ULVAwqQar3UO8IkDO7Vg?=
 =?us-ascii?Q?rL0B/Zo14DfMxvGFr+IftlEI/gT4041tXTUjWHQco9qvzus2wykYnv6+Refb?=
 =?us-ascii?Q?pyE5JAi1ZzI1mfu+93gFndzapy58YNQJfEdRt+OqVpwQK18mYzX5X4AQVC92?=
 =?us-ascii?Q?VNDgba6cl7Ni8kg+oAoJ8Am4C+HerIhgrAkuXx95wGKI7AkDCdCgNWU6Tzv3?=
 =?us-ascii?Q?hUA6EpB8K9GVeIrL6bTSUyeOKhFVQclTeAMGAbrV8ONVWDgk3IU2AUPEk6dZ?=
 =?us-ascii?Q?mOsgd10ZUMcusI1CPs3/NlfSF2C5uvYtYxgsNlinn8FZx35KKUWZau1iJC9f?=
 =?us-ascii?Q?S7vqYZ3mQNqNUnDjPyZ9K0mpbf2lGOhgjLz6xkfLBcInl+HVdceM2DS/6I4w?=
 =?us-ascii?Q?deyTcatjJyM6jijQ3AA3PL71cRelj/fH0TyLJ/ZVnhPgydCh3SAbOa3J9lGP?=
 =?us-ascii?Q?pjDcC+nRPBQRDfK2UnZl4BjqIlyzSCLYFfE4QOMr7rMYG5xZ17WqX8dWaIl2?=
 =?us-ascii?Q?tY/g2xEUEXFVYVgCD4yn+IPKsiVoU33YtyvaKUeW02WjzDoVYS8r+AQ6hz7q?=
 =?us-ascii?Q?46s+58TWp9Lvc1Ly4j2ZT2iIKvYeEXBoKenk8tLUQNgsY4sFUshBYQDUnf1u?=
 =?us-ascii?Q?NbTnv2rN3qDYnKja0tRCBsq8q3gkHjcLjs9p5r42aSL5vYdpX2YTwlGT4kD0?=
 =?us-ascii?Q?ZpegV4pHAUZ1GDEcZWcnik1iDLaLixW6P07oIHozcu0a4YtvBbqJa9L63oJM?=
 =?us-ascii?Q?e9yF0/5q6x+SxbxssOG+laq6oM1wVO5009dTcnxHgJFMnfDAUAsHFZoZAxcM?=
 =?us-ascii?Q?t2Vo7TgjBcZ8Jua6Ra2NtDVyTzo6M1bdQmwoU08XwbqrCl7OAxfiSzWrZbFX?=
 =?us-ascii?Q?XLglb0maPUfBIKuPorx9fLXpFwMAVZ/0UG51MWiLBxA+0/r+ned7k8wGzbQ/?=
 =?us-ascii?Q?vCHbgyQBOOodM1uy4NhjOxrS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea02861d-1a83-4121-adab-08d8d3c0d5f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:54:05.2995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGi2TT1aJ+tzEJcSHp+cJf9nqyW4ea/6lJgxvWleBBKRkoIiynpHqKIWEk5dTj41/PUgtzgdXRzYbb4e3KGcPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
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

This is the v4 series to add some DRM bridge drivers support
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
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 108 ++++
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       | 485 ++++++++++++++
 include/drm/bridge/imx_ldb_helper.h                |  98 +++
 include/linux/phy/phy-lvds.h                       |  48 ++
 include/linux/phy/phy.h                            |   4 +
 include/uapi/linux/media-bus-format.h              |   6 +-
 20 files changed, 3828 insertions(+), 1 deletion(-)
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
