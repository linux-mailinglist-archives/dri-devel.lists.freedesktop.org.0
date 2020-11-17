Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAF12B71BD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 23:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BCE89FFD;
	Tue, 17 Nov 2020 22:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255446E145;
 Tue, 17 Nov 2020 22:40:17 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id l2so22624822qkf.0;
 Tue, 17 Nov 2020 14:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ld+0L9TnPmJzZV9gP3PNezDbEnw1DDEK+nYUW4WjDKE=;
 b=cistpNEGhMr5XvaUq139fkRmJNO+iKEzlQA4Orn45+LlqZ56YFXxFqFhhrX5qqXKz2
 UaVPEBZRQ7gb+hve8H03vJmPPLsUjkzkug8JZU+MYwAqMOqPhUdhgFhf5V74zPosE7Rs
 rAU3JrKF8Ju3oTV13gS9VaCenYvXra/gX2ptA+hhi6kT7o2Ns3RbMGeuij3DL2pojWed
 aYIGWtNrm/hCi7GvxqQZ+jNHnHsfspLHnQiv97WU9yO0LhFVXDySK+8sljAfqw3D5zRF
 69efDdnazOTRwAxCtz5ewfl9xnQrT3ktS9UVIjDxQIQjYOLIf+s56MiXVHhZWNtSSRyb
 OljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ld+0L9TnPmJzZV9gP3PNezDbEnw1DDEK+nYUW4WjDKE=;
 b=aEfa/th2Yt/Oa3r1GUUx8bJRCz9Y3+ZSlnkBLhTt2aeeoXwXv4TT0Y/dSEW+fZyMcs
 XHlgyFU647fERkkiJlNs+SbgXOC1MqEydVFLWcOZaMufJXl6WtEyVPkVV2vzT0D68Gh2
 XgZ7PLDrnPk0SlNWwr6ah/Yi5QZCpS9mPL5IEoR4phoIWvnO5wJpoFO9ZTyTrhWpvDjA
 9kWpkCE/HtzuUH51Bj20Xo35CVsDZq8yFf2rqOaFtzp2htHxDCYDSt0TC/LTQhzA/Lg5
 eA/fhVucXCu/M+TQiYpUWJC6ItjgjvvThqKuhPLczYlXI1USsRB6YenRy5/7fOaXKxp6
 DZMw==
X-Gm-Message-State: AOAM5301rifeq8CcesjFJFkF4bzkbn4R5c6nbMtZrFsV1oekhX1MU6d9
 MXZyPsi4EOi9uwVFlLaQyA4gk5m37yc=
X-Google-Smtp-Source: ABdhPJwu5Esq/UbXcL1LFF0yhuaX535q1AEqiILWu/014/uo326rSwauIgYlowYMfASGq9DFcKZNcg==
X-Received: by 2002:a37:4911:: with SMTP id w17mr1876986qka.468.1605652815465; 
 Tue, 17 Nov 2020 14:40:15 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id 9sm16105021qkm.81.2020.11.17.14.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 14:40:14 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd, radeon, scheduler drm-next-5.11
Date: Tue, 17 Nov 2020 17:40:03 -0500
Message-Id: <20201117224003.4056-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Updates for 5.11.

The following changes since commit 512bce50a41c528fa15c4c014293e7bebf018658:

  Merge v5.10-rc3 into drm-next (2020-11-10 14:36:36 +0100)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-next-5.11-2020-11-17

for you to fetch changes up to 178631700f9dc40df754acbe766b55753ddcbfec:

  drm/amd/pm: fix spelling mistakes in dev_warn messages (2020-11-17 14:07:26 -0500)

----------------------------------------------------------------
amd-drm-next-5.11-2020-11-17:

amdgpu:
- DCN 3.02 fixes
- Various DC fixes
- SR-IOV fixes
- Dimgrey Cavefish fixes
- W=1  fixes
- Vangogh updates
- Initial S0ix support
- DCN 3.x FP fixes
- FB modifier fixes

