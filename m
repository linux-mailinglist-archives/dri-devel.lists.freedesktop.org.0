Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCA04756C1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2297610E4AE;
	Wed, 15 Dec 2021 10:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB24110E3B2;
 Wed, 15 Dec 2021 10:43:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9548A1F39F;
 Wed, 15 Dec 2021 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639565002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FDqVSPkSNtf73K2JJ6NMa+8/dGi2I6+KE9pOJRdazUg=;
 b=TR0YtwcyVvJ1HeTIakXH9DYrOK+a0Vk+e90B8nM2AWFut3H6euV1Gzz/OiOHb5Xz69TDu1
 hNmeS1teUOKVAibDJxdg9moXwz3aoFsQaNuRf46dIvXDJZ65qSgfVqJ/IMyFSnPhLb1HXY
 BlOAyc7LZG+zz+ttSXfnqPeXK3Iv1m4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639565002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FDqVSPkSNtf73K2JJ6NMa+8/dGi2I6+KE9pOJRdazUg=;
 b=VkWhyLwlj0H9FtB8IGC0ebcxAFpC/fu5fu1rpW7isybO3M34WQ+vb6Sh217cjVA4SJPeKB
 5hKlVKhbgzbzFTAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4238813B1C;
 Wed, 15 Dec 2021 10:43:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8FUjD8rGuWH1eAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Dec 2021 10:43:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com
