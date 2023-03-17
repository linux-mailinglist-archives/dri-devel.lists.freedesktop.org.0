Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BF16BE30A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81BC10E36E;
	Fri, 17 Mar 2023 08:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D78410E344
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:22:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85847B824F4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD7EC433D2;
 Fri, 17 Mar 2023 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041338;
 bh=Y+FeuoEYgmV4XhHzbi4ynmacHPNSPmfGmHfMCN1rXcU=;
 h=From:To:Cc:Subject:Date:From;
 b=NdRFTP73vf+1YSrrFyUr9aOcvf6sGAhDReiGyXWwEEAtGgLbFwRevI4olZC+B+9UL
 wfbK6Jxj5y0GmZwtl+jMyxO+P6JZMKvr2M6cul7d1eQJmHGvSuW5Oy8Vppjy2jkpUe
 jFWRMjt8PN/y5CjapbWI5ZqIfMg8H+OolpTsq2sNR9k7k/udj2bKoyBbZ3+nIYenwC
 Fnp2KS+tiY5SkcTyLWRlQ280dWvB+kJ/3W9JrmJGJhGBFALs9psCYgv1RwSoVax+d0
 qxVze/5I1LOIuIozs1q9j9odGNJWYN8psaZLZqi6oxJVUe2txHpgoHMzE4LYVXZEnp
 kk5TtLJ8w47yw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/37] Rid W=1 warnings from GPU
Date: Fri, 17 Mar 2023 08:16:41 +0000
Message-Id: <20230317081718.2650744-1-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (37):
  drm/amd/display/dc/dc_hdmi_types: Move string definition to the only
    file it's used in
  drm/xlnx/zynqmp_disp: Use correct kerneldoc formatting in zynqmp_disp
  drm/amd/amdgpu/amdgpu_device: Provide missing kerneldoc entry for
    'reset_context'
  drm/xlnx/zynqmp_dp: Fix function name zynqmp_dp_link_train() ->
    zynqmp_dp_train()
  drm/ttm/ttm_bo: Provide a missing 'bulk' description and correct
    misnaming of 'placement'
  drm/vkms/vkms_composer: Fix a few different kerneldoc formatting
  drm/mediatek/mtk_disp_aal: Remove half completed incorrect struct
    header
  drm/mediatek/mtk_disp_ccorr: Remove half completed incorrect struct
    header
  drm/tegra/dc: Remove set but unused variable 'state'
  drm/nouveau/nvkm/nvfw/acr: Make local function
    ‘wpr_generic_header_dump’ static
  drm/nouveau/nvkm/subdev/acr/lsfw: Remove unused variable 'loc'
  drm/nouveau/nvkm/subdev/bios/init: Demote a bunch of kernel-doc abuses
  drm/amd/amdgpu/amdgpu_ucode: Remove unused function
    ‘amdgpu_ucode_print_imu_hdr’
  drm/amd/amdgpu/amdgpu_vm_pt: Supply description for
    amdgpu_vm_pt_free_dfs()'s unlocked param
  drm/amd/amdgpu/gmc_v11_0: Provide a few missing param descriptions
    relating to hubs and flushes
  drm/amd/amdgpu/ih_v6_0: Repair misspelling and provide descriptions
    for 'ih'
  drm/amd/amdgpu/amdgpu_mes: Ensure amdgpu_bo_create_kernel()'s return
    value is checked
  drm/amd/amdgpu/amdgpu_vce: Provide description for
    amdgpu_vce_validate_bo()'s 'p' param
  drm/amd/pm/swsmu/smu11/vangogh_ppt: Provide a couple of missing
    parameter descriptions
  drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move defines out to where
    they are actually used
  drm/nouveau/nvkm/subdev/volt/gk20a: Demote kerneldoc abuses
  drm/nouveau/nvkm/engine/fifo/runl: Staticify local function
    nvkm_engn_cgrp_get()
  drm/nouveau/nvkm/engine/fifo/gf100: Staticify local function
    gf100_fifo_nonstall_block()
  drm/nouveau/nvkm/engine/gr/gf100: Demote kerneldoc abuse
  drm/nouveau/nvkm/engine/gr/tu102: Staticify local function
    gf100_fifo_nonstall_block()
  drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move SYNAPTICS_DEVICE_ID
    into CONFIG_DRM_AMD_DC_DCN ifdef
  drm/amd/display/dc/dce/dmub_psr: Demote kerneldoc abuse
  drm/amd/display/dc/core/dc_stat: Convert a couple of doc headers to
    kerneldoc format
  drm/amd/display/dc/link/link_detection: Remove unused variable
    'status'
  drm/amd/display/dc/link/protocols/link_dp_training: Remove set but
    unused variable 'result'
  drm/nouveau/dispnv04/crtc: Demote kerneldoc abuses
  drm/amd/display/dc/link/protocols/link_dp_capability: Remove unused
    variable and mark another as __maybe_unused
  drm/amd/display/dc/link/protocols/link_dp_capability: Demote
    non-compliant kerneldoc
  drm/nouveau/nvkm/engine/gr/tu102: Completely remove unused function
    ‘tu102_gr_load’
  drm/amd/display/dc/dce60/Makefile: Fix previous attempt to silence
    known override-init warnings
  drm/amd/display/dc/link/link_detection: Demote a couple of kerneldoc
    abuses
  drm/bridge/imx/Kconfig: Prevent imx-ldb-helper from appearing in 2
    separate modules

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     |  13 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c        |   4 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c          |   5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   3 +
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c |  28 ++--
 .../gpu/drm/amd/display/dc/dc_hdmi_types.h    |   1 -
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c |   5 +-
 drivers/gpu/drm/amd/display/dc/dce60/Makefile |   2 +-
 .../drm/amd/display/dc/link/link_detection.c  |  12 +-
 .../dc/link/protocols/link_dp_capability.c    |   4 +-
 .../dc/link/protocols/link_dp_training.c      |   3 +-
 .../link/protocols/link_edp_panel_control.c   |   5 +
 .../amd/display/include/ddc_service_types.h   |  13 --
 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  |   2 +
 drivers/gpu/drm/bridge/imx/Kconfig            |   7 +
 drivers/gpu/drm/bridge/imx/Makefile           |   7 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c   |  13 ++
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       |   5 -
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     |   5 -
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |   4 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/gf100.c  |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/runl.c   |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/gr/tu102.c    |  13 --
 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c       |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c    |   3 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   | 136 +++++++++---------
 .../gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c  |   4 +-
 drivers/gpu/drm/tegra/dc.c                    |   2 -
 drivers/gpu/drm/ttm/ttm_bo.c                  |   3 +-
 drivers/gpu/drm/vkms/vkms_composer.c          |   6 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c            |   6 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |   2 +-
 37 files changed, 163 insertions(+), 169 deletions(-)

--
2.40.0.rc1.284.g88254d51c5-goog

