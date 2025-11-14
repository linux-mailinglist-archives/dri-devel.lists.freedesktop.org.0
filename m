Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1536FC5D480
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 14:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF4D10EA6A;
	Fri, 14 Nov 2025 13:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VX+uGZuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0582410EA6A;
 Fri, 14 Nov 2025 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763126082; x=1794662082;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=fcDlBYHV1yi1svKwHJ0Q6H1VuZR5E8ZL+wyrMnfsPXw=;
 b=VX+uGZuuoG/ybAGBbpZzDxbv2uaDFMtxNgAA2TDUzFD1IwUYhbLKc2BI
 +b6Gt2vukRMvrkkHeUg2WbXbO44m3f1A9jS59TLIXMb4caZkER8DWFfUz
 sAGK/xRuyk5e3SKWzbAkcVLiLnUlT2YZKMehgyDigEcidjdYsbcS7QJ9l
 jwxyoQggqQjXzHQ5szDKQ2MrJlQnrAv8nawCcmKAzXvUKdzru0VEskJpv
 QThH/OdJeZRF2OwihUsf2n7M4U0C2daoAIM3FugsW9pdqeGmzbyEihlNg
 Zemmc/3o70KHqoelhrhEBowuHQvr9rB4LtmGxYUm+xm/Z+Iqr2YhBHku+ g==;
X-CSE-ConnectionGUID: hLYOwp5GRdqJuSivvbSN1w==
X-CSE-MsgGUID: 6pqD8IIgQg2oGMwIQaD8xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65256595"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="65256595"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 05:14:41 -0800
X-CSE-ConnectionGUID: vcbPGiORT1Gcl529lhmUWw==
X-CSE-MsgGUID: y3uXgfb5QFS7Brfp7hyU5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="194219476"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.65])
 ([10.245.244.65])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 05:14:37 -0800
Message-ID: <1ad3ea69-d029-4a21-8b3d-6b264b1b2a30@linux.intel.com>
Date: Fri, 14 Nov 2025 14:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Dave, Simona,

Here the belated pull request for v6.19.
I did write it, but then forgot to submit it, so some fixes from nouveau,
ivpu and amdxdna got lucky enough to be added too!

Kind regards,
~Maarten Lankhorst

drm-misc-next-2025-11-14-1:
drm-misc-next for v6.19:

UAPI Changes:
- Add sysfs entries, coredump support and uevents to QAIC.
- Add fdinfo memory statistics to ivpu.

Cross-subsystem Changes:
- Handle stub fence initialization during module init.
- Stop using system_wq in scheduler and drivers.

Core Changes:
- Documentation updates to ttm, vblank.
- Add EDID quirk for sharp panel.
- Use drm_crtc_vblank_(crtc,waitqueue) more in core and drivers.

Driver Changes:
- Small updates and fixes to panfrost, amdxdna, vmwgfx, ast, ivpu.
- Handle preemption in amdxdna.
- Add PM support to qaic.
- Huge refactor of sun4i's layer code to decouple plane code from output
  and improve support for DE33.
- Add larger page and compression support to nouveau.
The following changes since commit e237dfe70867f02de223e36340fe5f8b0fe0eada:

  Merge tag 'drm-misc-next-2025-11-05-1' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2025-11-07 12:41:26 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-11-14-1

for you to fetch changes up to ca2583412306ceda9304a7c4302fd9efbf43e963:

  accel/amdxdna: Fix deadlock between context destroy and job timeout (2025-11-13 09:10:43 -0800)

----------------------------------------------------------------
drm-misc-next for v6.19:

UAPI Changes:
- Add sysfs entries, coredump support and uevents to QAIC.
- Add fdinfo memory statistics to ivpu.

Cross-subsystem Changes:
- Handle stub fence initialization during module init.
- Stop using system_wq in scheduler and drivers.

Core Changes:
- Documentation updates to ttm, vblank.
- Add EDID quirk for sharp panel.
- Use drm_crtc_vblank_(crtc,waitqueue) more in core and drivers.

Driver Changes:
- Small updates and fixes to panfrost, amdxdna, vmwgfx, ast, ivpu.
- Handle preemption in amdxdna.
- Add PM support to qaic.
- Huge refactor of sun4i's layer code to decouple plane code from output
  and improve support for DE33.
- Add larger page and compression support to nouveau.

----------------------------------------------------------------
Ajye Huang (1):
      drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10

Akash Goel (1):
      drm/panthor: Fix potential memleak of vma structure

