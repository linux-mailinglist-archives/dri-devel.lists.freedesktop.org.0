Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A1B3E3D7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 15:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFEC10E45A;
	Mon,  1 Sep 2025 13:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CkkSHyce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B63D10E457;
 Mon,  1 Sep 2025 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756731815; x=1788267815;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=tAG7nA4Ot4yMzZ2sZM5r0WbAmpf4OMSMR4spRY77DSE=;
 b=CkkSHycecueHIhYbaZjXowStkuK1amXL2TqCZDwZXSrabOgVTRyhhD0M
 Td8IvJALT/4bTX7brUFJ4jU4kwttYq5DjFb0KI8T6zUWBpTnrR7QeIQrK
 XGQJo4KUc0pbhx6aIc8h6tQmoBMph6PoMnQN2H9L/0d531Y96Bu8Q4IOu
 PGyY11C939iPv4F6uDAf5gOnA+mGTPBhfDBaTF0X8pOxgnEcsWnlRP5yw
 csIvL+sh/R6DC8IzN5svBs1JdZ+4rnvPxUHqVXIXvzjT75WGxD7WvBjSB
 MfveKr8+QGSboDJmtjs98gckL1VWHER6UTZPCxeva1tQ9M9rySdRPVTxb A==;
X-CSE-ConnectionGUID: +/G6lRSARlqTu3csNM2s7Q==
X-CSE-MsgGUID: pVTwjF0fRLa3h00XavAbfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="69695697"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="69695697"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 06:03:35 -0700
X-CSE-ConnectionGUID: 35J1xP/mRiGeN7PIGPATwQ==
X-CSE-MsgGUID: QGxijaeWQzuNhlFcKbBsyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="194669734"
Received: from opintica-mobl1 (HELO localhost) ([10.245.244.140])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 06:03:30 -0700
Date: Mon, 1 Sep 2025 16:03:28 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <aLWZoEZVlBj2d8J9@jlahtine-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave & Sima,

Here goes the first drm-intel-gt-next PR towards v6.18.

No new features, more of a -fixes PR this time.

Workaround fixes for older platforms, one overflow fix and an
cmpxchg optimization for x86 platforms.

Then the usual set of selftest improvements, smaller fixes and cleanups.

Regards, Joonas

***

drm-intel-gt-next-2025-09-01:

Driver Changes:

- Apply multiple JSL/EHL/Gen7/Gen6 workaround properly at context level (Sebastian)
- Protect against overflow in active_engine() (Krzysztof)
- Use try_cmpxchg64() in __active_lookup() (Uros)

- Enable GuC CT_DEAD output in regular debug builds (John)
- Static checker and style fixes (Sebastian)
- Selftest improvements (Krzysztof)

The following changes since commit dccf655f69002d496a527ba441b4f008aa5bebbf:

  drm/i915/gsc: mei interrupt top half should be in irq disabled context (2025-06-30 14:21:06 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2025-09-01

for you to fetch changes up to b7a855f488c6825e3dc06e78c49326491bef6f98:

  drm/i915/gt: Relocate Gen6 context-specific workaround (2025-08-18 20:32:25 -0100)

----------------------------------------------------------------
Driver Changes:

- Apply multiple JSL/EHL/Gen7/Gen6 workaround properly at context level (Sebastian)
- Protect against overflow in active_engine() (Krzysztof)
- Use try_cmpxchg64() in __active_lookup() (Uros)

- Enable GuC CT_DEAD output in regular debug builds (John)
- Static checker and style fixes (Sebastian)
- Selftest improvements (Krzysztof)

----------------------------------------------------------------
John Harrison (1):
      drm/i915/guc: Enable CT_DEAD output in regular debug builds

Krzysztof Karas (3):
      drm/i915/selftests: Do not overwrite error code after intel_context_migrate_clear() call
      drm/i915/selftests: Do not leak vm_area_struct on early return
      drm/i915/gt: Protect against overflow in active_engine()

Sebastian Brzezinka (5):
      drm/i915: Add braces around the else block in clflush_write32()
      drm/i915: Replace empty conditional with continue in eb_relocate_vma()
      drm/i915/gt: Relocate compression repacking WA for JSL/EHL
      drm/i915/gt: Relocate Gen7 context-specific workarounds
      drm/i915/gt: Relocate Gen6 context-specific workaround

Uros Bizjak (1):
      drm/i915/active: Use try_cmpxchg64() in __active_lookup()

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 57 +++++++++---------
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 70 ++++++++++------------
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 49 +++++++--------
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          | 11 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h          |  2 +-
 drivers/gpu/drm/i915/i915_active.c                 |  5 +-
 7 files changed, 98 insertions(+), 98 deletions(-)
