Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B084B924A38
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5362010E6A9;
	Tue,  2 Jul 2024 21:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lva3rFg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B9210E6A9;
 Tue,  2 Jul 2024 21:58:15 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7ec0385de1fso173993939f.3; 
 Tue, 02 Jul 2024 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957494; x=1720562294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fl2FF9Ma/I8h3PqNjR+deguiV1BjKiYak4AQnpA/EpA=;
 b=Lva3rFg4h+HHb2M/pbw8NzlBHe9WEmUBa88npLhObQEdiy8Lz0HNPJ25dtP6J5q7pt
 ixBvDWBotjPgbPhOVymajh6ES5znpiKEwO6EwTMr+K/V3DxIv3IZK4jyS6Cv+5wEpyH5
 hAj59TCycV7QUkcKRB0nleL9HaQOxIHZEf9Jv/c8sUE18heJy6EhMQKH+kqbapqywqIU
 Tl0dwOMMYeyGO7Gs7dFB0YqPI2VhzKAmSlfG6gpnRtxshNUSRtslmyJcYpdsU3RIu7nJ
 QohUG35wpKKVeE0R0awJd9U7paomyYIWKOUM8KjZE+dkb3akXBBoKcwJMxA5yvk9ukxH
 /toQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957494; x=1720562294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fl2FF9Ma/I8h3PqNjR+deguiV1BjKiYak4AQnpA/EpA=;
 b=wztgdmn0sdLXQrvB7yx0/bzRkRTgiuj5pyweAx08ijZrTmT2XIUgFf1cLU8vIggj5v
 m0OMj5/0OupdGGDK06eDHtEPk+vhTp/n9XQfZyQsf+Fxa/7sLdpHiqqNGHWzW20FE2tI
 wjb9pZv4FY4rrSvsXCvB1M+oDfDevnHjZTSu7jA0g0hXGrh9fIyro+/q1vJ0CNX1q+Xs
 RziLsd+CoyLWBRhXfwuSVwsrhDffT78JUSwo7GSQpxq44Yr5d5G/E0AaV72mzO+ZpsQL
 A3A7GfY3gA8/oQYKFqkGYo0TXifojRqFJI0jjherI96OmiEa/UlyoIC8iCoZgDNpKA3b
 6vog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ/w5ernel6+Rk7C+6m3x9XLue99RlLFMOalLNzA3Nc7MAEyPPwmOS+6fphYs454kDH71D+QHvVyGwQcwaZ94WM6qYWmtKoCLjYwpV+/++CBCz0otm4E8i8ELYT8IeZvEnbZJKXig9SsiDiFu+KDucGicFXTf0f0bT7bHWsqfkJ0+E+R1Rz54MUFGu7iU1POCmJt5Ca6WAB77GIHxxz7ZnGVwNiEXGVahA9pqhtTlj+oWMMog=
X-Gm-Message-State: AOJu0YyafYc54F8qNKoyed+sW47di6R5tS7pHLbyjrIMQ1IHJbFExEOg
 3MUHPqGjFI6ZTAGqXwUkIjemH56r+9CTDLm7bwem1O4jEETc1S/r
X-Google-Smtp-Source: AGHT+IGaEXgYKgGRee2GarLYqwSUqyegplLELGXvlNn9MGuEctJXOEfcGJyWIGJ/hUK31AN85K/RRQ==
X-Received: by 2002:a05:6602:15c2:b0:7f6:19b9:3a3b with SMTP id
 ca18e2360f4ac-7f62edfe2e9mr1312922239f.1.1719957493878; 
 Tue, 02 Jul 2024 14:58:13 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:13 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 00/53] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
Date: Tue,  2 Jul 2024 15:56:50 -0600
Message-ID: <20240702215804.2201271-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
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

This fixes dynamic-debug support for DRM.debug, added via classmaps.
commit bb2ff6c27bc9 (drm: Disable dynamic debug as broken)

