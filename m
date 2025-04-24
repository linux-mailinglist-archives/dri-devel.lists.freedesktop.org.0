Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769F4A9A7C8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9371310E792;
	Thu, 24 Apr 2025 09:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUU67ApW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A3F10E797
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6OP003392
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yY8Yo5pYvT9Z4+o3bkCAq7zmpRUaxk4DK2Ff/7M+6kI=; b=DUU67ApWdav6G6YN
 WSn9hzjcyQpko/leMcfLmBQHGOuFdmU58cgfwWEfPpiOxNgKDePVC0IE4ucyQcr+
 QZ0StuljrOnKQjkzAJX1uK66u+G3djk4RwUliwcbqTzvhYryXkK/PdEobHTZQ6lP
 SxTsICXP7K6ehLMHMkFsTfaowddULEaIG3aFm2Ddv8qD56CINo1bC++Y/q/kqW+2
 dd5QsBW2nVcDwr0BIvGWBLkw4HuYnp6EmZ80iWC7VBndX2w6oHTTigkwkb/pOqYc
 uDlJewCRAOk0OCXSaWVVLXAtuGDzc5KjaGbSc2t+xCASuaVVJ9tCtgNJsqvbtrB1
 NdR3OA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0my8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c760637fe5so142163485a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487042; x=1746091842;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yY8Yo5pYvT9Z4+o3bkCAq7zmpRUaxk4DK2Ff/7M+6kI=;
 b=PUkphzrDVLptO3gWKP5OyA6JCJAmXweAOeN+SLX0smpzraHRx5HkQaAnCREB8z9vVy
 P6cwbfHfqqwSZ5rt2lO8YAmup2VF0GBb8TbAU4gHuindPOyyelrQpQSc2Wh6dVV5U8aQ
 WWNAQwGCceQXJugrW3s2SBOj4L6lQgCURPyyp7D5uBrV9pBasd5Q1utFxfY0dsMLrq0q
 aWTRExwvY1rb4QH1VHd7ziFOSpj0NVA+QagUC4XaNIe7EnfCqPVv6LrEsGgosaMvn54F
 dvjWn/YMjaB6l8Fm147dqKE4gOi9MOdTZX7+9aTC+XtJCtKeE0vvt85f0WXU0BS3/Az/
 8lTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuPw8XXspiyaYpjmuOHg/yhqWK076/g0iZquPNpzW4mpUeXp3D+MszN6NpEO0WLuGtZZyt8FzwyZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmwUt1j3cwHelIfzEcA37a2Y0y8l+PT5tzsHG6ethhZ/oRatrN
 yEp4dKjMqjCcK+fU6vrfolb0OlsgSdP6PsuDX2JUhNYIwF+lQFaCpx9LGIiq3Wy1WD2d0ErViJA
 w5kJL9eiPCbsqRez1StIBsuUMuUSQM0L3C4/aBbqKCud59pNUqsxu+BWcFvdCJSjy7iw=
X-Gm-Gg: ASbGncvsv+CA/6YJlZ9x42jH4YefXhty0FHmqmc+XCWVBTHUMCtRbJN12EFqsv0ycZJ
 DnPqh+68Gqg16L5uQabpM+Wwu/zRxJGNgZRvCj0U5nhDm7+gR1oqH+KV6yCJv6zB6PmEaHGnY5r
 Nfpx9POhIV/+sedoyiWeyJyDtz2RcvuCX1nRA5kIROAaooGES9ysejvt6rnYW/Qmj1jHKtQGeqP
 SW+d5g1slWhDn+oaBOEhdygCcatjhAvZkuxKJFoBC9wSsvONrGE3IBH+95K5lEVQhmAkup2xC4O
 E7wnQR6ZJH5HGrRSrSZ+wuk4DgE9MqcCWl4HYYzaAspbDVPLvcljBirbEw8RrK/9yEjymKGRegA
 5r4wTf5qK8V0D70OQN/XjH3S+
