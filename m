Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116B1B1F395
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 11:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5671F10E32D;
	Sat,  9 Aug 2025 09:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzhuNWjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7D410E2DE
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 09:16:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5798srJe029179
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 09:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +FxyKxPu6uLD/LH8+2R9NG85lQ6NRpZjS9kWhJ7IV+E=; b=LzhuNWjI0mFRp6nd
 +DckgToIdK+KP2LQmlFqfaFngt58koFO6OHy7KXq+7CWyFKnfG7GeGfk2qF+P+9E
 xzOIFvHNHHgsm7YlLkqmdZWDpDF+cd9LQkC7aai8S4C/nmxNN1Zo+5fA3ikPnkcN
 JAB3SmefZPhqhpHf7lYPTUHR72aRrU1u9wHanyUoyfbKOHxph2cRuWRWRqn+90Ig
 A4/AmUUB7IFT2Ti1cPsOxC8wDW+PGm8lywiKqQ7zmYP8T4DzrOxtGvsqkMd0kdmI
 NHHsBZQkcR/vLju4joddIMmPowE8V6aIhmcMGLNb4svKe6Bqg6vLIdYa3ZDj+k4U
 SfYpDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmgked-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 09:16:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e69c14e992so552741585a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 02:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754731001; x=1755335801;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+FxyKxPu6uLD/LH8+2R9NG85lQ6NRpZjS9kWhJ7IV+E=;
 b=K7j/ifX+Tv3rMow3DwZyqX4xLs9ZSmevH+erLUMyBY4fnrzS7IXhste8xqPRUFuUgg
 4jnDuv5BWiYvaNKV+ucZ9n/mSycWKiseNp0ogQovLWcrYWPzmjfm3DP8G5oYmfzg6x20
 AEA4rQu0HX7U8dhUeoai9oZa4ekqmPgQEnvvZ8RjEVxhP7SmAGB8VQxTvGU2xA2J9pKT
 Yvbv6ik1aU9LNFkP1zOdBZKkJgVJEUv3Ir22DcyIg+dKKf9R7zG5gfQ4a2VpBdeNnBfQ
 St+2QRRmcQfJMxTFHs9cUSl0g6f9n3k5zo4C0J69H5PsgscyVuUQlY5qEdPdpWvRuYIx
 g+LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGrbJx3ham+bfVlZ4BvRSv6I+MJ7W+DGBo6UpOq73KONBRV9JejlNLeqkZcasDRxVB9TIgnjIVEyo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2b6CtBIYjt+rF0yoQmOTcSASR8tzG0Un4XH71k0aU3CMnVr1X
 CTXUup33/cxlKWYCgXcN66hucc70PIVJ3NVR6DHg/DJHRzmwzVo1Y11jn6UzmjAbLCGO8iJEslC
 0/Jj8GSvnva6WJYpB2kq8vyefBA32VxBglSQudR0f6TdAKd4hqJ2TPR3SIkPuFwObcgdhinU=
X-Gm-Gg: ASbGnctI/lU0lEuof6EiKTq7qliNcPJkuyvShQ+Wzrud7J1cg+sNo3YQDM08aZ2KZuf
 hCzxN9TKbDATqjz9ywXg8LCrqrgHwmm+xB+wLD6ZdleZ+g2w58825uu67RPCBtcYsdwNgsXu03F
 ibbq2MO9zRvl3nURCO6fSGCe0INKIWekppuDU7Abpo7wzbGV8Z5KEG+zmtRNSXPlgezjPxT2Xmm
 qK4Fi7nwCSSCJsmOm566yK5OtRLxjnvb1XfZFcEk8EiqboYA7nxXRBmy9/DDhWKa/R4/0faXyoy
 HqtCwvuTTi08B2BJ2x8dhGVqfVOzDTJwAiKYNJA0BVdDjN6zYDGnA084CsLAjvZr54/BgKytGwI
 HMve5SXn2tm/ABz7/Y/xBKBBszQNO8Y+ld4tIf+OLZpjY7tAjZLBn
X-Received: by 2002:a05:620a:4843:b0:7e8:1718:daf4 with SMTP id
 af79cd13be357-7e82c65c638mr645355685a.16.1754731000853; 
 Sat, 09 Aug 2025 02:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3aoKlHhDc5N5lAF4V9YqKOwDnqhMvF482KRH1i3Lrac8gTkPWDbsR6tpg2OvLAdPxmPwH5w==
X-Received: by 2002:a05:620a:4843:b0:7e8:1718:daf4 with SMTP id
 af79cd13be357-7e82c65c638mr645352285a.16.1754731000254; 
 Sat, 09 Aug 2025 02:16:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 02:16:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 12:16:20 +0300
