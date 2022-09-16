Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE075BA83D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 10:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC61E10ECE7;
	Fri, 16 Sep 2022 08:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DD810ECE7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 08:29:11 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so41357091fac.13
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 01:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date;
 bh=1RNulGWubi8dMQ7lPg3rkRZj8P2hPUB2/Vc/FMnavGg=;
 b=pCd4vz+hSVG4Enb3uOKwnCq739U7iV+qKlcw1dGx+YM9rP2WEgKmosGadoknCgE+dz
 KUwGhBC9fsygi8Npk3+VqGk74raA1MgoPHT2jJ09NVHZWNcFl5ON8X7kWttT1rmeNCi7
 Pb+UG3wtLSWUATBKgYgny/lzFkIqo5blyv6BU2RDC8gjiFycuYhfFdJtKXysyBs4ptLr
 hsa9IcTTIhU6KQDTWyYmp3Y+9SJTsD1hIr5SHylQxFW1gNiln6nMuQyMe62x16q6LVVT
 ZJ8nCsOk7HM5EvbVKrZJEazwoBZq1WsbCgGqUlgjo/IJPQxs9Vizl2A2gMzQMQGKQIjC
 bZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1RNulGWubi8dMQ7lPg3rkRZj8P2hPUB2/Vc/FMnavGg=;
 b=Urhn7H6EIOn/JdExERFaRIeVYjQOuWznyF61sZvWvcEKfDS7JoaT7vq/ovOOEskp34
 mzGS3uW7440jyi5rSXzBcNU6Uwx9YJ8dvSKyzqoiE6mwgkMzPflLnEZ2MKLWG28Fb88b
 TPHKb/wuFnMMbgCyZXc4QoyM8cPrS3rNfvUbgdTXZoDgWeWMfOF59giY/WS1pbuK2OYV
 fzGWa2gEtZvl6guU8z9hxWDefNsjmO/s3Xwxtq+zKyTn0N3HSzcfdgUaaFgYhrevTPuS
 /kPypoUMod33E+jX3g34GJp/BQw/VifyRMKKC42RQE2WxJVDcimDvKxYdoMEwCidMmZj
 pUaw==
X-Gm-Message-State: ACgBeo1t9j9d3hEGLUEsGI5swHNNvmaqYreFiLZ/zo7fQKY5zOwL3GuP
 7/tE0Knj468tsMHEE4u3OG+PB1KCMPnBy7qC6y8=
X-Google-Smtp-Source: AA6agR7dm0dtGPurkDerSJQC9K4DBTffEZKU3zy2BCs3hI+zQLe6W4iYEcWskuMwbV3UNoyw3vFaWyGVnCkcOKw8308=
X-Received: by 2002:a05:6870:2d1:b0:125:5519:1e4e with SMTP id
 r17-20020a05687002d100b0012555191e4emr7421653oaf.264.1663316950176; Fri, 16
 Sep 2022 01:29:10 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 16 Sep 2022 18:28:58 +1000
Message-ID: <CAPM=9tzoEUdzdhUsjh8jsuSta3Nv7zkH1-H7g4Oyi4_07zkO2w@mail.gmail.com>
Subject: [git pull] drm fixes for v6.0-rc6
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

This is the regular drm fixes pull, the i915 and misc fixes are fairly
regular, but the amdgpu contains fixes for new hw blocks, the dcn314
specific path hookups and also has a bunch of fixes for clang stack
size warnings which are a bit churny but fairly straightforward. This
means it looks a little larger than usual.

Dave.

drm-fixes-2022-09-16:
drm fixes for v6.0-rc6

amdgpu:
- BACO fixes for some RDNA2 boards
- PCI AER fixes uncovered by a core PCI change
- Properly hook up dirtyfb helper
- RAS fixes for GC 11.x
- TMR fix
- DCN 3.2.x fixes
- DCN 3.1.4 fixes
- LLVM DML stack size fixes

i915:
- Revert a display patch around max DP source rate now
  that the proper WaEdpLinkRateDataReload is in place
- Fix perf limit reasons bit position
- Fix unclaimmed mmio registers on suspend flow with GuC
- A vma_move_to_active fix for a regression with video decoding
- DP DSP fix

gma500:
- Locking and IRQ fixes

meson:
- OSD1 display fixes

panel-edp:
- Fix Innolux timings

rockchip:
- DP/HDMI fixes
The following changes since commit 80e78fcce86de0288793a0ef0f6acf37656ee4cf=
:

  Linux 6.0-rc5 (2022-09-11 16:22:01 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-09-16

for you to fetch changes up to 25100377a21ad40dae8be5a3ed361b87acec1479:

  Merge tag 'drm-intel-fixes-2022-09-15' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-09-16
17:49:54 +1000)

----------------------------------------------------------------
drm fixes for v6.0-rc6

amdgpu:
- BACO fixes for some RDNA2 boards
- PCI AER fixes uncovered by a core PCI change
- Properly hook up dirtyfb helper
- RAS fixes for GC 11.x
- TMR fix
- DCN 3.2.x fixes
- DCN 3.1.4 fixes
- LLVM DML stack size fixes

i915:
- Revert a display patch around max DP source rate now
  that the proper WaEdpLinkRateDataReload is in place
