Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E836A8CB5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A8010E5A0;
	Thu,  2 Mar 2023 23:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BAD10E5A0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 23:08:12 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id da10so3458094edb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 15:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XBCcE4j+5QhHkdhXbZQDkqVeb3GW1AAcxnhgQP25R8s=;
 b=Ij6FjBwwmDQiMP3RzeeOqxPrWegfn2uo8PXnnoayhGe1muWEJOD2D55Ij09vATf1MV
 7PcAHwnrtUNxXUeg0qcuM+ykiM8F694aaJIT/NjBTZibHbaKbhYWqv+TayB4RBcmQSiw
 xCf+nizxgSeWe49pdZcwVUFRv6I2Wdk179PhcNbPfV0NhPckVuhbMmAJMjDjPFu9gOfN
 hu9tlHYEkjJ67YTGjSWvb4GUIkNYbTQEsQTpM2TLYS14rTOggXAO9TS/bu3W6M7CIp9U
 zgHFb0UEurpNiIg6KaW3XbIxjs/AMB3rT6Yeu5WeNp2HWg9e9pyE/tvVdBM0ZZm/AXgT
 M/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XBCcE4j+5QhHkdhXbZQDkqVeb3GW1AAcxnhgQP25R8s=;
 b=APmXcpi3nH1KEMLgzt1ycxoJ2a7mh4+CDA6HIVvSpxIoiLMuyTfecQIkW7RdlbOW4C
 RUcXUEWnCX9SILK7OmksuTb7ak7yxw1+xTRTCdbHk1ptU1MBvu3yw2UqkU1hA2TEnlnp
 z5s+KMRKWkadc803v6rV88J9GSsPsI7yEW//tcRLJp04UtFwpKDv0ivntnuD3Pu6DOyT
 4IbcHRxoA2+BZP0YA7Sm2WvLt37aDX44RHt6ArH8fzpAK6k2GwSoIswjtsLmRRNUaZ82
 /WFVCu+9BSAxHGmHgBP+zGC1B6Pn+of49srvV3ZkkP7rXVGrT3+V/qGwqM2Y7Yo2B4V2
 sB9A==
X-Gm-Message-State: AO0yUKU8JIwv/5t903uwDaj2y8Ignisu+qMkuph/zak3T9UocOkp6QCk
 uNXn2SD8Ab2gVZcgzlb+z8cXJ3PiNS+6PUTtUCafpXjZSvMKuw==
X-Google-Smtp-Source: AK7set+gPK0SD+pFdXNeswKd1DxolYCeR0d/AGJIEi8+muv0d+KMnSylYiN6rVSXJKDT5+UNvVrFHOPOhBsCXUSb3dY=
X-Received: by 2002:a17:906:3586:b0:895:58be:964 with SMTP id
 o6-20020a170906358600b0089558be0964mr6247318ejb.2.1677798490282; Thu, 02 Mar
 2023 15:08:10 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 Mar 2023 09:07:58 +1000
Message-ID: <CAPM=9tzkY1=9Lv4sejpcHTNbMcZWNgzYY6UdPFX4TZcU5g20Rw@mail.gmail.com>
Subject: [git pull] drm-next-fixes for 6.3-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This is the fixes for the last couple of weeks on top of the drm-next,
I don't think this contains any next content it should be all fixes.
amdgpu and i915 mostly, the amdgpu ones are bigger because it's two
weeks in one.

hopefully this week I got the subject line right.

Dave.

drm-next-2023-03-03-1:
drm-next-fixes for 6.3-rc1

fbdev:
- fix uninit var in error path

shmem:
- revert unGPLing an export

i915:
- Don't use stolen memory or BAR mappings for ring buffers with LLC
- Add inverted backlight quirk for HP 14-r206nv
- Fix GSI offset for MCR lookups
- GVT fixes (memleak, debugfs attributes, kconfig, typos)

amdgpu:
- SMU 13 fixes
- Enable TMZ for GC 10.3.6
- Misc display fixes
- Buddy allocator fixes
- GC 11 fixes
- S0ix fix
- INFO IOCTL queries for GC 11
- VCN harvest fixes for SR-IOV
- UMC 8.10 RAS fixes
- Don't restrict bpc to 8
- NBIO 7.5 fix
- Allow freesync on PCon for more devices

amdkfd:
- SDMA fix
- Illegal memory access fix
The following changes since commit a48bba98380cb0b43dcd01d276c7efc282e3c33f=
:

  msm/fbdev: fix unused variable warning with clang. (2023-02-23 09:48:05 +=
1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-03-03-1

for you to fetch changes up to 54ceb92724a8cf5294c284d5e9f770fc763cdab2:

  Merge tag 'amd-drm-fixes-6.3-2023-03-02' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-03-03
08:26:59 +1000)

----------------------------------------------------------------
drm-next-fixes for 6.3-rc1

fbdev:
- fix uninit var in error path

shmem:
- revert unGPLing an export

i915:
- Don't use stolen memory or BAR mappings for ring buffers with LLC
- Add inverted backlight quirk for HP 14-r206nv
- Fix GSI offset for MCR lookups
- GVT fixes (memleak, debugfs attributes, kconfig, typos)

amdgpu:
- SMU 13 fixes
- Enable TMZ for GC 10.3.6
- Misc display fixes
- Buddy allocator fixes
- GC 11 fixes
- S0ix fix
- INFO IOCTL queries for GC 11
- VCN harvest fixes for SR-IOV
- UMC 8.10 RAS fixes
- Don't restrict bpc to 8
- NBIO 7.5 fix
- Allow freesync on PCon for more devices

