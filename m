Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7424BA9A7E9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8292A10E7A9;
	Thu, 24 Apr 2025 09:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nonq8wif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FF410E790
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6kO003397
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mJipZcZZWH1q+GPZjyCUn13cwL4q5wMDd8S9OaXiPQE=; b=Nonq8wifbCmkLCqr
 E4UJ4AsWLcoudxwqiP4aRkSOfnjqjTWLPYtKaCH20w45oAIuuUhqAcQxaH4+eVDc
 WmKFgQyBfbrjPM1TYd1pTXSHgEhcKOU/CWXyClM7SADQ05ud2/iYIXTUGdShModZ
 XVhl/2qAZCnV8caTPO7FP4i4du36UaCpHgHCtsMqzl3ed7smU6JPMGO3Sc4mx2un
 H6GXaG8hhv4sKTmz1om9MFbNyKnhs7XA6gvsW5CMfFRRws6RLz2XpKtrGqAX6HQu
 3mhUuy3lNGomgL32187YruD9bhAT84/3HyMDDXq4OGDoukXGP+WYfq8i2fLK0sXC
 EigGaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0my97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c53e316734so137407785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487049; x=1746091849;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mJipZcZZWH1q+GPZjyCUn13cwL4q5wMDd8S9OaXiPQE=;
 b=Zo1q016Hr2vADzrMiEMRczJnGZfd7UEbt1h/vkmbPtjLAXy73z6mAals04qVApFxNv
 RcmHBTe3xUHvZPbkJ4HO8cw5v4aAb0eZoH9brUkfpxnOLjdHXmxhbfan6FrbW9GJHPnW
 l1gk7zSg4zjdusXf9DKpMUrred8Qxx1R8cmAetr0rMeCVYsqoMq/pxKPSOR+rJPIEBUr
 ACGcAG67bznLgOv1CIFdRAcMAVo//UHDFqdNAWO87R1u7KsFnocXvSlHkMyKntKj/WyL
 Y6Aml1fCLez7Yl0ExCw/p48UhSwr80ABq9KpIrUn2huMMEr1wAXt81uX83WFz8Nekn9D
 frXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKnX6L4oVQeylWXqMx0cKcQp0sLFXdzmu0y9/16y+PRyO3vzTlElpbSwOOZukVO0I+hQ2sD4rMS7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6Ut3be1SgCMu7WFv8SenG8/sBQXLf/JuySGqgvzRlOpM/MIQ4
 7xghQsjVFwiXgZ26gHz2qY/vGI2AdEIBqSPnxME/AB53nBzo5BR8oJ4LdLyhPk3we+0TyoMyI97
 LfpoX9VUnGcrYG0G1nXvgJ/BnI3UEpINN33rfc2gwbVcJWCrI8lSFdoZvMybjJDBKdj0=
X-Gm-Gg: ASbGnct2xH4lwbsqZCz7GoHePAV8S6H2Fg1q3/vmrKd1z0V1IONwAj/CeczomHYQPdE
 wqyH9kaw0z9Fbqv+UVA2D7qjGuHGJhXVvicBAPmP7hgLDeeVbddJE/OYNNEOn+bTXbGOj7rvX7k
 0nSmlddjcvlLtw9ARmRT2/fR5UXELAL/Vps6exg+syglE/AF6duKgkTcihkV2rK4iMmpZ2hZnku
 GHl26uVTxAHhN6039RJyue4MN1fBezbFzG4dz/ELPincKtBcaKh8WFby45sM6nq6E7EGQr11D+f
 ZYgzOr73uxC/BFdWYGXimQWccZUIhuPOD1W1nSd4UIR/rg1b/DAn1KPlfYHTaYSH4V70CtY9hT2
 JbUVB1JzUHFyJGGCnR/wiwBPZ
X-Received: by 2002:a05:620a:1794:b0:7c5:5909:18e5 with SMTP id
 af79cd13be357-7c956e7d446mr326879185a.3.1745487049294; 
 Thu, 24 Apr 2025 02:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBQmRn7SKcjUSTbGIjxqsPY4wEMu/CWMSRP8MryisNW1tohurPxko9cDIUFwhuJlclwe9QsQ==
X-Received: by 2002:a05:620a:1794:b0:7c5:5909:18e5 with SMTP id
 af79cd13be357-7c956e7d446mr326875185a.3.1745487048943; 
 Thu, 24 Apr 2025 02:30:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:18 +0300
Subject: [PATCH v3 14/33] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-14-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nt4QhnpHTNYrhzhqV0xbi5+n74LJmsNMY4VbVunyJu8=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSt5uuV1bwUk5DQ4vQkc/FrwRESt2DWna1p0
 zQoy8eeh6GJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErQAKCRCLPIo+Aiko
 1UZUB/dSUNDw61C3xWnyNFZGuOISsMOOeIDbwgFQ1wDsmxaKY820q07g40rgZ/jKh0prEf7XsmO
 C84OnR0tvenNeIvXZm8sZsdkRJNU020kjboki6Vqkmsax4Ep3wq7AO1EKashj7zmJlOD5iUXmGC
 /fM7entgLttcNsyxwhK515VCsxvazBjGD69tk/9xPDmrje/LPtvt7APsgR6AvjHuWBpTVV9A+wS
 kLTvq1xTz5KU/ZlLtsOgAB+A1tgJytgfIvqL929trBGoE+no6fM4G9YMEE3PIyLBT9xAbDw7PDg
 0gMgrV1By9pnPaoOvSuU61HaZ0ap1pb0iPeLu43FByx4Vto=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: GskKdGXoY0Nwt2EMuhzPYq48ZkHeyo6b
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a04c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=z6iiZyybfqEMMI01lysA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GskKdGXoY0Nwt2EMuhzPYq48ZkHeyo6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX8VE1NHckssdo
 H6E33SkV7OKCpLqaGC81os5Lle9DfrxzrSUSOG0X95DfFR01RbgcDv//OkNKbiv47JELrBFaqNT
 0++LtfVLagXn4NGSKWLYHM4jNXRd5p9ousDw33u8+1lR088FmvgeyJznszgxWJKYRHdmHmAmAFl
 68+5V0QAlKQE4ub52zo+xIbIit2fYK+OeKQRVOjGfTyn47JlN82h9i8PiXAcoSoqP6t6Ommkgq5
 AsPmVeHNSW96E7KA44NhsZJzrvBCpBpfT3SHInRDMtINsjim0o73SNwy6l2MY+uEUV/hDART8co
 l70Abqi4WnVnS5p7gVpnq4FBL2E98cBCwQD7d/jcFApAagHdSjr6lk7J1VdDVc6KNagM+GWxgBD
 DQniG8NbeWlXTRIKKz4gJPY3d/yrW4WMDw13Bq0bNHPXgzz7QSF14XnW9Yhf2Jk0ZNydkglc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 20f4700ef9969003cfa4728049b9737cb9eb6229..8808be27593b303a2a199a740827c92ea5339b0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 36100e21135fba09fcafdd5d36ac919cd17f63c0..858fd73e0ac3a92fe402001d4796eb86945f61b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,12 +145,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5

