Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1634BF906
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42E510E643;
	Tue, 22 Feb 2022 13:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC86410E644
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:18:45 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 p12-20020a05683019cc00b005af1442c9e9so5735445otp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 05:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m7m0+PF7saTzmzCja9hykhB/MRHQ+aIAgZTpGlXhHzw=;
 b=ubi5Nm/hc13TZrLP09ZiZRLp3a2ho4dHP2ehi7CFHPZ2s6iZ0e3mlYsRva1Lo79rof
 meuN9eLCrtEoUc2bmNz8XfqhPigO2am6hz09EKWPa5tYM4mkQjkHmB4qmkgP6wysKRSp
 MYcDxon4lPSJgg20sSlxVY/SDgzPwLvjUDgt3YmbkhU8/u3rhab/RurOUlKHmgC50WKg
 FVi5Zyc72Oxho4L2Rqgl1V2Q8nWaSRqR7Yqu9aZdVQcu8hvak1SgPfdx1yxVpsGKtzJM
 UXec4VOo7nf+J0oBnWsFRjoIEKP2D37OAkq6NiDruGUON4PMb3jdr1chSd9Z5zSf6E0k
 u7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m7m0+PF7saTzmzCja9hykhB/MRHQ+aIAgZTpGlXhHzw=;
 b=tK3K35HJ2UUwMdSxbza08UAY0EJv7+qjP/fsPDtoEYg7DL3NCMzyAYYnTg6gsBprfm
 xNNuecXB9R95f+9QIWZJUmRavOecqyyuOlzINIcW6UXm3FZ95aH2A8GcxMyl1TaoyoGo
 MedaDJtqHZtnKlenE1P7afh0Pj0y5dyjrM7zWrXKnSkSEIqz9PxlrVeb0iDhByn6nG1G
 NSN+E+d3QhO2EPeiZVQnXIGwb/Y27VtXqD2ISmx5+5zeaN55qds/yOBZLlUB2JngpTlz
 n4NnOvI6dHyfimiFO97ZfoxeSlLsIrvP9YyLo44odFFNe2354rfA3ZM+TU6YVdKuYdG5
 YDGA==
X-Gm-Message-State: AOAM530GSN8JaOobg3oyOsb4m9M0+ql+pEGkLeYBr/TtxgRkb4r8gBlf
 AWZvuu9vS0Qobsyi3HS3trHuqA==
X-Google-Smtp-Source: ABdhPJwXb2Ih6ABCM4wFKq+J7EONDr5AujGDHaz2bmBm8K1zfSsUX01jAP2smZyZy7rVzqADpM/0Dg==
X-Received: by 2002:a05:6830:40c6:b0:5a0:4cee:1e7d with SMTP id
 h6-20020a05683040c600b005a04cee1e7dmr8308902otu.121.1645535925058; 
 Tue, 22 Feb 2022 05:18:45 -0800 (PST)
Received: from fedora.. ([187.36.236.204])
 by smtp.gmail.com with ESMTPSA id c9sm6325050otd.26.2022.02.22.05.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 05:18:44 -0800 (PST)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 Hawking.Zhang@amd.com, john.clements@amd.com, tao.zhou1@amd.com,
 YiPeng.Chai@amd.com, luben.tuikov@amd.com, Stanley.Yang@amd.com,
 Dennis.Li@amd.com, mukul.joshi@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, Anthony.Koo@amd.com
Subject: [PATCH 10/10] drm/amd/display: Turn global functions into static
 functions
Date: Tue, 22 Feb 2022 10:17:01 -0300
Message-Id: <20220222131701.356117-11-maira.canal@usp.br>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131701.356117-1-maira.canal@usp.br>
References: <20220222131701.356117-1-maira.canal@usp.br>
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
Cc: magalilemes00@gmail.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Turn previously global functions into static functions to avoid
-Wmissing-prototype warnings, such as:

drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn30/irq_service_dcn30.c:50:20:
warning: no previous prototype for function 'to_dal_irq_source_dcn30'
[-Wmissing-prototypes]
enum dc_irq_source to_dal_irq_source_dcn30(
                   ^
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn30/irq_service_dcn30.c:50:1:
note: declare 'static' if the function is not intended to be used outside
of this translation unit
enum dc_irq_source to_dal_irq_source_dcn30(
^
static
1 warning generated.

drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c:488:6:
warning: no previous prototype for function
'dcn316_clk_mgr_helper_populate_bw_params' [-Wmissing-prototypes]
void dcn316_clk_mgr_helper_populate_bw_params(
     ^
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c:488:1:
note: declare 'static' if the function is not intended to be used outside
of this translation unit
void dcn316_clk_mgr_helper_populate_bw_params(
^
static
1 warning generated.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c             | 4 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   | 2 +-
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c  | 3 ++-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c             | 2 +-
 drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c  | 2 +-
 drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c  | 2 +-
 8 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c9ca328d34e3..a99b92526b55 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6362,7 +6362,7 @@ static bool is_freesync_video_mode(const struct drm_display_mode *mode,
 		return true;
 }
 
-struct dc_stream_state *
+static struct dc_stream_state *
 create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 		       const struct drm_display_mode *drm_mode,
 		       const struct dm_connector_state *dm_state,
@@ -10189,7 +10189,7 @@ static void set_freesync_fixed_config(struct dm_crtc_state *dm_new_crtc_state) {
 	dm_new_crtc_state->freesync_config.fixed_refresh_in_uhz = res;
 }
 
-int dm_update_crtc_state(struct amdgpu_display_manager *dm,
+static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 			 struct drm_atomic_state *state,
 			 struct drm_crtc *crtc,
 			 struct drm_crtc_state *old_crtc_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 389b0cb37995..05573f073b21 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -213,7 +213,7 @@ static bool validate_dsc_caps_on_connector(struct amdgpu_dm_connector *aconnecto
 	return true;
 }
 
-bool retrieve_downstream_port_device(struct amdgpu_dm_connector *aconnector)
+static bool retrieve_downstream_port_device(struct amdgpu_dm_connector *aconnector)
 {
 	union dp_downstream_port_present ds_port_present;
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
index 06bab24d8e27..450eaead4f20 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
@@ -101,7 +101,8 @@ static uint32_t rv1_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsi
 	return res_val;
 }
 
-int rv1_vbios_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr, unsigned int msg_id, unsigned int param)
+static int rv1_vbios_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
+		unsigned int msg_id, unsigned int param)
 {
 	uint32_t result;
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
index ffd3d5cb9871..02a59adff90d 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
@@ -485,7 +485,7 @@ static unsigned int find_clk_for_voltage(
 	return clock;
 }
 
-void dcn316_clk_mgr_helper_populate_bw_params(
+static void dcn316_clk_mgr_helper_populate_bw_params(
 		struct clk_mgr_internal *clk_mgr,
 		struct integrated_info *bios_info,
 		const DpmClocks_316_t *clock_table)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
index fd6497fd2dc5..128614dff108 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
@@ -111,7 +111,7 @@ static uint32_t dcn316_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, u
 	return res_val;
 }
 
-int dcn316_smu_send_msg_with_param(
+static int dcn316_smu_send_msg_with_param(
 		struct clk_mgr_internal *clk_mgr,
 		unsigned int msg_id, unsigned int param)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 19b56f9acf84..29ab67f42d92 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1622,7 +1622,7 @@ bool dc_add_all_planes_for_stream(
 	return add_all_planes_for_stream(dc, stream, &set, 1, context);
 }
 
-bool is_timing_changed(struct dc_stream_state *cur_stream,
+static bool is_timing_changed(struct dc_stream_state *cur_stream,
 		       struct dc_stream_state *new_stream)
 {
 	if (cur_stream == NULL)
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c b/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
index c4b067d01895..93c31111500b 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
@@ -40,7 +40,7 @@
 
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
 
-enum dc_irq_source to_dal_irq_source_dcn20(
+static enum dc_irq_source to_dal_irq_source_dcn20(
 		struct irq_service *irq_service,
 		uint32_t src_id,
 		uint32_t ext_id)
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
index 0b68c08fac3f..ac0c6a62d17b 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
@@ -47,7 +47,7 @@
 
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
 
-enum dc_irq_source to_dal_irq_source_dcn30(
+static enum dc_irq_source to_dal_irq_source_dcn30(
 		struct irq_service *irq_service,
 		uint32_t src_id,
 		uint32_t ext_id)
-- 
2.35.1

