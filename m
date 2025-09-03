Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D7FB4162E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D8F10E1F9;
	Wed,  3 Sep 2025 07:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhP6YCn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D6E10E1F8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 07:20:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832mHIK012509
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 07:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PR6KqsPCNUM+EZNcWonweXt6CFzY44sPfHX2M7jwd74=; b=WhP6YCn0bkXXOkys
 EFEdGtm70REHJV1emT2YiqfAql4S28V40ku38wqrVS+fWnbF2Db1LAqThyrtw1nz
 dvkzSygM8E9XmT/TMc+mqjYY8q831hCkTv75Y6/NO+XWPVVBd6zK8Cc/wgp/Dd0Y
 lMs4cvXFdBb2texc9SxEz9RaB11usHC7hJHIKW+YH2Oa6cCYJLs5wHl7Yiti1OqB
 5G1rEC6bfwJBRN8D7O9NnJomdiWg6JkW+5DO6ky/byHqpm7lJtE503E2gHgtXF/Z
 EW5uOLbdh0JLGl3urfzT51ncIugEhqPmDlWlNgtqyVU/Np8frLrjhtR0Pov5x09D
 M1Yh1g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fjfxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 07:20:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77250d676b0so815913b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 00:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756884017; x=1757488817;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PR6KqsPCNUM+EZNcWonweXt6CFzY44sPfHX2M7jwd74=;
 b=cfFAF9GSfIlhT3yV4wtEOe1WdLnP5CuuTFB13faekwX0vhXVX7QB7BhPUFdK3Tbizm
 pmZmno22w26bk34y7R/i7vMdG2Uwp/5Pjgj9hAH2feFVIGlxztgGCxv6+6XwFSoVr4ya
 +eEe8qX2pCHIl/GmHNXwDDvvZ9TmemxZaidktCZiun4Yu8VxD1kQDC3jc4/bnImB7ouS
 MoP/uvX6uMVefaoF2uusYCCO/TAA105m2B4uLn7syO2nfi4RGBF5u8K+PIr3wDTRTTin
 IhgoRaF7jN/itj10dUsrUQ/LVbiWuZxJtkI7M/i74/ntJN3EZ7AOw4Wkoy7wGpt7cjHa
 CjKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnQZeZVrSShfhMQDQ3HveagiW1J71NV8ulSEPjXmd4bZMXL3GcnwQkIl96DmPBN4RUISX00jX9gq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8ePOfTAAS2fmRYGIwKGMWaXodasMCszdNBnb+6/MzFV55pcfw
 2cVClKnl0MDiSUrH3RE/I3XH37h6/+RcfumpqnDaf0P6C7L+2LPphtajW79iaiTnFiehF0TKoUW
 u3moI0j+Y0kEq8h3lowoFVBpRMGYqu2O5Hi8/u3j8SpSZtjW487GCBgvp/CyH5gWVa4A38U0=
X-Gm-Gg: ASbGncswEM3dBdFW+o2tZILKNo+Jnb3iUGSdN9PfxhY1PgJUqYoobXiIcdhkgWB7Baz
 /tMbRpEncUk3gDdB+9yZYmeUIwqKlpAkBBVZNY4k8hOC/QbtSFqZloRysEOJxAe/6kHOuNgROhs
 R9W1NVLlWptKEs4O53tqdfxkB9KSZU/l2mRGMEXOjSG/gBhTWl9eZtkVcbAaDulbLNz3WXV7G/s
 IIKcPSHK1T+zZJQK4u+8U2X2JrwTEtzFFSE2w5i9dV3dUMLsRej38hUaJDQAjsxRBNQwCLuZ72p
 8aUPdSEquzI4JtWR4eUFf6H+gkSnwCOc5Om8QRhOel4hsNYKYWu1pRX0a8eLZc8w
X-Received: by 2002:a05:6a00:138e:b0:76e:7ab9:a239 with SMTP id
 d2e1a72fcca58-7723c5c841bmr19009910b3a.16.1756884017224; 
 Wed, 03 Sep 2025 00:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoCKD0QFh/hM1sUteZfm2odrN6P+2cM9K5e1ZRXWq6q8tcAxq9HE3dI/77BQtbZrh4URINKA==
X-Received: by 2002:a05:6a00:138e:b0:76e:7ab9:a239 with SMTP id
 d2e1a72fcca58-7723c5c841bmr19009871b3a.16.1756884016695; 
 Wed, 03 Sep 2025 00:20:16 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 00:20:16 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 12:49:52 +0530
Subject: [PATCH v5 1/5] dt-bindings: display/msm/gmu: Update Adreno 623
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-a623-gpu-support-v5-1-5398585e2981@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=1928;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=u87CzBgcXsITaBIhArlZrl9vUsN6j2cKpyp8cwIsM1o=;
 b=CiL9c+CxrSxF6MC52aVaGcpBg9TQe2gy4Y8Jxg1eWT61ioWHIbVTfgmwHGthgwBy6xFhNGIuo
 MlZS8xehYqdC431+l2BX2XaNWR5GpZOMBdClLX1Okkx4eDs3yvXlzfR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXzqcDQgX/9zeE
 0vpl7lc/x1Xke8inCLK1rOX5wv8LiYJpOFhKrA0SAV/r8TRFRo0mQaFZnHSRCgPh353rBdG+Bl4
 xg1rhUwj4X1FsJ/Ha76bqKOlPCOCcNQ6LP0EMNEl51uQxF3h8UHL3fva+EmbAupVjVUBuAsAdHN
 Dg9eNGuCBdSuEn6K+h0p/wCVokLL2XfSJvwfd/502dc96eJQb1TgTzhsg9S66u9KY4P8QpRanX+
 FzhcZw2H9yWX/kWvGnHiWMUpdMM81ekCr2B3E+neaZ5U5k2VHH4ovuOC20h1Ih6+JnTG10O9Qv5
 xEa+eE955T2qlivU8z5UaP1z77M+qekhbJFlVJLb4UJP+x7dXNMnzOZWuFSxIy+z7/GTcLvGubI
 263en+Xy
X-Proofpoint-ORIG-GUID: UoZ-2JTgtJs7Z8s_PwUKMJhnTDm-mp0Y
X-Proofpoint-GUID: UoZ-2JTgtJs7Z8s_PwUKMJhnTDm-mp0Y
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b7ec32 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=Z2Up3Oz-XkvUWgdIv6MA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

Update Adreno 623's dt-binding to remove smmu_clk which is not required
for this GMU.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 4392aa7a4ffe2492d69a21e067be1f42e00016d8..afc1879357440c137cadeb2d9a74ae8459570a25 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -124,6 +124,40 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-623.0
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GPU AHB clock
+            - description: GPU HUB CX clock
+        clock-names:
+          items:
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: ahb
+            - const: hub
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,adreno-gmu-635.0
               - qcom,adreno-gmu-660.1
               - qcom,adreno-gmu-663.0

-- 
2.50.1