Subject: [PATCH v5 6/6] arm64: dts: qcom: Add MST pixel streams for displayport
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v5-6-b185fe574f38@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=27480;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iEfQeWLkrmUY2VUZfep7hVTpc75fXtmK2MVI9LOI55s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHiMEMWBe3XPzZrgawoQY5anEts0/q0WK/4B
 MhW9Ye6yG6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4gAKCRCLPIo+Aiko
 1X89CACvve9AHhEhUjlxflHVf3NqvrytLgOhmmPZK2mKIJcEN4NG3If+FghuIDOW/KJ9fo9Idqo
 2CH13EMCLb+7RQFSU/LJ9OMrso6C0THO+/4MGRJncB/28ZDPKvH+YjKgzKYF4y4t5SuFx6vjnbY
 GUj5PTcNiL1O+kYJHmgzkPk9wAg8GO8qqdJP0y26jQFrpHfu5GJ81nKv8OIlPMwl2o+MzY2LLC1
 pcM6XS7Fho7YGJM2c1FVIM0PKmBjKd8L9IC1NIciGYb7x8lmcr8KiJ+RlMvlgVUXAWuoFMjzS9q
 K5Sn2LYKBsWkJjKr4tYTMgDAWYA+i9P4kEQFkAB8wAMVbd+G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689711fa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=M642VWYP8yQGdStLr8gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2bTB85MRB3_w6bIJV_R85ztEnLVnv_ye
X-Proofpoint-ORIG-GUID: 2bTB85MRB3_w6bIJV_R85ztEnLVnv_ye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX6cn9x3lCPUZw
 5dVC5ArrD+RvtFjRxjdKitv0liPwvvkKgb70h83+8p7I9SQYkm0qoM1AmDYDgcjaMAT/2FXeqPJ
 EPmQlPaq0eLV1Brrhq9KCppJC48cFuR7yvu0JW9SgYAtm/c9v4bgiWsuix842ONwftoYFlJG27c
 lOwf3/Q8wYPoGsKRKy0Ps2LgojLyVexMZvdOz2KQ7ks26/Rw6OqRnWkk6vvN5vKTtS1YJgR/7l4
 YUqFzlNLcgk87ofU9FZDQ/4ZugUoPBc5U4Kbro2C3qG/tpDk/qTd3/hq7eNo13LxGUf6AMiA4uC
 CBRaw3hYj0BP5RpkA221HZ2FWslj9LCNwYcvysgCB8juxKaTUC77gAmmJW/1THl9hGcbArFDFMs
 80NaClUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Update Qualcomm DT files in order to declare extra stream pixel clocks
