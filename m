Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB66ACFC58
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 08:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E0210E122;
	Fri,  6 Jun 2025 06:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XBsi4SQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AC610E122
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 06:04:39 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ad56829fabdso263419166b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 23:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749189878; x=1749794678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=plot8sd2JYYQrhX2ohptLW4l1yzZqubaP23BaUQtZnA=;
 b=XBsi4SQPOBPL3fVc4He5CMoPv3ogmJ3BTD6qq8g1hFTqG0Ik2FTU6l84U/+VlJVs/u
 OZaVTLDQDsrvH0ZYdQgwoA0b9oi7jnTeOtOrdVxSMaZl7pzBXHTX7b5nDy4hPPlFyWPw
 ZpEv7nBQ5ROZsjmC6HuJZCmy0HjeJCFAuHYddyczQTQobD3Eco91yXyq8bgYICAP4wZY
 Ar276zZfuFKjyf+bSNh+2ASXBmw4lBfVuvNFcNfP4AxAuV5vi6r5CnOD6DvZp0X+Xm7e
 pSdAIQW9o+0QQqUxVUANywNZCYdag6z7LYsFPGKne5Tzy+1ojFSmxx0jc9z2lV3XLKbS
 lMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749189878; x=1749794678;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=plot8sd2JYYQrhX2ohptLW4l1yzZqubaP23BaUQtZnA=;
 b=NtZ2CxXt0DdaMs802nwq4miBqH8R9wFkURYfM1CIWo8yr499hjgcNyfDR+QdY8Fpgi
 3Gz+uVrnFJ7PZYoTDERszZWA/J+YZKuDOjNMTqZxZkiAqUziXTiuT47uuvbJpOCTX3p4
 kQlV0x5igeQkyWnmdGORrzKGlqYCcLQILUkBMuBFgNg4mBJ8nCjML6ynOOQQsivRgVwl
 DxdT0mWnwY13UmcWJLBPhce7cmGPzuWWE1wQxm41g96InpMAofuaD28igdYZkzAdbuLJ
 XpgCAKsY28ZhC2aWKsu/YDp0ubkjtJbsNuNNGW15d3xUBL6nLeYqGEoZs8z0MeT2ybj0
 x6pQ==
X-Gm-Message-State: AOJu0YxAK0FRVHETpzLSUmpG7bhE4Yg7OSXr3n2o5hLh2ge9x9T0XmVj
 fGjWPmFGnFEjk1orBquuMfNq4nFq+HycnoAzBex293KdmoNyV2QlIj44IyMDyPNJ4cHF7dupLQY
 L+CJiaibqEisMyw9ca9cjFwg7vFnnqRYinfrQfzM=
X-Gm-Gg: ASbGnctjnp1GwV4ITj9qHN0np37GxhbOpVyuBq9FzhEDcUcfdH3yiZFs5QbfOxhGOyY
 3Yze9ViMQxb75bdPfhKicbZgEEOdBxZShgRJzjQuVk19M/7tPEqXl7fAZD0iizwmocoZSJiGgjO
 Rj/EVo+AABF3FZCQlqRmp3AtdPu2Os8i4wyO8bAnfVlw==
X-Google-Smtp-Source: AGHT+IFDq6RTkFafiLCT5wqbIvjA+CUJ5zWdGAwwRSmbUkKLyHhnJwWgeH9zRU0XGu/D7KAmWpbzFWfdqGrIECWeBuY=
X-Received: by 2002:a17:907:3f13:b0:ad8:93a3:29b0 with SMTP id
 a640c23a62f3a-ade1aa06c74mr173577966b.45.1749189877470; Thu, 05 Jun 2025
 23:04:37 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Jun 2025 16:04:25 +1000
X-Gm-Features: AX0GCFttc7xWI2YIB1d6TkNF6ib-M_2lmJMV6KSdBgDam9S--boqr0BhIHHdLS0
Message-ID: <CAPM=9twQ4c_Xr_ZP0H2d7HT7HMrDgYGNGOSALBHO5jhjS3GimQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This is pretty much 2 weeks worth of fixes, plus one thing that might
be considered next.

amdkfd is now able to be enabled on risc-v platforms.

Otherwise, amdgpu and xe with the majority of fixes, and then a
smattering all over, just realised I forgot the nouveau fix in the
signed tag, it was a fairly minor typo.