Bagas Sanjaya (3):
      drm/ttm: Fix @alloc_flags description
      accel/qaic: Separate DBC_STATE_* definition list
      accel/qaic: Format DBC states table in sysfs ABI documentation

Ben Skeggs (2):
      drm/nouveau/mmu/gp100: Remove unused/broken support for compression
      drm/nouveau/mmu/tu102: Add support for compressed kinds

Chintan Patel (1):
      drm/vblank: Increase timeout in drm_wait_one_vblank()

Christian König (1):
      dma-buf: rework stub fence initialisation v2

Jani Nikula (6):
      drm/vblank: use drm_crtc_vblank_crtc() in workers
      drm/tidss: use drm_crtc_vblank_crtc()
      drm/vmwgfx: use drm_crtc_vblank_crtc()
      drm/gma500: use drm_crtc_vblank_crtc()
      drm/atomic: use drm_crtc_vblank_waitqueue()
      drm/msm: use drm_crtc_vblank_waitqueue()

Jayesh Choudhary (2):
      drm/tidss: Remove max_pclk_khz and min_pclk_khz from tidss display features
      drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook

Jeff Hugo (1):
      accel/qaic: Implement basic SSR handling

Jernej Skrabec (30):
      drm/sun4i: mixer: Fix up DE33 channel macros
      drm/sun4i: mixer: Remove ccsc cfg for >= DE3
      drm/sun4i: de2: Initialize layer fields earlier
      drm/sun4i: ui_layer: Move check from update to check callback
      drm/sun4i: vi_layer: Move check from update to check callback
      drm/sun4i: layers: Make atomic commit functions void
      drm/sun4i: Move blender config from layers to mixer
      drm/sun4i: ui layer: Write attributes in one go
      drm/sun4i: vi layer: Write attributes in one go
      drm/sun4i: mixer: Move layer enabling to atomic_update
      drm/sun4i: de2/de3: Simplify CSC config interface
      drm/sun4i: csc: Simplify arguments with taking plane state
      drm/sun4i: de2/de3: Move plane type determination to mixer
      drm/sun4i: ui_layer: Change index meaning
      drm/sun4i: layer: move num of planes calc out of layer code
      drm/sun4i: ui_layer: use layer struct instead of multiple args
      drm/sun4i: vi_layer: use layer struct instead of multiple args
      drm/sun4i: ui_scaler: use layer instead of mixer for args
      drm/sun4i: vi_scaler: use layer instead of mixer for args
      drm/sun4i: layers: Make regmap for layers configurable
      drm/sun4i: csc: use layer arg instead of mixer
      drm/sun4i: layers: add physical index arg
      drm/sun4i: vi_scaler: Update DE33 base calculation
      drm/sun4i: mixer: Convert heuristics to quirk
      drm/sun4i: ui_scaler: drop sanity checks
      drm/sun4i: mixer: Add quirk for number of VI scalers
      drm/sun4i: mixer: split out layer config
      drm/sun4i: layer: replace mixer with layer struct
      drm/sun4i: vi_scaler: Find mixer from crtc
      drm/sun4i: Nuke mixer pointer from layer code

Jocelyn Falempe (1):
      drm/ast: Handle framebuffer from dma-buf

Karol Wachowski (3):
      accel/ivpu: Add fdinfo support for memory statistics
      accel/ivpu: Count only resident buffers in memory utilization
      accel/ivpu: Fix warning due to undefined CONFIG_PROC_FS

Lad Prabhakar (1):
      dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2N SoC

Lizhi Hou (5):
      accel/amdxdna: Support preemption requests
      accel/amdxdna: Fix dma_fence leak when job is canceled
      accel/amdxdna: Treat power-off failure as unrecoverable error
      accel/amdxdna: Clear mailbox interrupt register during channel creation
      accel/amdxdna: Fix deadlock between context destroy and job timeout

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Marco Crivellari (1):
      drm/sched: Replace use of system_wq with system_percpu_wq

Mary Guillemard (2):
      drm/nouveau/uvmm: Prepare for larger pages
      drm/nouveau/uvmm: Allow larger pages

Mohamed Ahmed (1):
      drm/nouveau/drm: Bump the driver version to 1.4.1 to report new features

Pranjal Ramajor Asha Kanojiya (2):
      accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents
      accel/qaic: Collect crashdump from SSR channel

Randy Dunlap (1):
      drm/panfrost: fix UAPI kernel-doc warnings

