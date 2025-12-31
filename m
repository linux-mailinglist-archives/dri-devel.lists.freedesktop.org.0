Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DC1CEB961
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAE210E9A4;
	Wed, 31 Dec 2025 08:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpvdTr3q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bH25rsKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A480910E995
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV26t8A3971206
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KCIWG0KUEjnWmPrpuMaL3sNQkAcSUVNdZBgNTm0O2wI=; b=OpvdTr3qUCqh2V8k
 3qliVfYr0sY5XftmFHsNrw0GnjXba/H5YimbsX2AiugnrGnZYdgFWrtoAev/IRNK
 pzi+HwhjQbKb7EXQPuTlTaI/GYzfrU33hvAtEcdHLzthhqf64y2waTcS6QQq20nH
 Oi8O7t/JR8WcOpVX4FSoCA0q509wcIye1GhAFqxnhGicu+xVf381Uva4wPX/Q8WJ
 Z2t5DVwC+4eBjycGodUcaA6KTXlAQOaT0iKIEM73am/48s7x4A37EzaddHohPy34
 NDHrCDaSry1DXSK7KmCZ/2U5Q2v+fyLm1JU4M9Ql8OflMEWiI5gd9oyMlCK8+k95
 xc8AZQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky2adr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7a9fb6fcc78so8616987b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 00:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170793; x=1767775593;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KCIWG0KUEjnWmPrpuMaL3sNQkAcSUVNdZBgNTm0O2wI=;
 b=bH25rsKTU27/QSngHKp4qngxdxlpAz8pKv+v3EIxZz9qimPRY9bVW98d6KQvrUs5fr
 3PkGPzyWz3hMnI9GN4k1jNGOgSpGFFh2Wlqmr+HgY/XCEJoRXk7ZrsfciWnhBttwvMGC
 MQWDtYgCzllw2oE0KBwJIv0Y5zPKlSuu2w0cK8yUPCzNNldxi7cynok4/YJ0/DAn0b9y
 bVM1ZdQbXdJLTI+HlcKYxsVwkhU5uqKVASGNA9LcDol2EqDuA5aAUESNep6RcJg6n6rF
 5lrQNK7nq4c6JDyPS4yEtS3Kma9Hlommy4sK2eyMqo3hJ4Od0iV63McHue9KNEezWaXQ
 3wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170793; x=1767775593;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KCIWG0KUEjnWmPrpuMaL3sNQkAcSUVNdZBgNTm0O2wI=;
 b=aKyu7ICCZzIAO3zlGRy9cPC7UN1lz7Rk8fAsDmB0tbcfXKLKSdGxsglFFcZvKd+l0/
 1lnnm/Cr+uvwP2P+3aC281FjHqodvwPG/NIo+xEmtcJ9z0LHi9zYMpFD+3kFA9uwB65y
 IFxERnztKOA7Cm0/OljfHxR6+lXqP5mPa1PqQ60AJIBtM5jwFjgKO7hOmjH8G1ZLJp2w
 geLtNGfPWIi3LeCv//tqf/CZ2kDpnrWMhZy/FTcE71hV92hnJj81xloVGt7z/x1QPOBo
 uLDqzSbsptEOtmbF1fynPQSnMT+GsTvq2arzmXJ+T9XJg+Skb+7Xy4xHIKNPAigin1Hh
 bhwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFIepYGyjZ4wx6Pk6oZ6nfPYDzcu7SYNcyolVxHoVQ007bjsL7DsW9ucGLC0pMT6CM7qk0E+xaLT8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqQk10sStGn16SxiHXDS9o38qnTSa4AniYLM08ahUaoDFaWQjf
 /nyrFxgDLGCxbunSuiPFL65WlWTdGuMvc2/5FkDnmLUOnqyHXx5jL5USwHQyWaLv8mz3qYjqAil
 uFa8Mby5M+1o6qaW+VGrraD94zt/FDMNszGNPYha5aNWgzWtqSi7uU5XJD+rzvSjMqq3flMU=
