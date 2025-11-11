Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1975EC4F379
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 18:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B0910E621;
	Tue, 11 Nov 2025 17:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HphOeyGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99CB10E06B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 11:37:33 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-343774bd9b4so2450904a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 03:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762861053; x=1763465853; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UKj1IvLy5c2i5aotV94CJILL6XNH/z+FL6hHNrbGtSM=;
 b=HphOeyGLq/e9gsmBDUrQnxSbbmL13YZpqa9QyUgOgRVhRL/CUcYIEJrIjqRErw7v9E
 7RiNuWMgNuGXFvC80oHydU6kN0wvGeOk8m6lmLzb492dEL1LGhyDV+lHtfSpblX+xUeP
 zliD+YQFGZ2OwW2xDkiPQcJr9DG/kDyQem0HdDt3VKnI1ieedmOYPZJiXPXNSgkFXLBE
 lQa29Dppr2aqNp2ORnM6Kn9dr1NdAZjKSJTX5YZQWIgf1LGyH8R22eVajYXyUt9Yd1eT
 z1hvSrlvznQ516ZJQYkpJVE36dsnaxEmNpV5fKe1f3rAiQ5MUvIxb6rBXhTZMl9jSPCj
 29pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762861053; x=1763465853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKj1IvLy5c2i5aotV94CJILL6XNH/z+FL6hHNrbGtSM=;
 b=lzmmB/slt9IBlU9vB55c1/Kar8/zVoIBSxnsA0vUa/o9gtzNOXzax0EaW6/KjzFqe3
 Yky5mhcjDwvx57MwlAEadfRTEERrE0VkDo2akxSV79e2sbhb3JHlVKe4MvHLSURSAxtR
 +4aF8GlSlCW5Uwe7pJW2/tY/JktwXkGOc2v8Yd9lbhdNzwOfFbKEa2P+2we4i9e7l5tt
 CE9nkAva2tcdD7gEkNDymAumVepfCKu5EuUZfWjHc9L9qXw6LHesJ5NpQ30e4bEmpe+r
 RK98xaD8CuM1IAuzvcesGTvTkYOwh7iWAlUtyFtTgCiS1icJWBDn5jeS/iMzEZ10Ei5u
 aLGg==
X-Gm-Message-State: AOJu0YyJYlISUVxOJAV/zpBWtgak/2hwexELUyzPv6EPyRn3IrdgNCjn
 1LmkVwu3D6cTdX4Ge+THXLp+h4+koDr5zSzI8aMPNX5KwbzwhBdZ8J7I
X-Gm-Gg: ASbGncutXlpAe/qSaeJAALsutr8rJQEaEF1TbflQZDe6RNrZ6qL8bfRI0WAA5p20zGt
 NMRWVFTkLvhO1sfcYB1zaiX97Tas2nYbLhwPx08PxuLWLIWOFRgkbcfjndwa54LDPS7tkGq/Fmm
 VIBcrLSmA8D0hQKEiUBaoxpMs7p1DeUmvR041IFFmx3OblQ69sWf0C369j+qsXl6l5wpLUSfULo
 ZSdnSUlxTI6oXKyFuLFRnAKaKX1BWKkwnYk6RC1RGaqwHxdlg1YGRuURiJyatK2M3jebvX0wZ8j
 YiolzzxbORzFHlu3e6wBulu1HlBOz2bNBHvFvsMuAXVgyps7CetBOo9k+tSanCPjOYL5zkpkgnQ
 GqtfPOWs4Vt6mMLxIwxHE1ysCPFm33zlqKq/y5zQfKF69tPLWtRE1h5dCvbG5hhtvwPTRnKCIPg
 F7B2OSjLA3Q3ixPTV5BbttkU0Q9Sta
