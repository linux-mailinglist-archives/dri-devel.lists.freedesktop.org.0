Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2CCADE3E0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 08:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726CF10E79B;
	Wed, 18 Jun 2025 06:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiP4xxvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B8D10E1D8;
 Wed, 18 Jun 2025 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750228945; x=1781764945;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=zihwVDlwVdY6BAf3ZcqhX1VngjjfSMAqqVtb0iuPBR0=;
 b=DiP4xxvR89CJubwanCtmnztTZx+73VuplRDg9yc5qWPqik7Lml9UFHpa
 waxDD7doh5I9S/PuVcJhbZ7T4/vuM/riiHPgNGVr4S0pzSfdhciTAXJ/t
 7gyAl6WcE5IeqZOc8plRiyTIQ3XYesU3OcaMmp00hdx2fStjNT1cLflxB
 fhewnYpP75C7swH6xKLPf/q0t9OMFTE5PAd/VSayiOHXInHtkOhqMehqO
 Xjce0P0WXe9bjDs7p68b4dXZbuYpvLO9D/Y0bJKIw/T0WSmC0YdxMA3WI
 f9VUusi72+TIGYGOQ+mTzje6pmpoGKgnRF+7WlF7IJAwwglYKhNHfx8QK w==;
X-CSE-ConnectionGUID: bdtQzMaiRYSQrjyCOdgc7g==
X-CSE-MsgGUID: Ox09rbd1Qn+En1/YybH4AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="55049784"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="55049784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 23:42:25 -0700
X-CSE-ConnectionGUID: IlS4+GhpRsG0Cp4uosp5Mg==
X-CSE-MsgGUID: FMHiLS+ATHyq+fb6ola+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="154098504"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.242])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 23:42:21 -0700
Date: Wed, 18 Jun 2025 09:42:18 +0300
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
Subject: [PULL] drm-intel-fixes
Message-ID: <aFJfykDpUwtmpilE@jlahtine-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Here goes drm-intel-fixes towards v6.16-rc3. Two fixes.

MIPI vtotal programming fix for Broxton and build fix for GCOV+AutoFDO config.

Regards, Joonas

***

drm-intel-fixes-2025-06-18:

- Fix MIPI vtotal programming off by one on Broxton
- Fix PMU code for GCOV and AutoFDO enabled build

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-06-18

for you to fetch changes up to c464ce6af332e7c802c36cd337cacf81db05400c:

  drm/i915/dsi: Fix off by one in BXT_MIPI_TRANS_VTOTAL (2025-06-16 07:57:00 +0300)

----------------------------------------------------------------
- Fix MIPI vtotal programming off by one on Broxton
- Fix PMU code for GCOV and AutoFDO enabled build

----------------------------------------------------------------
Tzung-Bi Shih (1):
      drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled

Ville Syrjälä (1):
      drm/i915/dsi: Fix off by one in BXT_MIPI_TRANS_VTOTAL

 drivers/gpu/drm/i915/display/vlv_dsi.c | 4 ++--
 drivers/gpu/drm/i915/i915_pmu.c        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
