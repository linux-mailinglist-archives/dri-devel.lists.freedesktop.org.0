Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7B520EF6B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E21089C9C;
	Tue, 30 Jun 2020 07:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3F789D2F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 23:49:29 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id q22so7780987qtl.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 16:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ftPRC7yvnIWJ9nZewziqLzoSvtp4M17TqP+53+kP3fI=;
 b=kdoYMMMs5JduGdz+ONh1Z5ncgnwFKu/4WNEtc8WRcYZXa05Py1qF3OWGwOPdZLyZu0
 /IRd+r1O7ZvG+raIPMK7PEL6Cpj99XGWfClfZBwL++hck+hOX2ZPaK8U/fv+fl4bvbWk
 C09AypBjzy0mnH/lEvdDYTZWyjN0/PeK941//fEK6oAXcROYHHMhfkTHwliKcyXBtxA7
 TfvZTUzGCX9YP1wSTBYyvhO3+JoNzMX0MekXgCdabPgL+teusAgw6vLXOfPgqYIqCLAf
 2fqzVilEW+4486nPK6I/tYcVcI6E+jmL80Wq9CFZtAdxnkgWrRYO6Ws35XuzvI7ZhlS4
 lNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ftPRC7yvnIWJ9nZewziqLzoSvtp4M17TqP+53+kP3fI=;
 b=JS5cy8kbN3dOrXEOhoo2rTDd4DQTDVlgwvfKRpvKoTtpjEQMkuMZXfH8Db91uEIaxZ
 ZbdTz/DhsnN6PNsp/PXNJGa3vgHgCvdbp4P1jTMzJ53Wze4AhrLfjszFGmQDTjJ35BWM
 Bs2lVVPd0p7bX7e00PCfuT7PqMpOqN2d3Z+LmAItJVoVbthLz2ZqwYLhIBKQYJCaxFUQ
 U4By71dKJb0rNrQNwq5lAlbvL8uz20St/m6eiO1p7HiFBNFrxLrnKAFrTWHRi49+5wNB
 c6FHhp1iJAU5ErDVfbGB7mg79Av5gStptmhqz+fmAS65+6nAfSNkUoX+qUfktC6ZKxq6
 n12g==
X-Gm-Message-State: AOAM532UfWRaCjtepiLC763J9xGnsLds4CH05wvacskfZr3Hpl7wjTDe
 NF6TxtXYLfgI9u6rc9o9PinU5g==
X-Google-Smtp-Source: ABdhPJwCLLJOHs7U+bj4f0N5gu6THBj9Fnd8xw1W5r0zvYVGXTZ/stRq3yEKWU2tS65foS5Cp0XEDg==
X-Received: by 2002:ac8:a03:: with SMTP id b3mr17765128qti.240.1593474568048; 
 Mon, 29 Jun 2020 16:49:28 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id n64sm1541076qke.77.2020.06.29.16.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:49:27 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/a6xx: hwcg tables in gpulist
Date: Mon, 29 Jun 2020 19:49:13 -0400
Message-Id: <20200629234921.3511-2-jonathan@marek.ca>
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 129 ++-------------------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 111 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   7 ++
 3 files changed, 127 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3397e5e00d1c..6cd79166a94e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -151,117 +151,6 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 	a6xx_flush(gpu, ring);
 }
 