X-Google-Smtp-Source: AGHT+IGjxi0V+gnnbb+bhG8XDgM5LZDOYM3GDNlnKgiYoSvZUnLKPh+1D38yKt7FiZfh6R6R+84haQ==
X-Received: by 2002:a17:90b:2fcd:b0:32e:64ca:e84e with SMTP id
 98e67ed59e1d1-3436cb227c9mr13365843a91.15.1762861053348; 
 Tue, 11 Nov 2025 03:37:33 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba902c9d0d4sm15048526a12.36.2025.11.11.03.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 03:37:33 -0800 (PST)
From: Abhishek Rajput <abhiraj21put@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhiraj21put@gmail.com
Subject: [PATCH] drm/komeda: Convert logging in d71_component.c to drm_* with
 drm_device parameter
Date: Tue, 11 Nov 2025 17:07:17 +0530
Message-ID: <20251111113717.139401-1-abhiraj21put@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Nov 2025 17:17:02 +0000
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

Replace DRM_ERROR() calls in
drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
with the corresponding drm_err() helper.

The drm_*() logging helpers take a struct drm_device * as the first
argument, allowing the DRM core to prefix log messages with the
corresponding device instance. This improves log traceability when
multiple display controllers are present.

The drm_device pointer is now safely obtained using
komeda_kms_attach(d71->mdev), ensuring proper initialization and
alignment with Komeda’s internal design.

