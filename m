Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CF5C9F088
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC1410E14E;
	Wed,  3 Dec 2025 13:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdGLYjhr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5304410E7A2;
 Wed,  3 Dec 2025 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764766845; x=1796302845;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=7Ex22NmRb+ltROBqE8aUtTTEgBZGaV5+BxwwanDmzvg=;
 b=RdGLYjhr0BoFZI6jVqZbwing/3MyoGZztZFPlZ9wDJFz7qj3XQfBlpe9
 kymVB8ti0+ymPBy8gT/AW48U5+3sKNH2lT3PPR6BKNjshIdrL41zfodej
 dAh6yyLo2s6sVWYtaPyRjmIHN4QBeguyNEs7FOYFuKvG7vwfrfLLelTa9
 IPF7Snjx2BgBMybsBG/fENjAGeam9i54G51WL4VUQhsNEW+IY9ur8yuqS
 i6gz1LRBQ/GTaOr989aIhM7z3St/xmyh2Rlue0Hfi5hdJk18ynBdun0w3
 NQ6thwHWWusMDM/L6UxwaSApaQ6IYKU+o5qseLMXcmCiPKHU72QnWkRlK A==;
X-CSE-ConnectionGUID: DAdQkWUQRVmPyLwO3IvgHQ==
X-CSE-MsgGUID: 33Edowb+TcGmUCyKZRcPEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65757356"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="65757356"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 05:00:45 -0800
X-CSE-ConnectionGUID: QDjLNDHURO6jWBx/UaY0MQ==
X-CSE-MsgGUID: zi5wB0v7TjqPXACtOBJCBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="199627110"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 05:00:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, simona.vetter@ffwll.ch
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-6.19
In-Reply-To: <20251202220101.2039347-1-alexander.deucher@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251202220101.2039347-1-alexander.deucher@amd.com>
Date: Wed, 03 Dec 2025 15:00:39 +0200
Message-ID: <3a184e3f3c0623107caf400511905ba9d0851424@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 02 Dec 2025, Alex Deucher <alexander.deucher@amd.com> wrote:
> Hi Dave, Simona,
>
> Fixes for 6.19.
>
> The following changes since commit ee9b603ad43f9870eb75184f9fb0a84f8c3cc8=
52:
>
>   drm/amdgpu: Add sriov vf check for VCN per queue reset support. (2025-1=
1-19 17:34:16 -0500)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.19-2=
025-12-02
>
> for you to fetch changes up to 3925683515e93844be204381d2d5a1df5de34f31:
>
>   Revert "drm/amd: Skip power ungate during suspend for VPE" (2025-12-02 =
11:02:07 -0500)
>
> ----------------------------------------------------------------
> amd-drm-next-6.19-2025-12-02:

I presume this merge broke the drm-tip build:

  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4026:13: err=
or: redefinition of =E2=80=98are_sinks_equal=E2=80=99
 4026 | static bool are_sinks_equal(const struct dc_sink *sink1, const stru=
ct dc_sink *sink2)
      |             ^~~~~~~~~~~~~~~
../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3935:13: not=
e: previous definition of =E2=80=98are_sinks_equal=E2=80=99 with type =E2=
=80=98bool(const struct dc_sink *, const struct dc_sink *)=E2=80=99 {aka =
=E2=80=98_Bool(const struct dc_sink *, const struct dc_sink *)=E2=80=99}
 3935 | static bool are_sinks_equal(const struct dc_sink *sink1, const stru=
ct dc_sink *sink2)
      |             ^~~~~~~~~~~~~~~
../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4058:13: err=
or: redefinition of =E2=80=98hdmi_hpd_debounce_work=E2=80=99
 4058 | static void hdmi_hpd_debounce_work(struct work_struct *work)
      |             ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3967:13: not=
e: previous definition of =E2=80=98hdmi_hpd_debounce_work=E2=80=99 with typ=
e =E2=80=98void(struct work_struct *)=E2=80=99
 3967 | static void hdmi_hpd_debounce_work(struct work_struct *work)
      |             ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3967:13: err=
or: =E2=80=98hdmi_hpd_debounce_work=E2=80=99 defined but not used [-Werror=
=3Dunused-function]
cc1: all warnings being treated as errors


BR,
Jani.


