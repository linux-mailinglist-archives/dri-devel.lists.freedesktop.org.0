Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DDBB0D2B1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D4210E5F8;
	Tue, 22 Jul 2025 07:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBt+M+UI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B35310E5F8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:34 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7GIRD003943
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SRoknLhESGJkp/W59IYd/1yIvuO8rKzibCESNkSnMiA=; b=cBt+M+UIJuLQzsUe
 WWeUa0SdQ6edqvThTF2bTw/Wu+iMg3JtCyK29PyhTe/DP7aeq/IIpbOwmleTHBBL
 c4bAwVXhZ23icfbCpFeqVmDRRHZ5oTUuE+Q8Z3WRi3BhZFjI+9t/mHao5p7Utp2t
 CR06uTWPKapPTfLAbLKTsIOLxWbGmZX1foQAgVYgRA7aGimYPnXiI7qXYomGPhut
 BYbLL3C5f4rlfK4a76Z5L71bn/yuldDJ+e3YQFZ9tK7Isv1L/ekoujcZxk26Nx6a
 6pOVw008CXEatIHEknT25levLSKz7JzqeKKPOECWxD9r5IulLAKR3ykKPmz+OMoF
 Cf6wbg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v6tkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3130b8246c8so1569610a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753169013; x=1753773813;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SRoknLhESGJkp/W59IYd/1yIvuO8rKzibCESNkSnMiA=;
 b=RODN6CC71P0+xLVTZl5yipzFdeBb6Tyof4tYQG0h64cgzzPk3DfNJn4OUR7f86TAIk
 l2gdqhz4mPh/mknxkbxfufOHLRVGBAWJZFlRSxA1zQSY5w16sTYYBp18vzIxcMGrmNZQ
 vZgEbQKRLCkiYdooN2n+RMOC5Ew5jkP78Vre97jPzKVHzl+OZoAqYxW4T4HCUzxuYzen
 AXUhpdcoygsLzNMsHVGZipR9ryEB0ADkaM/GH/sK2WXKRkwzqYOrJvjiAZisw7fM0u5m
 VO+GUi/bAbCUtQXMGXeVqel91bgDk/YxhM2vCCBTYOLF0Ez4DnIlqxduw3T3w/c+1ILX
 35NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVO7lFRUy8pVGFufljZS+WhMb9sQgiJ3j2QM/LInJyo08uZh52kTLZrf9d3TfVcWiwPrb7QzCbyHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB2Xdb/6N5wmwKHzaRHEt1QPXX89acdWarKSAGZxb6/kL4kq/l
 dBBsZfDqvll3JPnAK+g8C9FCgs8/H9/jQod9Y/FsR9h09JiWFF34DRRefcOeLzyCz1RLAe+hIix
 EYYcgxLSTtYAPAG4yAsi07awU8fnFKrkdrW/2PxoxUtWERINA3KxFKVv1/8kJNCPpXIkVeBU=
X-Gm-Gg: ASbGncuD1+ZTzgjP4JUJsmrRCLOVRXYedHfX2TTUwCpSgSfIEHg3GecVBVU0E+k5SMi
 JeMWPM9KepFgqyngDdM7wvFuj7Zner0Pi98ulBOHD64MZfmouRrY3/ieJ7YOl9KgFkH4GzfqQsN
 TP3tYNa4euCb3HmPy4qIE9cX3mdvyysx2rMaRojNWJd1X0u2dXsJSJaf3fx1390jNdzFP+85zLa
 NMQLi275VBic43f/Vv24VSI2JL2KGoyMJOxi2uXl0L2jh7DNcNpjNozCqA9nEMWTLjGvE+8VbrQ
 6p777ePRqvkOwkVfCAktsWi7OvxfPeAtFnvSTmTAGCVcCFb35ADRZLh5b8jJztOUH0p8NWchTiD
 GIiXZtbtkpMs0KpcszMaj8dlRJkXAvRFAp3QdV9myC/OnFkhYjWaBakF0
X-Received: by 2002:a17:90b:518d:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-31c9e76ae7amr13793076a91.3.1753169012524; 
 Tue, 22 Jul 2025 00:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFko6zdDLS9yGWBWKIKCenAy/9fb0yFHvW+++dTlsCyxV/jrbgXYH4ktmzFN6HzFm/3zlSHSw==
X-Received: by 2002:a17:90b:518d:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-31c9e76ae7amr13793061a91.3.1753169012023; 
 Tue, 22 Jul 2025 00:23:32 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:23:31 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:11 +0800
