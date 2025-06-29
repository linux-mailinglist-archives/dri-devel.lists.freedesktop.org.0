Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7965EAECBD2
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 10:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D2D10E04D;
	Sun, 29 Jun 2025 08:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSj7D8hF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3D310E04D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 08:50:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T4QLVC003586
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 08:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=0hMlDyDA0Cncyv17SlazKl1oOurrgn26mPK
 6B3j+WiA=; b=iSj7D8hFBCQQnbb1wnFI1cLknT+SVdnBKg8BTJLhgwFbusfBuQS
 M+mr/qVmMKuCmlEAQYJuI3V1WKpXCv4M8iWQqgqe+/VekssVI/EFAKgpnr62iyJd
 U40QTYajYpVeCEPPPn1d5SiR+jCeibMj6XelrK7qVPXmfoXMZqZqt9v5L4zFKPqw
 Xwwbkuworiq8P641PRgQd7vaV9GhMDZ6LFbYYZgQG46q2xFXoId0SJGZhd4NiyIp
 INhtAMVSdfsrzT271CYH3mWOwDT3D2fLIfwhlExa8tIniKKrmv/6UGsmMPNmwotY
 ZlU3v/if41EY/xKxR+TudATT0tVMU/X/zAg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvj03y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 08:50:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fd75e60875so21174126d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 01:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751187047; x=1751791847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0hMlDyDA0Cncyv17SlazKl1oOurrgn26mPK6B3j+WiA=;
 b=IrTvlaPpAHGf1ntNK+zaEt7yo2jmAh/4GUNE0IyclTfqY1Sct+PFNDam1VJzRoH6YC
 zdnk06uWYkdEkoQxo/R1jNdxMXB184wVC10ebG/4+TOfzbhIYBKcqlV0odiBcKKpS4mu
 8CVDLsLQ51RdZ3s+NELWFLrRf51AvDfuZXZhwiQec5sPejMvOGXvAypxo+x9w/Q4auay
 zClS+0ubDGrg1k6ObmtDBbOfUKHgga9Hmor/Emu+qGnHQ7cTgdGZqJVyaCFav5to7UVw
 DCqUaw3Tl6YV/oz9SEimJoo9wRE4+zRwHKi4fqgORH/w1ae/MzmfeMSbVMdVfjEpqiNk
 lmZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0NTxGOFGIUiOFnBKmabwBkX5WYtpLQHEP1t/px00/lSMdXI0iZ21xlDRQq+JsOGbUemFrd1Tmg7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5j8HTTECXA/z/AjDmJtU4ohWzj+SZI+ZurFZhlfvMF0hZ9qT7
 7iHuzrqQ0f1PC9z2JV8cDUrMlwKcTN/r8p1IF2wtxKxIvt9lKdR1FeF6n45BmmbbND1aoLJqwLD
 WC+Kd0UzcXspOf9AFbPxgki3bN8vHFVcDVsqku10RxHmQ7BpNfT8jGwJ7tsAvt4nrMy3WNI4=
X-Gm-Gg: ASbGncuB6PO7Hubsot+rlYpJ+10Vd6Pdoi0qCBhEm7CFdChz58RBext/LhFfkslkY3E
 4k6c3g23C3dxNP/yV/3ItC5F6gS44x6J1hUhs8n7knfbk9UevnVZku8hWIvGxO/v8ZxFBYMSbrq
 YpUWw2IB9LvenQVGeeOrPEzJu5UW0SLWgJJtRaRQia4Mul+jWcOta48QikCLNPnRiSjSFZ1Je6O
 5guOiYIwDi3UXO2hdZ4U+yjqTvtd3Jowms0BWJ/AJ1jsaVNkjrtyviKv8O/hhVPFvm40bay4B6k
 enBIz5Bmj/2HkLPxinJvXmTWX9CloPtUsga55PqzEBZL0HO/2wVsWmd6/g==
X-Received: by 2002:a05:620a:a101:b0:7d3:8d53:c509 with SMTP id
 af79cd13be357-7d443923426mr1326542985a.2.1751187046672; 
 Sun, 29 Jun 2025 01:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7/wzur2ilMnXl00SgqKWW95HdeipYCmpE4UPXGQOX/T8tKPtvKwMo5gyNymqaUsH5MVU/Gw==
X-Received: by 2002:a05:620a:a101:b0:7d3:8d53:c509 with SMTP id
 af79cd13be357-7d443923426mr1326541185a.2.1751187046208; 
 Sun, 29 Jun 2025 01:50:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([123.51.149.218])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c6bc2dsm463754966b.136.2025.06.29.01.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 01:50:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [RESEND PATCH v2] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
