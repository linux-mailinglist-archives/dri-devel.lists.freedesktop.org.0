Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB90C26659
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C115F10EBF7;
	Fri, 31 Oct 2025 17:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="g/xjiI+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053EE10E237
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:37:37 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b3b3a6f4dd4so513101366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761932255; x=1762537055; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZDppDj5JrJKr7j0feOGGyoxJIH0RounBAPHlVmBSN1w=;
 b=g/xjiI+Us7U3fJCuJqpStGw7/3rjkGRxxqW3M2mHt3jHeAbKZH1efmeKjUOqEig6kZ
 sdFq3wQLM32ghfl2BoPe9YVEbKEd+Z2vKU+scdvjTv4Ms1kxNnmGecwwwQC08p5vhcsk
 WrJLYHuYSxhi9MRzz8G0tNKN73bqRZYHHY8ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761932255; x=1762537055;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDppDj5JrJKr7j0feOGGyoxJIH0RounBAPHlVmBSN1w=;
 b=glHzfZ2wUAGBXWZTP01pxHWMYOXYFQXUasSMg6D9YT9vwiCOTMNVPEPOrM7Nb6KWrD
 dbU4oW7TqhRHyFwP8+EHA258/YKv3Yjh53FxDYLTvwmw14qBYDpPmFCFp34u9nOI5WiN
 ycuXvD7CypngXizzhwqzNASOzrCPaEl8sXYKwt3Cm86Z7fHYFMjHmUJJwc8+sn8BXq82
 58jHHMRRNqGwnngUy3DQjpl/AeG0fZyF4tAmXuqBeK/CYMJY0sBd+MaFvXsf5L1YgpJX
 8ZRXRnxb3OkAp8WEgrafKLaBjZ9Ico83F3bOBJ0/Venf4mTQ7jIhEOWlXiL2znQHLGLi
 rZIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWow4DH3MxnB0HuDBIDa6UYZ/XgJdBLaV9Za/tAK6SdqNjHeHxDjRT9j5OPJ8erv6IMVdSOKwo3huY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw40Z0ZZHCOUMG0XfkL1FhVrBQiaTxzj3EMUOXbQNA/9RwFNik2
 gCkgVBrTc+Dq+2T3XW6c2dIQiXNE4fWPGId9Vfp37NduMz8z0vtvqGFxjN/OC88JXr4=
X-Gm-Gg: ASbGnctp6jSiRS0Hsm7bXpvQ5ZGSZM1PtDv4DqVCOh9bWSeeeY0gJSKT+lqYVXnc6kH
 zLFcIZkxMyrmy8BYqdSQrCMq1u3GsR1T2Os3PrGQ/v/jTKWsSxdIV27PN/gn2bTar/4/NMYochP
 glbQMrXhbP9JB8MYJS5bB2SYMjrJL5eThb8Ol3JC8WA31wetrtewpxAV0j4jHlbY4vsFV0sOyuY
 owntrE2BVWKYvB3Eyw8ofnbnBnvhwgVDJIyEI9koKIMzsTtA1g2PWHLuaVYVOo5GVNA0N+qaAnK
 0yTvfxHG7N2i0I8HVhNn0ezlHplgit8IloDgSnRj9BoVDGS8D6KvryiAoMJNIok71ilLHaBxgTa
 /x5HLyxbsLkL56Y4ElYtEDfG+rhagKLYfbA5Y+mRVUXlzUKUVaOdSDMra/l2F58tUfBw6ZXag/S
 uSFa1/NQyhW6s=
X-Google-Smtp-Source: AGHT+IGYRMOyI1IGPnaEERne8Rs3kyTYN4KtNHp01n8+JLkOEd7+GNjK+5DG/BKqNfiT/2xJlPCODA==
X-Received: by 2002:a17:907:2689:b0:b65:b9fb:e4a7 with SMTP id
 a640c23a62f3a-b70700fd98dmr431411866b.9.1761932254569; 
 Fri, 31 Oct 2025 10:37:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077c3b199sm224043466b.40.2025.10.31.10.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 10:37:33 -0700 (PDT)
