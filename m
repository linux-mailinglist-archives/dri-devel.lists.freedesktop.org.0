Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75913945747
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 07:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4744410E0ED;
	Fri,  2 Aug 2024 05:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eTgNzN3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0940010E036
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 05:08:19 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7ad02501c3so92800566b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 22:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722575297; x=1723180097; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dQSBIHh2x6d9F0Z2/XcgwrwlzUqOX9u6dBtDOp6ZOKw=;
 b=eTgNzN3H+jtjazxKJfVKXyWVJ89apLgKlZ0IaaHv/nrC8zlReoVL5VIhZTnZJpSqOq
 ZxaSN65kz68mJA6YfTWVvAYsi/1S81JXu6W/s97eb6YtJS7QYWyJrZpJOIFut3t7HFC+
 ioj3I9cpxFnIx0h/Q2ZIR6qdMWtfKD03Sg/YxoH4/hnDMDeoZsqLNggH6moa8CG34tl7
 CD/kKbL3R9ihRbNb7ZnOk98ntoi4Sfyo/PaXk7AwCFsZs7PuSID6JBlpi4XJXo+8Jz6l
 6o0z9JDKhNc22wFghnrWtltNo35H1TbDdXdK5GE5TJoUPEuiyy1tkUV0c8QG1cU8LL0H
 rWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722575297; x=1723180097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dQSBIHh2x6d9F0Z2/XcgwrwlzUqOX9u6dBtDOp6ZOKw=;
 b=oZkmm02AAKrc82ei60KPmB2JamlD4fqAZphYLn/6yGppH1/B9tm31IX35U+cqiLLTv
 KPreQZQ/0klbpinMo8S1vNjKRRvWbSQMHX8UEp0mI292Zevt6zovlFsOztqOBcJno6t8
 RVGW/6v/RpwrcTjqhz5bcK44BvCzmQvXx6qyfh2EHlL0wmG0OigIOGOGnKxVaCw+nIyr
 fJpMK14K0hPdGYWQFUDZ6l6zCDKh0MrFXDowcH/GgIDjHUE0V4YVn2h8v3wIX5yNS/OE
 5dod+uqffdL8CxInWE4VWDnrPVMOPGSAy70OrF/TlcqkkvUDezQGragdYWVD8k1uTIki
 s4hw==
X-Gm-Message-State: AOJu0YyW7a2zFiLNpUvoDPdATd8YY3usEGhZf5JDW2jjzQPCKgsRmig9
 AJcuUv5Pulzw2tXpHN+P2vgWKhbIQ1j5pZk936qP7tuiiFx8kPtydsXfThB3ksE9tHZC+3J5Say
 6qXVNtySw0/tHWzJQO+/crrvIPdMxhg==
X-Google-Smtp-Source: AGHT+IEcTILTMdnWLjjOTY1mWVR8vxXku5vDqawPsrHX4ltfDplMoweepY+N6j+5QQh09FQZJN0qIT5bKCOah18V9y4=
X-Received: by 2002:a17:907:d16:b0:a7a:bae8:f297 with SMTP id
 a640c23a62f3a-a7dc5016569mr142804666b.15.1722575296994; Thu, 01 Aug 2024
 22:08:16 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 2 Aug 2024 15:08:04 +1000
Message-ID: <CAPM=9tw0tAEd9LQuK-ANW501UATMrCDJvyAube9N_umUBBWFDQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.11-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

Regular weekly fixes. This is a bit larger than usual but doesn't seem
too crazy.

Most of it is vmwgfx changes that fix a bunch of issues with wayland
userspaces with dma-buf/external buffers and modesetting fixes.

Otherwise it's kinda spread out, v3d fixes some new ioctls, nouveau
has regression revert and fixes, amdgpu, i915 and ast have some small
fixes, and some core fixes spread about.

Let me know if any problems,
Thanks,
Dave.

drm-fixes-2024-08-02:
drm fixes for 6.11-rc2

client:
- fix error code

atomic:
- allow damage clips with async flips
- allow explicit sync with async flips

kselftests:
- fix dmabuf-heaps test

panic:
- fix schedule_work in panic paths

panel:
- fix OrangePi Neo orientation

gpuvm:
- fix missing dependency

amdgpu:
- SMU 14.x update
- Fix contiguous VRAM handling for IB parsing
- GFX 12 fix
- Regression fix for old APUs

i915:
- Static analysis fix for int overflow
- Fix for HDCP2_STREAM_STATUS macro and removal of PWR_CLK_STATE for gen12

nouveau:
- revert busy wait change that caused a resume regression
- fix buffer placement fault on dynamic pm s/r
- fix refcount underflow

ast:
- fix black screen on resume
- wake during connector status detect

v3d:
- fix issues with perf/timestamp ioctls

vmwgfx:
- fix deadlock in dma-buf fence polling
- fix screen surface refcounting
- fix dumb buffer handling
- fix support for external buffers
- fix overlay with screen targets
- trigger modeset on screen moves
The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b=
:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-08-02

for you to fetch changes up to 27ce65f65258cf2f2855162cbeef59659a81fac4:

  Revert "nouveau: rip out busy fence waits" (2024-08-02 14:38:28 +1000)

----------------------------------------------------------------
drm fixes for 6.11-rc2