CONFIG_DRM_USE_DYNAMIC_DEBUG=y was marked broken because drm.debug=val
was applied when drm.ko was modprobed; too early for the yet-to-load
drivers, which thus missed the enablement.  My testing with
/etc/modprobe.d/ entries and modprobes with dyndbg=$querycmd options
obscured this omission.

The fix is to replace invocations of DECLARE_DYNDBG_CLASSMAP with
DYNDBG_CLASSMAP_DEFINE for core, and DYNDBG_CLASSMAP_USE for drivers.
The distinction allows dyndbg to also handle the users properly.

DRM is the only current classmaps user, and is not really using it,
so if you think DRM could benefit from zero-off-cost debugs based on
static-keys, please test.

HISTORY

9/4/22  - ee879be38bc8..ace7c4bbb240 commited - classmaps-v1 dyndbg parts
9/11/22 - 0406faf25fb1..16deeb8e18ca commited - classmaps-v1 drm parts

https://lore.kernel.org/lkml/Y3XUrOGAV4I7bB3M@kroah.com/
greg k-h says:
This should go through the drm tree now.  The rest probably should also
go that way and not through my tree as well.

https://lore.kernel.org/lkml/20221206003424.592078-1-jim.cromie@gmail.com/
v1- RFC. adds DYNDBG_CLASSMAP_DEFINE + test-submod to recap DRM failure

https://lore.kernel.org/lkml/20230113193016.749791-1-jim.cromie@gmail.com/
v2- w RFC on "tolerate toggled state"

https://lore.kernel.org/lkml/Y8aNMxHpvZ8qecSc@hirez.programming.kicks-ass.net/
- PeterZ - nacks tolerance of insane/uninit static-key state

https://lore.kernel.org/lkml/8ca08fba-1120-ca86-6129-0b33afb4a1da@akamai.com/
- JasonB diagnoses prob - set jump-label b4 init

7deabd674988 dyndbg: use the module notifier callbacks
- JasonB lands fix for my problem
  he moves dyndbg to use notifiers to do init, like & after jump-labels

https://lore.kernel.org/lkml/20230125203743.564009-20-jim.cromie@gmail.com/
v3- probing, workaround-ish

https://lore.kernel.org/lkml/20230713163626.31338-1-jim.cromie@gmail.com/
v4 - 7/13/23
- had extra/unused __UNIQUE_ID warnings/errs on lkp-tested arches
  due to unmatched __used marks
- RandyD doc fixes, thx.

https://lore.kernel.org/lkml/20230801170255.163237-1-jim.cromie@gmail.com/
v5 - 8/1/23
- lkp-test reported panics-on-boot
  https://lore.kernel.org/lkml/202308031432.fcb4197-oliver.sang@intel.com/
- DRM=y in apply-params
- missing align(8) in init-macro, failed only for builtin modules

https://lore.kernel.org/lkml/20230911230838.14461-1-jim.cromie@gmail.com/
v6 - 9/11/23 - no feedback

v7[a-d] - attempts to get into/thru DRM patchwork CI..
- "jenius" struck, I preserved DECLARE_DYNDBG_CLASSMAP til later

