Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2079C36C6B
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 17:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0171410E2E6;
	Wed,  5 Nov 2025 16:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZjcHx9GB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3b7c13O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E054810E2E6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 16:46:28 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5E8C8x876661
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 16:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=; b=ZjcHx9GBZ5wBJRJb
 JX8EKzvSfTq5vGXRln+sdKdVHTf6ToHZaSCG7chhNxxOXCdA5Grbit2pfIghwIvd
 29unWqabuiJu2QJ5X+ZUEggBb73GbVYwALg8jpQnFg4N0hPmVR6M9arEpCQ2Ta2Y
 VvgwWwbKIAupucglw+VsVenIzYFtdjsva0Bbamq5kMdr09QR/3PcpW9AZL7Yn/A5
 M9FHcgcFprMOjTOrcN5HTb8wlJuJOZtnGmfsLRoSV8ZP6xiE+n7hSbugQUTkf5nZ
 etavAnlI3R54VaWDQLt8OwPRgtZjt/+356Su5HmPUZ848Z9/ald9IJux8C+sc5Fz
 xr3soQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88318h05-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 16:46:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3416dc5754fso86841a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 08:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762361188; x=1762965988;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=;
 b=G3b7c13Oc+Ay+aUNbew3k+HO+XNid5VEQB8Xw++YjZAcm02mjnth4g5HYASOE9X9BA
 GgXyL+pDJkGTvAWYlxyE3Rx5IucykqTCUereZoeahlUY1LF0oqJO+DPPAlsy7nJqy1ql
 eTP4igipj0E9QRVneP+BxcQSSX6qP8H2Ye+TBGaFlP56CKmQ3BN6TWZ5DUVUJF5n2010
 eIibKNnhdEIaXdOsblNz8kPV8T38OZ2f9ozBYKF3TcNhx2E+ORRaUtwkZYfglWm3gFB3
 0P+qh6IH7vq5QIN5HERfhNv6p506bvhn4UPZEUuLSBfF09zFEr07B0EFTR9EuT8A2QnK
 oH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762361188; x=1762965988;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=;
 b=BF/4R/ymo3N7hyaahMRmDODUChtuMoM/tT3MeEZoApUneCIiAsKB5ceassOpw1Ab6j
 xuigKQcWOQgNqNOYnx3RXYVWBSNB1/CpABBOm25xwSbfoGcOzA5AeAf3iZtTD1Jgddvo
 INzt71H21E47C86bS+jSBLBEItOrjm2XA4kh5Etyk19T7EXevfC3/MMxi8TRXF6WgKQQ
 hv/S/w0JLAODUTBMopX2zsdZ4Q+z2J+bhk08zBYrnQBcPxw9rizCEaCP+z5LqxlHo0R5
 KcWIh8EONF0wdm7oDfN/qcxOkqE7b+3fotkfDnWbTRiMirXF66+wkvzRNqmxB7PQWhoC
 g0dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWubaXxtc+YSkmDXYuNvkvG2InvInx/TNiQU+fYxm8Wkd0Q20NI/jjxHh5yVvpR4OTpGKIwwmwRnnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPca3c2WtBeqlqExHg38Koz+twBpTcHXWua2fByj5Km0Yzc8kK
 fNihAyfllrbubmVEIUo5d869KL7f72EqqAy6dHHOakfgKyePS98LipVTVQBaDpwX+z0UCPhkb6U
 bqA9XYkNG1rdZ3CpmnfdtwUhdJxF+KSqFD8+891nW/v+HFVs7Lvjvvfsptd7KBIUXfUzuT4E=
X-Gm-Gg: ASbGncsakyBgQHdrVs0JQ8tnm5+Utv4VaS4C+XwPV8m9eG3WR7lYax5yZgOxOMtiqvY
 OHZJ34fRsw52fQEbmgOTNuXfuzUfTslr1olPxSn5SH8i2gR86uheSXqwb8KcUtYTl30RGUR5HW3
 qSEUVNTquujirQq9/FOpJiembHjItHS61PkA3Mfsoo3c62Cc3iQ6CS+wUCFcYpxlFAIkP8C/s7l
 uStd2RaCZvz4uVu4V+GhlSvlzLTs6MUel9OcTBhWdDXw9Jr7NlXTeFxDyWI5AIgCkyKWOcGaD8N
 ZWsxz17CHbjkVgiFjXntlXJsr4K5YhxFBXQkCbJ4S9X/UKhxYr76wW1UkE0KnUXX6rO/yxKfYvz
 4pyISUV0kneXgykAEcw1RXBQ=
