Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096CB8D4C7B
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A551128A3;
	Thu, 30 May 2024 13:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaSjhDE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0B01128A3;
 Thu, 30 May 2024 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717075217; x=1748611217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bX+zg8h2YhgNfm4JA0we6O9nC93BNZED1HQoYPGDXG8=;
 b=UaSjhDE6xJIAohdQRLnh/BId8N6K67utj61hZ8XwX8XBNU24aqfZcaTQ
 ycaAO+oB/wiOL7KK8qQPy41vl+hJ8QW6i44iDoBKVsVtARORKOX2BxujE
 vHsu+ZY+hj28oYimoE7kpZSo9i2cZjZEBaG+R0RaC2gl3IoICti/H9wKE
 pfPWKbjjEMOo9AAv8jr/Fj0DifVfEBkSnJmw5KwfBisQeZ4TciK41FJYj
 veglbTwZ9Ui8Zhtuf5HM4eo4Gg+/Pxw9+sKLyUudhlNe0CridL8qh2K/D
 8r1Sgk4xQ3JYH+FYyaRCC885AQqelJ/bd21NSZpJJorYUqLIOhwvTom7S g==;
X-CSE-ConnectionGUID: Sj0+/YuQSzGIiWp6I0uW+w==
X-CSE-MsgGUID: uK94+Ii9RreMmIqNYWgyDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24678061"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24678061"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:20:17 -0700
X-CSE-ConnectionGUID: t5C0Wip9TaqSGjQj5j0rlQ==
X-CSE-MsgGUID: S00zNBazTXO/+3bWXOKykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="35884814"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:20:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 10/10] MAINTAINERS: update i915 and xe entries for
 include/drm/intel
Date: Thu, 30 May 2024 16:19:11 +0300
Message-Id: <e0fdf28307bb3e457d8c67966c09c44cf7ff5783.1717075103.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717075103.git.jani.nikula@intel.com>
References: <cover.1717075103.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

With all the Intel specific drm files under include/drm/intel, update
the i915, xe, and the shared display entries. Do not discriminate based
on file name pattern, just add the entire directory for all three
entries.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21aad782f1ea..572be0546e21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11013,6 +11013,7 @@ S:	Supported
 F:	drivers/gpu/drm/i915/display/
 F:	drivers/gpu/drm/xe/display/
 F:	drivers/gpu/drm/xe/compat-i915-headers
+F:	include/drm/intel/
 
 INTEL DRM I915 DRIVER (Meteor Lake, DG2 and older excluding Poulsbo, Moorestown and derivative)
 M:	Jani Nikula <jani.nikula@linux.intel.com>
@@ -11030,7 +11031,7 @@ F:	Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 F:	Documentation/gpu/i915.rst
 F:	drivers/gpu/drm/ci/xfails/i915*
 F:	drivers/gpu/drm/i915/
-F:	include/drm/i915*
+F:	include/drm/intel/
 F:	include/uapi/drm/i915_drm.h
 
 INTEL DRM XE DRIVER (Lunar Lake and newer)
@@ -11046,7 +11047,7 @@ T:	git https://gitlab.freedesktop.org/drm/xe/kernel.git
 F:	Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 F:	Documentation/gpu/xe/
 F:	drivers/gpu/drm/xe/
-F:	include/drm/xe*
+F:	include/drm/intel/
 F:	include/uapi/drm/xe_drm.h
 
 INTEL ETHERNET DRIVERS
-- 
2.39.2

