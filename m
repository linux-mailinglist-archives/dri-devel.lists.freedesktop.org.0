Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F49EC742
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528A110EAC0;
	Wed, 11 Dec 2024 08:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AuZR+s4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C99510EAB4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:30:05 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso68521755e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733905804; x=1734510604; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U86WDKdPrAsITfGPygHUha71OD7ZxDhxILD/leyKWik=;
 b=AuZR+s4TSC78OsNoop09DG6qnPallVQBNgHQK2y6XmQjd550PgsbVQhMl7czdySU9e
 hHxd54miNzq3gd7Q7rIPsP5W9P6GftGcqFd+pkM3JNBYZpdAdZT/MYGae9LvZb+6I3Xg
 MqkEA1TgvvRQTS7I2nw7puTlu444H9iWDfQYiDiHRdEydvax4hN0hjAlD4Rc/VnFcCrW
 SB84u+eM3wuWmEsv+BfuxK2uBGXQ6TM517jUuM3juyWka618OQjSy2SFVEh33HghhKSt
 o3w8x+WFosFNRlBRHIJqwUv4RG+mbqsdL6bPyjc/XLbDUQqq9xokrEgLsENFFxTOh4id
 M7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733905804; x=1734510604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U86WDKdPrAsITfGPygHUha71OD7ZxDhxILD/leyKWik=;
 b=U1rRiJKCXrdNtEveq3+ylEaGDNAS2Ek9VVZK3HenV8m+lI5X9UjBmqLQhLfT+IlH/d
 VWhR84NCLz7pSPbkA9Gu7aO4M+21ym5HXVWxEDo0I8jHUDKpMQdZkcklD3RIV0ad7gbI
 oHtE9u2V2l3Gj6JvhphGLNKTH0za5jEFbC2GFM2OHZkEdXDleqegpjZawDqV+ug45sPr
 sIa/lchJbWrw6X4fOOSPiD/7sXzQ5exGDf0TUrsbuxT6fD9QcwD7d81c3cy0y8ykifMW
 1v8Sdibaq5ft2RN31eRhMrbh3DjF/0RfJvXmZBSZt2judv7C+zNGPJoUnJfxV+fvBycM
 yanA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWEbJls4GT7DSsloeY8CB3eeVrobNutPct3tzVYGQnolIMVioyOVhhVlbyy+RdLbGxpezP0ysJ5Kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu+D2V3A8dlz/owJSJvzW6Ql1EIham3ygoxTJKW3J/pglGE90v
 C216LW8sfRLReo9+KKkONj/UoQKpGShLbkVgfTho8camRV2j3dBEXkf9L6OyGib1wLLFpywLZM2
 vsn4=
X-Gm-Gg: ASbGnctgo7E+LuajpClnSHsi/XwgQAvTfN66cEYVNG+ES9C2H5YlH40PmcG9owZl2hO
 mes+p8/p1OibvMAD+YC6SsLRQkPetuEbaj+yqaQl/DhgK0brb2AIz055GX4lCkFXQikDbo4OUoo
 4UyQ3IobnebjwpiPcbo1TJdNPOTp10+1dZTHsVzycjS5ojmX8h1EWW26xX9gDz/N33OKcw39riZ
 O3OC+yOVoPUgx9cu/MgpRuFoJQjkwdjPkG1zGNqp+lylmWkrQ68+3wRpCffQdQtmavD5lXffUw=
X-Google-Smtp-Source: AGHT+IGq09en0HnyDXiGn/DX/au6Q0EcVUymi4G25zrq3RQ0sx1AuF1JJDxDo+5X7J7HeWOENNonBA==
X-Received: by 2002:a05:6000:4403:b0:386:3864:5cf2 with SMTP id
 ffacd0b85a97d-3864ce96b0fmr795384f8f.19.1733905803964; 
 Wed, 11 Dec 2024 00:30:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:30:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:54 +0100
Subject: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=m1NcPOsMY9FCd05ub7OGALb9yrmOmV54oQAtHzEO7ck=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2Ei90pzqxk6DE5LSfYiHHw+v5iLh0rbkkQUMox
 R14N192JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNhAAKCRB33NvayMhJ0SASD/
 9Qb/vw3MzeW4uUPJENXlKpxSlje8+9uVBi8LPWqLER1gLjuXvV4l9w9ow8Ck/ay73L9LlhHw/kZ6ie
 /WHDSBkELDJ5yMSaQyOkH6ulm38ZhUx9Nq2UHYzEIhtRMsmzWWFrboGuWmmZKdlDcG7N9gh2Zjn8st
 /9mVTXVO0emv38Fd4vigI0Qqk1FSNV7tQ7EWceL4hD9AhS9zZKhNNIBuo4ONyGtvmQyB3JrfrNAvGj
 8haeGUqbyO8FmAKXH5x3yQ+1oYzc6LphnGt49wsb1OQRpvBOJX9lYhU5AABENTQf9AZXXuqH81VBCb
 qjNE/k0uZRxEXy061XNtVhIkMf3JBv4I+hfNfAYKZSdAgahatOKIB7s8H3K8cuQfbHPek8O9Jw24Q9
 MEXVAC03+LhMgBemFkQW/9jRBOhQAtgV9w/egVeckCCxAqO9ShdAJeauEPK0P8jfYEMy/4q+OWK41S
 VQstBDldm4CCrOXe+VNNHwe+YOXvzSQoNNkEz4mq0HW09Lka94fhMZGLNpw8QaAaYhB7d/4rsMqTuM
 xba+2uy+JcsQt+6ykAF14YpOsG1zrgYlmNvSCJw3thFNnL4LlD/QmfG/MGn7WouvbrXjBsyKrzbaIa
 SX9J94Ho4hjK99p35B+UnX+5jfhsLA4s14uRF5viLeDgdxUAXOPZzSTLjIxg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
