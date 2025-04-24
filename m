Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9C8A9A803
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1555210E7B9;
	Thu, 24 Apr 2025 09:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lU1fROQD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7964110E7A4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FfQi029355
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nMj4nXb+FNu6Q2Juv9wtWeinh7kszmTJRVSM9T4R8Nc=; b=lU1fROQD7IA0YtY/
 PVDZZzpgrSfPXrqoOmJjOkMNPX+2GY2ZmoSFjgXQOJFQccsA+BmgvevLw6CXBBjY
 gXmjkhU8yzf+wjBGwBPYz4l+HwbiYmy+5XX3YxLCU1DPX0C+HLkR+dl3LnLR7NZ4
 plxlDKkECNxT02/qaU9Uyx6GR2EebEv1Hneo6Fw+JjGAiYDJ4kN31BBB7GyA3X97
 qMdDCLdF2nDUy+POGik2xnSzrrtMGt40K9MviT/ZmdzC3KBBrHl9YRAkhA+lygo6
 0nyIJzVhVIEe3UUD98inH6VbViEue9nV22GaJoru1lyoMd5bpxtSv13lNx75gQ06
 /5J2yg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy502p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f0c089909aso14795936d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487077; x=1746091877;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nMj4nXb+FNu6Q2Juv9wtWeinh7kszmTJRVSM9T4R8Nc=;
 b=odOeZNO8f1YIMUHPTVGRAokkfCEqdpAL8mAXYnaJ88g6SHFSjGPueFrn9vqAOPYI/O
 wcXQVfEQiiKv0E5jsPwGMUpUe0Y4wc+sa6iStjJGRalLv3P46KXTLE3IeIWq4iffEipD
 O73ZU2ZSi35g0qyL0B51A6ykuFKH5BG62YSA6dE3R/Pqm6PBgVL3khArUM8VqZOZzg91
 BZZ7IM1lPs5/r9cW77uSFewr5msn8QyWFdQ0tlojZdLhLpXN/kTBnot77liSz30Da0es
 Tmnq8W4apjtiSi/nv9O8PqtBSqhRv5QUfLb9izyuLCWT2K/SOFXGA1OAkHIJMro5wOG/
 5Czw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG6yKpvy5t7ukWfa/gc/kkCjzaw9022G95XUTuiBX35PrYHv/iEWvD/lQtOqWFnTsK0hRcukmt+M0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHZssjke7QQ9b3cYA2bNte3nhtDhmFHQOLAFxMVyJ/u/duwRLD
 UpcGMxeSZTNAlkKmk/CvKjAI0iinv4UVZjUv3WQ/H+lOT3GO9BD7kIJPFsd8BdwgQFoMlVjkZHj
 gKnfbJfvAWHlxZcM3jXp8q2eCPqjzICKs2RCUozLFq1jNM15pYv+tDMoMrYc/PIexUQw=
X-Gm-Gg: ASbGnct0aw4GegCULH//G5FOd/7GEwETMx7E2c2DtpbuPD1y3RfDV3wIVFVUDytMvde
 M77YxTP+9Jrb4TbWACMrFeYQZ47Ypyw1R9Db/6VCYX91JiGRlozaeRPBIaWu+LgkRjDiNlfsF6I
 CAUXODOqaMS7Qf464/LcpGxyZl9vfugHuFfwG4B1aLcQ8RgQYMTsxcqvv+uPnW7CppjT+iNOoey
 2LPzd3sq5V3vT/FCehHDtm74gQRhwVoKFeLrduZ2a6gs+ksLHrbu4KLoKT3yw3CNpQMNxjK+5te
 mv0+HqaknhFmMNF7dfcT6ncHUltZlRUlKwHQUtAAqJHDe25MJ85aFlHOV8UebBMSg6eFZ5MmfUV
 NY8Q1DixI29ZnJIorXhPEmNZH
X-Received: by 2002:ad4:5d6c:0:b0:6e4:3ddc:5d33 with SMTP id
 6a1803df08f44-6f4bfbcff8cmr27765556d6.13.1745487076953; 
 Thu, 24 Apr 2025 02:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1W5a+5gc6B7AlIvLZnfYHMfxB9iNdzMWs0zrgULP7xrYOYblEfMRe+GXwsC4GjPCz78vlVQ==
X-Received: by 2002:ad4:5d6c:0:b0:6e4:3ddc:5d33 with SMTP id
 6a1803df08f44-6f4bfbcff8cmr27765316d6.13.1745487076645; 
 Thu, 24 Apr 2025 02:31:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:31:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:31 +0300
Subject: [PATCH v3 27/33] drm/msm/dpu: drop unused MDP TOP features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-27-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rp2b7HkiPFY5uR85fuuwlCMt0ynxuJbG+1cuM8N4RUw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSwjwuCAQPtAtKCggMXBPwUBGbkT7v7GHf+a
 Z9r2u+vdYWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1YWgCACFeezcUqdWJOjr5b9efrq41SoCRN+Gl3gbB3ibrA7vRHOKAhyutBCN0y/vk2IOE2GRDzC
 qkud11KikADnf22r+/abp0uHrRWrLvISbb9aHl3QLsy79fH2HgN1kxYqhLpvx/udJTnqARkyAmW
 sJXnmAKArZllViW/LmxbDDJFHNy3GwT4PXvanCV5a05EQDmPu8ArtgpagqAauykLpJbhnKTtt3m
 3AsKQj6T5dpauSOMmC03gTNpc2gXuzi2r02mPVECpfz9hnsvbGvpf8yOJkIBqJlbR/BNRoeEsgf
 SohlW13/BA3b04T0rthak5t+q76AbJ6J0jhPZCcKytBiuQHE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX0eRwE3n1Bdpd
 mp3dGJkYM9/KPG4SwZMVDuYNoJyCv7i1lsSsQnZenAD42vbJXpy5/R3ko/H5oMp8xRjxAsINVqA
 5PRCC749UUZbTJ8HkQ5PVMRLPhOw1L/SVRjoSUDlV5p2laLEBrieb9rKss6ut+g95fXs4kPnOHC
 bN16Ar83KrKyE75K8XzfjfC1CuVQBb7aek6q7YwV8ql1vPclO1+0yKMdcTcAVPYWTq7qs9jc6IQ
 LXBPjUS8k4aQdBGXluXWB4Q9riBjByMwyxcSUTJjuJCdBJk7m9v3cldKaqLfuuvjaESYT7+V09M
 iRwdGOfSdN4klNG0dpv4tGPAmX748B3inbbKdYeA5UqFeQsuSdcefwTopS5k9QiinlIdhnvRBgm
 3atGYmHyd6vpJ1abEJI/vTgfMQJF1T4NIbUECiJ9vpqJAZ/SrgA4WLEG423z7DOaNZqxkKQu
X-Proofpoint-GUID: 4ze1yFQX7Yur-tWU6ttThTlYKx-gJIcm
X-Proofpoint-ORIG-GUID: 4ze1yFQX7Yur-tWU6ttThTlYKx-gJIcm
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a04e5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=8brcGD95nZB0FecW0AkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=798 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 01763e0bf1359527b0c441ca36b27264dad636c0..4b6af58429361c49b71f6067dce8ca1daa6493fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5

