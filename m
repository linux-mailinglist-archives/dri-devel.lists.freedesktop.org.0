Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D4D8BBD1A
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 18:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326401135C9;
	Sat,  4 May 2024 16:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EQjHbla7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAAC1135C8;
 Sat,  4 May 2024 16:31:22 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1ec4b2400b6so5121525ad.3; 
 Sat, 04 May 2024 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714840282; x=1715445082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BVHkSDrp78uKW0uZrcyHhFLD98BFVYL6QDF1S7ek4Xk=;
 b=EQjHbla7UOiqzbeFJWH9WgMO+01e6RbJNb6bIDiSB6Aj5V38l/ozL2+pzmfmF3JDS2
 HAo+aHyhe9uMZfF5ueUN8IGGmkDTr2Sc3WXLzHuahJD6npnfT/84cKqo4Hnu3yCVGpvs
 qnHF4eD5B374FwZHaQ41bkJwxhNzFMhJPlISqv42cxnIL/0tOtDgUMa+COIKBoGeXcpH
 WZE/proEz6dXQau6Q9Q1MSOciUncCkLVVSlzIOOfMVDCBF5ldpH8mt/fDgNvDQ1AAJ5v
 UCjAVcITIsKRzUPNhZh+QOlhzCaIT4yLpkxvNhuqD6KTR71j7WD8EwGoi8refwHASgyN
 h8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714840282; x=1715445082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVHkSDrp78uKW0uZrcyHhFLD98BFVYL6QDF1S7ek4Xk=;
 b=aCTrV3ZKQUu5o0PJ6lqyCle311ST2CeYmCCjZzSRrVXo2zv22wZ4zgVIUMgo43Lxwf
 yg7wzWerd8gBo/pOZLMh6okX/T8HT08+KoE3xTc+FUusbTMS+ZrVGb2RdxQKT3avEOT+
 sEHPJ7NJFe9Y/O51eCWOfBU0IMSU1AwohDRvQxzacG6cjxzFBOd3wcEpDqYHGj0B0UFw
 gkVgIOP4A6lPC69I7mOmM4blchKYHxx5Wlw2DMy58R+wWmCsAHXhFzKpPY6OxJtmM8lM
 oX1Fl4wSywNp2Nxf8nm8crpmSn4iCXubj1hdGvvwy1ArVDWb/hCVOXCFZER+vtXRpB8v
 6qmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUh6OpbV2d75EPOO2IClfFbdyr3gbGAlCszfpT/mi89zxkR0bQ4C/uitfc3J4J9J1zqLm9SYfulDobFRJApva52sZtrTWnBkXBW4GDmQd3
X-Gm-Message-State: AOJu0YycJxopsUpSmEkE8wgxYatwQToxZFSyaYwh3lJw1EfxtuyDlxpT
 sjRn6JhI8bf1Ay2xE1BKX+Fz2GPpE9l7DdzITV2xJJdps3Mwd49tbXa1JA==
X-Google-Smtp-Source: AGHT+IHArHsW3DCfdQpbK2KIyCCirt6QvRblSevbGPQPn2t4LZFf5iduw2DZMI57WDH//nxVT0o+7A==
X-Received: by 2002:a17:902:f649:b0:1e2:bf94:487 with SMTP id
 m9-20020a170902f64900b001e2bf940487mr7668589plg.57.1714840281493; 
 Sat, 04 May 2024 09:31:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
 by smtp.gmail.com with ESMTPSA id
 jb13-20020a170903258d00b001ec4ed47ddesm5274490plb.86.2024.05.04.09.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 09:31:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Cleanup indexed regs const'ness
Date: Sat,  4 May 2024 09:31:13 -0700
Message-ID: <20240504163114.639228-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.44.0
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

From: Rob Clark <robdclark@chromium.org>

