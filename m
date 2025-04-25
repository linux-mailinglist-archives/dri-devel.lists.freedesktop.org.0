Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5A0A9C443
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C77D10E91C;
	Fri, 25 Apr 2025 09:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oSyerK4m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A519310E918
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T7Ij008600
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YPhUAy0IKCydcq3qR8LkaE9TXn8NhCRkCwjmuP0vxxg=; b=oSyerK4mwaRllSNK
 3sw8FcX21GXYU15W4lY9Q7Kh/vDfLXDZyDgTVsWcgWU2MmJppnyRsjR8k5EEHMMq
 UcIg6aET6JPINlQI6pIw9U5OEpvo6/glEWx7v5Kxqd6w0zL0dlowymV4iSr+SDNF
 5ezkXNEShGXVhNPKCHrUM0r0+pq2xWBvp6gYpTmO7o6l9hKFZonUT/D/jFZ/uilp
 BLF09h5/Fc6S44OLXZdZ1KeOp/RS2ev7ExP203gM4emUaKcth3YNDAjtfMTGqD8B
 333E4bzIVncWmEBmqf6IcvEEjGqwa1tUncjG1LP1LVilF1XBJEaUtddQja+c2txq
 Cc4sZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy8gxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c7c30d8986so585612685a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574721; x=1746179521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPhUAy0IKCydcq3qR8LkaE9TXn8NhCRkCwjmuP0vxxg=;
 b=Y0uoYRZInNO2TJ4WS1pk4+pgAXSxD4TbpcUVYMlWf4nWMEKDOQnoFH5v6AORVYF3ET
 aG64kOOhFrQgsaCzj6MIlb3Qg8FBxF4FFhL2s9nsjnHPH6g/7/Cxrdk9YXlIWalPcVVV
 bHzfiYNw/1CZZri2J7UsLy8l2wTt0yRMFu/nd9VLU7vrVpdNw5eNuEe6UpYvgaqosd/5
 HC6XlEkAM4v/CYkxX5+v0v1OcJIiBRrnO7LlzskBnA6e1GWTicF7JdtnevrakL0W7lZL
 29GkGDvR9MfORSmnLcQD4Dj3762LzWZcfdOk/MzxPxpKaym3YDu749paHPk2oKk/CQCg
 rH1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX5B6VlaH5NSpYej5Os8MJRcWsTGJRLir/CNgAqG6z3xerxpOApTVM42R0DQck94eTNk7aocTszUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzt37RJLBWWHtuhjth5urWMikeeELAQ2oOwBXdNQwWq/koE5447
 xaQCZEbqkhC/YEiou5DCT7iDxJK+7k790zXtCNw0p9t13p4L54/byWrHKY284/jXUh9FZC+wbDq
 vxLm5AYDVgCCS4LUC7p0o0NbF3BgstFQ7VVlq34vQac3RUWFHHUju/60/41dpZqnIE1Q=
X-Gm-Gg: ASbGncucBJ/vDXcBCd+U/YHYVl7KdBfwtFoWtmxWER4w1sRkXOIxIb5No8Oqw8/BJrc
 G7f/xfD7kCEIFnqvdjEv73bOKLirycO/ZkQwgC8itU0bg8uPgJGzB9BkrnlQ/o7A4WLw0W2Dpk2
 o5tj5N1PPxQInAoxmnU32uyhvFKakSJ6W3qn4lbqDPy+Pa1a4fb5GM5HF8J+onaZOHtbjDubYDB
 kEKCfCKhWcGcK0eABpjZWvK93FQCTnBqtmvrSisdgKnIYwI516xejXWJUd6erk0S45ttuXBC4LN
 LRnuNTyJDvtEGBwYXmFrm5eL8EsSJ85yWfkaEZb7EWu0kcM/VhFKT2VOykMiPZXmp3hrhIaDHUC
 xYsWWB2SXcu/zBsumJOzbZPNB
X-Received: by 2002:a05:620a:bc4:b0:7c5:5e69:4450 with SMTP id
 af79cd13be357-7c9606f846amr220216085a.17.1745574720821; 
 Fri, 25 Apr 2025 02:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ1PuPUG5UA+Ta0KBqmp76nB4H7hKk2B9kKWJeFr07+c/AZQczeUIZjnYJCQvFsn+MeMN9ug==
X-Received: by 2002:a05:620a:bc4:b0:7c5:5e69:4450 with SMTP id
 af79cd13be357-7c9606f846amr220214885a.17.1745574720525; 
 Fri, 25 Apr 2025 02:52:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:51:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:53 +0300
