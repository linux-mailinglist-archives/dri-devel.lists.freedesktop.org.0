Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACD9CEB92E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8ADA10E99A;
	Wed, 31 Dec 2025 08:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8ZDTMjA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyIhlqjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9523A10E4A7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV03aap1750839
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CPWRcnVAsBr/GyDsy1wxzlUy7eBR0cR6vueWTgWJCOc=; b=b8ZDTMjAV+UprkMk
 lGf2q4930KFS1mLQcwunPyXT+0dDHB1M/eNURrx0Or5TOZCTbZnYDMmP+OCrShW2
 OVWJmMuTFV5s8/iurnXfUPO5DOSy7NSl1pVswd+FCkQV7byEQriSWGr3PxNe1SZH
 F8KMZ3iu/J7fuf7m974j2Pue6LBj2N847jsUB39CLogD3uEZsgwQ1E/O9ZfBfMuh
 v1qZEo6bp2DH0M04cHn/CKkuNdMdEAEXAV6JeyREeXi9L+tbn3gB69J0HQsTkPfQ
 ylMYKXoros8Cub0kUa16HT3r/0dkemqFE4Bfw62d3lyT8giB1fiTu7wdandgNENR
 N6Q7rA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sguy98-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7aa9f595688so16266288b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 00:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170760; x=1767775560;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CPWRcnVAsBr/GyDsy1wxzlUy7eBR0cR6vueWTgWJCOc=;
 b=hyIhlqjj4z7a9WraBxix6yH1VZzUbfwID9rx3PvtHe3RGqks4esJ3fxNBzyNV9X3uZ
 fb4lxo/JVLNVZTlyxYMWMn4SsQ6fsuCvSw3Sp8PCs2g/VjRCo4xSuZX3TSZZa01Jnh1F
 jqbPizLj0yUAeeyt4ecOVXmH8Gm7lQJoQ2jwO4xM5POddhCsHlLGwBj/HjTeoSRU6L0C
 U8lhXJCOsd28gkmVSX6W02Y9651hgbdPQ3D7+qpnqXNXdkGsvgvH4rd3YBtf4EEUdbwd
 eXa6tH7EQPLIE0D4/PALO/tEPhTbftnhFdp3SgcePb2KnRWMtrB8TEBEpdoAEMrkw5h1
 Djdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170760; x=1767775560;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CPWRcnVAsBr/GyDsy1wxzlUy7eBR0cR6vueWTgWJCOc=;
 b=AK4IZzDcyJnp45aaa2Ym5SvbZJtL1wl5wRd3aX7sxHdOahAqD+6Jg9BH1fGT+0K+aI
 M/wjMQNQgE7N4Qsi1Hbf9GFKClpis3zzDofn52wxe8cDApj/ULAUMOEFiEmLDJZnxlkR
 u5Da4I1ey6SikkI5ZZ1h8xU+V9rPxSK/2KPdH7dq0xYtCsPlMsmhlr77YcWrbZUP9xRX
 4V3IK1PGFfyEspVCjeoEVjsZhHAoUMdX2yFy0/+lkX0dqRIdqOrf4w3K99dPZ2ZHivub
 emQdYk2x4bjH8gz4fxZBpTxpcJLvbNb2hklAxeipZVoIttliFCFSjETIxGtayJ2dsPsC
 ldCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr0BxfY4h6gxzzyHuok6AsLe4MuYvWkq+k2VdzB4nhXQF7rgzTfT7qr07rotiLj7xNth4Bxo03TNI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCbh0gG4THI3ibXOG5q94qsp9+ozJ+nWih9eOApN9lA6Cq/B54
 LCQ+QstGvC+62PCBmfJ9CAlgsUOKFIXV3jWDMnvKI79PEpP7sk4Nef1uGZ6idmT5YWFY4gxjogU
 Kq8pl+F4gh/l/zKbebPzoEnuIjy8UoVj5VAo93FYJ5bvTWNYLsUHPSkFzRwREH8JK8rTJiRM=
