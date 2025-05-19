Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F4ABC39A
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6163110E34E;
	Mon, 19 May 2025 16:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EV0VutXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70BF10E355
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:51 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JF05F2021434
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cDEwQaolpmNDN1vw7HWGQSOEW1C8PW6OjHwovFhU0Ys=; b=EV0VutXM2TIWDcn+
 3dYzTiGtcph3YMerf0qDurijAG0iW+1Y4tF9HBcZ3ExhKFb1+ELgoVN78JnHJgft
 emRLQd4bvRpDZnwmhLPX1Rlm7mOnozrohmaHaNqVtCo8/typrfZ8rnrbrzdcHyfM
 953QLHYMZ7UqWB1vOJSZzrwiuX7oGtooG2Oi5uCZ1i8UACS2mgtVuyFUXPNyU5zx
 RzQjfpOg1A7we13ZMAU1iyKQhlsJ0J9UWwMas2sDapnO+gd7TxALGeWyiWgh2n3e
 3vtSRs+qPjKefDioR+IY7+qFOEXFtPjTRtWU8C1RC9eh7DAA4ym994Fd51uDOj1+
 vRAXOw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r6vyr5rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:04:50 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3ff0944ab23so3927394b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670688; x=1748275488;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cDEwQaolpmNDN1vw7HWGQSOEW1C8PW6OjHwovFhU0Ys=;
 b=gpDMz6rhfau2vpWFB2EBqZteHH+3PbyBs9gDvPnTSQ8WPLANdH1k3ttcK/iHeYWkyz
 nhxp3eZnIkZVGtERqouPbKCXTL2eAuJ9fjaWEjyqIIK2LKkzO6WjanUiJ0ztbnJkbHHr
 G0IBMRY0xZN2uQWjD84eNQwvEj1MJO/INDOSmV/QGEayaqynld8cuuoNE9WaGS0CkyQV
 B1HTGtcyMWP9UHxdjlB+nphMdlLw/ni6uuS+IlSzCmemzkc4EFKqFAYe/Sh81TqNgQRy
 mdT/5m2sE+XvvZ2khMoDkJvcIq0YMNPMw4JdpqFUQ7oVu+wHxasu6R1+F/mksPswRqY6
 llNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq4q8bereSQ8ExMdiNNKrGRhKUef65gbZNPSIj+YyiBNpzCvNpS9dBwyD/PChjbsuN0HN+g+uBS88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKwzEKhE9rY2PxPXGh2rH1aFPKVoknP7kFzxGT2yVu/SUuouDI
 yhmZjdlEJCoLGgCimA2HC7BK2RdmqDIuYEG7Zvkc51J9ddL8fS+Kr2aoAlsy2aRuyUHgaDZYLkv
 0YcPdcw0BvG8unS9nWd8FsPtVZ0UhdAvE/zkjzCHauvBHA0tcxgh7RBm8KJtG6FgjHCszYp2nPX
 GsPwg=
X-Gm-Gg: ASbGncvPlpfYB/aCJZYpB8NyVJ2A2VWtYn/OgyR8FzMZw4ZwsrOeaI0tGHqPMR65wOK
 hL+PHAcpXFYqiaTf3ArzTM7QM8xxWMV7jzEPFMD8QNdCi80rl91fOYZBp8qqUKg1zvsBgW9AoqT
 helkh9PmaJART7gFCtvqGfPme4Yl+tq0LXJEpWcXKw5IdFD0lN04hTlwXaPHl05uhchPOQQT8d0
 XzXhYJXFIjmT314/uqwgQYVx1skaWtdORkGIP6rnswdLivf66+8+mA5c+1iDTjMezKMYMWDJQMk
 Nkw4OXwH84c71pJa/FbBBDiPkuVb7qhdDsc/7a9rcodlZQBv7zeSCbUBwf/eF0EydBgMRubv/HK
 cIlCsJE9UMae6w+3iGHDuDm0+
X-Received: by 2002:a05:6808:22a3:b0:3f3:d802:14f1 with SMTP id
 5614622812f47-404d869bc4cmr8882609b6e.12.1747670688109; 
 Mon, 19 May 2025 09:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYRQiHjpvqGnKRqMhWPo90IIfdAfJ2SjaNPhsDfJ+gnqb36sTx820FeEdk90+H5dOSIZPUvw==
