Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF8A4796A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 10:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4849710E311;
	Thu, 27 Feb 2025 09:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUCeTETk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8A810E30E;
 Thu, 27 Feb 2025 09:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740649095; x=1772185095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OBo2zyoCu+SPp4PN7iBuz3o7aLcFUGKp8buJ0Lj6l5M=;
 b=IUCeTETksZnVtTRpDzq60IFbvGiTMdCxdUpOQI1w7Q2u3V/drfxLkVvk
 q+HahcjREt7Mhe3ZMPccXy9eL6eEdjH04XJ2+LBohuHSdG5JuBqy1gx83
 UfO/WCzax2/hoHV1xOGf4SlGAYnq/8mdoyQ29dnFfPkT2lwjDWzn7Y1l4
 wCuwoEO/K1qpTf9e4kE7bfFkymrAyssbXF2bvP4DDBY6Rw2Xo9Iso0EB7
 O6l1TPbLmOWCkocmHd7Voi/LFuxwPCTb3J2nvha1+Vr5lXnIpPJuwdOPL
 4O/47NrQS2f+2yBk9VEaIBRbySIxv0LKePP+H2SWAp7f8cxUEZ/IlyygV g==;
X-CSE-ConnectionGUID: y6PFWdVMQGu1xzHKU2bS4A==
X-CSE-MsgGUID: Tolw70w3Twyg4p28W5WOuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41784720"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="41784720"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 01:38:14 -0800
X-CSE-ConnectionGUID: 6VpuyXfeT8mLJS6Bg27VtQ==
X-CSE-MsgGUID: 7RaBf87yTz+MqgjOtxNhAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117464501"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.181])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 01:38:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, Dave Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: [PATCH] drm/i915/gvt: update MAINTAINERS
Date: Thu, 27 Feb 2025 11:38:05 +0200
Message-Id: <20250227093805.2217658-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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

Update GVT-g MAINTAINERS entry to reflect the current status of
maintenance and repositories.

Cc: Dave Airlie <airlied@gmail.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Zhenyu Wang <zhenyuw.linux@gmail.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 MAINTAINERS | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b69b93f63c6..98374661f5a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11649,13 +11649,10 @@ F:	drivers/gpio/gpio-tangier.c
 F:	drivers/gpio/gpio-tangier.h
 
 INTEL GVT-g DRIVERS (Intel GPU Virtualization)
-M:	Zhenyu Wang <zhenyuw.linux@gmail.com>
-M:	Zhi Wang <zhi.wang.linux@gmail.com>
-L:	intel-gvt-dev@lists.freedesktop.org
-L:	intel-gfx@lists.freedesktop.org
-S:	Supported
+R:	Zhenyu Wang <zhenyuw.linux@gmail.com>
+R:	Zhi Wang <zhi.wang.linux@gmail.com>
+S:	Odd Fixes
 W:	https://github.com/intel/gvt-linux/wiki
-T:	git https://github.com/intel/gvt-linux.git
 F:	drivers/gpu/drm/i915/gvt/
 
 INTEL HID EVENT DRIVER
-- 
2.39.5

