Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1617DCA3C8F
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D2A10E97A;
	Thu,  4 Dec 2025 13:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZI0wMG4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKofpOy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03F310E978
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:22:38 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4AEuaX1159694
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xrwxcmbJg6cVbMantUgzlL+o9/ix/U7MTWE7Yt9Jblg=; b=RZI0wMG4AwNZj/7+
 D6o41fFUa8EZodi/EZa5IVDSYUjbfaP5J1+AkNFHtXKlcefV0cr4thaNSbCxw5sR
 vYJt47NmR5pN6C96QywUX1O/37gaOCJywANsQ3oYgImWcAqrft58Ja3oIG/WiNJt
 V0O8HBWp4lqqIrWRjHtEUs3NJn00yiojqdLakAUwn1iSJvKGcgmES66LIYVbVO5q
 QSckG2iNsYv5Ai3SmOlYBpmZ8m5Ey5WlB4zt6VZHW/J5lGlVGYLAn+R9zcsLCWfH
 h+8mXe002XyxDyVAmNqeudxp4iqFYcYV+IZUgmhpskZxyalkEr7HDBd17xE/s+a9
 lQvblQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atu3h2vs2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 13:22:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-340ad9349b3so1628207a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854558; x=1765459358;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xrwxcmbJg6cVbMantUgzlL+o9/ix/U7MTWE7Yt9Jblg=;
 b=gKofpOy3L5N9sfXQ3UQWJ7eCX14POxfwqRdkTfh/oaT0pvzeCdihNGIu2cTezPe/FI
 +CgpTdmJPQyxZ4YWcA1qalgBrfVbu4fhEYSIqrzq6INIvhbkSfe3k7PjS5P+1VlU1bVF
 XE1JTdH2yBUL2cPXY6LztxyEbrZkn8uwF3XVr1lo6WDOtIQf0XNRfPEq0MDVGB+wpPCT
 dCxhtFFHFId3qoxeD9GTEd3OjXGsNQoA5bPn8yzdc2SVGM+XW+PgcpyT8KZ7FvVsofCm
 CdkGWGcnIe/ZOCjp4fOQjMoWKSd/xLFdkDD2pXi2E5VAKxooiDx5IinNXS6195XkWfT+
 5djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854558; x=1765459358;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xrwxcmbJg6cVbMantUgzlL+o9/ix/U7MTWE7Yt9Jblg=;
 b=CbS/yI4SIBnuozNEsUUG6fLsWYO7i0I4EDcNNouKaqFi7KFq9HI7ZhGcSllZOnEQsN
 m1r8vhQPHHYIGdzlG95cSR3d5X2fxEwDBUdos/9Ep66rhU2O99WMY7qLF51UGJY11cIA
 1c0WRoazAxw/VhJqBpoTi8AoDHlcdG7ABDgukRv0SE+2fViZCocBXXbZ6zTgl9Y/XWn/
 S7nwoim2xx0/M5wADZVMkwehFSj7fsMXgv6JNS3x1W/bL2m8zT5Io68B0osTzhRw1iOD
 LICWfKxYn3a66Io32wG8ijRa7KzafapYT0TK+WPJ6oVnOhtBfeVNtCqQufL1GFnOC8Yb
 g6Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq+yZFPpSz/cwPhaiCpUDANzjjI+aZ+A/hW5xvfEmYA2Zpt+hKAhpxfLT9qYqUgIEOV8NFbyqOQHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzes8HZyrZBh54LnRuzvxfG4YQFZ43y8feaNb7PblOtBiR5Pw52
 f2VYtixGIN1qZ/s/Q4bIJAeHlhscKIPqP4m6fjz97AYDKFuUZr3QJjBnXGuZcCOxLM3JLnJzY3c
 4pykF4nMHh/SL1tGe5KuxVOXa/hBik6QS1VVq1qhsVR0B1eQRlof5BdraPqEH8XYYripa0MM=