client:
- fix error code

atomic:
- allow damage clips with async flips
- allow explicit sync with async flips

kselftests:
- fix dmabuf-heaps test

panic:
- fix schedule_work in panic paths

panel:
- fix OrangePi Neo orientation

gpuvm:
- fix missing dependency

amdgpu:
- SMU 14.x update
- Fix contiguous VRAM handling for IB parsing
- GFX 12 fix
- Regression fix for old APUs

i915:
- Static analysis fix for int overflow
- Fix for HDCP2_STREAM_STATUS macro and removal of PWR_CLK_STATE for gen12

nouveau:
- revert busy wait change that caused a resume regression
- fix buffer placement fault on dynamic pm s/r
- fix refcount underflow

ast:
- fix black screen on resume
- wake during connector status detect

v3d:
- fix issues with perf/timestamp ioctls

vmwgfx:
- fix deadlock in dma-buf fence polling
- fix screen surface refcounting
- fix dumb buffer handling
- fix support for external buffers
- fix overlay with screen targets
- trigger modeset on screen moves

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: Fix APU handling in amdgpu_pm_load_smu_firmware()

Andr=C3=A9 Almeida (2):
      drm/atomic: Allow userspace to use explicit sync with atomic async fl=
ips
      drm/atomic: Allow userspace to use damage clips with async flips

Christian K=C3=B6nig (1):
      drm/amdgpu: fix contiguous handling for IB parsing v2

Dan Carpenter (1):
      drm/client: Fix error code in drm_client_buffer_vmap_local()

Danilo Krummrich (2):
      drm/gpuvm: fix missing dependency to DRM_EXEC
      drm/nouveau: prime: fix refcount underflow

Dave Airlie (5):
      nouveau: set placement to original placement on uvmm validate.
      Merge tag 'amd-drm-fixes-6.11-2024-07-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2024-08-01' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-08-01' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Revert "nouveau: rip out busy fence waits"

Dmitry Osipenko (1):
      drm/virtio: Fix type of dma-fence context variable

Ian Forbes (2):
      drm/vmwgfx: Fix overlay when using Screen Targets
      drm/vmwgfx: Trigger a modeset when the screen moves

Jammy Huang (1):
      drm/ast: Fix black screen after resume

Kenneth Feng (1):
      drm/amdgpu/pm: support gpu_metrics sysfs interface for smu v14.0.2/3

Maxime Ripard (2):
      Merge drm/drm-fixes into drm-misc-fixes
      Merge drm-misc/drm-misc-next-fixes into drm-misc-fixes

Michael Chen (1):
      drm/amdgpu: increase mes log buffer size for gfx12

Nikita Zhandarovich (1):
      drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll()

Philip Mueller (1):
      drm: panel-orientation-quirks: Add quirk for OrangePi Neo

Qiuxu Zhuo (1):
      drm/fb-helper: Don't schedule_work() to flush frame buffer during pan=
ic()

Suraj Kandpal (1):
      drm/i915/hdcp: Fix HDCP2_STREAM_STATUS macro

Thomas Zimmermann (1):
      drm/ast: astdp: Wake up during connector status detection

Tvrtko Ursulin (5):
      drm/v3d: Prevent out of bounds access in performance query extensions
      drm/v3d: Fix potential memory leak in the timestamp extension
      drm/v3d: Fix potential memory leak in the performance extension
      drm/v3d: Validate passed in drm syncobj handles in the timestamp exte=
nsion
      drm/v3d: Validate passed in drm syncobj handles in the
performance extension

Umesh Nerlige Ramappa (1):
      i915/perf: Remove code to update PWR_CLK_STATE for gen12

Zack Rusin (4):
      drm/vmwgfx: Fix a deadlock in dma buf fence polling
      drm/vmwgfx: Make sure the screen surface is ref counted
      drm/vmwgfx: Fix handling of dumb buffers
      drm/vmwgfx: Add basic support for external buffers

Zenghui Yu (1):
      kselftests: dmabuf-heaps: Ensure the driver name is null-terminated

 drivers/gpu/drm/Kconfig                            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   6 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   8 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |   3 +
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |   3 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   3 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  86 +++-
 drivers/gpu/drm/ast/ast_dp.c                       |   7 +
 drivers/gpu/drm/ast/ast_drv.c                      |   5 +
 drivers/gpu/drm/ast/ast_drv.h                      |   1 +
 drivers/gpu/drm/ast/ast_mode.c                     |  29 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |   5 +-
 drivers/gpu/drm/drm_client.c                       |   2 +-
 drivers/gpu/drm/drm_fb_helper.c                    |  11 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |   6 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   6 +-
 drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |   2 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  33 --
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |   2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  30 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h            |   2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |   3 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |   1 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |   4 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |  44 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   | 121 +++--
 drivers/gpu/drm/virtio/virtgpu_submit.c            |   2 +-
 drivers/gpu/drm/vmwgfx/vmw_surface_cache.h         |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 | 127 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  40 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |  62 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 502 +++++++++--------=
----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c              |  32 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |  27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  33 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               | 174 ++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            | 280 +++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c               |  40 +-
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c |   4 +-
 50 files changed, 1202 insertions(+), 650 deletions(-)
