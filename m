Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC10E74A85E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 03:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973D610E4E7;
	Fri,  7 Jul 2023 01:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FEC10E4E7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 01:15:03 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b703cbfaf5so21170511fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 18:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688692499; x=1691284499;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+RUjRABQIUIogF+XDLSUxLTnaEG058n3Ex5S+/JZCJ8=;
 b=JxuCg5NGGyKDdIOrsmgr+ATJPUy/RZi4vqkRnj4iHK1fAqW2LGmQXOElvff89pdn4b
 pLXZzoT1Q/E5O1eh8aNUOBRdn98laI0uLfwO/ygslUpdlYBl92dtBI5ARJSeR1wYtzNN
 qadKi+snlWtMM4KSBczjQryOzcocOGoVenmPdzy/B+a+0y9YBSYVZ7JQ35niajCi425v
 cjsixk/mWg/+jyF7wc+9lPB9AFGC36fR6wmQcb3FY2JBHuEpai6b9aucF4vK/nzWOQGC
 iUwF9fNLDzIwZiGL25OIASWN/qtshkmqccd8embJSLA+scyC/aIiqaJTkGR2YKEB5LXy
 ixMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688692499; x=1691284499;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+RUjRABQIUIogF+XDLSUxLTnaEG058n3Ex5S+/JZCJ8=;
 b=UyPzlTNTGn6iPL1zrgsQuH7wBPQviEl77xMn+cD5Jgwi09MKSwZ7ES+FtGj37N02yl
 sA+W7F+wy24RwcrwN2Egb1T8NJ681bAf5j9+6SmVLPa36HPEdKhXhCH7qRaEBMzBXUWb
 ktsOSRRy/fY6rFa9gi/i7l+z1ONKw9q9AW1yo+WhOQpKcw6BaPxbW/Q9wQEHcfvX3Sty
 HIDVHqljypgseW8tEQC3xKbmUmtJc5D5LS9MX8sasOnRq4nq2+8GKjpmLGiHl0TkvMdr
 8HUca8WZhjVFZYayho8UgWurvgIhGB/EJto44Fd166JBOadW9yG8CxgmAdYjcOYEP8+T
 aigA==
X-Gm-Message-State: ABy/qLb+vq08mcT6etu6AYOko1PpYnJDqdnN/f64tr5br9eGUrSBZfnb
 ptdjYleZ1xpb01WSZgsNBfMhM0Z0u7PgSW3zjus=
X-Google-Smtp-Source: APBJJlEH7DZ6wCqMvpCIDkERUqBREIKYdQ+fLfjQLjVv1r6H9oxjfHWiB471nZTA9xV58LR4zXSbPzPJklZZLf8zfc4=
X-Received: by 2002:a2e:6e15:0:b0:2b6:cd40:21ad with SMTP id
 j21-20020a2e6e15000000b002b6cd4021admr2519304ljc.37.1688692498533; Thu, 06
 Jul 2023 18:14:58 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Jul 2023 11:14:46 +1000
Message-ID: <CAPM=9twAjnoMTUAmm42=hmAtbPuqmMzDgOFDA4zGK2BuD0g2DQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.5-rc1
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

Lots of fixes, mostly i915 and amdgpu. It's 2 weeks of i915, and I
think 3 weeks of amdgpu.

Dave.

drm-next-2023-07-07:
drm fixes for 6.5-rc1

fbdev:
- Fix module infos on sparc

panel:
- Fix mode on Starry-ili9882t

i915:
- Allow DC states along with PW2 only for PWB functionality [adlp+]
- Fix SSC selection for MPLLA [mtl]
- Use hw.adjusted mode when calculating io/fast wake times [psr]
- Apply min softlimit correctly [guc/slpc]
- Assign correct hdcp content type [hdcp]
- Add missing forward declarations/includes to display power headers
- Fix BDW PSR AUX CH data register offsets [psr]
- Use mock device info for creating mock device

