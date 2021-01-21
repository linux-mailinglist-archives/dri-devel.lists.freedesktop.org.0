Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A42FE578
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4F26E8E5;
	Thu, 21 Jan 2021 08:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088D56E8D8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:25:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+wn3g1uSRYumOim880RGTcx2EvBTpzR53SxaMLv6q7V+JMWH75EA+uOdje9t2UwGgLwAfE7/tG8pI2Tuki2j0txMCDgDpYeMskcayP7o1a0fixWohyR6ToTkeKEcWgL/WT3oTrbSt3W0U5wL44B6eRPpjOWntyronAAy90NBN1TGtTAYqvYM+b5TPE5WgjbVFDb2eqo1hhEhuTkdARxGu+abJUzu//m0ao8JH88yOwIKWWDFdFaMKpQqUqTFExoA3T50vC2pYx1xZQYUpMVnHvR450SZcdEx8LpkmJ8WjKJbenNbmcfchOytyj6GnFH/xlggNy1dsrLut+JUiXySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PALxsBG3sk35L2qbh/oWTlB+G5ZPCEbjgqF5Rr6Cpl0=;
 b=SEJqoiSGjrQP/MJKooMjDucbYPZ6QP4u2yjK5B5U/txCLRCmqhj4eHtextHj40GrFZnmOKcj5s00F9hW+NmM4RoMpuzSS7TJAyAML3H9K8tLntnip9LOaN+d1QpDtG/+HywXI4NZ3abdE4JhEk3uSSHXTNBsfqeX7rb+r6mLFTU9t2od1c3UE2lk2Q+t5OEoEuCPqXmYUS+qO5u9B35nnFP+rWPnnG/E500e8wyxVm+9rcHGwNw9mDg24ubogS74KE3/A/+iYbkbn+augy7Xrfl3qOhdhU06k2xzbIk6HwvovTZcZ+nnNaZG1jnx21SYWhmBDioD6szkFG3ZlSAI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PALxsBG3sk35L2qbh/oWTlB+G5ZPCEbjgqF5Rr6Cpl0=;
 b=Wxh3vpsSDPkrujrCjvobP0SLnjqYaaDAkr1lfuAguiPig5pOLU7a9HIK+/++5A6NqvyC773Qvxyb8NMac9ZzGpZM54o2Ekfb+serulcC10+O+dQN9qBIVfJC5ytCjicrLoX8iqyUMXxQmvT/iFdW9IuaamV6OgsdUmspxDERme4=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5711.eurprd04.prod.outlook.com (2603:10a6:803:e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 07:25:05 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3784.011; Thu, 21 Jan 2021
 07:25:05 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Thu, 21 Jan 2021 15:14:17 +0800
Message-Id: <1611213263-7245-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0123.apcprd06.prod.outlook.com
 (2603:1096:1:1d::25) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0123.apcprd06.prod.outlook.com (2603:1096:1:1d::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 07:25:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 414492df-3cbc-4a99-4a81-08d8bdddac83
X-MS-TrafficTypeDiagnostic: VI1PR04MB5711:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB57116B936566F0AFBBBC6FD198A10@VI1PR04MB5711.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EeEtDVssHQsYDQTGPXlWEjUxGgEOSXnq+qgYjfgo0uX4GFhb/TkZ+Rj4TSp+0hro16PEMf9bpp0SBugFfdoPPNuT+h7T5iRx9Ff7aaNuLdXRHnA56dwfWb+/lJFmdkYx+o478305hZ15bt15+tmMa/hLpw1TgB6mHyp0J0oMfg4ENTbC6hOufVsQ/vUUuf3iUcMnJDEOEjrVcUqKQff83rCArHehHcIO7dF8WevecSga55nDh/gl0HnoNvrpEX6lxdEZrUaP/3/wr/ezXQUVVI+aXnpSb1NUwwRI0Z75Y9PaF44N6Z6qksXunXAw29pI6jq+4iwaCy5Q4+6Pep5BeWlXERTXzeBFLjfs1zIJGxDwOrvdsSC6Vemlm3jW2Y7XkH+na6jKd1ZoLSWL+qL2+mD/C7biPiWx90nk2zEC2NK2lTaxduN/bLCZffQzyISTHvcg1gBR96AZfsDvGFA7ddXijIGhuicH2yvojaqsZ+BnKXSJPuO3BH2wfePh2flBPgYKZbK1oCcPjlP0vUgL1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(8936002)(2906002)(66556008)(66476007)(478600001)(36756003)(186003)(6666004)(4326008)(16526019)(66946007)(83380400001)(966005)(6512007)(7416002)(8676002)(69590400011)(2616005)(26005)(52116002)(86362001)(6486002)(316002)(5660300002)(956004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3IBHcKfJhP146dwOEBtZ+SBefMWJNYcT2EvBhFMR/RfT4UQ4HmXibCqJqiGt?=
 =?us-ascii?Q?/jMX3X8oUycT/dgNd0FPrLPNJ+PjOCdBWp20Hs4+wQjsJZKEVP3keJ3WgMNv?=
 =?us-ascii?Q?b2ffqQ5Dly7LxSqVQTkGQJH9Dud8nZpAFYcyF/2JLhz+P8qGkDMmRSSIS67N?=
 =?us-ascii?Q?9NTK8iHd6pVMleioaTsbrZE+6c8UXaw5y6R4oyXJEYBX/bvdBYDtzuNW8uMj?=
 =?us-ascii?Q?qa7gdH4TEBbAUwTTwUPT77l5N1imWLLG4UKMuvLaaoao85MB0YzKcOYmZxAz?=
 =?us-ascii?Q?19fOakHYUru5N2B1ludx3TVzwRuV1LyI4ZMPyBDKGnnt5OfnrtXp5axCRpFB?=
 =?us-ascii?Q?1bF5deS3+s6fj0QHUcud9gSHjn9KjcSdKNgK3iqy2zeKK8L0runFCdhN9YZ2?=
 =?us-ascii?Q?PUBV0AFEeYXNSu3IiWz4zk15MUY2guUZqMvQv4WSetvZ669vVERzpZUqGKpa?=
 =?us-ascii?Q?9RADAQfx0bJhUNO4RxI7nUaww7xbGNeiQkOyaxnlTirWEA0VnqomITC8LAwm?=
 =?us-ascii?Q?0ZJwW4NDF5wKspnTHNq2W9RH+ck3XreheVlNzYJ5PhDvHbbwCNBBsVWXNfNy?=
 =?us-ascii?Q?UWjEhE5h0Knbfn8V5bhO2C5Vu1OjS34kK2V4uMQPWemqg1EzLe3zp3VoywK3?=
 =?us-ascii?Q?FxaoCp4bsXYoOqVXKc2HyjRvnHs1DQ+1iXVhszCgDwppa9AnhLK+/hGUOJNn?=
 =?us-ascii?Q?0HW7rbMF/cn5fMnAbKUrDbGwr4e95VoVQjltocctm4D45ANjNRcd6PwrOCck?=
 =?us-ascii?Q?QrbJ8u66K6w7JwUQ4wp2gPCjlU836N6OPFnEgkZ2s5S4KNZdMO8+jm3fpHj3?=
 =?us-ascii?Q?jkEL9ACbz9H+FALigzIifIfzUdo77u+ITmcv5D4mgoWwYSNJIq69kbsjxOcP?=
 =?us-ascii?Q?G2C76fsS09dzf4yaZFDxiowVmtOWUBbMRPTgB/F5EuGABwYkLZ90tfKor+iD?=
 =?us-ascii?Q?QpE0RdArmYQiHQf6IoBJNLqHJYE4ujzFYtTmAj30eOswEUarZuKXG0e8VEBp?=
 =?us-ascii?Q?dShb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414492df-3cbc-4a99-4a81-08d8bdddac83
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 07:25:05.7739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouKGmwXY7/GJPdsaFK4xrUETBHiKjQ7VuRvLmKVXr56Z2LC+z+M7pkeQ2Hw6hSjEVDXWRP9I1sCZgSK+SPoRFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5711
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


This is the v6 series to introduce i.MX8qm/qxp Display Processing Unit(DPU)
DRM support.

DPU is comprised of a blit engine for 2D graphics, a display controller
and a command sequencer.  Outside of DPU, optional prefetch engines can
fetch data from memory prior to some DPU fetchunits of blit engine and
display controller.  The pre-fetchers support linear formats and Vivante
GPU tile formats.

Reference manual can be found at:
https://www.nxp.com/webapp/Download?colCode=IMX8DQXPRM


This patch set adds kernel modesetting support for the display controller part.
It supports two CRTCs per display controller, several planes, prefetch
engines and some properties of CRTC and plane.  Currently, the registers of
the controller is accessed without command sequencer involved, instead just by
using CPU.  DRM connectors would be created from the DPU KMS driver.


If people want to try this series with i.MX8qxp, clock patches can be found at
Shawn's i.MX for-next git branch, and power domain patches have already landed
in 5.11-rc1.

Version2 dropped the device tree patches because we'll use new dt binding
way to support i.MX8qm/qxp clocks.  It depends on the below series to do basic
conversions for the platforms which has not landed yet:
https://www.spinics.net/lists/linux-mmc/msg61965.html


I've sent the below series to add downstream bridges(embedded in i.MX8qm/qxp)
to support LVDS displays:
https://www.spinics.net/lists/arm-kernel/msg868239.html


Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
uses it.
Patch 5 introduces the DPU DRM support.
Patch 6 updates MAINTAINERS.

Welcome comments, thanks.

v5->v6:
* Use graph schema in the DPU dt-binding.
* Do not use macros where possible in the DPU DRM driver. (Laurentiu)
* Break dpu_plane_atomic_check() into some smaller functions. (Laurentiu)
* Address some minor comments from Laurentiu on the DPU DRM driver.
* Add dpu_crtc_err() helper marco in the DPU DRM driver to tell dmesg
  which CRTC generates error.
* Drop calling dev_set_drvdata() from dpu_drm_bind/unbind() in the DPU DRM
  driver as it is done in dpu_drm_probe().
* Some trivial tweaks.

v4->v5:
* Rebase up onto the latest drm-misc-next branch and remove the hook to
  drm_atomic_helper_legacy_gamma_set() from patch 5/6, because it was dropped
  by the newly landed commit 'drm: automatic legacy gamma support'.
* Remove a redundant blank line from dpu_plane_atomic_update() in patch 5/6.

v3->v4:
* Improve compatible properties in DPU and prefetch engines' dt bindings
  by using enum instead of oneOf+const.
* Add Rob's R-b tags on dt binding patches(patch 1/6, 2/6 and 3/6).
* Add Daniel's A-b tag on patch 4/6.

v2->v3:
* Fix DPU DRM driver build warnings which are
  Reported-by: kernel test robot <lkp@intel.com>.
* Drop DPU DRM driver build dependency on IMX_SCU, as dummy SCU functions have
  been added in header files by the patch 'firmware: imx: add dummy functions'
  which has landed in linux-next/master branch.
* Add a missing blank line in include/drm/drm_atomic.h.

v1->v2:
* Test this patch set also with i.MX8qm LVDS displays.
* Drop the device tree patches because we'll use new dt binding way to
  support i.MX8qm/qxp clocks.  This depends on a not-yet-landed patch set
  to do basic conversions for the platforms.
* Fix dt binding yamllint warnings.
* Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm in DPU's
  dt binding documentation.
* Use new dt binding way to add clocks in the dt binding examples.
* Address several comments from Laurentiu on the DPU DRM patch.

Liu Ying (6):
  dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
  dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
  dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
  drm/atomic: Avoid unused-but-set-variable warning on
    for_each_old_plane_in_state
  drm/imx: Introduce i.MX8qm/qxp DPU DRM
  MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     |   87 ++
 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      |  387 +++++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |   60 ++
 MAINTAINERS                                        |    9 +
 drivers/gpu/drm/imx/Kconfig                        |    1 +
 drivers/gpu/drm/imx/Makefile                       |    1 +
 drivers/gpu/drm/imx/dpu/Kconfig                    |   10 +
 drivers/gpu/drm/imx/dpu/Makefile                   |   10 +
 drivers/gpu/drm/imx/dpu/dpu-constframe.c           |  171 +++
 drivers/gpu/drm/imx/dpu/dpu-core.c                 | 1094 ++++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.c                 |  967 +++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.h                 |   66 ++
 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c            |  117 +++
 drivers/gpu/drm/imx/dpu/dpu-dprc.c                 |  718 +++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-dprc.h                 |   40 +
 drivers/gpu/drm/imx/dpu/dpu-drv.c                  |  292 ++++++
 drivers/gpu/drm/imx/dpu/dpu-drv.h                  |   28 +
 drivers/gpu/drm/imx/dpu/dpu-extdst.c               |  299 ++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c          |  294 ++++++
 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c             |  224 ++++
 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c           |  154 +++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c            |  609 +++++++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h            |  191 ++++
 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c            |  250 +++++
 drivers/gpu/drm/imx/dpu/dpu-framegen.c             |  395 +++++++
 drivers/gpu/drm/imx/dpu/dpu-gammacor.c             |  223 ++++
 drivers/gpu/drm/imx/dpu/dpu-hscaler.c              |  275 +++++
 drivers/gpu/drm/imx/dpu/dpu-kms.c                  |  540 ++++++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.h                  |   23 +
 drivers/gpu/drm/imx/dpu/dpu-layerblend.c           |  348 +++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.c                |  799 ++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h                |   56 +
 drivers/gpu/drm/imx/dpu/dpu-prg.c                  |  433 ++++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h                  |   45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h                  |  233 +++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c                 |  250 +++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c              |  308 ++++++
 drivers/gpu/drm/imx/dpu/dpu.h                      |  385 +++++++
 include/drm/drm_atomic.h                           |    5 +-
 39 files changed, 10396 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
 create mode 100644 drivers/gpu/drm/imx/dpu/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dpu/Makefile
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-constframe.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-core.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-extdst.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-framegen.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-gammacor.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-hscaler.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-layerblend.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prv.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-tcon.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-vscaler.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
