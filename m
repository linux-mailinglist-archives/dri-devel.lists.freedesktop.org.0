Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816DBA6EC3A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E585410E529;
	Tue, 25 Mar 2025 09:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfWUmpbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBCC10E520;
 Tue, 25 Mar 2025 09:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742893665; x=1774429665;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=tMYT1Zmqo1e/bzJZP5RPRqAVdsFwWA2Q0zJKFDYXwi4=;
 b=EfWUmpbvl8MPqW2zMYEJYuN4geuHDyJ8mhmTO+sXgzDtjI0Ok9YZTxJf
 ScT/E4nI67GTZdodVjJsAY1J8VL074bhXWLJI43Jl7lSBhprD7YLtoAdI
 GHXJI/cZhviWh7lK1goVRVQJH3PZQY+ks5FJ3vq13DtAttHlXnyElXJhX
 O5BCINpGVQstdwkiRjqdEC+rHOv8TJn0gWoPn7b3bAAikSRvnuncIx2Cl
 9c2Sj1K1yFckSkC2U5oLO8X4ZDysxRcRj8P98eGXH6KpyXiCCZ2t/ocIM
 8bueaK1WgLEK/QtJsgurg7U/yoM+Il+mQ9rJ1NNfdmADkJ+UfPISMn0ni g==;
X-CSE-ConnectionGUID: tKK1ONAJRmqNXG/OCIfKfA==
X-CSE-MsgGUID: fxwUoMnBSFib8TDX9/JuZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47784284"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="47784284"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:07:43 -0700
X-CSE-ConnectionGUID: ufDtzgCQSz2Qrcbb84vXnA==
X-CSE-MsgGUID: OjdVuXGoTDqiemG6wUWO2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="155218256"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:07:38 -0700
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
Subject: [PULL] drm-intel-next-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 25 Mar 2025 11:07:34 +0200
Message-ID: <878qota36x.fsf@intel.com>
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

drm-intel-next-fixes-2025-03-25:
drm/i915 fixes for v6.15 merge window:
- Bounds check for scalers in DSC prefill latency computation
- Fix build by adding a missing include

BR,
Jani.

The following changes since commit 5da39dce1fa3c81dc6552a16a9f748ba2980d630:

  Merge tag 'drm-xe-next-fixes-2025-03-12' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2025-03-14 17:02:11 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2025-03-25

for you to fetch changes up to af9ec6e4682c089028d763b0b77c04fa2ddae268:

  drm/i915/display: Fix build error without DRM_FBDEV_EMULATION (2025-03-20 18:27:21 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.15 merge window:
- Bounds check for scalers in DSC prefill latency computation
- Fix build by adding a missing include

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/watermark: Check bounds for scaler_users for dsc prefill latency

Yue Haibing (1):
      drm/i915/display: Fix build error without DRM_FBDEV_EMULATION

 drivers/gpu/drm/i915/display/intel_fbdev.h   | 2 ++
 drivers/gpu/drm/i915/display/skl_watermark.c | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
Jani Nikula, Intel
