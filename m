Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB596A1C131
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAE410E28F;
	Sat, 25 Jan 2025 06:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mjs600GI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D60210E120;
 Sat, 25 Jan 2025 06:46:37 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3cfc8a2415fso5389885ab.2; 
 Fri, 24 Jan 2025 22:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787596; x=1738392396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BY8YMH0iIPlYMgVdZex9+HmEV7Jp9ioEpu+DsD/l5+I=;
 b=mjs600GIGxfGYFGo1HeeKHJXFFHGOkoFXBDB31z2nJbPqqUQb4rBMA8jLU9Nr/QRCa
 iShm28t0NKE9OmnCn5aVjvmXF+oxN+kaIj2kAUPQDwtFVs5hc+CVDmFkISOGWXPAWmA1
 KnoHte0d7edO/6amzyCwNjZGQKAq+6GwdET7dU0PAMGI58ao+TI1zLi7+BhrcBgobKDx
 r7mGljjF2eZkLwYAfDfd82tfc2fEkZkXiV/nwfsL/9iJ85oIKT5vYHWqssy5GAWszG7L
 +NmuhKhgjgdTAI5A4p26kXZ2kRMoLAJdnpFYwW5AyHjjYnCfGYTpji7FKGp7ldVehZW7
 zClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787596; x=1738392396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BY8YMH0iIPlYMgVdZex9+HmEV7Jp9ioEpu+DsD/l5+I=;
 b=i2TMmRaD9HIsUPRtr0VeH/CsUXz4jnyyUYSNyankHgnhk/g5h47zjx1wBrhUwSd7Lp
 9MdQn6+ZLf4ssN5ge5F1WoVhGaO/GbOmF9hbJnp/vgD7aiqd5BTmV0r9GJKQhPz13nbN
 YLzloZeqN7YJ7LcanUnjrjLyTCrE9TQrMgc5ZPx+5WS5R3eTNBavfNOPL/fL3Sq3HS5C
 +x7Tzvq4+2o/GmV80putkGEBRAklUSmvn/AVbsIvmZogHyfpEE0tF6m0EeHsSyGOwTQK
 Os/Id3jx75RThJgTUvF9tKz1LLmr7vywyCiY77a88clEY6AKvEczPaHWB2nKrxlGykyh
 Fwsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl1kR5kv2JLC50W3N1VCeSmOI6sTxF2mheypMQXBZ5VhyM9seRsysoGMMWueQvypFKt6D8+HX7MFvV@lists.freedesktop.org,
 AJvYcCX7XFGBRpC3ZntBfDDyT6eMH6GYevZZfEr7G+OqveXngCjF3EeEi7EeW48mJG5t2VNoRZkVh1AO@lists.freedesktop.org,
 AJvYcCXcziHO4GZbkMIP5hqVPz5i0yRmts5k3AIoqNhTaoMEGtenqHnjxikpMaCfU8xeaYp1IC7xUfbgM+5qqpLzEg==@lists.freedesktop.org,
 AJvYcCXjMsrl6Q8O+qe+2ocJi7s+vOMLuJgrzFO5WpxfxaugBfu4wLTDzdgaIL/PuRwJXYwqFO1TN6ydNPJ5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzOpon5su9xRFeRY+HfSVPtIR+bvWn2+l64nxNlPtwAR5+5U9D
 jRmnQ7oYuiCwFtKpEbhMJRSSxKbG6c/Evr989HZXV7cwzOxsKXZK
X-Gm-Gg: ASbGncs4ktI8awcOZh4NHKt2BXdpyEQrEDYbD98jjbhzvIj0WQp51cUmH4CwAYxPbQT
 Pfnho3ZURJNsR8r1/nMUQ23YohsCQa8L4kbHnlvto0lCK5DJCcvi3Zb0V5QGussXFV31akPWCqd
 YzQcZSnzDi4QYtGSiFeWOlhJVrCdn0HTvewg9U2GqaI9rOtdBj64BIKsN5x/7ps47Fzm+bW2DpS
 ToI28cG5gbqMUmfQj7zFHzvFs3K+EfyfNRSIFbBnuAYl+WDyeMXo6L6NHVRbT8M4P8hBkuLjynl
 RGhg4FgjuYAftbDOhdEDC4A7tb+vLP7rda6dfA==