This change aligns komeda with the DRM TODO item:
"Convert logging to drm_* functions with drm_device parameter".

Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>
---
 .../arm/display/komeda/d71/d71_component.c    | 34 ++++++++++++++-----
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index 67e5d3b4190f..3524ca623d6e 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -409,6 +409,8 @@ static const struct komeda_component_funcs d71_layer_funcs = {
 static int d71_layer_init(struct d71_dev *d71,
 			  struct block_header *blk, u32 __iomem *reg)
 {
+	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *c;
 	struct komeda_layer *layer;
 	u32 pipe_id, layer_id, layer_info;
@@ -421,7 +423,7 @@ static int d71_layer_init(struct d71_dev *d71,
 				 get_valid_inputs(blk),
 				 1, reg, "LPU%d_LAYER%d", pipe_id, layer_id);
 	if (IS_ERR(c)) {
-		DRM_ERROR("Failed to add layer component\n");
+		drm_err(drm, "Failed to add layer component\n");
 		return PTR_ERR(c);
 	}
 
@@ -527,6 +529,8 @@ static const struct komeda_component_funcs d71_wb_layer_funcs = {
 static int d71_wb_layer_init(struct d71_dev *d71,
 			     struct block_header *blk, u32 __iomem *reg)
 {
+	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *c;
 	struct komeda_layer *wb_layer;
 	u32 pipe_id, layer_id;
@@ -539,7 +543,7 @@ static int d71_wb_layer_init(struct d71_dev *d71,
 				 1, get_valid_inputs(blk), 0, reg,
 				 "LPU%d_LAYER_WR", pipe_id);
 	if (IS_ERR(c)) {
-		DRM_ERROR("Failed to add wb_layer component\n");
+		drm_err(drm, "Failed to add wb_layer component\n");
 		return PTR_ERR(c);
 	}
 
@@ -837,6 +841,8 @@ static const struct komeda_component_funcs d71_scaler_funcs = {
 static int d71_scaler_init(struct d71_dev *d71,
 			   struct block_header *blk, u32 __iomem *reg)
 {
+	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *c;
 	struct komeda_scaler *scaler;
 	u32 pipe_id, comp_id;
@@ -851,7 +857,7 @@ static int d71_scaler_init(struct d71_dev *d71,
 				 pipe_id, BLOCK_INFO_BLK_ID(blk->block_info));
 
 	if (IS_ERR(c)) {
-		DRM_ERROR("Failed to initialize scaler");
+		drm_err(drm, "Failed to initialize scaler");
 		return PTR_ERR(c);
 	}
 
@@ -945,6 +951,8 @@ static const struct komeda_component_funcs d71_splitter_funcs = {
 static int d71_splitter_init(struct d71_dev *d71,
 			     struct block_header *blk, u32 __iomem *reg)
 {
+	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *c;
 	struct komeda_splitter *splitter;
 	u32 pipe_id, comp_id;
@@ -959,7 +967,7 @@ static int d71_splitter_init(struct d71_dev *d71,
 				 "CU%d_SPLITTER", pipe_id);
 
 	if (IS_ERR(c)) {
-		DRM_ERROR("Failed to initialize splitter");
+		drm_err(drm, "Failed to initialize splitter");
 		return -1;
 	}
 
@@ -1015,6 +1023,8 @@ static const struct komeda_component_funcs d71_merger_funcs = {
 static int d71_merger_init(struct d71_dev *d71,
 			   struct block_header *blk, u32 __iomem *reg)
 {
+	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *c;
 	struct komeda_merger *merger;
 	u32 pipe_id, comp_id;
@@ -1030,7 +1040,7 @@ static int d71_merger_init(struct d71_dev *d71,
 				 "CU%d_MERGER", pipe_id);
 
 	if (IS_ERR(c)) {
-		DRM_ERROR("Failed to initialize merger.\n");
+		drm_err(drm, "Failed to initialize merger.\n");
 		return PTR_ERR(c);
 	}
 
@@ -1126,6 +1136,8 @@ static const struct komeda_component_funcs d71_improc_funcs = {
 static int d71_improc_init(struct d71_dev *d71,
 			   struct block_header *blk, u32 __iomem *reg)
 {
+	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *c;
 	struct komeda_improc *improc;
 	u32 pipe_id, comp_id, value;
@@ -1139,7 +1151,7 @@ static int d71_improc_init(struct d71_dev *d71,
 				 get_valid_inputs(blk),
 				 IPS_NUM_OUTPUT_IDS, reg, "DOU%d_IPS", pipe_id);
 	if (IS_ERR(c)) {
-		DRM_ERROR("Failed to add improc component\n");
+		drm_err(drm, "Failed to add improc component\n");
 		return PTR_ERR(c);
 	}
 
@@ -1253,6 +1265,8 @@ static const struct komeda_component_funcs d71_timing_ctrlr_funcs = {
 static int d71_timing_ctrlr_init(struct d71_dev *d71,
 				 struct block_header *blk, u32 __iomem *reg)
 {
+	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *c;
 	struct komeda_timing_ctrlr *ctrlr;
 	u32 pipe_id, comp_id;
@@ -1266,7 +1280,7 @@ static int d71_timing_ctrlr_init(struct d71_dev *d71,
 				 1, BIT(KOMEDA_COMPONENT_IPS0 + pipe_id),
 				 BS_NUM_OUTPUT_IDS, reg, "DOU%d_BS", pipe_id);
 	if (IS_ERR(c)) {
-		DRM_ERROR("Failed to add display_ctrl component\n");
+		drm_err(drm, "Failed to add display_ctrl component\n");
 		return PTR_ERR(c);
 	}
 
@@ -1280,6 +1294,8 @@ static int d71_timing_ctrlr_init(struct d71_dev *d71,
 int d71_probe_block(struct d71_dev *d71,
 		    struct block_header *blk, u32 __iomem *reg)
 {
+	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
+	struct drm_device *drm = &kms->base;
 	struct d71_pipeline *pipe;
 	int blk_id = BLOCK_INFO_BLK_ID(blk->block_info);
 
@@ -1346,8 +1362,8 @@ int d71_probe_block(struct d71_dev *d71,
 		break;
 
 	default:
-		DRM_ERROR("Unknown block (block_info: 0x%x) is found\n",
-			  blk->block_info);
+		drm_err(drm, "Unknown block (block_info: 0x%x) is found\n",
+			blk->block_info);
 		err = -EINVAL;
 		break;
 	}
-- 
2.43.0

