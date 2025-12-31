Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C77CEB934
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE47210E99C;
	Wed, 31 Dec 2025 08:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBFIIBQZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOzmgxpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0D710E99B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BUMfU9E734201
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LHdgIK7rIVdHeDRXxeUpAdW6FlQ9DymFt0TcCA0atqE=; b=fBFIIBQZm4j3IfW3
 unEXOe0yc8SHr95y8bLxvyWdpxPQPk96ExGq8OEv38mNd/1L0fEJxsF/21vWUSKf
 BcC6J562dLv0MlXo7pG7AbEHYpHrvH9+3buDcRoT74GI56gCQvhWnr2mrauKaGIn
 r6hCjCdtG6dXFrdMqh7te/CnFRqwg/cOVLk15E/OAYp5DeIqpf9iDdtHdUvtReKb
 kiEjmldCAP+spTYwnzjRgsxhwObjwpeykPftxboUwRozbttFD9Jqh8LE1Tn3VUU3
 dUqSXgmrMKS8pwhIsZ9be+oD8STpV5Ju8Qp2ETEFCEkiR1uQL2mDYQ9AePmRM7FG
 5l5d9Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sguy9k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b9090d9f2eso19650830b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 00:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170767; x=1767775567;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LHdgIK7rIVdHeDRXxeUpAdW6FlQ9DymFt0TcCA0atqE=;
 b=cOzmgxpaZpMpS5AlcU2qFYsUScq8YTfFcLT5+RB/MVyjP4+VpmbW04o7hyaG+soWj0
 /WQeiFAoVRVae5dUoz49qIgHIW7uw9pwFNEmmnwj3gLJZWyKeKEv+jntqa2tNiwKwN66
 X9Lo/9xh9u747U0ClssvlyLhFefU/Zx3vKiXYnaZ+VU7V7CqRggiZyVaxsB8fMhpBmy+
 wsBelSzIeYjg23aPT6EquS9UgL4/+hAKHlyUEKENtGORrMO3/a2ZoSAXc5VzZwLBzwQY
 ToRomLBgPFcfSo2Y561uobsyd5d3QEYTtj4YpQVL291UMazAjCanABUYKU7DdAuhZgR2
 sSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170767; x=1767775567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LHdgIK7rIVdHeDRXxeUpAdW6FlQ9DymFt0TcCA0atqE=;
 b=h6LS+FoMxDAHjRXfsaz9qnmjItPx81b7x4YCfnoFSEZ/F3pWhH4OqXB0IuZDMUtoEp
 S+ez2Eltn5mqplbCM9j4RaYqq3OY0sOUHbT57Hbe7T13cTzHlScXWg3+4I8pdTeTl3pM
 Kb1Om7T+d5DkXlx/slCWibmne/gSIM2Td5O5OA//L21BXuMcqprpyB/4IevJ2osthoPQ
 p6mkTz0TidlOHmkA7soGSOWtp1e4zDEVd1wibV2mL5x0ZSqbuUCH/tIOBrS04+QROM11
 3Tk/ApiTdoqSWY3wr87SfDR04JrDOMaIbaqzfIIsGFv7wMnpFeFZCwasPnGVnvw76xyo
 2mJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2srJ18C1s7tRuQ8oeTsCHWVm/ILeJTeS7oNj1iOF8AODLOak7dNxpupCElJmwmyklHBmCBXzjz+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVHfR6BxbY+U9M5DM1nMFiRckE4XE1CRAtI+ZQQRo14+3FjKle
 6I7G0JbdyB8fUvYz0NaEPTA+ajekGtuCxNnd/KpxIjXgggoBsga13V0Pn/yaCw13iLWkkFQClJn
 o6ho4+RJJLQoYzTz/ICb8owC7KxaQ7QS3mcddx51eiYLQ/h4AEuDdUvHy3C7t0PjM5F/Rt6NErO
 jeACk=
