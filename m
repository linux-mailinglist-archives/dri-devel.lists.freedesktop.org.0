Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0275C307E4
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB0610E5B3;
	Tue,  4 Nov 2025 10:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaJ2+Rds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68C910E5B0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762251957; x=1793787957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QvHChvCUroVhbTdbUFuITkrf4Tbkg9rbiFEiw5K/YcM=;
 b=QaJ2+RdsKFG8nn+40oFaeehLqPglI6Fhx0OaJJd0mp/r6RngcLajgPyk
 VJ6/99C8CAtjDC1tnW7bAz83tm4IEo1jgfItoQACufrfNuHVis7w78JLO
 aPzUV7pcq81E0EwLZq+3Cs7a2V3lPYf0EHvLqPivnz4LLBgryZVskXf6+
 ug1eIQC3l1HLTrKKiFrRP1iNPWcMmuxvcqaeSZwazgwyr2yt3JaC5sfIm
 bc2Wq2oc+SNExC00dq8lDRmeUm5Eb9walHrpLdkPijf9BG9axe7ilt/E7
 i+/+4ZnOyrQZ622EOymI6eccnc9fge4aqQ88aQsdAW3tNIeWjS1jditHx g==;
X-CSE-ConnectionGUID: WG4gIY9tTP60otMH/mxYKA==
X-CSE-MsgGUID: SH0skDxtQDyCs19xjDhTKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64039385"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64039385"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:25:56 -0800
X-CSE-ConnectionGUID: AHDDsc4NScyRhiVELYq3cw==
X-CSE-MsgGUID: 4oaZiJKFTcKMn/scETqj5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186798819"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:25:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 3/4] drm/Kconfig: move generic Kconfig options above drivers
Date: Tue,  4 Nov 2025 12:25:37 +0200
Message-ID: <a0f9e1a31a2190f535f2c2f94af6e22030db199f.1762251845.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762251845.git.jani.nikula@intel.com>
References: <cover.1762251845.git.jani.nikula@intel.com>
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

Keep non-driver options together, above drivers.

DRM_PANEL_ORIENTATION_QUIRKS remains alone at the end because it's
outside of the whole "if DRM" block.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 8ec9c06b45b7..5a9b5f7a40e2 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -265,6 +265,18 @@ config DRM_SCHED
 	tristate
 	depends on DRM
 
+# Separate option as not all DRM drivers use it
+config DRM_PANEL_BACKLIGHT_QUIRKS
+	tristate
+
+config DRM_LIB_RANDOM
+	bool
+	default n
+
+config DRM_PRIVACY_SCREEN
+	bool
+	default n
+
 source "drivers/gpu/drm/sysfb/Kconfig"
 
 source "drivers/gpu/drm/arm/Kconfig"
@@ -393,18 +405,6 @@ source "drivers/gpu/drm/tyr/Kconfig"
 
 source "drivers/gpu/drm/hyperv/Kconfig"
 
-# Separate option as not all DRM drivers use it
-config DRM_PANEL_BACKLIGHT_QUIRKS
-	tristate
-
-config DRM_LIB_RANDOM
-	bool
-	default n
-
-config DRM_PRIVACY_SCREEN
-	bool
-	default n
-
 endif
 
 # Separate option because drm_panel_orientation_quirks.c is shared with fbdev
-- 
2.47.3

