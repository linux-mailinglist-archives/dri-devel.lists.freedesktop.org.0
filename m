Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F628C78D4
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 17:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A33F10ED58;
	Thu, 16 May 2024 15:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfmlJHwL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E1E10ED55;
 Thu, 16 May 2024 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715871635; x=1747407635;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=DmfWODIHNAA4dfjJTAnSbg1KySVd76EloNPZ+ei/Ai0=;
 b=cfmlJHwLltcfkkIQEvT9bPmWkk5kKWRqDb4JLuS/svTLn4dL6DKkBvFL
 3KkwqhFoH0bhRDsUbDM8OooCYEtoKtoIaoE5zUP12o0WSlHDq7ffsDuFh
 i4ZiC4FhuA1+0pAHZdV6OjTmPApEYrrh0JsPCP6awPiVGPMeHpWe0pecv
 CMHaWGTgE0oqc5AGkehjkuOFRxsSHvkrOLUbryevPvMLjUiFQdyRL82Qc
 zLrAg6X9qXrUAuDqPQmkfY87kHHtzhwOA9A347/L1Y342oswtS6DEYsoL
 GDl4nrXb+qiACb2rGyp7QzPy5fI05aACsQGHvFQfPSvfb3H4oh34gVEdT Q==;
X-CSE-ConnectionGUID: HxjE8gpqT6OsIaX1D/+/jg==
X-CSE-MsgGUID: xiHNQabcTLy1bQH4pK/4Aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12198358"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="12198358"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 08:00:34 -0700
X-CSE-ConnectionGUID: LhWMdSOzQTqNOND/S7Fgcg==
X-CSE-MsgGUID: sYZitjegQ3u/O+8/V2BW2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="36230575"
Received: from ebruchet-mobl1.ger.corp.intel.com (HELO [10.251.211.65])
 ([10.251.211.65])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 08:00:29 -0700
Message-ID: <54d2c8b9-8b04-45fc-b483-200ffac9d344@linux.intel.com>
Date: Thu, 16 May 2024 17:00:52 +0200
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

drm-misc-next-fixes-2024-05-16:
drm-misc-next-fixes for v6.10-rc1:
- VM_BIND fix for nouveau.
- Lots of panthor fixes:
   * Fixes for panthor's heap logical block.
   * Reset on unrecoverable fault
   * Fix VM references.
   * Reset fix.
- xlnx compile and doc fixes.
The following changes since commit be3f3042391d061cfca2bd22630e0d101acea5fc:

   drm: zynqmp_dpsub: Always register bridge (2024-05-02 23:40:56 +0200)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-fixes-2024-05-16

for you to fetch changes up to 959314c438caf1b62d787f02d54a193efda38880:

   drm/nouveau: use tile_mode and pte_kind for VM_BIND bo allocations 
(2024-05-13 22:27:33 +0200)

----------------------------------------------------------------
drm-misc-next-fixes for v6.10-rc1:
- VM_BIND fix for nouveau.
- Lots of panthor fixes:
   * Fixes for panthor's heap logical block.
   * Reset on unrecoverable fault
   * Fix VM references.
   * Reset fix.
- xlnx compile and doc fixes.

----------------------------------------------------------------
Anatoliy Klymenko (2):
       drm: xlnx: zynqmp_dpsub: Fix few function comments
       drm: xlnx: zynqmp_dpsub: Fix compilation error

Antonino Maniscalco (1):
       drm/panthor: Fix tiler OOM handling to allow incremental rendering

Boris Brezillon (8):
       drm/panthor: Make sure the tiler initial/max chunks are consistent
       drm/panthor: Relax the constraints on the tiler chunk size
       drm/panthor: Fix an off-by-one in the heap context retrieval logic
       drm/panthor: Document drm_panthor_tiler_heap_destroy::handle 
validity constraints
       drm/panthor: Force an immediate reset on unrecoverable faults
       drm/panthor: Keep a ref to the VM at the panthor_kernel_bo level
       drm/panthor: Reset the FW VM to NULL on unplug
       drm/panthor: Call panthor_sched_post_reset() even if the reset failed

Mohamed Ahmed (1):
       drm/nouveau: use tile_mode and pte_kind for VM_BIND bo allocations

  drivers/gpu/drm/nouveau/nouveau_abi16.c  |  3 ++
  drivers/gpu/drm/nouveau/nouveau_bo.c     | 44 
+++++++++++++----------------
  drivers/gpu/drm/panthor/panthor_device.c |  8 ++----
  drivers/gpu/drm/panthor/panthor_device.h |  1 +
  drivers/gpu/drm/panthor/panthor_fw.c     |  5 ++--
  drivers/gpu/drm/panthor/panthor_gem.c    |  8 ++++--
  drivers/gpu/drm/panthor/panthor_gem.h    |  8 ++++--
  drivers/gpu/drm/panthor/panthor_heap.c   | 36 ++++++++++++++----------
  drivers/gpu/drm/panthor/panthor_sched.c  | 48 
+++++++++++++++++++++++---------
  drivers/gpu/drm/panthor/panthor_sched.h  |  2 +-
  drivers/gpu/drm/xlnx/zynqmp_disp.c       |  6 ++--
  include/uapi/drm/nouveau_drm.h           |  7 +++++
  include/uapi/drm/panthor_drm.h           | 20 ++++++++++---
  13 files changed, 123 insertions(+), 73 deletions(-)
