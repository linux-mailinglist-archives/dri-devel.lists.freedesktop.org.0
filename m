Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A275A6AD56
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AAE10E685;
	Thu, 20 Mar 2025 18:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ye4x/b88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6677510E685;
 Thu, 20 Mar 2025 18:52:52 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-85da5a36679so108859539f.3; 
 Thu, 20 Mar 2025 11:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496771; x=1743101571; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hu40/8xrKy3ybFqnjhxnpBEwPXrJGJya+7FhcPKlJkY=;
 b=Ye4x/b88CY9ewi4cbXSVk+S8Kun5msxPCS/l01T/wQsHsJysYjj8GU/w58L9mijtMF
 KltXESpxWxm+/frBQXiisqFGE2LSgc5NTf3Pep/zW3k1fczH6XOq+3MFLGGbTTq1tYhk
 +NDIXCa+bu7+yNvFN/t2tHYca1yM30WtHUQE4Cf73kGlG8D/xkICCv20vcW8NuiTjF2w
 EG1TO2pTtiBAI5Flzun8WZmTuLKwQbg/b08qteTEuqckg4PXL0+ENOqqn4GjM4MS3W/0
 j2Cy1vf34LwoALCL6nUDoH8E4v/4kRy7pjaWmLOatU4x4h/18NRTvPEZLNsNa2Qkl2zD
 +gNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496771; x=1743101571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hu40/8xrKy3ybFqnjhxnpBEwPXrJGJya+7FhcPKlJkY=;
 b=KPnLH9xGt6uwLmdMsqAXzcIhs6907E7eEyXyndx6tGzp3cWctyex9KPPD9E8G7oCsr
 5d1A7BgksSN41skQzltSfa6B6b12AGJq5epMLuL5M9/y73DSzDziBV4XBqPkSQ+V/0ww
 geUsQ3HBNCMgUAalKJ5AH9aqQ6yjXA3jFyfGkAA+XJrhrJvUSUmO6/JSZ0iAGVFyaI7S
 KhqaQLRTfCbvnl9efzlUZtNpLVk5XfjBt09Z0zxdIj7//6/9V8YQgpuWEXZt912g6Z82
 D16Zd1HV88Q3ZyPx0J7V487Fg6mbT8wZE7PGirALshA6qv0Nj/AD2WKm/enzLJmgRNBx
 i7iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvXmukIl+b5DwM8W4skHM9Db4sSu0y9MgY/9WY/oXFsNnPx3DgclMTxoTO0bw9RRHS8amZrHjfquHP@lists.freedesktop.org,
 AJvYcCVURUQaM72cVMuthfwW9ZrKdzFMGwcrmjFWR/zQ8IF8HD1/FG+c7+hmb5p/LjiibNfgPwAoSKpkvlrKdY0xlZFa6Q==@lists.freedesktop.org,
 AJvYcCW3c4mjXzPLEzDrEIRs/Yfq35MB8jjbXOwmaAljJhXQTZuFXQccr3iW8p2GaFtsySlo/uxsNQKJ7xYjllZhbg==@lists.freedesktop.org,
 AJvYcCWTQQ2DQigfu6ctwQ9hdKxK8N6lTNCS09QvpxmwRbyTsgoqp2bVjvG1snZEGfAc4ZAb8VCJa8Pa@lists.freedesktop.org,
 AJvYcCXXBgh9NpgM0TTBOL6WDSxVafJvFsK/Wio8p/SD59afDB7HK64tizPyaaTb4pz04ouBZfaRJ6K9rczx@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpz8MBiJzZqM6/X9TkWmu+ZQnwn0flpjs7CU9pRLcvz6Ml/2Zg
 PElFoeA7VmfLgkT8VamCxGFduhElmRXaKabuc6B3Mt9h1DxtsUfH
X-Gm-Gg: ASbGncv92n9RHHx7PxhXHA5xwZgEk9JBUFH9W5Td9JezcYGgFSOxuw2X4qoACbp3T4F
 AxHiowjwGYAQSjKrJK3QKot7WyrHG4XVtVOb/G6S6rzherwM2h/VSjyoM4AIOqUCrbJjqumG8mr
 LDEY1FPAA3CMvBazZMMsQoqW0169NnKuIY4pdjThUqzRnoIP5v5NNJxvqGVHICZaBvqDEgyagkq
 0z11D7LpNhbrvVFHZ4cQNR0KsIJlJiXun4rAHOykyGPlGXKTktSnxJnOtyRouyEMLMmgQhBuc1f
 +yGvmf8gOg/tbI7M4ktjvbtuleOEuripmVymzEFT/HKahQmGNJCVPZ3g7YBsoIDDdNQG+UIptGc
 www==
