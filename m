Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F4A7F3E5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 07:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC9110E5C2;
	Tue,  8 Apr 2025 05:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3exOuqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0B610E5BB;
 Tue,  8 Apr 2025 05:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744088495; x=1775624495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PfZE5U/1XhiAdDGzI4NaHNPZlfcu4oUUaYgEJTyXt/s=;
 b=T3exOuqUpLkK5a4e2RFmX+EBcXljET7tGb7zMl/Zf1vID+EbN83I+OnD
 AqcwlYeyZP+Lf4V+lDizS61h8rnBjCSBOuTx1ae6puO2k9KD3VENK4fNs
 qHvJwWgKI4AV3SACskG6U27ABVdb2dja8nZzRiIwvE3swIcoDtEe27bXa
 +aYRMZWHIubIh4P61QoHZFMD8uksuwoTzFTOqxDNcy2QdcDmK8akRrTvp
 M9onjOiOejtjKszKtClJiaOJMeFN4PNeyIL3LjZvfEaWt8kN1B62TulGN
 c1nsUuJqXvVec8VJZyw5R0Qw8ogFpU5bGw3zCyDwzpeqgAlES1oulW2Xm g==;
X-CSE-ConnectionGUID: xxgWi67DR6uD/YhVT3Swtg==
X-CSE-MsgGUID: H7afzDtpR7qoBwKJjNjSZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="67975298"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="67975298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 22:01:35 -0700
X-CSE-ConnectionGUID: ckPdf+6RR/6gnL+42RQGiA==
X-CSE-MsgGUID: iy2cKmjLTSG3JoW7YW+dNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="133015449"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 07 Apr 2025 22:01:33 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/2] drm/dp: Add smooth brightness register bit definition
Date: Tue,  8 Apr 2025 10:31:37 +0530
Message-Id: <20250408050138.2382452-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408050138.2382452-1-suraj.kandpal@intel.com>
References: <20250408050138.2382452-1-suraj.kandpal@intel.com>
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

Add DP_EDP_SMOOTH_BRIGHTNESS register bit definition for
EDP_GENERAL_CAPABILITY 2 register.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 include/drm/display/drm_dp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index c413ef68f9a3..ecf8b8d7b1f5 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1025,6 +1025,7 @@
 #define DP_EDP_GENERAL_CAP_2		    0x703
 # define DP_EDP_OVERDRIVE_ENGINE_ENABLED		(1 << 0)
 # define DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE		(1 << 4)
+# define DP_EDP_SMOOTH_BRIGHTNESS_CAPABLE		(1 << 6)
 
 #define DP_EDP_GENERAL_CAP_3		    0x704    /* eDP 1.4 */
 # define DP_EDP_X_REGION_CAP_MASK			(0xf << 0)
-- 
2.34.1