amdkfd:
- CRAT table fixes

radeon:
- W=1 fixes

Scheduler:
- W=1 fixes

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu/pm/smu12: cache smu firmware version
      drm/amdgpu/pm/smu11: cache smu firmware version
      drm/amdgpu/display: fix FP handling in DCN30
      drm/amd/display: Add missing pflip irq for dcn2.0
      drm/amdgpu: remove experimental flag from arcturus

Alvin Lee (1):
      drm/amd/display: Check other planes for iflip only if GSL already enabled

Anthony Koo (2):
      drm/amd/display: [FW Promotion] Release 0.0.41
      drm/amd/display: [FW Promotion] Release 0.0.42

Aric Cyr (3):
      drm/amd/display: Only wait for flip pending on immediate flips
      drm/amd/display: 3.2.111
      drm/amd/display: 3.2.112

Bas Nieuwenhuizen (4):
      drm/fourcc: Fix modifier field mask for AMD modifiers.
      drm/amd/display: Store gem objects for planes 1-3
      drm/amd/display: Set new format info for converted metadata.
      drm/amd/display: Extract 3rd plane from metadata

Bernard Zhao (1):
      amd/display/amdgpu_dm: delete same check in if condition

Bhaskar Chowdhury (2):
      drivers: amdgpu: amdgpu_display.c: Fix a spelling doens\'t to doesn\'t
      drivers: amdgpu: amdgpu_display: Fixed the spelling of falg to flag

Bhawanpreet Lakha (4):
      drm/amdgpu: Add and use seperate reg headers for dcn302
      drm/amdgpu: Use PSP_FW_NAME_LEN instead of magic number
      drm/amdgpu: Enable TA firmware loading for dimgrey_cavefish
      drm/amd/display: Update dmub code

Bokun Zhang (3):
      drm/amd/amdgpu: Fix incorrect logic to increment VCN doorbell index
      drm/amd/amdgpu: Add rev_id workaround logic for SRIOV setup
      drm/amd/amdgpu: Update VCN initizalization behvaior

Colin Ian King (1):
      drm/amd/pm: fix spelling mistakes in dev_warn messages

Dmytro Laktyushkin (2):
      drm/amd/display: correct dml dsc bpc assignment
      drm/amd/display: remove unused dml variables

Eric Bernstein (1):
      drm/amd/display: Move common speakersToChannels definition to hw_shared.h

Hanjun Guo (2):
      drm/amdkfd: Move the ignore_crat check before the CRAT table get
      drm/amdkfd: Put ACPI table after using it

Hawking Zhang (8):
      drm/amdgpu: add amdgpu_smuio structure
      drm/amdgpu: implement smuio v9_0 callbacks
      drm/amdgpu: implement smuio v11_0 callbacks
      drm/amdgpu: switch to use smuio callbacks for AI family
      drm/amdgpu: disable rom clock gating support for APUs
      drm/amdgpu: check hive pointer before access
      drm/amdgpu: declare smuio callback function as static
      drm/amdgpu: make gfxhub_v1_0 callback functions to be static

Isabel Zhang (2):
      drm/amd/display: Add fallback to prefetch mode 1 if 0 fails
      drm/amd/display: Prevent freesync power optimization during validation

Jacky Liao (1):
      drm/amd/display: Add I2C memory low power support

Jane Jian (1):
      drm/amdgpu/sriov: reopen sienna_child smu ip block under sriov

Jing Zhou (1):
      drm/amd/display: force use sRGB for video TF is sRGB or BT709

John Clements (1):
      drm/amdgpu: add UMC to ip discovery map

Krunoslav Kovac (1):
      drm/amd/display: Engage PSR synchronously

