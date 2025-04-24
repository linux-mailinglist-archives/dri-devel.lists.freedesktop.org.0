Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9386A9A7C1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1523F10E78E;
	Thu, 24 Apr 2025 09:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDz3cGJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B055910E78D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:36 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7nj010247
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L2W9+B0ZnfjCFViTwk/uQhdvUhFo4znCgY6BQw1Faug=; b=ZDz3cGJC4SU2atd9
 vr2Vys2AfbDJ8Wu3xqMDIjMfhfWIpejh/B5deVLJSBemUivPZuSS32jgTz4jzFRA
 fuHaOfn85E7c1LU8+AX/pU0QDKG4mQ2kgWWDLFjNt13gAokLLb9FBLXf0cG4JHNw
 C3DulBIV+JGn+FitBe22LRp4mBQMRI9OhScKkwFA7P9RdKA+wE7r7HaYRoLxYCIC
 MS+tnMfS4IXL3u3Ffpw5xrOUveuBzJWYSlKaU+v6nUWXmq/ojPXeBToLlJHbmVZl
 M3dTEKwl958C+Fct037tjGxxV47Mzz632jLwrSg2fiZHqkGmyNacfcOKfRNZ2lEj
 Nloe2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mymf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c53e316734so137377785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487035; x=1746091835;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L2W9+B0ZnfjCFViTwk/uQhdvUhFo4znCgY6BQw1Faug=;
 b=uRPuDjhtVCJA5RYmpS1BypX6dQhRxkFdL1FTCxDUeeyKHvWrAwzKX5PoedO3CBTvwU
 ksN6rNFcFwOQ88vgbWM9LtmT+FkQB4zaYMoZGGE/S5G1cCto/oX8s5zWLfcGnn5UmcJJ
 FkfvxLqXD2wBbwkEltASqdIl/29aczTVNM1JFd50catC7kSa1ZhG4i8IlnNFUAmSdy+W
 FAL4WLacu0r185Orx4epH+eWODXEdUtPZ5yK/9yFxMXp+50h/PMHzVUX3XttWrvgo3pb
 iLnl5lgLlnJt2UMoD44sCC1xVFhiABaE5BD+TE6Vfla3qKCTgBHMVhWnbwrDS3da2dyd
 AKIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWneTmHUKSWgGm17TgfOrzazVcL0gdHrfO6dkaLz7o6n/AXvVmUJN2HSGwVo7wrHv6FiSrFloeFzdg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFA1DFNXPYFAnnBOKnqhsBXP1Fet6PBgSVqcJDTQ64tEaoYROb
 cGQxMsL4R/w5ukbYXWw1VW1Anb4nuAf8SQD/+cKjw0Qw8j1/eFf4ifbYztLGnsUiFK2q4hcCLEK
 S6SAQeD2q0NLi1yHtg40Xh2/x07AKhNjhTf1x62dNOPgux1djuO4LxBTdgeUIaC3eSzA=
X-Gm-Gg: ASbGncty/P/RXBpJClkotkgaGvhqrlMg4K3QRT/QfFlKS9WcAwiXcHRjEqY1aKyNW75
 AS/zNUZE3o/3qkHIAds1pLwMaUh52juj4lIYDApP7fQkXiUPhBO6gpu/g4wxmvJjbFqisFS8cLA
 64nM6IlHbrt0OHbmEvpDuVAxTkY/X77MWwr3Q5PeQGW9laEe3Y5ACnyHTKZCx5Sx5mZ9GJNFCLM
 4HNcsBcGGWTtZjWprDDpwrurxL9mycexyCulLO7spBmbv/44iR7ODhQmJzkfTcuexkbm5iBsvJQ
 ECsy9UEz/4NATS3uObGOGCnmkxFU8OBO/QQD93xKlZ9Z+DTnpZsywLeFZ1KfJDHiHraR4Bol/3G
 UG/LdBsU4S0M9oYI5wybmngSd
X-Received: by 2002:ad4:5882:0:b0:6f4:c21b:cd9d with SMTP id
 6a1803df08f44-6f4c21bd1e7mr13179186d6.29.1745487035117; 
 Thu, 24 Apr 2025 02:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxCZuAnggMj3l1bp3VhBBdZn7SikDu72aqo9cVDnc9ZZvE7kzgKSO3dAMP++P4RQGtn7Gcdg==
X-Received: by 2002:ad4:5882:0:b0:6f4:c21b:cd9d with SMTP id
 6a1803df08f44-6f4c21bd1e7mr13178936d6.29.1745487034802; 
 Thu, 24 Apr 2025 02:30:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:10 +0300
Subject: [PATCH v3 06/33] drm/msm/dpu: inline _setup_mixer_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-6-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7p9Y0N9fe5J+FNtNErF+g9/bY2UcR9C9Ev4Hmj1Hodk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqFUrxRR+NGyuOJa9iZPcU0YKALTABfDjex
 qvwvQQi4leJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1f9cB/9gxIKyI+sJgil0eeT2ElX+Lg5NIqskYAtVXvqVFJrBFsxc7bM2fNfy/yAca75ktCpEQGT
 izFMD4d0TVSymz2DVDCTr8jEmFsNT6kTr4sYeHW64rvRuROHHxVtFhxii8TzzdWMx0eFFTFIYcy
 Z1cl0mNA9N7Uca5rf08k5HCjBPcRDi0eMV+eFzutkJPuXowU4tFGV6laG7uZKX60fFtqJATjwvZ
 XvUWYDl/7slG3eyAl8tquvIeK7yxE99hvbOiq+GS4jfB02o3qE16b0EpAajL3RsQwUl8320zhd6
 qBL2Emz3OpptOvvBoq8gQ1TAeI4jGBD271WmlGZsFuESOJgQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qGbxASFyAIH6nV1Vj_6rzPkEpz9fqbGd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfX20M7L7XeO4o2
 d1pWg7+lgygTxIUbwB/uiU2HPwieuoMa4vrRkzMvBQTgAMOCphKa7j1LtC7mCfIVk/3HdnkP+xC
 jmd/pZUJfJz8PgUZyKg6tB6cAQaxUpuqC32IXOuywckglKBoms0foKAMmxcTSko5gXK8lzdzPK2
 e1s/klcSpzioQn/f1Zyce+gzBJzxI5/ycUKb+92bmdWM1m+a/z8mRe9IPYf6B2mhkj1MBbIvxOd
 ux8J0qH1JtlHpbb6DCpadx+0Rfidmu2BtUPvEZWRlRVVExqqBcowGjCpZtCZadMW1hPELVSv4VF
 snOpTxwqfS0T059EbZq90s7RgovTXxhUPcsqdK3woSkF+5jr8hQKmFwQGY3VsR0nmOomS5d/4d6
 8maFyr6jRM1E9FWSosYYr2MvRH9FXFJAli7KCxZprCxyw5p+jDkVw0aspHCcP7rkaV++TXv4
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a04bb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=2ONPo-prfMSwqFkLVuAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qGbxASFyAIH6nV1Vj_6rzPkEpz9fqbGd
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

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5

