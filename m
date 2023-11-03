Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D56E7E0A31
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 21:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE5610EABF;
	Fri,  3 Nov 2023 20:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85EF10EA9B;
 Fri,  3 Nov 2023 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699042727; x=1730578727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G27iSclFFumr76St5V1sfxdQObjKJmsJSwaDZg/d3AM=;
 b=HvmPiCFe69KnKiREIDjXy2E4d/NitalTLeNmuJq55hJvwwXUcTIVkpSZ
 pfV364XHpOaDtvM6BI73GKNUWzTJlsPmnK9qS/LnGbfeR8p4N7GaCNUG+
 tQpCqLz0dlkJHIDPsqrp6oKso2og3cKlb6HugkNel3zIQDzlVp1ZGfZ5Y
 dWn7Kk/CSoiHH0NfHOy7iDEWUXnrQWuUpDm1qGee3UF8JfZ++2YvhVKh3
 /XuizQv1IOzU+5PYZG+yHqUjwpNU4A7FKp5ozelMi1DUk7v/OEHlg0DDV
 vn4iT+zdYsByz1ihqJZNbrPvMSirxTuPiR48LDg7aEZOhIi+YafL2VPO3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1896125"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1896125"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 13:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832131206"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="832131206"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2023 13:18:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 607D97E7; Fri,  3 Nov 2023 22:18:34 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/16] drm/i915/iosf: Drop unused APIs
Date: Fri,  3 Nov 2023 22:18:31 +0200
Message-Id: <20231103201831.1037416-17-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231103201831.1037416-1-andriy.shevchenko@linux.intel.com>
References: <20231103201831.1037416-1-andriy.shevchenko@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop unused vlv_iosf_sb_read() and vlv_iosf_sb_write().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/vlv_sideband.c | 17 -----------------
 drivers/gpu/drm/i915/vlv_sideband.h |  3 ---
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/vlv_sideband.c b/drivers/gpu/drm/i915/vlv_sideband.c
index b98dec3ad817..13b644958e38 100644
--- a/drivers/gpu/drm/i915/vlv_sideband.c
+++ b/drivers/gpu/drm/i915/vlv_sideband.c
@@ -166,23 +166,6 @@ u32 vlv_nc_read(struct drm_i915_private *i915, u8 addr)
 	return val;
 }
 
-u32 vlv_iosf_sb_read(struct drm_i915_private *i915, u8 port, u32 reg)
-{
-	u32 val = 0;
-
-	vlv_sideband_rw(i915, PCI_DEVFN(0, 0), port,
-			SB_CRRDDA_NP, reg, &val);
-
-	return val;
-}
-
-void vlv_iosf_sb_write(struct drm_i915_private *i915,
-		       u8 port, u32 reg, u32 val)
-{
-	vlv_sideband_rw(i915, PCI_DEVFN(0, 0), port,
-			SB_CRWRDA_NP, reg, &val);
-}
-
 u32 vlv_cck_read(struct drm_i915_private *i915, u32 reg)
 {
 	u32 val = 0;
diff --git a/drivers/gpu/drm/i915/vlv_sideband.h b/drivers/gpu/drm/i915/vlv_sideband.h
index 9ce283d96b80..8b4495e14bce 100644
--- a/drivers/gpu/drm/i915/vlv_sideband.h
+++ b/drivers/gpu/drm/i915/vlv_sideband.h
@@ -26,9 +26,6 @@ enum {
 };
 
 void vlv_iosf_sb_get(struct drm_i915_private *i915, unsigned long ports);
-u32 vlv_iosf_sb_read(struct drm_i915_private *i915, u8 port, u32 reg);
-void vlv_iosf_sb_write(struct drm_i915_private *i915,
-		       u8 port, u32 reg, u32 val);
 void vlv_iosf_sb_put(struct drm_i915_private *i915, unsigned long ports);
 
 static inline void vlv_bunit_get(struct drm_i915_private *i915)
-- 
2.40.0.1.gaa8946217a0b

