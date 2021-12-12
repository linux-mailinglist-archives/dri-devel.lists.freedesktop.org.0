Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A7471B9D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 17:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C316410E7C6;
	Sun, 12 Dec 2021 16:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B434310E5F1;
 Sun, 12 Dec 2021 16:39:25 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id p8so20580155ljo.5;
 Sun, 12 Dec 2021 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I/KGHR66/uoO7zyvDC3r34YM2SXZEMEA1Z2R9AMuiVI=;
 b=SpXhfGTNVDWxv1L8OBD3nfxBRI+YaGfP8LLKHWfyfHcLNPyY2jNM8AQel/C81KzzVk
 6UQNc/kXX99KIwigiJRruiCTi0d6/ff+olw+Gf5zvzoW/gcqdxZujH8b9McTxgOCrb39
 uUFc9eLHR2ZMr8zEgukfb9Ma1tEdY8NF2UI8pM9Y8Zx16XonQpeSZPpK/XB4uAhLuuTd
 /hFnHL+HgOt2Q5XhvcMtbuQUlDPJMr5Z1wA533BbZl/xqhkbj2IAvB28h8m+uh2knAa5
 wHGwKVuRfNek4IutOWAJBVxwMK9lxY9xt8phoY4O4ZlSeGkrj8lnzD6zNc+VXIM1BlQc
 dHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I/KGHR66/uoO7zyvDC3r34YM2SXZEMEA1Z2R9AMuiVI=;
 b=Il5BXhGUVq6GpoZsLxpmdde40fm3tqyqHVW/u3ZChUpp8l/DnYETFUrJIk9ZxS/OzM
 6CyGQInpre5oJ4qxukl8X0rNHrO65GQxy9QmlGZWA5QaaoTHRs/8/5H38ZdJHfUerYIV
 CutADndQgjvxtHhLPx3CUwMP/8aTHjVMoO7whWrU+on3fAWiuP44uibVDR7R4cuavx5z
 vFHObMN0A2+qr+IVY/CVUQHY8U8L4awFYl7WraYBvHHi8HEoSXxF21T5azXIWJh9HmdC
 nQFRB/wUX4anpqQ3xgQwkMbGg4blxczbk9dQCBRiusOVjQZUi1ocjMSUJoN/qpoaexaQ
 JtlA==
X-Gm-Message-State: AOAM532OkIdnh3LV5/OuPltKjmHvv7ZSzhSvvHSjePaOpx4TcoEgekNo
 riKVewLg6b+qVmOwS65hwNL/saIeD0Ah1lSW
X-Google-Smtp-Source: ABdhPJzTQAArmKZ/OQ/icHIFWtYpG6BLP248muVMqgvUkMc49Bwo4DvEWRik66fHDavEdrW3MQtbcg==
X-Received: by 2002:a2e:a806:: with SMTP id l6mr25003083ljq.126.1639327164088; 
 Sun, 12 Dec 2021 08:39:24 -0800 (PST)
Received: from localhost.localdomain (public-nat-10.vpngate.v4.open.ad.jp.
 [219.100.37.242])
 by smtp.gmail.com with ESMTPSA id u7sm1110936lja.58.2021.12.12.08.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 08:39:23 -0800 (PST)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH v2 1/2] drm/msm/a5xx: Add support for Adreno 506 GPU
Date: Sun, 12 Dec 2021 16:03:16 +0000
Message-Id: <20211212160333.980343-1-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This GPU is found on SoCs such as MSM8953 (650 MHz), SDM450 (600 MHz),
SDM632 (725 MHz).

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
Changes since v1:
- don't change behaviour for other GPU revisions
- also setup CP_PROTECT for SMMU
- correct formatting
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 39 +++++++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 18 ++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++
 3 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 5e2750eb3810..894881d273b8 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -441,7 +441,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	const struct adreno_five_hwcg_regs *regs;
 	unsigned int i, sz;
 
-	if (adreno_is_a508(adreno_gpu)) {
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu)) {
 		regs = a50x_hwcg;
 		sz = ARRAY_SIZE(a50x_hwcg);
 	} else if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu)) {
@@ -485,7 +485,7 @@ static int a5xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000000);
 
 	/* Specify workarounds for various microcode issues */