X-Gm-Gg: ASbGncssfRQeLlD7ldNrFNj9H+tRM4HBrLABmC41/Gvbj/rTvmA+JZs/h8qff4M6FgA
 ZQ0P/PrjJmE38AtPkJ6zoE06j77sCscmmy8FqDE4VJLoavQtaNAPn9ce2NsxHT418uI/IRhOCDX
 DiMRqyebNQz6I10zjRrtG5CbjexKjQLUM4Lf8B0S4VMZeUfP9uOKg6YaD3A2mQhJ92qSm9rusDx
 eeSgNRJiJThBHXTWKseXQZdpxcoJmokvPoEkjTmUQuj7fyhc9Ne+SOJCInQr1/Z2LBSzk1A25ck
 nG/UDyHn7Q+94+oy1CAzlIsUpml7qsRJmMW++gwaQhgBx1K1QN4Bu04DhH4F/dWaHj1yIX4WZBI
 RDffbzuueBcCkoykCXM0Rx+yQxP/mKicdNg==
X-Received: by 2002:a17:90a:e7c3:b0:340:a1a8:eb87 with SMTP id
 98e67ed59e1d1-34912710eabmr7174312a91.35.1764854557309; 
 Thu, 04 Dec 2025 05:22:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpFOlNn8OCsRbojUuDdPv2uX0wdMKR06SYjf/NDO7mAHyORuIFXRA5cb9fpAz5sy67WHXGeg==
X-Received: by 2002:a17:90a:e7c3:b0:340:a1a8:eb87 with SMTP id
 98e67ed59e1d1-34912710eabmr7174267a91.35.1764854556850; 
 Thu, 04 Dec 2025 05:22:36 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:22:36 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:55 +0530
Subject: [PATCH v4 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-3-f5a00c5b663f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=1749;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=nllHIarzQ7x1w4cIQ+mzYrnC4ouTjUGWchGSLlkHcQ8=;
 b=J+2G4HYsxfq8jhSbC6KgkFHZE1eJA9Ko/oM+TQBKINIyBHJBvx2KT+jhZ11TLw09fjxQPYgrG
 7NCGdJBcVuGBQGSmsOIWJcOTpnbwXOxovcw/JAPq4ypcoENUdePtqDq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX9p69KjiSuxRB
 Y2N04JWXo/BSltp6NccBPDB2AK+X+Xze6jVP1hcOUVKuUhIGaLm0WxEc+6ctxOLN97nbKVRuWC8
 fQ+5KRRfYPdvXxOLs5aPaEl6lWu81dOMXNF46Kzr5d/7mgO1TmT+e+uRnqjP4UG8c0dnuf5JfNF
 22jHGMl5ko2LsMvaNS+1QU5mFrcO0KlgIyq9asYaEfVV7guz83rjW5Aq8eLbQJbs5MsVdBA7Yuf
 ZSo9Swcq5wRenWJPMBjlsIhbcqrZD5Azs9e0izOJwBPJ2mhr9Kl7EkgLS4cfOQMt5dso7R3tQxr
 YWgv/pHnQJa5pw1zxZ5GD6yZCicrK3QKRJG8O339JTKoY6KOkQq/Uvo/d4jmFUQWjQahCE6HzRi
 2EG8XJYTm36t2Bj99ufNpJNwIQEyVw==
X-Proofpoint-GUID: tR9PKiSt3Me8Nhatw8HYBAY5OQpN5BGh
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=69318b1e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: tR9PKiSt3Me8Nhatw8HYBAY5OQpN5BGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
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

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 30 ++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 5c12b5aacf8f3ff64ca2ef97fb0dd6c3a26a71bc..5d5ff4307ee7ce5464afc5233f03a8bd1daaab22 100644
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
@@ -388,6 +388,32 @@ allOf:
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
+        reg-names:
+          minItems: 1
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

