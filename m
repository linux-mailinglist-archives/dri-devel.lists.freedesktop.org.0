Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2228542E852
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 07:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060896E210;
	Fri, 15 Oct 2021 05:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE166E187
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 05:15:43 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id t16so33154206eds.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 22:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=p2BDP5EoAmuQzctAhGTaKUc9zIlvqisFpRaNoJ9ywf0=;
 b=MGdLfrJNgdsNLKrNO7g6iW8fMBfD/d7DCFStvIDpQl7oDMXjMr7vn0TYh+YTcTFXij
 i1OeOVvTjL5dvlb/iy5iZW/mUhKSTr6uvoyYWiufl4FmjVPb2Jf+Pd0doN0WT4tqYWO/
 r5nPnKzvrOVRsXKT5hUVX+utUbPgMOKTVsEHljo0QGVRppvdeqKJtM14U3S0+Y5tIk9R
 zAtE8lMkdWdQDsbDy1bgx6uTeiSw8pFF3P4Rh32qKgSbIpt3U0HucD+eW71UtByv5qyH
 QEMM7jT2w5reDPduGWcd0sqAgOOEbgnxb0E9UYZOWDTtIodBpLZ4EjMWkzQqvei872Nv
 PzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=p2BDP5EoAmuQzctAhGTaKUc9zIlvqisFpRaNoJ9ywf0=;
 b=ALkws4YUuqw1ScopxS/yrU0umrtz8wlvrPqzVYPCbrVCrl1KMH+LeTDGFl0uS7Jmjc
 5o2nPu6sd5OZrBMiSMKrCGQxd7LukuRgyVTUWLGgvZ2pinXwqtoUaKcTEb9L5tV7yWGN
 SLI9nO/TAEvmAzSJiOTNGjLpeaHFHoPKyC+z7cDzuPRK8KS0HM0tCziw0ttLILvRe9xo
 ndzAdINfuB8p+cNtoD7NA8OrpSdEHlxMP5/rpRaoMbjdudA7Dx6K3dU9wq7+RkW/hqZE
 fBvPlw5q7gOl3p2rH9iMZrmLa7aI/GqpuSRw1nE/TiuoBqTPX6jgVbUKGNQA1BegHket
 mBfw==
X-Gm-Message-State: AOAM5311lBK6QUPZwPnBs/AWZ2D+zmkcfaUoJ65zdOdXjjAc3dj2GZf2
 rFexhdHd7bPhgb93VpYH5T+xU0N7Gpr53lhM9Xw=
X-Google-Smtp-Source: ABdhPJyVM1EVAV1MMS/NRrg/CaPrle5vxa3N9Y8XRJnW2EBsCUHyyDjPE1S9LfIrdDHL9qM2DDQArGYKgYM8Tp7WUcY=
X-Received: by 2002:a17:906:f24c:: with SMTP id
 gy12mr4180065ejb.478.1634274942294; 
 Thu, 14 Oct 2021 22:15:42 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 Oct 2021 15:15:31 +1000
Message-ID: <CAPM=9tyo_PDz3NuSp4N-qidJ55FybBYs6do-f_5gb4iXvct5Zg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.15-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

This is the fixes pull for 5.15-rc6.

It has a few scattered msm and i915 fixes, a few core fixes and a
mediatek feature revert.

I've had to pick a bunch of patches into this, as the drm-misc-fixes
tree had a bunch of vc4 patches I wasn't comfortable with sending to
you at least as part of this, they were delayed due to your reverts.
If it's really useful as fixes I'll do a separate pull.

Dave.

drm-fixes-2021-10-15-1:
drm fixes for 5.15-rc6

core:
- clamp fbdev size
- edid cap blocks read to avoid out of bounds

panel:
- fix missing crc32 dependency

msm:
- Fix a new crash on dev file close if the dev file was opened when
  GPU is not loaded (such as missing fw in initrd)
- Switch to single drm_sched_entity per priority level per drm_file
  to unbreak multi-context userspace
- Serialize GMU access to fix GMU OOB errors
- Various error path fixes
- A couple integer overflow fixes
- Fix mdp5 cursor plane WARNs

i915:
- Fix ACPI object leak
- Fix context leak in user proto-context creation
- Fix missing i915_sw_fence_fini call

hyperv:
- hide hw pointer

nouveau:
- fix engine selection bit

r128:
- fix UML build

rcar-du:
- unconncted LVDS regression fix

