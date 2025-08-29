Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57BB3B138
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 04:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0453410E091;
	Fri, 29 Aug 2025 02:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B5oUUlFa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA27110E091
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 02:54:57 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-afec56519c8so263068166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 19:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756436096; x=1757040896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cMNW9MhFJRCCjOSMywpHld9A6F/p1aZ8kdLtZT+1mEg=;
 b=B5oUUlFaOJ6AfB5l6iefRY+7oiK5cf6TI7axVqTAAOmg4wwGl2/88HD2QFmPZtXdxm
 t8+f3cjmmF84YJzzq2res4TXcHy/+/GEgNr9Ubp2KURGSUf/UHxBDJBSgShL6EIeEEMI
 XZAhgxIygTj4Ky1EZweHh95UmgaO7febVjMmGYzBZ/jTfluXQg7Dw5d+X862qscfRvPa
 yYkhQwLgvYk9SnQP7hl+QcMznN3nQgNyPzM35VWsHyz2p10N/iCVdIrhNlPsbcWrLTc2
 WyaNuX2thVXstvuCDU91tyuFOAOdLmxda7hw6WaovyDYZH5GTY2O5/gelpvV80yaom0o
 8BlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756436096; x=1757040896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cMNW9MhFJRCCjOSMywpHld9A6F/p1aZ8kdLtZT+1mEg=;
 b=mq5W0TL3QTjHgA70iRLNF8XFnq2l6QvG4/3CJkppzRMHN8R+CYENVSAj8ZFxuKCzvg
 vU91NjLkFlLucHX30FlHYSsaKxBy+GbwuVirNa26j1LLJZ2xYWEUCoHoKoMZ/zoOXJmc
 TfdjDRe20JMvDogSxx+diXyfBUM4V/WUdWpBkh3zFeo1VH7hlFWAF9jGlBvKxmFw8Ags
 hhDqhNLDj8/G/gdy5PJacd4rxtngqTAXFdESkpR9CQub/YTYOcroCYHPPUc/1kO+ujYy
 w2OIg9xpEO+LpSlPX1ALWdm4ndrXir4P8DfpHc+VnVvbGVzL7fz47lJzBhB4QyOl2qSf
 NQMQ==
X-Gm-Message-State: AOJu0YwLy0QuO0+LJUbRyd9aIcrIQTnUi4lspybk6sNHuPRugxbUWWp4
 qOeWSKCRor/XVECA6UF6898cNyTzIOFAPyyV+2J5yCYtn8KM6XwUlnQHKniciDnMxU7JeZ8Dvti
 f/I/Cf9udvF/VhrNLwvE72XBFbBTe+XA=
X-Gm-Gg: ASbGnctZ6ph/l2YCfgbvgiEsmyCMmbM12zbd5OYoxfdijgRa+wSyPosrMTDQH7/6wyf
 ua1Vrf3/djFZpMAPIBtEy/TWpntsE3h3rIl8hLG5TiP+EcYwQcrzvlZR1yjT3Gzb4aK6fY0gU+a
 IhittnEVwWRZbDkOq0E028hrGqv5zZE9oIBbLv7o76UgcM3/iL+kdNMJwmwgJRfmzlQH5otAMzN
 G1r/A==
X-Google-Smtp-Source: AGHT+IEJoA5Nhwol6i78XrLBcR2p3ogVLwLojqqhCoAnzYfec9qnx6PAeBbzHGVhlb9xyNmYKlPoWieDpGYBV9AykL8=
X-Received: by 2002:a17:907:1b29:b0:afa:1b3f:37a2 with SMTP id
 a640c23a62f3a-afe295d2b84mr2356136766b.37.1756436095707; Thu, 28 Aug 2025
 19:54:55 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 Aug 2025 12:54:44 +1000
X-Gm-Features: Ac12FXy563hryqeT1S2ofzT_gvHguEpwfsRo4HRdU96vOspaekUo5nDW5Iz6fB8
Message-ID: <CAPM=9txr3jRk-+wk5J-raoWgYmeo5QRwBp0uCzLj67omDB13YQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
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

Weekly fixes, feels a bit big. The major piece is msm fixes, then the
usual amdgpu/xe along with some mediatek and nouveau fixes and a tegra
revert.

Dave.

drm-fixes-2025-08-29:
drm fixes for 6.16-rc4

gpuvm:
- fix some typos

xe:
- Fix user-fence race issue
- Couple xe_vm fixes
- Don't trigger rebind on initial dma-buf validation
- Fix a build issue related to basename() posix vs gnu discrepancy

