Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C912AA85292
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF9710EAE0;
	Fri, 11 Apr 2025 04:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jv1Wum72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF88210EADE;
 Fri, 11 Apr 2025 04:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345762; x=1775881762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+S3PnHH/qNvGZMIDwE4Mi6iD1Xx4Zq3HJkl0NfZLkpo=;
 b=Jv1Wum72w1guX/3KSNd6fzZiB5aJFqFZBFzUzAfsuzjnnxb+bwP5Rz26
 KkwF1YduxmsCI7FNsieeyLYYEJgaPUuRmtsG9bz1zhexCciIitpzTkqnJ
 A67IYgnKxWKSrLX2JJptB9HQ0m9qcRPvcfswG3wIfGhpkm8Mcn4izLXbU
 dnI4YIWkTph22mVwQBaPiN4F2aoQstszG8rhJFaGifbinG7aHaq8WLe2Q
 EYz+DPazA3IF+sXfWlADM+zkqV2FLJmnpS/P68OUN1V4freeCJy1zK42d
 6UxD1U3i48dMG4QGhu2X1QpndL3noe/W4qrC49TnImZ8dpAPlSNwatWUR A==;
X-CSE-ConnectionGUID: VkrxcWI0ToiIKikKGotAzw==
X-CSE-MsgGUID: sOxbfKAXQwORvPZoWGvGEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259936"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259936"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:22 -0700
X-CSE-ConnectionGUID: bq6LNpynSzG0ZijL2Hww1A==
X-CSE-MsgGUID: Ik8k6UG3Sy2VLOb2GjSCGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160057056"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:18 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 07/13] drm/dp: Change argument type for
 drm_edp_backlight_set_level
Date: Fri, 11 Apr 2025 09:59:03 +0530
Message-Id: <20250411042909.2626807-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411042909.2626807-1-suraj.kandpal@intel.com>
References: <20250411042909.2626807-1-suraj.kandpal@intel.com>
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

Use u32 for level variable as one may need to pass value for
DP_EDP_PANEL_TARGET_LUMINANCE_VALUE.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 6 +++---
 include/drm/display/drm_dp_helper.h     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index bb1242a1bf6b..895ed4a22fc3 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3933,7 +3933,7 @@ EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
  * Returns: %0 on success, negative error code on failure
  */
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-				u16 level)
+				u32 level)
 {
 	int ret;
 	u8 buf[2] = { 0 };
@@ -4047,7 +4047,7 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 		return ret < 0 ? ret : -EIO;
 	}
 
-	ret = drm_edp_backlight_set_level(aux, bl, level);
+	ret = drm_edp_backlight_set_level(aux, bl, (u32)level);
 	if (ret < 0)
 		return ret;
 	ret = drm_edp_backlight_set_enable(aux, bl, true);
@@ -4327,7 +4327,7 @@ static int dp_aux_backlight_update_status(struct backlight_device *bd)
 			bl->enabled = true;
 			return 0;
 		}
-		ret = drm_edp_backlight_set_level(bl->aux, &bl->info, brightness);
+		ret = drm_edp_backlight_set_level(bl->aux, &bl->info, (u32)brightness);
 	} else {
 		if (bl->enabled) {
 			drm_edp_backlight_disable(bl->aux, &bl->info);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 62be80417ded..6bce0176efd3 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -853,7 +853,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
 		       u32 *current_level, u8 *current_mode, bool need_luminance);
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-				u16 level);
+				u32 level);
 int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
 			     u16 level);
 int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl);
-- 
2.34.1