Subject: [PATCH v4 3/7] drm/msm/mdp4: register the LVDS PLL as a clock provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-3-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3936;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p1IT7slnVG8OxIiWvFIYnjVg2GsFl620wCCz7LSey7Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5zHFbFUsFBUaPCTVFVTZYS/OOWyjMl5RFl
 LJ56EsTJsiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1SmgB/kBSZl7DR5mdH319Q7IjDuxugjrvDTqfN0OW7Hax/kXdA6o9r1/XNhMlAR3p76mdAzj7vD
 JLuiAtSJeYXUSdUis6xvxhWP+5HyqGlF9U1c9+A9BoZ3TS+OsWez1z6CKhEMVHdq1haPKc6aBTC
 OugfsPPtzCA0ynJhnJ/+snE4r6gOk1XhQe2U67A6mEz78aanZkgrbHq1wce4GeEKBNoL2ABlv9M
 zz5o3lB3R4Ddq7M5JlyQJP84JKNcZ1Qg9/nlNNk8/LH1sGkOisMuROp2pPWfR4orL99WxQ2/1jH
 tQhpFJ0in5sE972LvIgawuejazSBoeXVvOqmRocjy4SS4zmW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfXxXNGELYA5V2u
 Zpl+EmlTEHHtVWk0pXCH+Hz88Q752m24TOBrEAnKKxaqozbFA/ZDn6Q1A6LOkb48Sj1PARBwAVB
 4OeQ61xihm+bVRbSSmMqfIqKh9h1ZO/mIe0js7aumq+Tc1oAwY2HRyZy/WDlY/5L0aNK2OI82YQ
 vB/e18aMIsrLqiHC/hsc0HcZ4jBntx+unf2jZCOej0NHD6MZAN1GC+KuWgoMVHOmFT4e6VVIW2k
 9rw+bV5f77TMUaOgLdbOEvFFz8fwegzW66WYCDHqP+U1dHxTNnkrFwcAIszRWlGhEZPUtJbojyw
 w4DMDyEgVbR0OcMv0heuj2AaF0QoSW26go4nFF/wq4ity0mslJrszEoByaKzOCe5wxTHyW+TbVl
 510/DsP57m3oA7D0jVe8zqIClisHKFPYf7lH1JRPmjhvANXh1a0ies2RhzgzuyABLkIBQvm5
X-Proofpoint-GUID: k4KaZoX003RlUdyfWu-ZVB65TATgPSBQ
X-Proofpoint-ORIG-GUID: k4KaZoX003RlUdyfWu-ZVB65TATgPSBQ
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680b5b41 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TDJnK0Sta0nlXdS-8S8A:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071
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

The LVDS/LCDC controller uses pixel clock coming from the multimedia
controller (mmcc) rather than using the PLL directly. Stop using LVDS
PLL directly and register it as a clock provider. Use lcdc_clk as a
pixel clock for the LCDC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  3 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c     | 45 ++++++++++++++++-------
 3 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 142ccb68b435263f91ba1ab27676e426d43e5d84..3d7ffd874e0d234f450f6170e623f87572456757 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,6 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
+struct clk *mpd4_get_lcdc_clock(struct drm_device *dev);
 
 #endif /* __MDP4_KMS_H__ */
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 8bbc7fb881d599e7d309cc61bda83697fecd253a..8694e5d7d3f012070c72214df063a6488b2ef707 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -380,8 +380,7 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 
 	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
 
-	/* TODO: do we need different pll in other cases? */
-	mdp4_lcdc_encoder->lcdc_clk = mpd4_lvds_pll_init(dev);
+	mdp4_lcdc_encoder->lcdc_clk = mpd4_get_lcdc_clock(dev);
 	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
 		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index ab8c0c187fb2cd05e26f5019244af15f1b2470c8..df2bbd475cc2a11da20ac07be8e757527ef41ae8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -133,29 +133,48 @@ static struct clk_init_data pll_init = {
 	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
 };
 
-struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
+static struct clk_hw *mpd4_lvds_pll_init(struct drm_device *dev)
 {
 	struct mdp4_lvds_pll *lvds_pll;
-	struct clk *clk;
 	int ret;
 
 	lvds_pll = devm_kzalloc(dev->dev, sizeof(*lvds_pll), GFP_KERNEL);
-	if (!lvds_pll) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!lvds_pll)
+		return ERR_PTR(-ENOMEM);
 
 	lvds_pll->dev = dev;
 
 	lvds_pll->pll_hw.init = &pll_init;
-	clk = devm_clk_register(dev->dev, &lvds_pll->pll_hw);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto fail;
+	ret = devm_clk_hw_register(dev->dev, &lvds_pll->pll_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = devm_of_clk_add_hw_provider(dev->dev, of_clk_hw_simple_get, &lvds_pll->pll_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &lvds_pll->pll_hw;
+}
+
+struct clk *mpd4_get_lcdc_clock(struct drm_device *dev)
+{
+	struct clk_hw *hw;
+	struct clk *clk;
+
+
+	/* TODO: do we need different pll in other cases? */
+	hw = mpd4_lvds_pll_init(dev);
+	if (IS_ERR(hw)) {
+		DRM_DEV_ERROR(dev->dev, "failed to register LVDS PLL\n");
+		return ERR_CAST(hw);
 	}
 
-	return clk;
+	clk = devm_clk_get(dev->dev, "lcdc_clk");
+	if (clk == ERR_PTR(-ENOENT)) {
+		drm_warn(dev, "can't get LCDC clock, using PLL directly\n");
 
-fail:
-	return ERR_PTR(ret);
+		return devm_clk_hw_get_clk(dev->dev, hw, "lcdc_clk");
+	}
+
+	return clk;
 }

-- 
2.39.5

