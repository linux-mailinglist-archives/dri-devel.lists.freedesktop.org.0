Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992A1800414
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 07:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5071410E7EA;
	Fri,  1 Dec 2023 06:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E5510E7EA
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 06:41:52 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a186e5d1056so219914166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 22:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701412911; x=1702017711; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BGiULZCMsXRK1ppC1GgvB6IlEzYsQ+E/lUmA1jkmn7Q=;
 b=a0OXfUl6ggZZZxsr/BeztSEA7AkTvxd+SK+gtrE2ZLZSHWatQpeGG1KuTMJNHfr/cl
 s2+MxVOwmKdZKRRWfLyg5jCdb/Ii+/Dqx512OQS83nCNKJx+tQqcyxxSaOpLRfovfz2b
 Zj/A7rEFGBaOLCRilhhiX5I7wEALvSYtgjAcm06tEMDLudqfsgnQ0GaKs7jroafRx55D
 Qsa5VvkOkanfdtts28dt4JgiaZaZehdxONyi61xBJVWE6F+eGBJahIdrxGioRXPiQALK
 ghYWCGz/maRxzBIP9gZLmvhM37O7F/aimayl+LCu88L7MsdAp4nIs7hFAIheuN0NjFLR
 vq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701412911; x=1702017711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BGiULZCMsXRK1ppC1GgvB6IlEzYsQ+E/lUmA1jkmn7Q=;
 b=BUOPF2DbjeUhDGpiFnNWeIO9CgeXU+6MlgCPRZGaPwKxmabrXwqOfCphGLx5tU9lr8
 0JpYYsltNXdCx0cQ5Zq/O+eBnbSKjE2aFnAYHKFi579yUBjKgGsthzKrUSnoKoTwMtc9
 u3MxaEVam//x1GILRcqZgvThtL+9o5pgVjkJH5Muk711W4B8nY0hTCeLpYV5BPhC98+L
 T3AJVr6vM6VM6DnjUtt99SQir/QpAcaTwgzvCX+D+5uAH1Jn1IJnFJNMOqa7prErB4nk
 tInYYxzzq1U2DDWZ+38Gs6pZ2XjRNc7K5aGynbZrt7M1B95iiLsQdn6Zu1NsWPRQFXXU
 A2ig==
X-Gm-Message-State: AOJu0Yx0CyHDJQo4XucevJBVpnIPRnU420viFOv/YXe+qSC+vHYaiwBD
 ncE5ujGTvdYEm3yTsYTeUZkdYSjTHcXbKGy3FXU=
X-Google-Smtp-Source: AGHT+IHu38PXHtB2ywF8EXnvktRiaqAlUdYWzYlkXFgMSOQBy7zEfYvl6xPXeGy2Jwsxobea9U+NnNpVnVBKUZb0Yu8=
X-Received: by 2002:a17:906:dcb:b0:a18:3eb2:3502 with SMTP id
 p11-20020a1709060dcb00b00a183eb23502mr476499eji.62.1701412910865; Thu, 30 Nov
 2023 22:41:50 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 1 Dec 2023 16:41:39 +1000
Message-ID: <CAPM=9txF5xvm3uRK0jiW-Zzg+wA7q0+ee-nx2NexJC1LM_6g4Q@mail.gmail.com>
Subject: [git pull] drm fixes for 6.7-rc4
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

Weekly fixes, mostly amdgpu fixes with a scattering of nouveau, i915,
and a couple of reverts. Hopefully it will quieten down in coming
weeks.

Regards,
Dave.

drm-fixes-2023-12-01:
drm fixes for 6.7-rc4

drm:
- Revert unexport of prime helpers for fd/handle conversion

dma_resv:
- Do not double add fences in dma_resv_add_fence.

gpuvm:
- Fix GPUVM license identifier.

i915:
- Mark internal GSC engine with reserved uabi class
- Take VGA converters into account in eDP probe
- Fix intel_pre_plane_updates() call to ensure workarounds get applied

panel:
- Revert panel fixes as they require exporting device_is_dependent.

nouveau:
- fix oversized allocations in new vm path
- fix zero-length array
- remove a stray lock

nt36523:
- Fix error check for nt36523.

