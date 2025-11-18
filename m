Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CBCC6B8C7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB3E10E1F6;
	Tue, 18 Nov 2025 20:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZmDVsGyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CF910E1F6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:18:57 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-949042bca69so109136339f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497136; x=1764101936; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RPQ6bCd475QA3fFyi62XDKAbBtsp5mWcyPeF56KHPAA=;
 b=ZmDVsGyQbEI47BttZ7jyBn8Bi9wFp+B0Ap0fnmw2o+FwPRBhmDV/UPArrZGTzvl4nP
 28GNmMdTh3kd27l3sw2KAZ1aDyEkHPnPRVmTU+/9r0iuQHHHsLYK22o8HSCRyzDVOdfM
 f7GlQHg3c1D1AzNA3mKbizXT2OcUAHQM3/c/ZULuFwNhpNl3Kzh6RdpSiD+Qs41mpa4g
 ayx41j0s4cXcuXfcPwT5ojqTcbh/AYAA1umlgLZnpFed6Uzs9Ug9L6t7vxc8IPedBAdz
 md1jPnzMENYogt1SK8r9YT1xHBbW+U1rgCiDIYzuk0A8pWMVebrMsX1agmXQg0b7pqmK
 jOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497136; x=1764101936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RPQ6bCd475QA3fFyi62XDKAbBtsp5mWcyPeF56KHPAA=;
 b=DTQhAFmtiem4+90Ea1+zJOQX7l6vhJArZTy09582xXN4u9gNSEVm/ZZjn4szLaOmkC
 8T0s67mZa638tNgNDsE6OxLUQCNzv+R3epWT71+QOZhwRrsry83vSP7pxWbQSlORuyxz
 dG1cAfHOTb53Dct05sQi51qEfO2NT9d7yYl/bYL8TZLhwge9/SJlW8+L+qnQbx9U9ZUf
 DFZKiUtHKv+4m2B6NVYvQezDw/6LyyVHBXSfX5P01EIJXxY2g1MkJ5a5hCk1Za1VSE5P
 HXpyRReWcEyQo4sw6iVBTbRmDqlfwFdti0cFSIMfxoqW8mqhev12d5oN1aBTezT2LhxB
 a4og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwPh+2e5TbwyqIk7DxhG/DST7FF8ranT5zuv/yD31ob+q3cD1j6PAXW6L1kxwIa33oWi6Wi6uyx30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy8LN/zkTS0uA2NY1pbKEvgCQw3bneOMwQYchnl1UKKr6E1G4e
 QGyjXM3RSDLlZHQDwjz0L4AHTWsffkTcnFHd4tCFFQcLe3KKKz/ouk+G
X-Gm-Gg: ASbGncu3myAOeoSCzVM0mU2NnpANUIMyMId/vlc/3dv0BybIBsgfVSjvr1vjzb048Iv
 Xma1TrM1r0hKpTxQpkrmsUN5yn4pE8UsBoDshMBE85x1e8MEU/CZvqLnffbY6pOfiBrpYBMDHno
 gnzxOJPM8m5FG7TmUABWjhaVnALN3J+IVsAaJwrHZkqnhP4jOUhgmOGCnx+KVhOlVDMSbX9FyUS
 VUCN9fbDJe3INsx7jVCYvphLADIFtF7sdLDFQQ9u+b/XPDwlCedfatzy83V3vZQhruUYci8Ka9C
 TBGMV5bL5dI498B54DDMbbhUHhCyZKYfACL0kcc/OWrk3c1mmow4gYg3VAa8bA/FA89awfqXX3Z
 zigKmnGQO4JjkG/s300x15IYNEdyhsxH/AzT2g/+8pHesnuAtme37XSiMaqTnEyiL1nGhQeqIKF
 tD1ir401K/xgVXVGhZyPHAE6WU5Ix+/KYi205bH6DY0lLKbgaX7HULAxOf1l/NvSAyq7aAprbhj
 03mhA==
X-Google-Smtp-Source: AGHT+IGLKPvUaWh32Ij0DANLQunKC5RJTP4+T+giKkMfHFhirmWBSXdriag7nPqi2IUKcYIbQ7kG5A==
X-Received: by 2002:a05:6602:29cf:b0:948:3f60:a620 with SMTP id
 ca18e2360f4ac-948e0cd1b09mr2103070039f.1.1763497135810; 
 Tue, 18 Nov 2025 12:18:55 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:18:55 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 00/31] drm/dyndbg: Fix dynamic debug classmap regression
