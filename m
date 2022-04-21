Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714A9509EEA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC0F10E646;
	Thu, 21 Apr 2022 11:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492E810E62F;
 Thu, 21 Apr 2022 11:49:00 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id r13so9491215ejd.5;
 Thu, 21 Apr 2022 04:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=9+MHmeI/fBF0BfRMSJq7hTpi2S/hOjvklN7HI3kTxqE=;
 b=gmL4AFy8FGc6o2FxmjiQANOCb0WHAraincdVI0h1MQSTekEINuiXnPXFIQ9AWiGTON
 EctnnK6FbxTZckAGa5i9BFC2vdiCHODRZzaaiz6qXzW/U9jP2ME2WZudwj9jjx5qL5t9
 Rmkl1ZtS+fra5zo8G076AlHFw6caJq9V7ICLTipyz6APQUXxpb6U0CNbk+I19sb059vb
 6l8vs1/NzHWlsfxKl1HVzfeEtVvHUREFBD615X3uj/l8cSfCQ67+EOP1ACPzumMTOLQ3
 /sF/TGpLUTkxnOQ2L1FS4pyxsiyTNttzzYQ4J0URTX4agjP43f/z/g6JgbeUDdZNPB6o
 BaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9+MHmeI/fBF0BfRMSJq7hTpi2S/hOjvklN7HI3kTxqE=;
 b=lduVy4fOxsXDMtNFwlkl50y7NopaTBBqPG5RFAaO+Jm+rhsceMJfJWucd354ADN8kn
 l7DuNn1lxr7W+/sk1uMrBVOl+O4YlLMobW/fng0y9w/3iObEA+SihnxMyjfpm72wDS0n
 u7avMLzCa1P+llEGK/Cf1mLNtTjSZ7ZAKNc8cN41Umx5Bfvx/rHhN4VCDGQp01MDjcZZ
 AHJpmObp2WcmLyoYrVBS6OJz/eXDOyws23ZgeVqS0e5HIFE62+v7QxU2YwK0frXd2uAw
 ADgz5tn1XWoKIDEw67PrqBcPWBQ+5mM9THH+Dmw4Hagv+EnEzDAL17Dy4A3CwrHJ9k10
 oiAA==
X-Gm-Message-State: AOAM5308ctJN1SVAqi2ICyReI/6g9/5FedjIpWmAaSbT7WLuszaGc8op
 vm7PvwigZqanQCcylS3rCWw=
X-Google-Smtp-Source: ABdhPJxuZ2F4eYW+9X1SntlHpwLWbiL/bn2dh8yaGv46Yd1zCreEzDSUQcJeNnvk52Beldp8IOMPfw==
X-Received: by 2002:a17:907:ea1:b0:6e8:917b:6b6f with SMTP id
 ho33-20020a1709070ea100b006e8917b6b6fmr22249000ejc.409.1650541738414; 
 Thu, 21 Apr 2022 04:48:58 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:9ca7:e25a:1090:cd9a?
 ([2a02:908:1252:fb60:9ca7:e25a:1090:cd9a])
 by smtp.gmail.com with ESMTPSA id
 oz20-20020a170906cd1400b006e872188edbsm7704564ejb.104.2022.04.21.04.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 04:48:57 -0700 (PDT)
Message-ID: <a72e0c15-082a-688a-e3af-3006a4eb3f7f@gmail.com>
Date: Thu, 21 Apr 2022 13:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [pull] amdgpu, amdkfd, radeon drm-next-5.19
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel.vetter@ffwll.ch
References: <20220415135144.5700-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220415135144.5700-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

just a gentle ping on that one here since it looks like it was missed 
because of the eastern holidays.

I have general DRM/TTM changes I want to publish and need the amdgpu 
changes in drm-next so that we don't run into any merge conflicts.

Thanks,
Christian.