X-Google-Smtp-Source: AGHT+IFejL3Eb5kNmESOTMYZvjLufYJJ+QsWlU+j6U/jyfqDrjtj6mmmDpCmVg7Js6NBhayqbz23HA==
X-Received: by 2002:a05:6602:3807:b0:85e:17c5:bb94 with SMTP id
 ca18e2360f4ac-85e2ca35542mr48104539f.1.1742496771210; 
 Thu, 20 Mar 2025 11:52:51 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:52:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 00/59] Fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
Date: Thu, 20 Mar 2025 12:51:38 -0600
Message-ID: <20250320185238.447458-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

This series fixes dynamic-debug's support for DRM debug-categories.
Classmaps-v1 evaded full review, and got committed in 2 chunks:

  b7b4eebdba7b..6ea3bf466ac6	# core dyndbg changes
  0406faf25fb1..ee7d633f2dfb	# drm adoption

Then DRM-CI found a regression when booting with drm.debug=<initval>;
the pr_debug callsites' static-keys under the drm-dbgs in drm.ko got
enabled, but those in drivers & helpers did not, since they weren't
yet modprobed, and didn't yet exist.

Design Review / Restatemment:

My primary design goal for dyndbg-classmaps was DIRECT support of DRM,
with NO api changes, starting with the enum drm_debug_category typing,
and keeping as much of the existing macro stack as unaltered as possible.

Some UUID-ish thing was OO-scope; pessimizing unseen optimizations on
compile-time constant ints (that could fit in a byte), across DRM's
macro stack, with ~5k expansions, would be ungood.

Immediate consequences:

= unique integers are *hard* to coordinate across the whole kernel.

= 0 is not special - DRM_UT_CORE is already used.
  other users probably want it too
  
= 0..N are special - they're exposed in sysfs knobs.
  ie: echo 0x1ff > /sys/module/drm/parameters/debug
  all classmap-param users get 0..N on their knob.

= DRM_UT_<*> has only 10 categories/classes
  small enough for DIRECT storage inside the _ddebug descriptor

= DRM's enum gives us both class-names and class/category values.
  classnames === stringified DRM_UT_<*>
  class_ids  === bare DRM_UT_<*>
  all future classmap users are expected to follow this model.
  
We need to "privatize" the class_id's, per module.
We can do this in a few steps:

= modules declare their map: classnames => Ids.
  author defined, user oriented
  classnames/strings is wide, expressive interface
  2-levels used, DRM_UT_*, no 3-levels yet;
  _UT could vary, but has no meaning now.

We can use the known (and desired) ordering/contiguity of the 0..Ns
here, and of the array of classnames, to simplify the specification of
the map:

  _CLASSMAP_DEFINE (_base-ID/start-of-range, list-of-classnames)

no sparse maps, no reorder-maps, nothing extra to think about.
Just classnames to manipulate class_ids/categories.

= dyndbg refuses direct selection by class_ids.
  this privatizes them
  "speak my class-name if you expect a response".

= dyndbg requires "grammar access only"
  ie: "class DRM_UT_CORE +p" >control
  ie: "name the class to change it"
  class-param handler feeds cmd-strings thru ddebug_query().

= classname --> class_id lookup "validates" the user.
  unknown classnames can be discarded, per module.
  other modules get the same,
  no other class-user would accidentally know "DRM_UT_CORE"

= with private class_ids per module.
  a small 0..N range is enough.
  32 is a practical limit for a single classmap,
  if you think "echo 0x12345678 > $sysknob" is practical.
  16 is more practical, DRM has 10.
  we have 63. this allows..

