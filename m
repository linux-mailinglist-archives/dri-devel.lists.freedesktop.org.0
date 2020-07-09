Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F421A519
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 18:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE326E434;
	Thu,  9 Jul 2020 16:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60080.outbound.protection.outlook.com [40.107.6.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5350F6E434
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 16:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwSsJLbwG1KPUpl/2gkKQ8mCsrjczn277KuO/4a2tg66rTpmNjyj1h1hoCBikEvsh27iRqcB+cP7SFEkYZlXaYn2Dvf2TWVg7BKY9kkvkyseSsR9LGb4KaTHqvdl7iuiWJbPVx99A44BO3veXXLO/vBxygaHyM1i99uy3dSIUShN43BCUEhWQNmx+nEt9giO+APa73Rm5kb3u6R/T8fJ5YVqW09VlhwfKX8uUCd825luY+ku65boPd7xXi6KS5sbBFjdda8ml84Rm/L3IQBiT1aaq65G+x3T40bqx9H/j3uxn39Th/5c+qoYDf+o8r9Lq2uIOHjq9Ps00aBKxlt3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXQ1KIMeXyL4D/+BwoIpZV2QH+ZEdb6xT7iWybXhfVQ=;
 b=lS+lOGS46EsHvH143IsDeNE6Xg8Rqdz4FAQo7eUFD/QlO2uWnab5A1sD70TfXR9CeEPMFUipobhm0TpJZxyV/U5Oo2S1nMHRFvZrzdVOIvsJzfab8eyS2zPrHYS0Ez2f+SjdcGsdAoU9sFJzmnSnW211SyG0woX3Xz0J3t/KpIh0YXFbIw9zysgINeehH8Zj9frTvUb5psmX7F9DDleS/38cqqWvWpkAu8XSmmHnKmDjS0RWldA7o6fY+cvviUzqTf4uXBreTt8Uhu6pbesCMZJrGsXs5qozQC3rPzKPGhRHz37Abtqerhc1BgOQFxMZkeZFhQT9Kr8Y3hi+BgyZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXQ1KIMeXyL4D/+BwoIpZV2QH+ZEdb6xT7iWybXhfVQ=;
 b=MnN/Ec1DuvenO8FL9Om7pH13VUkxaTVL4XBkbUb9qSIZ4/iHCMYSCMxhOOZl+Dy4q3y1x4w9jA4pDZYdYSikQPOBml0SccjF8eE8u4gFe80NwxfCIwtwBkq4rTJGCd/FirCY7uOCBlXvBVZKNz+rx8JDNciqrxCfSWB/bgutdws=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6239.eurprd04.prod.outlook.com
 (2603:10a6:803:fd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 16:47:48 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3153.029; Thu, 9 Jul 2020
 16:47:48 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/4] Add support for iMX8MQ Display Controller Subsystem
Date: Thu,  9 Jul 2020 19:47:28 +0300
Message-Id: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: AM0PR03CA0041.eurprd03.prod.outlook.com (2603:10a6:208::18)
 To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR03CA0041.eurprd03.prod.outlook.com (2603:10a6:208::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 16:47:47 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fcffaaf-38a4-4e0b-fd4a-08d82427cfc4
X-MS-TrafficTypeDiagnostic: VI1PR04MB6239:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB62395D95770DA5C58C921C8FBE640@VI1PR04MB6239.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IQgPDT+J7/+H7Mf1bYpZ6KauiLB8qxdFQycw3MLStEgKt1zhddqPL826Rx0SIXHryCUPZWOfUvcrU6HEVRtSnP836wx/v+Iy5NKORqPT0zZJpzhEwVoNvIVvQDHXSXViCb07n2Dp06qI49oZv1bBVeAVQGx0ipjLBMsBErXzZbGOqxibm9tlbTDCpEIWZ6//xq7+IkZK6NQsnjvGKQx9DFNjGce6jx51CmnhguaXR8brUYIFIXIU9DmSdg1rEYtLysb0RgSHA4BmBXkvrZ5nvVsJAXeaZBwUee3k0jewrWGEUTyTzXP2khZ5f9WLbHc37GfbjXHc5eNL13nb3nyCo+L5xiNFPyd5ey+Y3Kbr3YB45pYB8wqKf0U5iYP8LHrN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(8936002)(66556008)(66476007)(186003)(16526019)(6666004)(52116002)(1076003)(86362001)(6486002)(6506007)(66946007)(4326008)(5660300002)(2616005)(26005)(956004)(2906002)(83380400001)(110136005)(478600001)(316002)(44832011)(8676002)(6512007)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: nboJWOUqau1p0sLV0r8mXYa7HCLMvSD4cM7nGGyPk3wMsdplIMe8yiZgkpoSu0odDXIofRhSY8e9OZTPQ1HBrSGrnFn5+20mGiLi4kYvjZDigPCpqNIv8ZdA89Ri4cxIbLDRN0rXodthULh0gu0PQhuvi2kxWjvgRGN8X1aGqmymfQCWsOv6LQ8POY51T40uF7Q18uLhNv+5aEp3iww6YOltQgJ5u9VYR0V5mHTKQSJrrzT0YK+vUx79ggmq7UxbWWjD9S2VZg0ZEP8m40FYptMLcGrSXWYVwGayz+O98WI6xhvO3cUHwskX842/1unJuvkOoVNFIKbPs+vossaWmxuCQDSzpV/XKBwTKuhhn6R9mTKrJ3T0ZlFbxFtHcr2wRl+8n7qxqdu2qtS5GzTkWKFT6jI9nyDLQtHSM7CaHj9n6xD/D01bRbn0S7d3kmtiY4GFArBiEWgcwfJv5qlkpfUDn75pDnVKWciepVrt64k=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcffaaf-38a4-4e0b-fd4a-08d82427cfc4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 16:47:48.3601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OI7T9cBYEbiKT69NBYLgQA10YEIRqEspoUcOP/nJSlNWgtnYSvH92ka15CS1smFmD/jB/QfAxNGjGGZVEOMhgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6239
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
Cc: devicetree@vger.kernel.org, agx@sigxcpu.org, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, laurentiu.palcu@oss.nxp.com
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
  drm/imx/dcss: add component framework functionality
  dt-bindings: display: imx: add bindings for DCSS
  arm64: dts: imx8mq: add DCSS node

 .../bindings/display/imx/nxp,imx8mq-dcss.yaml |  84 ++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  23 +
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/imx/Kconfig                   |   2 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dcss/Kconfig              |   9 +
 drivers/gpu/drm/imx/dcss/Makefile             |   6 +
 drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
 drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
 drivers/gpu/drm/imx/dcss/dcss-dev.c           | 314 +++++++
 drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
 drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-drv.c           | 183 ++++
 drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.c           | 185 ++++
 drivers/gpu/drm/imx/dcss/dcss-kms.h           |  43 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
 drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
 20 files changed, 4123 insertions(+), 1 deletion(-)
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
