Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C35CA3C89
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD9710E975;
	Thu,  4 Dec 2025 13:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNW5ap7e";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HD6DbVwb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A9210E1DD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:22:32 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4B0usV614190
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 13:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vjn6gZwh0hD0StH1MlSbywjprq+CSWBGR3TdhVlpQTs=; b=ZNW5ap7exi15xItq
 vrVwJRjQ15dZlbnIWNs69Ozl5HeCRUpw+bvb6ZyX6DFpW0EN4d7CyXvSX/m2sdWp
 qdzo1gA34bF69lIiUSan1gYLY+eUVSdO5mtQEn+PEpbvEUTIAguOpCzLIb9jARPu
 wgUMerg8PNaTdDvUQN4JopZi+rDSZcUora3E8Y65JWbQfGsVNBT6DqrRz9SH+cti
 5PUQfems05MNE9BW8dxy+ufuaHHNsHLqfoJx05LJiqogut39KxDvuhzA0xqbUKVe
 ynPRls0nLZIb32Bl5WVn0/GyuuA6LEdZsnAI1eVIEr6r5BtZt2r8XhDP6lrwkvOk
 QPl0iQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au9298by9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 13:22:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3437f0760daso1769054a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854551; x=1765459351;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vjn6gZwh0hD0StH1MlSbywjprq+CSWBGR3TdhVlpQTs=;
 b=HD6DbVwbP8ZQlZNmS6j7L6HaKJn+tNq+v67RyNhK5y5TP/20VRlh3qwkUZPwYu+m/z
 tw3ByYrvt8IwumAF35KKfzKGqj0PU7MH0M7SPFTSxZGQh2wIC04HUd+2h3k0REbL6vJM
 H050/ipt+Tg7fHiozNIJkVoGxPOwosvlQYAb4Px8SRqDBcjK91YFL2HQveDxZ4n5Gvj9
 Udes1GyOiO/3ybCXjDrMh8P9grIT0uUQWM99nSXZMHgYgHGprFHDJGaTXQEq2J8Yr3Lu
 E0/KmPmIaJ5uR+5/HX6XzCWzwMrbnMvpz8vAlDU2OZ1QUwGlgy3Zbkvux425f6J5Pj/F
 OEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854551; x=1765459351;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vjn6gZwh0hD0StH1MlSbywjprq+CSWBGR3TdhVlpQTs=;
 b=wkr/A0Jh5QgPsPSphnmzYNdoqyctFKd2tvmF4tZzf6rb6Imhqsz+fotJtM+lJkPjjf
 2IpDmQ6VfuRWLJvMOiiWhqGjVQ1DpBvjBmQyYWo9RDf4arFZsheoeTbzXk+xF/as7uIF
 7N8tuzxwtBl1IJYQGIvOhJvV/dAJdh4LaVadtVdOhbKlkDvr9GfED2g2nisHc04AGpQu
 DSMNvmnjngObnWQEHk07vLUtp2oeWVtM+IuTktsKUA7pQp+HgXnf6fQnRivyro6EkXiX
 wDUaeMcvAxuo57sLFHbF32NuK1zP1PCCElM8AIQaPaWpla4hKG7edTEAIxNBMxhVgXgA
 MvOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa4lgrvAgjHZik3KVFBXV0ky7Apj/fZTi64yliiclFn9ndkSapntAkk2GRktKsnnyuMTlf8dU+Zmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg/nYOGcZuKOp9GH9g567YIPN+FxmCFc1dCXnN2iK84ZThnC/0
 HSyXmQafthTZuJlZuGj6MnY7SLe5NcWIpFQ8W24XkIlYPNnCDoB1rsXyc3VHgfGD6O9HIwaNaiG
 npXNEI50N+ajtt9eiDtNxh7+ttEDRpwYwDJbFaN8hzuKc5JpgnuJtjztmRhV4PzCz/LU2LSc=
X-Gm-Gg: ASbGncuJR2GSO1NFJkdiSaMx2mmeavybd1lE6KGSK65uTlyXdJmiTJayY0Sn8+4rYVW
 Ir18yWFJ08Zi/OAh4b8hoMM9caqOkpgKyaN5HBVcwuz/Q/pxE5wTu9LZeY6C+wn4RiHvczQqU63
 jg4T0rgvuDuVwlu6O2bAMdgfVk+p/c8Sw889RyBIOVlc/ZL2Zk5sup+DsLN7vRy7V9iYxOH8JKP
 IFYRN/PfQKpFOlxP4uL4h1DPFCmqiytqFofX59BfWIRmOCau3E0zyObdxu72BeVXC8xYiwoA6WQ
 UOHQguPRmUQCXcYHEAcTajjx+owZwRKsUsS4DULFmLwUTu03NEJrq5n6KyPXHQdqWNeiBJiznNZ
 ZtZOlZNS6ofbPI0Y8oC3g5T+FUHTVqaAa9g==
