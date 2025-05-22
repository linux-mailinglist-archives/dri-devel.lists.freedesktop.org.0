Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE3EAC141C
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245C110E8C7;
	Thu, 22 May 2025 19:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2O6AG4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D4210E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MG1cUH021020
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c0eWB31rocmlfRu/RyQnz8gUXEh7OH1MltE8TFCrHLU=; b=o2O6AG4BqR36OSah
 Os5j/CKCuMjniY/YOCXrzXhTb9pWpQUm6kHw1ib4a+mT/5oeAIOcaqm9BV9M09xC
 W0eJmNNFFSZG+PhcbUumFQCuY089KwXlQScmzw1P7kr3qFit25MaKSFGIy1cT5b6
 FRjDIiiDLpzNBFHDIop7Y1yy6QZ60KD8cwUbsLdIPVLGS0tFvdiaOwUVeuSyxTuK
 sp1GRjtT4owvk0b5+hb9gYU4oAAGQZGEqHSWQREM2l0lBGKkpbhmKMOCLQyW+IS0
 o5zgRlCjhLIklqtPTVWpT5Og2NYqz8jzNoTFn/TdUJ5rW9Pj+IAtDDVXfjlqWvbn
 aE76AQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb5v5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c9255d5e8cso1408637385a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940691; x=1748545491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0eWB31rocmlfRu/RyQnz8gUXEh7OH1MltE8TFCrHLU=;
 b=AlORP+a+0DBw/rljiLpKzCicbo1F5h8hEiYV5Mug7+uRQMytUYQfvKoWbZeEsuotlI
 0NIlHr8qLgkQOHR35hUZGgyW6/KtEglTl6NwMJ5Rnmjxf5SimNVJwZtMU6GM35xjyQCI
 LI7EBWbq/AcUvpBAvtIbXX6SDmt1eLg6FxyTOABiJAYeR4BPbQpPwEkEzZzreVyGguKi
 ZED1vMx+IC7TCDb4f9+PRHz8SvJfkkpOuoZeodq5/nWx9/PXa32jrvdDqyrCYm92GQDc
 dGUU9EPI2IzM+9miuAY6n+4nNeKJKT6sfthvAt8g8N6IT30x3+uvKGwuInmWf0R+gKAH
 iJew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiMz7uWimPtATKSjxXYkEzNi8M7thG92/jR8+nTI21GuDSfg3t5ly67RtYAsKBiKHRnnqgj9udfSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUoDPA7TzyWS5mRff36ryXhWUab2VlyVW5U7JMT14Eih79CFcA
 ZO+TyxJg2y+k+Q5IT6x9VP7IUCyw0KtGFB0Z8y2QFsozqwfAiB3uqU4dQKQvXsLTAbMJ3kIKwPn
 aQVbGlzV1x0aWL9dUB6/hg3SF9xRFcV1U6NdB3O/dSkFvXZMQhVK5dLyjpKq9/3BYkg7wB/8=
X-Gm-Gg: ASbGncuW/H9vC1dFl0OjYHUXIrF4J1i7d8e8zw3SmSh+TNMRf+VFZC3K+DoOirQ+UaG
 EinGCO4ZL6wjLeEM5en1GKy+BZx3MGFho641x5MbFFUDpJz2xhdFBdr0s3pFytgmNQj4rUNaiBf
 lpIoWt7bKcG+mZMbMXJkO2qWqKV/utgrtPqh9LLFB3Dx3PLPowF15UJ9R2XSAQMMp73SJYwulwr
 FqXdfvQogC0Vrohw2XHblDOiL/npKnXbM8S95Gn9dR8J931/IgRemFrv+HV0BcfbL+Zs6jqDvyg
 i+hf63g+rffdf13aDUlFrZwz2C+FMt0cMAuoNIqeEOvjZKHCAyaLOom5LdecjCI3VUiEtmDS74c
 nD+/wdjCwee1cO2w6mnJ/wkgT
X-Received: by 2002:a05:620a:244d:b0:7ce:bdae:8a6 with SMTP id
 af79cd13be357-7cee31e2c20mr8934385a.7.1747940690947; 
 Thu, 22 May 2025 12:04:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWeyT8YuS206JhKQP1qx3xAjKuJP2j0TQhVWUYqJTT2hjs7OvTMzPQ9H3knJ10UZblpdlMPA==
X-Received: by 2002:a05:620a:244d:b0:7ce:bdae:8a6 with SMTP id
 af79cd13be357-7cee31e2c20mr8930485a.7.1747940690601; 
 Thu, 22 May 2025 12:04:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:46 +0300
Subject: [PATCH v5 27/30] drm/msm/dpu: drop unused MDP TOP features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-27-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/9X7zCyPLMB9JgfInfLiu//0xvw9FvJ2BmQNEpS7pFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T/AMM2dpp5tL4YM4Flz6AU5HNexuGwt28tU
 dtIqZZI6YaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/wAKCRCLPIo+Aiko
 1Y8IB/49tAdM/XYV37ASC3Z3O1NA6waaBgF47TaEVpZcrlm3Z1HhAkvOMKlsx46o0ipm6Kvh9ms
 L33cBcEyAuP0UT7NOGdDaXOLI5KoOdliuw/DFVwDqEeWcynPbmrc4KdL08GvzisqwMNM00i47PQ
 O8UtxIttLYX/SUdFzOLmTFBYsb1wIzIYYVT5na7RkcB/aIxYiH+AjIYx907zHuL40NRKRma7X+X
 RlBGn52T+7fP11hDCaSrHg5n7O+/8jTHJA5pddr0Q1tdkcdSpX8dDXQjpQI3O3joZchVP8beuNs
 l1b+HQ1BB7dZrefz8PjvzLk2Lfc8tY+ZSgx2ZrVGz3YnbqTf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f7554 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8brcGD95nZB0FecW0AkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Kx1Bco-CHjr2d-DKTtZuImSjhjv_ic6M
X-Proofpoint-GUID: Kx1Bco-CHjr2d-DKTtZuImSjhjv_ic6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfXz8U7SbA3c0/J
 maGd8hSdAmE+tpiJSU+CiCaaLPcfFUmqk/6fA83K73c1UPTw4aqgylj2zipSpgFlxDtj7AouhgW
 LUxFFFBQ3XYKeH8x+DZU77jXUc2Un9KKC3aRzgR5JchuQ8L8Wdovlt2qg7+wgCgbMR8BMZcGevj
 1Qi7JD461M0TNCtuMPaYBKMcUDnqtlT9bAsN+BvbFPWfn+CmxJbjJFW3ZhJShQf4tUVao8OfrDU
 Te0I6GwUsI/e0PQz554X0LSR6QGod8rogXCmjrSQ4/yuI/KwBtp8PN7Z4u/aBqQmrnzQsKdX5hm
 KptVHkp2dxCwKuh6zPdELGjl5eVi5sScgbFrCIQ9iVU3cAw7wCCcyDXn2tjXcnFS4JW8dfl5gpD
 8FzUucSfLTHW1P+ziV+8p/kDNcA9TzXHnzUuJOdOHgUmuA2K7VHlANidQJ3YNkrbx3WpTRcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=877 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9..9658561c4cb653ca86094d67f7b5dc92d36d38cd 100644
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