This conflicted in xe_lrc.c in our internal tip tree so it probably
will for you also, let me know if there's any problem, but I don't
think it was too hard to work out,

Regards,
Dave.

drm-next-2025-06-06:
drm fixes for 6.16-rc1

(amdkfd on riscv is more a feature).

panel:
- nt37801: fix IS_ERR
- nt37801: fix KConfig

connector:
- Fix null deref in HDMI audio helper.

bridge:
- analogix_dp: fixup clk-disable removal

nouveau:
- fix a , vs ;

msm:
- mailmap updates

i915:
- Fix the enabling/disabling of DP audio SDP splitting
- Fix PSR register definitions for ALPM
- Fix u32 overflow in SNPS PHY HDMI PLL setup
- Fix GuC pending message underflow when submit fails
- Fix GuC wakeref underflow race during reset

xe:
- Two documentation fixes
- A couple of vm init fixes
- Hwmon fixes
- Drop reduntant conversion to bool
- Fix CONFIG_INTEL_VSEC dependency
- Rework eviction rejection of bound external bos
- Stop re-submitting signalled jobs
- A couple of pxp fixes
- Add back a fix that got lost in a merge
- Create LRC bo without VM
- Fix for the above fix

amdgpu:
- UserQ fixes
- SMU 13.x fixes
- VCN fixes
- JPEG fixes
- Misc cleanups
- runtime pm fix
- DCN 4.0.1 fixes
- Misc display fixes
- ISP fix
- VRAM manager fix
- RAS fixes
- IP discovery fix
- Cleaner shader fix for GC 10.1.x
- OD fix
- Non-OLED panel fix
- Misc display fixes
- Brightness fixes

amdkfd:
- Enable CONFIG_HSA_AMD on RISCV
- SVM fix
- Misc cleanups
- Ref leak fix
- WPTR BO fix

radeon:
- Misc cleanups
The following changes since commit f8bb3ed3197966fb60bedcbdc126d2bd5bc0a77f=
:

  drm/nouveau/tegra: Fix error pointer vs NULL return in