Thomas Zimmermann (3):
      drm/vblank: Fix kernel docs for vblank timer
      drm/vmwgfx: Set surface-framebuffer GEM objects
      drm/imx/ipuv3: Fix dumb-buffer allocation for non-RGB formats

Timur Tabi (1):
      drm/nouveau: fully define nvfw_hs_load_header_v2

Youssef Samir (1):
      accel/qaic: Add support for PM callbacks

Zack McKevitt (1):
      accel/qaic: Add qaic_ prefix to irq_polling_work

 Documentation/ABI/stable/sysfs-driver-qaic         |  19 +
 Documentation/accel/qaic/aic100.rst                |  25 +-
 .../bindings/display/renesas,rzg2l-du.yaml         |   3 +
 drivers/accel/amdxdna/aie2_ctx.c                   |   7 +-
 drivers/accel/amdxdna/aie2_message.c               |  95 +++
 drivers/accel/amdxdna/aie2_msg_priv.h              |   3 +
 drivers/accel/amdxdna/aie2_pci.c                   |  63 ++
 drivers/accel/amdxdna/aie2_pci.h                   |   8 +
 drivers/accel/amdxdna/aie2_smu.c                   |  10 +
 drivers/accel/amdxdna/amdxdna_ctx.c                |   1 +
 drivers/accel/amdxdna/amdxdna_ctx.h                |  17 +
 drivers/accel/amdxdna/amdxdna_mailbox.c            |   1 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |   3 +-
 drivers/accel/amdxdna/npu4_regs.c                  |   4 +
 drivers/accel/ivpu/ivpu_drv.c                      |   6 +
 drivers/accel/ivpu/ivpu_gem.c                      |  12 +
 drivers/accel/ivpu/ivpu_gem.h                      |   5 +
 drivers/accel/ivpu/ivpu_sysfs.c                    |   3 +-
 drivers/accel/qaic/Kconfig                         |   1 +
 drivers/accel/qaic/Makefile                        |   2 +
 drivers/accel/qaic/qaic.h                          |  40 +-
 drivers/accel/qaic/qaic_control.c                  |   2 +
 drivers/accel/qaic/qaic_data.c                     |  66 +-
 drivers/accel/qaic/qaic_drv.c                      | 116 ++-
 drivers/accel/qaic/qaic_ssr.c                      | 815 +++++++++++++++++++++
 drivers/accel/qaic/qaic_ssr.h                      |  17 +
 drivers/accel/qaic/qaic_sysfs.c                    | 109 +++
 drivers/accel/qaic/qaic_timesync.c                 |   9 +
 drivers/accel/qaic/qaic_timesync.h                 |   3 +
 drivers/dma-buf/dma-fence.c                        |  32 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  11 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   4 +-
 drivers/gpu/drm/drm_edid.c                         |   3 +
 drivers/gpu/drm/drm_vblank.c                       |   4 +-
 drivers/gpu/drm/drm_vblank_work.c                  |   2 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |  36 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |  16 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   3 +-
 drivers/gpu/drm/nouveau/include/nvfw/hs.h          |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             | 102 ++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.h             |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |  67 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c |   4 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |  18 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   2 +-
 drivers/gpu/drm/sun4i/sun8i_csc.c                  | 125 ++--
 drivers/gpu/drm/sun4i/sun8i_csc.h                  |  16 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                | 217 ++++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h                |  65 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             | 195 ++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h             |   7 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c            |  44 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.h            |   4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             | 244 +++---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h             |   7 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c            |  51 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h            |   6 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |   3 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  93 +--
 drivers/gpu/drm/tidss/tidss_dispc.h                |   3 -
 drivers/gpu/drm/tidss/tidss_drv.h                  |   2 +
 drivers/gpu/drm/tidss/tidss_oldi.c                 |  22 +
 drivers/gpu/drm/ttm/ttm_device.c                   |   2 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c               |   6 +-
 include/drm/ttm/ttm_device.h                       |   2 +-
 include/drm/ttm/ttm_pool.h                         |   2 +-
 include/uapi/drm/amdxdna_accel.h                   |  16 +-
 include/uapi/drm/panfrost_drm.h                    | 118 ++-
 72 files changed, 2323 insertions(+), 713 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-qaic
 create mode 100644 drivers/accel/qaic/qaic_ssr.c
 create mode 100644 drivers/accel/qaic/qaic_ssr.h
 create mode 100644 drivers/accel/qaic/qaic_sysfs.c