Date: Tue, 18 Nov 2025 13:18:10 -0700
Message-ID: <20251118201842.1447666-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
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

hello all,

commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")

added dyndbg's "classmaps" feature, which brought dyndbg's 0-off-cost
debug to DRM.  Dyndbg wired to /sys/module/drm/parameters/debug,
mapped its bits to classes named "DRM_UT_*", and effected the callsite
enablements only on updates to the sys-node (and underlying >control).

Sadly, it hit a CI failure, resulting in:
commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")

The regression was that drivers, when modprobed, did not get the
drm.debug=0xff turn-on action, because that had already been done for
drm.ko itself.

The core design bug is in the DECLARE_DYNDBG_CLASSMAP macro.  Its use
in both drm.ko (ie core) and all drivers.ko meant that they couldn't
fundamentally distinguish their respective roles.  They each
"re-defined" the classmap separately, breaking K&R-101.

My ad-hoc test scripting helped to hide the error from me, by 1st
testing various combos of boot-time module.dyndbg=... and
drm.debug=... configurations, and then inadvertently relying upon
those initializations.

This series addresses both failings:

It replaces DECLARE_DYNDBG_CLASSMAP with

- `DYNAMIC_DEBUG_CLASSMAP_DEFINE`: Used by core modules (e.g.,
  `drm.ko`) to define their classmaps.  Based upon DECLARE, it exports
  the classmap so USE can use it.

- `DYNAMIC_DEBUG_CLASSMAP_USE`: this lets other "subsystem" users
  create a linkage to the classmap defined elsewhere (ie drm.ko).
  These users can then find their "parent" and apply its settings.

It adds a selftest script, and a 2nd "sub-module" to recapitulate
DRM's multi-module "subsystem" use-case, including the specific
failure scenario.

It also adds minor parsing enhancements, allowing easier construction
of multi-part debug configurations.  These enhancements are used to
test classmaps in particular, but are not otherwize required.

Thank you for your review.

P.S. Id also like to "tease" some other work:

1. patchset to send pr_debugs to tracefs on +T flag

   allows 63 "private" tracebufs, 1 "common" one (at 0)
   "drm.debug_2trace=0x1ff" is possible
   from Lukas Bartoski

2. patchset to save 40% of DATA_DATA footprint

   move (modname,filename,function) to struct _ddebug_site
   save their descriptor intervals to 3 maple-trees
   3 accessors fetch on descriptor, from trees
   move __dyndbg_sites __section to INIT_DATA

3. patchset to cache dynamic-prefixes
   should hide 2.s cost increase.


Jim Cromie (31):

fixes, cleanups, simple stuff:

  dyndbg: factor ddebug_match_desc out from ddebug_change
  dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
  docs/dyndbg: update examples \012 to \n
  docs/dyndbg: explain flags parse 1st
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: tweak pr_fmt to avoid expansion conflicts
  dyndbg: reduce verbose/debug clutter

callchain grooming, re-structs, code simplify/dedup by macros:

  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  selftests-dyndbg: add a dynamic_debug run_tests target
  dyndbg: change __dynamic_func_call_cls* macros into expressions

core fix, api misuse errors, etc.

  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: treat comma as a token separator
  dyndbg: split multi-query strings with %
  selftests-dyndbg: add test_mod_submod
  dyndbg: resolve "protection" of class'd pr_debug
  dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
  docs/dyndbg: add classmap info to howto

 .../admin-guide/dynamic-debug-howto.rst       | 179 +++-
 MAINTAINERS                                   |   3 +-
 include/asm-generic/vmlinux.lds.h             |   5 +-
 include/linux/dynamic_debug.h                 | 302 +++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   5 +
 lib/dynamic_debug.c                           | 776 +++++++++++-------
 lib/test_dynamic_debug.c                      | 198 +++--
 lib/test_dynamic_debug_submod.c               |  21 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 373 +++++++++
 14 files changed, 1457 insertions(+), 461 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.51.1