nvkm_device_tegra_resource_addr() (2025-05-24 14:36:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-06-06

for you to fetch changes up to 04c8970771b4f1f39bb8453a2eeb188c4d5edbd6:

  drm/nouveau/vfn/r535: Convert comma to semicolon (2025-06-06 14:00:06 +10=
00)

----------------------------------------------------------------
drm fixes for 6.16-rc1

(amdkfd on riscv is more a feature).

panel:
- nt37801: fix IS_ERR
- nt37801: fix KConfig

connector:
- Fix null deref in HDMI audio helper.

bridge:
- analogix_dp: fixup clk-disable removal

msm:
- mailmap updates

i915:
- Fix the enabling/disabling of DP audio SDP splitting
- Fix PSR register definitions for ALPM
- Fix u32 overflow in SNPS PHY HDMI PLL setup
- Fix GuC pending message underflow when submit fails
- Fix GuC wakeref underflow race during reset

xe:
- Two documentation fixes
- A couple of vm init fixes
- Hwmon fixes
- Drop reduntant conversion to bool
- Fix CONFIG_INTEL_VSEC dependency
- Rework eviction rejection of bound external bos
- Stop re-submitting signalled jobs
- A couple of pxp fixes
- Add back a fix that got lost in a merge
- Create LRC bo without VM
- Fix for the above fix

amdgpu:
- UserQ fixes
- SMU 13.x fixes
- VCN fixes
- JPEG fixes
- Misc cleanups
- runtime pm fix
- DCN 4.0.1 fixes
- Misc display fixes
- ISP fix
- VRAM manager fix
- RAS fixes
- IP discovery fix
- Cleaner shader fix for GC 10.1.x
- OD fix
- Non-OLED panel fix
- Misc display fixes
- Brightness fixes

amdkfd:
- Enable CONFIG_HSA_AMD on RISCV
- SVM fix
- Misc cleanups
- Ref leak fix
- WPTR BO fix

radeon:
- Misc cleanups

----------------------------------------------------------------
Abhinav Kumar (2):
      MAINTAINERS: drop myself as maintainer
      MAINTAINERS: update my email address

Akhil P Oommen (1):
      mailmap: Update entry for Akhil P Oommen

Alex Deucher (4):
      drm/amdgpu: Update runtime pm checks
      drm/amdgpu/mes: add missing locking in helper functions
      drm/amdgpu/mes: remove some unused functions
      drm/amdgpu: disable workload profile switching when OD is enabled

Andrey Vatoropin (1):
      drm/amdkfd: Change svm_range_get_info return type

Arnd Bergmann (2):
      drm/panel: nt37801: select CONFIG_DRM_DISPLAY_DSC_HELPER
      drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency

Arunpravin Paneer Selvam (2):
      drm/amdgpu: Add userq fence support to SDMAv6.0
      drm/amdgpu: Add userq fence support to SDMAv7.0

Asad Kamal (5):
      drm/amd/pm: Update pmfw headers for smu_v_13_0_6
      drm/amd/pm: Fill pldm version for SMU v13.0.6 SOCs
      drm/amd/pm: Optimize get gpu metrics data function
      drm/amd/pm: Enable static metrics table support
      drm/amd/pm: Enable static metrics table support

Aurabindo Pillai (4):
      Revert "drm/amd/display: [FW Promotion] Release 0.1.11.0"
      drm/amd/display: Add some missing register headers for DCN401
      Revert "drm/amd/display: more liberal vmin/vmax update for freesync"
      drm/amd/display: Reuse Subvp debug option for FAMS

Chen Ni (1):
      drm/nouveau/vfn/r535: Convert comma to semicolon

Christophe JAILLET (1):
      drm/amd/display: Constify struct timing_generator_funcs

Cruise Hung (1):
      drm/amd/display: Use DC log instead of using DM error msg

Damon Ding (1):
      drm/bridge: analogix_dp: Remove the unnecessary calls to
clk_disable_unprepare() during probing

Dan Carpenter (3):
      drm/panel: nt37801: Fix IS_ERR() vs NULL check in probe()
      drm/amdgpu: Fix integer overflow issues in amdgpu_userq_fence.c
      drm/amdgpu: Fix integer overflow in amdgpu_gem_add_input_fence()

Daniele Ceraolo Spurio (2):
      drm/xe/pxp: Use the correct define in the set_property_funcs array
      drm/xe/pxp: Clarify PXP queue creation behavior if PXP is not ready

Daniil Ryabov (1):
      drm/amd/display: fix typo in comments

Dave Airlie (8):
      Merge tag 'drm-intel-next-fixes-2025-05-28' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2025-05-28' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-fixes-6.16-2025-05-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-msm-fixes-2025-06-04' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-intel-next-fixes-2025-06-05' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-fixes-2025-06-05' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2025-06-05' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-fixes-6.16-2025-06-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David (Ming Qiang) Wu (9):
      drm/amdgpu/vcn1: read back register after written
      drm/amdgpu/vcn2: read back register after written
      drm/amdgpu/vcn2.5: read back register after written
      drm/amdgpu/vcn3: read back register after written
      drm/amdgpu/vcn4: read back register after written
      drm/amdgpu/vcn4.0.3: read back register after written
      drm/amdgpu/vcn4.0.5: read back register after written
      drm/amdgpu/vcn5: read back register after written
      drm/amdgpu/vcn5.0.1: read back register after written

Dibin Moolakadan Subrahmanian (1):
      drm/i915/display: Fix u32 overflow in SNPS PHY HDMI PLL setup

Fangzhi Zuo (1):
      Revert "drm/amd/display: pause the workload setting in dm"

Heiko Stuebner (1):
      drm/bridge: analogix_dp: Fix clk-disable removal

Imre Deak (1):
      drm/i915/dp: Fix the enabling/disabling of audio SDP splitting

Jesse.Zhang (1):
      drm/amdgpu: Fix eviction fence worker race during fd close

Jesus Narvaez (2):
      drm/i915/guc: Check if expecting reply before decrementing
outstanding_submission_g2h
      drm/i915/guc: Handle race condition where wakeref count drops below 0

Jihed Chaibi (2):
      drm/amdgpu: fixing typo in macro name
      drm/radeon: fixing typo in macro name

John Olender (1):
      drm/amdgpu: amdgpu_vram_mgr_new(): Clamp lpfn to total vram

Joonas Lahtinen (1):
      Revert "drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on D=
G1"

Jouni H=C3=B6gander (1):
      drm/i915/psr: Fix using wrong mask in REG_FIELD_PREP

Karthik Poosa (2):
      drm/xe/hwmon: Add support to manage power limits though mailbox
      drm/xe/hwmon: Move card reactive critical power under channel card

Lang Yu (1):
      drm/amdkfd: Map wptr BO to GART unconditionally

Leonardo Gomes (2):
      drm/amd/display: Adjust get_value function with prefix to help in ftr=
ace
      drm/amd/display: Adjust set_value function with prefix to help in ftr=
ace

Lijo Lazar (7):
      drm/amd/pm: Use macro to initialize metrics table
      drm/amd/pm: Add support to query partition metrics
      drm/amdgpu: Add sysfs nodes for partition
      drm/amd/pm: Fetch partition metrics on SMUv13.0.6
      drm/amd/pm: Use external link order for xgmi data
      drm/amd/pm: Fetch partition metrics on SMUv13.0.12
      drm/amdgpu: Add more checks to discovery fetch

Maciej Patelczyk (1):
      drm/xe: remove unmatched xe_vm_unlock() from __xe_exec_queue_init()

Mangesh Gadre (5):
      drm/amdgpu: Add vcn poison status reg
      drm/amdgpu: Enable RAS for vcn 5.0.1
      drm/amdgpu: Add jpeg poison status reg
      drm/amdgpu: Enable RAS for jpeg 5.0.1
      drm/amdgpu: update ras support check

Mario Limonciello (4):
      Revert "drm/amd: Keep display off while going into S4"
      drm/amd: Export DMCUB version to sysfs
      drm/amd/display: Add debugging message for brightness caps
      drm/amd/display: Fix default DC and AC levels

Matthew Auld (4):
      drm/xe/vm: move rebind_work init earlier
      drm/xe/vm: move xe_svm_init() earlier
      drm/xe/sched: stop re-submitting signalled jobs
      drm/xe/guc_submit: add back fix

Melissa Wen (2):
      drm/amd/display: only collect data if debug gamut_remap is available
      drm/amd/display: no 3D and blnd LUT as DPP color caps for DCN401

Nicolas Frattaroli (1):
      drm/connector: only call HDMI audio helper plugged cb if non-null

Niranjana Vishwanathapura (1):
      drm/xe: Create LRC BO without VM

Philip Yang (1):
      drm/amdgpu: seq64 memory unmap uses uninterruptible lock

Pratap Nirujogi (1):
      drm/amd/amdgpu: Add GPIO resources required for amdisp

Prike Liang (1):
      drm/amdgpu: lock the eviction fence for wq signals it

Raag Jadav (1):
      drm/xe: drop redundant conversion to bool

Rob Clark (1):
      MAINTAINERS: .mailmap: update Rob Clark's email address

Rodrigo Vivi (2):
      drm/xe: Make xe_gt_freq part of the Documentation
      drm/xe: Add missing documentation of rpa_freq

Stanley.Yang (2):
      drm/amdgpu: Register aqua vanjaram vcn poison irq
      drm/amdgpu: Register aqua vanjaram jpeg poison irq

Sunday Clement (1):
      drm/amdkfd: Identical code for different branches

Thomas Hellstr=C3=B6m (1):
      drm/xe: Rework eviction rejection of bound external bos

Tvrtko Ursulin (2):
      drm/amdgpu: Make amdgpu_ctx_mgr_entity_fini static
      drm/amdgpu: Remove duplicated "context still alive" check

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1

Vitaly Prosyak (1):
      drm/amdgpu/gfx10: Refine Cleaner Shader for GFX10.1.10

Wayne Lin (1):
      drm/amd/display: Add a new dcdebugmask to allow skip detection LT

Wentao Liang (1):
      drm/amd/display: Add null pointer check for get_first_active_display(=
)

Xuemei Liu (1):
      drm/amdkfd: enable kfd on RISCV systems

Yifan Zhang (1):
      amd/amdkfd: fix a kfd_process ref leak

Zhongwei Zhang (2):
      drm/amd/display: Correct non-OLED pre_T11_delay.
      drm/amd/display: Avoid calling blank_stream() twice

ganglxie (2):
      drm/amdgpu: handle old RAS eeprom data in non-nps1 mode
      drm/amdgpu: Get mca address for old eeprom records

 .mailmap                                           |   5 +-
 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |  20 +-
 Documentation/gpu/xe/index.rst                     |   1 +
 Documentation/gpu/xe/xe_gt_freq.rst                |  14 +
 MAINTAINERS                                        |  11 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  75 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  23 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            | 148 +++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  17 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |   1 +
 .../gpu/drm/amd/amdgpu/gfx_v10_0_cleaner_shader.h  |   6 +-
 .../drm/amd/amdgpu/gfx_v10_1_10_cleaner_shader.asm |  13 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |  31 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  76 ++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |   7 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           | 182 ++++++++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.h           |  10 +
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  55 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  59 +++-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  21 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  21 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  19 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  20 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  20 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  81 +++++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.h            |   6 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  10 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  20 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            | 180 +++++++++-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.h            |   7 +
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |   2 +-
 drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c   |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   1 +
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |  11 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  39 +--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  11 +-
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c       |   8 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  10 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  26 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  24 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |  11 +-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |   1 +
 .../display/dc/link/protocols/link_dp_capability.c |   2 +-
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c |   2 +-
 .../drm/amd/display/dc/optc/dcn201/dcn201_optc.c   |   2 +-
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c |   2 +-
 .../drm/amd/display/dc/optc/dcn301/dcn301_optc.c   |   2 +-
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c |   2 +-
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.c   |   2 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |   2 +-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |   2 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |   2 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   4 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  34 +-
 .../amd/display/include/grph_object_ctrl_defs.h    |   2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |   3 +
 drivers/gpu/drm/amd/include/amd_shared.h           |  10 +-
 .../amd/include/asic_reg/dcn/dcn_4_1_0_offset.h    |  26 ++
 .../amd/include/asic_reg/dcn/dcn_4_1_0_sh_mask.h   |  16 +
 .../amd/include/asic_reg/vcn/vcn_5_0_0_offset.h    |   6 +
 .../amd/include/asic_reg/vcn/vcn_5_0_0_sh_mask.h   |  16 +
 drivers/gpu/drm/amd/include/atombios.h             |   4 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |   2 +-
 .../amd/include/ivsrcid/gfx/irqsrcs_gfx_11_0_0.h   |   1 +
 .../amd/include/ivsrcid/gfx/irqsrcs_gfx_12_0_0.h   |  74 ++++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  24 ++
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  54 +++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   3 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  14 +
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   6 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |  71 +++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 158 ++++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  67 ----
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  26 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  20 +-
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |  27 +-
 drivers/gpu/drm/i915/display/intel_audio.h         |   1 -
 drivers/gpu/drm/i915/display/intel_ddi.c           |   3 -
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   2 -
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |   4 +-
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c |  16 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  19 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c     |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |   2 +
 drivers/gpu/drm/panel/panel-novatek-nt37801.c      |   4 +-
 drivers/gpu/drm/radeon/atombios.h                  |   2 +-
 drivers/gpu/drm/radeon/kv_dpm.c                    |   2 +-
 drivers/gpu/drm/xe/Kconfig                         |   3 +-
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h           |  10 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |   4 -
 drivers/gpu/drm/xe/xe_bo.c                         |  48 ++-
 drivers/gpu/drm/xe/xe_device_sysfs.c               |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   4 +
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  15 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |  10 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |   5 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  11 +
 drivers/gpu/drm/xe/xe_hwmon.c                      | 388 +++++++++++++++--=
----
 drivers/gpu/drm/xe/xe_lrc.c                        |  23 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   5 +
 drivers/gpu/drm/xe/xe_pcode.c                      |  11 +
 drivers/gpu/drm/xe/xe_pcode.h                      |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h                  |   7 +
 drivers/gpu/drm/xe/xe_pxp.c                        |   8 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  27 +-
 drivers/gpu/drm/xe/xe_vm.h                         |  69 ++++
 drivers/gpu/drm/xe/xe_vm_types.h                   |   8 +
 include/uapi/drm/xe_drm.h                          |   5 +
 140 files changed, 2317 insertions(+), 641 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_gt_freq.rst
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/gfx/irqsrcs_gfx_12_=
0_0.h
