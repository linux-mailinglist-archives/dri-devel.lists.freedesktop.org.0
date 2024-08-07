Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A38894A849
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664DE10E50E;
	Wed,  7 Aug 2024 13:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhvhEmgy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFB910E50C;
 Wed,  7 Aug 2024 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723035979; x=1754571979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IxcWQ1NxSZdo4ms4sLijkEfcJnBM5QNPkcXkBTStdOw=;
 b=RhvhEmgyltKLLAAh/ckyI+D0Iun+uMd5Ayz85OQprL8enr8PbBxQWiqm
 gu+9GuosxgzKB/wTMFxXbcU1BIY+dEm80u6nuEs6bMxaSLKBt+NYxu1RT
 0FKHDUZA/fWt/rGMPSdNyX0BRJlWHcu0Trsf0lVrSOZKOWSoyTItz5XQG
 auVLAysJ1leSb6OXBv8Q60lFUPPMC3CdPhk5Qyy9mtI9m/Y97ZCFr581l
 rlvNmQaTEeObwDHMYl8XDvjAm0nCtLCsjHjICGShhcPc5YjnyW8WJSlDO
 CxQrFb7W3cNjXUv6lScjdvzKW41FVIJYNnHpPhYHRnKg2GG0sal00Idw2 w==;
X-CSE-ConnectionGUID: Od2Nc9nOQb2BAxcujp3DVQ==
X-CSE-MsgGUID: eohOhOXVQBKEBkZi0E6UjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20980005"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="20980005"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:06:18 -0700
X-CSE-ConnectionGUID: fQUgsRlHQ+y8zBuRMuUT3A==
X-CSE-MsgGUID: kGq41HS9QJCwQa0uPIAzUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="61726608"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 intel.com) ([10.245.245.2])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:06:15 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH 2/2] drm/i915: Replace double blank with single blank after
 comma
Date: Wed,  7 Aug 2024 14:05:16 +0100
Message-ID: <20240807130516.491053-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807130516.491053-1-andi.shyti@linux.intel.com>
References: <20240807130516.491053-1-andi.shyti@linux.intel.com>
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

