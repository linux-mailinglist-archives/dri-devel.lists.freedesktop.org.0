Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03938B433C1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202EF10E990;
	Thu,  4 Sep 2025 07:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+5s0AAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592D210E990
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:23:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5841ON7E029551
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 07:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=; b=Q+5s0AABPsLBVdYQ
 yBfCoRTYSloNTSGx2dRijI0cYn8BYQDfiM7/gl7//OEvc4ghl4YD1dVQS8JF05W5
 ANgUWIgfNnyM/8B0PYYTFwzXnWe9mCZ3FP5VkslfqCxT58adzrJrZ6FkY1ibcWIN
 neQJmowZJbGv5thRum95dzvxh1MKda4ci1VtHir2Y6hDLkup/Oh2aLsyo/sGQJvG
 1A4zgFcQDji2jawR1wT81y+Ge1jHg0bzTLKuideLCNSrUGD1YvzkG4Ol0HIbrAa8
 TdQtzBeAfoNOGcSKuYk6syFaD4x46hcP2iFxv8Fdq5r6ogbv1uo3A7GfF8BHnl1a
 UF3qjQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnperdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 07:23:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7724877cd7cso854754b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 00:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756970628; x=1757575428;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=;
 b=i2nyKX9LLEFmuW/wA2xtbwMkSNB9TYZa9NIqSs6c16JI08XN0PuhnMDBygLqVNc0NT
 kBbBNyduWbBFQuuJYk0jU6wWCoQLx4vYFnK4uBDhnYgjVSRukRS5MKCG5pC+lnw6xxz8
 x+x6gEh1WTL1sPvT30S5oa6BhdHjSfoaI3JhQiN5hScjFmm7YMPNY9mata33eJjntHoE
 yJXtswmQba1rivI1bltLpG7pZQ9p9VtoEk1JkTkHy/E6w54Wuxkbw8MMJwVyiut2SFF0
 jbL/gaqb4N7ElcLctdSbQ0fR6HuRgg2dZCD/1oFq7zcPJHX5/O8OESX4EoP8yzcRtqUy
 Hesw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4xrbUURfLdOkrd36n/PehLk7Gr09qKCx1TZ1anvN4Zs/UjgeKY+wtuGuF0BF3QTQxIprFtmO17z4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaMa91LDmpMcAeJJkCWXWl/c12Wk3b8Dflr92bs2Ae1UCMm1lx
 Elh+1q1/fpppd7EWaSmBYwZcRgfJoOBdZMpfnh94uw5ySCyFDQ7nB8jZ5SG0yUV2/zW+R0uP58V
 P8Y1+3L9nwN5dySvqXh9pjLk7hqeZcjlccFhCqLX/Aju9xao3AMxBI/snQcdkcQkX1mbzzuk=
X-Gm-Gg: ASbGncssLYTKd1ARa7tmG6djgl1wB/pWRIfOeBZYoigeLI6eQNCMogZ/DPucmv0waSJ
 AxmIoKYY2zKSjTKcVAPfa0cqD4kpjWaNqHOLgeWTuu+mocSHBJVegrsvOhrAaW5FhosdGZMR6je
 WM5xXmGE6jhr2Wg5lsPBNcK6nTL5CfOorkAHakijWCdHt8HxYOuELcr/y19kylvZteXLeVa2CKU
 Wy0WRpINzaGkDJIfD+4nYbQ8RcjkEWGAMFuFQCDo1uEPkqLy+T37rkZLMni92ydeLLNN/egOLta
 YH7zvo6ZG8PK89zs7VVqhuBBW1wUZw6Oypy1oSyz6/BukGGm6XTwy4zmE64A6dsa8EpzAzo=
X-Received: by 2002:a05:6a00:7450:b0:772:f60:75b0 with SMTP id
 d2e1a72fcca58-7723e3b1c5fmr21478358b3a.24.1756970628140; 
 Thu, 04 Sep 2025 00:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOSmxB9zN4NxPoJkLTcpBFf0RO7oPiV/YSxMz4H00lZgVQ0z67xbJrlIxbtRFrShD+RZf8dw==
X-Received: by 2002:a05:6a00:7450:b0:772:f60:75b0 with SMTP id
 d2e1a72fcca58-7723e3b1c5fmr21478332b3a.24.1756970627705; 
 Thu, 04 Sep 2025 00:23:47 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77243ffcebasm14656452b3a.51.2025.09.04.00.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 00:23:47 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 15:22:36 +0800
Subject: [PATCH v11 1/6] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-qcs8300_mdss-v11-1-bc8761964d76@oss.qualcomm.com>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
In-Reply-To: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756970610; l=1298;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=gB7HmGiD8GjEmuy7612J5648tP6/6MkBhyVIM4ydbsE=;
 b=gE0tbp59NwJVvTLAcNX2z9/BDrDyVvGpk3+A5/wtShwkT7Rbo8BvTh8rqL+gw+DngvaZ3T32b
 BaddeC9p5G/A67nsj6U5kK360spcmD2o/VAjIQc4qpJK1WZaSkQMItU
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: LGC9lRGPk1KnQXKlg3gHvBI2wfK28Qnz
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b93e85 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=5ixSZjX4nqodb9qzXsEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LGC9lRGPk1KnQXKlg3gHvBI2wfK28Qnz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX6d3KSYVwJYnL
 Zu8NODnSaUZ4JEOecPY5rQoqhkgwFHSCbiJkC4bqfGThme2Baoe18Wt8eVUJH0f1mij1kMdUSyj
 qEzimCSxZXILDi5ZtAU2lsEHoawsDhbHQMM4ZlC57H9LN9A/GCuIXgc04N4I1S9RujKH/8Xtpe5
 IaWT3KBoHkcBvlLpLqRbaF4kL3wDZlomz7fsbHk7S5kmZOEqw2rlnJWskQ8+MYH5hB5uBeSnCCn
 vz1G8B1aNvMJguFcjUkRja3ahY6Q8nSHhQjvTqL+O3UXmH49ach+b9K83gjJy9broSD2DMLThkU
 2WpYMDBVufmziFMX5rVdeOJi2ujGS6oUo2lemEngpzFQKC74/eeh8AvPJuUZsuhkMCZTrX5GDO4
 NCm0Bnvc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..d9b980a897229860dae76f25bd947405e3910925 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1