These tables were made non-const in commit 3cba4a2cdff3 ("drm/msm/a6xx:
Update ROQ size in coredump") in order to avoid powering up the GPU when
reading back a devcoredump.  Instead let's just stash the count that is
potentially read from hw in struct a6xx_gpu_state_obj, and make the
tables const again.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 15 +++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h |  8 ++++----
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 77146d30bcaa..0a7717a4fc2f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -24,6 +24,7 @@
 struct a6xx_gpu_state_obj {
 	const void *handle;
 	u32 *data;
+	u32 count;	/* optional, used when count potentially read from hw */
 };
 
 struct a6xx_gpu_state {
@@ -1437,16 +1438,18 @@ static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu)
 /* Read a block of data from an indexed register pair */
 static void a6xx_get_indexed_regs(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state,
-		struct a6xx_indexed_registers *indexed,
+		const struct a6xx_indexed_registers *indexed,
 		struct a6xx_gpu_state_obj *obj)
 {
+	u32 count = indexed->count;
 	int i;
 
 	obj->handle = (const void *) indexed;
 	if (indexed->count_fn)
-		indexed->count = indexed->count_fn(gpu);
+		count = indexed->count_fn(gpu);
 
-	obj->data = state_kcalloc(a6xx_state, indexed->count, sizeof(u32));
+	obj->data = state_kcalloc(a6xx_state, count, sizeof(u32));
+	obj->count = count;
 	if (!obj->data)
 		return;
 
@@ -1454,7 +1457,7 @@ static void a6xx_get_indexed_regs(struct msm_gpu *gpu,
 	gpu_write(gpu, indexed->addr, 0);
 
 	/* Read the data - each read increments the internal address by 1 */
-	for (i = 0; i < indexed->count; i++)
+	for (i = 0; i < count; i++)
 		obj->data[i] = gpu_read(gpu, indexed->data);
 }
 
@@ -1890,9 +1893,9 @@ static void a6xx_show_indexed_regs(struct a6xx_gpu_state_obj *obj,
 		return;
 
 	print_name(p, "  - regs-name: ", indexed->name);
-	drm_printf(p, "    dwords: %d\n", indexed->count);
+	drm_printf(p, "    dwords: %d\n", obj->count);
 
-	print_ascii85(p, indexed->count << 2, obj->data);
+	print_ascii85(p, obj->count << 2, obj->data);
 }
 
 static void a6xx_show_debugbus_block(const struct a6xx_debugbus_block *block,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 3b1ba514e8ee..dd4c28a8d923 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -397,7 +397,7 @@ struct a6xx_indexed_registers {
 	u32 (*count_fn)(struct msm_gpu *gpu);
 };
 
-static struct a6xx_indexed_registers a6xx_indexed_reglist[] = {
+static const struct a6xx_indexed_registers a6xx_indexed_reglist[] = {
 	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
 		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
@@ -408,7 +408,7 @@ static struct a6xx_indexed_registers a6xx_indexed_reglist[] = {
 		REG_A6XX_CP_ROQ_DBG_DATA, 0, a6xx_get_cp_roq_size},
 };
 
-static struct a6xx_indexed_registers a7xx_indexed_reglist[] = {
+static const struct a6xx_indexed_registers a7xx_indexed_reglist[] = {
 	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
 		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
@@ -433,12 +433,12 @@ static struct a6xx_indexed_registers a7xx_indexed_reglist[] = {
 		REG_A6XX_CP_ROQ_DBG_DATA, 0, a7xx_get_cp_roq_size },
 };
 
-static struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
+static const struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
 	"CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
 		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2060, NULL,
 };
 
-static struct a6xx_indexed_registers a7xx_cp_bv_mempool_indexed[] = {
+static const struct a6xx_indexed_registers a7xx_cp_bv_mempool_indexed[] = {
 	{ "CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
 		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2100, NULL },
 	{ "CP_BV_MEMPOOL", REG_A7XX_CP_BV_MEM_POOL_DBG_ADDR,
-- 
2.44.0