Am 15.04.22 um 15:51 schrieb Alex Deucher:
> Hi Dave, Daniel,
>
> New features for 5.19.  There is a new DP define added in drm_dp_helper.h
> to support some new DC code.  That file has moved in drm-misc.  Just
> a heads up there when you merge.
>
> The following changes since commit 15f9cd4334c83716fa32647652a609e3ba6c998d:
>
>    drm/amdgpu/gfx10: enable gfx1037 clock counter retrieval function (2022-03-25 12:40:25 -0400)
>
> are available in the Git repository at:
>
>    https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.19-2022-04-15
>
> for you to fetch changes up to d68cf992ded575928cf4ddf7c64faff0d8dcce14:
>
>    drm/amd/amdgpu: Remove static from variable in RLCG Reg RW (2022-04-14 15:29:20 -0400)
>
> ----------------------------------------------------------------
> amd-drm-next-5.19-2022-04-15:
>
> amdgpu:
> - USB-C updates
> - GPUVM updates
> - TMZ fixes for RV
> - DCN 3.1 pstate fixes
> - Display z state fixes
> - RAS fixes
> - Misc code cleanups and spelling fixes
> - More DC FP rework
> - GPUVM TLB handling rework
> - Power management sysfs code cleanup
> - Add RAS support for VCN
> - Backlight fix
> - Add unique id support for more asics
> - Misc display updates
> - SR-IOV fixes
> - Extend CG and PG flags to 64 bits
> - Enable VCN clk sysfs nodes for navi12
>
> amdkfd:
> - Fix IO link cleanup during device removal
> - RAS fixes
> - Retry fault fixes
> - Asynchronously free events
> - SVM fixes
>
> radeon:
> - Drop some dead code
> - Misc code cleanups
>
> ----------------------------------------------------------------
> Aashish Sharma (1):
>        drm/amd/display: Fix unused-but-set-variable warning
>
> Ahmad Othman (1):
>        drm/amd/display: Fix HDCP SEND AKI INIT error
>
> Alex Deucher (7):
>        drm/amdgpu: make amdgpu_display_framebuffer_init() static
>        drm/amdgpu: drop amdgpu_display_gem_fb_init()
>        drm/amdgpu: make amdgpu_display_gem_fb_verify_and_init() static
>        drm/amdgpu: don't use BACO for reset in S3
>        drm/amdgpu/smu10: fix SoC/fclk units in auto mode
>        drm/amdgpu: fix VCN 3.1.2 firmware name
>        drm/amd/display: fix 64 bit divide in freesync code
>
> Angus Wang (4):
>        drm/amd/display: Create underflow interrupt IRQ type
>        drm/amd/display: Add flip interval workaround
>        drm/amd/display: Remove underflow IRQ type
>        drm/amd/display: Fix inconsistent timestamp type
>
> Anthony Koo (3):
>        drm/amd/display: [FW Promotion] Release 0.0.109.0
>        drm/amd/display: [FW Promotion] Release 0.0.110.0
>        drm/amd/display: [FW Promotion] Release 0.0.111.0
>
> Aric Cyr (4):
>        drm/amd/display: 3.2.178
>        drm/amd/display: 3.2.179
>        drm/amd/display: 3.2.180
>        drm/amd/display: 3.2.181
>
> Becle Lee (1):
>        drm/amd/display: fix missing-prototypes warning
>
> Benjamin Marty (1):
>        drm/amdgpu/display: change pipe policy for DCN 2.1
>
> Boyuan Zhang (1):
>        drm/amdgpu/vcn3: send smu interface type
>
> CHANDAN VURDIGERE NATARAJ (1):
>        drm/amd/display: Fix by adding FPU protection for dcn30_internal_validate_bw
>
> Charlene Liu (2):
>        drm/amd/display: Clear optc false state when disable otg
>        drm/amd/display: remove dtbclk_ss compensation for dcn316
>
> Chris Park (1):
>        drm/amd/display: Correct Slice reset calculation
>
> Christian König (10):
>        drm/amdgpu: move VM PDEs to idle after update
>        drm/amdgpu: separate VM PT handling into amdgpu_vm_pt.c
>        drm/amdgpu: simplify VM update tracking a bit
>        drm/amdgpu: rework TLB flushing
>        drm/amdkfd: start using tlb_seq from the VM subsystem
>        drm/amdkfd: use tlb_seq from the VM subsystem for SVM as well v2
>        drm/amdgpu: remove table_freed param from the VM code
>        drm/amdgpu: fix some kerneldoc in the VM code v2
>        drm/amdgpu: fix incorrect size printing in error msg
>        drm/amdgpu: fix TLB flushing during eviction
>
> Colin Ian King (1):
>        drm/amdgpu: Fix spelling mistake "regiser" -> "register"
>
> Dan Carpenter (1):
>        drm/amdkfd: potential NULL dereference in kfd_set/reset_event()
>
> Darren Powell (2):
>        amdgpu/pm: Add new hwmgr API function "emit_clock_levels"
>        amdgpu/pm: Implement emit_clk_levels for vega10
>
> David Zhang (2):
>        drm: add PSR2 support and capability definition as per eDP 1.5
>        drm/amd/display: implement shared PSR-SU sink validation helper
>
> Dillon Varone (2):
>        drm/amd/display: Add dtb clock to dc_clocks
>        drm/amd/display: Select correct DTO source
>
> Dmytro Laktyushkin (1):
>        drm/amd/display: update dcn315 clock table read
>
> Duncan Ma (1):
>        drm/amd/display: Add odm seamless boot support
>
> Eric Bernstein (1):
>        drm/amd/display: remove assert for odm transition case
>
> Eric Yang (1):
>        drm/amd/display: undo clearing of z10 related function pointers
>
> Evan Quan (1):
>        drm/amdgpu: expand cg_flags from u32 to u64
>
> Evgenii Krasnikov (1):
>        drm/amd/display: ensure PSR force_static flag can always be set
>
> Felix Kuehling (4):
>        drm/amdkfd: Improve concurrency of event handling
>        drm/amdkfd: Fix NULL pointer dereference
>        drm/amdkfd: Asynchronously free events
>        drm/amdkfd: fix race condition in kfd_wait_on_events
>
> Gavin Wan (1):
>        drm/amd/amdgpu: Remove static from variable in RLCG Reg RW
>
> Grigory Vasilyev (2):
>        drm/amdgpu: Remove leftover igp_lane_info
>        drm/amdgpu: Fix incorrect enum type
>
> Guchun Chen (1):
>        drm/amdgpu: drop redundant check of harvest info
>
> Guo Zhengkui (1):
>        drm/radeon: simplify if-if to if-else
>
> Haowen Bai (3):
>        drm/amd/display: Fix pointer dereferenced before checking
>        drm/amd/display: Fix pointer dereferenced before checking
>        drm/amdgpu/vcn: Remove unneeded semicolon
>
> Harry VanZyllDeJong (1):
>        drm/amd/display: Fix crash on setting VRR with no display connected
>
> Iswara Nagulendran (1):
>        drm/amd/display: Disable FEC if DSC not supported for EDP
>
> Jimmy Kizito (2):
>        drm/amd/display: Add work around for AUX failure on wake.
>        drm/amd/display: Add configuration options for AUX wake work around.
>
> Jingwen Zhu (2):
>        drm/amd/display: Set fec register init value
>        drm/amd/display: add DCN30 support FEC init
>
> Josip Pavic (1):
>        drm/amd/display: do not wait for mpc idle if tg is disabled
>
> Kai-Heng Feng (1):
>        drm/amdgpu: Ensure HDA function is suspended before ASIC reset
>
> Kent Russell (5):
>        drm/amdgpu: Use switch case for unique_id
>        drm/amdgpu: Add UNIQUE_ID to MetricsMember_t
>        drm/amdgpu: Use metrics data function to get unique_id for Aldebaran
>        drm/amdgpu: Add unique_id support for sienna cichlid
>        drm/amdgpu: Fix unique_id references for Sienna Cichlid
>
> Krunoslav Kovac (2):
>        drm/amd/display: Enable 3-plane MPO for DCN31
>        drm/amd/display: Enable 3 plane for DCN 3.0 and 3.02
>
> Lang Yu (1):
>        drm/amdkfd: shrink bitmap size in struct svm_validate_context
>
> Lee Jones (1):
>        drm/amdkfd: Create file descriptor after client is added to smi_clients list
>
> Leo (Hanghong) Ma (1):
>        drm/amd/display: Move link_trace for edp to dp_trace
>
> Lijo Lazar (2):
>        drm/amd/pm: Check feature support using IP version
>        drm/amdgpu: Use flexible array member
>
> Lv Ruyi (1):
>        drm/amd/dc: remove duplicate include
>
> Ma Jun (1):
>        drm/amdgpu: Sync up header and implementation to use the same parameter names
>
> Marko Zekovic (1):
>        amdgpu/pm: Enable sysfs nodes for vclk and dclk for NAVI12
>
> Martin Leung (2):
>        drm/amd/display: Revert FEC check in validation
>        drm/amd/display: revert Power down hardware if timer not trigger
>
> Max Erenberg (1):
>        drm/amd/display: Disallow entering PSR when panel is disconnected
>
> Melissa Wen (6):
>        drm/amd/display: move FPU related code from dcn31 to dml/dcn31 folder
>        drm/amd/display: move FPU related code from dcn315 to dml/dcn31 folder
>        drm/amd/display: move FPU related code from dcn316 to dml/dcn31 folder
>        drm/amd/display: detach fpu operations from dcn10_validate_bandwidth in calcs
>        drm/amd/display: remove DC_FP_* wrapper from dml folder
>        drm/amd/display: don't ignore alpha property on pre-multiplied mode
>
> Michael Strauss (2):
>        drm/amd/display: Update LTTPR UHBR link rate support struct
>        drm/amd/display: Check for invalid input params when building scaling params
>
> Mohammad Zafar Ziya (6):
>        drm/amdgpu: Add vcn and jpeg ras support flag
>        drm/amdgpu/vcn: Add vcn ras support
>        drm/amdgpu/jpeg: Add jpeg block ras support
>        drm/amdgpu/vcn: Add vcn and jpeg ver 2.6 ras register definition
>        drm/amdgpu/vcn: Add VCN ras error query support
>        drm/amdgpu/jpeg: Add jpeg ras error query support
>
> Mukul Joshi (1):
>        drm/amdkfd: Cleanup IO links during KFD device removal
>
> Oliver Logush (3):
>        drm/amd/display: Remove SW w/a for HDCP 1.4 1A-07 failure based on ECO fix
>        drm/amd/display: Insert pulling smu busy status before sending another request
>        drm/amd/display: Always update DPPCLK_DTO when clock increase
>
> Paul Hsieh (2):
>        drm/amd/display: Power down hardware if timer not trigger
>        drm/amd/display: Power down hardware if timer not trigger
>
> Philip Yang (6):
>        drm/amdgpu: Correct unlocked update fence handling
>        drm/amdgpu: Add tlb_cb for unlocked update
>        drm/amdkfd: Use atomic64_t type for pdd->tlb_seq
>        drm/amdgpu: Flush TLB after mapping for VG20+XGMI
>        drm/amdkfd: Add missing NULL check in svm_range_map_to_gpu
>        drm/amdkfd: Handle drain retry fault race with XNACK mode change
>
> Randy Dunlap (1):
>        drm/amd/display: DCN3.1: don't mark as kernel-doc
>
> Rodrigo Siqueira (1):
>        Revert "drm/amd/display: Pass HostVM enable flag into DCN3.1 DML"
>
> Roman Li (3):
>        drm/amd/display: Remove redundant dsc power gating from init_hw
>        drm/amd/display: Enable power gating before init_pipes
>        drm/amd/display: Fix allocate_mst_payload assert on resume
>
> Ruili Ji (1):
>        drm/amdgpu: fix incorrect GCR_GENERAL_CNTL address
>
> Saaem Rizvi (1):
>        drm/amd/display: Disabling Z10 on DCN31
>
> Samson Tam (1):
>        drm/amd/display: Add support for USBC connector
>
> Sean Paul (1):
>        drm/amdgpu: Re-classify some log messages in commit path
>
> Shirish S (1):
>        amd/display: set backlight only if required
>
> Stanley.Yang (1):
>        drm/amdgpu: add umc query error status function
>
> Tao Zhou (5):
>        drm/amdkfd: refine event_interrupt_poison_consumption
>        drm/amdkfd: replace source_id with client_id for RAS poison consumption
>        drm/amdgpu: add UTCL2 RAS poison query for Aldebaran (v2)
>        drm/amdkfd: add RAS poison consumption handling for UTCL2 (v2)
>        drm/amdkfd: print unmap queue status for RAS poison consumption (v3)
>
> Tom Rix (4):
>        drm/radeon: change si_default_state table from global to static
>        drm/amd/display: cleanup extern usage in function definition
>        drm/radeon: change cayman_default_state table from global to static
>        drm/radeon: remove r600_blit_shaders.[c|h]
>
> Tom St Denis (1):
>        drm/amd/amdgpu: Update debugfs GCA data
>
> Tomasz Moń (1):
>        drm/amdgpu: Enable gfxoff quirk on MacBook Pro
>
> Wenjing Liu (3):
>        drm/amd/display: add support for handling 128b/132b link training test request
>        drm/amd/display: extract set stream attribute to link_hwss
>        drm/amd/display: extract update stream allocation to link_hwss
>
> Yongqiang Sun (3):
>        drm/amd/amdgpu: Only reserve vram for firmware with vega9 MS_HYPERV host.
>        drm/amd/amdgpu: Fix asm/hypervisor.h build error.
>        drm/amd/amdgpu: Not request init data for MS_HYPERV with vega10
>
> hersen wu (1):
>        drm/amd/display: expose skip_detection_link_training to debugfs
>
> tiancyin (1):
>        drm/amd/vcn: fix an error msg on vcn 3.0
>
> xinhui pan (1):
>        drm/amdgpu: Fix one use-after-free of VM
>
>   drivers/gpu/drm/amd/amdgpu/Makefile                |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    8 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   18 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   14 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   10 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_df.h             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   15 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   52 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   26 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   13 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   40 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    8 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   13 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    9 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    3 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |   23 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h           |    2 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   16 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   24 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 1128 +++-----------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   49 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  979 +++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |    2 +-
>   drivers/gpu/drm/amd/amdgpu/athub_v1_0.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/athub_v1_0.h            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/athub_v2_0.h            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/athub_v2_1.h            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |   21 -
>   drivers/gpu/drm/amd/amdgpu/df_v1_7.c               |    2 +-
>   drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |    2 +-
>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   10 +-
>   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    4 +-
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    6 +-
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |   14 +
>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |    2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    2 +-
>   drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |    2 +-
>   drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |    2 +-
>   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   74 ++
>   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.h             |    7 +
>   drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/nv.c                    |    2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    2 +-
>   drivers/gpu/drm/amd/amdgpu/smuio_v11_0.c           |    2 +-
>   drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.c         |    2 +-
>   drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c           |    2 +-
>   drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c            |    2 +-
>   drivers/gpu/drm/amd/amdgpu/soc15.c                 |    2 +-
>   drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |  106 +-
>   drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |    2 +-
>   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |    2 +-
>   drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |    2 +-
>   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   71 ++
>   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.h              |    6 +
>   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    7 +-
>   drivers/gpu/drm/amd/amdgpu/vi.c                    |    2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   19 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    4 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  152 +--
>   drivers/gpu/drm/amd/amdkfd/kfd_events.h            |    3 +
>   drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   49 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |   11 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    3 +
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   13 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |   24 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   37 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   83 +-
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   18 +-
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    6 +
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   37 +
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    2 +-
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    9 +-
>   .../drm/amd/display/dc/bios/bios_parser_common.c   |    3 +
>   .../gpu/drm/amd/display/dc/bios/command_table.c    |    3 +-
>   .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |    2 +-
>   .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |    3 +-
>   .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   17 +-
>   .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |    3 +
>   .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |    3 +-
>   .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   26 +-
>   .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  107 +-
>   .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    4 +-
>   drivers/gpu/drm/amd/display/dc/core/dc.c           |   17 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  198 ++--
>   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   91 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   91 +-
>   drivers/gpu/drm/amd/display/dc/dc.h                |   23 +-
>   drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   14 +-
>   drivers/gpu/drm/amd/display/dc/dc_link.h           |   12 +-
>   drivers/gpu/drm/amd/display/dc/dc_stream.h         |    1 +
>   .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    4 +-
>   .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   25 +-
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |    1 +
>   .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   82 +-
>   .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   16 +
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   14 +-
>   .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    1 -
>   .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    2 +-
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   11 +-
>   .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    6 +-
>   .../drm/amd/display/dc/dcn302/dcn302_resource.c    |    6 +-
>   drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |   26 -
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   25 +-
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |    5 -
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |   29 +-
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |    2 +
>   .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  365 +------
>   .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |    4 +-
>   drivers/gpu/drm/amd/display/dc/dcn315/Makefile     |   26 -
>   .../drm/amd/display/dc/dcn315/dcn315_resource.c    |  235 +---
>   .../drm/amd/display/dc/dcn315/dcn315_resource.h    |    3 +
>   drivers/gpu/drm/amd/display/dc/dcn316/Makefile     |   26 -
>   .../drm/amd/display/dc/dcn316/dcn316_resource.c    |  234 +---
>   .../drm/amd/display/dc/dcn316/dcn316_resource.h    |    3 +
>   drivers/gpu/drm/amd/display/dc/dml/Makefile        |    2 +
>   .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |   19 +-
>   .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    2 -
>   .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |  863 +++++++++++++++
>   .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |   44 +
>   drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |    4 +-
>   drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |    1 +
>   drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |    2 +-
>   .../drm/amd/display/dc/inc/hw/timing_generator.h   |    2 +
>   drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |    9 +-
>   .../gpu/drm/amd/display/dc/link/link_dp_trace.c    |   20 +
>   .../gpu/drm/amd/display/dc/link/link_dp_trace.h    |    5 +
>   .../gpu/drm/amd/display/dc/link/link_hwss_dio.c    |   52 +
>   .../gpu/drm/amd/display/dc/link/link_hwss_dio.h    |    1 +
>   .../gpu/drm/amd/display/dc/link/link_hwss_dpia.c   |   28 +
>   .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |   27 +
>   .../drm/amd/display/dc/link/link_hwss_hpo_frl.c    |   19 +
>   .../drm/amd/display/dc/virtual/virtual_link_hwss.c |    5 +
>   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   48 +-
>   .../gpu/drm/amd/display/include/grph_object_id.h   |    1 +
>   .../drm/amd/display/modules/freesync/freesync.c    |   76 +-
>   drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |   38 +-
>   drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |    8 +
>   .../drm/amd/display/modules/hdcp/hdcp1_execution.c |    6 +-
>   .../gpu/drm/amd/display/modules/inc/mod_freesync.h |   12 +
>   drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |    2 +-
>   .../drm/amd/display/modules/power/power_helpers.c  |   38 +
>   .../drm/amd/display/modules/power/power_helpers.h  |    1 +
>   drivers/gpu/drm/amd/include/amd_shared.h           |   66 +-
>   .../drm/amd/include/asic_reg/vcn/vcn_2_5_offset.h  |   13 +
>   .../drm/amd/include/asic_reg/vcn/vcn_2_5_sh_mask.h |   24 +
>   drivers/gpu/drm/amd/include/discovery.h            |    2 +-
>   drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   11 +
>   drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   87 +-
>   drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h             |    2 +-
>   drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   17 +
>   .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |    8 +-
>   .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  147 +++
>   drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |    2 +
>   drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    2 +
>   .../inc/pmfw_if/smu11_driver_if_sienna_cichlid.h   |    7 +-
>   .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   31 +
>   drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   16 +-
>   drivers/gpu/drm/radeon/Makefile                    |    6 +-
>   drivers/gpu/drm/radeon/cayman_blit_shaders.c       |  320 ------
>   drivers/gpu/drm/radeon/cayman_blit_shaders.h       |  294 ++++-
>   drivers/gpu/drm/radeon/r600_blit_shaders.c         |  719 -------------
>   drivers/gpu/drm/radeon/r600_blit_shaders.h         |   38 -
>   drivers/gpu/drm/radeon/radeon_pm.c                 |    2 +-
>   drivers/gpu/drm/radeon/si_blit_shaders.c           |  253 -----
>   drivers/gpu/drm/radeon/si_blit_shaders.h           |  223 +++-
>   include/drm/dp/drm_dp_helper.h                     |    2 +
>   195 files changed, 4599 insertions(+), 4160 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>   create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
>   create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
>   delete mode 100644 drivers/gpu/drm/radeon/cayman_blit_shaders.c
>   delete mode 100644 drivers/gpu/drm/radeon/r600_blit_shaders.c
>   delete mode 100644 drivers/gpu/drm/radeon/r600_blit_shaders.h
>   delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.c

