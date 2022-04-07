Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF84F7B0F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B745110E5B6;
	Thu,  7 Apr 2022 09:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4394010E5B6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:10:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mobnyfX/3WF9hfKpSU8191M5JzmqOVbXaCSjOQ7faekfbU3wHGIV+Cjgai+bPbW8Tqo8ro4OgKByH6ZsXzESNlKkXAsr77XkwNOHa/qyq8EiIZBkOFmGe9T9wBJxdISjHAZkuR3Z91bab7iQW1QRRfBUyH6u7vnDonBpGiW6r/ZVHz+PSEBGi0WWUYhIlhIh9zqjtASzro9lgp2jeqhkCjodNsUGnOsQUHjntGa3CmzsDJLAqNR3XMbzmEL12gcJYFhcOwaGFZdtU8OsSZcI6Wa9wP6lrCZpE6qpOpwAQiotXgyOHSkKFgCnopQsVnqKkOPeNW40wk8vPNkzx7n90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cd3HW1COAB8Ms0t19raS20uwMQ9bwt2RaPNlFsBN//Q=;
 b=jiBsuqyRtBQU5aHYT7k9Y8RGy/dtwlObL2RO7+VOPwycsElIyGQQD4tFP/vx7WGOagvGCFkUcXlQPfZODpiLO2tk4xh1aEounOX3DNGFS2ERJtpt+7k99hSGB448bA+AQV2YiFxG5Dk5rpsQhI4ZVl2F+9ZhPnHzys5kGawqoyjLQ2P4+wRgVRiKxiAgz/Y8ZTsDnneIa49LMPRh81br6f33tStulPz2ubb7WH6J9B8uhdsDnfRgb10LNu6fT4SgdsRfqaNiwUnaW3N6SYOk+eGfcWD9iDqb6y1f8F3AhHqVATfOeWjCi4c+O9lqFhT/kOsuCZYWWu85wEUXzWP6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cd3HW1COAB8Ms0t19raS20uwMQ9bwt2RaPNlFsBN//Q=;
 b=ajxUw19ybNAKOwmA0rlu7x4biujCXBuST/mQE6pjMmz4E+uic6tjlsNjeLEQbnB3yIS3l1WIf3ZZ7nHNzTDrTV6UyQ1jYNmTToGOEQhWdYiVimaDW3Pyb+PdYbcf5gzBoQPjF865InHLvunhobexm+kTGQJ5nCihNXEaj2W9VfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9344.eurprd04.prod.outlook.com (2603:10a6:102:2a8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 09:10:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 09:10:18 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Thu,  7 Apr 2022 17:11:50 +0800
Message-Id: <20220407091156.1211923-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cce502e-a93e-4714-9b98-08da18766f4c
X-MS-TrafficTypeDiagnostic: PA4PR04MB9344:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <PA4PR04MB93447790138217A45D6B843D98E69@PA4PR04MB9344.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: InMPxKtwwMj3C7CMKrNrk1wP6Vy4Gzsfhq3/IGDcv841LmY0eSYFABgeBQmuBeJzH37p+/4WgmE/i8M1JpQNLMUHnTTafnuBaElVWVo/8Ye45hukzi+kTc1pSkqaq03B/vhaNNlNEZjzIh5QkPLAOSCS986+RpLFFpYPSGYe74l6zZzk9Kshi53uKIx47V5INVoCLXal3XHWUtLX0Ic3VdPZn/Kv9OTa1Zwnzh6jiIQj+aXEk/YQ7igY8KL1SVKags86KCR4ofprJaFFMfFNjs1C1pCS+avYBLeQIrWROgbakow1YsMs7y77sr71rbrequsT3VgvLNPe/bD1eFQcKjfSj/LBUTKufZxft+ZuPlvTobJkjQ9sF3OpQ6c5YyddwCKBRoDPAeGEA32GzUkiYhIIQo3eSDUdsaecGR8TD745IY7veAilnAM4xwSIyIncA/jKp1ANxZYooTzyZ+jgrrhy2qripE89JgGT/niRkPSQz7tqEHnRrZ+PggU9M1I7vNyBStfeAEH3DHQ7J0/6g2UbG7tEXCAcQDAWcSSnNPFkkhPRtVUWZNwbS3eNF8I9D49X00EDruOvoH9WdmXKvEcRmIRzVSeEz5FEtKsK7wLgSerExHVB1LLRkZA7Aas1kA7h7Hka0XZvK3fX9e50T1B9EtngVdugnKKVRcEy8Ak9Eur3sU1CNbHUTSRRiSrG7Jc+8fHeD5sUbX6nwY0crjFdgIwF9Z86Z7024+q1VRdK3ASjvGS/KLOz6kKvFcjPRTblIQq5G9PlXN0Mcy/9IHUyuu53vWFqdOdgD6wnxUE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66946007)(6666004)(86362001)(8936002)(38350700002)(52116002)(4326008)(38100700002)(66556008)(66476007)(8676002)(966005)(6512007)(7416002)(6506007)(2616005)(83380400001)(186003)(508600001)(6486002)(26005)(1076003)(316002)(2906002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zTTLuM73lV+6BLgdKhU1NFHBsxMMGao5TqmbAcG8/czv/GmMrOiuNOeJ3TCl?=
 =?us-ascii?Q?N/zll3648EZYmVwZNQhU+kTEgaNeHUKu0YUqvHCZfGZ3YRu/szovTY01t9h1?=
 =?us-ascii?Q?AmR0RSBoxodljfz/J745CGkHOUxxPxOqlQ2eNfucaxjjeprWjf9HwnmhKkvF?=
 =?us-ascii?Q?aCt7Gqba+8zErZx3toiFGucWdA1KTQK/PueQ6V2Qqg8uvjH64T8aPtGvm6q+?=
 =?us-ascii?Q?/7hZ5GtQgu7qyT9EMd8r1MZZR2SKqKko2DiYDQoulJLitKSN3547Gew1KsrI?=
 =?us-ascii?Q?1v0dWOqD4dmeuHnqL7yjPl4Nn1qbMl38aaHmh9B1amRfyjLxegUrpIRu8iF+?=
 =?us-ascii?Q?uy7CXEjK8TncHU5cDe8l27KgVDdatfiLS+pzKpDR35x8eNj2tmMtBGwfYca6?=
 =?us-ascii?Q?Nhq/WZI936h9jpg+b8AoN8ZP9xFQtIsn9QmOmolNC1eRlmwsfHJsTI2QY6ZH?=
 =?us-ascii?Q?CxifG544PW8bTAfWcE4Y/VZSKUivuhJ7tg4TA+SNhqvIjrkqNtZPEnWB/+JP?=
 =?us-ascii?Q?p6ya5hqTk55K/JO8oY9g5qB1bfPv7UNSkjsunPR8dGEtg+aDx19AJ60HIzPu?=
 =?us-ascii?Q?/fEtwVTBAZmEY5pXzuNN+hWer2DW72Ng/fi/IMwoo6YMGKcNh6fhcZeEjxxR?=
 =?us-ascii?Q?Wlr7JZ9t8xyL0U3j2f5ep6BSNQDtxKwGhST4YZ4+PXxm+ikmvS+ddBpB70lq?=
 =?us-ascii?Q?oHOT5nKGsaTj/HJmod8EEFIGnKsBC+q04CZgnmDlN9hLDxpvCwGhYxRZEUEp?=
 =?us-ascii?Q?9GIFuiDwWZcbslmPQR9y9U0Iz0ip/eaNzDwgPqIOi7CCY0b+9MleXmAUabuI?=
 =?us-ascii?Q?TfHaS7qmtLCtHKXpq1Pah72JEIY1Z2NKfAuDKN8aTpgY/VOAqL5lEyNPF98Q?=
 =?us-ascii?Q?2ihVEss9y1CtabI+LCSMFKML6MyRZ5428D326sml+jL1Mlq3J3vE6VpeSl2i?=
 =?us-ascii?Q?N6rXpmpipABgMlvIQlz/VmDOFYw3eKgghBUzSiBNMzZvnl/HzdJ1dWpfkFTR?=
 =?us-ascii?Q?RU2WglagdOWcs0GaWapkPYhDdq34nQqpOnac5eQe6/t4dknS9JFqo11/TQEs?=
 =?us-ascii?Q?mHBD41gj6KUZdpDCM897oW7CKK9ntsdNGj7HYRfnCjXvf61cVOpuF3OR0uaN?=
 =?us-ascii?Q?GhdPx61l8UTDdHdCigyMlO8Hm3ECSAIMQu5g1ohZhXis+mr1FaisZUOhjRG2?=
 =?us-ascii?Q?TKrH7v9BsgBflLzDRVyTK3rjfr03JcQIY/eGy3zOFYlIllDAPG+8mCJ2D+4m?=
 =?us-ascii?Q?KJQHHC+Tcsl8rWfA1Wl0awgXte/5FUkbYAhWTjsRdYB+bX99ne4bYN+wg1Y+?=
 =?us-ascii?Q?G7+vn5gDA8yBepQ0EWL5LIBWcp2GNQRj8nI1GweaheqeWMKLFlNmo37K6b+G?=
 =?us-ascii?Q?OarVA/slwMLSGKGICOXoAeDggxnP0go4h2o9LhZCgbWLOoyoyi0zqp6iJAdJ?=
 =?us-ascii?Q?sYmzwQHCGorYcJiuUuWITYQRLjEolSAKIiYvQlq9IGCKX1OzTTAZHpfKpArc?=
 =?us-ascii?Q?hatJXBGc1WWMicSiHL6Bdtcs2ZTHPgwg7FG3E1rPSxgANYz3OolvrPd4z4Sf?=
 =?us-ascii?Q?yhE1yTqvhqwSs0FdyosQtF/ho1EdBGdgh3tX8VVgdHkDpgfVcETjAJ8q4KEM?=
 =?us-ascii?Q?h/SHDc5UqjjFN8AXJpjBy1Om3AsaUZIwqUfAuNEdBXEt51xWPzuhTZ/sYlTD?=
 =?us-ascii?Q?0vVKMDQBdsIL6h1VwPyCZfk7a69StZBl/pKZ7wbhyExrVScPYV+t6T+VYuoe?=
 =?us-ascii?Q?st9oWbp1NA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cce502e-a93e-4714-9b98-08da18766f4c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:10:18.3688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ip4h4LXSgt7T9Zm0Wcqqjg4KY25DxChV/Cp3BPtW40X/2jIov9lcPE4LfUMIu76ncFel+hea7LRPVqPQBRODpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9344
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
 marcel.ziswiler@toradex.com, robh+dt@kernel.org, linux-imx@nxp.com,
 laurentiu.palcu@oss.nxp.com, krzk+dt@kernel.org, guido.gunther@puri.sm,
 shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


This is the v10 series to introduce i.MX8qm/qxp Display Processing Unit(DPU)
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


Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
uses it.
Patch 5 introduces the DPU DRM support.
Patch 6 updates MAINTAINERS.

Welcome comments, thanks.

v9->v10:
* Rebase the series upon v5.18-rc1.
* Make 'checkpatch.pl --strict' happier for patch 5/6.
* Add Rob's R-b tag on patch 3/6.
* Add Laurentiu's R-b tag on patch 5/6.
* Add Laurentiu's A-b tag on patch 6/6.

v8->v9:
* Use drm_atomic_get_new_plane_state() in dpu_plane_atomic_update() for
  patch 5/6. (Laurentiu)
* Drop getting DPU DT alias ID for patch 5/6, as it is unused.
* Reference 'interrupts-extended' schema instead of 'interrupts' for patch 3/6
  to require an additional DPR interrupt(r_rtram_stall) because the reference
  manual does mention it, though the driver doesn't get/use it for now.
  Reference 'interrupt-names' schema to define the two DPR interrupt names -
  'dpr_wrap' and 'r_rtram_stall'.  Accordingly, patch 5/6 gets the 'dpr_wrap'
  interrupt by name.
* Drop Rob's R-b tag on patch 3/6, as review is needed.

v7->v8:
* Rebase this series up onto the latest drm-misc-next branch, due to DRM plane
  helper functions API change(atomic_check and atomic_update) from DRM atomic
  core.  So, dpu_plane_atomic_check() and dpu_plane_atomic_update() are updated
  accordingly in patch 5/6.  Also, rename plane->state variables and relevant
  DPU plane state variables in those two functions to reflect they are new
  states, like the patch 'drm: Rename plane->state variables in atomic update
  and disable' recently landed in drm-misc-next.
* Replace drm_gem_fb_prepare_fb() with drm_gem_plane_helper_prepare_fb() in
  patch 5/6, due to DRM core API change.
* Improve DPR burst length for GPU standard tile and 32bpp GPU super tile in
  patch 5/6 to align with the latest version of internal HW documention.

v6->v7:
* Fix return value of dpu_get_irqs() if platform_get_irq() fails. (Laurentiu)
* Use the function array dpu_irq_handler[] to store individual DPU irq handlers.
  (Laurentiu)
* Call get/put() hooks directly to get/put DPU fetchunits for DPU plane groups.
  (Laurentiu)
* Shorten the names of individual DPU irq handlers by using DPU unit abbrev
  names to make writing dpu_irq_handler[] easier.
* Add Rob's R-b tag back on DPU dt-binding patch as change in v6 was reviewed.

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

 .../display/imx/fsl,imx8qxp-dprc.yaml         |  100 ++
 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml |  387 ++++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml |   60 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/imx/Kconfig                   |    1 +
 drivers/gpu/drm/imx/Makefile                  |    1 +
 drivers/gpu/drm/imx/dpu/Kconfig               |   10 +
 drivers/gpu/drm/imx/dpu/Makefile              |   10 +
 drivers/gpu/drm/imx/dpu/dpu-constframe.c      |  171 +++
 drivers/gpu/drm/imx/dpu/dpu-core.c            | 1047 +++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.c            |  969 +++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.h            |   72 ++
 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c       |  117 ++
 drivers/gpu/drm/imx/dpu/dpu-dprc.c            |  723 ++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-dprc.h            |   40 +
 drivers/gpu/drm/imx/dpu/dpu-drv.c             |  292 +++++
 drivers/gpu/drm/imx/dpu/dpu-drv.h             |   28 +
 drivers/gpu/drm/imx/dpu/dpu-extdst.c          |  299 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c     |  294 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c        |  224 ++++
 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c      |  154 +++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c       |  610 ++++++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h       |  195 +++
 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c       |  250 ++++
 drivers/gpu/drm/imx/dpu/dpu-framegen.c        |  395 +++++++
 drivers/gpu/drm/imx/dpu/dpu-gammacor.c        |  223 ++++
 drivers/gpu/drm/imx/dpu/dpu-hscaler.c         |  275 +++++
 drivers/gpu/drm/imx/dpu/dpu-kms.c             |  540 +++++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.h             |   23 +
 drivers/gpu/drm/imx/dpu/dpu-layerblend.c      |  348 ++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.c           |  803 +++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h           |   59 +
 drivers/gpu/drm/imx/dpu/dpu-prg.c             |  433 +++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h             |   45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h             |  231 ++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c            |  250 ++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c         |  308 +++++
 drivers/gpu/drm/imx/dpu/dpu.h                 |  385 ++++++
 include/drm/drm_atomic.h                      |    5 +-
 39 files changed, 10385 insertions(+), 1 deletion(-)
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
2.25.1

