Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45E989EF90
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8683F113288;
	Wed, 10 Apr 2024 10:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4jlE9iT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4989C1132A4;
 Wed, 10 Apr 2024 10:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743633; x=1744279633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tdtgw0zhmL6ZddiUHnjD4R+nwLa11n3twLGZikb8y1A=;
 b=I4jlE9iTZ/A3HZXXQns7sbdsuUl5547NUF3zBbOF3VD8oOVLzd0xtbsW
 U9hwKcmA/erlTWRaOV3tsQcuK58T7Nwr4TNgpgmBnr+DkZ1M/ZGvasp3Y
 pbe5Ps8LfXLnB9T3ADr93BpfZ+rtSxQ9HvxPBSVYu731Zzz58DGK7/4nL
 v0sBKzYLbG4T1qeLO2BVsfyy1xY9w2CkarLlhiAJDI8e/wixlQeXHBXyN
 NVMYbBclsPLmwsCnJkmxkzyDMkiV1FCEhQJTNESifvpb5QAere2LOcWhJ
 L0Scc91GuAzGZIlPRX4Dnm5Czq1OLJchqIYPnkOlI/gd5cXbt0kTyf4ga g==;
X-CSE-ConnectionGUID: E4Ldo3/hR6uJj/i68Crl5A==
X-CSE-MsgGUID: 3ecwGbkjRIej/2KykRpzlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11888354"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11888354"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:06:20 -0700
X-CSE-ConnectionGUID: E9PlOsFmTzCf6F7GpmkcpQ==
X-CSE-MsgGUID: JTdP+oAhQ8SXGg8cfdOprQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25195148"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:06:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 09/10] drm: move xe_pciids.h under include/drm/intel
Date: Wed, 10 Apr 2024 13:05:16 +0300
Message-Id: <062692b89828bc94ac24397241d24674811db2c5.1712743191.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
References: <cover.1712743191.git.jani.nikula@intel.com>
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

Clean up the top level include/drm directory by grouping all the Intel
specific files under a common subdirectory.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c         | 2 +-
 include/drm/{ => intel}/xe_pciids.h | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename include/drm/{ => intel}/xe_pciids.h (100%)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3b30353dbc09..46b3ee310ee7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -13,7 +13,7 @@
 
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_drv.h>
-#include <drm/xe_pciids.h>
+#include <drm/intel/xe_pciids.h>
 
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
diff --git a/include/drm/xe_pciids.h b/include/drm/intel/xe_pciids.h
similarity index 100%
rename from include/drm/xe_pciids.h
rename to include/drm/intel/xe_pciids.h
-- 
2.39.2