-static const struct {
-	u32 offset;
-	u32 value;
-} a6xx_hwcg[] = {
-	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_SP1, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_SP2, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_SP3, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022220},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_SP1, 0x02022220},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_SP2, 0x02022220},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_SP3, 0x02022220},
-	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
-	{REG_A6XX_RBBM_CLOCK_DELAY_SP1, 0x00000080},
-	{REG_A6XX_RBBM_CLOCK_DELAY_SP2, 0x00000080},
-	{REG_A6XX_RBBM_CLOCK_DELAY_SP3, 0x00000080},
-	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
-	{REG_A6XX_RBBM_CLOCK_HYST_SP1, 0x0000f3cf},
-	{REG_A6XX_RBBM_CLOCK_HYST_SP2, 0x0000f3cf},
-	{REG_A6XX_RBBM_CLOCK_HYST_SP3, 0x0000f3cf},
-	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_TP1, 0x02222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_TP2, 0x02222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_TP3, 0x02222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_TP1, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_TP2, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_TP3, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL3_TP1, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL3_TP2, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL3_TP3, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
-	{REG_A6XX_RBBM_CLOCK_CNTL4_TP1, 0x00022222},
-	{REG_A6XX_RBBM_CLOCK_CNTL4_TP2, 0x00022222},
-	{REG_A6XX_RBBM_CLOCK_CNTL4_TP3, 0x00022222},
-	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST_TP1, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST_TP2, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST_TP3, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST2_TP1, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST2_TP2, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST2_TP3, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST3_TP1, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST3_TP2, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST3_TP3, 0x77777777},
-	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
-	{REG_A6XX_RBBM_CLOCK_HYST4_TP1, 0x00077777},
-	{REG_A6XX_RBBM_CLOCK_HYST4_TP2, 0x00077777},
-	{REG_A6XX_RBBM_CLOCK_HYST4_TP3, 0x00077777},
-	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY_TP1, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY_TP2, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY_TP3, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY2_TP1, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY2_TP2, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY2_TP3, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY3_TP1, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY3_TP2, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY3_TP3, 0x11111111},
-	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
-	{REG_A6XX_RBBM_CLOCK_DELAY4_TP1, 0x00011111},
-	{REG_A6XX_RBBM_CLOCK_DELAY4_TP2, 0x00011111},
-	{REG_A6XX_RBBM_CLOCK_DELAY4_TP3, 0x00011111},
-	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_UCHE, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL3_UCHE, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL4_UCHE, 0x00222222},
-	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
-	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
-	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_RB1, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_RB2, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_RB3, 0x22222222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_RB1, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_RB2, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_RB3, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
-	{REG_A6XX_RBBM_CLOCK_CNTL_CCU1, 0x00002220},
-	{REG_A6XX_RBBM_CLOCK_CNTL_CCU2, 0x00002220},
-	{REG_A6XX_RBBM_CLOCK_CNTL_CCU3, 0x00002220},
-	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
-	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU1, 0x00040f00},
-	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU2, 0x00040f00},
-	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU3, 0x00040f00},
-	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05022022},
-	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
-	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
-	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
-	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
-	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
-	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
-	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
-	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
-	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
-	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
-	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
-	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
-	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
-	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
-	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
-	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555}
-};
-
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -270,6 +159,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	unsigned int i;
 	u32 val;
 
+	if (!adreno_gpu->info->hwcg)
+		return;
+
 	val = gpu_read(gpu, REG_A6XX_RBBM_CLOCK_CNTL);
 
 	/* Don't re-program the registers if they are already correct */
@@ -279,9 +171,10 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	/* Disable SP clock before programming HWCG registers */
 	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
-	for (i = 0; i < ARRAY_SIZE(a6xx_hwcg); i++)
-		gpu_write(gpu, a6xx_hwcg[i].offset,
-			state ? a6xx_hwcg[i].value : 0);
+	for (i = 0; i < adreno_gpu->info->hwcg_count; i++) {
+		const struct adreno_reglist *reg = &adreno_gpu->info->hwcg[i];
+		gpu_write(gpu, reg->offset, state ? reg->value : 0);
+	}
 
 	/* Enable SP clock */
 	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
@@ -437,12 +330,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
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
index 7732f03d9e3a..f5f40bc3c113 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -7,6 +7,7 @@
  */
 
 #include "adreno_gpu.h"
+#include "a6xx.xml.h"
 
 #define ANY_ID 0xff
 
@@ -14,6 +15,114 @@ bool hang_debug = false;
 MODULE_PARM_DESC(hang_debug, "Dump registers when hang is detected (can be slow!)");
 module_param_named(hang_debug, hang_debug, bool, 0600);
 
+static const struct adreno_reglist a630_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP1, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP2, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP3, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022220},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP1, 0x02022220},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP2, 0x02022220},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP3, 0x02022220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP1, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP2, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP3, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP1, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP2, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP3, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP1, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP2, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP3, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP1, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP2, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP3, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP1, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP2, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP3, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP1, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP2, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP3, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP1, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP2, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP3, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP1, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP2, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP3, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP1, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP2, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP3, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP1, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP2, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP3, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP1, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP2, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP3, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP1, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP2, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP3, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP1, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP2, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP3, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP1, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP2, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP3, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_UCHE, 0x00222222},
+	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
+	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB1, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB2, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB3, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB1, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB2, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB3, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU1, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU2, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU3, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU1, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU2, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU3, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05022022},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
+	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
+	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555}
+};
+
 static const struct adreno_info gpulist[] = {
 	{
 		.rev   = ADRENO_REV(2, 0, 0, 0),
@@ -200,6 +309,8 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a630_zap.mdt",
+		.hwcg = a630_hwcg,
+		.hwcg_count = ARRAY_SIZE(a630_hwcg),
 	}, {
 		.rev = ADRENO_REV(6, 4, 0, ANY_ID),
 		.revn = 640,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2f5d2c3acc3a..316a4a327c61 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -68,6 +68,11 @@ struct adreno_gpu_funcs {
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 };
 
+struct adreno_reglist {
+	u32 offset;
+	u32 value;
+};
+
 struct adreno_info {
 	struct adreno_rev rev;
 	uint32_t revn;
@@ -78,6 +83,8 @@ struct adreno_info {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	const char *zapfw;
 	u32 inactive_period;
+	const struct adreno_reglist *hwcg;
+	u32 hwcg_count;
 };
 
 const struct adreno_info *adreno_info(struct adreno_rev rev);
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
