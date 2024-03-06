Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93F2873F28
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B4F113422;
	Wed,  6 Mar 2024 18:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoxMsrL5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D99E11341B;
 Wed,  6 Mar 2024 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749921; x=1741285921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CDlJdmBn+/5hYwZU+GfnjgEUxtNwTEj1RL6tbIlKtk8=;
 b=hoxMsrL5idHah48ftFXhKjubFWaK/rRwGfU15oIPK33R5wzVClNqSjib
 JGBKcBoPbgMuBYlLyG8/FJGMtTwT729J8VrPiMdPJ89tg/zJPiqcf1LZa
 wPI9zMaVtrfaekqkTO0u0XlbW2gKkBDaPhKO/TPMPw13ETgA+Hs98/nbu
 1xxTSJSUllENDzcJQdEH9C7dVIR8zx+eU16oOl/jDODK+FqFdoXaeR+t4
 L+voppy1FKlcSw3Ad9tS5m+HMbyV6AKrh+6CHBwSHk1LE5K+lvuV9hwyX
 ax+pAYAT10j9HZqkBsJ+RAtx6MJKlZR6utUkrpOtzsusrziO2ngmeEP9+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15102609"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15102609"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14415759"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:31:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 05/22] drm: bridge: samsung-dsim: make samsung-dsim.h
 self-contained
Date: Wed,  6 Mar 2024 20:31:10 +0200
Message-Id: <9534ca7dfba96580950e116c84ce0fa68fdf93a4.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
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

Include <drm/drm_bridge.h> and forward declare struct platform device.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/bridge/samsung-dsim.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index e0c105051246..9764d6eb5beb 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -11,9 +11,11 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_of.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 
+struct platform_device;
 struct samsung_dsim;
 
 #define DSIM_STATE_ENABLED		BIT(0)
-- 
2.39.2