Do not use double blanks, ",  " in function parameters where it's
not required by any alignment purpose. Replase it with a single
blank, ", ".

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_wm.c               | 2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c             | 2 +-
 drivers/gpu/drm/i915/display/intel_display.c         | 2 +-
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c         | 2 +-
 drivers/gpu/drm/i915/gvt/trace.h                     | 2 +-
 drivers/gpu/drm/i915/i915_driver.c                   | 6 +++---
 drivers/gpu/drm/i915/i915_sysfs.c                    | 4 ++--
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index 2b7c3d270b17..15cda57fbc91 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -4028,7 +4028,7 @@ void i9xx_wm_init(struct drm_i915_private *dev_priv)
 		dev_priv->display.funcs.wm = &g4x_wm_funcs;
 	} else if (IS_PINEVIEW(dev_priv)) {
 		if (!pnv_get_cxsr_latency(dev_priv)) {
-			drm_info(&dev_priv->drm,  "Unknown FSB/MEM, disabling CxSR\n");
+			drm_info(&dev_priv->drm, "Unknown FSB/MEM, disabling CxSR\n");
 			/* Disable CxSR and never update its watermark again */
 			intel_set_memory_cxsr(dev_priv, false);
 			dev_priv->display.funcs.wm = &nop_funcs;
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 11ee4406dce8..85c3f806c821 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4973,7 +4973,7 @@ void intel_ddi_init(struct drm_i915_private *dev_priv,
 	} else {
 		drm_encoder_init(&dev_priv->drm, &encoder->base, &intel_ddi_funcs,
 				 DRM_MODE_ENCODER_TMDS,
-				 "DDI %c/PHY %c", port_name(port),  phy_name(phy));
+				 "DDI %c/PHY %c", port_name(port), phy_name(phy));
 	}
 
 	intel_encoder_link_check_init(encoder, intel_ddi_link_check);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2755ebbbb9d2..3d695688b6b5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5111,7 +5111,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	if (current_config->name != pipe_config->name) { \
 		BUILD_BUG_ON_MSG(!__same_type(current_config->name, bool), \
 				 __stringify(name) " is not bool");	\
-		pipe_config_mismatch(&p, fastset, crtc,  __stringify(name), \
+		pipe_config_mismatch(&p, fastset, crtc, __stringify(name), \
 				     "(expected %s, found %s)", \
 				     str_yes_no(current_config->name), \
 				     str_yes_no(pipe_config->name)); \
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 9c5a3f5beda2..a0a3b3e180f4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -493,7 +493,7 @@ static void crtc_updates_info(struct seq_file *m,
 	seq_printf(m, "%sMax update: %lluns\n",
 		   hdr, crtc->debug.vbl.max);
 	seq_printf(m, "%sAverage update: %lluns\n",
-		   hdr, div64_u64(crtc->debug.vbl.sum,  count));
+		   hdr, div64_u64(crtc->debug.vbl.sum, count));
 	seq_printf(m, "%sOverruns > %uus: %u\n",
 		   hdr, VBLANK_EVASION_TIME_US, crtc->debug.vbl.over);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 47f51a5ab493..ec357d2670f1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -150,7 +150,7 @@ int intel_dp_hdcp_repeater_present(struct intel_digital_port *dig_port,
 	ssize_t ret;
 	u8 bcaps;
 
-	ret = intel_dp_hdcp_read_bcaps(&dig_port->dp.aux, i915,  &bcaps);
+	ret = intel_dp_hdcp_read_bcaps(&dig_port->dp.aux, i915, &bcaps);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/trace.h
index 020f1aa28322..63874d385c6f 100644
--- a/drivers/gpu/drm/i915/gvt/trace.h
+++ b/drivers/gpu/drm/i915/gvt/trace.h
@@ -227,7 +227,7 @@ TRACE_EVENT(oos_sync,
 #define GVT_CMD_STR_LEN 40
 TRACE_EVENT(gvt_command,
 	TP_PROTO(u8 vgpu_id, u8 ring_id, u32 ip_gma, u32 *cmd_va,
-		u32 cmd_len,  u32 buf_type, u32 buf_addr_type,
+		u32 cmd_len, u32 buf_type, u32 buf_addr_type,
 		void *workload, const char *cmd_name),
 
 	TP_ARGS(vgpu_id, ring_id, ip_gma, cmd_va, cmd_len, buf_type,
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index fb8e9c2fcea5..202b0e494256 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1693,9 +1693,9 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_FREE, drm_noop, DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(I915_INIT_HEAP, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_CMDBUFFER, drm_noop, DRM_AUTH),
-	DRM_IOCTL_DEF_DRV(I915_DESTROY_HEAP,  drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF_DRV(I915_SET_VBLANK_PIPE,  drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF_DRV(I915_GET_VBLANK_PIPE,  drm_noop, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(I915_DESTROY_HEAP, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
+	DRM_IOCTL_DEF_DRV(I915_SET_VBLANK_PIPE, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
+	DRM_IOCTL_DEF_DRV(I915_GET_VBLANK_PIPE, drm_noop, DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(I915_VBLANK_SWAP, drm_noop, DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(I915_HWS_ADDR, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_GEM_INIT, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 613decd47760..8775beab9cb8 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -191,8 +191,8 @@ void i915_teardown_sysfs(struct drm_i915_private *dev_priv)
 
 	i915_gpu_error_sysfs_teardown(dev_priv);
 
-	device_remove_bin_file(kdev,  &dpf_attrs_1);
-	device_remove_bin_file(kdev,  &dpf_attrs);
+	device_remove_bin_file(kdev, &dpf_attrs_1);
+	device_remove_bin_file(kdev, &dpf_attrs);
 
 	kobject_put(dev_priv->sysfs_gt);
 }
-- 
2.45.2

