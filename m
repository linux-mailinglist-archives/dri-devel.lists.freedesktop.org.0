Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501BAAA46E9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 11:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C7510E714;
	Wed, 30 Apr 2025 09:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsJqmQOd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E89510E2B5;
 Wed, 30 Apr 2025 09:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746004967; x=1777540967;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=PgfJti/PcUUTHNkZ1Z7MZxCys8xxxAXZqso/92z2KvA=;
 b=BsJqmQOdAtowPLUQh1O1mSu+Dm6tIIL8NgiHHm9Z1AOIZtD0WreqOCSN
 kpYZXBQR04DQxm9REQgMOWYxZFmSLSAVXEmmaGiaKnUe627fxt8Ko54I/
 ouWEJAGkdRzg5xqlY20WLnYE7DWoBN0YS1JsovD/3xvTGwSFqFGQjPpt9
 CG0znnzjJdbck2Eza+BM93Tv0HHsaF99DnROhSB1o5upjPWu1FrXDQYve
 YNa8NMbtm73aQp045y4KHHJe2KFTe5PViLta/Wm127AanHltRvoB5FNGb
 CjBv3CaRE+jG+l6DwP/eN0ocnODKxJ7eimL5ycB6se6huzjz/JV5OvjpW w==;
X-CSE-ConnectionGUID: Sy7BVKrsScqwwkCe4mvAxg==
X-CSE-MsgGUID: /Cbv4tERQ5axXKDT0BGISQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47535837"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47535837"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 02:22:46 -0700
X-CSE-ConnectionGUID: g17r4ZeOT2iriifuCXPNDQ==
X-CSE-MsgGUID: /3roiv2dTpy4xh9QskKpIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="139050042"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 02:22:41 -0700
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
Date: Wed, 30 Apr 2025 12:22:37 +0300
Message-ID: <87selquhpe.fsf@intel.com>
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

drm-intel-fixes-2025-04-30:
drm/i915 fixes for v6.15-rc5:
- Fix build for CONFIG_DRM_I915_PXP=n

BR,
Jani.

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-04-30

for you to fetch changes up to 7e21ea8149a0e41c3666ee52cc063a6f797a7a2a:

  drm/i915/pxp: fix undefined reference to `intel_pxp_gsccs_is_ready_for_sessions' (2025-04-22 10:55:38 +0300)

----------------------------------------------------------------
drm/i915 fixes for v6.15-rc5:
- Fix build for CONFIG_DRM_I915_PXP=n

----------------------------------------------------------------
Chen Linxuan (1):
      drm/i915/pxp: fix undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'

 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
Jani Nikula, Intel
