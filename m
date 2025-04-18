Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8839CA933BF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 09:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE9A10EB75;
	Fri, 18 Apr 2025 07:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYKPR/ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0741410E42B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2OVFW011916
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2dtqbcPgqz2zJYzOOCZPN2LLL9rO3nXwWq5S6LuNoqs=; b=iYKPR/exe+ut/Mpr
 eS4JIZIi01DhpzQ3ga6kufc2EGvbOECQ+fEA3ZPnQ8TvRYIuvTIWHp+fDAaJXUb0
 WtwIMw1IEfbrPqym6qZMxtAlH5Z69H7+6g1Z4+6zDHAVBvJRu6GKjAeJg4+whvdw
 xjz39rBVFghOnlrMLH0mgt8szvKijbFOQ5EJp6ME785yIMwNT2tHU+ZlXpKvmt/I
 tavY78yIOPYjRVx2aDvxq+PChZOPOHDK7foWqrsz0X+Mxyx7H3qVbMNtOlL4SvPa
 hyYFGm2do1734sEWFJyWGCbvbcT2g7Yn5L4AyACq2AuTTFduoOo1cHoFj+it7Ngi
 AHap1Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vsg9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e91b1ddb51so29453296d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 00:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744962610; x=1745567410;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2dtqbcPgqz2zJYzOOCZPN2LLL9rO3nXwWq5S6LuNoqs=;
 b=EDOWLyBq+m21rnxo4lOvWmUO6J524RdadPcL1Ms8FV3WF3F4R6AYmHBaIrXu3KvfXu
 O0GYsbSyEgyaqyxK2Z81lQ8HO2CrD3DWv5t0nwx1D9BG1/GMtbMRlcnlJCQMm8Lgq77R
 sQvUhLYBAReQ6J0A5RMhCyY0Yba0hWFKHX2RWz6Ih2QFV46oXWj9Tl2dyxwxaWaDv68C
 TR3pnh+oooqJvO0Ulh4j66NDNKaS9YVrA829ewEJpMTuQzSe6GldIBzIOcjxeOfRDRjP
 ZTOLdR80oPEqgeZY+MUPj2k8krFDXc0fNojlkXEt+d9MsoMaqer97m7ApuA+JtroW5ih
 izEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlofdDf5z+Y3TBgevspdgj08VeZTXcVOLrVM2AGiJKaoz4sjQ7ONFZsDw3abveMHpCVd7T4Hle/As=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQqSh2qkX9f4XeX3lyDIBz1vPN2y2JbwNem0v3s1FK0zMcBgff
 G0dze72OiS+y1G0PQM6lDxt8TNfShiuhqx0GR9F4TiIRhjLQ2WwvMxJjqGdcP5CgIC8E+UP6gKY
 RwTZmZgJc0z48j2ShSpEP/n63Lt+wez+ecjG0ZJjaoZB+7AU+fx3W5DL15OmyTKQe0X8=
X-Gm-Gg: ASbGncuFUFSGlfJAh1aLLFuo4HI7FllbNT3QzYUphVZuBDAje7ki1Q5mJ7bvIqYI3OJ
 Ajdee49EgMsEb003V8gn723LoT20O4m06PIeaKqtnify/2/TR90QgZuykcsbi0D7xq81M04JvzG
 nSj72ErNLc6TUOckoqZcXFJPEmaI5L4ZBX5lWQO2sTnt0sdNZw6AmB7tOktTDe0PHAn9dgqYdK2
 s5sDNwJK03a0Mw4dSK3ywAZuNZ0eHRiYgJB9tI97rqJbRPY/rctzP3tyHtZ14NFU75gyk9AgelT
 ZFgHnEMb/Fn9ICwnKXLpuMZ/bR7S7cNqAsRN/f/0WO53hpg46zhj4QEh0uGbtt3uzhCp50Pn0q4
 T4AKI8P52szsIjDZxqLto63SY
X-Received: by 2002:a05:6214:d0c:b0:6e8:fee2:aae7 with SMTP id
 6a1803df08f44-6f2c46846dfmr28951996d6.39.1744962610264; 
 Fri, 18 Apr 2025 00:50:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOd3cRqGE1P8KpWy78lHx9JINBULPKSL5YprCIzeAWjS2E3hNvF1FIPQQX9/FweoUbxXDxkg==
X-Received: by 2002:a05:6214:d0c:b0:6e8:fee2:aae7 with SMTP id
 6a1803df08f44-6f2c46846dfmr28951586d6.39.1744962609895; 
 Fri, 18 Apr 2025 00:50:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 00:50:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:59 +0300
Subject: [PATCH v5 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-4-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJ0quqH+dI7r+sJavUIADWzzAqD1L2X/CIVzw9kCDtE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQpQLS4T7hY3QMRLBYKCNlxp6QGzMPUhM1mE
 2syy+Wzk+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKQAKCRCLPIo+Aiko
 1VrxCACRtXhz+Ws7y/U5mibKKWs1K47mVF3B6oHwu+dbQIpu9R3+cXU8iKVJt9HMUTGg4siyX1D
 eaGaX+pRmZfZCSTCiiZOAXCYxiBEfPXmNgwVdbuDhbfIx0iBbB+4Qcsk24KJc5G/V0Oo2H9Cbt7
 IjHJXi3lpg5HVGAGap1QasV6tALnitBsO9fdF3ko45GlgCzt2Cr6iLyqiHYOqMD0EOP+kRsL2eU
 9G5ILpyOE34prwSBrY5jXHkCWobnAYOtRcHrDUGoji3osXOGRxmh2EQv+nGN/Anrc5XFbGk3keN
 ZLZw5pdrhmvM69zzdCa2x81QxcPDgCtWuEwLUBFy9bg8N4Hc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: QK5f6GXCxT99zmre3YYUjBpJo0Xg2bMU
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=68020433 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=P0d4iQPpJQof_2lRNe4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QK5f6GXCxT99zmre3YYUjBpJo0Xg2bMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=992 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

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

