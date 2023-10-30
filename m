Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4907DC31A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 00:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E418210E3AB;
	Mon, 30 Oct 2023 23:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69B510E3AB;
 Mon, 30 Oct 2023 23:23:31 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39UMeZnE014769; Mon, 30 Oct 2023 23:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : to : cc; s=qcppdkim1;
 bh=i5z+ZB3OU6JhL0N7BkafyheHboeXMHsPBTTu214WUtA=;
 b=jNnEqD4L4rL/OmClQcLFTZNhbncYtQIp7bb9g+Cv2KU3fZL19tAWnPEshZmaqoekAwTx
 veuKHYZfIFOTcEt4OH79P5BTLNZO23JuzQUkIcbYuxDGS/ih57Ot3Pt4nAeWgLrTtVcv
 uJ+66CvDAo1mbLEuOrHaq/3fzUDp30nBDe75vIRdExnlWXWJPOzPXqv6U0TYj4VIec+J
 cRo2YeEkECmukTlCD9k7gtmjxDnL2DabGhQ7vWobiO6dpB4taOGkW6DTW96UI5kwqLdz
 QDBthclhd+6hk6CqCYc7dl9BkbgLKa0RvMo5e/8SA17EDb3GB3IHLdSIgR03+pyXKcck lg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u0sw7w6sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 23:23:26 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UNNPp9019129
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 23:23:25 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 30 Oct 2023 16:23:24 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Mon, 30 Oct 2023 16:23:20 -0700
Subject: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8280xp catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOc6QGUC/x2NQQqDMBAAvyJ77sIa2xr7ldJDEte6ENKQNUUQ/
 97Q4wwMc4ByEVZ4dAcU/orKJzXoLx2E1aU3o8yNwZAZehoINVhjac8454rqFsZYN5zG+0Rm9PZ
 6M9Ba75TRF5fC2upUY2wyF15k/8+er/P8AUbx+E98AAAA
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698708204; l=1697;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=72QR3jvGyo+H6e9GBhjN/2GIlA5WwaX4jbap18l6h0s=;
 b=bqxY/WqdAvcdYCAXfbuMJvBWsjU70xP5O/v2lbhdUd/dbGOf7FePR+cZvLxpieXKGyNpsaY7h3z7
 6ZQTLy2KDOsSxu/R4xBwOZ1wnSkcMkJlCxAra8uhTklG2NygVehF
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: AFHoEPvfCGEnalmptZfPnIEdLWGRZIFw
X-Proofpoint-GUID: AFHoEPvfCGEnalmptZfPnIEdLWGRZIFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011
 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300182
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
Cc: Rob Clark <robdclark@chromium.org>, Doug Anderson <dianders@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During USB transfers on the SC8280XP __arm_smmu_tlb_sync() is seen to
typically take 1-2ms to complete. As expected this results in poor
performance, something that has been mitigated by proposing running the
iommu in non-strict mode (boot with iommu.strict=0).

This turns out to be related to the SAFE logic, and programming the QOS
SAFE values in the DPU (per suggestion from Rob and Doug) reduces the
TLB sync time to below 10us, which means significant less time spent
with interrupts disabled and a significant boost in throughput.

Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Cc: stable@vger.kernel.org
Suggested-by: Doug Anderson <dianders@chromium.org>
Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 1ccd1edd693c..4c0528794e7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -406,6 +406,7 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
 	.min_llcc_ib = 0,
 	.min_dram_ib = 800000,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sc8180x_qos_linear),
 		.entries = sc8180x_qos_linear

---
base-commit: c503e3eec382ac708ee7adf874add37b77c5d312
change-id: 20231030-sc8280xp-dpu-safe-lut-9769027b8452

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>

