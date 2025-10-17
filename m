Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D75ABEB01B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 19:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AA110ECAF;
	Fri, 17 Oct 2025 17:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1t8nGVS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F4C10ECB3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HGpvSJ001685
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ugvhCye14d4WMYIug1/zGBbRQsvBfvHQDJkjtw/ffv0=; b=d1t8nGVSWhSBFPCj
 hhBDCnzqB9XG/t0Tt8rd66ySW+9QrkvAkwOWrqxy97X9OVzoBgwZ+EAvHPuVC897
 W34o4aLhzzdJ1hfa7OTndabL+cWSS05hwH8A+QyWPpniKILFcx8bb+iOTPXhAEtq
 sSJpKX8ygIeDtBAXO7IefKZMUJnjEZaYC9q2WA4VpoA2beM1jO8VRhDK3mvLJBQ4
 wXMBUQjoyBQjvt/SwZZ5jVy4qmgM1FbnFLtj0xtgSAFtqNftj3O5e+ay5NQPtCY4
 7/8jAaQtLh8/6vRMo+nfFQuayMIwvUqllnEEJGCoa9w+g655ETtI092E3ziHqZw4
 mBIVAA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9d5kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-269880a7bd9so26700245ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 10:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720975; x=1761325775;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ugvhCye14d4WMYIug1/zGBbRQsvBfvHQDJkjtw/ffv0=;
 b=ZYD2vlG97wNCf03kCOEB9OpC6gM0yU7OaY9aFVbEewfh3SYXffhYGHD42OY9Xb6Nld
 w4pSqbbaEC+Nt3dD/peAREqNw1vuwaVMMmzCU3s2g+2eA5bpgEc905mr3s3FRMt0XLEu
 I89okiDLFJ7KbY/PejRwGsud5znP8GHcspb6PM30OMnUwP5tCzy5H8fQP+wjwj3vxNAm
 EZzFv7pecYYXq2yXuPcFPLcqGVFG0dCfmDqE33B15QflLTpmZKOO3CyZ99R4phDPckAd
 jAQpZMeHixcBE9M108Z30uCtf/d5OwnwB1GfKLg2emGdFmAbAcYdoXqmGD1OMGz2wa+W
 Bgxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKIeMdSRFnkyQKc95n2ayQ3B2//Q5/7EjRzHG4tzjhO2DwU+/aGS0Y8eK/f02du6XYQitgflg4kM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQOcpXIZuAAzapGphxJ9Ic8s3EWr1SBfzAzfuSq4Vbw0dLalyL
 T5KGLkyWzRtvlfUTrtdM2TE6nV4S/B9i91BnA0dKL1zdiDzWBagpUnuvWVFi2zSOCBUNfzB9wgk
 lBQzg4pNlOUCjgByMhWDJ4C7gNkBoLinaBem9Kl62CMSy9pc6By3r5ld7MHnIuo8lmVdXYrE=
X-Gm-Gg: ASbGncvby0Jj9h10V7qhUo885s/6DgOBkBZsH3WpBt1CAwcsFBLeUjV8iNfbIQcvt0P
 ZI71Y0PVSnVEP51OU24KDNY7bVy+fS4U+EAnXmbYFwPORqOucWjQGndqpGghqD6RdY2z51WiKN9
 cMSM7+/Noy/Nf0/YlIxBE+hizQaCX3RL2NBnxgUCrEuucgkRU5jsAdpp5PPoXwUxftdc7pZghgp
 hgH7u74vWsR9nMARutA8S2XVxkT/ZHVmIvmCR47+JHJLejxBB96vMKfRv0AN+UHAHrhcun5sddN
 Xock8O/vULFTsQ3xfCYRZJzbnYbnyhONK+L5X/Tb3EwNnrQV1mxf7GBfZPYgo6qVSXKg0GeAmJP
 j++KAkKNKBCDZRfrumWrVSVc=
X-Received: by 2002:a17:902:dacd:b0:269:936c:88da with SMTP id
 d9443c01a7336-290cc2f852amr62490755ad.41.1760720974562; 
 Fri, 17 Oct 2025 10:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiqLdkEXK76xjF+lHG7GlL+/MevbHd6v5Dd9DkIsG+DvsK4LIGFKBDF7/iLNW/xGjrgYInhw==
X-Received: by 2002:a17:902:dacd:b0:269:936c:88da with SMTP id
 d9443c01a7336-290cc2f852amr62490335ad.41.1760720974024; 
 Fri, 17 Oct 2025 10:09:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:09:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:34 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-6-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=854;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=73CWnG48TkIMX2pCaTLVUDJXxssv+J43riXS1iBwvYI=;
 b=nYbp04cbP4hftA9E7CUSWYP36Iz5Pp9rqyCdQ7L53BtrrLH/j7EeRFlrwfHDDfCq0XnfsB/mH
 vYFmYZ7iBlUABbf1sXw0lQKLtcr/Fd4l/WlSK6g+9Gu/MBh9PdRNytm
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: BT5BGt_-azjP0md_8emEKqGst3phGBIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0Osxdi6C3xYZ
 bC0B+/Mv4z2eVdDX3bIu1pjByVF9bQESemVckOHrHZ9b+0SKpz6v7Er8ClMXnllfNBUUTRPcTPS
 dI7lnAMlBjrNbALOwhjaxgr3HE+EJE9udZEnz5Ro/mDEDSrJgnosv8aawkn7Hx6F7Bjfh0eogxz
 O+Bd7awIjBDyf1Af55c7TCKo7hbS0ULLcSODDyNWz4z11/+Er8NdJ15ysGZtaUMGe3/+hN8CRf7
 HdbN+HIMwMvEk/iwveAD4gJkbFowhGen0abTKJf/KA51gYfNQNuuBkKEe4kc3qgq3kGZ/BBJqeM
 BSjNL7S3dzb68WMypE15F5rwuARQg6dpLURcr5qJcB9QXk+h4MdiyvPOLxP0XZYU0fC88y1Mmj9
 0IzOGj/XuJghAdFnY5yh7fjOIaTJVQ==
X-Proofpoint-GUID: BT5BGt_-azjP0md_8emEKqGst3phGBIb
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f2784f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Zg9b9eOPwfKYWhW-Nc0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 705ea71b07a10aea82b5789e8ab9f757683f678a..a1c87b925bf0052c6876db96a2d6e3c3ab8037c3 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -288,6 +288,14 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;

-- 
2.51.0

