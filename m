Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCC821E8D4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EF86E8F2;
	Tue, 14 Jul 2020 07:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676506E1A5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 23:05:35 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id u12so5745059qth.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 16:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v6ivPqrjMDDr3TRNG96DmIieKD3MH/IuhTJHVemdvZo=;
 b=mD4rNTBvdE5KXuYC4b6PGIVTtIxAYQyogmsrVl9FyzpE/jLzFTlKgPK60wOz/OqYyy
 v2mTDwGgr9R9AHjgkMGkYmylnK9XZQwPUjJL7taIeoqjtLXWIdOPZOjroLYHpdmJVjib
 Dlb684ctSVhWjtAJ2ZXA/fso/BAjBuK2xUiQEg0dT5uvpAl7f8h6iRDhZ8OKZMLhVCIF
 hPWbN/85q+cxHa8dcGFcLZduJbrtIAPipHA7VkMVJsOE29/nsU0wUFUthA/sXZ67Xf1K
 XfynEAeHeix30IZF3doAyKYVOg9D3dVHquKmzdvpDjJtsCL6CQu83cRn8v4Rl9n/HL8V
 pPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v6ivPqrjMDDr3TRNG96DmIieKD3MH/IuhTJHVemdvZo=;
 b=YULPjG30+Z0+X6AUJQMcDLuZSLkwhaF3fxzrUMwKCm0azdY59NWfjE2cIcAD4tnqsP
 ZeDttjxJ95CyN/BKx+HXQJYtB4dv/gP7PjmogaE8AVQDl7AKmID2SctfKAh2a/AWVBNv
 2UEFcq67ts0wPjBKv2jbT2nY4tbSXFDis2FNqjoGikiRRgJJXyT1B/T5+ypPHTb3u9cm
 A8MS4ycUTtbkmqPozp8aRuruftAdXUxPT3RprBDatVcmxvyXdwPfOCJs71IyAm3sqNpD
 n7aHu8fqOB0U9E2JWP5A16XFxgmzLV3ZukwbQrNP6hhPFAYnvh4wU1TACDeE5JTw7nG3
 rksA==
X-Gm-Message-State: AOAM531HthJFp81r0/pPVx+iy8i3qY3Q8hEJIrvOs3hNhB22xkP92O4C
 7iMj7IuQm+/G8hxZBtfo1sQLXA==
X-Google-Smtp-Source: ABdhPJyUvIKbE5/BA3PRSmr94uSUG08duLAoCKW3CvonbUAJmLs93BI2H3hmv2nKUdMg7RgpyuPIYg==
X-Received: by 2002:ac8:44d6:: with SMTP id b22mr73349830qto.391.1594422334354; 
 Fri, 10 Jul 2020 16:05:34 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id l1sm9513541qtk.18.2020.07.10.16.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:05:33 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm/a6xx: hwcg tables in gpulist
Date: Fri, 10 Jul 2020 19:04:09 -0400
Message-Id: <20200710230413.2944-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: AngeloGioacchino Del Regno <kholk11@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Brian Masney <masneyb@onstation.org>, open list <linux-kernel@vger.kernel.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will allow supporting different hwcg tables for a6xx.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 25 ++++++++++------------
 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  8 +++++++
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3397e5e00d1c..ddcbc57ac25d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -151,10 +151,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 	a6xx_flush(gpu, ring);
 }
 
-static const struct {
-	u32 offset;
-	u32 value;
-} a6xx_hwcg[] = {
+const struct adreno_reglist a630_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP1, 0x22222222},
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP2, 0x22222222},
@@ -259,7 +256,8 @@ static const struct {
 	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
 	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
 	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
-	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555}
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
+	{},
 };
 
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
@@ -267,9 +265,13 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	const struct adreno_reglist *reg;
 	unsigned int i;
 	u32 val;
 
+	if (!adreno_gpu->info->hwcg)
+		return;
+
 	val = gpu_read(gpu, REG_A6XX_RBBM_CLOCK_CNTL);
 
 	/* Don't re-program the registers if they are already correct */
@@ -279,9 +281,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	/* Disable SP clock before programming HWCG registers */
 	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
-	for (i = 0; i < ARRAY_SIZE(a6xx_hwcg); i++)
-		gpu_write(gpu, a6xx_hwcg[i].offset,
-			state ? a6xx_hwcg[i].value : 0);
+	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
+		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
 	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
@@ -437,12 +438,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_TPL1_ADDR_MODE_CNTL, 0x1);
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_ADDR_MODE_CNTL, 0x1);
 
-	/*
-	 * enable hardware clockgating
-	 * For now enable clock gating only for a630
-	 */
-	if (adreno_is_a630(adreno_gpu))
-		a6xx_set_hwcg(gpu, true);
+	/* enable hardware clockgating */
+	a6xx_set_hwcg(gpu, true);
 
 	/* VBIF/GBIF start*/
 	if (adreno_is_a640(adreno_gpu) || adreno_is_a650(adreno_gpu)) {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7732f03d9e3a..97996e7fc668 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -200,6 +200,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a630_zap.mdt",
+		.hwcg = a630_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 4, 0, ANY_ID),
 		.revn = 640,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2f5d2c3acc3a..426cabd374bb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -68,6 +68,13 @@ struct adreno_gpu_funcs {
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 };
 
+struct adreno_reglist {
+	u32 offset;
+	u32 value;
+};
+
+extern const struct adreno_reglist a630_hwcg[];
+
 struct adreno_info {
 	struct adreno_rev rev;
 	uint32_t revn;
@@ -78,6 +85,7 @@ struct adreno_info {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	const char *zapfw;
 	u32 inactive_period;
+	const struct adreno_reglist *hwcg;
 };
 
 const struct adreno_info *adreno_info(struct adreno_rev rev);
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
