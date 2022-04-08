Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A524F8A88
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 02:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B5C10EE62;
	Fri,  8 Apr 2022 00:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAF010EE62
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 00:20:00 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id l26so14164754ejx.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 17:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=OEfFn55gbDqKbc9HpvJE3VqxUyDc3LaLwgObK4V80Vs=;
 b=P3YbxkB2KhYufShgz9K7IpSbhcsOwL2t8LJqxbujlKlMtFY3SM2PBxW5uh5wWPvUGu
 flj167xp9RC0OOs3s4+G6cmcf9j99u27eEqVKcji/25iN2cdrFn+mB+/HjzaI4bjTctu
 fGX5tLJKDwvmjGJapiKcH978Oh0f+KpMF5thmG/F+iR5VOpayA8jHjikf00cWPxB3TaC
 +iul3rsdI7tnWbTh9fFrqD6GlmrdZqt+gjmxMxbBpnzrSytS7p+qZmiRZTksmEDqRY12
 dUqhqXxpURTtJQe+vM63zhhx5Y0sGj6qKrJzJe5gjxkaqNweZOlpZ9JWvUjb/2a1wM/I
 rmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=OEfFn55gbDqKbc9HpvJE3VqxUyDc3LaLwgObK4V80Vs=;
 b=mHEFQ7jTQ2rUh5YKJo40i4T7UfKO2o7B3tAQxRzWcRwc+EeOpBfc6Xt1IAZffhRCCA
 Ae6ykaSlvd4nPwLqHjxrFW4NjibBtLUH74yQ4kF/1jNn+wonDV8Von5C9EHzLz773qar
 6bKDvnh0+qDkhjNSO58XBmE4NZqfdxesdBBbmrXW+WnLIItgoHXY7AA4gBDg9Aam/x/V
 C1eWETsiSM3g0sEttpvkx/x0E6TDjBt+V3qlUjpoESp3PjT343Opq3O7nLZlH1xkAk7K
 69ZlFsplePcKb03fqlOVvcxgq5k/vSI1lO203VRJwH+fLsCSoF4OV+9ThAlX4CSqonHb
 BC5Q==
X-Gm-Message-State: AOAM5325tfhb9gjOzHMSJy0RqXo9qDTFYa1r3Gqar/2JwdLrRBs6m36G
 81KGkv7Y2xfrXf7aqJbbj+NPzQDZYvad/JeB7IJCrJ9X+FGowA==
X-Google-Smtp-Source: ABdhPJynJjzgNZU6wfLVYwGGfJC3sDgJTIIxHla6oyQ6RPfA/jARssdOI3rKR1KXaJLndspuQCgcERwdB63+Jf/byV4=
X-Received: by 2002:a17:906:478b:b0:6db:8b6e:d5de with SMTP id
 cw11-20020a170906478b00b006db8b6ed5demr16362566ejc.161.1649377198836; Thu, 07
 Apr 2022 17:19:58 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 8 Apr 2022 10:19:47 +1000
Message-ID: <CAPM=9tx5F2iOY6S4o2Rjk3uZG_M5Tso+=j3_gyQk-p3vj8tqew@mail.gmail.com>
Subject: [git pull] drm fixes for 5.18-rc2
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

Main set of fixes for rc2, mostly amdgpu, but some dma-fence fixups as
well, along with some other misc ones. I think this should fix the
amdgpu splat you have been seeing since rc1.

Regards,
Dave.

drm-fixes-2022-04-08:
drm fixes for 5.18-rc2

dma-fence:
- fix warning about fence containers
- fix logic error in new fence merge code
- handle empty dma_fence_arrays gracefully

bridge:
- Try all possible cases for bridge/panel detection.

bindings:
- Don't require input port for MIPI-DSI, and make width/height mandatory.

fbdev:
- Fix unregistering of framebuffers without device.

nouveau:
- Fix a crash when booting with nouveau on tegra.

amdgpu:
- GFX 10.3.7 fixes
- noretry updates
- VCN fixes
- TMDS fix
- zstate fix for freesync video
- DCN 3.1.5 fix
- Display stack size fix
- Audio fix
- DCN 3.1 pstate fix
- TMZ VCN fix
- APU passthrough fix
- Misc other fixes
- VCN 3.0 fixes
- Misc display fixes
- GC 10.3 golden register fix
- Suspend fix
- SMU 10 fix

amdkfd:
- Error handling fix
- xgmi p2p fix
- HWS VMIDs fix
- Event fix

panel:
- ili9341: Fix optional regulator handling

imx:
- Catch an EDID allocation failure in imx-ldb
- fix a leaked drm display mode on DT parsing error in parallel-display
- properly remove the dw_hdmi bridge in case the component_add fails
in dw_hdmi-imx
- fix the IPU clock frequency debug printout in ipu-di.
The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17=
:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-04-08

