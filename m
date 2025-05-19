Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F114EABC3BF
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6D010E2B5;
	Mon, 19 May 2025 16:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4ddBCGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B6710E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:26 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J97Uhr003010
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 psIyhC20IfdPMxns5UAQqKiE4lQxqk53qhxR/9h2EV0=; b=G4ddBCGfKajswi56
 9uZ+pno7CXlmOvsRJfBRyp1jmI65t1uxTJDmpY6AZGcD1UIyDf7LYvqz3T3LC/Ow
 +4Xrn7zqY5kRocgufMSDUMJBuP1I+Qmb5g65yplxJjuZRLVzTxjTX9X27h/d952a
 eN07B4hdfWWvUIP0+LKpqq+2ub0cIlHeXnMvFxrmQvCMNLtfK+QiObwHWbTiSwtV
 981f5I7wy5PFYea2t2d1YVZYbQXpM+3kqCljJ2lO4dB0+Z/oBPLJkVdnfU1WRJnM
 SgSN6dLB7H2HPTfwZYZANXkYtTMjdTsWkJUuatUIRc/tevFfdvTRWtpajOkV7ily
 EUc62A==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyn197-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:25 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-400b1222c6dso3889061b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670725; x=1748275525;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=psIyhC20IfdPMxns5UAQqKiE4lQxqk53qhxR/9h2EV0=;
 b=SIDiPXeRe+jdDw/nde4qDTRcY+CxAms9Zxso3PtdByEqTBz4B37qE396WrnJbtL20Z
 5djrIIutIthaqRq+k50fWy1xM1Yyc2GJE2C6OBP8rqXowYSrQqw9EG6QMtxklanGn9eK
 8zo9OZZyxr4BQD4BiamiaLq1db4y9NLcEKxZXax+/eiXCreMuSkv7mWBq9V1/9+cZgny
 mCd+ddB2xyJuNaChJXp5O8RLIf62jJkTF18ZkT2bnKCYnTsIxeY2Ht1CGQwS7ieID2w0
 k8D9xgO1PO/D52IVXhW4oFL9EIwATtzeShc8dFFxZRVbH5dIICZxFKf/jAOWAAo1QuVj
 tZoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCsbNziNBm7riC//KmJyu7pR5ifT6OJEsBzYqot0P51ceO0e3oVlLIMxhB+Ima2eENyPxUlxtl0Vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6oR2nrKK739jkHwwCAzkNSto9L6IW+1LGVdZLY32gcviZI8Sa
 ssSPz/CvAMGsW/GOrslSr+nXWUaUjsh0Dxg8CHG3MnT7R+iYeKINRzPzv/xZcgof1jUi5L0EJF1
 cJbsPzYFmbNBy2yOugmOwSxyv98CJ24+vT6JKpwO5LzCNDYUwXDqjuhEWMfZazcKwqeR9kx8=
X-Gm-Gg: ASbGncurIRKKR/2irAw6gp2e9XQgsdHet/875Wr1GNivChxWuVWI+B4WlLE5PD7rbMz
 lioKfrlisAQqYknXs3pgnacKbKLitlcvdhzQEEuIvEPAy3Ne4BK6qmpqxrYc8JrVElKk5RWFXi6
 8bRMiXLO+yQERDVTDUVcX6CPDEiPK1XUGGpK8FSXPb37S/TY8gWVR3OC/Z6V8z0Rm288moc2UlY
 OZroez04ZpnojEqZLDNkGNEydHR5WEcAem/bq5+lITpuy5Sxys/XBwlng6Q70CHosuCoul2Da2n
 RXCqdLUcBKUfq45EAxqjyhhXTsHJiW+tABT9R7xtmETLSZ8eYu7TnyZZcoII/83BAZZ3UqPVL3W
 8ZksJBRNokPCm5J/J/e3KMvj7
X-Received: by 2002:a05:6808:4447:b0:3fe:ab15:5ecb with SMTP id
 5614622812f47-404da713fc8mr8587188b6e.9.1747670724669; 
 Mon, 19 May 2025 09:05:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpnXUw15VIRH9ZzFj+pI7awDbai1ReeZkHk1XU3ODYJ2eFfiVcOkonITG6+frvyjXclK3beg==
X-Received: by 2002:a05:6808:4447:b0:3fe:ab15:5ecb with SMTP id
 5614622812f47-404da713fc8mr8587119b6e.9.1747670723246; 
 Mon, 19 May 2025 09:05:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:05:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:32 +0300