= multiple classmaps are supported
  as long as the mapped class_ids dont conflict.
  a fair requirement for a narrow, future use-case.
  this is now verified in this patchset.
  7x 8-bit classes is workable (if you'd like)

= "legacy" class.
  all existing (un-class'd) pr_debugs.
  class_id is a 6-bit integer,
  so all existing pr_debugs need a default.
  63 = 2^6-1 is our _DFLT
  0..62 is then available for named classes. (0 is not special)
  63 is "legacy".


And now on to the nascent disagreement between Jason and myself:
classmaps-v1 "protected" new classes from changes by legacy/_DFLT
queries.  Jason saw this as a "special-case" conferred on the class
keyword; all other keywords have no selectivity until they're queried.

After realizing this was unsettled, I found a technical fix: split the
class-mismatch case to queried-class-mismatch (not special, so skip)
OR class'd-site-vs-DFLT-query.  Now we can make a policy decision,
named: ddebug_client_module_protects_classes().

IIRC @DVetter expressed unconcern about protecting DRM_UT_* classes
from unintended alteration, so the above macro is set false, per
Jason's preference.

Should dispositions change, we could perhaps just set the macro true,
since DRM is the only classmap usage so far.  Or perhaps make it the
using module's choice, with a flag in _ddebug_info, and maybe a new
DD_CLASSMAP_TYPE to convey it to dyndbg wo api tweaks.

Previous Rev(s):

https://lore.kernel.org/lkml/20250125064619.8305-1-jim.cromie@gmail.com/
Ive incorporated the Reviewed-by:s and Tested-by:s offered there.

DRM-CI runs:

https://patchwork.freedesktop.org/series/135669/
https://patchwork.freedesktop.org/series/139147/

Changes since:

= one more mea-culpa fix
= squash 3 verbose-tweak patches together
= lots of cleanup/refactoring patches brought forward
  or squashed, reducing churn.

= regularize section names & linker symbols.
  any naming conventions I missed ?

= new _DPRINTK flags for LOOKUP, CACHED_PREFIX
  use LOOKUP to refine dynamic_emit_prefix()

= cleanup most spurious name variances:
  s/\bdd_|\bddebug_/_ddebug_/g
  most of s/DYNDBG/DYNAMIC_DEBUG/.
  
= moved doc patches to back of dydnbg-core part.
  more wordsmithing / bikeshedding chances
  the classmaps-info might be over-specifying

= one trailing RFC patch for DRM to consider
  attempt to link in a drm_dbg_client.o classmap-user everwhere
  _CLASSMAP_USE at a distance.

Jim Cromie (59):
  vmlinux.lds.h: fixup HEADERED_SECTION{,_BY} macros
  docs/dyndbg: update examples \012 to \n
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: reduce verbose/debug clutter
  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: add 2 new _DPRINTK_FLAGS_: INCL_LOOKUP, PREFIX_CACHED
  dyndbg: split _emit_lookup() out of dynamic_emit_prefix()
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  selftests-dyndbg: add tools/testing/selftests/dynamic_debug/*
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNDBG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: move .mod_name from/to structs ddebug_table/_ddebug_info
  dyndbg: treat comma as a token separator
  selftests-dyndbg: add comma_terminator_tests
  dyndbg: split multi-query strings with %
  selftests-dyndbg: test_percent_splitting
  selftests-dyndbg: add test_mod_submod
  dyndbg: change __dynamic_func_call_cls* macros into expressions
  dyndbg: drop "protection" of class'd pr_debugs from legacy queries
  docs/dyndbg: explain new delimiters: comma, percent
  docs/dyndbg: explain flags parse 1st
  docs/dyndbg: add classmap info to howto (TBD)
  checkpatch: dont warn about unused macro arg on empty body
  drm: use correct ccflags-y spelling
  drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
  drm-dyndbg: adapt DRM to invoke DYNAMIC_DEBUG_CLASSMAP_PARAM
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
  drm: RFC - make drm_dyndbg_user.o for drm-*_helpers, drivers

 .../admin-guide/dynamic-debug-howto.rst       | 127 +++-
 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/Kconfig                       |   3 +-
 drivers/gpu/drm/Makefile                      |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
 drivers/gpu/drm/drm_dyndbg_user.c             |  11 +
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
 include/asm-generic/vmlinux.lds.h             |  12 +-
 include/drm/drm_print.h                       |  12 +
 include/linux/dynamic_debug.h                 | 225 ++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   3 +
 lib/dynamic_debug.c                           | 656 +++++++++++-------
 lib/test_dynamic_debug.c                      | 203 ++++--
 lib/test_dynamic_debug_submod.c               |  21 +
 scripts/checkpatch.pl                         |   2 +-
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   2 +
 .../dynamic_debug/dyndbg_selftest.sh          | 364 ++++++++++
 39 files changed, 1329 insertions(+), 501 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_dyndbg_user.c
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.48.1

