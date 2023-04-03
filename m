Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A106D3F1D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 10:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4B510E392;
	Mon,  3 Apr 2023 08:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91AF10E392
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 08:37:21 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-947a47eb908so22919266b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 01:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680511040;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o4BzAVs8uNk/0//IWFxgZ9HO1WOxV1HZl59KF6glij4=;
 b=CA52g10iWuRv0uMa0Ux00NNHyXhzinTuHQ3G0FUGA5r8pH5YHKMPF3DaGLw8lzJMqw
 eJhIuRsIG6hatlT+GguOEhgZIJKaLo+Stz2EALhEoT7l+VjoS11uoZt4uyXCPqLWBV+m
 2Sp6WS+VHjcw6HblfZgeEPqeK93WC2KzUqrzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680511040;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o4BzAVs8uNk/0//IWFxgZ9HO1WOxV1HZl59KF6glij4=;
 b=kgqIWrZN+VKtAG2cHKy4uPZtXvC5Mdj0ITmhs4bcU9zeuJ6HY74eIfN8o0RiDrksMj
 PSNfNf5RfoKEx4nqHRM/Ttyzt76i1blfifjZKPMNwHPcLcO8F0a/y/l9+Wpe6hTjzGxX
 YxRvhwjCLOdcHTp5Cj3DLydfrnLVY/W5tdCFjJDY4rRGrO293pC9q0geW53OjVIR/WFp
 zC+MvVkKkLoUyzwrlHE+Qj9zV6COa6CgKLmmzUXT0wSvVT0Aq+Tj0LXrcL7BSIoV4k4T
 n+uef3BZPnHlEgkSceeE7kWScizSWJYh+beoDGUaDdfkeZn7YZ9/AJLRcO8edL3pgHa1
 OimA==
X-Gm-Message-State: AAQBX9dvuyFFNMDoKBbGJsh/ppWpoPJ79IKZ5k42GYaBrcEJk9kH3mmO
 Ktc7A9HgRqxk+yb4VRHfMQ3NaQ==
X-Google-Smtp-Source: AKy350ZHQyOXkX3v6ED/K88wHiKRyBsyR49OqvEocoKd5oi3qlveFbeLchyXt2k8dONr2IWZF4EnbQ==
X-Received: by 2002:a17:906:1d7:b0:947:f415:db23 with SMTP id
 23-20020a17090601d700b00947f415db23mr6716520ejj.1.1680511039979; 
 Mon, 03 Apr 2023 01:37:19 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 oz16-20020a170906cd1000b008b17de9d1f2sm4329742ejb.15.2023.04.03.01.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 01:37:19 -0700 (PDT)
