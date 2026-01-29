Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AeWMXUMe2k6AwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:29:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99BAAC9B1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A99510E7D7;
	Thu, 29 Jan 2026 07:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VxkumOOo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com
 [209.85.160.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482CA10E7DA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:29:53 +0000 (UTC)
Received: by mail-oa1-f67.google.com with SMTP id
 586e51a60fabf-4042905015cso427410fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769671792; x=1770276592; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5k22CUWxoDCFWg5lgOlNQDS0dCgTANphXGWpbOhMltU=;
 b=VxkumOOoQgcdrRRjycOnZ9TV9rhuVkb8lmWkZVipPOa/k9ZXLDeawgCB0Q3bcYK3wl
 WTdB2f3gExZd+pMAh6rFjHWJW6JHHx8iZbvcmH8fAYpH7SU411+bh2t6jjNIjFnaKxFi
 iIGp3xgGMBliqD6LCZfWFNVL4np8p6WfDiCcm/w4xazi3wlcTr+/GKdg/8ieRobr9OWC
 9i4IK/UQUzPkBncTSY/F7MqlRWyQQIwpwzFMmyBKHLasStlqjDborZ/+L0Z5awi+CVzi
 wBDuyqB71ld8EfhAqwGh1y51p6xshwG3lU1bF2DVd9Smy+Yn519OG2sbTy2SI90AM2zB
 miHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769671792; x=1770276592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5k22CUWxoDCFWg5lgOlNQDS0dCgTANphXGWpbOhMltU=;
 b=CaUZjO7qAeO67dxm+6XExsuaAWChejOB5fWDBnkjlWi4V1UK9Yhi+P05dndwVZYn5j
 F5jn4pdVb6N2adXH0AfUwBc2PBwOknR+D2xwuMpvfhvmxxhGMr0Bjxi6uJbdb55lYEd/
 eOuXkvl6mIZif2lE39YZ6yBOKt003JfJjrYoM9gYLmOE/bnjmoWMqw6ysa8qgWKmrJBP
 51AXiC0sddhnqgv+wJDPkYY50gVIparEJz9gvEjtVE7SNUP0bvGPAQJZPhOB5Td4hVof
 awIbDs5u7NNl2bVxSGsntMCKL/RA9iIm0AJfb0uh/8Z0GtG6R6NVNINTAh+GhpscGOaQ
 T2pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNAIEv6zbVyz4zodo3G9Ri7XvEErtjT1vAAaZyAsi7UeNj2vADrdcIrji48TN59+UqsYDj9mKtROc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWSD/5EDBjkEH4vUVMHqXw3UzvqrhaRiogMRKyCdM7tGW3CVrk
 SX1hqG4x5hsYwaVTuzYfpBWS46gpBfAYDAt1mTgQmj23BgmH04JJibWP
X-Gm-Gg: AZuq6aIqb3zITkuCc+xMG4vNYBtwy6b0QHYJzg7JrOnUC/wl4vthjhWGIDJ6rpx5tsV
 m9BA7oj7P+lpy17rVm/4XCUJKWtJRrXFKtXfFGylIs1PN/VvymFsqoqtFtsME4o89zurSfxaXbp
 nwcsviNeqgXp5+KCNGckZ9hTFeYpHMEV7NuobuIbk6M3UH4OyP5XfDwBmqgWv6FCrS50zDqlSTJ
 f7vEb/weSHcPHt5PraDT8pU3TnXDii3r7b5dZOWeqFG1YPe/nQcCfMnwKZssyqT7feCVYC68Bhk
 lYZj+BE7/HKJkmz0t1kXFKRdRZFLMsLQdS871VzmcNVpvftPegaQlwdql3B/9ONRm5p9iXP84iY
 pnyrx8nqxlfm/SyCepF6/7WTIjq8C4AHaJtc+11g4gvYkjmVYHuBRVllWCPKlWsJE8lPvFAR30e
 NsMhv/NbZZP78tqfbhH3A2tqSKphRASU2NA7+W8q4z
X-Received: by 2002:a05:6871:2e89:b0:3ec:4f31:42a with SMTP id
 586e51a60fabf-4093fc36735mr4474416fac.7.1769671792291; 
 Wed, 28 Jan 2026 23:29:52 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-4095749f332sm3238493fac.11.2026.01.28.23.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:29:51 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
Subject: [PATCH v9 00/32] fix dynamic debug classmaps
Date: Thu, 29 Jan 2026 00:28:46 -0700
Message-ID: <20260129072932.2190803-1-jim.cromie@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:ukaszb@chromium.org,m:louis.chauvet@bootlin.com,m:bagasdotme@gmail.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:pmladek@suse.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,chromium.org,bootlin.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,suse.com,linuxfoundation.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linuxfoundation.org:email,suse.com:email,intel.com:email,bootlin.com:email]
X-Rspamd-Queue-Id: C99BAAC9B1
X-Rspamd-Action: no action

commit aad0214f302 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")

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

v9: fixes for lkp-robot reports
. fix warning on WARN in another arch
. fix section mis-ALIGN causing NULL ptr on i386

v8:
. CC's for tools/testing, DRM, others
. p22: change _ddebug_class_user.base name to offset, for p31
. p31: amend commit-msg to explain untested, speculative nature

v7:
. WARN_ONCE when classmap isn't found for a class'd callsite, JBaron
. reorder macro args to match kdoc, JBaron
. Doc formatting fixes, by Bagas

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

Jim Cromie (32):
  dyndbg: fix NULL ptr on i386 due to section alignment
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

 .../admin-guide/dynamic-debug-howto.rst       | 184 ++++-
 MAINTAINERS                                   |   3 +-
 include/asm-generic/vmlinux.lds.h             |  19 +-
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
 14 files changed, 1475 insertions(+), 462 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.52.0

