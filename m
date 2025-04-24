Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508F3A9A7BE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AFA10E78C;
	Thu, 24 Apr 2025 09:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGFXOq5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F8710E788
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6wq010223
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c0lUvSTsPxc5lkWV7yqgUJckTrtbVC9CMumomIWomoM=; b=pGFXOq5Or5ttyZJ2
 +4b2x6Zaq3MnjPshfANAVMk3Fu0aPE1ZmlIA4ACYjleyo2vLig+lRYhONHBXcfCk
 i/PTDBej41EBDfkz9/NpwxGnip4LHf2FcSTC56bwIrqNLqRSlrgvFhxRBgIY2izd
 Ve2K5SfZCj+ex3fFcOrXba3DbM9/L7M7moZ9vOETSW2waBMqOF3vAUc7ueWixhtD
 a9WBzN/wort1Sc6ccbOs3U/Y/Nc86cYBWV3UKYw4KMGWw2tWHDp+YZc1gTZZ7mBX
 voxFnxdb/3q/rqfoGnDIofKXyXTKWqLNq0x+ibrthwD0zIraWrUCIoF227pWw7/J
 YyGbsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mym7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c955be751aso128710285a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487032; x=1746091832;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0lUvSTsPxc5lkWV7yqgUJckTrtbVC9CMumomIWomoM=;
 b=oqlzO19gSCTbU9lxFjNoM9ixUb9uVMy+uQAc8WIr2qPhntppWludQk1aA0S/FinVkl
 5S/9vnbOK+l0ozyZz3jT9ppCL7dNq83ksXVMqjJIGWvaKMIhc98Ot4LMfoonwYytIV2T
 jVulvlHuTyGcJeoTfi/oF8xk5Gi4pUOW1nfyaExbdBajQn1V+CufkDmXAtXq2keUHt+L
 tPGWO/o/VMOjQZq1Dvc8SdrkxTqYQZ7asewCqxOl4g6zn0ZUzjJ+5Rj8QNULY/WFi38s
 sXwVqN1vd6ZXvkxuG8Tav9s13cXRqfua1EeYh+Tb+VkZaM61H/Rh5htyuCToXFv5VMK5
 d5Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSt19OkR1xszwengoGIxi4z4KWSUrceY6svjNXJsBm4DfpvR3BdIAvf5SdD4aEcgb95bd9iO2wD2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6PZcy1PUV25pQgS/IwMHuC1nLPYRlB1v3651e3JRUmnGgIiO8
 95cIR+Uv34iF6/EHCqT7kVxaGEamdemKHoinHd77kqzK1TAFUb9kHDwQW1ejTXZbO+3E1sZbaTa
 RFQeg+BDy+rngwnATCfp9VGLvW0MHSUzvnC3hoCcK0pvo77AKPv93MgPKQawWMjHhfzY=
X-Gm-Gg: ASbGncvUCWqTpPh3ZwiMPACF1q5T1KkyfeFf4VdcSyGCOMq9VbdEqHDm3bGxMBNElfV
 3WXn5WPTnIPZc7qFwLRvoKi2lUfd0qWhTAypZxKN7FZOHK3YT9Dsa0SQ3rj8Dcnn8ys0cZZyE7l
 N6T6ljBuA1TB77JMK4xx6FmosInDSSQMXdi77rLm3ONu+mkYvzfYBMlGsBtJskxuUxaCaIDOb5M
 a/d2mB9b8Z1q3hMfOqsmQoe11Kz8826PXXLJkEo3S4s55wF/bpRBb4ZVv1rjlU9MuDc7baInqTP
 P3K/f7mv32/KgQ2V7tgupiSRbnS+u4RFTD7dD/RsWrarBmM7w64BD0s6ootvVT6Un06ZC03Qge7
 zJTpifi1By3clH5gtnTQWzUXv
X-Received: by 2002:a05:620a:31a0:b0:7c5:3b3b:c9da with SMTP id
 af79cd13be357-7c956f334e9mr319893285a.40.1745487032123; 
 Thu, 24 Apr 2025 02:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWUHHejoPAWrPi677FUC/LXOAzZqmXm+Nu8bw/i4Gd23G4xaODXoIn0yKuicCcUyxeizcG3w==
X-Received: by 2002:a05:620a:31a0:b0:7c5:3b3b:c9da with SMTP id
 af79cd13be357-7c956f334e9mr319888385a.40.1745487031797; 
 Thu, 24 Apr 2025 02:30:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:08 +0300
Subject: [PATCH v3 04/33] drm/msm/dpu: inline _setup_dsc_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-4-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pmq5vBCUeBdexnqWIWU7CFkRwfE1mAJP/nnHW7qtnOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqhsEhQWFa8FUQJirnBAfp4FL5UyiZYwL2j
 KSWqcA0JxaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1RT7B/4lgGUG++hlUG/YtsFmd7Qoh4doQsDs+oVgtZvTumibpfEr+jSMdAVQEEydNd4LTj9r/3e
 7XJmv/FoQpLM9UXzNq565hGC+f5P34GP481Q8iXLcbBHhtJCX+SjeNxfP6fJRh6pC6NWhbV44lG
 iUmCXwzAYZUnr5hM4AQ0FBBlCGDZ0L2g7nW0WYbi3SQrWUK3ZY94wxeldCbk6nttodBiErfRMee
 Spk6Jv401RlstzoR3jfpNXozBO4tDoiBBEO4UavQHnldyWVXJ5LQDA59mar1bu8eKyn2sbxmreF
 lZmJtj2JU3tSoto4IKzJQ9w0z+jjPbxlB26AG1+jQp4dQxKv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: eMAqqwQRf8zJX1ox7VwYgcHtrjBOrtY1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfXzSNaUU6rk+LL
 gXJZo0qJADP9aeMJmE36prkHYf642vQsOLeBnu4+tvfdBnHDuoyEeRgpSvwqFwZGmw8E1lu5nOf
 9ECiVwfAOuAgqoVa2t8i8RqwzovxERSfmXjkacsZJSby+qXzPRXK5U6DcZy3UTAEzNh4kOVTsVZ
 uNICg13vOt7naMv3UpU8OvB8ZKgAIzvi20PLkiZzx9z/Sc6JR/4rTeoJTWOvR/7ik4ZKus8LWWf
 LV25HnBULuFHQeGOrUxKsEYFVv2YNrTm2qJwNN6qX3V5sadE7mz6O7+z1rJ9BmldaAlE7/dklI7
 bDUdF8MU0fdtFNznERc4PAyacayepClqQLDtamq4mu+NjiRXY10YDR8+P+NRu739FCf6hhL5ekf
 JwLHmWQwMSwAP4pBMJIf5n2NAzXbLqBBbdoOPc7OOWISFlmA2BCFirKey8AYokIBt8ro0RL6
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a04b8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eMAqqwQRf8zJX1ox7VwYgcHtrjBOrtY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062
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

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5

