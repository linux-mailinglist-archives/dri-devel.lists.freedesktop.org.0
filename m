Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB7ABA4D0
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 22:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210BD10E031;
	Fri, 16 May 2025 20:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mLtWYAGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1911310E031
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 20:45:01 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5fbee929e56so4655960a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 13:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747428299; x=1748033099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b0ZX5dcNPDCR1x/qOI+9fZ8HOrmwYXuil42419Nvf7s=;
 b=mLtWYAGMLzSNACManbZFUc7KxJmAqyJg27QXv+/C7/Gb/RePhAECiJp31G9nROfC7N
 WJoyIfOXSEwhg15NQggwL2IBx5eYZ2emKzE/4ws41rYpFQGUJGsKVWD7Iyh2GqsevJ9L
 2wV9jRWA6T5WWJnvq0iAVKFGu2na+C0jCm2FmGVtizc7V0EdZl5eQdb/ttlh2dsuaUnO
 TeVDZdB51b1ZaLByx2gHkzRwg/OSLFEma+uJ3XwVQ0kfUw6UDcwfiTnGdM/dAtCkW4oI
 zFjYlXnOGwPVSRqWHmFWZ4puEEzablsejcD9UR0qUT8TcUc7ZhRZUNumxXhskiu6bZT9
 1RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747428299; x=1748033099;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b0ZX5dcNPDCR1x/qOI+9fZ8HOrmwYXuil42419Nvf7s=;
 b=wlQ9eGs8mPdG1Y0lRPmp/p5Uv8yZbrpNVTS2id53nO09pxTdv5I/wInIagw91q8EOG
 9N8wYctxbD3NqJ3+Re0FBK6yeMcUgWLQre3uWub+jYBy5NeZnE34wnbUfilJvxetzyCA
 iSo4gXR5Z8+b+NCnjoGiqKcTL656Pmn2BAyZe2firRE56NiCxJv+87P6gA6JZHfsLz6n
 68wXNEUk5lYbfA4IFXgSzmW8hQ82DWp/mrxNLVObuMv63RO4nxspyZAM2zkhVdArzHB2
 YiV3CsRCDLWMg7qb7glhctRCAPZGMw/2pyXGYBAZMLhmM53sp3dqhV1YJoxe3Dh2TRY1
 cOhg==
X-Gm-Message-State: AOJu0YytGc85MabptE1rc4wr1pvOcsYfuPuB/1s13m6VQpDqImacJjcS
 MzfDKkxSfpc50qoKbvzogW29SdMI8753/AChaKfpXS9lf3Qf6Q0oBC3VZf1ATRgMPMYGNC1Wsor
 9kWyjGoTi5StWtA4qOYaNtONtk8V7P/8=
X-Gm-Gg: ASbGnct3E5tgJjcHn6nUTjrNgZhlDQc2PSz9E/fSo7i4XCm9Ief5N5N3HAJTS5F8NbH
 3/4Sk+kunCL18ijM9JJqO3JHQnXGVg7B5tJ4IgyB9LENBpR6lwApmeD4j0iKJOmpovLiLxUhZFw
 fxCTvUPAcoDnnWWugvAqfEweZh8hYu7/I=
X-Google-Smtp-Source: AGHT+IFTk33V63lMc5uRZHjpHtnEKW62WAMZtvjUv0UM6PGJMd2Jv6jPdJtO44wfbV8S/u+MYu+XHkyW0z5Yf2Atl+0=
X-Received: by 2002:a17:907:3f8e:b0:ac3:3d10:6f with SMTP id
 a640c23a62f3a-ad536b58e99mr361426566b.8.1747428299251; Fri, 16 May 2025
 13:44:59 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 17 May 2025 06:44:48 +1000
X-Gm-Features: AX0GCFuaj0yuoEZrivvc2926hxAqueWFXabAr8nVmyujGREZGPsbgMcF3WnoF7I
Message-ID: <CAPM=9tzOu5FL6KXJDSJbAScqJjWnn12KLi3Va8V_WDrg6KUrPQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc7
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

Weekly drm fixes, I'll be honest and say I think this is larger than
I'd prefer at this point, the main blow out point is that xe has two
larger fixes.

One is a fix for active context utilisation reporting, it's for a
reported regression and will end up in stable anyways, so I don't see
any point in holding it up.
Two is a fix for mixed cpu/gpu atomics, which are currently broken,
but are also not something your average desktop/laptop user is going
to hit in normal operation, and having them fixed now is better than
threading them through stable later.

Other than those, it's mostly the usual, a bunch of amdgpu randoms and
a few other minor fixes.

Let me know if you have any problems with this,

Dave.

drm-fixes-2025-05-17:
drm fixes for 6.15-rc7

dma-buf:
- Avoid memory reordering in fence handling

meson:
- Avoid integer overflow in mode-clock calculations

panel-mipi-dbi:
- Fix output with drm_client_setup_with_fourcc()

amdgpu:
- Fix CSA unmap
- Fix MALL size reporting on GFX11.5
- AUX fix
- DCN 3.5 fix
- VRR fix
- DP MST fix
- DML 2.1 fixes
- Silence DP AUX spam
- DCN 4.0.1 cursor fix
- VCN 4.0.5 fix

ivpu:
- Fix buffer size in debugfs code

gpuvm:
- Add timeslicing and allocation restriction for SVM