X-Received: by 2002:a05:6808:22a3:b0:3f3:d802:14f1 with SMTP id
 5614622812f47-404d869bc4cmr8882567b6e.12.1747670687694; 
 Mon, 19 May 2025 09:04:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:18 +0300
Subject: [PATCH v4 16/30] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-16-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4342;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eRuA97C9Vfk0R8xZrVIizze1aEZWx+2Hni5ZcoPqVKY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z7YUl2hhkCR1qcBgpVqnpTVFO1GmcAs+RaT
 58qlL37jtKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWewAKCRCLPIo+Aiko
 1Qo7B/9I0N7xkr0Rpw2in8ncTee38qGb3pCtc0bdCJRvI7n4o82QWjOJ58Rv8UNpsWgFDw9n8ee
 vXce23HoQTMCYw4vrviAVtP/8cF/PvzHFnCsrijTHEMHz8F1tEpWLgFwS6A5/erV62mICXJIG0+
 I/zCycpKQyHAOC4k8BU9rD12rNhuhv4hN7lhtfjaUTqmTy2xV+VZZk7bXXJ9RJGUvbwOXNwXjza
 IjDrieHhX/OQi6aFP7b7om4s4Xgb825WSG8x8YObcvq/Wk/EY3jGnybvoB+h0b2XgvX3uS8uO9f
 RGT3Imw/pgHne0AgbevvYwZWtwThCpahV8vO/dVJIk1dujK5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NfHm13D4 c=1 sm=1 tr=0 ts=682b56a2 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=K8QCOMLVtaD6p7eYglIA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX1tOctXjc4Xmr
 dXJNnfP5j65G7q8lGSn/T5+MLfppW12pNUcWcf7o1GNGO/+LO6tRvjSWFzJmzMVubJ9Mm5dPqhL
 Ok2AUi9XiEA4VjFz3Tsi0xDRDOwAq8Mj/zqsRGS5aaQDyYuYUT0GKbE9jIa3YJPVEatpf3HYptN
 i3bmsy3pJntIRi1e+vmEhSLI2RpBBDbgc7OKfgnsRwuFylhuwPlH9ImwrCzxmUqEhgYebJvdtkF
 r7UrR9nBOt1YJB328tKxwofIDhK5ZaVnjHpWian0Ge9uCJx8SWDL8X3Z8gTtYkcvLtKDgIsn+uL
 Gxbtg9G6AH2Vil7dzjOXdoWBTQCTS19Bpwxhnn15+clUbI8+h20PiFweS8O9c92GaQNOwDY8irZ
 9YKhE/Vxltc/Czzss3Y1QGY1wuRVsBDbJIEpZ3u6h28goDDTECg6IR6g1fO8WyA7WeQXNhN3
X-Proofpoint-ORIG-GUID: Q0SYzyWvP7D3orC2eeVewz_gJP3zg_Ll
X-Proofpoint-GUID: Q0SYzyWvP7D3orC2eeVewz_gJP3zg_Ll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Continue migration to the MDSS-revision based checks and replace
DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 7 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c         | 2 +-
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 8fe07a5683f734a058e7e7250f0811e3b7b7cf07..0e8e71775f2c1c38af018353c85ffeb6ccddb42f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -181,28 +181,24 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index df1eeb9082f74ab734c235f0cd0baf8c0eda14b5..75b679cd2bd27dd25971489a2d3a6f516b248235 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -95,14 +95,11 @@
 #define MIXER_QCM2290_MASK \
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
-#define PINGPONG_MSM8996_MASK \
-	(BIT(DPU_PINGPONG_DSC))
-
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define PINGPONG_SM8150_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bc71ec9a5bc8b6e15d7af13c42ba5d4197729822..ac63f753b43615f7c34d2da51fce919fd77142bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -118,14 +118,12 @@ enum {
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
  * @DPU_PINGPONG_DITHER     Dither blocks
- * @DPU_PINGPONG_DSC        PP block supports DSC
  * @DPU_PINGPONG_MAX
  */
 enum {
 	DPU_PINGPONG_SPLIT = 0x1,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-	DPU_PINGPONG_DSC,
 	DPU_PINGPONG_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -319,7 +319,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
 		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
 	}
 
-	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
+	if (mdss_rev->core_major_ver < 7) {
 		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
 		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
 		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;

-- 
2.39.5