amdgpu:
- Misc cleanups
- GFX 9.4.3 fixes
- DEBUGFS build fix
- Fix LPDDR5 reporting
- ASPM fixes
- DCN 3.1.4 fixes
- DP MST fixes
- DCN 3.2.x fixes
- Display PSR TCON fixes
- SMU 13.x fixes
- RAS fixes
- Vega12/20 SMU fixes
- PSP flashing cleanup
- GFX9 MCBP fixes
- SR-IOV fixes
- GPUVM clear mappings fix for always valid BOs
- Add FAMS quirk for problematic monitor
- Fix possible UAF
- Better handle momentary temperature fluctuations
- SDMA 4.4.2 fixes
- Fencing fix
The following changes since commit 5ff2977b19769fd24b0cfbe7cbe4d5114b6106af=
:

  Merge tag 'drm-intel-next-fixes-2023-06-21' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-06-29
06:25:26 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-07-07

for you to fetch changes up to 6725f33228077902ddac2a05e0ab361dee36e4ba:

  Merge tag 'drm-misc-next-fixes-2023-07-06' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-07-07
11:05:16 +1000)

----------------------------------------------------------------
drm fixes for 6.5-rc1

fbdev:
- Fix module infos on sparc

panel:
- Fix mode on Starry-ili9882t

i915:
- Allow DC states along with PW2 only for PWB functionality [adlp+]
- Fix SSC selection for MPLLA [mtl]
- Use hw.adjusted mode when calculating io/fast wake times [psr]
- Apply min softlimit correctly [guc/slpc]
- Assign correct hdcp content type [hdcp]
- Add missing forward declarations/includes to display power headers
- Fix BDW PSR AUX CH data register offsets [psr]
- Use mock device info for creating mock device

amdgpu:
- Misc cleanups
- GFX 9.4.3 fixes
- DEBUGFS build fix
- Fix LPDDR5 reporting
- ASPM fixes
- DCN 3.1.4 fixes
- DP MST fixes
- DCN 3.2.x fixes
- Display PSR TCON fixes
- SMU 13.x fixes
- RAS fixes
- Vega12/20 SMU fixes
- PSP flashing cleanup
- GFX9 MCBP fixes
- SR-IOV fixes
- GPUVM clear mappings fix for always valid BOs
- Add FAMS quirk for problematic monitor
- Fix possible UAF
- Better handle monentary temperature fluctuations
- SDMA 4.4.2 fixes
- Fencing fix

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/atomfirmware: fix LPDDR5 width reporting
      drm/amdgpu: make mcbp a per device setting
      drm/amdgpu: enable mcbp by default on gfx9

Alex Sierra (1):
      drm/amdkfd: set coherent host access capability flag

Alvin Lee (7):
      drm/amd/display: Fix pipe check condition for manual trigger
      drm/amd/display: Clear update flags at end of flip
      drm/amd/display: enable the new fast update path for supported ASICs
      drm/amd/display: Enable dc mode clock switching for DCN32x
      drm/amd/display: Limit new fast update path to addr and gamma / color
      drm/amd/display: For new fast update path, loop through each surface
      drm/amd/display: Take full update path if number of planes changed

Aric Cyr (2):
      drm/amd/display: 3.2.240
      drm/amd/display: 3.2.241

Aurabindo Pillai (1):
      drm/amd/display: Add monitor specific edid quirk

Austin Zheng (3):
      drm/amd/display: Add Clock Table Entry With Max DC Values
      drm/amd/display: Disable DC Mode Capping On DCN321
      drm/amd/display: Remove Phantom Pipe Check When Calculating K1 and K2

Christian K=C3=B6nig (1):
      drm/amdgpu: fix number of fence calculations

Cong Yang (1):
      drm/panel: Fine tune Starry-ili9882t panel HFP and HBP

