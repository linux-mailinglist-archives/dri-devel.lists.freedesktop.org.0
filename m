Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625CCAF850A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 03:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8FE10E1DC;
	Fri,  4 Jul 2025 01:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KdBon5e7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417BA10E1DC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 01:01:38 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6099d89a19cso707282a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 18:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751590897; x=1752195697; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cY86xL7cC208LIXSjn9+eOUqY1qUu9FyHyARDU4gOVk=;
 b=KdBon5e7PpjQ0PqTuTlcfhL6hcdBlr3Ga0TG2QJsCp8MT5ISv162eRZfbB04uZz/Ha
 qERev9NZhDBLSrlhiOqBgikl4kyXCC8dtUh/2NEgbs9UqiR7QTbkBbkV3a6wYbp0BTNT
 PLVByx/jHm2exx6ZnIZVCNMi7cW20FUkyaF/MTSA22uaimoiTrnaXQ1Apv8PDDTwZpju
 UofuODLwwP3s1zrFrZ1Tp/U6H5RxvSwN7ZQHPY/OlcpQul3FyxwssTuytSp4XnzxnKlK
 /bVf3stO0H2FQ9vCUKWr7ecwHoZHyPduwLh6D+mDX7BZgLymbqP/4HBe5lS1N+KpmFaU
 UAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751590897; x=1752195697;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cY86xL7cC208LIXSjn9+eOUqY1qUu9FyHyARDU4gOVk=;
 b=ak5i3pNjVe2Y6HC4t3rzu4asIF5J1IEAF1vFMr/I+iWpxxAtTFwoZEKP5PQG5kZEhD
 jt+DskyU6VhVdXHonQtuZZBQVaYnMBUfAdyQeyWbK4q+3I2M0KRjtRFWDZz85h3lAN+B
 DnEYPkpFPievG/OnChUFOlsvUH62tDa1Vm4I55ZThLm3jseL1wY/15bpwPLDR07qq9k4
 noLV7gVhsEKax/jsavK5dGqulDoIRznPfvlCTv2eeQb1dwXe54Xn2cqBgeI9ul9wXWVH
 gLvtzdwAh/QoQ3yYBox5IYPOf6HW1SFdm6u9N9hUmyfsN21kVKVLvvbt4ErKBa21dWXD
 s0sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyb/DMEeaiAAl1DZ0dIXbDUcqb98kUFY3bghcMfa6ykpUoy9lX9EGvbYS9wFRACsJo/vdVAUPa8DU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjZ5jmjqcX6LosCbmm+rbRJYEZKMJYGMsp7eRViLy7nu6g55ul
 QKelSc6l1ScSvGVZu0dav9jAbrdp7KY4U0eWXXRHh0agFLG6y1TF+sVAzJFbgGy1L/x6yj3ebD0
 qghokVsylZG/nidPqfKVpdAjwhYGQzi0=
X-Gm-Gg: ASbGnctDDUtxBrUhqSNRH2avl3SWv4XPY3s5uUv5VZXbpHHr3Cq9YfuqiwN+7u3wBxP
 lTE3Sm9g3Gvzuptm/l+rbsQDdR5OX8YmhQNPbA0qxUkOI/HIpbNLmppB3v/lWlAM+Lzjv3tcthA
 EQL8hbl1oW4VsAuKakHXG/7fenTXTNXq8IXJU+6BISUQ==
X-Google-Smtp-Source: AGHT+IHUPXTdPv629F74zJeUDt3a6fJlK6/WfESG7R9BCvk/CBloN+mCI+vgTl20r8Cl5PGg0LscW6xlaZYxMT0/LwM=
X-Received: by 2002:a17:907:608e:b0:ae0:b717:746b with SMTP id
 a640c23a62f3a-ae3fe7921b5mr9711666b.61.1751590895865; Thu, 03 Jul 2025
 18:01:35 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 4 Jul 2025 11:01:24 +1000
X-Gm-Features: Ac12FXzxLqjXWGV49yo4_PhLRsO0gVt1pw8GRGQ4YjA3z9_t9BfITzSFGEENv1k
Message-ID: <CAPM=9tzrmRS9++MP_Y4ab95W71UxjFLzTd176Mok7akwdT2q+w@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
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

Weekly drm fixes, bit of a bumper crop, the usual amdgpu/xe/i915
suspects, then there is a large scattering of fixes across core and
drivers. I think the simple panel lookup fix is probably the largest,
the sched race fix is also fun, but I don't see anything standing out
too badly.

I'm going to be out all next week, I'll be falling down some mountains
while trying to stay attached to some skis, Simona will likely send
next week's fixes.

