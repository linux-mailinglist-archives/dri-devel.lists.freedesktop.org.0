Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E43262B28C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 06:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478B610E181;
	Wed, 16 Nov 2022 05:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3767C10E02A;
 Wed, 16 Nov 2022 05:03:27 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id i9so10949408qki.10;
 Tue, 15 Nov 2022 21:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPeLbqUi2a5gDUer3CWiqeNQAfyAMzz9/ZrcnFvYAug=;
 b=VyEOGi39GEbiC5dSEGwuoH5SI68mp27/nSAHtoKmIn+tUS+9X2mYNsGbc05YchBvso
 UztGCUWM/Hx0hunnOA3LeAkEpuLrON7fmNK2RFxHVJQLp+5E+bwhKlyi63ipU7q+OH1I
 uIOfICqz8e447DKa1aG0+4Od22+b/0e9xvvtEc9UbfpKufYc9zDi3lV6Q/zjTxjRTFi2
 rdtzVRVMy3g3OzHdNFJOF2LTph7z5GQbPmDrwJLThpg6kBVeConDwfcz7yp6kZzNGdG6
 i1sqV3UgZW2Z9WjV97NIjW7o8WPK9NYv9jEXGjclMr5YldmsXhh+0Jz7nHX5u7we46vM
 vcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MPeLbqUi2a5gDUer3CWiqeNQAfyAMzz9/ZrcnFvYAug=;
 b=Q+0iuK3A+vUF69gwCcW3fJo379NuHg7FMflS8169+OFKpPqfeEHhAY6qGyX3NlFPTT
 rlVX8QBaExkGI0anzCaK60UKNMaD9M0G05rkeD1tGC4CyoEVUJMmuSmTVp9Wr1iIOvy3
 ZxF/r7Cyywct9TCpHsWocn8jSdYaC89x52dkpKE2Cd2/N2Z4zBBRyIYWsiUjca3z6Kp8
 2LOI9Y9A6SZYVhUwe3QqNAWPSRt9NMrp+Y4EgkO7FdVQ7DIFvv4xRtwocAJfNT+GWYp7
 epWTm2wWOZFc44FbeTR/QFlkUCmbSFd8215IkjUas1iKPD0M7bCSNDx7G6rELMBzxChh
 TCLQ==
X-Gm-Message-State: ANoB5plRfi19J/skpwXg0ipHMzZ2ci9O3ier2NsFkNQVQK+TpVZqohDP
 TdWlx6GkD/k8wGOso+Srsf5tHsa0qXW+mT3owqw=
X-Google-Smtp-Source: AA0mqf6H3MkTsZBEYVODQSCrC26TcSCRtqdv8xQPsTqVfZRXIAjJTWqj/kc5c0aSNsZSBn6uVeGJe5RA7XEKcrPDUcA=
X-Received: by 2002:a05:620a:1009:b0:6fa:9812:42f2 with SMTP id
 z9-20020a05620a100900b006fa981242f2mr18325391qkj.754.1668575005977; Tue, 15
 Nov 2022 21:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20221111201852.6341-1-alexander.deucher@amd.com>
In-Reply-To: <20221111201852.6341-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 16 Nov 2022 15:03:13 +1000
Message-ID: <CAPM=9twYU=moXfat4pYCyjs-Z+Edx_pAwcTP3xuvh39htqNpvg@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd, radeon drm-next-6.2
To: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

arm32 build fails

/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../display/dc=
/core/dc.c:
In function =E2=80=98disable_dangling_plane=E2=80=99:
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../display/dc=
/core/dc.c:1134:46:
error: =E2=80=98const struct timing_generator_funcs=E2=80=99 has no member =
named
=E2=80=98disable_phantom_crtc=E2=80=99
 1134 |                                 if (tg->funcs->disable_phantom_crtc=
)
      |                                              ^~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../display/dc=
/core/dc.c:1135:50:
error: =E2=80=98const struct timing_generator_funcs=E2=80=99 has no member =
named
=E2=80=98disable_phantom_crtc=E2=80=99
 1135 |
tg->funcs->disable_phantom_crtc(tg);
      |                                                  ^~
make[6]: *** [/home/airlied/devel/kernel/dim/src/scripts/Makefile.build:250=
:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.o] Error 1

Dave.

