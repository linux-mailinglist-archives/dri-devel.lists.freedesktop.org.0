Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D29C98AC8
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF2110E44F;
	Mon,  1 Dec 2025 18:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HJx8uwWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FD110E44F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 18:14:57 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-64166a57f3bso7145671a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 10:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764612896; x=1765217696; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cdBHarEPp/F3chTNnuM3xZFo7roMjTxRyskG7lZyJVY=;
 b=HJx8uwWmADc2t/B+Jaw+8zIhdmqvNrSBBWS2Vqre3I6hd2BACAXaIfpk9X/iIjlgGF
 n3cgDGHOBOHOWmukdXWR2Uu5elR4VXY2gsiZl4aT8/rvR9kOJrmJGr7gaCFXhhFinPcX
 GWzHqCGdgMNap/p1RvBXkLvsqYwWYAptyWB/AG5InqW8HquiU3boKEa//zHRmk/wQ5nd
 0jrQnVsOmGRHFizRSwXB+aVXFjjt+aOQu+o8i5J0C7DPv0baOB3nkAVDml8Lmfo3/hYh
 wLyhk4Chmcy9a3VvLFyI9P5ZQRNwdheTjAaFAez/i0WYsmgwK8uE/FyZcO7rfaIpHaDJ
 l/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764612896; x=1765217696;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cdBHarEPp/F3chTNnuM3xZFo7roMjTxRyskG7lZyJVY=;
 b=l2AukS4AxomN6xkg5WClAO5mBT/UuWbt4ueDWYkkP9eE3G9A75SxA0QzgUM13jY3BZ
 PPBng9v4DrLUQj4/irJ7mwexrtj63yUjIxF8mpRC41kRPIke7B2ElvqwJm4+iPQtppv4
 HNeHl+iGt3En6P8/YzK0yffGSFT4zJP/Etj5qtmW7Y1M8+GEO1PVAvyfXrvP2aagKCdW
 5sEF97Mfy34y6wbA9Z98zUm2h7fT5cfrj2kGqRIWHtWai+O2XgkGeSl3g6JNeOHdH7hF
 dpJwHBeD4pTtEvofb7KrTBp4g2uTDPX32chM4Df0e9AFzi7pKbpDPh1LVB4VYbFchwtx
 tfKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLZkJXkqVarm7WVRb7SPcwVyLm/PLix/u2kZj9Pbqm4rO/VMJKhAUr+sydoY1eHu05EZ+652YFLoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhmXiWgR3p8t+oC93C1svolfmOT4sZ3AGc1i+Vh2G2KnJZ8Jul
 CnFusgqaW8HMjoLyBDpfoinxUCbNhNlJQYGI31lhgC4CJQBvImoqeRI=
X-Gm-Gg: ASbGncuiNznd/vFENdgBnZrLYcVC5aZnNXcMqX3cWT5hsIVOcUtRMw+UB6ccE1rAOs/
 B8phmdDvyJEzdCisKw9BtR7m4Mex+6J47LH5Zi0vq7kXDTrBbAXoj8gjmEsP8+uIvBL8LmYG3Qz
 l1TdECdhP944dVmJVUisF6ZYv71mXrBt7chYQsWD5vKYGhm8Jf9kDgO5LpmvTBjnNK8q+w/cFP5
 su/PrVOJqdLFrc+29y2sC6hvCjHLN6mdWrQy9l/wjWW4QhdwRszIDltO5/7mHB1+yVXZbfqw9nj
 Rqm9N3QrRq3oy2JFzhRrVMiGKbdy1Shp9yijtiCMeHdtJq2ldXHRTT34wgyXqxImoq1bydICoyL
 x30QAZj+K2HtuTIDKUSBpcLL1fhfItGdswPOzm+ZGJPLz8oajj83Eltn+k90YpnW6yKQVYq4/Gs
 wkilh2nQAmphblUlPPvIGnwljB7TDGmJAzlNGBy2S6TYGd0TXSaIPuS4k22pxynigeaQ0vCoP7o
 0/tcJvUCiBd
X-Google-Smtp-Source: AGHT+IHGqhGE8mA2IpVApmMTWjrQKk1GSJW1wXCG5WLq0l79b2/ZCwmcJq33Zptjd3K93hqIqk2xIA==
X-Received: by 2002:a05:6402:4408:b0:645:d764:3fcb with SMTP id
 4fb4d7f45d1cf-645eb2aaf67mr25735808a12.28.1764612895894; 
 Mon, 01 Dec 2025 10:14:55 -0800 (PST)
