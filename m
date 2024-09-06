Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B00E96F1FA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 12:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D1710EA07;
	Fri,  6 Sep 2024 10:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGdsEG8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793E610EA07;
 Fri,  6 Sep 2024 10:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725620150; x=1757156150;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=+5X5RmOpW75vGBBLyLRc/lO46cBQ6s4XrK+NXXvX35c=;
 b=ZGdsEG8lTo6AeX57uKJuBAvZACRqnRskmk7k9l5zSQEpPCbHxXQX2BPV
 6DR/FL2hvB1bZrao9x86Tzj3cSxVdT4I/u7rnDNUfD+WjZzhfEVieJ12f
 hjXGlhUHm/Fh7vWmbIqaZkqdnfrtTRY/9khq8It3mbBLMiB4+5N1oagMv
 Uz+gnWxhL7lQURrKfK7lI0aFxmFTuIVLNAjdmTDt3ngr8D7U0bDOFDr0m
 3zwWWQLO8r6aN91E9yTMBJVl4eat3hw3edgOvsZZFXt9WY+od7NNQiNJN
 Nrcd0rAM7BuEORGWkDES2uxaOCq8eoCEXNbr9GiR78dKVSkuUhflq7F2/ A==;
X-CSE-ConnectionGUID: ErdNnU/ZSXmhK+ZuQDbq5A==
X-CSE-MsgGUID: 1sGQTskhSyKpMBaaqRUoTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="46903046"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="46903046"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 03:55:50 -0700
X-CSE-ConnectionGUID: Gr9PDKwPQvm+d8CnvufYcA==
X-CSE-MsgGUID: buDiXADaQryY4tqkUvEcPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="70724267"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 03:55:47 -0700
Date: Fri, 6 Sep 2024 13:55:43 +0300
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
Message-ID: <Ztrfr_Wuurfa-3Rv@jlahtine-mobl.ger.corp.intel.com>
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

Here goes the final drm-intel-gt-next towards 6.12.

Primarily addition of fan speed hwmon, W/A fixups for ARL, add missing register
for userspace into DG2/MTL/ARL. Then a few smaller fixes. 

Regards, Joonas

***

drm-intel-gt-next-2024-09-06:

Driver Changes:

- Expose fan speed via hwmon (Raag)
- Correction to Wa_14019159160 on ARL (John H)
- Whitelist COMMON_SLICE_CHICKEN1 for UMD access on DG2/MTL/ARL (Dnyaneshwar)
- Do not attempt to load the GSC multiple times to avoid hanging GSC HW (Daniele)

- Populate /sys/class/drm/cardX/engines/ even if one engine fails (Andi)
- Use kmemdup_array instead of kmemdup for multiple allocation (Yu)
- Remove extra unlikely() (Hongbo)

The following changes since commit 255fc1703e42321b5afdedc8259ad03c7cc533ec:

  drm/i915/gem: Calculate object page offset for partial memory mapping (2024-08-21 15:28:33 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2024-09-06

for you to fetch changes up to 596a7f1084e49cc65072c458c348861e9b9ceab9:

  drm/i915: Remove extra unlikely helper (2024-09-05 15:44:37 -0400)

----------------------------------------------------------------
Driver Changes:

- Expose fan speed via hwmon (Raag)
- Correction to Wa_14019159160 on ARL (John H)
- Whitelist COMMON_SLICE_CHICKEN1 for UMD access on DG2/MTL/ARL (Dnyaneshwar)
- Do not attempt to load the GSC multiple times to avoid hanging GSC HW (Daniele)

- Populate /sys/class/drm/cardX/engines/ even if one engine fails (Andi)
- Use kmemdup_array instead of kmemdup for multiple allocation (Yu)
- Remove extra unlikely() (Hongbo)

----------------------------------------------------------------
Andi Shyti (1):
      drm/i915/gt: Continue creating engine sysfs files even after a failure

Daniele Ceraolo Spurio (1):
      drm/i915: Do not attempt to load the GSC multiple times

Dnyaneshwar Bhadane (1):
      drm/i915/gt: Whitelist COMMON_SLICE_CHICKEN1 for UMD access.

Hongbo Li (1):
      drm/i915: Remove extra unlikely helper

John Harrison (1):
      drm/i915/guc: Fix missing enable of Wa_14019159160 on ARL

Raag Jadav (1):
      drm/i915/hwmon: expose fan speed

Yu Jiaoliang (1):
      drm/i915/gt: Use kmemdup_array instead of kmemdup for multiple allocation

 .../ABI/testing/sysfs-driver-intel-i915-hwmon      |  8 ++
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  9 +--
 drivers/gpu/drm/i915/gt/sysfs_engines.c            |  5 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |  5 ++
 drivers/gpu/drm/i915/i915_hwmon.c                  | 88 ++++++++++++++++++++++
 9 files changed, 112 insertions(+), 11 deletions(-)