On Sat, 12 Nov 2022 at 06:19, Alex Deucher <alexander.deucher@amd.com> wrot=
e:
>
> Hi Dave, Daniel,
>
> More new stuff for 6.2.
>
> The following changes since commit a143bc517bf31c4575191efbaac216a11ec016=
e0:
>
>   Merge branch '00.06-gr-ampere' of https://gitlab.freedesktop.org/skeggs=
b/nouveau into drm-next (2022-11-09 11:18:56 +1000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.2-20=
22-11-11
>
> for you to fetch changes up to 2ebf61f2cfb9a11bc17db30df3e675a4cd7418d3:
>
>   drm/amdgpu: Fix memory leak in amdgpu_cs_pass1 (2022-11-10 15:30:34 -05=
00)
>
> ----------------------------------------------------------------
> amd-drm-next-6.2-2022-11-11:
>
> amdgpu:
> - SMU 13.x updates
> - GPUVM TLB race fix
> - DCN 3.1.4 updates
> - DCN 3.2.x updates
> - PSR fixes
> - Kerneldoc fix
> - Vega10 fan fix
> - GPUVM locking fixes in error pathes
> - BACO fix for Beige Goby
> - EEPROM I2C address cleanup
> - GFXOFF fix
> - Fix DC memory leak in error pathes
> - Flexible array updates
> - Mtype fix for GPUVM PTEs
> - Move Kconfig into amdgpu directory
> - SR-IOV updates
> - Fix possible memory leak in CS IOCTL error path
>
> amdkfd:
> - Fix possible memory overrun
> - CRIU fixes
>
> radeon:
> - ACPI ref count fix
> - HDA audio notifier support
> - Move Kconfig into radeon directory
>
> UAPI:
> - Add new GEM_CREATE flags to help to transition more KFD functionality t=
o the DRM UAPI.
>   These are used internally in the driver to align location based memory =
coherency
>   requirements from memory allocated in the KFD with how we manage GPUVM =
PTEs.  They
>   are currently blocked in the GEM_CREATE IOCTL as we don't have a user r=
ight now.
>   They are just used internally in the kernel driver for now for existing=
 KFD memory
>   allocations. So a change to the UAPI header, but no functional change i=
n the UAPI.
>
> ----------------------------------------------------------------
> Alvin Lee (4):
>       drm/amd/display: Wait for VBLANK during pipe programming
>       drm/amd/display: Use min transition for SubVP into MPO
>       drm/amd/display: Disable phantom OTG after enable for plane disable
>       drm/amd/display: Add margin for max vblank time for SubVP + DRR
>
> Andrew Davis (1):
>       drm: Move radeon and amdgpu Kconfig options into their directories
>
> Aric Cyr (1):
>       drm/amd/display: 3.2.211
>
> Asher Song (1):
>       Revert "drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for v=
ega10 properly""
>
> Aurabindo Pillai (1):
>       drm/amd/display: Zeromem mypipe heap struct before using it
>
> Chaitanya Dhere (1):
>       drm/amd/display: Fix FCLK deviation and tool compile issues
>
> Christian K=C3=B6nig (1):
>       drm/amdgpu: workaround for TLB seq race
>
> Dillon Varone (1):
>       drm/amd/display: Enforce minimum prefetch time for low memclk on DC=
N32
>
> Dong Chenchen (1):
>       drm/amdgpu: Fix memory leak in amdgpu_cs_pass1
>
> Felix Kuehling (3):
>       drm/amdkfd: Fix error handling in kfd_criu_restore_events
>       drm/amdkfd: Fix error handling in criu_checkpoint
>       drm/amdgpu: Set MTYPE in PTE based on BO flags
>
> Gavin Wan (1):
>       drm/amdgpu: Ignore stop rlc on SRIOV environment.
>
> George Shen (1):
>       drm/amd/display: Populate DP2.0 output type for DML pipe
>
> Guchun Chen (1):
>       drm/amdgpu: disable BACO on special BEIGE_GOBY card
>
> Hamza Mahfooz (1):
>       drm/amd/display: only fill dirty rectangles when PSR is enabled
>
> Hanjun Guo (1):
>       drm/radeon: Add the missed acpi_put_table() to fix memory leak
>
> Harsh Jain (1):
>       drm/amdgpu: complete gfxoff allow signal during suspend without del=
ay
>
> Kenneth Feng (2):
>       drm/amd/pm: enable mode1 reset on smu_v13_0_10
>       drm/amd/pm: skip disabling all smu features on smu_v13_0_10 in susp=
end
>
> Leo Ma (1):
>       drm/amd/display: Adding HDMI SCDC DEVICE_ID define
>
> Liu Jian (1):
>       drm/amd/display: delete the duplicate .set_odm_bypass initializatio=
n in dcn314_tg_funcs
>
> LongJun Tang (1):
>       drm/amd/display: Have risk for memory exhaustion
>
> Luben Tuikov (2):
>       drm/amdgpu: Remove redundant I2C EEPROM address
>       drm/amdgpu: Decouple RAS EEPROM addresses from chips
>
> Ma Jun (2):
>       drm/amdkfd: Fix the memory overrun
>       drm/amdkfd: Make kfd_fill_cache_non_crat_info() as static
>
> Max Tseng (1):
>       drm/amd/display: Cursor update refactor: PSR-SU support condition
>
> Michael Strauss (1):
>       drm/amd/display: Only update link settings after successful MST lin=
k train
>
> Mike Hsieh (1):
>       drm/amd/display: Set correct EOTF and Gamut flag in VRR info
>
> Mustapha Ghaddar (1):
>       drm/amd/display: Fix fallback issues for DP LL 1.4a tests
>
> Nawwar Ali (1):
>       drm/amd/display: Update 709 gamma to 2.222 as stated in the stander=
d
>
> Nicholas Kazlauskas (3):
>       drm/amd/display: Update SR watermarks for DCN314
>       drm/amd/display: Allow tuning DCN314 bounding box
>       drm/amd/display: Fix reg timeout in enc314_enable_fifo
>
> Paulo Miguel Almeida (2):
>       drm/amdgpu: Replace 1-element array with flexible-array member
>       drm/amdgpu: Replace one-element array with flex-array member
>
> Philip Yang (2):
>       drm/amdgpu: Unlock bo_list_mutex after error handling
>       drm/amdgpu: Drop eviction lock when allocating PT BO
>
> Rajneesh Bhardwaj (1):
>       drm/amdgpu: Fix the kerneldoc description
>
> Ryan Lin (1):
>       drm/amd/display: Waiting for 1 frame to fix the flash issue on PSR1
>
> Steve Su (1):
>       drm/amd/display: Fix gpio port mapping issue
>
> Takashi Iwai (1):
>       drm/radeon: Add HD-audio component notifier support (v6)
>
> Tao Zhou (1):
>       drm/amdgpu: remove the check of init status in psp_ras_initialize
>
> Tim Huang (1):
>       drm/amd/pm: update SMU IP v13.0.4 msg interface header
>
> Tong Liu01 (1):
>       drm/amdgpu: add vram reservation based on vram_usagebyfirmware_v2_2
>
> Ville Syrj=C3=A4l=C3=A4 (1):
>       drm/amdgpu: Use drm_mode_init() for on-stack modes
>
> Wenjing Liu (1):
>       drm/amd/display: Consider dp cable id only when data is non zero
>
> Wesley Chalmers (1):
>       drm/amd/display: Disable DRR actions during state commit
>
> Yifan Zhang (1):
>       drm/amdgpu: force read discovery file if set discovery=3D2
>
>  drivers/gpu/drm/Kconfig                            |  56 ----------
>  drivers/gpu/drm/amd/amdgpu/Kconfig                 |  29 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  59 ++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   | 104 ++++++++++++++-=
---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   9 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  10 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  43 +++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  56 +++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   5 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  26 -----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  41 ++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   2 +
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   7 ++
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   7 ++
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  79 ++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  34 +++---
>  drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   3 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  10 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   8 ++
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  28 +++--
>  .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  32 +++---
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |  55 ++++++----
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   4 +
>  drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |   1 +
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  51 +++++++--
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |  15 ++-
>  drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  60 ++++++++++-
>  drivers/gpu/drm/amd/display/dc/dc_link.h           |   1 +
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   5 +
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   1 +
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   3 -
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   1 +
>  .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   1 +
>  .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   1 +
>  .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   1 +
>  .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   1 +
>  .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |  24 +++--
>  .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |   1 -
>  .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   1 +
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |   8 ++
>  .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   3 +
>  .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   3 +
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   5 +
>  .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   2 +
>  .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |  11 +-
>  .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   2 +
>  .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   5 +
>  .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |   3 +
>  .../dc/dml/dcn32/display_mode_vba_util_32.c        |  14 ++-
>  .../dc/dml/dcn32/display_mode_vba_util_32.h        |   3 +-
>  .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |   2 +
>  .../drm/amd/display/dc/dml/display_mode_structs.h  |   1 +
>  .../amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   |  14 +++
>  drivers/gpu/drm/amd/display/dc/gpio/hw_ddc.c       |   9 +-
>  .../drm/amd/display/dc/inc/hw/timing_generator.h   |   1 +
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   6 +-
>  .../drm/amd/display/modules/color/color_gamma.c    |   2 +-
>  .../drm/amd/display/modules/freesync/freesync.c    |   8 +-
>  drivers/gpu/drm/amd/include/atombios.h             |  24 ++---
>  drivers/gpu/drm/amd/include/atomfirmware.h         |  63 +++++++++--
>  .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |  25 +++--
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   3 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   4 +
>  .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_ppsmc.h   |  15 ++-
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   4 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  53 +++++++++-
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  18 ++++
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   3 +
>  drivers/gpu/drm/radeon/Kconfig                     |  30 ++++++
>  drivers/gpu/drm/radeon/radeon.h                    |   8 ++
>  drivers/gpu/drm/radeon/radeon_audio.c              | 117 +++++++++++++++=
++++++
>  drivers/gpu/drm/radeon/radeon_bios.c               |  18 ++--
>  drivers/gpu/drm/radeon/radeon_device.c             |   4 +
>  include/uapi/drm/amdgpu_drm.h                      |  14 +++
>  82 files changed, 1041 insertions(+), 369 deletions(-)
