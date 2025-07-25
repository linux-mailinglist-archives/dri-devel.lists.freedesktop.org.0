Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564FDB117B7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8CD10E9B3;
	Fri, 25 Jul 2025 05:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bq4ka9zV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B694610E9B0;
 Fri, 25 Jul 2025 05:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419902; x=1784955902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yD3XZE7Qk74ubpg7xyxWI9G9q5zPxs58MuO97OIvqCM=;
 b=bq4ka9zVPU7S8cdX3duflHclHPZpZ2GCI7WRwywnXWpnai28XyiUQOZz
 99clw3fG0O6ymXBvCgI8JnKWir6ii9ZuambdUsxJ3PLJoqt0S333lAeZC
 J6LF8T8tn8ihnlYnkiRh6frtw7o9glgBzVeCwcDX5MFJ96jBQO6KPfH+z
 Vz5ebguNf+IMxMaox/BGgKOmZliTSWy197l0jqhuAiGwF+jZYs3x9h1wp
 GttisNp232TpUXLDKYJeTpyO2ulwIDVBXC90noFSt/b+V16YU78M6FFXn
 0QibtVrW3cWNAGmGSZe2wqNwZa0oFKbIBEGAX2vTSluGCW0eX3sSd21+4 g==;
X-CSE-ConnectionGUID: iuOQiREJQaGViVIaSLBMxQ==
X-CSE-MsgGUID: IoFYXkYxSRKd1R+Mpz5Uxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299556"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299556"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:05:01 -0700
X-CSE-ConnectionGUID: EkBYwbcqT36BRmGg9NZ5RA==
X-CSE-MsgGUID: Q5GVnCfoS76FkheBW8+e5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956686"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:59 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 20/28] drm/i915/writeback: Add writeback to xe Makefile
Date: Fri, 25 Jul 2025 10:34:01 +0530
Message-Id: <20250725050409.2687242-21-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
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

Add a intel_writeback.c to xe so that it builds for xe.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 76f980475b2c..0551e75b2569 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -299,6 +299,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_vga.o \
 	i915-display/intel_vrr.o \
 	i915-display/intel_wm.o \
+	i915-display/intel_writeback.o \
 	i915-display/skl_scaler.o \
 	i915-display/skl_universal_plane.o \
 	i915-display/skl_watermark.o
-- 
2.34.1

