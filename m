Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE7C85F6DD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 12:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640BF10E25B;
	Thu, 22 Feb 2024 11:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bq7kA2su";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710BB10E077;
 Thu, 22 Feb 2024 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708601431; x=1740137431;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=/Sh7yAwy1PoT/vaQ/jFwYGxqpnhFOI+7Jyvc7qbsxJ0=;
 b=Bq7kA2suTiNHU+GziWDunh7EuNsXL2P/jyUvpFlVaMvxNzpJhxW8gYjU
 sLBBZl4BkANH770vyWu/iTnHUwWIM1T3wu8I0vDvWg8cbUXROVxdXay6M
 zvevSoc0BTQQAp74RkNhOyfLBksDDDQDRifd9Vm1Q1/xjYzUDq82aCrqn
 +BfILmSlAigYcNf92PI1L+FzvFflmaV9UaQR4LSsJTg7RQ0ywR03oSi5d
 PfSGHPxKM3rLnO6BGnbJI2VxrpUK+fufA5rIYWbiNPlu7s9Ooiq6lv+6M
 elCGxCGEXTpErVv2VXCUIpSA/OwjttAVEy9/qKVDO8kTP8t7Uq7uxxMMD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2941045"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2941045"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:30:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="10104424"
Received: from unknown (HELO localhost) ([10.245.244.42])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:30:26 -0800
Date: Thu, 22 Feb 2024 13:30:23 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <ZdcwT9kltvEgJZZE@jlahtine-mobl.ger.corp.intel.com>
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

Here goes drm-intel-fixes for v6.8-rc6.

Just a single fixup patch for TV mode.

Best Regards, Joonas

***

drm-intel-fixes-2024-02-22:

- Fixup for TV mode

The following changes since commit b401b621758e46812da61fa58a67c3fd8d91de0d:

  Linux 6.8-rc5 (2024-02-18 12:56:25 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2024-02-22

for you to fetch changes up to fb1e881273f432e593f8789f99e725b09304cc97:

  drm/i915/tv: Fix TV mode (2024-02-21 09:30:20 +0200)

----------------------------------------------------------------
- Fixup for TV mode

----------------------------------------------------------------
Maxime Ripard (1):
      drm/i915/tv: Fix TV mode

 drivers/gpu/drm/i915/display/intel_sdvo.c | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_tv.c   | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)
