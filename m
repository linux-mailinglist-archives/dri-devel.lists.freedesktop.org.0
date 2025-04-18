Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0B3A92EBD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 02:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBC210E3E0;
	Fri, 18 Apr 2025 00:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="V+mlFev/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5E410E3DC;
 Fri, 18 Apr 2025 00:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=JWaJuUILM6oT7h2bYPl+DblVz8tBnX1vWlKCjgjjAiI=; b=V+mlFev/tQR08iOt
 l4CHM4vKVEMrkXqOh2LgHoGlWXhrsa9FG8dwd8w50J8XFH+v8EecLBppSTSdX3UNf8Cp0tEK6yf0e
 1j/3UsGTJQ1A04qYIHloInUmqAP2npzINkVUf815D+dTxtf5coLSoo1FnmBNBeR+LjUbnLzYh/3l5
 Ls51VlQ/FHZh/7hUApoiXS9pnbekLxXzuaRMkKbSbqavvtC4DJ1906AWpN/pJgsTOnCB8sYNPWWJu
 leSkJsX6a/dxNn9yszezGavztYO6LfLwY7Mp2ZhLtzI2NMp0SUQ0uKZwskcCOzTHrvBg1ZS+STVxS
 T+1Kk2T381FUQM68tA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1u5ZTs-00CPl8-20;
 Fri, 18 Apr 2025 00:21:20 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/4] drm/amd/display: Remove unused *vbios_smu_set_dprefclk
Date: Fri, 18 Apr 2025 01:21:17 +0100
Message-ID: <20250418002117.130612-5-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418002117.130612-1-linux@treblig.org>
References: <20250418002117.130612-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

rn_vbios_smu_set_dprefclk() was added in 2019 by
commit 4edb6fc91878 ("drm/amd/display: Add Renoir clock manager")
rv1_vbios_smu_set_dprefclk() was also added in 2019 by
commit dc88b4a684d2 ("drm/amd/display: make clk mgr soc specific")

neither have been used.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       | 14 --------------
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h       |  1 -
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        | 14 --------------
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h        |  1 -
 4 files changed, 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
index 19897fa52e7e..d82a52319088 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
@@ -142,17 +142,3 @@ int rv1_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_di
 
 	return actual_dispclk_set_mhz * 1000;
 }
-
-int rv1_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
-{
-	int actual_dprefclk_set_mhz = -1;
-
-	actual_dprefclk_set_mhz = rv1_vbios_smu_send_msg_with_param(
-			clk_mgr,
-			VBIOSSMC_MSG_SetDprefclkFreq,
-			khz_to_mhz_ceil(clk_mgr->base.dprefclk_khz));
-
-	/* TODO: add code for programing DP DTO, currently this is down by command table */
-
-	return actual_dprefclk_set_mhz * 1000;
-}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h
index 083cb3158859..81d7c912549c 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h
@@ -27,6 +27,5 @@
 #define DAL_DC_DCN10_RV1_CLK_MGR_VBIOS_SMU_H_
 
 int rv1_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz);
-int rv1_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
 
 #endif /* DAL_DC_DCN10_RV1_CLK_MGR_VBIOS_SMU_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
index 23b390245b5d..5a633333dbb5 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
@@ -164,20 +164,6 @@ int rn_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dis
 	return actual_dispclk_set_mhz * 1000;
 }
 
-int rn_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
-{
-	int actual_dprefclk_set_mhz = -1;
-
-	actual_dprefclk_set_mhz = rn_vbios_smu_send_msg_with_param(
-			clk_mgr,
-			VBIOSSMC_MSG_SetDprefclkFreq,
-			khz_to_mhz_ceil(clk_mgr->base.dprefclk_khz));
-
-	/* TODO: add code for programing DP DTO, currently this is down by command table */
-
-	return actual_dprefclk_set_mhz * 1000;
-}
-
 int rn_vbios_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz)
 {
 	int actual_dcfclk_set_mhz = -1;
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
index 1ce19d875358..f76fad87f0e1 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
@@ -30,7 +30,6 @@ enum dcn_pwr_state;
 
 int rn_vbios_smu_get_smu_version(struct clk_mgr_internal *clk_mgr);
 int rn_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz);
-int rn_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
 int rn_vbios_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz);
 int rn_vbios_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz);
 void rn_vbios_smu_set_phyclk(struct clk_mgr_internal *clk_mgr, int requested_phyclk_khz);
-- 
2.49.0

