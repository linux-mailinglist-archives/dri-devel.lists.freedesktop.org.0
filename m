Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB7BB49A2F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456110E5C4;
	Mon,  8 Sep 2025 19:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgqyV29G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DB810E5C5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:40:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588DGdnY004820
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 19:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=; b=lgqyV29GjHtaOz98
 j31pX7LQOhqqQdK99hk8E+D3dUQ17/bU4U7DBBkykSmXIw0G717diPeebyFLTNUJ
 2Ees1UDXmGjwxpOJtGAWiznZmo0tel3Q7IJtSm8sGVi8eIfVet+rCH4o0bIgMlTo
 QqJaRYlL9vXSAdpRRCUIC1a/HE2e6QOze40i+lLfuxpMf3haMnRxKf2iPLf+fo5A
 kCy+DaMGf1HG+U+ZbGm3XAgcqxsflSH3XzRX5+yrpgw8gQjBvwgvdAInzq88wsp+
 4D17U+CPc6f4K0FGktx3sdGIveuEvn+KrRFSz5cD4RInW1udeKZdWbmyKRbeDaip
 uQbwXA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37t8nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 19:40:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-329d88c126cso4657409a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 12:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757360440; x=1757965240;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=;
 b=DbI4y6NP0ab3egwNtf6BF0HwLLX0rmQpPhhtmL0w8ZCOFM5Zr47Nknpqlt3QtLEiZS
 rUqBC4TjCP6+NwuzKQYbJwsYncN0baTc4LR2oq77MBSvoh+KJbSxu6VM/IEogEELru9h
 AjSay58ICWhCqfY6Ndxa1yCnhtAij8h1s6wZI+vqXTlzgMhkeWpYHLE30N2Hy61w33ga
 IPAlQi/Fe2d14O45jKOW4H8ZCoGma7QXoK+noqqrI2LaYTT3x+OYQ3seHItVevQpc+I/
 fjLzlOGOHRSIf4Yl0MoQWZ8jJA722hGWpGSzD9R1WoFM0caGF2r3jCVPvZN5990Ydp2x
 Sn9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv4apdo4lboXwRgwFarmUw22R5BevGWDzPKZPVosmW0wq6OaYF8qTmDBhxXQeD8Ebkj6Skzmn50ms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDAA3CGh0Fw+jt64cbKvIq8eMDH0/CfQnXwvGDOjQBnL2nuz3S
 iIwOIuweSUCXqN2KCKY1cQM2D4UMmN+KxB4YUTXHwemcjpC5609tzC3N+aN5H8s/5nKRgT4Q6vx
 iNZ2/UInpZuC2zxb9lpQOimu2BEXF62F1e3VyqaWcg44GG5h9X1WHAGBuhyKcK967LtLCTAI=
X-Gm-Gg: ASbGncs7PB/sgi/BTQdn6M4LOXLT5RAWMEB75z56eNbmc3e9KRsKEtNk4bKNl6/sjVY
 U3uwF2CaWZsTuy7rBMmbx5idD7jZM6vDbcdoLkgagf57BSzU7wGn1X1oRfEHNSNHcL1qciMYZz2
 27hb3qx9LJ07GNcEVJ29nmcP0oNqCbYNWF2CUbaoMTmOCXhvuiMPxslf8KLh/AvHtjo27OJ5pz0
 kHeMYGdmOQU0vSlsW6aKNdYD7r55E6dvV1erMbn2Aa3HLSmOY2o0YRDA0HKobhb56rrPM9CIe45
 FLNNgg6DHJM+hYoUN4JPbcmdsuZOEqsAx1Rujxr3OqYUEBbFInMxdeYN3YXAFxAh
X-Received: by 2002:a17:903:2ac5:b0:24e:3cf2:2450 with SMTP id
 d9443c01a7336-2516c895cc2mr111481445ad.2.1757360439744; 
 Mon, 08 Sep 2025 12:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7MS/PGj46/9DijhTLrv8zPpQ7yn0ZAGwHCLanL16Jyq5ouQQYBZXugxHzfIk1x6pg9d969w==
X-Received: by 2002:a17:903:2ac5:b0:24e:3cf2:2450 with SMTP id
 d9443c01a7336-2516c895cc2mr111481185ad.2.1757360439166; 
 Mon, 08 Sep 2025 12:40:39 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:40:38 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:40 +0530
Subject: [PATCH v5 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-a663-gpu-support-v5-5-761fa0a876bf@oss.qualcomm.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=802;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lvtizlHL6MS7eo9olZSEO8tIpxGFiSCKBoj2b3IlTA0=;
 b=z27gs7lVGN1/JHmpToK7GI94Hpg3Rn7lWyfFRiOlLXXusxcWd+QIBI1E1Jw96DmemJ6yUs8id
 ewGQDr/ctEYBnUuG7WfVeLnHEXtf5X+Ajb+uW1zDO4nwuX68ThPjkkS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: x9ouzQ925VHfiGZjWxZU5Q0eMfVd9wZO
X-Proofpoint-GUID: x9ouzQ925VHfiGZjWxZU5Q0eMfVd9wZO
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68bf3138 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX5ofFWHCRVxgu
 xp5yp38KdKjORS5qM/u2YzgbKJ2h+qne4RrtA4Wrbr1V1NMF4P5yjyTRoVs6q1eSNocxUtCErXn
 VO6JnDcmKRk7rfcYxz8xeXFtmbDH/twHdW00WNg7X0BOtxzzTM33KF97Pn7C3+AsUkCEwjnSofk
 V7PFqdLW3zYBjSjoF0BTiF7GyRCN8soK3YKpURegsX9aJssqyKeLVctqEXleIA4ljam4nGwaOEe
 6EAMk6v8Sfu0BZ0V3Z7ronxyDSggCaA0bD9WeSkLsEmpZ/nJ5JcNPFLLJ1T25GoXSLzlmwhgQ1d
 duqU2yXzfWHjt72GuvpugLiDb/pbHyT3lLg+urS3iOvXPOL2NI/LpqeS0fFqxIJZSjwiqSAF7gj
 baTBwQH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

Enable GPU for lemans-evk platform and provide path for zap
shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 669ac52f4cf6aece72141416068268531fd9f79a..876f43d761870b968e43ea1ecc360b4403f19fef 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -253,6 +253,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };

-- 
2.50.1