xe:
- Fix shrinker debugfs name
- Add HW workaround to Xe2
- Fix SVM when mixing GPU and CPU atomics
- Fix per client engine utilization due to active contexts
  not saving timestamp with lite restore enabled.
The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3=
:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-17

for you to fetch changes up to c81dbc490bcdfd0dd6199c5c382dc923cea0029b:

  Merge tag 'drm-xe-fixes-2025-05-15-1' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-05-16 11:21:35 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc7

dma-buf:
- Avoid memory reordering in fence handling

meson:
- Avoid integer overflow in mode-clock calculations

panel-mipi-dbi:
- Fix output with drm_client_setup_with_fourcc()

amdgpu:
- Fix CSA unmap
- Fix MALL size reporting on GFX11.5
- AUX fix
- DCN 3.5 fix
- VRR fix
- DP MST fix
- DML 2.1 fixes
- Silence DP AUX spam
- DCN 4.0.1 cursor fix
- VCN 4.0.5 fix

ivpu:
- Fix buffer size in debugfs code

gpuvm:
- Add timeslicing and allocation restriction for SVM

xe:
- Fix shrinker debugfs name
- Add HW workaround to Xe2
- Fix SVM when mixing GPU and CPU atomics
- Fix per client engine utilization due to active contexts
  not saving timestamp with lite restore enabled.

----------------------------------------------------------------
Aradhya Bhatia (1):
      drm/xe/xe2hpg: Add Wa_22021007897

Aurabindo Pillai (1):
      drm/amd/display: check stream id dml21 wrapper to get plane_id

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.15-2025-05-14' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2025-05-15' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-05-15-1' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

David (Ming Qiang) Wu (1):
      drm/amdgpu: read back register after written for VCN v4.0.5

Fabio Estevam (1):
      drm/tiny: panel-mipi-dbi: Use drm_client_setup_with_fourcc()

Gabe Teeger (1):
      Revert: "drm/amd/display: Enable urgent latency adjustment on DCN35"

George Shen (1):
      drm/amd/display: fix link_set_dpms_off multi-display MST corner case

Himal Prasad Ghimiray (1):
      drm/gpusvm: Introduce devmem_only flag for allocation

Hyejeong Choi (1):
      dma-buf: insert memory barrier before updating num_fences

I Hsin Cheng (1):
      drm/meson: Use 1000ULL when operating with mode->clock

John Olender (1):
      drm/amd/display: Defer BW-optimization-blocked DRR adjustments

Markus Burri (1):
      accel/ivpu: Use effective buffer size for zero terminator

Matthew Brost (3):
      drm/xe: Strict migration policy for atomic SVM faults
      drm/gpusvm: Add timeslicing support to GPU SVM
      drm/xe: Timeslice GPU on atomic SVM fault

Melissa Wen (2):
      drm/amd/display: Fix null check of pipe_ctx->plane_state for
update_dchubp_dpp
      Revert "drm/amd/display: Hardware cursor changes color when
switched to software cursor"

Philip Yang (1):
      drm/amdgpu: csa unmap use uninterruptible lock

Thomas Hellstr=C3=B6m (1):
      drm/xe: Fix the gem shrinker name

Tim Huang (1):
      drm/amdgpu: fix incorrect MALL size for GFX1151

Umesh Nerlige Ramappa (3):
      drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
      drm/xe: Save the gt pointer in lrc and drop the tile
      drm/xe: Add WA BB to capture active context utilization

Wayne Lin (2):
      drm/amd/display: Correct the reply value when AUX write incomplete
      drm/amd/display: Avoid flooding unnecessary info messages

 drivers/accel/ivpu/ivpu_debugfs.c                  |   2 +-
 drivers/dma-buf/dma-resv.c                         |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  12 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   8 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  16 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  10 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   4 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |  20 ++-
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   5 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   6 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  13 +-
 drivers/gpu/drm/drm_gpusvm.c                       |  37 +++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   4 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |   5 +-
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h   |   4 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |   5 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   1 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |   2 +
 drivers/gpu/drm/xe/xe_device_types.h               |   2 +
 drivers/gpu/drm/xe/xe_exec_queue.c                 |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   2 +-
 drivers/gpu/drm/xe/xe_lrc.c                        | 199 +++++++++++++++++=
++--
 drivers/gpu/drm/xe/xe_lrc.h                        |   5 +-
 drivers/gpu/drm/xe/xe_lrc_types.h                  |   9 +-
 drivers/gpu/drm/xe/xe_module.c                     |   3 -
 drivers/gpu/drm/xe/xe_module.h                     |   1 -
 drivers/gpu/drm/xe/xe_pci.c                        |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h                  |   1 +
 drivers/gpu/drm/xe/xe_pt.c                         |  14 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |   7 +-
 drivers/gpu/drm/xe/xe_shrinker.c                   |   2 +-
 drivers/gpu/drm/xe/xe_svm.c                        | 116 +++++++++---
 drivers/gpu/drm/xe/xe_svm.h                        |   5 -
 drivers/gpu/drm/xe/xe_trace_lrc.h                  |   8 +-
 drivers/gpu/drm/xe/xe_wa.c                         |   4 +
 include/drm/drm_gpusvm.h                           |  47 +++--
 38 files changed, 474 insertions(+), 121 deletions(-)
