Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFBF8CCB74
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 06:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DA210E969;
	Thu, 23 May 2024 04:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWzif/Ef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7280F10E1FC;
 Thu, 23 May 2024 04:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716439297; x=1747975297;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=6Rc2QYLxgo8mtkXqy/EgZ8q0nxZ+vuS4QcWaRIa7rCc=;
 b=XWzif/Ef3DbNj68qASSyBVLiJwTUgX6hotq+beyqXfvLrJDxpExnCnQ9
 Z4rpCbZTE9a6hdI9g/RAPd/UmH8Pl4GLKU25gRlUtsGO3qR2nCADC9lll
 00YIQ02q8XyKJkd3pUFbtlBZNAHbIX29g3wdTy0fiskakZcIqQcCHdFS9
 3ib14Y+J2KDezvyDSwvVeEIRdltPsS13suDS9q7gAQjWaEQpaxPDL63MT
 cuHYkgJJyJLrNNG33oiLRT1MIBGrRzI/ICPTYS3aqXnJCl/s5W5dGHanW
 k4SED8MOtutPrc9sthmeqBj97Yn5gm1rxSphG08IcJ5srSImS7jK0s50B A==;
X-CSE-ConnectionGUID: I8LrViHHTKWdVySGC9fwkQ==
X-CSE-MsgGUID: gJy13oHPRsuVPcLqJ7YItw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="35239432"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="35239432"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 21:41:36 -0700
X-CSE-ConnectionGUID: WRzeHvi2RbmMBxX4rwjW+w==
X-CSE-MsgGUID: jpYYmQYpTfq1NwlgJ5zyBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="37920303"
Received: from aklimovi-mobl.ger.corp.intel.com (HELO [10.251.211.223])
 ([10.251.211.223])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 21:41:31 -0700
Message-ID: <f171b14a-ed6b-4124-893b-802a336dbe2b@linux.intel.com>
Date: Thu, 23 May 2024 06:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-next-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

drm-misc-next-fixes-2024-05-23:
drm-misc-next-fixes for v6.10-rc1:
- MST null deref fix.
- Don't let next bridge create connector in adv7511 to make probe work.
The following changes since commit 959314c438caf1b62d787f02d54a193efda38880:

   drm/nouveau: use tile_mode and pte_kind for VM_BIND bo allocations 
(2024-05-13 22:27:33 +0200)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-fixes-2024-05-23

for you to fetch changes up to 5a507b7d2be15fddb95bf8dee01110b723e2bcd9:

   drm/mst: Fix NULL pointer dereference at drm_dp_add_payload_part2 
(2024-05-21 16:36:59 -0400)

----------------------------------------------------------------
drm-misc-next-fixes for v6.10-rc1:
- MST null deref fix.
- Don't let next bridge create connector in adv7511 to make probe work.

----------------------------------------------------------------
Liu Ying (1):
       drm/bridge: adv7511: Attach next bridge without creating connector

Wayne Lin (1):
       drm/mst: Fix NULL pointer dereference at drm_dp_add_payload_part2

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c              | 3 ++-
  drivers/gpu/drm/display/drm_dp_mst_topology.c             | 4 +---
  drivers/gpu/drm/i915/display/intel_dp_mst.c               | 2 +-
  drivers/gpu/drm/nouveau/dispnv50/disp.c                   | 2 +-
  include/drm/display/drm_dp_mst_helper.h                   | 1 -
  6 files changed, 6 insertions(+), 8 deletions(-)