Date: Mon, 3 Apr 2023 10:37:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu, amdkfd, radeon drm-next-6.4
Message-ID: <ZCqQPQqliwWVdzGy@phenom.ffwll.local>
References: <20230331221955.7896-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230331221955.7896-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 06:19:55PM -0400, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> More new stuff for 6.4.
> 
> The following changes since commit d36d68fd1925d33066d52468b7c7c6aca6521248:
> 
>   Merge tag 'drm-habanalabs-next-2023-03-20' of https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux into drm-next (2023-03-22 10:35:46 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.4-2023-03-31
> 
> for you to fetch changes up to feae1bd80ec69a3a0011ba1fb88994785f705e3e:
> 
>   drm/amd/pm: enable sysfs node vclk1 and dclk1 for NV3X (2023-03-31 11:18:55 -0400)

Merged, thanks

> 
> ----------------------------------------------------------------
> amd-drm-next-6.4-2023-03-31:
> 
> amdgpu:
> - Misc code cleanups
> - S4 fixes
> - MES fixes
> - SR-IOV fixes
> - Link DC backlight to connector device rather than PCI device
> - W=1 fixes
> - ASPM quirk
> - RAS fixes
> - DC dynamic split fixes and enablement for remaining chips
> - Navi1x SMU fix
> - Initial NBIO 7.9 support
> - Initial GC 9.4.3 support
> - Initial GFXHUB 1.2 support
> - Initial MMHUB 1.8 support
> - DCN 3.1.5 fixes
> - Initial DC FAMs infrastructure
> - Add support for 6.75Gbps link rates
> - Add sysfs nodes for secondary VCN clocks
> 
> amdkfd:
> - Initial support for GC 9.4.3
> 
> radeon:
> - Convert to client-based fbdev emulation
> 
> ----------------------------------------------------------------
> Alex Deucher (3):
>       drm/amdgpu: drop the extra sign extension
>       Revert "drm/amdgpu/display: change pipe policy for DCN 2.0"
>       drm/amd/pm: enable TEMP_DEPENDENT_VMIN for navi1x
> 
> Alex Hung (1):
>       drm/amd/display: remove outdated 8bpc comments
> 
> Alvin Lee (6):
>       drm/amd/display: Enable FPO for configs that could reduce vlevel
>       drm/amd/display: Update FCLK change latency
>       drm/amd/display: Use per pipe P-State force for FPO
>       drm/amd/display: Only keep cursor p-state force for FPO
>       drm/amd/display: Enable FPO optimization
>       drm/amd/display: Uncomment assignments after HW headers are promoted
> 
> Amber Lin (2):
>       drm/amdkfd: Set noretry/xnack for GC 9.4.3
>       drm/amdkfd: Set TG_CHUNK_SIZE for GC 9.4.3
> 
> Anthony Koo (1):
>       drm/amd/display: [FW Promotion] Release 0.0.160.0
> 
> Aric Cyr (2):
>       drm/amd/display: 3.2.228
>       drm/amd/display: Promote DAL to 3.2.229
> 
> Artem Grishin (2):
>       drm/amd/display: Add support for 6.75 GBps link rate
>       drm/amd/display: Conditionally enable 6.75 GBps link rate
> 
> Ayush Gupta (1):
>       drm/amd/display: fixed dcn30+ underflow issue
> 
> Bill Liu (1):
>       drm/amdgpu: Adding CAP firmware initialization
> 
> Caio Novais (2):
>       drm/amd/display: Remove unused variable 'scl_enable'
>       drm/amd/display: Mark function 'optc3_wait_drr_doublebuffer_pending_clear' as static
> 
> Charlene Liu (4):
>       drm/amd/display: update dio for two pixel per container case
>       drm/amd/display: Add CRC and DMUB test support
>       drm/amd/display: add missing code change init pix_per_cycle
>       drm/amd/display: update dig enable sequence
> 
> Christophe JAILLET (1):
>       drm/amd/display: Slightly optimize dm_dmub_outbox1_low_irq()
> 
> Dmytro Laktyushkin (1):
>       drm/amd/display: w/a for dcn315 inconsistent smu clock table
> 
> Hans de Goede (6):
>       drm/amd/display/amdgpu_dm: Fix backlight_device_register() error handling
>       drm/amd/display/amdgpu_dm: Refactor register_backlight_device()
>       drm/amd/display/amdgpu_dm: Add a bl_idx to amdgpu_dm_connector
>       drm/amd/display/amdgpu_dm: Move most backlight setup into setup_backlight_device()
>       drm/amd/display/amdgpu_dm: Make amdgpu_dm_register_backlight_device() take an amdgpu_dm_connector
>       drm/amd/display/amdgpu_dm: Pass proper parent for backlight device registration v3
> 
> Hawking Zhang (14):
>       drm/amdgpu: Initialize umc ras callback
>       drm/amdgpu: Add fatal error handling in nbio v4_3
>       drm/amdgpu: add nbio v7_9_0 ip headers
>       drm/amdgpu: add nbio v7_9 support
>       drm/amdgpu: init nbio v7_9 callbacks
>       drm/amdgpu: Set family for GC 9.4.3
>       drm/amdgpu: add athub v1_8_0 ip headers
>       drm/amdgpu: add osssys v4_4_2 ip headers
>       drm/amdgpu: add gc v9_4_3 ip headers
>       drm/amdgpu: add gmc ip block support for GC 9.4.3
>       drm/amdgpu: add mmhub v1_8_0 ip headers
>       drm/amdgpu: add GMC ip block for GC 9.4.3
>       drm/amdgpu: Correct xgmi_wafl block name
>       drm/amdkfd: Add GC 9.4.3 KFD support
> 
> Hersen Wu (3):
>       drm/amd/display: align commit_planes_for_stream to latest dc code
>       drm/amd/display: fix wrong index used in dccg32_set_dpstreamclk
>       drm/amd/display: Set dcn32 caps.seamless_odm
> 
> Jack Xiao (1):
>       drm/amd/amdgpu: limit one queue per gang
> 
> Jane Jian (2):
>       drm/amdgpu/gfx: set cg flags to enter/exit safe mode
>       drm/amdgpu/jpeg: enable jpeg v4_0 for sriov
> 
> Jay Cornwall (1):
>       drm/amdkfd: Trap handler changes for GC 9.4.3 v2
> 
> Jiapeng Chong (4):
>       drm/amd/display: make is_synaptics_cascaded_panamera static
>       drm/amd/display: Remove the unused function link_timing_bandwidth_kbps()
>       drm/amd/display: Clean up some inconsistent indenting
>       drm/amd/display: Remove the unused variable dppclk_delay_subtotal
> 
> Kai-Heng Feng (1):
>       drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD Navi
> 
> Le Ma (3):
>       drm/amdgpu: add gfxhub v1_2 support
>       drm/amdgpu: add mmhub v1_8 support
>       drm/amdgpu: initialize gfxhub v1_2 and mmhub v1_8 funcs
> 
> Lee Jones (18):
>       drm/amd/display/dc/dc_hdmi_types: Move string definition to the only file it's used in
>       drm/amd/amdgpu/amdgpu_device: Provide missing kerneldoc entry for 'reset_context'
>       drm/amd/amdgpu/amdgpu_ucode: Remove unused function ‘amdgpu_ucode_print_imu_hdr’
>       drm/amd/amdgpu/amdgpu_vm_pt: Supply description for amdgpu_vm_pt_free_dfs()'s unlocked param
>       drm/amd/amdgpu/gmc_v11_0: Provide a few missing param descriptions relating to hubs and flushes
>       drm/amd/amdgpu/ih_v6_0: Repair misspelling and provide descriptions for 'ih'
>       drm/amd/amdgpu/amdgpu_mes: Ensure amdgpu_bo_create_kernel()'s return value is checked
>       drm/amd/amdgpu/amdgpu_vce: Provide description for amdgpu_vce_validate_bo()'s 'p' param
>       drm/amd/pm/swsmu/smu11/vangogh_ppt: Provide a couple of missing parameter descriptions
>       drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move defines out to where they are actually used
>       drm/amd/display/dc/dce/dmub_psr: Demote kerneldoc abuse
>       drm/amd/display/dc/link/link_detection: Remove unused variable 'status'
>       drm/amd/display/dc/link/protocols/link_dp_training: Remove set but unused variable 'result'
>       drm/amd/display/dc/link/protocols/link_dp_capability: Remove unused variable and mark another as __maybe_unused
>       drm/amd/display/dc/link/protocols/link_dp_capability: Demote non-compliant kerneldoc
>       drm/amd/display/dc/dce60/Makefile: Fix previous attempt to silence known override-init warnings
>       drm/amd/display/dc/link/link_detection: Demote a couple of kerneldoc abuses
>       drm/amd/display/dc/core/dc_stat: Convert a couple of doc headers to kerneldoc format
> 
> Luben Tuikov (2):
>       drm/amdgpu: Remove second moot switch to set EEPROM I2C address
>       drm/amdgpu: Return from switch early for EEPROM I2C address
> 
> Martin Leung (2):
>       drm/amd/display: initialize link_srv in virtual env
>       drm/amd/display: fix double memory allocation
> 
> Mustapha Ghaddar (1):
>       drm/amd/display: Add function pointer for validate bw usb4
> 
> Nicholas Kazlauskas (2):
>       drm/amd/display: Add NULL plane_state check for cursor disable logic
>       drm/amd/display: Fix 4to1 MPC black screen with DPP RCO
> 
> Paul Hsieh (1):
>       drm/amd/display: power down eDP if eDP not present
> 
> Peichen Huang (1):
>       drm/amd/display: skip CLEAR_PAYLOAD_ID_TABLE if device mst_en is 0
> 
> Qingqing Zhuo (1):
>       drm/amd/display: Add infrastructure for enabling FAMS for DCN30
> 
> Rodrigo Siqueira (3):
>       drm/amd/display: Add const to a function
>       drm/amd/display: Set MPC_SPLIT_DYNAMIC for DCN10
>       drm/amd/display: Set MPC_SPLIT_DYNAMIC for DCN301
> 
> Saaem Rizvi (1):
>       drm/amd/display: Implement workaround for writing to OTG_PIXEL_RATE_DIV register
> 
> Srinivasan Shanmugam (2):
>       drm/amd/amdgpu: Fix error do not initialise globals to 0
>       drm/amd/amdgpu: Remove initialisation of globals to 0 or NULL
> 
> Stanley.Yang (1):
>       drm/amdgpu: print ras drv fw debug info
> 
> Taimur Hassan (1):
>       drm/amd/display: Add 90Mhz to video_optimized_pixel_rates
> 
> Thomas Zimmermann (10):
>       drm/radeon: Move radeon_align_pitch() next to dumb-buffer helpers
>       drm/radeon: Improve fbdev object-test helper
>       drm/radeon: Remove struct radeon_fbdev
>       drm/radeon: Remove test for !screen_base in fbdev probing
>       drm/radeon: Move fbdev object helpers before struct fb_ops et al
>       drm/radeon: Fix coding style in fbdev emulation
>       drm/radeon: Move fbdev cleanup code into fb_destroy callback
>       drm/radeon: Correctly clean up failed display probing
>       drm/radeon: Implement client-based fbdev emulation
>       drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is set
> 
> Tim Huang (3):
>       drm/amdgpu: reposition the gpu reset checking for reuse
>       drm/amdgpu: skip ASIC reset for APUs when go to S4
>       drm/amd/pm: re-enable the gfx imu when smu resume
> 
> Tong Liu01 (5):
>       drm/amdgpu: add mes resume when do gfx post soft reset
>       drm/amdgpu: skip unload tmr when tmr is not loaded
>       drm/amd/pm: add sysfs node vclk1 and dclk1
>       drm/amd/pm: enable sysfs node vclk1 and dclk1 for NV2X
>       drm/amd/pm: enable sysfs node vclk1 and dclk1 for NV3X
> 
> Uwe Kleine-König (1):
>       drm/amd/display: Whitespace cleanup
> 
> Wesley Chalmers (1):
>       drm/amd/display: Make DCN32 3dlut function available to future DCNs
> 
> YiPeng Chai (3):
>       drm/amdgpu: enable ras for mp0 v13_0_10 on SRIOV
>       drm/amdgpu: reinit mes ip block during reset on SRIOV
>       drm/amdgpu: resume ras for gfx v11_0_3 during reset on SRIOV
> 
> Yifan Zha (1):
>       drm/amdgpu: Add JPEG IP block to SRIOV reinit
> 
> YuBiao Wang (1):
>       drm/amdgpu: Force signal hw_fences that are embedded in non-sched jobs
> 
> Zhikai Zhai (1):
>       drm/amd/display: skip wait vblank
> 
>  drivers/gpu/drm/amd/amdgpu/Makefile                |     5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    41 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    25 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    12 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    11 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     9 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    23 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    14 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    11 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    12 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    17 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    21 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |     2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |     1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |     1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |     4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |     2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    14 +
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   471 +
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.h           |    29 +
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |     4 +
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    24 +-
>  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |     5 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   162 +-
>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   477 +
>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.h            |    28 +
>  drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |     5 +
>  drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    79 +
>  drivers/gpu/drm/amd/amdgpu/nbio_v4_3.h             |     1 +
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   369 +
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.h             |    32 +
>  drivers/gpu/drm/amd/amdgpu/nv.c                    |     2 +-
>  drivers/gpu/drm/amd/amdgpu/soc21.c                 |    15 +-
>  drivers/gpu/drm/amd/amdgpu/vi.c                    |    17 +-
>  drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   487 +
>  .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |    52 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     5 +
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    15 +
>  drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |     3 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     3 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   132 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     1 +
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |     3 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |     2 +-
>  .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |     5 +
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |    32 +-
>  .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |     8 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |    28 +-
>  drivers/gpu/drm/amd/display/dc/dc.h                |    20 +-
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    44 +-
>  drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    17 +-
>  drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h     |     1 -
>  drivers/gpu/drm/amd/display/dc/dc_stream.h         |     1 +
>  .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |     1 +
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     5 +-
>  drivers/gpu/drm/amd/display/dc/dce60/Makefile      |     2 +-
>  .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    16 +-
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |    29 +
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |     4 +-
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |     3 +-
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    22 +-
>  .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |     2 +-
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |     3 +-
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |     2 +-
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |     2 +
>  .../drm/amd/display/dc/dcn301/dcn301_resource.c    |     2 +-
>  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |    13 +-
>  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |     2 +-
>  .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |    23 +
>  .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |    10 +
>  .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |     2 +
>  .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |     1 +
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    25 +-
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h  |     3 +-
>  .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |    16 +-
>  .../display/dc/dcn32/dcn32_dio_stream_encoder.h    |     8 +
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |    10 +
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h  |     2 +
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |    53 +-
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |     5 +-
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |     2 +-
>  .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |     2 +
>  .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |     3 +-
>  .../drm/amd/display/dc/dcn321/dcn321_resource.c    |     1 +
>  .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |    57 +-
>  .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |    12 -
>  .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    33 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    25 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |     1 +
>  .../drm/amd/display/dc/inc/hw_sequencer_private.h  |     6 +-
>  drivers/gpu/drm/amd/display/dc/inc/link.h          |     3 +
>  .../gpu/drm/amd/display/dc/link/link_detection.c   |    17 +-
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    16 +-
>  drivers/gpu/drm/amd/display/dc/link/link_factory.c |     1 +
>  .../gpu/drm/amd/display/dc/link/link_validation.c  |    69 +-
>  .../gpu/drm/amd/display/dc/link/link_validation.h  |     4 +
>  .../display/dc/link/protocols/link_dp_capability.c |    32 +-
>  .../display/dc/link/protocols/link_dp_dpia_bw.c    |     9 +-
>  .../display/dc/link/protocols/link_dp_dpia_bw.h    |     7 +-
>  .../display/dc/link/protocols/link_dp_training.c   |     6 +-
>  .../dc/link/protocols/link_edp_panel_control.c     |     5 +
>  drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     2 +
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    14 +-
>  drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     1 +
>  .../drm/amd/display/include/ddc_service_types.h    |    13 -
>  .../drm/amd/display/modules/power/power_helpers.c  |     4 +-
>  .../include/asic_reg/athub/athub_1_8_0_offset.h    |   411 +
>  .../include/asic_reg/athub/athub_1_8_0_sh_mask.h   |  1807 +
>  .../drm/amd/include/asic_reg/gc/gc_9_4_3_offset.h  |  7258 ++++
>  .../drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h | 30535 +++++++++++++++
>  .../include/asic_reg/mmhub/mmhub_1_8_0_offset.h    |  3314 ++
>  .../include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h   | 22315 +++++++++++
>  .../amd/include/asic_reg/nbio/nbio_7_9_0_offset.h  | 10002 +++++
>  .../amd/include/asic_reg/nbio/nbio_7_9_0_sh_mask.h | 38900 +++++++++++++++++++
>  .../amd/include/asic_reg/oss/osssys_4_4_2_offset.h |   263 +
>  .../include/asic_reg/oss/osssys_4_4_2_sh_mask.h    |   995 +
>  drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     2 +
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    44 +
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    48 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |     3 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |     2 +
>  drivers/gpu/drm/radeon/Makefile                    |     3 +-
>  drivers/gpu/drm/radeon/radeon.h                    |     2 +
>  drivers/gpu/drm/radeon/radeon_display.c            |     4 -
>  drivers/gpu/drm/radeon/radeon_drv.c                |     3 +-
>  drivers/gpu/drm/radeon/radeon_drv.h                |     1 -
>  drivers/gpu/drm/radeon/radeon_fb.c                 |   400 -
>  drivers/gpu/drm/radeon/radeon_fbdev.c              |   422 +
>  drivers/gpu/drm/radeon/radeon_gem.c                |    24 +
>  drivers/gpu/drm/radeon/radeon_kms.c                |    18 -
>  drivers/gpu/drm/radeon/radeon_mode.h               |    20 +-
>  134 files changed, 119288 insertions(+), 930 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/athub/athub_1_8_0_offset.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/athub/athub_1_8_0_sh_mask.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_offset.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_offset.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_9_0_offset.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_9_0_sh_mask.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_4_2_offset.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_4_2_sh_mask.h
>  delete mode 100644 drivers/gpu/drm/radeon/radeon_fb.c
>  create mode 100644 drivers/gpu/drm/radeon/radeon_fbdev.c

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
