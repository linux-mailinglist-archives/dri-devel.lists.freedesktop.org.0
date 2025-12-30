Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC8FCE9AB2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 13:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7675010E8DA;
	Tue, 30 Dec 2025 12:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/0WLklH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ew60EQNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0886710E8DA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU54Ao93539627
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9i+TijLF64GEMoWt7XWC3BovVWIVdUBTCj/UJkqJaDM=; b=Z/0WLklH9cggt3si
 vrC7rTuGkk/uDe+KtSp/E11Q5zNxWmkZLZGaofhKXaOOCmf0Lqt6vl6oSq4Mh5hJ
 mMqP8H4gIWglpm29+VQwUcKBFWIlaysUbn1lS/+EUo7g0m93K/sFHzCUD39+S3uZ
 i+CL6GtsSeeaexF8iDtykzpe39dv0eMI4Vde5H+O/+OFH+9YG994nnNc6n7gONiY
 GhNp6SN5VValtNM1A2+MGdFC2ccleLrN+w0LygQ4pdVrF/Uq+V3he1hQBMm2eK7Z
 YUd9HGHRjFs3bT9k1lqmioArVPLRaqPBP3rbTtfTatwdh2y3R+KDlhjLZvZtFeU4
 NTv1AQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yh04k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29f1450189eso90350565ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767098057; x=1767702857;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9i+TijLF64GEMoWt7XWC3BovVWIVdUBTCj/UJkqJaDM=;
 b=Ew60EQNyJs/7JatUEFtCsaX/Ky62zqz/h5eXZUeF59FLOToZIt3Im3JTUrYObxn/aZ
 je+2q9zKuVkU4be/UHQDH17/e02WRVnTp4A8Ur2oXDxA1VoRHL+tezxHUgr4wRfCkojE
 atMUUwTlEjEOU9xpX/gVKE5Lnj1A4xWRp8mYXYov5B1OxfkOifDJvWpXLOlHiWd1MWSS
 kmyB/p01vroO7PpZ8poLotfJ43O4dgSyZR88GhORRID79eg0eE1Muyjckpp3AWtrY4Fj
 jVy33W1NAHsO5fX/JE/ooa3ti+gu8RaFubdadR2oObXnoSy1TjGqhwRho4N41rHRBAjQ
 qALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767098057; x=1767702857;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9i+TijLF64GEMoWt7XWC3BovVWIVdUBTCj/UJkqJaDM=;
 b=vv0Txeq+gBP04WOf5hsRSF1fKbmJ7pyyQBEeXRKdJXFiOUcvlDbZ9ENH8FcjV4EUaH
 4HSdvN3vNiMIPZ6muOmQZ/neB0bkildxyckhaOztNKG/yFoglMIJiobM//Q3UsxsG5w/
 zT5iuovqdvEm4VH0as2fE0VtKeJ3OHoTDVwvhHgr/S6QeFzL7yjRrcRL1hOJcLkfl9lF
 dnC4yqaDqHHfANYYpETbqPk9rnA89zseuYZ6NSzXd2uVuiPEGAQbixUetjjpqvT9jF8j
 MPmANIExtcFY3xBChRUAXAGuGDzeIf53CBMEPK0/zCySGBvNf/DiTRl6Hj78wCKqmhFz
 KOLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkiC9UVm+R/smBZi1hkdPg+fGu8AE8PjnHTX5F7FutYj+OJtDYe/z0Kc1pm7jeutO/C9y11QSwVGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRLIxsYnftmyVWB7lC51LhPnMxGS8DIBIQPm5gZyKnJ/pgteZO
 jdBTkWodKu0LNziY0X1FnISGvXwYoP7bJbZlDb5JHFNYkHu1Rqnl4wQEMd5qW4FaTjKLEgFpSme
 Od881VIDFyUp/HR24/Kz8MzbO5/Q6IOgYi53ucbd7rLnmD7c1wAGsfAahAXXppau34mdW4GU=
