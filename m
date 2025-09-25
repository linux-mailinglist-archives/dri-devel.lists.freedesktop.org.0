Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838CBB9DCA8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77B110E85C;
	Thu, 25 Sep 2025 07:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mMGpCaAJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E36A10E86C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Ev9i021670
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U/ewAsdzTC0PEPN+SodRZso/2oAjrX6us73TZlYVliA=; b=mMGpCaAJo7kAEKW3
 4Rz1d3MIekz/Se5y7db3XavqVR6R8YnFUxdyAFBqP9qIkb6cREra3l6beejY9VRR
 O2lbD6Uf3ybNancu3Bh4hgnhI8zX5X8P/0Lw6HxObKEzn8fVEZCdAJGn6o3D8uCv
 ejUolD7VKIFOd45nHqqRYl2hfIMVoOHjJCfsWY30uU+3022qTY3ehFa8GU6LIvy/
 ebZSIvA0JjW3FimFhZ9JXCComSx1wFvW7dLRCeQkyh2jzQjaP1WRezUpMQPtBYJf
 tZ8CfWI757gNu9hP9qcXRbBH/h658H4CbLMIv1IyCWmRLfoSAHkY9ZWmv9Nw5L7J
 BoZwOw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budaept1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3306bae2119so300145a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 00:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758784017; x=1759388817;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/ewAsdzTC0PEPN+SodRZso/2oAjrX6us73TZlYVliA=;
 b=WpO4VLLR8+L6Dq/L8M4/QHvmVJKGmQbqF3/bvO9wnwcSQgutlxHw3Z5ZF384gmpKVO
 UWj7q+lbVMtCJVMadfTTvML8HzqKnsLFxi32sDYazmZh6C1FXzlEVj/0e1mHWhfarwF/
 Y2G1WYC5oq695cbSHot7PeFR+xsOGv0lntKP+NDiZAD4lwtfKDDRT4PNkzwbckrIDoxs
 pNas/abUSsaGZ/fPpN6g7eR9XYShdRJPGx9Pt78NneFs8u7vczNvoZKhzyidbhIabTAb
 CBl12hVBkVhKFy41HMM5bdgn6LdD9eHAjWCBYrYAzjGYjpVtZNtM5cO6VluI5o+I2BGL
 MZLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSlTlfW31CCb8VAMepw6i+IO5eTn2Bu7lAdib5uvVhmrG9GX1OesVCVlKkITGSPjbU6xCiH5uyFeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjSN/xSUtrwS3w4GJezvOZ1J3R978sbiLRyAYUnS7slP/Sngb4
 Xf4sqInuadvJDnNAj8F/gA/3o9qjITmA7kWdv6hH/yfhvkJcfKJHbRzUyOX6efQmcruxl0e0tAI
 C9wvyTi/eCg+sDTpIFB1P0Det9Kc8PL5LriGvzNzuFVSjEPAMYxQ3aAngjZ0TpCP5eFgmVFU=
X-Gm-Gg: ASbGncuWXRpd2syCdWM1bqPOE6Az2j7q6Mbn9cgnyUfDiXhWGOGfaZrL1J+j8OZVIqp
 J082TpGLS/19NLz8PI9cOY/XXgvUmoL5kQEBWO1VdWpWofch5q8w5np/r124G0KaqOxB6czKp5V
 ltyYqQatF5DOjW+hBPoMlufdk88yO8sYa5Ts4LHzkFdyu69P0mOkmScjz9SUS3mUneM4kpALOjm
 YK/XVEfoIXhN9KK9F0sNkh70f39ar+VDvY9m0kBmtyo5bEJom5nNQlc+72lNAGeZ6FAe1OvAhIC
 WEO7Vh/VqJ3D3vPs2pxyRlp2I6k3PQAJ88+D59zOcSUFVPn0S5Vo1N6VsI3162MVLie3urn4StQ
 28NEOMLl8jKm+9UkrSnJ/hJ1WNqHhQJOmbHKr+6zh5QEXIKjNCaOEyXmg
X-Received: by 2002:a17:90b:1d0d:b0:330:68e3:ce7e with SMTP id
 98e67ed59e1d1-3342a230ddcmr1393187a91.2.1758784016990; 
 Thu, 25 Sep 2025 00:06:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEydyBxQvXFLvLbGCWUVusQvnXuEZsG7rVXNdU7irf5Kov39+iOrak8phy/uzwVcIMlnzogKQ==
X-Received: by 2002:a17:90b:1d0d:b0:330:68e3:ce7e with SMTP id
 98e67ed59e1d1-3342a230ddcmr1393166a91.2.1758784016593; 
 Thu, 25 Sep 2025 00:06:56 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:06:56 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:05:00 +0800