X-Received: by 2002:a17:90b:3851:b0:341:8b42:309e with SMTP id
 98e67ed59e1d1-349127febeemr7515962a91.31.1764854551219; 
 Thu, 04 Dec 2025 05:22:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvPYRb1UZi5dH9URiOBzneLDBYpCZJdrTZvmZu3re+MQ+hsFkP/byTXAA/70TAX0Ldzw6/7A==
X-Received: by 2002:a17:90b:3851:b0:341:8b42:309e with SMTP id
 98e67ed59e1d1-349127febeemr7515915a91.31.1764854550665; 
 Thu, 04 Dec 2025 05:22:30 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:22:30 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:54 +0530
Subject: [PATCH v4 2/8] dt-bindings: display/msm: gpu: Simplify conditional
 schema logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-2-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=2572;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=J6AV6hXE/rdhdnYLr3M4f4P3SdNbrI8qP6QN5YN6N0I=;
 b=2rPNQLjTbw/P/x/xEw+9x8WBvFcRvXru5bRqcZ3njgrrTJjKtzJUH+rZExSsIAGWu4OYjf7wR
 m3Lupi9YT2fAFpqF1judmH6v92G5+4dH3tvPtQZfR+akfZPoOQqpFJq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 4NIgMDs_-YkVojkgB3f_OpXmNOb31xMW
X-Proofpoint-GUID: 4NIgMDs_-YkVojkgB3f_OpXmNOb31xMW
X-Authority-Analysis: v=2.4 cv=UddciaSN c=1 sm=1 tr=0 ts=69318b18 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SNFa__NYaeNfRMWcEAMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX83A7LyUB2eiE
 uA1f/aSfKINReXmV7CrdXFAJiCu7Rkg1PMFyXfRqh6B4KMyTjuJz16KkYIX/2YB69R8zBYrG2kC
 Km1qoSKGxLgShMpwtxfO/hkiBq53CGrRpA84X0BfhCFVQwlerGecsKnoGAytVH/tJpYn4nPGImF
 PTt6NJqWhs3gF/jmZvdt1FSBj1252GOqwh16mKeFTjxk8wrnwLmpMsPHXmYyWqVd8K+qHKXwtLg
 ZQj9TPSuNAfLvJTcQc1X1fLDBkwMpO9GsnEc6qOoJOmB56Nqael+jkkl8fBx4xxaS6F1SOMIcHD
 AkMof2TKwRLf+WnXOcRQTGiHdyzcPHDsQmquVIfcQ9sCedgJvkQFo8o+CMkSTNUgqOaNFSLS2Jn
 PYhZphplKqJeX7MzAwt6mCmnKsdiQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108
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

JSON Schema conditionals can become complex and error-prone when combined
with regex patterns. To improve readability and maintainability, replace
nested if-else blocks with a flattened structure using explicit enums.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 56 ++++++++++++++--------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20be4bbd7eba619f7fe172b6e9a5897..5c12b5aacf8f3ff64ca2ef97fb0dd6c3a26a71bc 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -387,26 +387,42 @@ allOf:
       required:
         - clocks
         - clock-names
-    else:
-      if:
-        properties:
-          compatible:
-            contains:
-              oneOf:
-                - pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
-                - pattern: '^qcom,adreno-[0-9a-f]{8}$'
-
-      then: # Starting with A6xx, the clocks are usually defined in the GMU node
-        properties:
-          clocks: false
-          clock-names: false
-
-          reg-names:
-            minItems: 1
-            items:
-              - const: kgsl_3d0_reg_memory
-              - const: cx_mem
-              - const: cx_dbgc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-615.0
+              - qcom,adreno-618.0
+              - qcom,adreno-619.0
+              - qcom,adreno-621.0
+              - qcom,adreno-623.0
+              - qcom,adreno-630.2
+              - qcom,adreno-635.0
+              - qcom,adreno-640.1
+              - qcom,adreno-650.2
+              - qcom,adreno-660.1
+              - qcom,adreno-663.0
+              - qcom,adreno-680.1
+              - qcom,adreno-690.0
+              - qcom,adreno-730.1
+              - qcom,adreno-43030c00
+              - qcom,adreno-43050a01
+              - qcom,adreno-43050c01
+              - qcom,adreno-43051401
+
+    then: # Starting with A6xx, the clocks are usually defined in the GMU node
+      properties:
+        clocks: false
+        clock-names: false
+
+        reg-names:
+          minItems: 1
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
 
 examples:
   - |

-- 
2.51.0