amdkfd:
- SDMA fix
- Illegal memory access fix

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: fix shift-out-of-bounds in CalculateVMAndRowBytes

Aric Cyr (1):
      Revert "drm/amd/display: Do not set DRR on pipe commit"

Asahi Lina (1):
      drm/shmem-helper: Revert accidental non-GPL export

Candice Li (3):
      drm/amdgpu: Add convert_error_address function for umc v8_10
      drm/amdgpu: Add ecc info query interface for umc v8_10
      drm/amdgpu: Make umc_v8_10_convert_error_address static and
remove unused variable

Colin Ian King (1):
      i915/gvt: Fix spelling mistake "vender" -> "vendor"

Dave Airlie (3):
      Merge tag 'drm-misc-next-fixes-2023-02-28' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-fixes-2023-02-27' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-fixes-6.3-2023-03-02' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Deepak R Varma (2):
      drm/i915/gvt: Avoid full proxy f_ops for debugfs attributes
      drm/i915/gvt: Remove extra semicolon

Evan Quan (2):
      drm/amd/pm: correct the baco state setting for ArmD3 scenario
      drm/amd/pm: no pptable resetup on runpm exiting

Greg Kroah-Hartman (1):
      i915: fix memory leak with using debugfs_lookup()

Guchun Chen (1):
      drm/amd/pm: downgrade log level upon SMU IF version mismatch

Hamza Mahfooz (1):
      drm/amd/display: only warn once in dce110_edp_wait_for_hpd_ready()

Harry Wentland (2):
      drm/amdgpu: Select DRM_DISPLAY_HDCP_HELPER in amdgpu
      drm/amd/display: Don't restrict bpc to 8 bpc

Hawking Zhang (1):
      drm/amdgpu: fix incorrect active rb bitmap for gfx11

Horatio Zhang (1):
      drm/amdgpu: fix ttm_bo calltrace warning in psp_hw_fini

Jane Jian (1):
      drm/amdgpu/vcn: set and use harvest config

Jani Nikula (1):
      Merge tag 'gvt-next-fixes-2023-02-23' of
https://github.com/intel/gvt-linux into drm-intel-next-fixes

Jesse Zhang (1):
      drm/amdgpu: add tmz support for GC 10.3.6

John Harrison (2):
      drm/i915: Don't use stolen memory for ring buffers with LLC
      drm/i915: Don't use BAR mappings for ring buffers with LLC

Kenneth Feng (1):
      drm/amd/pm: re-enable ac/dc on smu_v13_0_0/10

Marek Ol=C5=A1=C3=A1k (1):
      drm/amdgpu: add more fields into device info, caches sizes, etc.

Mario Limonciello (2):
      drm/amd: Don't allow s0ix on APUs older than Raven
      drm/amd: Fix initialization for nbio 7.5.1

Mark Hawrylak (1):
      drm/radeon: Fix eDP for single-display iMac11,2

Matt Roper (1):
      drm/i915/xelpmp: Consider GSI offset when doing MCR lookups

Mavroudis Chatzilaridis (1):
      drm/i915/quirks: Add inverted backlight quirk for HP 14-r206nv

Nathan Chancellor (1):
      drm: omapdrm: Do not use helper unininitialized in omap_fbdev_init()

Qu Huang (1):
      drm/amdkfd: Fix an illegal memory access

Randy Dunlap (1):
      drm/i915: move a Kconfig symbol to unbreak the menu presentation

Ruili Ji (1):
      drm/amdkfd: To fix sdma page fault issue for GC 11

Ryan Lin (1):
      drm/amd/display: Ext displays with dock can't recognized after resume

Shane Xiao (2):
      drm/amdgpu: remove TOPDOWN flags when allocating VRAM in large bar sy=
stem
      drm/amdgpu: optimize VRAM allocation when using drm buddy

Sung Joon Kim (1):
      drm/amd/display: Extend Freesync over PCon support for more devices

Tao Zhou (4):
      drm/amdgpu: add umc retire unit element
      drm/amdgpu: exclude duplicate pages from UMC RAS UE count
      drm/amdgpu: change default behavior of bad_page_threshold parameter
      drm/amdgpu: add bad_page_threshold check in ras_eeprom_check_err

Thomas Zimmermann (1):
      drm/msm: Fix possible uninitialized access in fbdev

Tom Rix (1):
      drm/amdgpu: remove unused variable ring

bobzhou (1):
      drm/amdgpu/vcn: fix compilation issue with legacy gcc

tiancyin (1):
      drm/amd/display: fix dm irq error message in gpu recover

 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  11 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  23 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  23 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  83 ++++++---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   3 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |   5 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             | 202 +++++++++++++++++=
----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  25 +--
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  15 +-
 drivers/gpu/drm/amd/display/Kconfig                |   1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  16 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   2 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   3 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   5 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.h   |   1 +
 .../display/dc/link/protocols/link_dp_capability.c |   2 -
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  15 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  25 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   1 +
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   2 +-
 drivers/gpu/drm/i915/Kconfig                       |   6 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |   5 +-
 drivers/gpu/drm/i915/gt/intel_ring.c               |   6 +-
 drivers/gpu/drm/i915/gvt/debugfs.c                 |  16 +-
 drivers/gpu/drm/i915/gvt/firmware.c                |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |   2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |   2 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |   2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |   2 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |   5 +-
 include/uapi/drm/amdgpu_drm.h                      |  11 ++
 50 files changed, 446 insertions(+), 149 deletions(-)
