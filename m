Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4F85E73AC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 08:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B6B10E3C9;
	Fri, 23 Sep 2022 06:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC6910E3C9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 06:08:31 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id r125so15189583oia.8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 23:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date;
 bh=XZQMWHcfgA4I7IFCR/7AEyj1oh5t44aMjK+F5c/EAE4=;
 b=nEHqjM3c5qbgoB+/srDC9Z7l8TCX68hpX+QCJ5Of0AYw29yFPBrnhKQq4hNQkQNrja
 XxKr3LtIU0pgxXzvLRslOG08AP8k+n9LpinpLrd49nxUO396Z86+CT6oSwEs0uYQ8WCt
 SQ6jEZcveE7ozUH2Hu9Dq9203O84Ni+DyEQJvw+Dx3Xw1so8XN/z/JVPNkaASPo5KZB1
 Gs49AahIOqKBjBa8GHGNqdzk2f4YBrrREMiEp8n/X5T9NVjw7UdSWF+Rogdv3g4xn6uM
 Q47gDgByFB/MjVqVnpa3gke0dXqylLZGYj95V/Pjxjam3WNDojqMG5v3PUFJLMKXSYb3
 8JIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=XZQMWHcfgA4I7IFCR/7AEyj1oh5t44aMjK+F5c/EAE4=;
 b=lPbpEbPN4F+CGYDFHSfedvmJwnh+InxwsGlbpT6Dq1k20gYFqppxMG1St2ZS1p2uD6
 JjUjoE5vdRF7Ajo2YV+o5kuK+31WIPhTKb8SzL2m2K8F1qnVLJcxllN6BYyQvd6pRdvk
 q1bMzdSVUiVo8esFfu98/xMLwGHS04/CIt3l4UIR7pUiPmTMMTHXWM+H6cY/lk12mDfs
 ykdOLqRTIC7pDpSXIkE9OZf8cHvmKm3qIyxQ8L67aAzHDlx6jthhFlbqEE83Q4Uw60NL
 /aVYFwoO3rcjSnz3fE15V1qjFKygn0bySIFGPdzTrP77lc6vHAaJGzPsxGQbzGsbSbaM
 Nr0A==
X-Gm-Message-State: ACrzQf3Pv2G1DHvHdNZ50GPzq/qGuEMZpT845CNg8hbUQAkxot7aV6Ew
 kcKbIyLGXbWLKZPvD7sR1Gnpf2NyTWtnzngNouc=
X-Google-Smtp-Source: AMsMyM4c+TWjkECLuiG4YI7C4PSIPdzO6zAKXnDp3Z9RAa4zl6i6nHHqAJBoguEqYD7bO/90bPOWVBmmtl69PJU9Ftk=
X-Received: by 2002:a05:6808:1312:b0:350:6c53:4d91 with SMTP id
 y18-20020a056808131200b003506c534d91mr7958001oiv.264.1663913311125; Thu, 22
 Sep 2022 23:08:31 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Sep 2022 16:08:19 +1000
Message-ID: <CAPM=9twg497wBCc4cMSevtSL9B1BEE_M6MO-t-B3uiZMb9NUvg@mail.gmail.com>
Subject: [git pull] drm fixes for v6.0-rc7
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

Regular fixes for the week, i915, mediatek, hisilicon, mgag200 and
panel have some small fixes. amdgpu has more stack size fixes for
clang build, and fixes for new IPs, but all with low regression
chances since they are for stuff new in v6.0.

Dave.

drm-fixes-2022-09-23-1:
drm fixes for v6.0-rc7

i915:
- avoid a general protection failure when using perf/OA
- avoid kernel warnings on driver release

amdgpu:
- SDMA 6.x fix
- GPUVM TF fix
- DCN 3.2.x fixes
- DCN 3.1.x fixes
- SMU 13.x fixes
- Clang stack size fixes for recently enabled DML code
- Fix drm dirty callback change on non-atomic cases
- USB4 display fix

mediatek:
- dsi: Add atomic {destroy,duplicate}_state, reset callbacks
- dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()
- Fix wrong dither settings

hisilicon:
- Depend on MMU

mgag200:
- Fix console on G200ER

