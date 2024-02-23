Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C21860841
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 02:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445F710E02F;
	Fri, 23 Feb 2024 01:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T+d3dqA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C03210E02F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 01:32:23 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a2a17f3217aso36059966b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708651941; x=1709256741; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W/BNlMODgaqJRncFeOsomveD96NTb11ftCWfvLQq0dY=;
 b=T+d3dqA+EylVgmCIrJGXH0VZFeYJ3hpdmmBLhwsFmWE2fmFhHMdv/GQC24lylqcvay
 QZQ6+zwKa5o6qzugK0U/LufkMIt5q3hqernz8pkHFFYFcqwIOQ/bCfKKh/nFxNckXpHE
 g00oEU5xMdtXLmBfuHyPrmCdHgLSvh3i4mRa6eBZLAJmwTx/DDJHiMtskMA2eF1aLRf5
 f/kF+elED5xflm9GYWt1YMQqzOwBV4WdjF1LMNAu3q5Xe3sDhPq7u3OAqyBTGe7rEY3/
 /vKfsAQPEC3p8e7mVlOE4At1TtC4soMwXxaxkTW/xNoviR19o/krTyDgRqt7+QLQ6aio
 IyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708651941; x=1709256741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W/BNlMODgaqJRncFeOsomveD96NTb11ftCWfvLQq0dY=;
 b=i5RCsfthiTp8oc5TJeVxgymsjH69FjkGG7vn5SWLlmPrcMN4tvBr1yBihB8otY6kQW
 8j62QZr2hHyRPUBkCqPBMentjpaHjuV5jpdehbKz39Zs8M7MqvwxwNInWILWFBRZmqth
 V2x6Bc/siiuMjQ20PyHpcnjdfsU0UhqynKEkYpej8lyQUWA17Oe/1wwV3zc+t6AUATd9
 9C9yn38Gocv/CAO9XfaExrIKqjbWtQEXeeMeBHLrNYymUz3wuX4CIIkSYNHmspXMK7Oa
 7GjNnRTK15+mRMhot59jcXfdh7+Phgw/gzfjkZx5W/tyxTtcu/X/cOuDMHyQelRdPaL4
 qjkg==
X-Gm-Message-State: AOJu0Yy2EAsE6XZl1VTOPBzyN7MMrAmwc6cFCsaVgrBDJ9Zb7QBx16s4
 I16wBFrdPy7Q7FLNb0Hj1yzssUiEPcJKvKJ/xYhewXP9XgtZJPPPPwXaa2hoctAqaxRS1Sz+2D1
 E9sf2X8y6mV1bxmdBEirzfli4+jU=
X-Google-Smtp-Source: AGHT+IGkCzeuli7eOzYMSqqBixtZ+GmvEd1t9FWMXhItJetRw3EEdmkf5x2W9OWcHwfeXWK82Nv5jZBBWVNWWKvWXdA=
X-Received: by 2002:a17:906:f915:b0:a3f:988f:b9c4 with SMTP id
 lc21-20020a170906f91500b00a3f988fb9c4mr310260ejb.7.1708651941409; Thu, 22 Feb
 2024 17:32:21 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Feb 2024 11:32:09 +1000
Message-ID: <CAPM=9tzmzFd8UsKbpvo0vMh08DmgKMNgOCVZ-T5KgfZHyw-4bw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.8-rc6
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

This is the weekly drm fixes. Non-drivers there is a fbdev/sparc fix,
syncobj, ttm and buddy fixes.
On the driver side, ivpu, meson, i915 have a small fix each. Then
amdgpu and xe have a bunch. Nouveau has some minor uapi additions to
give userspace some useful info along with a Kconfig change to allow
the new GSP firmware paths to be used by default on the GPUs it
supports.

Seems about the usual amount for this time of release cycle.

Dave.

drm-fixes-2024-02-23:
drm fixes for 6.8-rc6

fbdev:
- fix sparc undefined reference

syncobj:
- fix sync obj fence waiting
- handle NULL fence in syncobj eventfd code

ttm:
- fix invalid free

buddy:
- fix list handling
- fix 32-bit build

meson:
- don't remove bridges from other drivers

nouveau:
- fix build warnings
- add two minor info parameters
- add a Kconfig to allow GSP by default on some GPUs

ivpu:
- allow fw to do initial tile config

i915:
- fix TV mode

amdgpu:
- Suspend/resume fixes
- Backlight error fix
- DCN 3.5 fixes
- Misc fixes