Date: Sun, 29 Jun 2025 10:50:36 +0200
Message-Id: <20250629085036.765397-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lz-XbwMK421L7mHM_NEgDAChRUiRNJ6c
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6860fe68 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ygdFXUo9QkFfm0HlBJS/UA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Hn5eap2Cq60OI_ydS0cA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: lz-XbwMK421L7mHM_NEgDAChRUiRNJ6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDA3MyBTYWx0ZWRfX5Cptkn6Yohf2
 igzxZD09Z+X6Ntl3590v0GnfMQd8UdBsn3gSBG6suLk0vQveXoyU1gdKsnphUSsmkzYOdQub0Fd
 dHbk2rNRPV+CuKYpCVhQvocHFKZrB+8pF/1ON5oI+oMN5cn4Ne8nZ+YILGtBoaDKz6HW8/6nwTD
 iKsC1Ew8Rrea3AM0pzAN/YUpv97x9C1/hHPwfKYtxqNf5k9C1k2f8XhGFf5F3nwBHMjo8gQumGB
 b1fixZI/8FrvsAaEUifZypF4dZIvFSpW1C2Wtk5BKXNedZdhW9oRLZUH//0qli1Zy+RokCef899
 XQhiQaD5knSDfgOMKMMszQSBQh4LyIyi4Zcp1/LpkY5I+PINFiG1a9Yim7zWDPPA8QCAdxiWfOP
 QlmXDn+tEIaR6AuQ9hR+TajP3fPAC02tXD7AYMiOXVv6caFwgpS4w4fGx8WncP/OhcwAKQgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290073
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

To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
be active for MMIO operations. Typically, this AHB clock is enabled as
part of the DSI PHY interface enabling (dsi_phy_enable_resource).

However, since these PLL clocks are registered as clock entities, they
can be enabled independently of the DSI PHY interface, leading to
enabling failures and subsequent warnings:

```
msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI PLL lock failed
------------[ cut here ]------------
dsi0pllbyte already disabled
WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa4/0xac
CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
Tainted: [W]=WARN
Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[...]
```

This issue is particularly prevalent at boot time during the disabling of
unused clocks (clk_disable_unused()) which includes enabling the parent
clock(s) when CLK_OPS_PARENT_ENABLE flag is set (this is the case for the
14nm DSI PHY PLL consumers).

To resolve this issue, we move the AHB clock as a PM dependency of the DSI
PHY device (via pm_clk). Since the DSI PHY device is the parent of the PLL
clocks, this resolves the PLL/AHB dependency. Now the AHB clock is enabled
prior the PLL clk_prepare callback, as part of the runtime-resume chain.

We also eliminate dsi_phy_[enable|disable]_resource functions, which are
superseded by runtime PM.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 v2: Move AHB clock into a proper PM dep instead of manually toggling it
     from the PLL clock driver.

 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 65 +++++++++++----------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  1 -
 2 files changed, 25 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 5973d7325699..015cb579c669 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -5,6 +5,8 @@
 
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <dt-bindings/phy/phy.h>
 
 #include "dsi_phy.h"
@@ -511,30 +513,6 @@ int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 	return 0;
 }
 
-static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
-{
-	struct device *dev = &phy->pdev->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(phy->ahb_clk);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: can't enable ahb clk, %d\n", __func__, ret);
-		pm_runtime_put_sync(dev);
-	}
-
-	return ret;
-}
-
-static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
-{
-	clk_disable_unprepare(phy->ahb_clk);
-	pm_runtime_put(&phy->pdev->dev);
-}
-
 static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
 	{ .compatible = "qcom,dsi-phy-28nm-hpm",
@@ -696,24 +674,30 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	phy->ahb_clk = msm_clk_get(pdev, "iface");
-	if (IS_ERR(phy->ahb_clk))
-		return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
-				     "Unable to get ahb clk\n");
+	platform_set_drvdata(pdev, phy);
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	/* PLL init will call into clk_register which requires
-	 * register access, so we need to enable power and ahb clock.
-	 */
-	ret = dsi_phy_enable_resource(phy);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
+	ret = pm_clk_add(dev, "iface");
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Unable to get iface clk\n");
+
 	if (phy->cfg->ops.pll_init) {
+		/* PLL init will call into clk_register which requires
+		 * register access, so we need to enable power and ahb clock.
+		 */
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
 		ret = phy->cfg->ops.pll_init(phy);
+		pm_runtime_put(&pdev->dev);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "PLL init failed; need separate clk driver\n");
@@ -725,18 +709,19 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to register clk provider\n");
 
-	dsi_phy_disable_resource(phy);
-
-	platform_set_drvdata(pdev, phy);
-
 	return 0;
 }
 
+static const struct dev_pm_ops dsi_phy_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver dsi_phy_platform_driver = {
 	.probe      = dsi_phy_driver_probe,
 	.driver     = {
 		.name   = "msm_dsi_phy",
 		.of_match_table = dsi_phy_dt_match,
+		.pm = &dsi_phy_pm_ops,
 	},
 };
 
@@ -762,7 +747,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 
 	dev = &phy->pdev->dev;
 
-	ret = dsi_phy_enable_resource(phy);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",
 			__func__, ret);
@@ -808,7 +793,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 phy_en_fail:
 	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
 reg_en_fail:
-	dsi_phy_disable_resource(phy);
+	pm_runtime_put(dev);
 res_en_fail:
 	return ret;
 }
@@ -821,7 +806,7 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
 	phy->cfg->ops.disable(phy);
 
 	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
-	dsi_phy_disable_resource(phy);
+	pm_runtime_put(&phy->pdev->dev);
 }
 
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 7ea608f620fe..0c65821a3db2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -103,7 +103,6 @@ struct msm_dsi_phy {
 	phys_addr_t lane_size;
 	int id;
 
-	struct clk *ahb_clk;
 	struct regulator_bulk_data *supplies;
 
 	struct msm_dsi_dphy_timing timing;
-- 
2.34.1

