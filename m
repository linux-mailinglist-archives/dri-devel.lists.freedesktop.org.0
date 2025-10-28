Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85716C14981
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A098110E3BD;
	Tue, 28 Oct 2025 12:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3HY1rJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB89A10E3E2;
 Tue, 28 Oct 2025 12:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654065; x=1793190065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lsIhtqVpncElBE4tIRnd/IVXdbA8MOy2lB9c9HO02pU=;
 b=U3HY1rJwgVVZRQjlyGTPMy9p99o2a6A/JACxgd1K3BQJPn6b7WL7qrFy
 6PAYtYjoe+szuWc/Pk4ybr7hnzxzhNqLZjnXFGevU7svTkmHgYJHC/HBd
 HtZqLXVr4UNOKLfQnBoBmjuMijG1Mc5rCXB8zEGlrhTSb4bjk62lG49Sw
 cs3G3Sta7iIPWVVjuDmj9f9LEdCcIAeIUcxdlYUhO0purbj911jbMJ9wQ
 /hhsuI02dnxcxe3Bi9insCbNDdQIqyGZ2ngcH9kCjhtNySKOo1KcUmzIu
 b9EFzfihUHFmVfWCSNsZCPA2I9RlL4sfmg0wgxzMlBZijahAroyZ79GCF A==;
X-CSE-ConnectionGUID: ZbPMMVgKRBmXtIrymmXihg==
X-CSE-MsgGUID: 84sMCp17SruNRhmhKdRIcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75198284"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="75198284"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:21:05 -0700
X-CSE-ConnectionGUID: n95FlbB4Smylm/zyrO4HfA==
X-CSE-MsgGUID: rohfUVr4SkGyea7az4/7FA==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:21:03 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: nemesa.garg@intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [RESEND 10/10] drm/i915/display: Expose sharpness strength property
Date: Tue, 28 Oct 2025 17:37:46 +0530
Message-ID: <20251028120747.3027332-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
References: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
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

From: Nemesa Garg <nemesa.garg@intel.com>

Expose the drm crtc sharpness strength property which will enable
or disable the sharpness/casf based on user input. With this user
can set/update the strength of the sharpness or casf filter.

v2: Update subject[Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index d300ba1dcd2c..802ae5aaece1 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -395,6 +395,9 @@ int intel_crtc_init(struct intel_display *display, enum pipe pipe)
 
 	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
 
+	if (HAS_CASF(display))
+		drm_crtc_create_sharpness_strength_property(&crtc->base);
+
 	return 0;
 
 fail:
-- 
2.45.2

