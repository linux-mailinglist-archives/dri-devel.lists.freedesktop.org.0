Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25713DBFEB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 22:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584536F4A2;
	Fri, 30 Jul 2021 20:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB476E24E;
 Fri, 30 Jul 2021 20:41:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYnCy3RLy1wUVgdOnUJ5oqA+ujB0SHgB7cU4ZD2GyG4NqKyV8PPlFWunlgKkG1XhtkOdE0qukfbGXaqXMyxIYGaflIxpmn3bNEiY1RZNBp3CKb/IWt9KKm6TeOiBQHYGbSBFsx6bGPYAocsTIyEft7d1Q4JmuioFx92oNwXpOSzjxCOx6MZaF+0BEiJMDxJudfwaxolzNb5vYUrbLRDb7yb+RK9EWf+GzzAy7wnCurutdfdBkJ/UozmojVMMZqP+zinW0nfKZRI0fOKSaWH2Y1OTVxyA5zi3zPf4lKLLr1z5LU4VEJQsWiz9r3ztrOdp11v1NqtwJ+2n3jvwmyed7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbV8/6Y7u81cUCFtgr+I+DP0PfN8t1bD78AjCuJdtLQ=;
 b=Cs+hgvud/HlZPRrX/FMG3Ixg/OLgtCAUJWqFy0vnKHxF5OXJ2z6Y3tsYkRoWnK3sgkn+gKj0DN2oAambVrWHJRP2CEiNvRCK6zXTAJvlI/b95hxuiEX/D8U6cHtrIndbM9qlJt88PTdyVCLf6Ds/8Zu7N3bX6/O4rphPM2Vm/JIfD2/TdR4GGY0CmfCeCAXGkIDBtPNQVue51f0dSQTUcuwDHPKLCyGlR52MffpgpBJ54ERYEQZXz7kh7xWXCRFfRYZYzDR4yk8U/gR+1TXnB1DJtNYBDl5NQdHe8+B473w4C9TKPBSkJU6Q8Ya3sYvZZyYH8PEh3Wed8Vkrrzz1YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbV8/6Y7u81cUCFtgr+I+DP0PfN8t1bD78AjCuJdtLQ=;
 b=GjmIPfwA2JFtUy8TISGfWOdMc98aquqAvwB/CEXVr/ZBP+gRZ27CZFog/KE8TVIUTG7UCHA1DBolhOGJxU+/LUgnicZ968JXQoQutQK9vqEMSFwd3sGm2zQuuHAtsQj1F5kcS27/i2zA1BdJDC/lna+FtUyfnC+j0g+k7hTLppY=
