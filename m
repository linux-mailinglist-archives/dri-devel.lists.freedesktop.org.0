Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71B2A1485E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 03:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F8B10E106;
	Fri, 17 Jan 2025 02:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bgia54PA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E381B10E106
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 02:56:03 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab38a8ad61bso57832066b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 18:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737082562; x=1737687362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HK+nLTby73sX/PCnhefUq9vZO4iEKdw0vzKHx0JFETo=;
 b=Bgia54PAlSjLZmaflRRBYZXc6mg0Jnm1zE1OX0yb/ROPajksQENlX3Lm03aym2kayA
 daOpCoYKSbs02VDz0lQi2Mvof1P96pEDb4BnKPD5Nw6EYe9erW1qJNE3aT3liI+g2VAN
 QklYh6VXZn/8phT6zTFrDjRf/wNjaasnbHlDZ+QB47CWkpIr1vZQtQJNjNm8VrZAkss+
 mmgUgkOvVPbOfBspuOPaNcSNrjyMhriRJ/YWtu8DxJy6eB587jSE46yggrwBHwlk8qeF
 EhAiSQ+Ao1B1vrWRPyWvLo+ux0wpQ8F2xWEmGqwWIx9AHhGwxM87lRGQ6Pt8lYJkyNSB
 JOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737082562; x=1737687362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HK+nLTby73sX/PCnhefUq9vZO4iEKdw0vzKHx0JFETo=;
 b=p+2B/tP0DLKzfs2WVjVi91g4ZN3VADFFyFn2rUuvHMGWvqgamKrtXq0ufWrAqlWdYi
 2M952nqZc/M6KRgthrUVjMJ9SDI+vpepAFPjLrDEHfsq9SpgVYpSLSSktuXEwTo1RZYp
 bqlNpZtbpzcHmcT3wmZRlI3PCfgdwsOb9w+mgWcGblYInco0uL4v+jTWy8JuAGo1QThk
 3tsY2kETJkciFkj+IYLRVBcsLRiAFIrSN9Oih2Omvtc6IoYJWM7fG9aimJXhbXuBULa0
 8v8ZKnw23zenBRjZFpzgWm3r39nBsb7bXR1H72pbQtTGc4DznOLrPPqTAoK09b4ltdVm
 KCow==
X-Gm-Message-State: AOJu0YyIxXMB+i7wnN/7tgWjS00/WplSc2rG7qEMip/XrUxHewjFHf5K
 zTP0bC/YP+O2/Kc4is4KF0YmhX6zbr81qR7G3w0Sjn6I1Mq0uM0p8CYRYC5DEzdztQdhD3vJnAh
 v9Zh3aXHoWuDvgzCyrHMdE2Uw8tM=
X-Gm-Gg: ASbGnctPj1E0aeoDwHZChjOrZ7H2yc1D6lsRBcxJ+9XiBBPsRLLTHrALCnDVetuZrvC
 K3J64fPnXLkc5VpKA9l4a+D0bgPLoFNvi+jOk
X-Google-Smtp-Source: AGHT+IFW47AJAgAlQKmj78Ci2HCFDJWhUC1zCt1JxaS7jnEHBkrNNZXV6kmvVws0SOU352oFcCzVGHOqjbB9nf0QUTA=
X-Received: by 2002:a17:907:930c:b0:aa6:557a:c36f with SMTP id
 a640c23a62f3a-ab38b378436mr89456666b.46.1737082561980; Thu, 16 Jan 2025
 18:56:01 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 17 Jan 2025 12:55:50 +1000
X-Gm-Features: AbW1kvZRTXdCOWqedo2IIPM9opAUjgvCSxILLZDwoiNzc6w5qaXlyi9ysau-Bzg
Message-ID: <CAPM=9tzJTHBMwvNBH3s4Y4Oqt1o-Dcn4oGmk-ne_CrtbfQDv2g@mail.gmail.com>
Subject: [git pull] drm fixes for 6.13-rc8
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

Final(?) set of fixes for 6.13, I think the holidays finally caught up
with everyone, the misc changes are 2 weeks worth, otherwise amdgpu
and xe are most of it. The largest pieces is a new test so I'm not too
worried about that. I'll follow this up hopefully with the main merge
window MR since I'm about to leave for a 10 day trip, Sima will of
course provide backup if anything pops up.

Dave.

drm-fixes-2025-01-17:
drm fixes for 6.13-rc8

kunit:
- Fix W=3D1 build for kunit tests.

bridge:
- Handle YCbCr420 better in bridge code, with tests.
- itee-it6263 error handling fix.

amdgpu:
- SMU 13 fix
- DP MST fixes
- DCN 3.5 fix
- PSR fixes
- eDP fix
- VRR fix
- Enforce isolation fixes
- GFX 12 fix
- PSP 14.x fix

xe:
- Add steering info support for GuC register lists
- Add means to wait for reset and synchronous reset
- Make changing ccs_mode a synchronous action
- Add missing mux registers
- Mark ComputeCS read mode as UC on iGPU, unblocking ULLS on iGPU

i915:
- Relax clear color alignment to 64 bytes [fb]

v3d:
- Fix warn when unloading v3d.

nouveau:
- Fix cross-device fence handling in nouveau.
- Fix backlight regression for macbooks 5,1

vmwgfx:
- Fix BO reservation handling in vmwgfx.
The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532=
:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-01-17

for you to fetch changes up to 9b1c673a1648cc3501a3b7719db2bec931cf00f7:

  Merge tag 'drm-xe-fixes-2025-01-16' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-01-17 10:38:45 +1000)