panel:
- Fix innolux_g121i1_l01 bus format
The following changes since commit 521a547ced6477c54b4b0cc206000406c221b4d6=
:

  Linux 6.0-rc6 (2022-09-18 13:44:14 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-09-23-1

for you to fetch changes up to 8288206c27856f6f56d35aacf3a48ee923e1d3e2:

  MAINTAINERS: switch graphics to airlied other addresses (2022-09-23
15:38:06 +1000)

----------------------------------------------------------------
drm fixes for v6.0-rc7

i915:
- avoid a general protection failure when using perf/OA
- avoid kernel warnings on driver release

amdgpu:
- SDMA 6.x fix
- GPUVM TF fix
- DCN 3.2.x fixes
- DCN 3.1.x fixes
- SMU 13.x fixes
- Clang stack size fixes for recently enabled DML code
- Fix drm dirty callback change on non-atomic cases
- USB4 display fix

mediatek:
- dsi: Add atomic {destroy,duplicate}_state, reset callbacks
- dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()
- Fix wrong dither settings

hisilicon:
- Depend on MMU

mgag200:
- Fix console on G200ER

panel:
- Fix innolux_g121i1_l01 bus format

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: don't register a dirty callback for non-atomic

Allen-KH Cheng (1):
      drm/mediatek: Fix wrong dither settings

Alvin Lee (1):
      drm/amd/display: Only consider pixle rate div policy for DCN32+

AngeloGioacchino Del Regno (1):
      drm/mediatek: dsi: Add atomic {destroy,duplicate}_state, reset callba=
cks

Charlene Liu (1):
      drm/amd/display: correct num_dsc based on HW cap

Chris Park (1):
      drm/amd/display: Port DCN30 420 logic to DCN32

Chris Wilson (1):
      drm/i915/gem: Really move i915_gem_context.link under ref protection

Cruise Hung (1):
      drm/amd/display: Fix DP MST timeslot issue when fallback happened

Daniel Miess (1):
      drm/amd/display: Add shift and mask for ICH_RESET_AT_END_OF_LINE

Dave Airlie (5):
      Merge tag 'drm-intel-fixes-2022-09-21' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.0-2022-09-21' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'mediatek-drm-fixes-6.0' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes
      Merge tag 'drm-misc-fixes-2022-09-22' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      MAINTAINERS: switch graphics to airlied other addresses

Dmytro Laktyushkin (2):
      drm/amd/display: fix dcn315 memory channel count and width read
      drm/amd/display: increase dcn315 pstate change latency

Evan Quan (2):
      drm/amd/pm: add support for 3794 pptable for SMU13.0.0
      drm/amd/pm: drop the pptable related workarounds for SMU 13.0.0

George Shen (1):
      drm/amd/display: Update dummy P-state search to use DCN32 DML

Heiko Schocher (1):
      drm/panel: simple: Fix innolux_g121i1_l01 bus_format

Hugo Hu (1):
      drm/amd/display: update gamut remap if plane has changed

Janusz Krzysztofik (1):
      drm/i915/gem: Flush contexts on driver release

Leo Li (1):
      drm/amd/display: Fix double cursor on non-video RGB MPO

Meenakshikumar Somasundaram (1):
      drm/amd/display: Display distortion after hotplug 5K tiled display

Michael Strauss (1):
      drm/amd/display: Assume an LTTPR is always present on fixed_vs links

Mukul Joshi (1):
      drm/amdgpu: Update PTE flags with TF enabled

Nathan Chancellor (2):
      drm/amd/display: Reduce number of arguments of dml314's
CalculateWatermarksAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of dml314's
CalculateFlipSchedule()

Nicholas Kazlauskas (1):
      drm/amd/display: Disable OTG WA for the plane_state NULL case on DCN3=
14

N=C3=ADcolas F. R. A. Prado (1):
      drm/mediatek: dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff(=
)

Randy Dunlap (1):
      drm/hisilicon: Add depends on MMU

Thomas Zimmermann (1):
      drm/mgag200: Force 32 bpp on the console

Yifan Zhang (1):
      drm/amdgpu/mes: zero the sdma_hqd_mask of 2nd SDMA engine for SDMA 6.=
0.1

zhikzhai (1):
      drm/amd/display: skip audio setup when audio stream is enabled

 MAINTAINERS                                        |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   7 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  12 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |  11 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  14 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  36 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |  11 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  17 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   | 220 -----------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   1 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |  16 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |   2 -
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |   1 -
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  11 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   7 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   | 420 +++++------------=
----
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  46 ++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |   6 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   2 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  26 ++
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   4 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  44 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  53 +--
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   8 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  24 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   6 +-
 drivers/gpu/drm/panel/panel-simple.c               |   2 +-
 36 files changed, 340 insertions(+), 720 deletions(-)