Subject: [PATCH v2 4/5] drm/dp: Move public DisplayPort headers into dp/
Date: Wed, 15 Dec 2021 11:43:16 +0100
Message-Id: <20211215104318.18866-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215104318.18866-1-tzimmermann@suse.de>
References: <20211215104318.18866-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move all public DisplayPort headers into dp and update users. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c              | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h                    | 4 ++--
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c                    | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c           | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h           | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 4 ++--
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c          | 2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c                 | 2 +-
 drivers/gpu/drm/amd/display/dc/os_types.h                   | 2 +-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h             | 2 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h             | 2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c          | 2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c          | 2 +-
 drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c         | 2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h          | 2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c                   | 2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c         | 2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h         | 2 +-
 drivers/gpu/drm/bridge/parade-ps8640.c                      | 2 +-
 drivers/gpu/drm/bridge/tc358767.c                           | 2 +-
 drivers/gpu/drm/bridge/tc358775.c                           | 2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                       | 2 +-
 drivers/gpu/drm/dp/drm_dp.c                                 | 4 ++--
 drivers/gpu/drm/dp/drm_dp_aux_dev.c                         | 4 ++--
 drivers/gpu/drm/dp/drm_dp_cec.c                             | 2 +-
 drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c                | 2 +-
 drivers/gpu/drm/dp/drm_dp_mst_topology.c                    | 2 +-
 drivers/gpu/drm/dp/drm_dp_mst_topology_internal.h           | 2 +-
 drivers/gpu/drm/drm_dp_aux_bus.c                            | 2 +-
 drivers/gpu/drm/drm_dsc.c                                   | 2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c                       | 2 +-
 drivers/gpu/drm/gma500/intel_bios.c                         | 2 +-
 drivers/gpu/drm/i915/display/intel_bios.c                   | 2 +-
 drivers/gpu/drm/i915/display/intel_display.c                | 2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h          | 4 ++--
 drivers/gpu/drm/i915/display/intel_dp.c                     | 2 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c                | 4 ++--
 drivers/gpu/drm/i915/display/intel_dp_link_training.h       | 2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c                 | 2 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                           | 2 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                             | 2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                         | 2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                            | 2 +-
 drivers/gpu/drm/msm/edp/edp.h                               | 2 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c                          | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c                     | 2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h                 | 2 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c                        | 2 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h                   | 4 ++--
 drivers/gpu/drm/panel/panel-edp.c                           | 2 +-
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c            | 2 +-
 drivers/gpu/drm/radeon/atombios_dp.c                        | 2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c                  | 2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c                      | 2 +-
 drivers/gpu/drm/radeon/radeon_mode.h                        | 4 ++--
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c             | 2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c                      | 2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h                      | 2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c                    | 2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c                     | 2 +-
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c          | 2 +-
 drivers/gpu/drm/tegra/dp.c                                  | 2 +-
 drivers/gpu/drm/tegra/dpaux.c                               | 2 +-
 drivers/gpu/drm/tegra/sor.c                                 | 2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                            | 2 +-
 include/drm/{ => dp}/drm_dp_dual_mode_helper.h              | 0
 include/drm/{ => dp}/drm_dp_helper.h                        | 0
 include/drm/{ => dp}/drm_dp_mst_helper.h                    | 2 +-
 include/drm/drm_dsc.h                                       | 2 +-
 69 files changed, 75 insertions(+), 75 deletions(-)
 rename include/drm/{ => dp}/drm_dp_dual_mode_helper.h (100%)
 rename include/drm/{ => dp}/drm_dp_helper.h (100%)
 rename include/drm/{ => dp}/drm_dp_mst_helper.h (99%)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 0de66f59adb8..19c4d9225197 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -26,7 +26,7 @@
 
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/amdgpu_drm.h>
 #include "amdgpu.h"
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 6043bf6fd414..902235fae4cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -33,7 +33,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -44,7 +44,7 @@
 #include <linux/hrtimer.h>
 #include "amdgpu_irq.h"
 
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include "modules/inc/mod_freesync.h"
 #include "amdgpu_dm_irq_params.h"
 
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
index f327becb022f..49a2f594fb2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
@@ -34,7 +34,7 @@
 #include "atombios_dp.h"
 #include "amdgpu_connectors.h"
 #include "amdgpu_atombios.h"
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 /* move these to drm_dp_helper.c/h */
 #define DP_LINK_CONFIGURATION_SIZE 9
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 116a280d8a20..046506ff0532 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -76,7 +76,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index bb65f41d1a59..bec1de86e2ef 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -29,7 +29,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/drm_plane.h>
 
 /*
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index cc34a35d0bcb..35c944a8e74d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -25,8 +25,8 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_dp_mst_helper.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include "dm_services.h"
 #include "amdgpu.h"
 #include "amdgpu_dm.h"
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c
index 7f25c11f4248..48a18766f002 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c
@@ -27,7 +27,7 @@
 #include <dc_link.h>
 #include <inc/link_hwss.h>
 #include <inc/link_dpcd.h>
-#include "drm/drm_dp_helper.h"
+#include <drm/dp/drm_dp_helper.h>
 #include <dc_dp_types.h>
 #include "dm_helpers.h"
 
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index 9c74564cbd8d..efc2339f1fa0 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -25,7 +25,7 @@
 #include <drm/drm_dsc.h>
 #include "dc_hw_types.h"
 #include "dsc.h"
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include "dc.h"
 #include "rc_calc.h"
 #include "fixed31_32.h"
diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index 5df1d80c8341..17d05071b809 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -36,7 +36,7 @@
 #include <asm/byteorder.h>
 
 #include <drm/drm_print.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 #include "cgs_common.h"
 
diff --git a/drivers/gpu/drm/amd/display/include/dpcd_defs.h b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
index ffd0df1701e6..270260e82b61 100644
--- a/drivers/gpu/drm/amd/display/include/dpcd_defs.h
+++ b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
@@ -26,7 +26,7 @@
 #ifndef __DAL_DPCD_DEFS_H__
 #define __DAL_DPCD_DEFS_H__
 
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #ifndef DP_SINK_HW_REVISION_START // can remove this once the define gets into linux drm_dp_helper.h
 #define DP_SINK_HW_REVISION_START 0x409
 #endif
diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
index 399fbca8947b..8502263d2968 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
@@ -30,7 +30,7 @@
 #include "hdcp_log.h"
 
 #include <drm/drm_hdcp.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 enum mod_hdcp_trans_input_result {
 	UNKNOWN = 0,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index e33cd077595a..94e56a2e91f2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -22,7 +22,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 5e6a0ed39199..2768b41c48e9 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -21,7 +21,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c b/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c
index fe40bab21530..e8297168bfef 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c
@@ -8,7 +8,7 @@
 #include <linux/regmap.h>
 
 #include <drm/drm.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_print.h>
 
 #include "analogix-i2c-dptx.h"
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index c051502d7fbf..32665203a6ae 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -10,7 +10,7 @@
 #define _ANALOGIX_DP_CORE_H
 
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 #define DP_TIMEOUT_LOOP_COUNT 100
 #define MAX_CR_LOOP 5
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 2346dbcc505f..8e7a10a0f2f0 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -24,7 +24,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 5530fbf64f1e..ac9e64169c6f 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -41,7 +41,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_hdcp.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index c74439d0b1a7..fc77f987c835 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -17,7 +17,7 @@
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 struct clk;
 struct device;
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 818704bf5e86..d6a1adbe57d4 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -15,7 +15,7 @@
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_dp_aux_bus.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 23a6f90b694b..c23e0abc65e8 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -27,7 +27,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 2c76331b251d..fcdd4874ff5a 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -22,7 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c9452eec968b..74fcaa0150fd 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -27,7 +27,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_dp_aux_bus.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
index e995a0262ed7..6d43325acca5 100644
--- a/drivers/gpu/drm/dp/drm_dp.c
+++ b/drivers/gpu/drm/dp/drm_dp.c
@@ -29,10 +29,10 @@
 #include <linux/sched.h>
 #include <linux/seq_file.h>
 
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/drm_panel.h>
 
 #include "drm_dp_helper_internal.h"
diff --git a/drivers/gpu/drm/dp/drm_dp_aux_dev.c b/drivers/gpu/drm/dp/drm_dp_aux_dev.c
index 0618dfe16660..53ad4e72790b 100644
--- a/drivers/gpu/drm/dp/drm_dp_aux_dev.c
+++ b/drivers/gpu/drm/dp/drm_dp_aux_dev.c
@@ -36,8 +36,8 @@
 #include <linux/uio.h>
 
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/drm_print.h>
 
 #include "drm_dp_helper_internal.h"
diff --git a/drivers/gpu/drm/dp/drm_dp_cec.c b/drivers/gpu/drm/dp/drm_dp_cec.c
index 3ab2609f9ec7..f9e927355879 100644
--- a/drivers/gpu/drm/dp/drm_dp_cec.c
+++ b/drivers/gpu/drm/dp/drm_dp_cec.c
@@ -13,7 +13,7 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 /*
  * Unfortunately it turns out that we have a chicken-and-egg situation
diff --git a/drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c
index 9faf49354cab..2049cb0f7ed0 100644
--- a/drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c
@@ -28,7 +28,7 @@
 #include <linux/string.h>
 
 #include <drm/drm_device.h>
-#include <drm/drm_dp_dual_mode_helper.h>
+#include <drm/dp/drm_dp_dual_mode_helper.h>
 #include <drm/drm_print.h>
 
 /**
diff --git a/drivers/gpu/drm/dp/drm_dp_mst_topology.c b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
index 9f7b0b606924..178f2646192e 100644
--- a/drivers/gpu/drm/dp/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
@@ -40,7 +40,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/dp/drm_dp_mst_topology_internal.h b/drivers/gpu/drm/dp/drm_dp_mst_topology_internal.h
index eeda9a61c657..401953b59d45 100644
--- a/drivers/gpu/drm/dp/drm_dp_mst_topology_internal.h
+++ b/drivers/gpu/drm/dp/drm_dp_mst_topology_internal.h
@@ -10,7 +10,7 @@
 #ifndef _DRM_DP_MST_HELPER_INTERNAL_H_
 #define _DRM_DP_MST_HELPER_INTERNAL_H_
 
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 
 void
 drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
diff --git a/drivers/gpu/drm/drm_dp_aux_bus.c b/drivers/gpu/drm/drm_dp_aux_bus.c
index 298ea7a49591..565edf6b1732 100644
--- a/drivers/gpu/drm/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/drm_dp_aux_bus.c
@@ -20,7 +20,7 @@
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_dp_aux_bus.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 /**
  * dp_aux_ep_match() - The match function for the dp_aux_bus.
diff --git a/drivers/gpu/drm/drm_dsc.c b/drivers/gpu/drm/drm_dsc.c
index 46a3c1b62463..fdd8d5f42622 100644
--- a/drivers/gpu/drm/drm_dsc.c
+++ b/drivers/gpu/drm/drm_dsc.c
@@ -12,7 +12,7 @@
 #include <linux/errno.h>
 #include <linux/byteorder/generic.h>
 #include <drm/drm_print.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_dsc.h>
 
 /**
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index ba6ad1466374..9e48da47dfa3 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -31,7 +31,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "gma_display.h"
diff --git a/drivers/gpu/drm/gma500/intel_bios.c b/drivers/gpu/drm/gma500/intel_bios.c
index d5ca5f241974..ea7c16f33a0e 100644
--- a/drivers/gpu/drm/gma500/intel_bios.c
+++ b/drivers/gpu/drm/gma500/intel_bios.c
@@ -6,7 +6,7 @@
  *    Eric Anholt <eric@anholt.net>
  */
 #include <drm/drm.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 #include "intel_bios.h"
 #include "psb_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 9d989c9f5da4..1ff1f1c426b2 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -25,7 +25,7 @@
  *
  */
 
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 #include "display/intel_display.h"
 #include "display/intel_display_types.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4eda1b88531b..23bf038f155c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -38,7 +38,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_damage_helper.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c9c6efadf8b4..da601336e486 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -34,8 +34,8 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_dual_mode_helper.h>
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_dual_mode_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/drm_dsc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b5e2508db1cf..36ab58c25b64 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -36,7 +36,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 540a669e01dd..82d024dafe7b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -6,8 +6,8 @@
  * Sean Paul <seanpaul@chromium.org>
  */
 
