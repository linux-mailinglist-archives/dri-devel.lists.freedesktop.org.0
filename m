Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F322CD0EE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279796E0CC;
	Thu,  3 Dec 2020 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20065.outbound.protection.outlook.com [40.107.2.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69376EB33
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 03:14:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKPP9sfZWdStpNGauSTQoTFby3/ChWF2z4Q23FGxQoOWTcIWo/VLQg7D9X/kTgFg21fVm04USS+eg5QJW5NOePs9UtpBtTU4nupDKwxpAWdcRuYItt/L+4ONeFf8GdwETHWGBijFwbijflkSmKvLbcv7sD0hbsiuY+9/wKx6j+BProLXXu4P5ZArSfwBvl+D264JnLi1nlgNZFb5Dzk6/FFR74dcVLCuv7BTQyAaV+z6MZbKZWJS0KWetGa8fzSk/phErzcd1A4sS7ErRYoEQ2bx9SNHnUvY7H4qrPRNFrTu0nuPowSwe7lZXbVgvS9NUBQ7081CU3dHTtJJsqzrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTRnOmtA2L0I9hqJY9mxEzszA6lBbrtmadAiUMlfRXE=;
 b=czU0kGwBuWIgEZJ+KBBguxoyUQr5qLYl61ZX88wBPEdBAIo47Yyw9b7R6czQ7l/US5bKRDBStl+TO5oreF2ccYdR7A69Tc6A3s5SgPvIdPKHxXAvLRUgBjnUchq5LMK5oXEhw6CHplieQ7wrEaIFACvwTziRkfZ6OXJBpyKSr3OnojIrbccSjdsh8ZJVchPr8Y5qfqiK++fs3Du4zrY+kfAB+bkHD44wJ6LcLOIp95iqhXGDQhEfixhIidEB7kfu6Cj5GqQx9pBZW3KBkL583T9T2ku+qTPjsSuIopAEGcnoeasZNSWdWsKOzbmujm2dX63ghpmhKOzWK+SxWHrQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTRnOmtA2L0I9hqJY9mxEzszA6lBbrtmadAiUMlfRXE=;
 b=AP6lfcXHlC2khmQuvTM1/ojE9GYlDzVnqZolV1M2rj7C5DAMDBLBP1G5cR7fjx4QWEZ9EZvLIMzPVmxWwkb/MsarAJ9rL9EfZ22vGtAWRCHhbWcLMEga+fLysE+kqXmxsolxXxmXmBWrNUhGyq9ndD3yFrSXv7GnY2cIjBIJWGQ=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2879.eurprd04.prod.outlook.com (2603:10a6:800:b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Thu, 3 Dec
 2020 03:14:16 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 03:14:15 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Thu,  3 Dec 2020 11:06:25 +0800
Message-Id: <1606964791-24927-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0028.apcprd02.prod.outlook.com (2603:1096:3:18::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 03:14:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 473057e7-057f-4bae-9745-08d8973983ec
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2879:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB287924590436584886D62EE198F20@VI1PR0402MB2879.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hOE6Swx7kMSklLaj4iKeA2HVmDMCtcdceWDdJukqA92ovOpXyg1tA+h5BEMwKJoMUSL7g3Jt4VGoRowVzECgoRbLwdFjDWkUWuB69QdmHQFhTAj6kjYmmX7+ziG5qsTWTewzASPVDHclikch4HVr3kXigUci2gbiMObFcIJ+VCX4UleuDxnndsefscIPcgMo2Uz2cE6r3FXrFYxroZo+XCh5pFgTOKVVHsU3bsnwWVfnacTFdbK5ZWyMsYr88fhPjvkMJ5VVJq17Cq0HFdGNimBaSrk26i3w9G2F3jW7+NcVc+0jgWPZJB1ElMLNZX5jTt6W3Gf8MiIsXSb8dGF7a183dtgqaaXmuD6Hq+KUvtNWeMTaR8GzdqXxdiL8RxZfA4lOUrxBD2Q0ByEoqr2GG47YBfaLEhRWZBNJ0eqBadk1/VNQwKifP5dQ8b3BaGMOyWQiEuiKwc9BzUC9jVGNXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(8936002)(4326008)(186003)(66476007)(6666004)(66556008)(5660300002)(26005)(478600001)(7416002)(6486002)(956004)(2906002)(6512007)(316002)(2616005)(66946007)(8676002)(69590400008)(86362001)(83380400001)(6506007)(52116002)(966005)(16526019)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hrnt4v00Z88yfv7O3f9Eca3vJKWJRcZiiGXEbdhqp9Bxdcngwh1qJ0yphJI5?=
 =?us-ascii?Q?mFplm0DKLjMDt6nhMKPfPhBDffEYOl+wiBu2oinoxm7oTvRBcLcQpWlgynw8?=
 =?us-ascii?Q?310uUciHwNwBhnk4qfjzyQMZ7sgOXBEvi5L7BmMW06dJTSQ0BT77akRIF4gS?=
 =?us-ascii?Q?VzY8KzXXB1FI51BSRIM9ogej/GtC1C18FZT15dvZzKa6lMBEEQ2zj2D7iV1o?=
 =?us-ascii?Q?QnXIvvXdKbpM6kmQ5xeJA7Jh8apstbr5qJg0LZmpZjIS6nt9tgTmmgaeAHBC?=
 =?us-ascii?Q?10blWKpCsIFCqs3nq4ugifR7wSWNjvoKx81KOu+e3ns55r2fTCqjCzF59egz?=
 =?us-ascii?Q?F1Nht1Z+Kxw8ywPPMVD1tBcfC4pSPqPJIFSUCLLZK+j82iHNmZYgRwxLuz9N?=
 =?us-ascii?Q?/nGP/Q1+BFjjIuVNhq7bkQ8REhDBkF8gufE+x/Dm4YZ6fOOF3NoAEjcPkIw2?=
 =?us-ascii?Q?n5ohmSCBnGBfSkAZU0+5+bIBdnr2nPyLejiI71WRxj7zNeMfeBhOhqrXSnGm?=
 =?us-ascii?Q?ApyGGjpJ+7C9lANOqgP7kY4uXc7rYWB5wQiC5kZSoY/C7C/kPjyRYq6nsvzr?=
 =?us-ascii?Q?q8vj7uShMIO02TnAKfv8TX98Nya0PObWJvtDmLgtg/VGLAEeLkv80cmV7IN6?=
 =?us-ascii?Q?4OxV0mxWTpjrBoIoNhyFqopD7VRgUoLzCwACnR4KVjDj8NnnV9uQxfwyrC9E?=
 =?us-ascii?Q?v4w4tSqqatP7gSvZIBKxwBCIyiz8PoH/rwDyay9hwHUpxmK1fi/OsWiU6TE7?=
 =?us-ascii?Q?AXH6gdO9P/bKPXUzFbG9FrkV/DkXtvTduwj/R9Sa9+vayerQu5iAtTsrSwg/?=
 =?us-ascii?Q?LqVp54NW01J2m2nhfHd3KRMl6oeUBBEQRNoguVG1lk2lP9xmRXDRE2pDi5h1?=
 =?us-ascii?Q?Ap+AgLwFZ7dnMZ5NTOuawqIEmmRI9jJBjnLtUgF3g/sJeOZTkf9h3uc+JGT4?=
 =?us-ascii?Q?JVg8C8EnaC0TuAXbqfM+cwvJ5fepmFFNI8rYalCUFIo5hi/nvnRgJkSgVzli?=
 =?us-ascii?Q?rVZm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473057e7-057f-4bae-9745-08d8973983ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 03:14:15.8843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3vM4oiaswE5CPT1/r8U8GeMiKDuSXvLEuC0HHEZ75ZtqbCR7a9cR8xNHDFIW2cYf7EBudDBhd5hhPF4PP6Shg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2879
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
 laurentiu.palcu@oss.nxp.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


This patch set introduces i.MX8qm/qxp Display Processing Unit(DPU) DRM support.

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


If people want to try this series with i.MX8qxp, clock patches can be found at:
https://www.spinics.net/lists/arm-kernel/msg859763.html

and, power domain patches have already landed in Shawn's
i.MX for-next git branch.

This version drops the device tree patches because we'll use new dt binding
way to support i.MX8qm/qxp clocks.  It depends on the below series to do basic
conversions for the platforms which has not landed yet:
https://www.spinics.net/lists/linux-mmc/msg61965.html


I will send other patch sets to add downstream bridges(embedded in i.MX8qxp)
to support LVDS displays.

A brief look at the pipe:
prefetch eng -> DPU -> pixel combiner -> pixel link -> pixel to DPI(pxl2dpi) ->
LVDS display bridge(LDB)

Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
uses it.
Patch 5 introduces the DPU DRM support.
Patch 6 updates MAINTAINERS.

Welcome comments, thanks.

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

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     |  87 ++
 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 416 +++++++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |  60 ++
 MAINTAINERS                                        |   9 +
 drivers/gpu/drm/imx/Kconfig                        |   1 +
 drivers/gpu/drm/imx/Makefile                       |   1 +
 drivers/gpu/drm/imx/dpu/Kconfig                    |  10 +
 drivers/gpu/drm/imx/dpu/Makefile                   |  10 +
 drivers/gpu/drm/imx/dpu/dpu-constframe.c           | 170 ++++
 drivers/gpu/drm/imx/dpu/dpu-core.c                 | 881 ++++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.c                 | 926 +++++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.h                 |  62 ++
 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c            | 114 +++
 drivers/gpu/drm/imx/dpu/dpu-dprc.c                 | 721 ++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-dprc.h                 |  40 +
 drivers/gpu/drm/imx/dpu/dpu-drv.c                  | 297 +++++++
 drivers/gpu/drm/imx/dpu/dpu-drv.h                  |  28 +
 drivers/gpu/drm/imx/dpu/dpu-extdst.c               | 296 +++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c          | 291 +++++++
 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c             | 221 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c           | 151 ++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c            | 609 ++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h            | 191 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c            | 247 ++++++
 drivers/gpu/drm/imx/dpu/dpu-framegen.c             | 392 +++++++++
 drivers/gpu/drm/imx/dpu/dpu-gammacor.c             | 220 +++++
 drivers/gpu/drm/imx/dpu/dpu-hscaler.c              | 272 ++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.c                  | 543 ++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.h                  |  23 +
 drivers/gpu/drm/imx/dpu/dpu-layerblend.c           | 345 ++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.c                | 703 ++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h                |  56 ++
 drivers/gpu/drm/imx/dpu/dpu-prg.c                  | 433 ++++++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h                  |  45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h                  | 203 +++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c                 | 249 ++++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c              | 305 +++++++
 drivers/gpu/drm/imx/dpu/dpu.h                      | 389 +++++++++
 include/drm/drm_atomic.h                           |   4 +-
 39 files changed, 10020 insertions(+), 1 deletion(-)
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
