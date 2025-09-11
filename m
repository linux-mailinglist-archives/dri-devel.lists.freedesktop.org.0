Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B90B53692
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6F310E39F;
	Thu, 11 Sep 2025 14:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HN2pgsX3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687C710E395
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:57:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB5N2h015131
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 poPQezAqO5CLn7JGsotj9+FaLlUAX0s+F1zX9jDxN/U=; b=HN2pgsX3P5FMk8Su
 utmLP/T3KSP6vXamGNxCKBRVa44iNls7G8Y71g06GkmxPX6xGrWthrp/5gqCynKG
 0otlp0H0Woc9BYXwwa6uatpMUC7bSjuUSVpc/D0tSB159hSzalZnUx+H6mj3fIfh
 2gp8c9/7aN1fFJEnEzBCAollbIv6+xnY4j/1uElptv70SIQh6TIxHutA+HD+O1wl
 QyqOOi70Il1WevVSV+xnMY4AfXT4okiOywhozyt2bCksecvAS6ddwmAFDu9CqsZj
 zlXAkkttewOQ23mhEk4bCicq+WCxUJF0WLm6ULDRyOgfdW8HiEVN3lvsUiy5P7if
 I2R+eg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m819q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:57:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4d01b30e8dso226767a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602621; x=1758207421;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=poPQezAqO5CLn7JGsotj9+FaLlUAX0s+F1zX9jDxN/U=;
 b=Jk6IzzWFQs9j34Suzoew8fmIOPgYi+Yek/Ow5YzA1F9kB68O2J1uZXjiiXhJuO9Mm5
 hpsNEk0V1J8QOCSL2RrE943q+pF4uAlToAJnHORUGgB0oc95vYZfKxkfegeDeenLB/SO
 /afcreiigk/hVC3sXB+tc7IYWokyNpKM/njDgbpUw8X+Ob5SU6LHL9P0mAW4ob11B9aW
 arkbKaQUZPwAXDSqO0I984v8BBPn/ttSNQYlaxsMkZMpTLdMV2fZ6DHyB8X2tlcYsmy6
 ACHvII28uK4rY/OVOcQNoxXUR742jaugtBzqjzA9yspf/azzRtm11c6jkfH3aTTVk/91
 bPmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyDHUXnQkLG8/p0swort/cegyzkz1mhea+TdACrLKJhZ8j/Nz/RS+2x6KXLnyYU6TBv6ZuxLIza3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8snk0xHHvkZoK72MC7EJROb5oIyISgc/KrHq9i7DB5mBylZJR
 Jj/XCbt5MmNu9GRmBK+vHZUkzf7iOTm9rNdXnaCZhXcRNHvgZ/r5MpQwduVFBUzZt+Cw+LrEqBZ
 ejHIX1LpKB6kL2IVxeJSH2Jz1dPdL/ffYqM+s5KWBXJzn9/GlCiz0cCZZLHOzOpuPSQs1WcQ=
X-Gm-Gg: ASbGncuEbXDzveSMrTux5VjnJ0eSYkqpQvMJP6/9+XkSvFRywHctzj85HXdOqxqMnwk
 xaqNwzGo++RN/X0764F5NoTaXXuUIR2Jr35f3yemBnPZSJqa4ZfD9fc4blPloDv0HhxkHqtHHkJ
 5dVje6f8SIkQf2AK5XIWPBG8s8H3zlyokQNbaubJBVxPnhby71nq4V9a+infA5FlsXjOcEeK1Bq
 MOG76BjctavXQX2qn+LlpoBjaPoVpdUGy3ml6raKuKYL/WQWxIDyi3WHbnQdwy+fd7+tBBvaMGf
 YOd5hQZDZJVKNsCBtM2Qrm/jGgq0twMr3gfD5CWmC2DE1VanB178Wuz5/XQ2nahjOx3xSDU4q67
 k6ggf2UQgo4G27oBdRrTRTUsAbSBWrG61UisN6XBeKDInQLbXLYDZZFXL
