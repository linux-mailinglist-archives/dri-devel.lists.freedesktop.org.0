Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 237024D3CB0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 23:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F373D10E0A5;
	Wed,  9 Mar 2022 22:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F54210E0A5;
 Wed,  9 Mar 2022 22:12:18 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id t1so4439307edc.3;
 Wed, 09 Mar 2022 14:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=66YaX71bgcdeApJ0LUkN99wM3HFQP2dosyERtGlnWhA=;
 b=DXB3APfxc75tngjYrmKOHY70nLbSIS4eU0KhfiEsi1aIPJpmPxZLWzrOn5UEcCWOsH
 xgh9xBp1lGvDByEN4nzrdwFnmLhgC29tGVPTO1D8slCe8IcBBENEE4Rlo91Uzq/wvUv0
 Gvx58o/5yHXeqORX/kqodrVuWzGAm6tssebSkHPi6J/+jvx3zJaqSjw5Qt98RNQjo7Tr
 RpMCTAreV/SOx7rv2Oo2JX5hXiMNMsh+x4sTM2pu2jPLALimRWX655zBEF7MGLFeOOus
 8SCajbyS+t+/a9S970QLzbbNqT7pSXMlhuHSIBA5YrdtBdGmXrap6f0Ga0sla4e8lzNJ
 B8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=66YaX71bgcdeApJ0LUkN99wM3HFQP2dosyERtGlnWhA=;
 b=TDOh1SSkqQQ/QzptV+CUL1H1MRKAP2jUk7xHtiFD6/BIB8YLhicn7G2tRY1pKfAP9O
 gTI/9vETppJD3AdheELgru8txjTHMZEBUq31p0Cg5wpwNm80XrlNf2MepByDC785X3uS
 XLkqRXsWZ97FrirxQFarmCXKln/O5o9V8o2R7FhUMQw87wK0cNXeLN/UgVr8dRF5PQV7
 t3k+m5YT6IBe0CmBtwdX8VCcT9x6/W2XqA91AQMngeLu1OdsHVrRkZ41/tIjMf6s/KkM
 uGxmCY/fwrqNpZkLdfrZjY1BahqoC4FR9hn45WVkwIs+/s+3WYV3F47QVk9kMibe/HI2
 0yDg==
X-Gm-Message-State: AOAM531VS68Cge0gny1EMCvoTQdaFUHiJIqwfGrDkgqc48X8cVWiQVrD
 YZgRfIF7tUAos98CtWM4C2Cqe1VTcR2mYFZvXho=
X-Google-Smtp-Source: ABdhPJzmzDmXP3nIK/NDh0TSF7CqTGZplWl8u4gSbLxdnrA09DacVrnBqZDobZ3jrb2ZwuifRssevCk9ClgmrxiwO/I=
X-Received: by 2002:a05:6402:5143:b0:416:1327:4f95 with SMTP id
 n3-20020a056402514300b0041613274f95mr1553885edd.56.1646863936642; Wed, 09 Mar
 2022 14:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20220307200813.77378-1-alexander.deucher@amd.com>
