Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993CBAC1410
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4431B10E91D;
	Thu, 22 May 2025 19:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1LnX3SH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BC410E7FB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MF4w5X013417
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R1mI765wfM1dVKKFlWK3vO++jnmcSm6tm3TXel+1Ajg=; b=S1LnX3SHOGCcat1o
 Q7dpZqJmKMoXE6aaLO38jWpxCTg6cRJg6S+e4Y2FUKsFDBv3eISLPzlnTjMzXD+F
 cMzWjOOKSBG6C00qwijamg2UwVE/bljchSDMWkMtzo/At3WJ6XAy8xPeX1C/JxFX
 yOYEdkjW5ovklp77sjL6+O1LTIZHbt8lJ9WOd68uGys6h0Kq8FEhvdO44bQftpMx
 p9mqjIKVYAQInbme2kU9ggkECQTRJykCswye7nHuRSdz3NYrSc2UYuKeHHSyg2Le
 X0bOFxoKmE7Ujd6Ysz40dQKZrswoZEiXW35Gpw8QMi78MduPvdeJMyJ13rMexcCB
 w1IJCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5fnsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so849494285a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940676; x=1748545476;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1mI765wfM1dVKKFlWK3vO++jnmcSm6tm3TXel+1Ajg=;
 b=mstJHAs87Eydn0yK0Aw9nEclD8J61hxhLJsYld7Jwr5D1cuaTAlYOFrxiDVF9+p7zg
 xGdmVPwtaHNEldytrQNS/wB2p/1EKuPRjCBuqJpMP6u/e3IiMu44HqVJ8JyT3Rehv0Vu
 918UluwOr+BS7CRugypE3KM5SDjidn1ogKMuGqTikXysAkNcDrCouXelRxHZwHtUWwgp
 3jxgyp/yo5D7qCX5jRzLSDyfHuJxVU+CZ3rYc/iMdiylXHqfDUMe+cjKBVh+tfd8f9Nb
 8rhlPBGIpg8m+XByN3NQRjabD/t5mklbazIhwbCoBptRFNbO5AqbXXc3atXzc+knRJzB
 3KTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlQV/omdq9w2JbwSBUhN/kh7fWqVEVS6dHS3TpB0of+iFEtyIfQCcwFcDNGoxRxt0Q0IGGkjQYwnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsEDMKdlRCCqjaLwZJkhZgB3DgOi00rV0LhAgyEFfneNHAt5go
 +vOpwjpMOpbS9s2ygfN3McdOvVuhKCjSzOdpaW8obQsaTri9Jt1sO7pFN1BJ7e0O3bh6zbK1cFZ
 NVXsReU7n75LSQRlG4h33do9YBDjubue5WnNgTuxmbXT7SwwPhpIRH3rit0jKVXrR5S3jwnw=
X-Gm-Gg: ASbGncvR4VIzQWUQHJc35FQqy6b36TOuCeS4H35vBrdkuJF78spXEQdvEFpRa1lEXOj
 AHtw6ASfPs3dkq23LTUmhb3Zzt1i/5oN4QehKjpsAsUtil/t1U5wlPCkB8KdlhbLpmdTkVJrWI6
 GYgPsBguvYmrx10wchbSNmeDRevk3LS4jdMREUwRoKeizuOF5/js4NghG8QrcET0JMVRF/mFIyY
 bV8ffuKKQKHaCsn8fdx70LxMSv3R67hCi7SVthMUAcd/K1BkELFkmzh3tg2J9iDpiGTRWx5YUO6
 yntMPvXmFgJ0ivnvEdgQyv42LWaTku3bdZiCDIQqxTyuS/DuwotbVU2J/1YGrknoSa1NL15K6g3
 rRI441EOtqvHQKhxW5DG0rDVr
X-Received: by 2002:a05:620a:438f:b0:7c5:a435:8c98 with SMTP id
 af79cd13be357-7cee3102bd5mr12927485a.0.1747940676140; 
 Thu, 22 May 2025 12:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUJlIq7h8+d8sS9PYlCoIdU3VLgrTqhW1w6JVHLMfpH7+4OrYVZNw7MdG7bp0BeY4eES0rpA==
X-Received: by 2002:a05:620a:438f:b0:7c5:a435:8c98 with SMTP id
 af79cd13be357-7cee3102bd5mr12924285a.0.1747940675765; 
 Thu, 22 May 2025 12:04:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:40 +0300
Subject: [PATCH v5 21/30] drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-21-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4766;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jtOXyXHDRmJWuIKMWGXi30J4+hk/a7h1wLTjHZpcPuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T+y5kjxRNbxIhNrWLBFU+i1oFwbN1TKgsSj
 f9qGz2PzyuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/gAKCRCLPIo+Aiko
 1VnlB/9PxzfrKitYjj+T2er3MjgHyDxc5v4xFSGIP8KSQkq+TlyMj46b/e5vHGbXPq/lA7EhxCV
 tZfZX2ibTnqgk8/lJqkLKX0Dvgm1lPbvII+qcHhWp40LHRRO0aT4iw8c+ZAIct3eMiEfDeXeh8J
 pEcMiTJyrnmvjCIpzMdASITJzSw+N+nKkKDZEw0Arsah2hDu77J7V1mMg2ZZQ0fduPL7YZydDxl
 mJCKMISW1FGorGhmK1CudgY4nPIsD5nEy6LEKGxN818KXqB6KGMDCOuzFiThaqcbAOj3YuUObMZ
 81XB89WmtAEX9mCIHDyWQppe24JTrzJGqfivIvN8PpMCUD+V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX5NesQpV+6/dX
 baLxytR4ysqN/jA9BEpZqBdBBRhi8yj27L2xXVHBsuqT1vQrYVbC0TdsSMqBwEyRzVHfHOVJ1Ht
 NWnDvkGPXpEfoO3AQJuwR7GxNjtTvakEgwDugCGmj95w60mMDjbJiwnFIqpgGpa3lraAGWKWtFt
 UMFKw0rpQkZVtyUntm1VJd2ujbKOgMGoRW6CtBwFs3ChMHe6LBAgl+KJCSZu6Isz3hv1Q4vmpEr
 OFG8wsW5WAwBHe9VzhDNrQo5H2XexS1LBUGFLthYzUFx8+9wz6uV3vq8Crllv2m245uffwN2LYf
 zuEBvhKQSjoux1ot/YJIOmaLL7uOx07BuKbI6e2Cbf/nNqHs4g5pceOAZKSPFvMxn8pA4IriGCF
 5+0gVanidTzpqEKapzI+ePQhpNU9SpSNN5g/4jDG+5TcsDr6iKNIUQXrhUt+7zZGW5LfSUjh
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682f7545 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xxl3IjUXEjn2PN8_a8EA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RLHlgRBfohdnrSBM_Nq86GZLelxHnZZY
X-Proofpoint-ORIG-GUID: RLHlgRBfohdnrSBM_Nq86GZLelxHnZZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

