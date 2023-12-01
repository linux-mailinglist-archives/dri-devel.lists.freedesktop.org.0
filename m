Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DF9800045
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 01:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B3610E78A;
	Fri,  1 Dec 2023 00:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FBF10E787;
 Fri,  1 Dec 2023 00:35:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AUNNE44000304; Fri, 1 Dec 2023 00:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : to : cc; s=qcppdkim1;
 bh=ICdgyrkMliI33Zpw9gltYRMWGQds5j3xcF2jKWyi/WY=;
 b=CZwRLBHzw0oIL4/Thp39vVR6BdRlp0zjo7WDSvK3NdSA4DxZGEho3rLJefqqEM/+HFI2
 eokqYp2E+HI4RXi4+rWIVaugNTXwMiFADe3+fL8kf2iKdxuQJBQ2I7huPfFcdko/B2fh
 01VH4f/TF3WNcEAViWPWxZve9tswPkQrlUg5y58yJYz9ugd+0eiUFOm18w7NiwCzN1+Y
 LpL7fQTDXPuU+qW8Vrh7Cyyahmz2dty8+xS4JKZcNUaFOPhVIcDO8u7TaDe5bKYWG1yd
 Hq0QYcNJGmjDhNgMs06dHnnq00J7KyAqTyNhMiBHq7q7zvN5hFW64OKAvFIQUMHz6I93 BQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uprhdt13n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 00:35:08 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B10Z7Pa031593
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 00:35:07 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 16:35:07 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Thu, 30 Nov 2023 16:35:01 -0800
Subject: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADQqaWUC/x2N0QqDMAwAf0XyvEBTwcl+ZeyhNskslE6adQjiv
 6/4eAfHHWBSkxg8hgOq/JKlT+lAtwHiGspbMHFn8M6PRKNDizPNbkfeGlpQwdy+qMqO1Xvi6Q4
 9XYIJLjWUuPa4tJy73Kpo2q/X83Wef6AHPT97AAAA
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701390907; l=1254;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=MEBwXB+U40Igb6rl9s9JdUj63wjC5O+InEcgkFNeMIA=;
 b=x7bPJlpmlUmEM2cThkbyeN+nKlbeopYuh/BL7ABKUpKBiPz+YHS0MdKpser8mH+VTK5k/WLm5bif
 qCT8UpHeDDXw/YprkmH6dAKoqpdJtto4+f0DjBmPPYhaWcKtfteM
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: krFbri4l06wzhX9N-6J09zRIA-AOB_oC
X-Proofpoint-GUID: krFbri4l06wzhX9N-6J09zRIA-AOB_oC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010002
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
Cc: Rob Clark <robdclark@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to SC8280XP, the misconfigured SAFE logic causes rather
significant delays in __arm_smmu_tlb_sync(), resulting in poor
performance for things such as USB.

Introduce appropriate SAFE values for SC8180X to correct this.

Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index e07f4c8c25b9..9ffc8804a6fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -367,6 +367,7 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
 	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xf000, 0xffff},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
 		.entries = sc7180_qos_linear

---
base-commit: 3cd3fe06ff81cfb3a969acb12a56796cff5af23d
change-id: 20231130-sc8180x-dpu-safe-lut-ffd0df221d67

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>

