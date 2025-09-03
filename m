Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66390B4163B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D16510E0EE;
	Wed,  3 Sep 2025 07:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1CvYymg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A7F10E3D6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 07:20:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832HQJL019818
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 07:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 783y78yXmBJY5xRlP2M6Gp15FylMnhfNQmsntisnv7g=; b=k1CvYymgnAKcb2Mt
 qjO95wf0KQz6bNKOVJ/pPT6zeeRQ6XWYgfVEHCZ2B7cbyVQL9pmMhusZ1XVDG0JI
 gyO4pYx6rKXwmTSlunTcauykFhNQPOTwNYJQ5OxNJCBSQmz3mKKEPvbDh89HPrh7
 2ZXowxKtmqUfP3EVBTSY+lGOP9jLBuOyyUetOtKYUqvxiIHe8h+LimS6NWA217Rc
 B1C+q0TYkm93BTs++ULYi9B3MLCafMHdFqHFWRWQulPhVWwPWp/M3XK7C7ngleKE
 unsB7WBRWwt4L9sBuepUtWIF+qXnmkxZmZRiSUP+kJ3Y7AtKcpYhETs0Al7fdaZV
 Ac2yjg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw02n2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 07:20:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4f8e079bc1so1845907a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 00:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756884037; x=1757488837;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=783y78yXmBJY5xRlP2M6Gp15FylMnhfNQmsntisnv7g=;
 b=Ov6KI0YsyJ3Ihsp/MXMJFZ8vUckGan2GhwFWC0nLMHCYY+NiDjymZtw0F8I+EUC+oo
 hMDnPjiDBr/aKmvTgSdvGGlOvgXmpqwHeEZKOzEpiL/8BqjubIi4WzN557OCPpvy4wZ+
 Fto/v7U5hjzF6yJ3zDWGb/R3ShnNogjizV076rHB4dZYA4Wgpt+7xwiho5Wxc9Cy+m6C
 W5SrEnzVzvaVIlz4mE7bQb1SS2o2Ij5GGWEdVVcP+Rm1KQGgT+Oj30Gjlu3Au9h2oMHg
 ZDPjtzx77v3aDm9kLDVtJnaL88+M1bo3PPGOV/8cfSsrNl1r0XX1Ptu3Zm48OD6suf57
 O0zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ1oUJkD2TfsYkQgjF0OFkwgRWGvbg1Jth6RiaIlELb0eUxU3NGVvLuJcOKoU8u0bBMT66MEnjnR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm2K0pF98sGKgBGn8Mvl3hmiVMmueNxZW5VcpPjSawRp0gOWpE
 a9Ott10s9b0g+IL+KmlOB2DrD9qOrtUSP21VfsiWECjSxtmVfGqudYbZ+8Xyff9oxIHmxdbbGQC
 45hOq9ovtTEWTyHjwSiEZ0DThyJUbLTRvKTfx/eKqXXurSIDq4PhMLCeOZHODUFJQ68OR/PE=
X-Gm-Gg: ASbGncsBAeDeB21CYk4YhZLuKFXIGLEvNASZcbSuwXuN8mM5ojl2tuStiZoHYTkHSe8
 f0AN69oj8mA5Z4ukqYytmNwszx+/XeMNX4gLVdcJBUCRLNsEIbvRir5Kf5p7hRY5C13QJ38j9g8
 g+egFDFnQBi5BWgMdly8PzPhnTREvx2O1RM1uxWimZ+Qb+ohsnGTCvsqFtbv3iaEosAUlUFxHvN
 djPTAq3wwdjnmWx3FgD/NlYAmiNrKuF8r/fgCiSIv1PCvzDkNVBQp5kAHq+GlHE5nq349HViwWH
 K1ByNMmhTrWBzsDD7bgs96Rc4kP/J8VT1U1WEsXYRXcv2CEOzJ5EDWdzsFSuTiv6
X-Received: by 2002:a05:6a20:918f:b0:246:d43a:3856 with SMTP id
 adf61e73a8af0-246d449839amr2736670637.22.1756884037351; 
 Wed, 03 Sep 2025 00:20:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0ffvTpbw9jwjShL+IZyl85/Z8YDW9Xu3u0FzQcQbXXtMwKarzlqKyNTe2+dQNLNFvdlmQaQ==
X-Received: by 2002:a05:6a20:918f:b0:246:d43a:3856 with SMTP id
 adf61e73a8af0-246d449839amr2736633637.22.1756884036835; 
 Wed, 03 Sep 2025 00:20:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 00:20:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 12:49:55 +0530
Subject: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-a623-gpu-support-v5-4-5398585e2981@oss.qualcomm.com>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
In-Reply-To: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=2002;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UGkqh+jUsBw9mlPVt984D/vluR2NHRDxt6PvxoK841A=;
 b=NDEzUe2YZLbW04zC7rx7sOBjGheYbp3vZkta1FEKZ4HGbqBSid2Hgn6oXufkMZhSIhcl0n6wu
 IcawBTpY5wAANJYwEG1Iqja1oZ25m7RDZbr3a7ucqz1yPUkHx7KBJg0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 1wPpV8sJ_x_OtIhrpAuM4iQIAiQjWuns
X-Proofpoint-ORIG-GUID: 1wPpV8sJ_x_OtIhrpAuM4iQIAiQjWuns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX9D+spOo5DF51
 Oz8ZJmElLE16ThJHdwU4E+hQeT4BxkX2CmNhhpnRDsNcinpn/SSXxy3vd6XAvrBhGhUkqcI1V92
 hYpEWenZDSxKwOxgV3q89Fy2M25F9LfC3aUdSsJCGo5k4tlqWaCkTOT1q5jDbdNlyqQG/PdQV7H
 JTGEqGPfHBBSsXVuxKEXxof//FcHhXV/k9A37geWNldubHZizPdvn7dVO9FrTUU/4DG0bwK3HuM
 Xwsf50poYxdwGlXRPOdSaxBVCOs/7N3fgX5uHhTPphPzKXEjo2tUzZfUjh8XnTJwQaBgkWPl/MM
 i3ds0CFNlXM8K8oa+kbrlmhuGef9mkZAN0IQWjIp2LOBKhak4ye5seMldC9OqAdelF79ZN0FqRh
 mDKxO8Ov
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b7ec46 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=deFBR-s-QiaC76FCe2MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

From: Gaurav Kohli <quic_gkohli@quicinc.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 115°C.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 00e6131e6b24def4ff9566c14398aaa86efe557c..57b8bd6a089ce8b9a1a63be3fa778a633b4025a6 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -5846,12 +5847,25 @@ gpuss-0-thermal {
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
+				gpuss0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss0-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		audio-thermal {
@@ -5966,12 +5980,25 @@ gpuss-1-thermal {
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
+				gpuss1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss1-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		video-thermal {

-- 
2.50.1

