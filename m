Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77E495BD87
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A8510EBA4;
	Thu, 22 Aug 2024 17:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlxoYJfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD54F10EBA4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 17:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724348596; x=1755884596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fz6fe/UzQSf8zS7IbaX4jjfnmEzOSyTzUxev9SCwVB0=;
 b=GlxoYJfe/7ew9gPano2R707hpvQrY5Rp4eA5TLLfCmGAKchEoIJrSSN6
 eErG/a5iWuhhQwIJFKSQuChVXqwnHppYsMOqDTCMYupyP2UDi81Ahqcxf
 ML0GaXZ/tdEo2H33LKs0g4RPxoFzvt72XkaQcfI/Wteurld5pblL3fOOU
 Mg5pXPE0oPmUheBn3kUEyJyieQptJ1hkth2JJ8eTAqJA1yVzdC+w7YiRJ
 EpRTd0P7oX8UCn0rrnWYf0sR4sULOov2GUEXRAraIm69ITwvCrMsq+L1Z
 9O2YTggBbqHynQRKO2tG7zjQu2A1YRsx87J+WrOf1hw9CA5BaGDXZ6Hor w==;
X-CSE-ConnectionGUID: OJG/RRZhRmSsq5NzW+11nQ==
X-CSE-MsgGUID: X8ByVruFRuqSrqWQa/gn1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22955290"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22955290"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:43:02 -0700
X-CSE-ConnectionGUID: 3CzKmS85SU6ynO3HpMJuvg==
X-CSE-MsgGUID: pnJApPj3T32RwPXcLScCAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="65862295"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.121])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:43:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/6] drm: conversions to struct drm_edid
Date: Thu, 22 Aug 2024 20:42:46 +0300
Message-Id: <cover.1724348429.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The umerged patches from [1] and then some.

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1715691257.git.jani.nikula@intel.com

Jani Nikula (6):
  drm/sti/sti_hdmi: convert to struct drm_edid
  drm/exynos: hdmi: use display_info for printing display dimensions
  drm/exynos: hdmi: convert to struct drm_edid
  drm/tegra: convert to struct drm_edid
  drm/ipuv3/parallel: convert to struct drm_edid
  drm/tiny/gm12u320: convert to struct drm_edid

 drivers/gpu/drm/exynos/exynos_hdmi.c         | 25 ++++++++++-------
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 14 ++++++----
 drivers/gpu/drm/sti/sti_hdmi.c               | 24 +++++++++-------
 drivers/gpu/drm/tegra/drm.h                  |  2 +-
 drivers/gpu/drm/tegra/output.c               | 29 ++++++++++++--------
 drivers/gpu/drm/tiny/gm12u320.c              | 13 +++++++--
 6 files changed, 66 insertions(+), 41 deletions(-)

-- 
2.39.2