X-Received: by 2002:a05:620a:6106:b0:7c7:93ae:fe56 with SMTP id
 af79cd13be357-7c956f88f47mr243298185a.51.1745487042450; 
 Thu, 24 Apr 2025 02:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUa/6yCoT6mZ5aizKzpe4+iNnRS2svRyasrbIHuoR01W3sgsHGigRTnWpApWKWi3FaFl+b0w==
X-Received: by 2002:a05:620a:6106:b0:7c7:93ae:fe56 with SMTP id
 af79cd13be357-7c956f88f47mr243295385a.51.1745487042042; 
 Thu, 24 Apr 2025 02:30:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:14 +0300
Subject: [PATCH v3 10/33] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-10-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DsDYyaEtmcEU0Q3DXm3LKbekIuXiOgkLRrmoNbxq0Rs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwYXyxqGhQ1r1BdqhZq2OsZ/T4t6t3pvffUUrueP03ZrH
 H+Tmbeqk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKbwsUpABO5fov9n5GQ2W9pP7PSvoiz
 i/UFnTh1vuTFP/xinsR6V/B88tyDvTb8mzlcz12cWtlw+En2kl9f5AWrVkTMm/2/mvFISfKSisJ
 Usxz7d9Lf8p64ldbc4985uz9Pj/v3prkbJ5vZlFcJF53fPruY1SXvp72YvdssMc7ewxGfvtalbw
 04+fG3bmTd3c2bpTUzqoJ2vDi/XOuzjPR/6dT0aYujlm0sdTmzaoPOy+cPjTTEY6rymnWnLet+W
 LSye1qs7Q/P9JPFJ60WBmkJF6+ScBD74KXV21HzQzfF1bEmuHZ7S/zd0yFWjSs72t5+1Oh5Xtvu
 JHOP70OWyrswR9eloncWfjblu+q97qCllry2UHDWBiUA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: f-z4CIXTVD6APT8MlWSmch-fRIIjnpsz
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a04c7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=k2A94KsD3O5M_qN9siwA:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f-z4CIXTVD6APT8MlWSmch-fRIIjnpsz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX3bZ2W8TlJSSI
 OmXisxshozwxjCH3QqVochZUBfieXK8QIMvXs6sVk24CHmndxux+dO61qtnZnTK1hlge9uuhgN2
 YLrPhODMxDmLU6L4bZjVkdl6Sh0FxAMJQ9u/uEyXHLKcuARjf5IxMHt1h1Xc8BjgFaRofYgpvIG
 1wMuUQYb4J08DFLxEblRBSSfq6Ksy/Nk8vxfBjMGWKnZcNHVijolYM/G/AkwPYGRQmS+AVB/mQQ
 AvTH3GuwTRPKtpDk3i/3Aobap2WkP170i/a5L+EQTbwgKkEHbnR+MkG696Sk9NJ20dizzDBQL/7
 Ga6zmnVf18hzvSI7qxZ+X0/jh3mCUhQWz9RJnzBkmUpKYfGusdKgbzo0BbM3obUM45RlGN4WaAq
 T8rQTFx9w1Tn0dYLbJxVKzNozWRxZ07NvLmhWFBFwEY+oEL4OLt0Xt7LmnHvRHrUlNVD2MO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=977 lowpriorityscore=0 phishscore=0
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
DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0fcc9fb975c0955f459ba4264b6a114a4b17af52..3431b3c956486aee99664ea9b7c2e00f5c130b7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_FETCH_ACTIVE) | \
-	 BIT(DPU_CTL_VM_CFG) | \
+	(BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define INTF_SC7180_MASK \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b6c45ed4fa3d18ed21c2a2547b0d5af4debd974e..ae168e73026d8ebbe605397c6bbd95552193498c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -134,14 +134,12 @@ enum {
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
index c63a6cbd07d94acae04b6edf534b1a7f5d4119b1..593da532d40042ca31fb452679d3de04c3b0d1a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -786,7 +786,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
-	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 
 	c->idx = cfg->id;

-- 
2.39.5