----------------------------------------------------------------
drm fixes for 6.13-rc8

kunit:
- Fix W=3D1 build for kunit tests.

bridge:
- Handle YCbCr420 better in bridge code, with tests.
- itee-it6263 error handling fix.

amdgpu:
- SMU 13 fix
- DP MST fixes
- DCN 3.5 fix
- PSR fixes
- eDP fix
- VRR fix
- Enforce isolation fixes
- GFX 12 fix
- PSP 14.x fix

xe:
- Add steering info support for GuC register lists
- Add means to wait for reset and synchronous reset
- Make changing ccs_mode a synchronous action
- Add missing mux registers
- Mark ComputeCS read mode as UC on iGPU, unblocking ULLS on iGPU

i915:
- Relax clear color alignment to 64 bytes [fb]

v3d:
- Fix warn when unloading v3d.

nouveau:
- Fix cross-device fence handling in nouveau.
- Fix backlight regression for macbooks 5,1

vmwgfx:
- Fix BO reservation handling in vmwgfx.

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/smu13: update powersave optimizations

Alex Hung (1):
      drm/amd/display: Initialize denominator defaults to 1

Ashutosh Dixit (1):
      drm/xe/oa: Add missing VISACTL mux registers

Christian K=C3=B6nig (1):
      drm/amdgpu: always sync the GFX pipe on ctx switch

Cristian Ciocaltea (4):
      drm/bridge: Prioritize supported_formats over ycbcr_420_allowed
      drm/bridge-connector: Sync supported_formats with computed
ycbcr_420_allowed
      drm/connector: hdmi: Validate supported_formats matches ycbcr_420_all=
owed
      drm/tests: connector: Add ycbcr_420_allowed tests

Dan Carpenter (1):
      drm/bridge: ite-it6263: Prevent error pointer dereference in probe()

Dave Airlie (5):
      nouveau/fence: handle cross device fences properly
      Merge tag 'drm-misc-fixes-2025-01-15' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.13-2025-01-15' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2025-01-15' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-01-16' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Gui Chengming (1):
      drm/amdgpu: fix fw attestation for MP0_14_0_{2/3}

Ian Forbes (3):
      drm/vmwgfx: Unreserve BO on error
      drm/vmwgfx: Remove busy_places
      drm/vmwgfx: Add new keep_resv BO param

Jesus Narvaez (1):
      drm/xe/guc: Adding steering info support for GuC register lists

Kenneth Feng (1):
      drm/amdgpu: disable gfxoff with the compute workload on gfx12

Leo Li (2):
      drm/amd/display: Do not wait for PSR disable on vbl enable
      drm/amd/display: Do not elevate mem_type change to full update

Maciej Patelczyk (2):
      drm/xe: introduce xe_gt_reset and xe_gt_wait_for_reset
      drm/xe: make change ccs_mode a synchronous action

Matthew Brost (1):
      drm/xe: Mark ComputeCS read mode as UC on iGPU

Ma=C3=ADra Canal (1):
      drm/v3d: Ensure job pointer is set to NULL after job completion

Nicholas Susanto (1):
      Revert "drm/amd/display: Enable urgent latency adjustments for DCN35"

Srinivasan Shanmugam (1):
      drm/amdgpu: Fix Circular Locking Dependency in AMDGPU GFX Isolation

Takashi Iwai (1):
      drm/nouveau/disp: Fix missing backlight control on Macbook 5,1

Tom Chung (3):
      drm/amd/display: Use HW lock mgr for PSR1
      drm/amd/display: Fix PSR-SU not support but still call the
amdgpu_dm_psr_enable
      drm/amd/display: Disable replay and psr while VRR is enabled

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/fb: Relax clear color alignment to 64 bytes

Wayne Lin (2):
      drm/amd/display: Validate mdoe under MST LCT=3D1 case as well
      drm/amd/display: Reduce accessing remote DPCD overhead

Yiling Chen (1):
      drm/amd/display: Remove unnecessary eDP power down

Yu-Chun Lin (1):
      drm/tests: helpers: Fix compiler warning

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            | 12 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |  4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 41 +++++++++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  2 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  | 25 +++++----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 48 ++++++++++++-----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  | 35 +++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |  3 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |  3 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  4 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  4 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    | 12 ++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 11 ++--
 drivers/gpu/drm/bridge/ite-it6263.c                |  4 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  8 ++-
 drivers/gpu/drm/drm_bridge.c                       |  4 ++
 drivers/gpu/drm/drm_connector.c                    |  3 ++
 drivers/gpu/drm/i915/display/intel_fb.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  6 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c   |  1 +
 drivers/gpu/drm/tests/drm_connector_test.c         | 60 ++++++++++++++++++=
++++
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  3 +-
 drivers/gpu/drm/v3d/v3d_irq.c                      |  4 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  7 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 20 ++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |  7 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  5 +-
 drivers/gpu/drm/xe/tests/xe_bo.c                   |  7 ++-
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |  3 +-
 drivers/gpu/drm/xe/xe_gt.h                         | 25 +++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |  2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  4 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |  6 +--
 drivers/gpu/drm/xe/xe_gt_mcr.h                     |  4 ++
 drivers/gpu/drm/xe/xe_guc_ads.c                    | 15 ++++++
 drivers/gpu/drm/xe/xe_hw_engine.c                  |  2 +-
 drivers/gpu/drm/xe/xe_oa.c                         |  1 +
 45 files changed, 324 insertions(+), 109 deletions(-)