for you to fetch changes up to 88711fa9a14f6f473f4a7645155ca51386e36c21:

  Merge tag 'drm-misc-fixes-2022-04-07' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-04-08
09:22:16 +1000)

----------------------------------------------------------------
drm fixes for 5.18-rc2

dma-fence:
- fix warning about fence containers
- fix logic error in new fence merge code
- handle empty dma_fence_arrays gracefully

bridge:
- Try all possible cases for bridge/panel detection.

bindings:
- Don't require input port for MIPI-DSI, and make width/height mandatory.

fbdev:
- Fix unregistering of framebuffers without device.

nouveau:
- Fix a crash when booting with nouveau on tegra.

amdgpu:
- GFX 10.3.7 fixes
- noretry updates
- VCN fixes
- TMDS fix
- zstate fix for freesync video
- DCN 3.1.5 fix
- Display stack size fix
- Audio fix
- DCN 3.1 pstate fix
- TMZ VCN fix
- APU passthrough fix
- Misc other fixes
- VCN 3.0 fixes
- Misc display fixes
- GC 10.3 golden register fix
- Suspend fix
- SMU 10 fix

amdkfd:
- Error handling fix
- xgmi p2p fix
- HWS VMIDs fix
- Event fix

panel:
- ili9341: Fix optional regulator handling

imx:
- Catch an EDID allocation failure in imx-ldb
- fix a leaked drm display mode on DT parsing error in parallel-display
- properly remove the dw_hdmi bridge in case the component_add fails
in dw_hdmi-imx
- fix the IPU clock frequency debug printout in ipu-di.

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu/gmc: use PCI BARs for APUs in passthrough
      drm/amdgpu: add more cases to noretry=3D1
      drm/amdgpu: don't use BACO for reset in S3
      drm/amdgpu/smu10: fix SoC/fclk units in auto mode

Aurabindo Pillai (1):
      drm/amd: Add USBC connector ID

Benjamin Marty (1):
      drm/amdgpu/display: change pipe policy for DCN 2.1

Boyuan Zhang (1):
      drm/amdgpu/vcn3: send smu interface type

CHANDAN VURDIGERE NATARAJ (1):
      drm/amd/display: Fix by adding FPU protection for
dcn30_internal_validate_bw

Charlene Liu (3):
      drm/amd/display: fix audio format not updated after edid updated
      drm/amd/display: remove destructive verify link for TMDS
      drm/amd/display: Clear optc false state when disable otg

Chiawen Huang (1):
      drm/amd/display: FEC check in timing validation

Chris Park (1):
      drm/amd/display: Correct Slice reset calculation

Christian K=C3=B6nig (5):
      dma-buf: Add dma_fence_array_for_each (v2)
      dma-buf: add dma_fence_unwrap v2
      dma-buf/sync-file: fix warning about fence containers
      dma-buf/sync-file: fix logic error in new fence merge code
      dma-buf: handle empty dma_fence_arrays gracefully

Dan Carpenter (1):
      drm/amdgpu: fix off by one in amdgpu_gfx_kiq_acquire()

Daniel Mack (1):
      drm/panel: ili9341: fix optional regulator handling

Dave Airlie (6):
      Merge tag 'amd-drm-next-5.18-2022-03-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-03-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'imx-drm-fixes-2022-04-06' of
git://git.pengutronix.de/pza/linux into drm-fixes
      Merge tag 'amd-drm-fixes-5.18-2022-04-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-next-fixes-2022-04-07' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-misc-fixes-2022-04-07' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Divya Shikre (1):
      drm/amdkfd: Check use_xgmi_p2p before reporting hive_id

Dmytro Laktyushkin (1):
      drm/amd/display: update dcn315 clock table read

Emily Deng (1):
      drm/amdgpu/vcn: Fix the register setting for vcn1

Eric Bernstein (1):
      drm/amd/display: remove assert for odm transition case

Felix Kuehling (1):
      drm/amdgpu: set noretry=3D1 for GFX 10.3.4

Gabe Teeger (1):
      drm/amd/display: Add support for zstate during extended vblank

Guchun Chen (2):
      drm/amdgpu: prevent memory wipe in suspend/shutdown stage
      drm/amdgpu: conduct a proper cleanup of PDB bo

Jiasheng Jiang (1):
      drm/imx: imx-ldb: Check for null pointer after calling kmemdup

Jimmy Kizito (2):
      drm/amd/display: Add work around for AUX failure on wake.
      drm/amd/display: Add configuration options for AUX wake work around.

Jos=C3=A9 Exp=C3=B3sito (1):
      drm/imx: Fix memory leak in imx_pd_connector_get_modes

Karol Herbst (1):
      drm/nouveau/pmu: Add missing callbacks for Tegra devices

