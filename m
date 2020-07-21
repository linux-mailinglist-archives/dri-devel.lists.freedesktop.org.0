Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708D2227CC2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 12:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6107C6E55E;
	Tue, 21 Jul 2020 10:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40046.outbound.protection.outlook.com [40.107.4.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D876E55E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 10:20:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPtn+1hP3YiKynHdAy5g2uRvqmONmM7a1ljGX1j+7Gx3FzmIBQw8XPhKU+zhhe3vkpAQIW9Is20xjNLcX1A11pR/9HoU9YnZi8+7bOn5YjI1Os9u5Qk9G5p1TJ7qVe/2PBFDBJR2b6Fh6tcgX2Ed4TDKPxwcVBdYhid3QRgaqq6u4yHoGllyZS+yjA+pzSCSbd093y0hY/AcXgVtkFocL2oMx3kW8lQU/T6v7JSdzWyll4ufizinsLnzibuNioCFuMtYte8ZPso89Uf0ymrtz9XabJnCfVmRG40T1JXVXT2cqtwhqCarUtBncb2wbhM1f62+lJqDsM/T60YfI/G9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmILhe9JpZpuuqm4nSo2SpeACdhQ+6t65CMBLZRR71A=;
 b=cjZZmzO/oWagracHHoLgHqC6XwN91eIsQiCUSfjqNn/WUgv0vAaaCm9FDCS5Ai2lpYoi31gqJcvt1rEHUgEOOWrWgMmnI71YfmQytdy6SWyJsWsSt3Op60fmO7CjctRJJZVnqwQH04zh5PhjQPo0oDMTFvw3DymckDOsDqMQ2yAyv+Mo9QH2JxYc5/jcMVvjgXaKvmt8HPcbOph07/lA0BgIEzE0a2n0Oea+USX0CR4vWzDd74zOKMfI9mM8Ixr0hN52EmglfFbPYGZzvZMu358TB7mtMrVX8TkdyVEegmV0vAUzr21VAS+v1aEEC++LqPiDX42UPyt1Q4n3Uby1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmILhe9JpZpuuqm4nSo2SpeACdhQ+6t65CMBLZRR71A=;
 b=RBXFFWTnfXgVctXxZzx7ngDzS9H564Fp6u2QjT1Z6P9dmbKyLo4gOHV/NpUnml2eOFSsgxodhXcfmiT86s0X5iNz2UTWRNnhTQ1COpBqH9J0V7uhFkB2j55OW2Zztn2/zuqZjlUOK5bRZpZIMhT4OdSjKkM9XE0D3f3q5jqkKyI=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4398.eurprd04.prod.outlook.com
 (2603:10a6:803:69::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Tue, 21 Jul
 2020 10:20:33 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 10:20:33 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/5] Add support for iMX8MQ Display Controller Subsystem
Date: Tue, 21 Jul 2020 13:19:59 +0300
Message-Id: <20200721102007.18368-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: AM3PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:207:8::24) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0138.eurprd07.prod.outlook.com (2603:10a6:207:8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.15 via Frontend Transport; Tue, 21 Jul 2020 10:20:31 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fbf76478-d38d-4d10-7173-08d82d5fb376
X-MS-TrafficTypeDiagnostic: VI1PR04MB4398:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB439828BC1135353C656226DABE780@VI1PR04MB4398.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +jIPnCNNsI9ag/XONaeqPLAuS745PwVBnhGczver/PuCsiBzQZXrGcie7AHDAOrMTdTcfJjSDr641WaNKo2mT8Yc9O3q2OxLhixOIpNHie5pLpYL9Z4x5KTumgSkmMOd3+AMw0xD5NmHxatslf7TH8VzggOBWP5YR5UQ6dK3I/h2DgxOP46qqJ0J/IeRo5BN7JvLfY4BC73WmVDVpRKufCivLDficHcCs/IfThE5Q97/1snOEM1FO1tz8mF31ZuYq2itP+8FXp7V+0GzZ05P62aJd6TGBN2BpvYzBmGiNDmoNmv0gZhAN7X790LRaQVdzyl1fzFcxRfygDhXrhf7UrFT9Y/++7i6kqbhzh/utP/ao5tUeRNJCYEk5QsoiAnI8aZMHinUwmymWDm3KFUF0DX1aEmP1O9moHs24Jtm0Wo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(478600001)(316002)(66946007)(16526019)(66556008)(66476007)(26005)(8676002)(44832011)(6666004)(5660300002)(4326008)(1076003)(2616005)(956004)(6486002)(86362001)(52116002)(966005)(110136005)(2906002)(186003)(6506007)(83380400001)(6512007)(8936002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: VIyenrB4tC5VmyrrxxK3IzUHwI1LNZ9jVi8OTqAqX5IH1LhmlxsTX3QBopLsLED23fy01mfN1WgI6vJSV0MpeuBytCk6qpUoNCt8BRMYQmaD2hHuDWLUaJImM4xk7TQ66oQsBPL/QZr+3UN/3O7Rifijr+XU+xWZUMQZGqW72GD8ptGMolj/yIjTsa7JmZOeYwS6mXndPngcH9yBRrLDxaDxgmbpzDA99aj6kIuyvIr2lT8gq/BkK+twmrbZ/cskrJlbZRthE8OTghn7bLlVDWWH1M6lBqEvE0ZCwTmecmDJBW2BC3d1LohZyaRJHMiJTnGGIy8C0QeUe2USLV3reyf6H4ZD1MZcgRYkFsAw6Lnb5pRYKb5479+8NEPRXFCeP3D13UCVvigJeGOQBazQ+YcoFEBHLr1OEXQdQe1WdJL9BFG/1bZYPzkaXLnxvzF3gHac8W2iZyKTZYNQauQfTfE9Hpo5NslXrQwioyl1v2s=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf76478-d38d-4d10-7173-08d82d5fb376
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 10:20:33.1760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CnSyt0CcYVwEDPnunJuYsFo3ezzoyK98jU78c0WXsQ6z+iC6StbKtqxyrOAnLO45pCEJYYk//7QtvKbZmI9Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4398
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

 .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 104 +++
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
 20 files changed, 4108 insertions(+), 1 deletion(-)
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