-#include <drm/drm_dp_helper.h>
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/drm_hdcp.h>
 #include <drm/drm_print.h>
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
index 6a3a7b37349a..dbfb15705aaa 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
@@ -6,7 +6,7 @@
 #ifndef __INTEL_DP_LINK_TRAINING_H__
 #define __INTEL_DP_LINK_TRAINING_H__
 
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 struct intel_crtc_state;
 struct intel_dp;
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index 05d2d750fa53..e879d36c31ad 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -24,7 +24,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_dp_dual_mode_helper.h>
+#include <drm/dp/drm_dp_dual_mode_helper.h>
 #include <drm/drm_edid.h>
 
 #include "intel_de.h"
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index d7e4a39a904e..4553f4985434 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -8,7 +8,7 @@
 
 #include <linux/of_platform.h>
 
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 
 #include "dp_catalog.h"
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 0728cc09c9ec..82afc8d5210f 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -7,7 +7,7 @@
 #define _DP_AUX_H_
 
 #include "dp_catalog.h"
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 int dp_aux_register(struct drm_dp_aux *dp_aux);
 void dp_aux_unregister(struct drm_dp_aux *dp_aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 6ae9b29044b6..8a6d3ead3440 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -10,7 +10,7 @@
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 #include <linux/rational.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_print.h>
 
 #include "dp_catalog.h"
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 62e75dc8afc6..ecf20458c75e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -12,7 +12,7 @@
 #include <linux/phy/phy-dp.h>
 #include <linux/pm_opp.h>
 #include <drm/drm_fixed.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_print.h>
 
 #include "dp_reg.h"
diff --git a/drivers/gpu/drm/msm/edp/edp.h b/drivers/gpu/drm/msm/edp/edp.h
index 8590f2ce274d..3000477c3d9b 100644
--- a/drivers/gpu/drm/msm/edp/edp.h
+++ b/drivers/gpu/drm/msm/edp/edp.h
@@ -12,7 +12,7 @@
 #include <linux/platform_device.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 #include "msm_drv.h"
 
diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
index a68a4a1867c1..f4a950bb5226 100644
--- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
+++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
@@ -7,7 +7,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 
 #include "edp.h"
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index ae1f41205520..df58c6445c51 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -35,7 +35,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_plane_helper.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 40f90e353540..1b173191cc41 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -36,7 +36,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_util.h>
 
 #include "nouveau_crtc.h"
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 040ed88d362d..4348a4296971 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -22,7 +22,7 @@
  * Authors: Ben Skeggs
  */
 
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_connector.h"
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 77c2fed76e8b..65ed84f88cca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -30,8 +30,8 @@
 #include <subdev/bios/dcb.h>
 
 #include <drm/drm_encoder_slave.h>
-#include <drm/drm_dp_helper.h>
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include "dispnv04/disp.h"
 struct nv50_head_atom;
 struct nouveau_connector;
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 176ef0c3cc1d..6a6ca891ee2e 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -37,7 +37,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_dp_aux_bus.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 
 /**
diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 221db6512859..bffeadaaf9a2 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -15,7 +15,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_dp_aux_bus.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
 
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index 4c1e551d9714..4798cf23d251 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -30,7 +30,7 @@
 
 #include "atom.h"
 #include "atom-bits.h"
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 /* move these to drm_dp_helper.c/h */
 #define DP_LINK_CONFIGURATION_SIZE 9
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 607ad5620bd9..82d37a85bfc8 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -27,7 +27,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/radeon_drm.h>
 #include "radeon.h"
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 751c2c075e09..9f26baf7adb0 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index fe16f140a6b4..5288dc7a4897 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -33,8 +33,8 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
-#include <drm/drm_dp_helper.h>
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_crtc_helper.h>
 #include <linux/i2c.h>
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 8abb5ac26807..c61d37f02af7 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -22,7 +22,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/bridge/analogix_dp.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 16497c31d9f9..4740cc14beb8 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -16,7 +16,7 @@
 #include <sound/hdmi-codec.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index 81ac9b658a70..0d044146f4e9 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -7,7 +7,7 @@
 #ifndef _CDN_DP_CORE_H
 #define _CDN_DP_CORE_H
 
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index be74c87a8be4..0b972418067e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -20,7 +20,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 09be9678f2bd..2494b079489d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -11,7 +11,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
index 6b4759ed6bfd..fdcdceca3bdf 100644
--- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
@@ -7,7 +7,7 @@
 
 #include <linux/random.h>
 
-#include <drm/drm_dp_mst_helper.h>
+#include <drm/dp/drm_dp_mst_helper.h>
 #include <drm/drm_print.h>
 
 #include "../drm_dp_mst_topology_internal.h"
diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 70dfb7d1dec5..e4369e5b2943 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -5,7 +5,7 @@
  */
 
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_print.h>
 
 #include "dp.h"
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 1f96e416fa08..8ca500977a46 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -18,7 +18,7 @@
 #include <linux/reset.h>
 #include <linux/workqueue.h>
 
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 
 #include "dp.h"
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 0ea320c1092b..b125572feb84 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -18,7 +18,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_scdc_helper.h>
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 6f588dc09ba6..b1bbbb1d0a54 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -13,7 +13,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_managed.h>
diff --git a/include/drm/drm_dp_dual_mode_helper.h b/include/drm/dp/drm_dp_dual_mode_helper.h
similarity index 100%
rename from include/drm/drm_dp_dual_mode_helper.h
rename to include/drm/dp/drm_dp_dual_mode_helper.h
diff --git a/include/drm/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
similarity index 100%
rename from include/drm/drm_dp_helper.h
rename to include/drm/dp/drm_dp_helper.h
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/dp/drm_dp_mst_helper.h
similarity index 99%
rename from include/drm/drm_dp_mst_helper.h
rename to include/drm/dp/drm_dp_mst_helper.h
index 78044ac5b59b..08276eb8c187 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/dp/drm_dp_mst_helper.h
@@ -23,7 +23,7 @@
 #define _DRM_DP_MST_HELPER_H_
 
 #include <linux/types.h>
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_atomic.h>
 
 #if IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS)
diff --git a/include/drm/drm_dsc.h b/include/drm/drm_dsc.h
index cf43561e60fa..ca022e960dcc 100644
--- a/include/drm/drm_dsc.h
+++ b/include/drm/drm_dsc.h
@@ -8,7 +8,7 @@
 #ifndef DRM_DSC_H_
 #define DRM_DSC_H_
 
-#include <drm/drm_dp_helper.h>
+#include <drm/dp/drm_dp_helper.h>
 
 /* VESA Display Stream Compression DSC 1.2 constants */
 #define DSC_NUM_BUF_RANGES			15
-- 
2.34.1