v8[a-i] - added tools/testing/selftests/dynamic_debug/*

- now turnkey testable without DRM


CLASSMAPS FROM THE TOP

dynamic-debug classmap's primary goal was to bring zero-off-cost
debugs, via static-keys, to DRM.

drm.debug: is ~5000 debugs across core, drivers, helpers; each in 1 of
10 exclusive categories, all controlled by bits in a sysfs knob.

  drm.debug=0x1ff  # bootarg
  echo 0x4 > /sys/module/drm/parameters/debug  # run-time setting

Below the sysfs interface, classmaps are exposed in the >control
grammar with a new "class" keyword.  This is mostly like the other
keywords, differing by:

a- classnames are client/subsystem/domain defined, not code-name-structural.
   the classnames are global, across system
   IOW: "class DRM_UT_CORE" selects on any module which knows the class

b- classes are protected from unqualified modification.

   # cannot disable any DRM (or other) classes
   echo -p > /proc/dynamic_debug/control

c- classes don't have wildcards - add if needed.
   DRM uses "${SUBSYS}_${CATNAME}"
   probably more useful with "${TOP}_${MID}_${LOW}" classnames

API in use:

DRM defines its categories with an enum-type, the obvious thing to do
was to copy/emulate that for classmaps; this also preserves the
__pr_dbg_class(DRM_UT_CORE, "core stuff") style already used in drm's
~5000 drm_dbg_* macro calls.

DYNDBG_CLASSMAP_DEFINE(drm_debug_classes, ...);
DYNDBG_CLASSMAP_USE(drm_debug_classes);

Classmaps get DEFINEd once (in drm.ko for core) and USEd (in drivers
and helpers), these 2 declarations respectively define and export a
classmap (in core), and refer to the exported class-struct from the
modules.

They both tell dynamic-debug that the module has some of these class'd
pr_debugs, so dyndbg uses the classmap's names to validate >control inputs.

The distinction allows USErs to act differently than the DEFINEr; they
have to follow the ref back to the DEFINEing module, find the kparam
connected to the classmap, and lookup and apply its modprobed value.
(this is the bug-fix).

Dyndbg uses the classnames to validate "class FOO" >control inputs,
and apply the changes to each module that has DEFINEd or USEd the
classmap.

This makes classmaps opt-in: modules must _DEFINE or _USE a classmap
for their class'd pr_debug()s to be >control'd.

NOTE: __pr_dbg_class(1, "const-int unreachable class 1"); is legal,
but not controllable unless the const 1 has been mapped to a _DEFINE'd
classname.

NB: and __pr_dbg_class(i++, "undeclared class") is illegal.

In drm_print.c we have:

/* classnames must match value-symbols of enum drm_debug_category */
DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
                    DRM_UT_CORE,
                    "DRM_UT_CORE",
                    "DRM_UT_DRIVER",
                    "DRM_UT_KMS",
                    "DRM_UT_PRIME",
                    "DRM_UT_ATOMIC",
                    "DRM_UT_VBL",
                    "DRM_UT_STATE",
                    "DRM_UT_LEASE",
                    "DRM_UT_DP",
                    "DRM_UT_DRMRES");

This maps the sequence of "classnames" to ints starting with DRM_UT_CORE.
other offsets allow sharing the per-module 0..63 class-id space
  
Only complete, linear maps are recommended.

An APPLY_FN(__stringify, __VA_ARGS__) would fix the "string-indirection"
I have one written, but didnt want to overload this submission.

DYNDBG_CLASSMAP_PARAM_REF() creates the sysfs-kparam classbits knob,
binding the extern'd long-int/bitvec to the classmap.

DRM's categories are independent of each other.  The other possible
classmap-type/behavior is "related", ie somehow "ordered": V3>V2.  The
relatedness of classes in a classmap is enforced at the kparam, where
they are all set together, not at the >control interface.

THE PATCHSET has 2 halves:

1- dynamic-debug fix - API change

The root cause was DECLARE_DYNDBG_CLASSMAP tried to do too much, and
its use in both core and drivers, helpers couldnt sort the difference.

The fix is to replace it with DYNDBG_CLASSMAP_DEFINE in core, and
DYNDBG_CLASSMAP_USE in drivers,helpers. The 1st differs from -v1 by
exporting the classmap, allowing 2nd to ref it.  They respectively add
records to 2 ELF sections in the module.

Now, dyndbg's on-modprobe handler follows the _USE/refs to the owning
module, finds the controlling kparam: drm.debug, and applies its value
thru the classmap, to the module's pr_debugs.

Recent revs of this patchset added a selftest for dyndbg, which
recapitulates the DRM regression scenario using the 2 test modules.
The test verifies that the dependent module is initialized properly
from the parent's classmap kparam.