Date: Fri, 31 Oct 2025 18:37:31 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, simona.vetter@ffwll.ch
Subject: Re: [pull] amdgpu drm-next-6.19
Message-ID: <aQTz2_ES7IWSPbpu@phenom.ffwll.local>
References: <20251024175249.58099-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024175249.58099-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Fri, Oct 24, 2025 at 01:52:48PM -0400, Alex Deucher wrote:
> Hi Dave, Simona,
> 
> New stuff for 6.19.
> 
> The following changes since commit 079ae5118e1f0dcf5b1ab68ffdb5760b06ed79a2:
> 
>   drm/amdkfd: fix suspend/resume all calls in mes based eviction path (2025-10-13 14:14:28 -0400)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.19-2025-10-24
> 
> for you to fetch changes up to 883687c30736c1b4d36c8cc6153bca5c2c76a5d8:
> 
>   drm/amdgpu: Remove unused members in amdgpu_mman (2025-10-20 18:28:22 -0400)

Pulled into drm-next, thanks!
-Sima

> 
> ----------------------------------------------------------------
> amd-drm-next-6.19-2025-10-24:
> 
> amdgpu:
> - HMM cleanup
> - Add new RAS framework
> - DML2.1 updates
> - YCbCr420 fixes
> - DC FP fixes
> - DMUB fixes
> - LTTPR fixes
> - DTBCLK fixes
> - DMU cursor offload handling
> - Userq validation improvements
> - Misc code cleanups
> - Unify shutdown callback handling
> - Suspend improvements
> - Power limit code cleanup
> - Fence cleanup
> - IP Discovery cleanup
> - SR-IOV fixes
> - AUX backlight fixes
> - DCN 3.5 fixes
> - HDMI compliance fixes
> - DCN 4.0.1 cursor updates
> - DCN interrupt fix
> - DC KMS full update improvements
> - Add additional HDCP traces
> - DCN 3.2 fixes
> - DP MST fixes
> - Add support for new SR-IOV mailbox interface
> 
> ----------------------------------------------------------------
> Adi Gollamudi (1):
>       drm/amd/display: fix typo in display_mode_core_structs.h
> 
> Alex Deucher (3):
>       drm/amdgpu/mes: adjust the VMID masks
>       drm/amdgpu/userq: drop VCN and VPE doorbell handling
>       drm/amdgpu: clean up and unify hw fence handling
> 
> Alex Hung (1):
>       drm/amd/display: Remove comparing uint32_t to zero
> 
> Alvin Lee (3):
>       drm/amd/display: Remove unused field in DML
>       drm/amd/display: Update DCN401 path for cursor offload
>       drm/amd/display: Update spacing in struct
> 
> Alysa Liu (1):
>       drm/amdgpu: Fix vram_usage underflow
> 
> Aurabindo Pillai (3):
>       drm/amd/display: Add sink/link debug logs
>       drm/amd/display: use GFP_NOWAIT for allocation in interrupt handler
>       drm/amd/display: Fix GFP_ATOMIC abuse
> 
> Austin Zheng (1):
>       drm/amd/display: DML2.1 Reintegration
> 
> Charlene Liu (3):
>       drm/amd/display: add dispclk ramping to dcn35.
>       drm/amd/display: add dccg dfs mask def
>       drm/amd/display: increase max link count and fix link->enc NULL pointer access
> 
> Christian König (1):
>       drm/amdgpu: reduce queue timeout to 2 seconds v2
> 
> Clay King (1):
>       drm/amd/display: Remove inaccessible URL
> 
> Cruise Hung (1):
>       drm/amd/display: Control BW allocation in FW side
> 
> Dominik Kaszewski (2):
>       drm/amd/display: Remove dc state from check_update
>       drm/amd/display: Fix performance regression from full updates
> 
> Ellen Pan (6):
>       drm/amdgpu: Updated naming of SRIOV critical region offsets/sizes with _V1 suffix
>       drm/amdgpu: Add SRIOV crit_region_version support
>       drm/amdgpu: Introduce SRIOV critical regions v2 during VF init
>       drm/amdgpu: Reuse fw_vram_usage_* for dynamic critical region in SRIOV
>       drm/amdgpu: Add logic for VF ipd and VF bios to init from dynamic crit_region offsets
>       drm/amdgpu: Add logic for VF data exchange region to init from dynamic crit_region offsets
> 
> Fangzhi Zuo (1):
>       drm/amd/display: Prevent Gating DTBCLK before It Is Properly Latched
> 
> Harry VanZyllDeJong (1):
>       drm/amd/display: fix duplicate aux command with AMD aux backlight
> 
> Ilya Bakoulin (2):
>       drm/amd/display: add new block sequence-building/executing functions
>       drm/amd/display: Fix misc. checkpatch issues
> 
> Ilya Zlobintsev (1):
>       drm/amd/pm: Avoid writing nulls into `pp_od_clk_voltage`
> 
> Ivan Lipski (1):
>       drm/amd/display: Consolidate two DML2 FP guards
> 
> Jonathan Kim (1):
>       drm/amdgpu: update remove after reset flag for MES remove queue
> 
> Lewis Huang (1):
>       drm/amd/display: Change clean dsc blocks condition in accelerated mode
> 
> Lijo Lazar (8):
>       drm/amdgpu: Remove redundant return value
>       drm/amdgpu: Skip SDMA suspend during mode-2 reset
>       drm/amdgpu: Reorganize sysfs ini/fini calls
>       drm/amdgpu: Add amdgpu_discovery_info
>       drm/amdgpu: Move reset-on-init sequence earlier
>       drm/amd/pm: Grant interface access after full init
>       drm/amdgpu: Reserve discovery TMR only if needed
>       drm/amdgpu: Remove unused members in amdgpu_mman
> 
> Mario Limonciello (14):
>       drm/amd: Adjust whitespace for vangogh_ppt
>       drm/amd: Remove some unncessary header includes
>       drm/amd: Unify shutdown() callback behavior
>       drm/amd: Stop exporting amdgpu_device_ip_suspend() outside amdgpu_device
>       drm/amd: Remove comment about handling errors in amdgpu_device_ip_suspend_phase1()
>       drm/amd: Don't always set IP block HW status to false
>       drm/amd: Pass IP suspend errors up to callers
>       drm/amd: Fix error handling with multiple userq IDRs
>       drm/amd: Pass userq suspend failures up to caller
>       drm/amd: Stop overloading power limit with limit type
>       drm/amd: Remove second call to set_power_limit()
>       drm/amd: Save and restore all limit types
>       drm/amd: Drop calls to restore power limit and clock from smu_resume()
>       drm/amd: Add a helper to tell whether an IP block HW is enabled
> 
> Meenakshikumar Somasundaram (3):
>       drm/amd/display: Fix NULL pointer dereference
>       drm/amd/display: Check disable_fec flag before enabling fec.
>       drm/amd/display: write segment pointer with mot enabled for mst
> 
> Nicholas Carbones (1):
>       drm/amd/display: Set DCN32 to use update planes and stream version 3
> 
> Nicholas Kazlauskas (4):
>       drm/amd/display: Support possibly NULL link for should_use_dmub_lock
>       drm/amd/display: Rename should_use_dmub_lock to reflect inbox1 usage
>       drm/amd/display: Rename FAMS2 global control lock to DMUB HW control lock
>       drm/amd/display: Driver implementation for cursor offloading to DMU
> 
> Ovidiu Bunea (1):
>       drm/amd/display: Move all DCCG RCG into HWSS root_clock_control
> 
> Peichen Huang (2):
>       drm/amd/display: lttpr cap should be nrd cap in bw_alloc mode
>       drm/amd/display: not skip hpd irq for bw alloc mode
> 
> Pierre-Eric Pelloux-Prayer (2):
>       drm/amdgpu: make non-NULL out fence mandatory
>       drm/amdgpu: remove gart_window_lock usage from gmc v12
> 
> Prike Liang (6):
>       drm/amdgpu/userq: extend userq state
>       drm/amdgpu: add userq object va track helpers
>       drm/amdgpu: track the userq bo va for its obj management
>       drm/amdgpu: keeping waiting userq fence infinitely
>       drm/amdgpu: validate the queue va for resuming the queue
>       drm/amdgpu: validate userq va for GEM unmap
> 
> Relja Vojvodic (2):
>       drm/amd/display: Correct slice width calculation for YCbCr420
>       drm/amd/display: Rework HDMI data channel reads
> 
> Samson Tam (1):
>       drm/amd/display: Add debug option to override EASF scaler taps
> 
> Sunil Khatri (5):
>       drm/amdgpu: use user provided hmm_range buffer in amdgpu_ttm_tt_get_user_pages
>       drm/amdgpu: clean up amdgpu hmm range functions
>       drm/amdgpu: update the functions to use amdgpu version of hmm
>       drm/amdgpu/userqueue: validate userptrs for userqueues
>       drm/amdgpu: add the kernel docs for alloc/free/valid range
> 
> Taimur Hassan (7):
>       drm/amd/display: [FW Promotion] Release 0.1.29.0
>       drm/amd/display: Promote DC to 3.2.352
>       drm/amd/display: [FW Promotion] Release 0.1.30.0
>       drm/amd/display: Promote DC to 3.2.353
>       drm/amd/display: [FW Promotion] Release 0.1.31.0
>       drm/amd/display: Promote DC to 3.2.354
>       drm/amd/display: Promote DC to 3.2.355
> 
> Tao Zhou (1):
>       drm/amdgpu: check save count before RAS bad page saving
> 
> Tiezhu Yang (1):
>       drm/amd: Fix set but not used warnings
> 
> Tvrtko Ursulin (1):
>       drm/amdgpu: Use memset32 for IB padding
> 
> Victor Zhao (2):
>       drm/amdgpu: Add kiq hdp flush callbacks
>       drm/amdgpu: use GPU_HDP_FLUSH for sriov
> 
> Wenjing Liu (2):
>       drm/amd/display: update perfmon measurement interfaces
>       drm/amd/display: add additional hdcp traces
> 
> YiPeng Chai (44):
>       drm/amd/ras: Add ras aca parser v1.0
>       drm/amd/ras: Add aca common ras functions
>       drm/amd/ras: Add mp1 v13_0 ras functions
>       drm/amd/ras: Add mp1 common ras functions
>       drm/amd/ras: Add nbio v7_9 ras functions
>       drm/amd/ras: Add nbio common ras functions
>       drm/amd/ras: Add umc v12_0 ras functions
>       drm/amd/ras: Add umc common ras functions
>       drm/amd/ras: Add gfx v9_0 ras functions
>       drm/amd/ras: Add gfx common ras functions
>       drm/amd/ras: Add eeprom ras functions
>       drm/amd/ras: Add psp v13_0 ras functions
>       drm/amd/ras: Add psp ras common functions
>       drm/amd/ras: Add ras ioctl command handler
>       drm/amd/ras: Add thread to handle ras events
>       drm/amd/ras: Use ring buffer to record ras ecc data
>       drm/amd/ras: Add cper conversion function
>       drm/amd/ras: Add rascore unified interface function
>       drm/amd/ras: Add files to ras core Makefile
>       drm/amd/ras: Add amdgpu nbio v7_9 configuration function
>       drm/amd/ras: Add amdgpu mp1 v13_0 configuration function
>       drm/amd/ras: Add amdgpu eeprom i2c configuration function
>       drm/amd/ras: Amdgpu handle ras ioctl command
>       drm/amd/ras: Add amdgpu ras system functions
>       drm/amd/ras: Amdgpu preprocesses ras interrupts
>       drm/amd/ras: Add amdgpu ras management function.
>       drm/amd/ras: Add files to amdgpu ras manager makefile
>       drm/amd/ras: Add unified ras module top-level makefile
>       drm/amd/pm: export a function amdgpu_smu_ras_send_msg to allow send msg directly
>       drm/amdgpu: Add ras module files into amdgpu
>       drm/amdgpu: Intercept ras interrupts to ras module
>       drm/amdgpu: Improve ras fatal error handling function
>       drm/amdgpu: add ras module rma check
>       drm/amdgpu: Avoid loading bad pages into legacy ras
>       drm/amdgpu: Add poison consumption sequence numbers for gfx and sdma
>       drm/amdgpu: Avoid hive seqno increment in legacy ras
>       drm/amdgpu: Add ras module eeprom safety watermark check
>       drm/amdgpu: Add ras module ip block to amdgpu discovery
>       drm/amdgpu: Enable ras module
>       drm/amd/ras: Update ras command context structure name
>       drm/amd/ras: Update function and remove redundant code
>       drm/amdgpu: ras module supports error injection
>       drm/amdgpu: query bad page info of ras module
>       drm/amdgpu: query block error count of ras module
> 
> Yihan Zhu (1):
>       drm/amd/display: fix dppclk rcg poweron check
> 
>  drivers/gpu/drm/amd/amdgpu/Makefile                |    8 +-
>  drivers/gpu/drm/amd/amdgpu/aldebaran.c             |    4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   15 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   15 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   32 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   29 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   34 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   19 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    9 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  248 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  244 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |   12 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   23 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  143 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |    4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   15 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   71 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |   78 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.h            |   24 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   17 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   43 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   16 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  238 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   12 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   93 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   29 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  283 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   16 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  341 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   21 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   19 +-
>  drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   86 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    1 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    5 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    1 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    1 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    1 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   19 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |    2 -
>  drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |   16 +-
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    4 +
>  drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    4 +
>  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   23 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |    7 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    1 -
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |    1 -
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   16 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    1 -
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   79 +-
>  .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    8 +-
>  .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   12 +-
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |  179 +-
>  .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  | 3186 ++++++++++++++++++--
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   48 +-
>  drivers/gpu/drm/amd/display/dc/dc.h                |    7 +-
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  108 +-
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   36 +
>  drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |    2 +
>  drivers/gpu/drm/amd/display/dc/dc_types.h          |    1 +
>  .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c |    2 +-
>  .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |   25 +-
>  .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.h |    8 +
>  drivers/gpu/drm/amd/display/dc/dce/dce_abm.c       |    2 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |    6 +-
>  .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |   29 +-
>  .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.h  |   10 +-
>  .../display/dc/dml2/display_mode_core_structs.h    |    2 +-
>  .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    2 -
>  .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |    1 -
>  .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |   11 +
>  .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |    7 +-
>  .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |   13 +
>  .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   55 +-
>  .../dml2/dml21/src/dml2_core/dml2_core_factory.c   |    2 +
>  .../dml21/src/dml2_core/dml2_core_shared_types.h   |   10 +-
>  .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  459 +--
>  .../dml21/src/inc/dml2_internal_shared_types.h     |   36 +-
>  .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c   |   19 +-
>  .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |   20 +-
>  .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   42 +-
>  .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |    2 +-
>  drivers/gpu/drm/amd/display/dc/dsc/dsc.h           |    1 +
>  .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |    1 +
>  .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |   69 +-
>  .../gpu/drm/amd/display/dc/hubp/dcn21/dcn21_hubp.c |    2 -
>  .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |   70 +-
>  .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   11 +-
>  .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |    5 +-
>  .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    5 +-
>  .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    3 +-
>  .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |    1 +
>  .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    1 +
>  .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  144 +-
>  .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |    8 +
>  .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    6 +
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  | 1408 ++++++++-
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |  104 +-
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   28 +-
>  drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h | 1433 ++++++++-
>  .../drm/amd/display/dc/hwss/hw_sequencer_private.h |   36 +
>  .../drm/amd/display/dc/inc/hw/cursor_reg_cache.h   |   28 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   36 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |    1 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    2 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |    8 +-
>  .../amd/display/dc/link/accessories/link_dp_cts.c  |    7 +-
>  .../gpu/drm/amd/display/dc/link/link_detection.c   |    4 +
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    2 +
>  drivers/gpu/drm/amd/display/dc/link/link_factory.c |    3 -
>  .../drm/amd/display/dc/link/protocols/link_ddc.c   |    3 +-
>  .../display/dc/link/protocols/link_dp_capability.c |   48 +-
>  .../display/dc/link/protocols/link_dp_dpia_bw.c    |   24 +-
>  .../dc/link/protocols/link_dp_irq_handler.c        |    4 +-
>  .../amd/display/dc/resource/dcn20/dcn20_resource.c |   29 +-
>  .../display/dc/resource/dcn201/dcn201_resource.c   |   30 +-
>  drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |   15 +
>  drivers/gpu/drm/amd/display/dc/sspl/dc_spl_types.h |    1 +
>  drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    7 +-
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  311 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    1 +
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |    1 +
>  drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   22 +-
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |    6 +-
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |    2 +-
>  .../drm/amd/display/modules/hdcp/hdcp1_execution.c |   13 +-
>  .../drm/amd/display/modules/hdcp/hdcp2_execution.c |   19 +-
>  .../gpu/drm/amd/display/modules/hdcp/hdcp_log.h    |    6 +
>  drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   14 +
>  drivers/gpu/drm/amd/include/amd_shared.h           |    1 +
>  drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    2 +-
>  drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    3 +-
>  drivers/gpu/drm/amd/include/mes_v12_api_def.h      |    3 +-
>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    3 +-
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    6 +-
>  drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    2 +-
>  drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    5 +-
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   70 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   14 +-
>  .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |    5 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   15 +-
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    5 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   23 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |    7 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    7 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |    5 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |    5 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   26 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    7 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    5 +-
>  .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |    5 +-
>  .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |    7 +-
>  drivers/gpu/drm/amd/ras/Makefile                   |   34 +
>  drivers/gpu/drm/amd/ras/ras_mgr/Makefile           |   33 +
>  drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.c   |  285 ++
>  drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.h   |   54 +
>  .../drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.c    |  181 ++
>  .../drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.h    |   27 +
>  drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c   |  611 ++++
>  drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h   |   78 +
>  .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c |   94 +
>  .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.h |   30 +
>  .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.c |  125 +
>  .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.h |   30 +
>  .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.c   |  126 +
>  .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.h   |   37 +
>  drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c   |  273 ++
>  drivers/gpu/drm/amd/ras/ras_mgr/ras_sys.h          |  110 +
>  drivers/gpu/drm/amd/ras/rascore/Makefile           |   44 +
>  drivers/gpu/drm/amd/ras/rascore/ras.h              |  368 +++
>  drivers/gpu/drm/amd/ras/rascore/ras_aca.c          |  672 +++++
>  drivers/gpu/drm/amd/ras/rascore/ras_aca.h          |  164 +
>  drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.c     |  379 +++
>  drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.h     |   71 +
>  drivers/gpu/drm/amd/ras/rascore/ras_cmd.c          |  522 ++++
>  drivers/gpu/drm/amd/ras/rascore/ras_cmd.h          |  426 +++
>  drivers/gpu/drm/amd/ras/rascore/ras_core.c         |  603 ++++
>  drivers/gpu/drm/amd/ras/rascore/ras_cper.c         |  310 ++
>  drivers/gpu/drm/amd/ras/rascore/ras_cper.h         |  304 ++
>  drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c       | 1339 ++++++++
>  drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h       |  197 ++
>  drivers/gpu/drm/amd/ras/rascore/ras_gfx.c          |   70 +
>  drivers/gpu/drm/amd/ras/rascore/ras_gfx.h          |   43 +
>  drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.c     |  426 +++
>  drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.h     |  259 ++
>  drivers/gpu/drm/amd/ras/rascore/ras_log_ring.c     |  310 ++
>  drivers/gpu/drm/amd/ras/rascore/ras_log_ring.h     |   93 +
>  drivers/gpu/drm/amd/ras/rascore/ras_mp1.c          |   81 +
>  drivers/gpu/drm/amd/ras/rascore/ras_mp1.h          |   50 +
>  drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.c    |  105 +
>  drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.h    |   30 +
>  drivers/gpu/drm/amd/ras/rascore/ras_nbio.c         |   95 +
>  drivers/gpu/drm/amd/ras/rascore/ras_nbio.h         |   46 +
>  drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.c    |  123 +
>  drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.h    |   31 +
>  drivers/gpu/drm/amd/ras/rascore/ras_process.c      |  315 ++
>  drivers/gpu/drm/amd/ras/rascore/ras_process.h      |   53 +
>  drivers/gpu/drm/amd/ras/rascore/ras_psp.c          |  750 +++++
>  drivers/gpu/drm/amd/ras/rascore/ras_psp.h          |  145 +
>  drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.c    |   46 +
>  drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.h    |   31 +
>  drivers/gpu/drm/amd/ras/rascore/ras_ta_if.h        |  231 ++
>  drivers/gpu/drm/amd/ras/rascore/ras_umc.c          |  706 +++++
>  drivers/gpu/drm/amd/ras/rascore/ras_umc.h          |  166 +
>  drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.c    |  511 ++++
>  drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.h    |  314 ++
>  215 files changed, 21949 insertions(+), 1627 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/ras/Makefile
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/Makefile
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.c
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.h
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.c
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.h
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.h
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.c
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.h
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.c
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.h
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c
>  create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/ras_sys.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cmd.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_core.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cper.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cper.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_log_ring.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_log_ring.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_process.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_process.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_ta_if.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc.h
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.c
>  create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.h

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
