Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA0A90F46
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2748310E9F7;
	Wed, 16 Apr 2025 23:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUFuv9n6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E7710E9F3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMClPM029865
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=; b=CUFuv9n6cu9dJ6RA
 JIEgzi9FgUs3jeH+iS/ZP3QIRRa2bL6rZT1mBLBMivucrzsHDBMYkouke1qaaCwX
 C5LwYCgJc23IMmSCzERCLiCpKKBmhUeOaJ8fHaSKemslHpUVVK4FNr/xPuiLORfF
 fC2EvPotuPLM5xUSbuu5GIthziqknKMWjQXSnzwFgYmieJcj8i8lr6uL8OWvCC3I
 7iwnJso5A3m9rDJfZx6GA7XKM8ArZHfKh6B2UIuzIgibMOLxV+5L/0dLLjExe8GB
 SeMeJKopCs6XqTIsNJYUUBcCL1GGfsntO4jeYwIYQilYAQ/UWno5bgfKqUu0CQ9w
 LOJ8zg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk4x4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e91ee078aaso3620666d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845403; x=1745450203;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=;
 b=fzLISX30+N4NvSBsUdUk2bKys/wBEzZwclGzE9VNPAEVGPJunw3re03Tpygty6fDtz
 4hOVwz3gvEHr34VL+/gN6a024ayoFHk7lFKG8wcQrnpWSbkh3cHgGvM4XvYUhl/fEyAn
 RHPhjMMb9IaSDyg4/BSpnNk/TwH+1+r7Mq8Og4bijsM4zzwItwNHSSdTyhel8yOMDAIa
 58YqFUHS/7oZLks1tQ4zq0NWRuEFw5Jm/+2M2HNLolJes93b3Flurc93xNPzx53vZDMy
 KrC0yat2tNK0O1SVPJayD79Um2ECqtXIxLztkNd1mWsNx7oeUVF+VRnqVGSzRPGFzzV1
 vrgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE7pHdlRzTBrrGphKPKlzFsQNYxAqQop1rOo2c4zzS2fdN+lr11n9p6mCpZjxOtganv3Iv7GiArbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR5uf91pylvQzMO5sSegXR1cVsysrqUauJ09MQ7jyaOoIn4B/R
 mdLyJJIagu8izq43YhnS5DYFyAQK5GMyCD1GuIKzMRt0wPyG5BRBMoPzVCu9ASl4GJc42fY6dPK
 hOWKt+OVaLyIivr+UUfNwV+t5D8XbZQ99UVEaDOtqqwmDXOnwPsC3hPh4dkKV/sTAuqU=
X-Gm-Gg: ASbGncuzvmTDnQp5x7QESgQDXGZW209liZjvAgLJU41HuFFqfekbCJ6nL93MjbeHuzm
 OEvSs1z+mK0MGo0B2fUsS0MjuKo1pgEEC/c937gaxoI5/TxvPJzIpLMN0a+0TR8bKFFyq5xWZxU
 O+jaA6tGzcTfCKG+moITb6o3/9rNzAxHYr5oYc2PUBVUnRNKDcILzlIqzZQxgl6s7N59LrgrRE1
 SFX+YKntu5zKFg0iyTyio7rpP99lRkjOtTt4ucUwwoBFzjKzu7BKyWaJma/pSmPY+Sk9pkj7yZN
 gJrltXss6oSucTKQGbyjHpWWt8Zrctu234liAgMWKhaYIkAj8WP/kI5BNcgp3SHRW//WrrpuQyZ
 E59VBbTg+FwHHIWB/lGU1O4/D
X-Received: by 2002:a05:6214:1bc7:b0:6e8:ad15:e0b9 with SMTP id
 6a1803df08f44-6f2b2f93f11mr62673516d6.20.1744845403267; 
 Wed, 16 Apr 2025 16:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrCA/KParNAT/BTiVkOPGzVpXZDtDs1mXEDaoU5nQ2DaTF35AM6o6LLomN2aXrq0eD1fuNmA==
X-Received: by 2002:a05:6214:1bc7:b0:6e8:ad15:e0b9 with SMTP id
 6a1803df08f44-6f2b2f93f11mr62673186d6.20.1744845402926; 
 Wed, 16 Apr 2025 16:16:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:16:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:34 +0300
Subject: [PATCH v4 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-4-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJ0quqH+dI7r+sJavUIADWzzAqD1L2X/CIVzw9kCDtE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpREQ+V7HPJ8Torzzts6HtQRTIhAKzsZTV1i
 6mzzSWqJhSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UQAKCRCLPIo+Aiko
 1TGhB/90c4LcuO7eAM0tlDSCT0Wt9jESwJSN8QH2OFqAKMujsiEdY37WSv8L/DM+BixUIfPBTj2
 31qmCQGMszanECSZ4FTb1zxAEhZOiY4qAoRR+GnrhdBEhRoPY7FkfX4KLOgnZLSG6kpF1YOrjuy
 NbcW7bv4lHopOvGtTXtjf8/DOv8m7UyKkst5z5s74ugy9sAu5yGgPIOeOlYJV1gGwJkaqFSxSQ7
 qYbd5PaLxQ7zdj+Weyf3x6JPiLsqOZlb4AW1WwqrYVxvv6Djqhk43/YxnlWVg1S7ROHu7fhXI1H
 zQy3Zdtn+yHPOtf8wBpnd5uGKVdFL2WD/SnOJz7C7Ttz973T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68003a5c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P0d4iQPpJQof_2lRNe4A:9
 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: h-ydD6H4kacfMcuynpI8dfgGWLOme6IM
X-Proofpoint-ORIG-GUID: h-ydD6H4kacfMcuynpI8dfgGWLOme6IM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=986 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
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

From: Dmitry Baryshkov <lumag@kernel.org>

Describe DPU controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 6902795b4e2c249c2b543c1c5350f739a30553f2..df9ec15ad6c3ca1f77bebaab19ffa3adb985733d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -17,6 +17,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dpu
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu

-- 
2.39.5

