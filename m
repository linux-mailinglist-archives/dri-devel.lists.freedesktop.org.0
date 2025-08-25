Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95625B34301
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13BB10E4B4;
	Mon, 25 Aug 2025 14:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFtimOF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5CF10E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8S7C0004306
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PAyYDRJsaYxENoD1H+Eu1JmDIGkAgeAFYSQHnGRM3UY=; b=AFtimOF3rqirlD3m
 InM/Vy4yl3Eo9+uQN8Li8wURib3geERHcfgPP9k/Ls96x8/uYjHukzkeXBcGa06o
 fiKwTAgPuc6g/ccwJkG7pq3piwfZXHhtNeR7ZaZ6mPldp+7v563nvmDuPbghtj1V
 aV83HXzUhLXXRFlAACoR/ZxNZe+SQu1YLeJrPPNvUSAjCF3ANn3ln+ByyUgEZx/k
 +p9K5l7QkCcp75XoiTdxgphafjHBDBbBssk9CspRj8q1UZr5iL9lKduy1vQ+LpGV
 i6U+Vc3oiORgXSJ4U9+NjKNO2HLpjji+7iZ8htQIpgwCOZD+DR0TMOY7EdmcHZHF
 piJM6Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdw83w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b49c4e7ba85so1364984a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131450; x=1756736250;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PAyYDRJsaYxENoD1H+Eu1JmDIGkAgeAFYSQHnGRM3UY=;
 b=C9lv06WmLhPuz7gfnMvNeOm09cfnMLnPSK8J0BVEY4CtKWIaTZ+fUPwPputLrYYu6i
 UWcWcP2C2BQLFhwldfh6DT6wt0Q80faeiF9e0J9/6Ya+fQcCF61CcnTDggcTPD3Bulxj
 0SSLylf1shrtRi9GoadKLZuCT3VChcw5+BoeISVG5NcRdJrbt76LwiXvyihb/m3K9qz2
 evPedr9SCeMlUYD4MP3eeG/XLTLQw0OSbzWW7lY3UoAty8dcVrbtVd6YvJMqDiO90erw
 gJA7Labgmu5ATrfJ4mNqBJdUsPcrXnYazQxtsvxQAChPZ3Yp1cO4o/uNnDXgikyBUua8
 TlDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjYm+AHKzyTb5rasJBDakCjm51dQa9h8Ejy95ut5Xot83nna9Qr5XwRE6skhGqfDRyImEZLfh8uys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1ghiAMmQ+TMBcpd9CBjU7EdXu3tRH+7gJ5OP/SBs6F2bpxCgO
 kLTFkTfmJ7f5IMknPx9VP7DZBCCK9BVHJWReCfbcDg82fb2S/bYWhsxccyCW6aVtU7LooLGviUo
 ODTEc9v1fvKtdQWYrGMWZawQV/6h3uKbX48e6Arf3o1kQyAAiztPySzYouQP5Ikh8F1UBzrYsWP
 TTWus=
X-Gm-Gg: ASbGnctWwmpZTXoX3yrzolrLR/qRcTuXvEWG14EIdS5uSzrC7SOf9RFQvPhabGAN2W9
 vXtO06KLl9j6jVsDTCl2/7pg+wrFsi9i4EkM2TYY2oNg4+yb0FSG3vuSz96i8BvMH2eg9eyYklm
 R0OSVdMHgVyTafv8NDL2D80X93d4gL+Mo6w5Xlv2HfniSKreLOhs8k5dxx+lkIt5Out8LPkWCUw
 N3V4kP9D9mlZrHgzGTdNNLubq4XS1JswFmhLJ1AkmlW+WPGVo2JqN2C79O/d82p9imHEVJOHrlr
 N9XQZ788Tg/ySDHxJ08Imz6xVqhElklbYZop34LasSnpK5QBJw2O0HLel2hITaslyPDl4LY=
X-Received: by 2002:a05:6a21:328b:b0:240:27c:fcc6 with SMTP id
 adf61e73a8af0-24340d72168mr17478405637.42.1756131450082; 
 Mon, 25 Aug 2025 07:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1nessZyA2NUMM89H1JrLWKePi/2394p08eRkWbRWq2iI3n+M5I1Y5+xYaNlVn6ePDJ2+MlQ==
