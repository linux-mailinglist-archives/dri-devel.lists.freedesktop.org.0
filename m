Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3107E22C221
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 11:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6706E4FB;
	Fri, 24 Jul 2020 09:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E824D6E4F4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 09:22:15 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id y17so4334931ybm.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JLPFxKZ32zJwPItKKX3hP4QdV8mwx+gF91QqbKV1f3I=;
 b=SG/ceoiVNEp5gPFAN26zITeGcVv5OJffFsoSrEEifs3nx2LlmzIvGMOzdWywRWAP0/
 qvZAlyK0QGYgoAqECaZ/HWt/ktkKFNEK9xWxuPiLqOox+kfgk4yeVvkAO7LtCVtEfRGF
 c9F0xv+sfGOuacZNhgRdcqUXThGB1JNV98Z+vOeyM+SkUsMlJ+8gYiNJpq7W71b3C41q
 +FrwlfOiu3kTXEuUrq17JmpirRtknfgfH6CDyRb5w8x2wgl2tMWSkItVWqdOvDzKCsw0
 2/7hz34cm1mZXV2hvst669IBrOmaTb0BLoduXhNgq546ScJSOz4vQ9nZzJjrBK/5NAcf
 SkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JLPFxKZ32zJwPItKKX3hP4QdV8mwx+gF91QqbKV1f3I=;
 b=ZZdkLMd7wjZDKMZq7Z9tTBOQkqMTyEJK0/2FoRcFQZxNDolBmpxwkrYGWhfr8YJItd
 bc3K4U5QSKOmUKWi4+ox5HKWn3grU+6VoBFhEnl8HN3m70iB5J5A/A7qkD/zVPef77fl
 4lixaAA+eDJ46WsUIcttSUM1VFwAxm8kelIjUZVPLiNgaXLLQVxiGXYUuNkZRduZRlCY
 vv13KQH11AIZtzFwoK+AEKfNhM6geoWUtE3H8lX9/Op3X1KOyBCxQ9FrA1G+mkMVc+az
 YJJNmK1DFbAZDkjkRRxelfNPpyJVM8MHrtQYHq3lGAR0z1L9C5W3a/W2g2WOiEo9l7VU
 ekrA==
X-Gm-Message-State: AOAM532JV7g9KfzyG1o7ZYGd1efEMmYSbUGdPn3zLsDj0+QatTJnM34j
 awtBnkdXacgwQqRyD/6lnfrVhEx92/heuyma5cY=
X-Google-Smtp-Source: ABdhPJwyUpnVnaWDw8lcvrwyobkNnev0IoHoVZID7WmWLtNdn8DNt0PENMyc4N98WwQ6Auqpi/pjQ/jSgdKztGKa1Nk=
X-Received: by 2002:a25:4d41:: with SMTP id a62mr15054150ybb.83.1595582534806; 
 Fri, 24 Jul 2020 02:22:14 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 24 Jul 2020 19:22:03 +1000
Message-ID: <CACAvsv6XYgiXDK6TpvsjMo+8AkrMw7ZxmA=vKk6Gd-xuv6txBA@mail.gmail.com>
Subject: [PULL] nouveau-next 5.9
To: Dave Airlie <airlied@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dave,

This is the main nouveau pull for 5.9.  Nothing too exciting here,
most of it is (a lot of) trivial prep-work for future improvements:

- Conversion of all push buffer emission to a new set of macros, with
better safety, sanity-checking, debug ability, and the use of NVIDIA's
class headers.  The headers have been trimmed to just what we use as
they're rather extensive, the full versions can be found on NVIDIA's
github[1].
- Proper push buffer space management for EVO/NVD channels.
- Fixes to firmware loading behaviour in odd situations (various
combinations of missing/incompatible FW).
- runpm reference leak fixes
- crc compile fixes without debugfs
- 2MiB system memory pages support on Pascal and newer
- misc other cleanups

Thanks,
Ben.

