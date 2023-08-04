Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0541176FD12
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 11:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBA110E03D;
	Fri,  4 Aug 2023 09:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F5910E03D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 09:17:21 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-523029050d0so508436a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691140639; x=1691745439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P9BDhGxCL/ciSuuh8U1+NfS20aBuSVGFmfPesVsyNeE=;
 b=Q+GkOSv8cQzP6WM8CCh2f4C1iGeMP8eb5JuguKTESkcYM43kgfEGjqFOHn++d0aAS+
 Bexv1k/kqEvdfIfCcc1hbS6B2lmPnxU3ZERw+H6rOCnqKT1p0rYrGOwjRjymAv18pj8w
 wB3Rm0lYJCBg+TvIvkEGFdBnx93DIzart7uTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691140639; x=1691745439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9BDhGxCL/ciSuuh8U1+NfS20aBuSVGFmfPesVsyNeE=;
 b=W95wWKbPoscEa9qbiIYhtlqG/FKivN8jK1izdMB/4kuWs74XuuQZaG/mT+PmpLQCLJ
 tl1SSNZshVDlbMesPsRvcFlAhfj+V1oNKTc3JJ7LKQF5RrACmP2zMBs+LTz7idCpFlgl
 EZk4EI08hGoD7THgTBp7hcF3fFbK0IrucBB0vCMCHFnIxVQCkY5wt3xHS+9l8dM1WQt6
 xvz6k16qPpT3HzrSNsnPXDIf0eSVp6KxWu3zpai38O7E/ikAPYoLvL5FDbK8wHhFgFmi
 fP0SHX8ZjVXsj2Imhq/eWeny0kpNHwm1ha6jn/7INgARLPV3+S5tKWH7PwrQ97pZ37kk
 9SCg==
X-Gm-Message-State: ABy/qLaY6599QnOXgW170ZsomAKo4GrfjO5r4tAZr+wSuTIjvwXW47aD
 J1fTVt0OM990gBbW6WmGjgBN4A==
X-Google-Smtp-Source: APBJJlHCcvtniKlXk4CZ8nXsy5VD0QUYUNQZHv9JYZGLYZWOfJWPOLAqVzT+yO4lAePU2txjyIzGcQ==
X-Received: by 2002:a05:6402:5111:b0:514:ab8b:ee78 with SMTP id
 m17-20020a056402511100b00514ab8bee78mr18118161edd.3.1691140639382; 
 Fri, 04 Aug 2023 02:17:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a056402032f00b0050bc4600d38sm981973edw.79.2023.08.04.02.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 02:17:18 -0700 (PDT)
Date: Fri, 4 Aug 2023 11:17:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu, amdkfd, radeon drm-next-6.6
Message-ID: <ZMzCHBYg60GW6ge0@phenom.ffwll.local>
References: <20230728214228.8102-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728214228.8102-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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

On Fri, Jul 28, 2023 at 05:42:28PM -0400, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> New stuff for 6.6.
> 
> The following changes since commit 6725f33228077902ddac2a05e0ab361dee36e4ba:
> 
>   Merge tag 'drm-misc-next-fixes-2023-07-06' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-07-07 11:05:16 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.6-2023-07-28
> 
> for you to fetch changes up to 7ea1db28119e237d634c6f74ba52056939c009ad:
> 
>   drm/radeon: Prefer strscpy over strlcpy calls in radeon_atombios.c (2023-07-27 15:05:32 -0400)

Pulled to drm-next. There were a few conflicts, I've put notes about how I
resolved them into the merge conflict. Please double-check that it's all
good before I push more stuff on top.

Cheers, Sima