Subject: [PATCH v6 14/14] drm/msm/dp: Add support for lane mapping
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-14-419fe5963819@oss.qualcomm.com>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783911; l=5055;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=MBFao/DJ+AvQFYkIXOckenkzKbeQrB9uXWrKsMRXuzM=;
 b=YZKXR2CUgP470JDI7PJrgUO29J0aV1Yic0DGd9ehh5weifTEt5JJWmf+3GOoo3E2tGiGMEgMj
 6544KOTHvvyBOCE2TTE4IquwBx+8p6+dceUEZ6AHk2AYuDxi5cPfytC
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: krWB7AoCoKT21hI3tE8m5NSdGu9Lma3D
X-Proofpoint-ORIG-GUID: krWB7AoCoKT21hI3tE8m5NSdGu9Lma3D
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4ea12 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TnvzUFuqcobRuy42eWwA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX3I31NUmC7yiE
 fA4aRLY6oTHJsemUjF+w84clln6GNDBDzonN65f90FR3ridcHxfLfyttY+td3IE7BDX3U0TiH5l
 j25ARsCuIEJXvcW72MxZOucY+eEKkbeRMZJaDaCxFGibIty9iHfio+Foa2KSorAsRRnGXCKnYLK
 zReahOrcx7eRkJynVZBP0WtMpaTEOwalJkntschQ4qP9tvEbk9xDohALx2oCmGQoiZixvkKw4t8
 hsq00XGCoF2/EZd+KVU+urUKrV8L9KjtaIQka1Kfy7Ll+P13qiE1zU36HkP5RXzz4kgX9EJjIaP
 rptWfUv1hFyQoASjbS8Z1+gSvGdfp4fsz1gVl4e4PZ61vXrOylKHAaxBXCacFfoqVcrke2c/4Hu
 y6zE5vNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113
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

QCS615 platform requires non-default logical-to-physical lane mapping due
to its unique hardware routing. Unlike the standard mapping sequence
<0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
configuration via the data-lanes property in the device tree. This ensures
correct signal routing between the DP controller and PHY.

For partial definitions, fill remaining lanes with unused physical lanes
in ascending order.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
 drivers/gpu/drm/msm/dp/dp_link.c | 61 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h |  1 +
 3 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c42fd2c17a328f6deae211c9cd57cc7416a9365a..cbcc7c2f0ffc4696749b6c43818d20853ddec069 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -423,13 +423,13 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 
 static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 {
-	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
+	u32 *lane_map = ctrl->link->lane_map;
 	u32 ln_mapping;
 
-	ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
-	ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
-	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
-	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
+	ln_mapping = lane_map[0] << LANE0_MAPPING_SHIFT;
+	ln_mapping |= lane_map[1] << LANE1_MAPPING_SHIFT;
+	ln_mapping |= lane_map[2] << LANE2_MAPPING_SHIFT;
+	ln_mapping |= lane_map[3] << LANE3_MAPPING_SHIFT;
 
 	msm_dp_write_link(ctrl, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
 			ln_mapping);
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..2ae78d33fffd7c49190983952ee8f5a249f2b69d 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1236,6 +1236,62 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
 	return frequency;
 }
 
+/*
+ * Always populate msm_dp_link->lane_map with 4 lanes.
+ * - Use DTS "data-lanes" if present; otherwise fall back to default mapping.
+ * - For partial definitions, fill remaining entries with unused lanes in
+ *   ascending order.
+ */
+static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link *msm_dp_link)
+{
+	struct device_node *of_node = dev->of_node;
+	struct device_node *endpoint;
+	int cnt = msm_dp_link->max_dp_lanes;
+	u32 tmp[DP_MAX_NUM_DP_LANES];
+	u32 map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3}; /* default 1:1 mapping */
+	bool used[DP_MAX_NUM_DP_LANES] = {false};
+	int i, ret = -EINVAL;
+
+	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
+	if (endpoint) {
+		ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, cnt);
+		if (ret)
+			dev_dbg(dev, "endpoint data-lanes read failed (ret=%d)\n", ret);
+	}
+
+	if (ret) {
+		ret = of_property_read_u32_array(of_node, "data-lanes", tmp, cnt);
+		if (ret) {
+			dev_info(dev, "data-lanes not defined, set to default\n");
+			goto out;
+		}
+	}
+
+	for (i = 0; i < cnt; i++) {
+		if (tmp[i] >= DP_MAX_NUM_DP_LANES) {
+			dev_err(dev, "data-lanes[%d]=%u out of range\n", i, tmp[i]);
+			return -EINVAL;
+		}
+		used[tmp[i]] = true;
+		map[i] = tmp[i];
+	}
+
+	/* Fill the remaining entries with unused physical lanes (ascending) */
+	i = cnt;
+	for (int j = 0; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {
+		if (!used[j])
+			map[i++] = j;
+	}
+
+out:
+	if (endpoint)
+		of_node_put(endpoint);
+
+	dev_dbg(dev, "data-lanes count %d <%d %d %d %d>\n", cnt, map[0], map[1], map[2], map[3]);
+	memcpy(msm_dp_link->lane_map, map, sizeof(map));
+	return 0;
+}
+
 static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link *msm_dp_link)
 {
 	struct device_node *of_node = dev->of_node;
@@ -1255,6 +1311,11 @@ static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link *msm_dp_l
 	else
 		msm_dp_link->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
 
+	if (msm_dp_link_lane_map(dev, msm_dp_link)) {
+		dev_err(dev, "failed to parse data-lanes\n");
+		return -EINVAL;
+	}
+
 	msm_dp_link->max_dp_link_rate = msm_dp_link_link_frequencies(of_node);
 	if (!msm_dp_link->max_dp_link_rate)
 		msm_dp_link->max_dp_link_rate = DP_LINK_RATE_HBR2;
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 0684a962d4ec93f7da764c4af2e2154c7050329c..b1eb2de6d2a7693f17aa2f256657110af839533d 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -74,6 +74,7 @@ struct msm_dp_link {
 	struct msm_dp_link_phy_params phy_params;
 	struct msm_dp_link_info link_params;
 
+	u32 lane_map[DP_MAX_NUM_DP_LANES];
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 };

-- 
2.34.1