along the Frequency and Power Domain level, until now we left the OPP
core scale the OPP bandwidth via the interconnect path.

In order to enable bandwidth voting via the GPU Management
Unit (GMU), when an opp is set by devfreq we also look for
the corresponding bandwidth index in the previously generated
bw_table and pass this value along the frequency index to the GMU.

The GMU also takes another vote called AB which is a 16bit quantized
value of the floor bandwidth against the maximum supported bandwidth.

The AB is calculated with a default 25% of the bandwidth like the
downstream implementation too inform the GMU firmware the minimal
quantity of bandwidth we require for this OPP.

Since we now vote for all resources via the GMU, setting the OPP
is no more needed, so we can completely skip calling
dev_pm_opp_set_opp() in this situation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
 4 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		       bool suspended)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 perf_index;
+	u32 bw_index = 0;
 	unsigned long gpu_freq;
 	int ret = 0;
 
@@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		if (gpu_freq == gmu->gpu_freqs[perf_index])
 			break;
 
+	/* If enabled, find the corresponding DDR bandwidth index */
+	if (info->bcms && gmu->nr_gpu_bws > 1) {
+		unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
+
+		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
+			if (bw == gmu->gpu_bw_table[bw_index])
+				break;
+		}
+
+		/* Vote AB as a fraction of the max bandwidth */
+		if (bw) {
+			u64 tmp;
+
+			/* For now, vote for 25% of the bandwidth */
+			tmp = bw * 25;
+			do_div(tmp, 100);
+
+			/*
+			 * The AB vote consists of a 16 bit wide quantized level
+			 * against the maximum supported bandwidth.
+			 * Quantization can be calculated as below:
+			 * vote = (bandwidth * 2^16) / max bandwidth
+			 */
+			tmp *= MAX_AB_VOTE;
+			do_div(tmp, gmu->gpu_bw_table[gmu->nr_gpu_bws - 1]);
+
+			bw_index |= AB_VOTE(clamp(tmp, 1, MAX_AB_VOTE));
+			bw_index |= AB_VOTE_ENABLE;
+		}
+	}
+
 	gmu->current_perf_index = perf_index;
 	gmu->freq = gmu->gpu_freqs[perf_index];
 
@@ -140,8 +173,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		return;
 
 	if (!gmu->legacy) {
-		a6xx_hfi_set_freq(gmu, perf_index);
-		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
+		a6xx_hfi_set_freq(gmu, perf_index, bw_index);
+		/* With Bandwidth voting, we now vote for all resources, so skip OPP set */
+		if (!bw_index)
+			dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 2062a2be224768c1937d7768f7b8439920e9e127..0c888b326cfb485400118f3601fa5f1949b03374 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -209,7 +209,7 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu);
 int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state);
 void a6xx_hfi_stop(struct a6xx_gmu *gmu);
 int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu);
-int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
+int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, u32 perf_index, u32 bw_index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 995526620d678cd05020315f771213e4a6943bec..0989aee3dd2cf9bc3405c3b25a595c22e6f06387 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -772,13 +772,13 @@ static int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
 		sizeof(msg), NULL, 0);
 }
 
-int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index)
+int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, u32 freq_index, u32 bw_index)
 {
 	struct a6xx_hfi_gx_bw_perf_vote_cmd msg = { 0 };
 
 	msg.ack_type = 1; /* blocking */
-	msg.freq = index;
-	msg.bw = 0; /* TODO: bus scaling */
+	msg.freq = freq_index;
+	msg.bw = bw_index;
 
 	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_GX_BW_PERF_VOTE, &msg,
 		sizeof(msg), NULL, 0);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 528110169398f69f16443a29a1594d19c36fb595..52ba4a07d7b9a709289acd244a751ace9bdaab5d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -173,6 +173,11 @@ struct a6xx_hfi_gx_bw_perf_vote_cmd {
 	u32 bw;
 };
 
+#define AB_VOTE_MASK		GENMASK(31, 16)
+#define MAX_AB_VOTE		(FIELD_MAX(AB_VOTE_MASK) - 1)
+#define AB_VOTE(vote)		FIELD_PREP(AB_VOTE_MASK, (vote))
+#define AB_VOTE_ENABLE		BIT(8)
+
 #define HFI_H2F_MSG_PREPARE_SLUMBER 33
 
 struct a6xx_hfi_prep_slumber_cmd {

-- 
2.34.1

