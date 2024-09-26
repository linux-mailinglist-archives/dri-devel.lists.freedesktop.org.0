Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38628987A74
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 23:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2CE10EBE8;
	Thu, 26 Sep 2024 21:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PN1a+pnB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BBB10EBDB;
 Thu, 26 Sep 2024 21:17:02 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso203084566b.3; 
 Thu, 26 Sep 2024 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727385420; x=1727990220; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DOKXSutIlfOVDg0zXz9VdQ+hEZL/0dYJxHmN2LSZob8=;
 b=PN1a+pnB9W0X/lWllLiU7wyLN4b+/5sqeDzmFwdlJUAJC59pPo/xKRjs1DDpfjGB1i
 KXNW5Dn4x+qmc6yCKEzg8cq6o2tLNGGZjtI6N85WRXp8dLMwSt1SlDHhW+myHAooFfbn
 F2g8ncv8hLpPollOIqAubpmv/VS4w4mMG4XRr6IyRg9lNhi/TUy3Pxq54zt5nnCxmog/
 Yq/fzvdY2F7jAVyRELQhCkuMwGBU0vmwwp4mn53iFPvOfee6UVyuBKbWg7t6DbQ6zFRW
 ktKGMm5VZQQ3IKTrn8sP+qmAcqRglTefeKan1rhY+VuUOX58pLNZ6TWolNiQfTZDu3uG
 gUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727385420; x=1727990220;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DOKXSutIlfOVDg0zXz9VdQ+hEZL/0dYJxHmN2LSZob8=;
 b=ExQZMz/SsTKwWzre/ipXRY9JJWnxmPh6IAD+ZarmjPy1pelcOkW13RfDYK5EDmFevP
 GW2er8eiD+2O56TldiZWyeaZW/7ZCNpYJ8g2SzxMeY0eemYFpKGIsY0NLRsH8Yf/iLLZ
 Xz/cOWjqPRv+Uzsg3QvcvVv9+ciOkwDCQKhfM4RWI8V36cyUF1qWbMbqC4bzP+QuEFpP
 +4BmxquPCXpy78/uqWT5tzGGH2Wya+rkYCSRYLRtDI8wq4jNnG4x4ZcPiu75e35H1WnJ
 LaWUGxabOkUJq++uLGxxuUncIvo6tEdkc5uDO07UNC1o/t8x4A4fB/KnP0m+kKEPqabJ
 3x8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUljOEY7CZ+xML383RnHZ9GS638Rz93wt2G+SID2Ou540RJmnw2KD+N+nNPQSpvAMtDq4nGaxKif54=@lists.freedesktop.org,
 AJvYcCWNCXJ78RPziasa+oLhJg5h/o+U8D++U4H5rhmCs+dAuM+zyObigNK1U+YOcQcIReIPmfVEVpZtZ4wg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSrFVnsODPNzMsfOKl79G+mrfFadKf6Ka7pxFHxvNgzZdtj5S/
 7v18qe+wHWfFfDSg3xf2PMeQEjf0zQYj4tt8ya7ametJMxCSLisa
X-Google-Smtp-Source: AGHT+IFpKhDuZfYNy68feNhUvFGsTiD9A1E0EjHrjHTO56CLgr9u2M7q7/m2r0kwzAX4pNRGTFBuPA==
X-Received: by 2002:a17:907:318d:b0:a8d:7210:e28c with SMTP id
 a640c23a62f3a-a93c490e44bmr65654266b.20.1727385420244; 
 Thu, 26 Sep 2024 14:17:00 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 14:16:59 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:45 +0200
Subject: [PATCH v6 03/11] drm/msm: Add a `preempt_record_size` field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-3-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=2436;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=jU1AlYtknaCE51ZnM/HBAvqUX6+tTJwfzHBOTp368BQ=;
 b=yJILcxKA4G5tYzDD0/u1d3UwGStbNN+/zKQr32KmtRB9+8cDUucVoMKaSentxlvR0akuxpVKH
 fAhHl/J0BOzBbrX1eDNL6GnK8K7ero/qKTz84/h+m0uY5z77PxqAfOd
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

