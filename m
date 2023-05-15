Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9241D7021F7
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 05:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB3810E12A;
	Mon, 15 May 2023 03:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA4B10E126;
 Mon, 15 May 2023 03:03:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34F2oCRD010556; Mon, 15 May 2023 03:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=jEGjD1EqgsIv21poC3vaXgPM07vXS+pks5OM2NnqqbQ=;
 b=cd7/G7axZ3YhmdyIJT3nri6UcHnbBfeRmAtOTfS+a0/rSGv9Ruq/vlY0aUn6ZTrpLeEf
 CzVMOLlI8mChPE/m2aZTrdp+Yh7rpLJS2y8Shl17j5WvbBatdlYILMtzioUXwW50DWH/
 sEE3UWrHnm8uV/D6q8GhAj6zW1XT9TKOptAJRh2W5jcKrQlwclPVHKK9gCR+dchJkU5F
 jUEj8Z6yAgPWGJMvGUQA25OrX5ojVCdoxIRwwEmmI/nRGzzmTPjdZnTMyOAkJhtt0e88
 pZianx8ljM+HWBK0W/2VU8NuBRjrJW1C82DqJfaUowsCBcB+D8Hz/fSA9yzRbVx7NB99 2Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qj3amahdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 03:03:03 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34F332px009566
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 03:03:02 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Sun, 14 May 2023 20:03:02 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH 2/3] drm/msm/dp: Clean up logs dp_power module
Date: Sun, 14 May 2023 20:02:55 -0700
Message-ID: <20230515030256.300104-2-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515030256.300104-1-quic_bjorande@quicinc.com>
References: <20230515030256.300104-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TsFosy6ukuJADtMDE59KCbBrja5cPrRc
X-Proofpoint-ORIG-GUID: TsFosy6ukuJADtMDE59KCbBrja5cPrRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-14_18,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150024
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clk_bulk API already provides error messages indicating which
specific clock in the request for which the operation failed, further
more these errors are associated with the specific DisplayPort
controller (rather than the shared drm_device). The additional error
messages int he dp_power module does thereby not provide any benefit.

While at it, none of the dp_power handles passed to these functions are
dynamic in nature, so there should not be any need for runtime checking
them. Drop these as well.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_power.c | 62 +++++--------------------------
 1 file changed, 9 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index c0aaabb03389..031d2eefef07 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -35,25 +35,16 @@ static int dp_power_clk_init(struct dp_power_private *power)
 	stream = &power->parser->mp[DP_STREAM_PM];
 
 	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
-	if (rc) {
-		DRM_ERROR("failed to get %s clk. err=%d\n",
-			dp_parser_pm_name(DP_CORE_PM), rc);
+	if (rc)
 		return rc;
-	}
 
 	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
-	if (rc) {
-		DRM_ERROR("failed to get %s clk. err=%d\n",
-			dp_parser_pm_name(DP_CTRL_PM), rc);
+	if (rc)
 		return -ENODEV;
-	}
 
 	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
-	if (rc) {
-		DRM_ERROR("failed to get %s clk. err=%d\n",
-			dp_parser_pm_name(DP_CTRL_PM), rc);
+	if (rc)
 		return -ENODEV;
-	}
 
 	return 0;
 }
@@ -121,11 +112,9 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 			mp = &power->parser->mp[DP_CORE_PM];
 
 			rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
-			if (rc) {
-				DRM_ERROR("fail to enable clks: %s. err=%d\n",
-					dp_parser_pm_name(DP_CORE_PM), rc);
+			if (rc)
 				return rc;
-			}
+
 			dp_power->core_clks_on = true;
 		}
 	}
@@ -133,10 +122,8 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 	mp = &power->parser->mp[pm_type];
 	if (enable) {
 		rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
-		if (rc) {
-			DRM_ERROR("failed to enable clks, err: %d\n", rc);
+		if (rc)
 			return rc;
-		}
 	} else {
 		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
 	}
@@ -162,34 +149,19 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 
 int dp_power_client_init(struct dp_power *dp_power)
 {
-	int rc = 0;
 	struct dp_power_private *power;
 
-	if (!dp_power) {
-		DRM_ERROR("invalid power data\n");
-		return -EINVAL;
-	}
-
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
 	pm_runtime_enable(&power->pdev->dev);
 
-	rc = dp_power_clk_init(power);
-	if (rc)
-		DRM_ERROR("failed to init clocks %d\n", rc);
-
-	return rc;
+	return dp_power_clk_init(power);
 }
 
 void dp_power_client_deinit(struct dp_power *dp_power)
 {
 	struct dp_power_private *power;
 
-	if (!dp_power) {
-		DRM_ERROR("invalid power data\n");
-		return;
-	}
-
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
 	pm_runtime_disable(&power->pdev->dev);
@@ -200,25 +172,14 @@ int dp_power_init(struct dp_power *dp_power, bool flip)
 	int rc = 0;
 	struct dp_power_private *power = NULL;
 
-	if (!dp_power) {
-		DRM_ERROR("invalid power data\n");
-		return -EINVAL;
-	}
-
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
 	pm_runtime_get_sync(&power->pdev->dev);
 
 	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
-	if (rc) {
-		DRM_ERROR("failed to enable DP core clocks, %d\n", rc);
-		goto exit;
-	}
-
-	return 0;
+	if (rc)
+		pm_runtime_put_sync(&power->pdev->dev);
 
-exit:
-	pm_runtime_put_sync(&power->pdev->dev);
 	return rc;
 }
 
@@ -238,11 +199,6 @@ struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
 	struct dp_power_private *power;
 	struct dp_power *dp_power;
 
-	if (!parser) {
-		DRM_ERROR("invalid input\n");
-		return ERR_PTR(-EINVAL);
-	}
-
 	power = devm_kzalloc(&parser->pdev->dev, sizeof(*power), GFP_KERNEL);
 	if (!power)
 		return ERR_PTR(-ENOMEM);
-- 
2.39.2