Received: from [192.168.1.17] (host-79-32-234-137.retail.telecomitalia.it.
 [79.32.234.137]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751035c3bsm12862898a12.19.2025.12.01.10.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 10:14:54 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Mon, 01 Dec 2025 19:14:36 +0100
Subject: [PATCH v3] drm/msm: Fix a7xx per pipe register programming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-gras_nc_mode_fix-v3-1-92a8a10d91d0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAvbLWkC/23N0QqCMBTG8VeJc91iZ+q0rnqPCFnzqAfSxRajE
 N+9KQRFXf4/OL8zQSDPFOCwmcBT5MBuTJFtN2B7M3YkuEkNSqoCUWnReRPq0daDa6hu+SFKpXK
 iQmqT7SGd3TyleSVP59Q9h7vzz/VDxGV9Y+UvFlGgKKy0rUadS2yP3WD4urNugAWL6hOo/gAqA
 TrLbWPKS4XyC5jn+QW7QeGQ8QAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764612893; l=8104;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=L1+oJOb+t8duMnbQpmbgUlKeEuct+2pj/S1LXw+5x4E=;
 b=Xl5ZhQaztNVoSbuE9N0LIYwINJ6SjcbjDSYO2J0ofPyETSCi9Q78mb1C/B0E5oNJod7c1jCep
 Zhmx/UODO3+CU25Zelwvnh7sFHl0c0M8X2rAhSb6+tE98T7NKVR5wSW
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
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v3:
- Collected Rb tags
- Went back to using PIPE_{BR, BV, NONE} enum values
- Link to v2: https://lore.kernel.org/r/20251128-gras_nc_mode_fix-v2-1-634cda7b810f@gmail.com

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
index 29107b362346..c749448e75be 100644
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
 
+static const struct adreno_reglist_pipe a7xx_dyn_pwrup_reglist_regs[] = {
+	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+};
+
+DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
+
 static const struct adreno_info a7xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
@@ -1491,6 +1496,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.dyn_pwrup_reglist = &a7xx_dyn_pwrup_reglist,
 			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020000,
 		},
@@ -1513,6 +1519,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.dyn_pwrup_reglist = &a7xx_dyn_pwrup_reglist,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
@@ -1547,6 +1554,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.dyn_pwrup_reglist = &a7xx_dyn_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7050001,
@@ -1589,6 +1597,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.dyn_pwrup_reglist = &a7xx_dyn_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7090100,
@@ -1623,6 +1632,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.dyn_pwrup_reglist = &a7xx_dyn_pwrup_reglist,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x70f0000,
 			.gmu_cgc_mode = 0x00020222,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0200a7e71cdf..afde8867e260 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -849,9 +849,16 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 
-	if (adreno_is_a7xx(adreno_gpu))
-		gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
-			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
+	if (adreno_is_a7xx(adreno_gpu)) {
+		for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_BV; pipe_id++) {
+			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
+			gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
+				  FIELD_PREP(GENMASK(8, 5), hbb_lo));
+		}
+		gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(PIPE_NONE));
+	}
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
 		  min_acc_len_64b << 23 | hbb_lo << 21);
@@ -865,9 +872,11 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	const struct adreno_reglist_list *reglist;
+	const struct adreno_reglist_pipe_list *dyn_pwrup_reglist;
 	void *ptr = a6xx_gpu->pwrup_reglist_ptr;
 	struct cpu_gpu_lock *lock = ptr;
 	u32 *dest = (u32 *)&lock->regs[0];
+	u32 dyn_pwrup_reglist_count = 0;
 	int i;
 
 	lock->gpu_req = lock->cpu_req = lock->turn = 0;
@@ -907,7 +916,24 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	 * (<aperture, shifted 12 bits> <address> <data>), and the length is
 	 * stored as number for triplets in dynamic_list_len.
 	 */
-	lock->dynamic_list_len = 0;
+	dyn_pwrup_reglist = adreno_gpu->info->a6xx->dyn_pwrup_reglist;
+	if (dyn_pwrup_reglist) {
+		for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_BV; pipe_id++) {
+			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
+			for (i = 0; i < dyn_pwrup_reglist->count; i++) {
+				if ((dyn_pwrup_reglist->regs[i].pipe & BIT(pipe_id)) == 0)
+					continue;
+				*dest++ = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id);
+				*dest++ = dyn_pwrup_reglist->regs[i].offset;
+				*dest++ = gpu_read(gpu, dyn_pwrup_reglist->regs[i].offset);
+				dyn_pwrup_reglist_count++;
+			}
+		}
+		gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(PIPE_NONE));
+	}
+	lock->dynamic_list_len = dyn_pwrup_reglist_count;
 }
 
 static int a7xx_preempt_start(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 6820216ec5fc..4eaa04711246 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -45,6 +45,7 @@ struct a6xx_info {
 	const struct adreno_reglist *hwcg;
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
+	const struct adreno_reglist_pipe_list *dyn_pwrup_reglist;
 	const struct adreno_reglist_list *ifpc_reglist;
 	const struct adreno_reglist *gbif_cx;
 	const struct adreno_reglist_pipe *nonctxt_reglist;
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

