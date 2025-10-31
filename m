Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB732C271C2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 23:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4D910E325;
	Fri, 31 Oct 2025 22:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="kj4DempM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7E510E325
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 22:11:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so689977266b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761948669; x=1762553469; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pUDjRdcfu0L5RlsK0oaUgCYJTq79S+J+ItrlRSRvOGI=;
 b=kj4DempMpEOrNhqy9sW39n8DM+U3/goqTc6nYWn7MdPbWsScA9zeRe9xJytmBJ7C/r
 pX54shIdGVslDxWK4VlG5lXw+FicvvLkGdpwQev7IZ8Q5M+qnU2gmk2K34hqcVVF70mS
 CSXwjfWzw+X4qC98qotrJKZKX51T8F3w8Ml2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761948669; x=1762553469;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pUDjRdcfu0L5RlsK0oaUgCYJTq79S+J+ItrlRSRvOGI=;
 b=vOsJXQoHwEOa4ARXqJI5p39KVx35emCXBz+pLQmH09joMS1XHqjL8r5aCVUfJNf5AC
 aZVzBVO34K3e3HOJMFdG/E8uaC7vu9UGb8CCUCdQ+c2Bd8inGmnV4AeIxdNYZaZdaCYg
 f0swoiptJhIzQLcsVKQtYb9mtJN9EDV0FODJHe6/nlnrGH6f2UA9wY90yx84MrX/gZac
 WOIKoCF2VcimdZ6GqawTvNXNMeFxu5lxS7ZBH/sATS/r5oGtGgZ/4iLjWIOv0e5rWHLy
 cFCRdrc9Qj5MtlmC0cLRAz9Ix7kzsUz8oEEgPbHaCJmhBB65qTKFAX2tEUg9ZLl0wCAW
 YhGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZNcyTRzg7uM7LTk7BPI1D1yDJxfZsv+T3ns0kkpemIBdujTRXar/GMkjJqU3SgdvLiPh5If7fd10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzidLGhEUD3tKu0fTpJuWdJFII2yBT+Gi58apmxJgq1PL8W2Hc0
 cCF5Ekh7Y6yA9r6w6nY8ssYe5gptwUeg1rqrXZaP1LvtYgqrBvCLTUiJiykQOj9E4B0=
X-Gm-Gg: ASbGncs+aZO+u+BBIHwDHtiBM6NwAg49nKP4wjDR68F11rtiT4VkKJemDFEBXlYm3+m
 5sd6EcFQrmXD2sl1pMTsUtoi1HBvzNW8wv/KC+XJ83ElPdrkkcS/hHInrGXU8Ps3Ur/ptjTtJy8
 47E5YfQM5e7Un/EP2YeC71TVaHDtRyEuoDnUtiDV91ttysl8M3uBvBO4D15y/Gcb81VcuvzLOA3
 GqQbw+0IEMAqwoSFCYTlneV1WO1MS6WYkl44CHM/89SrSH2hQF2wC4MtIsuuTw60FTP5T/WL/BZ
 O3K4FCY/WJ8ewmK3VT0H1jKXVTpZvQvDZEbIIjQmsc7z5sg7GtvKcRIEl4s8QKzxWktuvK4p+9h
 trz1dH6kbTthB+QYY2PgPnmjhxxs5mzrCh77iSOeJ9WM55Aj9hxecX8U7PGNDxlAQAnbDrAuwNc
 B23h+JWlYk3X4=
X-Google-Smtp-Source: AGHT+IGLVc4P24TbhBqYes4sGUDLGo8XtbgxuYZULA/C5Kzxj9k4pUf7qk9JKTpBpI+F/kGr6QWj7Q==
X-Received: by 2002:a17:907:6d18:b0:b04:48b5:6ea5 with SMTP id
 a640c23a62f3a-b706e54f485mr624676066b.17.1761948669218; 
 Fri, 31 Oct 2025 15:11:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b70779abc36sm285167966b.25.2025.10.31.15.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 15:11:08 -0700 (PDT)
Date: Fri, 31 Oct 2025 23:11:06 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, simona.vetter@ffwll.ch
Subject: Re: [pull] amdgpu, amdkfd, radeon, UAPI drm-next-6.19
Message-ID: <aQUz-mbM_WlXn_uZ@phenom.ffwll.local>
References: <20251029205713.9480-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029205713.9480-1-alexander.deucher@amd.com>
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

