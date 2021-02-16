Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81F831CFC2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 18:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DA06E075;
	Tue, 16 Feb 2021 17:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76036E075
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 17:59:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 52CE864E10
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 17:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613498380;
 bh=8anQdcb3Vman8xCUZ+opvvd8L7o45pWuXWLxXmQK5l0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cQhX3porn4DZZmmydsmq73/vNjPqOoeQ04z81JxCHe7KBHkqgfeO8bq/znf7CC2+s
 5yT17Pl+LVsdICv1GAtCnDv5WA6dPpd/meGjhI/HUyErZYWbeX3BELUUENavGZYn/5
 8Ax+Y8tOCKNvOkzJOgxQ0lkiVVtgHkQ3BuphQrTF6D0UHLId1L3YOvzDr6fyCyeYPU
 /yB6UCIFCHRjG9Wq52WlYoPuHc80iP9/fp1WtNPxjXyP47UoAr/D4kQ4nOCI0d/hpQ
 kmf3n4TrzUvR9y9yvcUNPHZIM83gwp+arwa6OHJSt7cuSlqV8Y4lCwtVQ/8cabpz/4
 S9HJWRBJAvK8Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 423AA653B9; Tue, 16 Feb 2021 17:59:40 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Tue, 16 Feb 2021 17:59:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211425-2300-aJWWX4Nwds@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=211425

--- Comment #9 from Andreas (icedragon.aw@web.de) ---
This was my first patch bisection - after 14 rebuilds and reboots it says:

9555152beb1143c85c03f9b9de59863cbbe89f4b is the first bad commit
commit 9555152beb1143c85c03f9b9de59863cbbe89f4b
Merge: f75020fcb97a 7808363154d6
Author: Dave Airlie <airlied@redhat.com>
Date:   Thu Jul 2 15:17:31 2020 +1000

    Merge tag 'amd-drm-next-5.9-2020-07-01' of
git://people.freedesktop.org/~agd5f/linux into drm-next

    amd-drm-next-5.9-2020-07-01:

    amdgpu:
    - DC DMUB updates
    - HDCP fixes
    - Thermal interrupt fixes
    - Add initial support for Sienna Cichlid GPU
    - Add support for unique id on Arcturus
    - Major swSMU code cleanup
    - Skip BAR resizing if the bios already did id
    - Fixes for DCN bandwidth calculations
    - Runtime PM reference count fixes
    - Add initial UVD support for SI
    - Add support for ASSR on eDP links
    - Lots of misc fixes and cleanups
    - Enable runtime PM on vega10 boards that support BACO
    - RAS fixes
    - SR-IOV fixes
    - Use IP discovery table on renoir
    - DC stream synchronization fixes

    amdkfd:
    - Track SDMA usage per process
    - Fix GCC10 compiler warnings
    - Locking fix

    radeon:
    - Default to on chip GART for AGP boards on all arches
    - Runtime PM reference count fixes

    UAPI:
    - Update comments to clarify MTYPE

    From: Alex Deucher <alexdeucher@gmail.com>
    Link:
