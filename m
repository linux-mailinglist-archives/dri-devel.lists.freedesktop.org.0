Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDE8AC13E3
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BA8897FF;
	Thu, 22 May 2025 19:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qbu80mvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B58210E7FB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MIA24Q025025
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4Qp7jh1itM43n3wIU7h6lhpLC0Hmbksbm37fexlcjaM=; b=Qbu80mvUioc4fmN7
 UNATFhvrLnAQflx8F5+aZWsWGXYLV+fRJp6hQ/XNz50V1uvClGLyLRaCMpDyoPQ/
 vbFpu05XVIJnp4YWRSj6x1sO0hBX9V8mo6KyttbVsuU1P6m65L/i6CBHa+StCfUz
 fwf7buYsIxa5GepOdVwhtU6saBm1Ii/JofAmgpDZtc5cczaNdchj4+3zMg/c70S3
 z+8Tr4aHA+T34j4ZV+fo+PjcO25xdUqN+Be1EPX0Sx/nH9sdeaSKNOd8gO5QzODY
 Ax2dPnY+V+JLGe8i3qFaTG3QLuxcrxJ4Ud4vgQY56Wc73xOPU7LfIpLC6FeUuoRC
 jltO5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6ybck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7caef20a528so2141595485a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940620; x=1748545420;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Qp7jh1itM43n3wIU7h6lhpLC0Hmbksbm37fexlcjaM=;
 b=Aymv2oCf9EStiE6u7758Rxwp/ZBXViAUzSyI2bxOvCMD9z6kuBnEkzd7UMiZCW8ORv
 6fgQIs/iD5nu5E1Aan2nbfo2vFvzGHzzdirgUpFY/u1jXQEBGgtK5bcLCztCZr8S6h7M
 wMpGdBzyzCuaysEOvXrXQmATq3KhTdtyRwjUP66RfIW2Q1T6iqRkQCZqHyw78f+arc7i
 XMZGpWrqD4mnZpsaTTHvWLUsBt1Ux5j2pae4vJUvzfNHtCC3t2cqLzOvYU1q0jBmLIOk
 xY9MukQyjY4E2yR2sNXiZ4/wvBM50fnTTwyDrmVXY/HPwKhONh2MEWhwJcEZPrZOg+qZ
 sdjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfh+sorDwv0WBPq+I1f9y1jYNao28fpxkMOK2krqNXmsqDuMi9OGLpL1JC1j7VzelasLXReaGra5E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhvqp5f8tQppTo3ab/8i/0VBIiaeCvvve+vWro5CvgrxM7yAda
 knDRF6+Dh1V6ZBdIGXMIc0vinN7b7Yi2IhyQs8J3uttWixlYy9g0LcrNuoCPNBoIvu59A17sVxu
 dvOOnpaiCsG7RKpe6gJT6fD6/OvIoxeesZZStgKuRmsB6Utt0h0q2h8PGqRhVg4Zmn3kVPM0=
X-Gm-Gg: ASbGnctysTnuo3xegsQL96xbvRiwPGXHJsgqM9sHo1GCTlwkEOB0Vk4SEu815MEgIUA
 CR+iC6omgi1EzIn9CEvOqfLx8owZP/gHnsDbmjVEds0wyulbkHbxMBGPJYidR0c34RCyxItqA51
 hkDSncmYdAnjR5/31BbiDJcRFx9ubhpeCurL47DWB65497hsh+bCdM1EpNw/xcIwEzoZpcu9RvH
 TWHR2IukfLSbkbxCXr85oAl5JSb7LEXHeUC5IP89+fL0hPrr7TBCTubR5bdfBQlHdDzEA3f1/Te
 w6QytoOcixTZ1lYFf/fvUCGOmwIekBvQLuKR6B3e0LgwQBWN8irk3MVYWT3hgFB/wXqPgLUTwVf
 2QAn4FaMcJTbMoHtYFMIAB7Qf
X-Received: by 2002:a05:620a:404f:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7cd47f1dbe5mr3834189085a.18.1747940619841; 
 Thu, 22 May 2025 12:03:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUWhtLxfwnjOCeFjmQwfRQz8WK84FyU9B8tUZnS1CJObKXZJplV3E2lQi6/zI5UpsVwRyzxQ==
X-Received: by 2002:a05:620a:404f:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7cd47f1dbe5mr3834183385a.18.1747940619425; 
 Thu, 22 May 2025 12:03:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:23 +0300
Subject: [PATCH v5 04/30] drm/msm/dpu: inline _setup_dsc_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-4-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=V1gYZpITbFHVwsL98bgMq1gW9yj3xDgdHDTSQqGTqRI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T8U24JiUoIwCb2cb4lL90avZ25jIcPH9tnQ
 pm8S/lgNBaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/AAKCRCLPIo+Aiko
 1acvB/4yq2iMOwDZTbHU9A2g9u3rON7AJ+oqYKcsLzdrCpqTzvxHncYO/qMgQbv0QsJMwTSYxC5
 qMp4hIq+t2Vma1YyiZMXgae2tnodTMiA5QGfy3R4MejvdoPf2vWROyIJHaZ5q9+6jjwwT0vG1cw
 ujnxqFy6WnJ1DNSCDIp89Hk7XE0gDbL0iy27BeJ2c3606zZZ8LAy3Lktjcv5X6D4fDieCXVyShS
 i9aVgAfUUMGFrqfCKFIfzc/uKRWVh/zAL+dkAb/SN31YSaxd6MVJyIUcN1eE96bAGdwW33Ij1md
 FePu1u2uE8S3WXEciqH3O5qHHTxWbaGoPhQTRudDI7CJX+jk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OE7622rv2lVt4M7i91YJvJL6US84z1SY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX1szsUE7JIGtT
 Gsb2d9Goeoksn4Tp4vNGPljLzj66s0aLd5G9h4FvVtT3y2aVri8o/J/dQ/7x9R7JJs8xayGO+/d
 6KWlxCClWvfC/6WMmwErg3LWChJCjafqVCwf5BzcGQYV7N9T3LKR8QXfLdiRk2di9yzrrrcb8vY
 YrpIZ3dwLoNogE52hHhekZ6d27WpDinyYD6jIAbcTYELaH1hmYM50fDJbp0DMzGWWBOlAlwHxyW
 vhXltATmV6vTWQaPi2HtwX1p3losFOQiulOuStYJcVmgywDvtN0+ws2iaZrJP5fX7Z7wynvy9CQ
 noMO2PkADWfqWjXp1SNPUYM5GzbBm+aGIpLsve8ci5EoxuAGyoxk11XGn1qu2Mm/R68lbzljOV/
 ThZxRqs9f/vJWu75nrk0CQxOgrW9Aw9oKD+Em2k882CdTTICO06Odh7j52i9PKfy5Uwu49nQ
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f750c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OE7622rv2lVt4M7i91YJvJL6US84z1SY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