X-Gm-Gg: AY/fxX4Bo41nTZFPdEshB+wB9mVNzljzxRN9+eRfQxxaQKpBhlDxMnR8mJdBqcuOdqL
 WYmBPTLMV8/EN66BNXAkD4UAJqnYubAE6hf10pwwbRjFXmcKgK+OI2FHnZIBloygBsWsFm6i2WG
 USWowgxFN+S93fL8B+fCzOttx9jQE95taxJNuukogrVYtSArovGWJ3gMa4HC8e8PfYteqnZGQKj
 wNYmvgG5HA63M7F+GNLE2AJ5bcnIbXRmGwj+JAdVdgGhC7FdBbGsZvseO0ZgpocMkCvo/R5WYH/
 Ied4rL8oCWOyP9aQLvkSlplQB7R/umzFtIETlLYB0aHwWDro4AsrPRn1tTlBTbyRhp/zD/rU9+o
 uqjRolG9NJ/QyB799VKKChv+HYuYkNkPQaw==
X-Received: by 2002:a05:6a21:6d97:b0:341:84ee:7597 with SMTP id
 adf61e73a8af0-376a96b90b4mr33055709637.47.1767170793006; 
 Wed, 31 Dec 2025 00:46:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMKoZ4CfyxJ8JIdhC4hUb2vHcOoZVD8S+TG7KXsGGWw4yvF8CMwCaZiAcCC+f2CXKE2gP0xg==
X-Received: by 2002:a05:6a21:6d97:b0:341:84ee:7597 with SMTP id
 adf61e73a8af0-376a96b90b4mr33055678637.47.1767170792541; 
 Wed, 31 Dec 2025 00:46:32 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:46:32 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:28 +0530
Subject: [PATCH v6 7/8] arm64: dts: qcom: talos: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-qcs615-spin-2-v6-7-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=1446;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=phfATdzc4XCdePUMQ41nf1i9Bjnn7pmYfcvybrB3at4=;
 b=Iip2N1zjGZ0jTLyDFYONcGwTZ5iMCyBqGJ7+MURetCbbu+cayFOE97CPHzgF1SaSSsr+7R9nc
 FtHmtzyOjdsBmVz+y2m7zEKkKR9FhkQld+mVaSTRLfgDQofF4UTj8J3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfX+Vxmoy+5U+UM
 c5GfS31iRW9TFgpNXNdbJ96nP7fGHBu0hUIVAGj01MJ9YOkycZe1rkxV1HffwSy4sb3V8WGp3EU
 tqLvOpfo+tQJ7V/FBfMYCwGBk+dEXZmdjR75Lju3RY2lRAin2gq5ttXETYhpC/c+YSj0acnOgwg
 9D1aISZYpEK/Vlyp017Peb4z0wlpBqiKqhtlKKL2zEwTKOmWGbCD6Faba+8MnwkKMr2QNkuFdHC
 1emcmhqflOlrR3PQ6ud00mPHhy+X8x24To7V6vpnngDED9LN11E7EDH7mj0paYtO9GMuVyQhbyp
 DrXD0i5rH81N/vm5MmlPUPE97UutVXWEFBQiCpDD55f7vS/bz5QzLt5rS9KFUqeZVESjoWy9viE
 mDQqL3HIeQ4JxqPgbseOuJB9STsRrmeDIYrXJRywaQ0NtT8FckU6g5yjud4nttt4VP/9ZfTJt/c
 K03qJtg8mftSEhzX9wQ==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=6954e2ea cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 5wiYuVYoCSBEYWU7hSPKd0IkPian0HD5
X-Proofpoint-ORIG-GUID: 5wiYuVYoCSBEYWU7hSPKd0IkPian0HD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310074
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

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 6880630e6735..606f5e234e4a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4844,12 +4845,25 @@ gpu-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		q6-hvx-thermal {

-- 
2.51.0