Received: from DM6PR08CA0040.namprd08.prod.outlook.com (2603:10b6:5:1e0::14)
 by CY4PR12MB1126.namprd12.prod.outlook.com (2603:10b6:903:3d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Fri, 30 Jul
 2021 20:41:39 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::cf) by DM6PR08CA0040.outlook.office365.com
 (2603:10b6:5:1e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 20:41:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 20:41:39 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 15:41:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 13:41:38 -0700
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 30 Jul 2021 15:41:37 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>,
 <jshargo@google.com>, <Shashank.Sharma@amd.com>
CC: <Deepak.Sharma@amd.com>, <Shirish.S@amd.com>, <Vitaly.Prosyak@amd.com>,
 <aric.cyr@amd.com>, <Bhawanpreet.Lakha@amd.com>, <Krunoslav.Kovac@amd.com>,
 <hersenxs.wu@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <laurentiu.palcu@oss.nxp.com>, <ville.syrjala@linux.intel.com>, "Harry
 Wentland" <harry.wentland@amd.com>
Subject: [RFC PATCH v3 0/6] A drm_plane API to support HDR planes
Date: Fri, 30 Jul 2021 16:41:28 -0400
Message-ID: <20210730204134.21769-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92c2d422-ba80-47a7-b0cf-08d9539a6e81
X-MS-TrafficTypeDiagnostic: CY4PR12MB1126:
X-Microsoft-Antispam-PRVS: <CY4PR12MB112626FA76459398D55EE0918CEC9@CY4PR12MB1126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mP3NnAOErf0bDCpPunqopfxc/+3VOClIhKiuGNcy52aVaRM0158fZtLf2AGd3q8S7haVvBuOEIlssfUawGZIkFc2dVD1I/ntfuln6b/r04fGTzteQVB9dx7cy8FxbT4BQxOsIiqhCCSbcRg3BY56e7hyMQvHBBajRvfKVpZNJPVfb/3O5CDjKBvX3ZsCpuG8Rf3mPpezc0J6L5WuQmrHWzKcpdC3PKKoofP5WNwBoVi2ieAH/fkfVYzjfXzI4HmKoaZy3vkZq6d3RbIptE8izdR7gib7PseHC/pxbj4sFN9nYNdc48JUJeXk9dCBor4s27YJNR9pB9ujfE3diy537NMdqng/GhfXYDxqT3zYM7KV0VrwK2Mcl+Dqwq3lS/HgZ0JeuqLEVts3/1OW5fDfRpiohPFuUAU5Xqt1zjgZPRz8VDAZqjamjM4nwo5pH3id2sgxlWprA5veaXQ0puHPoNKL7he6ezHQMYqrM81yRm3tplLGilET4cdG7o9D0pBPbbsHySlJHV4Da9Tik25E5yhMK7DOhV2aRPKso651oiZpUEZtmNd9djvvOugvT4ZWgA1XNovtmwdz1VFTShba9u+PcOWMrQxBAWNdKa7tNQCjeu/RRsLNHeehJAvKToQoyZ60yxR4g8oks2m/LOMM0KGdlet6gm/2aLT9qtfFOtNO8TGtGUkKLgQ7UyteVOvjUtA0YQICxvDm+bI3lOmLQFiQFir9G1pmqv1+aEAq41E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(2906002)(186003)(36860700001)(47076005)(478600001)(6666004)(86362001)(7696005)(81166007)(82740400003)(82310400003)(70586007)(70206006)(8676002)(4326008)(54906003)(26005)(8936002)(83380400001)(44832011)(110136005)(336012)(316002)(356005)(1076003)(426003)(5660300002)(6636002)(36756003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 20:41:39.2828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c2d422-ba80-47a7-b0cf-08d9539a6e81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1126
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are looking to enable HDR support for a couple of single-plane and
multi-plane scenarios. To do this effectively we recommend new interfaces
to drm_plane. The first patch gives a bit of background on HDR and why we
propose these interfaces.

This update is only changing the documentation, not the code. We feel
that we are not close to anything resembling a consensus for the DRM/KMS
API to support (multi-plane) HDR and would like to further the discussion
on this.

The most important bits in the RFC document are probably the sections on
defining HW details and defining SW intentions. We are worried defining
intricate HW details on the DRM/KMS level leads to a lot of complexity
for compositors which can be avoided by rather defining SW intentions.

I will be off for the entire month of August with little time to follow
this thread but would like to get my updated thoughts out for discussion
anyways. Shashank Sharma will help support this discussion.

v3:
 * Only doc updates (patch 1)
   * Add sections on single-plane and multi-plane HDR
   * Describe approach to define HW details vs approach to define SW intentions
   * Link Jeremy Cline's excellent HDR summaries
   * Outline intention behind overly verbose doc
   * Describe FP16 use-case
   * Clean up links

v2:
 * Moved RFC from cover letter to kernel doc (Daniel Vetter)
 * Created new color space property instead of abusing
   color_encoding property (Ville)
 * Elaborated on need for named transfer functions
 * Expanded on reason for SDR luminance definition
 * Dropped 'color' from transfer function naming
 * Added output_transfer_function on crtc

Bhawanpreet Lakha (3):
  drm/color: Add transfer functions for HDR/SDR on drm_plane
  drm/color: Add sdr boost property
  drm/color: Add color space plane property

Harry Wentland (3):
  drm/doc: Color Management and HDR10 RFC
  drm/color: Add output transfer function to crtc
  drm/amd/display: reformat YCbCr-RGB conversion matrix

 Documentation/gpu/rfc/color_intentions.drawio |   1 +
 Documentation/gpu/rfc/color_intentions.svg    |   3 +
 Documentation/gpu/rfc/colorpipe               |   1 +
 Documentation/gpu/rfc/colorpipe.svg           |   3 +
 Documentation/gpu/rfc/hdr-wide-gamut.rst      | 580 ++++++++++++++++++
 Documentation/gpu/rfc/index.rst               |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  17 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  28 +-
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |   7 +-
 .../gpu/drm/arm/display/komeda/komeda_plane.c |   6 +-
 drivers/gpu/drm/arm/malidp_crtc.c             |   7 +-
 drivers/gpu/drm/arm/malidp_planes.c           |   6 +-
 drivers/gpu/drm/armada/armada_crtc.c          |   5 +-
 drivers/gpu/drm/armada/armada_overlay.c       |   6 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |   7 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |   8 +
 drivers/gpu/drm/drm_color_mgmt.c              | 177 +++++-
 drivers/gpu/drm/i915/display/intel_color.c    |  11 +-
 drivers/gpu/drm/i915/display/intel_color.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |   4 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |   6 +-
 .../drm/i915/display/skl_universal_plane.c    |   6 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   9 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   9 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c    |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c       |  13 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c           |  10 +-
 drivers/gpu/drm/omapdrm/omap_plane.c          |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |   7 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |   5 +-
 drivers/gpu/drm/stm/ltdc.c                    |   8 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  10 +-
 drivers/gpu/drm/tidss/tidss_crtc.c            |   9 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |  10 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                |  16 +-
 include/drm/drm_color_mgmt.h                  |  49 +-
 include/drm/drm_crtc.h                        |  20 +
 include/drm/drm_plane.h                       |  47 +-
 39 files changed, 1074 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_intentions.drawio
 create mode 100644 Documentation/gpu/rfc/color_intentions.svg
 create mode 100644 Documentation/gpu/rfc/colorpipe
 create mode 100644 Documentation/gpu/rfc/colorpipe.svg
 create mode 100644 Documentation/gpu/rfc/hdr-wide-gamut.rst

--
2.32.0

