Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158AA6BE328
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF7710EE69;
	Fri, 17 Mar 2023 08:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E0110EE69;
 Fri, 17 Mar 2023 08:23:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4CF09B824F6;
 Fri, 17 Mar 2023 08:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25F4C433A0;
 Fri, 17 Mar 2023 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041388;
 bh=23nfPFTFGcnwSPkN4r4O/42o/vE5oOp9nAtzXQO8XHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RpdmEiE76feDAyTFXYsYzLfMGp3/3Bj8DOZRK5hp0IEaAmZKtO5CZweQZbWcalcea
 DXcHpfnjLHQNdPeZ7v6Yxi24XYm0mu9pY9baz18ulAQhUlm04Yh0rM5cAr7WFdTsmt
 IGr6VShQL4BPe3nz0nt1+S00rUfMHcanhKQPrktRUH0onAct2R2vLjl8Yz7COSWz4d
 eZ71oqgrmWt9Lq6m3NVOmu1ThIBLZ3JzYBuCCsk2LiYMyRVErh1+lTSDgDWHEVRMVP
 s/0xIdTHoC7utoz2K5N1lz+4e+i4Zkf4o16T5LaMq1j7KWgb1JK1O5BYYJfz2iwIlU
 D7wnI8pKoRFFg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 20/37] drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move
 defines out to where they are actually used
Date: Fri, 17 Mar 2023 08:17:01 +0000
Message-Id: <20230317081718.2650744-21-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

  drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
  drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:143:22:
      warning: ‘SYNAPTICS_DEVICE_ID’ defined but not used [-Wunused-const-variable=]
  drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:140:22:
      warning: ‘DP_VGA_LVDS_CONVERTER_ID_3’ defined but not used [-Wunused-const-variable=]
  drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:138:22:
      warning: ‘DP_VGA_LVDS_CONVERTER_ID_2’ defined but not used [-Wunused-const-variable=]
  drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:133:22:
      warning: ‘DP_SINK_DEVICE_STR_ID_2’ defined but not used [-Wunused-const-variable=]
  drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22:
      warning: ‘DP_SINK_DEVICE_STR_ID_1’ defined but not used [-Wunused-const-variable=]

[snip 400 similar lines brevity]

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c   |  3 +++
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c       |  3 +++
 .../gpu/drm/amd/display/dc/link/link_detection.c    |  2 ++
 .../dc/link/protocols/link_edp_panel_control.c      |  5 +++++
 .../gpu/drm/amd/display/include/ddc_service_types.h | 13 -------------
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 9c1e91c2179eb..330ab036c830f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -44,6 +44,9 @@
 #include "dm_helpers.h"
 #include "ddc_service_types.h"
 
+/* MST Dock */
+static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
+
 /* dm_helpers_parse_edid_caps
  *
  * Parse edid caps
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 19440bdf63449..27b8f3435d86f 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -33,6 +33,9 @@
 
 #define MAX_PIPES 6
 
+static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
+static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
+
 /*
  * Convert dmcub psr state to dmcu psr state.
  */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 8cfeddfb65c89..9177b146a80a8 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -60,6 +60,8 @@
  */
 #define LINK_TRAINING_MAX_VERIFY_RETRY 2
 
+static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
+
 static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
 
 static enum ddc_transaction_type get_ddc_transaction_type(enum signal_type sink_signal)
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
index 93a6bbe954bb7..d895046787bc4 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
@@ -37,6 +37,11 @@
 #include "abm.h"
 #define DC_LOGGER_INIT(logger)
 
+/* Travis */
+static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
+/* Nutmeg */
+static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
+
 void dp_set_panel_mode(struct dc_link *link, enum dp_panel_mode panel_mode)
 {
 	union dpcd_edp_config edp_config_set;
diff --git a/drivers/gpu/drm/amd/display/include/ddc_service_types.h b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
index 31a12ce79a8e0..f843fc4978552 100644
--- a/drivers/gpu/drm/amd/display/include/ddc_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
@@ -129,17 +129,4 @@ struct av_sync_data {
 	uint8_t aud_del_ins3;/* DPCD 0002Dh */
 };
 
-static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
-static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
-
-static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
-
-/*Travis*/
-static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
-/*Nutmeg*/
-static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
-
-/*MST Dock*/
-static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
-
 #endif /* __DAL_DDC_SERVICE_TYPES_H__ */
-- 
2.40.0.rc1.284.g88254d51c5-goog