>
> amdgpu:
> - Unified MES fix
> - SMU 11 unbalanced irq fix
> - Fix for driver reloading on APUs
> - pp_table sysfs fix
> - Fix memory leak in fence handling
> - HDMI fix
> - DC cursor fixes
> - eDP panel parsing fix
> - Brightness fix
> - DC analog fixes
> - EDID retry fixes
> - UserQ fixes
> - RAS fixes
> - IP discovery fix
> - Add missing locking in amdgpu_ttm_access_memory_sdma()
> - Smart Power OLED fix
> - PRT and page fault fixes for GC 6-8
> - VMID reservation fix
> - ACP platform device fix
> - Add missing vm fault handling for GC 11-12
> - VPE fix
>
> amdkfd:
> - Partitioning fix
>
> ----------------------------------------------------------------
> Aditya Gollamudi (1):
>       drm/amd/display: fix typo in display_mode_core_structs.h
>
> Alex Deucher (5):
>       Revert "drm/amd/display: Move setup_stream_attribute"
>       drm/amdgpu: fix cyan_skillfish2 gpu info fw handling
>       drm/amdgpu/gmc11: add amdgpu_vm_handle_fault() handling
>       drm/amdgpu/gmc12: add amdgpu_vm_handle_fault() handling
>       drm/amdgpu: use common defines for HUB faults
>
> Alex Hung (1):
>       drm/amd/display: Check NULL before accessing
>
> Brady Norander (1):
>       drm/amdgpu: use static ids for ACP platform devs
>
> Dan Carpenter (1):
>       drm/amd/display: Fix logical vs bitwise bug in get_embedded_panel_i=
nfo_v2_1()
>
> Eric Huang (1):
>       drm/amdkfd: assign AID to uuid in topology for SPX mode
>
> Ian Chen (1):
>       drm/amd/display: fix Smart Power OLED not working after S4
>
> Ivan Lipski (2):
>       drm/amd/display: Check ATOM_DEVICE_CRT2_SUPPORT in dc_load_detection
>       drm/amd/display: Move RGB-type check for audio sync to DCE HW seque=
nce
>
> Mario Limonciello (AMD) (3):
>       drm/amd/display: Don't change brightness for disabled connectors
>       drm/amd/display: Increase EDID read retries
>       Revert "drm/amd: Skip power ungate during suspend for VPE"
>
> Michael Chen (1):
>       drm/amd/amdgpu: reserve vm invalidation engine for uni_mes
>
> Natalie Vock (1):
>       drm/amdgpu: Forward VMID reservation errors
>
> Nicholas Kazlauskas (1):
>       drm/amd/display: Add cursor offload abort to the new HWSS path
>
> Pierre-Eric Pelloux-Prayer (3):
>       drm/amdgpu: clear job on failure in amdgpu_job_alloc(_with_ib)
>       drm/amdgpu: free job fences on failure in amdgpu_job_alloc_with_ib
>       drm/amdgpu: add missing lock to amdgpu_ttm_access_memory_sdma
>
> Prike Liang (1):
>       drm/amdgpu: attach tlb fence to the PTs update
>
> Rodrigo Siqueira (2):
>       drm/amdgpu: Fix GFX hang on SteamDeck when amdgpu is reloaded
>       Revert "drm/amd: fix gfx hang on renoir in IGT reload test"
>
> Srinivasan Shanmugam (3):
>       drm/amd/display: Fix dereference-before-check for dc_link
>       drm/amdgpu: Fix CPER ring debugfs read buffer overflow risk
>       drm/amdgpu/sdma6: Update SDMA 6.0.3 FW version to include UMQ prote=
cted-fence fix
>
> Timur Krist=C3=B3f (10):
>       drm/amdgpu/si_ih: Enable soft IRQ handler ring
>       drm/amdgpu/cik_ih: Enable soft IRQ handler ring
>       drm/amdgpu/iceland_ih: Enable soft IRQ handler ring
>       drm/amdgpu/tonga_ih: Enable soft IRQ handler ring
>       drm/amdgpu/cz_ih: Enable soft IRQ handler ring
>       drm/amdgpu/gmc6: Don't print MC client as it's unknown
>       drm/amdgpu/gmc6: Cache VM fault info
>       drm/amdgpu/gmc6: Delegate VM faults to soft IRQ handler ring
>       drm/amdgpu/gmc7: Delegate VM faults to soft IRQ handler ring
>       drm/amdgpu/gmc8: Delegate VM faults to soft IRQ handler ring
>
> Yang Wang (2):
>       drm/amd/pm: fix amdgpu_irq enabled counter unbalanced on smu v11.0
>       drm/amd/pm: adjust the visibility of pp_table sysfs node
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            | 10 ++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 19 ++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  3 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |  5 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  4 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  5 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  5 ++--
>  drivers/gpu/drm/amd/amdgpu/cik_ih.c                | 12 +++++++++
>  drivers/gpu/drm/amd/amdgpu/cz_ih.c                 | 10 ++++++++
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  6 +++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             | 29 ++++++++++++++++=
++++++
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             | 29 ++++++++++++++++=
++++++
>  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              | 20 ++++++++++-----
>  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |  6 +++++
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  6 +++++
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  6 +++--
>  drivers/gpu/drm/amd/amdgpu/iceland_ih.c            | 10 ++++++++
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  2 +-
>  drivers/gpu/drm/amd/amdgpu/si_ih.c                 | 12 +++++++++
>  drivers/gpu/drm/amd/amdgpu/soc15.c                 |  4 ---
>  drivers/gpu/drm/amd/amdgpu/tonga_ih.c              | 10 ++++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  4 ++-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 24 ++++++++++++++--=
--
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  8 +++---
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  2 +-
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  8 +++---
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |  6 +++++
>  .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  | 24 ++++++++++++++++=
++
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    | 11 +++++---
>  .../display/dc/dml2_0/display_mode_core_structs.h  |  2 +-
>  .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  4 ++-
>  .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  2 --
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  4 +--
>  drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h | 13 ++++++++++
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  6 +++--
>  .../display/dc/virtual/virtual_stream_encoder.c    |  7 ------
>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c                | 12 ++++++---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 11 +++++++-
>  drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  5 +++-
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  9 ++++---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  7 +++++-
>  42 files changed, 320 insertions(+), 64 deletions(-)

--=20
Jani Nikula, Intel
