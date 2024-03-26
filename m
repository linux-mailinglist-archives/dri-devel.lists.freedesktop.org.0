Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D49A88C654
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E048610F03A;
	Tue, 26 Mar 2024 15:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ed4hVGyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAA810EB82;
 Tue, 26 Mar 2024 15:06:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 85E3C61283;
 Tue, 26 Mar 2024 15:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CD6C43330;
 Tue, 26 Mar 2024 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711465604;
 bh=oEL9QHuRjaF8oclNwKr4lsV4jXuopDx5ZyED4A8zK+M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ed4hVGyYIVwp8s6P9scRKIQ9872S3tS11Qx/SLDBDxDxtCwjjyfllHk49gSHQpFzW
 UTztQuJwXtUdtOYTjvq9yr6aOt0hUJ08sMJrZ+ng8PhF9tHi+dGaJL7tpuNtoJtzU2
 uSi+YYk90nLYMK2dL8CHd0ZoXQb+L1IlXGZzY3EW4uLIIADdMcNsVUeNWPvk8iMJVc
 IIziTPM/A6cbCdL1DhlOtQpx1sB1kM5p3UU7ag3BuuWiFvWuidaeM7ZaPOf2S2hP4C
 KW72wfQaMBihMrgm66Zt0UASNxMyG8cS9eDdxK5Vwy80l8rP+bF9GclI3JSrtzpRoW
 WV9KHl7OSkyVQ==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 26 Mar 2024 08:11:30 -0700
Subject: [PATCH 2/6] drm/msm/dp: Removed fixed nvid "support"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-msm-dp-cleanup-v1-2-e775556ecec0@quicinc.com>
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3667;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=qycwTDe39/z7P5q+0zY5dlx4BRy8hlXGCuCcnrwdKSM=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmAuWinRfj+eExKLVCRJV0/h3saaFlb4+B6/tpz
 2wwKt06kLGJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZgLlohUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUtjRAArx5w2fq0qfDxaDJMXvcm8nhp3W0WeW47zEeLl6v
 Lf4ftSWe81XS8YIV2fSPYv3C0Ks9kAlgvJp4fLcdmBUB0O/D4C5j5WHSLlNPm4j8Hee5DMf5NN8
 s6ac5C21RzRU1eeMKhasyTOYfXRHZGrChsCbK8v2oVtBJSj5/gMVQ9TZjC8QYnOFFdxr1+Ob8G7
 b7V3v3KmGRG0Z5bdk2uz2FnLzEtBXyGnIfHWbJZ5aYJ71zycMO3dtYtQ6QVR6V44a8r34oib344
 IlrRPn97ym0xoVeH82Crgv042z8pdVeOfJmowehorKrJbq0Pt+RMAEMN3l6B4fQpRReRwXmsoSX
 by+XbtsEl0UJ5RM1I7V1ImWTuGXvxf2sc+rbnZkLl35xw3k/eUGMvHehhS+nxIRqg390Cc7bbJS
 uzR33PWtrnn+vY1x6TrhgV/nFQMn+kN9Gt8cjtF7auGSU+RYmK2ln4T5hfv4UUnnQGO75lUmdlo
 FmMmVhHQxCUUS1H7ZElm17m5oUKkFoR8ApbbeDRObfKI/XG+1Z3W2ub96T9av8jl+ri2U3ZSvRT
 EpB347YxCEgFMIj0g+k9m4Jch0+gr1NO81RAf5gJ2qvp3yFVzZT8ILOre0IbHzQSVi0lpoptrYe
 xFPedah0j0p8LArgKmKbxYfoEm2ObRDRZYuL3AzV7pec=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
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

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The "desc" member of struct dp_panel is zero-initialized during
allocation and never assigned, resulting in dp_ctrl_use_fixed_nvid()
never returning true. This returned boolean value is passed around but
never acted upon.

Perform constant propagation and remove the traces of "fixed nvid".

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 17 +----------------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
 4 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 3e7c84cdef47..8c72d532d96b 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -469,7 +469,7 @@ void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog)
 
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 					u32 rate, u32 stream_rate_khz,
-					bool fixed_nvid, bool is_ycbcr_420)
+					bool is_ycbcr_420)
 {
 	u32 pixel_m, pixel_n;
 	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 75ec290127c7..b85ad6bdb2e7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -99,7 +99,7 @@ void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool ena
 void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
-				u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
+				u32 stream_rate_khz, bool is_ycbcr_420);
 int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog, u32 pattern);
 u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c4dda1faef67..e65a460fb52d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1566,21 +1566,6 @@ void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
 			phy, phy->init_count, phy->power_count);
 }
 
-static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
-{
-	const u8 *dpcd = ctrl->panel->dpcd;
-
-	/*
-	 * For better interop experience, used a fixed NVID=0x8000
-	 * whenever connected to a VGA dongle downstream.
-	 */
-	if (drm_dp_is_branch(dpcd))
-		return (drm_dp_has_quirk(&ctrl->panel->desc,
-					 DP_DPCD_QUIRK_CONSTANT_N));
-
-	return false;
-}
-
 static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
 	struct phy *phy = ctrl->phy;
@@ -2022,7 +2007,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 
 	dp_catalog_ctrl_config_msa(ctrl->catalog,
 		ctrl->link->link_params.rate,
-		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl),
+		pixel_rate_orig,
 		ctrl->panel->dp_mode.out_fmt_is_yuv_420);
 
 	dp_ctrl_setup_tr_unit(ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index e843f5062d1f..9afd99e00b0c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -40,7 +40,6 @@ struct dp_panel {
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
 	struct dp_link_info link_info;
-	struct drm_dp_desc desc;
 	struct edid *edid;
 	struct drm_connector *connector;
 	struct dp_display_mode dp_mode;

-- 
2.43.0