X-Gm-Gg: AY/fxX7n5dwKyQn3Uzc3185eV63wiLS2IkERKFHXBfvu41uUSSwVVRc3M/1zE8pez5d
 lRHQw0rKd+ybQDV3VB13m9g9ndctxzCSKnBMyRz8OnZcwglbA6ODQQezgdMkr+Sh2DaSqg5w5yu
 Pv5xN+EXgg4ZIqUXHfr7Ha1lJTA6eCLgmxmw1ZWTEwp1oHgTjxNqFkZRMUoF1zifcC6Dd+YVl3s
 zurVM5nF9feSdee5b8FurmC8LcYmCVblsJ7SbXm+rwimA7xDQ9eIi6ua5nvUemI8p6f1ydN+uG0
 AYChMUVpaReWPdVJg4TDTkh+6Yd5KZhNy250ZZDeU1GCHQp2OkA8pjjVU9+tEoG22XqXBsx1AZi
 d9mtPtqFD1l7Py45Fm5YqhgYRNjKaDr0t+w==
X-Received: by 2002:a05:6a21:e097:b0:371:53a7:a4ba with SMTP id
 adf61e73a8af0-376a7bf0c5bmr33126303637.30.1767170760449; 
 Wed, 31 Dec 2025 00:46:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPOg4abWQAItTWlyZTTd7dHPOf9V13Fb5IfDDm9V71xWCcXMRJSLtxI+U14N0Ld/snSkxmwA==
X-Received: by 2002:a05:6a21:e097:b0:371:53a7:a4ba with SMTP id
 adf61e73a8af0-376a7bf0c5bmr33126286637.30.1767170760005; 
 Wed, 31 Dec 2025 00:46:00 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:45:59 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:23 +0530
Subject: [PATCH v6 2/8] dt-bindings: display/msm: gpu: Simplify conditional
 schema logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-2-da87debf6883@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=2589;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=b59YgubgwvsRqSeGZjcLSpPFFQKVSgA7ctQ5ydCIlmI=;
 b=kmZq4Zs08vLy/inDxy3PCYbL391nZJKFzBZh8G/C7WZIwdj0BYntTnVC4yAervS5lHaC9a5YZ
 KW4S5S8Kt1jBaqXpgIf2jXNdr5iXIjHhRLd1AEQ0F3HuTB7RCv37vlU
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfX394tyj2ZelkE
 GfO/uMldVNzoWAYh8A3eEhzQtGI9x0aTX4I30scLfxr4dfN6f0VSeaoBMIJIICQRRrYoj9kghCX
 BaBC/dt2MURDc+X6RpkbXCTYvxHU3mAqJCW0ovKO3rukC9RuqRpiRyJbDY59vAZp78n8nqCKOpq
 XuJT+CJegH2DbS4Q3hhrEKWg5SUs6el3NG+8ztHaaFKfk6LoSuMT09h8jJzn/0oy8OqLbAAMkxt
 UKSK/SnHK4OutEul0OM6f99D2A5RobySHKnqOZx5SIU/3yQl46paCg99gxMlG4dpl5jbD6f8lJV
 XsMyvVms91Xa9i1CEdml8dGjZaGyLU+igK+7SsCpZblnaXGcKkU1kGh8MFXb2MVj9Ejh3GGc1KS
 AKCQP/hGZT3PQn6J6EBmTGO6jYHlmzBvFwwz2Nig9K7DbkO8JSR9IbFRUyZ3oJU32YZRlDsAuYJ
 6/20kRCLLVsHGPrpU+A==
X-Proofpoint-GUID: 1Bl1Dxkk2lhKZsQhvd4onLPl9ytoNc8i
X-Proofpoint-ORIG-GUID: 1Bl1Dxkk2lhKZsQhvd4onLPl9ytoNc8i
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6954e2c9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SNFa__NYaeNfRMWcEAMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 56 ++++++++++++++--------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20b..5c12b5aacf8f 100644
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

