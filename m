Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433E9A1E78
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 11:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526F410E7D1;
	Thu, 17 Oct 2024 09:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnWzEaK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC58410E30D;
 Thu, 17 Oct 2024 09:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729157593; x=1760693593;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=cy+twF8z7Jnj7L9H+pNd7pTHZdDX7ewEwiApxmQ9j+s=;
 b=MnWzEaK2bb7sYlZi128BkiHYd0jW1qtDeRuLnivYhWaqX8/dJdeRUQzK
 8dhQTUecsO0DUb8XgYJ4rEHVWPVfE5ahesZ1MWvCqaq0wMbeg+5fupBVR
 dW6o0eYnirTCqatPa6dc+4Pc95U1geV4xSiEU2fomfKlgXXoS8YzQg540
 jlp+2G3Z2Uu25tf0Lmc04kPLV4XBeC1OMqLQTx2mjbITnYzYtEV5xLYfj
 P1THlDwH3Y6q0y16FfQq64Ha0+OyBqhkhM8mV2sGg5l3hdWOQpK0ptxgv
 HzQ3CGCOpmeh616qP7nXHkfRxKGQ4GkZzSIpBhCfB1zyNfNHk7iV4L3Dj g==;
X-CSE-ConnectionGUID: AOIck+aeT4GsknVP0X5seg==
X-CSE-MsgGUID: INM1WWhsTdy9g1CcjMHRTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28585927"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28585927"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 02:33:13 -0700
X-CSE-ConnectionGUID: +RMHLClxSnC2YrilGB4sFQ==
X-CSE-MsgGUID: ZfYMod8TRu660JxHhrTGYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="109302045"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.246.150])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 02:33:02 -0700
Date: Thu, 17 Oct 2024 11:32:51 +0200
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-next
Message-ID: <ZxDZaRRQAzrG1uir@fedora>
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

Dave, Simona

This week's -next PR. Note the implicit fencing uapi fix.

Thanks,
Thomas

drm-xe-next-2024-10-17:
UAPI Changes:
- (Implicit) Fix the exec unnecessary implicit fencing (Matt Brost)

Driver Changes:
- Fix an inverted if statement (Colin)
- Fixes around display d3cold vs non-d3cold runtime pm (Imre)
- A couple of scheduling fixes (Matt Brost)
- Increase a query timestamp witdh (Lucas)
- Move a timestamp read (Lucas)
- Tidy some code using multiple put_user() (Lucas)
- Fix an ufence signaling error (Nirmoy)
- Initialize the ufence.signalled field (Matt Auld)
- Display fb alignement work (Juha-Pekka)
- Disallow horisontal flip with tile4 + display20 (Juha-Pekka)
- Extend a workaround (Shekhar)
- Enlarge the global invalidation timeout (Shuicheng)

The following changes since commit a187c1b0a800565a4db6372268692aff99df7f53:

  drm/xe: fix unbalanced rpm put() with declare_wedged() (2024-10-10 09:15:59 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-10-17

for you to fetch changes up to 2eb460ab9f4bc5b575f52568d17936da0af681d8:

  drm/xe: Enlarge the invalidation timeout from 150 to 500 (2024-10-16 16:11:10 +0100)

----------------------------------------------------------------
UAPI Changes:
- (Implicit) Fix the exec unnecessary implicit fencing (Matt Brost)

Driver Changes:
- Fix an inverted if statement (Colin)
- Fixes around display d3cold vs non-d3cold runtime pm (Imre)
- A couple of scheduling fixes (Matt Brost)
- Increase a query timestamp witdh (Lucas)
- Move a timestamp read (Lucas)
- Tidy some code using multiple put_user() (Lucas)
- Fix an ufence signaling error (Nirmoy)
- Initialize the ufence.signalled field (Matt Auld)
- Display fb alignement work (Juha-Pekka)
- Disallow horisontal flip with tile4 + display20 (Juha-Pekka)
- Extend a workaround (Shekhar)
- Enlarge the global invalidation timeout (Shuicheng)

----------------------------------------------------------------
Colin Ian King (1):
      drm/xe/guc: Fix inverted logic on snapshot->copy check

Imre Deak (2):
      drm/xe/display: Separate the d3cold and non-d3cold runtime PM handling
      drm/xe/display: Add missing HPD interrupt enabling during non-d3cold RPM resume

Juha-Pekka Heikkila (3):
      drm/xe: add interface to request physical alignment for buffer objects
      drm/xe/display: align framebuffers according to hw requirements
      drm/i915/display: Don't allow tile4 framebuffer to do hflip on display20 or greater

Lucas De Marchi (3):
      drm/xe/query: Increase timestamp width
      drm/xe/query: Move timestamp reg to hwe_read_timestamp()
      drm/xe/query: Tidy up error EFAULT returns

Matthew Auld (1):
      drm/xe/xe_sync: initialise ufence.signalled

Matthew Brost (3):
      drm/xe: Take job list lock in xe_sched_add_pending_job
      drm/xe: Don't free job in TDR
      drm/xe: Use bookkeep slots for external BO's in exec IOCTL

Nirmoy Das (1):
      drm/xe/ufence: ufence can be signaled right after wait_woken

Shekhar Chauhan (1):
      drm/xe/xe3lpg: Extend Wa_18034896535 to Xe3_LPG.

Shuicheng Lin (1):
      drm/xe: Enlarge the invalidation timeout from 150 to 500

 drivers/gpu/drm/i915/display/intel_fb.c            | 13 +++++
 drivers/gpu/drm/i915/display/intel_fb.h            |  1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 11 +++++
 .../xe/compat-i915-headers/gem/i915_gem_stolen.h   |  2 +-
 drivers/gpu/drm/xe/display/xe_display.c            | 20 ++++++--
 drivers/gpu/drm/xe/display/xe_fb_pin.c             | 57 +++++++++++++---------
 drivers/gpu/drm/xe/xe_bo.c                         | 29 ++++++++---
 drivers/gpu/drm/xe/xe_bo.h                         |  8 ++-
 drivers/gpu/drm/xe/xe_bo_types.h                   |  5 ++
 drivers/gpu/drm/xe/xe_device.c                     |  2 +-
 drivers/gpu/drm/xe/xe_exec.c                       | 12 ++---
 drivers/gpu/drm/xe/xe_ggtt.c                       |  2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |  2 +
 drivers/gpu/drm/xe/xe_guc_log.c                    |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  7 ++-
 drivers/gpu/drm/xe/xe_query.c                      | 42 ++++++----------
 drivers/gpu/drm/xe/xe_sync.c                       |  2 +-
 drivers/gpu/drm/xe/xe_wa.c                         |  5 ++
 drivers/gpu/drm/xe/xe_wait_user_fence.c            |  3 --
 19 files changed, 147 insertions(+), 78 deletions(-)
