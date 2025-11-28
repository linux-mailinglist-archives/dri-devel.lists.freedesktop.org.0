Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2416C92C79
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 18:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C093910E903;
	Fri, 28 Nov 2025 17:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HlnJ383i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3658D10E903
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 17:18:20 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b737502f77bso307282266b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764350299; x=1764955099; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GJQwfOIw2qQpgiHTYzvOGMNFZV2HUBa/BfEUHAS1g30=;
 b=HlnJ383i9W+ZzQ5zjn/XPdG29+VIGmtfHFFSpSWHdNeiKOoEckuVAW+Xym8Bz9ebbX
 uC5gzj8ZYfHiCvxy/9yu3M1J+GPSyISLK+2MTY8waV+3GuG948mnqzOSeQTXtcpcuYN6
 aE/1wQuZHOviTHiK7Zg+Ine93mLUWElyJ3oTJ5J/kXEfseQGb7BH30bIP1ZFva1UyWh4
 Pv6nf+RWep2g8/CDvDAaJMTeJ3loJV6WH4MbsQMkhsM5QcxOjU7TMdpkVRzl84GLMwe+
 G5hZJJlfvK1BUN1u/abX5+7Frvmc2XHXVkFD/c7/OGBJL0xVxLJE4flfsh0L8oMOdBZX
 Wa7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764350299; x=1764955099;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJQwfOIw2qQpgiHTYzvOGMNFZV2HUBa/BfEUHAS1g30=;
 b=PTlAiUdO6Xg8C3DtA/Zl5bb5WTdolbX0AX+hi/5asjldKHXX0M33V54liuH0CTLW17
 o+xUKL8yN7RFNohI0KiNdOvLJROuoglQyzFHCeWJtVzQ7XnM/QH4kOfc1+tR2Qrixz4H
 VG4cVt7lBDonREqCNxjGqNd54oaT69piYOs5O8a+WYmtsvG1E51nxWX7TucGDTFElshS
 ZeJQzc+oLiMLphetcZcFloGjfzLbKuQrrB0WQZ0KY1EF1ogKOIpe/cgSTmGRZEJWxVMF
 J5GVzDIX7ppK8/AE4X2uVBcdsZVWs35nMRiYxoS9LbPpEDunkE1W6rx/qh2vit8hbk0E
 r25g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUquxH63VUZEbw/IhsHmjUMdKqmPImZsrkd9XlBEM3xuBOhEL5TY2IHDUTzoRqaN+W8FwIqhbC95tk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpCrnASRidv7NNQTblA69n6wr+y54VoHQDRUCzy0YrJ+rbgrTS
 HuDGf7qUS6uh5nNmUh4q0hxTll9+F3DDgN0Yli29/oTac0cRii1d6zo=
X-Gm-Gg: ASbGncvVzVfgDt9rw/f8L9VjPMRRsaG8t1BNxBiMYlemTjO2sjvlyiF87AhdiW4/662
 OqdPLVIbpu6oC5NS5vcYGdbz32MnWG0CGfTJWP8yb+vygaplHZD8y7F/M7xCr6BRK1niKFd2jGg
 0BcLO9vMG/z2jWfyDNrth4GzRIwwwWhCzURfTXWfNThpBLE9SJKJwzbdFCYvqaFwEuvBSGvDFnC
 COR+B1i4jch6z1oeepo2GBE7lkyJujaS5rB6wVVsPunNEZZWBqV7BtznKFUNaREg09SypoosP8C
 2yr9HSODw3sUVN0Ld0qb5PMCdb2HqpUlSXciHusZvuR43ILJD5vscdabruWQ6801cx8yi5I1qyu
 bLFyenVzgG7h6r1/AIUYd8KP9+pIW/qVTe6trOyOm/m8wIce3b/dA5TDPARUDRDcrqo9ppspeuj
 yjxVCPHgM+7x3jSCr/ceIeVQayk2eLJouyPgu8miWNxGWQmdK3VPO/KaVW/Ni33+CMYChpgSg=
X-Google-Smtp-Source: AGHT+IGMb2CAJXzm7R7ZYxSu0VKeZ+ZE/F03jrlS6C47GGzI0dctfnwYd5RO36R52sY8BYB1vKXY+g==
X-Received: by 2002:a17:907:801:b0:b73:7de4:dfdb with SMTP id
 a640c23a62f3a-b76c5515010mr1501580566b.37.1764350298291; 
 Fri, 28 Nov 2025 09:18:18 -0800 (PST)