amdgpu:
- DMUB fix
- DCN 3.5 fixes
- XGMI fix
- DCN 3.2 fixes
- Vangogh suspend fix
- NBIO 7.9 fix
- GFX11 golden register fix
- Backlight fix
- NBIO 7.11 fix
- IB test overflow fix
- DCN 3.1.4 fixes
- fix a runtime pm ref count
- Retimer fix
- ABM fix
- DCN 3.1.5 fix
- Fix AGP addressing
- Fix possible memory leak in SMU error path
- Make sure PME is enabled in D3
- Fix possible NULL pointer dereference in debugfs
- EEPROM fix
- GC 9.4.3 fix

amdkfd:
- IP version check fix
- Fix memory leak in pqm_uninit()
The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab=
:

  Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-12-01

for you to fetch changes up to 908f60642441cb4f9f0e1eb576e63b0011d318b9:

  Merge tag 'amd-drm-fixes-6.7-2023-11-30' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-12-01
13:57:11 +1000)

----------------------------------------------------------------
drm fixes for 6.7-rc4

drm:
- Revert unexport of prime helpers for fd/handle conversion

dma_resv:
- Do not double add fences in dma_resv_add_fence.

gpuvm:
- Fix GPUVM license identifier.

i915:
- Mark internal GSC engine with reserved uabi class
- Take VGA converters into account in eDP probe
- Fix intel_pre_plane_updates() call to ensure workarounds get applied

panel:
- Revert panel fixes as they require exporting device_is_dependent.

nouveau:
- fix oversized allocations in new vm path
- fix zero-length array
- remove a stray lock

nt36523:
- Fix error check for nt36523.

amdgpu:
- DMUB fix
- DCN 3.5 fixes
- XGMI fix
- DCN 3.2 fixes
- Vangogh suspend fix
- NBIO 7.9 fix
- GFX11 golden register fix
- Backlight fix
- NBIO 7.11 fix
- IB test overflow fix
- DCN 3.1.4 fixes
- fix a runtime pm ref count
- Retimer fix
- ABM fix
- DCN 3.1.5 fix
- Fix AGP addressing
- Fix possible memory leak in SMU error path
- Make sure PME is enabled in D3
- Fix possible NULL pointer dereference in debugfs
- EEPROM fix
- GC 9.4.3 fix

amdkfd:
- IP version check fix
- Fix memory leak in pqm_uninit()

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: fix AGP addressing when GART is not at 0

Alex Sierra (1):
      drm/amdgpu: Force order between a read and write to the same address

Alvin Lee (3):
      drm/amd/display: Include udelay when waiting for INBOX0 ACK
      drm/amd/display: Use DRAM speed from validation for dummy p-state
      drm/amd/display: Increase num voltage states to 40

Camille Cho (1):
      drm/amd/display: Simplify brightness initialization

Candice Li (1):
      drm/amdgpu: Update EEPROM I2C address for smu v13_0_0

Christian K=C3=B6nig (1):
      dma-buf: fix check in dma_resv_add_fence

Dan Carpenter (1):
      nouveau/gsp/r535: remove a stray unlock in r535_gsp_rpc_send()

Dave Airlie (4):
      nouveau: find the smallest page allocation to cover a buffer alloc.
      Merge tag 'drm-intel-fixes-2023-11-30' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2023-11-29' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'amd-drm-fixes-6.7-2023-11-30' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Dinghao Liu (1):
      drm/amd/pm: fix a memleak in aldebaran_tables_init

Dmytro Laktyushkin (1):
      drm/amd/display: update dcn315 lpddr pstate latency

Felix Kuehling (1):
      Revert "drm/prime: Unexport helpers for fd/handle conversion"

Gustavo A. R. Silva (1):
      nouveau/gsp: replace zero-length array with flex-array member
and use __counted_by

Hamza Mahfooz (1):
      drm/amd/display: fix ABM disablement

Hawking Zhang (1):
      drm/amdgpu: Do not issue gpu reset from nbio v7_9 bif interrupt

Ilya Bakoulin (1):
      drm/amd/display: Fix MPCC 1DLUT programming

Jonathan Kim (1):
      drm/amdgpu: update xgmi num links info post gc9.4.2

Li Ma (1):
      drm/amdgpu: add init_registers for nbio v7.11

Lijo Lazar (1):
      drm/amdgpu: Use another offset for GC 9.4.3 remap

Linus Walleij (3):
      Revert "drm/bridge: panel: Check device dependency before
