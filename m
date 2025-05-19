Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B193EABC37C
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E13D10E424;
	Mon, 19 May 2025 16:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zd6WgIJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35A810E409
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9I1GU016028
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RzdaiPUhcbOQgcuAO0NcTTKEmE6xihefJV+JUYdXtFU=; b=Zd6WgIJoIshTVbxG
 c6M8aAfAVobAr/YyiW4EB0VDkaib4wzD8JlZzECQZ0wbJ+9Sw9kFF40FsEnlE2Vo
 UZeOH0Am2qGkb4qydNoULdRgGMyViRf5rT/TAnewoEW1RU4htgRoLYaQGSTSBM3s
 jdh40FyDv18IXi0U1IdkZPdpGxbRehr9GMq0g6VIiqpGSUYkJCJRxBP933X/ujm5
 KxQPxxdTzmxeWWi3+ybIfCd22YvUE2FyE6QxuqKFs93MvzYYgConjqjM5wiTS/qG
 aQVSoKYZixjXJDNWpHoHfTn7u3hl7mBBX8CC5O077kWd+/ii85zkXcOq0eTXgpQY
 lTIzkw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnymxpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:22 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-72c40592a9aso3235294a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670662; x=1748275462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RzdaiPUhcbOQgcuAO0NcTTKEmE6xihefJV+JUYdXtFU=;
 b=P4eetXrS28tktDDH8gQ2/f9V0ypoYPM+wcGLeLYsG6DABbbBhBUdNo3ggH2RO9Gozh
 LF+usfBZBY5ANqvSKxBw6fnNG6WyyKLHCBsxJdoJ7qUjz8FsdlnrzliocsLIYV2Dw69m
 zuUupG45CXcU3l+GYDnf9nXgLsXLT7MoBxjPec064xgDR7A0mTlJjFaeEjRtLjWcbr03
 paXmOFls2tBlFVkKY8nnKR/bXm2SgAvCTtk1LTrH67rw5KBbJtz1kUCqWlgIo7BoPcFi
 3Q+q36EILDu0oNgS1RSe6SKUTwfuvhY8uy2MW9vErHOQfRJuP0t7Onj081MkYC7tqJIV
 lbnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWge73LFkHZ8FYUJQt8bN3iDYI/R6yd63LQdfP9cjFvlhnB97S6+wNKfZQDW7h8d93lSDLDidnuIaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjMDzbf1NI0V/ldhyWyq2kh+O3rY0v0L/2UNXWINwB5CJaqcn0
 02xGCBuW56dTjBWsAqZa2IJ/9XiLp/BbDpG7rvaIfKyq7pVW2io1BlHWv3oFMzfdtyF1eKTEjsA
 Ygw67TtwPI9OTZzZoz6oSv5PhEbJppd3JJzMxH4NtM2neD4JtQFl8aStyFYYnn7S7N5x8JKk=
X-Gm-Gg: ASbGnctz+XongZzrQ+2vWnt3cPHvy3A6WdDneopSRccFYEFXmlRm62IpUTp5HVLqluW
 /AbKGJ8NVvbSStDqV+DnqmOHAiHP24WH/s9YNQT2aRZ8As2CdkXrEaQMl8RiIeR3NMzyPXDdryw
 5lcLUUE8F0+KbCelgbnhdpbS9mCTHYxj02YhG2H5h+3KXZUsN++KR7xicAFdqjN9jGser75Ru3A
 niYz3mLfRwRIkl/2340ZNEGfXYLJOw/27YjPgs81gQ9BaqXeSVlJ1xZINvdFfkVdSI2uf7AsRaV
 COgIpPB27GMTX01EIJ6VmGQFWPAh3jx7UHlINGudVmTkidV5F04F59sZRoa8TyQsFEc/R/efFci
 NBDUFptrKeft7FAGbMnejlD56
X-Received: by 2002:a05:6808:3199:b0:404:e102:f682 with SMTP id
 5614622812f47-404e102fb3dmr8677804b6e.22.1747670661811; 
 Mon, 19 May 2025 09:04:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjcPOULuCPi9Gz8PeN8WglsKOijdjLwIixJjwa7hlcPWR5Yzy4Y9hE8EuoKimVAyoiC66ylg==
X-Received: by 2002:a05:6808:3199:b0:404:e102:f682 with SMTP id
 5614622812f47-404e102fb3dmr8677760b6e.22.1747670661484; 
 Mon, 19 May 2025 09:04:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:06 +0300
Subject: [PATCH v4 04/30] drm/msm/dpu: inline _setup_dsc_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-4-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MEgX/3vGs0UXxx+RirFKOH324DnVyoFKiMBN/zZL6fQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z56tKPsAsQdY/+ZTk79GYuzcy/HLPDbC+oY
 kuiPoh0z5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWeQAKCRCLPIo+Aiko
 1R1eB/9VKwfYCQtW1Ktf1qUs2WDo2JIaaBUIheGmLUyxbRm0ENNs1WPoiGkCfxQ5fcVuZDOKdQN
 DqRlBzIcfB5Rh8tGzHuFGAzKQ1kGQcRS/cUC0J5tQzTB3LyFlB8SDg3ieMpkRU5EywhW5jdv+jf
 z9j0+eZ6yDs9TdguOSwZkTSoiYjaZzEOCpghQoYsbuYv4COqWGtTihhCBw2cdQ/Z3c5nJ0yFKfz
 gkJLmpyPdiTojZN+T2mnvOHr/HhGTbysK4AH5cybBTnp+hgASYbMnYFewxyNmf7NZAzx/o37jzT
 ZGB5K6zOh7AoGRTq5aZ4ZkkxkY8sjFyn5i1u1t6iCsCcCnmb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX4XsoNPEujME3
 vsaWG8dDhad6CcZ1RjMfeCMLPzJL54K3QB0Yrm5argkF8GWl9t0Z28w87DnhOnvKdzAq9qWyIsm
 +WY8cPjFIOFyqW9pb6YYerUlIZ3b8kdOOvewFSoGWwa6CVBzOsfr/a9EGWi+CtXoe1tfbu5YgUm
 DNwSauNA+fLe4ZcTZOGtg2+YTuwNFNTIsQS0r8kkYeV8DuN9pPAPWh7WvvcSSvU80hW4eXRiNf2
 b2NOeJ+n1zVH7UOkzcr51+S23GwGWbbyi1ZqzMaggiPr7povAUAr5lJNCZ1Yv4AViC24SZZbCXy
 /MDuZ/PUrG2PnI/ZTwWGkbE/0oAchZzeuUBChuqighj3dfFusyAKWBkBQ29ygeO4UBqTar4AnZP
 vrkyXKR4hjv+qrWKp3H5Vujn4rfZidx85KM5RvMuln2jLohmUGwDbX0uYf9kMNrb8vSRfsmY
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b5686 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oZ3SCccCLKehqvg9oZRXiFCyjUdqvHu4
X-Proofpoint-ORIG-GUID: oZ3SCccCLKehqvg9oZRXiFCyjUdqvHu4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