X-Gm-Gg: AY/fxX7dgCzJR0RCQW2BERtMNKjIIe2gk68ASjC1eT7JhB6IA27ZcHOPvVM4/5VAmPq
 gsJiivVuWvfQLcDkLnDBHBsgwjKIZt8xVFVRh4ia1BymGs4SSNLTKBlKnxI75VjZrxKG6FZVLMx
 zMdw0Pz3kkXP8/42UMf5DAfMNIRMf9+Pq1/LGITBMng9AaKFR/pExZLvM5STa1N7K+gTCBRo6PN
 MoRHtMJMbKxpo0OhJl2If84rzEa/2otnB10jFb9tCO9VbLmSkdkXsx6XzKccAWQuoXJDrX3vHbk
 9QXnzxtsk1Cu1Smh6nzqd++LFpjIC0GFMqpmoLsPVB2q6hvNEDgViNcTtU2j69RvEvKxlwXrV2T
 Z1lpVSEen5uc3af4zC/uy8DNIw4lU7a/fmw==
X-Received: by 2002:a05:6a20:3ca2:b0:344:a607:5548 with SMTP id
 adf61e73a8af0-376aa8f3946mr36073239637.58.1767170766830; 
 Wed, 31 Dec 2025 00:46:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaGppZIEcNFj7h+K5+adlAthXR0ANkOoGwkAkNm/WxOfY7fMuAjR6d2+dVPJ5qc03dhZ4wOA==
X-Received: by 2002:a05:6a20:3ca2:b0:344:a607:5548 with SMTP id
 adf61e73a8af0-376aa8f3946mr36073221637.58.1767170766327; 
 Wed, 31 Dec 2025 00:46:06 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:46:06 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:24 +0530
Subject: [PATCH v6 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-3-da87debf6883@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=1808;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=T0aJD33DIX3eTHbNDuhSmkpxxHoTSUhKHFqgSnJxirY=;
 b=RchQq5wGsT96YNkpPSE1H7vENdCVRpxN4zehwiDWyIAOB1DybAjhppVLFYlLjna0sCObQVg0j
 291CczjEsrlB8J1o/dgJ/NLiq0pVuTFAyvrbJ6Ubhq08VTPPmegw02G
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfXz628mFe8vnyF
 LO0LwwHsFMxAk7Of77ug3nasX2/Ub3KS1meq03Z75NY7C22VHaLKy8UNiJ9NQgf2wz7KCmfYRv6
 69C7Fpn2dx6k5Cjdc52+yjsWzhbHsTHI4PmGtZapu309OBw6crANuTGa76tPzXcXafDbnxucjHV
 s1ovpOT/xLg87kU03TE39adYqilmzp0cpQcBadYsJRwr/9tyaS7alN1G7T84q9NKXb9dMhUIr72
 aM3Zdet+fSpsf3dGghSV8gwBuJvbbBMth++2g687hKCOA5priAHHD+9a3tUaIcvEu6f322FO/+Q
 xBwGk4LXDcc6G1AZhUuEeQ7EwfrkBVfihn6JnrsQjojIguoBoLo/MCV+DvOrTABOb8VB/POAg+O
 zhXgDl6Z62Z+dvVPMCWUxqUx9PM+c6m/OFIOVCzWMkhD8nW6oUyloNo7KmCy5kGo3WGYdhaGLlP
 TINMqQxhY4QF/LikFKQ==
X-Proofpoint-GUID: cDs9zmfe9Ai0-F_8YMFjLAOabATGeIEi
X-Proofpoint-ORIG-GUID: cDs9zmfe9Ai0-F_8YMFjLAOabATGeIEi
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6954e2d0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
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

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 5c12b5aacf8f..27ce88766dc5 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -45,11 +45,11 @@ properties:
           - const: amd,imageon
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   reg:
@@ -388,6 +388,35 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU Core clock
+
+        clock-names:
+          items:
+            - const: core
+
+        reg:
+          minItems: 3
+          maxItems: 3
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
+
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:

-- 
2.51.0

