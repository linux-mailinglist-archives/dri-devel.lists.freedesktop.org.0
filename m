Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0587AAC13F9
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B34910E81C;
	Thu, 22 May 2025 19:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPHlmqgd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED91C10E80D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MIA24X025025
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SAXuCHIXzob7I7yDg4by0JQEOARzxYVn7zXbtJ2VPvk=; b=mPHlmqgdOd+nPfI0
 NHDnL8hyhJjcyor/EpLFFA546rCa0gX5hsTTx8ACMqWiTlCdaRddg/py1jqfFpAI
 A/xxHkY8/2nn15WM/xohI9f+sn6+EQo8CloAE4LZRSrIVcZOorbBmzpXrLKVBDBv
 KOa466GL4dwwtsW1/gDsvcAcULvDIZClTN6epOhVRVbp8dLBbMzoxVopd7pP3jyg
 Jgc4CeFkg17280DBE2pFh7Eq3MqDCMdYrD/GE4T+Iz9EJos2NWUSFtE9PqdCdWEd
 xAaNGlBS+J6nq3XKyDT/TLjK8VLyUm2DvQ1IxeTP8to+JbhzLDEIWv1q9Ip4qT1a
 NtgdDA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6ybes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c793d573b2so1453384485a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940640; x=1748545440;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SAXuCHIXzob7I7yDg4by0JQEOARzxYVn7zXbtJ2VPvk=;
 b=P+Q/t0ox1I5hk7xzVS79f38t9uUnOLWp1HQ8f0tLw6OAb1SQTQ8jb0f0zZlDvk4M+i
 ihPzGVOWCTZyiOSrwKxgQSc3V46yBIlGdB8rEM8Pot4hJcE1Xogq6mBTsLyvpFPE/ftR
 GA6DsFxgpRZFCtCtPLDto8BqaBuPqRm6z2DT0CSiQS/vemb9fXkfGjaJ2GyVpXsBpBO/
 Yq8hnZOW2edeap1QqXvoIOvadRfaGvhZ6OvfplF+OAeb1i+zvzbOFmkbQNo8DwV89mxa
 qBfwSGnt6Y7D/n5loJbU8rbM3VpPEjako3VELGLdWmJ6hPeP6RKt2PyqGyOCKq6yU4Bi
 ZSUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrueIPqEyjwv2dtwHPeZdGYlbnUyatT54q4JDB4LoZEseZorRhn1frcElES+iFSK6perWRTktBsig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu4Ua2hMZGtnlCrwuTlgu3ciTTYV4F4XRoGmHhHuAAls1Z7UEY
 rcYUr9YUd8mpcV3fLhy4iN+LmvRhw3U+XgAwOxbLbnJEP15o0x8+QiK4yIR/1yWFJSY+TBvVOvn
 EPK2TYg+q4l8MhPpPwhXXVLMtCMxse6PwK5F48S7klYd+y3uoNBgtS4UdDtEs+a9gpOO0dRk=
X-Gm-Gg: ASbGncsBOBk7YazpXKlGcKuxD0PSRySV2rio1zy2cm792AcwVp4c5HIdZnrFQN1bJVe
 sldOrPkRKrbGiLeh4Gpt/eKU4K0i4Ry1VZIAXsjhunOxNVkJ5wgcfr9HOLvTRjDp1v3VLgLqgbr
 u1RYHdxa60jIFgRVcBKq8xyFo7PvBXZT7V632FiWA5tQ9JH/2BH3DmK1sYe6nEQBLgd9uOynPpv
 p3QeckOA22gqjzlLtZxYYS5LI5LnFUoqg3qp1cs+fzGjjkbYMcKgbV5+NEpDy5+8FWxMWyo08QY
 J9OZg1SikrZcqBmmuxulA626HYHHbqaehET6ofZkL+0Fhof5T/vmsEXn0ydejy5iXf4lK3Mr9+I
 EqdpjmjmUzTlbqedF6AdCQlxf
