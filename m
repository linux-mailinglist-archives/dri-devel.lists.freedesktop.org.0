Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25773D1C003
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA8210E589;
	Wed, 14 Jan 2026 01:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oulxzc75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2618810E5A2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:58:45 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-7cfcb5b1e2fso92553a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355924; x=1768960724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=teYKKbLkZbUHHb5EH1qkAwDiVubshmdqathiyRgte04=;
 b=Oulxzc75zyc+jmNxemwRA0mDNkGaY0SX8L1kyk9CDqfD9fHgmG/+XI/Eb9I0bp5z+M
 avmuF7fu6+cXc2f/TWSaLLuvyYksWf8Z/f7IeOJt9UTz9c2QWcRyrIsNwPo9Csdsah+2
 W2Wiv65Vtm1F12oYbsT6Eoxu0zIThQTv97CQI6vfrk3erwQxzhU9JAh+hjRN4UCmLrpV
 kbCyoWV6uTUL6cQp6Egbz6qfsRnnyicq3RauGcNRVdpzaV++xL7YAskZWxjULz+pzZEr
 AbbGFL/hzmsVQTyLyJwZcbgSSooprZvO7Vg/Tj9TPHZ+LybSA4pzpj2I/SvXWdA24Ku2
 oB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355924; x=1768960724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=teYKKbLkZbUHHb5EH1qkAwDiVubshmdqathiyRgte04=;
 b=UKOC0d5UPxVVe4YmLzYsbM4P84JuoFsmAhp1gnjkWhAa1Kydcfl/9p8xAfN1Frj8Xi
 ExEk4qyFeLrJwpYgpKUHDiHQKZQx8QTMN8w2+qsPFfPxXNOivz+XRmJjdbd/kJf5VIWO
 1hsiG9Nr16eQiL8Vjb3XMWi2FQjmHO4FJcNBczSZ4+knXvs38/3Ad1vaeG51FuYKtDTu
 Fyd38jVBWQLNohns53654Z9SENmvMGSQWk+9vo/6hOGJMXQ7tjn8vwMQYTcH9m04ZFmD
 nRXuPlw7bjF24QX2UA6x7OqQfBDCWfXwl8ItDQsJeZb2xSPyZQuM9Z47vYmJfaWPZbsR
 tmIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoFZAQfGxMqPivZqhsSv1awQ1MX64ETCw5vNMgIcCI0dCeTyf+nMd6VkQU1ahkPesrt0K9WvlJlGE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPggzcmDuP8fKFF4OZKHd4tVzZY6d5IiavUf4exRIQEr3Je/qF
 u+M61sF30xIJ10QqlCtOeueD7G5qaGyT4ceCcsmqrXUefPecN3zI2m6j
X-Gm-Gg: AY/fxX61T86m4BIjks6qsti4rf1QlJJzlhOjKCBglDEl3x67IcgjUD8MPSZpTfcZOBi
 GSX/M6tvlnFraDH3idcEDlMA1zGPpoEw4/cStIdBKeaKdHRGu/lwOpIT7DE5LSUMm5V86DsgucM
 Itah/qoMt7IyJtHnAf3JDpfIpxcunN8cBczOfn+Tfc8VlxLx84L/SwcTBFu9rmBmT/016Ez6JEM
 GE/DPx5A905pVL0xteBlPLHsUVuOIubF7UhmOW/6LD6B17jQPOxfj7FQDm0ECRU+w3xygxZhMk+
 0ezu8K8qnb75/qZdADkEnJupDpo11mdpiHKQKwcgRyRVB0JPMU7Efr9d5tfZCcfd0emPfVMBoCp
 vG0g6X+haHZ/JgOLkOCE0+VMongkJpybfuRx2DhNQ3ot6F8BbNJ6UAcQe3KLC+anK8HBWKgBNwN
 Vq2c5CKX5UH9UhsK2wKfk/nmAvojbV352fFmX5
X-Received: by 2002:a05:6808:50a2:b0:459:bcc4:d6d3 with SMTP id
 5614622812f47-45c7115a02cmr683734b6e.0.1768355924022; 
 Tue, 13 Jan 2026 17:58:44 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7ce478af8b2sm16131037a34.15.2026.01.13.17.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:58:43 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 00/31] dyndbg: fix dynamic-debug regression in DRM
Date: Tue, 13 Jan 2026 18:57:16 -0700
Message-ID: <20260114015815.1565725-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
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

v7 added:
. WARN_ONCE when classmap isn't found for a class'd callsite, JBaron
. reorder macro args to match kdoc, JBaron
. Doc formatting fixes, by Bagas

v8 adds:
. CC's for tools/testing, DRM, others
. p21: change _ddebug_class_user.base name to offset, for p30
. p30: amend commit-msg to explain untested, speculative nature

Thank you for your review(s) and/or Tested-by:s

P.S. Id also like to "tease" some follow-on work:

1. DRM adaptation patches, tested on my HW/boxes.

2. patchset to send pr_debugs to tracefs on +T flag

   allows 63 "private" tracebufs, 1 "common" one (at 0)
   "drm.debug_2trace=0x1ff" is possible
   from Lukasz Bartosik

   NB: the private tracebufs allow test scripts to verify
   log content, not just counts of changed pr_debugs.

3. patchset to save 40% of dyndbg's memory footprint

   move (modname,filename,function) to struct _ddebug_site
   save their values & descriptor intervals to 3 maple-trees
   add 3 accessors to fetch on descriptor, from trees
   move __dyndbg_sites __section to INIT_DATA.
   
   NB: Despite the new accessors, `cat control` is just as fast.


Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jason Baron <jbaron@akamai.com>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: Petr Mladek <pmladek@suse.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org> (ftrace/logging tease)
Cc: Liam R. Howlett <Liam.Howlett@oracle.com> (maple-tree tease)

Jim Cromie (31):

fixes, cleanups, simple stuff::

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

callchain grooming, re-structs, code simplify/dedup by macros::

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

core fix, detect api misuse errors, etc::

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


Jim Cromie (31):
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

 .../admin-guide/dynamic-debug-howto.rst       | 187 ++++-
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
 14 files changed, 1465 insertions(+), 461 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.52.0

