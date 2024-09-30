Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9198A5F7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C697C10E505;
	Mon, 30 Sep 2024 13:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O+o2hFjb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A6C10E504;
 Mon, 30 Sep 2024 13:52:46 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5c721803a89so5750586a12.1; 
 Mon, 30 Sep 2024 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727704365; x=1728309165; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wyb3geUIdOaiHlo8mwWpCyJKar3stgK5wmtiUF5Pomg=;
 b=O+o2hFjbXTxSMT9hufFnjlInph08S2DiA2JgoqlEm+g8S3hJo308WnQ0hdeeGSwGP4
 M1YXHVAmmQRy3WZFWS/UkYtodNY/WXlABUzx3xnRjeBBjADLwwCaKPbdPezxvxWdGYei
 3xqyd8zkkDIhynIEqBc7UNOPZURdG/wV0mCm3xmpS6WpETBf/Y5/UckDyZ2b9gknd4UQ
 ym+6tfOarmztXoDPYqLW29YED/6MVGmyFMSIm2PFxPneyVaNwkm06GUwVqzYe8ic2Nki
 4Uhrc5WZ/qO4maSew7uCv5wQEuaFnP0cpoHv4wPEtViLP7cKTIgNFylSj7A7MkQyafy4
 M82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727704365; x=1728309165;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wyb3geUIdOaiHlo8mwWpCyJKar3stgK5wmtiUF5Pomg=;
 b=mjjfy8fM3L8FgHDGzvOq9vKW7hRw1maRHf+mjkKFXLfBcSsbLXAX3jni2gAqdD0D0o
 mYgTck6lekfAif8VPHNRKCjHbbHAK+Cmldp4rznsuW2IaXL4CMXkLLuRVLNIB1o53MB7
 V/KLzSWgF0XORCyeUP+7AoBPmlt+eRe98A1tc22/iRdbo9fFDKVwJ1GTtSCy6PDoGpxM
 fHpwE3WbnXqQULG6NzM6QkjucK/QWIqyh9accRAScuQOK6f7RquZ74PIQWo1qEVs08Gg
 Tz7hePq50UtsoABaKsrxVpNk0T6cVtA53nWuO5KXpcuEslMM7OV2P5HazHs+vW8LMMM8
 10vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJlWmLyw/JLnWh6aKe845zTe8KKzyyL3oXzobRSFsQ/GHXhPyDd6TjrzOIs+M1hKhYnKHxDXJuyaM=@lists.freedesktop.org,
 AJvYcCWsES4D6gSp+R+Go3O1gq7mZ597gK/Q66doe7YbIIJ8PcxWyBoxAVCtTmwVK3zcyJYzARbtGCAqL020@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1phrnx4k13UZ0CRgfPX+253Jq4u7EIeca9NewrJnnztO4nUBM
 urmx1tptPA6w6nGjyBcYo/8urEkxdi+F3TpkvOWjqeHayMHpHit+
X-Google-Smtp-Source: AGHT+IGTeHDATKcDuVJkAlYhRG53MODRQ/p+tRk29qkIyg/dqn9ovQDdtmiJ5QOZiPHQDuGxMOcuvA==
X-Received: by 2002:a05:6402:2425:b0:5c7:227f:3a5b with SMTP id
 4fb4d7f45d1cf-5c8826035e5mr12035835a12.26.1727704365016; 
 Mon, 30 Sep 2024 06:52:45 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it.
 [95.250.55.22]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:52:44 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:38 +0200
Subject: [PATCH v7 03/12] drm/msm: Add a `preempt_record_size` field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-3-47803c7a5a64@gmail.com>
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
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=2480;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=mw98QEzBIwYx44vG8hfTrLa/RurlCEDImHR+oHkKWF4=;
 b=og/agVTW9E09HAuOJIvQI1XqSludyePluz9FVZDA7lFv7IrrkDYKFjq9owaaLYx2jnHfnFAc8
 SjZSH6hyj3YC15gvuFH09l6O9vT7KbmtLfnTyRh+zUqIa4LVk8IWu5d
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
Tested-by: Rob Clark <robdclark@gmail.com>
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