So it gives a basic turnkey selftest:

 [root@v6 b0-dd-drm]# V=0 ../../tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh 
 # consulting KCONFIG_CONFIG: .config
 # BASIC_TESTS 
 : 0 matches on =p
 : 14 matches on =p
 : 0 matches on =p
 : 21 matches on =mf
 : 0 matches on =ml
 : 6 matches on =mfl
 ...
 # Done on: Sun Jun 30 10:34:24 PM MDT 2024
	 
This latest rev fixes the test for the various CONFIG_DYNAMIC_DEBUG*
build combos, by skipping some subtests where the expected counts are
wrong. Lukasz Bartosik caught this - thanks.
CC: ukaszb@chromium.org


2- DRM fixes - use new api.

These are largely unchanged since -v1 above:

a. update core to invoke DRM_CLASSMAP_DEFINE
b. wrap DYNDBG_CLASSMAP_* with DRM_CLASSMAP_* - hide ifdef

c. now with separate +DRM_CLASSMAP_USE patches for each driver/helper: 
d. and defer dropping DECLARE_DYNDBG_CLASSMAP til later

Maybe theres a single place to invoke DRM_CLASSMAP_USE just once,
perhaps from a client library c-file. I poked a little, didn't find it.

Patches are against v6.9
theyre also at:
tree/branch: https://github.com/jimc/linux.git dd-classmap-fix-8i
branch HEAD: dd31011435409a5bd70cc92bfd846407f6f1a2d8  drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN


Finally, classmaps are in a meta-stable state right now; some governor
might walk it over to the gravel pit out back.

Tested-bys would help greatly, get it off the fence it straddles.
Please specify method: selftest or drm.debug=0x1ff boot.

Also entertaining Reviewed-bys :-}


Jim Cromie (52):

DYNAMIC-DEBUG parts:

cleanup:
  docs/dyndbg: update examples \012 to \n
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: replace classmap list with a vector

prep:
  dyndbg: ddebug_apply_class_bitmap - add module arg, select on it
  dyndbg: split param_set_dyndbg_classes to _module & wrapper fns
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: reduce verbose/debug clutter
  dyndbg: silence debugs with no-change updates
  dyndbg: tighten ddebug_class_name() 1st arg type
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: reduce verbose=3 messages in ddebug_add_module

API changes & selftest:  
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP
  selftests-dyndbg: add tools/testing/selftests/dynamic_debug/*
  dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
  dyndbg-doc: add classmap info to howto
  dyndbg: treat comma as a token separator
  selftests-dyndbg: add comma_terminator_tests
  dyndbg: split multi-query strings with %
  selftests-dyndbg: test_percent_splitting
  docs/dyndbg: explain new delimiters: comma, percent
  selftests-dyndbg: add test_mod_submod
  dyndbg-doc: explain flags parse 1st
  dyndbg: change __dynamic_func_call_cls* macros into expressions
  selftests-dyndbg: check KCONFIG_CONFIG to avoid silly fails
  dyndbg-selftest: reduce default verbosity

DRM-parts:

  drm: use correct ccflags-y spelling
  drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
  drm-dyndbg: adapt DRM to invoke DYNDBG_CLASSMAP_PARAM
  drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
  drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
  drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
  drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
  drm-dyndbg: DRM_CLASSMAP_USE in nouveau
  drm-print: workaround unused variable compiler meh
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

 .../admin-guide/dynamic-debug-howto.rst       |  99 ++-
 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/Kconfig                       |   3 +-
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +
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
 include/drm/drm_print.h                       |  10 +
 include/linux/dynamic_debug.h                 | 135 ++-
 kernel/module/main.c                          |   3 +
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   3 +
 lib/dynamic_debug.c                           | 436 ++++++----
 lib/test_dynamic_debug.c                      | 131 +--
 lib/test_dynamic_debug_submod.c               |  17 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   2 +
 .../dynamic_debug/dyndbg_selftest.sh          | 810 ++++++++++++++++++
 37 files changed, 1453 insertions(+), 363 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.45.2

