Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F521ABC38E
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10C810E438;
	Mon, 19 May 2025 16:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aADo4WDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C26E10E2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:37 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JDfgU8007253
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ynPSdK/V5vuBuCDckGMsf5MJ26e7Qgj1FWRsGRLvduc=; b=aADo4WDybW2O3GvL
 UtpG6j8bcrMNM4vipcGM09NiQ+CcunScTQHxS5NNfi0QmeTpWlbYvO4kzI7L6ZwN
 suM4oGQvCzy+JbmVZRNyLG1KsYjoodWoWgmRko6kVRSoiPqH98g9xCo2jIYa2aDv
 rUTrOg207GacWdsbEZO6MVgoUaVZqNnYWZoW5oDLI3hBphBoeOiIBVVYpNbJqQGD
 d7ZUoP/d4KLrg/5T1i+0QfdoUjSJZVG8zKshrUVHKYUntqbWVNxAxRFga/tW5I6c
 uTI8eUKk013WkGlGcikDkkuMqMEC6F8U75asY0LYtgGk/yKGLoqWp1GGDId0XiWu
 JrtjYA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkhmwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:36 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-609f0ff6da6so1032520eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670675; x=1748275475;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ynPSdK/V5vuBuCDckGMsf5MJ26e7Qgj1FWRsGRLvduc=;
 b=NM3YCVIUVL2PnSCMgnRs2eBQ/v5qUpeRbiE+A8KFMq1y4AQV/oZYh4UVmxJXVoyRp/
 NcbxFJDktUhdGJvulYjtQVt3kgCyt7+G4mjRkqKcuJFFMlhFfMVdbSWZcLPUje4xp134
 Mwg7S2ApI7CQrNQe0LPVGPd97JMRjjtHmWITDHAc3pFoECfOZ2mXuJIxZw3tcZ2MGCTx
 fcotD2GOpu2D8UDT/exFM4XMOS/rg0oA91tIA+KBb1ZlbB1t9/D0A+cl1+aHUo9c55FQ
 +7dAMRa/a/hKe/3vStWsAbjaOlaKAJUFFGYaPnFYI28BbMv4WOl8KMucpXXIv5i7mdWW
 IMDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuVkJ38K7GFhhT4XizcxpWjCLi0bON/dUdi4+I8VQOcR184gIlrqKmnGVqX2r83le46rHkPX4GcyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8l79tJITqP4S1uqGYA759uqoDvulM4WKCXL0kYMgh5+Yr9TSY
 8Qdw2inEk3O3eivWaSLdvAedxbtRPtgjA2LoW8Mv8WCxRJGWsBRbV3JNAcPBC9aaymQ8GlfJYUr
 rSxet/PkrBTavI9ZjljRQ8Ck4d+KcQgoyfDfdbd6Hj6vj6lUQHKr4wxLPsN3Mm4Np9wy7nl8=
X-Gm-Gg: ASbGnct5pO5wSaFc70ctjj8LdF1BHaik97FrTx8SqNeyOTjQiAT3Y/bIYgsuXVaawDr
 JDdawXHdjVqO3jBHrcxExr10bXbB90VU9sMyZwB4rnLnXcgopO5p7hNOXHA84ihwyCLmSX348b9
 XKs23iyxza1PaC6kYxadVOq5UJ2rpJKdMEqSR15TOYtolhU+Lk2VdP5wLZHt+g9dgPfpGNWH1DK
 GB6Pt+JgylnCg5dvSvXp+PE+nrqTH224RMnJgOmj9yENELIN6uqctjrjUYPpzxRFRI+ze/Q1NLb
 f8zq1OzRTwYJ/yqok0wC9t0XE7PlEHJIPjrUm56vc+SDFVOK6ajvsHZmPwkX9KLeWwl3ngZbbdY
 zIEV49vwrj4GTtwNI3QlrRxjE
X-Received: by 2002:a05:6808:3192:b0:401:e61b:5f73 with SMTP id
 5614622812f47-404da7297d5mr7267572b6e.11.1747670675285; 
 Mon, 19 May 2025 09:04:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyZyTToIU/Tm0w29XMmODH4Q7PLSjPrUHu1JEr6U43DaJPPhGHJwdfk+R/oWRT6oWZU8XAdw==
X-Received: by 2002:a05:6808:3192:b0:401:e61b:5f73 with SMTP id
 5614622812f47-404da7297d5mr7267536b6e.11.1747670674851; 
 Mon, 19 May 2025 09:04:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:13 +0300
Subject: [PATCH v4 11/30] drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-11-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2724;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2iSXogYj98Z0EmWLJeT/h5TcIKm1RtdrNrUcq+04pEc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z7nh+1P86WtU/CstGK/0Rz8dk6nK9EzSHhT
 JRudh/xG+6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWewAKCRCLPIo+Aiko
 1XlLB/9MCpa9QwflqabW92gpf3LwFi+pewmOWsaany1ahhAkYV7v8mNVr6E2L8ndGQ+f3zoxZcn
 nIxR52XGe6ivVvKN/tuPnohrsj3Pqs2MocM8Gzdobb8PyUfk6nGSXPS96w9ruIZ9lozlta7nAJH
 4nYsFzTYJtw1c55JyedGvkm1/VJ+lGLH4t7+XowIizV7u6xtDxQokMwM1y2y7syb2hAaYT7F9/s
 FXA0V50M17AVEsbyxW/EWSCFdg52zYortLy9SZO9ZAzdfqRYylzZSBD4mBorj3opEWeX0P+Jlxq
 BB2qSzyOKE6xR6us8O1l1By9idqMWmuWCI7sRgdWwMp66iBv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mLP7_4j7A_0lupqq3WZ8-TgTEBwh2gS1
X-Proofpoint-ORIG-GUID: mLP7_4j7A_0lupqq3WZ8-TgTEBwh2gS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX/qqXexs7njtl
 narAzhapSebNtsh0e/0VnJHz9qK+UQGu/5K7zoOTcSrJSKWLdLwZbXcPAIheIav1Xbsk4M+uwGQ
 1ApQ7LqmCSlRTmhK0JDSX4nZzgbZqBwSydK0vxt0WH6vdzPhshaBM4sdXgzvVzTWrKpDWHfrPty
 NiLS06D0G8FQDNyh+xgJXl300SGUu5aE/xGFzQD5o2l6RoqH/7Q1pXqEjXxeYFdIgsAzVmDMe+f
 ObyTWPeuyB5thlYbVo2F4iW6isCzD2whEjeA9jiD9TsTA+ruxYxhfkuotGCU+OhFIEhuBVtp+UJ
 HDWg0AyqdeJXslRWPzIzz8KMpDzCqEM2A9UePr90XQ1+ymFhSNd95gRQWmobhT2W74bhlw5GTCD
 4rkVVqJe8+ERAvbz8XaS3bwN0gR69eaJIq4cJSMjtym3nsX85K9MjiSIbB0z65KBX1TGfXyv
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b5694 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Yf7QHpgQJbPwferW474A:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231..19a859e2a1f80c2321789af4ec7c5e299f0fb873 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 82f04de6300eca7d05ece3ac880c26f3a56505b9..1e5fc1d5873975189a1759212b8a6c6078de22f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -133,13 +133,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 772df53bfc4fcc2ff976f66ef7339be1ae3da8f4..edb82c81b0a449b1a7273fc258961b9447be8d9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -804,7 +804,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5

