Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79FABC3AA
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C0C10E399;
	Mon, 19 May 2025 16:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYM430Fh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE7010E372
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:04 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9scIf026191
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dxsAhzmbg/P7NGo/6NtGUPTBdEk3LlD0vaC4rtyESLg=; b=fYM430FhLVxJMaDy
 AgPdO+hyvSQr5WSg9ggYae2XpEK106SC+4iJKjtvuqCv9WvzN3qOysl3A8PE9O5q
 ivJGs58A69VkpFJPAXdEeoONwzYWV2LTDzauf+VDmHRRQ3L/zhL8n+ZuVCKK3pjC
 g0wY7ws7k1bDxDN0wo3Ze4rdKqiXdGn00jyzfYhi8BW+5GebPkQFOMyg6lbX5cBh
 mfWvIjpAcQv2dYkBwTc2U7hvfRaxlVGM5Uxu94vzq595rWlBes1Cu0PcnfcXz3mb
 KTI48/fAWhBOc/6It438T/H/Q9rg6z9EhqYZDXJ96Ti/CSz3sWlVyqgNT6YxTmEP
 AhbEow==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsvuqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:03 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-6064d0103f8so6086864eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670702; x=1748275502;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dxsAhzmbg/P7NGo/6NtGUPTBdEk3LlD0vaC4rtyESLg=;
 b=pQu6IX+lp4elaFqMcjru5X2zpDO8asxjvBRU2KjRq8/K8D9HTqfBdybkBoVJiqbxr8
 OKliHlm9nXExO6yAw/4xtJWj/X3VhiMGJ2tkdDXLXELC44sTj77F79OLr76+jJFV59a6
 fSkVzfiWNGT2+VR46Chd1PXrtgmXh3zubOb9nayst0KPE+B5RfoHYv7FWyY1QzKVFa1G
 gEh5wN5WUi6Wq0ipFKyiwVaU6bzMX3ph55W7iVKIoXqw49DXiBwyJ4ev6uDfcxizKt2b
 8It/1E+55t4sUHieTLUaaRe8Qh/U7SgLQHpuqypR/h5AI9fO550W+FNmHap7+GywKiY1
 VMjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzicoPQKyJ4MjOWr3IfUYZpy6wK1gG+qUVAqUuzFLA7PWK5uVkXwwWJx/fY4iA8T4GQQwEeQ0Oqkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyU0F7pmIaZ+egSqzzZlpnIMpb/OaAVAsY/e2BQ4Z2EF4qAy5e4
 /9T/Szhrme11OqcH1O3HCmlfZwA3klD7lkuAstrzDRJPBiI4Az6AFP256pydstydmaM0lfhsLxa
 +/x8Ni7Ezf45pneBMddElU0LnL60bhhWCwvT03G3IxIVWlcNPk7rYroFIKgP22ZrNtG48f/4=
X-Gm-Gg: ASbGncuIoBc3/wNCKIvMdOobH9TkSMcPcbVWgMoeflYIttFmBlqrHVKzBaq4//E7BmK
 4AWUbRi3OUINAbKwlSWW3u5GgtkEeUUxvUsqgjZRvoYCu2SUl8mYillcqdZjCHOcctsNwzV+1Sc
 9W/t9vz0375gMHpzJuUurrNRT0+6XKIhl5RNS86ItkjPuRsBFfN2v8LUmiwyZyZkyZkafRSAZHn
 fUkJ5M8MbV8UJWeoSEppn0R4D/eosddXOTUDNP26NgM+5XzRv1qkI+5npNNjz19ZOFpIq/xrBwh
 2QevdVJls6eiIZM68PpPrx15O4cFLxxA2154e9GP19vmI8crjI9tX3XglfFfKmTsYv3kziE0ILw
 zZU9oY0cHUsSx2ygeTvJ9Wl6q
X-Received: by 2002:a05:6820:3083:b0:60a:4ac:d786 with SMTP id
 006d021491bc7-60a04acdd3cmr4219153eaf.8.1747670702238; 
 Mon, 19 May 2025 09:05:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwvHj2FruddFnCv4nLxJa9GiK1OTK+95W3iF8t3mPC1jSm8aD9GiN04PuqB3XzeW/ctRMQ6g==
X-Received: by 2002:a05:6820:3083:b0:60a:4ac:d786 with SMTP id
 006d021491bc7-60a04acdd3cmr4219092eaf.8.1747670701869; 
 Mon, 19 May 2025 09:05:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:05:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:23 +0300
