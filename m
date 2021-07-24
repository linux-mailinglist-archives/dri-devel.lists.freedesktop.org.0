Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C82D3D43DA
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 02:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADB96FD5A;
	Sat, 24 Jul 2021 00:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BA66FD39;
 Sat, 24 Jul 2021 00:11:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191563472"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191563472"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="434270062"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 29/30] drm/i915: replace random CNL comments
Date: Fri, 23 Jul 2021 17:11:13 -0700
Message-Id: <20210724001114.249295-30-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724001114.249295-1-lucas.demarchi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cleanup remaining cases that we find CNL in the codebase.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     | 2 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 2 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c   | 1 -
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h | 1 -
 drivers/gpu/drm/i915/display/intel_vbt_defs.h | 2 +-
 drivers/gpu/drm/i915/intel_device_info.h      | 2 +-
 6 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 4172c8ee6aa6..e86e6ed2d3bf 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1998,7 +1998,7 @@ static void parse_ddi_port(struct drm_i915_private *i915,
 			    "Port %c VBT HDMI boost level: %d\n",
 			    port_name(port), hdmi_boost_level);
 
-	/* DP max link rate for CNL+ */
+	/* DP max link rate for GLK+ */
 	if (i915->vbt.version >= 216) {
 		if (i915->vbt.version >= 230)
 			info->dp_max_link_rate = parse_bdb_230_dp_max_link_rate(child->dp_max_link_rate);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ee6d5f8de24b..b49bf380baab 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -9778,7 +9778,7 @@ static int intel_atomic_check_async(struct intel_atomic_state *state)
 
 		/*
 		 * FIXME: This check is kept generic for all platforms.
-		 * Need to verify this for all gen9 and gen10 platforms to enable
+		 * Need to verify this for all gen9 platforms to enable
 		 * this selectively if required.
 		 */
 		switch (new_plane_state->hw.fb->modifier) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 7c048d2ecf43..f483f479dd0b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -158,7 +158,6 @@ static u32 skl_get_aux_send_ctl(struct intel_dp *intel_dp,
 	/*
 	 * Max timeout values:
 	 * SKL-GLK: 1.6ms
-	 * CNL: 3.2ms
 	 * ICL+: 4ms
 	 */
 	ret = DP_AUX_CH_CTL_SEND_BUSY |
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
index 7fd031a70cfd..6b19f74efd61 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
@@ -206,7 +206,6 @@ struct intel_dpll_hw_state {
 
 	/* cnl */
 	u32 cfgcr0;
-	/* CNL also uses cfgcr1 */
 
 	/* bxt */
 	u32 ebb0, ebb4, pll0, pll1, pll2, pll3, pll6, pll8, pll9, pll10, pcsdw12;
diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index dbe24d7e7375..330077c2e588 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -456,7 +456,7 @@ struct child_device_config {
 	u16 dp_gpio_pin_num;					/* 195 */
 	u8 dp_iboost_level:4;					/* 196 */
 	u8 hdmi_iboost_level:4;					/* 196 */
-	u8 dp_max_link_rate:3;					/* 216/230 CNL+ */
+	u8 dp_max_link_rate:3;					/* 216/230 GLK+ */
 	u8 dp_max_link_rate_reserved:5;				/* 216/230 */
 } __packed;
 
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 057c9aa6f9c6..ef1eecd259e0 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -103,7 +103,7 @@ enum intel_platform {
 #define INTEL_SUBPLATFORM_ULT	(0)
 #define INTEL_SUBPLATFORM_ULX	(1)
 
-/* CNL/ICL */
+/* ICL */
 #define INTEL_SUBPLATFORM_PORTF	(0)
 
 /* DG2 */
-- 
2.31.1