> 
> ----------------------------------------------------------------
> amd-drm-next-6.6-2023-07-28:
> 
> amdgpu:
> - Lots of checkpatch cleanups
> - GFX 9.4.3 updates
> - Add USB PD and IFWI flashing documentation
> - GPUVM updates
> - RAS fixes
> - DRR fixes
> - FAMS fixes
> - Virtual display fixes
> - Soft IH fixes
> - SMU13 fixes
> - Rework PSP firmware loading for other IPs
> - Kernel doc fixes
> - DCN 3.0.1 fixes
> - LTTPR fixes
> - DP MST fixes
> - DCN 3.1.6 fixes
> - SubVP fixes
> - Display bandwidth calculation fixes
> - VCN4 secure submission fixes
> - Allow building DC on RISC-V
> - Add visible FB info to bo_print_info
> - HBR3 fixes
> - Add PSP 14.0 support
> - GFX9 MCBP fix
> - GMC10 vmhub index fix
> - GMC11 vmhub index fix
> - Create a new doorbell manager
> - SR-IOV fixes
> 
> amdkfd:
> - Cleanup CRIU dma-buf handling
> - Use KIQ to unmap HIQ
> - GFX 9.4.3 debugger updates
> - GFX 9.4.2 debugger fixes
> - Enable cooperative groups fof gfx11
> - SVM fixes
> 
> radeon:
> - Lots of checkpatch cleanups
> 
> ----------------------------------------------------------------
> Alan Liu (2):
>       drm/amd/display: Hardcode vco_freq for dcn316
>       drm/amd/display: Fix race condition when turning off an output alone
> 
> Alex Deucher (5):
>       drm/amdgpu: return an error if query_video_caps is not set
>       drm/amdgpu/gfx9: move update_spm_vmid() out of rlc_init()
>       drm/amdgpu/gfx10: move update_spm_vmid() out of rlc_init()
>       drm/amdgpu/pm: make gfxclock consistent for sienna cichlid
>       drm/amdgpu/pm: make mclk consistent for smu 13.0.7
> 
> Alex Sierra (1):
>       drm/amdkfd: avoid svm dump when dynamic debug disabled
> 
> Alvin Lee (3):
>       drm/amd/display: Update SW cursor fallback for subvp high refresh
>       drm/amd/display: Add missing triggers for full updates
>       drm/amd/display: Don't apply FIFO resync W/A if rdivider = 0
> 
> Anthony Koo (1):
>       drm/amd/display: Rearrange dmub_cmd defs order
> 
> Aric Cyr (3):
>       drm/amd/display: Promote DAL to 3.2.242
>       drm/amd/display: Promote DAL to 3.2.243
>       drm/amd/display: 3.2.244
> 
> Arnd Bergmann (1):
>       drm/amdgpu: avoid integer overflow warning in amdgpu_device_resize_fb_bar()
> 
> Aurabindo Pillai (3):
>       drm/amd/display: export some optc function for reuse
>       drm/amd/display: add DCN301 specific logic for OTG programming
>       drm/amd/display: remove an unused file
> 
> Bob Zhou (1):
>       drm/amdgpu: remove repeat code for mes_add_queue_pkt
> 
> Candice Li (1):
>       drm/amdgpu: Allow the initramfs generator to include psp_13_0_6_ta
> 
> Cruise Hung (1):
>       drm/amd/display: Add helpers to get DMUB FW boot options
> 
> Dan Carpenter (1):
>       drm/amd/display: Unlock on error path in dm_handle_mst_sideband_msg_ready_event()
> 
> Daniel Miess (3):
>       drm/amd/display: Reenable all root clock gating options
>       drm/amd/display: Fix DP2 link training failure with RCO
>       drm/amd/display: Prevent vtotal from being set to 0
> 
> Eric Huang (2):
>       drm/amdkfd: add kfd2kgd debugger callbacks for GC v9.4.3
>       drm/amdgpu: enable trap of each kfd vmid for gfx v9.4.3
> 
> Ethan Bitnun (1):
>       drm/amd/display: Prevent invalid pipe connections
> 
> Evan Quan (1):
>       drm/amd/pm: share the code around SMU13 pcie parameters update
> 
> George Shen (4):
>       drm/amd/display: Update 128b/132b downspread factor to 0.3%
>       drm/amd/display: Add stream overhead in BW calculations for 128b/132b
>       drm/amd/display: Add link encoding to timing BW calculation parameters
>       drm/amd/display: Guard DCN31 PHYD32CLK logic against chip family
> 
> Guchun Chen (6):
>       drm/amdgpu/vkms: drop redundant set of fb_modifiers_not_supported
>       drm/amdgpu/vkms: relax timer deactivation by hrtimer_try_to_cancel
>       drm/amdgpu: Allocate root PD on correct partition
>       drm/amdgpu: fix slab-out-of-bounds issue in amdgpu_vm_pt_create
>       drm/amdgpu/vm: use the same xcp_id from root PD
>       drm/amdgpu: use a macro to define no xcp partition case
> 
> Horace Chen (1):
>       drm/amdgpu: set sw state to gfxoff after SR-IOV reset
> 
> Iswara Nagulendran (1):
>       drm/amd/display: Add VESA SCR case for default aux backlight
> 
> Jane Jian (1):
>       drm/amd/smu: use AverageGfxclkFrequency* to replace previous GFX Curr Clock
> 
> Jiadong Zhu (1):
>       drm/amdgpu: set completion status as preempted for the resubmission
> 
> JinZe Xu (1):
>       drm/amd/display: Setup stream encoder before link enable for TMDS
> 
> Jonathan Kim (7):
>       drm/amdkfd: restore debugger additional info for gfx v9_4_3
>       drm/amdkfd: enable watch points globally for gfx943
>       drm/amdkfd: add multi-process debugging support for GC v9.4.3
>       drm/amdkfd: report dispatch id always saved in ttmps after gc9.4.2
>       drm/amdkfd: fix trap handling work around for debugging
>       drm/amdkfd: enable cooperative groups for gfx11
>       drm/amdkfd: fix and enable ttmp setup for gfx11
> 
> Joshua Ashton (3):
>       drm/amd/display: Expose more formats for overlay planes on DCN
>       drm/amd/display: Enable 3 plane for DCN 3.01
>       drm/amd/display: Implement zpos property
> 
> Lang Yu (3):
>       drm/amdgpu: rename psp_execute_non_psp_fw_load and make it global
>       drm/amdgpu: use psp_execute_load_ip_fw instead
>       drm/amdgpu: correct vmhub index in GMC v10/11
> 
> Leo Chen (1):
>       drm/amd/display: Exit idle optimizations before attempt to access PHY
> 
> Leo Ma (2):
>       drm/amd/display: Update scaler recout data for visual confirm
>       drm/amd/display: Fix underflow issue on 175hz timing
> 
> Li Ma (2):
>       drm/amdgpu: add PSP 14.0.0 support
>       drm/amdgpu/discovery: enable PSP 14.0.0 support
> 
> Lijo Lazar (6):
>       drm/amdgpu: Rename aqua_vanjaram_reg_init.c
>       drm/amdgpu: Change golden settings for GFX v9.4.3
>       drm/amdgpu: Remove redundant GFX v9.4.3 sequence
>       drm/amdgpu: Program xcp_ctl registers as needed
>       drm/amdgpu: Update ring scheduler info as needed
>       drm/amdgpu: Restore HQD persistent state register
> 
> Luben Tuikov (1):
>       drm/amdgpu: Rename to amdgpu_vm_tlb_seq_struct
> 
> Mario Limonciello (12):
>       drm/amd: Use attribute groups for PSP flashing attributes
>       drm/amd: Make flashing messages quieter
>       drm/amd: Convert USB-C PD F/W attributes into groups
>       drm/amd: Add documentation for how to flash a dGPU
>       drm/amd: Detect IFWI or PD upgrade support in psp_early_init()
>       drm/amd: adjust whitespace for amdgpu_psp.h
>       drm/amd/pm: conditionally disable pcie lane/speed switching for SMU13
>       drm/amd: Move helper for dynamic speed switch check out of smu13
>       drm/amd: Align SMU11 SMU_MSG_OverridePcieParameters implementation with SMU13
>       drm/amd: Use amdgpu_device_pcie_dynamic_switching_supported() for SMU7
>       drm/amd: Avoid reading the VBIOS part number twice
>       drm/amd: Fix an error handling mistake in psp_sw_init()
> 
> Martin Tsai (1):
>       drm/amd/display: Read down-spread percentage from lut to adjust dprefclk.
> 
> Meera Patel (1):
>       drm/amd/display: Initialize necessary uninitialized variables
> 
> Michael Strauss (1):
>       drm/amd/display: Re-add aux intercept disable delay generically for 2+ LTTPRs
> 
> Mukul Joshi (3):
>       drm/amdgpu: Update invalid PTE flag setting
>       drm/amdkfd: Use KIQ to unmap HIQ
>       drm/amdkfd: Update CWSR grace period for GFX9.4.3
> 
> Nicholas Kazlauskas (3):
>       drm/amd/display: Use is_dig_enable function instead of dcn10 hardcode
>       drm/amd/display: Skip querying caps when DMCUB emulation is in use
>       drm/amd/display: Keep PHY active for DP displays on DCN31
> 
> Nicholas Susanto (1):
>       drm/amd/display: Cache backlight_millinits in link structure and setting brightness accordingly
> 
> Ovidiu Bunea (1):
>       drm/amd/display: Add new sequence for 4-lane HBR3 on vendor specific retimers
> 
> Paul Hsieh (1):
>       drm/amd/display: Add interface to modify DMUB panel power options
> 
> Philip Yang (2):
>       drm/amdkfd: Skip handle mapping SVM range with no GPU access
>       drm/amdgpu: Increase soft IH ring size
> 
> Pierre-Eric Pelloux-Prayer (1):
>       drm/amdgpu: add VISIBLE info in amdgpu_bo_print_info
> 
> Ramesh Errabolu (2):
>       drm/amdkfd: Access gpuvm_export_dmabuf() API to get Dmabuf
>       drm/amdgpu: Checkpoint and Restore VRAM BOs without VA
> 
> Ran Sun (22):
>       drm/radeon: ERROR: "foo * bar" should be "foo *bar"
>       drm/radeon: ERROR: "(foo*)" should be "(foo *)"
>       drm/radeon: ERROR: "(foo*)" should be "(foo *)"
>       drm/radeon: ERROR: that open brace { should be on the previous line
>       drm/radeon: ERROR: "(foo*)" should be "(foo *)"
>       drm/amd: open brace '{' following struct go on the same line
>       drm/amd/pm: open brace '{' following struct go on the same line
>       drm/amdgpu: open brace '{' following struct go on the same line
>       drm/radeon: ERROR: "foo * bar" should be "foo *bar"
>       drm/radeon/si_dpm: open brace '{' following struct go on the same line
>       drm/radeon: add missing spaces before ';'
>       drm/radeon: add missing spaces after ',' and else should follow close brace '}'
>       drm/radeon: that open brace { should be on the previous line
>       drm/radeon: that open brace { should be on the previous line
>       drm/radeon: Move assignment outside if condition
>       drm/amd/pm: add missing spaces before '('
>       drm/amd/pm: Clean up errors in navi10_ppt.c
>       drm/amd/pm: Clean up errors in arcturus_ppt.c
>       drm/amd/pm: Clean up errors in arcturus_ppt.c
>       drm/amd/pm: that open brace { should be on the previous line
>       drm/amd/pm: open brace '{' following function definitions go on the next line
>       drm/amd/pm: open brace '{' following struct go on the same line
> 
> Randy Dunlap (1):
>       drm/amd/display: dc.h: eliminate kernel-doc warnings
> 
> Reza Amini (3):
>       drm/amd/display: ABM pause toggle
>       drm/amd/display: Correct grammar mistakes
>       drm/amd/display: Correct unit conversion for vstartup
> 
> Rodrigo Siqueira (4):
>       drm/amd/display: Improve the include of header file
>       drm/amd/display: Remove unused function
>       drm/amd/display: Add missing static
>       drm/amd/display: Reduce stack size
> 
> Saleemkhan Jamadar (4):
>       drm/amdgpu:update kernel vcn ring test
>       drm/amdgpu: update kernel vcn ring test
>       Revert "drm/amdgpu: update kernel vcn ring test"
>       Revert "drm/amdgpu:update kernel vcn ring test"
> 
> Samson Tam (1):
>       drm/amd/display: add additional refresh rate conditions for SubVP cases
> 
> Samuel Holland (1):
>       drm/amd/display: Allow building DC with clang on RISC-V
> 
> Shashank Sharma (1):
>       drm/amdgpu: create a new file for doorbell manager
> 
> Shiwu Zhang (1):
>       drm/amdgpu: fix the indexing issue during rlcg access ctrl init
> 
> Simon Ser (1):
>       drm/amd/display: only accept async flips for fast updates
> 
> Sreekant Somasekharan (1):
>       drm/amd/amdgpu: Add cu_occupancy sysfs file to GFX9.4.3
> 
> Srinivasan Shanmugam (52):
>       drm/amd/display: Clean up errors & warnings in amdgpu_dm.c
>       drm/amd/display: Remove else after return statement in 'dm_update_plane_state'
>       drm/amd/display: Remove else after return in 'dm_crtc_get_scanoutpos()'
>       drm/amd/display: Clean up style problems in amdgpu_dm_irq.c
>       drm/amd/display: Remove redundant braces in 'amdgpu_dm_crtc_notify_ta_to_read()'
>       drm/amd/display: Use seq_puts() in 'amdgpu_current_colorspace_show()' & 'edp_ilr_show()'
>       drm/amd/display: Clean up warnings in amdgpu_dm_pp_smu.c
>       drm/amd/display: Remove unnecessary casts in amdgpu_dm_helpers.c
>       drm/amd/display: Clean up warnings in amdgpu_dm _mst_types, _plane, _psr.c
>       drm/amdgpu: Fix error & warnings in gmc_v9_0.c
>       drm/amdgpu: Fix warnings in gfxhub_ v1_0, v1_2.c
>       drm/amdgpu: Fix warnings in gfxhub_v2_0.c
>       drm/amdgpu: Prefer dev_warn over printk
>       drm/amdgpu: Fix warnings in gmc_v10_0.c
>       drm/amdgpu: Fix errors & warnings in gmc_ v6_0, v7_0.c
>       drm/amdgpu: Fix warnings in gfxhub_v2_1.c
>       drm/amdgpu: Remove else after return statement in 'gmc_v8_0_check_soft_reset'
>       drm/amdgpu: Fix warnings in gmc_v11_0.c
>       drm/amdgpu: Remove else after return statement in 'gfx_v10_0_check_grbm_cam_remapping'
>       drm/amdgpu: Fix warnings in gmc_v8_0.c
>       drm/amdgpu: Fix warnings in gfxhub_ v3_0, v3_0_3.c
>       drm/amdgpu: Fix errors & warnings in gfx_v10_0.c
>       drm/amdkfd: Fix stack size in 'amdgpu_amdkfd_unmap_hiq'
>       drm/amdgpu: Fix error & warnings in gmc_v8_0.c
>       drm/amd/display: Clean up style problems in amdgpu_dm_hdcp.c
>       drm/amd/display: Eliminate warnings in amdgpu_dm_helpers.c
>       drm/amdgpu: Avoid possiblity of kernel crash in 'gmc_v8_0, gmc_v7_0_init_microcode()'
>       drm/radeon: Prefer pr_err/_info over printk
>       drm/amdgpu: Prefer #if IS_ENABLED over #if defined in amdgpu_drv.c
>       drm/amdgpu: Fix do not add new typedefs in amdgpu_fw_attestation.c
>       drm/amdgpu: Return -ENOMEM when there is no memory in 'amdgpu_gfx_mqd_sw_init'
>       drm/radeon: Avoid externs & do not initialize globals to 0 in radeon_drv.c
>       drm/amd/amdgpu: Fix warnings in amdgpu/amdgpu_display.c
>       drm/radeon: Fix style issues in radeon _encoders.c & _gart.c
>       drm/radeon: Prefer dev_* variant over printk
>       drm/amdgpu: Fix style issues in amdgpu_gem.c
>       drm/amdgpu: Add -ENOMEM error handling when there is no memory
>       drm/amd/display: Remove else after return in 'dm_vblank_get_counter' & 'amdgpu_dm_backlight_get_level'
>       drm/amdgpu: Remove else after return in 'is_fru_eeprom_supported'
>       drm/amdgpu: Update min() to min_t() in 'amdgpu_info_ioctl'
>       drm/amdgpu: Use seq_puts() instead of seq_printf()
>       drm/amdgpu: Fix ENOSYS means 'invalid syscall nr' in amdgpu_device.c
>       drm/amdgpu: Fix no new typedefs for enum _AMDGPU_DOORBELL_*
>       drm/amdgpu: Prefer dev_* variant over printk in amdgpu_atpx_handler.c
>       drm/amdgpu: Move externs to amdgpu.h file from amdgpu_drv.c
>       drm/amdgpu: Fix unnecessary else after return in 'amdgpu_eeprom_xfer'
>       drm/radeon: Prefer strscpy over strlcpy in 'radeon_combios_get_power_modes'
>       drm/amdgpu: Use parentheses for sizeof *numa_info in 'amdgpu_acpi_get_numa_info'
>       drm/radeon: Remove unnecessary NULL test before kfree in 'radeon_connector_free_edid'
>       drm/radeon: Fix ENOSYS with better fitting error codes in radeon_gem.c
>       drm/amdgpu: Fix non-standard format specifiers in 'amdgpu_show_fdinfo'
>       drm/radeon: Prefer strscpy over strlcpy calls in radeon_atombios.c
> 
> Stanley.Yang (3):
>       drm/amdgpu: Enable aqua vanjaram RAS
>       drm/amdgpu: Disable RAS by default on APU flatform
>       drm/amdgpu: Check APU flag to disable RAS
> 
> Stylon Wang (1):
>       drm/amdgpu: Add dcdebugmask option to enable DPIA trace
> 
> Taimur Hassan (4):
>       drm/amd/display: Skip enabling DMCUB when using emulation
>       drm/amd/display: check TG is non-null before checking if enabled
>       drm/amd/display: Fix ASIC check in aux timeout workaround
>       drm/amd/display: Remove check for default eDP panel_mode
> 
> Tao Zhou (2):
>       drm/amdgpu: skip address adjustment for GFX RAS injection
>       drm/amdgpu: add watchdog timer enablement for gfx_v9_4_3
> 
> Victor Lu (2):
>       drm/amdgpu: Add RLCG interface driver implementation for gfx v9.4.3 (v3)
>       drm/amdgpu: Fix infinite loop in gfxhub_v1_2_xcc_gart_enable (v2)
> 
> Wayne Lin (1):
>       drm/amd/display: Add polling method to handle MST reply packet
> 
> Wenjing Liu (2):
>       drm/amd/display: Refactor recout calculation with a more generic formula
>       drm/amd/display: Update DPG test pattern programming
> 
> Wenyou Yang (1):
>       drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire gpu_metrics
> 
> Wesley Chalmers (2):
>       drm/amd/display: Do not set drr on pipe commit
>       drm/amd/display: Block optimize on consecutive FAMS enables
> 
> Xiaogang Chen (1):
>       drm/amdgpu: have bos for PDs/PTS cpu accessible when kfd uses cpu to update vm
> 
> Yang Li (1):
>       drm/amdgpu: Fix one kernel-doc comment
> 
> Yang Wang (2):
>       drm/amd/pm: fix smu i2c data read risk
>       drm/amd/pm: disbale dcefclk device sysnode on GFX v9.4.3 chip
> 
> Yonggang Wu (1):
>       drm/radeon: Fix format error
> 
> YuanShang (1):
>       drm/amdgpu: load sdma ucode in the guest machine
> 
> Yueh-Shun Li (1):
>       drm/amd/display: fix comment typo
> 
> Zhikai Zhai (2):
>       drm/amd/display: refine to decide the verified link setting
>       drm/amd/display: Disable MPC split by default on special asic
> 
> gaba (1):
>       drm/amdgpu: avoid restore process run into dead loop.
> 
> sguttula (2):
>       drm/amdgpu: allow secure submission on VCN4 ring
>       drm/amdgpu: Enabling FW workaround through shared memory for VCN4_0_2
> 
>  Documentation/gpu/amdgpu/flashing.rst              |  33 ++
>  Documentation/gpu/amdgpu/index.rst                 |   1 +
>  drivers/gpu/drm/amd/amdgpu/Makefile                |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  50 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   2 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |   8 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.h   |  27 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    | 167 +++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   9 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |  10 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  17 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |  10 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c   |  35 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 275 +++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  42 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |  33 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c   | 183 +++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  28 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |  39 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |  29 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |  38 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  38 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  28 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |  22 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |   7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  25 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  34 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 161 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  23 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  26 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h       |   9 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   3 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  15 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  12 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  38 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  26 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  13 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  71 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   1 +
>  .../{aqua_vanjaram_reg_init.c => aqua_vanjaram.c}  |   6 +-
>  drivers/gpu/drm/amd/amdgpu/atom.c                  |  14 +-
>  drivers/gpu/drm/amd/amdgpu/atom.h                  |   2 -
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 202 +++----
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  39 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            | 127 +++--
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |   7 +-
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   9 +-
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |   5 +-
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |   9 +-
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |   4 +-
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |   4 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  42 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  37 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |  52 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |  54 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  87 ++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  40 +-
>  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |   4 +-
>  drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |   4 +-
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   8 +-
>  drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   4 +-
>  drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   4 +
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   8 +-
>  drivers/gpu/drm/amd/amdgpu/soc15_common.h          |  66 +--
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   4 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   4 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   4 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  18 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   4 +-
>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   4 +-
>  drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   4 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  35 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |  34 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_debug.h             |  22 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   6 +-
>  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  38 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |  22 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  22 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  36 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |   3 +-
>  .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  12 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  12 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  21 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |   3 +
>  drivers/gpu/drm/amd/display/Kconfig                |   2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 456 ++++++++--------
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   7 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |   6 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  12 +
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  14 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 185 ++++---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  33 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  42 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 125 ++++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |  11 +
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  54 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   |  11 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   1 +
>  drivers/gpu/drm/amd/display/dc/basics/conversion.c |   2 +-
>  drivers/gpu/drm/amd/display/dc/basics/vector.c     |  11 +-
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  16 +-
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  20 +-
>  .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   5 +
>  .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  33 +-
>  .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h |   7 +
>  .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |  44 +-
>  .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   2 +-
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |  94 +++-
>  .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   1 +
>  .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |  18 +
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 579 +++++++++++++++------
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  35 +-
>  drivers/gpu/drm/amd/display/dc/dc.h                |  33 +-
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   3 +
>  drivers/gpu/drm/amd/display/dc/dc_dsc.h            |   2 +
>  drivers/gpu/drm/amd/display/dc/dc_types.h          |  15 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |   6 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |  16 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c    |  16 +-
>  drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |  28 +
>  drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |  46 ++
>  drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.h  |   6 +
>  .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   3 +
>  .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |   4 +-
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |  18 +-
>  .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   3 +-
>  .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |   2 +-
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  54 +-
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.c  |   2 +-
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h  |   1 -
>  .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   4 +-
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |  25 +-
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   4 +-
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |   3 +
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   4 +-
>  drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |   3 +-
>  .../gpu/drm/amd/display/dc/dcn301/dcn301_optc.c    | 185 +++++++
>  .../gpu/drm/amd/display/dc/dcn301/dcn301_optc.h    |  36 ++
>  .../drm/amd/display/dc/dcn301/dcn301_resource.c    |  10 +-
>  .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   2 +-
>  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |  52 +-
>  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |   5 +
>  .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   2 +-
>  .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |   2 +-
>  .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |   1 +
>  .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  18 +-
>  .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   2 +-
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |   5 +-
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   2 -
>  .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   2 +-
>  .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  24 +-
>  .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   2 +-
>  .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   2 +-
>  .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |  31 +-
>  .../display/dc/dml/dcn314/display_mode_vba_314.c   |   2 +-
>  .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  24 +-
>  .../dc/dml/dcn32/display_mode_vba_util_32.c        |   9 +-
>  drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  66 ++-
>  drivers/gpu/drm/amd/display/dc/inc/hw/abm.h        |   6 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h |   2 -
>  drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   5 +
>  .../amd/display/dc/irq/dcn314/irq_service_dcn314.c |   7 +-
>  .../amd/display/dc/link/accessories/link_dp_cts.c  | 107 ++--
>  .../amd/display/dc/link/hwss/link_hwss_hpo_dp.c    |  10 +
>  .../gpu/drm/amd/display/dc/link/link_detection.c   |   3 +-
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  21 +-
>  .../gpu/drm/amd/display/dc/link/link_validation.c  |   8 +-
>  .../drm/amd/display/dc/link/protocols/link_ddc.c   |   2 +-
>  .../display/dc/link/protocols/link_dp_capability.c |  22 +-
>  .../display/dc/link/protocols/link_dp_training.c   |   9 +-
>  .../link_dp_training_fixed_vs_pe_retimer.c         |  90 +++-
>  .../dc/link/protocols/link_edp_panel_control.c     |  80 +--
>  .../dc/link/protocols/link_edp_panel_control.h     |   1 +
>  drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   7 +
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 131 +++++
>  .../drm/amd/display/dmub/inc/dmub_subvp_state.h    | 183 -------
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   8 +
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |   2 +
>  drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  31 +-
>  .../drm/amd/display/include/link_service_types.h   |   2 +-
>  drivers/gpu/drm/amd/include/amd_shared.h           |   1 +
>  drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |   9 +-
>  drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  69 +++
>  drivers/gpu/drm/amd/include/mes_v11_api_def.h      |   4 +-
>  drivers/gpu/drm/amd/include/yellow_carp_offset.h   |   6 +-
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   3 +-
>  drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h             |   3 +-
>  drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h   |  21 +-
>  .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  14 +-
>  .../gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h  |   6 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   4 +
>  .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h |  21 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   6 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  27 +-
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  99 +---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   | 109 +++-
>  drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   6 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |   3 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   2 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  48 ++
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  37 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   2 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  35 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   9 +-
>  drivers/gpu/drm/radeon/atom.c                      |  18 +-
>  drivers/gpu/drm/radeon/clearstate_si.h             |   3 +-
>  drivers/gpu/drm/radeon/r300.c                      |   6 +-
>  drivers/gpu/drm/radeon/radeon_atombios.c           |  12 +-
>  drivers/gpu/drm/radeon/radeon_atpx_handler.c       |  18 +-
>  drivers/gpu/drm/radeon/radeon_combios.c            |   4 +-
>  drivers/gpu/drm/radeon/radeon_connectors.c         |  11 +-
>  drivers/gpu/drm/radeon/radeon_drv.c                |  51 +-
>  drivers/gpu/drm/radeon/radeon_drv.h                |  13 +
>  drivers/gpu/drm/radeon/radeon_encoders.c           |  22 +-
>  drivers/gpu/drm/radeon/radeon_gart.c               |  37 +-
>  drivers/gpu/drm/radeon/radeon_gem.c                |   4 +-
>  drivers/gpu/drm/radeon/radeon_kms.c                |  10 +-
>  drivers/gpu/drm/radeon/radeon_legacy_tv.c          |   6 +-
>  drivers/gpu/drm/radeon/radeon_test.c               |   8 +-
>  drivers/gpu/drm/radeon/radeon_vce.c                |   4 +-
>  drivers/gpu/drm/radeon/rv770.c                     |  33 +-
>  drivers/gpu/drm/radeon/rv770_smc.c                 |  36 +-
>  drivers/gpu/drm/radeon/sislands_smc.h              |  51 +-
>  245 files changed, 4444 insertions(+), 2621 deletions(-)
>  create mode 100644 Documentation/gpu/amdgpu/flashing.rst
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
>  rename drivers/gpu/drm/amd/amdgpu/{aqua_vanjaram_reg_init.c => aqua_vanjaram.c} (99%)
>  create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_optc.c
>  create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_optc.h
>  delete mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_subvp_state.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
