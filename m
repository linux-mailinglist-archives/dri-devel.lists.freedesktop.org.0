Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0375234108
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 10:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72646E334;
	Fri, 31 Jul 2020 08:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70072.outbound.protection.outlook.com [40.107.7.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4856E102
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 08:19:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUkOg1P027TrbakEzRIQGmVXk/8uSlGygaoIfHBxExh3gYM1RQnxuEM0/2vVBtFuGIybfq4NVX5Xp8Xscat/tHxDZTqWnRidyUndIEB6AFeDQE1hXW0rkJuUSWdUwjDlzNmxVy3azMIPdEqebM8ZOeq9dVQE7EGOXmFu8ygRgcqqq0xf2H5FoaMH93gOKxJJuzi/1/AGCaQl3o84WeXNclODSHYQaEIYnarVxF0aXRWcCk+oac5GqhxzAo1zSCdbLsh6aQJqsaOLz7dKSNuOAi1/8Cn/ht1VdIZ1MFRBysF0rW+vxI9JyCvRLusYvlx58EgKzVS0tLSWDb1SSL/9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKdTcHHV2KkMbBYwbQ35pW8T/7tThEKy9TAMTMqYsDI=;
 b=RoRDc9LmM5b6w4APVUt1hq6iMdsryGrctK6Q744u9Vf1P14ZTrqn6+iPeYVpq/dJhhfVnrLCILXsb/58rCrdhrK9sugYOgQc7gcs2EsqXVcLmsCIx96e6qiE7YB1EH+hwK2FgkRgFklux3rty9XETStcAfO0rYD+bHgjLJV5sqN5IQIZQTSCStPmE3O7TVobYx7G0RySuEdpHFi54fVG/fJ3x069qhyHk1u1icv9ktnd9xKvDZJfERDk3WYJqbyphExF5NBMEl5nZk9lzaNfl6MrxC2gT6wHFQPO535woO+pG5qF9onn3ST8d1/0rUOVwpnaxE/HLNYmKxcowmpaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKdTcHHV2KkMbBYwbQ35pW8T/7tThEKy9TAMTMqYsDI=;
 b=CZD+CA2crHWJDueeWw9QhVcwQ/OkSFCZzkt4P5IWDG2dC0cR1egguwAGGbITMQ3kQgjZ4iMRYvzETYF9OZZyTvXKbEUw5n8XvcEZtBu1sMBvoRJeWL9+W2xE081i3vWCj3w7PcCa+vpwEhMyEg6XbYKj/owLHm0flFx0coj68sQ=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB3024.eurprd04.prod.outlook.com
 (2603:10a6:802:d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 08:19:10 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5c87:6dce:840d:d4c8]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5c87:6dce:840d:d4c8%7]) with mapi id 15.20.3216.034; Fri, 31 Jul 2020
 08:19:10 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/5] Add support for iMX8MQ Display Controller Subsystem
