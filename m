Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F9FB9DC96
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952C710E861;
	Thu, 25 Sep 2025 07:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R90RukJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEA210E86A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P01VLM021483
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uVEGKPfTK4CyG256nSXNU/ph37D4/Mz0PD52oseg3XA=; b=R90RukJMurm/8DDt
 fm6xbAFVX6kPDru9vF0EWmggeyKf8uKWImL6+X//ylPxz2CGwEaN2KwqBq6kcCnP
 itmNwiPpd5gn5O+ZylQdVeCwjZe0btqaef8sh1wI6FkAIc3/yvOK652zfVsxK2J5
 K4Y6hIvKbnW5ySp6yh6x8cY4kZelP3DlmBEb+gzD76HkMn05Q0SvX0yOxSx8Z6/F
 6/PC58IC1FfEon6tY1++J7e0t2qwM6cFF56CEooJSXwCjSlkeK5mOnlKzTaTpx8L
 +T4Q/667N7nSWO9Xj+a2HKTZ6Zj/aVPmmadSvjrotlS9HdptkJeVjlGFHWk3nsEq
 GaGOXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budaeps7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-32ed282183bso190890a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 00:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758784010; x=1759388810;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uVEGKPfTK4CyG256nSXNU/ph37D4/Mz0PD52oseg3XA=;
 b=rIkgP0RKIhVJPNvwmChjhTTsMYfG24a2i+1peRdzGykeQ5vdDToeqSBxYKU1WqNr58
 0R3er2v/OF/VW4CnjWzto5W8ArZUV7us/fjG9nDoBtVwmYxcTTmKCd+tNMgcVwO+V4X6
 oSCmF4dj9QuFk+dXdF5VTenMNFiI4DZBnrYWGZPL9IXwdvRrHNWdtbR7uzp8ptVP8fwb
 0FnugOZuof4kYouXcd/bpiRX7qs6vFhwdHYFrsWULYdB6PKEevGxZw0CerYt30tjbSkw
 NGKcTdk6ue7qTnkxq/EOqczQHRuzByRJWpg5liZzYZVZ7bv044hjpJY8jtlqZTqjdkt0
 PKgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG24l5BYiV2hYhacIsvTsLuiM/q0YAtW4C9tBr/9qP7XD2GkF9LAIyKmEbP8jB1n8whKz+KP4QuRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmJL8HX+TSe5VRdNu4Y8PhyqPsQyzlw2BOOLLzd+brdiWK3xbg
 SvITNcZLzNaWjfCzW9asFlhPNdKZIl8O3qCBj1+3iGt8UCDhJYvOaNcXmdTFkjlEiEZoJYRez/t
 82879a8pOUub3gHtLwcFreaSlsC/H/sz5I5f+dHczumwn8g/atQKPNqVxbBuHd53sxaRNx/cEZ2
 jQtL0=
X-Gm-Gg: ASbGnctYADszHBnEX8QVfcaA6hzSPLzlDL5w9qlAOi9PVpGh56ocwwYqVab454NjfN5
 dzg/A4pxlKgJR7HDuu6XC75xKzPomke9B9aPTUywR57Wvfy8hYJBlUfCXEBQ8wFbJHDqgojMwgn
 qHkwpwvEI3fYMjiEJUj3/N9Eh7MPaKYCg9ImIYDhFcPCPlSScHD5uuNtpzElOLls568p3liBgUw
 XtzCfcFySAwPRGJw6oZ6Ear2uuLUhMkLTcdoO8xXp70uo6ifTLzKVhYOg8SsMlI07pezXd61g3m
 PNAh9hdhD0qEY1k2fIvYcXEu43Be3Vo0/XVuc2oh0k7VXPo8ubTHQIwlutFLrHh/lnVs7OVm/V6
 kVid1mXlVQPiL25hwjrk8rcTf7FRIe8FRZAR7TbFzrlSMR9pShzP8mb2m
X-Received: by 2002:a17:90b:33c8:b0:330:7e89:7591 with SMTP id
 98e67ed59e1d1-3342a229a36mr1377515a91.1.1758784010462; 
 Thu, 25 Sep 2025 00:06:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbvCpZx8QiOBhJXtEEsCGi1+aNGaSk15wqL67X5vZuZ2CcpDayQxO9SadNeB5ia9c5NKeZkw==
X-Received: by 2002:a17:90b:33c8:b0:330:7e89:7591 with SMTP id
 98e67ed59e1d1-3342a229a36mr1377491a91.1.1758784009964; 
 Thu, 25 Sep 2025 00:06:49 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:06:49 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:59 +0800