https://patchwork.freedesktop.org/patch/msgid/20200701155041.1102829-1-alexander.deucher@amd.com
    Signed-off-by: Dave Airlie <airlied@redhat.com>

 drivers/gpu/drm/amd/amdgpu/Makefile                |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    73 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |   834 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |     5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    79 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   106 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   134 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c            |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.h     |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |     2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c             |   300 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   126 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |    33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h           |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   115 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    39 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    26 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   178 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |     2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |     5 -
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |   100 +
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.h            |    30 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |     2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   527 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    12 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |     4 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |   411 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.h           |    39 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    94 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |    15 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   613 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.h             |    29 +
 drivers/gpu/drm/amd/amdgpu/mes_api_def.h           |   443 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |   664 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    76 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |    21 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   103 +-
 drivers/gpu/drm/amd/amdgpu/nv.h                    |     1 +
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |     8 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |    92 +-
 drivers/gpu/drm/amd/amdgpu/sdma_common.h           |    42 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    47 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |     7 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.h             |    15 -
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  1757 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.h             |    30 +
 drivers/gpu/drm/amd/amdgpu/si.c                    |    33 +-
 drivers/gpu/drm/amd/amdgpu/si_dpm.h                |     2 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |     2 +
 drivers/gpu/drm/amd/amdgpu/sid.h                   |    26 +-
 .../gpu/drm/amd/amdgpu/sienna_cichlid_reg_init.c   |    54 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    16 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |    15 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   793 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.h              |    29 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   148 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   127 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   122 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  1684 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.h              |    29 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   877 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |   301 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    28 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    63 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    21 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   246 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   295 +-
 drivers/gpu/drm/amd/display/Kconfig                |     8 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   100 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     2 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |    10 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |    43 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    20 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    19 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   |    30 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |    25 -
 drivers/gpu/drm/amd/display/dc/Makefile            |     4 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   204 +
 .../amd/display/dc/bios/command_table_helper2.c    |     5 +
 .../dc/bios/dce112/command_table_helper2_dce112.c  |    40 +
 .../dc/bios/dce112/command_table_helper2_dce112.h  |     3 +
 .../gpu/drm/amd/display/dc/calcs/dcn_calc_auto.c   |     6 +-
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |    18 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |    10 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    22 +
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |    18 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |     3 +-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn30/dalsmc.h  |    60 +
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   543 +
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h   |    38 +
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c       |   255 +
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.h       |   108 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   137 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |    59 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    43 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |    42 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   163 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |     8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    40 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    37 +
 drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c |     3 -
 drivers/gpu/drm/amd/display/dc/dc.h                |    65 +-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |     5 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    28 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     2 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    75 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |     6 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    15 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    36 +
 drivers/gpu/drm/amd/display/dc/dce/Makefile        |     3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |    20 +
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |     4 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |   153 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |    42 +
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |    46 +
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |    10 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |    92 -
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |    57 +
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.h  |    39 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     3 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    28 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.h    |     1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |    12 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    37 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |     1 +
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |     7 +
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |     6 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |    13 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |    62 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |    42 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |    22 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |     4 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |    17 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   |    12 -
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |     9 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |    20 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h  |    41 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   134 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |     1 +
 .../drm/amd/display/dc/dcn20/dcn20_link_encoder.h  |     7 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    93 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |   121 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |    89 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.h |     6 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |     5 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |    54 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c  |   206 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h  |   230 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |   640 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.h |    78 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dccg.c  |   100 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dccg.h  |    66 +
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.c  |   205 +
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.h  |    76 +
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |   851 +
 .../display/dc/dcn30/dcn30_dio_stream_encoder.h    |   269 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |  1414 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |   608 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |   410 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c   |   264 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h   |   923 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c    |   354 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c    |   417 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.h    |   119 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |   532 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h  |   292 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   719 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h |    70 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |   141 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.h  |    33 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c  |   239 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.h  |   463 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |  1409 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |   665 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_opp.h   |    36 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   365 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |   333 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  2691 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.h  |    82 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c   |   194 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.h   |   133 +
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |     1 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    23 +
 drivers/gpu/drm/amd/display/dc/dm_services.h       |    69 -
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     7 +
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |    33 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |    33 +-
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |    36 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |  6865 ++
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.h |    43 +
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |  1868 +
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.h  |    69 +
 .../drm/amd/display/dc/dml/display_mode_enums.h    |     6 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |   181 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |    11 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    14 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    67 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |   230 +-
 .../gpu/drm/amd/display/dc/dml/dml_inline_defs.h   |    18 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c       |     8 +-
 drivers/gpu/drm/amd/display/dc/gpio/Makefile       |    10 +
 .../amd/display/dc/gpio/dcn30/hw_factory_dcn30.c   |   257 +
 .../amd/display/dc/gpio/dcn30/hw_factory_dcn30.h   |    33 +
 .../amd/display/dc/gpio/dcn30/hw_translate_dcn30.c |   387 +
 .../amd/display/dc/gpio/dcn30/hw_translate_dcn30.h |    35 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     9 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     8 +
 drivers/gpu/drm/amd/display/dc/inc/core_status.h   |     2 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    31 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h   |     2 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |     2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    75 +
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    14 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |     6 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |     7 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |    83 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |     7 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |     9 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mcif_wb.h    |     8 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |   108 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |     4 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    19 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |     6 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |     3 +
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |    10 +
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |   384 +
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.h   |    37 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |    10 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    27 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   500 +-
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd_dal.h    |    56 -
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd_vbios.h  |    41 -
 .../gpu/drm/amd/display/dmub/inc/dmub_fw_meta.h    |    63 -
 .../gpu/drm/amd/display/dmub/inc/dmub_gpint_cmd.h  |    75 -
 drivers/gpu/drm/amd/display/dmub/inc/dmub_rb.h     |   152 -
 drivers/gpu/drm/amd/display/dmub/inc/dmub_types.h  |    75 -
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |     3 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |    49 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.c  |    10 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.h  |     6 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.c  |   184 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.h  |    50 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_reg.h    |     2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    91 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     4 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |     1 +
 .../amd/display/include/grph_object_ctrl_defs.h    |     5 +
 drivers/gpu/drm/amd/display/modules/color/Makefile |     2 +-
 .../drm/amd/display/modules/color/color_gamma.c    |   115 +-
 .../drm/amd/display/modules/color/color_gamma.h    |    18 +-
 .../drm/amd/display/modules/color/color_table.c    |    48 +
 .../drm/amd/display/modules/color/color_table.h    |    47 +
 .../gpu/drm/amd/display/modules/inc/mod_stats.h    |     8 +-
 .../drm/amd/display/modules/power/power_helpers.c  |    96 +-
 .../include/asic_reg/athub/athub_2_1_0_offset.h    |   523 +
 .../include/asic_reg/athub/athub_2_1_0_sh_mask.h   |  2378 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_offset.h    | 17880 +++++
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   | 70929 +++++++++++++++++++
 .../amd/include/asic_reg/dcn/dpcs_3_0_0_offset.h   |   573 +
 .../amd/include/asic_reg/dcn/dpcs_3_0_0_sh_mask.h  |  3565 +
 .../drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h |     6 +-
 .../amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h    |    36 +
 .../amd/include/asic_reg/gc/gc_10_3_0_default.h    |  7272 ++
 .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h | 13473 ++++
 .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    | 47727 +++++++++++++
 .../drm/amd/include/asic_reg/gc/gc_9_0_offset.h    |     8 +-
 .../drm/amd/include/asic_reg/gc/gc_9_0_sh_mask.h   |    27 +
 .../drm/amd/include/asic_reg/gc/gc_9_1_offset.h    |     8 +-
 .../drm/amd/include/asic_reg/gc/gc_9_1_sh_mask.h   |    26 +
 .../drm/amd/include/asic_reg/gc/gc_9_2_1_offset.h  |     8 +-
 .../drm/amd/include/asic_reg/gc/gc_9_2_1_sh_mask.h |    26 +
 .../gpu/drm/amd/include/asic_reg/uvd/uvd_3_1_d.h   |    98 +
 .../drm/amd/include/asic_reg/uvd/uvd_3_1_sh_mask.h |   804 +
 .../amd/include/asic_reg/vcn/vcn_3_0_0_offset.h    |  1542 +
 .../amd/include/asic_reg/vcn/vcn_3_0_0_sh_mask.h   |  5496 ++
 drivers/gpu/drm/amd/include/atomfirmware.h         |   283 +
 .../amd/include/ivsrcid/sdma2/irqsrcs_sdma2_5_0.h  |    45 +
 .../amd/include/ivsrcid/sdma3/irqsrcs_sdma3_5_0.h  |    45 +
 .../gpu/drm/amd/include/sienna_cichlid_ip_offset.h |  1168 +
 drivers/gpu/drm/amd/include/soc15_ih_clientid.h    |     1 +
 drivers/gpu/drm/amd/powerplay/Makefile             |     2 +-
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         |  1520 +-
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       |  1152 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c   |     8 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c   |     2 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c |    10 +-
 .../gpu/drm/amd/powerplay/hwmgr/vega10_thermal.c   |     4 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c |     4 +-
 .../amd/powerplay/hwmgr/vega12_processpptables.c   |     2 +-
 .../gpu/drm/amd/powerplay/hwmgr/vega12_thermal.c   |     4 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c |     6 +-
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h     |    84 +-
 drivers/gpu/drm/amd/powerplay/inc/arcturus_ppsmc.h |     3 +
 .../amd/powerplay/inc/smu11_driver_if_arcturus.h   |    12 +-
 .../powerplay/inc/smu11_driver_if_sienna_cichlid.h |  1220 +
 drivers/gpu/drm/amd/powerplay/inc/smu_types.h      |     4 +
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h      |    35 +-
 .../gpu/drm/amd/powerplay/inc/smu_v11_0_7_ppsmc.h  |   139 +
 .../drm/amd/powerplay/inc/smu_v11_0_7_pptable.h    |   196 +
 drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h      |     2 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         |   747 +-
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         |    31 +-
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c |  2640 +
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.h |    37 +
 drivers/gpu/drm/amd/powerplay/smu_internal.h       |   274 +-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c          |   633 +-
 drivers/gpu/drm/amd/powerplay/smu_v12_0.c          |    54 +-
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c   |     2 +-
 .../gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c    |     2 +-
 .../gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c   |    11 +-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         |  3288 -
 drivers/gpu/drm/amd/powerplay/vega20_ppt.h         |   179 -
 drivers/gpu/drm/radeon/ci_dpm.c                    |     2 +-
 drivers/gpu/drm/radeon/ni_dpm.c                    |     9 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |    20 +-
 drivers/gpu/drm/radeon/radeon_display.c            |     4 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |     9 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |     4 +-
 include/drm/amd_asic_type.h                        |     1 +
 include/uapi/drm/amdgpu_drm.h                      |    10 +-
 362 files changed, 222431 insertions(+), 8683 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/athub_v2_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_api_def.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_common.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sienna_cichlid_reg_init.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dalsmc.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dccg.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_link_encoder.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_opp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_translate_dcn30.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_translate_dcn30.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.h
 delete mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd_dal.h
 delete mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd_vbios.h
 delete mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_fw_meta.h
 delete mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_gpint_cmd.h
 delete mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_rb.h
 delete mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_types.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.h
 create mode 100644 drivers/gpu/drm/amd/display/modules/color/color_table.c
 create mode 100644 drivers/gpu/drm/amd/display/modules/color/color_table.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/athub/athub_2_1_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/athub/athub_2_1_0_sh_mask.h
 create mode 100755 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_offset.h
 create mode 100755
drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h
 create mode 100755
drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_0_offset.h
 create mode 100755
drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_default.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_3_1_d.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_3_1_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_3_0_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_3_0_0_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/ivsrcid/sdma2/irqsrcs_sdma2_5_0.h
 create mode 100644
drivers/gpu/drm/amd/include/ivsrcid/sdma3/irqsrcs_sdma3_5_0.h
 create mode 100644 drivers/gpu/drm/amd/include/sienna_cichlid_ip_offset.h
 create mode 100644
drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_sienna_cichlid.h
 create mode 100644 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0_7_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0_7_pptable.h
 create mode 100644 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
 create mode 100644 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.h
 delete mode 100644 drivers/gpu/drm/amd/powerplay/vega20_ppt.c
 delete mode 100644 drivers/gpu/drm/amd/powerplay/vega20_ppt.h

By the way - the last try was a good one, but it also shows the follwoing
warnings triggered by the monitor off/on events:

[Di Feb 16 18:53:41 2021] [drm:mod_hdcp_add_display_to_topology] *ERROR* Failed
to add display topology, DTM TA is not initialized.
[Di Feb 16 18:53:41 2021] [drm] [Link 0] WARNING MOD_HDCP_STATUS_FAILURE IN
STATE HDCP_UNINITIALIZED STAY COUNT 0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
