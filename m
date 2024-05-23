Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BAD8CD4DC
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 15:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A2C10E335;
	Thu, 23 May 2024 13:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fS2zRy8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB0E10E6FC;
 Thu, 23 May 2024 13:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716471445; x=1748007445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f1spVWQvtw4puPgckIsKEtwq2Cvu72mpdoIBib3JaBg=;
 b=fS2zRy8jPMA/V3nCUbyLWs8+mXROyFfNRX2ueM8AW/HKIrd79XCc31FL
 N2v+JrI3no+wIlyKcUY4/XmuBWSBpNB1zbU9GTNB5bwGfFcXIXPGiX05W
 4mZOuuQRdB2PhSyOj7rDzeIXFVKdMHVIoj+8vKXJJ7/TZWtjqVbSaVwWG
 nWKEHoPx7UHFDiVxRgXcayjtpSqhmXg3dfgimgOCWXBAK9zmcyfron37D
 ej0rCMPWWrY5Xf7zTvjuMjX3fKh1+a54MSkRdJiiFaL+QJf3LCsqX5q2R
 x65P8/IMAaysJ+Zbx2vA+a7uccVyNUl2PSVsRt9/xuXgDMnzBot7LETkA A==;
X-CSE-ConnectionGUID: BybOfs3/RdSppToWqe4hxg==
X-CSE-MsgGUID: /3FXgFRjSWq2FyaQW9PTQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12662713"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="12662713"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:37:24 -0700
X-CSE-ConnectionGUID: VhxTs2ISS1u9LwTSKk3VCQ==
X-CSE-MsgGUID: /PaEyZTsQBabBsjo0RI+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34210017"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:37:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, jani.nikula@intel.com
Subject: [PATCH 1/3] drm/i915: drop redundant W=1 warnings from Makefile
Date: Thu, 23 May 2024 16:37:05 +0300
Message-Id: <490931748fa9a1dbac2bceda0c4b778240b10b58.1716471145.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716471145.git.jani.nikula@intel.com>
References: <cover.1716471145.git.jani.nikula@intel.com>
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

Since commit a61ddb4393ad ("drm: enable (most) W=1 warnings by default
across the subsystem"), most of the extra warnings in the driver
Makefile are redundant. Remove them.

Note that -Wmissing-declarations and -Wmissing-prototypes are always
enabled by default in scripts/Makefile.extrawarn.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 7cad944b825c..a70d95a8fd7a 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -3,31 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-# Unconditionally enable W=1 warnings locally
-# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
-subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
-subdir-ccflags-y += -Wmissing-declarations
-subdir-ccflags-y += $(call cc-option, -Wrestrict)
-subdir-ccflags-y += -Wmissing-format-attribute
-subdir-ccflags-y += -Wmissing-prototypes
-subdir-ccflags-y += -Wold-style-definition
-subdir-ccflags-y += -Wmissing-include-dirs
-subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
-subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
-subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
-subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
+# Enable W=1 warnings not enabled in drm subsystem Makefile
 subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
-subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
-# The following turn off the warnings enabled by -Wextra
-ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
-subdir-ccflags-y += -Wno-missing-field-initializers
-subdir-ccflags-y += -Wno-type-limits
-subdir-ccflags-y += -Wno-shift-negative-value
-endif
-ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
-subdir-ccflags-y += -Wno-sign-compare
-endif
-# --- end copy-paste
 
 # Enable -Werror in CI and development
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
-- 
2.39.2