Subject: [PATCH v2 10/13] phy: qcom: qmp-usbc: Track PHYs for standalone
 DP/USB3.0 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-10-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168938; l=4083;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=x52wj5u+rb6dbB9m5Z9EVaM2Qq3LqnWRHa5RdOZnzXM=;
 b=htKC4pfBN+sR8v9mfOnbuVOX4GlHHUEvwakJuhy6tTezZjlR8N3uaHroW6IAc7yy0WQJgl5V7
 Q7hKjifp+bVBs2A+gPwSVkicyslpzb5ZWiQa7F77q4VpAWJJKTjDhlO
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: 5pvulRJRuQjII4hb9v3HE-SCoymYfrJH
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687f3c75 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vLThFRzmIc36aVVRt4AA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX9KALEXUyL09M
 axhIxrk/bdqv23A3pfI2LRLdvXGFvkBGOQs9tHKdbtY7Cqi8R9kxkNiRjPST7PiygSwS/O7fPfJ
 hzBxhMPgWkEUbRwWTJrZ90LWQLy9/i5I5nXt9cD3imkzoE9CDg67DgeetwEDf+9ndNKuSkmnwsV
 1W1m8Ek9xh2eGwXZgEtTfTmO9QbhLJS45D6Tb1SbfDXVp77Ozg4s8WsQW52aOIY0JYJ3/7mkF2Q
 b03/qP7NbJgLlIgHFdMejleN0/qySI6S0urW37GcV2Vl+6hXtT+Xa9E7ZHgCXJHEIiuSbLiaHOO
 T7gLob41Z/6zv8Sv9KQzo/CI9EVd3i9G37sY9Oym5a4MTbRamaBGZEWlP+zjuXp5GjQywDCw1Ld
 YPllIruS2FNL+RKqJm9Y1vgVSbt+qMraGk0bKKpB4/5cANmcdeHCOISY4vYb8drMOELyo60d
X-Proofpoint-ORIG-GUID: 5pvulRJRuQjII4hb9v3HE-SCoymYfrJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059
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

Introduce a local list to track registered PHY instances, enabling
identification of standalone DP and USB3.0 PHYs that share the same TCSR
region.

This allows the driver to detect and manage mutually exclusive PHYs at
runtime, preventing configuration conflicts when both PHYs are present
on the same platform but operate independently.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 6291298904de9717283e59f1ca2a845b46146d52..e97a206a10554b2d157d1fadd66d66386eec6c40 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -514,8 +514,13 @@ struct qmp_usbc {
 	u32 dp_phy_mode_reg;
 
 	struct typec_switch_dev *sw;
+
+	struct list_head list;
 };
 
+static LIST_HEAD(phy_list);
+static DEFINE_MUTEX(phy_list_mutex);
+
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -1107,6 +1112,25 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qmp_check_mutex_phy(struct qmp_usbc *qmp)
+{
+	struct qmp_usbc *mutex_qmp = NULL;
+
+	mutex_lock(&phy_list_mutex);
+	list_for_each_entry(mutex_qmp, &phy_list, list) {
+		if (qmp->type != mutex_qmp->type &&
+		    mutex_qmp->dp_phy_mode_reg == qmp->dp_phy_mode_reg &&
+		    mutex_qmp->init_count > 0) {
+			dev_info(qmp->dev, "Mutex phy busy!\n");
+			mutex_unlock(&phy_list_mutex);
+			return -EBUSY;
+		}
+	}
+	mutex_unlock(&phy_list_mutex);
+
+	return 0;
+}
+
 static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -1114,6 +1138,10 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_check_mutex_phy(qmp);
+	if (ret)
+		goto out_unlock;
+
 	ret = qmp_usbc_generic_init(phy);
 	if (ret)
 		goto out_unlock;
@@ -1166,6 +1194,10 @@ static int qmp_usbc_dp_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_check_mutex_phy(qmp);
+	if (ret)
+		goto dp_init_unlock;
+
 	ret = qmp_usbc_generic_init(phy);
 	if (ret) {
 		dev_err(qmp->dev, "type(%d) com_init fail\n", qmp->type);
@@ -1772,15 +1804,16 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
 	return 0;
 }
 
-static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
+static int qmp_usbc_parse_usb_tcsr(struct qmp_usbc *qmp)
 {
 	struct of_phandle_args tcsr_args;
 	struct device *dev = qmp->dev;
 	int ret;
 
-	/*  for backwards compatibility ignore if there is no property */
+	/*  for backwards compatibility ignore if there is 1 or no property */
 	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
 					       &tcsr_args);
+
 	if (ret == -ENOENT)
 		return 0;
 	else if (ret < 0)
@@ -1793,6 +1826,13 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
 
 	qmp->vls_clamp_reg = tcsr_args.args[0];
 
+	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 1,
+					       &tcsr_args);
+	if (ret == -ENOENT)
+		return 0;
+
+	qmp->dp_phy_mode_reg = tcsr_args.args[0];
+
 	return 0;
 }
 
@@ -2051,6 +2091,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	mutex_init(&qmp->phy_mutex);
+	INIT_LIST_HEAD(&qmp->list);
 
 	qmp->type = data_cfg->type;
 	qmp->cfg = data_cfg->cfg;
@@ -2064,7 +2105,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		if (!qmp->layout)
 			return -ENOMEM;
 
-		ret = qmp_usbc_parse_vls_clamp(qmp);
+		ret = qmp_usbc_parse_usb_tcsr(qmp);
 		if (ret)
 			return ret;
 
@@ -2139,6 +2180,10 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		}
 	}
 
+	mutex_lock(&phy_list_mutex);
+	list_add_tail(&qmp->list, &phy_list);
+	mutex_unlock(&phy_list_mutex);
+
 	phy_set_drvdata(qmp->phy, qmp);
 
 	of_node_put(np);

-- 
2.34.1

