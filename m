Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8AC98F3C7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4C710E8BC;
	Thu,  3 Oct 2024 16:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WP81qV9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595B010E8AA;
 Thu,  3 Oct 2024 16:13:07 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5c876ed9c93so1374985a12.2; 
 Thu, 03 Oct 2024 09:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971986; x=1728576786; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/V/6a2TW5ipcM35DEEW7Cwm4LM4Qc3jfg/uzlisxQGI=;
 b=WP81qV9h6fG0hSZODy2ZAVPOPIZ116OczqtMRhhtFPfCmr2Zwd1KM5c2UC62TAbAAA
 Oaubvi8rjkblMCO+LlgtbxM2jmJMb4ZYQaSMDTlz09GAE5tx9Dr0f7cJJw9NvZsI4sLn
 ALyLDL5h/HWMHLkXsyTvghjgD5cpOto625oa8Le7SSbCVTCPDm6vshSRKzlOnY4eYyq6
 SIowhzyT6o4Nn7igEJ53QfUO7KAj5hnBG50e+u5mqG38811d6+VqNyTbeGFduegitYMI
 ov9cmclHFGBgLWwtnuw3i7JSANi9vYRCfeUcGV1ajqGD3I6iUDyJQ8ytob/XqQGjV0PB
 WJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971986; x=1728576786;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/V/6a2TW5ipcM35DEEW7Cwm4LM4Qc3jfg/uzlisxQGI=;
 b=H4fiBf5GcPKB2lB5vJa9Kbd8aP4z769UnDPzZvtfEdlM6jG/cLHhnOOcKjjSa2DyWz
 0h54Iok8YKUK8M+4eikf+jlNZzW3H47E1erv7DpEfkrcsc/CVJNxDfC1KR6nsBvxJQ68
 Ac2KmpF836eKxlRTzwFPFA3LiXe+xPEAAEo6xBPlRrSswxs6J8fuWKPlkbWZHK4r+aTM
 vSrH7Amnh1joexz5w16GjFgAWgkdmM27k5SXdvAeeJQAMYTWohWwXMMzItgZDzc9JBIR
 SBsa62O3vJ1bqEmE++cBqyvW71uz4jzWGKjukMAz0gyQ5pjMrHzeVEuBYpEjaHHIdOnG
 WvgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX10Yq6bLCoCFNIu6kiXc+X9DWlXWu3mtU5mpQYovrBT1pej+B5oqSdn9GLl9ujxS2FajDesxzMxRc=@lists.freedesktop.org,
 AJvYcCXBIDDGITHqwzeV11bUE1MT6UfRzGz01jRKxVowtxpDAB4zPWuf+KUEs/40cik9Qo9W+uSGTJJ3FYdc@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx13BweMfe+V8Bzy7qKG9aQYv5rib55+5LdroBOo04T4l4tK3q
 /tMZZAL8fp6CebEs1BnTXny+PdA7dHmb/11+gcVAxwNsXXjbGoc5
X-Google-Smtp-Source: AGHT+IGDWP3v0Di8kvxDzdey+AWcUqDj4gsqUQxdxWrG+YC8QFPIY1Q5HcSXjl682jM68aq3k1TFHA==
X-Received: by 2002:a17:907:2d88:b0:a86:83f8:f5a2 with SMTP id
 a640c23a62f3a-a98f823cbc9mr655096566b.19.1727971985501; 
 Thu, 03 Oct 2024 09:13:05 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:13:05 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:54 +0200
Subject: [PATCH v8 05/12] drm/msm/a6xx: Add a pwrup_list field to a6xx_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-5-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=4169;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=7OY9AiaQ19Ia+PqqCV6YZvq+XDpZw+wy+7bMWhQ2Bvs=;
 b=ZXywTzS1ODfgZc7HTXviCdSKY2foHZWt7a3poRCQsi7lB7WZIDdCZtCtaffDCzVRd8KYC1Euc
 CxBP4/NwGrMCqvKyp2m0N26oXTsRQwGC+C2sPxuUrCW7Yw/cxNmwP65
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
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

Add a field to contain the pwup_reglist needed for preemption.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  2 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 316f23ca91671d973797f2a5b69344f376707325..e4d271fa89cc66f188be04206e267fabd83cca83 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1150,6 +1150,28 @@ static const u32 a730_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a730_protect, 48);
 
+static const uint32_t a7xx_pwrup_reglist_regs[] = {
+	REG_A6XX_UCHE_TRAP_BASE,
+	REG_A6XX_UCHE_TRAP_BASE + 1,
+	REG_A6XX_UCHE_WRITE_THRU_BASE,
+	REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
+	REG_A6XX_UCHE_GMEM_RANGE_MIN,
+	REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
+	REG_A6XX_UCHE_GMEM_RANGE_MAX,
+	REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
+	REG_A6XX_UCHE_CACHE_WAYS,
+	REG_A6XX_UCHE_MODE_CNTL,
+	REG_A6XX_RB_NC_MODE_CNTL,
+	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
+	REG_A7XX_GRAS_NC_MODE_CNTL,
+	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE,
+	REG_A6XX_UCHE_GBIF_GX_CONFIG,
+	REG_A6XX_UCHE_CLIENT_PF,
+	REG_A6XX_TPL1_DBG_ECO_CNTL1,
+};
+
+DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
+
 static const struct adreno_info a7xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
@@ -1188,6 +1210,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 2860 * SZ_1K,
@@ -1207,6 +1230,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7020100,
 		},
 		.address_space_size = SZ_16G,
@@ -1226,6 +1250,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7050001,
 		},
 		.address_space_size = SZ_256G,
@@ -1245,6 +1270,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7090100,
 		},
 		.address_space_size = SZ_16G,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e3e5c53ae8af2cc59a21160f05c59fd125cb94b1..2f5f307ac3b6845197b06ca3754abc88d698007c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -17,10 +17,12 @@ extern bool hang_debug;
  *
  * @hwcg: hw clock gating register sequence
  * @protect: CP_PROTECT settings
+ * @pwrup_reglist pwrup reglist for preemption
  */
 struct a6xx_info {
 	const struct adreno_reglist *hwcg;
 	const struct adreno_protect *protect;
+	const struct adreno_reglist_list *pwrup_reglist;
 	u32 gmu_chipid;
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6b1888280a83e6288c4b071733d5d6097afe3a99..58c63d0fbbff9818393fc62ee3cf2703365bec23 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -157,6 +157,19 @@ static const struct adreno_protect name = {		\
 	.count_max = __count_max,			\
 };
 
+struct adreno_reglist_list {
+	/** @reg: List of register **/
+	const u32 *regs;
+	/** @count: Number of registers in the list **/
+	u32 count;
+};
+
+#define DECLARE_ADRENO_REGLIST_LIST(name)	\
+static const struct adreno_reglist_list name = {		\
+	.regs = name ## _regs,				\
+	.count = ARRAY_SIZE(name ## _regs),		\
+};
+
 struct adreno_gpu {
 	struct msm_gpu base;
 	const struct adreno_info *info;

-- 
2.46.1