Subject: [PATCH v4 30/30] drm/msm/dpu: move features out of the DPU_HW_BLK_INFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-30-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9251;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WGwW5El/NPaEL8Lh29GyLwyQ80ot96UiOnlJY8tW1Q0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z+fxoCGFrb+HVV1NGcrN6hRxQH4CQ/aeMG3
 Bg8pUQK/oWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfgAKCRCLPIo+Aiko
 1baaB/9wKEZeubnhbtHQeIMmdHA1dg7W8C/3jPBZ7A/Gd5V3pG1V3zd1VsGbh2LNNsLwiiy9gqV
 9up81KXkCpLT3Mu93gsbGrbQ3y+bzBzCmp0U1qNUyr6smN8iiRETNIO8vuYAjUlabvlAOyAZ9DU
 x2a5QzSEPtGAjquZ16NWRK1S9EqZY28iuQqt2JACnQD1/VHT+vfVO28H6KnT0cNUSJKjKvtredG
 5l0BAON1AswBRYoikB1MlQnu/FgrnshK1rez2SI9Y5hwFeQ6EiGzugaULkZ+bq24IDcELlyXsbE
 ZXwPeeZlCdWZWMUODlggK/1O/4zIbdV7Tw67Gw/EljBt10KS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: P_b2WQmDHjh9hKNrS22m5lHNx1Er7WAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXzmYw/zwxayVC
 NkdSO/Bn8vFUfGS6Nv2T1okAl9NG6vK42fGMELcmv/Xu8kbADrrlvqx+TbWa2ESH6YyS77mxNGB
 JVyqFDp2U13/Ahxcwb0luZpn2F15eD/EykYpnGRGtAZoVNJo8Ozfh/ahL2UgwrDWQbYLqOoSxec
 6EujfqDIpiX1+Geugt1C0b0xIfbbxtLagG/eotUuWsCQgMVZoNPlh56LG/ukf6D+Pa2ICwCAVnk
 WU3OAXVbBkcYswkgyirAfkjlhMlP1KPh/gcdU5uxfLoETKOTX4FgfIgrs17p5E9MCGPSB0vXkcx
 1SlmkHCREKilXdvNscwxSY1a24BMeRt81HDfJyz4oELq9CidSsZ5RfHM3G4g2owKqpyzm8LINEH
 r6il2geDO8Arj3DL3yBlqWnjW6srs1p1gpP/AaA7LlH7kPjzsU8xJbf3XuuCdMIzTQYn7GIm
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b56c5 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-ycWNAup90JVQjvHN6MA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: P_b2WQmDHjh9hKNrS22m5lHNx1Er7WAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