Date: Fri, 31 Jul 2020 11:18:28 +0300
Message-Id: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: AM0PR06CA0141.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::46) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR06CA0141.eurprd06.prod.outlook.com (2603:10a6:208:ab::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.18 via Frontend Transport; Fri, 31 Jul 2020 08:19:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e0d8b07-132f-41aa-a7d6-08d8352a6661
X-MS-TrafficTypeDiagnostic: VI1PR04MB3024:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB30244E13346E3BFFFA613121BE4E0@VI1PR04MB3024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fToKtT3bDOfhZP3yss3cg+rm2LRSnGO17gMHyCp5pX4AzIF+iQXmQMQ4cbz+CYk7ZkQFww3d9HmlO24EJ0PMnWRWyqeMsultURkYW8JQmlLY9Z7CRJJ2Y0hL/ossG9muwglkfRLgMs8rhgChHvHBYNaLoA6wnkFZNUTParjy1J+ZFO4ZhIsNDPKfkPeXYajoOOlMg+yUGd6qf4tmEU3WzKUAkRyqwQXBdsxzev9jA/gp4ssD9vFeeET0NXxFrpx6m3aR3NP4Lzsn5SR8vgUFN1kCbx7kgC7cz98i39/hMqc54aM5U58NYsARnmKyeel+hHUd8StZ5btYZlzg4fTxiwM5Eji5VQSW1VCrc4qLXNWLdGWVXqsHCnfdm0395yn6wPCFAdSVgrxdG041B4VA4FcVVBcMib06aZUmUqXonWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(44832011)(956004)(2616005)(5660300002)(66476007)(6666004)(1076003)(66946007)(66556008)(316002)(110136005)(2906002)(186003)(26005)(16526019)(6506007)(52116002)(83380400001)(4326008)(8676002)(6512007)(966005)(86362001)(6486002)(478600001)(8936002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Ijr9Q52+9Et2doMaS2Tp7PkIF4jRciPifI1QlLoUqg2Ps2/WfbY/EK6xq1n96j04U8aM364zfHj107yoAHdSirH8AyagxtuDfwqf03SmBP6VB2vo8BND65+kvezYNJrlaZpC7JdQ7nCGD3WyjSvq7AEHzVUciUyDJtRfuBhzeRpTAA2AXasGH2jlTNozQY03e2j+OoXp49A8Jw08tVOsrQq3deelffia41tttofppkjNHyydClv8+pyLn+aFD/C1NumPeUayuk8tjIvSY/qFWTG3tsBMAgjEzrsIdxkLrvxYOHaF3rvpUq3m85LbP9n3p8xrxnfPlKEulQNi4eQb266dAW74svYWpGsKTOiwwLUAVzDoCK0bfeiiFE8QKRnAbXLDgDNDLmwAVDORojTruvfHZtKG0IgH3Cl1p+duI7Au1QnJNdUfy6EqQdOZpOSLzhqaKqcLRTArGW1lydXuIQZAHSxomuRte5AUHixX4CpP6QJAa0OM/0gckRcWxt3gt4Yqlq7Ofz6jWOHfCiasuGpXMfYxGrCaVnTVRKDIn+Rp/4ghghVkfPc1gEMt25T9bo5dWTXBS+TUWHJhCK7CTuJ2VDKQadLTrg7VXZd9+ly18kmoei01Z/ccfhbPE2MuEzEFAPwYTXu5P3p59WT++A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0d8b07-132f-41aa-a7d6-08d8352a6661
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 08:19:09.9607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bkroiMT4eBAVFSDMC8JYp48WDYPpfNMLKVD+i3WZZBPOZ+ns77rjkOtVjPbUupFgAWLGmkYkQNtCFvvc4UArA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3024
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
Cc: agx@sigxcpu.org, lukas@mntmn.com, laurentiu.palcu@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Hi,

This patchset adds initial DCSS support for iMX8MQ chip. Initial support
includes only graphics plane support (no video planes), no HDR10 capabilities,
no graphics decompression (only linear, tiled and super-tiled buffers allowed).

Support for the rest of the features will be added incrementally, in subsequent
patches.

The patchset was tested with both HDP driver (in the downstream tree) and the upstream
MIPI-DSI driver (with a couple of patches on top, to make it work correctly with DCSS).

Thanks,
Laurentiu

Changes in v9:
 * Fixed a compilation issue found by Guido in his setup: 'select
   VIDEOMODE_HELPERS' was missing from Kconfig;
 * Use imx8mq-clock.h in the bindings file so one can understand what
   those clock values mean;
 * no other changes done. Couldn't address the hang Guido reported as
   it's not happening in my setup. However, in my tree, there are some
   extra NWL and ADV patches applied on top of upstream ones... Also,
   removing them and testing only with upstream, even if there's no
   image out, does not produce a hang... :/

Changes in v8:
 * Removed 'select RESET_CONTROLLER" from Kconfig as Philipp pointed
   out. SRC is not used in DCSS driver;
 * Nothing else changed;

Changes in v7:
 * Added a patch to initialize the connector using the drm_bridge_connector
   API as Sam suggested. Tested it using NWL_DSI and ADV7535 with
   Guido's patch [1] applied and one fix for ADV [2]. Also, some extra
   patches for ADV and NWL were needed, from our downstream tree, which
   will be upstreamed soon by their author;
 * Rest of the patches are untouched;

[1] https://lists.freedesktop.org/archives/dri-devel/2020-July/273025.html
[2] https://lists.freedesktop.org/archives/dri-devel/2020-July/273132.html

Changes in v6:
 * Addressed Rob's comment and added "additionalProperties: false" at
   the end of the bindings' properties. However, this change surfaced
   an issue with the assigned-clock* properties not being documented in
   the properties section. Added the descriptions and the bindings patch
   will need another review;
 * Added an entry for DCSS driver in the MAINTAINERS file;
 * Removed the component framework patch altogether;

Changes in v5:
 * Rebased to latest;
 * Took out component framework support and made it a separate patch so
   that people can still test with HDP driver, which makes use of it.
   But the idea is to get rid of it once HDP driver's next versions
   will remove component framework as well;
 * Slight improvement to modesetting: avoid cutting off the pixel clock
   if the new mode and the old one are equal. Also, in this case, is
   not necessary to wait for DTG to shut off. This would allow to switch
   from 8b RGB to 12b YUV422, for example, with no interruptions (at least
   from DCSS point of view);
 * Do not fire off CTXLD when going to suspend, unless it still has
   entries that need to be committed to DCSS;
 * Addressed Rob's comments on bindings;

Changes in v4:
 * Addressed Lucas and Philipp's comments:
   * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
   * Removed usage of devm_ functions since I'm already doing all the
     clean-up in the submodules_deinit();
   * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flush();
   * Removed en_completion variable from dcss_crtc since this was
     introduced mainly to avoid vblank timeout warnings which were fixed
     by arming the vblank event in flush() instead of begin();
   * Removed clks_on and irq_enabled flags since all the calls to
     enabling/disabling clocks and interrupts were balanced;
   * Removed the custom atomic_commit callback and used the DRM core
     helper and, in the process, got rid of a workqueue that wasn't
     necessary anymore;
   * Fixed some minor DT binding issues flagged by Philipp;
   * Some other minor changes suggested by Lucas;
 * Removed YUV formats from the supported formats as these cannot work
   without the HDR10 module CSCs and LUTs. Will add them back when I
   will add support for video planes;

Changes in v3:
 * rebased to latest linux-next and made it compile as drmP.h was
   removed;
 * removed the patch adding the VIDEO2_PLL clock. It's already applied;
 * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
 * fixed a a spurious hang reported by Lukas Hartmann and encountered
   by me several times;
 * mask DPR and DTG interrupts by default, as they may come enabled from
   U-boot;

Changes in v2:
 * Removed '0x' in node's unit-address both in DT and yaml;
 * Made the address region size lowercase, to be consistent;
 * Removed some left-over references to P010;
 * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silence compilation
   issues reported by kbuild for other architectures;


Laurentiu Palcu (5):
  drm/imx: compile imx directory by default
  drm/imx: Add initial support for DCSS on iMX8MQ
  drm/imx/dcss: use drm_bridge_connector API
  MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
  dt-bindings: display: imx: add bindings for DCSS

 .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 108 +++
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/imx/Kconfig                   |   2 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dcss/Kconfig              |   9 +
 drivers/gpu/drm/imx/dcss/Makefile             |   6 +
 drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
 drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
 drivers/gpu/drm/imx/dcss/dcss-dev.c           | 325 +++++++
 drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
 drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-drv.c           | 138 +++
 drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.c           | 198 +++++
 drivers/gpu/drm/imx/dcss/dcss-kms.h           |  44 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
 drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
 20 files changed, 4112 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
 create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