X-Received: by 2002:a17:90b:2c8b:b0:340:a961:80c5 with SMTP id
 98e67ed59e1d1-341a6defed9mr4743927a91.32.1762361187740; 
 Wed, 05 Nov 2025 08:46:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErV45t9cw5tYMY+0WjKP4hEQIrl8N8Y/Nqn4TdUVyHIcGvNfAcA385wy9iWWtGX4qk0KmIEg==
X-Received: by 2002:a17:90b:2c8b:b0:340:a961:80c5 with SMTP id
 98e67ed59e1d1-341a6defed9mr4743892a91.32.1762361187240; 
 Wed, 05 Nov 2025 08:46:27 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 08:46:26 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:15:47 +0530
Subject: [PATCH v7 3/5] arm64: dts: qcom: lemans: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251105-a663-gpu-support-v7-3-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=3334;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dv8fOd2JCzTjOzv1PtyfPnTYZUgbOREKQ5dEyRmj6Ig=;
 b=2yRxXU1F198LEM8Gl5ffmxyregbyf9QySegDIWZqoS0+y3z8TQLulwYf5Ifre5T/VshOrtyNb
 oxTdks4MnMMA9Rv/1sXm+QTy0UikCaaiFfwJD+gjjp8Q1pFFWZfkUbj
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: nSEsA3groDDjZKo6t5TmMYiBtPjSQvZL
X-Proofpoint-GUID: nSEsA3groDDjZKo6t5TmMYiBtPjSQvZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyOSBTYWx0ZWRfX9nvcV0sE3iQo
 zkB/MDXOeyOBGQna03S2hi6cFK7oatVpGmJ2gYfeDgLWO+WipIA5Ipih4j4RDBQvkz27RaeCXRO
 Kc3KIkNmXsYdpWO9tbXdi6+yx34F+ne+jSYzLNCdXUq132pV9PLEIXUHH6+dfVskqQpPiH59qXo
 xHSQ0igVRb9aEzRmKLhsGNhriCFLjqCkRzHCXLOEkIcklB1ZXE48FHm0CBR1iF2BaTplpCsiMPs
 PsxxM3HMOS3vr0gI8zOkU/q707QWPYitY6uyf2LfRvcaWR/2qN6oe1BNY+U9CMGI54O8VyNrJtI
 oUKFQ9sip8yDaN9j1+8BbtQUfenHU8qIGhe48481JOWMTOvC5kqXiult9POeAvPxHd2pKlPJHII
 iZ1WCfAoLqFzAn8E6eAM6crjDsxX5g==
X-Authority-Analysis: v=2.4 cv=Mdhhep/f c=1 sm=1 tr=0 ts=690b7f64 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=e3DMr3DmCBmV6l14PKUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050129
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
when reaching 105°C.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 55 ++++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 883f9e0ab45c98b9e128f3fa141d625431d89831..14d9f31e7086dd337c658cdb3989a4fd1c83092b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -7514,8 +7515,15 @@ gpuss-0-thermal {
 
 			thermal-sensors = <&tsens0 5>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7534,8 +7542,15 @@ gpuss-1-thermal {
 
 			thermal-sensors = <&tsens0 6>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7554,8 +7569,15 @@ gpuss-2-thermal {
 
 			thermal-sensors = <&tsens0 7>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss2_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss2_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7744,8 +7766,15 @@ gpuss-3-thermal {
 
 			thermal-sensors = <&tsens1 5>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss3_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss3_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7764,8 +7793,15 @@ gpuss-4-thermal {
 
 			thermal-sensors = <&tsens1 6>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss4_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss4_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7784,8 +7820,15 @@ gpuss-5-thermal {
 
 			thermal-sensors = <&tsens1 7>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss5_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss5_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";

-- 
2.51.0

