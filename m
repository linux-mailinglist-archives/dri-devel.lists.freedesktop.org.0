Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32896AB0BB5
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 09:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A4310E990;
	Fri,  9 May 2025 07:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="foxK3DnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3B710E0AA;
 Fri,  9 May 2025 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746775839; x=1778311839;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4MUXhwXsQvsd+eMV+gXy6jaK8LODOotIeqcyOeu4W0M=;
 b=foxK3DnXU+l0QFNbcC7HrJFbLsCAy6ksRLnal1QNboc+1Owdz/8vqZMA
 r20YbCnkDF2lFrC96rzgwyvm+uv1nV6ZGAfWN4WtB/2uCwDY1n6FHaBHl
 IefEd3aujG850rwyfQ02mlyhpd3hBm3ZxJb2V3d6em4GlFN4kK4WscTNy
 Zjz622wy3TwgDYmryFdhwbxKnGsCayj33A72Nflou1ugmxZnTAbnTu6VZ
 87bp0Cwlo7jnuKWpY8EEeocLri2x4NjV2/qYkpt7vBWH4GLLYjqushVZV
 N9nWd6ibqrmZJXerLI5TMd8Jn1LiCGo9dmkqzMBvBPg+Y7S6Y2UWE4O3c Q==;
X-CSE-ConnectionGUID: 2W1cPFV5T2WruEU7T5QxUA==
X-CSE-MsgGUID: zbhibOJtTVCBC/rvFxKEeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48746926"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48746926"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:30:38 -0700
X-CSE-ConnectionGUID: qzWzQUvfSKeNOD3y9MoEDg==
X-CSE-MsgGUID: m9oLw9OAQ2CMxB69UuWCGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="137044293"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.55])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:30:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Oded
 Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 09 May 2025 10:30:31 +0300
Message-ID: <87tt5umeaw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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


Hi Dave & Sima -

A bit late this week, couple of fixes for -rc6.


drm-intel-fixes-2025-05-09:
drm/i915 fixes for v6.15-rc6:
- Fix oops on resume after disconnecting DP MST sinks during suspend
- Fix SPLC num_waiters refcounting

BR,
Jani.

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-05-09

for you to fetch changes up to 732b87a409667a370b87955c518e5d004de740b5:

  drm/i915/dp: Fix determining SST/MST mode during MTP TU state computation (2025-05-09 10:15:52 +0300)

----------------------------------------------------------------
drm/i915 fixes for v6.15-rc6:
- Fix oops on resume after disconnecting DP MST sinks during suspend
- Fix SPLC num_waiters refcounting

----------------------------------------------------------------
Imre Deak (1):
      drm/i915/dp: Fix determining SST/MST mode during MTP TU state computation

Vinay Belgaumkar (1):
      drm/i915/slpc: Balance the inc/dec for num_waiters

 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c         | 14 +++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
Jani Nikula, Intel
