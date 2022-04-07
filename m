Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C962D4F8F39
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 09:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C36C10F8DE;
	Fri,  8 Apr 2022 07:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60084.outbound.protection.outlook.com [40.107.6.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9155D10E761
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iy5sXu4uCh9rNrxuabmCzZrgs68EK8h5uVo/e9p9qi4Y8FtMrqAZHXdYtfR0OjioZU2a8DTWbCfn1yWaHKMHZtrFwsz6NWPX5WsgnOXD8yo9w3VJe+Q9N1xoABjEW1iWRkwi0WM3XAw0cm7+vZwwAj/w7dI+w23YWeMMsRK0lC3RBF4qLZmPzj8G0sehqm5uTr6kTFgb1eey//3gXl7MJz7WVFRk7dIJf60Gsx7BDnwJGPCMRzywzbMgiNc7vWZqN9s3zA4/Qgiz0vh2oUJBEkxTx8FjSki5FDSL2iNavavVLVEaaQMo+1b4A9XNMO2pfyBWuhLPG1VZa97WdZTzcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy1u1b1KpsBPhdwXSivFT5FuxqTvru8w0I2xrKq3lY4=;
 b=YkEM2EVztF7GePOuSNT7yUPK/osm7D6dqRBCNogpp0BU8cTWzP1kwv7xkmhlqnUT742hAk9POgrRPYKRYeFoWm+lPYmz6QNjfLna06Dxj0CwgnGeJQBQQ8VG2S4etMq0Z+39qTmEyUPDvcgCfJGg4fzs0yU+mwVFNVdNKYFK4C2sbjgk1EMQeaf3YcXH2BFLb65PIfDMGrExs8rC6CRD/kmUP9SW7wMKv4PAIQkIvCn7XEo/RU293NBWJeoD5HYus9ALlkf5KeGseit+FqfqRJD2zZE04MdV6FFfGlnJ6bLGktbKT1KsjQ+2KV3SfO66onl22Wy305L0VnzpQyVc9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fy1u1b1KpsBPhdwXSivFT5FuxqTvru8w0I2xrKq3lY4=;
 b=mK3qPpngpNsmyz2EeLGE+KkklE/r+2B94iwcdiSHG3EW4/S+LOpNBJiviZ2Ugx5NEWe4IQUFMxURlhSlvcGJSdsr15cdYvust4YTusFk4HlS9oaxVal8g7Fztdcl+8TKlI3I8PMXxIs3Ikrc13wQ6cOQe2Onf6WVkrCHUxNyUJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9344.eurprd04.prod.outlook.com (2603:10a6:102:2a8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 09:10:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 09:10:49 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Thu,  7 Apr 2022 17:11:55 +0800
Message-Id: <20220407091156.1211923-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407091156.1211923-1-victor.liu@nxp.com>
References: <20220407091156.1211923-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5591e68-861a-4a6a-a7f7-08da187681c0
X-MS-TrafficTypeDiagnostic: PA4PR04MB9344:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <PA4PR04MB93449EC34B5DA27D0716319298E69@PA4PR04MB9344.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8VBdj6AD7qhiK/lEKyb2Qozq/dOibwrgKNwpCmGEt8TZBnW++3cWEEZP/7w2qbVbCDSm1NH4W43xeacd9svT9i9rQ1KsIdpgsGEWnGpUN5cXEACVMUq6sRNJ8tFKWgFBJ9CsUKhGLDqR6ip9xQQ2Pk8AA/CQQBAwZl5Qc7D0ib6NEogwXdpaSthSQXrIHOGH/yJ6eAB6wrypDT/RsSEdFI/pSU+no6WGuKAoEwNiu9NZjX1z+H5r8AuGpZZB4yRimvoXt1a30xE1/ramqojPPe3K7Lw/XNk3KDdGAxrePAJAaR+jG8H1gAK4Vm/Rmq6WlDZjLxxG3tYPNqe3kn76fJr4odLtV8510V5jVl0kIQyO21GZq6Eh4CBRfrG7rRNfmGTctIrroBqaOG/wAJ+mnw0SUIXJuwqY2vpL/5pwbxAtxfFjXDdSlhNkYpkkEgORMdlfcGQUEi3/VPHjU2XwuAb5695rrfoUONVHjfJxuW0K6qePU7cGhqrfpn/MImrVeoOtB8pqaGJhgr8k9GxQ2snSENYjLAX/BV+SHhrRxZX7o8u3n3Qqm6AL4Ti5Plm/287OBjvoowhMjxMpZbIUlHrKSdYGy1RZ3RZYkIuF96oWIl8KLXTde6ZGgdY6oaaD5HaJlXcwGJiD1hSqYwJjkH+OiYb4TpncWcjxEWqLLYOIhJEpXXphD99sy2w4Z+ZVRhDNM4hG2tdO7IoJhtMGLN0ugb4GNtZc228B/MHZWr+RVENGRtzf3M8CGPNfRyOVRh2SeMOIC4kBvc4ePT5jUdDVCo3ohm43lxaUA/B1rjTIhRY8picHqJtKfkPHuNOL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66946007)(6666004)(86362001)(8936002)(38350700002)(52116002)(4326008)(38100700002)(66556008)(66476007)(8676002)(966005)(30864003)(6512007)(7416002)(6506007)(2616005)(83380400001)(186003)(508600001)(6486002)(26005)(1076003)(316002)(2906002)(36756003)(559001)(579004)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0pew8LkMP1/ZuXxSHXulY4+4TSsb2HsW4bTnOjV+obUlNEikThu87Revwde7?=
 =?us-ascii?Q?tYqeq+OswyN+TdB2hhqpFjiTm2tsj1Vuqbw8twCByV/ezHNB9e1DNUMXJeQK?=
 =?us-ascii?Q?eKZhnEabnkmAvfFVlwfgmZHtBmiQnlwFZBB/kKD7UKOwkWfr5M/CnLeKDXaY?=
 =?us-ascii?Q?/JCPKLhmRVz425UU29dfm6/OG98BuEUZK303waZzSyUM2VQQ5AuaECi2EXSa?=
 =?us-ascii?Q?q1niC+OejWoI3kbn3ko1g4G11b44wh3MyiKZ7/Jo/Gl76M3XKTEEKm14xlmE?=
 =?us-ascii?Q?QWLKa6/FECT9UlQEUR0OlTlpUmOGm480v11COQgXMrwO+E8Q3IiqTEnhua4c?=
 =?us-ascii?Q?mNEA2QXH0bjbNh+94Hir15I0wxMvMO5qaYED6fAAiDHXYSAV5ikjIayEnGF4?=
 =?us-ascii?Q?3FHu3iElLtQyDqUuVg7s9BBKDAtI5Sfr+au6/xTqj7PCDQIrCqY3lL9rLFxm?=
 =?us-ascii?Q?79nwiiviKFLX+ZfCj1ZiRlbrEzkckgLVjCJhUBf4Xy5143OWT398cdf4hEVd?=
 =?us-ascii?Q?yCg9SrcXyXIi9h3JBiQOlzUYWLYyzq2/4HeNxLuVS/9iMAG+dY4uveFIWqyz?=
 =?us-ascii?Q?O1WpNyukwc9p5lyDOG29wWHdK650Yfh/d+++H9l9r/Z4CJ/RDJhlqWBlXJAt?=
 =?us-ascii?Q?g3+RXnKb77xPkz9/bougDlEAsqbsGNjpIkPECmO8NBaBuHS8JqYSsQP5lCXN?=
 =?us-ascii?Q?y/f7PF1mVz7JA/jbMiOT7rsK5DQ1k19H18vjOf/4apJf669LIyRlW23mZxmI?=
 =?us-ascii?Q?kjeJGwGPTz8YMesICZuwKan15I5S+oYzQonLQ4ekJ8GMx4Vk5Y7GCgUMNcnI?=
 =?us-ascii?Q?PIlKLJo2rsXdr2vPwYJ1ZR0rlkVSHfqp4OT5MfgpmkW8XHH5tSC3Ym/E0CYW?=
 =?us-ascii?Q?P+oCA6jrk9P6cWWmBaGMGaLHyV5UMqwU+8mLWLhxgyZtGu2m9FVGWb3PA7/h?=
 =?us-ascii?Q?rXtX+1Rt/OwxkqVyt1z3x7BUsvmHQfMLOkQvyhfERdgAF/9vpjQSOwCqW6lW?=
 =?us-ascii?Q?OXlZFG7s1pliyeyCtm1oHqJdAOE117HsduqLd5qxWokzEqDKDptAHl7fCef8?=
 =?us-ascii?Q?NzI5IWXbNDZsrHiwQE40pIaNiN1saT2jq/R9fNUNFEkjQcIEkPQZ28nGqkEE?=
 =?us-ascii?Q?IBQIGm1ZxLgb12uIqtYxsoqkGLeKt60WTfg8MhoBML4UGzDyrdXb0D6ErBqG?=
 =?us-ascii?Q?1Ha2mAuvGc8a5XLKQTBlMUWrpr9YhIhL6ouJaHcjG8IWeZYwNtOAopQ6Rh60?=
 =?us-ascii?Q?+D6Ra3MACoNL1U1niT0EEiXLDl1ZhFNi14bE8jy2z8N1CXZh+pFLHnQjKwZK?=
 =?us-ascii?Q?qTOexzGTOE5ZibZvcCWcvrCYp0NgpWKJW4bAHIPSFMyosImkQApPzIkCkYCj?=
 =?us-ascii?Q?5oaGonvSgwWCbt1AGpwA5GYDZNmPz4kA/6OYBJloKAGxKZ+JxzG/6EGFMQ2i?=
 =?us-ascii?Q?mt+NiPLlwy4hd1SNwwUhcUeffwx/5/CxZxBMNk0M6XbqUAyI9GTEklTnlS8v?=
 =?us-ascii?Q?3q4hwd7v3hlp98JEBS5/j/SraoA9i3Lq34EM/CUxI9J6DP0IvzBFzL3cRy4a?=
 =?us-ascii?Q?dM4ONo5/XAfG8ETJtSc2ZCyNz4HN9GEeO4NwbLVi9wjYbE70s38GlqUaSxM5?=
 =?us-ascii?Q?HTaw12G4qRvtvJjhgrO8vN3GHtr20XGsTxbFNVsazKipXwFy+nSQwhqaDTlH?=
 =?us-ascii?Q?rNcXxxIWVY1lu5QmCFLjO9+BIXFDeNTUQ44dsdzB14tTm7d5eSeulH+NvDge?=
 =?us-ascii?Q?tVMePgTkZA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5591e68-861a-4a6a-a7f7-08da187681c0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:10:49.8544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FwJMEkwEFka5Qk5ZaNazKNuoWxnGhY29HHg6yhZuAzWusPOWqEDlfPJl24LLXguPDuy1hVti3MZ0Ungr+woWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9344
X-Mailman-Approved-At: Fri, 08 Apr 2022 07:11:00 +0000
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

This patch introduces i.MX8qm/qxp Display Processing Unit(DPU) DRM support.

DPU is comprised of two main components that include a blit engine for
2D graphics accelerations(with composition support) and a display
controller for display output processing, as well as a command sequencer.
Outside of DPU, optional prefetch engines, a.k.a, Prefetch Resolve
Gasket(PRG) and Display Prefetch Resolve(DPR), can fetch data from memory
prior to some DPU fetchunits of blit engine and display controller.  The
prefetch engines support reading linear formats and resolving Vivante GPU
tile formats.

This patch adds kernel modesetting support for the display controller part.
The driver supports two CRTCs per display controller, planes backed by
four fetchunits(decode0/1, fetchlayer, fetchwarp), fetchunit allocation
logic for the two CRTCs, prefetch engines(with tile resolving supported),
plane upscaling/deinterlacing/yuv2rgb CSC/alpha blending and CRTC gamma
correction.  The registers of the controller is accessed without command
sequencer involved, instead just by using CPU.

Reference manual can be found at:
https://www.nxp.com/webapp/Download?colCode=IMX8DQXPRM

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v9->v10:
* Make 'checkpatch.pl --strict' happier.
* Add Laurentiu's R-b tag.

v8->v9:
* Use drm_atomic_get_new_plane_state() in dpu_plane_atomic_update(). (Laurentiu)
* Drop getting DPU DT alias ID, as it is unused.
* Get the DPR interrupt(dpr_wrap) by name.

v7->v8:
* Update dpu_plane_atomic_check() and dpu_plane_atomic_update(), due to DRM
  plane helper functions API change(atomic_check and atomic_update) from DRM
  atomic core.  Also, rename plane->state variables and relevant DPU plane
  state variables in those two functions to reflect they are new states, like
  the patch 'drm: Rename plane->state variables in atomic update and disable'
  recently landed in drm-misc-next.
* Replace drm_gem_fb_prepare_fb() with drm_gem_plane_helper_prepare_fb(),
  due to DRM core API change.
* Use 256byte DPR burst length for GPU standard tile and 128byte DPR burst
  length for 32bpp GPU super tile to align with the latest version of internal
  HW documention.

v6->v7:
* Fix return value of dpu_get_irqs() if platform_get_irq() fails. (Laurentiu)
* Use the function array dpu_irq_handler[] to store individual DPU irq handlers.
  (Laurentiu)
* Call get/put() hooks directly to get/put DPU fetchunits for DPU plane groups.
  (Laurentiu)
* Shorten the names of individual DPU irq handlers by using DPU unit abbrev
  names to make writing dpu_irq_handler[] easier.

v5->v6:
* Do not use macros where possible. (Laurentiu)
* Break dpu_plane_atomic_check() into some smaller functions. (Laurentiu)
* Address some minor comments from Laurentiu.
* Add dpu_crtc_err() helper marco to tell dmesg which CRTC generates error.
* Drop calling dev_set_drvdata() from dpu_drm_bind/unbind() as it is done
  in dpu_drm_probe().
* Some trivial tweaks.

v4->v5:
* Rebase up onto the latest drm-misc-next branch and remove the hook to
  drm_atomic_helper_legacy_gamma_set(), because it was dropped by the newly
  landed commit 'drm: automatic legacy gamma support'.
* Remove a redundant blank line from dpu_plane_atomic_update().

v3->v4:
* No change.

v2->v3:
* Fix build warnings Reported-by: kernel test robot <lkp@intel.com>.
* Drop build dependency on IMX_SCU, as dummy SCU functions have been added in
  header files by the patch 'firmware: imx: add dummy functions' which has
  landed in linux-next/master branch.

v1->v2:
* Add compatible for i.MX8qm DPU, as this is tested with i.MX8qm LVDS displays.
  (Laurentiu)
* Fix PRG burst size and stride. (Laurentiu)
* Put 'ports' OF node to fix the bail-out logic in dpu_drm_probe(). (Laurentiu)

 drivers/gpu/drm/imx/Kconfig               |    1 +
 drivers/gpu/drm/imx/Makefile              |    1 +
 drivers/gpu/drm/imx/dpu/Kconfig           |   10 +
 drivers/gpu/drm/imx/dpu/Makefile          |   10 +
 drivers/gpu/drm/imx/dpu/dpu-constframe.c  |  171 ++++
 drivers/gpu/drm/imx/dpu/dpu-core.c        | 1047 +++++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.c        |  969 +++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.h        |   72 ++
 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c   |  117 +++
 drivers/gpu/drm/imx/dpu/dpu-dprc.c        |  723 ++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-dprc.h        |   40 +
 drivers/gpu/drm/imx/dpu/dpu-drv.c         |  292 ++++++
 drivers/gpu/drm/imx/dpu/dpu-drv.h         |   28 +
 drivers/gpu/drm/imx/dpu/dpu-extdst.c      |  299 ++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c |  294 ++++++
 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c    |  224 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c  |  154 +++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c   |  610 ++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h   |  195 ++++
 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c   |  250 +++++
 drivers/gpu/drm/imx/dpu/dpu-framegen.c    |  395 ++++++++
 drivers/gpu/drm/imx/dpu/dpu-gammacor.c    |  223 +++++
 drivers/gpu/drm/imx/dpu/dpu-hscaler.c     |  275 ++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.c         |  540 +++++++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.h         |   23 +
 drivers/gpu/drm/imx/dpu/dpu-layerblend.c  |  348 +++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.c       |  803 ++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h       |   59 ++
 drivers/gpu/drm/imx/dpu/dpu-prg.c         |  433 +++++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h         |   45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h         |  231 +++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c        |  250 +++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c     |  308 ++++++
 drivers/gpu/drm/imx/dpu/dpu.h             |  385 ++++++++
 34 files changed, 9825 insertions(+)
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

diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index bb9738c7c825..6f4968e7388e 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -42,3 +42,4 @@ config DRM_IMX_HDMI
 	  Choose this if you want to use HDMI on i.MX6.
 
 source "drivers/gpu/drm/imx/dcss/Kconfig"
+source "drivers/gpu/drm/imx/dpu/Kconfig"
diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
index b644deffe948..55da147852e8 100644
--- a/drivers/gpu/drm/imx/Makefile
+++ b/drivers/gpu/drm/imx/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_DRM_IMX_LDB) += imx-ldb.o
 
 obj-$(CONFIG_DRM_IMX_HDMI) += dw_hdmi-imx.o
 obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
+obj-$(CONFIG_DRM_IMX_DPU) += dpu/
diff --git a/drivers/gpu/drm/imx/dpu/Kconfig b/drivers/gpu/drm/imx/dpu/Kconfig
new file mode 100644
index 000000000000..e825173d0d84
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/Kconfig
@@ -0,0 +1,10 @@
+config DRM_IMX_DPU
+	tristate "DRM support for Freescale i.MX DPU Graphics"
+	select DRM_KMS_HELPER
+	select VIDEOMODE_HELPERS
+	select DRM_GEM_CMA_HELPER
+	select DRM_KMS_CMA_HELPER
+	depends on DRM && OF && ARCH_MXC
+	depends on COMMON_CLK
+	help
+	  enable Freescale i.MX DPU graphics support
diff --git a/drivers/gpu/drm/imx/dpu/Makefile b/drivers/gpu/drm/imx/dpu/Makefile
new file mode 100644
index 000000000000..2f9238a81204
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+
+imx-dpu-drm-objs := dpu-constframe.o dpu-core.o dpu-crtc.o \
+		    dpu-disengcfg.o dpu-dprc.o dpu-drv.o dpu-extdst.o \
+		    dpu-fetchdecode.o dpu-fetcheco.o dpu-fetchlayer.o \
+		    dpu-fetchwarp.o dpu-fetchunit.o dpu-framegen.o \
+		    dpu-gammacor.o dpu-hscaler.o dpu-kms.o dpu-layerblend.o \
+		    dpu-plane.o dpu-prg.o dpu-tcon.o dpu-vscaler.o
+
+obj-$(CONFIG_DRM_IMX_DPU) += imx-dpu-drm.o
diff --git a/drivers/gpu/drm/imx/dpu/dpu-constframe.c b/drivers/gpu/drm/imx/dpu/dpu-constframe.c
new file mode 100644
index 000000000000..5adb02de4aa0
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-constframe.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020 NXP
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu-prv.h"
+
+#define STATICCONTROL		0x8
+
+#define FRAMEDIMENSIONS		0xc
+#define  WIDTH(w)		(((w) - 1) & 0x3fff)
+#define  HEIGHT(h)		((((h) - 1) & 0x3fff) << 16)
+
+#define CONSTANTCOLOR		0x10
+#define  RED(r)			(((r) & 0xff) << 24)
+#define  GREEN(g)		(((g) & 0xff) << 16)
+#define  BLUE(b)		(((b) & 0xff) << 8)
+#define  ALPHA(a)		((a) & 0xff)
+
+struct dpu_constframe {
+	void __iomem *pec_base;
+	void __iomem *base;
+	struct mutex mutex;
+	unsigned int id;
+	unsigned int index;
+	enum dpu_link_id link_id;
+	bool inuse;
+	struct dpu_soc *dpu;
+};
+
+static const enum dpu_link_id
+dpu_cf_link_id[] = {LINK_ID_CONSTFRAME0, LINK_ID_CONSTFRAME1,
+		    LINK_ID_CONSTFRAME4, LINK_ID_CONSTFRAME5};
+
+static inline void dpu_cf_write(struct dpu_constframe *cf,
+				unsigned int offset, u32 value)
+{
+	writel(value, cf->base + offset);
+}
+
+static void dpu_cf_enable_shden(struct dpu_constframe *cf)
+{
+	dpu_cf_write(cf, STATICCONTROL, SHDEN);
+}
+
+enum dpu_link_id dpu_cf_get_link_id(struct dpu_constframe *cf)
+{
+	return cf->link_id;
+}
+
+void dpu_cf_framedimensions(struct dpu_constframe *cf, unsigned int w,
+			    unsigned int h)
+{
+	dpu_cf_write(cf, FRAMEDIMENSIONS, WIDTH(w) | HEIGHT(h));
+}
+
+void dpu_cf_constantcolor_black(struct dpu_constframe *cf)
+{
+	dpu_cf_write(cf, CONSTANTCOLOR, 0);
+}
+
+void dpu_cf_constantcolor_blue(struct dpu_constframe *cf)
+{
+	dpu_cf_write(cf, CONSTANTCOLOR, BLUE(0xff));
+}
+
+static struct dpu_constframe *dpu_cf_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_constframe *cf;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->cf_priv); i++) {
+		cf = dpu->cf_priv[i];
+		if (cf->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->cf_priv))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&cf->mutex);
+
+	if (cf->inuse) {
+		mutex_unlock(&cf->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	cf->inuse = true;
+
+	mutex_unlock(&cf->mutex);
+
+	return cf;
+}
+
+static void dpu_cf_put(struct dpu_constframe *cf)
+{
+	if (IS_ERR_OR_NULL(cf))
+		return;
+
+	mutex_lock(&cf->mutex);
+
+	cf->inuse = false;
+
+	mutex_unlock(&cf->mutex);
+}
+
+/* ConstFrame for safety stream */
+struct dpu_constframe *dpu_cf_safe_get(struct dpu_soc *dpu,
+				       unsigned int stream_id)
+{
+	return dpu_cf_get(dpu, stream_id + DPU_SAFETY_STREAM_OFFSET);
+}
+
+void dpu_cf_safe_put(struct dpu_constframe *cf)
+{
+	return dpu_cf_put(cf);
+}
+
+/* ConstFrame for content stream */
+struct dpu_constframe *dpu_cf_cont_get(struct dpu_soc *dpu,
+				       unsigned int stream_id)
+{
+	return dpu_cf_get(dpu, stream_id);
+}
+
+void dpu_cf_cont_put(struct dpu_constframe *cf)
+{
+	return dpu_cf_put(cf);
+}
+
+void dpu_cf_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	dpu_cf_enable_shden(dpu->cf_priv[index]);
+}
+
+int dpu_cf_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base)
+{
+	struct dpu_constframe *cf;
+
+	cf = devm_kzalloc(dpu->dev, sizeof(*cf), GFP_KERNEL);
+	if (!cf)
+		return -ENOMEM;
+
+	dpu->cf_priv[index] = cf;
+
+	cf->pec_base = devm_ioremap(dpu->dev, pec_base, SZ_16);
+	if (!cf->pec_base)
+		return -ENOMEM;
+
+	cf->base = devm_ioremap(dpu->dev, base, SZ_32);
+	if (!cf->base)
+		return -ENOMEM;
+
+	cf->dpu = dpu;
+	cf->id = id;
+	cf->index = index;
+	cf->link_id = dpu_cf_link_id[index];
+
+	mutex_init(&cf->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-core.c b/drivers/gpu/drm/imx/dpu/dpu-core.c
new file mode 100644
index 000000000000..5bfdc0f888d2
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-core.c
@@ -0,0 +1,1047 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/sizes.h>
+
+#include "dpu.h"
+#include "dpu-prv.h"
+
+static inline u32 dpu_comctrl_read(struct dpu_soc *dpu, unsigned int offset)
+{
+	return readl(dpu->comctrl_reg + offset);
+}
+
+static inline void dpu_comctrl_write(struct dpu_soc *dpu,
+				     unsigned int offset, u32 value)
+{
+	writel(value, dpu->comctrl_reg + offset);
+}
+
+/* Constant Frame */
+static const unsigned int cf_ids[] = {0, 1, 4, 5};
+static const enum dpu_unit_type cf_types[] = {DPU_DISP, DPU_DISP,
+					      DPU_DISP, DPU_DISP};
+static const unsigned long cf_ofss[] = {0x4400, 0x5400, 0x4c00, 0x5c00};
+static const unsigned long cf_pec_ofss[] = {0x960, 0x9e0, 0x9a0, 0xa20};
+
+static const struct dpu_units dpu_cfs = {
+	.ids = cf_ids,
+	.types = cf_types,
+	.ofss = cf_ofss,
+	.pec_ofss = cf_pec_ofss,
+	.cnt = ARRAY_SIZE(cf_ids),
+	.name = "ConstFrame",
+	.init = dpu_cf_init,
+	.hw_init = dpu_cf_hw_init,
+};
+
+/* Display Engine Configuration */
+static const unsigned int dec_ids[] = {0, 1};
+static const enum dpu_unit_type dec_types[] = {DPU_DISP, DPU_DISP};
+static const unsigned long dec_ofss[] = {0xb400, 0xb420};
+
+static const struct dpu_units dpu_decs = {
+	.ids = dec_ids,
+	.types = dec_types,
+	.ofss = dec_ofss,
+	.pec_ofss = NULL,
+	.cnt = ARRAY_SIZE(dec_ids),
+	.name = "DisEngCfg",
+	.init = dpu_dec_init,
+	.hw_init = dpu_dec_hw_init,
+};
+
+/* External Destination */
+static const unsigned int ed_ids[] = {0, 1, 4, 5};
+static const enum dpu_unit_type ed_types[] = {DPU_DISP, DPU_DISP,
+					      DPU_DISP, DPU_DISP};
+static const unsigned long ed_ofss[] = {0x4800, 0x5800, 0x5000, 0x6000};
+static const unsigned long ed_pec_ofss[] = {0x980, 0xa00, 0x9c0, 0xa40};
+
+static const struct dpu_units dpu_eds = {
+	.ids = ed_ids,
+	.types = ed_types,
+	.ofss = ed_ofss,
+	.pec_ofss = ed_pec_ofss,
+	.cnt = ARRAY_SIZE(ed_ids),
+	.name = "ExtDst",
+	.init = dpu_ed_init,
+	.hw_init = dpu_ed_hw_init,
+};
+
+/* Fetch Decode */
+static const unsigned int fd_ids[] = {0, 1, 9};
+static const enum dpu_unit_type fd_types[] = {DPU_DISP, DPU_DISP, DPU_BLIT};
+static const unsigned long fd_ofss[] = {0x6c00, 0x7800, 0x1000};
+static const unsigned long fd_pec_ofss[] = {0xa80, 0xaa0, 0x820};
+
+static const struct dpu_units dpu_fds = {
+	.ids = fd_ids,
+	.types = fd_types,
+	.ofss = fd_ofss,
+	.pec_ofss = fd_pec_ofss,
+	.cnt = ARRAY_SIZE(fd_ids),
+	.name = "FetchDecode",
+	.init = dpu_fd_init,
+	.hw_init = dpu_fd_hw_init,
+};
+
+/* Fetch ECO */
+static const unsigned int fe_ids[] = {0, 1, 2, 9};
+static const enum dpu_unit_type fe_types[] = {DPU_DISP, DPU_DISP,
+					      DPU_DISP, DPU_BLIT};
+static const unsigned long fe_ofss[] = {0x7400, 0x8000, 0x6800, 0x1c00};
+static const unsigned long fe_pec_ofss[] = {0xa90, 0xab0, 0xa70, 0x850};
+
+static const struct dpu_units dpu_fes = {
+	.ids = fe_ids,
+	.types = fe_types,
+	.ofss = fe_ofss,
+	.pec_ofss = fe_pec_ofss,
+	.cnt = ARRAY_SIZE(fe_ids),
+	.name = "FetchEco",
+	.init = dpu_fe_init,
+	.hw_init = dpu_fe_hw_init,
+};
+
+/* Frame Generator */
+static const unsigned int fg_ids[] = {0, 1};
+static const enum dpu_unit_type fg_types[] = {DPU_DISP, DPU_DISP};
+static const unsigned long fg_ofss[] = {0xb800, 0xd400};
+
+static const struct dpu_units dpu_fgs = {
+	.ids = fg_ids,
+	.types = fg_types,
+	.ofss = fg_ofss,
+	.pec_ofss = NULL,
+	.cnt = ARRAY_SIZE(fg_ids),
+	.name = "FrameGen",
+	.init = dpu_fg_init,
+	.hw_init = dpu_fg_hw_init,
+};
+
+/* Fetch Layer */
+static const unsigned int fl_ids[] = {0};
+static const enum dpu_unit_type fl_types[] = {DPU_DISP};
+static const unsigned long fl_ofss[] = {0x8400};
+static const unsigned long fl_pec_ofss[] = {0xac0};
+
+static const struct dpu_units dpu_fls = {
+	.ids = fl_ids,
+	.types = fl_types,
+	.ofss = fl_ofss,
+	.pec_ofss = fl_pec_ofss,
+	.cnt = ARRAY_SIZE(fl_ids),
+	.name = "FetchLayer",
+	.init = dpu_fl_init,
+	.hw_init = dpu_fl_hw_init,
+};
+
+/* Fetch Warp */
+static const unsigned int fw_ids[] = {2, 9};
+static const enum dpu_unit_type fw_types[] = {DPU_DISP, DPU_BLIT};
+static const unsigned long fw_ofss[] = {0x6400, 0x1800};
+static const unsigned long fw_pec_ofss[] = {0xa60, 0x840};
+
+static const struct dpu_units dpu_fws = {
+	.ids = fw_ids,
+	.types = fw_types,
+	.ofss = fw_ofss,
+	.pec_ofss = fw_pec_ofss,
+	.cnt = ARRAY_SIZE(fw_ids),
+	.name = "FetchWarp",
+	.init = dpu_fw_init,
+	.hw_init = dpu_fw_hw_init,
+};
+
+/* Gamma Correction */
+static const unsigned int gc_ids[] = {0, 1};
+static const enum dpu_unit_type gc_types[] = {DPU_DISP, DPU_DISP};
+static const unsigned long gc_ofss[] = {0xc000, 0xdc00};
+
+static const struct dpu_units dpu_gcs = {
+	.ids = gc_ids,
+	.types = gc_types,
+	.ofss = gc_ofss,
+	.pec_ofss = NULL,
+	.cnt = ARRAY_SIZE(gc_ids),
+	.name = "GammaCor",
+	.init = dpu_gc_init,
+	.hw_init = dpu_gc_hw_init,
+};
+
+/* Horizontal Scaler */
+static const unsigned int hs_ids[] = {4, 5, 9};
+static const enum dpu_unit_type hs_types[] = {DPU_DISP, DPU_DISP, DPU_BLIT};
+static const unsigned long hs_ofss[] = {0x9000, 0x9c00, 0x3000};
+static const unsigned long hs_pec_ofss[] = {0xb00, 0xb60, 0x8c0};
+
+static const struct dpu_units dpu_hss = {
+	.ids = hs_ids,
+	.types = hs_types,
+	.ofss = hs_ofss,
+	.pec_ofss = hs_pec_ofss,
+	.cnt = ARRAY_SIZE(hs_ids),
+	.name = "HScaler",
+	.init = dpu_hs_init,
+	.hw_init = dpu_hs_hw_init,
+};
+
+/* Layer Blend */
+static const unsigned int lb_ids[] = {0, 1, 2, 3};
+static const enum dpu_unit_type lb_types[] = {DPU_DISP, DPU_DISP,
+					      DPU_DISP, DPU_DISP};
+static const unsigned long lb_ofss[] = {0xa400, 0xa800, 0xac00, 0xb000};
+static const unsigned long lb_pec_ofss[] = {0xba0, 0xbc0, 0xbe0, 0xc00};
+
+static const struct dpu_units dpu_lbs = {
+	.ids = lb_ids,
+	.types = lb_types,
+	.ofss = lb_ofss,
+	.pec_ofss = lb_pec_ofss,
+	.cnt = ARRAY_SIZE(lb_ids),
+	.name = "LayerBlend",
+	.init = dpu_lb_init,
+	.hw_init = dpu_lb_hw_init,
+};
+
+/* Timing Controller */
+static const unsigned int tcon_ids[] = {0, 1};
+static const enum dpu_unit_type tcon_types[] = {DPU_DISP, DPU_DISP};
+static const unsigned long tcon_ofss[] = {0xc800, 0xe400};
+
+static const struct dpu_units dpu_tcons = {
+	.ids = tcon_ids,
+	.types = tcon_types,
+	.ofss = tcon_ofss,
+	.pec_ofss = NULL,
+	.cnt = ARRAY_SIZE(tcon_ids),
+	.name = "TCON",
+	.init = dpu_tcon_init,
+	.hw_init = dpu_tcon_hw_init,
+};
+
+/* Vertical Scaler */
+static const unsigned int vs_ids[] = {4, 5, 9};
+static const enum dpu_unit_type vs_types[] = {DPU_DISP, DPU_DISP, DPU_BLIT};
+static const unsigned long vs_ofss[] = {0x9400, 0xa000, 0x3400};
+static const unsigned long vs_pec_ofss[] = {0xb20, 0xb80, 0x8e0};
+
+static const struct dpu_units dpu_vss = {
+	.ids = vs_ids,
+	.types = vs_types,
+	.ofss = vs_ofss,
+	.pec_ofss = vs_pec_ofss,
+	.cnt = ARRAY_SIZE(vs_ids),
+	.name = "VScaler",
+	.init = dpu_vs_init,
+	.hw_init = dpu_vs_hw_init,
+};
+
+static const struct dpu_units *dpu_all_units[] = {
+	&dpu_cfs,
+	&dpu_decs,
+	&dpu_eds,
+	&dpu_fds,
+	&dpu_fes,
+	&dpu_fgs,
+	&dpu_fls,
+	&dpu_fws,
+	&dpu_gcs,
+	&dpu_hss,
+	&dpu_lbs,
+	&dpu_tcons,
+	&dpu_vss,
+};
+
+static inline void dpu_detach_pm_domain(struct device **pd_dev,
+					struct device_link **pd_link)
+{
+	if (!IS_ERR_OR_NULL(*pd_link))
+		device_link_del(*pd_link);
+	if (!IS_ERR_OR_NULL(*pd_dev))
+		dev_pm_domain_detach(*pd_dev, true);
+
+	*pd_dev = NULL;
+	*pd_link = NULL;
+}
+
+static void dpu_detach_pm_domains(struct dpu_soc *dpu)
+{
+	dpu_detach_pm_domain(&dpu->pd_pll1_dev, &dpu->pd_pll1_link);
+	dpu_detach_pm_domain(&dpu->pd_pll0_dev, &dpu->pd_pll0_link);
+	dpu_detach_pm_domain(&dpu->pd_dc_dev, &dpu->pd_dc_link);
+}
+
+static inline int dpu_attach_pm_domain(struct dpu_soc *dpu,
+				       struct device **pd_dev,
+				       struct device_link **pd_link,
+				       const char *name)
+{
+	u32 flags = DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE;
+	int ret;
+
+	*pd_dev = dev_pm_domain_attach_by_name(dpu->dev, name);
+	if (IS_ERR(*pd_dev)) {
+		ret = PTR_ERR(*pd_dev);
+		dev_err(dpu->dev,
+			"failed to attach %s pd dev: %d\n", name, ret);
+		return ret;
+	}
+
+	*pd_link = device_link_add(dpu->dev, *pd_dev, flags);
+	if (IS_ERR(*pd_link)) {
+		ret = PTR_ERR(*pd_link);
+		dev_err(dpu->dev, "failed to add device link to %s pd dev: %d\n",
+			name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dpu_attach_pm_domains(struct dpu_soc *dpu)
+{
+	int ret;
+
+	ret = dpu_attach_pm_domain(dpu, &dpu->pd_dc_dev, &dpu->pd_dc_link, "dc");
+	if (ret)
+		goto err_out;
+
+	ret = dpu_attach_pm_domain(dpu, &dpu->pd_pll0_dev, &dpu->pd_pll0_link,
+				   "pll0");
+	if (ret)
+		goto err_out;
+
+	ret = dpu_attach_pm_domain(dpu, &dpu->pd_pll1_dev, &dpu->pd_pll1_link,
+				   "pll1");
+	if (ret)
+		goto err_out;
+
+	return 0;
+err_out:
+	dpu_detach_pm_domains(dpu);
+
+	return ret;
+}
+
+static void dpu_units_addr_dbg(struct dpu_soc *dpu, unsigned long dpu_base)
+{
+	const struct dpu_units *us;
+	int i, j;
+
+	dev_dbg(dpu->dev, "Common Control: 0x%08lx\n", dpu_base);
+
+	for (i = 0; i < ARRAY_SIZE(dpu_all_units); i++) {
+		us = dpu_all_units[i];
+
+		for (j = 0; j < us->cnt; j++) {
+			if (us->pec_ofss) {
+				dev_dbg(dpu->dev,
+					"%s%d: pixengcfg @ 0x%08lx, unit @ 0x%08lx\n",
+					us->name, us->ids[j],
+					dpu_base + us->pec_ofss[j],
+					dpu_base + us->ofss[j]);
+			} else {
+				dev_dbg(dpu->dev,
+					"%s%d: unit @ 0x%08lx\n", us->name,
+					us->ids[j], dpu_base + us->ofss[j]);
+			}
+		}
+	}
+}
+
+static int dpu_get_irqs(struct platform_device *pdev, struct dpu_soc *dpu)
+{
+	unsigned int i, j;
+
+	/* do not get the reserved irq */
+	for (i = 0, j = 0; i < DPU_IRQ_COUNT - 1; i++, j++) {
+		if (i == DPU_IRQ_RESERVED)
+			j++;
+
+		dpu->irq[j] = platform_get_irq(pdev, i);
+		if (dpu->irq[j] < 0) {
+			dev_err_probe(dpu->dev, dpu->irq[j],
+				      "failed to get irq\n");
+			return dpu->irq[j];
+		}
+	}
+
+	return 0;
+}
+
+static void dpu_irq_handle(struct irq_desc *desc, enum dpu_irq irq)
+{
+	struct dpu_soc *dpu = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned int virq;
+	u32 status;
+
+	chained_irq_enter(chip, desc);
+
+	status = dpu_comctrl_read(dpu, USERINTERRUPTSTATUS(irq / 32));
+	status &= dpu_comctrl_read(dpu, USERINTERRUPTENABLE(irq / 32));
+
+	if (status & BIT(irq % 32)) {
+		virq = irq_linear_revmap(dpu->domain, irq);
+		if (virq)
+			generic_handle_irq(virq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static void dpu_dec_framecomplete0_irq_handler(struct irq_desc *desc)
+{
+	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_FRAMECOMPLETE0);
+}
+
+static void dpu_dec_framecomplete1_irq_handler(struct irq_desc *desc)
+{
+	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_FRAMECOMPLETE1);
+}
+
+static void dpu_dec_seqcomplete0_irq_handler(struct irq_desc *desc)
+{
+	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_SEQCOMPLETE0);
+}
+
+static void dpu_dec_seqcomplete1_irq_handler(struct irq_desc *desc)
+{
+	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_SEQCOMPLETE1);
+}
+
+static void dpu_dec_shdload0_irq_handler(struct irq_desc *desc)
+{
+	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_SHDLOAD0);
+}
+
+static void dpu_dec_shdload1_irq_handler(struct irq_desc *desc)
+{
+	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_SHDLOAD1);
+}
+
+static void dpu_ed0_shdload_irq_handler(struct irq_desc *desc)
+{
+	dpu_irq_handle(desc, DPU_IRQ_EXTDST0_SHDLOAD);
+}
+
+static void dpu_ed1_shdload_irq_handler(struct irq_desc *desc)
+{
+	dpu_irq_handle(desc, DPU_IRQ_EXTDST1_SHDLOAD);
+}
+
+static void dpu_ed4_shdload_irq_handler(struct irq_desc *desc)
+{
+	dpu_irq_handle(desc, DPU_IRQ_EXTDST4_SHDLOAD);
+}
+
+static void dpu_ed5_shdload_irq_handler(struct irq_desc *desc)
+{
+	dpu_irq_handle(desc, DPU_IRQ_EXTDST5_SHDLOAD);
+}
+
+static void (* const dpu_irq_handler[DPU_IRQ_COUNT])(struct irq_desc *desc) = {
+	[DPU_IRQ_EXTDST0_SHDLOAD]          = dpu_ed0_shdload_irq_handler,
+	[DPU_IRQ_EXTDST4_SHDLOAD]          = dpu_ed4_shdload_irq_handler,
+	[DPU_IRQ_EXTDST1_SHDLOAD]          = dpu_ed1_shdload_irq_handler,
+	[DPU_IRQ_EXTDST5_SHDLOAD]          = dpu_ed5_shdload_irq_handler,
+	[DPU_IRQ_DISENGCFG_SHDLOAD0]       = dpu_dec_shdload0_irq_handler,
+	[DPU_IRQ_DISENGCFG_FRAMECOMPLETE0] = dpu_dec_framecomplete0_irq_handler,
+	[DPU_IRQ_DISENGCFG_SEQCOMPLETE0]   = dpu_dec_seqcomplete0_irq_handler,
+	[DPU_IRQ_DISENGCFG_SHDLOAD1]       = dpu_dec_shdload1_irq_handler,
+	[DPU_IRQ_DISENGCFG_FRAMECOMPLETE1] = dpu_dec_framecomplete1_irq_handler,
+	[DPU_IRQ_DISENGCFG_SEQCOMPLETE1]   = dpu_dec_seqcomplete1_irq_handler,
+	[DPU_IRQ_RESERVED]                 = NULL, /* do not use */
+};
+
+int dpu_map_irq(struct dpu_soc *dpu, int irq)
+{
+	int virq = irq_linear_revmap(dpu->domain, irq);
+
+	if (!virq)
+		virq = irq_create_mapping(dpu->domain, irq);
+
+	return virq;
+}
+
+static const unsigned long unused_irq[2] = {0x00000000, 0xfffe0008};
+
+static void dpu_irq_hw_init(struct dpu_soc *dpu)
+{
+	int i;
+
+	for (i = 0; i < DPU_IRQ_COUNT; i += 32) {
+		/* mask and clear all interrupts */
+		dpu_comctrl_write(dpu, USERINTERRUPTENABLE(i / 32), 0);
+		dpu_comctrl_write(dpu, USERINTERRUPTCLEAR(i / 32),
+				  ~unused_irq[i / 32]);
+		dpu_comctrl_write(dpu, INTERRUPTENABLE(i / 32), 0);
+		dpu_comctrl_write(dpu, INTERRUPTCLEAR(i / 32),
+				  ~unused_irq[i / 32]);
+
+		/* set all interrupts to user mode */
+		dpu_comctrl_write(dpu, USERINTERRUPTMASK(i / 32),
+				  ~unused_irq[i / 32]);
+	}
+}
+
+static int dpu_irq_init(struct dpu_soc *dpu)
+{
+	struct device *dev = dpu->dev;
+	struct irq_chip_generic *gc;
+	struct irq_chip_type *ct;
+	int ret, i;
+
+	dpu->domain = irq_domain_add_linear(dev->of_node, DPU_IRQ_COUNT,
+					    &irq_generic_chip_ops, dpu);
+	if (!dpu->domain) {
+		dev_err(dev, "failed to add irq domain\n");
+		return -ENODEV;
+	}
+
+	ret = irq_alloc_domain_generic_chips(dpu->domain, 32, 1, "DPU",
+					     handle_level_irq, 0, 0, 0);
+	if (ret) {
+		dev_err(dev, "failed to alloc generic irq chips: %d\n", ret);
+		irq_domain_remove(dpu->domain);
+		return ret;
+	}
+
+	for (i = 0; i < DPU_IRQ_COUNT; i += 32) {
+		gc = irq_get_domain_generic_chip(dpu->domain, i);
+		gc->reg_base = dpu->comctrl_reg;
+		gc->unused = unused_irq[i / 32];
+		ct = gc->chip_types;
+		ct->chip.irq_ack = irq_gc_ack_set_bit;
+		ct->chip.irq_mask = irq_gc_mask_clr_bit;
+		ct->chip.irq_unmask = irq_gc_mask_set_bit;
+		ct->regs.ack = USERINTERRUPTCLEAR(i / 32);
+		ct->regs.mask = USERINTERRUPTENABLE(i / 32);
+	}
+
+	for (i = 0; i < DPU_IRQ_COUNT; i++) {
+		if (!dpu_irq_handler[i])
+			continue;
+
+		irq_set_chained_handler_and_data(dpu->irq[i],
+						 dpu_irq_handler[i],
+						 dpu);
+	}
+
+	return ret;
+}
+
+static void dpu_irq_exit(struct dpu_soc *dpu)
+{
+	unsigned int i, irq;
+
+	for (i = 0; i < DPU_IRQ_COUNT; i++) {
+		if (!dpu_irq_handler[i])
+			continue;
+
+		irq_set_chained_handler_and_data(dpu->irq[i], NULL, NULL);
+	}
+
+	for (i = 0; i < DPU_IRQ_COUNT; i++) {
+		irq = irq_linear_revmap(dpu->domain, i);
+		if (irq)
+			irq_dispose_mapping(irq);
+	}
+
+	irq_domain_remove(dpu->domain);
+}
+
+static void dpu_submodules_hw_init(struct dpu_soc *dpu)
+{
+	const struct dpu_units *us;
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(dpu_all_units); i++) {
+		us = dpu_all_units[i];
+
+		for (j = 0; j < us->cnt; j++)
+			us->hw_init(dpu, j);
+	}
+}
+
+static int dpu_submodules_init(struct dpu_soc *dpu, unsigned long dpu_base)
+{
+	const struct dpu_units *us;
+	unsigned long pec_ofs;
+	int i, j, ret;
+
+	for (i = 0; i < ARRAY_SIZE(dpu_all_units); i++) {
+		us = dpu_all_units[i];
+
+		for (j = 0; j < us->cnt; j++) {
+			pec_ofs = us->pec_ofss ? dpu_base + us->pec_ofss[j] : 0;
+
+			ret = us->init(dpu, j, us->ids[j], us->types[j],
+				       pec_ofs, dpu_base + us->ofss[j]);
+			if (ret) {
+				dev_err(dpu->dev,
+					"failed to initialize %s%d: %d\n",
+						us->name, us->ids[j], ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int platform_remove_devices_fn(struct device *dev, void *unused)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	platform_device_unregister(pdev);
+
+	return 0;
+}
+
+static void platform_device_unregister_children(struct platform_device *pdev)
+{
+	device_for_each_child(&pdev->dev, NULL, platform_remove_devices_fn);
+}
+
+struct dpu_platform_reg {
+	struct dpu_client_platformdata pdata;
+	const char *name;
+};
+
+static struct dpu_platform_reg client_reg[] = {
+	{
+	  .pdata = {
+		.stream_id = 0,
+		.dec_frame_complete_irq	= DPU_IRQ_DISENGCFG_FRAMECOMPLETE0,
+		.dec_seq_complete_irq	= DPU_IRQ_DISENGCFG_SEQCOMPLETE0,
+		.dec_shdld_irq		= DPU_IRQ_DISENGCFG_SHDLOAD0,
+		.ed_cont_shdld_irq	= DPU_IRQ_EXTDST0_SHDLOAD,
+		.ed_safe_shdld_irq	= DPU_IRQ_EXTDST4_SHDLOAD,
+	   },
+	  .name = "imx-dpu-crtc",
+	}, {
+	  .pdata = {
+		.stream_id = 1,
+		.dec_frame_complete_irq	= DPU_IRQ_DISENGCFG_FRAMECOMPLETE1,
+		.dec_seq_complete_irq	= DPU_IRQ_DISENGCFG_SEQCOMPLETE1,
+		.dec_shdld_irq		= DPU_IRQ_DISENGCFG_SHDLOAD1,
+		.ed_cont_shdld_irq	= DPU_IRQ_EXTDST1_SHDLOAD,
+		.ed_safe_shdld_irq	= DPU_IRQ_EXTDST5_SHDLOAD,
+	  },
+	  .name = "imx-dpu-crtc",
+	}
+};
+
+static DEFINE_MUTEX(dpu_client_id_mutex);
+static int dpu_client_id;
+
+static int dpu_get_layerblends_for_plane_grp(struct dpu_soc *dpu,
+					     struct dpu_plane_res *res)
+{
+	int i, ret;
+
+	res->lb_cnt = dpu_lbs.cnt;
+
+	res->lb = devm_kcalloc(dpu->dev, res->lb_cnt, sizeof(*res->lb),
+			       GFP_KERNEL);
+	if (!res->lb)
+		return -ENOMEM;
+
+	for (i = 0; i < res->lb_cnt; i++) {
+		res->lb[i] = dpu_lb_get(dpu, lb_ids[i]);
+		if (IS_ERR(res->lb[i])) {
+			ret = PTR_ERR(res->lb[i]);
+			dev_err(dpu->dev, "failed to get %s%d: %d\n",
+				dpu_lbs.name, lb_ids[i], ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int
+dpu_get_fetchunits_for_plane_grp(struct dpu_soc *dpu,
+				 const struct dpu_units *us,
+				 struct dpu_fetchunit ***fu,
+				 unsigned int *cnt,
+				 struct dpu_fetchunit *
+						(*get)(struct dpu_soc *dpu,
+						       unsigned int id))
+{
+	unsigned int fu_cnt = 0;
+	int i, j, ret;
+
+	for (i = 0; i < us->cnt; i++) {
+		if (us->types[i] == DPU_DISP)
+			fu_cnt++;
+	}
+
+	*cnt = fu_cnt;
+
+	*fu = devm_kcalloc(dpu->dev, fu_cnt, sizeof(**fu), GFP_KERNEL);
+	if (!(*fu))
+		return -ENOMEM;
+
+	for (i = 0, j = 0; i < us->cnt; i++) {
+		if (us->types[i] != DPU_DISP)
+			continue;
+
+		(*fu)[j] = get(dpu, us->ids[i]);
+		if (IS_ERR((*fu)[j])) {
+			ret = PTR_ERR((*fu)[j]);
+			dev_err(dpu->dev, "failed to get %s%d: %d\n",
+				us->name, us->ids[i], ret);
+			return ret;
+		}
+		j++;
+	}
+
+	return 0;
+}
+
+static void dpu_add_fetchunits_to_plane_grp_list(struct list_head *list,
+						 struct dpu_fetchunit ***fu,
+						 unsigned int *cnt)
+{
+	int i;
+
+	for (i = *cnt - 1; i >= 0; i--)
+		dpu_fu_add_to_list((*fu)[i], list);
+}
+
+static int dpu_get_plane_grp_res(struct dpu_soc *dpu,
+				 struct dpu_plane_grp *grp)
+{
+	struct dpu_plane_res *res = &grp->res;
+	struct {
+		const struct dpu_units *us;
+		struct dpu_fetchunit ***fu;
+		unsigned int *cnt;
+		struct dpu_fetchunit *(*get)(struct dpu_soc *dpu,
+					     unsigned int id);
+	} fus[] = {
+		{&dpu_fds, &res->fd, &res->fd_cnt, dpu_fd_get},
+		{&dpu_fls, &res->fl, &res->fl_cnt, dpu_fl_get},
+		{&dpu_fws, &res->fw, &res->fw_cnt, dpu_fw_get},
+	};
+	int i, ret;
+
+	INIT_LIST_HEAD(&grp->fu_list);
+
+	ret = dpu_get_layerblends_for_plane_grp(dpu, res);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(fus); i++) {
+		ret = dpu_get_fetchunits_for_plane_grp(dpu, fus[i].us, fus[i].fu,
+						       fus[i].cnt, fus[i].get);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(fus); i++)
+		dpu_add_fetchunits_to_plane_grp_list(&grp->fu_list,
+						     fus[i].fu, fus[i].cnt);
+
+	grp->hw_plane_cnt = res->fd_cnt + res->fl_cnt + res->fw_cnt;
+
+	return ret;
+}
+
+static void
+dpu_put_fetchunits_for_plane_grp(struct dpu_fetchunit ***fu,
+				 unsigned int *cnt,
+				 void (*put)(struct dpu_fetchunit *fu))
+{
+	int i;
+
+	for (i = 0; i < *cnt; i++)
+		put((*fu)[i]);
+
+	*cnt = 0;
+}
+
+static void dpu_put_plane_grp_res(struct dpu_plane_grp *grp)
+{
+	struct dpu_plane_res *res = &grp->res;
+	struct list_head *l, *tmp;
+	struct {
+		struct dpu_fetchunit ***fu;
+		unsigned int *cnt;
+		void (*put)(struct dpu_fetchunit *fu);
+	} fus[] = {
+		{&res->fd, &res->fd_cnt, dpu_fd_put},
+		{&res->fl, &res->fl_cnt, dpu_fl_put},
+		{&res->fw, &res->fw_cnt, dpu_fw_put},
+	};
+	int i;
+
+	grp->hw_plane_cnt = 0;
+
+	list_for_each_safe(l, tmp, &grp->fu_list)
+		list_del(l);
+
+	for (i = 0; i < ARRAY_SIZE(fus); i++)
+		dpu_put_fetchunits_for_plane_grp(fus[i].fu,
+						 fus[i].cnt, fus[i].put);
+
+	for (i = 0; i < res->lb_cnt; i++)
+		dpu_lb_put(res->lb[i]);
+	res->lb_cnt = 0;
+}
+
+static int dpu_add_client_devices(struct dpu_soc *dpu)
+{
+	struct device *dev = dpu->dev;
+	struct dpu_platform_reg *reg;
+	struct dpu_crtc_grp *crtc_grp;
+	struct dpu_plane_grp *plane_grp;
+	size_t client_cnt, reg_size;
+	int i, id, ret;
+
+	client_cnt = ARRAY_SIZE(client_reg);
+
+	reg = devm_kcalloc(dev, client_cnt, sizeof(*reg), GFP_KERNEL);
+	if (!reg)
+		return -ENOMEM;
+
+	crtc_grp = devm_kzalloc(dev, sizeof(*crtc_grp), GFP_KERNEL);
+	if (!crtc_grp)
+		return -ENOMEM;
+
+	plane_grp = devm_kzalloc(dev, sizeof(*plane_grp), GFP_KERNEL);
+	if (!plane_grp)
+		return -ENOMEM;
+
+	crtc_grp->plane_grp = plane_grp;
+
+	mutex_lock(&dpu_client_id_mutex);
+	id = dpu_client_id;
+	dpu_client_id += client_cnt;
+	mutex_unlock(&dpu_client_id_mutex);
+
+	reg_size = client_cnt * sizeof(struct dpu_platform_reg);
+	memcpy(reg, &client_reg[0], reg_size);
+
+	ret = dpu_get_plane_grp_res(dpu, plane_grp);
+	if (ret)
+		goto err_get_plane_res;
+
+	for (i = 0; i < client_cnt; i++) {
+		struct platform_device *pdev;
+		struct device_node *np;
+
+		/* Associate subdevice with the corresponding port node. */
+		np = of_graph_get_port_by_id(dev->of_node, i);
+		if (!np) {
+			dev_info(dev,
+				 "no port@%d node in %s, not using DISP%d\n",
+				 i, dev->of_node->full_name, i);
+			continue;
+		}
+
+		reg[i].pdata.crtc_grp = crtc_grp;
+
+		pdev = platform_device_alloc(reg[i].name, id++);
+		if (!pdev) {
+			ret = -ENOMEM;
+			goto err_register;
+		}
+
+		pdev->dev.parent = dev;
+		pdev->dev.of_node = np;
+		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
+		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
+
+		reg[i].pdata.of_node = np;
+		ret = platform_device_add_data(pdev, &reg[i].pdata,
+					       sizeof(reg[i].pdata));
+		if (!ret)
+			ret = platform_device_add(pdev);
+		if (ret) {
+			platform_device_put(pdev);
+			goto err_register;
+		}
+	}
+
+	return ret;
+
+err_register:
+	platform_device_unregister_children(to_platform_device(dev));
+err_get_plane_res:
+	dpu_put_plane_grp_res(plane_grp);
+
+	return ret;
+}
+
+static int dpu_core_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dpu_soc *dpu;
+	struct resource *res;
+	unsigned long dpu_base;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	dpu_base = res->start;
+
+	dpu = devm_kzalloc(dev, sizeof(*dpu), GFP_KERNEL);
+	if (!dpu)
+		return -ENOMEM;
+
+	dpu->dev = dev;
+
+	dpu_units_addr_dbg(dpu, dpu_base);
+
+	ret = dpu_get_irqs(pdev, dpu);
+	if (ret)
+		return ret;
+
+	dpu->comctrl_reg = devm_ioremap(dev, dpu_base, SZ_512);
+	if (!dpu->comctrl_reg)
+		return -ENOMEM;
+
+	ret = dpu_attach_pm_domains(dpu);
+	if (ret)
+		return ret;
+
+	dpu->clk_cfg = devm_clk_get(dev, "cfg");
+	if (IS_ERR(dpu->clk_cfg)) {
+		ret = PTR_ERR(dpu->clk_cfg);
+		dev_err_probe(dev, ret, "failed to get cfg clock\n");
+		goto failed_clk_cfg_get;
+	}
+
+	dpu->clk_axi = devm_clk_get(dev, "axi");
+	if (IS_ERR(dpu->clk_axi)) {
+		ret = PTR_ERR(dpu->clk_axi);
+		dev_err_probe(dev, ret, "failed to get axi clock\n");
+		goto failed_clk_axi_get;
+	}
+
+	ret = dpu_irq_init(dpu);
+	if (ret)
+		goto failed_irq_init;
+
+	ret = dpu_submodules_init(dpu, dpu_base);
+	if (ret)
+		goto failed_submodules_init;
+
+	platform_set_drvdata(pdev, dpu);
+
+	pm_runtime_enable(dev);
+
+	ret = dpu_add_client_devices(dpu);
+	if (ret) {
+		dev_err(dev, "failed to add client devices: %d\n", ret);
+		goto failed_add_clients;
+	}
+
+	return ret;
+
+failed_add_clients:
+	pm_runtime_disable(dev);
+failed_submodules_init:
+	dpu_irq_exit(dpu);
+failed_irq_init:
+failed_clk_axi_get:
+failed_clk_cfg_get:
+	dpu_detach_pm_domains(dpu);
+	return ret;
+}
+
+static int dpu_core_remove(struct platform_device *pdev)
+{
+	struct dpu_soc *dpu = platform_get_drvdata(pdev);
+
+	platform_device_unregister_children(pdev);
+	pm_runtime_disable(dpu->dev);
+	dpu_irq_exit(dpu);
+	dpu_detach_pm_domains(dpu);
+
+	return 0;
+}
+
+static int __maybe_unused dpu_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dpu_soc *dpu = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(dpu->clk_axi);
+	clk_disable_unprepare(dpu->clk_cfg);
+
+	dev_dbg(dev, "suspended\n");
+
+	return 0;
+}
+
+static int __maybe_unused dpu_runtime_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dpu_soc *dpu = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(dpu->clk_cfg);
+	if (ret) {
+		dev_err(dev, "failed to enable cfg clock: %d\n", ret);
+		return ret;
+	}
+	ret = clk_prepare_enable(dpu->clk_axi);
+	if (ret) {
+		clk_disable_unprepare(dpu->clk_cfg);
+		dev_err(dev, "failed to enable axi clock: %d\n", ret);
+		return ret;
+	}
+
+	dpu_irq_hw_init(dpu);
+
+	dpu_submodules_hw_init(dpu);
+
+	dev_dbg(dev, "resumed\n");
+
+	return ret;
+}
+
+static const struct dev_pm_ops dpu_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
+};
+
+const struct of_device_id dpu_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-dpu" },
+	{ .compatible = "fsl,imx8qxp-dpu" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dpu_dt_ids);
+
+struct platform_driver dpu_core_driver = {
+	.driver = {
+		.pm = &dpu_pm_ops,
+		.name = "dpu-core",
+		.of_match_table = dpu_dt_ids,
+	},
+	.probe = dpu_core_probe,
+	.remove = dpu_core_remove,
+};
diff --git a/drivers/gpu/drm/imx/dpu/dpu-crtc.c b/drivers/gpu/drm/imx/dpu/dpu-crtc.c
new file mode 100644
index 000000000000..782d1d82dbbf
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-crtc.c
@@ -0,0 +1,969 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/irq.h>
+#include <linux/irqflags.h>
+#include <linux/pm_runtime.h>
+#include <linux/preempt.h>
+#include <linux/spinlock.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_color_mgmt.h>
+
+#include "dpu.h"
+#include "dpu-crtc.h"
+#include "dpu-dprc.h"
+#include "dpu-drv.h"
+#include "dpu-plane.h"
+
+#define DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(_name)			\
+do {									\
+	unsigned long ret;						\
+	ret = wait_for_completion_timeout(&dpu_crtc->_name, HZ);	\
+	if (ret == 0)							\
+		dpu_crtc_err(crtc, "%s: wait for " #_name " timeout\n",	\
+							__func__);	\
+} while (0)
+
+#define DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(fg)			\
+do {									\
+	if (dpu_fg_wait_for_frame_counter_moving(fg))			\
+		dpu_crtc_err(crtc,					\
+			"%s: FrameGen frame counter isn't moving\n",	\
+							__func__);	\
+} while (0)
+
+#define DPU_CRTC_CHECK_FRAMEGEN_FIFO(fg)				\
+do {									\
+	typeof (fg) _fg = (fg);						\
+	if (dpu_fg_secondary_requests_to_read_empty_fifo(_fg)) {	\
+		dpu_fg_secondary_clear_channel_status(_fg);		\
+		dpu_crtc_err(crtc, "%s: FrameGen FIFO empty\n",		\
+							__func__);	\
+	}								\
+} while (0)
+
+#define DPU_CRTC_WAIT_FOR_FRAMEGEN_SECONDARY_SYNCUP(fg)			\
+do {									\
+	if (dpu_fg_wait_for_secondary_syncup(fg))			\
+		dpu_crtc_err(crtc,					\
+			"%s: FrameGen secondary channel isn't syncup\n",\
+							__func__);	\
+} while (0)
+
+static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
+{
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+
+	if (pm_runtime_active(dpu_crtc->dev->parent))
+		return dpu_fg_get_frame_index(dpu_crtc->fg);
+	else
+		return (u32)drm_crtc_vblank_count(crtc);
+}
+
+static int dpu_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+
+	enable_irq(dpu_crtc->dec_frame_complete_irq);
+
+	return 0;
+}
+
+static void dpu_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+
+	disable_irq_nosync(dpu_crtc->dec_frame_complete_irq);
+}
+
+static irqreturn_t
+dpu_crtc_dec_frame_complete_irq_handler(int irq, void *dev_id)
+{
+	struct dpu_crtc *dpu_crtc = dev_id;
+	struct drm_crtc *crtc = &dpu_crtc->base;
+	unsigned long flags;
+
+	drm_crtc_handle_vblank(crtc);
+
+	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	if (dpu_crtc->event) {
+		drm_crtc_send_vblank_event(crtc, dpu_crtc->event);
+		dpu_crtc->event = NULL;
+		drm_crtc_vblank_put(crtc);
+	}
+	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t dpu_crtc_common_irq_handler(int irq, void *dev_id)
+{
+	struct dpu_crtc *dpu_crtc = dev_id;
+	struct drm_crtc *crtc = &dpu_crtc->base;
+
+	if (irq == dpu_crtc->dec_seq_complete_irq) {
+		complete(&dpu_crtc->dec_seq_complete_done);
+	} else if (irq == dpu_crtc->dec_shdld_irq) {
+		complete(&dpu_crtc->dec_shdld_done);
+	} else if (irq == dpu_crtc->ed_cont_shdld_irq) {
+		complete(&dpu_crtc->ed_cont_shdld_done);
+	} else if (irq == dpu_crtc->ed_safe_shdld_irq) {
+		complete(&dpu_crtc->ed_safe_shdld_done);
+	} else {
+		dpu_crtc_err(crtc, "invalid CRTC irq(%u)\n", irq);
+		return IRQ_NONE;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static const struct drm_crtc_funcs dpu_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.get_vblank_counter	= dpu_crtc_get_vblank_counter,
+	.enable_vblank		= dpu_crtc_enable_vblank,
+	.disable_vblank		= dpu_crtc_disable_vblank,
+	.get_vblank_timestamp	= drm_crtc_vblank_helper_get_vblank_timestamp,
+};
+
+static void dpu_crtc_queue_state_event(struct drm_crtc *crtc)
+{
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc->state->event) {
+		WARN_ON(drm_crtc_vblank_get(crtc));
+		WARN_ON(dpu_crtc->event);
+		dpu_crtc->event = crtc->state->event;
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static enum drm_mode_status
+dpu_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
+{
+	if (mode->crtc_clock > DPU_FRAMEGEN_MAX_CLOCK)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static int dpu_crtc_pm_runtime_get_sync(struct dpu_crtc *dpu_crtc)
+{
+	int ret;
+
+	ret = pm_runtime_get_sync(dpu_crtc->dev->parent);
+	if (ret < 0) {
+		pm_runtime_put_noidle(dpu_crtc->dev->parent);
+		dpu_crtc_err(&dpu_crtc->base,
+			     "failed to get parent device RPM sync: %d\n", ret);
+	}
+
+	return ret;
+}
+
+static int dpu_crtc_pm_runtime_put(struct dpu_crtc *dpu_crtc)
+{
+	int ret;
+
+	ret = pm_runtime_put(dpu_crtc->dev->parent);
+	if (ret < 0)
+		dpu_crtc_err(&dpu_crtc->base,
+			     "failed to put parent device RPM: %d\n", ret);
+
+	return ret;
+}
+
+static void dpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+	struct drm_display_mode *adj = &crtc->state->adjusted_mode;
+	enum dpu_link_id cf_link;
+
+	dpu_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
+
+	/* request power-on when we start to set mode for CRTC */
+	dpu_crtc_pm_runtime_get_sync(dpu_crtc);
+
+	dpu_fg_displaymode(dpu_crtc->fg, FG_DM_SEC_ON_TOP);
+	dpu_fg_panic_displaymode(dpu_crtc->fg, FG_DM_CONSTCOL);
+	dpu_fg_cfg_videomode(dpu_crtc->fg, adj);
+
+	dpu_tcon_cfg_videomode(dpu_crtc->tcon, adj);
+	dpu_tcon_set_fmt(dpu_crtc->tcon);
+
+	dpu_cf_framedimensions(dpu_crtc->cf_cont,
+			       adj->crtc_hdisplay, adj->crtc_vdisplay);
+	dpu_cf_framedimensions(dpu_crtc->cf_safe,
+			       adj->crtc_hdisplay, adj->crtc_vdisplay);
+	/* constframe in content stream shows black frame - CRTC background */
+	dpu_cf_constantcolor_black(dpu_crtc->cf_cont);
+	/* constframe in safety stream shows blue frame */
+	dpu_cf_constantcolor_blue(dpu_crtc->cf_safe);
+
+	cf_link = dpu_cf_get_link_id(dpu_crtc->cf_safe);
+	dpu_ed_pec_src_sel(dpu_crtc->ed_safe, cf_link);
+
+	cf_link = dpu_cf_get_link_id(dpu_crtc->cf_cont);
+	dpu_ed_pec_src_sel(dpu_crtc->ed_cont, cf_link);
+}
+
+static int dpu_crtc_atomic_check_gamma(struct drm_crtc *crtc,
+				       struct drm_crtc_state *state)
+{
+	size_t lut_size;
+
+	if (!state->color_mgmt_changed || !state->gamma_lut)
+		return 0;
+
+	if (crtc->state->gamma_lut &&
+	    crtc->state->gamma_lut->base.id == state->gamma_lut->base.id)
+		return 0;
+
+	if (state->gamma_lut->length % sizeof(struct drm_color_lut)) {
+		dpu_crtc_dbg(crtc, "wrong gamma_lut length\n");
+		return -EINVAL;
+	}
+
+	lut_size = state->gamma_lut->length / sizeof(struct drm_color_lut);
+	if (lut_size != 256) {
+		dpu_crtc_dbg(crtc, "gamma_lut size is not 256\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	ret = dpu_crtc_atomic_check_gamma(crtc, crtc_state);
+	if (ret)
+		return ret;
+
+	/* force a mode set if the CRTC is changed to active */
+	if (crtc_state->active_changed && crtc_state->active) {
+		/*
+		 * If mode_changed is set by us, call
+		 * drm_atomic_helper_check_modeset() as it's Kerneldoc requires.
+		 */
+		if (!crtc_state->mode_changed) {
+			crtc_state->mode_changed = true;
+
+			ret = drm_atomic_helper_check_modeset(crtc->dev, state);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
+				  struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *old_crtc_state;
+	struct drm_atomic_state *old_state;
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+	struct drm_plane *plane;
+	struct drm_plane_state *old_plane_state;
+	struct dpu_plane_state *old_dpstate;
+	struct dpu_fetchunit *fu;
+	const struct dpu_fetchunit_ops *fu_ops;
+	enum dpu_link_id cf_link;
+	int i;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	old_state = old_crtc_state->state;
+
+	/* do nothing if planes keep being disabled */
+	if (old_crtc_state->plane_mask == 0 && crtc->state->plane_mask == 0)
+		return;
+
+	/* request power-on when any plane starts to be active */
+	if (old_crtc_state->plane_mask == 0 && crtc->state->plane_mask != 0)
+		dpu_crtc_pm_runtime_get_sync(dpu_crtc);
+
+	/*
+	 * Disable relevant planes' resources in SHADOW only.
+	 * Whether any of them would be disabled or kept running depends
+	 * on new plane states in the new global atomic state.
+	 */
+	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
+		old_dpstate = to_dpu_plane_state(old_plane_state);
+
+		if (!old_plane_state->fb)
+			continue;
+
+		if (old_plane_state->crtc != crtc)
+			continue;
+
+		fu = old_dpstate->source;
+
+		fu_ops = dpu_fu_get_ops(fu);
+
+		fu_ops->disable_src_buf(fu);
+
+		if (old_dpstate->is_top) {
+			cf_link = dpu_cf_get_link_id(dpu_crtc->cf_cont);
+			dpu_ed_pec_src_sel(dpu_crtc->ed_cont, cf_link);
+		}
+	}
+}
+
+static void dpu_crtc_set_gammacor(struct dpu_crtc *dpu_crtc)
+{
+	struct drm_crtc *crtc = &dpu_crtc->base;
+	struct drm_color_lut *lut;
+
+	lut = (struct drm_color_lut *)crtc->state->gamma_lut->data;
+
+	dpu_gc_enable_rgb_write(dpu_crtc->gc);
+	dpu_gc_mode(dpu_crtc->gc, GC_GAMMACOR);
+
+	dpu_gc_start_rgb(dpu_crtc->gc, lut);
+	dpu_gc_delta_rgb(dpu_crtc->gc, lut);
+}
+
+static void dpu_crtc_set_gammacor_sync(struct dpu_crtc *dpu_crtc)
+{
+	struct drm_crtc *crtc = &dpu_crtc->base;
+
+	enable_irq(dpu_crtc->dec_shdld_irq);
+
+	dpu_crtc_set_gammacor(dpu_crtc);
+	dpu_fg_shdtokgen(dpu_crtc->fg);
+	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
+
+	disable_irq(dpu_crtc->dec_shdld_irq);
+}
+
+static void dpu_crtc_disable_gammacor(struct dpu_crtc *dpu_crtc)
+{
+	dpu_gc_mode(dpu_crtc->gc, GC_NEUTRAL);
+	dpu_gc_disable_rgb_write(dpu_crtc->gc);
+}
+
+static void dpu_crtc_disable_gammacor_sync(struct dpu_crtc *dpu_crtc)
+{
+	struct drm_crtc *crtc = &dpu_crtc->base;
+
+	enable_irq(dpu_crtc->dec_shdld_irq);
+
+	dpu_crtc_disable_gammacor(dpu_crtc);
+	dpu_fg_shdtokgen(dpu_crtc->fg);
+	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
+
+	disable_irq(dpu_crtc->dec_shdld_irq);
+}
+
+static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
+				  struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *old_crtc_state;
+	struct drm_atomic_state *old_state;
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+	struct drm_plane *plane;
+	struct drm_plane_state *old_plane_state;
+	struct dpu_plane_state *old_dpstate;
+	struct dpu_fetchunit *fu;
+	struct dpu_dprc *dprc;
+	const struct dpu_fetchunit_ops *fu_ops;
+	bool need_modeset = drm_atomic_crtc_needs_modeset(crtc->state);
+	unsigned long flags;
+	int i;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	old_state = old_crtc_state->state;
+
+	if (old_crtc_state->plane_mask == 0 && crtc->state->plane_mask == 0) {
+		/* Queue a pending vbl event if necessary. */
+		if (!need_modeset && crtc->state->active)
+			dpu_crtc_queue_state_event(crtc);
+		return;
+	}
+
+	if (!need_modeset && crtc->state->active)
+		enable_irq(dpu_crtc->ed_cont_shdld_irq);
+
+	/*
+	 * Don't relinquish CPU until DPRC repeat_en is disabled
+	 * and flush is done(if necessary).
+	 */
+	local_irq_save(flags);
+	preempt_disable();
+
+	/*
+	 * Scan over old plane fetchunits to determine if we
+	 * need to wait for FrameGen frame counter moving in
+	 * the next loop prior to DPRC repeat_en disablement
+	 * or not.
+	 */
+	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
+		old_dpstate = to_dpu_plane_state(old_plane_state);
+
+		if (!old_plane_state->fb)
+			continue;
+
+		if (old_plane_state->crtc != crtc)
+			continue;
+
+		fu = old_dpstate->source;
+
+		fu_ops = dpu_fu_get_ops(fu);
+
+		/*
+		 * Sync with FrameGen frame counter moving so that
+		 * we may disable DPRC repeat_en correctly.
+		 */
+		if (!fu_ops->is_enabled(fu) && !need_modeset &&
+		    old_crtc_state->active) {
+			DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
+			break;
+		}
+	}
+
+	/*
+	 * Set no stream id for disabled fetchunits of relevant planes.
+	 * Also, disable DPRC repeat_en if necessary.
+	 */
+	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
+		old_dpstate = to_dpu_plane_state(old_plane_state);
+
+		if (!old_plane_state->fb)
+			continue;
+
+		if (old_plane_state->crtc != crtc)
+			continue;
+
+		fu = old_dpstate->source;
+
+		fu_ops = dpu_fu_get_ops(fu);
+
+		if (!fu_ops->is_enabled(fu)) {
+			fu_ops->set_no_stream_id(fu);
+
+			dprc = fu_ops->get_dprc(fu);
+			dpu_dprc_disable_repeat_en(dprc);
+		}
+	}
+
+	if (!need_modeset && crtc->state->active) {
+		/*
+		 * Flush plane(s) update out to display & queue a pending
+		 * vbl event if necessary.
+		 */
+		dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
+
+		local_irq_restore(flags);
+		preempt_enable();
+
+		if (old_crtc_state->gamma_lut && !crtc->state->gamma_lut)
+			dpu_crtc_disable_gammacor_sync(dpu_crtc);
+		else if (old_crtc_state->gamma_lut && crtc->state->gamma_lut &&
+			 old_crtc_state->gamma_lut->base.id !=
+			 crtc->state->gamma_lut->base.id)
+			dpu_crtc_set_gammacor_sync(dpu_crtc);
+
+		DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdld_done);
+
+		disable_irq(dpu_crtc->ed_cont_shdld_irq);
+
+		DPU_CRTC_CHECK_FRAMEGEN_FIFO(dpu_crtc->fg);
+
+		dpu_crtc_queue_state_event(crtc);
+	} else {
+		/*
+		 * Simply flush and hope that any update takes effect
+		 * if CRTC is disabled.  This helps for the case where
+		 * migrating plane(s) from a disabled CRTC to the other
+		 * CRTC.
+		 */
+		if (!crtc->state->active)
+			dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
+
+		local_irq_restore(flags);
+		preempt_enable();
+	}
+
+	/* request power-off when all planes are off */
+	if (old_crtc_state->plane_mask != 0 && crtc->state->plane_mask == 0)
+		dpu_crtc_pm_runtime_put(dpu_crtc);
+}
+
+static void dpu_crtc_atomic_enable(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
+{
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+	unsigned long flags;
+
+	drm_crtc_vblank_on(crtc);
+
+	enable_irq(dpu_crtc->dec_shdld_irq);
+	enable_irq(dpu_crtc->ed_cont_shdld_irq);
+	enable_irq(dpu_crtc->ed_safe_shdld_irq);
+
+	dpu_fg_enable_clock(dpu_crtc->fg);
+	dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
+	dpu_ed_pec_sync_trigger(dpu_crtc->ed_safe);
+	if (crtc->state->gamma_lut)
+		dpu_crtc_set_gammacor(dpu_crtc);
+	else
+		dpu_crtc_disable_gammacor(dpu_crtc);
+	dpu_fg_shdtokgen(dpu_crtc->fg);
+
+	/* don't relinquish CPU until TCON is set to operation mode */
+	local_irq_save(flags);
+	preempt_disable();
+	dpu_fg_enable(dpu_crtc->fg);
+
+	/*
+	 * TKT320590:
+	 * Turn TCON into operation mode as soon as the first dumb
+	 * frame is generated by DPU(we don't relinquish CPU to ensure
+	 * this).  This makes DPR/PRG be able to evade the frame.
+	 */
+	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
+	dpu_tcon_set_operation_mode(dpu_crtc->tcon);
+	local_irq_restore(flags);
+	preempt_enable();
+
+	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdld_done);
+	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdld_done);
+	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
+
+	disable_irq(dpu_crtc->ed_safe_shdld_irq);
+	disable_irq(dpu_crtc->ed_cont_shdld_irq);
+	disable_irq(dpu_crtc->dec_shdld_irq);
+
+	DPU_CRTC_WAIT_FOR_FRAMEGEN_SECONDARY_SYNCUP(dpu_crtc->fg);
+
+	DPU_CRTC_CHECK_FRAMEGEN_FIFO(dpu_crtc->fg);
+
+	dpu_crtc_queue_state_event(crtc);
+}
+
+static void dpu_crtc_atomic_disable(struct drm_crtc *crtc,
+				    struct drm_atomic_state *state)
+{
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+	struct drm_plane *plane;
+	struct drm_plane_state *old_plane_state;
+	struct dpu_plane_state *old_dpstate;
+	struct dpu_fetchunit *fu;
+	struct dpu_dprc *dprc;
+	const struct dpu_fetchunit_ops *fu_ops;
+	unsigned long flags;
+	int i;
+
+	enable_irq(dpu_crtc->dec_seq_complete_irq);
+
+	/* don't relinquish CPU until DPRC repeat_en is disabled */
+	local_irq_save(flags);
+	preempt_disable();
+	/*
+	 * Sync to FrameGen frame counter moving so that
+	 * FrameGen can be disabled in the next frame.
+	 */
+	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
+	dpu_fg_disable(dpu_crtc->fg);
+	/*
+	 * There is one frame leftover after FrameGen disablement.
+	 * Sync to FrameGen frame counter moving so that
+	 * DPRC repeat_en can be disabled in the next frame.
+	 */
+	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
+
+	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
+		old_dpstate = to_dpu_plane_state(old_plane_state);
+
+		if (!old_plane_state->fb)
+			continue;
+
+		if (old_plane_state->crtc != crtc)
+			continue;
+
+		fu = old_dpstate->source;
+
+		fu_ops = dpu_fu_get_ops(fu);
+
+		dprc = fu_ops->get_dprc(fu);
+		dpu_dprc_disable_repeat_en(dprc);
+	}
+
+	local_irq_restore(flags);
+	preempt_enable();
+
+	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seq_complete_done);
+
+	disable_irq(dpu_crtc->dec_seq_complete_irq);
+
+	dpu_fg_disable_clock(dpu_crtc->fg);
+
+	drm_crtc_vblank_off(crtc);
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc->state->event && !crtc->state->active) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+
+	/* request power-off when CRTC is disabled */
+	dpu_crtc_pm_runtime_put(dpu_crtc);
+}
+
+static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
+					  bool in_vblank_irq,
+					  int *vpos, int *hpos,
+					  ktime_t *stime, ktime_t *etime,
+					  const struct drm_display_mode *mode)
+{
+	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+	int vdisplay = mode->crtc_vdisplay;
+	int vtotal = mode->crtc_vtotal;
+	int line;
+	bool reliable;
+
+	if (stime)
+		*stime = ktime_get();
+
+	if (pm_runtime_active(dpu_crtc->dev->parent)) {
+		/* line index starts with 0 for the first active output line */
+		line = dpu_fg_get_line_index(dpu_crtc->fg);
+
+		if (line < vdisplay)
+			/* active scanout area - positive */
+			*vpos = line + 1;
+		else
+			/* inside vblank - negative */
+			*vpos = line - (vtotal - 1);
+
+		reliable = true;
+	} else {
+		*vpos = 0;
+		reliable = false;
+	}
+
+	*hpos = 0;
+
+	if (etime)
+		*etime = ktime_get();
+
+	return reliable;
+}
+
+static const struct drm_crtc_helper_funcs dpu_helper_funcs = {
+	.mode_valid		= dpu_crtc_mode_valid,
+	.mode_set_nofb		= dpu_crtc_mode_set_nofb,
+	.atomic_check		= dpu_crtc_atomic_check,
+	.atomic_begin		= dpu_crtc_atomic_begin,
+	.atomic_flush		= dpu_crtc_atomic_flush,
+	.atomic_enable		= dpu_crtc_atomic_enable,
+	.atomic_disable		= dpu_crtc_atomic_disable,
+	.get_scanout_position	= dpu_crtc_get_scanout_position,
+};
+
+static void dpu_crtc_put_resources(struct dpu_crtc *dpu_crtc)
+{
+	dpu_cf_cont_put(dpu_crtc->cf_cont);
+	dpu_cf_safe_put(dpu_crtc->cf_safe);
+	dpu_dec_put(dpu_crtc->dec);
+	dpu_ed_cont_put(dpu_crtc->ed_cont);
+	dpu_ed_safe_put(dpu_crtc->ed_safe);
+	dpu_fg_put(dpu_crtc->fg);
+	dpu_gc_put(dpu_crtc->gc);
+	dpu_tcon_put(dpu_crtc->tcon);
+}
+
+static int dpu_crtc_get_resources(struct dpu_crtc *dpu_crtc)
+{
+	struct dpu_soc *dpu = dev_get_drvdata(dpu_crtc->dev->parent);
+	struct {
+		void **dpu_unit;
+		void *(*get)(struct dpu_soc *dpu, unsigned int id);
+	} resources[] = {
+		{(void *)&dpu_crtc->cf_cont,	(void *)dpu_cf_cont_get},
+		{(void *)&dpu_crtc->cf_safe,	(void *)dpu_cf_safe_get},
+		{(void *)&dpu_crtc->dec,	(void *)dpu_dec_get},
+		{(void *)&dpu_crtc->ed_cont,	(void *)dpu_ed_cont_get},
+		{(void *)&dpu_crtc->ed_safe,	(void *)dpu_ed_safe_get},
+		{(void *)&dpu_crtc->fg,		(void *)dpu_fg_get},
+		{(void *)&dpu_crtc->gc,		(void *)dpu_gc_get},
+		{(void *)&dpu_crtc->tcon,	(void *)dpu_tcon_get},
+	};
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(resources); i++) {
+		*resources[i].dpu_unit =
+				resources[i].get(dpu, dpu_crtc->stream_id);
+		if (IS_ERR(*resources[i].dpu_unit)) {
+			ret = PTR_ERR(*resources[i].dpu_unit);
+			dpu_crtc_put_resources(dpu_crtc);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int dpu_crtc_request_irq(struct dpu_crtc *dpu_crtc,
+				unsigned int *crtc_irq,
+				unsigned int dpu_irq,
+				irqreturn_t (*irq_handler)(int irq,
+							   void *dev_id))
+{
+	struct drm_crtc *crtc = &dpu_crtc->base;
+	struct dpu_soc *dpu = dev_get_drvdata(dpu_crtc->dev->parent);
+	int ret;
+
+	*crtc_irq = dpu_map_irq(dpu, dpu_irq);
+	irq_set_status_flags(*crtc_irq, IRQ_DISABLE_UNLAZY);
+	ret = devm_request_irq(dpu_crtc->dev, *crtc_irq, irq_handler,
+			       0, dev_name(dpu_crtc->dev), dpu_crtc);
+	if (ret < 0) {
+		dpu_crtc_err(crtc, "failed to request irq(%u): %d\n",
+			     *crtc_irq, ret);
+		return ret;
+	}
+	disable_irq(*crtc_irq);
+
+	return 0;
+}
+
+static int dpu_crtc_request_irqs(struct dpu_crtc *dpu_crtc,
+				 struct dpu_client_platformdata *pdata)
+{
+	struct {
+		unsigned int *crtc_irq;
+		unsigned int dpu_irq;
+		irqreturn_t (*irq_handler)(int irq, void *dev_id);
+	} irqs[] = {
+		{
+			&dpu_crtc->dec_frame_complete_irq,
+			pdata->dec_frame_complete_irq,
+			dpu_crtc_dec_frame_complete_irq_handler,
+		}, {
+			&dpu_crtc->dec_seq_complete_irq,
+			pdata->dec_seq_complete_irq,
+			dpu_crtc_common_irq_handler,
+		}, {
+			&dpu_crtc->dec_shdld_irq,
+			pdata->dec_shdld_irq,
+			dpu_crtc_common_irq_handler,
+		}, {
+			&dpu_crtc->ed_cont_shdld_irq,
+			pdata->ed_cont_shdld_irq,
+			dpu_crtc_common_irq_handler,
+		}, {
+			&dpu_crtc->ed_safe_shdld_irq,
+			pdata->ed_safe_shdld_irq,
+			dpu_crtc_common_irq_handler,
+		},
+	};
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(irqs); i++) {
+		ret = dpu_crtc_request_irq(dpu_crtc,
+					   irqs[i].crtc_irq, irqs[i].dpu_irq,
+					   irqs[i].irq_handler);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int dpu_crtc_init(struct dpu_crtc *dpu_crtc,
+			 struct dpu_client_platformdata *pdata,
+			 struct dpu_drm_device *dpu_drm)
+{
+	struct drm_device *drm = &dpu_drm->base;
+	struct drm_crtc *crtc = &dpu_crtc->base;
+	struct dpu_plane *dpu_plane;
+	struct dpu_crtc_grp *crtc_grp = pdata->crtc_grp;
+	struct dpu_plane_grp *plane_grp = crtc_grp->plane_grp;
+	unsigned int stream_id = pdata->stream_id;
+	unsigned int crtc_cnt;
+	int i, ret;
+
+	init_completion(&dpu_crtc->dec_seq_complete_done);
+	init_completion(&dpu_crtc->dec_shdld_done);
+	init_completion(&dpu_crtc->ed_cont_shdld_done);
+	init_completion(&dpu_crtc->ed_safe_shdld_done);
+
+	dpu_crtc->grp = crtc_grp;
+	dpu_crtc->stream_id = stream_id;
+	dpu_crtc->hw_plane_cnt = plane_grp->hw_plane_cnt;
+
+	ret = dpu_crtc_get_resources(dpu_crtc);
+	if (ret) {
+		drm_err(drm, "failed to get HW resources for CRTC: %d\n", ret);
+		return ret;
+	}
+
+	plane_grp->cf[stream_id] = dpu_crtc->cf_cont;
+	plane_grp->ed[stream_id] = dpu_crtc->ed_cont;
+
+	/* each CRTC has a primary plane */
+	dpu_plane = dpu_plane_initialize(drm, 0, plane_grp,
+					 DRM_PLANE_TYPE_PRIMARY);
+	if (IS_ERR(dpu_plane)) {
+		ret = PTR_ERR(dpu_plane);
+		drm_err(drm, "failed to init primary plane: %d\n", ret);
+		goto err_put_resources;
+	}
+
+	drm_crtc_helper_add(crtc, &dpu_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, crtc, &dpu_plane->base,
+					NULL, &dpu_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(drm, "failed to add CRTC: %d\n", ret);
+		goto err_put_resources;
+	}
+
+	/* X server assumes 256 element gamma table so let's use that. */
+	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
+	if (ret) {
+		dpu_crtc_err(crtc, "failed to set gamma size: %d\n", ret);
+		goto err_put_resources;
+	}
+
+	drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
+
+	dpu_crtc->encoder->possible_crtcs = drm_crtc_mask(crtc);
+	crtc_grp->crtc_mask |= drm_crtc_mask(crtc);
+	crtc_cnt = hweight32(crtc_grp->crtc_mask);
+
+	/* initialize shared overlay planes for CRTCs in a CRTC group */
+	if (crtc_cnt == DPU_CRTC_CNT_IN_GRP) {
+		/*
+		 * All HW planes in a plane group are shared by CRTCs in a
+		 * CRTC group.  They will be assigned to either primary plane
+		 * or overlay plane dynamically in runtime.  Considering a
+		 * CRTC consumes all HW planes and primary plane takes one
+		 * HW plane, so overlay plane count for a CRTC group should
+		 * be plane_grp->hw_plane_cnt - 1.
+		 */
+		for (i = 1; i < plane_grp->hw_plane_cnt; i++) {
+			dpu_plane =
+				dpu_plane_initialize(drm, crtc_grp->crtc_mask,
+						     plane_grp,
+						     DRM_PLANE_TYPE_OVERLAY);
+			if (IS_ERR(dpu_plane)) {
+				ret = PTR_ERR(dpu_plane);
+				dpu_crtc_err(crtc,
+					     "failed to init overlay plane(%d): %d\n",
+					     i, ret);
+				goto err_put_resources;
+			}
+		}
+	}
+
+	ret = dpu_crtc_pm_runtime_get_sync(dpu_crtc);
+	if (ret < 0)
+		goto err_put_resources;
+
+	ret = dpu_crtc_request_irqs(dpu_crtc, pdata);
+	if (ret)
+		goto err_put_pm_runtime;
+
+	ret = dpu_crtc_pm_runtime_put(dpu_crtc);
+	if (ret < 0)
+		dpu_crtc_put_resources(dpu_crtc);
+
+	return ret;
+
+err_put_pm_runtime:
+	pm_runtime_put(dpu_crtc->dev->parent);
+err_put_resources:
+	dpu_crtc_put_resources(dpu_crtc);
+
+	return ret;
+}
+
+static int dpu_crtc_bind(struct device *dev, struct device *master, void *data)
+{
+	struct dpu_client_platformdata *pdata = dev->platform_data;
+	struct dpu_drm_device *dpu_drm = data;
+	struct dpu_crtc *dpu_crtc;
+	bool found = false;
+	int ret;
+
+	list_for_each_entry(dpu_crtc, &dpu_drm->crtc_list, node) {
+		if (dpu_crtc->np == dev->of_node) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		drm_err(&dpu_drm->base, "failed to find CRTC OF node\n");
+		return -ENODEV;
+	}
+
+	dpu_crtc->dev = dev;
+
+	ret = dpu_crtc_init(dpu_crtc, pdata, dpu_drm);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(dev, dpu_crtc);
+
+	return ret;
+}
+
+static void dpu_crtc_unbind(struct device *dev, struct device *master,
+			    void *data)
+{
+	struct dpu_crtc *dpu_crtc = dev_get_drvdata(dev);
+
+	dpu_crtc_put_resources(dpu_crtc);
+}
+
+static const struct component_ops dpu_crtc_ops = {
+	.bind = dpu_crtc_bind,
+	.unbind = dpu_crtc_unbind,
+};
+
+static int dpu_crtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	if (!dev->platform_data)
+		return -EINVAL;
+
+	return component_add(dev, &dpu_crtc_ops);
+}
+
+static int dpu_crtc_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dpu_crtc_ops);
+	return 0;
+}
+
+struct platform_driver dpu_crtc_driver = {
+	.driver = {
+		.name = "imx-dpu-crtc",
+	},
+	.probe = dpu_crtc_probe,
+	.remove = dpu_crtc_remove,
+};
diff --git a/drivers/gpu/drm/imx/dpu/dpu-crtc.h b/drivers/gpu/drm/imx/dpu/dpu-crtc.h
new file mode 100644
index 000000000000..4fb879d61f77
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-crtc.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#ifndef __DPU_CRTC_H__
+#define __DPU_CRTC_H__
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
+
+#include "dpu.h"
+
+#define dpu_crtc_dbg(crtc, fmt, ...)					\
+do {									\
+	typeof(crtc) _crtc = (crtc);					\
+	drm_dbg_kms(_crtc->dev, "[CRTC:%d:%s] " fmt,			\
+		    _crtc->base.id, _crtc->name, ##__VA_ARGS__);	\
+} while (0)
+
+#define dpu_crtc_err(crtc, fmt, ...)					\
+do {									\
+	typeof(crtc) _crtc = (crtc);					\
+	drm_err(_crtc->dev, "[CRTC:%d:%s] " fmt,			\
+		_crtc->base.id, _crtc->name, ##__VA_ARGS__);		\
+} while (0)
+
+#define DPU_CRTC_CNT_IN_GRP	2
+
+struct dpu_crtc {
+	struct device		*dev;
+	struct device_node	*np;
+	struct list_head	node;
+	struct drm_crtc		base;
+	struct dpu_crtc_grp	*grp;
+	struct drm_encoder	*encoder;
+	struct dpu_constframe	*cf_cont;
+	struct dpu_constframe	*cf_safe;
+	struct dpu_disengcfg	*dec;
+	struct dpu_extdst	*ed_cont;
+	struct dpu_extdst	*ed_safe;
+	struct dpu_framegen	*fg;
+	struct dpu_gammacor	*gc;
+	struct dpu_tcon		*tcon;
+	unsigned int		stream_id;
+	unsigned int		hw_plane_cnt;
+	unsigned int		dec_frame_complete_irq;
+	unsigned int		dec_seq_complete_irq;
+	unsigned int		dec_shdld_irq;
+	unsigned int		ed_cont_shdld_irq;
+	unsigned int		ed_safe_shdld_irq;
+	struct completion	dec_seq_complete_done;
+	struct completion	dec_shdld_done;
+	struct completion	ed_safe_shdld_done;
+	struct completion	ed_cont_shdld_done;
+	struct drm_pending_vblank_event *event;
+};
+
+static inline struct dpu_crtc *to_dpu_crtc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct dpu_crtc, base);
+}
+
+#endif /* __DPU_CRTC_H__ */
diff --git a/drivers/gpu/drm/imx/dpu/dpu-disengcfg.c b/drivers/gpu/drm/imx/dpu/dpu-disengcfg.c
new file mode 100644
index 000000000000..a2687f2f82e9
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-disengcfg.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020 NXP
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu-prv.h"
+
+#define POLARITYCTRL		0xc
+#define  POLHS_HIGH		BIT(0)
+#define  POLVS_HIGH		BIT(1)
+#define  POLEN_HIGH		BIT(2)
+#define  PIXINV_INV		BIT(3)
+
+#define SRCSELECT0		0x10
+#define  PATH_SELECT0		BIT(4)
+#define  MATRIX_FIRST		BIT(4)
+#define  GAMMA_FIRST		0
+#define  SIG_SELECT0		0x3
+#define  SIG_FRAMEGEN		0x0
+#define  SIG_GAMMACOR		0x1
+#define  SIG_MATRIX		0x2
+#define  SIG_DITHER		0x3
+
+struct dpu_disengcfg {
+	void __iomem *base;
+	struct mutex mutex;
+	unsigned int id;
+	unsigned int index;
+	bool inuse;
+	struct dpu_soc *dpu;
+};
+
+static inline void dpu_dec_write(struct dpu_disengcfg *dec,
+				 unsigned int offset, u32 value)
+{
+	writel(value, dec->base + offset);
+}
+
+struct dpu_disengcfg *dpu_dec_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_disengcfg *dec;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->dec_priv); i++) {
+		dec = dpu->dec_priv[i];
+		if (dec->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->dec_priv))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&dec->mutex);
+
+	if (dec->inuse) {
+		mutex_unlock(&dec->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	dec->inuse = true;
+
+	mutex_unlock(&dec->mutex);
+
+	return dec;
+}
+
+void dpu_dec_put(struct dpu_disengcfg *dec)
+{
+	if (IS_ERR_OR_NULL(dec))
+		return;
+
+	mutex_lock(&dec->mutex);
+
+	dec->inuse = false;
+
+	mutex_unlock(&dec->mutex);
+}
+
+void dpu_dec_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	struct dpu_disengcfg *dec = dpu->dec_priv[index];
+
+	dpu_dec_write(dec, POLARITYCTRL, POLEN_HIGH);
+	dpu_dec_write(dec, SRCSELECT0, GAMMA_FIRST | SIG_FRAMEGEN);
+}
+
+int dpu_dec_init(struct dpu_soc *dpu, unsigned int index,
+		 unsigned int id, enum dpu_unit_type type,
+		 unsigned long unused, unsigned long base)
+{
+	struct dpu_disengcfg *dec;
+
+	dec = devm_kzalloc(dpu->dev, sizeof(*dec), GFP_KERNEL);
+	if (!dec)
+		return -ENOMEM;
+
+	dpu->dec_priv[index] = dec;
+
+	dec->base = devm_ioremap(dpu->dev, base, SZ_32);
+	if (!dec->base)
+		return -ENOMEM;
+
+	dec->dpu = dpu;
+	dec->id = id;
+	dec->index = index;
+
+	mutex_init(&dec->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-dprc.c b/drivers/gpu/drm/imx/dpu/dpu-dprc.c
new file mode 100644
index 000000000000..d7883cbaece8
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-dprc.c
@@ -0,0 +1,723 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#include "dpu.h"
+#include "dpu-dprc.h"
+#include "dpu-prg.h"
+
+#define SET					0x4
+#define CLR					0x8
+#define TOG					0xc
+
+#define SYSTEM_CTRL0				0x00
+#define  BCMD2AXI_MASTR_ID_CTRL			BIT(16)
+#define  SW_SHADOW_LOAD_SEL			BIT(4)
+#define  SHADOW_LOAD_EN				BIT(3)
+#define  REPEAT_EN				BIT(2)
+#define  SOFT_RESET				BIT(1)
+#define  RUN_EN					BIT(0)	/* self-clearing */
+
+#define IRQ_MASK				0x20
+#define IRQ_MASK_STATUS				0x30
+#define IRQ_NONMASK_STATUS			0x40
+#define  DPR2RTR_FIFO_LOAD_BUF_RDY_UV_ERROR	BIT(7)
+#define  DPR2RTR_FIFO_LOAD_BUF_RDY_YRGB_ERROR	BIT(6)
+#define  DPR2RTR_UV_FIFO_OVFL			BIT(5)
+#define  DPR2RTR_YRGB_FIFO_OVFL			BIT(4)
+#define  IRQ_AXI_READ_ERROR			BIT(3)
+#define  IRQ_DPR_SHADOW_LOADED_MASK		BIT(2)
+#define  IRQ_DPR_RUN				BIT(1)
+#define  IRQ_DPR_CRTL_DONE			BIT(0)
+#define  IRQ_CTRL_MASK				0x7
+
+#define MODE_CTRL0				0x50
+#define  A_COMP_SEL(byte)			(((byte) & 0x3) << 16)
+#define  R_COMP_SEL(byte)			(((byte) & 0x3) << 14)
+#define  G_COMP_SEL(byte)			(((byte) & 0x3) << 12)
+#define  B_COMP_SEL(byte)			(((byte) & 0x3) << 10)
+#define  PIX_UV_SWAP				BIT(9)
+#define  PIX_LUMA_UV_SWAP			BIT(8)
+#define  PIX_SIZE_8BIT				(0 << 6)
+#define  PIX_SIZE_16BIT				(1 << 6)
+#define  PIX_SIZE_32BIT				(2 << 6)
+#define  COMP_2PLANE_EN				BIT(5)
+#define  YUV_EN					BIT(4)
+#define  LINEAR_TILE				(0 << 2)
+#define  GPU_STANDARD_TILE			(1 << 2)
+#define  GPU_SUPER_TILE				(2 << 2)
+#define  VPU_TILE				(3 << 2)
+#define  LINE4					BIT(1)
+#define  LINE8					0
+#define  BUF3					BIT(0)
+#define  BUF2					0
+
+#define FRAME_CTRL0				0x70
+#define  PITCH(n)				(((n) & 0xffff) << 16)
+#define  ROT_FIRST				BIT(4)
+#define  FLIP_FIRST				0
+#define  ROT_ENC_MASK				0xc
+#define  ROT_ENC_0				0x0
+#define  ROT_ENC_90				0x4
+#define  ROT_ENC_270				0xc
+#define  DEGREE(n)				((((n) / 90) & 0x3) << 2)
+#define  VFLIP_EN				BIT(1)
+#define  HFLIP_EN				BIT(0)
+
+#define FRAME_1P_CTRL0				0x90
+#define FRAME_2P_CTRL0				0xe0
+#define  BYTE_64				0x0
+#define  BYTE_128				0x1
+#define  BYTE_256				0x2
+#define  BYTE_512				0x3
+#define  BYTE_1K				0x4
+#define  BYTE_2K				0x5
+#define  BYTE_4K				0x6
+
+#define FRAME_1P_PIX_X_CTRL			0xa0
+#define  NUM_X_PIX_WIDE(n)			((n) & 0xffff)
+
+#define FRAME_1P_PIX_Y_CTRL			0xb0
+#define  NUM_Y_PIX_HIGH(n)			((n) & 0xffff)
+
+#define FRAME_1P_BASE_ADDR_CTRL0		0xc0
+
+#define FRAME_PIX_X_ULC_CTRL			0xf0
+#define  CROP_ULC_X(n)				((n) & 0xffff)
+
+#define FRAME_PIX_Y_ULC_CTRL			0x100
+#define  CROP_ULC_Y(n)				((n) & 0xffff)
+
+#define FRAME_2P_BASE_ADDR_CTRL0		0x110
+
+#define STATUS_CTRL0				0x130
+#define STATUS_CTRL1				0x140
+
+#define RTRAM_CTRL0				0x200
+#define  ABORT					BIT(7)
+#define  STALL					0
+#define  THRES_LOW(n)				(((n) & 0x7) << 4)
+#define  THRES_HIGH(n)				(((n) & 0x7) << 1)
+#define  ROWS_0_6				BIT(0)
+#define  ROWS_0_4				0
+
+#define DPU_DRPC_MAX_STRIDE			0x10000
+#define DPU_DPRC_MAX_RTRAM_WIDTH		2880
+
+struct dpu_dprc {
+	struct device *dev;
+	void __iomem *base;
+	struct list_head list;
+	struct clk *clk_apb;
+	struct clk *clk_b;
+	struct clk *clk_rtram;
+	struct imx_sc_ipc *ipc_handle;
+	spinlock_t spin_lock;
+	u32 sc_resource;
+	bool is_blit;
+
+	/* The second one, if non-NULL, is auxiliary for UV buffer. */
+	struct dpu_prg *prgs[2];
+	bool has_aux_prg;
+	bool use_aux_prg;
+};
+
+static DEFINE_MUTEX(dpu_dprc_list_mutex);
+static LIST_HEAD(dpu_dprc_list);
+
+static inline u32 dpu_dprc_read(struct dpu_dprc *dprc, unsigned int offset)
+{
+	return readl(dprc->base + offset);
+}
+
+static inline void
+dpu_dprc_write(struct dpu_dprc *dprc, unsigned int offset, u32 value)
+{
+	writel(value, dprc->base + offset);
+}
+
+static inline void
+dpu_dprc_set_stream_id(struct dpu_dprc *dprc, unsigned int stream_id)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(dprc->ipc_handle, dprc->sc_resource,
+				      IMX_SC_C_KACHUNK_SEL, stream_id);
+	if (ret)
+		dev_warn(dprc->dev, "failed to set KACHUNK_SEL: %d\n", ret);
+}
+
+static inline void
+dpu_dprc_set_prg_sel(struct dpu_dprc *dprc, u32 resource, bool enable)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(dprc->ipc_handle,
+				      resource, IMX_SC_C_SEL0, enable);
+	if (ret)
+		dev_warn(dprc->dev, "failed to set SEL0: %d\n", ret);
+}
+
+static void dpu_dprc_reset(struct dpu_dprc *dprc)
+{
+	dpu_dprc_write(dprc, SYSTEM_CTRL0 + SET, SOFT_RESET);
+	usleep_range(10, 20);
+	dpu_dprc_write(dprc, SYSTEM_CTRL0 + CLR, SOFT_RESET);
+}
+
+static void dpu_dprc_enable(struct dpu_dprc *dprc)
+{
+	dpu_prg_enable(dprc->prgs[0]);
+	if (dprc->use_aux_prg)
+		dpu_prg_enable(dprc->prgs[1]);
+}
+
+static void dpu_dprc_reg_update(struct dpu_dprc *dprc)
+{
+	dpu_prg_reg_update(dprc->prgs[0]);
+	if (dprc->use_aux_prg)
+		dpu_prg_reg_update(dprc->prgs[1]);
+}
+
+static void dpu_dprc_enable_ctrl_done_irq(struct dpu_dprc *dprc)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&dprc->spin_lock, flags);
+	dpu_dprc_write(dprc, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
+	spin_unlock_irqrestore(&dprc->spin_lock, flags);
+}
+
+void dpu_dprc_configure(struct dpu_dprc *dprc, unsigned int stream_id,
+			unsigned int width, unsigned int height,
+			unsigned int x_offset, unsigned int y_offset,
+			unsigned int stride,
+			const struct drm_format_info *format, u64 modifier,
+			dma_addr_t baddr, dma_addr_t uv_baddr,
+			bool start, bool interlace_frame)
+{
+	struct device *dev = dprc->dev;
+	unsigned int dprc_width = width + x_offset;
+	unsigned int dprc_height;
+	unsigned int p1_w, p1_h;
+	unsigned int prg_stride = width * format->cpp[0];
+	unsigned int bpp = 8 * format->cpp[0];
+	unsigned int preq;
+	unsigned int mt_w = 0, mt_h = 0;	/* micro-tile width/height */
+	u32 val;
+
+	dprc->use_aux_prg = false;
+
+	if (start && !dprc->is_blit)
+		dpu_dprc_set_stream_id(dprc, stream_id);
+
+	if (interlace_frame) {
+		height /= 2;
+		y_offset /= 2;
+	}
+
+	dprc_height = height + y_offset;
+
+	if (format->num_planes > 1) {
+		p1_w = round_up(dprc_width, modifier ? 8 : 64);
+		p1_h = round_up(dprc_height, 8);
+
+		preq = modifier ? BYTE_64 : BYTE_1K;
+
+		dpu_dprc_write(dprc, FRAME_2P_CTRL0, preq);
+		if (dprc->sc_resource == IMX_SC_R_DC_0_BLIT1 ||
+		    dprc->sc_resource == IMX_SC_R_DC_1_BLIT1) {
+			dpu_dprc_set_prg_sel(dprc,
+				dprc->sc_resource == IMX_SC_R_DC_0_BLIT1 ?
+				IMX_SC_R_DC_0_BLIT0 : IMX_SC_R_DC_1_BLIT0,
+				true);
+			dpu_prg_set_auxiliary(dprc->prgs[1]);
+			dprc->has_aux_prg = true;
+		}
+		dpu_dprc_write(dprc, FRAME_2P_BASE_ADDR_CTRL0, uv_baddr);
+	} else {
+		switch (dprc->sc_resource) {
+		case IMX_SC_R_DC_0_BLIT0:
+		case IMX_SC_R_DC_1_BLIT0:
+			dpu_dprc_set_prg_sel(dprc, dprc->sc_resource, false);
+			dpu_prg_set_primary(dprc->prgs[0]);
+			break;
+		case IMX_SC_R_DC_0_BLIT1:
+		case IMX_SC_R_DC_1_BLIT1:
+			dprc->has_aux_prg = false;
+			break;
+		default:
+			break;
+		}
+
+		switch (modifier) {
+		case DRM_FORMAT_MOD_VIVANTE_TILED:
+			p1_w = round_up(dprc_width,
+					format->cpp[0] == 2 ? 8 : 4);
+			break;
+		case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
+			if (dprc->is_blit)
+				p1_w = round_up(dprc_width,
+						format->cpp[0] == 2 ? 8 : 4);
+			else
+				p1_w = round_up(dprc_width, 64);
+			break;
+		default:
+			p1_w = round_up(dprc_width,
+					format->cpp[0] == 2 ? 32 : 16);
+			break;
+		}
+		p1_h = round_up(dprc_height, 4);
+	}
+
+	dpu_dprc_write(dprc, FRAME_CTRL0, PITCH(stride));
+
+	switch (modifier) {
+	case DRM_FORMAT_MOD_VIVANTE_TILED:
+		preq = BYTE_256;
+		mt_w = bpp == 16 ? 8 : 4;
+		mt_h = 4;
+		break;
+	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
+		if (bpp == 16) {
+			preq = BYTE_64;
+			mt_w = 8;
+		} else {
+			preq = BYTE_128;
+			mt_w = 4;
+		}
+		mt_h = 4;
+		break;
+	default:
+		preq = BYTE_1K;
+		break;
+	}
+	dpu_dprc_write(dprc, FRAME_1P_CTRL0, preq);
+	dpu_dprc_write(dprc, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
+	dpu_dprc_write(dprc, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
+	dpu_dprc_write(dprc, FRAME_1P_BASE_ADDR_CTRL0, baddr);
+	if (modifier) {
+		dpu_dprc_write(dprc, FRAME_PIX_X_ULC_CTRL,
+			       CROP_ULC_X(round_down(x_offset, mt_w)));
+		dpu_dprc_write(dprc, FRAME_PIX_Y_ULC_CTRL,
+			       CROP_ULC_Y(round_down(y_offset, mt_h)));
+	} else {
+		dpu_dprc_write(dprc, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
+		dpu_dprc_write(dprc, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
+	}
+
+	dpu_dprc_write(dprc, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));
+
+	switch (modifier) {
+	case DRM_FORMAT_MOD_NONE:
+		val = 0;
+		break;
+	case DRM_FORMAT_MOD_VIVANTE_TILED:
+		val = GPU_STANDARD_TILE;
+		break;
+	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
+		val = GPU_SUPER_TILE;
+		break;
+	default:
+		dev_err(dev, "unsupported modifier 0x%016llx\n", modifier);
+		return;
+	}
+	val |= format->num_planes > 1 ? LINE8 : LINE4;
+	val |= BUF2;
+	switch (format->format) {
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRX8888:
+		/*
+		 * It turns out pixel components are mapped directly
+		 * without position change via DPR processing with
+		 * the following color component configurations.
+		 * Leave the pixel format to be handled by the
+		 * display controllers.
+		 */
+		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
+		       G_COMP_SEL(1) | B_COMP_SEL(0);
+		val |= PIX_SIZE_32BIT;
+		break;
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_UYVY:
+		val |= YUV_EN;
+		fallthrough;
+	case DRM_FORMAT_RGB565:
+		val |= PIX_SIZE_16BIT;
+		break;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		dprc->use_aux_prg = true;
+
+		val |= COMP_2PLANE_EN;
+		val |= YUV_EN;
+		val |= PIX_SIZE_8BIT;
+		break;
+	default:
+		dev_err(dev, "unsupported format 0x%08x\n", format->format);
+		return;
+	}
+	dpu_dprc_write(dprc, MODE_CTRL0, val);
+
+	if (dprc->is_blit) {
+		val = SW_SHADOW_LOAD_SEL | RUN_EN | SHADOW_LOAD_EN;
+		dpu_dprc_write(dprc, SYSTEM_CTRL0, val);
+	} else if (start) {
+		/* software shadow load for the first frame */
+		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
+		dpu_dprc_write(dprc, SYSTEM_CTRL0, val);
+
+		/* and then, run... */
+		val |= RUN_EN | REPEAT_EN;
+		dpu_dprc_write(dprc, SYSTEM_CTRL0, val);
+	}
+
+	dpu_prg_configure(dprc->prgs[0], width, height, x_offset, y_offset,
+			  prg_stride, bpp, baddr, format, modifier, start);
+	if (dprc->use_aux_prg)
+		dpu_prg_configure(dprc->prgs[1], width, height,
+				  x_offset, y_offset,
+				  prg_stride, 8, uv_baddr, format, modifier,
+				  start);
+
+	dpu_dprc_enable(dprc);
+
+	dpu_dprc_reg_update(dprc);
+
+	if (!dprc->is_blit && start)
+		dpu_dprc_enable_ctrl_done_irq(dprc);
+
+	dev_dbg(dev, "w-%u, h-%u, s-%u, fmt-0x%08x, mod-0x%016llx\n",
+		width, height, stride, format->format, modifier);
+}
+
+void dpu_dprc_disable_repeat_en(struct dpu_dprc *dprc)
+{
+	dpu_dprc_write(dprc, SYSTEM_CTRL0 + CLR, REPEAT_EN);
+
+	dev_dbg(dprc->dev, "disable repeat_en\n");
+}
+
+static void dpu_dprc_ctrl_done_handle(struct dpu_dprc *dprc)
+{
+	if (dprc->is_blit)
+		return;
+
+	dpu_dprc_write(dprc, SYSTEM_CTRL0, REPEAT_EN);
+
+	dpu_prg_shadow_enable(dprc->prgs[0]);
+	if (dprc->use_aux_prg)
+		dpu_prg_shadow_enable(dprc->prgs[1]);
+
+	dev_dbg(dprc->dev, "ctrl done handle\n");
+}
+
+static irqreturn_t dpu_dprc_wrap_irq_handler(int irq, void *data)
+{
+	struct dpu_dprc *dprc = data;
+	struct device *dev = dprc->dev;
+	u32 mask, status;
+
+	spin_lock(&dprc->spin_lock);
+
+	/* cache valid irq status */
+	mask = dpu_dprc_read(dprc, IRQ_MASK);
+	mask = ~mask;
+	status = dpu_dprc_read(dprc, IRQ_MASK_STATUS);
+	status &= mask;
+
+	/* mask the irqs being handled */
+	dpu_dprc_write(dprc, IRQ_MASK + SET, status);
+
+	/* clear status register */
+	dpu_dprc_write(dprc, IRQ_MASK_STATUS, status);
+
+	if (status & DPR2RTR_FIFO_LOAD_BUF_RDY_UV_ERROR)
+		dev_err(dev, "DPR to RTRAM FIFO load UV buffer ready error\n");
+
+	if (status & DPR2RTR_FIFO_LOAD_BUF_RDY_YRGB_ERROR)
+		dev_err(dev, "DPR to RTRAM FIFO load YRGB buffer ready error\n");
+
+	if (status & DPR2RTR_UV_FIFO_OVFL)
+		dev_err(dev, "DPR to RTRAM FIFO UV FIFO overflow\n");
+
+	if (status & DPR2RTR_YRGB_FIFO_OVFL)
+		dev_err(dev, "DPR to RTRAM FIFO YRGB FIFO overflow\n");
+
+	if (status & IRQ_AXI_READ_ERROR)
+		dev_err(dev, "AXI read error\n");
+
+	if (status & IRQ_DPR_CRTL_DONE)
+		dpu_dprc_ctrl_done_handle(dprc);
+
+	spin_unlock(&dprc->spin_lock);
+
+	return IRQ_HANDLED;
+}
+
+bool dpu_dprc_rtram_width_supported(struct dpu_dprc *dprc, unsigned int width)
+{
+	return width <= DPU_DPRC_MAX_RTRAM_WIDTH;
+}
+
+bool dpu_dprc_stride_supported(struct dpu_dprc *dprc,
+			       unsigned int stride, unsigned int uv_stride,
+			       unsigned int width, unsigned int x_offset,
+			       const struct drm_format_info *format,
+			       u64 modifier,
+			       dma_addr_t baddr, dma_addr_t uv_baddr)
+{
+	unsigned int prg_stride = width * format->cpp[0];
+	unsigned int bpp = 8 * format->cpp[0];
+
+	if (stride > DPU_DRPC_MAX_STRIDE)
+		return false;
+
+	if (format->num_planes > 1 && stride != uv_stride)
+		return false;
+
+	if (!dpu_prg_stride_supported(dprc->prgs[0], x_offset, bpp,
+				      modifier, prg_stride, baddr))
+		return false;
+
+	if (format->num_planes > 1 &&
+	    !dpu_prg_stride_supported(dprc->prgs[1], x_offset, bpp,
+				      modifier, prg_stride, uv_baddr))
+		return false;
+
+	return true;
+}
+
+struct dpu_dprc *
+dpu_dprc_lookup_by_of_node(struct device *dev, struct device_node *dprc_node)
+{
+	struct dpu_dprc *dprc;
+
+	mutex_lock(&dpu_dprc_list_mutex);
+	list_for_each_entry(dprc, &dpu_dprc_list, list) {
+		if (dprc_node == dprc->dev->of_node) {
+			mutex_unlock(&dpu_dprc_list_mutex);
+			device_link_add(dev, dprc->dev,
+					DL_FLAG_PM_RUNTIME |
+					DL_FLAG_AUTOREMOVE_CONSUMER);
+			return dprc;
+		}
+	}
+	mutex_unlock(&dpu_dprc_list_mutex);
+
+	return NULL;
+}
+
+static const struct of_device_id dpu_dprc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-dpr-channel", },
+	{ .compatible = "fsl,imx8qxp-dpr-channel", },
+	{ /* sentinel */ },
+};
+
+static int dpu_dprc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct resource *res;
+	struct dpu_dprc *dprc;
+	int ret, wrap_irq, i;
+
+	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
+	if (!dprc)
+		return -ENOMEM;
+
+	ret = imx_scu_get_handle(&dprc->ipc_handle);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
+		return ret;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	dprc->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(dprc->base))
+		return PTR_ERR(dprc->base);
+
+	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
+	if (wrap_irq < 0)
+		return -ENODEV;
+
+	dprc->clk_apb = devm_clk_get(dev, "apb");
+	if (IS_ERR(dprc->clk_apb)) {
+		ret = PTR_ERR(dprc->clk_apb);
+		dev_err_probe(dev, ret, "failed to get apb clock\n");
+		return ret;
+	}
+
+	dprc->clk_b = devm_clk_get(dev, "b");
+	if (IS_ERR(dprc->clk_b)) {
+		ret = PTR_ERR(dprc->clk_b);
+		dev_err_probe(dev, ret, "failed to get b clock\n");
+		return ret;
+	}
+
+	dprc->clk_rtram = devm_clk_get(dev, "rtram");
+	if (IS_ERR(dprc->clk_rtram)) {
+		ret = PTR_ERR(dprc->clk_rtram);
+		dev_err_probe(dev, ret, "failed to get rtram clock\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
+	if (ret) {
+		dev_err(dev, "cannot get SC resource %d\n", ret);
+		return ret;
+	}
+
+	switch (dprc->sc_resource) {
+	case IMX_SC_R_DC_0_BLIT1:
+	case IMX_SC_R_DC_1_BLIT1:
+		dprc->has_aux_prg = true;
+		fallthrough;
+	case IMX_SC_R_DC_0_BLIT0:
+	case IMX_SC_R_DC_1_BLIT0:
+		dprc->is_blit = true;
+		fallthrough;
+	case IMX_SC_R_DC_0_FRAC0:
+	case IMX_SC_R_DC_1_FRAC0:
+		break;
+	case IMX_SC_R_DC_0_VIDEO0:
+	case IMX_SC_R_DC_0_VIDEO1:
+	case IMX_SC_R_DC_1_VIDEO0:
+	case IMX_SC_R_DC_1_VIDEO1:
+	case IMX_SC_R_DC_0_WARP:
+	case IMX_SC_R_DC_1_WARP:
+		dprc->has_aux_prg = true;
+		break;
+	default:
+		dev_err(dev, "wrong SC resource %u\n", dprc->sc_resource);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < 2; i++) {
+		if (i == 1 && !dprc->has_aux_prg)
+			break;
+
+		dprc->prgs[i] = dpu_prg_lookup_by_phandle(dev, "fsl,prgs", i);
+		if (!dprc->prgs[i])
+			return -EPROBE_DEFER;
+
+		if (i == 1)
+			dpu_prg_set_auxiliary(dprc->prgs[i]);
+	}
+
+	dprc->dev = dev;
+	spin_lock_init(&dprc->spin_lock);
+
+	ret = devm_request_irq(dev, wrap_irq, dpu_dprc_wrap_irq_handler,
+			       IRQF_SHARED, dev_name(dev), dprc);
+	if (ret < 0) {
+		dev_err(dev, "failed to request dpr_wrap irq(%u): %d\n",
+			wrap_irq, ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, dprc);
+
+	pm_runtime_enable(dev);
+
+	mutex_lock(&dpu_dprc_list_mutex);
+	list_add(&dprc->list, &dpu_dprc_list);
+	mutex_unlock(&dpu_dprc_list_mutex);
+
+	return 0;
+}
+
+static int dpu_dprc_remove(struct platform_device *pdev)
+{
+	struct dpu_dprc *dprc = platform_get_drvdata(pdev);
+
+	mutex_lock(&dpu_dprc_list_mutex);
+	list_del(&dprc->list);
+	mutex_unlock(&dpu_dprc_list_mutex);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused dpu_dprc_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dpu_dprc *dprc = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(dprc->clk_rtram);
+	clk_disable_unprepare(dprc->clk_b);
+	clk_disable_unprepare(dprc->clk_apb);
+
+	return 0;
+}
+
+static int __maybe_unused dpu_dprc_runtime_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dpu_dprc *dprc = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(dprc->clk_apb);
+	if (ret) {
+		dev_err(dev, "failed to enable apb clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(dprc->clk_b);
+	if (ret) {
+		dev_err(dev, "failed to enable b clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(dprc->clk_rtram);
+	if (ret) {
+		dev_err(dev, "failed to enable rtram clock: %d\n", ret);
+		return ret;
+	}
+
+	dpu_dprc_reset(dprc);
+
+	/* disable all control irqs and enable all error irqs */
+	spin_lock(&dprc->spin_lock);
+	dpu_dprc_write(dprc, IRQ_MASK, IRQ_CTRL_MASK);
+	spin_unlock(&dprc->spin_lock);
+
+	return ret;
+}
+
+static const struct dev_pm_ops dpu_dprc_pm_ops = {
+	SET_RUNTIME_PM_OPS(dpu_dprc_runtime_suspend,
+			   dpu_dprc_runtime_resume, NULL)
+};
+
+struct platform_driver dpu_dprc_driver = {
+	.probe = dpu_dprc_probe,
+	.remove = dpu_dprc_remove,
+	.driver = {
+		.pm = &dpu_dprc_pm_ops,
+		.name = "dpu-dpr-channel",
+		.of_match_table = dpu_dprc_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dpu/dpu-dprc.h b/drivers/gpu/drm/imx/dpu/dpu-dprc.h
new file mode 100644
index 000000000000..96a5978eb62a
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-dprc.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright 2017-2020 NXP
+ */
+
+#ifndef _DPU_DPRC_H_
+#define _DPU_DPRC_H_
+
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/types.h>
+
+#include <drm/drm_fourcc.h>
+
+struct dpu_dprc;
+
+void dpu_dprc_configure(struct dpu_dprc *dprc, unsigned int stream_id,
+			unsigned int width, unsigned int height,
+			unsigned int x_offset, unsigned int y_offset,
+			unsigned int stride,
+			const struct drm_format_info *format, u64 modifier,
+			dma_addr_t baddr, dma_addr_t uv_baddr,
+			bool start, bool interlace_frame);
+
+void dpu_dprc_disable_repeat_en(struct dpu_dprc *dprc);
+
+bool dpu_dprc_rtram_width_supported(struct dpu_dprc *dprc, unsigned int width);
+
+bool dpu_dprc_stride_supported(struct dpu_dprc *dprc,
+			       unsigned int stride, unsigned int uv_stride,
+			       unsigned int width, unsigned int x_offset,
+			       const struct drm_format_info *format,
+			       u64 modifier,
+			       dma_addr_t baddr, dma_addr_t uv_baddr);
+
+struct dpu_dprc *
+dpu_dprc_lookup_by_of_node(struct device *dev, struct device_node *dprc_node);
+
+#endif
diff --git a/drivers/gpu/drm/imx/dpu/dpu-drv.c b/drivers/gpu/drm/imx/dpu/dpu-drv.c
new file mode 100644
index 000000000000..6984b15f5b72
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-drv.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2019,2020,2022 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/dma-mapping.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_modeset_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#include "dpu-drv.h"
+#include "dpu-kms.h"
+
+#define DRIVER_NAME	"imx-dpu-drm"
+
+static int legacyfb_depth = 32;
+module_param(legacyfb_depth, uint, 0444);
+
+struct dpu_drm_drv_data {
+	struct list_head crtc_np_list;
+};
+
+DEFINE_DRM_GEM_CMA_FOPS(dpu_drm_driver_fops);
+
+static struct drm_driver dpu_drm_driver = {
+	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
+					  DRIVER_ATOMIC,
+	DRM_GEM_CMA_DRIVER_OPS,
+	.fops				= &dpu_drm_driver_fops,
+	.name				= "imx-dpu",
+	.desc				= "i.MX DPU DRM graphics",
+	.date				= "20200805",
+	.major				= 1,
+	.minor				= 0,
+	.patchlevel			= 0,
+};
+
+static int dpu_drm_bind(struct device *dev)
+{
+	struct dpu_drm_device *dpu_drm;
+	struct drm_device *drm;
+	struct dpu_drm_drv_data *drv_data = dev_get_drvdata(dev);
+	int ret;
+
+	dpu_drm = devm_drm_dev_alloc(dev, &dpu_drm_driver,
+				     struct dpu_drm_device, base);
+	if (IS_ERR(dpu_drm)) {
+		ret = PTR_ERR(dpu_drm);
+		DRM_DEV_ERROR(dev, "failed to alloc drm device: %d\n", ret);
+		return ret;
+	}
+
+	drm = &dpu_drm->base;
+
+	drm->irq_enabled = true;
+
+	ret = dpu_kms_prepare(dpu_drm, &drv_data->crtc_np_list);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to prepare kms: %d\n", ret);
+		return ret;
+	}
+
+	ret = component_bind_all(dev, dpu_drm);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "failed to bind all components: %d\n",
+									ret);
+		return ret;
+	}
+
+	drm_mode_config_reset(drm);
+
+	drm_kms_helper_poll_init(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to register drm device: %d\n", ret);
+		goto out_register;
+	}
+
+	if (legacyfb_depth != 16 && legacyfb_depth != 32) {
+		DRM_DEV_INFO(dev,
+			     "Invalid legacyfb_depth.  Defaulting to 32bpp\n");
+		legacyfb_depth = 32;
+	}
+
+	drm_fbdev_generic_setup(drm, legacyfb_depth);
+
+	return ret;
+
+out_register:
+	drm_kms_helper_poll_fini(drm);
+	component_unbind_all(dev, NULL);
+
+	return ret;
+}
+
+static void dpu_drm_unbind(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+
+	drm_dev_unregister(drm);
+
+	drm_kms_helper_poll_fini(drm);
+
+	drm_atomic_helper_shutdown(drm);
+
+	component_unbind_all(drm->dev, NULL);
+}
+
+static const struct component_master_ops dpu_drm_ops = {
+	.bind = dpu_drm_bind,
+	.unbind = dpu_drm_unbind,
+};
+
+static int compare_of(struct device *dev, void *data)
+{
+	struct device_node *np = data;
+
+	return dev->of_node == np;
+}
+
+static int dpu_drm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct component_match *match = NULL;
+	struct device_node *np, *ports, *port;
+	struct dpu_drm_drv_data *drv_data;
+	struct dpu_crtc_of_node *crtc_of_node;
+
+	drv_data = devm_kzalloc(dev, sizeof(*drv_data), GFP_KERNEL);
+	if (!drv_data) {
+		DRM_DEV_ERROR(dev, "failed to alloc driver data\n");
+		return -ENOMEM;
+	}
+
+	INIT_LIST_HEAD(&drv_data->crtc_np_list);
+
+	for_each_matching_node(np, dpu_dt_ids) {
+		if (!of_device_is_available(np))
+			continue;
+
+		ports = of_get_child_by_name(np, "ports");
+		if (!ports)
+			ports = np;
+
+		for_each_child_of_node(ports, port) {
+			drm_of_component_match_add(dev, &match, compare_of,
+						   port);
+
+			crtc_of_node = devm_kzalloc(dev, sizeof(*crtc_of_node),
+						    GFP_KERNEL);
+			if (!crtc_of_node) {
+				DRM_DEV_ERROR(dev,
+					      "failed to alloc crtc_of_node\n");
+				of_node_put(ports);
+				return -ENOMEM;
+			}
+
+			crtc_of_node->np = port;
+
+			list_add(&crtc_of_node->list, &drv_data->crtc_np_list);
+		}
+
+		of_node_put(ports);
+	}
+
+	if (!match) {
+		DRM_DEV_ERROR(dev, "no available DPU display output port\n");
+		return -ENODEV;
+	}
+
+	dev_set_drvdata(dev, drv_data);
+
+	return component_master_add_with_match(dev, &dpu_drm_ops, match);
+}
+
+static int dpu_drm_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &dpu_drm_ops);
+
+	return 0;
+}
+
+static int __maybe_unused dpu_drm_suspend(struct device *dev)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_suspend(drm_dev);
+}
+
+static int __maybe_unused dpu_drm_resume(struct device *dev)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_resume(drm_dev);
+}
+
+static SIMPLE_DEV_PM_OPS(dpu_drm_pm_ops, dpu_drm_suspend, dpu_drm_resume);
+
+static struct platform_driver dpu_drm_platform_driver = {
+	.probe = dpu_drm_probe,
+	.remove = dpu_drm_remove,
+	.driver = {
+		.name = DRIVER_NAME,
+		.pm = &dpu_drm_pm_ops,
+	},
+};
+
+static struct platform_device *dpu_drm_platform_dev;
+
+static struct platform_driver * const drivers[] = {
+	&dpu_prg_driver,
+	&dpu_dprc_driver,
+	&dpu_core_driver,
+	&dpu_crtc_driver,
+	&dpu_drm_platform_driver,
+};
+
+static int __init dpu_init(void)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+	int ret;
+
+	ret = platform_register_drivers(drivers, ARRAY_SIZE(drivers));
+	if (ret)
+		return ret;
+
+	/*
+	 * If the DT contains at least one available DPU device, instantiate
+	 * the DRM platform device.
+	 */
+	for_each_matching_node(np, dpu_dt_ids) {
+		if (!of_device_is_available(np))
+			continue;
+
+		pdev = platform_device_alloc(DRIVER_NAME, -1);
+		if (!pdev) {
+			ret = -ENOMEM;
+			goto unregister_drivers;
+		}
+
+		ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+		if (ret)
+			goto unregister_drivers;
+
+		ret = platform_device_add(pdev);
+		if (ret) {
+			platform_device_put(pdev);
+			goto unregister_drivers;
+		}
+
+		dpu_drm_platform_dev = pdev;
+		of_node_put(np);
+		break;
+	}
+
+	return ret;
+
+unregister_drivers:
+	of_node_put(np);
+	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
+	return ret;
+}
+module_init(dpu_init);
+
+static void __exit dpu_exit(void)
+{
+	platform_device_unregister(dpu_drm_platform_dev);
+	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
+}
+module_exit(dpu_exit);
+
+MODULE_DESCRIPTION("i.MX DPU DRM Driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_ALIAS("platform:" DRIVER_NAME);
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/imx/dpu/dpu-drv.h b/drivers/gpu/drm/imx/dpu/dpu-drv.h
new file mode 100644
index 000000000000..df56bfc2864a
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-drv.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright 2020 NXP
+ */
+
+#ifndef __DPU_DRV_H__
+#define __DPU_DRV_H__
+
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include <drm/drm_device.h>
+
+struct dpu_drm_device {
+	struct drm_device base;
+	struct list_head crtc_list;
+};
+
+extern const struct of_device_id dpu_dt_ids[];
+
+extern struct platform_driver dpu_prg_driver;
+extern struct platform_driver dpu_dprc_driver;
+extern struct platform_driver dpu_core_driver;
+extern struct platform_driver dpu_crtc_driver;
+
+#endif /* __DPU_DRV_H__ */
diff --git a/drivers/gpu/drm/imx/dpu/dpu-extdst.c b/drivers/gpu/drm/imx/dpu/dpu-extdst.c
new file mode 100644
index 000000000000..687f3bfc3a22
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-extdst.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu.h"
+#include "dpu-prv.h"
+
+#define PIXENGCFG_STATIC	0x8
+#define  POWERDOWN		BIT(4)
+#define  SYNC_MODE		BIT(8)
+#define  AUTO			BIT(8)
+#define  SINGLE			0
+#define  DIV_MASK		0xff0000
+#define  DIV(n)			(((n) & 0xff) << 16)
+#define  DIV_RESET		0x80
+
+#define PIXENGCFG_DYNAMIC	0xc
+
+#define PIXENGCFG_REQUEST	0x10
+
+#define PIXENGCFG_TRIGGER	0x14
+#define  SYNC_TRIGGER		BIT(0)
+
+#define STATICCONTROL		0x8
+#define  KICK_MODE		BIT(8)
+#define  EXTERNAL		BIT(8)
+#define  SOFTWARE		0
+#define  PERFCOUNTMODE		BIT(12)
+
+#define CONTROL			0xc
+#define  GAMMAAPPLYENABLE	BIT(0)
+
+#define SOFTWAREKICK		0x10
+#define  KICK			BIT(0)
+
+#define STATUS			0x14
+#define  CNT_ERR_STS		BIT(0)
+
+#define CONTROLWORD		0x18
+#define CURPIXELCNT		0x1c
+#define LASTPIXELCNT		0x20
+#define PERFCOUNTER		0x24
+
+struct dpu_extdst {
+	void __iomem *pec_base;
+	void __iomem *base;
+	struct mutex mutex;
+	unsigned int id;
+	unsigned int index;
+	bool inuse;
+	struct dpu_soc *dpu;
+};
+
+static const enum dpu_link_id src_sels[] = {
+	LINK_ID_NONE,
+	LINK_ID_BLITBLEND9,
+	LINK_ID_CONSTFRAME0,
+	LINK_ID_CONSTFRAME1,
+	LINK_ID_CONSTFRAME4,
+	LINK_ID_CONSTFRAME5,
+	LINK_ID_MATRIX4,
+	LINK_ID_HSCALER4,
+	LINK_ID_VSCALER4,
+	LINK_ID_MATRIX5,
+	LINK_ID_HSCALER5,
+	LINK_ID_VSCALER5,
+	LINK_ID_LAYERBLEND3,
+	LINK_ID_LAYERBLEND2,
+	LINK_ID_LAYERBLEND1,
+	LINK_ID_LAYERBLEND0,
+};
+
+static inline u32 dpu_pec_ed_read(struct dpu_extdst *ed, unsigned int offset)
+{
+	return readl(ed->pec_base + offset);
+}
+
+static inline void dpu_pec_ed_write(struct dpu_extdst *ed,
+				    unsigned int offset, u32 value)
+{
+	writel(value, ed->pec_base + offset);
+}
+
+static inline void dpu_pec_ed_write_mask(struct dpu_extdst *ed,
+					 unsigned int offset,
+					 u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_pec_ed_read(ed, offset);
+	tmp &= ~mask;
+	dpu_pec_ed_write(ed, offset, tmp | value);
+}
+
+static inline u32 dpu_ed_read(struct dpu_extdst *ed, unsigned int offset)
+{
+	return readl(ed->base + offset);
+}
+
+static inline void dpu_ed_write(struct dpu_extdst *ed,
+				unsigned int offset, u32 value)
+{
+	writel(value, ed->base + offset);
+}
+
+static inline void dpu_ed_write_mask(struct dpu_extdst *ed, unsigned int offset,
+				     u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_ed_read(ed, offset);
+	tmp &= ~mask;
+	dpu_ed_write(ed, offset, tmp | value);
+}
+
+static inline bool dpu_ed_is_safety_stream(struct dpu_extdst *ed)
+{
+	if (ed->id == DPU_SAFETY_STREAM_OFFSET ||
+	    (ed->id == DPU_SAFETY_STREAM_OFFSET + 1))
+		return true;
+
+	return false;
+}
+
+static void dpu_ed_pec_enable_shden(struct dpu_extdst *ed)
+{
+	dpu_pec_ed_write_mask(ed, PIXENGCFG_STATIC, SHDEN, SHDEN);
+}
+
+void dpu_ed_pec_poweron(struct dpu_extdst *ed)
+{
+	dpu_pec_ed_write_mask(ed, PIXENGCFG_STATIC, POWERDOWN, 0);
+}
+
+static void dpu_ed_pec_sync_mode_single(struct dpu_extdst *ed)
+{
+	dpu_pec_ed_write_mask(ed, PIXENGCFG_STATIC, SYNC_MODE, SINGLE);
+}
+
+static void dpu_ed_pec_div_reset(struct dpu_extdst *ed)
+{
+	dpu_pec_ed_write_mask(ed, PIXENGCFG_STATIC, DIV_MASK, DIV(DIV_RESET));
+}
+
+void dpu_ed_pec_src_sel(struct dpu_extdst *ed, enum dpu_link_id src)
+{
+	struct dpu_soc *dpu = ed->dpu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(src_sels); i++) {
+		if (src_sels[i] == src) {
+			dpu_pec_ed_write(ed, PIXENGCFG_DYNAMIC, src);
+			return;
+		}
+	}
+
+	dev_err(dpu->dev, "invalid source(0x%02x) for ExtDst%u\n", src, ed->id);
+}
+
+void dpu_ed_pec_sync_trigger(struct dpu_extdst *ed)
+{
+	dpu_pec_ed_write(ed, PIXENGCFG_TRIGGER, SYNC_TRIGGER);
+}
+
+static void dpu_ed_enable_shden(struct dpu_extdst *ed)
+{
+	dpu_ed_write_mask(ed, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static void dpu_ed_kick_mode_external(struct dpu_extdst *ed)
+{
+	dpu_ed_write_mask(ed, STATICCONTROL, KICK_MODE, EXTERNAL);
+}
+
+static void dpu_ed_disable_perfcountmode(struct dpu_extdst *ed)
+{
+	dpu_ed_write_mask(ed, STATICCONTROL, PERFCOUNTMODE, 0);
+}
+
+static void dpu_ed_disable_gamma_apply(struct dpu_extdst *ed)
+{
+	dpu_ed_write_mask(ed, CONTROL, GAMMAAPPLYENABLE, 0);
+}
+
+static struct dpu_extdst *dpu_ed_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_extdst *ed;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->ed_priv); i++) {
+		ed = dpu->ed_priv[i];
+		if (ed->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->ed_priv))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&ed->mutex);
+
+	if (ed->inuse) {
+		mutex_unlock(&ed->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	ed->inuse = true;
+
+	mutex_unlock(&ed->mutex);
+
+	return ed;
+}
+
+static void dpu_ed_put(struct dpu_extdst *ed)
+{
+	if (IS_ERR_OR_NULL(ed))
+		return;
+
+	mutex_lock(&ed->mutex);
+
+	ed->inuse = false;
+
+	mutex_unlock(&ed->mutex);
+}
+
+/* ExtDst for safety stream */
+struct dpu_extdst *dpu_ed_safe_get(struct dpu_soc *dpu,
+				   unsigned int stream_id)
+{
+	return dpu_ed_get(dpu, stream_id + DPU_SAFETY_STREAM_OFFSET);
+}
+
+void dpu_ed_safe_put(struct dpu_extdst *ed)
+{
+	return dpu_ed_put(ed);
+}
+
+/* ExtDst for content stream */
+struct dpu_extdst *dpu_ed_cont_get(struct dpu_soc *dpu,
+				   unsigned int stream_id)
+{
+	return dpu_ed_get(dpu, stream_id);
+}
+
+void dpu_ed_cont_put(struct dpu_extdst *ed)
+{
+	return dpu_ed_put(ed);
+}
+
+void dpu_ed_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	struct dpu_extdst *ed = dpu->ed_priv[index];
+
+	dpu_ed_pec_src_sel(ed, LINK_ID_NONE);
+	dpu_ed_pec_enable_shden(ed);
+	dpu_ed_pec_poweron(ed);
+	dpu_ed_pec_sync_mode_single(ed);
+	dpu_ed_pec_div_reset(ed);
+	dpu_ed_enable_shden(ed);
+	dpu_ed_disable_perfcountmode(ed);
+	dpu_ed_kick_mode_external(ed);
+	dpu_ed_disable_gamma_apply(ed);
+}
+
+int dpu_ed_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base)
+{
+	struct dpu_extdst *ed;
+
+	ed = devm_kzalloc(dpu->dev, sizeof(*ed), GFP_KERNEL);
+	if (!ed)
+		return -ENOMEM;
+
+	dpu->ed_priv[index] = ed;
+
+	ed->pec_base = devm_ioremap(dpu->dev, pec_base, SZ_32);
+	if (!ed->pec_base)
+		return -ENOMEM;
+
+	ed->base = devm_ioremap(dpu->dev, base, SZ_128);
+	if (!ed->base)
+		return -ENOMEM;
+
+	ed->dpu = dpu;
+	ed->id = id;
+	ed->index = index;
+
+	mutex_init(&ed->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c b/drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c
new file mode 100644
index 000000000000..08a8d3800b86
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu.h"
+#include "dpu-fetchunit.h"
+#include "dpu-prv.h"
+
+#define RINGBUFSTARTADDR0	0x10
+#define RINGBUFWRAPADDR0	0x14
+#define FRAMEPROPERTIES0	0x18
+#define FRAMEDIMENSIONS		0x44
+#define FRAMERESAMPLING		0x48
+#define DECODECONTROL		0x4c
+#define SOURCEBUFFERLENGTH	0x50
+#define CONTROL			0x54
+#define CONTROLTRIGGER		0x58
+#define START			0x5c
+#define FETCHTYPE		0x60
+#define DECODERSTATUS		0x64
+#define READADDRESS0		0x68
+#define BURSTBUFFERPROPERTIES	0x6c
+#define STATUS			0x70
+#define HIDDENSTATUS		0x74
+
+#define DPU_FETCHDECODE_DISP_SCALER_OFFSET	4
+#define DPU_FETCHDECODE_REG_OFFSET		0xc
+
+#define DPU_FETCHDECODE_CAP_MASK	(DPU_FETCHUNIT_CAP_USE_FETCHECO | \
+					 DPU_FETCHUNIT_CAP_USE_SCALER |   \
+					 DPU_FETCHUNIT_CAP_PACKED_YUV422)
+
+static const enum dpu_link_id dpu_fd_link_id[] = {
+	LINK_ID_FETCHDECODE0, LINK_ID_FETCHDECODE1, LINK_ID_FETCHDECODE9
+};
+
+static const enum dpu_link_id fd_srcs[3][4] = {
+	{
+		LINK_ID_NONE,
+		LINK_ID_FETCHECO0,
+		LINK_ID_FETCHDECODE1,
+		LINK_ID_FETCHWARP2,
+	}, {
+		LINK_ID_NONE,
+		LINK_ID_FETCHECO1,
+		LINK_ID_FETCHDECODE0,
+		LINK_ID_FETCHWARP2,
+	}, {
+		LINK_ID_NONE,
+		LINK_ID_FETCHECO9,
+		LINK_ID_FETCHWARP9,
+	},
+};
+
+static void dpu_fd_pec_dynamic_src_sel(struct dpu_fetchunit *fu,
+				       enum dpu_link_id src)
+{
+	struct dpu_soc *dpu = fu->dpu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(fd_srcs[fu->index]); i++) {
+		if (fd_srcs[fu->index][i] == src) {
+			dpu_pec_fu_write(fu, PIXENGCFG_DYNAMIC, src);
+			return;
+		}
+	}
+
+	dev_err(dpu->dev, "%s - invalid source 0x%02x\n", fu->name, src);
+}
+
+static void
+dpu_fd_set_src_buf_dimensions(struct dpu_fetchunit *fu,
+			      unsigned int w, unsigned int h,
+			      const struct drm_format_info *unused,
+			      bool deinterlace)
+{
+	if (deinterlace)
+		h /= 2;
+
+	dpu_fu_write(fu, SOURCEBUFFERDIMENSION(fu),
+		     LINEWIDTH(w) | LINECOUNT(h));
+}
+
+static void dpu_fd_set_fmt(struct dpu_fetchunit *fu,
+			   const struct drm_format_info *format,
+			   enum drm_color_encoding color_encoding,
+			   enum drm_color_range color_range,
+			   bool deinterlace)
+{
+	u32 val, bits = 0, shifts = 0;
+	bool is_planar_yuv = false, is_rastermode_yuv422 = false;
+	bool is_yuv422upsamplingmode_interpolate = false;
+	bool is_inputselect_compact = false;
+	unsigned int bpp;
+
+	switch (format->format) {
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_UYVY:
+		is_rastermode_yuv422 = true;
+		is_yuv422upsamplingmode_interpolate = true;
+		bpp = 16;
+		break;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		if (deinterlace)
+			is_yuv422upsamplingmode_interpolate = true;
+		is_planar_yuv = true;
+		is_rastermode_yuv422 = true;
+		is_inputselect_compact = true;
+		bpp = format->cpp[0] * 8;
+		break;
+	default:
+		bpp = format->cpp[0] * 8;
+		break;
+	}
+
+	dpu_fu_set_src_bpp(fu, bpp);
+
+	val = dpu_fu_read(fu, CONTROL);
+	val &= ~YUV422UPSAMPLINGMODE_MASK;
+	val &= ~INPUTSELECT_MASK;
+	val &= ~RASTERMODE_MASK;
+	if (is_yuv422upsamplingmode_interpolate)
+		val |= YUV422UPSAMPLINGMODE(YUV422UPSAMPLINGMODE_INTERPOLATE);
+	else
+		val |= YUV422UPSAMPLINGMODE(YUV422UPSAMPLINGMODE_REPLICATE);
+	if (is_inputselect_compact)
+		val |= INPUTSELECT(INPUTSELECT_COMPPACK);
+	else
+		val |= INPUTSELECT(INPUTSELECT_INACTIVE);
+	if (is_rastermode_yuv422)
+		val |= RASTERMODE(RASTERMODE_YUV422);
+	else
+		val |= RASTERMODE(RASTERMODE_NORMAL);
+	dpu_fu_write(fu, CONTROL, val);
+
+	val = dpu_fu_read(fu, LAYERPROPERTY(fu));
+	val &= ~YUVCONVERSIONMODE_MASK;
+	if (format->is_yuv) {
+		if (color_encoding == DRM_COLOR_YCBCR_BT709)
+			val |= YUVCONVERSIONMODE(YUVCONVERSIONMODE_ITU709);
+		else if (color_encoding == DRM_COLOR_YCBCR_BT601 &&
+			 color_range == DRM_COLOR_YCBCR_FULL_RANGE)
+			val |= YUVCONVERSIONMODE(YUVCONVERSIONMODE_ITU601_FR);
+		else
+			val |= YUVCONVERSIONMODE(YUVCONVERSIONMODE_ITU601);
+	} else {
+		val |= YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF);
+	}
+	dpu_fu_write(fu, LAYERPROPERTY(fu), val);
+
+	dpu_fu_get_pixel_format_bits(fu, format->format, &bits);
+	dpu_fu_get_pixel_format_shifts(fu, format->format, &shifts);
+
+	if (is_planar_yuv) {
+		bits &= ~(U_BITS_MASK | V_BITS_MASK);
+		shifts &= ~(U_SHIFT_MASK | V_SHIFT_MASK);
+	}
+
+	dpu_fu_write(fu, COLORCOMPONENTBITS(fu), bits);
+	dpu_fu_write(fu, COLORCOMPONENTSHIFT(fu), shifts);
+}
+
+static void dpu_fd_set_framedimensions(struct dpu_fetchunit *fu,
+				       unsigned int w, unsigned int h,
+				       bool deinterlace)
+{
+	if (deinterlace)
+		h /= 2;
+
+	dpu_fu_write(fu, FRAMEDIMENSIONS, FRAMEWIDTH(w) | FRAMEHEIGHT(h));
+}
+
+static void dpu_fd_set_ops(struct dpu_fetchunit *fu)
+{
+	memcpy(&fu->ops, &dpu_fu_common_ops, sizeof(dpu_fu_common_ops));
+	fu->ops.set_pec_dynamic_src_sel = dpu_fd_pec_dynamic_src_sel;
+	fu->ops.set_src_buf_dimensions	= dpu_fd_set_src_buf_dimensions;
+	fu->ops.set_fmt			= dpu_fd_set_fmt;
+	fu->ops.set_framedimensions	= dpu_fd_set_framedimensions;
+}
+
+struct dpu_fetchunit *dpu_fd_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_fetchunit *fu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->fd_priv); i++) {
+		fu = dpu->fd_priv[i];
+		if (fu->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->fd_priv))
+		return ERR_PTR(-EINVAL);
+
+	fu->fe = dpu_fe_get(dpu, id);
+	if (IS_ERR(fu->fe))
+		return ERR_CAST(fu->fe);
+
+	fu->hs = dpu_hs_get(dpu, fu->type == DPU_DISP ?
+				id + DPU_FETCHDECODE_DISP_SCALER_OFFSET : id);
+	if (IS_ERR(fu->hs))
+		return ERR_CAST(fu->hs);
+
+	fu->vs = dpu_vs_get(dpu, fu->type == DPU_DISP ?
+				id + DPU_FETCHDECODE_DISP_SCALER_OFFSET : id);
+	if (IS_ERR(fu->vs))
+		return ERR_CAST(fu->vs);
+
+	mutex_lock(&fu->mutex);
+
+	if (fu->inuse) {
+		mutex_unlock(&fu->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	fu->inuse = true;
+
+	mutex_unlock(&fu->mutex);
+
+	return fu;
+}
+
+void dpu_fd_put(struct dpu_fetchunit *fu)
+{
+	if (IS_ERR_OR_NULL(fu))
+		return;
+
+	mutex_lock(&fu->mutex);
+
+	fu->inuse = false;
+
+	mutex_unlock(&fu->mutex);
+}
+
+void dpu_fd_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	struct dpu_fetchunit *fu = dpu->fd_priv[index];
+
+	fu->ops.set_pec_dynamic_src_sel(fu, LINK_ID_NONE);
+	dpu_fu_common_hw_init(fu);
+}
+
+int dpu_fd_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base)
+{
+	struct dpu_fetchunit *fu;
+	int ret;
+
+	fu = devm_kzalloc(dpu->dev, sizeof(*fu), GFP_KERNEL);
+	if (!fu)
+		return -ENOMEM;
+
+	dpu->fd_priv[index] = fu;
+
+	fu->pec_base = devm_ioremap(dpu->dev, pec_base, SZ_16);
+	if (!fu->pec_base)
+		return -ENOMEM;
+
+	fu->base = devm_ioremap(dpu->dev, base, SZ_2K);
+	if (!fu->base)
+		return -ENOMEM;
+
+	fu->dpu = dpu;
+	fu->id = id;
+	fu->index = index;
+	fu->type = type;
+	fu->link_id = dpu_fd_link_id[index];
+	fu->cap_mask = DPU_FETCHDECODE_CAP_MASK;
+	fu->reg_offset = DPU_FETCHDECODE_REG_OFFSET;
+	snprintf(fu->name, sizeof(fu->name), "FetchDecode%u", id);
+
+	ret = dpu_fu_attach_dprc(fu);
+	if (ret) {
+		dev_err_probe(dpu->dev, ret, "%s - failed to attach DPRC\n",
+			      fu->name);
+		return ret;
+	}
+
+	dpu_fd_set_ops(fu);
+
+	mutex_init(&fu->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-fetcheco.c b/drivers/gpu/drm/imx/dpu/dpu-fetcheco.c
new file mode 100644
index 000000000000..72b1e478d4d0
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-fetcheco.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu.h"
+#include "dpu-fetchunit.h"
+#include "dpu-prv.h"
+
+#define FRAMEDIMENSIONS		0x38
+#define FRAMERESAMPLING		0x3c
+#define CONTROL			0x40
+#define CONTROLTRIGGER		0x44
+#define START			0x48
+#define FETCHTYPE		0x4c
+#define BURSTBUFFERPROPERTIES	0x50
+#define HIDDENSTATUS		0x54
+
+static const enum dpu_link_id dpu_fe_link_id[] = {
+	LINK_ID_FETCHECO0, LINK_ID_FETCHECO1,
+	LINK_ID_FETCHECO2, LINK_ID_FETCHECO9
+};
+
+static void
+dpu_fe_set_src_buf_dimensions(struct dpu_fetchunit *fu,
+			      unsigned int w, unsigned int h,
+			      const struct drm_format_info *format,
+			      bool deinterlace)
+{
+	struct dpu_soc *dpu = fu->dpu;
+	unsigned int width, height;
+
+	if (deinterlace) {
+		width = w;
+		height = h / 2;
+	} else {
+		width = w / format->hsub;
+		height = h / format->vsub;
+	}
+
+	switch (format->format) {
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
+		break;
+	default:
+		dev_warn(dpu->dev,
+			 "%s - unsupported pixel format 0x%08x\n",
+						fu->name, format->format);
+		return;
+	}
+
+	dpu_fu_write(fu, SOURCEBUFFERDIMENSION(fu),
+		     LINEWIDTH(width) | LINECOUNT(height));
+}
+
+static void dpu_fe_set_fmt(struct dpu_fetchunit *fu,
+			   const struct drm_format_info *format,
+			   enum drm_color_encoding unused1,
+			   enum drm_color_range unused2,
+			   bool deinterlace)
+{
+	struct dpu_soc *dpu = fu->dpu;
+	u32 bits = 0, shifts = 0;
+	unsigned int x, y;
+
+	switch (format->format) {
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		break;
+	default:
+		dev_warn(dpu->dev,
+			 "%s - unsupported pixel format 0x%08x\n",
+						fu->name, format->format);
+		return;
+	}
+
+	switch (format->hsub) {
+	case 1:
+		x = 0x4;
+		break;
+	case 2:
+		x = 0x2;
+		break;
+	default:
+		dev_warn(dpu->dev,
+			 "%s - unsupported horizontal subsampling %u\n",
+							fu->name, format->hsub);
+		return;
+	}
+
+	switch (format->vsub) {
+	case 1:
+		y = 0x4;
+		break;
+	case 2:
+		y = 0x2;
+		break;
+	default:
+		dev_warn(dpu->dev,
+			 "%s - unsupported vertical subsampling %u\n",
+							fu->name, format->vsub);
+		return;
+	}
+
+	dpu_fu_set_src_bpp(fu, 16);
+
+	dpu_fu_write_mask(fu, FRAMERESAMPLING, DELTAX_MASK | DELTAY_MASK,
+			  DELTAX(x) | DELTAY(y));
+
+	dpu_fu_write_mask(fu, CONTROL, RASTERMODE_MASK,
+			  RASTERMODE(RASTERMODE_NORMAL));
+
+	dpu_fu_get_pixel_format_bits(fu, format->format, &bits);
+	dpu_fu_get_pixel_format_shifts(fu, format->format, &shifts);
+
+	dpu_fu_write(fu, COLORCOMPONENTBITS(fu), bits & ~Y_BITS_MASK);
+	dpu_fu_write(fu, COLORCOMPONENTSHIFT(fu), shifts & ~Y_SHIFT_MASK);
+}
+
+static void dpu_fe_set_framedimensions(struct dpu_fetchunit *fu,
+				       unsigned int w, unsigned int h,
+				       bool deinterlace)
+{
+	if (deinterlace)
+		h /= 2;
+
+	dpu_fu_write(fu, FRAMEDIMENSIONS, FRAMEWIDTH(w) | FRAMEHEIGHT(h));
+}
+
+static void dpu_fe_set_ops(struct dpu_fetchunit *fu)
+{
+	memcpy(&fu->ops, &dpu_fu_common_ops, sizeof(dpu_fu_common_ops));
+	fu->ops.set_src_buf_dimensions	= dpu_fe_set_src_buf_dimensions;
+	fu->ops.set_fmt			= dpu_fe_set_fmt;
+	fu->ops.set_framedimensions	= dpu_fe_set_framedimensions;
+}
+
+struct dpu_fetchunit *dpu_fe_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_fetchunit *fu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->fe_priv); i++) {
+		fu = dpu->fe_priv[i];
+		if (fu->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->fe_priv))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&fu->mutex);
+
+	if (fu->inuse) {
+		mutex_unlock(&fu->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	fu->inuse = true;
+
+	mutex_unlock(&fu->mutex);
+
+	return fu;
+}
+
+void dpu_fe_put(struct dpu_fetchunit *fu)
+{
+	if (IS_ERR_OR_NULL(fu))
+		return;
+
+	mutex_lock(&fu->mutex);
+
+	fu->inuse = false;
+
+	mutex_unlock(&fu->mutex);
+}
+
+void dpu_fe_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	dpu_fu_common_hw_init(dpu->fe_priv[index]);
+}
+
+int dpu_fe_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base)
+{
+	struct dpu_fetchunit *fu;
+
+	fu = devm_kzalloc(dpu->dev, sizeof(*fu), GFP_KERNEL);
+	if (!fu)
+		return -ENOMEM;
+
+	dpu->fe_priv[index] = fu;
+
+	fu->pec_base = devm_ioremap(dpu->dev, pec_base, SZ_16);
+	if (!fu->pec_base)
+		return -ENOMEM;
+
+	fu->base = devm_ioremap(dpu->dev, base, SZ_128);
+	if (!fu->base)
+		return -ENOMEM;
+
+	fu->dpu = dpu;
+	fu->id = id;
+	fu->index = index;
+	fu->type = type;
+	fu->link_id = dpu_fe_link_id[index];
+	snprintf(fu->name, sizeof(fu->name), "FetchECO%u", id);
+
+	dpu_fe_set_ops(fu);
+
+	mutex_init(&fu->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c b/drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c
new file mode 100644
index 000000000000..e1cc36cd3441
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu.h"
+#include "dpu-fetchunit.h"
+#include "dpu-prv.h"
+
+#define FRAMEDIMENSIONS		0x150
+#define FRAMERESAMPLING		0x154
+#define CONTROL			0x158
+#define TRIGGERENABLE		0x15c
+#define CONTROLTRIGGER		0x160
+#define START			0x164
+#define FETCHTYPE		0x168
+#define BURSTBUFFERPROPERTIES	0x16c
+#define STATUS			0x170
+#define HIDDENSTATUS		0x174
+
+static const enum dpu_link_id dpu_fl_link_id[] = {LINK_ID_FETCHLAYER0};
+
+static void dpu_fl_set_fmt(struct dpu_fetchunit *fu,
+			   const struct drm_format_info *format,
+			   enum drm_color_encoding color_encoding,
+			   enum drm_color_range color_range,
+			   bool unused)
+{
+	u32 bits = 0, shifts = 0;
+
+	dpu_fu_set_src_bpp(fu, format->cpp[0] * 8);
+
+	dpu_fu_write_mask(fu, LAYERPROPERTY(fu), YUVCONVERSIONMODE_MASK,
+			  YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF));
+
+	dpu_fu_get_pixel_format_bits(fu, format->format, &bits);
+	dpu_fu_get_pixel_format_shifts(fu, format->format, &shifts);
+
+	dpu_fu_write(fu, COLORCOMPONENTBITS(fu), bits);
+	dpu_fu_write(fu, COLORCOMPONENTSHIFT(fu), shifts);
+}
+
+static void
+dpu_fl_set_framedimensions(struct dpu_fetchunit *fu, unsigned int w,
+			   unsigned int h, bool unused)
+{
+	dpu_fu_write(fu, FRAMEDIMENSIONS, FRAMEWIDTH(w) | FRAMEHEIGHT(h));
+}
+
+static void dpu_fl_set_ops(struct dpu_fetchunit *fu)
+{
+	memcpy(&fu->ops, &dpu_fu_common_ops, sizeof(dpu_fu_common_ops));
+	fu->ops.set_src_buf_dimensions =
+				dpu_fu_set_src_buf_dimensions_no_deinterlace;
+	fu->ops.set_fmt			= dpu_fl_set_fmt;
+	fu->ops.set_framedimensions	= dpu_fl_set_framedimensions;
+}
+
+struct dpu_fetchunit *dpu_fl_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_fetchunit *fu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->fl_priv); i++) {
+		fu = dpu->fl_priv[i];
+		if (fu->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->fl_priv))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&fu->mutex);
+
+	if (fu->inuse) {
+		mutex_unlock(&fu->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	fu->inuse = true;
+
+	mutex_unlock(&fu->mutex);
+
+	return fu;
+}
+
+void dpu_fl_put(struct dpu_fetchunit *fu)
+{
+	if (IS_ERR_OR_NULL(fu))
+		return;
+
+	mutex_lock(&fu->mutex);
+
+	fu->inuse = false;
+
+	mutex_unlock(&fu->mutex);
+}
+
+void dpu_fl_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	struct dpu_fetchunit *fu = dpu->fl_priv[index];
+
+	dpu_fu_common_hw_init(fu);
+	dpu_fu_shdldreq_sticky(fu, 0xff);
+}
+
+int dpu_fl_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base)
+{
+	struct dpu_fetchunit *fu;
+	int ret;
+
+	fu = devm_kzalloc(dpu->dev, sizeof(*fu), GFP_KERNEL);
+	if (!fu)
+		return -ENOMEM;
+
+	dpu->fl_priv[index] = fu;
+
+	fu->pec_base = devm_ioremap(dpu->dev, pec_base, SZ_16);
+	if (!fu->pec_base)
+		return -ENOMEM;
+
+	fu->base = devm_ioremap(dpu->dev, base, SZ_2K);
+	if (!fu->base)
+		return -ENOMEM;
+
+	fu->dpu = dpu;
+	fu->id = id;
+	fu->index = index;
+	fu->type = type;
+	fu->sub_id = 0;
+	fu->link_id = dpu_fl_link_id[index];
+	snprintf(fu->name, sizeof(fu->name), "FetchLayer%u", id);
+
+	ret = dpu_fu_attach_dprc(fu);
+	if (ret) {
+		dev_err_probe(dpu->dev, ret, "%s - failed to attach DPRC\n",
+			      fu->name);
+		return ret;
+	}
+
+	dpu_fl_set_ops(fu);
+
+	mutex_init(&fu->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-fetchunit.c b/drivers/gpu/drm/imx/dpu/dpu-fetchunit.c
new file mode 100644
index 000000000000..93c54fd7e70e
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-fetchunit.c
@@ -0,0 +1,610 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2018-2020,2022 NXP
+ */
+
+#include <linux/bitops.h>
+#include <linux/list.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include <drm/drm_blend.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#include "dpu-fetchunit.h"
+
+#define STATICCONTROL			0x8
+#define  SHDLDREQSTICKY(lm)		(((lm) & 0xff) << 24)
+#define  SHDLDREQSTICKY_MASK		(0xff << 24)
+#define  BASEADDRESSAUTOUPDATE(lm)	(((lm) & 0xff) << 16)
+#define  BASEADDRESSAUTOUPDATE_MASK	(0xff << 16)
+
+#define BURSTBUFFERMANAGEMENT		0xc
+#define  SETBURSTLENGTH(n)		(((n) & 0x1f) << 8)
+#define  SETBURSTLENGTH_MASK		0x1f00
+#define  SETNUMBUFFERS(n)		((n) & 0xff)
+#define  SETNUMBUFFERS_MASK		0xff
+#define  LINEMODE_MASK			0x80000000
+#define  LINEMODE_SHIFT			31
+
+#define BASEADDRESS(fu)			(0x10 + SUBID_OFFSET + REG_OFFSET)
+
+#define SOURCEBUFFERATTRIBUTES(fu)	(0x14 + SUBID_OFFSET + REG_OFFSET)
+#define  BITSPERPIXEL_MASK		0x3f0000
+#define  BITSPERPIXEL(bpp)		(((bpp) & 0x3f) << 16)
+#define  STRIDE_MASK			0xffff
+#define  STRIDE(n)			(((n) - 1) & 0xffff)
+
+#define LAYEROFFSET(fu)			(0x24 + SUBID_OFFSET + REG_OFFSET)
+#define  LAYERXOFFSET(x)		((x) & 0x7fff)
+#define  LAYERYOFFSET(y)		(((y) & 0x7fff) << 16)
+
+#define CLIPWINDOWOFFSET(fu)		(0x28 + SUBID_OFFSET + REG_OFFSET)
+#define  CLIPWINDOWXOFFSET(x)		((x) & 0x7fff)
+#define  CLIPWINDOWYOFFSET(y)		(((y) & 0x7fff) << 16)
+
+#define CLIPWINDOWDIMENSIONS(fu)	(0x2c + SUBID_OFFSET + REG_OFFSET)
+#define  CLIPWINDOWWIDTH(w)		(((w) - 1) & 0x3fff)
+#define  CLIPWINDOWHEIGHT(h)		((((h) - 1) & 0x3fff) << 16)
+
+#define CONSTANTCOLOR(fu)		(0x30 + SUBID_OFFSET + REG_OFFSET)
+#define  CONSTANTALPHA_MASK		0xff
+#define  CONSTANTALPHA(n)		((n) & CONSTANTALPHA_MASK)
+
+#define DPU_FETCHUNIT_NO_STREAM_ID	(~0)
+
+enum dpu_linemode {
+	/*
+	 * Mandatory setting for operation in the Display Controller.
+	 * Works also for Blit Engine with marginal performance impact.
+	 */
+	LINEMODE_DISPLAY = 0,
+	/* Recommended setting for operation in the Blit Engine. */
+	LINEMODE_BLIT = (1 << LINEMODE_SHIFT),
+};
+
+struct dpu_fetchunit_pixel_format {
+	u32 pixel_format;
+	u32 bits;
+	u32 shifts;
+};
+
+struct dpu_fetchunit_sc_rsc_map {
+	u32 sc_rsc;
+	enum dpu_link_id link_id;
+};
+
+static const struct dpu_fetchunit_pixel_format pixel_formats[] = {
+	{
+		DRM_FORMAT_ARGB8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(24),
+	}, {
+		DRM_FORMAT_XRGB8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_ABGR8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(24),
+	}, {
+		DRM_FORMAT_XBGR8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGBA8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGBX8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGRA8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGRX8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGB888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGR888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGB565,
+		R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
+		R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_YUYV,
+		Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
+		Y_SHIFT(0)  | U_SHIFT(8)  | V_SHIFT(8)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_UYVY,
+		Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
+		Y_SHIFT(8)  | U_SHIFT(0)  | V_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_NV12,
+		Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
+		Y_SHIFT(0)  | U_SHIFT(0)  | V_SHIFT(8)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_NV21,
+		Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
+		Y_SHIFT(0)  | U_SHIFT(8)  | V_SHIFT(0)  | A_SHIFT(0),
+	},
+};
+
+static const struct dpu_fetchunit_sc_rsc_map sc_rsc_maps[] = {
+	{ IMX_SC_R_DC_0_BLIT0,  LINK_ID_FETCHDECODE9 },
+	{ IMX_SC_R_DC_0_BLIT1,  LINK_ID_FETCHWARP9 },
+	{ IMX_SC_R_DC_0_WARP,   LINK_ID_FETCHWARP2 },
+	{ IMX_SC_R_DC_0_VIDEO0, LINK_ID_FETCHDECODE0 },
+	{ IMX_SC_R_DC_0_VIDEO1, LINK_ID_FETCHDECODE1 },
+	{ IMX_SC_R_DC_0_FRAC0,  LINK_ID_FETCHLAYER0 },
+	{ IMX_SC_R_DC_1_BLIT0,  LINK_ID_FETCHDECODE9 },
+	{ IMX_SC_R_DC_1_BLIT1,  LINK_ID_FETCHWARP9 },
+	{ IMX_SC_R_DC_1_WARP,   LINK_ID_FETCHWARP2 },
+	{ IMX_SC_R_DC_1_VIDEO0, LINK_ID_FETCHDECODE0 },
+	{ IMX_SC_R_DC_1_VIDEO1, LINK_ID_FETCHDECODE1 },
+	{ IMX_SC_R_DC_1_FRAC0,  LINK_ID_FETCHLAYER0 },
+};
+
+void dpu_fu_get_pixel_format_bits(struct dpu_fetchunit *fu,
+				  u32 format, u32 *bits)
+{
+	struct dpu_soc *dpu = fu->dpu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		if (pixel_formats[i].pixel_format == format) {
+			*bits = pixel_formats[i].bits;
+			return;
+		}
+	}
+
+	dev_warn(dpu->dev, "%s - unsupported pixel format 0x%08x\n",
+		 fu->name, format);
+}
+
+void dpu_fu_get_pixel_format_shifts(struct dpu_fetchunit *fu,
+				    u32 format, u32 *shifts)
+{
+	struct dpu_soc *dpu = fu->dpu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		if (pixel_formats[i].pixel_format == format) {
+			*shifts = pixel_formats[i].shifts;
+			return;
+		}
+	}
+
+	dev_warn(dpu->dev, "%s - unsupported pixel format 0x%08x\n",
+		 fu->name, format);
+}
+
+static bool dpu_fu_is_enabled(struct dpu_fetchunit *fu)
+{
+	u32 val = dpu_fu_read(fu, LAYERPROPERTY(fu));
+
+	return !!(val & SOURCEBUFFERENABLE);
+}
+
+static void dpu_fu_enable_shden(struct dpu_fetchunit *fu)
+{
+	dpu_fu_write_mask(fu, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static void dpu_fu_baddr_autoupdate(struct dpu_fetchunit *fu, u8 layer_mask)
+{
+	dpu_fu_write_mask(fu, STATICCONTROL, BASEADDRESSAUTOUPDATE_MASK,
+			  BASEADDRESSAUTOUPDATE(layer_mask));
+}
+
+void dpu_fu_shdldreq_sticky(struct dpu_fetchunit *fu, u8 layer_mask)
+{
+	dpu_fu_write_mask(fu, STATICCONTROL, SHDLDREQSTICKY_MASK,
+			  SHDLDREQSTICKY(layer_mask));
+}
+
+static void dpu_fu_set_linemode(struct dpu_fetchunit *fu, enum dpu_linemode mode)
+{
+	dpu_fu_write_mask(fu, BURSTBUFFERMANAGEMENT, LINEMODE_MASK, mode);
+}
+
+static void dpu_fu_set_numbuffers(struct dpu_fetchunit *fu, unsigned int num)
+{
+	dpu_fu_write_mask(fu, BURSTBUFFERMANAGEMENT, SETNUMBUFFERS_MASK,
+			  SETNUMBUFFERS(num));
+}
+
+/* address TKT343664: base address has to align to burst size */
+static unsigned int dpu_fu_burst_size_fixup(dma_addr_t baddr)
+{
+	unsigned int burst_size;
+
+	burst_size = 1 << __ffs(baddr);
+	burst_size = round_up(burst_size, 8);
+	burst_size = min(burst_size, 128U);
+
+	return burst_size;
+}
+
+/* address TKT339017: mismatch between burst size and stride */
+static unsigned int dpu_fu_stride_fixup(unsigned int stride,
+					unsigned int burst_size,
+					dma_addr_t baddr, bool nonzero_mod)
+{
+	if (nonzero_mod)
+		stride = round_up(stride + round_up(baddr % 8, 8), burst_size);
+	else
+		stride = round_up(stride, burst_size);
+
+	return stride;
+}
+
+static void dpu_fu_set_burstlength(struct dpu_fetchunit *fu,
+				   unsigned int x_offset, unsigned int mt_w,
+				   int bpp, dma_addr_t baddr)
+{
+	struct dpu_soc *dpu = fu->dpu;
+	unsigned int burst_size, burst_length;
+	bool nonzero_mod = !!mt_w;
+
+	/* consider PRG x offset to calculate buffer address */
+	if (nonzero_mod)
+		baddr += (x_offset % mt_w) * (bpp / 8);
+
+	burst_size = dpu_fu_burst_size_fixup(baddr);
+	burst_length = burst_size / 8;
+
+	dpu_fu_write_mask(fu, BURSTBUFFERMANAGEMENT, SETBURSTLENGTH_MASK,
+			  SETBURSTLENGTH(burst_length));
+
+	dev_dbg(dpu->dev, "%s burst length is %u\n", fu->name, burst_length);
+}
+
+static void
+dpu_fu_set_baseaddress(struct dpu_fetchunit *fu, unsigned int width,
+		       unsigned int x_offset, unsigned int y_offset,
+		       unsigned int mt_w, unsigned int mt_h,
+		       int bpp, dma_addr_t baddr)
+{
+	unsigned int burst_size, stride;
+	bool nonzero_mod = !!mt_w;
+
+	if (nonzero_mod) {
+		/* consider PRG x offset to calculate buffer address */
+		baddr += (x_offset % mt_w) * (bpp / 8);
+
+		burst_size = dpu_fu_burst_size_fixup(baddr);
+
+		stride = width * (bpp / 8);
+		stride = dpu_fu_stride_fixup(stride, burst_size, baddr,
+					     nonzero_mod);
+
+		/* consider PRG y offset to calculate buffer address */
+		baddr += (y_offset % mt_h) * stride;
+	}
+
+	dpu_fu_write(fu, BASEADDRESS(fu), baddr);
+}
+
+void dpu_fu_set_src_bpp(struct dpu_fetchunit *fu, unsigned int bpp)
+{
+	dpu_fu_write_mask(fu, SOURCEBUFFERATTRIBUTES(fu), BITSPERPIXEL_MASK,
+			  BITSPERPIXEL(bpp));
+}
+
+static void
+dpu_fu_set_src_stride(struct dpu_fetchunit *fu,
+		      unsigned int width, unsigned int x_offset,
+		      unsigned int mt_w, int bpp, unsigned int stride,
+		      dma_addr_t baddr)
+{
+	unsigned int burst_size;
+	bool nonzero_mod = !!mt_w;
+
+	/* consider PRG x offset to calculate buffer address */
+	if (nonzero_mod)
+		baddr += (x_offset % mt_w) * (bpp / 8);
+
+	burst_size = dpu_fu_burst_size_fixup(baddr);
+
+	stride = width * (bpp / 8);
+	stride = dpu_fu_stride_fixup(stride, burst_size, baddr, nonzero_mod);
+
+	dpu_fu_write_mask(fu, SOURCEBUFFERATTRIBUTES(fu), STRIDE_MASK,
+			  STRIDE(stride));
+}
+
+void
+dpu_fu_set_src_buf_dimensions_no_deinterlace(struct dpu_fetchunit *fu,
+					unsigned int w, unsigned int h,
+					const struct drm_format_info *unused1,
+					bool unused2)
+{
+	dpu_fu_write(fu, SOURCEBUFFERDIMENSION(fu),
+		     LINEWIDTH(w) | LINECOUNT(h));
+}
+
+static void dpu_fu_layeroffset(struct dpu_fetchunit *fu, unsigned int x,
+			       unsigned int y)
+{
+	dpu_fu_write(fu, LAYEROFFSET(fu), LAYERXOFFSET(x) | LAYERYOFFSET(y));
+}
+
+static void dpu_fu_clipoffset(struct dpu_fetchunit *fu, unsigned int x,
+			      unsigned int y)
+{
+	dpu_fu_write(fu, CLIPWINDOWOFFSET(fu),
+		     CLIPWINDOWXOFFSET(x) | CLIPWINDOWYOFFSET(y));
+}
+
+static void dpu_fu_clipdimensions(struct dpu_fetchunit *fu, unsigned int w,
+				  unsigned int h)
+{
+	dpu_fu_write(fu, CLIPWINDOWDIMENSIONS(fu),
+		     CLIPWINDOWWIDTH(w) | CLIPWINDOWHEIGHT(h));
+}
+
+static void dpu_fu_set_pixel_blend_mode(struct dpu_fetchunit *fu,
+					unsigned int pixel_blend_mode,
+					u16 alpha, bool fb_format_has_alpha)
+{
+	u32 mode = 0;
+
+	if (pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ||
+	    pixel_blend_mode == DRM_MODE_BLEND_COVERAGE) {
+		mode = ALPHACONSTENABLE;
+
+		if (fb_format_has_alpha)
+			mode |= ALPHASRCENABLE;
+	}
+
+	dpu_fu_write_mask(fu, LAYERPROPERTY(fu),
+			  PREMULCONSTRGB | ALPHA_ENABLE_MASK | RGB_ENABLE_MASK,
+			  mode);
+
+	dpu_fu_write_mask(fu, CONSTANTCOLOR(fu), CONSTANTALPHA_MASK,
+			  CONSTANTALPHA(alpha >> 8));
+}
+
+static void dpu_fu_enable_src_buf(struct dpu_fetchunit *fu)
+{
+	struct dpu_soc *dpu = fu->dpu;
+
+	dpu_fu_write_mask(fu, LAYERPROPERTY(fu), SOURCEBUFFERENABLE,
+			  SOURCEBUFFERENABLE);
+
+	dev_dbg(dpu->dev, "%s enables source buffer in shadow\n", fu->name);
+}
+
+static void dpu_fu_disable_src_buf(struct dpu_fetchunit *fu)
+{
+	struct dpu_soc *dpu = fu->dpu;
+
+	if (fu->ops.set_pec_dynamic_src_sel)
+		fu->ops.set_pec_dynamic_src_sel(fu, LINK_ID_NONE);
+
+	dpu_fu_write_mask(fu, LAYERPROPERTY(fu), SOURCEBUFFERENABLE, 0);
+
+	if (fu->fe)
+		fu->fe->ops.disable_src_buf(fu->fe);
+
+	if (fu->hs) {
+		dpu_hs_pec_clken(fu->hs, CLKEN_DISABLE);
+		dpu_hs_mode(fu->hs, SCALER_NEUTRAL);
+	}
+
+	if (fu->vs) {
+		dpu_vs_pec_clken(fu->vs, CLKEN_DISABLE);
+		dpu_vs_mode(fu->vs, SCALER_NEUTRAL);
+	}
+
+	if (fu->lb) {
+		dpu_lb_pec_clken(fu->lb, CLKEN_DISABLE);
+		dpu_lb_mode(fu->lb, LB_NEUTRAL);
+	}
+
+	dev_dbg(dpu->dev, "%s disables source buffer in shadow\n", fu->name);
+}
+
+static struct dpu_dprc *dpu_fu_get_dprc(struct dpu_fetchunit *fu)
+{
+	return fu->dprc;
+}
+
+static struct dpu_fetchunit *dpu_fu_get_fetcheco(struct dpu_fetchunit *fu)
+{
+	return fu->fe;
+}
+
+static struct dpu_hscaler *dpu_fu_get_hscaler(struct dpu_fetchunit *fu)
+{
+	return fu->hs;
+}
+
+static struct dpu_vscaler *dpu_fu_get_vscaler(struct dpu_fetchunit *fu)
+{
+	return fu->vs;
+}
+
+static void
+dpu_fu_set_layerblend(struct dpu_fetchunit *fu, struct dpu_layerblend *lb)
+{
+	fu->lb = lb;
+}
+
+static bool dpu_fu_is_available(struct dpu_fetchunit *fu)
+{
+	return fu->is_available;
+}
+
+static void dpu_fu_set_available(struct dpu_fetchunit *fu)
+{
+	fu->is_available = true;
+}
+
+static void dpu_fu_set_inavailable(struct dpu_fetchunit *fu)
+{
+	fu->is_available = false;
+}
+
+static void
+dpu_fu_set_stream_id(struct dpu_fetchunit *fu, unsigned int stream_id)
+{
+	struct dpu_soc *dpu = fu->dpu;
+
+	fu->stream_id = stream_id;
+
+	dev_dbg(dpu->dev, "%s sets stream id %u\n", fu->name, stream_id);
+}
+
+static unsigned int dpu_fu_get_stream_id(struct dpu_fetchunit *fu)
+{
+	struct dpu_soc *dpu = fu->dpu;
+
+	dev_dbg(dpu->dev, "%s gets stream id %u\n", fu->name, fu->stream_id);
+
+	return fu->stream_id;
+}
+
+static void dpu_fu_set_no_stream_id(struct dpu_fetchunit *fu)
+{
+	struct dpu_soc *dpu = fu->dpu;
+
+	fu->stream_id = DPU_FETCHUNIT_NO_STREAM_ID;
+
+	dev_dbg(dpu->dev, "%s sets no stream id\n", fu->name);
+}
+
+static bool dpu_fu_has_stream_id(struct dpu_fetchunit *fu)
+{
+	struct dpu_soc *dpu = fu->dpu;
+	bool result = fu->stream_id != DPU_FETCHUNIT_NO_STREAM_ID;
+
+	if (result)
+		dev_dbg(dpu->dev, "%s has stream id\n", fu->name);
+	else
+		dev_dbg(dpu->dev, "%s has no stream id\n", fu->name);
+
+	return result;
+}
+
+static enum dpu_link_id dpu_fu_get_link_id(struct dpu_fetchunit *fu)
+{
+	return fu->link_id;
+}
+
+static u32 dpu_fu_get_cap_mask(struct dpu_fetchunit *fu)
+{
+	return fu->cap_mask;
+}
+
+static const char *dpu_fu_get_name(struct dpu_fetchunit *fu)
+{
+	return fu->name;
+}
+
+const struct dpu_fetchunit_ops dpu_fu_common_ops = {
+	.is_enabled		= dpu_fu_is_enabled,
+	.set_numbuffers		= dpu_fu_set_numbuffers,
+	.set_burstlength	= dpu_fu_set_burstlength,
+	.set_baseaddress	= dpu_fu_set_baseaddress,
+	.set_src_stride		= dpu_fu_set_src_stride,
+	.set_pixel_blend_mode	= dpu_fu_set_pixel_blend_mode,
+	.enable_src_buf		= dpu_fu_enable_src_buf,
+	.disable_src_buf	= dpu_fu_disable_src_buf,
+	.get_dprc		= dpu_fu_get_dprc,
+	.get_fetcheco		= dpu_fu_get_fetcheco,
+	.get_hscaler		= dpu_fu_get_hscaler,
+	.get_vscaler		= dpu_fu_get_vscaler,
+	.set_layerblend		= dpu_fu_set_layerblend,
+	.is_available		= dpu_fu_is_available,
+	.set_available		= dpu_fu_set_available,
+	.set_inavailable	= dpu_fu_set_inavailable,
+	.set_stream_id		= dpu_fu_set_stream_id,
+	.get_stream_id		= dpu_fu_get_stream_id,
+	.set_no_stream_id	= dpu_fu_set_no_stream_id,
+	.has_stream_id		= dpu_fu_has_stream_id,
+	.get_link_id		= dpu_fu_get_link_id,
+	.get_cap_mask		= dpu_fu_get_cap_mask,
+	.get_name		= dpu_fu_get_name,
+};
+
+const struct dpu_fetchunit_ops *dpu_fu_get_ops(struct dpu_fetchunit *fu)
+{
+	return &fu->ops;
+}
+
+struct dpu_fetchunit *dpu_fu_get_from_list(struct list_head *l)
+{
+	return container_of(l, struct dpu_fetchunit, node);
+}
+
+void dpu_fu_add_to_list(struct dpu_fetchunit *fu, struct list_head *l)
+{
+	list_add(&fu->node, l);
+}
+
+void dpu_fu_common_hw_init(struct dpu_fetchunit *fu)
+{
+	dpu_fu_baddr_autoupdate(fu, 0x0);
+	dpu_fu_enable_shden(fu);
+	dpu_fu_set_linemode(fu, LINEMODE_DISPLAY);
+	dpu_fu_layeroffset(fu, 0x0, 0x0);
+	dpu_fu_clipoffset(fu, 0x0, 0x0);
+	dpu_fu_clipdimensions(fu, 0x0, 0x0);
+	dpu_fu_set_numbuffers(fu, 16);
+	dpu_fu_disable_src_buf(fu);
+	dpu_fu_set_no_stream_id(fu);
+}
+
+int dpu_fu_attach_dprc(struct dpu_fetchunit *fu)
+{
+	struct dpu_soc *dpu = fu->dpu;
+	struct device_node *parent = dpu->dev->of_node;
+	struct device_node *dprc_node;
+	u32 rsc;
+	int i, j;
+	int ret;
+
+	for (i = 0; ; i++) {
+		dprc_node = of_parse_phandle(parent, "fsl,dpr-channels", i);
+		if (!dprc_node)
+			break;
+
+		ret = of_property_read_u32(dprc_node, "fsl,sc-resource", &rsc);
+		if (ret) {
+			of_node_put(dprc_node);
+			return ret;
+		}
+
+		for (j = 0; j < ARRAY_SIZE(sc_rsc_maps); j++) {
+			if (sc_rsc_maps[j].sc_rsc == rsc &&
+			    sc_rsc_maps[j].link_id == fu->link_id) {
+				fu->dprc =
+					dpu_dprc_lookup_by_of_node(dpu->dev,
+								   dprc_node);
+				if (!fu->dprc) {
+					of_node_put(dprc_node);
+					return -EPROBE_DEFER;
+				}
+
+				of_node_put(dprc_node);
+				return 0;
+			}
+		}
+
+		of_node_put(dprc_node);
+	}
+
+	return -EINVAL;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-fetchunit.h b/drivers/gpu/drm/imx/dpu/dpu-fetchunit.h
new file mode 100644
index 000000000000..1cd0ae0961b6
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-fetchunit.h
@@ -0,0 +1,195 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright 2019,2020,2022 NXP
+ */
+
+#ifndef __DPU_FETCHUNIT_H__
+#define __DPU_FETCHUNIT_H__
+
+#include <linux/io.h>
+#include <linux/mutex.h>
+
+#include "dpu.h"
+#include "dpu-dprc.h"
+#include "dpu-prv.h"
+
+#define REG_OFFSET			((fu)->reg_offset)
+#define SUBID_OFFSET			(((fu)->sub_id) * 0x28)
+
+#define PIXENGCFG_DYNAMIC		0x8
+
+#define SOURCEBUFFERDIMENSION(fu)	(0x18 + SUBID_OFFSET + REG_OFFSET)
+#define  LINEWIDTH(w)			(((w) - 1) & 0x3fff)
+#define  LINECOUNT(h)			((((h) - 1) & 0x3fff) << 16)
+
+#define COLORCOMPONENTBITS(fu)		(0x1c + SUBID_OFFSET + REG_OFFSET)
+#define  ITUFORMAT			BIT(31)
+#define  R_BITS(n)			(((n) & 0xf) << 24)
+#define  G_BITS(n)			(((n) & 0xf) << 16)
+#define  B_BITS(n)			(((n) & 0xf) << 8)
+#define  A_BITS(n)			((n) & 0xf)
+#define  Y_BITS(n)			R_BITS(n)
+#define  Y_BITS_MASK			0xf000000
+#define  U_BITS(n)			G_BITS(n)
+#define  U_BITS_MASK			0xf0000
+#define  V_BITS(n)			B_BITS(n)
+#define  V_BITS_MASK			0xf00
+
+#define COLORCOMPONENTSHIFT(fu)		(0x20 + SUBID_OFFSET + REG_OFFSET)
+#define  R_SHIFT(n)			(((n) & 0x1f) << 24)
+#define  G_SHIFT(n)			(((n) & 0x1f) << 16)
+#define  B_SHIFT(n)			(((n) & 0x1f) << 8)
+#define  A_SHIFT(n)			((n) & 0x1f)
+#define  Y_SHIFT(n)			R_SHIFT(n)
+#define  Y_SHIFT_MASK			0x1f000000
+#define  U_SHIFT(n)			G_SHIFT(n)
+#define  U_SHIFT_MASK			0x1f0000
+#define  V_SHIFT(n)			B_SHIFT(n)
+#define  V_SHIFT_MASK			0x1f00
+
+#define LAYERPROPERTY(fu)		(0x34 + SUBID_OFFSET + REG_OFFSET)
+#define	 PALETTEENABLE			BIT(0)
+enum dpu_tilemode {
+	TILE_FILL_ZERO,
+	TILE_FILL_CONSTANT,
+	TILE_PAD,
+	TILE_PAD_ZERO,
+};
+
+#define  ALPHASRCENABLE			BIT(8)
+#define  ALPHACONSTENABLE		BIT(9)
+#define  ALPHAMASKENABLE		BIT(10)
+#define  ALPHATRANSENABLE		BIT(11)
+#define  ALPHA_ENABLE_MASK		(ALPHASRCENABLE | ALPHACONSTENABLE | \
+					 ALPHAMASKENABLE | ALPHATRANSENABLE)
+#define  RGBALPHASRCENABLE		BIT(12)
+#define  RGBALPHACONSTENABLE		BIT(13)
+#define  RGBALPHAMASKENABLE		BIT(14)
+#define  RGBALPHATRANSENABLE		BIT(15)
+#define  RGB_ENABLE_MASK		(RGBALPHASRCENABLE |	\
+					 RGBALPHACONSTENABLE |	\
+					 RGBALPHAMASKENABLE |	\
+					 RGBALPHATRANSENABLE)
+#define  PREMULCONSTRGB			BIT(16)
+enum dpu_yuvconversionmode {
+	YUVCONVERSIONMODE_OFF,
+	YUVCONVERSIONMODE_ITU601,
+	YUVCONVERSIONMODE_ITU601_FR,
+	YUVCONVERSIONMODE_ITU709,
+};
+
+#define  YUVCONVERSIONMODE_MASK		0x60000
+#define  YUVCONVERSIONMODE(m)		(((m) & 0x3) << 17)
+#define  GAMMAREMOVEENABLE		BIT(20)
+#define  CLIPWINDOWENABLE		BIT(30)
+#define  SOURCEBUFFERENABLE		BIT(31)
+
+#define  EMPTYFRAME			BIT(31)
+#define  FRAMEWIDTH(w)			(((w) - 1) & 0x3fff)
+#define  FRAMEHEIGHT(h)			((((h) - 1) & 0x3fff) << 16)
+#define  DELTAX_MASK			0x3f000
+#define  DELTAY_MASK			0xfc0000
+#define  DELTAX(x)			(((x) & 0x3f) << 12)
+#define  DELTAY(y)			(((y) & 0x3f) << 18)
+#define  YUV422UPSAMPLINGMODE_MASK	BIT(5)
+#define  YUV422UPSAMPLINGMODE(m)	(((m) & 0x1) << 5)
+enum dpu_yuv422upsamplingmode {
+	YUV422UPSAMPLINGMODE_REPLICATE,
+	YUV422UPSAMPLINGMODE_INTERPOLATE,
+};
+
+#define  INPUTSELECT_MASK		0x18
+#define  INPUTSELECT(s)			(((s) & 0x3) << 3)
+enum dpu_inputselect {
+	INPUTSELECT_INACTIVE,
+	INPUTSELECT_COMPPACK,
+	INPUTSELECT_ALPHAMASK,
+	INPUTSELECT_COORDINATE,
+};
+
+#define  RASTERMODE_MASK		0x7
+#define  RASTERMODE(m)			((m) & 0x7)
+enum dpu_rastermode {
+	RASTERMODE_NORMAL,
+	RASTERMODE_DECODE,
+	RASTERMODE_ARBITRARY,
+	RASTERMODE_PERSPECTIVE,
+	RASTERMODE_YUV422,
+	RASTERMODE_AFFINE,
+};
+
+struct dpu_fetchunit {
+	void __iomem *pec_base;
+	void __iomem *base;
+	char name[13];
+	struct mutex mutex;
+	struct list_head node;
+	unsigned int reg_offset;
+	unsigned int id;
+	unsigned int index;
+	unsigned int sub_id;	/* for fractional fetch units */
+	unsigned int stream_id;
+	enum dpu_unit_type type;
+	enum dpu_link_id link_id;
+	u32 cap_mask;
+	bool inuse;
+	bool is_available;
+	struct dpu_soc *dpu;
+	struct dpu_fetchunit_ops ops;
+	struct dpu_dprc *dprc;
+	struct dpu_fetchunit *fe;
+	struct dpu_hscaler *hs;
+	struct dpu_vscaler *vs;
+	struct dpu_layerblend *lb;
+};
+
+extern const struct dpu_fetchunit_ops dpu_fu_common_ops;
+
+static inline void
+dpu_pec_fu_write(struct dpu_fetchunit *fu, unsigned int offset, u32 value)
+{
+	writel(value, fu->pec_base + offset);
+}
+
+static inline u32 dpu_pec_fu_read(struct dpu_fetchunit *fu, unsigned int offset)
+{
+	return readl(fu->pec_base + offset);
+}
+
+static inline u32 dpu_fu_read(struct dpu_fetchunit *fu, unsigned int offset)
+{
+	return readl(fu->base + offset);
+}
+
+static inline void
+dpu_fu_write(struct dpu_fetchunit *fu, unsigned int offset, u32 value)
+{
+	writel(value, fu->base + offset);
+}
+
+static inline void dpu_fu_write_mask(struct dpu_fetchunit *fu,
+				     unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_fu_read(fu, offset);
+	tmp &= ~mask;
+	dpu_fu_write(fu, offset, tmp | value);
+}
+
+void dpu_fu_get_pixel_format_bits(struct dpu_fetchunit *fu,
+				  u32 format, u32 *bits);
+void dpu_fu_get_pixel_format_shifts(struct dpu_fetchunit *fu,
+				    u32 format, u32 *shifts);
+void dpu_fu_shdldreq_sticky(struct dpu_fetchunit *fu, u8 layer_mask);
+void dpu_fu_set_src_bpp(struct dpu_fetchunit *fu, unsigned int bpp);
+void
+dpu_fu_set_src_buf_dimensions_no_deinterlace(struct dpu_fetchunit *fu,
+					unsigned int w, unsigned int h,
+					const struct drm_format_info *unused1,
+					bool unused2);
+void dpu_fu_common_hw_init(struct dpu_fetchunit *fu);
+int dpu_fu_attach_dprc(struct dpu_fetchunit *fu);
+
+#endif /* __DPU_FETCHUNIT_H__ */
diff --git a/drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c b/drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c
new file mode 100644
index 000000000000..2fabd999ac8d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2018-2020,2022 NXP
+ */
+
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu.h"
+#include "dpu-fetchunit.h"
+#include "dpu-prv.h"
+
+#define FRAMEDIMENSIONS		0x150
+#define FRAMERESAMPLING		0x154
+#define WARPCONTROL		0x158
+#define ARBSTARTX		0x15c
+#define ARBSTARTY		0x160
+#define ARBDELTA		0x164
+#define FIRPOSITIONS		0x168
+#define FIRCOEFFICIENTS		0x16c
+#define CONTROL			0x170
+#define TRIGGERENABLE		0x174
+#define CONTROLTRIGGER		0x178
+#define START			0x17c
+#define FETCHTYPE		0x180
+#define BURSTBUFFERPROPERTIES	0x184
+#define STATUS			0x188
+#define HIDDENSTATUS		0x18c
+
+static const enum dpu_link_id dpu_fw_link_id[] = {
+	LINK_ID_FETCHWARP2, LINK_ID_FETCHWARP9
+};
+
+static const enum dpu_link_id fw_srcs[2][2] = {
+	{
+		LINK_ID_NONE,
+		LINK_ID_FETCHECO2,
+	}, {
+		LINK_ID_NONE,
+		LINK_ID_FETCHECO9,
+	},
+};
+
+static void dpu_fw_pec_dynamic_src_sel(struct dpu_fetchunit *fu,
+				       enum dpu_link_id src)
+{
+	struct dpu_soc *dpu = fu->dpu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(fw_srcs[fu->index]); i++) {
+		if (fw_srcs[fu->index][i] == src) {
+			dpu_pec_fu_write(fu, PIXENGCFG_DYNAMIC, src);
+			return;
+		}
+	}
+
+	dev_err(dpu->dev, "%s - invalid source 0x%02x\n", fu->name, src);
+}
+
+static void dpu_fw_set_fmt(struct dpu_fetchunit *fu,
+			   const struct drm_format_info *format,
+			   enum drm_color_encoding color_encoding,
+			   enum drm_color_range color_range,
+			   bool unused)
+{
+	u32 val, bits = 0, shifts = 0;
+	bool is_planar_yuv = false, is_rastermode_yuv422 = false;
+	bool is_inputselect_compact = false;
+	unsigned int bpp;
+
+	switch (format->format) {
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		is_planar_yuv = true;
+		is_rastermode_yuv422 = true;
+		is_inputselect_compact = true;
+		bpp = format->cpp[0] * 8;
+		break;
+	default:
+		bpp = format->cpp[0] * 8;
+		break;
+	}
+
+	dpu_fu_set_src_bpp(fu, bpp);
+
+	val = dpu_fu_read(fu, CONTROL);
+	val &= ~INPUTSELECT_MASK;
+	val &= ~RASTERMODE_MASK;
+	if (is_inputselect_compact)
+		val |= INPUTSELECT(INPUTSELECT_COMPPACK);
+	else
+		val |= INPUTSELECT(INPUTSELECT_INACTIVE);
+	if (is_rastermode_yuv422)
+		val |= RASTERMODE(RASTERMODE_YUV422);
+	else
+		val |= RASTERMODE(RASTERMODE_NORMAL);
+	dpu_fu_write(fu, CONTROL, val);
+
+	val = dpu_fu_read(fu, LAYERPROPERTY(fu));
+	val &= ~YUVCONVERSIONMODE_MASK;
+	if (format->is_yuv) {
+		if (color_encoding == DRM_COLOR_YCBCR_BT709)
+			val |= YUVCONVERSIONMODE(YUVCONVERSIONMODE_ITU709);
+		else if (color_encoding == DRM_COLOR_YCBCR_BT601 &&
+			 color_range == DRM_COLOR_YCBCR_FULL_RANGE)
+			val |= YUVCONVERSIONMODE(YUVCONVERSIONMODE_ITU601_FR);
+		else
+			val |= YUVCONVERSIONMODE(YUVCONVERSIONMODE_ITU601);
+	} else {
+		val |= YUVCONVERSIONMODE(YUVCONVERSIONMODE_OFF);
+	}
+	dpu_fu_write(fu, LAYERPROPERTY(fu), val);
+
+	dpu_fu_get_pixel_format_bits(fu, format->format, &bits);
+	dpu_fu_get_pixel_format_shifts(fu, format->format, &shifts);
+
+	if (is_planar_yuv) {
+		bits &= ~(U_BITS_MASK | V_BITS_MASK);
+		shifts &= ~(U_SHIFT_MASK | V_SHIFT_MASK);
+	}
+
+	dpu_fu_write(fu, COLORCOMPONENTBITS(fu), bits);
+	dpu_fu_write(fu, COLORCOMPONENTSHIFT(fu), shifts);
+}
+
+static void
+dpu_fw_set_framedimensions(struct dpu_fetchunit *fu,
+			   unsigned int w, unsigned int h, bool unused)
+{
+	dpu_fu_write(fu, FRAMEDIMENSIONS, FRAMEWIDTH(w) | FRAMEHEIGHT(h));
+}
+
+static void dpu_fw_set_ops(struct dpu_fetchunit *fu)
+{
+	memcpy(&fu->ops, &dpu_fu_common_ops, sizeof(dpu_fu_common_ops));
+	fu->ops.set_pec_dynamic_src_sel = dpu_fw_pec_dynamic_src_sel;
+	fu->ops.set_src_buf_dimensions =
+				dpu_fu_set_src_buf_dimensions_no_deinterlace;
+	fu->ops.set_fmt			= dpu_fw_set_fmt;
+	fu->ops.set_framedimensions	= dpu_fw_set_framedimensions;
+}
+
+struct dpu_fetchunit *dpu_fw_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_fetchunit *fu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->fw_priv); i++) {
+		fu = dpu->fw_priv[i];
+		if (fu->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->fw_priv))
+		return ERR_PTR(-EINVAL);
+
+	fu->fe = dpu_fe_get(dpu, id);
+	if (IS_ERR(fu->fe))
+		return ERR_CAST(fu->fe);
+
+	if (fu->type == DPU_BLIT) {
+		fu->hs = dpu_hs_get(dpu, id);
+		if (IS_ERR(fu->hs))
+			return ERR_CAST(fu->hs);
+
+		fu->vs = dpu_vs_get(dpu, id);
+		if (IS_ERR(fu->vs))
+			return ERR_CAST(fu->vs);
+	}
+
+	mutex_lock(&fu->mutex);
+
+	if (fu->inuse) {
+		mutex_unlock(&fu->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	fu->inuse = true;
+
+	mutex_unlock(&fu->mutex);
+
+	return fu;
+}
+
+void dpu_fw_put(struct dpu_fetchunit *fu)
+{
+	if (IS_ERR_OR_NULL(fu))
+		return;
+
+	mutex_lock(&fu->mutex);
+
+	fu->inuse = false;
+
+	mutex_unlock(&fu->mutex);
+}
+
+void dpu_fw_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	struct dpu_fetchunit *fu = dpu->fw_priv[index];
+
+	fu->ops.set_pec_dynamic_src_sel(fu, LINK_ID_NONE);
+	dpu_fu_common_hw_init(fu);
+	dpu_fu_shdldreq_sticky(fu, 0xff);
+}
+
+int dpu_fw_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base)
+{
+	struct dpu_fetchunit *fu;
+	int ret;
+
+	fu = devm_kzalloc(dpu->dev, sizeof(*fu), GFP_KERNEL);
+	if (!fu)
+		return -ENOMEM;
+
+	dpu->fw_priv[index] = fu;
+
+	fu->pec_base = devm_ioremap(dpu->dev, pec_base, SZ_16);
+	if (!fu->pec_base)
+		return -ENOMEM;
+
+	fu->base = devm_ioremap(dpu->dev, base, SZ_512);
+	if (!fu->base)
+		return -ENOMEM;
+
+	fu->dpu = dpu;
+	fu->id = id;
+	fu->index = index;
+	fu->type = type;
+	fu->sub_id = 0;
+	fu->link_id = dpu_fw_link_id[index];
+	fu->cap_mask = DPU_FETCHUNIT_CAP_USE_FETCHECO;
+	snprintf(fu->name, sizeof(fu->name), "FetchWarp%u", id);
+
+	ret = dpu_fu_attach_dprc(fu);
+	if (ret) {
+		dev_err_probe(dpu->dev, ret, "%s - failed to attach DPRC\n",
+			      fu->name);
+		return ret;
+	}
+
+	dpu_fw_set_ops(fu);
+
+	mutex_init(&fu->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-framegen.c b/drivers/gpu/drm/imx/dpu/dpu-framegen.c
new file mode 100644
index 000000000000..037a8a0e276d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-framegen.c
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu.h"
+#include "dpu-prv.h"
+
+#define FGSTCTRL		0x8
+#define  FGSYNCMODE_MASK	0x6
+#define  FGSYNCMODE(n)		((n) << 6)
+
+#define HTCFG1			0xc
+#define  HTOTAL(n)		((((n) - 1) & 0x3fff) << 16)
+#define  HACT(n)		((n) & 0x3fff)
+
+#define HTCFG2			0x10
+#define  HSEN			BIT(31)
+#define  HSBP(n)		((((n) - 1) & 0x3fff) << 16)
+#define  HSYNC(n)		(((n) - 1) & 0x3fff)
+
+#define VTCFG1			0x14
+#define  VTOTAL(n)		((((n) - 1) & 0x3fff) << 16)
+#define  VACT(n)		((n) & 0x3fff)
+
+#define VTCFG2			0x18
+#define  VSEN			BIT(31)
+#define  VSBP(n)		((((n) - 1) & 0x3fff) << 16)
+#define  VSYNC(n)		(((n) - 1) & 0x3fff)
+
+#define INTCONFIG(n)		(0x1c + 4 * (n))
+#define  EN			BIT(31)
+#define  ROW(n)			(((n) & 0x3fff) << 16)
+#define  COL(n)			((n) & 0x3fff)
+
+#define PKICKCONFIG		0x2c
+#define SKICKCONFIG		0x30
+#define SECSTATCONFIG		0x34
+#define FGSRCR1			0x38
+#define FGSRCR2			0x3c
+#define FGSRCR3			0x40
+#define FGSRCR4			0x44
+#define FGSRCR5			0x48
+#define FGSRCR6			0x4c
+#define FGKSDR			0x50
+
+#define PACFG			0x54
+#define SACFG			0x58
+#define  STARTX(n)		(((n) + 1) & 0x3fff)
+#define  STARTY(n)		(((((n) + 1) & 0x3fff)) << 16)
+
+#define FGINCTRL		0x5c
+#define FGINCTRLPANIC		0x60
+#define  FGDM_MASK		0x7
+#define  ENPRIMALPHA		BIT(3)
+#define  ENSECALPHA		BIT(4)
+
+#define FGCCR			0x64
+#define  CCALPHA(a)		(((a) & 0x1) << 30)
+#define  CCRED(r)		(((r) & 0x3ff) << 20)
+#define  CCGREEN(g)		(((g) & 0x3ff) << 10)
+#define  CCBLUE(b)		((b) & 0x3ff)
+
+#define FGENABLE		0x68
+#define  FGEN			BIT(0)
+
+#define FGSLR			0x6c
+#define  SHDTOKGEN		BIT(0)
+
+#define FGENSTS			0x70
+#define  ENSTS			BIT(0)
+
+#define FGTIMESTAMP		0x74
+#define  FRAMEINDEX_SHIFT	14
+#define  FRAMEINDEX_MASK	(DPU_FRAMEGEN_MAX_FRAME_INDEX << \
+				 FRAMEINDEX_SHIFT)
+#define  LINEINDEX_MASK		0x3fff
+
+#define FGCHSTAT		0x78
+#define  SECSYNCSTAT		BIT(24)
+#define  SFIFOEMPTY		BIT(16)
+
+#define FGCHSTATCLR		0x7c
+#define  CLRSECSTAT		BIT(16)
+
+#define FGSKEWMON		0x80
+#define FGSFIFOMIN		0x84
+#define FGSFIFOMAX		0x88
+#define FGSFIFOFILLCLR		0x8c
+#define FGSREPD			0x90
+#define FGSRFTD			0x94
+
+#define KHZ			1000
+#define MIN_PLL_RATE		648000000	/* assume 648MHz */
+
+struct dpu_framegen {
+	void __iomem *base;
+	struct clk *clk_pll;
+	struct clk *clk_disp;
+	struct mutex mutex;
+	unsigned int id;
+	unsigned int index;
+	bool inuse;
+	struct dpu_soc *dpu;
+};
+
+static inline u32 dpu_fg_read(struct dpu_framegen *fg, unsigned int offset)
+{
+	return readl(fg->base + offset);
+}
+
+static inline void dpu_fg_write(struct dpu_framegen *fg,
+				unsigned int offset, u32 value)
+{
+	writel(value, fg->base + offset);
+}
+
+static inline void dpu_fg_write_mask(struct dpu_framegen *fg,
+				     unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_fg_read(fg, offset);
+	tmp &= ~mask;
+	dpu_fg_write(fg, offset, tmp | value);
+}
+
+static void dpu_fg_enable_shden(struct dpu_framegen *fg)
+{
+	dpu_fg_write_mask(fg, FGSTCTRL, SHDEN, SHDEN);
+}
+
+void dpu_fg_syncmode(struct dpu_framegen *fg, enum dpu_fg_syncmode mode)
+{
+	dpu_fg_write_mask(fg, FGSTCTRL, FGSYNCMODE_MASK, FGSYNCMODE(mode));
+}
+
+void dpu_fg_cfg_videomode(struct dpu_framegen *fg, struct drm_display_mode *m)
+{
+	u32 hact, htotal, hsync, hsbp;
+	u32 vact, vtotal, vsync, vsbp;
+	u32 kick_row, kick_col;
+	unsigned long pclk_rate, pll_rate = 0;
+	int div = 0;
+
+	hact = m->crtc_hdisplay;
+	htotal = m->crtc_htotal;
+	hsync = m->crtc_hsync_end - m->crtc_hsync_start;
+	hsbp = m->crtc_htotal - m->crtc_hsync_start;
+
+	vact = m->crtc_vdisplay;
+	vtotal = m->crtc_vtotal;
+	vsync = m->crtc_vsync_end - m->crtc_vsync_start;
+	vsbp = m->crtc_vtotal - m->crtc_vsync_start;
+
+	/* video mode */
+	dpu_fg_write(fg, HTCFG1, HACT(hact)   | HTOTAL(htotal));
+	dpu_fg_write(fg, HTCFG2, HSYNC(hsync) | HSBP(hsbp) | HSEN);
+	dpu_fg_write(fg, VTCFG1, VACT(vact)   | VTOTAL(vtotal));
+	dpu_fg_write(fg, VTCFG2, VSYNC(vsync) | VSBP(vsbp) | VSEN);
+
+	kick_col = hact + 1;
+	kick_row = vact;
+
+	/* pkickconfig */
+	dpu_fg_write(fg, PKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* skikconfig */
+	dpu_fg_write(fg, SKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* primary and secondary area position configuration */
+	dpu_fg_write(fg, PACFG, STARTX(0) | STARTY(0));
+	dpu_fg_write(fg, SACFG, STARTX(0) | STARTY(0));
+
+	/* alpha */
+	dpu_fg_write_mask(fg, FGINCTRL,      ENPRIMALPHA | ENSECALPHA, 0);
+	dpu_fg_write_mask(fg, FGINCTRLPANIC, ENPRIMALPHA | ENSECALPHA, 0);
+
+	/* constant color is green(used in panic mode)  */
+	dpu_fg_write(fg, FGCCR, CCGREEN(0x3ff));
+
+	clk_set_parent(fg->clk_disp, fg->clk_pll);
+
+	pclk_rate = m->clock * KHZ;
+
+	/* find a minimal even divider for PLL */
+	do {
+		div += 2;
+		pll_rate = pclk_rate * div;
+	} while (pll_rate < MIN_PLL_RATE);
+
+	clk_set_rate(fg->clk_pll, pll_rate);
+	clk_set_rate(fg->clk_disp, pclk_rate);
+}
+
+void dpu_fg_displaymode(struct dpu_framegen *fg, enum dpu_fg_dm mode)
+{
+	dpu_fg_write_mask(fg, FGINCTRL, FGDM_MASK, mode);
+}
+
+void dpu_fg_panic_displaymode(struct dpu_framegen *fg, enum dpu_fg_dm mode)
+{
+	dpu_fg_write_mask(fg, FGINCTRLPANIC, FGDM_MASK, mode);
+}
+
+void dpu_fg_enable(struct dpu_framegen *fg)
+{
+	dpu_fg_write(fg, FGENABLE, FGEN);
+}
+
+void dpu_fg_disable(struct dpu_framegen *fg)
+{
+	dpu_fg_write(fg, FGENABLE, 0);
+}
+
+void dpu_fg_shdtokgen(struct dpu_framegen *fg)
+{
+	dpu_fg_write(fg, FGSLR, SHDTOKGEN);
+}
+
+u32 dpu_fg_get_frame_index(struct dpu_framegen *fg)
+{
+	u32 val = dpu_fg_read(fg, FGTIMESTAMP);
+
+	return (val & FRAMEINDEX_MASK) >> FRAMEINDEX_SHIFT;
+}
+
+int dpu_fg_get_line_index(struct dpu_framegen *fg)
+{
+	u32 val = dpu_fg_read(fg, FGTIMESTAMP);
+
+	return val & LINEINDEX_MASK;
+}
+
+int dpu_fg_wait_for_frame_counter_moving(struct dpu_framegen *fg)
+{
+	u32 frame_index, last_frame_index;
+	unsigned long timeout = jiffies + msecs_to_jiffies(100);
+
+	frame_index = dpu_fg_get_frame_index(fg);
+	do {
+		last_frame_index = frame_index;
+		frame_index = dpu_fg_get_frame_index(fg);
+	} while (last_frame_index == frame_index &&
+						time_before(jiffies, timeout));
+
+	if (last_frame_index == frame_index) {
+		dev_dbg(fg->dpu->dev,
+			"failed to wait for FrameGen%d frame counter moving\n",
+			fg->id);
+		return -ETIMEDOUT;
+	}
+
+	dev_dbg(fg->dpu->dev,
+		"FrameGen%d frame counter moves - last %u, curr %d\n",
+					fg->id, last_frame_index, frame_index);
+	return 0;
+}
+
+bool dpu_fg_secondary_requests_to_read_empty_fifo(struct dpu_framegen *fg)
+{
+	u32 val;
+
+	val = dpu_fg_read(fg, FGCHSTAT);
+
+	return !!(val & SFIFOEMPTY);
+}
+
+void dpu_fg_secondary_clear_channel_status(struct dpu_framegen *fg)
+{
+	dpu_fg_write(fg, FGCHSTATCLR, CLRSECSTAT);
+}
+
+int dpu_fg_wait_for_secondary_syncup(struct dpu_framegen *fg)
+{
+	u32 val;
+	int ret;
+
+	ret = readl_poll_timeout(fg->base + FGCHSTAT, val,
+				 val & SECSYNCSTAT, 5, 100000);
+	if (ret) {
+		dev_dbg(fg->dpu->dev,
+			"failed to wait for FrameGen%u secondary syncup\n",
+								fg->id);
+		return -ETIMEDOUT;
+	}
+
+	dev_dbg(fg->dpu->dev, "FrameGen%u secondary syncup\n", fg->id);
+
+	return 0;
+}
+
+void dpu_fg_enable_clock(struct dpu_framegen *fg)
+{
+	clk_prepare_enable(fg->clk_pll);
+	clk_prepare_enable(fg->clk_disp);
+}
+
+void dpu_fg_disable_clock(struct dpu_framegen *fg)
+{
+	clk_disable_unprepare(fg->clk_disp);
+	clk_disable_unprepare(fg->clk_pll);
+}
+
+struct dpu_framegen *dpu_fg_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_framegen *fg;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->fg_priv); i++) {
+		fg = dpu->fg_priv[i];
+		if (fg->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->fg_priv))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&fg->mutex);
+
+	if (fg->inuse) {
+		mutex_unlock(&fg->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	fg->inuse = true;
+
+	mutex_unlock(&fg->mutex);
+
+	return fg;
+}
+
+void dpu_fg_put(struct dpu_framegen *fg)
+{
+	if (IS_ERR_OR_NULL(fg))
+		return;
+
+	mutex_lock(&fg->mutex);
+
+	fg->inuse = false;
+
+	mutex_unlock(&fg->mutex);
+}
+
+void dpu_fg_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	struct dpu_framegen *fg = dpu->fg_priv[index];
+
+	dpu_fg_enable_shden(fg);
+	dpu_fg_syncmode(fg, FG_SYNCMODE_OFF);
+}
+
+int dpu_fg_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long unused, unsigned long base)
+{
+	struct dpu_framegen *fg;
+
+	fg = devm_kzalloc(dpu->dev, sizeof(*fg), GFP_KERNEL);
+	if (!fg)
+		return -ENOMEM;
+
+	dpu->fg_priv[index] = fg;
+
+	fg->base = devm_ioremap(dpu->dev, base, SZ_256);
+	if (!fg->base)
+		return -ENOMEM;
+
+	fg->clk_pll = devm_clk_get(dpu->dev, id ? "pll1" : "pll0");
+	if (IS_ERR(fg->clk_pll))
+		return PTR_ERR(fg->clk_pll);
+
+	fg->clk_disp = devm_clk_get(dpu->dev, id ? "disp1" : "disp0");
+	if (IS_ERR(fg->clk_disp))
+		return PTR_ERR(fg->clk_disp);
+
+	fg->dpu = dpu;
+	fg->id = id;
+	fg->index = index;
+
+	mutex_init(&fg->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-gammacor.c b/drivers/gpu/drm/imx/dpu/dpu-gammacor.c
new file mode 100644
index 000000000000..d91da5d14bcf
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-gammacor.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2020,2022 NXP
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu.h"
+#include "dpu-prv.h"
+
+#define STATICCONTROL		0x8
+#define  BLUEWRITEENABLE	BIT(1)
+#define  GREENWRITEENABLE	BIT(2)
+#define  REDWRITEENABLE		BIT(3)
+#define  COLORWRITEENABLE	(REDWRITEENABLE |	\
+				 GREENWRITEENABLE |	\
+				 BLUEWRITEENABLE)
+
+#define LUTSTART		0xc
+#define  STARTBLUE(n)		((n) & 0x3ff)
+#define  STARTGREEN(n)		(((n) & 0x3ff) << 10)
+#define  STARTRED(n)		(((n) & 0x3ff) << 20)
+
+#define LUTDELTAS		0x10
+#define  DELTABLUE(n)		((n) & 0x3ff)
+#define  DELTAGREEN(n)		(((n) & 0x3ff) << 10)
+#define  DELTARED(n)		(((n) & 0x3ff) << 20)
+
+#define CONTROL			0x14
+#define  CTRL_MODE_MASK		BIT(0)
+#define  ALHPAMASK		BIT(4)
+#define  ALHPAINVERT		BIT(5)
+
+/* 16-bit to 10-bit */
+#define GAMMACOR_COL_CONVERT(n)	(((n) * 0x3ff) / 0xffff)
+
+struct dpu_gammacor {
+	void __iomem *base;
+	struct mutex mutex;
+	unsigned int id;
+	unsigned int index;
+	bool inuse;
+	struct dpu_soc *dpu;
+};
+
+static inline u32 dpu_gc_read(struct dpu_gammacor *gc, unsigned int offset)
+{
+	return readl(gc->base + offset);
+}
+
+static inline void dpu_gc_write(struct dpu_gammacor *gc,
+				unsigned int offset, u32 value)
+{
+	writel(value, gc->base + offset);
+}
+
+static inline void dpu_gc_write_mask(struct dpu_gammacor *gc,
+				     unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_gc_read(gc, offset);
+	tmp &= ~mask;
+	dpu_gc_write(gc, offset, tmp | value);
+}
+
+static void dpu_gc_enable_shden(struct dpu_gammacor *gc)
+{
+	dpu_gc_write_mask(gc, STATICCONTROL, SHDEN, SHDEN);
+}
+
+void dpu_gc_enable_rgb_write(struct dpu_gammacor *gc)
+{
+	dpu_gc_write_mask(gc, STATICCONTROL, COLORWRITEENABLE, COLORWRITEENABLE);
+}
+
+void dpu_gc_disable_rgb_write(struct dpu_gammacor *gc)
+{
+	dpu_gc_write_mask(gc, STATICCONTROL, COLORWRITEENABLE, 0);
+}
+
+static inline void
+dpu_gc_sample_point_color_convert(u32 *red, u32 *green, u32 *blue)
+{
+	*red   = GAMMACOR_COL_CONVERT(*red);
+	*green = GAMMACOR_COL_CONVERT(*green);
+	*blue  = GAMMACOR_COL_CONVERT(*blue);
+}
+
+void dpu_gc_start_rgb(struct dpu_gammacor *gc, const struct drm_color_lut *lut)
+{
+	struct dpu_soc *dpu = gc->dpu;
+	u32 r = lut[0].red, g = lut[0].green, b = lut[0].blue;
+
+	dpu_gc_sample_point_color_convert(&r, &g, &b);
+
+	dpu_gc_write(gc, LUTSTART, STARTRED(r) | STARTGREEN(g) | STARTBLUE(b));
+
+	dev_dbg(dpu->dev, "GammaCor%u LUT start:\t r-0x%03x g-0x%03x b-0x%03x\n",
+		gc->id, r, g, b);
+}
+
+void dpu_gc_delta_rgb(struct dpu_gammacor *gc, const struct drm_color_lut *lut)
+{
+	struct dpu_soc *dpu = gc->dpu;
+	int i, curr, next;
+	u32 dr, dg, db;
+
+	/* The first delta value is zero. */
+	dpu_gc_write(gc, LUTDELTAS, DELTARED(0) | DELTAGREEN(0) | DELTABLUE(0));
+
+	/*
+	 * Assuming gamma_size = 256, we get additional 32 delta
+	 * values for every 8 sample points, so 33 delta values for
+	 * 33 sample points in total as the GammaCor unit requires.
+	 * A curve with 10-bit resolution will be generated in the
+	 * GammaCor unit internally by a linear interpolation in-between
+	 * the sample points.  Note that the last value in the lookup
+	 * table is lut[255].
+	 */
+	for (i = 0; i < 32; i++) {
+		curr = i * 8;
+		next = curr + 8;
+
+		if (next == 256)
+			next--;
+
+		dr = lut[next].red   - lut[curr].red;
+		dg = lut[next].green - lut[curr].green;
+		db = lut[next].blue  - lut[curr].blue;
+
+		dpu_gc_sample_point_color_convert(&dr, &dg, &db);
+
+		dpu_gc_write(gc, LUTDELTAS,
+			     DELTARED(dr) | DELTAGREEN(dg) | DELTABLUE(db));
+
+		dev_dbg(dpu->dev,
+			"GammaCor%u delta[%d]:\t r-0x%03x g-0x%03x b-0x%03x\n",
+						gc->id, i + 1, dr, dg, db);
+	}
+}
+
+void dpu_gc_mode(struct dpu_gammacor *gc, enum dpu_gc_mode mode)
+{
+	dpu_gc_write_mask(gc, CONTROL, CTRL_MODE_MASK, mode);
+}
+
+struct dpu_gammacor *dpu_gc_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_gammacor *gc;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->gc_priv); i++) {
+		gc = dpu->gc_priv[i];
+		if (gc->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->gc_priv))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&gc->mutex);
+
+	if (gc->inuse) {
+		mutex_unlock(&gc->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	gc->inuse = true;
+
+	mutex_unlock(&gc->mutex);
+
+	return gc;
+}
+
+void dpu_gc_put(struct dpu_gammacor *gc)
+{
+	if (IS_ERR_OR_NULL(gc))
+		return;
+
+	mutex_lock(&gc->mutex);
+
+	gc->inuse = false;
+
+	mutex_unlock(&gc->mutex);
+}
+
+void dpu_gc_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	struct dpu_gammacor *gc = dpu->gc_priv[index];
+
+	dpu_gc_write(gc, CONTROL, 0);
+	dpu_gc_enable_shden(gc);
+}
+
+int dpu_gc_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long unused, unsigned long base)
+{
+	struct dpu_gammacor *gc;
+
+	gc = devm_kzalloc(dpu->dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
+
+	dpu->gc_priv[index] = gc;
+
+	gc->base = devm_ioremap(dpu->dev, base, SZ_32);
+	if (!gc->base)
+		return -ENOMEM;
+
+	gc->dpu = dpu;
+	gc->id = id;
+	gc->index = index;
+
+	mutex_init(&gc->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-hscaler.c b/drivers/gpu/drm/imx/dpu/dpu-hscaler.c
new file mode 100644
index 000000000000..5c0ec98dafca
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-hscaler.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu.h"
+#include "dpu-prv.h"
+
+#define PIXENGCFG_DYNAMIC		0x8
+#define  PIXENGCFG_DYNAMIC_SRC_SEL_MASK	0x3f
+
+#define STATICCONTROL			0x8
+#define SETUP1				0xc
+#define SETUP2				0x10
+
+#define CONTROL				0x14
+#define  CTRL_MODE_MASK			BIT(0)
+
+struct dpu_hscaler {
+	void __iomem *pec_base;
+	void __iomem *base;
+	struct mutex mutex;
+	unsigned int id;
+	unsigned int index;
+	enum dpu_link_id link_id;
+	bool inuse;
+	struct dpu_soc *dpu;
+};
+
+static const enum dpu_link_id dpu_hs_link_id[] = {
+	LINK_ID_HSCALER4, LINK_ID_HSCALER5, LINK_ID_HSCALER9
+};
+
+static const enum dpu_link_id src_sels[3][4] = {
+	{
+		LINK_ID_NONE,
+		LINK_ID_FETCHDECODE0,
+		LINK_ID_MATRIX4,
+		LINK_ID_VSCALER4,
+	}, {
+		LINK_ID_NONE,
+		LINK_ID_FETCHDECODE1,
+		LINK_ID_MATRIX5,
+		LINK_ID_VSCALER5,
+	}, {
+		LINK_ID_NONE,
+		LINK_ID_MATRIX9,
+		LINK_ID_VSCALER9,
+		LINK_ID_FILTER9,
+	},
+};
+
+static inline u32 dpu_pec_hs_read(struct dpu_hscaler *hs,
+				  unsigned int offset)
+{
+	return readl(hs->pec_base + offset);
+}
+
+static inline void dpu_pec_hs_write(struct dpu_hscaler *hs,
+				    unsigned int offset, u32 value)
+{
+	writel(value, hs->pec_base + offset);
+}
+
+static inline void dpu_pec_hs_write_mask(struct dpu_hscaler *hs,
+					 unsigned int offset,
+					 u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_pec_hs_read(hs, offset);
+	tmp &= ~mask;
+	dpu_pec_hs_write(hs, offset, tmp | value);
+}
+
+static inline u32 dpu_hs_read(struct dpu_hscaler *hs, unsigned int offset)
+{
+	return readl(hs->base + offset);
+}
+
+static inline void dpu_hs_write(struct dpu_hscaler *hs,
+				unsigned int offset, u32 value)
+{
+	writel(value, hs->base + offset);
+}
+
+static inline void dpu_hs_write_mask(struct dpu_hscaler *hs,
+				     unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_hs_read(hs, offset);
+	tmp &= ~mask;
+	dpu_hs_write(hs, offset, tmp | value);
+}
+
+enum dpu_link_id dpu_hs_get_link_id(struct dpu_hscaler *hs)
+{
+	return hs->link_id;
+}
+
+void dpu_hs_pec_dynamic_src_sel(struct dpu_hscaler *hs, enum dpu_link_id src)
+{
+	struct dpu_soc *dpu = hs->dpu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(src_sels[hs->index]); i++) {
+		if (src_sels[hs->index][i] == src) {
+			dpu_pec_hs_write_mask(hs, PIXENGCFG_DYNAMIC,
+					      PIXENGCFG_DYNAMIC_SRC_SEL_MASK,
+					      src);
+			return;
+		}
+	}
+
+	dev_err(dpu->dev, "HScaler%u - invalid source 0x%02x\n", hs->id, src);
+}
+
+void dpu_hs_pec_clken(struct dpu_hscaler *hs, enum dpu_pec_clken clken)
+{
+	dpu_pec_hs_write_mask(hs, PIXENGCFG_DYNAMIC, CLKEN_MASK, CLKEN(clken));
+}
+
+static void dpu_hs_enable_shden(struct dpu_hscaler *hs)
+{
+	dpu_hs_write_mask(hs, STATICCONTROL, SHDEN, SHDEN);
+}
+
+void dpu_hs_setup1(struct dpu_hscaler *hs,
+		   unsigned int src_w, unsigned int dst_w)
+{
+	struct dpu_soc *dpu = hs->dpu;
+	u32 scale_factor;
+	u64 tmp64;
+
+	if (src_w == dst_w) {
+		scale_factor = 0x80000;
+	} else {
+		if (src_w > dst_w) {
+			tmp64 = (u64)((u64)dst_w * 0x80000);
+			do_div(tmp64, src_w);
+
+		} else {
+			tmp64 = (u64)((u64)src_w * 0x80000);
+			do_div(tmp64, dst_w);
+		}
+		scale_factor = (u32)tmp64;
+	}
+
+	if (scale_factor > 0x80000) {
+		dev_err(dpu->dev, "HScaler%u - invalid scale factor 0x%08x\n",
+			hs->id, scale_factor);
+		return;
+	}
+
+	dpu_hs_write(hs, SETUP1, SCALE_FACTOR(scale_factor));
+
+	dev_dbg(dpu->dev, "HScaler%u - scale factor 0x%08x\n",
+		hs->id, scale_factor);
+}
+
+void dpu_hs_setup2(struct dpu_hscaler *hs, u32 phase_offset)
+{
+	dpu_hs_write(hs, SETUP2, PHASE_OFFSET(phase_offset));
+}
+
+void dpu_hs_output_size(struct dpu_hscaler *hs, u32 line_num)
+{
+	dpu_hs_write_mask(hs, CONTROL, OUTPUT_SIZE_MASK, OUTPUT_SIZE(line_num));
+}
+
+void dpu_hs_filter_mode(struct dpu_hscaler *hs, enum dpu_scaler_filter_mode m)
+{
+	dpu_hs_write_mask(hs, CONTROL, FILTER_MODE_MASK, FILTER_MODE(m));
+}
+
+void dpu_hs_scale_mode(struct dpu_hscaler *hs, enum dpu_scaler_scale_mode m)
+{
+	dpu_hs_write_mask(hs, CONTROL, SCALE_MODE_MASK, SCALE_MODE(m));
+}
+
+void dpu_hs_mode(struct dpu_hscaler *hs, enum dpu_scaler_mode m)
+{
+	dpu_hs_write_mask(hs, CONTROL, CTRL_MODE_MASK, m);
+}
+
+unsigned int dpu_hs_get_id(struct dpu_hscaler *hs)
+{
+	return hs->id;
+}
+
+struct dpu_hscaler *dpu_hs_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_hscaler *hs;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->hs_priv); i++) {
+		hs = dpu->hs_priv[i];
+		if (hs->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->hs_priv))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&hs->mutex);
+
+	if (hs->inuse) {
+		mutex_unlock(&hs->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	hs->inuse = true;
+
+	mutex_unlock(&hs->mutex);
+
+	return hs;
+}
+
+void dpu_hs_put(struct dpu_hscaler *hs)
+{
+	if (IS_ERR_OR_NULL(hs))
+		return;
+
+	mutex_lock(&hs->mutex);
+
+	hs->inuse = false;
+
+	mutex_unlock(&hs->mutex);
+}
+
+void dpu_hs_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	struct dpu_hscaler *hs = dpu->hs_priv[index];
+
+	dpu_hs_enable_shden(hs);
+	dpu_hs_setup2(hs, 0);
+	dpu_hs_pec_dynamic_src_sel(hs, LINK_ID_NONE);
+}
+
+int dpu_hs_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base)
+{
+	struct dpu_hscaler *hs;
+
+	hs = devm_kzalloc(dpu->dev, sizeof(*hs), GFP_KERNEL);
+	if (!hs)
+		return -ENOMEM;
+
+	dpu->hs_priv[index] = hs;
+
+	hs->pec_base = devm_ioremap(dpu->dev, pec_base, SZ_16);
+	if (!hs->pec_base)
+		return -ENOMEM;
+
+	hs->base = devm_ioremap(dpu->dev, base, SZ_32);
+	if (!hs->base)
+		return -ENOMEM;
+
+	hs->dpu = dpu;
+	hs->id = id;
+	hs->index = index;
+	hs->link_id = dpu_hs_link_id[index];
+
+	mutex_init(&hs->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-kms.c b/drivers/gpu/drm/imx/dpu/dpu-kms.c
new file mode 100644
index 000000000000..01adce9be0fa
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-kms.c
@@ -0,0 +1,540 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/list.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/slab.h>
+#include <linux/sort.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "dpu.h"
+#include "dpu-crtc.h"
+#include "dpu-drv.h"
+#include "dpu-kms.h"
+#include "dpu-plane.h"
+
+static int zpos_cmp(const void *a, const void *b)
+{
+	const struct drm_plane_state *sa = *(struct drm_plane_state **)a;
+	const struct drm_plane_state *sb = *(struct drm_plane_state **)b;
+
+	return sa->normalized_zpos - sb->normalized_zpos;
+}
+
+static int dpu_atomic_sort_planes_per_crtc(struct drm_crtc_state *crtc_state,
+					   struct drm_plane_state **plane_states)
+{
+	struct drm_atomic_state *state = crtc_state->state;
+	struct drm_plane *plane;
+	int n = 0;
+
+	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
+		struct drm_plane_state *plane_state =
+			drm_atomic_get_plane_state(state, plane);
+		if (IS_ERR(plane_state))
+			return PTR_ERR(plane_state);
+		plane_states[n++] = plane_state;
+	}
+
+	sort(plane_states, n, sizeof(*plane_states), zpos_cmp, NULL);
+
+	return n;
+}
+
+static void
+dpu_atomic_set_top_plane_per_crtc(struct drm_plane_state **plane_states, int n)
+{
+	struct dpu_plane_state *dpstate;
+	int i;
+
+	for (i = 0; i < n; i++) {
+		dpstate = to_dpu_plane_state(plane_states[i]);
+		dpstate->is_top = (i == (n - 1)) ? true : false;
+	}
+}
+
+static int
+dpu_atomic_assign_plane_source_per_crtc(struct dpu_crtc *dpu_crtc,
+					struct drm_plane_state **plane_states,
+					int n, bool use_current_source)
+{
+	struct drm_plane_state *plane_state;
+	struct dpu_plane_state *dpstate;
+	struct dpu_plane *dplane;
+	struct dpu_plane_grp *grp;
+	struct dpu_plane_res *res;
+	struct drm_framebuffer *fb;
+	struct dpu_fetchunit *fu;
+	struct list_head *node;
+	const struct dpu_fetchunit_ops *fu_ops;
+	union dpu_plane_stage stage;
+	struct dpu_layerblend *blend;
+	unsigned int sid = dpu_crtc->stream_id;
+	int i, j;
+	u32 src_w, src_h, dst_w, dst_h;
+	u32 cap_mask;
+	bool fb_is_packed_yuv422, fb_is_interlaced;
+	bool need_fetcheco, need_hscaler, need_vscaler;
+	bool found_fu;
+
+	/* for active planes only */
+	for (i = 0; i < n; i++) {
+		plane_state = plane_states[i];
+		dpstate = to_dpu_plane_state(plane_state);
+
+		/*
+		 * If modeset is not allowed, use the current source for
+		 * the prone-to-put planes so that unnecessary updates and
+		 * spurious EBUSY can be avoided.
+		 */
+		if (use_current_source) {
+			fu_ops = dpu_fu_get_ops(dpstate->source);
+			fu_ops->set_inavailable(dpstate->source);
+			continue;
+		}
+
+		dplane = to_dpu_plane(plane_state->plane);
+		fb = plane_state->fb;
+		grp = dplane->grp;
+		res = &grp->res;
+
+		src_w = plane_state->src_w >> 16;
+		src_h = plane_state->src_h >> 16;
+		dst_w = plane_state->crtc_w;
+		dst_h = plane_state->crtc_h;
+
+		fb_is_packed_yuv422 =
+				drm_format_info_is_yuv_packed(fb->format) &&
+				drm_format_info_is_yuv_sampling_422(fb->format);
+		fb_is_interlaced = !!(fb->flags & DRM_MODE_FB_INTERLACED);
+		need_fetcheco = fb->format->num_planes > 1;
+		need_hscaler = src_w != dst_w;
+		need_vscaler = (src_h != dst_h) || fb_is_interlaced;
+
+		cap_mask = 0;
+		if (need_fetcheco)
+			cap_mask |= DPU_FETCHUNIT_CAP_USE_FETCHECO;
+		if (need_hscaler || need_vscaler)
+			cap_mask |= DPU_FETCHUNIT_CAP_USE_SCALER;
+		if (fb_is_packed_yuv422)
+			cap_mask |= DPU_FETCHUNIT_CAP_PACKED_YUV422;
+
+		/* assign source */
+		found_fu = false;
+		list_for_each(node, &grp->fu_list) {
+			fu = dpu_fu_get_from_list(node);
+
+			fu_ops = dpu_fu_get_ops(fu);
+
+			/* available? */
+			if (!fu_ops->is_available(fu))
+				continue;
+
+			/* enough capability? */
+			if ((cap_mask & fu_ops->get_cap_mask(fu)) != cap_mask)
+				continue;
+
+			/* avoid fetchunit hot migration */
+			if (fu_ops->has_stream_id(fu) &&
+			    fu_ops->get_stream_id(fu) != sid)
+				continue;
+
+			fu_ops->set_inavailable(fu);
+			found_fu = true;
+			break;
+		}
+
+		if (!found_fu)
+			return -EINVAL;
+
+		dpstate->source = fu;
+
+		/* assign stage and blend */
+		if (sid) {
+			j = grp->hw_plane_cnt - (n - i);
+			blend = res->lb[j];
+			if (i == 0)
+				stage.cf = grp->cf[sid];
+			else
+				stage.lb = res->lb[j - 1];
+		} else {
+			blend = res->lb[i];
+			if (i == 0)
+				stage.cf = grp->cf[sid];
+			else
+				stage.lb = res->lb[i - 1];
+		}
+
+		dpstate->stage = stage;
+		dpstate->blend = blend;
+	}
+
+	return 0;
+}
+
+static int dpu_atomic_assign_plane_source(struct drm_atomic_state *state,
+					  u32 crtc_mask_prone_to_put,
+					  bool prone_to_put)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	struct dpu_crtc *dpu_crtc;
+	struct drm_plane_state **plane_states;
+	bool use_current_source;
+	int i, n;
+	int ret = 0;
+
+	use_current_source = !state->allow_modeset && prone_to_put;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		/* Skip if no active plane. */
+		if (crtc_state->plane_mask == 0)
+			continue;
+
+		if (prone_to_put !=
+		    !!(drm_crtc_mask(crtc) & crtc_mask_prone_to_put))
+			continue;
+
+		dpu_crtc = to_dpu_crtc(crtc);
+
+		plane_states = kmalloc_array(dpu_crtc->hw_plane_cnt,
+					     sizeof(*plane_states), GFP_KERNEL);
+		if (!plane_states) {
+			ret = -ENOMEM;
+			dpu_crtc_dbg(crtc,
+				     "failed to alloc plane state ptrs: %d\n",
+									ret);
+			return ret;
+		}
+
+		n = dpu_atomic_sort_planes_per_crtc(crtc_state, plane_states);
+		if (n < 0) {
+			dpu_crtc_dbg(crtc, "failed to sort planes: %d\n", n);
+			kfree(plane_states);
+			return n;
+		}
+
+		dpu_atomic_set_top_plane_per_crtc(plane_states, n);
+
+		ret = dpu_atomic_assign_plane_source_per_crtc(dpu_crtc,
+					plane_states, n, use_current_source);
+		if (ret) {
+			dpu_crtc_dbg(crtc,
+				     "failed to assign resource to plane: %d\n",
+									ret);
+			kfree(plane_states);
+			return ret;
+		}
+
+		kfree(plane_states);
+	}
+
+	return ret;
+}
+
+static void dpu_atomic_put_plane_state(struct drm_atomic_state *state,
+				       struct drm_plane *plane)
+{
+	int index = drm_plane_index(plane);
+
+	plane->funcs->atomic_destroy_state(plane, state->planes[index].state);
+	state->planes[index].ptr = NULL;
+	state->planes[index].state = NULL;
+	state->planes[index].old_state = NULL;
+	state->planes[index].new_state = NULL;
+
+	drm_modeset_unlock(&plane->mutex);
+
+	dpu_plane_dbg(plane, "put state\n");
+}
+
+static void dpu_atomic_put_crtc_state(struct drm_atomic_state *state,
+				      struct drm_crtc *crtc)
+{
+	int index = drm_crtc_index(crtc);
+
+	crtc->funcs->atomic_destroy_state(crtc, state->crtcs[index].state);
+	state->crtcs[index].ptr = NULL;
+	state->crtcs[index].state = NULL;
+	state->crtcs[index].old_state = NULL;
+	state->crtcs[index].new_state = NULL;
+
+	drm_modeset_unlock(&crtc->mutex);
+
+	dpu_crtc_dbg(crtc, "put state\n");
+}
+
+static void
+dpu_atomic_put_possible_states_per_crtc(struct drm_crtc_state *crtc_state)
+{
+	struct drm_atomic_state *state = crtc_state->state;
+	struct drm_crtc *crtc = crtc_state->crtc;
+	struct drm_plane *plane;
+	struct drm_plane_state *old_plane_state, *new_plane_state;
+	struct dpu_plane_state *old_dpstate, *new_dpstate;
+
+	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
+		old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+		new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+
+		old_dpstate = to_dpu_plane_state(old_plane_state);
+		new_dpstate = to_dpu_plane_state(new_plane_state);
+
+		/* Should be enough to check the below HW plane resources. */
+		if (old_dpstate->stage.ptr != new_dpstate->stage.ptr ||
+		    old_dpstate->source != new_dpstate->source ||
+		    old_dpstate->blend != new_dpstate->blend)
+			return;
+	}
+
+	drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
+		dpu_atomic_put_plane_state(state, plane);
+
+	dpu_atomic_put_crtc_state(state, crtc);
+}
+
+static int dpu_drm_atomic_check(struct drm_device *dev,
+				struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	struct dpu_crtc *dpu_crtc;
+	struct dpu_plane_grp *plane_grp;
+	struct dpu_fetchunit *fu;
+	struct list_head *node;
+	const struct dpu_fetchunit_ops *fu_ops;
+	u32 crtc_mask_in_state = 0;
+	u32 crtc_mask_in_grps = 0;
+	u32 crtc_mask_prone_to_put;
+	int ret, i;
+
+	ret = drm_atomic_helper_check_modeset(dev, state);
+	if (ret)
+		return ret;
+
+	/* Set crtc_mask_in_state and crtc_mask_in_grps. */
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		dpu_crtc = to_dpu_crtc(crtc);
+
+		crtc_mask_in_state |= drm_crtc_mask(crtc);
+		crtc_mask_in_grps |= dpu_crtc->grp->crtc_mask;
+	}
+
+	/*
+	 * Those CRTCs in groups but not in the state for check
+	 * are prone to put, because HW resources of their active
+	 * planes are likely unchanged.
+	 */
+	crtc_mask_prone_to_put = crtc_mask_in_grps ^ crtc_mask_in_state;
+
+	/*
+	 * For those CRTCs prone to put, get their CRTC states as well,
+	 * so that all relevant active plane states can be got when
+	 * assigning HW resources to them later on.
+	 */
+	drm_for_each_crtc(crtc, dev) {
+		if ((drm_crtc_mask(crtc) & crtc_mask_prone_to_put) == 0)
+			continue;
+
+		crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+	}
+
+	/*
+	 * Set all the fetchunits in the plane groups in question
+	 * to be available, so that they can be assigned to planes.
+	 */
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		dpu_crtc = to_dpu_crtc(crtc);
+
+		/* Skip the CRTC with stream ID1 in a CRTC group. */
+		if (dpu_crtc->stream_id == 1)
+			continue;
+
+		plane_grp = dpu_crtc->grp->plane_grp;
+
+		list_for_each(node, &plane_grp->fu_list) {
+			fu = dpu_fu_get_from_list(node);
+			fu_ops = dpu_fu_get_ops(fu);
+			fu_ops->set_available(fu);
+		}
+	}
+
+	ret = drm_atomic_normalize_zpos(dev, state);
+	if (ret) {
+		drm_dbg_kms(dev, "failed to normalize zpos: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Assign HW resources to planes in question.
+	 * It is likely to fail due to some reasons, e.g., no enough
+	 * fetchunits, users ask for more features than the HW resources
+	 * can provide, HW resource hot-migration bewteen CRTCs is needed.
+	 *
+	 * Do the assignment for the prone-to-put CRTCs first, as we want
+	 * the planes of them to use the current sources if modeset is not
+	 * allowed.
+	 */
+	ret = dpu_atomic_assign_plane_source(state,
+					     crtc_mask_prone_to_put, true);
+	if (ret) {
+		drm_dbg_kms(dev,
+			    "failed to assign source to prone-to-put plane: %d\n",
+			    ret);
+		return ret;
+	}
+	ret = dpu_atomic_assign_plane_source(state,
+					     crtc_mask_prone_to_put, false);
+	if (ret) {
+		drm_dbg_kms(dev, "failed to assign source to plane: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * To gain some performance, put those CRTC and plane states
+	 * which can be put.
+	 */
+	drm_for_each_crtc(crtc, dev) {
+		if (crtc_mask_prone_to_put & drm_crtc_mask(crtc)) {
+			crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+			if (WARN_ON(!crtc_state))
+				return -EINVAL;
+
+			dpu_atomic_put_possible_states_per_crtc(crtc_state);
+		}
+	}
+
+	return drm_atomic_helper_check_planes(dev, state);
+}
+
+static const struct drm_mode_config_funcs dpu_drm_mode_config_funcs = {
+	.fb_create	= drm_gem_fb_create,
+	.atomic_check	= dpu_drm_atomic_check,
+	.atomic_commit	= drm_atomic_helper_commit,
+};
+
+static int dpu_kms_init_encoder_per_crtc(struct drm_device *drm,
+					 struct dpu_crtc *dpu_crtc)
+{
+	struct drm_encoder *encoder = dpu_crtc->encoder;
+	struct drm_bridge *bridge;
+	struct drm_connector *connector;
+	struct device_node *ep, *remote;
+	int ret = 0;
+
+	ep = of_get_next_child(dpu_crtc->np, NULL);
+	if (!ep) {
+		drm_err(drm, "failed to find CRTC port's endpoint\n");
+		return -ENODEV;
+	}
+
+	remote = of_graph_get_remote_port_parent(ep);
+	if (!remote || !of_device_is_available(remote))
+		goto out;
+	else if (!of_device_is_available(remote->parent))
+		goto out;
+
+	bridge = of_drm_find_bridge(remote);
+	if (!bridge) {
+		ret = -EPROBE_DEFER;
+		drm_dbg_kms(drm, "CRTC(%pOF) failed to find bridge: %d\n",
+			    dpu_crtc->np, ret);
+		goto out;
+	}
+
+	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+	if (ret) {
+		drm_err(drm, "failed to initialize encoder: %d\n", ret);
+		goto out;
+	}
+
+	ret = drm_bridge_attach(encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		drm_err(drm, "failed to attach bridge to encoder: %d\n", ret);
+		goto out;
+	}
+
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		drm_err(drm,
+			"failed to initialize bridge connector: %d\n", ret);
+		goto out;
+	}
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		drm_err(drm,
+			"failed to attach encoder to connector: %d\n", ret);
+
+out:
+	of_node_put(remote);
+	of_node_put(ep);
+	return ret;
+}
+
+int dpu_kms_prepare(struct dpu_drm_device *dpu_drm,
+		    struct list_head *crtc_np_list)
+{
+	struct drm_device *drm = &dpu_drm->base;
+	struct dpu_crtc_of_node *crtc_of_node;
+	struct dpu_crtc *crtc;
+	int ret, n_crtc = 0;
+
+	INIT_LIST_HEAD(&dpu_drm->crtc_list);
+
+	list_for_each_entry(crtc_of_node, crtc_np_list, list) {
+		crtc = drmm_kzalloc(drm, sizeof(*crtc), GFP_KERNEL);
+		if (!crtc)
+			return -ENOMEM;
+
+		crtc->np = crtc_of_node->np;
+
+		crtc->encoder = drmm_kzalloc(drm, sizeof(*crtc->encoder),
+					     GFP_KERNEL);
+		if (!crtc->encoder)
+			return -ENOMEM;
+
+		list_add(&crtc->node, &dpu_drm->crtc_list);
+
+		n_crtc++;
+	}
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	drm->mode_config.min_width = 60;
+	drm->mode_config.min_height = 60;
+	drm->mode_config.max_width = 8192;
+	drm->mode_config.max_height = 8192;
+	drm->mode_config.funcs = &dpu_drm_mode_config_funcs;
+	drm->mode_config.normalize_zpos = true;
+	drm->max_vblank_count = DPU_FRAMEGEN_MAX_FRAME_INDEX;
+
+	list_for_each_entry(crtc, &dpu_drm->crtc_list, node) {
+		ret = dpu_kms_init_encoder_per_crtc(drm, crtc);
+		if (ret)
+			return ret;
+	}
+
+	ret = drm_vblank_init(drm, n_crtc);
+	if (ret)
+		drm_err(drm, "failed to initialize vblank support: %d\n", ret);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-kms.h b/drivers/gpu/drm/imx/dpu/dpu-kms.h
new file mode 100644
index 000000000000..699a0d14a866
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-kms.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright 2019,2020 NXP
+ */
+
+#ifndef __DPU_KMS_H__
+#define __DPU_KMS_H__
+
+#include <linux/of.h>
+#include <linux/types.h>
+
+#include "dpu-drv.h"
+
+struct dpu_crtc_of_node {
+	struct device_node *np;
+	struct list_head list;
+};
+
+int dpu_kms_prepare(struct dpu_drm_device *dpu_drm,
+		    struct list_head *crtc_np_list);
+
+#endif
diff --git a/drivers/gpu/drm/imx/dpu/dpu-layerblend.c b/drivers/gpu/drm/imx/dpu/dpu-layerblend.c
new file mode 100644
index 000000000000..be3812ed2508
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-layerblend.c
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include <drm/drm_blend.h>
+
+#include "dpu.h"
+#include "dpu-prv.h"
+
+#define PIXENGCFG_DYNAMIC			0x8
+#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	0x3f
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_SHIFT	8
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		0x3f00
+
+#define PIXENGCFG_STATUS			0xc
+
+#define STATICCONTROL				0x8
+#define  SHDTOKSEL_MASK				0x18
+#define  SHDTOKSEL(n)				((n) << 3)
+#define  SHDLDSEL_MASK				0x6
+#define  SHDLDSEL(n)				((n) << 1)
+
+#define CONTROL					0xc
+#define  CTRL_MODE_MASK				BIT(0)
+
+#define BLENDCONTROL				0x10
+#define  ALPHA(a)				(((a) & 0xff) << 16)
+#define  PRIM_C_BLD_FUNC__ONE_MINUS_CONST_ALPHA	0x7
+#define  PRIM_C_BLD_FUNC__ONE_MINUS_SEC_ALPHA	0x5
+#define  PRIM_C_BLD_FUNC__ZERO			0x0
+#define  SEC_C_BLD_FUNC__CONST_ALPHA		(0x6 << 4)
+#define  SEC_C_BLD_FUNC__SEC_ALPHA		(0x4 << 4)
+#define  PRIM_A_BLD_FUNC__ZERO			(0x0 << 8)
+#define  SEC_A_BLD_FUNC__ZERO			(0x0 << 12)
+
+#define POSITION				0x14
+#define  XPOS(x)				((x) & 0x7fff)
+#define  YPOS(y)				(((y) & 0x7fff) << 16)
+
+#define PRIMCONTROLWORD				0x18
+#define SECCONTROLWORD				0x1c
+
+enum dpu_lb_shadow_sel {
+	PRIMARY,	/* background plane */
+	SECONDARY,	/* foreground plane */
+	BOTH,
+};
+
+struct dpu_layerblend {
+	void __iomem *pec_base;
+	void __iomem *base;
+	struct mutex mutex;
+	unsigned int id;
+	unsigned int index;
+	enum dpu_link_id link_id;
+	bool inuse;
+	struct dpu_soc *dpu;
+};
+
+static const enum dpu_link_id dpu_lb_link_id[] = {
+	LINK_ID_LAYERBLEND0, LINK_ID_LAYERBLEND1,
+	LINK_ID_LAYERBLEND2, LINK_ID_LAYERBLEND3
+};
+
+static const enum dpu_link_id prim_sels[] = {
+	/* common options */
+	LINK_ID_NONE,
+	LINK_ID_BLITBLEND9,
+	LINK_ID_CONSTFRAME0,
+	LINK_ID_CONSTFRAME1,
+	LINK_ID_CONSTFRAME4,
+	LINK_ID_CONSTFRAME5,
+	LINK_ID_MATRIX4,
+	LINK_ID_HSCALER4,
+	LINK_ID_VSCALER4,
+	LINK_ID_MATRIX5,
+	LINK_ID_HSCALER5,
+	LINK_ID_VSCALER5,
+	/*
+	 * special options:
+	 * layerblend(n) has n special options,
+	 * from layerblend0 to layerblend(n - 1), e.g.,
+	 * layerblend3 has 3 special options -
+	 * layerblend0/1/2.
+	 */
+	LINK_ID_LAYERBLEND0,
+	LINK_ID_LAYERBLEND1,
+	LINK_ID_LAYERBLEND2,
+	LINK_ID_LAYERBLEND3,
+};
+
+static const enum dpu_link_id sec_sels[] = {
+	LINK_ID_NONE,
+	LINK_ID_FETCHWARP2,
+	LINK_ID_FETCHDECODE0,
+	LINK_ID_FETCHDECODE1,
+	LINK_ID_MATRIX4,
+	LINK_ID_HSCALER4,
+	LINK_ID_VSCALER4,
+	LINK_ID_MATRIX5,
+	LINK_ID_HSCALER5,
+	LINK_ID_VSCALER5,
+	LINK_ID_FETCHLAYER0,
+};
+
+static inline u32 dpu_pec_lb_read(struct dpu_layerblend *lb,
+				  unsigned int offset)
+{
+	return readl(lb->pec_base + offset);
+}
+
+static inline void dpu_pec_lb_write(struct dpu_layerblend *lb,
+				    unsigned int offset, u32 value)
+{
+	writel(value, lb->pec_base + offset);
+}
+
+static inline void dpu_pec_lb_write_mask(struct dpu_layerblend *lb,
+					 unsigned int offset,
+					 u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_pec_lb_read(lb, offset);
+	tmp &= ~mask;
+	dpu_pec_lb_write(lb, offset, tmp | value);
+}
+
+static inline u32 dpu_lb_read(struct dpu_layerblend *lb, unsigned int offset)
+{
+	return readl(lb->base + offset);
+}
+
+static inline void dpu_lb_write(struct dpu_layerblend *lb,
+				unsigned int offset, u32 value)
+{
+	writel(value, lb->base + offset);
+}
+
+static inline void dpu_lb_write_mask(struct dpu_layerblend *lb,
+				     unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_lb_read(lb, offset);
+	tmp &= ~mask;
+	dpu_lb_write(lb, offset, tmp | value);
+}
+
+enum dpu_link_id dpu_lb_get_link_id(struct dpu_layerblend *lb)
+{
+	return lb->link_id;
+}
+
+void dpu_lb_pec_dynamic_prim_sel(struct dpu_layerblend *lb,
+				 enum dpu_link_id prim)
+{
+	struct dpu_soc *dpu = lb->dpu;
+	int fixed_sels_num = ARRAY_SIZE(prim_sels) - 4;
+	int i;
+
+	for (i = 0; i < fixed_sels_num + lb->id; i++) {
+		if (prim_sels[i] == prim) {
+			dpu_pec_lb_write_mask(lb, PIXENGCFG_DYNAMIC,
+					      PIXENGCFG_DYNAMIC_PRIM_SEL_MASK,
+					      prim);
+			return;
+		}
+	}
+
+	dev_err(dpu->dev, "LayerBlend%u - invalid primary source 0x%02x\n",
+		lb->id, prim);
+}
+
+void dpu_lb_pec_dynamic_sec_sel(struct dpu_layerblend *lb, enum dpu_link_id sec)
+{
+	struct dpu_soc *dpu = lb->dpu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sec_sels); i++) {
+		if (sec_sels[i] == sec) {
+			dpu_pec_lb_write_mask(lb, PIXENGCFG_DYNAMIC,
+					PIXENGCFG_DYNAMIC_SEC_SEL_MASK,
+					sec << PIXENGCFG_DYNAMIC_SEC_SEL_SHIFT);
+			return;
+		}
+	}
+
+	dev_err(dpu->dev, "LayerBlend%u - invalid secondary source 0x%02x\n",
+		lb->id, sec);
+}
+
+void dpu_lb_pec_clken(struct dpu_layerblend *lb, enum dpu_pec_clken clken)
+{
+	dpu_pec_lb_write_mask(lb, PIXENGCFG_DYNAMIC, CLKEN_MASK, CLKEN(clken));
+}
+
+static void dpu_lb_enable_shden(struct dpu_layerblend *lb)
+{
+	dpu_lb_write_mask(lb, STATICCONTROL, SHDEN, SHDEN);
+}
+
+static void dpu_lb_shdtoksel(struct dpu_layerblend *lb,
+			     enum dpu_lb_shadow_sel sel)
+{
+	dpu_lb_write_mask(lb, STATICCONTROL, SHDTOKSEL_MASK, SHDTOKSEL(sel));
+}
+
+static void dpu_lb_shdldsel(struct dpu_layerblend *lb,
+			    enum dpu_lb_shadow_sel sel)
+{
+	dpu_lb_write_mask(lb, STATICCONTROL, SHDLDSEL_MASK, SHDLDSEL(sel));
+}
+
+void dpu_lb_mode(struct dpu_layerblend *lb, enum dpu_lb_mode mode)
+{
+	dpu_lb_write_mask(lb, CONTROL, CTRL_MODE_MASK, mode);
+}
+
+void dpu_lb_blendcontrol(struct dpu_layerblend *lb, unsigned int zpos,
+			 unsigned int pixel_blend_mode, u16 alpha)
+{
+	u32 val = PRIM_A_BLD_FUNC__ZERO | SEC_A_BLD_FUNC__ZERO;
+
+	if (zpos == 0) {
+		val |= PRIM_C_BLD_FUNC__ZERO | SEC_C_BLD_FUNC__CONST_ALPHA;
+		alpha = DRM_BLEND_ALPHA_OPAQUE;
+	} else {
+		switch (pixel_blend_mode) {
+		case DRM_MODE_BLEND_PIXEL_NONE:
+			val |= PRIM_C_BLD_FUNC__ONE_MINUS_CONST_ALPHA |
+			       SEC_C_BLD_FUNC__CONST_ALPHA;
+			break;
+		case DRM_MODE_BLEND_PREMULTI:
+			val |= PRIM_C_BLD_FUNC__ONE_MINUS_SEC_ALPHA |
+			       SEC_C_BLD_FUNC__CONST_ALPHA;
+			break;
+		case DRM_MODE_BLEND_COVERAGE:
+			val |= PRIM_C_BLD_FUNC__ONE_MINUS_SEC_ALPHA |
+			       SEC_C_BLD_FUNC__SEC_ALPHA;
+			break;
+		}
+	}
+
+	val |= ALPHA(alpha >> 8);
+
+	dpu_lb_write(lb, BLENDCONTROL, val);
+}
+
+void dpu_lb_position(struct dpu_layerblend *lb, int x, int y)
+{
+	dpu_lb_write(lb, POSITION, XPOS(x) | YPOS(y));
+}
+
+unsigned int dpu_lb_get_id(struct dpu_layerblend *lb)
+{
+	return lb->id;
+}
+
+struct dpu_layerblend *dpu_lb_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_layerblend *lb;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->lb_priv); i++) {
+		lb = dpu->lb_priv[i];
+		if (lb->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->lb_priv))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&lb->mutex);
+
+	if (lb->inuse) {
+		mutex_unlock(&lb->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	lb->inuse = true;
+
+	mutex_unlock(&lb->mutex);
+
+	return lb;
+}
+
+void dpu_lb_put(struct dpu_layerblend *lb)
+{
+	if (IS_ERR_OR_NULL(lb))
+		return;
+
+	mutex_lock(&lb->mutex);
+
+	lb->inuse = false;
+
+	mutex_unlock(&lb->mutex);
+}
+
+void dpu_lb_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	struct dpu_layerblend *lb = dpu->lb_priv[index];
+
+	dpu_lb_pec_dynamic_prim_sel(lb, LINK_ID_NONE);
+	dpu_lb_pec_dynamic_sec_sel(lb, LINK_ID_NONE);
+	dpu_lb_pec_clken(lb, CLKEN_DISABLE);
+	dpu_lb_shdldsel(lb, BOTH);
+	dpu_lb_shdtoksel(lb, BOTH);
+	dpu_lb_enable_shden(lb);
+}
+
+int dpu_lb_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base)
+{
+	struct dpu_layerblend *lb;
+
+	lb = devm_kzalloc(dpu->dev, sizeof(*lb), GFP_KERNEL);
+	if (!lb)
+		return -ENOMEM;
+
+	dpu->lb_priv[index] = lb;
+
+	lb->pec_base = devm_ioremap(dpu->dev, pec_base, SZ_16);
+	if (!lb->pec_base)
+		return -ENOMEM;
+
+	lb->base = devm_ioremap(dpu->dev, base, SZ_32);
+	if (!lb->base)
+		return -ENOMEM;
+
+	lb->dpu = dpu;
+	lb->id = id;
+	lb->index = index;
+	lb->link_id = dpu_lb_link_id[index];
+
+	mutex_init(&lb->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-plane.c b/drivers/gpu/drm/imx/dpu/dpu-plane.c
new file mode 100644
index 000000000000..0700c1079c14
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-plane.c
@@ -0,0 +1,803 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_color_mgmt.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane_helper.h>
+
+#include "dpu.h"
+#include "dpu-crtc.h"
+#include "dpu-dprc.h"
+#include "dpu-plane.h"
+
+#define FRAC_16_16(mult, div)			(((mult) << 16) / (div))
+
+#define DPU_PLANE_MAX_PITCH			0x10000
+#define DPU_PLANE_MAX_PIX_CNT			8192
+#define DPU_PLANE_MAX_PIX_CNT_WITH_SCALER	2048
+
+static const uint32_t dpu_plane_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
+
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+};
+
+static const uint64_t dpu_plane_format_modifiers[] = {
+	DRM_FORMAT_MOD_VIVANTE_TILED,
+	DRM_FORMAT_MOD_VIVANTE_SUPER_TILED,
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID,
+};
+
+static unsigned int dpu_plane_get_default_zpos(enum drm_plane_type type)
+{
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		return 0;
+	else if (type == DRM_PLANE_TYPE_OVERLAY)
+		return 1;
+
+	return 0;
+}
+
+static void dpu_plane_destroy(struct drm_plane *plane)
+{
+	struct dpu_plane *dpu_plane = to_dpu_plane(plane);
+
+	drm_plane_cleanup(plane);
+	kfree(dpu_plane);
+}
+
+static void dpu_plane_reset(struct drm_plane *plane)
+{
+	struct dpu_plane_state *state;
+
+	if (plane->state) {
+		__drm_atomic_helper_plane_destroy_state(plane->state);
+		kfree(to_dpu_plane_state(plane->state));
+		plane->state = NULL;
+	}
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return;
+
+	__drm_atomic_helper_plane_reset(plane, &state->base);
+
+	plane->state->zpos = dpu_plane_get_default_zpos(plane->type);
+	plane->state->color_encoding = DRM_COLOR_YCBCR_BT709;
+	plane->state->color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
+}
+
+static struct drm_plane_state *
+dpu_drm_atomic_plane_duplicate_state(struct drm_plane *plane)
+{
+	struct dpu_plane_state *state, *copy;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	copy = kmalloc(sizeof(*state), GFP_KERNEL);
+	if (!copy)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
+	state = to_dpu_plane_state(plane->state);
+	copy->stage = state->stage;
+	copy->source = state->source;
+	copy->blend = state->blend;
+	copy->is_top = state->is_top;
+
+	return &copy->base;
+}
+
+static void dpu_drm_atomic_plane_destroy_state(struct drm_plane *plane,
+					       struct drm_plane_state *state)
+{
+	__drm_atomic_helper_plane_destroy_state(state);
+	kfree(to_dpu_plane_state(state));
+}
+
+static bool dpu_drm_plane_format_mod_supported(struct drm_plane *plane,
+					       uint32_t format,
+					       uint64_t modifier)
+{
+	switch (format) {
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_UYVY:
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		return modifier == DRM_FORMAT_MOD_LINEAR;
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_RGB565:
+		return modifier == DRM_FORMAT_MOD_LINEAR ||
+		       modifier == DRM_FORMAT_MOD_VIVANTE_TILED ||
+		       modifier == DRM_FORMAT_MOD_VIVANTE_SUPER_TILED;
+	default:
+		return false;
+	}
+}
+
+static const struct drm_plane_funcs dpu_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= dpu_plane_destroy,
+	.reset			= dpu_plane_reset,
+	.atomic_duplicate_state	= dpu_drm_atomic_plane_duplicate_state,
+	.atomic_destroy_state	= dpu_drm_atomic_plane_destroy_state,
+	.format_mod_supported	= dpu_drm_plane_format_mod_supported,
+};
+
+static inline dma_addr_t
+drm_plane_state_to_baseaddr(struct drm_plane_state *state)
+{
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_gem_cma_object *cma_obj;
+	unsigned int x = state->src.x1 >> 16;
+	unsigned int y = state->src.y1 >> 16;
+
+	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+
+	if (fb->flags & DRM_MODE_FB_INTERLACED)
+		y /= 2;
+
+	return cma_obj->paddr + fb->offsets[0] + fb->pitches[0] * y +
+	       fb->format->cpp[0] * x;
+}
+
+static inline dma_addr_t
+drm_plane_state_to_uvbaseaddr(struct drm_plane_state *state)
+{
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_gem_cma_object *cma_obj;
+	int x = state->src.x1 >> 16;
+	int y = state->src.y1 >> 16;
+
+	cma_obj = drm_fb_cma_get_gem_obj(fb, 1);
+
+	x /= fb->format->hsub;
+	y /= fb->format->vsub;
+
+	if (fb->flags & DRM_MODE_FB_INTERLACED)
+		y /= 2;
+
+	return cma_obj->paddr + fb->offsets[1] + fb->pitches[1] * y +
+	       fb->format->cpp[1] * x;
+}
+
+static int dpu_plane_check_no_off_screen(struct drm_plane_state *state,
+					 struct drm_crtc_state *crtc_state)
+{
+	if (state->dst.x1 < 0 || state->dst.y1 < 0 ||
+	    state->dst.x2 > crtc_state->adjusted_mode.hdisplay ||
+	    state->dst.y2 > crtc_state->adjusted_mode.vdisplay) {
+		dpu_plane_dbg(state->plane, "no off screen\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dpu_plane_check_max_source_resolution(struct drm_plane_state *state)
+{
+	u32 src_w = drm_rect_width(&state->src) >> 16;
+	u32 src_h = drm_rect_height(&state->src) >> 16;
+	u32 dst_w = drm_rect_width(&state->dst);
+	u32 dst_h = drm_rect_height(&state->dst);
+
+	if (src_w == dst_w || src_h == dst_h) {
+		/* without scaling */
+		if (src_w > DPU_PLANE_MAX_PIX_CNT ||
+		    src_h > DPU_PLANE_MAX_PIX_CNT) {
+			dpu_plane_dbg(state->plane,
+				      "invalid source resolution\n");
+			return -EINVAL;
+		}
+	} else {
+		/* with scaling */
+		if (src_w > DPU_PLANE_MAX_PIX_CNT_WITH_SCALER ||
+		    src_h > DPU_PLANE_MAX_PIX_CNT_WITH_SCALER) {
+			dpu_plane_dbg(state->plane,
+				      "invalid source resolution with scale\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int dpu_plane_check_source_alignment(struct drm_plane_state *state)
+{
+	struct drm_framebuffer *fb = state->fb;
+	bool fb_is_interlaced = !!(fb->flags & DRM_MODE_FB_INTERLACED);
+	u32 src_w = drm_rect_width(&state->src) >> 16;
+	u32 src_h = drm_rect_height(&state->src) >> 16;
+	u32 src_x = state->src.x1 >> 16;
+	u32 src_y = state->src.y1 >> 16;
+
+	if (fb->format->hsub == 2) {
+		if (src_w % 2) {
+			dpu_plane_dbg(state->plane, "bad uv width\n");
+			return -EINVAL;
+		}
+		if (src_x % 2) {
+			dpu_plane_dbg(state->plane, "bad uv xoffset\n");
+			return -EINVAL;
+		}
+	}
+	if (fb->format->vsub == 2) {
+		if (src_h % (fb_is_interlaced ? 4 : 2)) {
+			dpu_plane_dbg(state->plane, "bad uv height\n");
+			return -EINVAL;
+		}
+		if (src_y % (fb_is_interlaced ? 4 : 2)) {
+			dpu_plane_dbg(state->plane, "bad uv yoffset\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int dpu_plane_check_fb_modifier(struct drm_plane_state *state)
+{
+	struct drm_plane *plane = state->plane;
+	struct drm_framebuffer *fb = state->fb;
+
+	if ((fb->flags & DRM_MODE_FB_MODIFIERS) &&
+	    !plane->funcs->format_mod_supported(plane, fb->format->format,
+						fb->modifier)) {
+		dpu_plane_dbg(plane, "invalid modifier 0x%016llx",
+			      fb->modifier);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* for tile formats, framebuffer has to be tile aligned */
+static int dpu_plane_check_tiled_fb_alignment(struct drm_plane_state *state)
+{
+	struct drm_plane *plane = state->plane;
+	struct drm_framebuffer *fb = state->fb;
+
+	switch (fb->modifier) {
+	case DRM_FORMAT_MOD_VIVANTE_TILED:
+		if (fb->width % 4) {
+			dpu_plane_dbg(plane, "bad fb width for VIVANTE tile\n");
+			return -EINVAL;
+		}
+		if (fb->height % 4) {
+			dpu_plane_dbg(plane, "bad fb height for VIVANTE tile\n");
+			return -EINVAL;
+		}
+		break;
+	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
+		if (fb->width % 64) {
+			dpu_plane_dbg(plane,
+				      "bad fb width for VIVANTE super tile\n");
+			return -EINVAL;
+		}
+		if (fb->height % 64) {
+			dpu_plane_dbg(plane,
+				      "bad fb height for VIVANTE super tile\n");
+			return -EINVAL;
+		}
+		break;
+	}
+
+	return 0;
+}
+
+static int dpu_plane_check_no_bt709_full_range(struct drm_plane_state *state)
+{
+	if (state->fb->format->is_yuv &&
+	    state->color_encoding == DRM_COLOR_YCBCR_BT709 &&
+	    state->color_range == DRM_COLOR_YCBCR_FULL_RANGE) {
+		dpu_plane_dbg(state->plane, "no BT709 full range support\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dpu_plane_check_fb_plane_1(struct drm_plane_state *state)
+{
+	struct drm_plane *plane = state->plane;
+	struct drm_framebuffer *fb = state->fb;
+	dma_addr_t baseaddr = drm_plane_state_to_baseaddr(state);
+	int bpp;
+
+	/* base address alignment */
+	switch (fb->format->format) {
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_UYVY:
+		bpp = 16;
+		break;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		bpp = 8;
+		break;
+	default:
+		bpp = fb->format->cpp[0] * 8;
+		break;
+	}
+	if ((bpp == 32 && (baseaddr & 0x3)) ||
+	    (bpp == 16 && (baseaddr & 0x1))) {
+		dpu_plane_dbg(plane, "%dbpp fb bad baddr alignment\n", bpp);
+		return -EINVAL;
+	}
+	switch (bpp) {
+	case 32:
+		if (baseaddr & 0x3) {
+			dpu_plane_dbg(plane, "32bpp fb bad baddr alignment\n");
+			return -EINVAL;
+		}
+		break;
+	case 16:
+		if (fb->modifier) {
+			if (baseaddr & 0x1) {
+				dpu_plane_dbg(plane,
+					      "16bpp tile fb bad baddr alignment\n");
+				return -EINVAL;
+			}
+		} else {
+			if (baseaddr & 0x7) {
+				dpu_plane_dbg(plane,
+					      "16bpp fb bad baddr alignment\n");
+				return -EINVAL;
+			}
+		}
+		break;
+	}
+
+	/* pitches[0] range */
+	if (fb->pitches[0] > DPU_PLANE_MAX_PITCH) {
+		dpu_plane_dbg(plane, "fb pitches[0] is out of range\n");
+		return -EINVAL;
+	}
+
+	/* pitches[0] alignment */
+	if ((bpp == 32 && (fb->pitches[0] & 0x3)) ||
+	    (bpp == 16 && (fb->pitches[0] & 0x1))) {
+		dpu_plane_dbg(plane, "%dbpp fb bad pitches[0] alignment\n", bpp);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* UV planar check, assuming 16bpp */
+static int dpu_plane_check_fb_plane_2(struct drm_plane_state *state)
+{
+	struct drm_plane *plane = state->plane;
+	struct drm_framebuffer *fb = state->fb;
+	dma_addr_t uv_baseaddr = drm_plane_state_to_uvbaseaddr(state);
+
+	/* base address alignment */
+	if (uv_baseaddr & 0x7) {
+		dpu_plane_dbg(plane, "bad uv baddr alignment\n");
+		return -EINVAL;
+	}
+
+	/* pitches[1] range */
+	if (fb->pitches[1] > DPU_PLANE_MAX_PITCH) {
+		dpu_plane_dbg(plane, "fb pitches[1] is out of range\n");
+		return -EINVAL;
+	}
+
+	/* pitches[1] alignment */
+	if (fb->pitches[1] & 0x1) {
+		dpu_plane_dbg(plane, "fb bad pitches[1] alignment\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dpu_plane_check_dprc(struct drm_plane_state *state)
+{
+	struct dpu_plane_state *dpstate = to_dpu_plane_state(state);
+	struct drm_framebuffer *fb = state->fb;
+	const struct dpu_fetchunit_ops *fu_ops;
+	struct dpu_dprc *dprc;
+	dma_addr_t baseaddr, uv_baseaddr = 0;
+	u32 src_w = drm_rect_width(&state->src) >> 16;
+	u32 src_x = state->src.x1 >> 16;
+
+	fu_ops = dpu_fu_get_ops(dpstate->source);
+	dprc = fu_ops->get_dprc(dpstate->source);
+
+	if (!dpu_dprc_rtram_width_supported(dprc, src_w)) {
+		dpu_plane_dbg(state->plane, "bad RTRAM width for DPRC\n");
+		return -EINVAL;
+	}
+
+	baseaddr = drm_plane_state_to_baseaddr(state);
+	if (fb->format->num_planes > 1)
+		uv_baseaddr = drm_plane_state_to_uvbaseaddr(state);
+
+	if (!dpu_dprc_stride_supported(dprc, fb->pitches[0], fb->pitches[1],
+				       src_w, src_x, fb->format, fb->modifier,
+				       baseaddr, uv_baseaddr)) {
+		dpu_plane_dbg(state->plane, "bad fb pitches for DPRC\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dpu_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state =
+				drm_atomic_get_new_plane_state(state, plane);
+	struct dpu_plane_state *new_dpstate =
+				to_dpu_plane_state(new_plane_state);
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	struct drm_crtc_state *crtc_state;
+	int min_scale, ret;
+
+	/* ok to disable */
+	if (!fb) {
+		new_dpstate->source = NULL;
+		new_dpstate->stage.ptr = NULL;
+		new_dpstate->blend = NULL;
+		return 0;
+	}
+
+	if (!new_plane_state->crtc) {
+		dpu_plane_dbg(plane, "no CRTC in plane state\n");
+		return -EINVAL;
+	}
+
+	crtc_state =
+		drm_atomic_get_existing_crtc_state(state, new_plane_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return -EINVAL;
+
+	min_scale = FRAC_16_16(1, DPU_PLANE_MAX_PIX_CNT_WITH_SCALER);
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						  min_scale,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  true, false);
+	if (ret) {
+		dpu_plane_dbg(plane, "failed to check plane state: %d\n", ret);
+		return ret;
+	}
+
+	ret = dpu_plane_check_no_off_screen(new_plane_state, crtc_state);
+	if (ret)
+		return ret;
+
+	ret = dpu_plane_check_max_source_resolution(new_plane_state);
+	if (ret)
+		return ret;
+
+	ret = dpu_plane_check_source_alignment(new_plane_state);
+	if (ret)
+		return ret;
+
+	ret = dpu_plane_check_fb_modifier(new_plane_state);
+	if (ret)
+		return ret;
+
+	ret = dpu_plane_check_tiled_fb_alignment(new_plane_state);
+	if (ret)
+		return ret;
+
+	ret = dpu_plane_check_no_bt709_full_range(new_plane_state);
+	if (ret)
+		return ret;
+
+	ret = dpu_plane_check_fb_plane_1(new_plane_state);
+	if (ret)
+		return ret;
+
+	if (fb->format->num_planes > 1) {
+		ret = dpu_plane_check_fb_plane_2(new_plane_state);
+		if (ret)
+			return ret;
+	}
+
+	return dpu_plane_check_dprc(new_plane_state);
+}
+
+static void dpu_plane_atomic_update(struct drm_plane *plane,
+				    struct drm_atomic_state *state)
+{
+	struct dpu_plane *dplane = to_dpu_plane(plane);
+	struct drm_plane_state *new_state =
+				drm_atomic_get_new_plane_state(state, plane);
+	struct dpu_plane_state *new_dpstate = to_dpu_plane_state(new_state);
+	struct dpu_plane_grp *grp = dplane->grp;
+	struct dpu_crtc *dpu_crtc;
+	struct drm_framebuffer *fb = new_state->fb;
+	struct dpu_fetchunit *fu = new_dpstate->source;
+	struct dpu_layerblend *lb = new_dpstate->blend;
+	struct dpu_dprc *dprc;
+	const struct dpu_fetchunit_ops *fu_ops;
+	dma_addr_t baseaddr, uv_baseaddr;
+	enum dpu_link_id fu_link;
+	enum dpu_link_id lb_src_link, stage_link;
+	enum dpu_link_id vs_link;
+	unsigned int src_w, src_h, src_x, src_y, dst_w, dst_h;
+	unsigned int mt_w = 0, mt_h = 0;	/* micro-tile width/height */
+	int bpp;
+	bool prefetch_start = false;
+	bool need_fetcheco = false, need_hscaler = false, need_vscaler = false;
+	bool need_modeset;
+	bool fb_is_interlaced;
+
+	/*
+	 * Do nothing since the plane is disabled by
+	 * crtc_func->atomic_begin/flush.
+	 */
+	if (!fb)
+		return;
+
+	/* Do nothing if CRTC is inactive. */
+	if (!new_state->crtc->state->active)
+		return;
+
+	need_modeset = drm_atomic_crtc_needs_modeset(new_state->crtc->state);
+
+	fb_is_interlaced = !!(fb->flags & DRM_MODE_FB_INTERLACED);
+
+	src_w = drm_rect_width(&new_state->src) >> 16;
+	src_h = drm_rect_height(&new_state->src) >> 16;
+	src_x = new_state->src.x1 >> 16;
+	src_y = new_state->src.y1 >> 16;
+	dst_w = drm_rect_width(&new_state->dst);
+	dst_h = drm_rect_height(&new_state->dst);
+
+	switch (fb->format->format) {
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_UYVY:
+		bpp = 16;
+		break;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		bpp = 8;
+		break;
+	default:
+		bpp = fb->format->cpp[0] * 8;
+		break;
+	}
+
+	switch (fb->modifier) {
+	case DRM_FORMAT_MOD_VIVANTE_TILED:
+	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
+		mt_w = (bpp == 16) ? 8 : 4;
+		mt_h = 4;
+		break;
+	}
+
+	if (fb->format->num_planes > 1)
+		need_fetcheco = true;
+
+	if (src_w != dst_w)
+		need_hscaler = true;
+
+	if (src_h != dst_h || fb_is_interlaced)
+		need_vscaler = true;
+
+	baseaddr = drm_plane_state_to_baseaddr(new_state);
+	if (need_fetcheco)
+		uv_baseaddr = drm_plane_state_to_uvbaseaddr(new_state);
+
+	dpu_crtc = to_dpu_crtc(new_state->crtc);
+
+	fu_ops = dpu_fu_get_ops(fu);
+
+	if (!fu_ops->has_stream_id(fu) || need_modeset)
+		prefetch_start = true;
+
+	fu_ops->set_layerblend(fu, lb);
+
+	fu_ops->set_burstlength(fu, src_x, mt_w, bpp, baseaddr);
+	fu_ops->set_src_stride(fu, src_w, src_w, mt_w, bpp, fb->pitches[0],
+			       baseaddr);
+	fu_ops->set_src_buf_dimensions(fu, src_w, src_h, fb->format,
+				       fb_is_interlaced);
+	fu_ops->set_fmt(fu, fb->format, new_state->color_encoding,
+			new_state->color_range, fb_is_interlaced);
+	fu_ops->set_pixel_blend_mode(fu, new_state->pixel_blend_mode,
+				     new_state->alpha, fb->format->has_alpha);
+	fu_ops->enable_src_buf(fu);
+	fu_ops->set_framedimensions(fu, src_w, src_h, fb_is_interlaced);
+	fu_ops->set_baseaddress(fu, src_w, src_x, src_y, mt_w, mt_h, bpp,
+				baseaddr);
+	fu_ops->set_stream_id(fu, dpu_crtc->stream_id);
+
+	fu_link = fu_ops->get_link_id(fu);
+	lb_src_link = fu_link;
+
+	dpu_plane_dbg(plane, "uses %s\n", fu_ops->get_name(fu));
+
+	if (need_fetcheco) {
+		struct dpu_fetchunit *fe = fu_ops->get_fetcheco(fu);
+		const struct dpu_fetchunit_ops *fe_ops;
+
+		fe_ops = dpu_fu_get_ops(fe);
+
+		fu_ops->set_pec_dynamic_src_sel(fu, fe_ops->get_link_id(fe));
+
+		fe_ops->set_burstlength(fe, src_x, mt_w, bpp, uv_baseaddr);
+		fe_ops->set_src_stride(fe, src_w, src_x, mt_w, bpp,
+				       fb->pitches[1], uv_baseaddr);
+		fe_ops->set_fmt(fe, fb->format, new_state->color_encoding,
+				new_state->color_range, fb_is_interlaced);
+		fe_ops->set_src_buf_dimensions(fe, src_w, src_h,
+					       fb->format, fb_is_interlaced);
+		fe_ops->set_framedimensions(fe, src_w, src_h, fb_is_interlaced);
+		fe_ops->set_baseaddress(fe, src_w, src_x, src_y / 2,
+					mt_w, mt_h, bpp, uv_baseaddr);
+		fe_ops->enable_src_buf(fe);
+
+		dpu_plane_dbg(plane, "uses %s\n", fe_ops->get_name(fe));
+	} else {
+		if (fu_ops->set_pec_dynamic_src_sel)
+			fu_ops->set_pec_dynamic_src_sel(fu, LINK_ID_NONE);
+	}
+
+	/* VScaler comes first */
+	if (need_vscaler) {
+		struct dpu_vscaler *vs = fu_ops->get_vscaler(fu);
+
+		dpu_vs_pec_dynamic_src_sel(vs, fu_link);
+		dpu_vs_pec_clken(vs, CLKEN_AUTOMATIC);
+		dpu_vs_setup1(vs, src_h, new_state->crtc_h, fb_is_interlaced);
+		dpu_vs_setup2(vs, fb_is_interlaced);
+		dpu_vs_setup3(vs, fb_is_interlaced);
+		dpu_vs_output_size(vs, dst_h);
+		dpu_vs_field_mode(vs, fb_is_interlaced ?
+						SCALER_ALWAYS0 : SCALER_INPUT);
+		dpu_vs_filter_mode(vs, SCALER_LINEAR);
+		dpu_vs_scale_mode(vs, SCALER_UPSCALE);
+		dpu_vs_mode(vs, SCALER_ACTIVE);
+
+		vs_link = dpu_vs_get_link_id(vs);
+		lb_src_link = vs_link;
+
+		dpu_plane_dbg(plane, "uses VScaler%u\n", dpu_vs_get_id(vs));
+	}
+
+	/* and then, HScaler */
+	if (need_hscaler) {
+		struct dpu_hscaler *hs = fu_ops->get_hscaler(fu);
+
+		dpu_hs_pec_dynamic_src_sel(hs, need_vscaler ? vs_link : fu_link);
+		dpu_hs_pec_clken(hs, CLKEN_AUTOMATIC);
+		dpu_hs_setup1(hs, src_w, dst_w);
+		dpu_hs_output_size(hs, dst_w);
+		dpu_hs_filter_mode(hs, SCALER_LINEAR);
+		dpu_hs_scale_mode(hs, SCALER_UPSCALE);
+		dpu_hs_mode(hs, SCALER_ACTIVE);
+
+		lb_src_link = dpu_hs_get_link_id(hs);
+
+		dpu_plane_dbg(plane, "uses HScaler%u\n", dpu_hs_get_id(hs));
+	}
+
+	dprc = fu_ops->get_dprc(fu);
+
+	dpu_dprc_configure(dprc, dpu_crtc->stream_id,
+			   src_w, src_h, src_x, src_y,
+			   fb->pitches[0], fb->format, fb->modifier,
+			   baseaddr, uv_baseaddr,
+			   prefetch_start, fb_is_interlaced);
+
+	if (new_state->normalized_zpos == 0)
+		stage_link = dpu_cf_get_link_id(new_dpstate->stage.cf);
+	else
+		stage_link = dpu_lb_get_link_id(new_dpstate->stage.lb);
+
+	dpu_lb_pec_dynamic_prim_sel(lb, stage_link);
+	dpu_lb_pec_dynamic_sec_sel(lb, lb_src_link);
+	dpu_lb_mode(lb, LB_BLEND);
+	dpu_lb_blendcontrol(lb, new_state->normalized_zpos,
+			    new_state->pixel_blend_mode, new_state->alpha);
+	dpu_lb_pec_clken(lb, CLKEN_AUTOMATIC);
+	dpu_lb_position(lb, new_state->dst.x1, new_state->dst.y1);
+
+	dpu_plane_dbg(plane, "uses LayerBlend%u\n", dpu_lb_get_id(lb));
+
+	if (new_dpstate->is_top)
+		dpu_ed_pec_src_sel(grp->ed[dpu_crtc->stream_id],
+				   dpu_lb_get_link_id(lb));
+}
+
+static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= dpu_plane_atomic_check,
+	.atomic_update	= dpu_plane_atomic_update,
+};
+
+struct dpu_plane *dpu_plane_initialize(struct drm_device *drm,
+				       unsigned int possible_crtcs,
+				       struct dpu_plane_grp *grp,
+				       enum drm_plane_type type)
+{
+	struct dpu_plane *dpu_plane;
+	struct drm_plane *plane;
+	unsigned int zpos = dpu_plane_get_default_zpos(type);
+	int ret;
+
+	dpu_plane = kzalloc(sizeof(*dpu_plane), GFP_KERNEL);
+	if (!dpu_plane)
+		return ERR_PTR(-ENOMEM);
+
+	dpu_plane->grp = grp;
+
+	plane = &dpu_plane->base;
+
+	ret = drm_universal_plane_init(drm, plane, possible_crtcs,
+				       &dpu_plane_funcs,
+				       dpu_plane_formats,
+				       ARRAY_SIZE(dpu_plane_formats),
+				       dpu_plane_format_modifiers, type, NULL);
+	if (ret) {
+		/*
+		 * The plane is not added to the global plane list, so
+		 * free it manually.
+		 */
+		kfree(dpu_plane);
+		return ERR_PTR(ret);
+	}
+
+	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
+
+	ret = drm_plane_create_zpos_property(plane,
+					     zpos, 0, grp->hw_plane_cnt - 1);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_plane_create_alpha_property(plane);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_plane_create_blend_mode_property(plane,
+					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					BIT(DRM_MODE_BLEND_PREMULTI) |
+					BIT(DRM_MODE_BLEND_COVERAGE));
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_plane_create_color_properties(plane,
+					BIT(DRM_COLOR_YCBCR_BT601) |
+					BIT(DRM_COLOR_YCBCR_BT709),
+					BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+					BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					DRM_COLOR_YCBCR_BT709,
+					DRM_COLOR_YCBCR_LIMITED_RANGE);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return dpu_plane;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-plane.h b/drivers/gpu/drm/imx/dpu/dpu-plane.h
new file mode 100644
index 000000000000..7fe28d36be3e
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-plane.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#ifndef __DPU_PLANE_H__
+#define __DPU_PLANE_H__
+
+#include <linux/kernel.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_print.h>
+
+#include "dpu.h"
+
+#define dpu_plane_dbg(plane, fmt, ...)					\
+do {									\
+	typeof(plane) _plane = (plane);					\
+	drm_dbg_kms(_plane->dev, "[PLANE:%d:%s] " fmt,			\
+		    _plane->base.id, _plane->name, ##__VA_ARGS__);	\
+} while (0)
+
+struct dpu_plane {
+	struct drm_plane	base;
+	struct dpu_plane_grp	*grp;
+};
+
+union dpu_plane_stage {
+	struct dpu_constframe	*cf;
+	struct dpu_layerblend	*lb;
+	void			*ptr;
+};
+
+struct dpu_plane_state {
+	struct drm_plane_state	base;
+	union dpu_plane_stage	stage;
+	struct dpu_fetchunit	*source;
+	struct dpu_layerblend	*blend;
+	bool			is_top;
+};
+
+static inline struct dpu_plane *to_dpu_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct dpu_plane, base);
+}
+
+static inline struct dpu_plane_state *
+to_dpu_plane_state(struct drm_plane_state *plane_state)
+{
+	return container_of(plane_state, struct dpu_plane_state, base);
+}
+
+struct dpu_plane *dpu_plane_initialize(struct drm_device *drm,
+				       unsigned int possible_crtcs,
+				       struct dpu_plane_grp *grp,
+				       enum drm_plane_type type);
+#endif /* __DPU_PLANE_H__ */
diff --git a/drivers/gpu/drm/imx/dpu/dpu-prg.c b/drivers/gpu/drm/imx/dpu/dpu-prg.c
new file mode 100644
index 000000000000..33a1a3e468c9
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-prg.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2017-2020 NXP
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "dpu-prg.h"
+
+#define SET			0x4
+#define CLR			0x8
+#define TOG			0xc
+
+#define PRG_CTRL		0x00
+#define  BYPASS			BIT(0)
+#define  SC_DATA_TYPE_8BIT	0
+#define  SC_DATA_TYPE_10BIT	BIT(2)
+#define  UV_EN			BIT(3)
+#define  HANDSHAKE_MODE_4LINES	0
+#define  HANDSHAKE_MODE_8LINES	BIT(4)
+#define  SHADOW_LOAD_MODE	BIT(5)
+#define  DES_DATA_TYPE_32BPP	(0 << 16)
+#define  DES_DATA_TYPE_24BPP	(1 << 16)
+#define  DES_DATA_TYPE_16BPP	(2 << 16)
+#define  DES_DATA_TYPE_8BPP	(3 << 16)
+#define  SOFTRST		BIT(30)
+#define  SHADOW_EN		BIT(31)
+
+#define PRG_STATUS		0x10
+#define  BUFFER_VALID_B		BIT(1)
+#define  BUFFER_VALID_A		BIT(0)
+
+#define PRG_REG_UPDATE		0x20
+#define  REG_UPDATE		BIT(0)
+
+#define PRG_STRIDE		0x30
+#define  STRIDE(n)		(((n) - 1) & 0xffff)
+
+#define PRG_HEIGHT		0x40
+#define  HEIGHT(n)		(((n) - 1) & 0xffff)
+
+#define PRG_BADDR		0x50
+
+#define PRG_OFFSET		0x60
+#define  Y(n)			(((n) & 0x7) << 16)
+#define  X(n)			((n) & 0xffff)
+
+#define PRG_WIDTH		0x70
+#define  WIDTH(n)		(((n) - 1) & 0xffff)
+
+#define DPU_PRG_MAX_STRIDE	0x10000
+
+struct dpu_prg {
+	struct device *dev;
+	void __iomem *base;
+	struct list_head list;
+	struct clk *clk_apb;
+	struct clk *clk_rtram;
+	bool is_auxiliary;
+};
+
+static DEFINE_MUTEX(dpu_prg_list_mutex);
+static LIST_HEAD(dpu_prg_list);
+
+static inline u32 dpu_prg_read(struct dpu_prg *prg, unsigned int offset)
+{
+	return readl(prg->base + offset);
+}
+
+static inline void
+dpu_prg_write(struct dpu_prg *prg, unsigned int offset, u32 value)
+{
+	writel(value, prg->base + offset);
+}
+
+static void dpu_prg_reset(struct dpu_prg *prg)
+{
+	usleep_range(10, 20);
+	dpu_prg_write(prg, PRG_CTRL + SET, SOFTRST);
+	usleep_range(10, 20);
+	dpu_prg_write(prg, PRG_CTRL + CLR, SOFTRST);
+}
+
+void dpu_prg_enable(struct dpu_prg *prg)
+{
+	dpu_prg_write(prg, PRG_CTRL + CLR, BYPASS);
+}
+
+void dpu_prg_disable(struct dpu_prg *prg)
+{
+	dpu_prg_write(prg, PRG_CTRL, BYPASS);
+}
+
+static int dpu_prg_mod_to_mt_w(struct dpu_prg *prg, u64 modifier,
+			       unsigned int bits_per_pixel, unsigned int *mt_w)
+{
+	switch (modifier) {
+	case DRM_FORMAT_MOD_NONE:
+		*mt_w = 0;
+		break;
+	case DRM_FORMAT_MOD_VIVANTE_TILED:
+	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
+		*mt_w = (bits_per_pixel == 16) ? 8 : 4;
+		break;
+	default:
+		dev_err(prg->dev, "unsupported modifier 0x%016llx\n", modifier);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dpu_prg_mod_to_mt_h(struct dpu_prg *prg, u64 modifier,
+			       unsigned int *mt_h)
+{
+	switch (modifier) {
+	case DRM_FORMAT_MOD_NONE:
+		*mt_h = 0;
+		break;
+	case DRM_FORMAT_MOD_VIVANTE_TILED:
+	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
+		*mt_h = 4;
+		break;
+	default:
+		dev_err(prg->dev, "unsupported modifier 0x%016llx\n", modifier);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* address TKT343664: base address has to align to burst size */
+static unsigned int dpu_prg_burst_size_fixup(dma_addr_t baddr)
+{
+	unsigned int burst_size;
+
+	burst_size = 1 << __ffs(baddr);
+	burst_size = round_up(burst_size, 8);
+	burst_size = min(burst_size, 128U);
+
+	return burst_size;
+}
+
+/* address TKT339017: mismatch between burst size and stride */
+static unsigned int dpu_prg_stride_fixup(unsigned int stride,
+					 unsigned int burst_size,
+					 dma_addr_t baddr, u64 modifier)
+{
+	if (modifier)
+		stride = round_up(stride + round_up(baddr % 8, 8), burst_size);
+	else
+		stride = round_up(stride, burst_size);
+
+	return stride;
+}
+
+void dpu_prg_configure(struct dpu_prg *prg,
+		       unsigned int width, unsigned int height,
+		       unsigned int x_offset, unsigned int y_offset,
+		       unsigned int stride, unsigned int bits_per_pixel,
+		       dma_addr_t baddr,
+		       const struct drm_format_info *format, u64 modifier,
+		       bool start)
+{
+	unsigned int mt_w, mt_h;	/* micro-tile width/height */
+	unsigned int burst_size;
+	dma_addr_t _baddr;
+	u32 val;
+	int ret;
+
+	ret = dpu_prg_mod_to_mt_w(prg, modifier, bits_per_pixel, &mt_w);
+	ret |= dpu_prg_mod_to_mt_h(prg, modifier, &mt_h);
+	if (ret)
+		return;
+
+	if (modifier) {
+		x_offset %= mt_w;
+		y_offset %= mt_h;
+
+		/* consider x offset to calculate stride */
+		_baddr = baddr + (x_offset * (bits_per_pixel / 8));
+	} else {
+		x_offset = 0;
+		y_offset = 0;
+		_baddr = baddr;
+	}
+
+	burst_size = dpu_prg_burst_size_fixup(_baddr);
+
+	stride = dpu_prg_stride_fixup(stride, burst_size, _baddr, modifier);
+
+	/*
+	 * address TKT342628(part 1):
+	 * when prg stride is less or equals to burst size,
+	 * the auxiliary prg height needs to be a half
+	 */
+	if (prg->is_auxiliary && stride <= burst_size) {
+		height /= 2;
+		if (modifier)
+			y_offset /= 2;
+	}
+
+	dpu_prg_write(prg, PRG_STRIDE, STRIDE(stride));
+	dpu_prg_write(prg, PRG_WIDTH, WIDTH(width));
+	dpu_prg_write(prg, PRG_HEIGHT, HEIGHT(height));
+	dpu_prg_write(prg, PRG_OFFSET, X(x_offset) | Y(y_offset));
+	dpu_prg_write(prg, PRG_BADDR, baddr);
+
+	val = SHADOW_LOAD_MODE | SC_DATA_TYPE_8BIT | BYPASS;
+	if (format->format == DRM_FORMAT_NV21 ||
+	    format->format == DRM_FORMAT_NV12) {
+		val |= HANDSHAKE_MODE_8LINES;
+		/*
+		 * address TKT342628(part 2):
+		 * when prg stride is less or equals to burst size,
+		 * we disable UV_EN bit for the auxiliary prg
+		 */
+		if (prg->is_auxiliary && stride > burst_size)
+			val |= UV_EN;
+	} else {
+		val |= HANDSHAKE_MODE_4LINES;
+	}
+	switch (bits_per_pixel) {
+	case 32:
+		val |= DES_DATA_TYPE_32BPP;
+		break;
+	case 24:
+		val |= DES_DATA_TYPE_24BPP;
+		break;
+	case 16:
+		val |= DES_DATA_TYPE_16BPP;
+		break;
+	case 8:
+		val |= DES_DATA_TYPE_8BPP;
+		break;
+	}
+	/* no shadow for the first frame */
+	if (!start)
+		val |= SHADOW_EN;
+	dpu_prg_write(prg, PRG_CTRL, val);
+}
+
+void dpu_prg_reg_update(struct dpu_prg *prg)
+{
+	dpu_prg_write(prg, PRG_REG_UPDATE, REG_UPDATE);
+}
+
+void dpu_prg_shadow_enable(struct dpu_prg *prg)
+{
+	dpu_prg_write(prg, PRG_CTRL + SET, SHADOW_EN);
+}
+
+bool dpu_prg_stride_supported(struct dpu_prg *prg,
+			      unsigned int x_offset,
+			      unsigned int bits_per_pixel, u64 modifier,
+			      unsigned int stride, dma_addr_t baddr)
+{
+	unsigned int mt_w;	/* micro-tile width */
+	unsigned int burst_size;
+	int ret;
+
+	ret = dpu_prg_mod_to_mt_w(prg, modifier, bits_per_pixel, &mt_w);
+	if (ret)
+		return false;
+
+	if (modifier) {
+		x_offset %= mt_w;
+
+		/* consider x offset to calculate stride */
+		baddr += (x_offset * (bits_per_pixel / 8));
+	}
+
+	burst_size = dpu_prg_burst_size_fixup(baddr);
+
+	stride = dpu_prg_stride_fixup(stride, burst_size, baddr, modifier);
+
+	if (stride > DPU_PRG_MAX_STRIDE)
+		return false;
+
+	return true;
+}
+
+void dpu_prg_set_auxiliary(struct dpu_prg *prg)
+{
+	prg->is_auxiliary = true;
+}
+
+void dpu_prg_set_primary(struct dpu_prg *prg)
+{
+	prg->is_auxiliary = false;
+}
+
+struct dpu_prg *
+dpu_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
+{
+	struct device_node *prg_node = of_parse_phandle(dev->of_node,
+							name, index);
+	struct dpu_prg *prg;
+
+	mutex_lock(&dpu_prg_list_mutex);
+	list_for_each_entry(prg, &dpu_prg_list, list) {
+		if (prg_node == prg->dev->of_node) {
+			mutex_unlock(&dpu_prg_list_mutex);
+			device_link_add(dev, prg->dev,
+					DL_FLAG_PM_RUNTIME |
+					DL_FLAG_AUTOREMOVE_CONSUMER);
+			return prg;
+		}
+	}
+	mutex_unlock(&dpu_prg_list_mutex);
+
+	return NULL;
+}
+
+static const struct of_device_id dpu_prg_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-prg", },
+	{ .compatible = "fsl,imx8qxp-prg", },
+	{ /* sentinel */ },
+};
+
+static int dpu_prg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct dpu_prg *prg;
+	int ret;
+
+	prg = devm_kzalloc(dev, sizeof(*prg), GFP_KERNEL);
+	if (!prg)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	prg->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(prg->base))
+		return PTR_ERR(prg->base);
+
+	prg->clk_apb = devm_clk_get(dev, "apb");
+	if (IS_ERR(prg->clk_apb)) {
+		ret = PTR_ERR(prg->clk_apb);
+		dev_err_probe(dev, ret, "failed to get apb clock\n");
+		return ret;
+	}
+
+	prg->clk_rtram = devm_clk_get(dev, "rtram");
+	if (IS_ERR(prg->clk_rtram)) {
+		ret = PTR_ERR(prg->clk_rtram);
+		dev_err_probe(dev, ret, "failed to get rtram clock\n");
+		return ret;
+	}
+
+	prg->dev = dev;
+	platform_set_drvdata(pdev, prg);
+
+	pm_runtime_enable(dev);
+
+	mutex_lock(&dpu_prg_list_mutex);
+	list_add(&prg->list, &dpu_prg_list);
+	mutex_unlock(&dpu_prg_list_mutex);
+
+	return 0;
+}
+
+static int dpu_prg_remove(struct platform_device *pdev)
+{
+	struct dpu_prg *prg = platform_get_drvdata(pdev);
+
+	mutex_lock(&dpu_prg_list_mutex);
+	list_del(&prg->list);
+	mutex_unlock(&dpu_prg_list_mutex);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused dpu_prg_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dpu_prg *prg = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(prg->clk_rtram);
+	clk_disable_unprepare(prg->clk_apb);
+
+	return 0;
+}
+
+static int __maybe_unused dpu_prg_runtime_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dpu_prg *prg = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(prg->clk_apb);
+	if (ret) {
+		dev_err(dev, "failed to enable apb clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(prg->clk_rtram);
+	if (ret) {
+		dev_err(dev, "failed to enable rtramclock: %d\n", ret);
+		return ret;
+	}
+
+	dpu_prg_reset(prg);
+
+	return ret;
+}
+
+static const struct dev_pm_ops dpu_prg_pm_ops = {
+	SET_RUNTIME_PM_OPS(dpu_prg_runtime_suspend,
+			   dpu_prg_runtime_resume, NULL)
+};
+
+struct platform_driver dpu_prg_driver = {
+	.probe = dpu_prg_probe,
+	.remove = dpu_prg_remove,
+	.driver = {
+		.pm = &dpu_prg_pm_ops,
+		.name = "dpu-prg",
+		.of_match_table = dpu_prg_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dpu/dpu-prg.h b/drivers/gpu/drm/imx/dpu/dpu-prg.h
new file mode 100644
index 000000000000..550e35034035
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-prg.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright 2017-2020 NXP
+ */
+
+#ifndef _DPU_PRG_H_
+#define _DPU_PRG_H_
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include <drm/drm_fourcc.h>
+
+struct dpu_prg;
+
+void dpu_prg_enable(struct dpu_prg *prg);
+
+void dpu_prg_disable(struct dpu_prg *prg);
+
+void dpu_prg_configure(struct dpu_prg *prg,
+		       unsigned int width, unsigned int height,
+		       unsigned int x_offset, unsigned int y_offset,
+		       unsigned int stride, unsigned int bits_per_pixel,
+		       dma_addr_t baddr,
+		       const struct drm_format_info *format, u64 modifier,
+		       bool start);
+
+void dpu_prg_reg_update(struct dpu_prg *prg);
+
+void dpu_prg_shadow_enable(struct dpu_prg *prg);
+
+bool dpu_prg_stride_supported(struct dpu_prg *prg,
+			      unsigned int x_offset,
+			      unsigned int bits_per_pixel, u64 modifier,
+			      unsigned int stride, dma_addr_t baddr);
+
+void dpu_prg_set_auxiliary(struct dpu_prg *prg);
+
+void dpu_prg_set_primary(struct dpu_prg *prg);
+
+struct dpu_prg *
+dpu_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
+
+#endif
diff --git a/drivers/gpu/drm/imx/dpu/dpu-prv.h b/drivers/gpu/drm/imx/dpu/dpu-prv.h
new file mode 100644
index 000000000000..6fc2f6b73cd2
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-prv.h
@@ -0,0 +1,231 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020 NXP
+ */
+
+#ifndef __DPU_PRV_H__
+#define __DPU_PRV_H__
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/irqdomain.h>
+
+#include "dpu.h"
+
+/* DPU common control registers */
+#define DPU_COMCTRL_REG(offset)		(offset)
+
+#define IPIDENTIFIER			DPU_COMCTRL_REG(0x0)
+#define LOCKUNLOCK			DPU_COMCTRL_REG(0x40)
+#define LOCKSTATUS			DPU_COMCTRL_REG(0x44)
+#define USERINTERRUPTMASK(n)		DPU_COMCTRL_REG(0x48 + 4 * (n))
+#define INTERRUPTENABLE(n)		DPU_COMCTRL_REG(0x50 + 4 * (n))
+#define INTERRUPTPRESET(n)		DPU_COMCTRL_REG(0x58 + 4 * (n))
+#define INTERRUPTCLEAR(n)		DPU_COMCTRL_REG(0x60 + 4 * (n))
+#define INTERRUPTSTATUS(n)		DPU_COMCTRL_REG(0x68 + 4 * (n))
+#define USERINTERRUPTENABLE(n)		DPU_COMCTRL_REG(0x80 + 4 * (n))
+#define USERINTERRUPTPRESET(n)		DPU_COMCTRL_REG(0x88 + 4 * (n))
+#define USERINTERRUPTCLEAR(n)		DPU_COMCTRL_REG(0x90 + 4 * (n))
+#define USERINTERRUPTSTATUS(n)		DPU_COMCTRL_REG(0x98 + 4 * (n))
+#define GENERALPURPOSE			DPU_COMCTRL_REG(0x100)
+
+#define DPU_SAFETY_STREAM_OFFSET	4
+
+/* shadow enable bit for several DPU units */
+#define SHDEN				BIT(0)
+
+/* Pixel Engine Configuration register fields */
+#define CLKEN_MASK_SHIFT		24
+#define CLKEN_MASK			(0x3 << CLKEN_MASK_SHIFT)
+#define CLKEN(n)			((n) << CLKEN_MASK_SHIFT)
+
+/* H/Vscaler register fields */
+#define SCALE_FACTOR_MASK		0xfffff
+#define SCALE_FACTOR(n)			((n) & 0xfffff)
+#define PHASE_OFFSET_MASK		0x1fffff
+#define PHASE_OFFSET(n)			((n) & 0x1fffff)
+#define OUTPUT_SIZE_MASK		0x3fff0000
+#define OUTPUT_SIZE(n)			((((n) - 1) << 16) & OUTPUT_SIZE_MASK)
+#define FILTER_MODE_MASK		0x100
+#define FILTER_MODE(n)			((n) << 8)
+#define SCALE_MODE_MASK			0x10
+#define SCALE_MODE(n)			((n) << 4)
+
+enum dpu_irq {
+	DPU_IRQ_STORE9_SHDLOAD		 = 0,
+	DPU_IRQ_STORE9_FRAMECOMPLETE	 = 1,
+	DPU_IRQ_STORE9_SEQCOMPLETE	 = 2,
+	DPU_IRQ_EXTDST0_SHDLOAD		 = 3,
+	DPU_IRQ_EXTDST0_FRAMECOMPLETE	 = 4,
+	DPU_IRQ_EXTDST0_SEQCOMPLETE	 = 5,
+	DPU_IRQ_EXTDST4_SHDLOAD		 = 6,
+	DPU_IRQ_EXTDST4_FRAMECOMPLETE	 = 7,
+	DPU_IRQ_EXTDST4_SEQCOMPLETE	 = 8,
+	DPU_IRQ_EXTDST1_SHDLOAD		 = 9,
+	DPU_IRQ_EXTDST1_FRAMECOMPLETE	 = 10,
+	DPU_IRQ_EXTDST1_SEQCOMPLETE	 = 11,
+	DPU_IRQ_EXTDST5_SHDLOAD		 = 12,
+	DPU_IRQ_EXTDST5_FRAMECOMPLETE	 = 13,
+	DPU_IRQ_EXTDST5_SEQCOMPLETE	 = 14,
+	DPU_IRQ_DISENGCFG_SHDLOAD0	 = 15,
+	DPU_IRQ_DISENGCFG_FRAMECOMPLETE0 = 16,
+	DPU_IRQ_DISENGCFG_SEQCOMPLETE0	 = 17,
+	DPU_IRQ_FRAMEGEN0_INT0		 = 18,
+	DPU_IRQ_FRAMEGEN0_INT1		 = 19,
+	DPU_IRQ_FRAMEGEN0_INT2		 = 20,
+	DPU_IRQ_FRAMEGEN0_INT3		 = 21,
+	DPU_IRQ_SIG0_SHDLOAD		 = 22,
+	DPU_IRQ_SIG0_VALID		 = 23,
+	DPU_IRQ_SIG0_ERROR		 = 24,
+	DPU_IRQ_DISENGCFG_SHDLOAD1	 = 25,
+	DPU_IRQ_DISENGCFG_FRAMECOMPLETE1 = 26,
+	DPU_IRQ_DISENGCFG_SEQCOMPLETE1	 = 27,
+	DPU_IRQ_FRAMEGEN1_INT0		 = 28,
+	DPU_IRQ_FRAMEGEN1_INT1		 = 29,
+	DPU_IRQ_FRAMEGEN1_INT2		 = 30,
+	DPU_IRQ_FRAMEGEN1_INT3		 = 31,
+	DPU_IRQ_SIG1_SHDLOAD		 = 32,
+	DPU_IRQ_SIG1_VALID		 = 33,
+	DPU_IRQ_SIG1_ERROR		 = 34,
+	DPU_IRQ_RESERVED		 = 35,
+	DPU_IRQ_CMDSEQ_ERROR		 = 36,
+	DPU_IRQ_COMCTRL_SW0		 = 37,
+	DPU_IRQ_COMCTRL_SW1		 = 38,
+	DPU_IRQ_COMCTRL_SW2		 = 39,
+	DPU_IRQ_COMCTRL_SW3		 = 40,
+	DPU_IRQ_FRAMEGEN0_PRIMSYNC_ON	 = 41,
+	DPU_IRQ_FRAMEGEN0_PRIMSYNC_OFF	 = 42,
+	DPU_IRQ_FRAMEGEN0_SECSYNC_ON	 = 43,
+	DPU_IRQ_FRAMEGEN0_SECSYNC_OFF	 = 44,
+	DPU_IRQ_FRAMEGEN1_PRIMSYNC_ON	 = 45,
+	DPU_IRQ_FRAMEGEN1_PRIMSYNC_OFF	 = 46,
+	DPU_IRQ_FRAMEGEN1_SECSYNC_ON	 = 47,
+	DPU_IRQ_FRAMEGEN1_SECSYNC_OFF	 = 48,
+	DPU_IRQ_COUNT			 = 49,
+};
+
+enum dpu_unit_type {
+	DPU_DISP,
+	DPU_BLIT,
+};
+
+struct dpu_soc {
+	struct device		*dev;
+
+	struct device		*pd_dc_dev;
+	struct device		*pd_pll0_dev;
+	struct device		*pd_pll1_dev;
+	struct device_link	*pd_dc_link;
+	struct device_link	*pd_pll0_link;
+	struct device_link	*pd_pll1_link;
+
+	void __iomem		*comctrl_reg;
+
+	struct clk		*clk_cfg;
+	struct clk		*clk_axi;
+
+	int			irq[DPU_IRQ_COUNT];
+
+	struct irq_domain	*domain;
+
+	struct dpu_constframe	*cf_priv[4];
+	struct dpu_disengcfg	*dec_priv[2];
+	struct dpu_extdst	*ed_priv[4];
+	struct dpu_fetchunit	*fd_priv[3];
+	struct dpu_fetchunit	*fe_priv[4];
+	struct dpu_framegen	*fg_priv[2];
+	struct dpu_fetchunit	*fl_priv[1];
+	struct dpu_fetchunit	*fw_priv[2];
+	struct dpu_gammacor	*gc_priv[2];
+	struct dpu_hscaler	*hs_priv[3];
+	struct dpu_layerblend	*lb_priv[4];
+	struct dpu_tcon		*tcon_priv[2];
+	struct dpu_vscaler	*vs_priv[3];
+};
+
+struct dpu_units {
+	const unsigned int *ids;
+	const enum dpu_unit_type *types;
+	const unsigned long *ofss;
+	const unsigned long *pec_ofss;	/* Pixel Engine Configuration */
+	const unsigned int cnt;
+	const char *name;
+
+	/* software initialization */
+	int (*init)(struct dpu_soc *dpu, unsigned int index,
+		    unsigned int id, enum dpu_unit_type type,
+		    unsigned long pec_base, unsigned long base);
+
+	/* hardware initialization */
+	void (*hw_init)(struct dpu_soc *dpu, unsigned int index);
+};
+
+void dpu_cf_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_dec_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_ed_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_fd_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_fe_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_fg_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_fl_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_fw_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_gc_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_hs_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_lb_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_tcon_hw_init(struct dpu_soc *dpu, unsigned int index);
+void dpu_vs_hw_init(struct dpu_soc *dpu, unsigned int index);
+
+int dpu_cf_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base);
+
+int dpu_dec_init(struct dpu_soc *dpu, unsigned int index,
+		 unsigned int id, enum dpu_unit_type type,
+		 unsigned long unused, unsigned long base);
+
+int dpu_ed_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base);
+
+int dpu_fd_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base);
+
+int dpu_fe_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base);
+
+int dpu_fg_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long unused, unsigned long base);
+
+int dpu_fl_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base);
+
+int dpu_fw_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base);
+
+int dpu_gc_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long unused, unsigned long base);
+
+int dpu_hs_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base);
+
+int dpu_lb_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base);
+
+int dpu_tcon_init(struct dpu_soc *dpu, unsigned int index,
+		  unsigned int id, enum dpu_unit_type type,
+		  unsigned long unused, unsigned long base);
+
+int dpu_vs_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base);
+
+#endif /* __DPU_PRV_H__ */
diff --git a/drivers/gpu/drm/imx/dpu/dpu-tcon.c b/drivers/gpu/drm/imx/dpu/dpu-tcon.c
new file mode 100644
index 000000000000..143f51f7b111
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-tcon.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020 NXP
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu.h"
+#include "dpu-prv.h"
+
+#define SSQCNTS			0x0
+#define SSQCYCLE		0x408
+#define SWRESET			0x40c
+
+#define TCON_CTRL		0x410
+#define  CTRL_RST_VAL		0x01401408
+#define  BYPASS			BIT(3)
+
+#define RSDSINVCTRL		0x414
+
+/* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
+#define MAPBIT3_0		0x418
+#define MAPBIT7_4		0x41c
+#define MAPBIT11_8		0x420
+#define MAPBIT15_12		0x424
+#define MAPBIT19_16		0x428
+#define MAPBIT23_20		0x42c
+#define MAPBIT27_24		0x430
+#define MAPBIT31_28		0x434
+#define MAPBIT34_32		0x438
+#define MAPBIT3_0_DUAL		0x43c
+#define MAPBIT7_4_DUAL		0x440
+#define MAPBIT11_8_DUAL		0x444
+#define MAPBIT15_12_DUAL	0x448
+#define MAPBIT19_16_DUAL	0x44c
+#define MAPBIT23_20_DUAL	0x450
+#define MAPBIT27_24_DUAL	0x454
+#define MAPBIT31_28_DUAL	0x458
+#define MAPBIT34_32_DUAL	0x45c
+
+#define SPGPOSON(n)		(0x460 + (n) * 16)
+#define SPGMASKON(n)		(0x464 + (n) * 16)
+#define SPGPOSOFF(n)		(0x468 + (n) * 16)
+#define SPGMASKOFF(n)		(0x46c + (n) * 16)
+#define  X(n)			(((n) & 0x7fff) << 16)
+#define  Y(n)			((n) & 0x7fff)
+
+#define SMXSIGS(n)		(0x520 + (n) * 8)
+#define SMXFCTTABLE(n)		(0x524 + (n) * 8)
+#define RESET_OVER_UNFERFLOW	0x580
+#define DUAL_DEBUG		0x584
+
+struct dpu_tcon {
+	void __iomem *base;
+	struct mutex mutex;
+	unsigned int id;
+	unsigned int index;
+	bool inuse;
+	struct dpu_soc *dpu;
+};
+
+static inline u32 dpu_tcon_read(struct dpu_tcon *tcon, unsigned int offset)
+{
+	return readl(tcon->base + offset);
+}
+
+static inline void dpu_tcon_write(struct dpu_tcon *tcon,
+				  unsigned int offset, u32 value)
+{
+	writel(value, tcon->base + offset);
+}
+
+static inline void dpu_tcon_write_mask(struct dpu_tcon *tcon,
+				       unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_tcon_read(tcon, offset);
+	tmp &= ~mask;
+	dpu_tcon_write(tcon, offset, tmp | value);
+}
+
+void dpu_tcon_set_fmt(struct dpu_tcon *tcon)
+{
+	/*
+	 * The pixels reach TCON are always in 30-bit BGR format.
+	 * The first bridge always receives pixels in 30-bit RGB format.
+	 * So, map the format to MEDIA_BUS_FMT_RGB101010_1X30.
+	 */
+	dpu_tcon_write(tcon, MAPBIT3_0,   0x17161514);
+	dpu_tcon_write(tcon, MAPBIT7_4,   0x1b1a1918);
+	dpu_tcon_write(tcon, MAPBIT11_8,  0x0b0a1d1c);
+	dpu_tcon_write(tcon, MAPBIT15_12, 0x0f0e0d0c);
+	dpu_tcon_write(tcon, MAPBIT19_16, 0x13121110);
+	dpu_tcon_write(tcon, MAPBIT23_20, 0x03020100);
+	dpu_tcon_write(tcon, MAPBIT27_24, 0x07060504);
+	dpu_tcon_write(tcon, MAPBIT31_28, 0x00000908);
+}
+
+void dpu_tcon_set_operation_mode(struct dpu_tcon *tcon)
+{
+	dpu_tcon_write_mask(tcon, TCON_CTRL, BYPASS, 0);
+}
+
+void dpu_tcon_cfg_videomode(struct dpu_tcon *tcon, struct drm_display_mode *m)
+{
+	int hdisplay, hsync_start, hsync_end;
+	int vdisplay, vsync_start, vsync_end;
+	int y;
+
+	hdisplay = m->hdisplay;
+	vdisplay = m->vdisplay;
+	hsync_start = m->hsync_start;
+	vsync_start = m->vsync_start;
+	hsync_end = m->hsync_end;
+	vsync_end = m->vsync_end;
+
+	/*
+	 * TKT320590:
+	 * Turn TCON into operation mode later after the first dumb frame is
+	 * generated by DPU.  This makes DPR/PRG be able to evade the frame.
+	 */
+	dpu_tcon_write_mask(tcon, TCON_CTRL, BYPASS, BYPASS);
+
+	/* dsp_control[0]: hsync */
+	dpu_tcon_write(tcon, SPGPOSON(0), X(hsync_start));
+	dpu_tcon_write(tcon, SPGMASKON(0), 0xffff);
+
+	dpu_tcon_write(tcon, SPGPOSOFF(0), X(hsync_end));
+	dpu_tcon_write(tcon, SPGMASKOFF(0), 0xffff);
+
+	dpu_tcon_write(tcon, SMXSIGS(0), 0x2);
+	dpu_tcon_write(tcon, SMXFCTTABLE(0), 0x1);
+
+	/* dsp_control[1]: vsync */
+	dpu_tcon_write(tcon, SPGPOSON(1), X(hsync_start) | Y(vsync_start - 1));
+	dpu_tcon_write(tcon, SPGMASKON(1), 0x0);
+
+	dpu_tcon_write(tcon, SPGPOSOFF(1), X(hsync_start) | Y(vsync_end - 1));
+	dpu_tcon_write(tcon, SPGMASKOFF(1), 0x0);
+
+	dpu_tcon_write(tcon, SMXSIGS(1), 0x3);
+	dpu_tcon_write(tcon, SMXFCTTABLE(1), 0x1);
+
+	/* dsp_control[2]: data enable */
+	/* horizontal */
+	dpu_tcon_write(tcon, SPGPOSON(2), 0x0);
+	dpu_tcon_write(tcon, SPGMASKON(2), 0xffff);
+
+	dpu_tcon_write(tcon, SPGPOSOFF(2), X(hdisplay));
+	dpu_tcon_write(tcon, SPGMASKOFF(2), 0xffff);
+
+	/* vertical */
+	dpu_tcon_write(tcon, SPGPOSON(3), 0x0);
+	dpu_tcon_write(tcon, SPGMASKON(3), 0x7fff0000);
+
+	dpu_tcon_write(tcon, SPGPOSOFF(3), Y(vdisplay));
+	dpu_tcon_write(tcon, SPGMASKOFF(3), 0x7fff0000);
+
+	dpu_tcon_write(tcon, SMXSIGS(2), 0x2c);
+	dpu_tcon_write(tcon, SMXFCTTABLE(2), 0x8);
+
+	/* dsp_control[3]: kachuck */
+	y = vdisplay + 1;
+
+	dpu_tcon_write(tcon, SPGPOSON(4), X(0x0) | Y(y));
+	dpu_tcon_write(tcon, SPGMASKON(4), 0x0);
+
+	dpu_tcon_write(tcon, SPGPOSOFF(4), X(0x20) | Y(y));
+	dpu_tcon_write(tcon, SPGMASKOFF(4), 0x0);
+
+	dpu_tcon_write(tcon, SMXSIGS(3), 0x6);
+	dpu_tcon_write(tcon, SMXFCTTABLE(3), 0x2);
+}
+
+struct dpu_tcon *dpu_tcon_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_tcon *tcon;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->tcon_priv); i++) {
+		tcon = dpu->tcon_priv[i];
+		if (tcon->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->tcon_priv))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&tcon->mutex);
+
+	if (tcon->inuse) {
+		mutex_unlock(&tcon->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	tcon->inuse = true;
+
+	mutex_unlock(&tcon->mutex);
+
+	return tcon;
+}
+
+void dpu_tcon_put(struct dpu_tcon *tcon)
+{
+	if (IS_ERR_OR_NULL(tcon))
+		return;
+
+	mutex_lock(&tcon->mutex);
+
+	tcon->inuse = false;
+
+	mutex_unlock(&tcon->mutex);
+}
+
+void dpu_tcon_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
+	dpu_tcon_write(dpu->tcon_priv[index], TCON_CTRL, CTRL_RST_VAL);
+}
+
+int dpu_tcon_init(struct dpu_soc *dpu, unsigned int index,
+		  unsigned int id, enum dpu_unit_type type,
+		  unsigned long unused, unsigned long base)
+{
+	struct dpu_tcon *tcon;
+
+	tcon = devm_kzalloc(dpu->dev, sizeof(*tcon), GFP_KERNEL);
+	if (!tcon)
+		return -ENOMEM;
+
+	dpu->tcon_priv[index] = tcon;
+
+	tcon->base = devm_ioremap(dpu->dev, base, SZ_2K);
+	if (!tcon->base)
+		return -ENOMEM;
+
+	tcon->dpu = dpu;
+	tcon->id = id;
+	tcon->index = index;
+
+	mutex_init(&tcon->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu-vscaler.c b/drivers/gpu/drm/imx/dpu/dpu-vscaler.c
new file mode 100644
index 000000000000..140c014d944f
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu-vscaler.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2017-2020,2022 NXP
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/sizes.h>
+
+#include "dpu.h"
+#include "dpu-prv.h"
+
+#define PIXENGCFG_DYNAMIC		0x8
+#define  PIXENGCFG_DYNAMIC_SRC_SEL_MASK	0x3f
+
+#define STATICCONTROL			0x8
+
+#define SETUP(n)			(0xc + ((n) - 1) * 0x4)
+
+#define CONTROL				0x20
+#define  FIELD_MODE_MASK		0x3000
+#define  FIELD_MODE(n)			((n) << 12)
+#define  CTRL_MODE_MASK			BIT(0)
+
+struct dpu_vscaler {
+	void __iomem *pec_base;
+	void __iomem *base;
+	struct mutex mutex;
+	unsigned int id;
+	unsigned int index;
+	enum dpu_link_id link_id;
+	bool inuse;
+	struct dpu_soc *dpu;
+};
+
+static const enum dpu_link_id dpu_vs_link_id[] = {
+	LINK_ID_VSCALER4, LINK_ID_VSCALER5, LINK_ID_VSCALER9
+};
+
+static const enum dpu_link_id src_sels[3][4] = {
+	{
+		LINK_ID_NONE,
+		LINK_ID_FETCHDECODE0,
+		LINK_ID_MATRIX4,
+		LINK_ID_HSCALER4,
+	}, {
+		LINK_ID_NONE,
+		LINK_ID_FETCHDECODE1,
+		LINK_ID_MATRIX5,
+		LINK_ID_HSCALER5,
+	}, {
+		LINK_ID_NONE,
+		LINK_ID_MATRIX9,
+		LINK_ID_HSCALER9,
+	},
+};
+
+static inline u32 dpu_pec_vs_read(struct dpu_vscaler *vs,
+				  unsigned int offset)
+{
+	return readl(vs->pec_base + offset);
+}
+
+static inline void dpu_pec_vs_write(struct dpu_vscaler *vs,
+				    unsigned int offset, u32 value)
+{
+	writel(value, vs->pec_base + offset);
+}
+
+static inline void dpu_pec_vs_write_mask(struct dpu_vscaler *vs,
+					 unsigned int offset,
+					 u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_pec_vs_read(vs, offset);
+	tmp &= ~mask;
+	dpu_pec_vs_write(vs, offset, tmp | value);
+}
+
+static inline u32 dpu_vs_read(struct dpu_vscaler *vs, unsigned int offset)
+{
+	return readl(vs->base + offset);
+}
+
+static inline void dpu_vs_write(struct dpu_vscaler *vs,
+				unsigned int offset, u32 value)
+{
+	writel(value, vs->base + offset);
+}
+
+static inline void dpu_vs_write_mask(struct dpu_vscaler *vs,
+				     unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dpu_vs_read(vs, offset);
+	tmp &= ~mask;
+	dpu_vs_write(vs, offset, tmp | value);
+}
+
+enum dpu_link_id dpu_vs_get_link_id(struct dpu_vscaler *vs)
+{
+	return vs->link_id;
+}
+
+void dpu_vs_pec_dynamic_src_sel(struct dpu_vscaler *vs, enum dpu_link_id src)
+{
+	struct dpu_soc *dpu = vs->dpu;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(src_sels[vs->index]); i++) {
+		if (src_sels[vs->index][i] == src) {
+			dpu_pec_vs_write_mask(vs, PIXENGCFG_DYNAMIC,
+					      PIXENGCFG_DYNAMIC_SRC_SEL_MASK,
+					      src);
+			return;
+		}
+	}
+
+	dev_err(dpu->dev, "VScaler%u - invalid source 0x%02x\n", vs->id, src);
+}
+
+void dpu_vs_pec_clken(struct dpu_vscaler *vs, enum dpu_pec_clken clken)
+{
+	dpu_pec_vs_write_mask(vs, PIXENGCFG_DYNAMIC, CLKEN_MASK, CLKEN(clken));
+}
+
+static void dpu_vs_enable_shden(struct dpu_vscaler *vs)
+{
+	dpu_vs_write_mask(vs, STATICCONTROL, SHDEN, SHDEN);
+}
+
+void dpu_vs_setup1(struct dpu_vscaler *vs,
+		   unsigned int src_w, unsigned int dst_w, bool deinterlace)
+{
+	struct dpu_soc *dpu = vs->dpu;
+	u32 scale_factor;
+	u64 tmp64;
+
+	if (deinterlace)
+		dst_w *= 2;
+
+	if (src_w == dst_w) {
+		scale_factor = 0x80000;
+	} else {
+		if (src_w > dst_w) {
+			tmp64 = (u64)((u64)dst_w * 0x80000);
+			do_div(tmp64, src_w);
+
+		} else {
+			tmp64 = (u64)((u64)src_w * 0x80000);
+			do_div(tmp64, dst_w);
+		}
+		scale_factor = (u32)tmp64;
+	}
+
+	if (scale_factor > 0x80000) {
+		dev_err(dpu->dev, "VScaler%u - invalid scale factor 0x%08x\n",
+			vs->id, scale_factor);
+		return;
+	}
+
+	dpu_vs_write(vs, SETUP(1), SCALE_FACTOR(scale_factor));
+
+	dev_dbg(dpu->dev, "VScaler%u - scale factor 0x%08x\n",
+		vs->id, scale_factor);
+}
+
+void dpu_vs_setup2(struct dpu_vscaler *vs, bool deinterlace)
+{
+	/* 0x20000: +0.25 phase offset for deinterlace */
+	u32 phase_offset = deinterlace ? 0x20000 : 0;
+
+	dpu_vs_write(vs, SETUP(2), PHASE_OFFSET(phase_offset));
+}
+
+void dpu_vs_setup3(struct dpu_vscaler *vs, bool deinterlace)
+{
+	/* 0x1e0000: -0.25 phase offset for deinterlace */
+	u32 phase_offset = deinterlace ? 0x1e0000 : 0;
+
+	dpu_vs_write(vs, SETUP(3), PHASE_OFFSET(phase_offset));
+}
+
+void dpu_vs_setup4(struct dpu_vscaler *vs, u32 phase_offset)
+{
+	dpu_vs_write(vs, SETUP(4), PHASE_OFFSET(phase_offset));
+}
+
+void dpu_vs_setup5(struct dpu_vscaler *vs, u32 phase_offset)
+{
+	dpu_vs_write(vs, SETUP(5), PHASE_OFFSET(phase_offset));
+}
+
+void dpu_vs_output_size(struct dpu_vscaler *vs, u32 line_num)
+{
+	dpu_vs_write_mask(vs, CONTROL, OUTPUT_SIZE_MASK, OUTPUT_SIZE(line_num));
+}
+
+void dpu_vs_field_mode(struct dpu_vscaler *vs, enum dpu_scaler_field_mode m)
+{
+	dpu_vs_write_mask(vs, CONTROL, FIELD_MODE_MASK, FIELD_MODE(m));
+}
+
+void dpu_vs_filter_mode(struct dpu_vscaler *vs, enum dpu_scaler_filter_mode m)
+{
+	dpu_vs_write_mask(vs, CONTROL, FILTER_MODE_MASK, FILTER_MODE(m));
+}
+
+void dpu_vs_scale_mode(struct dpu_vscaler *vs, enum dpu_scaler_scale_mode m)
+{
+	dpu_vs_write_mask(vs, CONTROL, SCALE_MODE_MASK, SCALE_MODE(m));
+}
+
+void dpu_vs_mode(struct dpu_vscaler *vs, enum dpu_scaler_mode m)
+{
+	dpu_vs_write_mask(vs, CONTROL, CTRL_MODE_MASK, m);
+}
+
+unsigned int dpu_vs_get_id(struct dpu_vscaler *vs)
+{
+	return vs->id;
+}
+
+struct dpu_vscaler *dpu_vs_get(struct dpu_soc *dpu, unsigned int id)
+{
+	struct dpu_vscaler *vs;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpu->vs_priv); i++) {
+		vs = dpu->vs_priv[i];
+		if (vs->id == id)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(dpu->vs_priv))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&vs->mutex);
+
+	if (vs->inuse) {
+		mutex_unlock(&vs->mutex);
+		return ERR_PTR(-EBUSY);
+	}
+
+	vs->inuse = true;
+
+	mutex_unlock(&vs->mutex);
+
+	return vs;
+}
+
+void dpu_vs_put(struct dpu_vscaler *vs)
+{
+	if (IS_ERR_OR_NULL(vs))
+		return;
+
+	mutex_lock(&vs->mutex);
+
+	vs->inuse = false;
+
+	mutex_unlock(&vs->mutex);
+}
+
+void dpu_vs_hw_init(struct dpu_soc *dpu, unsigned int index)
+{
+	struct dpu_vscaler *vs = dpu->vs_priv[index];
+
+	dpu_vs_enable_shden(vs);
+	dpu_vs_setup2(vs, false);
+	dpu_vs_setup3(vs, false);
+	dpu_vs_setup4(vs, 0);
+	dpu_vs_setup5(vs, 0);
+	dpu_vs_pec_dynamic_src_sel(vs, LINK_ID_NONE);
+}
+
+int dpu_vs_init(struct dpu_soc *dpu, unsigned int index,
+		unsigned int id, enum dpu_unit_type type,
+		unsigned long pec_base, unsigned long base)
+{
+	struct dpu_vscaler *vs;
+
+	vs = devm_kzalloc(dpu->dev, sizeof(*vs), GFP_KERNEL);
+	if (!vs)
+		return -ENOMEM;
+
+	dpu->vs_priv[index] = vs;
+
+	vs->pec_base = devm_ioremap(dpu->dev, pec_base, SZ_16);
+	if (!vs->pec_base)
+		return -ENOMEM;
+
+	vs->base = devm_ioremap(dpu->dev, base, SZ_32);
+	if (!vs->base)
+		return -ENOMEM;
+
+	vs->dpu = dpu;
+	vs->id = id;
+	vs->index = index;
+	vs->link_id = dpu_vs_link_id[index];
+
+	mutex_init(&vs->mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dpu/dpu.h b/drivers/gpu/drm/imx/dpu/dpu.h
new file mode 100644
index 000000000000..ef012e2002f0
--- /dev/null
+++ b/drivers/gpu/drm/imx/dpu/dpu.h
@@ -0,0 +1,385 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020 NXP
+ */
+
+#ifndef __DPU_H__
+#define __DPU_H__
+
+#include <linux/of.h>
+#include <linux/types.h>
+
+#include <drm/drm_color_mgmt.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_modes.h>
+
+#define DPU_FRAMEGEN_MAX_FRAME_INDEX	0x3ffff
+#define DPU_FRAMEGEN_MAX_CLOCK		300000	/* in KHz */
+
+#define DPU_FETCHUNIT_CAP_USE_FETCHECO	BIT(0)
+#define DPU_FETCHUNIT_CAP_USE_SCALER	BIT(1)
+#define DPU_FETCHUNIT_CAP_PACKED_YUV422	BIT(2)
+
+struct dpu_dprc;
+struct dpu_fetchunit;
+struct dpu_soc;
+
+enum dpu_link_id {
+	LINK_ID_NONE		= 0x00,
+	LINK_ID_FETCHDECODE9	= 0x01,
+	LINK_ID_FETCHWARP9	= 0x02,
+	LINK_ID_FETCHECO9	= 0x03,
+	LINK_ID_ROP9		= 0x04,
+	LINK_ID_CLUT9		= 0x05,
+	LINK_ID_MATRIX9		= 0x06,
+	LINK_ID_HSCALER9	= 0x07,
+	LINK_ID_VSCALER9	= 0x08,
+	LINK_ID_FILTER9		= 0x09,
+	LINK_ID_BLITBLEND9	= 0x0a,
+	LINK_ID_CONSTFRAME0	= 0x0c,
+	LINK_ID_CONSTFRAME4	= 0x0e,
+	LINK_ID_CONSTFRAME1	= 0x10,
+	LINK_ID_CONSTFRAME5	= 0x12,
+	LINK_ID_FETCHWARP2	= 0x14,
+	LINK_ID_FETCHECO2	= 0x15,
+	LINK_ID_FETCHDECODE0	= 0x16,
+	LINK_ID_FETCHECO0	= 0x17,
+	LINK_ID_FETCHDECODE1	= 0x18,
+	LINK_ID_FETCHECO1	= 0x19,
+	LINK_ID_FETCHLAYER0	= 0x1a,
+	LINK_ID_MATRIX4		= 0x1b,
+	LINK_ID_HSCALER4	= 0x1c,
+	LINK_ID_VSCALER4	= 0x1d,
+	LINK_ID_MATRIX5		= 0x1e,
+	LINK_ID_HSCALER5	= 0x1f,
+	LINK_ID_VSCALER5	= 0x20,
+	LINK_ID_LAYERBLEND0	= 0x21,
+	LINK_ID_LAYERBLEND1	= 0x22,
+	LINK_ID_LAYERBLEND2	= 0x23,
+	LINK_ID_LAYERBLEND3	= 0x24,
+};
+
+enum dpu_fg_syncmode {
+	FG_SYNCMODE_OFF,	/* No side-by-side synchronization. */
+	FG_SYNCMODE_MASTER,	/* Framegen is master. */
+	FG_SYNCMODE_SLAVE_CYC,	/* Runs in cyclic synchronization mode. */
+	FG_SYNCMODE_SLAVE_ONCE,	/* Runs in one time synchronization mode. */
+};
+
+enum dpu_fg_dm {
+	FG_DM_BLACK,
+	FG_DM_CONSTCOL,	/* Constant Color Background is shown. */
+	FG_DM_PRIM,
+	FG_DM_SEC,
+	FG_DM_PRIM_ON_TOP,
+	FG_DM_SEC_ON_TOP,
+	FG_DM_TEST,	/* White color background with test pattern is shown. */
+};
+
+enum dpu_gc_mode {
+	GC_NEUTRAL,	/* Input data is bypassed to the output. */
+	GC_GAMMACOR,
+};
+
+enum dpu_lb_mode {
+	LB_NEUTRAL,	/* Output is same as primary input. */
+	LB_BLEND,
+};
+
+enum dpu_scaler_field_mode {
+	/* Constant 0 indicates frame or top field. */
+	SCALER_ALWAYS0,
+	/* Constant 1 indicates bottom field. */
+	SCALER_ALWAYS1,
+	/* Output field polarity is taken from input field polarity. */
+	SCALER_INPUT,
+	/* Output field polarity toggles, starting with 0 after reset. */
+	SCALER_TOGGLE,
+};
+
+enum dpu_scaler_filter_mode {
+	SCALER_NEAREST,	/* pointer-sampling */
+	SCALER_LINEAR,	/* box filter */
+};
+
+enum dpu_scaler_scale_mode {
+	SCALER_DOWNSCALE,
+	SCALER_UPSCALE,
+};
+
+enum dpu_scaler_mode {
+	/* Pixel by-pass the scaler, all other settings are ignored. */
+	SCALER_NEUTRAL,
+	/* Scaler is active. */
+	SCALER_ACTIVE,
+};
+
+enum dpu_pec_clken {
+	CLKEN_DISABLE = 0x0,
+	CLKEN_AUTOMATIC = 0x1,
+	CLKEN_FULL = 0x3,
+};
+
+int dpu_map_irq(struct dpu_soc *dpu, int irq);
+
+/* Constant Frame Unit */
+struct dpu_constframe;
+enum dpu_link_id dpu_cf_get_link_id(struct dpu_constframe *cf);
+void dpu_cf_framedimensions(struct dpu_constframe *cf, unsigned int w,
+			    unsigned int h);
+void dpu_cf_constantcolor_black(struct dpu_constframe *cf);
+void dpu_cf_constantcolor_blue(struct dpu_constframe *cf);
+struct dpu_constframe *dpu_cf_safe_get(struct dpu_soc *dpu,
+				       unsigned int stream_id);
+void dpu_cf_safe_put(struct dpu_constframe *cf);
+struct dpu_constframe *dpu_cf_cont_get(struct dpu_soc *dpu,
+				       unsigned int stream_id);
+void dpu_cf_cont_put(struct dpu_constframe *cf);
+
+/* Display Engine Configuration Unit */
+struct dpu_disengcfg;
+struct dpu_disengcfg *dpu_dec_get(struct dpu_soc *dpu, unsigned int id);
+void dpu_dec_put(struct dpu_disengcfg *dec);
+
+/* External Destination Unit */
+struct dpu_extdst;
+void dpu_ed_pec_poweron(struct dpu_extdst *ed);
+void dpu_ed_pec_src_sel(struct dpu_extdst *ed, enum dpu_link_id src);
+void dpu_ed_pec_sync_trigger(struct dpu_extdst *ed);
+struct dpu_extdst *dpu_ed_safe_get(struct dpu_soc *dpu,
+				   unsigned int stream_id);
+void dpu_ed_safe_put(struct dpu_extdst *ed);
+struct dpu_extdst *dpu_ed_cont_get(struct dpu_soc *dpu,
+				   unsigned int stream_id);
+void dpu_ed_cont_put(struct dpu_extdst *ed);
+
+/* Fetch Decode Unit */
+struct dpu_fetchunit *dpu_fd_get(struct dpu_soc *dpu, unsigned int id);
+void dpu_fd_put(struct dpu_fetchunit *fu);
+
+/* Fetch ECO Unit */
+struct dpu_fetchunit *dpu_fe_get(struct dpu_soc *dpu, unsigned int id);
+void dpu_fe_put(struct dpu_fetchunit *fu);
+
+/* Fetch Layer Unit */
+struct dpu_fetchunit *dpu_fl_get(struct dpu_soc *dpu, unsigned int id);
+void dpu_fl_put(struct dpu_fetchunit *fu);
+
+/* Fetch Warp Unit */
+struct dpu_fetchunit *dpu_fw_get(struct dpu_soc *dpu, unsigned int id);
+void dpu_fw_put(struct dpu_fetchunit *fu);
+
+/* Frame Generator Unit */
+struct dpu_framegen;
+void dpu_fg_syncmode(struct dpu_framegen *fg, enum dpu_fg_syncmode mode);
+void dpu_fg_cfg_videomode(struct dpu_framegen *fg, struct drm_display_mode *m);
+void dpu_fg_displaymode(struct dpu_framegen *fg, enum dpu_fg_dm mode);
+void dpu_fg_panic_displaymode(struct dpu_framegen *fg, enum dpu_fg_dm mode);
+void dpu_fg_enable(struct dpu_framegen *fg);
+void dpu_fg_disable(struct dpu_framegen *fg);
+void dpu_fg_shdtokgen(struct dpu_framegen *fg);
+u32 dpu_fg_get_frame_index(struct dpu_framegen *fg);
+int dpu_fg_get_line_index(struct dpu_framegen *fg);
+int dpu_fg_wait_for_frame_counter_moving(struct dpu_framegen *fg);
+bool dpu_fg_secondary_requests_to_read_empty_fifo(struct dpu_framegen *fg);
+void dpu_fg_secondary_clear_channel_status(struct dpu_framegen *fg);
+int dpu_fg_wait_for_secondary_syncup(struct dpu_framegen *fg);
+void dpu_fg_enable_clock(struct dpu_framegen *fg);
+void dpu_fg_disable_clock(struct dpu_framegen *fg);
+struct dpu_framegen *dpu_fg_get(struct dpu_soc *dpu, unsigned int id);
+void dpu_fg_put(struct dpu_framegen *fg);
+
+/* Gamma Correction Unit */
+struct dpu_gammacor;
+void dpu_gc_enable_rgb_write(struct dpu_gammacor *gc);
+void dpu_gc_disable_rgb_write(struct dpu_gammacor *gc);
+void dpu_gc_start_rgb(struct dpu_gammacor *gc, const struct drm_color_lut *lut);
+void dpu_gc_delta_rgb(struct dpu_gammacor *gc, const struct drm_color_lut *lut);
+void dpu_gc_mode(struct dpu_gammacor *gc, enum dpu_gc_mode mode);
+struct dpu_gammacor *dpu_gc_get(struct dpu_soc *dpu, unsigned int id);
+void dpu_gc_put(struct dpu_gammacor *gc);
+
+/* Horizontal Scaler Unit */
+struct dpu_hscaler;
+enum dpu_link_id dpu_hs_get_link_id(struct dpu_hscaler *hs);
+void dpu_hs_pec_dynamic_src_sel(struct dpu_hscaler *hs, enum dpu_link_id src);
+void dpu_hs_pec_clken(struct dpu_hscaler *hs, enum dpu_pec_clken clken);
+void dpu_hs_setup1(struct dpu_hscaler *hs,
+		   unsigned int src_w, unsigned int dst_w);
+void dpu_hs_setup2(struct dpu_hscaler *hs, u32 phase_offset);
+void dpu_hs_output_size(struct dpu_hscaler *hs, u32 line_num);
+void dpu_hs_filter_mode(struct dpu_hscaler *hs, enum dpu_scaler_filter_mode m);
+void dpu_hs_scale_mode(struct dpu_hscaler *hs, enum dpu_scaler_scale_mode m);
+void dpu_hs_mode(struct dpu_hscaler *hs, enum dpu_scaler_mode m);
+unsigned int dpu_hs_get_id(struct dpu_hscaler *hs);
+struct dpu_hscaler *dpu_hs_get(struct dpu_soc *dpu, unsigned int id);
+void dpu_hs_put(struct dpu_hscaler *hs);
+
+/* Layer Blend Unit */
+struct dpu_layerblend;
+enum dpu_link_id dpu_lb_get_link_id(struct dpu_layerblend *lb);
+void dpu_lb_pec_dynamic_prim_sel(struct dpu_layerblend *lb,
+				 enum dpu_link_id prim);
+void dpu_lb_pec_dynamic_sec_sel(struct dpu_layerblend *lb,
+				enum dpu_link_id sec);
+void dpu_lb_pec_clken(struct dpu_layerblend *lb, enum dpu_pec_clken clken);
+void dpu_lb_mode(struct dpu_layerblend *lb, enum dpu_lb_mode mode);
+void dpu_lb_blendcontrol(struct dpu_layerblend *lb, unsigned int zpos,
+			 unsigned int pixel_blend_mode, u16 alpha);
+void dpu_lb_position(struct dpu_layerblend *lb, int x, int y);
+unsigned int dpu_lb_get_id(struct dpu_layerblend *lb);
+struct dpu_layerblend *dpu_lb_get(struct dpu_soc *dpu, unsigned int id);
+void dpu_lb_put(struct dpu_layerblend *lb);
+
+/* Timing Controller Unit */
+struct dpu_tcon;
+void dpu_tcon_set_fmt(struct dpu_tcon *tcon);
+void dpu_tcon_set_operation_mode(struct dpu_tcon *tcon);
+void dpu_tcon_cfg_videomode(struct dpu_tcon *tcon, struct drm_display_mode *m);
+struct dpu_tcon *dpu_tcon_get(struct dpu_soc *dpu, unsigned int id);
+void dpu_tcon_put(struct dpu_tcon *tcon);
+
+/* Vertical Scaler Unit */
+struct dpu_vscaler;
+enum dpu_link_id dpu_vs_get_link_id(struct dpu_vscaler *vs);
+void dpu_vs_pec_dynamic_src_sel(struct dpu_vscaler *vs, enum dpu_link_id src);
+void dpu_vs_pec_clken(struct dpu_vscaler *vs, enum dpu_pec_clken clken);
+void dpu_vs_setup1(struct dpu_vscaler *vs,
+		   unsigned int src_w, unsigned int dst_w, bool deinterlace);
+void dpu_vs_setup2(struct dpu_vscaler *vs, bool deinterlace);
+void dpu_vs_setup3(struct dpu_vscaler *vs, bool deinterlace);
+void dpu_vs_setup4(struct dpu_vscaler *vs, u32 phase_offset);
+void dpu_vs_setup5(struct dpu_vscaler *vs, u32 phase_offset);
+void dpu_vs_output_size(struct dpu_vscaler *vs, u32 line_num);
+void dpu_vs_field_mode(struct dpu_vscaler *vs, enum dpu_scaler_field_mode m);
+void dpu_vs_filter_mode(struct dpu_vscaler *vs, enum dpu_scaler_filter_mode m);
+void dpu_vs_scale_mode(struct dpu_vscaler *vs, enum dpu_scaler_scale_mode m);
+void dpu_vs_mode(struct dpu_vscaler *vs, enum dpu_scaler_mode m);
+unsigned int dpu_vs_get_id(struct dpu_vscaler *vs);
+struct dpu_vscaler *dpu_vs_get(struct dpu_soc *dpu, unsigned int id);
+void dpu_vs_put(struct dpu_vscaler *vs);
+
+/* Fetch Units */
+struct dpu_fetchunit_ops {
+	void (*set_pec_dynamic_src_sel)(struct dpu_fetchunit *fu,
+					enum dpu_link_id src);
+
+	bool (*is_enabled)(struct dpu_fetchunit *fu);
+
+	void (*set_stream_id)(struct dpu_fetchunit *fu, unsigned int stream_id);
+
+	unsigned int (*get_stream_id)(struct dpu_fetchunit *fu);
+
+	void (*set_no_stream_id)(struct dpu_fetchunit *fu);
+
+	bool (*has_stream_id)(struct dpu_fetchunit *fu);
+
+	void (*set_numbuffers)(struct dpu_fetchunit *fu, unsigned int num);
+
+	void (*set_burstlength)(struct dpu_fetchunit *fu,
+				unsigned int x_offset, unsigned int mt_w,
+				int bpp, dma_addr_t baddr);
+
+	void (*set_baseaddress)(struct dpu_fetchunit *fu, unsigned int width,
+				unsigned int x_offset, unsigned int y_offset,
+				unsigned int mt_w, unsigned int mt_h,
+				int bpp, dma_addr_t baddr);
+
+	void (*set_src_stride)(struct dpu_fetchunit *fu,
+			       unsigned int width, unsigned int x_offset,
+			       unsigned int mt_w, int bpp, unsigned int stride,
+			       dma_addr_t baddr);
+
+	void (*set_src_buf_dimensions)(struct dpu_fetchunit *fu,
+				       unsigned int w, unsigned int h,
+				       const struct drm_format_info *format,
+				       bool deinterlace);
+
+	void (*set_fmt)(struct dpu_fetchunit *fu,
+			const struct drm_format_info *format,
+			enum drm_color_encoding color_encoding,
+			enum drm_color_range color_range,
+			bool deinterlace);
+
+	void (*set_pixel_blend_mode)(struct dpu_fetchunit *fu,
+				     unsigned int pixel_blend_mode, u16 alpha,
+				     bool fb_format_has_alpha);
+
+	void (*enable_src_buf)(struct dpu_fetchunit *fu);
+	void (*disable_src_buf)(struct dpu_fetchunit *fu);
+
+	void (*set_framedimensions)(struct dpu_fetchunit *fu,
+				    unsigned int w, unsigned int h,
+				    bool deinterlace);
+
+	struct dpu_dprc *(*get_dprc)(struct dpu_fetchunit *fu);
+	struct dpu_fetchunit *(*get_fetcheco)(struct dpu_fetchunit *fu);
+	struct dpu_hscaler *(*get_hscaler)(struct dpu_fetchunit *fu);
+	struct dpu_vscaler *(*get_vscaler)(struct dpu_fetchunit *fu);
+
+	void (*set_layerblend)(struct dpu_fetchunit *fu,
+			       struct dpu_layerblend *lb);
+
+	bool (*is_available)(struct dpu_fetchunit *fu);
+	void (*set_available)(struct dpu_fetchunit *fu);
+	void (*set_inavailable)(struct dpu_fetchunit *fu);
+
+	enum dpu_link_id (*get_link_id)(struct dpu_fetchunit *fu);
+
+	u32 (*get_cap_mask)(struct dpu_fetchunit *fu);
+
+	const char *(*get_name)(struct dpu_fetchunit *fu);
+};
+
+const struct dpu_fetchunit_ops *dpu_fu_get_ops(struct dpu_fetchunit *fu);
+struct dpu_fetchunit *dpu_fu_get_from_list(struct list_head *l);
+void dpu_fu_add_to_list(struct dpu_fetchunit *fu, struct list_head *l);
+
+/* HW resources for a plane group */
+struct dpu_plane_res {
+	struct dpu_fetchunit	**fd;
+	struct dpu_fetchunit	**fe;
+	struct dpu_fetchunit	**fl;
+	struct dpu_fetchunit	**fw;
+	struct dpu_layerblend	**lb;
+	unsigned int		fd_cnt;
+	unsigned int		fe_cnt;
+	unsigned int		fl_cnt;
+	unsigned int		fw_cnt;
+	unsigned int		lb_cnt;
+};
+
+/*
+ * fetchunit/scaler/layerblend resources of a plane group are
+ * shared by the two CRTCs in a CRTC group
+ */
+struct dpu_plane_grp {
+	struct dpu_plane_res	res;
+	struct list_head	node;
+	struct list_head	fu_list;
+	unsigned int		hw_plane_cnt;
+	struct dpu_constframe	*cf[2];
+	struct dpu_extdst	*ed[2];
+};
+
+/* the two CRTCs of one DPU are in a CRTC group */
+struct dpu_crtc_grp {
+	u32			crtc_mask;
+	struct dpu_plane_grp	*plane_grp;
+};
+
+struct dpu_client_platformdata {
+	const unsigned int	stream_id;
+	const unsigned int	dec_frame_complete_irq;
+	const unsigned int	dec_seq_complete_irq;
+	const unsigned int	dec_shdld_irq;
+	const unsigned int	ed_cont_shdld_irq;
+	const unsigned int	ed_safe_shdld_irq;
+	struct dpu_crtc_grp	*crtc_grp;
+
+	struct device_node	*of_node;
+};
+
+#endif /* __DPU_H__ */
-- 
2.25.1