Dave.

drm-fixes-2025-07-04:
drm fixes for 6.16-rc5

dma-buf:
- fix timeout handling

gem:
- fix framebuffer object references

sched:
- fix spsc queue job count race

bridge:
- fix aux hpd bridge of node
- panel: move missing flag handling
- samsung-dsim: fix %pK usage to %p

panel:
- fix problem with simple panel lookup

ttm:
- fix error path handling

amdgpu:
- SDMA 5.x reset fix
- Add missing firmware declaration
- Fix leak in amdgpu_ctx_mgr_entity_fini()
- Freesync fix
- OLED backlight fix

amdkfd:
- mtype fix for ext coherent system memory
- MMU notifier fix
- gfx7/8 fix

xe:
- Fix chunking the PTE updates and overflowing the maximum number of
  dwords with with MI_STORE_DATA_IMM
- Move WA BB to the LRC BO to mitigate hangs on context switch
- Fix frequency/flush WAs for BMG
- Fix kconfig prompt title and description
- Do not require kunit
- Extend 14018094691 WA to BMG
- Fix wedging the device on signal

i915:
- Make mei interrupt top half irq disabled to fix RT builds
- Fix timeline left held on VMA alloc error
- Fix NULL pointer deref in vlv_dphy_param_init()
- Fix selftest mock_request() to avoid NULL deref

exynos:
- switch to using %p instead of %pK
- fix vblank NULL ptr race
- fix lockup on samsung peach-pit/pi chromebooks

vesadrm:
- NULL ptr fix

vmwgfx:
- fix encrypted memory allocation bug

v3d:
- fix irq enabled during reset
The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af=
:

  Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-04

for you to fetch changes up to da8d8e9001c6a3741e9bec26a6cdcfd75ecabc88:

  Merge tag 'drm-xe-fixes-2025-07-03' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-07-04 10:01:53 +1000)

----------------------------------------------------------------
drm fixes for 6.16-rc5

dma-buf:
- fix timeout handling

gem:
- fix framebuffer object references

sched:
- fix spsc queue job count race

bridge:
- fix aux hpd bridge of node
- panel: move missing flag handling
- samsung-dsim: fix %pK usage to %p

panel:
- fix problem with simple panel lookup

ttm:
- fix error path handling

amdgpu:
- SDMA 5.x reset fix
- Add missing firmware declaration
- Fix leak in amdgpu_ctx_mgr_entity_fini()
- Freesync fix
- OLED backlight fix

amdkfd:
- mtype fix for ext coherent system memory
- MMU notifier fix
- gfx7/8 fix

xe:
- Fix chunking the PTE updates and overflowing the maximum number of
  dwords with with MI_STORE_DATA_IMM
- Move WA BB to the LRC BO to mitigate hangs on context switch
- Fix frequency/flush WAs for BMG
- Fix kconfig prompt title and description
- Do not require kunit
- Extend 14018094691 WA to BMG
- Fix wedging the device on signal

i915:
- Make mei interrupt top half irq disabled to fix RT builds
- Fix timeline left held on VMA alloc error
- Fix NULL pointer deref in vlv_dphy_param_init()
- Fix selftest mock_request() to avoid NULL deref

exynos:
- switch to using %p instead of %pK
- fix vblank NULL ptr race
- fix lockup on samsung peach-pit/pi chromebooks

vesadrm:
- NULL ptr fix

vmwgfx:
- fix encrypted memory allocation bug

v3d:
- fix irq enabled during reset

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/sdma5.x: suspend KFD queues in ring reset
      drm/amdkfd: add hqd_sdma_get_doorbell callbacks for gfx7/8

Christian K=C3=B6nig (2):
      dma-buf: fix timeout handling in dma_resv_wait_timeout v2
      drm/ttm: fix error handling in ttm_buffer_object_transfer

Dan Carpenter (1):
      drm/i915/selftests: Change mock_request() to return error pointers

Daniele Ceraolo Spurio (1):
      drm/xe: Extend WA 14018094691 to BMG

Dave Airlie (6):
      Merge tag 'amd-drm-fixes-6.16-2025-07-01' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-07-03' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-07-03' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'exynos-drm-fixes-for-v6.16-rc4' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes
      Merge tag 'samsung-dsim-fixes-for-v6.16-rc4' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes
      Merge tag 'drm-xe-fixes-2025-07-03' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

David Yat Sin (1):
      amdkfd: MTYPE_UC for ext-coherent system memory

Dmitry Baryshkov (2):
      drm/bridge: panel: move prepare_prev_first handling to