X-Received: by 2002:a05:6a21:328b:b0:240:27c:fcc6 with SMTP id
 adf61e73a8af0-24340d72168mr17478356637.42.1756131449523; 
 Mon, 25 Aug 2025 07:17:29 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:29 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:51 +0800
Subject: [PATCH v3 05/38] drm/msm/dp: splite msm_dp_ctrl_config_ctrl() into
 link parts and stream parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-5-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=4323;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=xDy9ih89F5xZ4CDJXV+M2TH1QImXV64VcC6JWSBfCEE=;
 b=HW0FUIhch/TGL/hUGl5G89eaxl3x6hc0kAZXKDW69RK9I7wUSBciqoAT8LB2FZMA4r7TMO3ac
 01pCbpqhSTDDtZEvPDPzk85/8vGANoPWg6CEiUr5N+bvhqy54ACMnqy
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: PPXdHsZ2G5aRfR0uBn7gHrustias9pqN
X-Proofpoint-ORIG-GUID: PPXdHsZ2G5aRfR0uBn7gHrustias9pqN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1s7KwTPmN5Rq
 dS+WpCoDPnpqPju6zhbY6JDcutJTrmkGHkh8kQRlp27IcuOnHyznmcv8ubc5f5FqR3pPoppoVhe
 FBh02+UiHUzWYYF18yf2Vj4on+fsM2PSMoI3HdlkM/QugxGrDVwv1ueoDdecRO/5rfM0epy6rQT
 Yb+oGKKTfwL1H4oOnjg0w6ULoU7NoFOoroumYfnpcB2mBqAZyWlwQ02E9J/Zet+wAMH/MLqJ3tu
 VyeHEKgLM9LlFD14rIZniwXTsLEmqaaF4b1cRyX27KX8H9gGlzt4pfBB4uCWwPefAQzm0dxdFaz
 boI9yeZpeymvxYsn6haVehPXpphFNZL2c8JdpOXVhAQpdD84O568tT17H23X0HOi7Z/WHhg/cg1
 K0+oC49N
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ac707b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=A4lVjiY8PA1Kidclo-gA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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

The DP_CONFIGURATION_CTRL register contains both link-level and
stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
all of them together, which makes it harder to support MST.

This patch separates the configuration into two functions:
- msm_dp_ctrl_config_ctrl_link(): handles link-related fields
- msm_dp_ctrl_config_ctrl_streams(): handles stream-specific fields

It also moves the link-related configuration out of
msm_dp_ctrl_configure_source_params().

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 49 +++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e1ff4c6bb4f0eed2e1ff931f12ba891cf81feffb..45d6c9a7f7ddaa049443253cbf4c6fc5feda3177 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -380,26 +380,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
-static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *msm_dp_panel)
 {
 	u32 config = 0, tbd;
+
+	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+
+	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
+		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
+
+	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
+			msm_dp_panel->msm_dp_mode.bpp);
+
+	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
+
+	if (msm_dp_panel->psr_cap.version)
+		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
+
+	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
+
+	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
+}
+
+static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 config = 0;
 	const u8 *dpcd = ctrl->panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
 
-	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
-		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
-
 	/* Scrambler reset enable */
 	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
 		config |= DP_CONFIGURATION_CTRL_ASSR;
 
-	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
-			ctrl->panel->msm_dp_mode.bpp);
-
-	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
-
 	/* Num of Lanes */
 	config |= ((ctrl->link->link_params.num_lanes - 1)
 			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
@@ -413,10 +428,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
 	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
 
-	if (ctrl->panel->psr_cap.version)
-		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
-
-	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
+	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
 
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
@@ -439,10 +451,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
@@ -1614,7 +1623,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;
@@ -2524,6 +2533,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	 */
 	reinit_completion(&ctrl->video_comp);
 
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+
 	msm_dp_ctrl_configure_source_params(ctrl);
 
 	msm_dp_ctrl_config_msa(ctrl,

-- 
2.34.1

