Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A08CB4163D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9794F10E1F8;
	Wed,  3 Sep 2025 07:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyOczDZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5538F10E1F8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 07:20:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832PXtt010164
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 07:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sNOAegK5RZAaDE+/8oSO0sUGuuiN9cbKJbWju8HXrOA=; b=oyOczDZPCkqMxGh+
 UXnPsciiheK5On/uHeMaIQqtvIipUcOg8L6Sekz2+RAs+yQWeDWyFzNvfvlNGGG7
 zy6RjX+jr4f1bqyoaCa9XWzhN9k7O/QnpV+qnL8B/TMjI5wMRmBH03i9fMJfaEbh
 6ex4n4wEP8AyCGnFvsJM1NV9FaHzeqnFIyBiDjAAs1WnbuvPRBRKn78sJ1NGDYbg
 nVE3XWmNVImh04qBPgbjrzhD6z3gUnlUeFd+OCE9Q7kp89hp46WX9YWPPyjVvsjK
 Ii3cOE5hDl9MymeTesisu2ta28w6c9Ja8RRvbYxMbhgyNXfG8g4nys/uZURuNPTN
 Cm28tw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ejqp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 07:20:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7725b77b795so3098374b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 00:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756884044; x=1757488844;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sNOAegK5RZAaDE+/8oSO0sUGuuiN9cbKJbWju8HXrOA=;
 b=Q4ijx//scsDtky4Xj4fWmp4NJ+eUp9TQv9m6prU/JtyQBb7mUwFTJvnkQrdEz0yv+8
 0UaT1uTK691YAyLD5sfzSFcWahMqL+k9ioeWVstcQzTGMqIi1L9OD+ZPccGbbdkOH61h
 6AusgOf9Mdg4oAEZiOyRpAvKZbnXn1fffueive0t8DMe7tIX3X00cXnvISXNOWTjtO5+
 2Gj88AZ4YiLISrLqdJhzp0Zc4UTIbFe45wQ5NZIVE7bRT+51hjGD5JL2427DW/vwxyGu
 rBUABrzo8nlvv7GR4KlwwItB62jWr3BTX3+eGipP8tpgE6HTXqmHsiNrk4MyN2+9wuzA
 AXPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKsTEhmC9ToewDQaG74BoWINXYqCRAy1Ggs0FoTClwFSETP5cce5O144hIYsWRC3NswIW35kXqtVI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9mgJPDOMFxu/ibYbBlNdjNb5W3RxEzuqkU6L2xMoMd5YlZlyU
 wQT2e7CUPedQiQ62MpKHus8mfdc9EimQEjyR47gFDFw+bGGE4Prj+rbCxXh0su4GLhbMoSWc2zh
 pjxfhDFueWqDA+LwAdfZWcLI7tvYolo1pq4069W/nY1bKGVNdgg2FQMAJndNZA//BV/t2Wps=
X-Gm-Gg: ASbGncvyIDfyvO40JJiJZoTllTRKTSdlosOYu70J3MJvQi+EztpCvrvAEzwzCHG2kTk
 vySVYHWzYCB9c9R6ixbCOA7wLnWI7oOJQFFOhd9zd/7xY6Tllx6/KJHIWAr8y07ZuGmb6IkVtLZ
 uRZy83K9Pk9THUBiBE3TtQ3YtMxS4K81Eu9iXW+UZNF4BNWwH0MHlIz/6gE0y8o4ndvSl6U8tjU
 cqcp1plFzUBgDs5wAx+HfspBSMLpwVJXfRtwPzVWjijawRy7slqadOba3tC4FPTesFLk4ffgX19
 qUmpabDRHKTBzVqn9F6rWIQMvPrecQkjqw8yuUvyI1sAbgmqX3MypEfBqg/3yEun
X-Received: by 2002:a05:6a00:390c:b0:770:fd32:f365 with SMTP id
 d2e1a72fcca58-7723e38a3e1mr17895791b3a.25.1756884043916; 
 Wed, 03 Sep 2025 00:20:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRoQDPRGyxgvIYbUjcgck6/XvM9wRa3NDYhFbn7RxwJ/4HNb57QPKMIkyegrDJbK2DGorniQ==
X-Received: by 2002:a05:6a00:390c:b0:770:fd32:f365 with SMTP id
 d2e1a72fcca58-7723e38a3e1mr17895747b3a.25.1756884043467; 
 Wed, 03 Sep 2025 00:20:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 00:20:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 12:49:56 +0530
Subject: [PATCH v5 5/5] arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-a623-gpu-support-v5-5-5398585e2981@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=881;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0A3WcrkpO6FZwh7gc5vhciObZkq6tlMdmmT7IsLC38U=;
 b=rTUl43YD2qv7+1bHzFpljeux3g04J8jUOBYTxEXptNSUGXRIDHOIu5Pvke32lwwqsxjK05HpP
 ZTLwS2TsLC7DmB40MlfOM2R0Mf43RMtj1u4TbxTldl5q0PyVToGbx+m
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: tTy-0K1Aqp0H8t3IpumtNrTlqaN9SbMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX6doCbgP0c/A1
 w6GAEG4qR6K/7xvjQQE2MxrIns3SiGgHPATL7CIybNqFHL1Puw8yQ141bekRwoBF8c8iPEGInBa
 cOAEqTD7TZvx77xy11sXvvucIR/ERK+6avK86GQ1Qu4BPam8VIk/doVUbco/o8lONMk72kb1MFP
 mlCP4u2nRx1ZcKdV3QFfBTUwxUfboBF0WICYVUBlUKIQyBgdifVShQSqpbkZHqdG1YwicqIQRjn
 vhYQCCBh0iOmuFY3OLRGahrCel0ZvOgfEpCBk8TmXonHWlvFJx0qTkXmF1DUh0zT5g9H/e3dWSk
 T1pyl1q6wh1WCQ+SxaIHZK0u2ISxLSPa1JNgzhjhHVCaIyF80F8OfMiZA/6pfIpTM1g6fmgIaeF
 dBU/PYu/
X-Proofpoint-ORIG-GUID: tTy-0K1Aqp0H8t3IpumtNrTlqaN9SbMP
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b7ec4c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=VSJZfRLmIhO-6U2h3l8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

Enable GPU for qcs8300-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 8c166ead912c589c01d2bc7d13fa1b6892f6252b..c1f4993ee3bff54bba516a3b652e13f730b6353c 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -295,6 +295,14 @@ queue3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs8300/a623_zap.mbn";
+};
+
 &pmm8650au_1_gpios {
 	usb2_en: usb2-en-state {
 		pins = "gpio7";

-- 
2.50.1