X-Gm-Gg: AY/fxX5XAE8oWlNM0r4QIhBBHv6qQElMJTV2j7fVOjFHO6Ny41E4BRsSFTkiIC/Z/cZ
 hY/TeZXJMwdwdvmcCLz3fDeHc/RmGBVXj6F3XD52JeydpxjVHaK2rmwOVfCcZXvGoVd6umYpBLV
 FFEbb6nXslalbQ3XfWuoSE4O8Ww96NbsXLRm5DFxGg4/BEHuhTGJ1AHtzW9BaE120ohr4ChyIsJ
 TFmOKLXmFPKj9IoKmd7b6NtXPIFutIEw6vWqMtjcKWk9BCebxRSpG/MxAOBSMaZbtq4Ui6IhDAE
 CsIZmgrPdG2wuUtg23N8DpSFMpG2Ufb28Ea2VMbiAhoc7tM2r9jUCC+h1NmkAJlVSRG46XVvE3i
 WxL06I5Q+zatmxeT3waPLum4BcUAih14V/Q==
X-Received: by 2002:a17:902:e78c:b0:2a0:d0ae:454d with SMTP id
 d9443c01a7336-2a2cab4335fmr319392675ad.22.1767098056807; 
 Tue, 30 Dec 2025 04:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrM2UN+Y82XZkc5nOEFcYcN7ZxH4Wg15L+v1/oOBV4Zj9+VYylBC8tim4oYjHqa5s0NoqK2g==
X-Received: by 2002:a17:902:e78c:b0:2a0:d0ae:454d with SMTP id
 d9443c01a7336-2a2cab4335fmr319392295ad.22.1767098056227; 
 Tue, 30 Dec 2025 04:34:16 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c6a803sm295748695ad.6.2025.12.30.04.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 04:34:15 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:26 +0530
Subject: [PATCH v9 2/4] arm64: dts: qcom: lemans: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-a663-gpu-support-v9-2-186722e25387@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767098036; l=3278;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=R4OHgwavFPBUUNXN7fDYr29JC1Dp27qpcc3H4svA8eM=;
 b=rXIv0lmEqito8LRolKjl5lPh3fvR5MOxO6iWW3xgZegxyqP1j8VZUPAN7yadA3+i7iPVlZ53U
 M+woS+mud/9Cdyqk2jojKbe16jBamxSZyYr0Dpw+BNx4Wt2vgJJay41
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6953c6c9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=e3DMr3DmCBmV6l14PKUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qCMr-CKr-VRtEpRLVBFQsCoOwoD4zTNG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMyBTYWx0ZWRfXy3h5eTrXXZfQ
 7ZvRKAUuZY/f4P6xRBhr7dBzUBg89LleGFxRnPNKZFE9PCiaeA8LREscQRff6yeQ7yfMXvfXYZW
 ydLsbEh7CtoJtL8ZwVLmFwaILXs4mKEHeDrAlfKZBOp1eRyJx01u/oP2fpMs7V/H6QIlkJ6U2NF
 0t8hs+g+z8d95iKUOHho+iQQzdivuDroFKKXlfZCsgYT3C/BEQHpWsKiAbX9fkik2g7YpKL1k0u
 iuwuLlY7iE0HhpJy04uj29xYrJSWUD5ELy/az93V1tXgL3YqOrQLqqpie/QpzphqB6Bh5ybfEEy
 bi+VI19R9yElsM6/2pOElSNZfGh6rjXDiJT6gzMI8UpMDC9R/onOaI/vvO3/ggC8P2S7jaYhxHo
 dcYfkP2pfXkLmce2xOW0YA7J7gfBVV48NunkPK/RBvMKtENg8yIF+NjQlBO7VEtu+sK6XGEP0cB
 bI2b8wJ5umIPqzE41Sg==
X-Proofpoint-GUID: qCMr-CKr-VRtEpRLVBFQsCoOwoD4zTNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300113
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
index 883f9e0ab45c..14d9f31e7086 100644
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

