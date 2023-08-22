Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F05E6783C37
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 10:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E327010E1AF;
	Tue, 22 Aug 2023 08:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2064.outbound.protection.outlook.com [40.107.6.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9369210E1AF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:55:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQ6qnQfiw7LlIQ7NlTDknRewo+RmmsYW7FJDzrQcJESNvGmZ9VAqJmeJkPCYTqbtzcbmCxUo/+XZU1CLkBFtfA3qaK3UNgSHdWR1cf0NqlWTdOf3PNsCGAZ3asm3QLlkPVEo6K5wqDNBvEtuSSmdf6V5yZn9tgCk/QnreQ48keCn0NFbqIKDw6KzYT617eBPTC39eMhZwzPqWi/rWsIsd6nC9PtC1sw8mqNHSBTgG1zj1dExk1OCVfnbc0vB/OnlelLWpuIzWSDHiwStOyCNk01hjQRF0ZR1Rt61Gqh5Jccd9t9GlsXR2jpQ003P5LqE8CH7CCRcCFolHOZWdj3XFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaOfA7jDq1Yu2msp30Uz2sbmCNlYBVfFeOVMBV8q3HE=;
 b=al30I8dM+aizlWI2wmltiTucYRh8lDNHcTJOhD+VwOo1jALSKEAkwBmOPr/r+d9UeifKD5TR1Z2neufp+MIIr86Wxwm+h+koBPiiOW9isnL9GQpVgcVw2X+H3hemieGPp7TcLxKKPnyhGG+hjB1ooGOf5Frq3cha9hZFjtYDqcmfC1QqBEW/HeDEYteX9/3eNhCm46nLqjS3iH7jupCzyClZBQCuGQnCHiphqcUk8dgemj41DuTORS2Arzliv5htRF+mgDiz3RNQIQr46bAlanz2BThAXQMtJSSzEC3DXrszhO76gBV9QlNnCE+vdaIE5ujHPKn6EYFndc0RpnOZ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaOfA7jDq1Yu2msp30Uz2sbmCNlYBVfFeOVMBV8q3HE=;
 b=VBlGu5h0VjzR0/+TGJETs6+6RYldN5pd2Nv6YD6tI6ANxVUR7LVn/f9BcuIXwD/bC29akmLq118z/qqHQC6uovpzhd6ike2EFGP1SOpaKxSVzauFKPgL4jXEHp4IW6xoF4uayCaIeniJfpLHhLaz4bmF5bPyVLvqGDFCVTI2yf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:55:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 08:55:41 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 RESEND 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Tue, 22 Aug 2023 16:59:43 +0800
Message-Id: <20230822085949.816844-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: 9431bdd6-d996-403c-e767-08dba2ed9051
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NtiWkrr3hZPyBvoP0jGItuM4kkSqZ456Qk261Kk2vpcmwgiA1iTY+wUhwsavoOv0TgiYwpFOZVl1rA6oGBSBY6J/jpqSwz9NuwVohipA9IuAR5L88H8+IBGO+NOnk8AZoNS/XmQ2IBt968BqCw0kkjjgEsEGxJ5Dt4nS6CHlOe07wjqakBxLj2V79oDpMzURyYwOGhFaqJ9Fdt8zHyg9XuOAde520LeLQyiMZHTL3EPDEtYD9l3jFNUfndJIem99Zf/nvmqDMRgPh836LVHYtJroUdic6JhBmDR2jNeErFKRyn+ZbNhbW5ES0fw/UxFxlrjWDET9rBjHEQgX5JKKgDklpibDWkLA5qXbz0MtjslfiqckxnRJq1me+DNB04mqKL6Bwp3WVfRSzQZ6Y4k9C81tdaR0v+H5dtiFv0ackasm2wXw7UznoDBGYkL3tpOQNye9VdofyUun5wDv3H682O9KJ7q6A1o6SEfOWn5dLZH5s2iBI9r56rWgpfEOqdaX4O0m44DQJkm3shVxuVJUvwxqCZLWuA0rP7264AuLo9IIb/uycYHGnQjwnSlAxfw4rhox9fvl3lPZ94BVjC0ZxCRZitR1z9OXBnh24kSQ7v8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(66899024)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(1076003)(966005)(478600001)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(30864003)(2906002)(7416002)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MEP3AQJwjh+v8OWKQ/OnzCLHCbOIatd7uOLjTUwtGRuwWksKkijJodXm1YfW?=
 =?us-ascii?Q?88X8iO4OVBJ3VFImdTaDe/pQMV4trzp1wPBVTPp3L1dYK5vRt4u2s72mnttn?=
 =?us-ascii?Q?AUgXuO2wHxucEpAbhsHHHcQ9xsJ/LJi4CO8TlpDtGgx6lFsv8nuL9RM8VcqQ?=
 =?us-ascii?Q?mwVp7Mf3+G3tskIQtsQmGb4YlxThJA8CCtpCj4ehxTnC4RUjdhoMCGvlQvtn?=
 =?us-ascii?Q?kB0y8686rZBzyS7fQ+rnvihlV4QOZbRXUiNyO3PIGbyMEGsc9K2xzeUZswgW?=
 =?us-ascii?Q?5GMj9YLb4vkw6rtJ4vDuZ7T3ZeDVGAZHDHu3ct2adK7+L+RaFfHjBywHvZg6?=
 =?us-ascii?Q?C3fmxu12UqvR1jk8W9f3civtgZT9sYYDUftfhGFpsLDOWxSjN9M+XCcGdM0c?=
 =?us-ascii?Q?W9l4nUEXJk5CTVgUkqUrT39HGQUD/MP1iJuIgMtxuDZg9RSRPu6R7Lgt+vdd?=
 =?us-ascii?Q?LsqRc+NXg/fDvyOmkycgKRNI5hinJ9MO7C9uf+mMTWaG27MNBli3o64PQMJT?=
 =?us-ascii?Q?SQYC/8aPTcbmW44bOk9ED9+8Qh/DdqBM35s02V9sxXpj2z5GdVIYwlVtCaHh?=
 =?us-ascii?Q?jPQvNIa0ODWO5lmWDuNyrSJYVznQql2FfQlNjobIF6gJWaGMFbB6ee2gJEqs?=
 =?us-ascii?Q?xg/RLwp3fbtWGC73zVa9OeFnm8Jcla+0QKcel8Pkz8s0q8S7tcTgqae6FodI?=
 =?us-ascii?Q?lmsspJrbpy0q2mrxlu3CdF1G2LKhSKR5pSeEbbGF0P72ShDMtItyAkYIly2F?=
 =?us-ascii?Q?LSWFYIUwjMcixb2FfyQxYVXAPBzNio5CXv/T1m+5+OelLeFJAgNMPgQ7IN2n?=
 =?us-ascii?Q?mySa9iCGPIDgV1hxymzx1lwlHuQ10L39rO2NECGUYesJERtyqsQC7xrH9vCh?=
 =?us-ascii?Q?IUJmINSb6fYDox2kaZlDHhygzzso2mt8BUprLjeWTdrCvl2GIjYK1Iw5rPA1?=
 =?us-ascii?Q?IuAAeh6llN5s/nKFmNH3DvttZEml6dxfCneKVnfnfOLc4kiODobZvJsLzrRW?=
 =?us-ascii?Q?Ya8fzgdj208dXzQRcel0annI/YfOj+5FU5gpbx8Gn7dESBNftZIBWCTX3O0K?=
 =?us-ascii?Q?T9hAbI72YUjykkfp/HkE1HWRU6dlkoKpAoJ3rpLS0vfo7othL5Ivip8QUAS6?=
 =?us-ascii?Q?/2ABAeH/EKEZr18ILXdu2iSoyrcwE64kaUVbVPHAvx0Hk5pQuba0Nn1l66eI?=
 =?us-ascii?Q?9XusXYv7OElxP6Nr5ZxN6UAwJTQ+96AMByQywYOkAtfzETNOy0GWJ9EqR4G2?=
 =?us-ascii?Q?5hU2n14FS6BtjQWnUqIxvGLJCfCs2ydihvyhPX9f8ECJm07sdOB+F793raGt?=
 =?us-ascii?Q?+k29L+RKUdO6ObSW3oLRpsHOKwnPVDavP+r5WYgjkVH5hTNVYz5Bt5WecG8v?=
 =?us-ascii?Q?nodq/joc2+/ktrvqMU77goLXOAJ6Qr8AgjD6xxizJMg7qZcdqh9jE1foDKK8?=
 =?us-ascii?Q?EYiNEn5sHMO/3kdb3BEmrHUrTbPI0EGCAA1DqerqzmD4z+9joXtbBHQa379U?=
 =?us-ascii?Q?L1oUl5czNqg+JPA3B48r1nsemoj2hUpnQK7qwNTfzXU2ty/1Yvei5UFD/W4Y?=
 =?us-ascii?Q?aL//GBqt3aXwt+Ti9aVWFSiM1LUbawNysBAK5+eu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9431bdd6-d996-403c-e767-08dba2ed9051
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:55:41.8303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: if4IBVz0NeYH6HZHdkhAoJqzEWKXSqNauF13mJqQ6Gq14fLmiYPTne24sRmTjiIqYaR8FKKXD6oi1uTN1DdsuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
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
Cc: conor+dt@kernel.org, tzimmermann@suse.de, marcel.ziswiler@toradex.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


This is the v14 series to introduce i.MX8qm/qxp Display Processing Unit(DPU)
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

v13->v14:
* Rebase the patch series to the latest drm-misc-next branch(v6.1-rc6 based).
* Include drm_fbdev_generic.h in dpu_drv.c due to the rebase.
* Fix dpu drm driver suspend/resume by properly get drm device through
  dev_get_drvdata().
* Use pm_ptr() macro for dpu core driver PM operations.
* Use pm_sleep_ptr() macro for dpu drm driver PM operations.
* Use DEFINE_SIMPLE_DEV_PM_OPS() macro to define dpu drm driver PM operations,
  instead of SIMPLE_DEV_PM_OPS().
* Update year of Copyright.
* Add SoC series name 'i.MX8'/'IMX8'/'imx8' to dpu driver module decription,
  Kconfig name, dpu driver names and dpu driver object name.
* Resend based on the latest drm-misc-next branch.

v12->v13:
* Drop 'drm->irq_enabled = true;' from patch 5/6 to fix a potential build
  break reported by 'kernel test robot <lkp@intel.com>'.  drm->irq_enabled
  should not be used by imx-dpu drm as it is only used by legacy drivers
  with userspace modesetting.

v11->v12:
* Rebase the series upon v6.1-rc1.
* Minor update on Kconfigs, struct names and macro names for patch 5/6
  due to the rebase.

v10->v11:
* Rebase the series upon v6.0-rc1.
* Include drm_blend.h and drm_framebuffer.h in dpu-kms.c and dpu-plane.c
  to fix build errors due to the rebase.
* Fix a checkpatch warning for dpu-crtc.c.
* Properly use dev_err_probe() to return it's return value directly where
  possible.

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
 drivers/gpu/drm/imx/dpu/Kconfig               |    9 +
 drivers/gpu/drm/imx/dpu/Makefile              |   10 +
 drivers/gpu/drm/imx/dpu/dpu-constframe.c      |  171 +++
 drivers/gpu/drm/imx/dpu/dpu-core.c            | 1044 +++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.c            |  969 +++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.h            |   72 ++
 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c       |  117 ++
 drivers/gpu/drm/imx/dpu/dpu-dprc.c            |  715 +++++++++++
 drivers/gpu/drm/imx/dpu/dpu-dprc.h            |   40 +
 drivers/gpu/drm/imx/dpu/dpu-drv.c             |  294 +++++
 drivers/gpu/drm/imx/dpu/dpu-drv.h             |   28 +
 drivers/gpu/drm/imx/dpu/dpu-extdst.c          |  299 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c     |  292 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c        |  224 ++++
 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c      |  152 +++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c       |  610 ++++++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h       |  195 +++
 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c       |  248 ++++
 drivers/gpu/drm/imx/dpu/dpu-framegen.c        |  395 +++++++
 drivers/gpu/drm/imx/dpu/dpu-gammacor.c        |  223 ++++
 drivers/gpu/drm/imx/dpu/dpu-hscaler.c         |  275 +++++
 drivers/gpu/drm/imx/dpu/dpu-kms.c             |  542 +++++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.h             |   23 +
 drivers/gpu/drm/imx/dpu/dpu-layerblend.c      |  348 ++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.c           |  804 +++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h           |   59 +
 drivers/gpu/drm/imx/dpu/dpu-prg.c             |  433 +++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h             |   45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h             |  231 ++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c            |  250 ++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c         |  308 +++++
 drivers/gpu/drm/imx/dpu/dpu.h                 |  385 ++++++
 include/drm/drm_atomic.h                      |    5 +-
 39 files changed, 10372 insertions(+), 1 deletion(-)
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

 base-commit: 504245a5ab6b6e1bfe0280baa4885c551e082099

-- 
2.37.1