used on these platforms to support DisplayPort MST.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi  | 34 ++++++++++++----
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 10 +++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  | 20 +++++++---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 72 +++++++++++++++++++++++-----------
 arch/arm64/boot/dts/qcom/sdm845.dtsi   | 15 +++++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 +++++++++-----
 12 files changed, 171 insertions(+), 70 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9997a29901f57d7894dc1eacb6a809caa427c6c4..74d08c5a320aaf685b6337ef481ed45f5453a5d2 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4691,15 +4691,28 @@ mdss0_dp0: displayport-controller@af54000 {
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel",
+					      "stream_2_pixel",
+					      "stream_3_pixel";
 				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp0_phy 0>,
+							 <&mdss0_dp0_phy 1>,
+							 <&mdss0_dp0_phy 1>,
+							 <&mdss0_dp0_phy 1>,
+							 <&mdss0_dp0_phy 1>;
 				phys = <&mdss0_dp0_phy>;
 				phy-names = "dp";
 
@@ -4770,15 +4783,20 @@ mdss0_dp1: displayport-controller@af5c000 {
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>;
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp1_phy 0>,
+							 <&mdss0_dp1_phy 1>,
+							 <&mdss0_dp1_phy 1>;
 				phys = <&mdss0_dp1_phy>;
 				phy-names = "dp";
 
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 38f7869616ff01ece3799ced15c39375d629e364..62bd535d7f14bed10fae329b20ac97cb63f3761b 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -2144,16 +2144,20 @@ mdss_dp0: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f4f1d6a11960c69055d001a34e893e696ae5ce77..48353f70878d57c4e61b33c6f4c147379e4ea4d0 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3239,16 +3239,20 @@ mdss_dp0: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
@@ -3317,16 +3321,20 @@ mdss_dp1: displayport-controller@ae98000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_sec_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 87555a119d947dca75415675807f7965b2f203ac..11ea2fa0b8537165d59469d1c7ccfa3c29496c54 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4338,15 +4338,19 @@ mdss0_dp0: displayport-controller@ae90000 {
 					 <&dispcc0 DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_0_qmpphy QMP_USB43DP_DP_PHY>;
@@ -4417,14 +4421,18 @@ mdss0_dp1: displayport-controller@ae98000 {
 					 <&dispcc0 DISP_CC_MDSS_DPTX1_AUX_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
-					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
+					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					      "ctrl_link_iface", "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
-						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
+						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
@@ -4494,10 +4502,12 @@ mdss0_dp2: displayport-controller@ae9a000 {
 					 <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
-					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
+					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					      "ctrl_link_iface", "stream_pixel",
+					      "stream_1_pixel";
 				interrupt-parent = <&mdss0>;
 				interrupts = <14>;
 				phys = <&mdss0_dp2_phy>;
@@ -4505,8 +4515,11 @@ mdss0_dp2: displayport-controller@ae9a000 {
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
-						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dp2_phy 0>, <&mdss0_dp2_phy 1>;
+						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp2_phy 0>,
+							 <&mdss0_dp2_phy 1>,
+							 <&mdss0_dp2_phy 1>;
 				operating-points-v2 = <&mdss0_dp2_opp_table>;
 
 				#sound-dai-cells = <0>;
@@ -5669,10 +5682,12 @@ mdss1_dp0: displayport-controller@22090000 {
 					 <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					      "ctrl_link_iface", "stream_pixel",
+					      "stream_1_pixel";
 				interrupt-parent = <&mdss1>;
 				interrupts = <12>;
 				phys = <&mdss1_dp0_phy>;
@@ -5680,8 +5695,11 @@ mdss1_dp0: displayport-controller@22090000 {
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>;
+						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp0_phy 0>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>;
 				operating-points-v2 = <&mdss1_dp0_opp_table>;
 
 				#sound-dai-cells = <0>;
@@ -5741,10 +5759,12 @@ mdss1_dp1: displayport-controller@22098000 {
 					 <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
-					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
+					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					      "ctrl_link_iface", "stream_pixel",
+					      "stream_1_pixel";
 				interrupt-parent = <&mdss1>;
 				interrupts = <13>;
 				phys = <&mdss1_dp1_phy>;
@@ -5752,8 +5772,11 @@ mdss1_dp1: displayport-controller@22098000 {
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
-						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>;
+						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp1_phy 0>,
+							 <&mdss1_dp1_phy 1>,
+							 <&mdss1_dp1_phy 1>;
 				operating-points-v2 = <&mdss1_dp1_opp_table>;
 
 				#sound-dai-cells = <0>;
@@ -5813,10 +5836,12 @@ mdss1_dp2: displayport-controller@2209a000 {
 					 <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
-					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
+					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					      "ctrl_link_iface", "stream_pixel",
+					      "stream_1_pixel";
 				interrupt-parent = <&mdss1>;
 				interrupts = <14>;
 				phys = <&mdss1_dp2_phy>;
@@ -5824,8 +5849,11 @@ mdss1_dp2: displayport-controller@2209a000 {
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
-						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss1_dp2_phy 0>, <&mdss1_dp2_phy 1>;
+						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp2_phy 0>,
+							 <&mdss1_dp2_phy 1>,
+							 <&mdss1_dp2_phy 1>;
 				operating-points-v2 = <&mdss1_dp2_opp_table>;
 
 				#sound-dai-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 828b55cb6baf10458feae8f53c04663ef958601e..816987906ca51b8c7eb834d8b850839941eadb6b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4656,12 +4656,19 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
-				clock-names = "core_iface", "core_aux", "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
 				phy-names = "dp";
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index abf12e10d33f1ce5c74e3e9136585bcb0a578492..598d505c8dcf86199f59240e62f6de36e55dfbfd 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3890,16 +3890,20 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index b0197602c677d49f7833f31d71f72436499bfe84..9fbbd7e09aa54cc5f242052745242ce76493a388 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4771,16 +4771,20 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 9a4207ead6156333b8b6030fb0fbc1d215948041..136f40a3b9767133d6a4fe52753530bccced3391 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2876,16 +2876,20 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 33574ad706b915136546c7f92c7cd0b8a0d62b7e..da83ac10f70f666fbb836e79a38a4a73a8f9969c 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3431,16 +3431,20 @@ mdss_dp0: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 45713d46f3c52487d2638b7ab194c111f58679ce..6ceae0e3165ec9033c8f9f1c0106db874530cc7a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3755,16 +3755,20 @@ mdss_dp0: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index e14d3d778b71bbbd0c8fcc851eebc9df9ac09c31..e4dd8cd33aefba143d92cbcf3ccc3fc1d3f3249c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5481,16 +5481,20 @@ mdss_dp0: displayport-controller@af54000 {
 					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				operating-points-v2 = <&dp_opp_table>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 5e9a8fa3cf96468b12775f91192cbd779d5ce946..17a7c217a2f975f0e71b9b5df5781061e66884b3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5312,16 +5312,20 @@ mdss_dp0: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				operating-points-v2 = <&mdss_dp0_opp_table>;
@@ -5395,16 +5399,20 @@ mdss_dp1: displayport-controller@ae98000 {
 					 <&dispcc DISP_CC_MDSS_DPTX1_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				operating-points-v2 = <&mdss_dp1_opp_table>;
@@ -5478,16 +5486,20 @@ mdss_dp2: displayport-controller@ae9a000 {
 					 <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				operating-points-v2 = <&mdss_dp2_opp_table>;

-- 
2.39.5