- Fix perf limit reasons bit position
- Fix unclaimmed mmio registers on suspend flow with GuC
- A vma_move_to_active fix for a regression with video decoding
- DP DSP fix

gma500:
- Locking and IRQ fixes

meson:
- OSD1 display fixes

panel-edp:
- Fix Innolux timings

rockchip:
- DP/HDMI fixes

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: add HDP remap functionality to nbio 7.7
      drm/amdgpu: move nbio ih_doorbell_range() into ih code for vega
      drm/amdgpu: move nbio sdma_doorbell_range() into sdma code for vega
      drm/amdgpu: make sure to init common IP before gmc

Alvin Lee (3):
      drm/amd/display: Update MBLK calculation for SubVP
      drm/amd/display: SW cursor fallback for SubVP
      drm/amd/display: Refactor SubVP calculation to remove FPU

Ankit Nautiyal (1):
      drm/i915/vdsc: Set VDSC PIC_HEIGHT before using for DP DSC

Aric Cyr (1):
      drm/amd/display: Fix divide by zero in DML

Ashutosh Dixit (1):
      drm/i915/gt: Fix perf limit reasons bit positions

Aurabindo Pillai (2):
      drm/amd/display: Revert "Fallback to SW cursor if SubVP + cursor too =
big"
      drm/amd/display: add workaround for subvp cursor corruption for DCN32=
/321

Candice Li (2):
      drm/amdgpu: Enable full reset when RAS is supported on gc v11_0_0
      drm/amdgpu: Skip reset error status for psp v13_0_0

Chen-Yu Tsai (1):
      drm/panel-edp: Fix delays for Innolux N116BCA-EA1

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.0-2022-09-14' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-09-15' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2022-09-15' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Duncan Ma (1):
      drm/amd/display: Correct dram channel width for dcn314

Guchun Chen (1):
      drm/amd/pm: disable BACO entry/exit completely on several sienna
cichlid cards

Hamza Mahfooz (1):
      drm/amdgpu: use dirty framebuffer helper

Hans de Goede (3):
      drm/gma500: Fix BUG: sleeping function called from invalid context er=
rors
      drm/gma500: Fix WARN_ON(lock->magic !=3D lock) error
      drm/gma500: Fix (vblank) IRQs not working after suspend/resume

Leo Chen (1):
      drm/amd/display: Fixing DIG FIFO Error

Lijo Lazar (1):
      drm/amdgpu: Don't enable LTR if not supported

Nathan Chancellor (5):
      drm/amd/display: Reduce number of arguments of
dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of
dml32_CalculatePrefetchSchedule()
      drm/amd/display: Reduce number of arguments of dml31's
CalculateWatermarksAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of dml31's
CalculateFlipSchedule()
      drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for
stack usage

Nathan Huckleberry (1):
      drm/rockchip: Fix return type of cdn_dp_connector_mode_valid

Nicholas Kazlauskas (2):
      drm/amd/display: Hook up DCN314 specific dml implementation
      drm/amd/display: Relax swizzle checks for video non-RGB formats on DC=
N314

Nirmoy Das (1):
      drm/i915: Set correct domains values at _i915_vma_move_to_active

Rodrigo Siqueira (2):
      drm/amd/display: Fix compilation errors on DCN314
      drm/amd/display: Enable dlg and vba compilation for dcn314

Sascha Hauer (1):
      drm/rockchip: vop2: Fix eDP/HDMI sync polarities

Stuart Menefy (2):
      drm/meson: Correct OSD1 global alpha value
      drm/meson: Fix OSD1 RGB to YCbCr coefficient

Taimur Hassan (1):
      drm/amd/display: Round cursor width up for MALL allocation

Umesh Nerlige Ramappa (1):
      drm/i915/guc: Cancel GuC engine busyness worker synchronously

Ville Syrj=C3=A4l=C3=A4 (1):
      Revert "drm/i915/display: Re-add check for low voltage sku for
max dp source rate"

Yang Wang (1):
      drm/amdgpu: change the alignment size of TMR BO to 1M

Yao Wang1 (1):
      drm/amd/display: Limit user regamma to a valid value

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |   9 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   5 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  25 --
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   4 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |   2 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  89 +++--
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |  24 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  24 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   4 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   3 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  59 ++-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   3 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   3 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c | 420 +++++------------=
----
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   5 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |  13 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c | 260 +++++--------
 .../dc/dml/dcn32/display_mode_vba_util_32.c        | 323 +++++++---------
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |  51 +--
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |  12 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |   1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |  10 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   1 +
 .../drm/amd/display/modules/color/color_gamma.c    |   4 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  11 +
 drivers/gpu/drm/gma500/cdv_device.c                |   4 +-
 drivers/gpu/drm/gma500/gem.c                       |   4 +-
 drivers/gpu/drm/gma500/gma_display.c               |  11 +-
 drivers/gpu/drm/gma500/oaktrail_device.c           |   5 +-
 drivers/gpu/drm/gma500/power.c                     |   8 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |   2 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |   5 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |  15 +-
 drivers/gpu/drm/gma500/psb_irq.h                   |   2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  33 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   7 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  16 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   3 +-
 drivers/gpu/drm/meson/meson_plane.c                |   2 +-
 drivers/gpu/drm/meson/meson_viu.c                  |   2 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   3 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   5 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   4 +
 59 files changed, 655 insertions(+), 908 deletions(-)