mediatek:
- revert CMDQ refinement patches
The following changes since commit 64570fbc14f8d7cb3fe3995f20e26bc25ce4b2cc:

  Linux 5.15-rc5 (2021-10-10 17:01:59 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-10-15-1

for you to fetch changes up to a14bc107edd0c108bda2245e50daa22f91c95d20:

  drm/panel: olimex-lcd-olinuxino: select CRC32 (2021-10-15 15:05:13 +1000)

----------------------------------------------------------------
drm fixes for 5.15-rc6

core:
- clamp fbdev size
- edid cap blocks read to avoid out of bounds

panel:
- fix missing crc32 dependency

msm:
- Fix a new crash on dev file close if the dev file was opened when
  GPU is not loaded (such as missing fw in initrd)
- Switch to single drm_sched_entity per priority level per drm_file
  to unbreak multi-context userspace
- Serialize GMU access to fix GMU OOB errors
- Various error path fixes
- A couple integer overflow fixes
- Fix mdp5 cursor plane WARNs

i915:
- Fix ACPI object leak
- Fix context leak in user proto-context creation
- Fix missing i915_sw_fence_fini call

hyperv:
- hide hw pointer

nouveau:
- fix engine selection bit

r128:
- fix UML build

rcar-du:
- unconncted LVDS regression fix

mediatek:
- revert CMDQ refinement patches

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/msm/submit: fix overflow check on 64-bit architectures

Chun-Kuang Hu (5):
      Revert "drm/mediatek: Clear pending flag when cmdq packet is done"
      Revert "drm/mediatek: Add cmdq_handle in mtk_crtc"
      Revert "drm/mediatek: Detect CMDQ execution timeout"
      Revert "drm/mediatek: Remove struct cmdq_client"
      Revert "drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb"

Colin Ian King (1):
      drm/msm: Fix null pointer dereference on pointer edp

Dan Carpenter (4):
      drm/msm/a4xx: fix error handling in a4xx_gpu_init()
      drm/msm/a3xx: fix error handling in a3xx_gpu_init()
      drm/msm/dsi: Fix an error code in msm_dsi_modeset_init()
      drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling

Dave Airlie (3):
      Merge tag 'drm-msm-fixes-2021-10-11' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-intel-fixes-2021-10-14' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'mediatek-drm-fixes-5.15' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes

Dexuan Cui (1):
      drm/hyperv: Fix double mouse pointers

Dmitry Baryshkov (2):
      drm/msm/mdp5: fix cursor-related warnings
      drm/msm/dsi/phy: fix clock names in 28nm_8960 phy

Douglas Anderson (1):
      drm/edid: In connector_bad_edid() cap num_of_ext by num_blocks read

Fabio Estevam (1):
      drm/msm: Do not run snapshot on non-DPU devices

Kuogee Hsieh (1):
      drm/msm/dp: only signal audio when disconnected detected at dp_pm_resume

Laurent Pinchart (1):
      drm: rcar-du: Don't create encoder for unconnected LVDS outputs

Marek Vasut (2):
      drm/msm: Avoid potential overflow in timeout_to_jiffies()
      drm/nouveau/fifo: Reinstate the correct engine bit programming

Marijn Suijten (1):
      drm/msm/dsi: dsi_phy_14nm: Take ready-bit into account in poll_for_ready

Matthew Auld (1):
      drm/i915: remember to call i915_sw_fence_fini

Matthew Brost (1):
      drm/i915: Fix bug in user proto-context creation that leaked contexts

Randy Dunlap (1):
      drm/r128: fix build for UML

Rob Clark (5):
      drm/msm: Fix crash on dev file close
      drm/msm/a6xx: Serialize GMU communication
      drm/msm/a6xx: Track current ctx by seqno
      drm/msm: A bit more docs + cleanup
      drm/msm: One sched entity per process per priority

Robert Foss (1):
      drm/msm/dpu: Fix address of SM8150 PINGPONG5 IRQ register

Stephan Gerhold (1):
      drm/msm: Fix devfreq NULL pointer dereference on a3xx

Thomas Zimmermann (1):
      drm/fbdev: Clamp fbdev surface size if too large

Vegard Nossum (1):
      drm/panel: olimex-lcd-olinuxino: select CRC32

Zenghui Yu (1):
      drm/i915: Free the returned object of acpi_evaluate_dsm()

 drivers/gpu/drm/drm_edid.c                         |  15 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   6 +
 drivers/gpu/drm/hyperv/hyperv_drm.h                |   1 +
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |   1 +
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c          |  54 ++++++-
 drivers/gpu/drm/i915/display/intel_acpi.c          |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   5 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 157 ++++-----------------
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   9 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   9 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   6 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  46 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |  16 +++
 drivers/gpu/drm/msm/dp/dp_display.c                |  10 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |   4 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  30 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |   4 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 |   3 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  15 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  47 +-----
 drivers/gpu/drm/msm/msm_gem_submit.c               |   7 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  66 ++++++++-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |   6 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |  72 ++++++++--
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |   1 +
 drivers/gpu/drm/r128/ati_pcigart.c                 |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  16 ++-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  11 ++
 drivers/gpu/drm/rcar-du/rcar_lvds.h                |   5 +
 35 files changed, 394 insertions(+), 258 deletions(-)