On Wed, Oct 29, 2025 at 04:57:12PM -0400, Alex Deucher wrote:
> Hi Dave, Simona,
> 
> More new stuff for 6.19.
> 
> The following changes since commit 883687c30736c1b4d36c8cc6153bca5c2c76a5d8:
> 
>   drm/amdgpu: Remove unused members in amdgpu_mman (2025-10-20 18:28:22 -0400)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.19-2025-10-29
> 
> for you to fetch changes up to 1bc9d39275e08853ff15410b4d530b46b546affb:
> 
>   drm/radeon: Remove redundant pm_runtime_mark_last_busy() calls (2025-10-28 11:31:45 -0400)
> 
> ----------------------------------------------------------------
> amd-drm-next-6.19-2025-10-29:
> 
> amdgpu:
> - VPE idle handler fix
> - Re-enable DM idle optimizations
> - DCN3.0 fix
> - SMU fix
> - Powerplay fixes for fiji/iceland
> - License copy-pasta fixes
> - HDP eDP panel fix
> - Vblank fix
> - RAS fixes
> - SR-IOV updates
> - SMU 13 VCN reset fix
> - DMUB fixes
> - DC frame limit fix
> - Additional DC underflow logging
> - DCN 3.1.5 fixes
> - DC Analog encoders support
> - Enable DC on bonaire by default
> - UserQ fixes
> - Remove redundant pm_runtime_mark_last_busy() calls
> 
> amdkfd:
> - Process cleanup fix
> - Misc fixes
> 
> radeon:
> - devm migration fixes
> - Remove redundant pm_runtime_mark_last_busy() calls
> 
> UAPI
> - Add ABM KMS property
>   Proposed kwin changes: https://invent.kde.org/plasma/kwin/-/merge_requests/6028

Thanks for highlighting this, I've taken a quick look. The little bit of
documentation is deeply burried in amd code (and from a quick look, not
even pulled into the generated kerneldoc, at least a quick git grep didn't
show any include stanza for amdgpu_display.c under Documentation).

I've thought we have a pretty solid consensus that driver specific props
aren't cool anymore, and that we should document them all in the proper
drm docs themselves under a relevant heading:

https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#requirements

Maybe the text there needs some clarification?

And I know that there's the color managment props as exceptions, but
they've been discussed at lenght and there's supposed to be a module
option or so to enable them.

Can you please do some patches to
- Pull the little internal function to set up the property into core drm
  code (so that we have the internal kerneldoc pulled in)?
- And document the uapi in a relevant property section where the
  userspace-visible stuff is documented? That's often very similar, but
  not always the same as the internal stuff, and more importantantly, for
  a different audience. For a connector prop it'd be somehere here

https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#standard-connector-properties

  Or maybe under a new heading for integrated panel output properties.

Please also do that for anything else that might have slipped through, I
haven't done a full review.

Anyway, no reason to hold this up (but please do fix this for 6.19), so
pulled all into drm-next, thanks!

Cheers, Sima