In-Reply-To: <20220307200813.77378-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 10 Mar 2022 08:12:05 +1000
Message-ID: <CAPM=9twEVwqPMdQvJNaiJqrRGBNW4Mp==2cEXP6skPJcczNemA@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.18
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Mar 2022 at 06:08, Alex Deucher <alexander.deucher@amd.com> wrote=
:
>
> Hi Dave, Daniel,
>
> Same PR as last week, just fixed up a bad Fixes tag.
>
> The following changes since commit 38a15ad9488e21cad8f42d3befca20f91e5b28=
74:
>
>   Merge tag 'amd-drm-next-5.18-2022-02-25' of https://gitlab.freedesktop.=
org/agd5f/linux into drm-next (2022-03-01 16:19:02 +1000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2=
022-03-07
>
> for you to fetch changes up to 53b97af4a44abd21344cc9f13986ba53051287bb:
>
>   drm/amdkfd: Add format attribute to kfd_smi_event_add (2022-03-07 14:59=
:59 -0500)

clang says no.

/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd=
_device_queue_manager.c:508:6:
error: variable 'vmid' is used uninitialized whenever 'if' condition
is false [-Werror,-Wsometimes-uninitialized]
        if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd=
_device_queue_manager.c:521:6:
note: uninitialized use occurs here
        if (vmid > last_vmid_to_scan) {
            ^~~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd=
_device_queue_manager.c:508:2:
note: remove the 'if' if its condition is always true
        if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd=
_device_queue_manager.c:490:19:
note: initialize the variable 'vmid' to silence this warning
        unsigned int vmid;
                         ^
                          =3D 0

Dave.
>
> ----------------------------------------------------------------
> amd-drm-next-5.18-2022-03-07:
>
> amdgpu:
> - Misc code cleanups
> - Misc display fixes
> - PSR display fixes
> - More RAS cleanup
> - Hotplug fix
> - Bump minor version for hotplug tests
> - SR-IOV fixes
> - GC 10.3.7 updates
> - Remove some firmwares which are no longer used
> - Mode2 reset refactor
> - Aldebaran fixes
> - Add VCN fwlog feature for VCN debugging
> - CS code cleanup
>
> amdkfd:
> - SVM fixes
> - SMI event fixes and cleanups
> - vmid_pasid mapping fix for gfx10.3
>
> ----------------------------------------------------------------
> Alex Deucher (4):
>       drm/amdgpu: Use IP versions in convert_tiling_flags_to_modifier()
>       drm/amdgpu: remove unused gpu_info firmwares
>       drm/amdgpu/gfx10: drop unused cyan skillfish firmware
>       drm/amdgpu/sdma5: drop unused cyan skillfish firmware
>
> Andrey Grodzovsky (2):
>       drm/amdgpu: Fix sigsev when accessing MMIO on hot unplug.
>       drm/amdgpu: Bump minor version for hot plug tests enabling.
>
> Anthony Koo (1):
>       drm/amd/display: [FW Promotion] Release 0.0.106.0
>
> Aric Cyr (1):
>       drm/amd/display: 3.2.175
>
> Charlene Liu (1):
>       drm/amd/display: add verify_link_cap back for hdmi
>
> Chris Park (1):
>       drm/amd/display: Reset VIC if HDMI_VIC is present
>
> Christian K=C3=B6nig (5):
>       drm/amdgpu: install ctx entities with cmpxchg
>       drm/amdgpu: header cleanup
>       drm/amdgpu: use job and ib structures directly in CS parsers
>       drm/amdgpu: properly embed the IBs into the job
>       drm/amdgpu: initialize the vmid_wait with the stub fence
>
> Danijel Slivka (1):
>       drm/amd/pm: new v3 SmuMetrics data structure for Sienna Cichlid
>
> David Yu (1):
>       drm/amdgpu: Add DFC CAP support for aldebaran
>
> Dillon Varone (2):
>       drm/amd/display: Add frame alternate 3D & restrict HW packed on don=
gles
>       drm/amd/display: Modify plane removal sequence to avoid hangs.
>
> George Shen (1):
>       drm/amd/display: Refactor fixed VS w/a for PHY tests
>
> Hansen Dsouza (1):
>       drm/amd/display: Remove invalid RDPCS Programming in DAL
>
> Harish Kasiviswanathan (1):
>       drm/amdgpu: Set correct DMA mask for aldebaran
>
> Jingwen Chen (1):
>       drm/amd/amdgpu: set disabled vcn to no_schduler
>
> Lijo Lazar (1):
>       drm/amdgpu: Refactor mode2 reset logic for v13.0.2
>
> Luben Tuikov (1):
>       drm/amd/display: Don't fill up the logs
>
> Meng Tang (1):
>       gpu/amd: vega10_hwmgr: fix inappropriate private variable name
>
> Michael Strauss (1):
>       drm/amd/display: Pass HostVM enable flag into DCN3.1 DML
>
> Nicholas Kazlauskas (1):
>       drm/amd/display: Make functional resource functions non-static
>
> Philip Yang (4):
>       Revert "drm/amdkfd: process_info lock not needed for svm"
>       drm/amdkfd: Correct SMI event read size
>       drm/amdkfd: Add SMI add event helper
>       drm/amdkfd: Add format attribute to kfd_smi_event_add
>
> Prike Liang (4):
>       drm/amdgpu: enable gfx clock gating control for GC 10.3.7
>       drm/amdgpu/nv: enable clock gating for GC 10.3.7 subblock
>       drm/amdgpu: enable gfx power gating for GC 10.3.7
>       drm/amdgpu: enable gfxoff routine for GC 10.3.7
>
> Qiang Yu (1):
>       drm/amdgpu: fix suspend/resume hang regression
>
> Robin Chen (1):
>       drm/amd/display: Pass deep sleep disabled allow info to dmub fw
>
> Ruijing Dong (2):
>       drm/amdgpu/vcn: Update fw shared data structure
>       drm/amdgpu/vcn: Add vcn firmware log
>
> Shah Dharati (1):
>       drm/amd/display: Adding a dc_debug option and dmub setting to use P=
HY FSM for PSR
>
> Tom Rix (1):
>       drm/amdgpu: Fix realloc of ptr
>
> Weiguo Li (1):
>       drm/amdgpu: remove redundant null check
>
> Wesley Chalmers (1):
>       drm/amd/display: Program OPP before ODM
>
> Yifan Zha (1):
>       drm/amdgpu: Move CAP firmware loading to the beginning of PSP firmw=
are list
>
> Yifan Zhang (4):
>       drm/amdgpu: move amdgpu_gmc_noretry_set after ip_versions populated
>       drm/amdgpu: convert code name to ip version for noretry set
>       drm/amdkfd: judge get_atc_vmid_pasid_mapping_info before call
>       drm/amdkfd: implement get_atc_vmid_pasid_mapping_info for gfx10.3
>
> jinzh (1):
>       drm/amd/display: refine the EDID override
>
> yipechai (12):
>       drm/amdgpu: Modify .ras_fini function pointer parameter
>       drm/amdgpu: Optimize xxx_ras_fini function of each ras block
>       drm/amdgpu: centrally calls the .ras_fini function of all ras block=
s
>       drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in=
 gfx ras block
>       drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in=
 mmhub ras block
>       drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in=
 nbio ras block
>       drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in=
 umc ras block
>       drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in=
 xgmi ras block
>       drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in=
 hdp ras block
>       drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in=
 sdma ras block
>       drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in=
 mca ras block
>       drm/amdgpu: Remove redundant .ras_fini initialization in some ras b=
locks
>
>  drivers/gpu/drm/amd/amdgpu/aldebaran.c             |  66 ++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  98 +----------
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |  16 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |  80 +++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  24 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  19 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  25 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  11 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   7 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  21 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   9 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   6 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |   3 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c          |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   7 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  28 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  58 ++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   7 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.c   |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   7 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  37 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h            |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            | 117 ++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |   7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            | 134 ++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  30 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   8 -
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  18 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   7 -
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   4 -
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  15 +-
>  drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |   1 -
>  drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              |  18 --
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   1 -
>  drivers/gpu/drm/amd/amdgpu/nv.c                    |  15 +-
>  drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   1 +
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   8 -
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   8 +-
>  drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 -
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |  14 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   7 +
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  22 ++-
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  21 ++-
>  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  51 +++---
>  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  18 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |  74 +++------
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   9 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   8 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  14 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  16 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   2 +
>  drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   1 +
>  .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  49 +++---
>  .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   5 +-
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |  21 +--
>  .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   9 -
>  .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   5 +-
>  .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |   5 +
>  .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   1 +
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   3 +
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  12 +-
>  .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  68 ++++----
>  .../inc/pmfw_if/smu11_driver_if_sienna_cichlid.h   |  58 +++++++
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 181 ++++++++++++++-=
------
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   1 +
>  include/uapi/linux/kfd_ioctl.h                     |   1 +
>  84 files changed, 991 insertions(+), 679 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