X-Google-Smtp-Source: AGHT+IGi5/oZTF8d6BIyaT1Q5fzqP190LhKzq21/L3uhNeiGSML1hTg+8Ges4vg05iNJ7ZKPm9dWZg==
X-Received: by 2002:a05:6602:3c3:b0:84a:78ff:1247 with SMTP id
 ca18e2360f4ac-851b6286c35mr3044361339f.9.1737787596399; 
 Fri, 24 Jan 2025 22:46:36 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:35 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 00/63] Fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
Date: Fri, 24 Jan 2025 23:45:14 -0700
Message-ID: <20250125064619.8305-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
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

This series fixes dynamic-debug's support for DRM debug-categories.
Classmaps-v1 evaded full review, and got committed in 2 chunks:

  b7b4eebdba7b..6ea3bf466ac6	# core dyndbg changes
  0406faf25fb1..ee7d633f2dfb	# drm adoption

DRM-CI found a regression during init with drm.debug=<initval>; the
static-keys under the drm-dbgs in drm.ko got enabled, but those in
drivers & helpers did not.

Root Problem:

DECLARE_DYNDBG_CLASSMAP violated a K&R rule "define once, refer
afterwards".  Replace it with DYNDBG_CLASSMAP_DEFINE (invoked once in
drm-core) and DYNDBG_CLASSMAP_USE (invoked repeatedly, in drivers &
helpers).

_DEFINE exports the classmap it creates (in drm.ko), other modules
_USE the classmap.  The _USE adds a record ref'g the _DEFINEd (&
exported) classmap, in a 2nd __dyndbg_class_users section.

So now at modprobe, dyndbg scans the new section after the 1st
__dyndbg_class_maps section, follows the linkage to the _DEFINEr
module, finds the (optional) kernel-param controlling the classmap,
examines its drm.debug=<initval>, and applies it to the module being
initialized.

To recapitulate the multi-module problem wo DRM involvement, Add:

