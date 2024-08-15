Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2029539CD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 20:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAC410E4E2;
	Thu, 15 Aug 2024 18:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MI7CcUYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2352F10E4E2;
 Thu, 15 Aug 2024 18:18:37 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7b8884631c4so576905a12.2; 
 Thu, 15 Aug 2024 11:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723745916; x=1724350716; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FnL/caHC6IiZNXlhX4kwijSLCsO2WfzCGQwXH3dcl5Y=;
 b=MI7CcUYquNmwgVCC8DxCFEVCj+fSUDuiFU7QwdzHsCOjwBhIvpp6jrtUBgSNWZe44q
 tB+QoPw8lRpUl0Jz0r2IKzcrthUtPsSDDUWL6cd9LT1i4QUfJvXnEs6mN4hIkvasLzG9
 mM+Nk6G6444LNhd3mpWSy0ktzO5s4OPGsBQi21ekQBICwxykVS/LHcP3cVgA6eLVi3EP
 kadAT/9IGbdmLYUXaj4YXcOtYQruQPwwXlP1krPse/TaJWIX5TA0ZTVoJQEJy8oDSxys
 Tg3ns2t7TjCQsAb/WjE5xLLbqZYivA0VZzB7gR4jwpzUpQQT+iCyg45LFcYAK2B5AJSB
 SsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723745916; x=1724350716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FnL/caHC6IiZNXlhX4kwijSLCsO2WfzCGQwXH3dcl5Y=;
 b=suQC5kH/l/qUACcCuSC5bP1NV5ZG+bgaJKGktJJKJp9naw6lq7VauAlYMYiMaALnti
 OU9x/6zH+QbMEM5WIWC6UR5KEXalI27IviPwQzPxNrHidzNSrutDqKezmNX/WK1G8oYy
 neOdDuexDM+m49PP3UiBROYplhw8Eo/2Z6KhuKEkr57ZWmuhe+KrBM62w79MEYGkpQCV
 xcy+NzwYtSvoznG60r8qzQce6LOobKZzQRLEiBGFcOASOMDY5Pdr9QA+hu4raIXRkMPf
 unsCoiF0fe0ZjPqLvvdiiKt1Ar5aQjsUuAWy5UuqzWZhEoszcBw68KkpF6Kj626jYphB
 s7/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8e/DKymJlotrbab2SLx/h3NPlbSCsqXpoos1eWUJL/LqLw11xZGOEsWVSNxhlO+B4al66c8Zc7C2ssl0hatMbjnOyv5ystQbijzw20mBDWAi7J1GTtC4qD/fjFbW8i4/LxNO7SVvZRepGFlujVg==
X-Gm-Message-State: AOJu0YxbUtY1u/6jtzibhevyCsj1WyO9dQTfWCM80ExiGv2cUlh1j2V4
 0gPHVA7pKAl876bjimMIgQ0xhooHcoeIj2D5agUdAX4Q+bVh0ecnoLMU4H05
X-Google-Smtp-Source: AGHT+IHaWEF1sYe8fMDJJTy289IrVf+ene0AoBSSVJSdnZ0unYrhGoYRiXtaEVTlDXcbZZOme7pISg==
X-Received: by 2002:a17:90a:ea07:b0:2d3:b976:e30e with SMTP id
 98e67ed59e1d1-2d3e00f091emr563041a91.37.1723745916391; 
 Thu, 15 Aug 2024 11:18:36 -0700 (PDT)
Received: from ubuntu.. ([27.34.65.188]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3e3c89b8fsm77093a91.35.2024.08.15.11.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 11:18:36 -0700 (PDT)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, harry.wentland@amd.com,
 sunpeng.li@amd.com, airlied@linux.ie, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Fix warning: Using plain integer as NULL pointer in
 dml2_pmo_dcn4.c
Date: Thu, 15 Aug 2024 18:18:25 +0000
Message-ID: <20240815181827.65159-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.43.0
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

sparse reportef following warnings:

'''
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:614:53: warning: Using plain integer as NULL pointer
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:615:58: warning: Using plain integer as NULL pointer
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:617:53: warning: Using plain integer as NULL pointer
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:727:52: warning: Using plain integer as NULL pointer
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:728:52: warning: Using plain integer as NULL pointer
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:729:57: warning: Using plain integer as NULL pointer
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:788:52: warning: Using plain integer as NULL pointer
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:789:55: warning: Using plain integer as NULL pointer
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:790:57: warning: Using plain integer as NULL pointer
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c:958:67: warning: Using plain integer as NULL pointer
'''

This patch changes zero to NULL.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c   | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
index 8952dd7e36cb..6d524e528491 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
@@ -611,10 +611,10 @@ static bool subvp_subvp_schedulable(struct dml2_pmo_instance *pmo, const struct
 	int max_microschedule_us = 0;
 	int vactive1_us, vactive2_us, vblank1_us, vblank2_us;
 
-	const struct dml2_timing_cfg *svp_timing1 = 0;
-	const struct dml2_implicit_svp_meta *svp_meta1 = 0;
+	const struct dml2_timing_cfg *svp_timing1 = NULL;
+	const struct dml2_implicit_svp_meta *svp_meta1 = NULL;
 
-	const struct dml2_timing_cfg *svp_timing2 = 0;
+	const struct dml2_timing_cfg *svp_timing2 = NULL;
 
 	if (svp_stream_count <= 1)
 		return true;
@@ -724,9 +724,9 @@ static bool validate_svp_drr_cofunctionality(struct dml2_pmo_instance *pmo,
 	int drr_stretched_vblank_us = 0;
 	int max_vblank_mallregion = 0;
 
-	const struct dml2_timing_cfg *svp_timing = 0;
-	const struct dml2_timing_cfg *drr_timing = 0;
-	const struct dml2_implicit_svp_meta *svp_meta = 0;
+	const struct dml2_timing_cfg *svp_timing = NULL;
+	const struct dml2_timing_cfg *drr_timing = NULL;
+	const struct dml2_implicit_svp_meta *svp_meta = NULL;
 
 	bool schedulable = false;
 
@@ -785,9 +785,9 @@ static bool validate_svp_vblank_cofunctionality(struct dml2_pmo_instance *pmo,
 	int vblank_stream_count = 0;
 	int svp_stream_count = 0;
 
-	const struct dml2_timing_cfg *svp_timing = 0;
-	const struct dml2_timing_cfg *vblank_timing = 0;
-	const struct dml2_implicit_svp_meta *svp_meta = 0;
+	const struct dml2_timing_cfg *svp_timing = NULL;
+	const struct dml2_timing_cfg *vblank_timing = NULL;
+	const struct dml2_implicit_svp_meta *svp_meta = NULL;
 
 	int prefetch_us = 0;
 	int mall_region_us = 0;
@@ -955,7 +955,7 @@ bool pmo_dcn4_init_for_pstate_support(struct dml2_pmo_init_for_pstate_support_in
 
 	struct display_configuation_with_meta *display_config;
 	const struct dml2_plane_parameters *plane_descriptor;
-	const enum dml2_pmo_pstate_strategy (*strategy_list)[4] = 0;
+	const enum dml2_pmo_pstate_strategy (*strategy_list)[4] = NULL;
 	unsigned int strategy_list_size = 0;
 	unsigned int plane_index, stream_index, i;
 
-- 
2.43.0