Daniel Miess (4):
      drm/amd/display: disable power gating for DCN314
      drm/amd/display: disable RCO for DCN314
      Revert "drm/amd/display: Move DCN314 DOMAIN power control to DMCUB"
      Partially revert "drm/amd/display: Fix possible underflow for
displays with large vblank"

Dave Airlie (5):
      Merge tag 'drm-misc-next-fixes-2023-06-29' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-fixes-2023-06-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-fixes-6.5-2023-06-30-1' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2023-07-06' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-fixes-2023-07-06' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next

Dmytro Laktyushkin (1):
      drm/amd/display: fix odm k2 div calculation

Emily Deng (1):
      drm/amdgpu/vcn: Need to unpause dpg before stop dpg

Evan Quan (5):
      drm/amd/pm: revise the ASPM settings for thunderbolt attached scenari=
o
      drm/amd/pm: update the LC_L1_INACTIVITY setting to address
possible noise issue
      drm/amd/pm: fulfill the missing enablement for vega12/vega20 L2H
and H2L interrupts
      drm/amd/pm: expose swctf threshold setting for legacy powerplay
      drm/amd/pm: avoid unintentional shutdown due to temperature
momentary fluctuation

Fangzhi Zuo (1):
      drm/amd/display: Add MST Preferred Link Setting Entry

Gianna Binder (1):
      drm/amd/display: Create debugging mechanism for Gaming FAMS

Hamza Mahfooz (1):
      drm/amd/display: perform a bounds check before filling dirty rectangl=
es

Harry Wentland (1):
      drm/amd/display: Fix the delta clamping for shaper LUT

Hersen Wu (1):
      Revert "drm/amd/display: edp do not add non-edid timings"

Hong-lu Cheng (1):
      drm/amd/display: Remove asserts

Ilya Bakoulin (2):
      drm/amd/display: Fix 128b132b link loss handling
      drm/amd/display: Work around bad DPCD state on link loss

Imre Deak (2):
      drm/i915/adlp+: Allow DC states along with PW2 only for PWB functiona=
lity
      drm/i915: Add missing forward declarations/includes to display
power headers

James Zhu (1):
      drm/amdgpu: share drm device for pci amdgpu device with 1st
partition device

Jani Nikula (1):
      drm/i915: use mock device info for creating mock device

Jiadong Zhu (1):
      drm/amdgpu: Skip mark offset for high priority rings

Jouni H=C3=B6gander (1):
      drm/i915/psr: Use hw.adjusted mode when calculating io/fast wake time=
s

Kenneth Feng (1):
      drm/amd/pm: add abnormal fan detection for smu 13.0.0

Le Ma (1):
      drm/amdgpu: remove duplicated doorbell range init for sdma v4.4.2

Leo Chen (1):
      drm/amd/display: disable seamless boot if force_odm_combine is enable=
d

Lijo Lazar (7):
      drm/amdgpu: Move calculation of xcp per memory node
      drm/amdgpu: Add vbios attribute only if supported
      drm/amdgpu: Modify for_each_inst macro
      drm/amd/pm: Provide energy data in 15.625mJ units
      drm/amd/pm: Enable pp_feature attribute
      drm/amd/pm: Add GFX v9.4.3 unique id to sysfs
      drm/amdgpu: Keep non-psp path for partition switch

Mangesh Gadre (1):
      drm/amdgpu:Remove sdma halt/unhalt during frontdoor load

Mario Limonciello (7):
      drm/amd: Disable PSR-SU on Parade 0803 TCON
      drm/amd: Don't try to enable secure display TA multiple times
      drm/amd/display: Correct `DMUB_FW_VERSION` macro
      drm/amd/display: Set minimum requirement for using PSR-SU on Rembrand=
t
      drm/amd/display: Set minimum requirement for using PSR-SU on Phoenix
      Revert "drm/amd: Disable PSR-SU on Parade 0803 TCON"
      drm/amd: Don't initialize PSP twice for Navi3x