Subject: [PATCH v6 13/14] drm/msm/dp: move link-specific parsing from
 dp_panel to dp_link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-13-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783911; l=9158;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=UeZKmgHCN9l/z6woLU+dgaheHV7gZb8x1YpMg80h2Ho=;
 b=EW3/S3KyQaK+1tKvM6XjBWIMve55BhSet6Y5Gft/aUIvuaWmrKLSdH5Kaqk8ptrN08f08CBET
 7yQrM28t9gyC9m77toRBCu6PIbtB/KBSfSvOyTS5J3pWGkTUDYQV7EW
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: dDX4lhFsqlnjFgd1wGHSVQSiArcmogFL
X-Proofpoint-ORIG-GUID: dDX4lhFsqlnjFgd1wGHSVQSiArcmogFL
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4ea0c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yj-bGh8x4a1trPqgwHkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX1CJQuAVDcf+L
 uO6tpCe9vsk8wOW76qqYKi677GKo9IsTtQ+0wixv0A0GibeKGRyRq4hYgKca1rHExiOX5dYSCVJ
 4qHShhnc9Ppd78taMNsAPo33n+cNjyPYG+lkRhcR8xBtm0lZUWRYuhJAWErJcIx94Sv3XQYnnRc
 6aPYbv4x07PeHubWs6l/qVpLGPITf0Ol1wONbMU1M3moEZ/7SEGNW865sgT0k2nZgMqamRF0uc7
 SuWduo7sTE8zvnO8h49wqA9w7BfAHbAEMHKyu+3SMJiJ+iJzex9Cw4cfm6uTrPfY98p+Q/0lS7f
 zH6FbBfuwBjeVlbDrfa2OXvqjWWWrk3F34mdS5+PuuVtLo1micIGeZ8UqXvTUVzYPU6vjQNVwID
 keB8fERz
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

Since max_dp_lanes and max_dp_link_rate are link-specific parameters, move
their parsing from dp_panel to dp_link for better separation of concerns.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_link.c  | 57 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h  |  4 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
 4 files changed, 70 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 66e1bbd80db3a28f5f16d083486752007ceaf3f7..2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -6,12 +6,14 @@
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
 
 #include <drm/drm_device.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
 #include "dp_reg.h"
 #include "dp_link.h"
 #include "dp_panel.h"
 
+#define DP_LINK_RATE_HBR2      540000 /* kbytes */
 #define DP_TEST_REQUEST_MASK		0x7F
 
 enum audio_sample_rate {
@@ -1210,10 +1212,61 @@ u32 msm_dp_link_get_test_bits_depth(struct msm_dp_link *msm_dp_link, u32 bpp)
 	return tbd;
 }
 
