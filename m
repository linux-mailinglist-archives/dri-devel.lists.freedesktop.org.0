Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D9DA5DDE1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 14:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9E710E2FF;
	Wed, 12 Mar 2025 13:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPOMpVm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51C910E183;
 Wed, 12 Mar 2025 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741785886; x=1773321886;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=t2Yd/uVk/qp/2qa1DRVB4ci381wkgsgM43ImpQMa9e4=;
 b=RPOMpVm73/+SVzxk158xJ3WNEwHP93IWqwsTFHeTzqhckO46wql7/Dhp
 WqGPQ8eXkGwt3F+DR8860MMmUu9Sgu1tWFLfdrs8G3gzdhNoBNaumqu4P
 2xHhW6z/Fo9Xk2tER9lRlYyEi3bXlykfWMCTgyNeIkBLZV9wvy6R2IlQ9
 dyjNfCgvN2/USgAMWulUMyXNEzdiQIPN8ntjT0kmEsxj7hpAaMbq8MOaq
 MGHlDgX4ux+alEu8Du4A5NGUBMDAnkppaj7AzwzIWxCLVjiK91ya84Hlj
 +UmCHzR9mfbaTb/e6Q+K9F8rTtAjBY3Q7yApRIWa6HmzhrOoDVsOO4rbh Q==;
X-CSE-ConnectionGUID: P0WpZCOCQjWYbcAUXmDclA==
X-CSE-MsgGUID: KH5co9UvS7SXyU8yvo5cJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42028452"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="42028452"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 06:24:45 -0700
X-CSE-ConnectionGUID: p3JTrPh/RUK+Pzpk2HV1SQ==
X-CSE-MsgGUID: S42WF00oQ1y/lZ/UhHb3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125821647"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 12 Mar 2025 06:24:42 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v8 0/3] Expose modifiers/formats supported by async flips
Date: Wed, 12 Mar 2025 18:39:20 +0530
Message-Id: <20250312-asyn-v8-0-0c4cbe5a066d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAICH0WcC/02OwQ6DIBAFf8VwLgQQxPbU/2g8IGIlqdAsaGqM/
 17UNOlxNvsms6JowdmIbsWKwM4uuuAz1JcCmUH7p8Wuy4w45ZIyyrGOi8dtrypV0nwxBuXXN9j
 efQ7No8ncQxhxGsDq31gwxmqqZMkkEVVF6RUzrGHyBMg4QRqWu/PJvogJ424cXEwBlqNrlrv3T
 OCsPhNmiSlW2khthG47of/2zbZtX4Eb+JTaAAAA
X-Change-ID: 20250102-asyn-bf76730501cc
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, 
 20250219093211.4059187-1-arun.r.murthy@intel.com, 
 20250311085422.2573860-1-santhosh.reddy.guddati@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>, 
 Naveen Kumar <naveen1.kumar@intel.com>
X-Mailer: b4 0.15-dev
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

All of the formats/modifiers supported by the plane during synchronous
flips are nor supported by asynchronous flips. The formats/modifiers
exposed to user by IN_FORMATS exposes all formats/modifiers supported by
plane and this list varies for async flips. If the async flip supported
formats/modifiers are exposed to the user, user based on this list can
take decision to proceed or not and avoid flip failures during async
flips.
Discussion around this can be located @
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#note_2487123
Mutter implementation for IN_FORMARTS_ASYNC under review @
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
Xorg/modesetting patch
https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1816

TODO: Upon merge of the patch related to async flip
https://patchwork.freedesktop.org/patch/626849/?series=139807&rev=6
the patch 5 in this series will have to make use of the new function
pointer can_async_flip().

Test-with: 20250219093211.4059187-1-arun.r.murthy@intel.com
Test-with: 20250311085422.2573860-1-santhosh.reddy.guddati@intel.com

v3: Add new plane->funcs format_mod_supported_async (Ville)