As features bits are now unused by some of the hardware block
configuration structures, remove the 'features' from the DPU_HW_BLK_INFO
so that it doesn't get included into hw info structures by default and
only include it when necessary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h         | 17 +++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c         |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c         |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c             |  4 ++--
 6 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index a065f102ce592311376f1186add7a47dca7fd84f..26883f6b66b3e506d14eeb1c0bd64f556d19fef8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -20,7 +20,6 @@ static const struct dpu_caps sm6150_dpu_caps = {
 static const struct dpu_mdp_cfg sm6150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 2950245e7b3f5e38f3f501a7314bb97c66d05982..fbf50f279e6628cb0f92b0188e1fbdf156a899e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -22,7 +22,6 @@ static const struct dpu_caps sm6125_dpu_caps = {
 static const struct dpu_mdp_cfg sm6125_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d51f6c5cdf62f3c00829167172ef6fd61f069986..47d82b83ac5378cb0001b3ea6605dc0f98aec5ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -154,14 +154,12 @@ enum {
  * @id:                enum identifying this block
  * @base:              register base offset to mdss
  * @len:               length of hardware block
- * @features           bit mask identifying sub-blocks/features
  */
 #define DPU_HW_BLK_INFO \
 	char name[DPU_HW_BLK_NAME_LEN]; \
 	u32 id; \
 	u32 base; \
-	u32 len; \
-	unsigned long features
+	u32 len
 
 /**
  * struct dpu_scaler_blk: Scaler information
@@ -376,7 +374,6 @@ struct dpu_clk_ctrl_reg {
 /* struct dpu_mdp_cfg : MDP TOP-BLK instance info
  * @id:                index identifying this block
  * @base:              register base offset to mdss
- * @features           bit mask identifying sub-blocks/features
  * @clk_ctrls          clock control register definition
  */
 struct dpu_mdp_cfg {
@@ -392,6 +389,7 @@ struct dpu_mdp_cfg {
  */
 struct dpu_ctl_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	unsigned int intr_start;
 };
 
@@ -407,6 +405,7 @@ struct dpu_ctl_cfg {
  */
 struct dpu_sspp_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	const struct dpu_sspp_sub_blks *sblk;
 	u32 xin_id;
 	enum dpu_clk_ctrl_type clk_ctrl;
@@ -424,6 +423,7 @@ struct dpu_sspp_cfg {
  */
 struct dpu_lm_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	const struct dpu_lm_sub_blks *sblk;
 	u32 pingpong;
 	u32 dspp;
@@ -434,7 +434,6 @@ struct dpu_lm_cfg {
  * struct dpu_dspp_cfg - information of DSPP blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  *                     supported by this block
  * @sblk               sub-blocks information
  */
@@ -447,7 +446,6 @@ struct dpu_dspp_cfg  {
  * struct dpu_pingpong_cfg - information of PING-PONG blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  * @intr_done:         index for PINGPONG done interrupt
  * @intr_rdptr:        index for PINGPONG readpointer done interrupt
  * @sblk               sub-blocks information
@@ -464,8 +462,6 @@ struct dpu_pingpong_cfg  {
  * struct dpu_merge_3d_cfg - information of DSPP blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
- *                     supported by this block
  * @sblk               sub-blocks information
  */
 struct dpu_merge_3d_cfg  {
@@ -483,6 +479,7 @@ struct dpu_merge_3d_cfg  {
  */
 struct dpu_dsc_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	const struct dpu_dsc_sub_blks *sblk;
 };
 
@@ -490,7 +487,6 @@ struct dpu_dsc_cfg {
  * struct dpu_intf_cfg - information of timing engine blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  * @type:              Interface type(DSI, DP, HDMI)
  * @controller_id:     Controller Instance ID in case of multiple of intf type
  * @prog_fetch_lines_worst_case	Worst case latency num lines needed to prefetch
@@ -521,6 +517,7 @@ struct dpu_intf_cfg  {
  */
 struct dpu_wb_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	u8 vbif_idx;
 	u32 maxlinewidth;
 	u32 xin_id;
@@ -589,6 +586,7 @@ struct dpu_vbif_qos_tbl {
  */
 struct dpu_vbif_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	u32 default_ot_rd_limit;
 	u32 default_ot_wr_limit;
 	u32 xin_halt_timeout;
@@ -606,7 +604,6 @@ struct dpu_vbif_cfg {
  * @name               string name for debug purposes
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  */
 struct dpu_cdm_cfg {
 	DPU_HW_BLK_INFO;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index b9c433567262a954b7f02233f6670ee6a8476846..b3395e9c34a19363019ec0ccfb0c87943553b4c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -360,8 +360,7 @@ static void dpu_hw_dsc_bind_pingpong_blk_1_2(struct dpu_hw_dsc *hw_dsc,
 	DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CTL, mux_cfg);
 }
 
-static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
-			       const unsigned long features)
+static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops)
 {
 	ops->dsc_disable = dpu_hw_dsc_disable_1_2;
 	ops->dsc_config = dpu_hw_dsc_config_1_2;
@@ -391,7 +390,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dcs_ops_1_2(&c->ops, c->caps->features);
+	_setup_dcs_ops_1_2(&c->ops);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 0b3325f9c8705999e1003e5c88872562e880229b..83b1dbecddd2b30402f47155fa2f9a148ead02c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -33,8 +33,7 @@ static void dpu_hw_merge_3d_setup_3d_mode(struct dpu_hw_merge_3d *merge_3d,
 	}
 }
 
-static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
-				unsigned long features)
+static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c)
 {
 	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
 };
@@ -62,7 +61,7 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_merge_3d_ops(c, c->caps->features);
+	_setup_merge_3d_ops(c);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 5c811f0142d5e2a012d7e9b3a918818f22ec11cf..96dc10589bee6cf144eabaecf9f8ec5777431ac3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -264,7 +264,7 @@ static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp,
 }
 
 static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
-		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
+			   const struct dpu_mdss_version *mdss_rev)
 {
 	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
 	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
@@ -313,7 +313,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 	 * Assign ops
 	 */
 	mdp->caps = cfg;
-	_setup_mdp_ops(&mdp->ops, mdp->caps->features, mdss_rev);
+	_setup_mdp_ops(&mdp->ops, mdss_rev);
 
 	return mdp;
 }

-- 
2.39.5