Lee Jones (115):
      drm/amd/amdgpu/amdgpu_device: Provide documentation for 'reg_addr' params
      drm/amd/display/dc/basics/fixpt31_32: Move variables to where they're used
      drm/amd/amdgpu/amdgpu_kms: Remove 'struct drm_amdgpu_info_device dev_info' from the stack
      gpu: drm: scheduler: sched_main: Provide missing description for 'sched' paramter
      gpu: drm: scheduler: sched_entity: Demote non-conformant kernel-doc headers
      gpu: drm: radeon: radeon_drv: Remove unused variable 'ret'
      gpu: drm: amd: amdgpu: amdgpu: Mark global variables as __maybe_unused
      gpu: drm: radeon: radeon_device: Fix a bunch of kernel-doc misdemeanours
      drm/radeon/radeon_kms: Include header containing our own prototypes
      drm/radeon/radeon_drv: Source file headers are not good candidates for kernel-doc
      drm/radeon/radeon_drv: Move prototypes to a shared headerfile
      drm/radeon: Move prototypes to shared header
      drm/radeon/atombios_crtc: Remove description of non-existent function param 'encoder'
      drm/radeon/radeon_ttm: Place declaration of 'rdev' in same clause as its use
      drm/radeon/radeon_fence: Demote some non-conformant kernel-doc headers and fix another
      drm/radeon/radeon_connectors: Strip out set but unused variable 'ret'
      drm/radeon/radeon_display: Remove unused variable 'mod'
      drm/radeon/radeon_i2c: Remove pointless function header
      drm/radeon/radeon_ring: Add missing function parameters 'rdev' and 'data'
      drm/radeon/r600: Strip out set but unused 'tmp' variables
      drm/radeon/radeon_cs: Fix a bunch of doc-rot issues
      drm/radeon/radeon_display: Fix function doc formatting and missing param issues
      drm/radeon/r600: Fix a misnamed parameter description and a formatting issue
      drm/radeon/cik: Fix a bunch of function parameter descriptions
      drm/radeon/evergreen: Remove set but unused variable 'mc_shared_chmap'
      drm/radeon/evergreen: Add comment for 'evergreen_page_flip()'s 'async' param
      drm/radeon/si: Remove set but unused variable 'mc_shared_chmap'
      drm/radeon/ni: Demote vague attempt at function header doc
      drm/radeon/cik: Remove set but unused variable 'mc_shared_chmap'
      drm/radeon/radeon_vm: Fix some function parameter documentation
      drm/radeon/kv_dpm: Strip out unused functions and their tables
      drm/radeon/trinity_dpm: Remove some defined but never used arrays
      drm/radeon/radeon_dp_mst: Remove unused variable 'ret' from radeon_mst_encoder_dpms()
      drm/radeon/radeon_sync: Add description for function param 'rdev'
      drm/radeon/radeon_ib: Supply description for 'radeon_ib_get's get param
      drm/radeon/ci_dpm: Remove set but unused variable 'dpm_event_src'
      drm/radeon/radeon_mn: Supply description for 'cur_seq' even if it is unused
      drm/radeon/r100: Fix some kernel-doc formatting, misnaming and missing issues
      drm/radeon/r600_cs: Fix some doc-rot and supply missing function param docs
      drm/radeon/cik_sdma: Demote vague attempt at kernel-doc
      drm/radeon/evergreen_cs: Fix misnaming issues surrounding 'p' param
      drm/radeon/evergreen_dma: Fix doc-rot of function parameter 'resv'
      drm/radeon/ni: Remove set but unused variable 'mc_shared_chmap'
      drm/radeon/sumo_dpm: Move 'sumo_get_pi()'s prototype into shared header
      drm/amd/amdgpu/amdgpu_kms: Fix misnaming of parameter 'dev'
      drm/amd/amdgpu/amdgpu_fence: Fix some issues pertaining to function documentation
      drm/amd/amdgpu/amdgpu_ttm: Demote non-conformant kernel-doc headers, fix slightly lacking ones
      drm/amd/amdgpu/amdgpu_ring: Fix a bunch of function misdocumentation
      drm/amd/amdgpu/amdgpu_display: Remove pointless header
      drm/amd/amdgpu/amdgpu_cs: Add a couple of missing function param descriptions
      drm/amd/include/vega10_ip_offset: Mark _BASE structs as __maybe_unused
      drm/amd/display/dc/core/dc_link_dp: Move DP_VGA_LVDS_CONVERTER_ID_{2, 3} to where they're used
      drm/amd/display/dc/core/dc_link_ddc: Move DP_DVI_CONVERTER_ID_{4, 5} to where they're used
      drm/amd/amdgpu/amdgpu_ring: Fix misnaming of param 'max_dw'
      drm/amd/amdgpu/amdgpu_ib: Fix some incorrect/incomplete function documentation
      drm/amd/amdgpu/amdgpu_pll: Fix kernel-doc formatting, missing and extra params
      drm/amd/amdgpu/amdgpu_sync: Fix misnamed, missing and extra param descriptions
      drm/amd/amdgpu/amdgpu_vram_mgr: Add missing descriptions for 'dev' and 'dir'
      drm/amd/amdgpu/amdgpu_virt: Make local function 'amdgpu_virt_update_vf2pf_work_item()' static
      drm/amd/amdgpu/amdgpu_csa: Remove set but unused variable 'r'
      drm/amd/amdgpu/amdgpu_sched: Consume our own header containing prototypes
      drm/amd/amdgpu/amdgpu_ids: Supply missing docs for 'id' and 'vmhub'
      drm/amd/amdgpu/amdgpu_debugfs: Demote obvious abuse of kernel-doc formatting
      drm/amd/amdgpu/amdgpu_gmc: Demote one and fix another function header
      drm/amd/amdgpu/amdgpu_ras: Remove unused function 'amdgpu_ras_error_cure'
      drm/amd/amdgpu/amdgpu_ras: Make local function 'amdgpu_ras_error_status_query' static
      drm/amd/amdgpu/amdgpu_vm_cpu: Fix 'amdgpu_vm_cpu_prepare()'s doc-rot
      drm/amd/amdgpu/amdgpu_vm_sdma: Fix 'amdgpu_vm_sdma_prepare()'s doc-rot
      drm/amd/amdgpu/amdgpu_fw_attestation: Consume our own header containing prototypes
      drm/amd/amdgpu/smu_v11_0_i2c: Provide descriptions for 'control' and 'data' params
      drm/amd/amdgpu/gfx_v7_0: Remove unused struct definition
      drm/radeon/atombios_encoders: Move 'radeon_atom_get_tv_timings()'s prototype into shared location
      drm/radeon/radeon: Move prototype into shared header
      drm/radeon/radeon_kms: Move 'radeon_*_kms' prototypes to shared header
      drm/radeon/radeon_kms: Fix misnaming of 'radeon_info_ioctl's dev param
      drm/radeon: Move radeon_ttm{init, fini} to shared location
      drm/radeon/radeon_legacy_encoders: Move 'radeon_add_legacy_encoder' prototype to shared header
      drm/radeon/radeon_legacy_encoders: Move 'radeon_add_legacy_encoder's prototype to shared location
      drm/radeon/radeon_irq_kms: Demote non-conformant kernel-doc fix another
      drm/radeon/rv770: Move 'rv770_set_clk_bypass_mode' prototype to shared location
      drm/radeon/radeon_pm: Move 'radeon_pm_acpi_event_handler' prototype into shared header
      drm/radeon/radeon_audio: Move 'dce3_2_*' prototypes to shared location
      drm/radeon/evergreen: Move 'evergreen_*' and 'sumo_*' prototypes out to shared location
      drm/radeon/radeon_drv: Move 'radeon_mmap()'s prototype to shared header
      drm/radeon/radeon_drv: Move 'radeon_driver_irq_handler_kms's prototype into shared header
      drm/radeon/atom: Move 'radeon_atom_hw_i2c_*()'s prototypes into shared header
      drm/radeon/radeon_gem: Move 'radeon_gem_prime_*()'s prototypes to shared header
      drm/radeon/evergreen_hdmi: Move 'evergreen_*()' and 'dce4_*()' HDMI prototypes to shared header
      drm/radeon/rv770: Move 'rv770_get_*()'s prototypes to shared header
      drm/radeon/ni_dpm: Move 'ni_get_{pi, ps}()'s into shared header
      drm/radeon/evergreen: Move 'cayman_*()'s prototypes to shared header
      drm/radeon/r600_dma: Move 'r600_gpu_check_soft_reset()'s prototype to shared location
      drm/radeon/cik: Move 'r600_ih_ring_{alloc, fini}()'s prototypes to shared header
      drm/radeon/evergreen_dma: Move 'evergreen_gpu_check_soft_reset()'s prototype to shared header
      drm/radeon/r600: Move 'evergreen_rlc_resume()'s prototype to shared header
      drm/radeon/ni_dma: Move 'cayman_gpu_check_soft_reset()'s prototype to shared header
      drm/radeon/radeon_atombios: Move 'radeon_add_atom_encoder()'s prototype to shared header
      drm/radeon/radeon_encoders: Move 'radeon_atom_backlight_init's prototype to shared header
      drm/radeon/ci_dpm: Move 'ci_*()'s prototypes to shared header
      drm/radeon/si_dpm: Move 'si_mc_load_microcode()'s prototype to shared header
      drm/radeon/si_dma: Move 'si_gpu_check_soft_reset()'s prototype to shared header
      drm/radeon/cik: Move 'si_*()'s prototypes to shared header
      drm/radeon/btc_dpm: Move 'evergreen_get_pi's prototype to shared header
      drm/radeon/radeon_audio: Move 'dce6_*()'s prototypes to shared header
      drm/radeon/evergreen: Move 'si_get_csb_*()'s prototypes to shared header
      drm/radeon/cik_sdma: Move 'amdgpu_cik_gpu_check_soft_reset()'s prototype to shared header
      drm/radeon/evergreen: Move 'cik_*()'s prototypes to shared header
      drm/radeon/ci_dpm: Move 'si_*()'s prototypes to shared header
      drm/radeon/cik: Move 'Move 'cik_sdma_*()'s prototypes to shared header
      drm/radeon/si_dpm: Move 'vce_v1_0_enable_mgcg()'s prototype to shared header
      drm/radeon/cik: Move 'vce_v2_0_enable_mgcg()'s prototype to shared header
      drm/radeon/evergreen_cs: Move 'r600_dma_cs_next_reloc()'s prototype to shared header
      drm/radeon/radeon_audio: Move 'r600_*' prototypes into shared header
      drm/radeon/radeon_drv: Move 'radeon_gem_prime_import_sg_table()'s prototype to shared header
      drm/amd/amdgpu/atombios_encoders: Remove set but unused variable 'backlight_level'

