Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82B9AC13F4
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C5A10E854;
	Thu, 22 May 2025 19:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c3mb5SO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D09010E824
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFjk04006644
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DVSKO5Tz7Xwh54RBpw6e9ejvFwUu+HWI/6GMShXKYcw=; b=c3mb5SO8ybDVB2FJ
 IE6JfkbXyx5MmfklP8Jl+s3auExSL+0ksHdQ/+t3NPEUToq33SCyGcG8cgG71Adr
 pVXUuI96kUwgyWj+jWaM2p8MAk27JEFi2RgDKPQ0wX51ZJAtXIXMIRwEVrw86kKI
 ub7Oi76H7nBMCjLWI7Fda8Oxp027KJrM5sSSsqVi7f7jI/yQk2jaW2SCqpZSMnI6
 SgpZx6JKniqRT0UW0iQCj1zKfIbFnpYk4QKHb24fK+k1XVGqsfeVt45GP+4P+FYK
 2QfNoN0kx2CEkFzhUXOoWdyn/cmvF2H+Q4EXWfvZS/y2RLhMkefUX+fTzqmqXloT
 f2BaLg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0qkq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:03:54 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-72b7d15aa72so8177238a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940633; x=1748545433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DVSKO5Tz7Xwh54RBpw6e9ejvFwUu+HWI/6GMShXKYcw=;
 b=hvEJTeadicqe9lvkSS+vxjtQ2dfDLCVm/rXehDLmqdKKaGrEMG1sDmv4ZegTecUpSX
 DE5WuTaHCdnyH0lospelAg/mBGYCLLQAmWE2CQ3KHcRSoM1i2MXAutuhgF63cdm35LD2
 ywPdIDmcN8iHdFVSHy1wESMJHa+5o23gXByJmsofP3dJgdfV4VUUpSszwXlzGkUzqtaP
 Quj0UOj1aY2HQDCfuYkJZc//0WBOcKD5o0898855S3kH+PwHQgaJKwGPj0OFC8wgz08m
 9CkFchNq4IpbIvb12zZI5+KaDJf/FQyNwI4/3hTa267u2MxrYuXZvqgr6D93ZTJCBKw8
 vtYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU84iZiXvgzo90KvX3P1fpuqGbJry+wiMZNjXu5eN0ZDSVrkC7tDrZh7istEugzXZlx1CMNI7WB/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTNBIgRZhzN2IFBtTphsGK+0CIJWxRQnPoN4s929Cl5MXNqddd
 2OEgc88zv/OMrYEUjTKzGL01SaqjQlXvKXcQGkrxZAKvrTqcp3tEeQOLP5oZKTT3Ibbmaulns73
 LUkJ1ZzZASb8YZyxvQxvmD+GtugA6C1tOGx0fkEboO21I/VpzTIjuh2uvm8TS1SSGTowofoJD9C
 scUTg=
X-Gm-Gg: ASbGncu/CAsb5sTpUGLFMl+jzzRNKemtGyyuc7Pb+tDBhEhkgPyIWg5kDgxaefrS9k4
 Nd3WN/4uRoqgjTuOAKQle/RpY9PE60KThLtJCHo//9zfu2SpJRec6hv6s6xrv9H42VMBEcW7og8
 0aecUCtLml8Kfc+LsmrXpEE2CcYitm8MnDMx+Wqpitv+e9RyBVM8QCUytew7CsRL4GuI+XedHkW
 wb3++jCQ48XJMwNAFtH3H1jRJONuX1SBbiuskrsrY1zJ5rlEvUImbeNyEdQkL7AY21ADJo8Pksu
 PiyxYUCTaJosJ6uINKx9Z3Vkz5we7XxfGsg5/CYYl17b2ajPps60v6XmmHxDpz6TSpZmda6RPeU
 Q542CfgDa2E+tFzc3eJbQbYcw
X-Received: by 2002:a05:6830:2789:b0:72b:9387:84c7 with SMTP id
 46e09a7af769-734f6ac57c5mr16279401a34.2.1747940633018; 
 Thu, 22 May 2025 12:03:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/jT6jn1Z060H1BWgbFPP/zII0OmBF9bsCViyPeLmWLw3ZixHCeAogA41QGyYKJQBsWAf6tg==
X-Received: by 2002:a05:6808:4445:b0:3f9:f923:cc46 with SMTP id
 5614622812f47-404d8698a37mr17537811b6e.9.1747940621967; 
 Thu, 22 May 2025 12:03:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:24 +0300
Subject: [PATCH v5 05/30] drm/msm/dpu: inline _setup_dspp_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-5-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FhcUxkN33lcwKaCVhynJTwrCtUJjENXomVxBonQ7s00=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T8SI8KCVGVVr1Y9EWMFHMO9KEgvuRRKVX0J
 x20oP/lOPiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/AAKCRCLPIo+Aiko
 1fXWB/9Fo45s651Gj1TyeLBW5+ITB5kjKlbCn9FNuFukuVufMW+UMpWeTehBYxmQlc+7z6FC7wf
 YlI97N7+IcRbAfH96cIN8hTe5YTgkS+9oqT90LjP2M0ppBYZsHGvquHUkmFnhIH/EHSZ86Gz8z5
 R7Hcqh++KiHzQsWOizm4qPLOEO0PHhrPk0atiF8vC/xvKj9+MDzNMfk2JMOuCXOjGIKQypVKmJy
 QzC2NY9Dh7MF7ZufSrqpf0bhiB7rxFbrZveBnE7dz6KEnmo1CY5RfvCVY4/ngoJ31kcauX7w8a3
 QvWCjw3jl87N7QTx+4yp1nA8qu8Q3UXN8qo9uy3rFymXOuNj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: G6IcYnxTB7WfBsCqtXEVKOxZbZNQ52i7
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f751a cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: G6IcYnxTB7WfBsCqtXEVKOxZbZNQ52i7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX5XAwfLVFs2lp
 7UOM/HjpuF0jAo6HhxgUmz9wimjROK+vTa/J4cMDUJ6Xv/kwkS2absMHDFY4BAtBY71v+ITsKg4
 RLuTrTYpB3pJ7cDfvNDwRHi+QQ7SHAfjA1EbxxowyKVfP5w9caegAw793FONvDSl9mqCD0CXmZU
 Z/55IJrMt53C7u6K3ZW5QmJWFribIzOJFlegsFCwx1G6phO80LhIZxDYVm+rnScQYUCSSGY26pc
 2tNIvLlwS3TTGUTea3mjbjzr6Ns7uoFswGWx3aNX7NYI2FOL4JfM4pdmbnoi7ebieEzeeoPCq9n
 bKsx71nyi2c0tH/Fi1Mw0VbWqpn7bdT6VAIOG7IBAbBgvICZIb1EJVKxuaU4OMCOdLAwt77UnNn
 GvqTwoGNClstNOJ4RC1VT6c8ayAtW8Nf7j7d+gNX8r9Dhk+X+p4to2sN+Dlc470USLXJn8So
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5

