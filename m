Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D87A98A60A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587C710E510;
	Mon, 30 Sep 2024 13:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a9hxcfW6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3851F10E50A;
 Mon, 30 Sep 2024 13:52:50 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c883459b19so3727555a12.2; 
 Mon, 30 Sep 2024 06:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727704368; x=1728309168; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/V/6a2TW5ipcM35DEEW7Cwm4LM4Qc3jfg/uzlisxQGI=;
 b=a9hxcfW6t303WCMMPdckDOozgQ2qA4EuwfBfVX/oXEr78UPWEmrqWoPTQjoph8QNnZ
 XIY28ctQcA/iCtaihIjsp8OzydxdJ0MtHk9sqglGaDLwku6boa7L6+Bk5FsHww/yR0yf
 /LMOSQLaMDR0wubdCPgnels9ufQIt/AiEIf7FBZ1ZtpJ9CG6VUb9FptV2GQ0PU7OE6kG
 T6CtcWwDVoVQz/edwLjqTMv6bt3j2eIa1xCqqWhTW4oNBRPIPzYchMeYqU6CSvP09wOQ
 ysLbfkyHRugN5WEvJboQ+rQHtN6kJCllo4/JIE+fW6//EEYtr339gxUaLB8/HtBF3U6j
 sUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727704368; x=1728309168;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/V/6a2TW5ipcM35DEEW7Cwm4LM4Qc3jfg/uzlisxQGI=;
 b=lxrfeE/POg3T127ykCsm1/6BVGG54ioT12hp0FQpWA+1uhsmn7jKm6TTSY66OX+UUl
 sCSgeflzj0a2ukit2aIjeHUD+qATrMwLoYaso1d/iSClygbzOMkA5bQOCp+jZko/jb54
 3XkybKg7AUeQkMuI03aqWLiRr6Xn975qFiizCxEFLcNPgmpA6PwLKHbGLvbwZq2cos3V
 OpqvkYoctHmDbMlSXgyfG/1xWtQ22xK0X83RCbo6NAsykP0mmMMQY6qDC4Y7zFzFRXHD
 82NhsDMiAWpCLRcOLG+RSNLLPt6SFhcz7PbxNzMdZ5UsxQKsEeNNRDdvenQnF3CCUaxP
 GhBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8u3Zz1ab3KWOvSNlIapBRjxwhhJYNmquFThr610tXWBCRclq816z5+kM7o317ICvJj31SHZl7lF5Y@lists.freedesktop.org,
 AJvYcCW8jUoTbDaDdZvqjcypNREeFNy6aQJSlMVyudU0zrdAygM/h8bUjgf1GPFLlHsjCtu/ZrQ18AvGgig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBmFGXuQeBvOImr9tc4CkIzJ9XbYrLB98k0OhZobihCsF5An3R
 0lWWJ0tFcl9c2cWlCqSczt7HkR0hnNmXJJwbowQeq3xsA0hljP4E
X-Google-Smtp-Source: AGHT+IH2aChTJSUVF3XESy19JSmQKMiEKzpArEt+3XVCFugQyJajyfAyptI74iVTiYJ0M9Lxu6TJkQ==
X-Received: by 2002:a05:6402:34d6:b0:5c8:8668:e564 with SMTP id
 4fb4d7f45d1cf-5c88668e6ccmr7847854a12.30.1727704368209; 
 Mon, 30 Sep 2024 06:52:48 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it.
 [95.250.55.22]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:52:47 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:40 +0200
Subject: [PATCH v7 05/12] drm/msm/a6xx: Add a pwrup_list field to a6xx_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-5-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=4169;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=7OY9AiaQ19Ia+PqqCV6YZvq+XDpZw+wy+7bMWhQ2Bvs=;
 b=Z9vJl6mXetFLxPDYS9eNlCYXOWz7jjXIDUi6wzwP7IWRkBvq8tuFHo0j6a61bkHl0fKUQ8rcx
 sJ+3DQpAAd3B+WaLXO8oqY7Q2XRbkH4E3wsnKpPCg0RzHqjHK8krxjK
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

