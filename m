Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C577DF60D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B434910E905;
	Thu,  2 Nov 2023 15:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4F210E8FD;
 Thu,  2 Nov 2023 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698937965; x=1730473965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sX1J1ySAF4MO+eRhktvw93+gXMSrlD5/6fA9bNgY1QY=;
 b=U8q51xCPA8ssVyfqSSMLLg/fAjMzfSChV3zu0Ub1S+9e3/dJZuw0xVv9
 4Pa7+djGS0Pz7US2gFpXGG1vS490C0x17WJhkHRIqTzeS19mNc0mVm24Y
 1sEld9nT9bO+ZHOu10/iOyWdGv7E1igsYlHUxnuhC23tmAQA//T1rJAvv
 pi9TQpKtkTXRKqaa6Cfp1uW7sZFHN5TJ0V05VGQoObhy98GphFeK/FCJh
 CjRigZLhZ8erEpKLQ5VAz9kTQiD/ipdXGNnTMDMWgXH+k9XaDdxCHsqzU
 V2dIpwZw+9NkVrISnFYaEmk1ifuXVdNyptcajR0zRyRyPNpZgvq51RkZz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1660210"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1660210"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="737784575"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="737784575"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 02 Nov 2023 08:12:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 48FFF76F; Thu,  2 Nov 2023 17:12:31 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/15] drm/i915/iosf: Drop unused APIs
Date: Thu,  2 Nov 2023 17:12:28 +0200
Message-Id: <20231102151228.668842-16-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
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