Subject: [PATCH v4 21/30] drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-21-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4709;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9wVY6xHvqDcF33GFzYtwTC0tzUZCiOlueW7vIUDiJZ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z8RKKQynCoTPB6vJlgo4GwgcVNdJxg0Qa3e
 W7CRvWrZJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfAAKCRCLPIo+Aiko
 1VB0CACtfgAQgO9mhZoB+Q4ML9ja0Ell8Jpl61IlCmUs4Ms223YjySUUmXyR1Eq+6d5UlBx+RIo
 7/BtL28AjAUAwPmJn6T+Vc6W5b5S/BuYt7uzbZD84VED9hYBnqTcDoELkucasZrUr6IoJTX4W8H
 cGC2IMeRK1qXFbztb2eT15bz7tNalDvK1NfQba2KpJ7bj4NshGtnXSL2eJusIOzJEwWcuwkOeA3
 ROnSgM5ECLvT+BN5g9lk61/PPMRgPezlTH65eDg6/6epXhLmQ5cqLKd9HivAMLnPMBJVUGU7seU
 BdwF7LhdoQQ7I8ZwHWIOBQhNqQgUYhFagD47lSLeKLmpQZzW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5_uMc5ShDpf1Um9HpTmxJWRTG9vgG8ou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXz+NzNYfyL77k
 Sl8as+GTdv1b2A6Q2Z0e9Ze0qf2V2cmm9SjDKkdBnfzAGHx/Oj0hD5+m+q+9qulYnn8+jiCaXeU
 v3zN2cpxiW50mQPTgI58SvC7IAngXmEWJx3Fkag2iW+PRXng/2strRi5Clm8N/1JV+ft8e+VBMM
 H7zuSJ2uwXXHVM5ZSfRFE6SEbNkSt4FdDoQcJkZn2jr06VPlvRVowuJLMxmTIa7puEKkcD1FNQl
 nCsw/G+5RYwBGdWl4FjlAYmj9+YQ0BsLAxoRR0TgH61F1qvQm2HUTDE5ZdJDeSYFHtmKifShf34
 2lYObQ8IqeEmPegknjQptstvcmjoCc8xL0fifa79GHkUVWm4pGceaeJhkUGNy/S0bW/vq1TZSpg
 lGeJPHq63igMaPNwywnFi+qJ3WdkUCnRHVHWW43s1dptjy/1VikweexbLzoBu5YMRkAnowoJ
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b56af cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xxl3IjUXEjn2PN8_a8EA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5_uMc5ShDpf1Um9HpTmxJWRTG9vgG8ou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MIXER_COMBINED_ALPHA feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c      | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h      | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         | 2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4777a4a852da0d65e20cebc31fd05647e0b4c4b2..d64ebc729bfb589bf90af89c094181f879d5b1ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -90,10 +90,10 @@
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
 
 #define MIXER_QCM2290_MASK \
-	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+	(BIT(DPU_DIM_LAYER))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9ba9e273f81ab1966db1865b4ce28f8c18f750b8..5e4608d10c6d4fee387c9a599a73b15661148430 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -85,7 +85,6 @@ enum {
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
  * @DPU_MIXER_GC              Gamma correction block
  * @DPU_DIM_LAYER             Layer mixer supports dim layer
- * @DPU_MIXER_COMBINED_ALPHA  Layer mixer has combined alpha register
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
@@ -93,7 +92,6 @@ enum {
 	DPU_MIXER_SOURCESPLIT,
 	DPU_MIXER_GC,
 	DPU_DIM_LAYER,
-	DPU_MIXER_COMBINED_ALPHA,
 	DPU_MIXER_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 4f57cfca89bd3962e7e512952809db0300cb9baf..3bfb61cb83672dca4236bdbbbfb1e442223576d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -150,10 +150,12 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
  * @dev:  Corresponding device for devres management
  * @cfg:  mixer catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
+ * @mdss_ver: DPU core's major and minor versions
  */
 struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 				    const struct dpu_lm_cfg *cfg,
-				    void __iomem *addr)
+				    void __iomem *addr,
+				    const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_mixer *c;
 
@@ -173,7 +175,7 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+	if (mdss_ver->core_major_ver >= 4)
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
 	else
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 6f60fa9b3cd78160699a97dc7a86a5ec0b599281..fff1156add683fec8ce6785e7fe1d769d0de3fe0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -95,6 +95,7 @@ static inline struct dpu_hw_mixer *to_dpu_hw_mixer(struct dpu_hw_blk *hw)
 
 struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 				    const struct dpu_lm_cfg *cfg,
-				    void __iomem *addr);
+				    void __iomem *addr,
+				    const struct dpu_mdss_version *mdss_ver);
 
 #endif /*_DPU_HW_LM_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index d728e275ac427f7849dad4f4a055c56840ca2d23..7bcb1e057b143a5512aafbd640199c8f3b436527 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -60,7 +60,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		hw = dpu_hw_lm_init(dev, lm, mmio);
+		hw = dpu_hw_lm_init(dev, lm, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);

-- 
2.39.5