drm_panel_bridge_add_typed
      drm/bridge: aux-hpd-bridge: fix assignment of the of_node

Hans de Goede (1):
      drm/i915/dsi: Fix NULL pointer deref in vlv_dphy_param_init()

Harold Sun (1):
      drm/amd/display: Added case for when RR equals panel's max RR
using freesync

Harry Austen (1):
      drm/xe: Allow dropping kunit dependency as built-in

Janusz Krzysztofik (1):
      drm/i915/gt: Fix timeline left held on VMA alloc error

Jia Yao (1):
      drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM

Junxiao Chang (1):
      drm/i915/gsc: mei interrupt top half should be in irq disabled contex=
t

Kaustabh Chakraborty (1):
      drm/exynos: exynos7_drm_decon: add vblank check in IRQ handling

Kent Russell (1):
      drm/amdgpu: Include sdma_4_4_4.bin

Lin.Cao (1):
      drm/amdgpu: Fix memory leak in amdgpu_ctx_mgr_entity_fini

Lucas De Marchi (4):
      drm/xe/guc_pc: Add _locked variant for min/max freq
      drm/xe/xe_guc_pc: Lock once to update stashed frequencies
      drm/xe: Split xe_device_td_flush()
      drm/xe: Fix kconfig prompt

Marek Szyprowski (1):
      drm/exynos: fimd: Guard display clock control with runtime PM calls

Mario Limonciello (1):
      drm/amd/display: Don't allow OLED to go down to fully off

Marko Kiiskila (1):
      drm/vmwgfx: Fix guests running with TDX/SEV

Matthew Brost (3):
      drm/xe: Make WA BB part of LRC BO
      drm/sched: Increment job count before swapping tail spsc queue
      drm/xe: Do not wedge device on killed exec queues

Maxime Ripard (5):
      drm/mipi-dsi: Add dev_is_mipi_dsi function
      drm/panel: panel-simple: make panel_dpi_probe return a panel_desc
      drm/panel: panel-simple: Make panel_simple_probe return its panel
      drm/panel: panel-simple: Add function to look panel data up
      drm/panel: panel-simple: get rid of panel_dpi hack

Ma=C3=ADra Canal (1):
      drm/v3d: Disable interrupts before resetting the GPU

Philip Yang (1):
      drm/amdkfd: Don't call mmput from MMU notifier callback

Thomas Wei=C3=9Fschuh (2):
      drm/exynos: Don't use %pK through printk
      drm/bridge: samsung-dsim: Don't use %pK through printk

Thomas Zimmermann (2):
      drm/vesadrm: Avoid NULL-ptr deref in vesadrm_pmi_cmap_write()
      drm/gem: Acquire references on GEM handles for framebuffers

Vinay Belgaumkar (2):
      drm/xe/bmg: Update Wa_14022085890
      drm/xe/bmg: Update Wa_22019338487

 drivers/dma-buf/dma-resv.c                         |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  45 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  12 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   1 +
 .../drm/amd/display/modules/freesync/freesync.c    |   8 +
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |   3 +-
 drivers/gpu/drm/bridge/panel.c                     |   5 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |   4 +-
 drivers/gpu/drm/drm_gem.c                          |  44 +++-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  16 +-
 drivers/gpu/drm/drm_internal.h                     |   2 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |   3 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |   4 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  12 +
 drivers/gpu/drm/exynos/exynos_drm_gem.c            |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            |  32 +--
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   2 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   3 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |  20 +-
 drivers/gpu/drm/i915/selftests/mock_request.c      |   2 +-
 drivers/gpu/drm/panel/panel-simple.c               | 132 ++++++----
 drivers/gpu/drm/sysfb/vesadrm.c                    |  13 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  13 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   8 +
 drivers/gpu/drm/v3d/v3d_gem.c                      |   2 +
 drivers/gpu/drm/v3d/v3d_irq.c                      |  37 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   2 +-
 drivers/gpu/drm/xe/Kconfig                         |   8 +-
 drivers/gpu/drm/xe/xe_device.c                     |  72 ++++--
 drivers/gpu/drm/xe/xe_drv.h                        |   2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     | 288 ++++++++++++++++-=
----
 drivers/gpu/drm/xe/xe_guc_pc.h                     |   2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h               |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  10 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |  37 +--
 drivers/gpu/drm/xe/xe_lrc_types.h                  |   3 -
 drivers/gpu/drm/xe/xe_migrate.c                    |  18 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   7 +-
 include/drm/drm_mipi_dsi.h                         |   3 +
 include/drm/spsc_queue.h                           |   4 +-
 47 files changed, 634 insertions(+), 295 deletions(-)
