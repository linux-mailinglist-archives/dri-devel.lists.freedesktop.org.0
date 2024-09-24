Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF674984498
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C413D10E885;
	Tue, 24 Sep 2024 11:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L+6PhhQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313AA10E6D9;
 Tue, 24 Sep 2024 11:30:46 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so201219966b.0; 
 Tue, 24 Sep 2024 04:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727177444; x=1727782244; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DOKXSutIlfOVDg0zXz9VdQ+hEZL/0dYJxHmN2LSZob8=;
 b=L+6PhhQzoSsHeLsNX0JmQqZWJriv060OEAVWquWBwKlHV716ytYVemyHQPp0PEksbz
 5G0kkqcbkfF7C1QBdEyTiYxUuz2NGxM6leNZ4aNTmGCgIg2lf2ltvuAiwDrAaTCR8Wu0
 dxV7EEG0iQy4LGkSe6pgmQzQGbae31UofaPc1A28WBkOVgWutjX4VOrdxtzf1yogmztZ
 FNCkQgeBYALmXX92Cos4VeMcl62xFWrhIafvU9UUImCx5ainxmbfPNX0gIKF58BI+Do7
 UHYmHRvj6rPGcustyCW/jcRuUyJ0Ru2/1vmlDQgtn5wWD+1Th2FalZYxaWKDgdgjGFPK
 766g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727177444; x=1727782244;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DOKXSutIlfOVDg0zXz9VdQ+hEZL/0dYJxHmN2LSZob8=;
 b=v9fquZ8OsXx9zgoNfWcs59saqi2hBHJbuvBZv9Du2Wxgf6AgAmL8HERQ7xhAtcVReD
 Qe0QrnH7FhfHSfq+u00MFngaQuWn/9cgqFYwE1NAzvA2sdjyX45U/DCLasp/CMqSeaCa
 VCfvPRPs2V/Z3tOrHvhb3T5zUZjt/dbLigXN2Lw3CfG8+bS51lZyjA7lwuxAPBh5Qo/b
 7lifGtKmcNYehUqgBf9bMP6dbxhIT78wbps9D0Sa1TPU+A7EXG4qf7fCi7rlLf2Xp8c8
 cGjMuO1KZs9DBIbCSaz55IxGYnjLLy3qxIlJ+7G70DltIGB20aGwJRcJrt8DdCTrDJ3Y
 glew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG0IYVBMNrKdqvcoeGfi9q0blYvIE3YVBgiDB8ofI3BQOnu3g1l1Z+UtPd8Awvtb2ozONwhue7FHhf@lists.freedesktop.org,
 AJvYcCWfllFzrEbUR3Yyx8PuT8Lt0rLjCG3koG1tl7jcyuGd92NUxqxUf/o1jMrPOyOI/U71td6vE+aQAYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFqvVxxL7Knkg7//XijvT51jDnV9GwHbg9lUu08ayFaiUbMhEy
 IE244lwgVR2WBdfXCvzDAZrxvY2XjklcrqI+qajrOOWuqU0gxUqt
X-Google-Smtp-Source: AGHT+IGqRXoyIYAzXzwS+0rRoDSY26E+w04seke3Hd4luX3c4gyYDZU47N2cZwYzSfmtShZy70yqnw==
X-Received: by 2002:a17:907:3e98:b0:a7a:8284:c8d6 with SMTP id
 a640c23a62f3a-a92d55a9ff0mr295162766b.24.1727177444379; 
 Tue, 24 Sep 2024 04:30:44 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it.
 [87.7.171.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:30:44 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:38 +0200
Subject: [PATCH v5 03/11] drm/msm: Add a `preempt_record_size` field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-3-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
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
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=2436;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=jU1AlYtknaCE51ZnM/HBAvqUX6+tTJwfzHBOTp368BQ=;
 b=WB9NJcsEG+aJ5FO2zki7u9MZuqw2lELiKDiAM1IPKxx+CQqjJtzKcux5/K/di0l9hjtsHHVNz
 6HCYWYZh8k8CyxlzrUzG+IxUyXVt7WgmXkldthAtQ6ynqJLp7Ai7WZc
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

Adds a field to `adreno_info` to store the GPU specific preempt record
size.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506ea2f367ff0282a73fdd1122f2526..316f23ca91671d973797f2a5b69344f376707325 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1190,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 2860 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1209,6 +1210,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7020100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1227,6 +1229,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7050001,
 		},
 		.address_space_size = SZ_256G,
+		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,
@@ -1245,6 +1248,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7090100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 3572 * SZ_1K,
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1ab523a163a00b333a85b099e9eb9209e6a2e646..6b1888280a83e6288c4b071733d5d6097afe3a99 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -111,6 +111,7 @@ struct adreno_info {
 	 * {SHRT_MAX, 0} sentinal.
 	 */
 	struct adreno_speedbin *speedbins;
+	u64 preempt_record_size;
 };
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }

-- 
2.46.1

