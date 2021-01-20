Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E3F2FD679
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 18:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B666E17E;
	Wed, 20 Jan 2021 17:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3F86E0C6;
 Wed, 20 Jan 2021 17:08:09 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id p5so25759604oif.7;
 Wed, 20 Jan 2021 09:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BMO24xA6eCGsy3IDIkx8WrhBGL9KhXQ065c0VZhWd/o=;
 b=QxrqnSqEJ8A8RkhRd5w6LxMQPrz3aSeWvBCXFppl84/+6l7jtR70ou7iyQ0XiVgvwm
 ECUaq8JzDNrLGQ6R7bdZ/9JcI1ZlSMjqC05ki/G6+yuGCulk27tJFw/M7iiCVpGKLZIw
 +sGVfHZxqjR+61sprafKIvY2eLIlcmTeFLppf5tJ4ufuW8SZXEfQ8oaVeVmi/oKvvmYb
 A7Furwp22X9Ry59hbzUVlpQrRfnSgQQUN6mGjRe+522Nz4s7pHZbyUH37TJsgOBu3YPN
 wPUNE6XyMeBelrh12BOmAwip3tysLFmwmwz3CLw6CF0wWzg1yC+oPl467dqsvefqeEbs
 mdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BMO24xA6eCGsy3IDIkx8WrhBGL9KhXQ065c0VZhWd/o=;
 b=Qwdf6VOkVgr4LLCpAWLEUGfjB1BWZ7IB3YD2QTJgPxyxyHPK/gJjCGNQfgw78U4/eb
 MoKAfzttC/vbfx1Ux5Gp8ZymHQu1koL9Ki+1iaLIW+hmrKrUhWxunhSEzAS1ppuXZ41C
 OQb8VIDX0gUHpmgmF+ZV4AWedsQgnr9vZ/oQrkE2+bdpkOiNCZjs/JQTS0U1+6AHVJWb
 k9w8lzH7UtzXTNxI33zZXcXuM9tIN6mzRoRB4vmpdLm5rYhyT1ZhvUDki8zdE+B9P2Pv
 XZ8yAQwta5Uqt3yASYN4BT4GdwGJrPO06meF1Lz7yN7DvXoWey6ed+RAxJc6tpjrwWtt
 tyNw==
X-Gm-Message-State: AOAM533crzbcxRVfvJGjLECI4ocMVn91wmHMEc1p96cYn6hgUttQAOEJ
 J09elbAcHofubGBfyzA9bA+MZlvmZyQDltMmiNA=
X-Google-Smtp-Source: ABdhPJwUeURphs7c49u9FzgzjdKPrhlRrmmWPcWScY//3NIpeSR/Ab5wibl21mfzM1c8hkeSmHh1O/c/nfpVnm4pjUM=
X-Received: by 2002:aca:4f97:: with SMTP id d145mr3410125oib.123.1611162488739; 
 Wed, 20 Jan 2021 09:08:08 -0800 (PST)
MIME-Version: 1.0
References: <20210120060951.22600-1-alexander.deucher@amd.com>
 <YAgdtWQSsCK/vGXG@phenom.ffwll.local>
In-Reply-To: <YAgdtWQSsCK/vGXG@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Jan 2021 12:07:57 -0500
Message-ID: <CADnq5_PW7QsyEgbJMS1Cg+f7t=TgnYi843_aMwGxGY4=uHsjAQ@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-next-5.12
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 7:10 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jan 20, 2021 at 01:09:51AM -0500, Alex Deucher wrote:
> > Hi Dave, Daniel,
> >
> > More new stuff for 5.12.  Now with non-x86 fixed.
> >
> > The following changes since commit 044a48f420b9d3c19a135b821c34de5b2bee4075:
> >
> >   drm/amdgpu: fix DRM_INFO flood if display core is not supported (bug 210921) (2021-01-08 15:18:57 -0500)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.12-2021-01-20
>
> There was a silly conflict, I picked yours, but maybe double check.
> Details in the merge commit. Also maybe we want to fast-forward.