Received: from [192.168.1.17] (host-79-36-164-91.retail.telecomitalia.it.
 [79.36.164.91]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5162093sm509465066b.2.2025.11.28.09.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 09:18:17 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Fri, 28 Nov 2025 18:17:28 +0100
Subject: [PATCH v2] drm/msm: Fix a7xx per pipe register programming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-gras_nc_mode_fix-v2-1-634cda7b810f@gmail.com>
X-B4-Tracking: v=1; b=H4sIACjZKWkC/2WNQQrCMBBFr1JmbSQTmxRdeQ8pIaSTdMA2kkhRS
 u9uLLhy+R7891colJkKXJoVMi1cOM0V1KEBP7o5kuChMiipNKIyImZX7OztlAaygV+iU6ol0tK
 40xnq7JGp6j156yuPXJ4pv/eHBb/2F+v+YwsKFNpLHwyaVmK4xsnx/ejTBP22bR+MHLPwsAAAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764350296; l=7753;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=qSMDgAab8niEa7uXA8/JyMRbEm4G4q6XD1/VjNo6mzM=;
 b=T23Rwt648GTVB5YRJanV0yDkpqQX+VDqWRFRQ92FRrpdINbCDnsVnFd9OEz6+pj9nnS5aw8x+
 KpSbq+SP5RzA4aaxGasbztjY6qk3Kg28G5Rv55eY27+65W6w647PBqk
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
Cc: stable@vger.kernel.org
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v2:
- Added missing Cc: stable to commit
- Added pipe_regs to all 7xx gens
- Null check pipe_regs in a7xx_patch_pwrup_reglist
- Added parentheses around bitwise and in a7xx_patch_pwrup_reglist
- Use A7XX_PIPE_{BR, BV, NONE} enum values
- Link to v1: https://lore.kernel.org/r/20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 12 ++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 34 +++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 ++++++++++++
 4 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 29107b362346..10732062d681 100644
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
 
+static const struct adreno_reglist_pipe a7xx_reglist_pipe_regs[] = {
+	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+};
+
+DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_reglist_pipe);
+
 static const struct adreno_info a7xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
@@ -1491,6 +1496,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.pipe_reglist = &a7xx_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020000,
 		},
@@ -1513,6 +1519,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.pipe_reglist = &a7xx_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
@@ -1548,6 +1555,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.pipe_reglist = &a7xx_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
@@ -1590,6 +1598,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.pipe_reglist = &a7xx_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
@@ -1623,6 +1632,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.pipe_reglist = &a7xx_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x70f0000,
 			.gmu_cgc_mode = 0x00020222,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0200a7e71cdf..422ce4c97f70 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -849,9 +849,16 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 
-	if (adreno_is_a7xx(adreno_gpu))
-		gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
-			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
+	if (adreno_is_a7xx(adreno_gpu)) {
+		for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
+			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
+			gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
+				  FIELD_PREP(GENMASK(8, 5), hbb_lo));
+		}
+		gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(A7XX_PIPE_NONE));
+	}
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
 		  min_acc_len_64b << 23 | hbb_lo << 21);
@@ -865,9 +872,11 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
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
@@ -907,7 +916,24 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	 * (<aperture, shifted 12 bits> <address> <data>), and the length is
 	 * stored as number for triplets in dynamic_list_len.
 	 */
-	lock->dynamic_list_len = 0;
+	pipe_reglist = adreno_gpu->info->a6xx->pipe_reglist;
+	if (pipe_reglist) {
+		for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
+			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
+			for (i = 0; i < pipe_reglist->count; i++) {
+				if ((pipe_reglist->regs[i].pipe & BIT(pipe_id)) == 0)
+					continue;
+				*dest++ = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id);
+				*dest++ = pipe_reglist->regs[i].offset;
+				*dest++ = gpu_read(gpu, pipe_reglist->regs[i].offset);
+				pipe_reglist_count++;
+			}
+		}
+		gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(A7XX_PIPE_NONE));
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
index 0f8d3de97636..1d0145f8b3ec 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -188,6 +188,19 @@ static const struct adreno_reglist_list name = {		\
 	.count = ARRAY_SIZE(name ## _regs),		\
 };
 
+struct adreno_reglist_pipe_list {
+	/** @reg: List of register **/
+	const struct adreno_reglist_pipe *regs;
+	/** @count: Number of registers in the list **/
+	u32 count;
+};
+
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