xe:
- Remove support for persistent exec_queues
- Drop a reduntant sysfs newline printout
- A three-patch fix for a VM_BIND rebind optimization path
- Fix a modpost warning on an xe KUNIT module
The following changes since commit b401b621758e46812da61fa58a67c3fd8d91de0d=
:

  Linux 6.8-rc5 (2024-02-18 12:56:25 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-02-23

for you to fetch changes up to 72fa02fdf83306c52bc1eede28359e3fa32a151a:

  nouveau: add an ioctl to report vram usage (2024-02-23 10:20:07 +1000)

----------------------------------------------------------------
drm fixes for 6.8-rc6

fbdev:
- fix sparc undefined reference

syncobj:
- fix sync obj fence waiting
- handle NULL fence in syncobj eventfd code

ttm:
- fix invalid free

buddy:
- fix list handling
- fix 32-bit build

meson:
- don't remove bridges from other drivers

nouveau:
- fix build warnings
- add two minor info parameters
- add a Kconfig to allow GSP by default on some GPUs

ivpu:
- allow fw to do initial tile config

i915:
- fix TV mode

amdgpu:
- Suspend/resume fixes
- Backlight error fix
- DCN 3.5 fixes
- Misc fixes

xe:
- Remove support for persistent exec_queues
- Drop a reduntant sysfs newline printout
- A three-patch fix for a VM_BIND rebind optimization path
- Fix a modpost warning on an xe KUNIT module

----------------------------------------------------------------
Andrzej Kacprowski (1):
      accel/ivpu: Don't enable any tiles by default on VPU40xx

Armin Wolf (1):
      drm/amd/display: Fix memory leak in dm_sw_fini()

Arnd Bergmann (1):
      nouveau: fix function cast warnings

Arunpravin Paneer Selvam (1):
      drm/buddy: Modify duplicate list_splice_tail call

Ashutosh Dixit (2):
      drm/xe/xe_gt_idle: Drop redundant newline in name
      drm/xe: Fix modpost warning on xe_mocs kunit module

Dan Carpenter (1):
      drm/nouveau/mmu/r535: uninitialized variable in r535_bar_new_()

Dave Airlie (7):
      Merge tag 'drm-misc-fixes-2024-02-22' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2024-02-22' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.8-2024-02-22' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-xe-fixes-2024-02-22' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      nouveau/gsp: add kconfig option to enable GSP paths by default
      nouveau: add an ioctl to return vram bar size.
      nouveau: add an ioctl to report vram usage

Erik Kurzinger (2):
      drm/syncobj: call drm_syncobj_fence_add_wait when WAIT_AVAILABLE
flag is set
      drm/syncobj: handle NULL fence in syncobj_eventfd_entry_func

Javier Martinez Canillas (1):
      sparc: Fix undefined reference to fb_is_primary_device

Lewis Huang (1):
      drm/amd/display: Only allow dig mapping to pwrseq in new asic

Ma Jun (1):
      drm/amdgpu: Fix the runtime resume failure issue

Martin Blumenstingl (1):
      drm/meson: Don't remove bridges which are created by other drivers

Matthew Auld (1):
      drm/tests/drm_buddy: fix 32b build

Matthew Brost (3):
      drm/xe: Fix xe_vma_set_pte_size
      drm/xe: Add XE_VMA_PTE_64K VMA flag
      drm/xe: Return 2MB page size for compact 64k PTEs

Maxime Ripard (1):
      drm/i915/tv: Fix TV mode

Melissa Wen (1):
      drm/amd/display: fix null-pointer dereference on edid reading

Srinivasan Shanmugam (1):
      drm/amd/display: Fix potential null pointer dereference in dc_dmub_sr=
v

Swapnil Patel (1):
      drm/amd/display: fix input states translation error for dcn35 & dcn35=
1

Thomas Hellstr=C3=B6m (2):
      drm/xe/uapi: Remove support for persistent exec_queues
      drm/ttm: Fix an invalid freeing on already freed page in error path

Wayne Lin (1):
      drm/amd/display: adjust few initialization order in dm

 arch/sparc/Makefile                                |  2 +-
 arch/sparc/video/Makefile                          |  2 +-
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  3 ++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 57 +++++++++++++-----=
----
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  7 ++-
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |  1 +
 .../drm/amd/display/dc/dcn301/dcn301_panel_cntl.c  |  1 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    | 18 ++++++-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  9 +++-
 drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h |  2 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c | 26 +---------
 drivers/gpu/drm/drm_buddy.c                        |  4 +-
 drivers/gpu/drm/drm_syncobj.c                      | 19 ++++++--
 drivers/gpu/drm/i915/display/intel_sdvo.c          | 10 ++--
 drivers/gpu/drm/i915/display/intel_tv.c            | 10 ++--
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |  1 -
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |  1 -
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  1 -
 drivers/gpu/drm/nouveau/Kconfig                    |  8 +++
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |  9 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c     |  5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c  |  8 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |  6 ++-
 drivers/gpu/drm/tests/drm_buddy_test.c             | 16 +++---
 drivers/gpu/drm/ttm/ttm_pool.c                     |  2 +-
 drivers/gpu/drm/xe/tests/xe_mocs_test.c            |  1 +
 drivers/gpu/drm/xe/xe_device.c                     | 39 ---------------
 drivers/gpu/drm/xe/xe_device.h                     |  4 --
 drivers/gpu/drm/xe/xe_device_types.h               |  8 ---
 drivers/gpu/drm/xe/xe_exec_queue.c                 | 33 ++-----------
 drivers/gpu/drm/xe/xe_exec_queue_types.h           | 10 ----
 drivers/gpu/drm/xe/xe_execlist.c                   |  2 -
 drivers/gpu/drm/xe/xe_gt_idle.c                    |  4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  2 -
 drivers/gpu/drm/xe/xe_pt.c                         | 11 +++--
 drivers/gpu/drm/xe/xe_vm.c                         | 14 ++++--
 drivers/gpu/drm/xe/xe_vm_types.h                   |  2 +
 include/uapi/drm/nouveau_drm.h                     | 14 ++++++
 include/uapi/drm/xe_drm.h                          |  1 -
 40 files changed, 184 insertions(+), 191 deletions(-)