The following changes since commit 3afe676684f424d39a44924d3c3e166fc6eb7483:

  Merge tag 'mediatek-drm-next-5.9' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next (2020-07-24 09:41:57 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.9

for you to fetch changes up to 0059a9081ac37b4513c98ce443b03c1b1f196810:

  drm/nouveau/kms/nv50-: Fix CRC-related compile errors with debugfs
disabled (2020-07-24 18:51:05 +1000)

----------------------------------------------------------------
Aditya Pakki (5):
      drm/nouveau/drm/noveau: fix reference count leak in nouveau_fbcon_open
      drm/nouveau: fix multiple instances of reference count leaks
      drm/nouveau: fix reference count leak in nv50_disp_atomic_commit
      drm/nouveau: Fix reference count leak in nouveau_connector_detect
      drm/nouveau: fix reference count leak in nouveau_debugfs_strap_peek

Ben Skeggs (134):
      drm/nouveau/disp/gm200-: remove 'head' parameter from
nvkm_ior_func.hdmi.scdc()
      drm/nouveau/gr/gf100-: make some functions static
      drm/nouveau/nvfw/acr: make lsb_header_tail_dump static
      drm/nouveau/mc/gp10b: make gp10b_mc_init static
      drm/nouveau/mmu: make a couple of functions static
      drm/nouveau/therm/gt215: make gt215_therm_init static
      drm/nouveau/mmu/gp100-: enable mmu invalidate depth optimisation
      drm/nouveau/core: drop error message when no compatible FW found
      drm/nouveau/acr: refuse to load LSFW if HSFW is missing
      drm/nouveau/acr: allow module to load when HSFW(s) are missing
      drm/nouveau/acr: store a mask of LS falcons the HSFW can bootstrap
      drm/nouveau/acr: store a mask of LS falcons the controlling LSFW
can bootstrap
      drm/nouveau/pmu/gm20x: don't pretend we support loading with our custom FW
      drm/nouveau/pmu/gm200-: explicitly handle nofw
      drm/nouveau/gr/gm200-: explicitly handle nofw
      drm/nouveau/sec2/gp102: allow module to load when LSFW is missing
      drm/nouveau/kms/tu102: set
NVC57D_HEAD_SET_HEAD_USAGE_BOUNDS_UPSCALING_ALLOWED to TRUE
      drm/nouveau/nvif: rename client ctor/dtor
      drm/nouveau/nvif: give every object a human-readable identifier
      drm/nouveau/nvif: give every device object a human-readable identifier
      drm/nouveau/nvif: give every mmu object a human-readable identifier
      drm/nouveau/nvif: give every mem object a human-readable identifier
      drm/nouveau/nvif: give every vmm object a human-readable identifier
      drm/nouveau/nvif: give every usermode object a human-readable identifier
      drm/nouveau/nvif: give every disp object a human-readable identifier
      drm/nouveau/nvif: give every notify object a human-readable name
      drm/nouveau/nvif: add support for object-level debug output
      drm/nouveau/kms/nv50-: wrap existing command submission in
nvif_push interface
      drm/nouveau/kms/nv50-: convert wimm point() to new push macros
      drm/nouveau/kms/nv50-: convert wimm update() to new push macros
      drm/nouveau/kms/nv50-: convert wndw sema_set() to new push macros
      drm/nouveau/kms/nv50-: convert wndw sema_clr() to new push macros
      drm/nouveau/kms/nv50-: convert wndw ntfy_set() to new push macros
      drm/nouveau/kms/nv50-: convert wndw ntfy_clr() to new push macros
      drm/nouveau/kms/nv50-: convert wndw csc_set() to new push macros
      drm/nouveau/kms/nv50-: convert wndw csc_clr() to new push macros
      drm/nouveau/kms/nv50-: convert wndw xlut_set() to new push macros
      drm/nouveau/kms/nv50-: convert wndw xlut_clr() to new push macros
      drm/nouveau/kms/nv50-: convert wndw image_set() to new push macros
      drm/nouveau/kms/nv50-: convert wndw image_clr() to new push macros
      drm/nouveau/kms/nv50-: convert wndw scale_set() to new push macros
      drm/nouveau/kms/nv50-: convert wndw blend_set() to new push macros
      drm/nouveau/kms/nv50-: convert wndw update() to new push macros
      drm/nouveau/kms/nv50-: convert core init() to new push macros
      drm/nouveau/kms/nv50-: convert core caps_init() to new push macros
      drm/nouveau/kms/nv50-: convert core update() to new push macros
      drm/nouveau/kms/nv50-: convert core wndw_owner() to new push macros
      drm/nouveau/kms/nv50-: convert core or_ctrl() to new push macros
      drm/nouveau/kms/nv50-: convert core head_view() to new push macros
      drm/nouveau/kms/nv50-: convert core head_mode() to new push macros
      drm/nouveau/kms/nv50-: convert core head_olut_set() to new push macros
      drm/nouveau/kms/nv50-: convert core head_olut_clr() to new push macros
      drm/nouveau/kms/nv50-: convert core head_core_set() to new push macros
      drm/nouveau/kms/nv50-: convert core head_core_clr() to new push macros
      drm/nouveau/kms/nv50-: convert core head_curs_set() to new push macros
      drm/nouveau/kms/nv50-: convert core head_curs_clr() to new push macros
      drm/nouveau/kms/nv50-: convert core head_base() to new push macros
      drm/nouveau/kms/nv50-: convert core head_ovly() to new push macros
      drm/nouveau/kms/nv50-: convert core head_dither() to new push macros
      drm/nouveau/kms/nv50-: convert core head_procamp() to new push macros
      drm/nouveau/kms/nv50-: convert core head_or() to new push macros
      drm/nouveau/kms/nv50-: convert core crc_set_src() to new push macros
      drm/nouveau/kms/nv50-: convert core crc_set_ctx() to new push macros
      drm/nouveau/kms/nv50-: implement proper push buffer control logic
      drm/nouveau: interop with new push macros
      drm/nouveau/fbcon: convert accel_init() to new push macros
      drm/nouveau/fbcon: convert imageblit() to new push macros
      drm/nouveau/fbcon: convert fillrect() to new push macros
      drm/nouveau/fbcon: convert copyarea() to new push macros
      drm/nouveau/bo: split buffer move functions into their own source files
      drm/nouveau/bo: convert move init() to new push macros
      drm/nouveau/bo: convert move move() to new push macros
      drm/nouveau/svm: convert migrate_copy to new push macros
      drm/nouveau/svm: convert migrate_clear to new push macros
      drm/nouveau/kms/nv04: convert page_flip_emit() to new push macros
      drm/nouveau/kms/nv04: convert page_flip() to new push macros
      drm/nouveau/kms/nv04-: no need for multiple nvsw objects
      drm/nouveau: convert nvsw init to new push macros
      drm/nouveau/chan: convert nvsw init to new push macros
      drm/nouveau/gem: convert indirect pushbufs to new push macros
      drm/nouveau/fence: convert emit() to new push macros
      drm/nouveau/fence: convert sync() to new push macros
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wimm space()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wimm point()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wimm update()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw sema_set()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw sema_clr()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw ntfy_reset()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw ntfy_set()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw ntfy_clr()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw ntfy_wait_begun()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw csc_set()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw csc_clr()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw xlut_set()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw xlut_clr()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw image_set()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw image_clr()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw scale_set()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw blend_set()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for wndw update()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core init()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core ntfy_init()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core caps_init()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core ntfy_wait_done()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core update()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core wndw_owner()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core or_ctrl()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core or_get_caps()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_view()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_mode()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_olut_set()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_olut_clr()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_core_set()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_core_clr()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_curs_set()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_curs_clr()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_base()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_ovly()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_dither()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_procamp()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_or()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core crc_set_src()
      drm/nouveau/kms/nv50-: use NVIDIA's headers for core crc_set_ctx()
      drm/nouveau/fbcon/nv50-: use NVIDIA's headers for accel_init()
      drm/nouveau/fbcon/nv50-: use NVIDIA's headers for imageblit()
      drm/nouveau/fbcon/nv50-: use NVIDIA's headers for copyarea()
      drm/nouveau/fbcon/nv50-: use NVIDIA's headers for fillrect()
      drm/nouveau/bo: use NVIDIA's headers for move init()
      drm/nouveau/bo: use NVIDIA's headers for move move()
      drm/nouveau/svm: use NVIDIA's headers for migrate_copy()
      drm/nouveau/svm: use NVIDIA's headers for migrate_clear()
      drm/nouveau/fence: use NVIDIA's headers for emit()
      drm/nouveau/fence: use NVIDIA's headers for sync()
      drm/nouveau/fence: use NVIDIA's headers for read()

Gustavo A. R. Silva (1):
      drm/nouveau: Use fallthrough pseudo-keyword

Lyude Paul (1):
      drm/nouveau/kms/nv50-: Fix CRC-related compile errors with
debugfs disabled

Ralph Campbell (2):
      drm/nouveau/mmu: make nvkm_vmm_ctor() static
      drm/nouveau/vmm/gp100-: fix mapping 2MB sysmem pages

Timur Tabi (2):
      drm/nouveau/tmr: fix nvkm_usec/nvkm_msec definitions
      drm/nouveau/nvfw: firmware structures should begin with nvfw_

 drivers/gpu/drm/nouveau/Kbuild                               |   7 +
 drivers/gpu/drm/nouveau/Kconfig                              |   8 +
 drivers/gpu/drm/nouveau/dispnv04/crtc.c                      |  30 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c                      |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/base.h                      |  12 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c                  | 233
+++++++------
 drivers/gpu/drm/nouveau/dispnv50/base827c.c                  |  74 ++--
 drivers/gpu/drm/nouveau/dispnv50/base907c.c                  | 159 +++++----
 drivers/gpu/drm/nouveau/dispnv50/core.h                      |  16 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c                  |  69 ++--
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c                  | 129 ++++---
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c                  |  44 ++-
 drivers/gpu/drm/nouveau/dispnv50/crc.c                       |  22 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.h                       |  29 +-
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c                   |  69 ++--
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c                   |  61 ++--
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c                  |  32 +-
 drivers/gpu/drm/nouveau/dispnv50/cursc37a.c                  |  23 +-
 drivers/gpu/drm/nouveau/dispnv50/dac507d.c                   |  30 +-
 drivers/gpu/drm/nouveau/dispnv50/dac907d.c                   |  20 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c                      | 274
+++++++++------
 drivers/gpu/drm/nouveau/dispnv50/disp.h                      |  22 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c                      |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/head.h                      |  72 ++--
 drivers/gpu/drm/nouveau/dispnv50/head507d.c                  | 408
+++++++++++++---------
 drivers/gpu/drm/nouveau/dispnv50/head827d.c                  | 165 +++++----
 drivers/gpu/drm/nouveau/dispnv50/head907d.c                  | 443
+++++++++++++++---------
 drivers/gpu/drm/nouveau/dispnv50/head917d.c                  |  64 ++--
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c                  | 315
++++++++++-------
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c                  | 199 ++++++-----
 drivers/gpu/drm/nouveau/dispnv50/lut.c                       |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/oimm507b.c                  |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly.h                      |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c                  | 136 ++++----
 drivers/gpu/drm/nouveau/dispnv50/ovly827e.c                  |  76 +++--
 drivers/gpu/drm/nouveau/dispnv50/ovly907e.c                  |  65 ++--
 drivers/gpu/drm/nouveau/dispnv50/pior507d.c                  |  30 +-
 drivers/gpu/drm/nouveau/dispnv50/sor507d.c                   |  30 +-
 drivers/gpu/drm/nouveau/dispnv50/sor907d.c                   |  28 +-
 drivers/gpu/drm/nouveau/dispnv50/sorc37d.c                   |  20 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c                  |  42 ++-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c                      |  95 ++++--
 drivers/gpu/drm/nouveau/dispnv50/wndw.h                      |  57 ++--
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c                  | 335
+++++++++++-------
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c                  | 179 +++++-----
 drivers/gpu/drm/nouveau/include/nvfw/pmu.h                   |   6 +-
 drivers/gpu/drm/nouveau/include/nvfw/sec2.h                  |   6 +-
 drivers/gpu/drm/nouveau/include/nvhw/class/cl0039.h          |  45 +++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl006c.h          |  46 +++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl006e.h          |  30 ++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl176e.h          |  10 +
 drivers/gpu/drm/nouveau/include/nvhw/class/cl206e.h          |  35 ++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl502d.h          | 337
++++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl5039.h          | 153 +++++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl507a.h          |  36 ++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl507c.h          | 165 +++++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl507d.h          | 372
++++++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl507e.h          |  93 +++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl826f.h          |  39 +++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl827c.h          |  86 +++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl827d.h          | 106 ++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl827e.h          |  88 +++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl837d.h          | 101 ++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl887d.h          |  68 ++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl902d.h          | 357
+++++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl9039.h          |  74 ++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl906f.h          |  74 ++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl907c.h          | 143 ++++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl907d.h          | 429
+++++++++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl907e.h          |  73 ++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cl917d.h          | 104 ++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/cla0b5.h          | 162 +++++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/clc37a.h          |  31 ++
 drivers/gpu/drm/nouveau/include/nvhw/class/clc37b.h          |  49 +++
 drivers/gpu/drm/nouveau/include/nvhw/class/clc37d.h          | 567
+++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/clc37e.h          | 394
+++++++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/clc57d.h          | 286
++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvhw/class/clc57e.h          | 142 ++++++++
 drivers/gpu/drm/nouveau/include/nvhw/drf.h                   | 208 ++++++++++++
 drivers/gpu/drm/nouveau/include/nvif/client.h                |   4 +-
 drivers/gpu/drm/nouveau/include/nvif/device.h                |   6 +-
 drivers/gpu/drm/nouveau/include/nvif/disp.h                  |   3 +-
 drivers/gpu/drm/nouveau/include/nvif/mem.h                   |  14 +-
 drivers/gpu/drm/nouveau/include/nvif/mmu.h                   |   5 +-
 drivers/gpu/drm/nouveau/include/nvif/notify.h                |   9 +-
 drivers/gpu/drm/nouveau/include/nvif/object.h                |  22 +-
 drivers/gpu/drm/nouveau/include/nvif/parent.h                |  25 ++
 drivers/gpu/drm/nouveau/include/nvif/printf.h                |  20 ++
 drivers/gpu/drm/nouveau/include/nvif/push.h                  | 359
+++++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvif/push006c.h              |  73 ++++
 drivers/gpu/drm/nouveau/include/nvif/push206e.h              |  13 +
 drivers/gpu/drm/nouveau/include/nvif/push507c.h              |  25 ++
 drivers/gpu/drm/nouveau/include/nvif/push906f.h              |  48 +++
 drivers/gpu/drm/nouveau/include/nvif/pushc37b.h              |  18 +
 drivers/gpu/drm/nouveau/include/nvif/user.h                  |   4 +-
 drivers/gpu/drm/nouveau/include/nvif/vmm.h                   |   6 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h           |  10 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h         |   5 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/acr.h            |   3 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/pmu.h            |   2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h          |   4 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c                      |  14 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c                         | 363
+-------------------
 drivers/gpu/drm/nouveau/nouveau_bo.h                         |  43 ++-
 drivers/gpu/drm/nouveau/nouveau_bo0039.c                     | 109 ++++++
 drivers/gpu/drm/nouveau/nouveau_bo5039.c                     | 151 ++++++++
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c                     |  54 +++
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c                     |  74 ++++
 drivers/gpu/drm/nouveau/nouveau_bo9039.c                     |  98 ++++++
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c                     |  67 ++++
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c                     |  90 +++++
 drivers/gpu/drm/nouveau/nouveau_chan.c                       |  90 +++--
 drivers/gpu/drm/nouveau/nouveau_chan.h                       |   6 +
 drivers/gpu/drm/nouveau/nouveau_connector.c                  |  13 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h                  |  25 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c                    |   8 +-
 drivers/gpu/drm/nouveau/nouveau_display.c                    |   3 +-
 drivers/gpu/drm/nouveau/nouveau_dma.c                        |  13 -
 drivers/gpu/drm/nouveau/nouveau_dma.h                        |  80 -----
 drivers/gpu/drm/nouveau/nouveau_dmem.c                       | 130 ++++---
 drivers/gpu/drm/nouveau/nouveau_drm.c                        |  89 +++--
 drivers/gpu/drm/nouveau/nouveau_drv.h                        |   3 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c                      |  18 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c                      |   5 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c                        |  20 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c                        |   8 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c                        |  15 +-
 drivers/gpu/drm/nouveau/nouveau_vmm.c                        |   6 +-
 drivers/gpu/drm/nouveau/nv04_fbcon.c                         | 186 +++++-----
 drivers/gpu/drm/nouveau/nv04_fence.c                         |  11 +-
 drivers/gpu/drm/nouveau/nv10_fence.c                         |  18 +-
 drivers/gpu/drm/nouveau/nv17_fence.c                         |  41 +--
 drivers/gpu/drm/nouveau/nv50_fbcon.c                         | 290
+++++++++-------
 drivers/gpu/drm/nouveau/nv50_fence.c                         |   3 +-
 drivers/gpu/drm/nouveau/nv84_fence.c                         |  52 +--
 drivers/gpu/drm/nouveau/nvc0_fbcon.c                         | 288
+++++++++-------
 drivers/gpu/drm/nouveau/nvc0_fence.c                         |  48 ++-
 drivers/gpu/drm/nouveau/nvif/client.c                        |  13 +-
 drivers/gpu/drm/nouveau/nvif/device.c                        |  14 +-
 drivers/gpu/drm/nouveau/nvif/disp.c                          |   9 +-
 drivers/gpu/drm/nouveau/nvif/driver.c                        |   2 +-
 drivers/gpu/drm/nouveau/nvif/mem.c                           |  30 +-
 drivers/gpu/drm/nouveau/nvif/mmu.c                           |  13 +-
 drivers/gpu/drm/nouveau/nvif/notify.c                        |  11 +-
 drivers/gpu/drm/nouveau/nvif/object.c                        |  13 +-
 drivers/gpu/drm/nouveau/nvif/user.c                          |   9 +-
 drivers/gpu/drm/nouveau/nvif/vmm.c                           |  14 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c            |   8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.h          |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregf119.c         |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregp102.c         |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c         |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/corenv50.c          |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgf119.c         |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgp102.c         |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgv100.c         |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacnv50.c          |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.c              |  34 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigm200.c         |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h               |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c          |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.c           |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c              |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c              |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c               |   8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h               |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c               |   6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm200.c               |  10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm20b.c               |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c               |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp102.c               |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp104.c               |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp107.c               |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp108.c               |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c               |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c               |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c               |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp102.c             |  21 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/priv.h              |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c             |   9 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c                   |   6 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c                   |   8 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h                   |   2 +-
 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c                      |   5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c               |  44 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c              |  18 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm20b.c              |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c              |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp108.c              |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp10b.c              |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/priv.h               |   3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c              |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.c               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c                |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/perf.c              |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c            |  10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c              |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c           |  12 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.c             |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp10b.c               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c              |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c                |   7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h                |   3 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c           |  83 ++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c           |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/Kbuild               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/{gp100.c => gm200.c} |  18 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c              |  10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c              |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c              |   8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h               |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gt215.c            |   2 +-
 217 files changed, 9921 insertions(+), 2945 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl0039.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl006c.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl006e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl176e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl206e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl502d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl5039.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl507a.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl507c.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl507d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl507e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl826f.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl827c.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl827d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl827e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl837d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl887d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl902d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl9039.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl906f.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl907c.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl907d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl907e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cl917d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/cla0b5.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc37a.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc37b.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc37d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc37e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc57d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc57e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/drf.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/parent.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/printf.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/push.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/push006c.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/push206e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/push507c.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/push906f.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/pushc37b.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_bo0039.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_bo5039.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_bo74c1.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_bo85b5.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_bo9039.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_bo90b5.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_boa0b5.c
 rename drivers/gpu/drm/nouveau/nvkm/subdev/pmu/{gp100.c => gm200.c} (79%)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
