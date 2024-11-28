Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08329DB594
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BF910EC61;
	Thu, 28 Nov 2024 10:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ihNOb1c7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948A910E26E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:25:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3823e45339bso512195f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 02:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732789552; x=1733394352; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V1gPTm0pjlwG0c0atvGnz+vU500nz6vqRW0Excxm+p8=;
 b=ihNOb1c7B9qgVyWUXJXBaYu6WKOLKdM66VWCSyJqNll06ta9UEGUVXtfA+WMSVYgkd
 0T2MEZf+68DdfGo8JQcLzCoMk8T+uJ7WCUnsBIDu1q2c0jvIV0mGPRMBfSCgOiJ1nn/A
 8GgnzBMT/gwWLghhrEgxGbU7GvZvmP8CALOTJiiuCOOC1cAkH81O/qgrbovoHdMHOzrw
 duMkltR5NxOIKPoPFs4/Rjut7iyZxF9sBRDHu2/qnxTP3SASd+X23Lhq+4+trqI5IcPn
 Jhm9xAakt3JJlJnkXnq2hFDg1ILnQXbOOoUSxhpDZWcEf7Eqj7Qzw2VtZ5dYYcjqGV43
 8Sow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732789552; x=1733394352;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V1gPTm0pjlwG0c0atvGnz+vU500nz6vqRW0Excxm+p8=;
 b=f3vVb0gLyxTo1hM5/wL6Yw0QIJ1FbX25cagRNDqhYf0vR0Kc1l5m0UZW8HiUSpZhsd
 gAR5i2VKRrQj5C2BMMWFAA3F8LBE/ihfq7ddMigPIBZBbion1GMXQw/sbtpmjVj9HrCY
 INSdWBhxQdZAj2B4lCzFGl//9rqCb7zRaxvH00w/fyo3rwIvGjBfRkbwQCmekTjH2M50
 z+ysbnlfFIUKDDYlLDi39ARXT/GIDjfLMFr5JN4Vs8ttfVKyDwN5VwM1393xRT0bJzCI
 uMp4jf1f4VWQtajAmi3P3ukbaeZHmRKeY33/O+uezpDr2b8kh+ue7YgWCjTxWQlpPRMh
 QRoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH6TgJoGpL+4D+Tr8eq0oEbcWRVj2n0ZOIu3co86CrdO/7ONkuQ0WiC7edw72WSSVpraelM6kv1V4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpZR+3FpRLQw3iK+PEdF03ZnRdFLfxiRxXPUF5e/MVKSzMw3Xv
 1xpYKiyrotljkrCfFhOcPJM9G587bMVQoowYKJ2MVoPVayL9tDAtnEsEF/tzyXg=
X-Gm-Gg: ASbGnct/F0xzNOQ1ficLC/EUpFD9rT3UhKal4AV2sPZe3adJTDRYqGWFiYkir4mvIqB
 OgCVORjj6dPCn5MAAGZPknRMudvc/E6Adeh71Quru7eZSkfS2bMcFCijKARaz7Y+ZeHoBvhHUcY
 hfinhkdTivK7oOUfTpjZO15yY1QUNla4uqdRLV4SLEO7nNQrCNa0FhVrgDzOx9WNz5hhJ5UdAPt
 LFNpFZf8B9i32FYxYhnjZqgLnGYs5MyFRGbjSTLEkM7YzCiEHAvLQztJjvY/Bg2huASFy0=
X-Google-Smtp-Source: AGHT+IH7sktOVLKHGjk9KT+EMqHEmYPm4nKYmfIvMzvZeiXklUBSbGgviUeQzfTI3dSQAF2MPCiL8A==
X-Received: by 2002:a5d:64c6:0:b0:382:424b:d0a6 with SMTP id
 ffacd0b85a97d-385c6ee2285mr4561807f8f.55.1732789551865; 
 Thu, 28 Nov 2024 02:25:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 02:25:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:44 +0100
Subject: [PATCH v3 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-4-81d60c10fb73@linaro.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4409;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HGV2P0MV+tkckRcz6aUbwnmYns+3KdFY0veuiRhyFqU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUpFH18HETnVEkA1avAO9F358zoh02g20joobql
 7nkwWfKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFKQAKCRB33NvayMhJ0eIsEA
 CVHnknx1S/dySNA2A/93aQICdmUiOgXKP7HJorQ5fVnwJMNHoWwWLPyb4U/toZ08A5Sz+QpbduDMQq
 L+QTbdF2vQj096ofU+VO/Sh2t8/EuwO6lT/+GPbqnnBSvQFZTO+lxg8Bu+37mWEPh1RJDyxIUlRF/D
 qBeiwW7SiiEaBnqeDW2CoblV5NOCrHGTW+z7Wtkf16QMP8A0TtfeO6dOrTw7nlGXoYEqk3iB0WcxEH
 3cuA0h4+6jHteDVqnKS+6aRzvgayrVbit+HUD94WoU6sfmEaAa2TDcyRo4pejRbDDy28PIiJcU1aaf
 aFPS1tIRJLCF8it7VLXRNNOpftnoxBmeo+5u0BWFCcWekKSAPHkRocKguagGu7BG2BQViHa9qP6GGS
 wcfP9tu/xnMRBf1Un+AKB477Qq6DOsZGYX4AB9RS9oWJxwKBYo5MWN0mFmt1wn9x5os01QZLoq6SWk
 QBc7cZXCa5qpsGpVR2AaFQw6zpgscn3xwfuXyvBGfkRxxuTudF8CRAJ+rGtFO9C5Uf2+SE9+gCEz+H
 vMinnMZfnvXBYCBAOIkaSr3oS8ivNOED5CLzcwWHmOBMxonjfedca2B/GE4oL9FsLaAvvDp70dHEVx
 dW8tne8V28NlHfVqTdW22JE5umB83FbK7QS5Uf4jLTiKAmuEF0bFf7VjL7qA==
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

The AB pre-calculated vote is appended to the bandwidth index
to inform the GMU firmware the quantity of bandwidth we need.

Since we now vote for all resources via the GMU, setting the OPP
is no more needed, so we can completely skip calling
dev_pm_opp_set_opp() in this situation.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 23 +++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index ee2010a01186721dd377f1655fcf05ddaff77131..c09442ecc861c4e56c81e7e775b9e57baf7d2e51 100644
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
 
@@ -125,6 +127,21 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
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
+		if (bw_index) {
+			bw_index |= AB_VOTE(gmu->gpu_ab_votes[bw_index]);
+			bw_index |= AB_VOTE_ENABLE;
+		}
+	}
+
 	gmu->current_perf_index = perf_index;
 	gmu->freq = gmu->gpu_freqs[perf_index];
 
@@ -140,8 +157,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
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
index bdfc106cb3a578c90d7cd84f7d4fe228d761a994..432b16c4e198939d9bdb968df6170e4ac74fc923 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -210,7 +210,7 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu);
 int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state);
 void a6xx_hfi_stop(struct a6xx_gmu *gmu);
 int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu);
-int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
+int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, u32 perf_index, u32 bw_index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index fe1946650425b749bad483dad1e630bc8be83abc..9f8c6f9157381a6f7b66de766a046dd84e211384 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -759,13 +759,13 @@ static int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
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

-- 
2.34.1

