Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835CC36F8F
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 18:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA38689E59;
	Wed,  5 Nov 2025 17:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvCFJefH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImvztRwv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F1F89233
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 17:12:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5H6HmE1542513
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 17:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=; b=TvCFJefHSbB5LraM
 7j8yrZefkmefvf7qVaqzagyWMP54pHfGAxCBe4JUbqlvJTK1+kuWtowv0s0gYnvh
 Wpm2j1icNps2RVFLVX4M1tf79/PMnd7bgr9nhzE02+4ItIDcAJg8uw2j8vG+TZ6s
 sttKNU941dMkFLOur6DbgJWYfbGMBbVrGAoUkLDI+A1uHKoGRFom8DLZNgXDG2N7
 5GZAqs15h8cAs4OGQzCTqKzfkn8BLIPvZwo+Kro2ujkBMNkdmfavZhFPBGLBkAyR
 TePXVTNPNzHt0nUIvWAgeYRB0Vne+dokdNatnWB9w/hnWL3JW8kQgo+vvW4pZw48
 8mjVdQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8apgr0ny-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 17:12:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-286a252bfbfso1699755ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 09:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762362719; x=1762967519;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=;
 b=ImvztRwvKsTl5u1WwxP7pNb8Er+Bnwxgq3zZ/nTisVIapSKTu14KWLWrMbPFW7y0iB
 Z1CoTHOMXOhbTaH5SEm4PZNGPP9NjpMzxFEjSGI46tQnzmVX1zr/3tCneBuJGgB0/aJ9
 KcRJ7UwdjaGNE76VPpsNszCih9n25S7XrlJzIoAIxQre2/gpeWl4t+WDt/0jTYJECRuz
 6oi4CMSuAyoIDjG3sG4tVDb0jKROwbwjUh0mRpRF/iMoeUVywOfQRXd0r5ehyaS9YmFK
 wQot1MZQxkncFOocTC97HUd5ph0YCaV5XF4UugoljJBolClWETK4YnzYOlxi05cWZMRw
 pgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762362719; x=1762967519;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=;
 b=S6eii36l0WatoJc6c1EnBG7NDypQLmiNGmOM8fyESuarEcop++voNBxfXxJOui+SJm
 nz1twhdcB9CTT6+ZM+uqOsNz04RrS9HStic+bno8wnAeE0CHuD/tsi5gYuzmScpXbfyM
 Gnoqz9FOm0YiyvC3dB4wtnNPB0nAA7zksFftDk6hPOxaymSoQRPmKhxsEoSttPpqyxLf
 zthJu3MbiiHEsw9s3ZjvCoaaZI3G/1whIriVDUnOAAxnBwtFkvovL/x+ebH3jF8d2o+k
 sK2ofg0TDtu5sQeMjwCDORyl6NBHqvxyFmOsLpKwNK4hOq39/ZmfiF5Ds0SDEcyUKC9d
 CRfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr4rsZf8CtpTal7NcQSoKq38SvCRVGS2IbBWhtwQLUBiZWonWmTt3YqWerorJo96GWnVm5pirwEVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOpVBqO463kkqNDQon+2mUKc3L0ng/wrc2drn+hi8Hi1gm+5DR
 Kp8Rg4u8RfP0xFcxo1rC9ZqYzH8pjCsNXCz6y8LP9/YCSFztBzr7bZZTDnGtKIjwoQ2qVg+32At
 8svlG1CKpL+R+No9OPeFOCTu9TbcDbMoXNCt5/iNnr56jsYmoWfHWGf9Ed47Rq2E7LOgaz4M=
X-Gm-Gg: ASbGncvt4np6IA7VI4eSlp0d53EutJkuzbBnSKxXepV5Zrsd6SXJtBS99Ys2euTXBmc
 QhT9oQVUdA/QzFCqrOoz0FKU+7TqBnYxVbqhbgdnr3N7VjwxofMTtri3UorZWL9PNI7hqYZi+Wb
 A7zahnNpdwtj6V872bcEkUVXVe/ofsvI3z9zjuEsxn3d+EeSfUNrHvKB7zUXjXm7uo8CkJrDaSR
 G3WYFYZnfRBqBC+DpZDaPxs4jAqEUYF+CG1QEWf18FJxEvqEUzj4gXNtQPjI5o1nMjtVFItk/ha
 wFD/w/VQ54YKfoiWiZCWjyBYLBtgOgJS8f2BkzzqS9nDaIYG7DN9PrgW1c3tGDtT+avePvFLue2
 LkjAKRmqGXjdP4zdqRDBRP8Y=
X-Received: by 2002:a17:903:944:b0:295:7f1d:b034 with SMTP id
 d9443c01a7336-2962ad82751mr47925015ad.4.1762362719262; 
 Wed, 05 Nov 2025 09:11:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7vx6gRi3vnn4VoDJjmVj/WM+UJYf70Y+veIY5RUPDoORE/IhuQFEYI/vOAmVMsKNxs0eOpg==
X-Received: by 2002:a17:903:944:b0:295:7f1d:b034 with SMTP id
 d9443c01a7336-2962ad82751mr47924565ad.4.1762362718677; 
 Wed, 05 Nov 2025 09:11:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29650c5e3c5sm813955ad.43.2025.11.05.09.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 09:11:58 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:41:33 +0530
Subject: [PATCH v8 2/4] arm64: dts: qcom: lemans: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251105-a663-gpu-support-v8-2-62a7aaa551e3@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762362697; l=3334;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dv8fOd2JCzTjOzv1PtyfPnTYZUgbOREKQ5dEyRmj6Ig=;
 b=DoDXbN6jLUIZNAoa25vhI/IM9EWA9bQQ16qz3CoxDpGRSpqJRLyXqvCVt8BGN683j6Zo0Ghqo
 c2QpoSz2/+zD04sjTQ/uxjzaSXmnBTES5ddxYfRo/kZzIDgstrsfWot
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNCBTYWx0ZWRfXzJlVaa5BLvYs
 xNC7kusjskQJZtmT1LFmOwdiynj85Gv9HdBrECDfDaZCd834ajDudoIHlnbu0GxlqakjVf37H8A
 AcelSfeqc8WG76sV7+EtwVwCzDbF0LIp0UL1hekYyxMI4Anqr9iFysvTyY/D+rMAj/ic+YusgpE
 bJPwqRcXg1gYkDRI8S6iFTTloLW/vDQNWDurb8TWLx0Sue4xQJctxQDP/RFEFTBpXWoNhFnFGnt
 mFkjGWQ/L7AwarEQSyZuM+zWBRRnHQEi9iuGPCXdpadxhwiduT5K1WbVrO2XvP8ouESc3grxgq5
 D+O2dfaYhez8jrGorFHcHRJwom1cyGSZ+ngF7/DT/jRjRC++8BbJWMF26p+3JJvjXBY6b75RF2N
 dh42YHg8AsSn22POOoqh/B7Ar4vRnQ==
X-Authority-Analysis: v=2.4 cv=LoCfC3dc c=1 sm=1 tr=0 ts=690b8560 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=e3DMr3DmCBmV6l14PKUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BrJZ58sruaRt2bmsInyHlAa5Z7zTnhib
X-Proofpoint-ORIG-GUID: BrJZ58sruaRt2bmsInyHlAa5Z7zTnhib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050134
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

