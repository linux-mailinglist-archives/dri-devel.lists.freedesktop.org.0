Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2A7B3434A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A85710E4CE;
	Mon, 25 Aug 2025 14:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcXKcIx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025A610E4CE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:28 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Wf62000801
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P1yd10YofnLH+CQC4gSLJjeDZmLAxXPdlUuNT6txE1Y=; b=KcXKcIx89ECYWM+p
 Qumlgpfvh7fNUJ/+asqPchqOSihvhFSpD0mg5oAWug7OoGEeE0qSbq57S85peLe6
 4OCCeIk3/BDph9cZ/1uPltJcOHuQ5tSLv4w6I3T0yEYf/dNyo8lpDyBwspduW3DF
 RLfE1HBg2RfhA+Xg/VuyFo+A+woEI9ec0phF57ruxPvG9UOfR92QlOOuDX7SzBmg
 K/NAM1WV7JOJVdnOM0jeTUsh5pzQ98929T7Bw5eRvLy1epvFWa7u5H2zujIXTaor
 F6n378ZEd4YEovLjC48UloZb9rWIiiapG6q3t41Rg34eaMlndjgG8AF2ONMCViTB
 y9kfIA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpneyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e364afb44so3430403b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131567; x=1756736367;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P1yd10YofnLH+CQC4gSLJjeDZmLAxXPdlUuNT6txE1Y=;
 b=mTMK7QkFC3Z7gX9dZLmuHIVyLnGeCSUNt+6ycY57RejSt6HnrQfKsAR3SkYr1g/wuk
 70XGDr6D6M23FeniMDih4yj3CQVcdP5HF9IMLQQq2Jjck3K9+PoHkhC8YYl/eQRosxbm
 IhlFJVImi7MNCd0ZVjfBYhIZUk/O4FggliWJAlTs/vM3Zx0UuM5UTvENgj/u4KUUNXch
 RD1oQfEKBmbcuNDMRRYWf9mttd0ya29105U1rI605djgWkSgEUltnwdG4OLylG8emR7n
 Cc4u/6kqJNRNBUerygLANTO3HABa9zQlcEET0S1Re2IppgnCX9ie+D6sLg3nN4/tFnMO
 8gKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUroc0C0dC8RdBYEJmGdGytaMjU44bYBAyni8eq35+QvkAz9XFK1BfnEpmJr2u7hPaCETKi+Zhg+pU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV87MmIckjZWvPlGdX0YypEo+wwlOV3ZXy5yVVh0Imc7LRR49P
 L4vR5cHuq+BxGMya9bksG2T+wopV6KqfYpnWimzpij4cWJONACdq7AEMfWpzsoW/PPs/5VPcyHT
 ++I/lgqd5wGLfA15l5js9d0Y9kiQsE4gNPu7QwnlDG9f2Dlz8MfZC0vzteuQi3zqxy+OTMFI=
X-Gm-Gg: ASbGnctNNYXgqVyLTm1cGdxJndc3cS7M6lAXtBtCSTF+xJURYjQ1SGaWxxnHPx4c5nQ
 umzbL9TEVq+E0IZW0m0eijWPLDWnsG1eBpVvzQM3lfE4t2ri7sbqfEo55TVCQvNBdOqT5DXO1Fe
 JBixX3AZhRenage1p3g7/ODIgxaEZ74xfyqcBExsKw+XPuo5oXe8VXk6EdLGpBQ7Q2b/m3b2zV3
 KrHChV4wZnNJV91dOFs+V0PMmK9Hn0Ckoy/Nl9a0xcngj8/kJwuOpDJ0L+YR0q7EA+Psw7ijDzT
 bi7RProrWJRab2VHJIl4MI3WYorM8wL3G6w/DANDrAsO2Hqn4vDwY6P+0U6z6U/FZdL4gP8=
X-Received: by 2002:a05:6a00:b44:b0:771:ef50:346 with SMTP id
 d2e1a72fcca58-771ef50091cmr1422419b3a.15.1756131567561; 
 Mon, 25 Aug 2025 07:19:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGFvu3XuT9VU/LnqIitNUMdiD78ZWBqA+dkmxK74qwT0hQeTdkMlAaWKNmSD7AF3jPQpDnfQ==
X-Received: by 2002:a05:6a00:b44:b0:771:ef50:346 with SMTP id
 d2e1a72fcca58-771ef50091cmr1422378b3a.15.1756131567093; 
 Mon, 25 Aug 2025 07:19:27 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:26 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:19 +0800
Subject: [PATCH v3 33/38] drm/msm: add support for MST non-blocking commits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-33-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131424; l=2126;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=bbMgrjogFWOe53cU7bupWnZmtxrreVf6AXy9Q1VXF+M=;
 b=gpg3jVD6oQp8tI8kWMMSeHm2DZx31ldvlH7b/o8hYiGVXXFJvVsSukXwu+8X2LIpMWKJk16+T
 Az8Qnk5jGIADEg6fsCyTUrl4ahidQSBEY8LldaFTeQqX6Yi482rJj8G
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac70f0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=-c5J4RddxQ5453FdQNsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nsB9OfihjXqmx93Eh6uMLrIwUtDylX0S
X-Proofpoint-ORIG-GUID: nsB9OfihjXqmx93Eh6uMLrIwUtDylX0S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1RHzWK3eQaPO
 sWIKby8rJl8j5GDW6RVeufnNgG0Q8yUTcUGm/C5pgs1+faFZdWcZnEy7XPTCrxXPfkUADlbd7Px
 JuMngIMBy2bq+apjx0F76KKtvWi7deON1Xe/iexcDjJcuSW1lrvxIIoOcs2G6u50oeemYa1yTFb
 l1HR/nJjw3TuhTBZ9CBZ2v3XPM5dAGAqvq6/LqQKxeKBBJx862YZAt4FXmMBIsoLfkZmBmwhNTI
 7/BtMfqtAc8y/8XnfJ2wCh+k4mRHqJwaZCNHSn9CizCnAtcHAvKOfMrBG5K8u/vuVERQ2n7AZYJ
 CgFzUe84YMx5CFubXt1tykGqh2Tyh4UWNPzUf35aiqII4FQZdVBfsPhMPJwsdOaQuBh11t1zj0j
 y4/QLS6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Integrate MST framework APIs with atomic_commit_setup() and
atomic_commit_tail() to support non-blocking atomic commits
for DisplayPort MST.

This patch only applies to MST. For SST, non-blocking commits are
already handled via commit_tail(), which internally calls
drm_atomic_helper_wait_for_dependencies() in the DRM core.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 3 +++
 drivers/gpu/drm/msm/msm_kms.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 3aa0020dec3a90b693ad3d4171cfcffc091aad4c..b1656fb456d54af11ba8a30d4971fface114c7a1 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
 #include <drm/display/drm_dp_mst_helper.h>
@@ -226,6 +227,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	drm_dp_mst_atomic_wait_for_dependencies(state);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 6889f1c1e72121dcc735fa460ea04cdab11c6705..09776be1d3d854f4c77d7df3afa8d56f53639411 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -10,6 +10,7 @@
 #include <linux/sched/mm.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
@@ -29,6 +30,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
+	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
 };
 
 static irqreturn_t msm_irq(int irq, void *arg)

-- 
2.34.1