Likun Gao (2):
      drm/amd/pm: update driver if file for sienna cichlid
      drm/amdgpu: update golden setting for sienna_cichlid

Nirmoy Das (2):
      drm/amdgpu: fix compute queue priority if num_kcq is less than 4
      drm/amdgpu: fix usable gart size calculation

Prike Liang (4):
      drm/amdgpu: add s0i3 capacity check for s0i3 routine (v2)
      drm/amdgpu: add amdgpu_gfx_state_change_set() set gfx power change entry (v2)
      drm/amdgpu: update amdgpu device suspend/resume sequence for s0i3 support
      drm/amd/pm: add gfx_state_change_set() for rn gfx power switch (v2)

Ramesh Errabolu (1):
      drm/amd/amdgpu: Import amdgpu_amdkfd_gfx_v9 header file into implementation

Raymond Yang (1):
      drm/amd/display: correct data type

Roman Li (1):
      drm/amdgpu: add ta firmware load for green-sardine

Roy Chan (1):
      drm/amd/display: Detect dynamic backlight support in eDP sink

Samson Tam (1):
      drm/amd/display: fix cursor calculation for 1xnY rotated display groups

Simon Ser (2):
      drm/fourcc: add table describing AMD modifiers bit layout
      drm/fourcc: fix AMD modifiers PACKERS field doc

