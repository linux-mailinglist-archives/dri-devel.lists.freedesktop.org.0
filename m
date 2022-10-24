Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F0560BE71
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 01:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3B110E081;
	Mon, 24 Oct 2022 23:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E7210E081
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 23:19:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD801D3C;
 Tue, 25 Oct 2022 01:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1666653549;
 bh=0KlOFayU+be1oamA9QOfEmOEUiZwU1/VfiJbVpx96a4=;
 h=Date:From:To:Cc:Subject:From;
 b=wkgwdfgjLBT1EmrdCpQ3QXXNhhge5OvpHN+6hp0Kx2yDSqNAowzjQ/ANy5s+XCV2f
 W1mSC2c2uQiZyDyUeD6ZK8YKmzGA83ALcFUkpAmTja+QDlt8IYQZR057zf8kRiShkc
 VV8UJTGJSSlDBJlobeGchEOQavr+IpMC6HESCy38=
Date: Tue, 25 Oct 2022 02:18:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v6.2] Xilinx ZynqMP DisplayPort bridge support
Message-ID: <Y1cdU4HJoy0Pr2sQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-next-20221025

for you to fetch changes up to ddcb8fa6514f2baf0fdb45e7ba12fbf3abb112c7:

  arm64: dts: zynqmp: zcu106a: Describe DisplayPort connector (2022-10-21 01:59:01 +0300)

The branch contains two patches for the ZynqMP device tree. They have
been acked by Michal (on CC) for merge through the DRM tree.

----------------------------------------------------------------
Xilinx ZynqMP DisplayPort bridge support

----------------------------------------------------------------
Laurent Pinchart (37):
      dt-bindings: display: xlnx: zynqmp-dpsub: Add OF graph ports
      drm: xlnx: zynqmp_dpsub: Switch to atomic encoder enable/disable
      drm: xlnx: zynqmp_dpsub: Constify mode argument to function
      drm: xlnx: zynqmp_dpsub: Create DRM bridge to model DP encoder
      drm: xlnx: zynqmp_dpsub: Don't access connector in zynqmp_dp_set_format()
      drm: xlnx: zynqmp_dpsub: Move connector registration to bridge attach
      drm: xlnx: zynqmp_dpsub: Move encoder to DPSUB core
      drm: xlnx: zynqmp_dpsub: Attach to the next bridge
      drm: xlnx: zynqmp_dpsub: Use DRM connector bridge helper
      drm: xlnx: zynqmp_dpsub: Report HPD through the bridge
      drm: xlnx: zynqmp_dpsub: Drop unused zynqmp_disp.event field
      drm: xlnx: zynqmp_dpsub: Drop unused zynqmp_disp_format.bus_fmt field
      drm: xlnx: zynqmp_dpsub: Don't pass CRTC to zynqmp_disp_setup_clock()
      drm: xlnx: zynqmp_dpsub: Configure blender in zynqmp_disp_enable()
      drm: xlnx: zynqmp_dpsub: Use local variable in zynqmp_disp_layer_update()
      drm: xlnx: zynqmp_dpsub: Pass format info to zynqmp_disp_layer_set_format()
      drm: xlnx: zynqmp_dpsub: Remplace hardcoded values with ARRAY_SIZE()
      drm: xlnx: zynqmp_dpsub: Don't use drmm_kcalloc() for temporary data
      drm: xlnx: zynqmp_dpsub: Move pclk from zynqmp_disp to zynqmp_dpsub
      drm: xlnx: zynqmp_dpsub: Move audio clk from zynqmp_disp to zynqmp_dpsub
      drm: xlnx: zynqmp_dpsub: Move CRTC to zynqmp_dpsub structure
      drm: xlnx: zynqmp_dpsub: Move planes to zynqmp_dpsub structure
      drm: xlnx: zynqmp_dpsub: Move DRM/KMS initialization to separate file
      drm: xlnx: zynqmp_dpsub: Move CRTC handling to zynqmp_kms.c
      drm: xlnx: zynqmp_dpsub: Move planes handling to zynqmp_kms.c
      drm: xlnx: zynqmp_dpsub: Register AUX bus at bridge attach time
      drm: xlnx: zynqmp_dpsub: Move DP bridge init to zynqmp_dp_probe()
      drm: xlnx: zynqmp_dpsub: Manage DP and DISP allocations manually
      drm: xlnx: zynqmp_dpsub: Move all DRM init and cleanup to zynqmp_kms.c
      drm: xlnx: zynqmp_dpsub: Decouple DRM device from zynqmp_dpsub
      drm: xlnx: zynqmp_dpsub: Rename zynqmp_dpsub_handle_vblank with DRM prefix
      drm: xlnx: zynqmp_dpsub: Parse DT to find connected ports
      drm: xlnx: zynqmp_dpsub: Allow configuration of layer mode
      drm: xlnx: zynqmp_dpsub: Support operation without DMA engine
      drm: xlnx: zynqmp_dpsub: Add support for live video input
      arm64: dts: zynqmp: Add ports for the DisplayPort subsystem
      arm64: dts: zynqmp: zcu106a: Describe DisplayPort connector

 .../bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml   |  67 +++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts  |  20 +
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |  24 +
 drivers/gpu/drm/xlnx/Makefile                      |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 | 646 ++++-----------------
 drivers/gpu/drm/xlnx/zynqmp_disp.h                 |  48 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   | 482 ++++++++-------
 drivers/gpu/drm/xlnx/zynqmp_dp.h                   |   4 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                | 316 +++++-----
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h                |  46 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  | 534 +++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_kms.h                  |  46 ++
 12 files changed, 1336 insertions(+), 899 deletions(-)
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_kms.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_kms.h

-- 
Regards,

Laurent Pinchart
