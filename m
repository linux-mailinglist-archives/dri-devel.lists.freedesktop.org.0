Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEE1A99A3B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9B710E2BB;
	Wed, 23 Apr 2025 21:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnCVF3vF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFE110E2CA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:21 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApLrI011954
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QYR8ks14WTLcA4n7Z2f976HkqtO1kBIjdRCHab5Tyz4=; b=RnCVF3vFETjAwIKr
 K4K51L8Ys0NkwEeqk3RpwbINwF20bScEsj3381LZ+FhHPShoWqVhSkk+gOBKSDta
 be+e3FjUzLAi5kbUGuQDdRMKX+XSzWsIad8zSz9edmUHwGQRPthY27uxrQ75aT8Y
 0g6tMShXWKwbotm+yVAy5I9uMTA7hbBqqIWZUm0wXeJOSWdFfoTWTLrXjYtWHvm6
 ulUYZBrTLykHffuMwFA1257/H3Me3ApKtMKhw6XRlWqjw4GMziNzeOjkJqJwvWpU
 m6xzaPHiAPY6Eand280KSZWevEEhsKEP2tQFSmEViuu9ufPd5Y4YpZU6Bv39L/8k
 8Q6aoQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1kdqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c790dc38b4so60418385a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442680; x=1746047480;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QYR8ks14WTLcA4n7Z2f976HkqtO1kBIjdRCHab5Tyz4=;
 b=Y1plZudkSoD6XI5MQvsa2DTmF45IMSE+OBi2EgAFQusdSPeTvEADtshVXHJl/XItwr
 1YPHZHBOzCaCrOSwL/Vnme8rjADWBxOyHqA9ls5hJ6ZjnivXD9d0T2EHczfe3MAxgJbD
 kgmZcVkic7GWMOLID5iPqMHK1lWIoHYwvX91rMlVgGCo3DNe3wjw5snk5nRlpp0MofKa
 Ao9pG8y88KI0zN95jseWUO2v55lJMc7TLMTY8n9eRTYT2PE/JaymDLMkAZpSzKDjpFRf
 jAukAsIZ46IUfni9MkY/sKIoN+gvMNqBIljLchH0dYRMV55XmVntjydeBfTCT1gZmywm
 dSKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSBATQtsRuPc9HoUNgcakKqe2dDWIMN9u4PAjZGpubfnUKeR+XLmZPVZD0iEZHMsAH8HLcy8/hSRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpKMyVuyxNuju/Vh+xBKncxDejPK2DRKSIlXBzT2/Rkakdl9kD
 xQVC+HwPst03lzhXZ35asS9Nmi1Sq0ZG2EMBKyzAlUOIUCKg1+tox1SOTME8A/JtFKS/GuiY/pZ
 6Lkc09VJPsJxMgRfy6WeVm8wtmUPpsXqhTi8o/nJG0T+ltHsnSkEt/IBBee3JR+y0A8U=
X-Gm-Gg: ASbGncumJdqmSvg//u/F8YCXNhnPsJwgX24wrPRgZ0C9OueuapzKJddsfAvSZ1Nr4si
 trObzDiuVnSbsmiM8U1eFtzy4CuxjGsBghHjYtUVYmv4zk5mRHYppz+WeY9X9YBmObUK0zW7IDg
 7ggEr+f6pobdktDovu5NI6l6hT9mc0QvRq8gqE+ghVsDS7iy6fAS2Lh8UT3jAVFlULd+kuws94j
 r1CVdE6hN1WMUUiy0LFFfI6JJbcE2eGwdQ/jKTCLlWktvBPycnuPxQktX5bbf2n7aKf+NjPKZy2
 Q5aD7UtdK4+g8wK209M2N0N+h8rAeMIL0oTkdCQ7JiMBd3qwscVRppnffxpESZjdsiwAHYhLCrl
 a89wyOOjVtN2ro/8MmCtHS5CF
X-Received: by 2002:a05:620a:454a:b0:7c5:e8c5:a307 with SMTP id
 af79cd13be357-7c95782607bmr13346785a.9.1745442679825; 
 Wed, 23 Apr 2025 14:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHc9Clm08wXIMSkloNkcryzQ54VDilhcRI8JTPa3Im5SATSs/JRC0sqOSe7Heo2ibj/BU7tQ==
X-Received: by 2002:a05:620a:454a:b0:7c5:e8c5:a307 with SMTP id
 af79cd13be357-7c95782607bmr13343985a.9.1745442679509; 
 Wed, 23 Apr 2025 14:11:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:11:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:23 +0300
Subject: [PATCH v2 27/33] drm/msm/dpu: drop unused MDP TOP features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-27-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rp2b7HkiPFY5uR85fuuwlCMt0ynxuJbG+1cuM8N4RUw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcuwug605fj2frhMONLFMahoGskqNw2Ccr8I
 j19OUUNBS6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLgAKCRCLPIo+Aiko
 1VMgB/9NB0MepE64MHxrGHbxOdiLlpwoRt/c0gwNAOVJSRD7mdmQgFBXxbA4LYeLHQwa0CU0OFe
 QLb58zZsRXGd9b8InXt5NvHlQCLTunAVyDSL/8D7gcWEof+FBZN4DIXnBwknaRPr8pjaDuC2lKp
 xKd4llVj/6dvm5HlhJqrpn3KSFYRAVjOaVxVlpj1dwO20MuhtkxVpHMEXrU3AtrTzLd1WCzA4bA
 DK1kN0k5iA4AyXGv2mJeBR0+Wfru8YQ1L68M3TwMTh+0KUY8tLYOLbAnjekxp8iQxW8fugwhvIy
 HVKtFnnYApZHz4fxHtRkesEavsCRK8Lu5kVXNyIUlpVbKr/a
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ViNfF8wjqakMICWv8VJuusXDvZk1LZ9_
X-Proofpoint-ORIG-GUID: ViNfF8wjqakMICWv8VJuusXDvZk1LZ9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfXwvzCLoypNzJf
 1AdgISlg3gutiMO2jagptrdUVOOTFbiaa6sGkI1yJGZmpp53TfhERqYBhcigk0h7wBBFXIHzUx1
 iOGmFp98Qnw3V8kTF9Y4TUHdgyHNlRbp/3Dfj33i24bqfFMabX0itvmId/V0324rNitJAA+Rok3
 hhvQBgUMYQ/Uspmy9I9GR5Tr/ohuNYsB7x4vXPhurxeV6kfRQ24AfPryqJFlDxwWsp9TTHz48f2
 dlwvj6z/A6Yybiid6fjcoJ4HDKd+nHaHnUyzR2ewuwZFUToezljdQGYUrFSvXFU/qq4WPPGhLfx
 m3BEHvdsWQDpDoZndFiJwyaGx2hhcf8UP1vkxOFgKxIBgz73EUH3nkNA/K7UzBq/pT9ToTzpEJM
 O9VOgsaD2cjZyuIAXuOvNnfkTbT7DFPcSLAVDxgHLdC9tt57X9eA+Y3E7Gjk6hOS5ElKFRC4
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=68095779 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=8brcGD95nZB0FecW0AkA:9
 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=793 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

From: Dmitry Baryshkov <lumag@kernel.org>

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

