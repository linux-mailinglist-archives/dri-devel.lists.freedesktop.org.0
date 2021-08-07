Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B13E3649
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 18:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F81989CDE;
	Sat,  7 Aug 2021 16:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA5589CDE;
 Sat,  7 Aug 2021 16:26:06 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id mt6so21315220pjb.1;
 Sat, 07 Aug 2021 09:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KK6pClbRoyb7NoLCLxdt7TZo5IqArGIaNgS9FD1UJck=;
 b=Jo7Z5SIQMndDQNZMfafxV3iHlM0HyuITIt3fo+N3zm85xbzvJysih0K3Ga+nv+wbbx
 9QKD9Pgx+BxNT6l6fz1xPjpEvyAqTUNUYkuXVRl799mqt/2z5CkC29bqlg8BBtl1kIo+
 hTh9KWekSDbXX0z3v9AvoO7lzdBO/1otyd+uh+Rp0EgEPaNCE90aOV/thgbe0xU9hWFk
 vcZ+fz4mExKhkkWw1Ox8+gPSciDvz/djzj3ia0aYVQk0h+ZbEXtj2iWpNziWc2qghuBd
 8ICFp/MHMCck6pb15cj80csk24/NnP3kK+bGnwrcsJ30DoBLRhNpjtOTMCfRS0OmUEKZ
 gJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KK6pClbRoyb7NoLCLxdt7TZo5IqArGIaNgS9FD1UJck=;
 b=TeX/7oEFZiHr0AIsV+77pH5gUqWhGB0qi5UuvHYEsvUJwBO5JoTjdu82Npx1uCQPn9
 VhboGClc/b2yMdzGMtQvIsGiw/eEk9jCObtz8BKmXOLBCV3NPTtMiuTiduxzXyMQ1UW/
 AuV0ys7K7vf54crO7uDXOkRu5YmgINijh5io89fSOCMg5E1+9GfrGyyzjL1ahGRisGkE
 oIdPlxO+i3VJqlQA/xpHUjgbtIwbOcw+UY2FRGIxapDgYcbZKXb24jc9KLGGYX1+WC90
 d43HSsOojluSoOV6rSpdiiakl6fWhLF+GFiLTJMTqaOI5RkA4JLLnmTHnn1Eyf7+nwBR
 svtg==
X-Gm-Message-State: AOAM532P+2a45t8+29KThnw4OtHOv4+XKZtERMYgGcCgAtJmNWleyhgI
 eDvJumy0QbCDdtVphWvl1G7li1DQtaaCoQ==
X-Google-Smtp-Source: ABdhPJyZpLLZHxalF+8THlswZkTPT3+hN7LYOH8rxbXjNvAupYVKZNmiTg7h801YxUdqBteLBG9jRg==
X-Received: by 2002:aa7:9891:0:b029:3c4:dab0:6379 with SMTP id
 r17-20020aa798910000b02903c4dab06379mr10289322pfl.12.1628353565007; 
 Sat, 07 Aug 2021 09:26:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id bv4sm2760097pjb.27.2021.08.07.09.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 09:26:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Eric Anholt <eric@anholt.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Add adreno_is_a640_family()
Date: Sat,  7 Aug 2021 09:30:11 -0700
Message-Id: <20210807163019.379003-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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

Combine adreno_is_a640() and adreno_is_a680().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  5 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 15 +++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  9 ++-------
 4 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index ab6b22264c2b..a7c58018959f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -521,8 +521,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
 		pdc_in_aop = true;
-	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu) ||
-		 adreno_is_a680(adreno_gpu))
+	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640_family(adreno_gpu))
 		pdc_address_offset = 0x30090;
 	else
 		pdc_address_offset = 0x30080;
@@ -1527,7 +1526,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			SZ_16M - SZ_16K, 0x04000);
 		if (ret)
 			goto err_memory;
-	} else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
+	} else if (adreno_is_a640_family(adreno_gpu)) {
 		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
 			SZ_256K - SZ_16K, 0x04000);
 		if (ret)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6ddd9010cc4b..be62f492538c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -683,7 +683,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
-	if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
+	if (adreno_is_a640_family(adreno_gpu))
 		amsbc = 1;
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
@@ -764,7 +764,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 	 * a660 targets have all the critical security fixes from the start
 	 */
 	if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
-	    adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
+	    adreno_is_a640_family(adreno_gpu)) {
 		/*
 		 * If the lowest nibble is 0xa that is an indication that this
 		 * microcode has been patched. The actual version is in dword
@@ -904,8 +904,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	a6xx_set_hwcg(gpu, true);
 
 	/* VBIF/GBIF start*/
-	if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
-	    adreno_is_a680(adreno_gpu)) {
+	if (adreno_is_a640_family(adreno_gpu) ||
+	    adreno_is_a650_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
@@ -943,8 +943,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
 	gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
 
-	if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
-	    adreno_is_a680(adreno_gpu))
+	if (adreno_is_a640_family(adreno_gpu) ||
+	    adreno_is_a650_family(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
 	else
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
@@ -961,8 +961,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	*/
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
-	else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu) ||
-			adreno_is_7c3(adreno_gpu))
+	else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 376d0d9809fa..d4c65bf0a1b7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -458,7 +458,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 
 	if (adreno_is_a618(adreno_gpu))
 		a618_build_bw_table(&msg);
-	else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
+	else if (adreno_is_a640_family(adreno_gpu))
 		a640_build_bw_table(&msg);
 	else if (adreno_is_a650(adreno_gpu))
 		a650_build_bw_table(&msg);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 899cca8fc68a..225c277a6223 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -241,9 +241,9 @@ static inline int adreno_is_a630(struct adreno_gpu *gpu)
        return gpu->revn == 630;
 }
 
-static inline int adreno_is_a640(struct adreno_gpu *gpu)
+static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 640;
+	return (gpu->revn == 640) || (gpu->revn == 680);
 }
 
 static inline int adreno_is_a650(struct adreno_gpu *gpu)
@@ -274,11 +274,6 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 	       adreno_is_a660_family(gpu);
 }
 
-static inline int adreno_is_a680(struct adreno_gpu *gpu)
-{
-       return gpu->revn == 680;
-}
-
 int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
-- 
2.31.1

