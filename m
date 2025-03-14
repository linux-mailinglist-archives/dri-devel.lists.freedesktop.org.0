Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14489A608C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 07:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB3410E95B;
	Fri, 14 Mar 2025 06:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NT7ioOSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D4910E95B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E2eiAJ008320
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e+7zJBm63Lgp886dxKyB6dmrzG0t1u6zSCJPTB4/5Dw=; b=NT7ioOSENl9x1pN7
 GhD++rPfqHwgsbxWFRK6na/hnKSFrZoR7zIMzrdiZZaoSp1TPomAWQUUdUuKuFjp
 XRs7Awzg+4uSaGrvGSDGEw9L/Q5da4NanONrk5mY2GzYpkRn7scwKl8AtIJz54oW
 gMn6i3mOfi7LINJKrX13PlGwilXpi55xL/FU4j5+m7sIXePcvDsM2PT6J+ZgPuGB
 gVIXZE7U+Z3fTl5+nPMXZDqXUnfgoyQz15rHAKHV41Mvf6HVaN4mCga+bHlb/b7l
 rKKxU8Kt5xUHwxuhat9cCXYMkJONx3efdX6WPyMdzqacw4zh0IhcNHRtnrSJUpE0
 220jfg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg8bwum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e913e1cf4aso48017136d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 23:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932559; x=1742537359;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+7zJBm63Lgp886dxKyB6dmrzG0t1u6zSCJPTB4/5Dw=;
 b=Sa/JfqT/m64Tpc40gCx3Oo24pHqLjb91oECdwkPlx73xAJXN/rMnz+u6edITBxiqEb
 SIju6H38xwjpvxS9sv+oAoNHfu1jOVsJDcDui/XZIOfowLiOrmeH5k1Q59WNS/cc+6Ak
 9rU4CGk03t9yVJY9bXeYIsIlHpRjPT2+M6rDgf3/rzmEdVaMeoD9xG37o2O87jkmq/6S
 1orIcuwRlmJePl1HFKMQXgrRS0nDGKZO1MjxpaNt7gUWm08ot0SbwET+bXlhzChzSWOi
 A1KNcZGbFk+i336mRMcfqrKoqdGa8jxYaqvtkTjpLgeXT5oKr9cZetmDmsTCFX0LFsj+
 7S0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRl6bsZr2CyU4W9nahTjAMhwnJfoGINl4bIuwt/rMTzVn1kbroQU6uKfnO1UK/fyfjQ5xSqfJb8rI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9sIoXW6ed2kPbjRtLNpJdARQbGrppHf0sci//c5y+G3RaTqcQ
 yQcD++ND7x16/UpPCzywGmFIrRuhNt18d6FGoLEXG4xjbNXfPzgN0/NkEX1tZKlYw/ZPRtofVUW
 Mk69nRvx5g5EneMzKii3s5R5zoPM2UjUnCAxksn66+5/dCNY1tIR1C7iObZJBUdjv/0c=
X-Gm-Gg: ASbGnctyS0AQSv1FU4d1ygoKDlsNOF2b4c/WJhw8lmMEBMD9BbIpBhcYcvN5+ccdW44
 c3e1RlEdYPaMK2LJDbniHCE8HxN8NXjcakUEmVbG26dUXp7uLGupINeidyKUcMeruEsj14TESk1
 x1B12wkSPAk10UbKQ1h2Zi1ExfrLWv8h/xVa8eA5G+wYOQdKU5cSrmlVlkVqWH4pxFKgtDlTuh5
 o6/TeljF1TvVUtZE4xl0bFLI0MSgEqRUFxsETlqcdC5sDxrCYbg8pWVPsT8NMSUHvf0I8tmv6gA
 G5aypK3P4RRdMIqoMwsTnIMCLxjBn7295UCDsONEA3aojoXaU6lGgTd5OzoxrNXp9lWVQbgD15b
 qQp18C3xYA0iRWIEvNBaDpEiO03kE
X-Received: by 2002:a05:6214:29c7:b0:6d8:99cf:d2e3 with SMTP id
 6a1803df08f44-6eaeaa50d3bmr16274676d6.22.1741932559672; 
 Thu, 13 Mar 2025 23:09:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBY0ZI+zd7SGof84c58nMntLqEKYAgej+c8q8loIMsah08MFhtIYr9H5cZxY3U/P0nrdLK9Q==
X-Received: by 2002:a05:6214:29c7:b0:6d8:99cf:d2e3 with SMTP id
 6a1803df08f44-6eaeaa50d3bmr16274296d6.22.1741932559242; 
 Thu, 13 Mar 2025 23:09:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:09:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:05 +0200
Subject: [PATCH v2 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-1-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t96ussCqWyIQAdmFD81iVPY1jwLXVD8SP3JFMa/Qjfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08gGCBp0k6HqW50FaN34vQJ5Qz5yfxDlRMZfR
 Hy6mQkyFMaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PIBgAKCRCLPIo+Aiko
 1ZuHB/9lbdoj5IXC26SOHHWE9rWM1DIEMbSoqxW7R/DA8cOCdd5rlC09Hhibvr+hOS1dKri5lbx
 PqMES4aCbDW38we3ofVviw8goSeq+j3Mw4e49cTDXnwYoJ4paRIATkH54k9jHFTVOzygZcXOV5Y
 8lGeTwgzz3fulM6aVtWAqS3pC1bMN6YTdZXJkd6LdmbW4CF3wO7dAXoBqBLQh0s24ktldAagAX/
 UV0ZWCH1KRIere7TRAUwqkaBA3ytZ7HNj+wiWV3X86TQttRABsBtlPZOxWk6TS9V2vzToHnKIMt
 vu2C0OEpMNedMhMjX6mUv33Ar8bGbJ+Ttp9PI74ToAN9F+XZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d3c810 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=qy0Ph95xh7xgto4wCWoA:9 a=QEXdDO2ut3YA:10
 a=eRSyEd_ZPWdY3HzJaUvg:22
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eRUgAPNmmlWKsBpDPHqjHKL4qTGo2Kyi
X-Proofpoint-ORIG-GUID: eRUgAPNmmlWKsBpDPHqjHKL4qTGo2Kyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=996 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
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

Describe DisplayPort controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..246bbb509bea18bed32e3a442d0926a24498c960 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
+              - qcom,sar2130p-dp
               - qcom,sm6350-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp

-- 
2.39.5

