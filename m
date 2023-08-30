Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DF78E2A8
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 00:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6352E10E620;
	Wed, 30 Aug 2023 22:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C27410E610;
 Wed, 30 Aug 2023 22:49:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37UMQR4b012691; Wed, 30 Aug 2023 22:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=/B/DZRjIfPJMBOZSLDAwiSp8WZUs/BlBuyYlnMoFTSE=;
 b=XUaNB/cb7e/T1wcfdgVAaLd1tln8DiuXjBlEm12subicpw6LeXYruVMox0SibtBCOTSu
 53jl3VIAAGNT1z/RFWkvnWF8d/ewopCqobfMWk+dYSgdAL6qKOv0UkHAveNJQTLO+q4T
 quQNqnPuz532lC9CnrFVDQS6P+LQ5Lap+cafhJ7F0YxI0Awl73cOUIKhO7Vle2al0MId
 zZYVYMrNCJeB/tddLk7tVplRiiHxpe1EpGV6L869Fxa1vqhelBlGErHPm4npoil7KOTi
 BgBjEixQ1a/CJFQxptbMC55ZnvIeFLZaXM6O0w1fSRoPlNezeeul6uGrKzyzLRAlbx4a jQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3st9vx0hy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:49:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37UMnnFs009101
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:49:49 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 30 Aug 2023 15:49:48 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH 03/16] drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp to
 match its functionality
Date: Wed, 30 Aug 2023 15:48:56 -0700
Message-ID: <20230830224910.8091-4-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oshbsdzFv1edHI0HL3Ctt-6-SXdTDiLI
X-Proofpoint-ORIG-GUID: oshbsdzFv1edHI0HL3Ctt-6-SXdTDiLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_18,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300207
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dpu_encoder_phys_wb_setup_cdp() is not programming the chroma down
prefetch block. Its setting up the display ctl path for writeback.

Hence rename it to dpu_encoder_phys_wb_setup_ctl() to match what its
actually doing.

Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 6a1f8e34f18a..4c2736c3ee6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -173,10 +173,10 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 }
 
 /**
- * dpu_encoder_phys_wb_setup_cdp - setup chroma down prefetch block
+ * dpu_encoder_phys_wb_setup_ctl - setup wb pipeline for ctl path
  * @phys_enc:Pointer to physical encoder
  */
-static void dpu_encoder_phys_wb_setup_cdp(struct dpu_encoder_phys *phys_enc)
+static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_hw_ctl *ctl;
@@ -348,7 +348,7 @@ static void dpu_encoder_phys_wb_setup(
 
 	dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
 
-	dpu_encoder_phys_wb_setup_cdp(phys_enc);
+	dpu_encoder_phys_wb_setup_ctl(phys_enc);
 
 }
 
-- 
2.40.1