managing device link"
      Revert "driver core: Export device_is_dependent() to modules"
      Revert "drm/bridge: panel: Add a device link between drm device
and panel device"

Liu Ying (2):
      drm/bridge: panel: Check device dependency before managing device lin=
k
      driver core: Export device_is_dependent() to modules

Lu Yao (1):
      drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes kernel null point=
er

Mario Limonciello (1):
      drm/amd: Enable PCIe PME from D3

Michael Strauss (1):
      drm/amd/display: Do not read DPREFCLK spread info from LUT on DCN35

Mukul Joshi (1):
      drm/amdkfd: Use common function for IP version check

Nicholas Kazlauskas (8):
      drm/amd/display: Add z-state support policy for dcn35
      drm/amd/display: Update DCN35 watermarks
      drm/amd/display: Add Z8 watermarks for DML2 bbox overrides
      drm/amd/display: Feed SR and Z8 watermarks into DML2 for DCN35
      drm/amd/display: Remove min_dst_y_next_start check for Z8
      drm/amd/display: Update min Z8 residency time to 2100 for DCN314
      drm/amd/display: Update DCN35 clock table policy
      drm/amd/display: Allow DTBCLK disable for DCN35

Perry Yuan (1):
      drm/amdgpu: optimize RLC powerdown notification on Vangogh

Prike Liang (1):
      drm/amdgpu: correct the amdgpu runtime dereference usage count

Sung Joon Kim (1):
      drm/amd/display: Fix black screen on video playback with embedded pan=
el

Taimur Hassan (3):
      drm/amd/display: Remove config update
      drm/amd/display: Fix conversions between bytes and KB
      drm/amd/display: Fix some HostVM parameters in DML

Thomas Hellstr=C3=B6m (1):
      drm/gpuvm: Fix deprecated license identifier

Tim Huang (1):
      drm/amdgpu: fix memory overflow in the IB test

Tvrtko Ursulin (1):
      drm/i915/gsc: Mark internal GSC engine with reserved uabi class

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915: Also check for VGA converter in eDP probe
      drm/i915: Call intel_pre_plane_updates() also for pipes getting enabl=
ed

Wenjing Liu (1):
      drm/amd/display: fix a pipe mapping error in dcn32_fpu

Yang Yingliang (1):
      drm/panel: nt36523: fix return value check in nt36523_probe()

ZhenGuo Yin (1):
      drm/amdkfd: Free gang_ctx_bo and wptr_bo in pqm_uninit

Zhongwei (1):
      drm/amd/display: force toggle rate wa for first link training
for a retimer

xiazhengqiao (1):
      drm/panel: starry-2081101qfh032011-53g: Fine tune the panel power seq=
uence

 drivers/dma-buf/dma-resv.c                         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |  18 +--
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   5 -
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   5 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  54 ++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   8 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   8 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   | 159 ++++++++++-------=
----
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   4 -
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c   |  10 ++
 .../gpu/drm/amd/display/dc/dcn35/dcn35_resource.c  |   9 +-
 drivers/gpu/drm/amd/display/dc/dml/dc_features.h   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  15 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  23 +--
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  84 ++++++++++-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h   |   2 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    |  16 +--
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  60 +++++---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   2 +
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   6 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   3 +-
 .../link_dp_training_fixed_vs_pe_retimer.c         |   6 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  16 +--
 .../dc/link/protocols/link_edp_panel_control.h     |   1 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   1 +
 .../drm/amd/include/asic_reg/gc/gc_11_0_0_offset.h |   2 +
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |   2 +
 .../include/asic_reg/nbio/nbio_7_11_0_sh_mask.h    |  29 ++++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  18 +++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  10 ++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   5 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |   1 +
 drivers/gpu/drm/bridge/panel.c                     |  17 ---
 drivers/gpu/drm/drm_gpuvm.c                        |   2 +-
 drivers/gpu/drm/drm_prime.c                        |  33 +++--
 drivers/gpu/drm/i915/display/intel_display.c       |   3 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  28 +++-
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |  39 ++---
 .../nvrm/535.113.01/nvidia/generated/g_os_nvoc.h   |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |   6 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |   4 +-
 include/drm/drm_gpuvm.h                            |   2 +-
 include/drm/drm_prime.h                            |   7 +
 include/linux/dma-fence.h                          |  15 ++
 67 files changed, 537 insertions(+), 302 deletions(-)
