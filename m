Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B765B963C2B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 09:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DED10E4EC;
	Thu, 29 Aug 2024 07:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gB1vSJzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A3E10E4E4;
 Thu, 29 Aug 2024 07:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724915193; x=1756451193;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=GJcJH9cdSgbkYZkii0sV7KfcdN5fZp0ou6UuOH8qvjQ=;
 b=gB1vSJzmn8Qabm9u//w001PFwrxPoHokGiiFLd6dlm5XK8f2VSvvMI6h
 mTsc87iRIvQGh9iOKR5ZbwBJzjbMzmJOo4pRAtMTlBk5N6+/g7pD76tDm
 U+euO0Y9cIFSS8gCOY+DeoH41DSfYsNDQjBQpN9ttMV5GcX6kX9XcTXPD
 HFxH2BCHZA8rj629LKCXjLBfq7RU2lhNyngu2Q52AGBK0Ss+Fwk1D5qq0
 hFfS3HaCqpmUT7c1QQK7vMtXa+XYuugZaM7Xhd1pTu+s52s81MlthjSD/
 NVLqwE8b0czogC+Ra/wV/2EFxlA/fgJHoYJ8HNZnIJoXVGkR6JPJmtrx3 g==;
X-CSE-ConnectionGUID: e5EA3wvQSHCosgFgVP3irg==
X-CSE-MsgGUID: s7BohXe0S7uLK/mLwPFwLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23631846"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="23631846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 00:06:32 -0700
X-CSE-ConnectionGUID: rvj0sBKMSw+CnhSJvwcB4g==
X-CSE-MsgGUID: bZqzOS5XRfSccHpfvfDHjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="63675182"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.20])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 00:06:28 -0700
Date: Thu, 29 Aug 2024 10:06:25 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <ZtAd8WTw1xiSu_TS@jlahtine-mobl.ger.corp.intel.com>
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

Here goes drm-intel-fixes towards v6.11-rc6.

Fix for USB type-C docks, backlight fix for Lenovo Yoga Tab 3 2G version
and ARL GuC firmware version correction.

Regards, Joonas

***

drm-intel-fixes-2024-08-29:

- Fix #11195: The external display connect via USB type-C dock stays blank after re-connect the dock
- Make DSI backlight work for 2G version of Lenovo Yoga Tab 3 X90F
. Move ARL GuC firmware to correct version
-

The following changes since commit 5be63fc19fcaa4c236b307420483578a56986a37:

  Linux 6.11-rc5 (2024-08-25 19:07:11 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-08-29

for you to fetch changes up to a2ccc33b88e2953a6bf0b309e7e8849cc5320018:

  drm/i915/dp_mst: Fix MST state after a sink reset (2024-08-28 11:32:25 +0300)

----------------------------------------------------------------
- Fix #11195: The external display connect via USB type-C dock stays blank after re-connect the dock
- Make DSI backlight work for 2G version of Lenovo Yoga Tab 3 X90F
. Move ARL GuC firmware to correct version
-

----------------------------------------------------------------
Hans de Goede (1):
      drm/i915/dsi: Make Lenovo Yoga Tab 3 X90F DMI match less strict

Imre Deak (1):
      drm/i915/dp_mst: Fix MST state after a sink reset

John Harrison (1):
      drm/i915: ARL requires a newer GSC firmware

 drivers/gpu/drm/i915/display/intel_dp.c     | 12 +++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 40 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.h |  1 +
 drivers/gpu/drm/i915/display/vlv_dsi.c      |  1 -
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c   | 31 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 10 ++++++--
 drivers/gpu/drm/i915/i915_drv.h             |  2 ++
 drivers/gpu/drm/i915/intel_device_info.c    |  7 +++++
 drivers/gpu/drm/i915/intel_device_info.h    |  3 +++
 include/drm/intel/i915_pciids.h             | 11 +++++---
 10 files changed, 111 insertions(+), 7 deletions(-)
