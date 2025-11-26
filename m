Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE33C8C618
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 00:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA39D10E68B;
	Wed, 26 Nov 2025 23:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bA65R0xi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4667A10E68B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 23:46:48 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b7291af7190so47037166b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 15:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764200807; x=1764805607; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HYiCKKVIUJRRsSJx+hmkaDzcH/aYJ+uF7elvDJfPKu8=;
 b=bA65R0xihv6fKRyPenWVpWp+zud8cszRIzcGAZja46o/gMeUxHh90vIEiU5CTcE73m
 qvp27jNprWqnWPJtoPEiUiOIqzAoSTw9ZMDO6jsy+a/PM8v+bPnyayOUN9bWZ1Db/zIm
 lXWfimqsPrSeL+RJF/i3YgDdZSEXBMlpcZp6FRnhYDFRK6yWTCXHNSZgcLaZqDZE/Gq3
 Fe3GWaZ3qJzkTY1T6+k37eDxsAa+YOWZ+zivU7T4wP09emUfvdToUY4N9AY1/Jw2jPCf
 FhTHVQatlnCeJdbKkU49U1h++OEh/mxE71Tump3+I0FX0ywgAuToE3hyObsQg8ZhcLAI
 fp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764200807; x=1764805607;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYiCKKVIUJRRsSJx+hmkaDzcH/aYJ+uF7elvDJfPKu8=;
 b=uXp7B4IY1Ff2GVtM6I3VWK2ZNCKaZh398TzZmqfZp5Zefre/qEkHI7dSe8I+wWjywU
 svnDTH8rLsYsaRhTGCd0Zh5/0FLoOPhob9/5LIQlFG2SViDeJTtAg5FgOdqSpDRObmvG
 0Ncn7H8yol+97VInBHWINpKs88rqDgZbYmFf5MUB8cqNhNxYbgDqT3/Fa/qmIJjXBZlR
 EE4+4pGTmDWH6I6q57CC6Z+8ZBG0SR2Fv7XXJMvRBZ5jjNqd8BhOkAKYGheuK1V1q8cX
 HX2qRL8nFqt6YFE6cG6dFIQ6B1ki+GD2grLqLXhoJzQvtuiURqPF1ZhR5g4Fn0QS6oeU
 yMNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB1Fhen4xb10fJ44o+kHtFY9wm1b0N+2lEW4iDh71iPimCb16bU7uvxUuxFY0ATG+oiy7F61aNY9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYEzK/uGl56+AyrDnKEajFOk050JTJ6DM9wVtL51AdCJZgDhLT
 fGOpCIsSh1flTK0qpI7KblEZinVdMdslZ3bIie0590mCzxJXecqXSbs=
X-Gm-Gg: ASbGncu80LQ6K20XFTlI3UI+7lzkUY8evXTd8jZ/8FhBNsWuJcSb7EnbWapqGByKeMs
 OcGmmMkUZ8Bf2d+vE+BWeABi47g+JsYQ4JjtuzL8hsf/YONueAOe/yVm0Embfo5TOmbIcuNVIEz
 wreFJvNeoSixRlAlm+He6cNuURZSO0iL4wOzkpVMDKXSLtY2nVgsi2zSpO89ndtB8xMoG5WnWDt
 cppt2NOiUqyGf5zcR4OVwsRgvjvSUFXZI2qbw+obVm01NSNOcQwclYAY8HGjA8CbbC/bjnQv0ia
 73BEE/9ySJ47CleIfgXOvyd13U0YHZ3l5dCK5hUn6yRbLauzZEqOYZfgntvYWwsxhm80xF000m8
 fy0wY41R0M+utltiqkOzXt+96M0YF6kJAf3Il3UfHGQgV2UXO/It4Pz0kqww5sKZev0IlNdPtMd
 ri1w5MzyDy8xnQJlLzTMfq+5C9O03pt/i1LwiB1UAdjbIDRdChNLIf5VavXTQ7An+/M0AxViOlP
 Q==
X-Google-Smtp-Source: AGHT+IHSv+xwHaW3WdJrzF3qjqXq4H/1YmjW/KFfDQWUhTni7lpoZB1RWVQtEvLTuFG6aVovHBd0Ug==
X-Received: by 2002:a17:907:1b0c:b0:b76:3dbe:7bf0 with SMTP id
 a640c23a62f3a-b767150b850mr1933919866b.2.1764200806391; 
 Wed, 26 Nov 2025 15:46:46 -0800 (PST)