Arun R Murthy (3):
  drm/plane: Add new plane property IN_FORMATS_ASYNC
  drm/plane: Expose function to create format/modifier blob
  drm/i915/display: Populate list of async supported formats/modifiers

 drivers/gpu/drm/drm_mode_config.c             |  7 +++
 drivers/gpu/drm/drm_plane.c                   | 50 ++++++++++++------
 .../drm/i915/display/skl_universal_plane.c    | 51 +++++++++++++++++++
 include/drm/drm_mode_config.h                 |  6 +++
 include/drm/drm_plane.h                       |  4 ++
 5 files changed, 103 insertions(+), 15 deletions(-)

--
2.25.1

---
Arun R Murthy (5):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: Expose function to create format/modifier blob
      drm/plane: Function to check async supported modifier/format
      drm/i915/display: Populate list of async supported formats/modifiers
      drm/i915/display: Add function for format_mod_supported_async

 drivers/gpu/drm/drm_mode_config.c                  |   7 ++
 drivers/gpu/drm/drm_plane.c                        |  72 +++++++++----
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 113 ++++++++++++++++++---
 include/drm/drm_mode_config.h                      |   6 ++
 include/drm/drm_plane.h                            |  24 +++++
 5 files changed, 188 insertions(+), 34 deletions(-)
---
base-commit: 08bd590935a5258ffd79355c59adffd72fb2c642
change-id: 20250102-asyn-bf76730501cc

Best regards,
--
Arun R Murthy <arun.r.murthy@intel.com>

---
Changes in v6:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v5: https://lore.kernel.org/r/20250218-asyn-v5-0-7ac5ac4abd4a@intel.com

---
Arun R Murthy (3):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: modify create_in_formats to accommodate async
      drm/i915/display: Add i915 hook for format_mod_supported_async

 drivers/gpu/drm/drm_mode_config.c                  |  7 +++
 drivers/gpu/drm/drm_plane.c                        | 53 +++++++++++++++-----
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 56 ++++++++++++++++------
 include/drm/drm_mode_config.h                      |  6 +++
 include/drm/drm_plane.h                            | 17 +++++++
 5 files changed, 112 insertions(+), 27 deletions(-)
---
base-commit: bc7a84cbc968ce97e581e9e3c2d26fb0ac106482
change-id: 20250102-asyn-bf76730501cc

Best regards,
--
Arun R Murthy <arun.r.murthy@intel.com>

---
Arun R Murthy (3):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: modify create_in_formats to accommodate async
      drm/i915/display: Add i915 hook for format_mod_supported_async

 drivers/gpu/drm/drm_mode_config.c                  |  7 ++++
 drivers/gpu/drm/drm_plane.c                        | 49 ++++++++++++++++------
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 30 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
 drivers/gpu/drm/i915/display/intel_display.c       | 11 +----
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
 include/drm/drm_mode_config.h                      |  6 +++
 include/drm/drm_plane.h                            | 17 ++++++++
 9 files changed, 111 insertions(+), 26 deletions(-)
---
base-commit: be5a404c3344b7d794766f045b8f94aa93c42069
change-id: 20250102-asyn-bf76730501cc

Best regards,
--
Arun R Murthy <arun.r.murthy@intel.com>

---
Arun R Murthy (3):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: modify create_in_formats to accommodate async
      drm/i915/display: Add i915 hook for format_mod_supported_async

 drivers/gpu/drm/drm_mode_config.c                  |  7 +++
 drivers/gpu/drm/drm_plane.c                        | 54 ++++++++++++++++------
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 31 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
 drivers/gpu/drm/i915/display/intel_display.c       | 14 ++----
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 +-
 include/drm/drm_mode_config.h                      |  6 +++
 include/drm/drm_plane.h                            | 17 +++++++
 9 files changed, 117 insertions(+), 29 deletions(-)
---
base-commit: aba848f9b752cf51474c0c3b1abcf0f572f774dc
change-id: 20250102-asyn-bf76730501cc

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