You picked correctly.  Thanks!

Alex

> -Daniel
>
> >
> > for you to fetch changes up to 4aef0ebc6b65e8583bc3d96e05c7a039912b3ee6:
> >
> >   drm/amdgpu: fix build error without x86 kconfig (v2) (2021-01-19 15:16:10 -0500)
> >
> > ----------------------------------------------------------------
> > amd-drm-next-5.12-2021-01-20:
> >
> > amdgpu:
> > - Fix non-x86 build
> > - W=1 fixes from Lee Jones
> > - Enable GPU reset on Navy Flounder
> > - Kernel doc fixes
> > - SMU workload profile fixes for APUs
> > - Display updates
> > - SR-IOV fixes
> > - Vangogh SMU feature enablment and bug fixes
> > - GPU reset support for Vangogh
> > - Misc cleanups
> >
> > ----------------------------------------------------------------
> > Alex Deucher (5):
> >       MAINTAINERS: update radeon/amdgpu/amdkfd git trees
> >       drm/amdgpu: add mode2 reset support for vangogh
> >       drm/amdgpu/nv: add mode2 reset handling
> >       drm/amdgpu: fix mode2 reset sequence for vangogh
> >       drm/amdgpu: Enable GPU reset for vangogh
> >
> > Aric Cyr (2):
> >       drm/amd/display: 3.2.117
> >       drm/amd/display: 3.2.118
> >
> > Bhawanpreet Lakha (2):
> >       drm/amd/display: enable HUBP blank behaviour
> >       drm/amd/display: Fix deadlock during gpu reset v3
> >
> > Charlene Liu (1):
> >       drm/amd/display: change SMU repsonse timeout to 2s
> >
> > Chiawen Huang (1):
> >       drm/amd/display: removed unnecessary check when dpp clock increasing
> >
> > Colin Ian King (1):
> >       drm/amdgpu: Add missing BOOTUP_DEFAULT to profile_name[]
> >
> > Emily.Deng (1):
> >       drm/amdgpu: Decrease compute timeout to 10 s for sriov multiple VF
> >
> > Guchun Chen (1):
> >       drm/amdgpu: toggle on DF Cstate after finishing xgmi injection
> >
> > Huang Rui (13):
> >       drm/amd/pm: remove vcn/jpeg powergating feature checking for vangogh
> >       drm/amd/pm: enhance the real response for smu message (v2)
> >       drm/amd/pm: clean up get_allowed_feature_mask function
> >       drm/amd/pm: initial feature_enabled/feature_support bitmap for vangogh
> >       drm/amd/pm: don't mark all apu as true on feature mask
> >       drm/amdgpu: revise the mode2 reset for vangogh
> >       drm/amd/pm: fix the return value of pm message
> >       drm/amd/pm: implement the processor clocks which read by metric
> >       drm/amd/pm: implement processor fine grain feature for vangogh (v3)
> >       drm/amdgpu: fix vram type and bandwidth error for DDR5 and DDR4
> >       drm/amd/display: fix the system memory page fault because of copy overflow
> >       drm/amd/display: fix the coding style issue of integrated_info
> >       drm/amdgpu: fix build error without x86 kconfig (v2)
> >
> > Jack Zhang (1):
> >       drm/amdgpu/sriov Stop data exchange for wholegpu reset
> >
> > Jacky Liao (1):
> >       drm/amd/display: Fix assert being hit with GAMCOR memory shut down
> >
> > Jeremy Cline (1):
> >       drm/amdkfd: Fix out-of-bounds read in kdf_create_vcrat_image_cpu()
> >
> > Jiansong Chen (2):
> >       drm/amdgpu: enable gpu recovery for navy_flounder
> >       drm/amd/pm: update driver if version for navy_flounder
> >
> > Jinzhou Su (4):
> >       drm/amd/pm: Add GFXOFF interface for Vangogh
> >       drm/amd/pm: Enable GfxOff for Vangogh
> >       drm/amdgpu: Add Secure Display TA header file
> >       drm/amdgpu: Add secure display TA interface
> >
> > John Clements (1):
> >       drm/amdgpu: updated fw attestation interface
> >
> > Jun Lei (1):
> >       drm/amd/display: implement T12 compliance
> >
> > Lee Jones (90):
> >       drm/amd/amdgpu/amdgpu_ih: Update 'amdgpu_ih_decode_iv_helper()'s function header
> >       drm/amd/amdgpu/vega20_ih: Add missing descriptions for 'ih' and fix spelling error
> >       drm/amd/pm/powerplay/hwmgr/process_pptables_v1_0: Provide description of 'call_back_func'
> >       drm/amd/pm/powerplay/hwmgr/ppatomctrl: Fix documentation for 'mpll_param'
> >       drm/amd/pm/powerplay/hwmgr/vega12_hwmgr: Fix legacy function header formatting
> >       drm/amd/pm/powerplay/hwmgr/vega20_hwmgr: Fix legacy function header formatting
> >       drm/amd/pm/powerplay/hwmgr/smu7_hwmgr: Fix formatting and spelling issues
> >       drm/amd/pm/powerplay/hwmgr/hwmgr: Move prototype into shared header
> >       drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Fix a bunch of kernel-doc formatting issues
> >       drm/amd/display/dc/basics/conversion: Demote obvious kernel-doc abuse
> >       drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs: Demote non-kernel-doc comment blocks
> >       drm/amd/display/dc/bios/command_table_helper: Fix kernel-doc formatting
> >       drm/amd/display/dc/bios/command_table_helper2: Fix legacy formatting problems
> >       drm/amd/display/dc/bios/bios_parser: Make local functions static
> >       drm/amd/display/dc/bios/bios_parser: Fix a whole bunch of legacy doc formatting
> >       drm/amd/display/dc/bios/bios_parser2: Fix some formatting issues and missing parameter docs
> >       drm/amd/display/dc/dce/dce_audio: Make function invoked by reference static
> >       drm/amd/display/dc/dce/dce_stream_encoder: Remove unused variable 'regval'
> >       drm/amd/display/dc/dce/dce_link_encoder: Make functions invoked by reference static
> >       drm/amd/display/dc/dce/dce_clock_source: Fix formatting/spelling of worthy function headers
> >       drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Fix worthy function headers, demote barely documented one
> >       drm/amd/display/dc/dce/dce_transform: Remove 3 unused/legacy variables
> >       drm/amd/display/dc/dce/dce_dmcu: Staticify local function call 'dce_dmcu_load_iram'
> >       drm/amd/display/dc/dce/dce_dmcu: Move 'abm_gain_stepsize' to only source file it's used in
> >       drm/amd/display/dc/dce/dce_opp: Make local functions and ones invoked by reference static
> >       drm/amd/display/dc/dce/dce_aux: Remove unused function 'get_engine_type'
> >       drm/amd/display/dc/bios/bios_parser: Fix misspelling of function parameter
> >       drm/amd/display/dc/dce/dce_i2c_hw: Make functions called by reference static
> >       drm/amd/display/dc/dce/dce_i2c_sw: Make a bunch of local functions static
> >       drm/amd/display/dc/dce/dce_panel_cntl: Remove unused variables 'bl_pwm_cntl' and 'pwm_period_cntl'
> >       drm/amd/display/dc/dce/dmub_psr: Demote non-conformant kernel-doc headers
> >       drm/amd/display/dc/gpio/hw_factory: Delete unused function 'dal_hw_factory_destroy'
> >       drm/amd/display/dc/dce/dce_aux: Mark 'dce_aux_transfer_raw' as __maybe_unused
> >       drm/amd/display/dc/dce/dce_link_encoder: Remove unused variable 'value0'
> >       drm/amd/display/dc/gpio/hw_ddc: Remove unused variable 'reg2'
> >       drm/amd/display/dc/dce/dce_opp: Demote non-compliant kernel-doc headers
> >       drm/amd/display/dc/dce/dce_transform: Demote kernel-doc abuse
> >       drm/amd/display/dc/gpio/diagnostics/hw_translate_diag: Include our own header containing prototypes
> >       drm/amd/display/dc/irq/irq_service: Make local function static
> >       drm/amd/display/dc/gpio/diagnostics/hw_factory_diag: Fix struct declared inside parameter list error
> >       drm/amd/display/dc/gpio/diagnostics/hw_factory_diag: Include our own header containing prototypes
> >       drm/amd/display/dc/dce120/dce120_hw_sequencer: Encompass defines in same clause as their use
> >       drm/amd/display/dc/dce120/dce120_timing_generator:
> >       drm/amd/display/dc/dce120/Makefile: Ignore -Woverride-init warning
> >       drm/amd/display/dc/dce120/dce120_resource: Staticify local functions
> >       drm/amd/display/dc/dce120/dce120_timing_generator: Demote non-kerneldoc headers
> >       drm/amd/display/dc/dce/dce_aux: Remove duplicate line causing 'field overwritten' issue
> >       drm/amd/display/dc/dce112/Makefile: Ignore -Woverride-init warning
> >       drm/amd/display/dc/dce/dce_opp: Remove duplicate entries causing 'field overwritten' issues
> >       drm/amd/display/dc/dce110/dce110_timing_generator: Remove unused variable 'value_crtc_vtotal'
> >       drm/amd/display/dc/dce110/dce110_compressor: Remove unused function 'dce110_get_required_compressed_surfacesize
> >       drm/amd/display/dc/dce110/dce110_hw_sequencer: Demote non-conformant kernel-doc header
> >       drm/amd/display/dc/dce110/dce110_mem_input_v: Make local functions static
> >       drm/amd/display/dc/dce120/dce120_timing_generator: Remove unused function 'dce120_timing_generator_get_position'
> >       drm/amd/display/dc/dce110/dce110_timing_generator: Demote kernel-doc abuses to standard function headers
> >       drm/amd/display/dc/dce110/dce110_compressor: Strip out unused function 'controller_id_to_index'
> >       drm/amd/display/dc/dce112/dce112_resource: Make local functions and ones called by reference static
> >       drm/amd/display/dc/dce110/dce110_timing_generator_v: Demote kernel-doc abuse and line up comments
> >       drm/amd/display/dc/dce110/dce110_mem_input_v: Include our own header, containing prototypes
> >       drm/amd/display/dc/dce110/Makefile: Ignore -Woverride-init warning
> >       drm/amd/display/dc/dce110/dce110_resource: Make local functions invoked by reference static
> >       drm/amd/display/dc/dce110/dce110_transform_v: Demote kernel-doc abuse
> >       drm/amd/display/dc/dce60/dce60_timing_generator: Make 'dce60_configure_crc' invoked by reference static
> >       drm/amd/display/dc/dce100/dce100_resource: Make local functions and ones called by reference static
> >       drm/amd/display/dc/dce60/dce60_resource: Make local functions static
> >       drm/amd/display/dc/core/dc_surface: Demote kernel-doc abuse
> >       drm/amd/display/dc/core/dc_stream: Demote non-conformant kernel-doc headers
> >       drm/amd/display/dc/calcs/dce_calcs: Remove unused variables 'v_filter_init_mode' and 'sclk_lvl'
> >       drm/amd/display/dc/calcs/dce_calcs: Demote non-conformant kernel-doc function headers
> >       drm/amd/display/dc/dc_helper: Include our own header, containing prototypes
> >       drm/amd/include/renoir_ip_offset: Mark top-level IP_BASE as __maybe_unused
> >       drm/amd/display/dmub/src/dmub_dcn30: Include our own header containing prototypes
> >       drm/amd/display/modules/power/power_helpers: Staticify local functions
> >       drm/amd/display/modules/info_packet/info_packet: Correct kernel-doc formatting
> >       drm/amd/display/dc/core/dc_resource: Staticify local functions
> >       drm/amd/display/dc/core/dc_link: Remove unused variable 'status'
> >       drm/amd/display/dc/core/dc_link_dp: Staticify local function 'linkRateInKHzToLinkRateMultiplier'
> >       drm/amd/display/dc/dce112/dce112_resource: Include our own header file containing prototypes
> >       drm/amd/display/dc/core/dc: Staticise local function 'apply_ctx_interdependent_lock'
> >       drm/amd/display/dc/dce100/Makefile: Ignore -Woverride-init warning
> >       drm/amd/display/dc/dce100/dce100_resource: Include our own header containing prototypes
> >       drm/amd/display/dc/dce60/Makefile: Ignore -Woverride-init warning
> >       drm/amd/display/dc/dce80/Makefile: Ignore -Woverride-init warning
> >       drm/amd/display/dc/dce80/dce80_resource: Include our own header containing prototypes
> >       drm/amd/display/dc/dce60/dce60_resource: Include our own header containing prototypes
> >       drm/amd/display/dc/core/dc_link: Move some local data from the stack to the heap
> >       drm/amd/display/dc/core/dc_link_dp: Mark 'result_write_min_hblank' as __maybe_unused
> >       drm/amd/display/dc/core/dc: Fix a bunch of documentation misdemeanours
> >       drm/amd/display/dc/core/dc_resource: Demote some kernel-doc abuses
> >       drm/amd/display/dc/core/dc_link: Fix a couple of function documentation issues
> >
> > Lewis Huang (1):
> >       drm/amd/display: Separate fec debug flag and monitor patch
> >
> > Li, Roman (1):
> >       drm/amd/display: disable dcn10 pipe split by default
> >
> > Likun Gao (1):
> >       drm/amdgpu: set power brake sequence
> >
> > Lukas Bulwahn (1):
> >       drm/amd/display: tweak the kerneldoc for active_vblank_irq_count
> >
> > Mike Hsieh (1):
> >       drm/amd/display: Remove unused P010 debug flag
> >
> > Nikola Cornij (1):
> >       drm/amd/display: Add a missing DCN3.01 API mapping
> >
> > Prike Liang (1):
> >       drm/amdgpu: add green_sardine device id (v2)
> >
> > Qingqing Zhuo (1):
> >       drm/amd/display: NULL pointer hang
> >
> > Raymond Yang (1):
> >       drm/amd/display: fix seamless boot stream adding algorithm
> >
> > Rodrigo Siqueira (4):
> >       Revert "drm/amd/display: Fixed Intermittent blue screen on OLED panel"
> >       Revert "drm/amd/display: Fix unused variable warning"
> >       Revert "drm/amdgpu/disply: fix documentation warnings in display manager"
> >       Revert "drm/amd/display: Expose new CRC window property"
> >
> > Souptick Joarder (1):
> >       drm: amdgpu: pm: Mark vangogh_clk_dpm_is_enabled() as static
> >
> > Wayne Lin (1):
> >       drm/amd/display: Fix to be able to stop crc calculation
> >
> > Wesley Chalmers (5):
> >       drm/amd/display: Initialize stack variable
> >       drm/amd/display: HUBP_IN_BLANK for DCN30
> >       drm/amd/display: Unblank hubp based on plane visibility
> >       drm/amd/display: New path for enabling DPG
> >       drm/amd/display: New sequence for HUBP blank
> >
> > Xiaojian Du (5):
> >       drm/amd/pm: support the function to change power profile mode for vangogh
> >       drm/amd/pm: fix one superfluous error for renoir
> >       drm/amd/pm: add the workload map for vangogh
> >       drm/amd/pm: modify the fine grain tuning function for Renoir
> >       drm/amd/pm: modify the fine grain tuning function for vangogh
> >
> > Yang Li (4):
> >       drm/amd/display: Simplify bool comparison
> >       drm/amd/display: Simplify bool comparison
> >       drm/amd/display: Simplify bool comparison
> >       drm/amd/display: Simplify bool comparison
> >
> > Yu-ting Shen (1):
> >       drm/amd/display: doesn't reprogram AMD OUI
> >
> > ZhiJie.Zhang (2):
> >       drm/amdgpu: Repeat assignment to max_slave_planes
> >       drm/amdgpu/display: these forward declarations are not used
> >
> > chen gong (1):
> >       drm/amdgpu/gfx10: add updated GOLDEN_TSC_COUNT_UPPER/LOWER register offsets for VGH
> >
> > mengwang (1):
> >       drm/amdgpu: add new device id for Renior
> >
> >  MAINTAINERS                                        |   4 +-
> >  drivers/gpu/drm/amd/amdgpu/Makefile                |   2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  53 ++--
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   3 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   7 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |   7 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |   2 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 191 ++++++++++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  17 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  | 176 +++++++++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.h  |  36 +++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   4 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   1 +
> >  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  48 ++-
> >  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |   1 +
> >  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   1 +
> >  drivers/gpu/drm/amd/amdgpu/nv.c                    |  46 ++-
> >  drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |  12 +-
> >  drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 +-
> >  drivers/gpu/drm/amd/amdgpu/ta_secureDisplay_if.h   | 154 ++++++++++
> >  drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   5 +-
> >  drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  11 +-
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 152 ++--------
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  47 +--
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  54 +---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   5 +-
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   4 +-
> >  drivers/gpu/drm/amd/display/dc/basics/conversion.c |   9 +-
> >  drivers/gpu/drm/amd/display/dc/basics/dc_common.c  |  20 +-
> >  drivers/gpu/drm/amd/display/dc/basics/dc_common.h  |   4 +-
> >  drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  | 119 ++++----
> >  drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  29 +-
> >  .../drm/amd/display/dc/bios/command_table_helper.c |  20 +-
> >  .../amd/display/dc/bios/command_table_helper2.c    |  20 +-
> >  drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c   |  13 +-
> >  .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |   3 +-
> >  .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |   2 +-
> >  drivers/gpu/drm/amd/display/dc/core/dc.c           |  48 +--
> >  drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  62 ++--
> >  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  53 +++-
> >  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  42 ++-
> >  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   5 +-
> >  drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |   2 +-
> >  drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
> >  drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   3 +
> >  drivers/gpu/drm/amd/display/dc/dc_helper.c         |   1 +
> >  drivers/gpu/drm/amd/display/dc/dc_link.h           |   8 +
> >  drivers/gpu/drm/amd/display/dc/dc_stream.h         |  11 +
> >  drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |   2 +-
> >  drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |   8 +-
> >  drivers/gpu/drm/amd/display/dc/dce/dce_aux.h       |   1 -
> >  .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |  57 ++--
> >  drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |   6 +-
> >  drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.h      |   2 -
> >  drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |   4 +-
> >  drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c    |   9 +-
> >  .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |   9 +-
> >  drivers/gpu/drm/amd/display/dc/dce/dce_opp.c       |  24 +-
> >  drivers/gpu/drm/amd/display/dc/dce/dce_opp.h       |   2 -
> >  .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |   8 +-
> >  .../drm/amd/display/dc/dce/dce_stream_encoder.c    |   3 +-
> >  drivers/gpu/drm/amd/display/dc/dce/dce_transform.c |  15 +-
> >  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |  22 +-
> >  drivers/gpu/drm/amd/display/dc/dce100/Makefile     |   2 +
> >  .../drm/amd/display/dc/dce100/dce100_resource.c    |  18 +-
> >  drivers/gpu/drm/amd/display/dc/dce110/Makefile     |   2 +
> >  .../drm/amd/display/dc/dce110/dce110_compressor.c  |  55 ----
> >  .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  33 ++-
> >  .../drm/amd/display/dc/dce110/dce110_mem_input_v.c |  17 +-
> >  .../drm/amd/display/dc/dce110/dce110_resource.c    |  17 +-
> >  .../display/dc/dce110/dce110_timing_generator.c    |  76 +++--
> >  .../display/dc/dce110/dce110_timing_generator_v.c  |  19 +-
> >  .../drm/amd/display/dc/dce110/dce110_transform_v.c |  19 +-
> >  drivers/gpu/drm/amd/display/dc/dce112/Makefile     |   2 +
> >  .../drm/amd/display/dc/dce112/dce112_resource.c    |  20 +-
> >  drivers/gpu/drm/amd/display/dc/dce120/Makefile     |   2 +
> >  .../amd/display/dc/dce120/dce120_hw_sequencer.c    |   2 +-
> >  .../drm/amd/display/dc/dce120/dce120_resource.c    |   6 +-
> >  .../display/dc/dce120/dce120_timing_generator.c    |  99 ++-----
> >  drivers/gpu/drm/amd/display/dc/dce60/Makefile      |   2 +
> >  .../gpu/drm/amd/display/dc/dce60/dce60_resource.c  |  18 +-
> >  .../amd/display/dc/dce60/dce60_timing_generator.c  |   4 +-
> >  drivers/gpu/drm/amd/display/dc/dce80/Makefile      |   2 +
> >  .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |   2 +
> >  .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c    |   2 +-
> >  .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  36 ++-
> >  .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |   5 +
> >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |   1 +
> >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |   2 +-
> >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |  11 +
> >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |   1 +
> >  .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   4 +-
> >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  12 +-
> >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |   1 +
> >  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |   1 +
> >  .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |   7 -
> >  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h  |   1 +
> >  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |  70 ++++-
> >  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h |   4 +
> >  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |   2 +
> >  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   1 +
> >  .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |   1 +
> >  .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   1 +
> >  .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |   2 +-
> >  .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |  11 +-
> >  .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |  44 +--
> >  .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   6 +-
> >  .../display/dc/gpio/diagnostics/hw_factory_diag.c  |   1 +
> >  .../display/dc/gpio/diagnostics/hw_factory_diag.h  |   2 +
> >  .../dc/gpio/diagnostics/hw_translate_diag.c        |   1 +
> >  drivers/gpu/drm/amd/display/dc/gpio/hw_ddc.c       |   7 +-
> >  drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |  14 -
> >  drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   1 +
> >  .../drm/amd/display/dc/inc/hw/timing_generator.h   |   1 +
> >  drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   5 +
> >  drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |   2 +-
> >  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.c  |   1 +
> >  .../amd/display/modules/info_packet/info_packet.c  |  13 +-
> >  .../drm/amd/display/modules/power/power_helpers.c  |   6 +-
> >  drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   2 +
> >  drivers/gpu/drm/amd/include/renoir_ip_offset.h     |   2 +-
> >  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  30 +-
> >  drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |  11 +-
> >  drivers/gpu/drm/amd/pm/inc/smu_types.h             |   1 +
> >  drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |   2 +-
> >  drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c     |   2 +-
> >  .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |   4 +-
> >  .../amd/pm/powerplay/hwmgr/process_pptables_v1_0.c |   1 +
> >  .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   4 +-
> >  .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  | 137 +++++----
> >  .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.h  |   1 +
> >  .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |  11 +-
> >  .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |  11 +-
> >  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  20 +-
> >  drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   1 +
> >  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   | 321 ++++++++++++++++-----
> >  drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  24 +-
> >  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  58 ++--
> >  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   2 +
> >  141 files changed, 1938 insertions(+), 1103 deletions(-)
> >  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> >  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.h
> >  create mode 100644 drivers/gpu/drm/amd/amdgpu/ta_secureDisplay_if.h
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