Received: from [192.168.1.17] (host-87-16-172-206.retail.telecomitalia.it.
 [87.16.172.206]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f59e8fdasm3658366b.51.2025.11.26.15.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 15:46:45 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 27 Nov 2025 00:46:24 +0100
Subject: [PATCH] drm/msm: Fix a7xx per pipe register programming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAE+RJ2kC/x2MQQqAIBAAvxJ7TtAtjfpKhEhutocsFCKQ/p50n
 IGZApkSU4apKZDo5sxnrKDaBtbdxUCCfWVAiVopNCIkl21c7XF6shs/YkDsibQ0rhuhZleiqv/
 lvLzvBxemawJiAAAA
X-Change-ID: 20251126-gras_nc_mode_fix-7224ee506a39
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764200804; l=8226;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=CUsN1ZM0ctblYOw27O5ENwSWwK7lA+SL6xwiBfqPCig=;
 b=Cbydz9b1aksd/5cLd44/od4UHeAxbOVHmx/Dzm4NUkxMw2+DTzukC2QtbwvroKLI/tTZvPtc1
 3JWGbHNPAH7C8lDp1IR2WIngAOhsV3Sd3OvQ2fqWNqMUt2BfpiWwGw3
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
but it needs to be programmed for both.

Program both pipes in hw_init and introducea separate reglist for it in
order to add this register to the dynamic reglist which supports
restoring registers per pipe.

Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 91 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++
 4 files changed, 109 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 29107b362346..c8d0b1d59b68 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
 	REG_A6XX_UCHE_MODE_CNTL,
 	REG_A6XX_RB_NC_MODE_CNTL,
 	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
-	REG_A7XX_GRAS_NC_MODE_CNTL,
 	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
 	REG_A6XX_UCHE_GBIF_GX_CONFIG,
 	REG_A6XX_UCHE_CLIENT_PF,
@@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
 
 DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
 
+static const struct adreno_reglist_pipe a750_reglist_pipe_regs[] = {
+	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+};
+
+DECLARE_ADRENO_REGLIST_PIPE_LIST(a750_reglist_pipe);
+
 static const struct adreno_info a7xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
@@ -1548,6 +1553,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.pipe_reglist = &a750_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
@@ -1590,6 +1596,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.pipe_reglist = &a750_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0200a7e71cdf..b98f3e93d0a8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -16,6 +16,72 @@
 
 #define GPU_PAS_ID 13
 
+static void a7xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	u32 val;
+
+	val = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe);
+
+	if (a6xx_gpu->cached_aperture == val)
+		return;
+
+	gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST, val);
+
+	a6xx_gpu->cached_aperture = val;
+}
+
+static void a7xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
+
+	a7xx_aperture_slice_set(gpu, pipe);
+}
+
+static void a7xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
+}
+
+static void a7xx_aperture_clear(struct msm_gpu *gpu)
+{
+	unsigned long flags;
+
+	a7xx_aperture_acquire(gpu, PIPE_NONE, &flags);
+	a7xx_aperture_release(gpu, flags);
+}
+
+static void a7xx_write_pipe(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 offset, u32 data)
+{
+	unsigned long flags;
+
+	a7xx_aperture_acquire(gpu, pipe, &flags);
+	gpu_write(gpu, offset, data);
+	a7xx_aperture_release(gpu, flags);
+}
+
+static u32 a7xx_read_pipe(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 offset)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
+	a7xx_aperture_slice_set(gpu, pipe);
+	val = gpu_read(gpu, offset);
+	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
+
+	return val;
+}
+
 static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
 {
 	u64 count_hi, count_lo, temp;
@@ -849,9 +915,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 
-	if (adreno_is_a7xx(adreno_gpu))
-		gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
-			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
+	if (adreno_is_a7xx(adreno_gpu)) {
+		for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_BV; pipe_id++)
+			a7xx_write_pipe(gpu, pipe_id, REG_A7XX_GRAS_NC_MODE_CNTL,
+					FIELD_PREP(GENMASK(8, 5), hbb_lo));
+		a7xx_aperture_clear(gpu);
+	}
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
 		  min_acc_len_64b << 23 | hbb_lo << 21);
@@ -865,9 +934,11 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	const struct adreno_reglist_list *reglist;
+	const struct adreno_reglist_pipe_list *pipe_reglist;
 	void *ptr = a6xx_gpu->pwrup_reglist_ptr;
 	struct cpu_gpu_lock *lock = ptr;
 	u32 *dest = (u32 *)&lock->regs[0];
+	u32 pipe_reglist_count = 0;
 	int i;
 
 	lock->gpu_req = lock->cpu_req = lock->turn = 0;
@@ -907,7 +978,19 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	 * (<aperture, shifted 12 bits> <address> <data>), and the length is
 	 * stored as number for triplets in dynamic_list_len.
 	 */
-	lock->dynamic_list_len = 0;
+	pipe_reglist = adreno_gpu->info->a6xx->pipe_reglist;
+	for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_BV; pipe_id++) {
+		for (i = 0; i < pipe_reglist->count; i++) {
+			if (pipe_reglist->regs[i].pipe & BIT(pipe_id) == 0)
+				continue;
+			*dest++ = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id);
+			*dest++ = pipe_reglist->regs[i].offset;
+			*dest++ = a7xx_read_pipe(gpu, pipe_id,
+						 pipe_reglist->regs[i].offset);
+			pipe_reglist_count++;
+		}
+	}
+	lock->dynamic_list_len = pipe_reglist_count;
 }
 
 static int a7xx_preempt_start(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 6820216ec5fc..0a1d6acbc638 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -46,6 +46,7 @@ struct a6xx_info {
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
 	const struct adreno_reglist_list *ifpc_reglist;
+	const struct adreno_reglist_pipe_list *pipe_reglist;
 	const struct adreno_reglist *gbif_cx;
 	const struct adreno_reglist_pipe *nonctxt_reglist;
 	u32 max_slices;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 0f8d3de97636..cd1846c1375e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -182,12 +182,25 @@ struct adreno_reglist_list {
 	u32 count;
 };
 
+struct adreno_reglist_pipe_list {
+	/** @reg: List of register **/
+	const struct adreno_reglist_pipe *regs;
+	/** @count: Number of registers in the list **/
+	u32 count;
+};
+
 #define DECLARE_ADRENO_REGLIST_LIST(name)	\
 static const struct adreno_reglist_list name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 };
 
+#define DECLARE_ADRENO_REGLIST_PIPE_LIST(name)	\
+static const struct adreno_reglist_pipe_list name = {		\
+	.regs = name ## _regs,				\
+	.count = ARRAY_SIZE(name ## _regs),		\
+};
+
 struct adreno_gpu {
 	struct msm_gpu base;
 	const struct adreno_info *info;

---
base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
change-id: 20251126-gras_nc_mode_fix-7224ee506a39

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