+static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
+{
+	struct device_node *endpoint;
+	u64 frequency = 0;
+	int cnt;
+
+	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
+	if (!endpoint)
+		return 0;
+
+	cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
+
+	if (cnt > 0)
+		of_property_read_u64_index(endpoint, "link-frequencies",
+					   cnt - 1, &frequency);
+	of_node_put(endpoint);
+
+	do_div(frequency,
+	       10 * /* from symbol rate to link rate */
+	       1000); /* kbytes */
+
+	return frequency;
+}
+
+static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link *msm_dp_link)
+{
+	struct device_node *of_node = dev->of_node;
+	int cnt;
+
+	/*
+	 * data-lanes is the property of msm_dp_out endpoint
+	 */
+	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
+	if (cnt < 0) {
+		/* legacy code, data-lanes is the property of mdss_dp node */
+		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
+	}
+
+	if (cnt > 0)
+		msm_dp_link->max_dp_lanes = cnt;
+	else
+		msm_dp_link->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
+
+	msm_dp_link->max_dp_link_rate = msm_dp_link_link_frequencies(of_node);
+	if (!msm_dp_link->max_dp_link_rate)
+		msm_dp_link->max_dp_link_rate = DP_LINK_RATE_HBR2;
+
+	return 0;
+}
+
 struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
 {
 	struct msm_dp_link_private *link;
 	struct msm_dp_link *msm_dp_link;
+	int ret;
 
 	if (!dev || !aux) {
 		DRM_ERROR("invalid input\n");
@@ -1229,5 +1282,9 @@ struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
 	mutex_init(&link->psm_mutex);
 	msm_dp_link = &link->msm_dp_link;
 
+	ret = msm_dp_link_parse_dt(dev, msm_dp_link);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return msm_dp_link;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index ba47c6d19fbfacfc58031263e4a2f5a6d9c2c229..0684a962d4ec93f7da764c4af2e2154c7050329c 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -12,6 +12,7 @@
 #define DS_PORT_STATUS_CHANGED 0x200
 #define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
 #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
+#define DP_MAX_NUM_DP_LANES    4
 
 struct msm_dp_link_info {
 	unsigned char revision;
@@ -72,6 +73,9 @@ struct msm_dp_link {
 	struct msm_dp_link_test_audio test_audio;
 	struct msm_dp_link_phy_params phy_params;
 	struct msm_dp_link_info link_params;
+
+	u32 max_dp_lanes;
+	u32 max_dp_link_rate;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 15b7f6c7146e1176a80b5c9d25896b1c8ede3aed..ad5d55bf009dbe60e61ca4f4c108116333129203 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -16,9 +16,6 @@
 
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
 
-#define DP_MAX_NUM_DP_LANES	4
-#define DP_LINK_RATE_HBR2	540000 /* kbytes */
-
 struct msm_dp_panel_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
@@ -91,6 +88,7 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	int rc, max_lttpr_lanes, max_lttpr_rate;
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_link_info *link_info;
+	struct msm_dp_link *link;
 	u8 *dpcd, major, minor;
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
@@ -105,16 +103,20 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
 
+	link = panel->link;
+	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
+		   link->max_dp_lanes, link->max_dp_link_rate);
+
 	link_info->rate = drm_dp_max_link_rate(dpcd);
 	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
 
 	/* Limit data lanes from data-lanes of endpoint property of dtsi */
-	if (link_info->num_lanes > msm_dp_panel->max_dp_lanes)
-		link_info->num_lanes = msm_dp_panel->max_dp_lanes;
+	if (link_info->num_lanes > link->max_dp_lanes)
+		link_info->num_lanes = link->max_dp_lanes;
 
 	/* Limit link rate from link-frequencies of endpoint property of dtsi */
-	if (link_info->rate > msm_dp_panel->max_dp_link_rate)
-		link_info->rate = msm_dp_panel->max_dp_link_rate;
+	if (link_info->rate > link->max_dp_link_rate)
+		link_info->rate = link->max_dp_link_rate;
 
 	/* Limit data lanes from LTTPR capabilities, if any */
 	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(panel->link->lttpr_common_caps);
@@ -173,9 +175,6 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
-	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
-		msm_dp_panel->max_dp_lanes, msm_dp_panel->max_dp_link_rate);
-
 	rc = msm_dp_panel_read_dpcd(msm_dp_panel);
 	if (rc) {
 		DRM_ERROR("read dpcd failed %d\n", rc);
@@ -648,60 +647,6 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
 	return 0;
 }
 
-static u32 msm_dp_panel_link_frequencies(struct device_node *of_node)
-{
-	struct device_node *endpoint;
-	u64 frequency = 0;
-	int cnt;
-
-	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
-	if (!endpoint)
-		return 0;
-
-	cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
-
-	if (cnt > 0)
-		of_property_read_u64_index(endpoint, "link-frequencies",
-						cnt - 1, &frequency);
-	of_node_put(endpoint);
-
-	do_div(frequency,
-		10 * /* from symbol rate to link rate */
-		1000); /* kbytes */
-
-	return frequency;
-}
-
-static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
-{
-	struct msm_dp_panel_private *panel;
-	struct device_node *of_node;
-	int cnt;
-
-	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	of_node = panel->dev->of_node;
-
-	/*
-	 * data-lanes is the property of msm_dp_out endpoint
-	 */
-	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
-	if (cnt < 0) {
-		/* legacy code, data-lanes is the property of mdss_dp node */
-		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
-	}
-
-	if (cnt > 0)
-		msm_dp_panel->max_dp_lanes = cnt;
-	else
-		msm_dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
-
-	msm_dp_panel->max_dp_link_rate = msm_dp_panel_link_frequencies(of_node);
-	if (!msm_dp_panel->max_dp_link_rate)
-		msm_dp_panel->max_dp_link_rate = DP_LINK_RATE_HBR2;
-
-	return 0;
-}
-
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
@@ -709,7 +654,6 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
-	int ret;
 
 	if (!dev || !aux || !link) {
 		DRM_ERROR("invalid input\n");
@@ -729,10 +673,6 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
 
-	ret = msm_dp_panel_parse_dt(msm_dp_panel);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return msm_dp_panel;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index d2cf401506dcbaf553192d5e18c87207337664ab..921a296852d4df65f817665d3e1344f2f7c9ece7 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -41,9 +41,6 @@ struct msm_dp_panel {
 	bool vsc_sdp_supported;
 	u32 hw_revision;
 
-	u32 max_dp_lanes;
-	u32 max_dp_link_rate;
-
 	u32 max_bw_code;
 };
 

-- 
2.34.1