A. tools/testing/selftests/dynamic_debug/*

This alters pr_debugs in the test-modules, counts the results and
checks them against expectations.  It uses this formula to test most
of the control grammar, including the new class keyword.

B. test_dynamic_debug_submod.ko

This alters the test-module to build both parent & _submod ko's, with
_DEFINE and _USE inside #if/#else blocks.  This recap's DRM's 2 module
failure scenario, allowing A to exersize several cases.

The #if/#else puts the 2 macro uses together for clarity, and gives
the 2 modules identical sets of debugs.

Recent DRM-CI tests are here:
  https://patchwork.freedesktop.org/series/139147/

Previous rev:
  https://lore.kernel.org/lkml/20240716185806.1572048-1-jim.cromie@gmail.com/

Noteworthy Additions:

1- drop class "protection" special case, per JBaron's preference.
   only current use is marked BROKEN so nobody to affect.
   now framed as policy-choice:
   #define ddebug_client_module_protects_classes() false
   subsystems wanting protection can change this.

2- compile-time arg-tests in DYNDBG_CLASSMAP_DEFINE
   implement several required constraints, and fail obviously.

3- modprobe time check of conflicting class-id reservations
   only affects 2+classmaps users.
   compile-time solution not apparent.

4- dyndbg can now cause modprobe to fail.
   needed to catch 3.
   maybe some loose ends here on failure.

5- refactor & rename ddebug_attach_*module_classes
   reduce repetetive boilerplate on 2 types: maps, users.
   rework mostly brought forward in patchset to reduce churn
   TBD: maybe squash more.

Several recent trybot submissions (against drm-tip) have been passing
CI.BAT, and failing one or few CI.IGT tests randomly; re-tests do not
reliably repeat the failures.

its also at github.com:jimc/linux.git
  dd-fix-9[st]-ontip  &  dd-fix-9-13

Ive been running it on my desktop w/o issues.

The drivers/gpu/drm patches are RFC, I think there might be a single
place to call DRM_CLASSMAP_USE(drm_dedbug_classes) to replace the
sprinkling of _USEs in drivers and helpers.  IIRC, I tried adding a
_DEFINE into drm_drv.c, that didn't do it, so I punted for now.

I think the dyndbg core additions are ready for review and merging
into a (next-next) test/integration tree.

Jim Cromie (63):
  docs/dyndbg: update examples \012 to \n
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: replace classmap list with a vector
  dyndbg: ddebug_apply_class_bitmap - add module arg, select on it
  dyndbg: split param_set_dyndbg_classes to _module & wrapper fns
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: reduce verbose/debug clutter
  dyndbg: silence debugs with no-change updates
  dyndbg: tighten ddebug_class_name() 1st arg type
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: reduce verbose=3 messages in ddebug_add_module
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  checkpatch: add an exception to the do-while wrapper advice
  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: check DYNDBG_CLASSMAP_DEFINE args at compile-time
  dyndbg: add/use for_subvec() to reduce boilerplate
  dyndbg: make proper substructs in _ddebug_info
  dyndbg: drop premature optimization in ddebug_add_module
  dyndbg: allow ddebug_add_module to fail
  dyndbg: rework ddebug_attach_*module_classes()
  dyndbg: fail modprobe on ddebug_class_range_overlap()
  dyndbg: hoist the range-overlap checks
  ddebug: cleanup-range-overlap fails
  dyndbg-test: change do_prints testpoint to accept a loopct
  selftests-dyndbg: add tools/testing/selftests/dynamic_debug/*
  dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
  dyndbg-doc: add classmap info to howto
  dyndbg: treat comma as a token separator
  selftests-dyndbg: add comma_terminator_tests
  dyndbg: split multi-query strings with %
  selftests-dyndbg: test_percent_splitting
  docs/dyndbg: explain new delimiters: comma, percent
  selftests-dyndbg: add test_mod_submod
  docs/dyndbg: explain flags parse 1st
  dyndbg: change __dynamic_func_call_cls* macros into expressions
  dyndbg: drop "protection" of class'd pr_debugs from legacy queries
  drm: use correct ccflags-y spelling
  checkpatch: dont warn about unused macro arg on empty body
  drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
  drm-dyndbg: adapt DRM to invoke DYNDBG_CLASSMAP_PARAM
  drm-print: fix config-dependent unused variable
  drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
  drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
  drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
  drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
  drm-dyndbg: DRM_CLASSMAP_USE in nouveau
  drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
  drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
  drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
  drm-dyndbg: add DRM_CLASSMAP_USE to bochs
  drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
  drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
  drm-dyndbg: add DRM_CLASSMAP_USE to radeon
  drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
  drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
  drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
  drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the drm_gem_shmem_helper driver
  drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN

 .../admin-guide/dynamic-debug-howto.rst       | 116 +++-
 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/Kconfig                       |   3 +-
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   1 +
 drivers/gpu/drm/drm_print.c                   |  38 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |   2 +
 drivers/gpu/drm/gma500/psb_drv.c              |   2 +
 drivers/gpu/drm/gud/gud_drv.c                 |   2 +
 drivers/gpu/drm/i915/i915_params.c            |  12 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   2 +
 drivers/gpu/drm/radeon/radeon_drv.c           |   2 +
 drivers/gpu/drm/tiny/bochs.c                  |   2 +
 drivers/gpu/drm/tiny/simpledrm.c              |   2 +
 drivers/gpu/drm/udl/udl_main.c                |   2 +
 drivers/gpu/drm/virtio/virtgpu_drv.c          |   2 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +
 drivers/gpu/drm/xe/xe_drm_client.c            |   2 +
 include/asm-generic/vmlinux.lds.h             |   1 +
 include/drm/drm_print.h                       |  12 +
 include/linux/dynamic_debug.h                 | 193 ++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   3 +
 lib/dynamic_debug.c                           | 555 +++++++++++-------
 lib/test_dynamic_debug.c                      | 181 +++---
 lib/test_dynamic_debug_submod.c               |  17 +
 scripts/checkpatch.pl                         |   3 +-
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   2 +
 .../dynamic_debug/dyndbg_selftest.sh          | 364 ++++++++++++
 38 files changed, 1205 insertions(+), 425 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.48.1

