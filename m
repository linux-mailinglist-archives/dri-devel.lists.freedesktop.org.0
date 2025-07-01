Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C65AAEF1D4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0282610E531;
	Tue,  1 Jul 2025 08:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5BTktHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC26D10E122;
 Tue,  1 Jul 2025 08:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751359871; x=1782895871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H430Oql6pWEHqTS456iNuTxON2paNdsugBZuI+YI3qE=;
 b=L5BTktHB6jiDaggGsVUEaeSB2ujkc9bhBzkQufGRTIC8D5EKmHlq1u0L
 tbyfQdO1KdWk/P5wxQyIIktqjsc3wJ2CAlmnXgVHNXkAdT8nZ/OfsJ72u
 azbSGAURsSsi9fuJA3W5L2mResqmiI8qHEFc2qihUXPPYYBuc3iei1R6P
 428o4QURIRQoSMsAIiQXtEybCwnHgGXRLiKL009U4xUOXXdZwnY7nwpY2
 wiU/4asGdp3POk3oMWFp1h3EtmSpXGhzn/A/i2ERzq6rD6Zlo6lD2VM/q
 3ETfa4AdwADvqPwxXsFLC9PfeXfMSeawYsbzEaom/cjWWaebCps8FmwCT w==;
X-CSE-ConnectionGUID: vsGeVt99R66Ixswl7HVTsg==
X-CSE-MsgGUID: +SegyjNiRkeZHKEHzIQRsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64665468"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64665468"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:51:07 -0700
X-CSE-ConnectionGUID: VJvOBPx9S9a97mpWo3muCQ==
X-CSE-MsgGUID: OO4CgFU6S8Cfa0zGpqUS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="177368271"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2025 01:51:05 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, linux-next@vger.kernel.org,
 sfr@canb.auug.org.au, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/dp: Add documentation for luminance_set
Date: Tue,  1 Jul 2025 14:20:54 +0530
Message-Id: <20250701085054.746408-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Documentation for luminance_set for struct drm_edp_backlight_info
was missed which causes warnings.

Fixes: 2af612ad4290 ("drm/dp: Introduce new member in drm_backlight_info")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 include/drm/display/drm_dp_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 774c6d3e2001..87caa4f1fdb8 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -843,6 +843,7 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
  * @lsb_reg_used: Do we also write values to the DP_EDP_BACKLIGHT_BRIGHTNESS_LSB register?
  * @aux_enable: Does the panel support the AUX enable cap?
  * @aux_set: Does the panel support setting the brightness through AUX?
+ * @luminance_set: Does the panel support setting the brightness through AUX using luminance values?
  *
  * This structure contains various data about an eDP backlight, which can be populated by using
  * drm_edp_backlight_init().
-- 
2.34.1