Sung Lee (2):
      drm/amd/display: Populate hostvm parameter before DML calculation
      drm/amd/display: Handle Unknown Result for SMU Periodic Retraining on DCN2.1

Tao Zhou (3):
      drm/amdgpu: update gfx golden setting for dimgrey_cavefish
      drm/amd/pm: update driver if version for dimgrey_cavefish
      drm/amd/pm: retire dimgrey_cavefish hardcode for the use of soft PPTable

Tian Tao (1):
      drm/amd/pm: Use kmemdup instead of kmalloc and memcpy

Tianci.Yin (1):
      drm/amdgpu: enable DCN for navi10 headless SKU

Victor Lu (1):
      drm/amd/display: Explicitly disable cursor when disabling CRTC

Wayne Lin (1):
      drm/amd/display: Expose new CRC window property

Wenjing Liu (1):
      drm/amd/display: minor restructuring of pbn calculation functions

Wyatt Wood (2):
      drm/amd/display: Hook up PSR residency command to DSAT
      drm/amd/display: Increase sr enter/exit in rn ddr4 watermark table

Xiaojian Du (4):
      drm/amd/pm: add the interface to dump smu metrics table for vangogh
      drm/amd/pm: update the swSMU headers for vangogh
      drm/amd/pm: add the fine grain tuning function for vangogh
      drm/amd/pm: enable the fine grain tuning function for vangogh

