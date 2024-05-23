Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B777B8CD4E0
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 15:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A24410E769;
	Thu, 23 May 2024 13:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6gws5i8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD1589FF9;
 Thu, 23 May 2024 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716471460; x=1748007460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uNICsZF713AwJhVTdusy9Z58n5VqxDT9PsS4btSsXQI=;
 b=L6gws5i8RW+jvLMHvpdloWHK8gj4cOEgeOxJpyiTZCvvCnuXl8EQn+im
 tKGMg50DcG91xuadomhHUHDekq1qaN/ymxq1uUL3t7RIcfE5hi4DbkCqi
 3ZjTpQkDgX+9nDC5Y3yda/MSJUuQuBhoNeEX30JDTjf/+AitiEj0UDkII
 ZWcjozjw4+73+d+Aeaf7718wzhkKqT4+1jCEJfCQhRaLH7JCGukj2lubk
 Kctxq6dX+Xmw9oDMj10Vle8HhFiCLS9JGhenN0jw3KK49saHkicbd0DRp
 I419U70n/yAWGAybDe3hEAN39IsdfGM9FhZr7sQxwd407L92ZmO3lHU61 w==;
X-CSE-ConnectionGUID: jMwK70AxSIaC5XVSsVi4Mw==
X-CSE-MsgGUID: 9tVKYQAKQZashVajQBjJuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12662771"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="12662771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:37:39 -0700
X-CSE-ConnectionGUID: yltDQQKEQo+NqfOxCzfDgw==
X-CSE-MsgGUID: CehU8C5JTI+nfQP6cABkaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34210085"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:37:35 -0700
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
Subject: [PATCH 3/3] drm/amdgpu: drop redundant W=1 warnings from Makefile
Date: Thu, 23 May 2024 16:37:07 +0300
Message-Id: <c7dffe59c8abe6beaef70ea1f726a6598c9dad77.1716471145.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/amd/amdgpu/Makefile | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 1f6b56ec99f6..9508d0b5708e 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -39,23 +39,7 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
 	-I$(FULL_AMD_DISPLAY_PATH)/amdgpu_dm \
 	-I$(FULL_AMD_PATH)/amdkfd
 
-subdir-ccflags-y := -Wextra
-subdir-ccflags-y += -Wunused
-subdir-ccflags-y += -Wmissing-prototypes
-subdir-ccflags-y += -Wmissing-declarations
-subdir-ccflags-y += -Wmissing-include-dirs
-subdir-ccflags-y += -Wold-style-definition
-subdir-ccflags-y += -Wmissing-format-attribute
-# Need this to avoid recursive variable evaluation issues
-cond-flags := $(call cc-option, -Wunused-but-set-variable) \
-	$(call cc-option, -Wunused-const-variable) \
-	$(call cc-option, -Wstringop-truncation) \
-	$(call cc-option, -Wpacked-not-aligned)
-subdir-ccflags-y += $(cond-flags)
-subdir-ccflags-y += -Wno-unused-parameter
-subdir-ccflags-y += -Wno-type-limits
-subdir-ccflags-y += -Wno-sign-compare
-subdir-ccflags-y += -Wno-missing-field-initializers
+# Locally disable W=1 warnings enabled in drm subsystem Makefile
 subdir-ccflags-y += -Wno-override-init
 subdir-ccflags-$(CONFIG_DRM_AMDGPU_WERROR) += -Werror
 
-- 
2.39.2