Melissa Wen (1):
      drm/amd/display: program DPP shaper and 3D LUT if updated

Mingtong Bao (1):
      drm/amd/pm: remove unneeded variable

Mukul Joshi (2):
      drm/amdkfd: Enable GWS on GFX9.4.3
      drm/amdkfd: Update interrupt handling for GFX 9.4.3

Nathan Chancellor (2):
      drm/amdgpu: Remove CONFIG_DEBUG_FS guard around body of
amdgpu_rap_debugfs_init()
      drm/amdgpu: Move clocks closer to its only usage in
amdgpu_parse_cg_state()

Radhakrishna Sripada (1):
      drm/i915/mtl: Fix SSC selection for MPLLA

Samuel Pitoiset (1):
      drm/amdgpu: fix clearing mappings for BOs that are always valid in VM

Sridevi Arvindekar (1):
      drm/amd/display: add missing ABM registers

Sung-huai Wang (1):
      drm/amd/display: add a NULL pointer check

Suraj Kandpal (1):
      drm/i915/hdcp: Assign correct hdcp content type

Tao Zhou (1):
      drm/amdgpu: check RAS irq existence for VCN/JPEG

Thomas Zimmermann (1):
      arch/sparc: Add module license and description for fbdev helpers

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/psr: Fix BDW PSR AUX CH data register offsets

Vinay Belgaumkar (1):
      drm/i915/guc/slpc: Apply min softlimit correctly

Wang Ming (1):
      amd/display/dc: remove repeating expression

Xiaogang Chen (1):
      drm/amdgpu: remove vm sanity check from amdgpu_vm_make_compute

YiPeng Chai (1):
      drm/amdgpu: gpu recovers from fatal error in poison mode

Zhigang Luo (2):
      drm/amdgpu: Skip TMR for MP0_HWIP 13.0.6
      drm/amdgpu: port SRIOV VF missed changes

shanzhulig (1):
      drm/amdgpu: Fix potential fence use-after-free v2

 arch/sparc/video/fbdev.c                           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |   9 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  18 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  17 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  29 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c            |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  11 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  24 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  43 +++++-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |  13 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  18 +--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  44 +++++-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |  29 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   9 ++
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  35 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   4 +
 drivers/gpu/drm/amd/amdkfd/soc15_int.h             |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  21 +--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 156 +++++++++++++++++=
+++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  26 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   3 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  43 +++++-
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 141 +++++++++++++++++=
+-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  16 ++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   7 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |  29 +++-
 .../drm/amd/display/dc/dce112/dce112_resource.c    |  10 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c |  19 ++-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h |   1 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  11 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   6 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   3 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   1 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |  30 +---
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |   4 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |   2 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  15 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |   1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  18 +--
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   2 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   3 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   3 +
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |  16 ++-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  90 +++++++++++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |   4 -
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c | 102 ++++++++++++--
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.h |   4 -
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   1 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |   2 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |  37 ++++-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   5 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |   2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.c |   5 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.h |   2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  11 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  81 +++++------
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   2 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  48 +++++++
 .../drm/amd/pm/powerplay/hwmgr/hardwaremanager.c   |   4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   2 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c    |  27 ++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  10 ++
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |   4 +
 .../drm/amd/pm/powerplay/hwmgr/vega12_thermal.c    |   4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   4 +
 .../drm/amd/pm/powerplay/hwmgr/vega20_thermal.c    |   4 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |   2 +
 drivers/gpu/drm/amd/pm/powerplay/inc/power_state.h |   1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  34 +++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   9 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   3 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |   4 +
 .../gpu/drm/i915/display/intel_display_power_map.c |  16 +--
 .../drm/i915/display/intel_display_power_well.h    |   2 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |   2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |  45 +++---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   6 +-
 114 files changed, 1252 insertions(+), 349 deletions(-)