X-Received: by 2002:a05:620a:400f:b0:7ce:d352:e2c0 with SMTP id
 af79cd13be357-7ced352e386mr1146829785a.25.1747940639727; 
 Thu, 22 May 2025 12:03:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtop1DYOBlB+JkelLga98KWOgpBTnz/VdiqX4EP3GRjMG13kaJhcMsqY3geHDRZhiht48xFA==
X-Received: by 2002:a05:620a:400f:b0:7ce:d352:e2c0 with SMTP id
 af79cd13be357-7ced352e386mr1146825485a.25.1747940639378; 
 Thu, 22 May 2025 12:03:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:29 +0300
Subject: [PATCH v5 10/30] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-10-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2649;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=73PNb9U9hPhtgDIYoKDO+U5RvVBCB7fQuR7leMk88VQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T9Ulgcc13VbVg3mZTLs57CraySRoXFZ3SMP
 Xnb3jmUDjiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/QAKCRCLPIo+Aiko
 1cwyB/0VZxlJnkCsz1D9/IronGDMdIKooY2W+C8xzh923SPBrMQs1H1xI2jVhTZx+u14OTyjE0R
 SNUFfR0RDAbgcVxRmjtHM2iQFpLNCfzZae+qPvsw4LhwZEI+dQN0Q0nmtaHUnCNiWt2cBtUni0E
 DB2ow8sHTIMbXq7vWcOgMFJ28Yn/ZDvsp24MMI4UO4uGoVmkT/h79xCSDZ29k3Olh61DreMw8a+
 +kC2lb4oW1WemQu1BMBLsgGzUHRr/bl4grnC1Ma7M8kZlUw/dT6Atug8bzxJyvgIPg+THdsEzH5
 Y0nlt3/br5DFL3aipAVNa/V+I1gIxso1XumVWcETHsAKxFaP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HtvsXiwpy4lM9G-2L3a6bifDD_H4inbM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX8UvW1cxM1bmb
 Hlg0QTBm1Q7NmnvMQs4rt0qaAZth2ytcLC9wEEghNvaeBIWvPersJhc4+z2jCfQbPFumEqJVy2Z
 C+ywvdiO1vRg5QkMTgY2G92xlvS5G9ZCBG3bJm0ojt9NDnCTuzJnmCwqZ4hmCB7wRuS+zjboJD4
 /rluenGh8p9W0fyY5aQRJ8hMXPdbAzywBFWXRmHhKaNO8uZEmYe7GL0nUO2e46XATQnjnnCGylj
 x7ydB3Aealza4HbraMYWZ7IuPbm18QA2yO0iKAMyfw5Fzop6d39Q23Ylc4jxsK3mMgVXBlsMLU5
 yuhwY8MDQol6+BQ5pKF4v/ei2yH2qf33ZU1yQ6DpOaMKNqyB5P5K9gaxlaKQ1/sIvcPyPRKjt3Q
 DFdVaM3M3OXKmihBeTnhES4YLGlJPi/2/TNnkiN3N536Zpf2u2Qao/9YXOUIBRpRNYzGNEjt
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f7522 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=1CFBwsujT04XwbEipTUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HtvsXiwpy4lM9G-2L3a6bifDD_H4inbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=980
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

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0863e5cfb3283ed32f61ddd4483220742df8633d..6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_FETCH_ACTIVE) | \
-	 BIT(DPU_CTL_VM_CFG) | \
+	(BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define INTF_SC7180_MASK \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9981d090b689b46bbc378d1965b0efd1df0efa8b..82f04de6300eca7d05ece3ac880c26f3a56505b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -132,14 +132,12 @@ enum {
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 2dfb7db371a3915f663cf134e4dd62f92224185b..772df53bfc4fcc2ff976f66ef7339be1ae3da8f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -809,7 +809,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
-	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
 
 	c->idx = cfg->id;

-- 
2.39.5