Yongqiang Sun (7):
      drm/amd/display: update dpp dto phase and modulo.
      drm/amd/display: check actual clock value.
      drm/amd/display: cap dpp dto phase not more than modulo.
      drm/amd/display: Program dpp dto based on actual dpp clk
      drm/amd/display: set dpp dto as per requested clk for lower case.
      drm/amd/display: Add dual edp optimization flag.
      drm/amd/display: update vgh bounding box

mengwang (1):
      drm/amd/pm: correct table_clk_vlt memory size due to replacing one-element array with flexible-array in struct phm_clock_voltage_dependency_table

 drivers/gpu/drm/amd/amdgpu/Makefile                |     5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   227 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   106 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c          |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |    37 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_test.c           |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    59 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    13 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |     3 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    16 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |     9 -
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.h              |     1 -
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |     7 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |    17 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.h           |    10 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |    11 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |     5 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |    10 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c         |     3 +
 drivers/gpu/drm/amd/amdgpu/smuio_v11_0.c           |    77 +
 drivers/gpu/drm/amd/amdgpu/smuio_v11_0.h           |    30 +
 drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c            |    77 +
 drivers/gpu/drm/amd/amdgpu/smuio_v9_0.h            |    30 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    61 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    61 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    23 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   246 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    19 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |    43 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |     3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     6 +-
 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c |     5 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     5 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |    68 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |    11 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |     4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    48 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |     4 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    16 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |     9 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |     7 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    21 +
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |    24 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |    12 +
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.h    |    16 +
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |    82 -
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   126 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |     4 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    64 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |     1 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |    82 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    35 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    23 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |     8 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.c  |   129 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h  |    36 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |     2 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    62 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c  |     1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h  |    83 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    59 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.h  |     3 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |    61 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |     5 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |     2 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |     2 -
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |     5 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |     1 -
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |     1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h       |     2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |    84 +
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |     4 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    20 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    10 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |    23 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |     6 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.c  |     5 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.h  |     2 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.c  |     5 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.h  |     1 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    26 +-
 .../drm/amd/display/include/ddc_service_types.h    |     8 -
 drivers/gpu/drm/amd/display/include/fixed31_32.h   |     6 -
 .../amd/include/asic_reg/dcn/dcn_3_0_2_offset.h    | 16159 +++++
 .../amd/include/asic_reg/dcn/dcn_3_0_2_sh_mask.h   | 62376 +++++++++++++++++++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     1 +
 drivers/gpu/drm/amd/include/vega10_ip_offset.h     |    76 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |     8 +
 drivers/gpu/drm/amd/pm/inc/hwmgr.h                 |     1 +
 drivers/gpu/drm/amd/pm/inc/rv_ppsmc.h              |     3 +-
 .../amd/pm/inc/smu11_driver_if_sienna_cichlid.h    |    16 +-
 .../gpu/drm/amd/pm/inc/smu11_driver_if_vangogh.h   |     6 +
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |     6 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_5_pmfw.h        |    11 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_5_ppsmc.h       |    11 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    19 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |    13 +-
 .../pm/powerplay/hwmgr/vega12_processpptables.c    |     5 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    16 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    22 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    20 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   201 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     7 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |     3 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |     1 +
 drivers/gpu/drm/radeon/atom.h                      |     7 +
 drivers/gpu/drm/radeon/atombios_crtc.c             |     1 -
 drivers/gpu/drm/radeon/atombios_encoders.c         |     5 +-
 drivers/gpu/drm/radeon/btc_dpm.c                   |     6 +-
 drivers/gpu/drm/radeon/ci_dpm.c                    |    25 +-
 drivers/gpu/drm/radeon/cik.c                       |    33 +-
 drivers/gpu/drm/radeon/cik.h                       |    40 +
 drivers/gpu/drm/radeon/cik_sdma.c                  |     7 +-
 drivers/gpu/drm/radeon/cypress_dpm.c               |     6 +-
 drivers/gpu/drm/radeon/dce6_afmt.c                 |     1 +
 drivers/gpu/drm/radeon/dce6_afmt.h                 |    52 +
 drivers/gpu/drm/radeon/evergreen.c                 |    21 +-
 drivers/gpu/drm/radeon/evergreen.h                 |    53 +
 drivers/gpu/drm/radeon/evergreen_cs.c              |     9 +-
 drivers/gpu/drm/radeon/evergreen_dma.c             |     5 +-
 drivers/gpu/drm/radeon/evergreen_hdmi.c            |     1 +
 drivers/gpu/drm/radeon/evergreen_hdmi.h            |    69 +
 drivers/gpu/drm/radeon/kv_dpm.c                    |   205 +-
 drivers/gpu/drm/radeon/ni.c                        |    25 +-
 drivers/gpu/drm/radeon/ni.h                        |    37 +
 drivers/gpu/drm/radeon/ni_dma.c                    |     3 +-
 drivers/gpu/drm/radeon/ni_dpm.c                    |     5 +-
 drivers/gpu/drm/radeon/ni_dpm.h                    |     3 +
 drivers/gpu/drm/radeon/r100.c                      |     7 +-
 drivers/gpu/drm/radeon/r600.c                      |    15 +-
 drivers/gpu/drm/radeon/r600.h                      |    58 +
 drivers/gpu/drm/radeon/r600_cs.c                   |    10 +-
 drivers/gpu/drm/radeon/r600_dma.c                  |     3 +-
 drivers/gpu/drm/radeon/r600_hdmi.c                 |     1 +
 drivers/gpu/drm/radeon/radeon.h                    |     6 +
 drivers/gpu/drm/radeon/radeon_acpi.c               |     3 +-
 drivers/gpu/drm/radeon/radeon_atombios.c           |    11 +-
 drivers/gpu/drm/radeon/radeon_atombios.h           |    45 +
 drivers/gpu/drm/radeon/radeon_audio.c              |    68 +-
 drivers/gpu/drm/radeon/radeon_audio.h              |    12 +
 drivers/gpu/drm/radeon/radeon_combios.c            |     6 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |     4 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |    12 +-
 drivers/gpu/drm/radeon/radeon_device.c             |    23 +-
 drivers/gpu/drm/radeon/radeon_device.h             |    32 +
 drivers/gpu/drm/radeon/radeon_display.c            |    22 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |    16 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |    25 +-
 drivers/gpu/drm/radeon/radeon_drv.h                |     7 +
 drivers/gpu/drm/radeon/radeon_encoders.c           |    10 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |     6 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |     1 +
 drivers/gpu/drm/radeon/radeon_i2c.c                |     8 -
 drivers/gpu/drm/radeon/radeon_ib.c                 |     1 +
 drivers/gpu/drm/radeon/radeon_irq_kms.c            |     9 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |     4 +-
 drivers/gpu/drm/radeon/radeon_kms.h                |    39 +
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |     1 +
 drivers/gpu/drm/radeon/radeon_legacy_encoders.h    |    36 +
 drivers/gpu/drm/radeon/radeon_mn.c                 |     1 +
 drivers/gpu/drm/radeon/radeon_object.c             |     3 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |     1 +
 drivers/gpu/drm/radeon/radeon_pm.h                 |    29 +
 drivers/gpu/drm/radeon/radeon_prime.c              |     1 +
 drivers/gpu/drm/radeon/radeon_prime.h              |    40 +
 drivers/gpu/drm/radeon/radeon_ring.c               |     3 +
 drivers/gpu/drm/radeon/radeon_sync.c               |     1 +
 drivers/gpu/drm/radeon/radeon_ttm.c                |     9 +-
 drivers/gpu/drm/radeon/radeon_ttm.h                |    37 +
 drivers/gpu/drm/radeon/radeon_vm.c                 |     8 +-
 drivers/gpu/drm/radeon/rv730_dpm.c                 |     4 +-
 drivers/gpu/drm/radeon/rv740_dpm.c                 |     3 +-
 drivers/gpu/drm/radeon/rv770.c                     |     1 +
 drivers/gpu/drm/radeon/rv770.h                     |    39 +
 drivers/gpu/drm/radeon/rv770_dpm.c                 |     2 +
 drivers/gpu/drm/radeon/si.c                        |    15 +-
 drivers/gpu/drm/radeon/si.h                        |    38 +
 drivers/gpu/drm/radeon/si_dma.c                    |     3 +-
 drivers/gpu/drm/radeon/si_dpm.c                    |    13 +-
 drivers/gpu/drm/radeon/si_dpm.h                    |     5 +
 drivers/gpu/drm/radeon/sumo_dpm.h                  |     1 +
 drivers/gpu/drm/radeon/sumo_smc.c                  |     2 -
 drivers/gpu/drm/radeon/trinity_dpm.c               |    46 +-
 drivers/gpu/drm/radeon/vce.h                       |    35 +
 drivers/gpu/drm/radeon/vce_v1_0.c                  |     1 +
 drivers/gpu/drm/radeon/vce_v2_0.c                  |     1 +
 drivers/gpu/drm/scheduler/sched_entity.c           |     4 +-
 drivers/gpu/drm/scheduler/sched_main.c             |     1 +
 include/uapi/drm/drm_fourcc.h                      |    33 +-
 219 files changed, 81679 insertions(+), 1556 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v11_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v11_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v9_0.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_2_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_2_sh_mask.h
 create mode 100644 drivers/gpu/drm/radeon/cik.h
 create mode 100644 drivers/gpu/drm/radeon/dce6_afmt.h
 create mode 100644 drivers/gpu/drm/radeon/evergreen.h
 create mode 100644 drivers/gpu/drm/radeon/evergreen_hdmi.h
 create mode 100644 drivers/gpu/drm/radeon/ni.h
 create mode 100644 drivers/gpu/drm/radeon/r600.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_atombios.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_device.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_kms.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_legacy_encoders.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_pm.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_prime.h
 create mode 100644 drivers/gpu/drm/radeon/radeon_ttm.h
 create mode 100644 drivers/gpu/drm/radeon/rv770.h
 create mode 100644 drivers/gpu/drm/radeon/si.h
 create mode 100644 drivers/gpu/drm/radeon/vce.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