amdgpu:
- pin buffers while vmapping
- UserQ fixes
- Revert CSA fix
- SR-IOV fix

nouveau:
- fix linear modifier
- remove some dead code

msm:
- Core/GPU:
  - fix comment doc warning in gpuvm
  - fix build with KMS disabled
  - fix pgtable setup/teardown race
  - global fault counter fix
  - various error path fixes
  - GPU devcoredump snapshot fixes
  - handle in-place VM_BIND remaps to solve turnip vm update race
  - skip re-emitting IBs for unusable VMs
  - Don't use %pK through printk
  - moved display snapshot init earlier, fixing a crash
- DPU:
  - Fixed crash in virtual plane checking code
  - Fixed mode comparison in virtual plane checking code
- DSI:
  - Adjusted width of resulution-related registers
  - Fixed locking issue on 14nm PLLs
- UBWC (per Bjorn's ack)
  - Added UBWC configuration for several missing platforms (fixing
    regression)

mediatek:
- Add error handling for old state CRTC in atomic_disable
- Fix DSI host and panel bridge pre-enable order
- Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
- mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

tegra:
- revert dma-buf change
The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00=
:

  Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-08-29

for you to fetch changes up to 42d2abbfa8c40299e047a9b3e5578fdd309dd2ff:

  Merge tag 'mediatek-drm-fixes-20250829' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes (2025-08-29 10:05:10 +1000)

----------------------------------------------------------------
drm fixes for 6.16-rc4

gpuvm:
- fix some typos

xe:
- Fix user-fence race issue
- Couple xe_vm fixes
- Don't trigger rebind on initial dma-buf validation
- Fix a build issue related to basename() posix vs gnu discrepancy

amdgpu:
- pin buffers while vmapping
- UserQ fixes
- Revert CSA fix
- SR-IOV fix

nouveau:
- fix linear modifier
- remove some dead code

msm:
- Core/GPU:
  - fix comment doc warning in gpuvm
  - fix build with KMS disabled
  - fix pgtable setup/teardown race
  - global fault counter fix
  - various error path fixes
  - GPU devcoredump snapshot fixes
  - handle in-place VM_BIND remaps to solve turnip vm update race
  - skip re-emitting IBs for unusable VMs
  - Don't use %pK through printk
  - moved display snapshot init earlier, fixing a crash
- DPU:
  - Fixed crash in virtual plane checking code
  - Fixed mode comparison in virtual plane checking code
- DSI:
  - Adjusted width of resulution-related registers
  - Fixed locking issue on 14nm PLLs
- UBWC (per Bjorn's ack)
  - Added UBWC configuration for several missing platforms (fixing
    regression)

mediatek:
- Add error handling for old state CRTC in atomic_disable
- Fix DSI host and panel bridge pre-enable order
- Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
- mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

tegra:
- revert dma-buf change

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu/gfx11: set MQD as appriopriate for queue types
      drm/amdgpu/gfx12: set MQD as appriopriate for queue types
      Revert "drm/amdgpu: fix incorrect vm flags to map bo"
      drm/amdgpu/userq: fix error handling of invalid doorbell

Alice Ryhl (1):
      drm/gpuvm: fix various typos in .c and .h gpuvm file

Antonino Maniscalco (1):
      drm/msm: skip re-emitting IBs for unusable VMs

Ayushi Makhija (1):
      drm/msm: update the high bitfield of certain DSI registers

Bagas Sanjaya (1):
      drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected usage in
literal code block

Carlos Llamas (1):
      drm/xe: switch to local xbasename() helper

Chenyuan Yang (1):
      drm/msm/dpu: Add a null ptr check for dpu_encoder_needs_modeset

Colin Ian King (1):
      drm/msm: Fix dereference of pointer minor before null check

Dave Airlie (5):
      Merge tag 'drm-xe-fixes-2025-08-27' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-08-28' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.17-2025-08-28' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-msm-fixes-2025-08-26' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'mediatek-drm-fixes-20250829' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes

Dmitry Baryshkov (8):
      drm/msm/kms: move snapshot init earlier in KMS init
      drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
      soc: qcom: ubwc: provide no-UBWC configuration
      dt-bindings: display/msm: qcom,mdp5: drop lut clock
      soc: qcom: ubwc: use no-uwbc config for MSM8917
      soc: qcom: ubwc: add more missing platforms
      soc: qcom: add configuration for MSM8929
      soc: qcom: use no-UBWC config for MSM8956/76

James Jones (1):
      drm/nouveau/disp: Always accept linear modifier

Jason-JH Lin (1):
      drm/mediatek: Add error handling for old state CRTC in atomic_disable

Jesse.Zhang (1):
      drm/amdgpu: update firmware version checks for user queue support

Loic Poulain (1):
      drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue

Louis-Alexis Eyraud (2):
      drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order
      drm/mediatek: mtk_hdmi: Fix inverted parameters in some
regmap_update_bits calls

Luca Weiss (1):
      soc: qcom: ubwc: Add missing UBWC config for SM7225

Ma Ke (1):
      drm/mediatek: Fix device/node reference count leaks in
mtk_drm_get_all_drm_priv

Matthew Brost (1):
      drm/xe: Don't trigger rebind on initial dma-buf validation

Ma=C3=ADra Canal (1):
      drm/msm: Update global fault counter when faulty process has already =
ended

Nathan Chancellor (1):
      drm/msm/dpu: Initialize crtc_state to NULL in
dpu_plane_virtual_atomic_check()

Rob Clark (15):
      drm/msm: Fix build with KMS disabled
      drm/msm: Fix pagetables setup/teardown serialization
      drm/msm: Fix refcnt underflow in error path
      drm/msm: Fix submit error path cleanup
      drm/msm: Defer fd_install in SUBMIT ioctl
      drm/msm: Defer fd_install in VM_BIND ioctl
      drm/msm: Add missing "location"s to devcoredump
      drm/msm: Fix section names and sizes
      drm/msm: Fix order of selector programming in cluster snapshot
      drm/msm: Constify snapshot tables
      drm/msm: Fix a7xx debugbus read
      drm/msm: Fix debugbus snapshot
      drm/msm: Fix a7xx TPL1 cluster snapshot
      drm/msm: Fix a few comments
      drm/msm: Handle in-place remaps

Sasha Levin (1):
      drm/msm: Fix objtool warning in submit_lock_objects()

Thomas Hellstr=C3=B6m (2):
      drm/xe/vm: Don't pin the vm_resv during validation
      drm/xe/vm: Clear the scratch_pt pointer on error

Thomas Wei=C3=9Fschuh (1):
      drm/msm: Don't use %pK through printk

Thomas Zimmermann (2):
      drm/amdgpu: Pin buffers while vmap'ing exported dma-buf objects
      Revert "drm/tegra: Use dma_buf from GEM object instance"

Timur Tabi (3):
      drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
      drm/nouveau: remove unused increment in gm200_flcn_pio_imem_wr
      drm/nouveau: remove unused memory target test

Yang Wang (1):
      drm/amd/amdgpu: disable hwmon power1_cap* for gfx 11.0.3 on vf mode

Zbigniew Kempczy=C5=84ski (1):
      drm/xe/xe_sync: avoid race during ufence signaling

 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        | 34 ++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             | 14 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  8 ++-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 18 ++---
 drivers/gpu/drm/drm_gpuvm.c                        | 80 +++++++++++-------=
----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 21 ++++--
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  6 ++
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  8 +--
 drivers/gpu/drm/mediatek/mtk_plane.c               |  3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 47 +++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 38 +++++-----
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 19 +++--
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 10 +--
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 34 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              | 59 +++++-----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 -
 drivers/gpu/drm/msm/msm_debugfs.c                  | 11 +--
 drivers/gpu/drm/msm/msm_gem.c                      | 13 +++-
 drivers/gpu/drm/msm/msm_gem.h                      |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               | 76 ++++++++++--------=
--
 drivers/gpu/drm/msm/msm_gem_vma.c                  | 60 ++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.c                      | 20 ++++--
 drivers/gpu/drm/msm/msm_iommu.c                    | 16 +++--
 drivers/gpu/drm/msm/msm_kms.c                      | 10 +--
 drivers/gpu/drm/msm/msm_mdss.c                     |  2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 14 +++-
 drivers/gpu/drm/msm/registers/display/dsi.xml      | 28 ++++----
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |  4 ++
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c        | 15 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c    |  5 +-
 drivers/gpu/drm/tegra/gem.c                        |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  8 +--
 drivers/gpu/drm/xe/xe_gen_wa_oob.c                 | 10 ++-
 drivers/gpu/drm/xe/xe_sync.c                       |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  8 ++-
 drivers/gpu/drm/xe/xe_vm.h                         | 15 +---
 drivers/soc/qcom/ubwc_config.c                     | 23 ++++++-
 include/drm/drm_gpuvm.h                            | 10 +--
 46 files changed, 467 insertions(+), 309 deletions(-)
