Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF61B89EF4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378E010EA18;
	Fri, 19 Sep 2025 14:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwVk29bs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3380C10EA18
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J9BiVu021854
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vWqKsvOTRWZThPxJdQQdJfugEpEjQHMoOZlOygwfbek=; b=JwVk29bsGltZb/yf
 eH4N3Gi4iDZkzH5DnwzoSfX+/ij9/VaHPcWvQsPb0M6cS8LSwwKuEGMcWpTcqnQT
 VM5RbwvAB2Zgz1NgQkK65cR616DvJqh32Pu3BkolcVTiBnwRkrEEg6ErG5vSps9o
 U8651LcHfJ/n3qebFgom24wQE8+uxMzpsbR340OjZG/S86ceuRd+YRwyFiyL8Bkm
 w6/hjFbf6pSmvAO+vkiL0MAI6ZT3rv/V5XMCUx5wPoykmxUtq7gaNUM26HB0Mp6S
 SJYea3/vQt8QvsY/UB3ax9WJ6InI+OFjm9+Tx8ujHNPRchZiunEr2sVKTHhZ0xY6
 cVhxMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy2nrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-25bcad10907so4571495ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758292005; x=1758896805;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vWqKsvOTRWZThPxJdQQdJfugEpEjQHMoOZlOygwfbek=;
 b=hzHZv/LRXOeQ2s+gHXx+PeM2wjhnmCQRgCcEVUvuhNQZsgezAyTgez0k9TJFwHoVlU
 SMGfGshpn1EQ4gvN7cYPBBAzhJKg1U19cyen8mTO/LHb+FdEM6/KKr3TA8LpsQ5f/F5V
 U971VJMsnBEazKJ2VQ/qyUTKgLU9058zPCjQDk+gJCIUZSWzaSnqDxLHiAqh8aA93yJK
 FSWAPBmpHiYgsOETZqxhIIHcMpYLixzDyw930iBJG/dLM3+TmuL8B/O9hcQpnGXaPUzx
 dsEEJAxomw/GFHycf2xqD9fHc0nTguNnuXnBvyI+e0wFrqfF6XoowcFggESHDNwElftt
 Qkuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBc0PgSmANF+bo9wE7lFveda7PXFY2ofBCWn4Ih8pMxLuVjj9MHspYZGG+niB1UimDiJOVvOOY2n8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYJd6Hoqj6oe8riTR3VURNGVutN6h2+8tKSNUIr0Ltc+LEZWfd
 XfvDPFk7xjj+PYkV0W6AlVjGDUOmDT5A3xnmZ5WT8CAWYFvquU/VvV6SX4xQYUSxQVt6ERWI7Dy
 1T8l5Bv/SduqDj3jL2cQs89x9sU3L9kz0BXy4HZ3k3uAqfQqjdn/p/ARyBI2sCM6+oEH2Hx4=
X-Gm-Gg: ASbGncvXkaKC5+PektEoUU7doekbrsonPb4G3z3GWLE1CN/1uRJfIMthutN3sRbIl/5
 97LbtbeyjY6L3GsaDrcApf913z0HlAup5au20Y8S4O98nlA5SozUJpH6VW8hL/r2SAVDNJGrAT+
 hIVkPzyuQhrKrv/ebk1p5CEXXkvX0wdShG8nVDHj+9vYOacm5XHMMKGR0Ey8RlUwtFZjCXBR3Lt
 wfYZNEuUmTojDT2UPmPLVvdxBAlHEFnO6qU5bLnnhrFVPLAhjWnWEKidU+zeLlSX2S6f9+Bcam9
 nJ1+QSaqI3Ckskz+3UYA3Zzx2aJHHjra5B1fvzLn7K+692c4fM7Oc2WIFq7QOeVAv6vaNgjR+QX
 PPyZaltLh9PAYBA==
X-Received: by 2002:a17:902:ea07:b0:268:140f:36ff with SMTP id
 d9443c01a7336-269ba54e851mr31024115ad.9.1758292004366; 
 Fri, 19 Sep 2025 07:26:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBtw9O1YIv/IQj4a+YUdtcF7lbLdqW5i3TVkJdKbqiPJtUlq1ypRJ+GObJFqJNdPBxuhtZZQ==
X-Received: by 2002:a17:902:ea07:b0:268:140f:36ff with SMTP id
 d9443c01a7336-269ba54e851mr31023785ad.9.1758292003880; 
 Fri, 19 Sep 2025 07:26:43 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 07:26:43 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:31 +0800
Subject: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291895; l=4981;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=P1sktCDicGuMGRykFaXjP7LWNk2asNLGxaF7CwSUW7U=;
 b=2X7CL7ayyMh68sKe13q6Fk6OrKKt3egHncSf6zVjxLpBP3vMLZKIQjDAXDXQQvUOdNilyehPA
 9gmwCM/0MvqC1DxxzcHuX3wh3RsifuUj1Y35Nynd0oyrJDeBkuYOiTZ
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxSy/6tGoUZ1q
 5bo1EF21U2vJn7LtK/VoiqJ6oDrNjjAhwY7h85j6wkWenDWcetb9jAEDvc6tp09jZqWBEWQ8jeR
 nvIQHmztgFwvJug2yIem25dr5C1dqWAjvPjl+R4OYaa1yuwYX+LC7bhwpKRVnj328Z+o631hp3j
 sdpbFlCb7azNZuQhYCknVYra6OLv0VRUBtgdUly0ZKzyJBfay9fpT0WziflB5IHrnijbfcLPv78
 MDzAz3zei580puz/lmb1Ttx0jLJdC1E861KEHIyzDugPcf6KMsQlwUIpsNdC0jJ5MKALvXMvJ9K
 +o6Zq4kcu64giAbs2BSEz7hf4X/bgQm8RmICJBU0pFDHz48SUnnwNaDiwWfG4hlZCXmRYAYCuMo
 LMhGF3XI
X-Proofpoint-ORIG-GUID: Vk-MV20WnjUO05oAuYzco4tr8Hl2CHlk
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cd6825 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0KckjaIG8F4YdJ3EJ34A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Vk-MV20WnjUO05oAuYzco4tr8Hl2CHlk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
 drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h |  1 +
 3 files changed, 66 insertions(+), 5 deletions(-)

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
index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f13352f7b3513aa88da2a 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
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
+	int i, j = 0, ret = -EINVAL;
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
+	for (i = cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {
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
@@ -1255,6 +1310,11 @@ static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link *msm_dp_l
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