X-Received: by 2002:a05:6a20:3d88:b0:247:55a7:695f with SMTP id
 adf61e73a8af0-2534547a5d2mr15322000637.6.1757602620785; 
 Thu, 11 Sep 2025 07:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA+T6bihioSO0fuY5YfCxHZc3M0pBOMOH657Ze5hznhiS0Qw6xXefqkICG6PW275tVlLquow==
X-Received: by 2002:a05:6a20:3d88:b0:247:55a7:695f with SMTP id
 adf61e73a8af0-2534547a5d2mr15321976637.6.1757602620256; 
 Thu, 11 Sep 2025 07:57:00 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:56:59 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:55:10 +0800
Subject: [PATCH v4 13/13] drm/msm/dp: Add support for lane mapping
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-13-2702bdda14ed@oss.qualcomm.com>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602528; l=3440;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=ydjAKX71QvKWvvFLsD1Bwlw16HeAPipo1gwgyRawXAA=;
 b=URK3ZuXt8hjr965TBLqTHuckNd4RoPiuWF52jnx2F/+KEB7ZTvapur4qpeUyfJbHmlYbZS0xK
 D3ebmdp3LzLAeFch1oItDUO95apaxHczikuX+uQP2i/doSYgA6mFisz
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXydxaLArGdaIF
 adwwUSV9duWIpuU33sxMkdW/odK+Ljg7LBKgAUE03N/EFfM38/1isAxTB+FApsf0Q/Z4yLvxOMy
 aTu1Iyvys53eHaOcWCKwFxYyWVyJfQ6SdmgVey/4iDknOk6bywU2BkXE2MYscFDqMOmo0xzdXkL
 R6cjkP6MKQvaW2j+nTanQR57ba7/5bqjNnb8QHzOrS9aayqXSVhBND0HeCVgANcN1euHEZN56Kb
 AjBHWS5Q0SClkDY2z4yA8JC6K/2sfVCAoUQGadAqdeUjlKdeKJOJHS+KZM+WtwtFXtW4uOvUOf8
 tSq6o8IcHFfmMKysIurHMHXSUZCut6Wd5FIaQrRwSqL703K2OstliysMU4UUQMUwkxx14oBn2pk
 v/M1uibs
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2e33d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=knvC0gF5dBKrktezL5UA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: xrFdBqLfs9aoZUI1wXP_UnnpLStkoGo6
X-Proofpoint-ORIG-GUID: xrFdBqLfs9aoZUI1wXP_UnnpLStkoGo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++++-----
 drivers/gpu/drm/msm/dp/dp_link.c | 12 ++++++++++--
 drivers/gpu/drm/msm/dp/dp_link.h |  1 +
 3 files changed, 16 insertions(+), 7 deletions(-)

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
index caca947122c60abb2a01e295f3e254cf02e34502..7c7a4aa584eb42a0ca7c6ec45de585cde8639cb4 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1242,6 +1242,7 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
 	struct msm_dp_link_private *link;
 	struct device_node *of_node;
 	int cnt;
+	u32 lane_map[DP_MAX_NUM_DP_LANES] = {0};
 
 	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
 	of_node = link->dev->of_node;
@@ -1255,10 +1256,17 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
 		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
 	}
 
-	if (cnt > 0)
+	if (cnt > 0) {
+		struct device_node *endpoint;
+
 		msm_dp_link->max_dp_lanes = cnt;
-	else
+		endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
+		of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
+	} else {
 		msm_dp_link->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
+	}
+
+	memcpy(msm_dp_link->lane_map, lane_map, msm_dp_link->max_dp_lanes * sizeof(u32));
 
 	msm_dp_link->max_dp_link_rate = msm_dp_link_link_frequencies(of_node);
 	if (!msm_dp_link->max_dp_link_rate)
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

