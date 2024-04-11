Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ACA8A18F9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 17:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2675410F1B2;
	Thu, 11 Apr 2024 15:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5xpbGya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3D510F1AC;
 Thu, 11 Apr 2024 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712850319; x=1744386319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XGWVELg2qaMdFfmrFFk9Y3LNwzmLrR+g9/UOYabFxBk=;
 b=U5xpbGyaVfqEaJjQbDhSgX+Tfo0psMlshRhi+Z5QR94zWjTVNGrlD9Hz
 oW7US1mOmODvBrI9atHX8Clohv43PgFEtzNxq3lZQ2HGrgbR0xBUcu5SY
 b+gcFXxJ2TTMK9aigqOSk+scDXknJSFlxY6ww+jA4OH8CAbylzXqk0sLM
 Ekp49FM8OSaE7gkJV6dkuXx31VHN94iYkQZBORWqwnHxW7mrXDpPqkc8V
 SZouCs+W5uGeOLaJUAofTjyNAJ/J5XUnLesJnpELTIxKsXfB2kv8AM7jd
 nNsombCsmEWzBLOHpE/XPT6hCQGhguUHlUytWdf2yvbQafKbbIuQWvIBW w==;
X-CSE-ConnectionGUID: 6ajQWc8vQiaNSRU2f62YhQ==
X-CSE-MsgGUID: 31q5U/VARIiN9/jcIf2Rvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18827087"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="18827087"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 08:45:12 -0700
X-CSE-ConnectionGUID: mKoR+sRVR5Kdo46fv9GmUQ==
X-CSE-MsgGUID: QX44pQXpRma6ajjP/TPHdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20845021"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 08:45:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH 11/10] MAINTAINERS: update i915 and xe entries for
 include/drm/intel
Date: Thu, 11 Apr 2024 18:45:03 +0300
Message-Id: <20240411154503.342217-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
References: <cover.1712743191.git.jani.nikula@intel.com>
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
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e7a511b443af..a71254fdbf4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10841,6 +10841,7 @@ S:	Supported
 F:	drivers/gpu/drm/i915/display/
 F:	drivers/gpu/drm/xe/display/
 F:	drivers/gpu/drm/xe/compat-i915-headers
+F:	include/drm/intel/
 
 INTEL DRM I915 DRIVER (Meteor Lake, DG2 and older excluding Poulsbo, Moorestown and derivative)
 M:	Jani Nikula <jani.nikula@linux.intel.com>
@@ -10858,7 +10859,7 @@ F:	Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 F:	Documentation/gpu/i915.rst
 F:	drivers/gpu/drm/ci/xfails/i915*
 F:	drivers/gpu/drm/i915/
-F:	include/drm/i915*
+F:	include/drm/intel/
 F:	include/uapi/drm/i915_drm.h
 
 INTEL DRM XE DRIVER (Lunar Lake and newer)
@@ -10875,7 +10876,7 @@ T:	git https://gitlab.freedesktop.org/drm/xe/kernel.git
 F:	Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 F:	Documentation/gpu/xe/
 F:	drivers/gpu/drm/xe/
-F:	include/drm/xe*
+F:	include/drm/intel/
 F:	include/uapi/drm/xe_drm.h
 
 INTEL ETHERNET DRIVERS
-- 
2.39.2