Lang Yu (1):
      drm/amdgpu: add workarounds for VCN TMZ issue on CHIP_RAVEN

Lee Jones (1):
      drm/amdkfd: Create file descriptor after client is added to
smi_clients list

Leo (Hanghong) Ma (1):
      drm/amd/display: Update VTEM Infopacket definition

Leo Ruan (1):
      gpu: ipu-v3: Fix dev_dbg frequency output

Liu Ying (1):
      drm/imx: dw_hdmi-imx: Fix bailout in error cases of probe

Ma Jun (1):
      drm/amdgpu: Sync up header and implementation to use the same
parameter names

Marek Vasut (1):
      dt-bindings: display: panel: mipi-dbi-spi: Make
width-mm/height-mm mandatory

Martin Leung (1):
      drm/amd/display: Revert FEC check in validation

Maxime Ripard (3):
      dt-bindings: display: bridge: Drop requirement on input port for
DSI devices
      Merge drm/drm-fixes into drm-misc-fixes
      Merge drm-misc/drm-misc-next-fixes into drm-misc-fixes

Nicholas Kazlauskas (1):
      drm/amd/display: Fix p-state allow debug index on dcn31

Oliver Logush (1):
      drm/amd/display: Add fSMC_MSG_SetDtbClk support

Paul Kocialkowski (1):
      drm: of: Properly try all possible cases for bridge/panel detection

Prike Liang (2):
      drm/amdgpu: set noretry for gfx 10.3.7
      drm/amdgpu/gfx10: enable gfx1037 clock counter retrieval function

QintaoShen (1):
      drm/amdkfd: Check for potential null return of kmalloc_array()

Rodrigo Siqueira (1):
      drm/amd/display: Reduce stack size

Roman Li (3):
      drm/amd/display: Remove redundant dsc power gating from init_hw
      drm/amd/display: Enable power gating before init_pipes
      drm/amd/display: Fix allocate_mst_payload assert on resume

Ruili Ji (1):
      drm/amdgpu: fix incorrect GCR_GENERAL_CNTL address

Shirish S (1):
      amd/display: set backlight only if required

Stanley.Yang (1):
      drm/amdgpu/pm: add asic smu support check

Thomas Zimmermann (1):
      fbdev: Fix unregistering of framebuffers without device

Tianci Yin (1):
      drm/amdgpu/vcn: improve vcn dpg stop procedure

Tushar Patel (1):
      drm/amdkfd: Fix Incorrect VMIDs passed to HWS

Yifan Zhang (2):
      drm/amdgpu/pm: fix the Stable pstate Test in amdgpu_test
      drm/amdgpu: set noretry=3D1 for gc 10.3.6

tiancyin (1):
      drm/amd/vcn: fix an error msg on vcn 3.0

 .../bindings/display/bridge/chipone,icn6211.yaml   |   1 -
 .../bindings/display/bridge/toshiba,tc358762.yaml  |   1 -
 .../bindings/display/panel/panel-mipi-dbi-spi.yaml |   2 +
 Documentation/driver-api/dma-buf.rst               |   6 +
 drivers/dma-buf/Makefile                           |   1 +
 drivers/dma-buf/dma-fence-array.c                  |  32 +++
 drivers/dma-buf/selftests.h                        |   1 +
 drivers/dma-buf/st-dma-fence-unwrap.c              | 261 +++++++++++++++++=
++++
 drivers/dma-buf/sync_file.c                        | 141 +++++------
 drivers/gpu/drm/amd/amdgpu/ObjectID.h              |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   7 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  71 ++++++
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |  24 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  10 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   6 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 107 +++++----
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |  19 +-
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.h |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  19 ++
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  65 +++++
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  23 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   2 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  20 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  12 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   1 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   5 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |   2 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |   8 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |  19 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |   5 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   3 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  18 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |  13 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   2 +
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   4 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   3 +
 .../amd/display/modules/info_packet/info_packet.c  |   5 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  17 ++
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |   2 +-
 drivers/gpu/drm/drm_of.c                           |  99 ++++----
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  |   8 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |   2 +
 drivers/gpu/drm/imx/parallel-display.c             |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c    |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c    |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |   4 +-
 drivers/gpu/ipu-v3/ipu-di.c                        |   5 +-
 drivers/video/fbdev/core/fbmem.c                   |   9 +-
 include/linux/dma-fence-array.h                    |  19 ++
 include/linux/dma-fence-chain.h                    |   2 +
 include/linux/dma-fence-unwrap.h                   |  95 ++++++++
 72 files changed, 1031 insertions(+), 252 deletions(-)
 create mode 100644 drivers/dma-buf/st-dma-fence-unwrap.c
 create mode 100644 include/linux/dma-fence-unwrap.h
