Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D6820EF9A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B968B89F97;
	Tue, 30 Jun 2020 07:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3C589D61
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 23:49:33 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c139so16968537qkg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 16:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=INJz41oEwqBdPwMkCDafi8GZqPrx57eQ34QaJVM3jDo=;
 b=w7tL9wUqeQnRmuha+5h8O5Lc9RCWJhsX9fNA8rNyLQ5477ibCkAYGnvs/u2I3VxYLm
 E3pA3v3oIBnP2mDhGOdP8iwZNf8IMh5HQFBOttbyjJgPXucZ+lxehas6Ok+0bMg9HsJn
 oD3vsnl4J1OMc6PnYH4ii4o5gp0PYYQKvfBNOZjNvolX4xWWYqaJyVvpbQRsVPgSOsFb
 Y/pM1JLXOcmrT2y8T1NgqYOEhaYjOvjUtJtW1+lAqv/quM2qBrCWTrac4LGKpbwPQ8mo
 GQP+Kng+KM7o97iPjg2Jz3vTcr1ni4VpZ1b5HiEjieXQ+lgBswKpANIeRx+5zDcIDGRW
 IRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=INJz41oEwqBdPwMkCDafi8GZqPrx57eQ34QaJVM3jDo=;
 b=DJ312q0aOqjS1mIkJI4+K4AnSAVKZiSBvi2e3jVyXVjGw7+Q4Vi/6/5ChYytOUQoIi
 YqpHLYUgr+nB2FQ/ExsYguIPcRfRI7scEVX0HpWNOyQ/+N0wDNPuQZM0KqScmYUl0iX6
 7YerEhEzrhRaAeuvzbeqB+C4HesjiZ6EE8SLHkxpDDwpoXRGyLJjl2yVonqmZr7e58t6
 yr3ok6jwdnQReqgVUJuWaxAd/oIM0Qw6M49ff9xBKVgcKkFry5ffMJHFZw87PNMrb97t
 YeiEsjGvGIjQmAECbAMasAociIoUwn6mGgun85FXwaNPtIp628vY8LjEG+P5r/E9+l0P
 0X1Q==
X-Gm-Message-State: AOAM533UK9ToD2VbGa7h+Gk2ZGHkNd68y0GxkITCYmEz+yHE556bzNsG
 FYyYiOpE3GZSCY33wkH1nyoMBw==
X-Google-Smtp-Source: ABdhPJxLhoKQUyfQM40vTU8WnSpb3j82fayp1+2jOrKscAGyzh+6Wf6F5u+EfDT2NWIfLHzREyDX6Q==
X-Received: by 2002:a37:a151:: with SMTP id k78mr16825814qke.24.1593474572666; 
 Mon, 29 Jun 2020 16:49:32 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id n64sm1541076qke.77.2020.06.29.16.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:49:32 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/a6xx: add A640/A650 hwcg
Date: Mon, 29 Jun 2020 19:49:14 -0400
Message-Id: <20200629234921.3511-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629234921.3511-1-jonathan@marek.ca>
References: <20200629234921.3511-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:53 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize hardware clock-gating registers on A640 and A650 GPUs.

At least for A650, this solves some performance issues.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   8 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  11 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 108 +++++++++++++++++++++
 3 files changed, 124 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 47840b73cdda..f0498faf7d0b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1996,6 +1996,14 @@ static inline uint32_t A6XX_CP_PROTECT_REG_MASK_LEN(uint32_t val)
 
 #define REG_A6XX_RBBM_CLOCK_DELAY_HLSQ				0x0000011c
 
+#define REG_A6XX_RBBM_CLOCK_HYST_HLSQ				0x0000011d
+
+#define REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE			0x00000120
+
+#define REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE			0x00000121
+
+#define REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE			0x00000122
+
 #define REG_A6XX_DBGC_CFG_DBGBUS_SEL_A				0x00000600
 
 #define REG_A6XX_DBGC_CFG_DBGBUS_SEL_B				0x00000601
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6cd79166a94e..891a21c5225e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -157,15 +157,20 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	unsigned int i;
-	u32 val;
+	u32 val, clock_cntl_on;
 
 	if (!adreno_gpu->info->hwcg)
 		return;
 
+	if (adreno_is_a630(adreno_gpu))
+		clock_cntl_on = 0x8aa8aa02;
+	else
+		clock_cntl_on = 0x8aa8aa82;
+
 	val = gpu_read(gpu, REG_A6XX_RBBM_CLOCK_CNTL);
 
 	/* Don't re-program the registers if they are already correct */
-	if ((!state && !val) || (state && (val == 0x8aa8aa02)))
+	if ((!state && !val) || (state && (val == clock_cntl_on)))
 		return;
 
 	/* Disable SP clock before programming HWCG registers */
@@ -179,7 +184,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	/* Enable SP clock */
 	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
 
-	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? 0x8aa8aa02 : 0);
+	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
 }
 
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f5f40bc3c113..b3149ff7fa9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -123,6 +123,110 @@ static const struct adreno_reglist a630_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555}
 };
 
+static const struct adreno_reglist a640_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05222022},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
+	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
+	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
+	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
+	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
+	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
+};
+
+static const struct adreno_reglist a650_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
+	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
+	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
+	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
+	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
+	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
+};
+
 static const struct adreno_info gpulist[] = {
 	{
 		.rev   = ADRENO_REV(2, 0, 0, 0),
@@ -323,6 +427,8 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
+		.hwcg = a640_hwcg,
+		.hwcg_count = ARRAY_SIZE(a640_hwcg),
 	}, {
 		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
 		.revn = 650,
@@ -335,6 +441,8 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a650_zap.mdt",
+		.hwcg = a650_hwcg,
+		.hwcg_count = ARRAY_SIZE(a650_hwcg),
 	},
 };
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