> 
> ----------------------------------------------------------------
> Alex Deucher (5):
>       drm/amdgpu: fix SPDX headers on amdgpu_cper.c/h
>       drm/amdgpu: fix SPDX header on amd_cper.h
>       drm/amdgpu: fix SPDX header on irqsrcs_vcn_5_0.h
>       drm/amdgpu: fix SPDX header on cyan_skillfish_reg_init.c
>       drm/amdgpu/userq: fix SDMA and compute validation
> 
> Alex Hung (1):
>       drm/amd/display: Add HDR workaround for a specific eDP
> 
> Alvin Lee (1):
>       drm/amd/display: Update cursor offload assignments
> 
> Austin Zheng (1):
>       drm/amd/display: Rename dml2 to dml2_0 folder
> 
> Dan Carpenter (1):
>       drm/amdgpu/userqueue: Fix use after free in amdgpu_userq_buffer_vas_list_cleanup()
> 
> Daniel Palmer (3):
>       drm/radeon: Clean up pdev->dev instances in probe
>       drm/radeon: Do not kfree() devres managed rdev
>       drm/radeon: Remove calls to drm_put_dev()
> 
> Dillon Varone (1):
>       drm/amd/display: Fix DMUB reset sequence for DCN32
> 
> Dmytro Laktyushkin (1):
>       drm/amd/display: Add opp count validation to dml2.1
> 
> Dominik Kaszewski (3):
>       drm/amd/display: Remove dc param from check_update
>       drm/amd/display: Add lock descriptor to check_update
>       drm/amd/display: Make observers const-correct
> 
> Ivan Lipski (1):
>       drm/amd/display: Fix incorrect return of vblank enable on unconfigured crtc
> 
> Jesse.Zhang (2):
>       drm/amd/pm: smu13: Enable VCN_RESET for pgm 7 with appropriate firmware version
>       drm/amdgpu: Convert amdgpu userqueue management from IDR to XArray
> 
> Jinzhou Su (2):
>       drm/amdgpu: clear bad page info of ras module
>       drm/amdgpu: Add uniras version in sysfs
> 
> John Smith (2):
>       drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Fiji
>       drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Iceland
> 
> Karen Chen (1):
>       drm/amd/display: Add more DC HW state info to underflow logging
> 
> Kenneth Feng (1):
>       drm/amd/display: pause the workload setting in dm
> 
> Lijo Lazar (1):
>       drm/amdgpu/pm: Add definition for gpu_metrics v1.9
> 
> Mario Limonciello (3):
>       drm/amd: Check that VPE has reached DPM0 in idle handler
>       drm/amd: Re-introduce property to control adaptive backlight modulation
>       drm/amd/display: Bump minimum for frame_warn_limit
> 
> Matthew Schwartz (1):
>       drm/amd/display: Don't program BLNDGAM_MEM_PWR_FORCE when CM low-power is disabled on DCN30
> 
> Meenakshikumar Somasundaram (2):
>       drm/amd/display: update link encoder assignment
>       drm/amd/display: Add dc interface to log pre os firmware information
> 
> Nicholas Kazlauskas (2):
>       drm/amd/display: Fix wrong index for DCN401 cursor offload
>       drm/amd/display: Fix notification of vtotal to DMU for cursor offload
> 
> Perry Yuan (1):
>       drm/amdgpu: get rev_id from strap register or IP-discovery table
> 
> Philip Yang (1):
>       drm/amdkfd: Dequeue user queues when process mm released
> 
> Sakari Ailus (2):
>       drm/amd: Remove redundant pm_runtime_mark_last_busy() calls
>       drm/radeon: Remove redundant pm_runtime_mark_last_busy() calls
> 
> Srinivasan Shanmugam (3):
>       drm/amdgpu: Make SR-IOV critical region checks overflow-safe
>       drm/amdgpu: Fix pointer casts when reading dynamic region sizes
>       drm/amdkfd: Fix use-after-free of HMM range in svm_range_validate_and_map()
> 
> Sunday Clement (1):
>       drm/amdkfd: Fix Unchecked Return Value
> 
> Sunil Khatri (3):
>       drm/amdgpu: null check for hmm_pfns ptr before freeing it
>       drm/amdkfd: add missing return value check for range
>       drm/amdkfd: fix the clean up when amdgpu_hmm_range_alloc fails
> 
> Taimur Hassan (2):
>       drm/amd/display: [FW Promotion] Release 0.1.33.0
>       drm/amd/display: Promote DC to 3.2.356
> 
> Timur Kristóf (23):
>       drm/amd/display: Determine DVI-I connector type (v2)
>       drm/amd/display: Add analog bit to edid_caps (v2)
>       drm/amd/display: Introduce MAX_LINK_ENCODERS (v2)
>       drm/amd/display: Hook up DAC to bios_parser_encoder_control
>       drm/amd/display: Add SelectCRTC_Source to BIOS parser
>       drm/amd/display: Get maximum pixel clock from VBIOS
>       drm/amd/display: Don't use stereo sync and audio on RGB signals (v2)
>       drm/amd/display: Don't try to enable/disable HPD when unavailable
>       drm/amd/display: Determine early if a link has supported encoders (v2)
>       drm/amd/display: Add concept of analog encoders (v2)
>       drm/amd/display: Implement DCE analog stream encoders
>       drm/amd/display: Implement DCE analog link encoders (v2)
>       drm/amd/display: Support DAC in dce110_hwseq
>       drm/amd/display: Add analog link detection (v2)
>       drm/amd/display: Refactor amdgpu_dm_connector_detect (v2)
>       drm/amd/display: Poll analog connectors (v3)
>       drm/amd/display: Add DCE BIOS_SCRATCH_0 register
>       drm/amd/display: Make get_support_mask_for_device_id reusable
>       drm/amd/display: Add DAC_LoadDetection to BIOS parser (v2)
>       drm/amd/display: Use DAC load detection on analog connectors (v2)
>       drm/amd/display: Add common modes to analog displays without EDID
>       drm/amd/display: Don't add freesync modes to analog displays (v2)
>       drm/amdgpu: Use DC by default for Bonaire
> 
> Yang Wang (1):
>       drm/amd/pm: fix smu table id bound check issue in smu_cmn_update_table()
> 
> Zhongwei Zhang (1):
>       drm/amd/display: init dispclk from bootup clock for DCN315
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  16 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h           |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  25 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  62 ++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |   7 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  20 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c            |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  55 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          | 154 ++++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  11 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |  34 ++-
>  .../gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   4 +
>  drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |  41 +--
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  24 +-
>  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   9 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  12 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  14 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 212 ++++++++++++---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   1 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  21 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   5 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   2 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  17 ++
>  drivers/gpu/drm/amd/display/dc/Makefile            |   2 +-
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  95 ++++++-
>  .../gpu/drm/amd/display/dc/bios/command_table.c    | 286 +++++++++++++++++++++
>  .../gpu/drm/amd/display/dc/bios/command_table.h    |   6 +
>  .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  87 ++++++-
>  .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h |   1 +
>  drivers/gpu/drm/amd/display/dc/core/dc.c           | 220 ++++++++--------
>  .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   4 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  53 +++-
>  drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   4 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   8 +
>  drivers/gpu/drm/amd/display/dc/dc.h                |  68 +++--
>  drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |   9 +
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  21 ++
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   7 +
>  drivers/gpu/drm/amd/display/dc/dc_stream.h         |  11 +-
>  drivers/gpu/drm/amd/display/dc/dc_types.h          |   8 +-
>  .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h |  64 ++++-
>  .../gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.c | 123 +++++++++
>  .../gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.h |   2 +
>  .../drm/amd/display/dc/dccg/dcn314/dcn314_dccg.c   |   3 +-
>  .../drm/amd/display/dc/dccg/dcn314/dcn314_dccg.h   |   3 +-
>  .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |   1 +
>  .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.h |   5 +-
>  .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |   1 +
>  .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |  85 ++++++
>  .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |  16 +-
>  .../drm/amd/display/dc/dce/dce_stream_encoder.c    |  14 +
>  .../drm/amd/display/dc/dce/dce_stream_encoder.h    |   5 +
>  drivers/gpu/drm/amd/display/dc/dml2/Makefile       | 141 ----------
>  drivers/gpu/drm/amd/display/dc/dml2_0/Makefile     | 140 ++++++++++
>  .../drm/amd/display/dc/{dml2 => dml2_0}/cmntypes.h |  18 +-
>  .../dc/{dml2 => dml2_0}/display_mode_core.c        |   2 +
>  .../dc/{dml2 => dml2_0}/display_mode_core.h        |   0
>  .../{dml2 => dml2_0}/display_mode_core_structs.h   |   3 +-
>  .../dc/{dml2 => dml2_0}/display_mode_lib_defines.h |   2 +-
>  .../dc/{dml2 => dml2_0}/display_mode_util.c        |   0
>  .../dc/{dml2 => dml2_0}/display_mode_util.h        |   2 -
>  .../dml21/dml21_translation_helper.c               |   0
>  .../dml21/dml21_translation_helper.h               |   0
>  .../dc/{dml2 => dml2_0}/dml21/dml21_utils.c        |   0
>  .../dc/{dml2 => dml2_0}/dml21/dml21_utils.h        |   0
>  .../dc/{dml2 => dml2_0}/dml21/dml21_wrapper.c      |   4 +-
>  .../dc/{dml2 => dml2_0}/dml21/dml21_wrapper.h      |   0
>  .../dml21/inc/bounding_boxes/dcn4_soc_bb.h         |   1 -
>  .../dml21/inc/dml2_external_lib_deps.h             |   0
>  .../dc/{dml2 => dml2_0}/dml21/inc/dml_top.h        |   0
>  .../dml21/inc/dml_top_dchub_registers.h            |   0
>  .../dml21/inc/dml_top_display_cfg_types.h          |   0
>  .../dml21/inc/dml_top_policy_types.h               |   0
>  .../dml21/inc/dml_top_soc_parameter_types.h        |   0
>  .../dc/{dml2 => dml2_0}/dml21/inc/dml_top_types.h  |   0
>  .../dml21/src/dml2_core/dml2_core_dcn4.c           |   1 +
>  .../dml21/src/dml2_core/dml2_core_dcn4.h           |   0
>  .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  29 ++-
>  .../dml21/src/dml2_core/dml2_core_dcn4_calcs.h     |   0
>  .../dml21/src/dml2_core/dml2_core_factory.c        |   0
>  .../dml21/src/dml2_core/dml2_core_factory.h        |   0
>  .../dml21/src/dml2_core/dml2_core_shared_types.h   |   3 +
>  .../dml21/src/dml2_core/dml2_core_utils.c          |   0
>  .../dml21/src/dml2_core/dml2_core_utils.h          |   0
>  .../dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c           |   0
>  .../dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h           |   0
>  .../dml21/src/dml2_dpmm/dml2_dpmm_factory.c        |   0
>  .../dml21/src/dml2_dpmm/dml2_dpmm_factory.h        |   0
>  .../dml21/src/dml2_mcg/dml2_mcg_dcn4.c             |   0
>  .../dml21/src/dml2_mcg/dml2_mcg_dcn4.h             |   2 +-
>  .../dml21/src/dml2_mcg/dml2_mcg_factory.c          |   0
>  .../dml21/src/dml2_mcg/dml2_mcg_factory.h          |   0
>  .../dml21/src/dml2_pmo/dml2_pmo_dcn3.c             |   0
>  .../dml21/src/dml2_pmo/dml2_pmo_dcn3.h             |   0
>  .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c       |   0
>  .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h       |   0
>  .../dml21/src/dml2_pmo/dml2_pmo_factory.c          |   0
>  .../dml21/src/dml2_pmo/dml2_pmo_factory.h          |   2 +-
>  .../src/dml2_standalone_libraries/lib_float_math.c |   0
>  .../src/dml2_standalone_libraries/lib_float_math.h |   0
>  .../dml21/src/dml2_top/dml2_top_interfaces.c       |   0
>  .../dml21/src/dml2_top/dml2_top_legacy.c           |   0
>  .../dml21/src/dml2_top/dml2_top_legacy.h           |   0
>  .../dml21/src/dml2_top/dml2_top_soc15.c            |   0
>  .../dml21/src/dml2_top/dml2_top_soc15.h            |   0
>  .../dc/{dml2 => dml2_0}/dml21/src/inc/dml2_debug.h |   0
>  .../dml21/src/inc/dml2_internal_shared_types.h     |   0
>  .../dc/{dml2 => dml2_0}/dml2_dc_resource_mgmt.c    |   0
>  .../dc/{dml2 => dml2_0}/dml2_dc_resource_mgmt.h    |   0
>  .../display/dc/{dml2 => dml2_0}/dml2_dc_types.h    |   0
>  .../dc/{dml2 => dml2_0}/dml2_internal_types.h      |   2 +-
>  .../dc/{dml2 => dml2_0}/dml2_mall_phantom.c        |   1 +
>  .../dc/{dml2 => dml2_0}/dml2_mall_phantom.h        |   0
>  .../amd/display/dc/{dml2 => dml2_0}/dml2_policy.c  |   0
>  .../amd/display/dc/{dml2 => dml2_0}/dml2_policy.h  |   0
>  .../dc/{dml2 => dml2_0}/dml2_translation_helper.c  |   3 +
>  .../dc/{dml2 => dml2_0}/dml2_translation_helper.h  |   0
>  .../amd/display/dc/{dml2 => dml2_0}/dml2_utils.c   |   0
>  .../amd/display/dc/{dml2 => dml2_0}/dml2_utils.h   |   0
>  .../amd/display/dc/{dml2 => dml2_0}/dml2_wrapper.c |   0
>  .../amd/display/dc/{dml2 => dml2_0}/dml2_wrapper.h |   0
>  .../amd/display/dc/{dml2 => dml2_0}/dml_assert.h   |   0
>  .../display/dc/{dml2 => dml2_0}/dml_depedencies.h  |   1 +
>  .../dc/{dml2 => dml2_0}/dml_display_rq_dlg_calc.c  |   0
>  .../dc/{dml2 => dml2_0}/dml_display_rq_dlg_calc.h  |   0
>  .../amd/display/dc/{dml2 => dml2_0}/dml_logging.h  |   1 +
>  .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h   |   4 +-
>  .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |  19 +-
>  .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h   |   2 +
>  .../gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.c   |   1 +
>  .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c   |   1 +
>  .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |   1 +
>  .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   1 +
>  .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |   8 +
>  .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h   |   1 +
>  .../gpu/drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c   |   1 +
>  .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |   1 +
>  drivers/gpu/drm/amd/display/dc/dsc/dsc.h           |   5 +
>  .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c |  33 +--
>  .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.h |   6 +-
>  .../drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c |   3 +-
>  .../drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c |   3 +-
>  .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |   3 +-
>  .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |   3 +-
>  .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h | 136 +++++++++-
>  .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |   8 +-
>  .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c | 147 +++++++++--
>  .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h |   2 +
>  .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |   4 +-
>  .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |   4 +-
>  .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |   4 +-
>  .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  28 +-
>  .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |   2 +-
>  .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  75 +++++-
>  .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  76 +++---
>  .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   2 +-
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   4 +-
>  drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  12 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       | 121 ++++++++-
>  drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |  12 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |  16 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   5 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |  24 ++
>  .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |   2 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |   2 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |  27 ++
>  drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |  13 +
>  .../drm/amd/display/dc/inc/hw/timing_generator.h   | 130 ++++++++++
>  drivers/gpu/drm/amd/display/dc/inc/resource.h      |   1 +
>  .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |  19 +-
>  .../gpu/drm/amd/display/dc/link/link_detection.c   | 147 ++++++++++-
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   9 +-
>  drivers/gpu/drm/amd/display/dc/link/link_factory.c |  60 ++++-
>  .../gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.c   |  16 ++
>  .../gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.h   |   5 +
>  .../gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c   |   1 +
>  .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |   1 +
>  .../gpu/drm/amd/display/dc/opp/dcn10/dcn10_opp.c   |  14 +-
>  .../gpu/drm/amd/display/dc/opp/dcn10/dcn10_opp.h   |   6 +-
>  .../gpu/drm/amd/display/dc/opp/dcn20/dcn20_opp.c   |  13 +
>  .../gpu/drm/amd/display/dc/opp/dcn20/dcn20_opp.h   |   6 +-
>  .../gpu/drm/amd/display/dc/opp/dcn35/dcn35_opp.c   |  13 +
>  .../gpu/drm/amd/display/dc/opp/dcn35/dcn35_opp.h   |   4 +-
>  .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |  38 ++-
>  .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c | 131 ++++++++++
>  .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.h |   2 +
>  .../drm/amd/display/dc/optc/dcn314/dcn314_optc.c   |   1 +
>  .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |   1 +
>  .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |   1 +
>  .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |   1 +
>  .../display/dc/resource/dce100/dce100_resource.c   |  38 ++-
>  .../display/dc/resource/dce110/dce110_resource.c   |   7 +-
>  .../display/dc/resource/dce112/dce112_resource.c   |   9 +-
>  .../display/dc/resource/dce120/dce120_resource.c   |   9 +-
>  .../amd/display/dc/resource/dce60/dce60_resource.c |  29 ++-
>  .../amd/display/dc/resource/dce80/dce80_resource.c |  34 ++-
>  .../amd/display/dc/resource/dcn10/dcn10_resource.c |   7 +-
>  .../amd/display/dc/resource/dcn20/dcn20_resource.c |   6 +-
>  .../display/dc/resource/dcn201/dcn201_resource.c   |   6 +-
>  .../amd/display/dc/resource/dcn21/dcn21_resource.c |   6 +-
>  .../amd/display/dc/resource/dcn30/dcn30_resource.c |   6 +-
>  .../display/dc/resource/dcn301/dcn301_resource.c   |   6 +-
>  .../display/dc/resource/dcn302/dcn302_resource.c   |   6 +-
>  .../display/dc/resource/dcn303/dcn303_resource.c   |   6 +-
>  .../amd/display/dc/resource/dcn31/dcn31_resource.c |   6 +-
>  .../display/dc/resource/dcn314/dcn314_resource.c   |   6 +-
>  .../display/dc/resource/dcn315/dcn315_resource.c   |   7 +-
>  .../display/dc/resource/dcn316/dcn316_resource.c   |   6 +-
>  .../amd/display/dc/resource/dcn32/dcn32_resource.c |   8 +-
>  .../display/dc/resource/dcn321/dcn321_resource.c   |   6 +-
>  .../amd/display/dc/resource/dcn35/dcn35_resource.c |   8 +-
>  .../display/dc/resource/dcn351/dcn351_resource.c   |   8 +-
>  .../amd/display/dc/resource/dcn36/dcn36_resource.c |   8 +-
>  .../display/dc/resource/dcn401/dcn401_resource.c   |   8 +-
>  .../dcn401/dcn401_soc_and_ip_translator.h          |   2 +-
>  drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |  25 ++
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  12 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |  50 ++--
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |  39 +++
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.h  |   2 +
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |  17 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   9 +
>  .../drm/amd/display/include/bios_parser_types.h    |  11 +-
>  .../amd/display/include/grph_object_ctrl_defs.h    |   1 +
>  .../gpu/drm/amd/display/include/grph_object_id.h   |   7 +
>  drivers/gpu/drm/amd/display/include/signal_types.h |  12 +
>  drivers/gpu/drm/amd/include/amd_cper.h             |   2 +-
>  .../drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_5_0.h  |   2 +-
>  drivers/gpu/drm/amd/include/kgd_pp_interface.h     | 117 +++++++++
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   1 -
>  .../gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c  |   2 +-
>  .../drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   |   2 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   3 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   2 +-
>  drivers/gpu/drm/radeon/radeon_acpi.c               |   1 -
>  drivers/gpu/drm/radeon/radeon_connectors.c         |  20 +-
>  drivers/gpu/drm/radeon/radeon_display.c            |   2 -
>  drivers/gpu/drm/radeon/radeon_drv.c                |  36 +--
>  drivers/gpu/drm/radeon/radeon_fbdev.c              |   2 -
>  drivers/gpu/drm/radeon/radeon_kms.c                |   5 -
>  256 files changed, 3549 insertions(+), 892 deletions(-)
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/Makefile
>  create mode 100644 drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/cmntypes.h (93%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_core.c (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_core.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_core_structs.h (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_lib_defines.h (95%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_util.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_util.h (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_translation_helper.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_translation_helper.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_utils.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_utils.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_wrapper.c (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_wrapper.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/bounding_boxes/dcn4_soc_bb.h (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml2_external_lib_deps.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top_dchub_registers.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top_display_cfg_types.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top_policy_types.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top_soc_parameter_types.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top_types.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_dcn4.c (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_dcn4.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_dcn4_calcs.c (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_dcn4_calcs.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_factory.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_factory.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_shared_types.h (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_utils.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_utils.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_factory.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_factory.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_mcg/dml2_mcg_dcn4.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_mcg/dml2_mcg_dcn4.h (97%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_mcg/dml2_mcg_factory.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_mcg/dml2_mcg_factory.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn3.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn3.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_factory.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_factory.h (97%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_standalone_libraries/lib_float_math.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_standalone_libraries/lib_float_math.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_top/dml2_top_interfaces.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_top/dml2_top_legacy.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_top/dml2_top_legacy.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_top/dml2_top_soc15.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_top/dml2_top_soc15.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/inc/dml2_debug.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/inc/dml2_internal_shared_types.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_dc_resource_mgmt.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_dc_resource_mgmt.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_dc_types.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_internal_types.h (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_mall_phantom.c (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_mall_phantom.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_policy.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_policy.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_translation_helper.c (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_translation_helper.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_utils.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_utils.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_wrapper.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_wrapper.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml_assert.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml_depedencies.h (99%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml_display_rq_dlg_calc.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml_display_rq_dlg_calc.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml_logging.h (99%)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