-	if (adreno_is_a530(adreno_gpu)) {
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
 		/* Workaround for token end syncs
 		 * Force a WFI after every direct-render 3D mode draw and every
 		 * 2D mode 3 draw
@@ -620,8 +620,16 @@ static int a5xx_ucode_init(struct msm_gpu *gpu)
 
 static int a5xx_zap_shader_resume(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int ret;
 
+	/*
+	 * Adreno 506 have CPZ Retention feature and doesn't require
+	 * to resume zap shader
+	 */
+	if (adreno_is_a506(adreno_gpu))
+		return 0;
+
 	ret = qcom_scm_set_remote_state(SCM_GPU_ZAP_SHADER_RESUME, GPU_PAS_ID);
 	if (ret)
 		DRM_ERROR("%s: zap-shader resume failed: %d\n",
@@ -733,9 +741,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		0x00100000 + adreno_gpu->gmem - 1);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
-	if (adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu)) {
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
+	    adreno_is_a510(adreno_gpu)) {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x20);
-		if (adreno_is_a508(adreno_gpu))
+		if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu))
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
 		else
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
@@ -751,7 +760,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
 	}
 
-	if (adreno_is_a508(adreno_gpu))
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
 			  (0x100 << 11 | 0x100 << 22));
 	else if (adreno_is_a509(adreno_gpu) || adreno_is_a510(adreno_gpu) ||
@@ -769,8 +778,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	 * Disable the RB sampler datapath DP2 clock gating optimization
 	 * for 1-SP GPUs, as it is enabled by default.
 	 */
-	if (adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
-	    adreno_is_a512(adreno_gpu))
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
+	    adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu))
 		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
 
 	/* Disable UCHE global filter as SP can invalidate/flush independently */
@@ -851,9 +860,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* UCHE */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
 
-	if (adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
-	    adreno_is_a510(adreno_gpu) || adreno_is_a512(adreno_gpu) ||
-	    adreno_is_a530(adreno_gpu))
+	if (adreno_is_a506(adreno_gou) || adreno_is_a508(adreno_gpu) ||
+	    adreno_is_a509(adreno_gpu) || adreno_is_a510(adreno_gpu) ||
+	    adreno_is_a512(adreno_gpu) || adreno_is_a530(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_CP_PROTECT(17),
 			ADRENO_PROTECT_RW(0x10000, 0x8000));
 
@@ -895,8 +904,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	if (!(adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
-	      adreno_is_a510(adreno_gpu) || adreno_is_a512(adreno_gpu)))
+	if (adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))
 		a5xx_gpmu_ucode_init(gpu);
 
 	ret = a5xx_ucode_init(gpu);
@@ -1338,7 +1346,7 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	/* Adreno 508, 509, 510, 512 needs manual RBBM sus/res control */
+	/* Adreno 506, 508, 509, 510, 512 needs manual RBBM sus/res control */
 	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))) {
 		/* Halt the sp_input_clk at HM level */
 		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0x00000055);
@@ -1381,8 +1389,9 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	u32 mask = 0xf;
 	int i, ret;
 
-	/* A508, A510 have 3 XIN ports in VBIF */
-	if (adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu))
+	/* A506, A508, A510 have 3 XIN ports in VBIF */
+	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
+	    adreno_is_a510(adreno_gpu))
 		mask = 0x7;
 
 	/* Clear the VBIF pipe before shutting down */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 2a6ce76656aa..eada4de8b46e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -131,6 +131,24 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
+	}, {
+		.rev   = ADRENO_REV(5, 0, 6, ANY_ID),
+		.revn = 506,
+		.name = "A506",
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_128K + SZ_8K),
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
+		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
+			  ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
+		.zapfw = "a506_zap.mdt",
 	}, {
 		.rev   = ADRENO_REV(5, 0, 8, ANY_ID),
 		.revn = 508,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 225c277a6223..427a96d81280 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -201,6 +201,11 @@ static inline int adreno_is_a430(struct adreno_gpu *gpu)
        return gpu->revn == 430;
 }
 
+static inline int adreno_is_a506(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 506;
+}
+
 static inline int adreno_is_a508(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 508;
-- 
2.33.1

