Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B92A32BA4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 17:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3BE10E901;
	Wed, 12 Feb 2025 16:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZwp6Ziw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2A610E911;
 Wed, 12 Feb 2025 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739377992; x=1770913992;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=y46kQ50ST/OUYZVBcUp+u+Zt0KU+XVnp8YPNlOuj3DY=;
 b=VZwp6ZiwVnNfuUxQpmnTH9VYf+fECU3F8cAEkWue/h1YJOgeu0Gfwu94
 msZdtKcdERWYW4tcrT0B4S94Zyzy6bWNx9BwpRoTj8qBpXlik7E9FcAJF
 GwbaZ1ewkyJwdj/b1SaZiKAccZ5sOH95zpcB0ID0gPgJ2ujK0rTKJm3UF
 Rl/ATHYKmrl79KHLbxDQDp34VCXMLdfa3lyo8Njw59UDPn0G8PB1Azbvd
 fIf7v2QAnZdMGn04YRp+QKAqHHg082qNwHBn2WhgLjLkqVHr7v2gkf6Sq
 m30Kv+dc2SkYSIKq0XYH03CHso4XNxNiiU+P6yAioZrGOo7eeh1wG6BO1 A==;
X-CSE-ConnectionGUID: BQewvbKeRa2Rv1UKkktMyg==
X-CSE-MsgGUID: oTm30idwQ5OKcmmPWrm03A==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39969121"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39969121"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:33:12 -0800
X-CSE-ConnectionGUID: 7cQA7FguQhGkNINcMZoZZw==
X-CSE-MsgGUID: nTLJ3+NoR1WR7VP3Fzhxww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116989290"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 12 Feb 2025 08:33:09 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v5 0/3] Expose modifiers/formats supported by async flips
Date: Wed, 12 Feb 2025 21:48:21 +0530
Message-Id: <20250212-asyn-v5-0-dc182281dca3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3JrGcC/02OzQqDMBAGX0Vy7spGE3966nsUDzGNTaDGslGpi
 O/eqBR6nGW/YVYWDDkT2DVZGZnZBTf4CPKSMG2Vfxpwj8gsw0wixwxUWDy0XVmUOcaL1iy+vsl
 07nNo7k3kjoYeRktG/caCc15hKXMuU1EUiDVwUDT5lNJ+otEuN+dH80r10O9G68I40HJ0zWL3n
 gkZyjNhFoBQK9kir0wu6/Zv32zb9gWsv/qA2gAAAA==
X-Change-ID: 20250102-asyn-bf76730501cc
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
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
Userspace implementation for IN_FORMARTS_ASYNC under review @
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063

TODO: Upon merge of the patch related to async flip
https://patchwork.freedesktop.org/patch/626849/?series=139807&rev=6
the patch 5 in this series will have to make use of the new function
pointer can_async_flip().

v3: Add new plane->funcs format_mod_supported_async (Ville)
v4: reuse the existing can_async_flip in i915 (Ville)
    pass format_mod_supported/async as parameter to create_in_formats
    function & leave the modifiers/formats in drm_format_modifer_blob
    untouched (Ville)

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
Changes in v5:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v4: https://lore.kernel.org/r/20250205-asyn-v4-0-9a5b018e359b@intel.com

---
Arun R Murthy (3):
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: modify create_in_formats to accommodate async
      drm/i915/display: Add i915 hook for format_mod_supported_async

 drivers/gpu/drm/drm_mode_config.c                  |  7 +++
 drivers/gpu/drm/drm_plane.c                        | 51 +++++++++++++++-----
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 56 ++++++++++++++++------
 include/drm/drm_mode_config.h                      |  6 +++
 include/drm/drm_plane.h                            | 17 +++++++
 5 files changed, 110 insertions(+), 27 deletions(-)
---
base-commit: a19d8731db07e41101ed00b9d86ac8868df2a763
change-id: 20250102-asyn-bf76730501cc

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

