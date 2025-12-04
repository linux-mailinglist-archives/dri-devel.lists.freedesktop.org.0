Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1ACA3C92
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACB910E97B;
	Thu,  4 Dec 2025 13:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldf5rvob";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWgYZoxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045FC10E97B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:22:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4AF7981044212
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 13:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dNj9R18HY9BBEV+EQzdpIOpzUF1L4+YTCM0LbT+T/xo=; b=ldf5rvobKiSCPKK2
 rE4ypVn8GX4D92jJfjaEfsxX62QgLnER5fLdsj9uO4e5Yppp5Xk1F0wwWwp8yzR8
 13LQBQ3OxtuCV7rEUaE2k0J7fGygvCzrq7HA7wpI2/9dlhc+eL0tEOWh58/CgSBx
 vzIzAVvTcq9AK5CUQwsecWlS5VMQwWn67UN6lsVVTehD5Y6Gb3RDYc1VCDBCusni
 4lxhsyQRfi2QdO8CNYfChDNGRFIwm6YRHMM1+MJOrjbIKSQyFVXTN0Plra2CgBVg
 mzpnOYI9GodoN7eTQbaRG6ok9l4FFZ25GCIFncKyR3qvnI8gU/16UwYvt3igubb/
 YF/UKQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6xp0v78-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 13:22:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3438744f11bso1734285a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854564; x=1765459364;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dNj9R18HY9BBEV+EQzdpIOpzUF1L4+YTCM0LbT+T/xo=;
 b=iWgYZoxxkj3jCKnJKLS6+YRtjwuWsXs/za145r2UR4BkHy7ZnZbiWxn46dIpYfVGl/
 QPFvIOQQVFjt6/bG1cPmG1Ud2ZNS5h9Fj6ajGHYqzDU8EJqx/C0MeaE4VB6wuWOo2URE
 vSdT7S4kPzcx8Pj/isgAE/G7NBxhC5gW/o7fccD/jkUnzxNocjiij6HyCiynw6tZWcSh
 thoeMi1CzCbdE9HNJ/i1EF9bbYvnG+RcLHVTSA96dihPggN83ziUiWQYWY43YcQbopdF
 Yz5wYGLmOP1a1oJExxnKfcBAQRsOkW6AgJ12bXCq9iSGlfbd/vEYqkOFGxvrFdwxkbNY
 +lGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854564; x=1765459364;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dNj9R18HY9BBEV+EQzdpIOpzUF1L4+YTCM0LbT+T/xo=;
 b=ULdSvZNdhkbv4C3DIxcQ+Wn6pSki4MnawJf1pt2/XL7ergm/zpMvCmMVwV5bLPsEUk
 xPg1+gtP4q4oocL+Jk2+9Zhk/nlcxP3KkodJQyPRpcHjAHrE5iQ4OePzaUXk5pcm1USf
 XSpvN14qBoD0mcNQQmNekvqN+EZD42HDj6BbRLn6aiAHT5I/SqUOta7B1dSqeAP8QJpj
 Dpm275zE2+U5/ocxgOU2rKOrpvTiLAXmm29CQR4Jr8Df9NrUvh+I8O2yppZ4e3R11Mz2
 Q0Mb+xGcPWBDRE/zdD8+urqYQ0BwZaQLljJVrQekB6Vi5r3wFfuoX8f1k0adXqESX9/z
 TH/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzE24NjyYGzYHBuzl90jZDzXJrVecVWxBeQcbRYsCy4pqcu3sQOQhvoPVwNg6oYY7wYNxLza0RmgI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+Ze2LJJwpu2tZYBrJISJ9oA5+AlV4wLcGcC43VQPIi2UiUG0j
 BpljnZ7ilRCjnnUa79YG7KDsmc2+Rw97A+M1jWvy/JnYP3rwzIfKKLEBoKsEBckmuw6sVv/V4nu
 OfMvZ0wqXvpkUzVvM7+Y8yKu5gNq00buoJ8bl28zsajwBPEJIuYEbPTSbkUKbUaEy3+jkpbM=
X-Gm-Gg: ASbGncuIj2Wpp6JCE7/A/Epeyc6mVdqn4KDZpaa+7p+4+tZGIA1mMjohxCALRkrqU0W
 Jad/QH41ZVHbEBHubfZLUhKVo0iPJps77wOpwf0v+C85RizdGoXvAjLgW82P4lsDyEETolwLeOm
 RyFifrk7+35hg0GG3Hgog9PUrvDTPy5hTxPjPiV8vwcNgaLhXrjA0NfVFnjQ9FrLmoqUalCzl22
 6WpStzDgHpyNJJIvZLSpnwpl7Zsebb1VGPE7km+cp3vn16gGVYSzQ5yT0bJxev7NAblRxzwrw65
 n5+xWuWIzs1rD5uzoC7IC0+LClhGksSJCmLgfnv90JpHzbTGs+FxQ8VTh+DsX7m+m6OBWTAAx/l
 hUe1EKjOJLkFSxA0ZHdeQCRd3twe2fj3cCw==
X-Received: by 2002:a17:90b:3c50:b0:330:6d2f:1b5d with SMTP id
 98e67ed59e1d1-349126b7cb2mr6437087a91.26.1764854563711; 
 Thu, 04 Dec 2025 05:22:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM7Yj0aAfp0DXPBcgTSCIeIyBXDcgz95NeVV+9v5b3m13qcDhXGMK6w6HenmZz+/02fo7qtg==
X-Received: by 2002:a17:90b:3c50:b0:330:6d2f:1b5d with SMTP id
 98e67ed59e1d1-349126b7cb2mr6437060a91.26.1764854563184; 
 Thu, 04 Dec 2025 05:22:43 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:22:42 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:56 +0530
Subject: [PATCH v4 4/8] dt-bindings: display/msm/rgmu: Document A612 RGMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-4-f5a00c5b663f@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=5138;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=zUAYCX1J5MIdytFviYtCDr+x6dE7Gr9+3odzNMnnNEI=;
 b=nLTboisLMjix/tDE2QzkAreMiBJRUIWErvDk+xe6+ZTfWQ9SZUYN3KU02bsZJd/s9kbQy1S24
 BzgXb/Xkt82DSn1USz+XUiN1zjhHSdSYO/j5Jt3L3VgeM2OYc1Ui52J
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=RKW+3oi+ c=1 sm=1 tr=0 ts=69318b24 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=y_M5XU1qouMi1lcPmcIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: reJuvehbwXghMqBElu4vOdILyC7NMyfz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfXyik8IdwyEzV7
 XWybPiUVfHSx02F+kIDnmic9xDk6vibbJ1vVW8M1NWUAP2Y15EZaT6kdrEsnG0NSZb4pTKHNe3R
 RYkSIc3RBgjCgKK3xlrAMWbozli1ZQXWYKXmS+0ZZNdRKA0XxUB9Xdd+0kis26jZjdkxO5za1Km
 3u/Bko3AC32zipZuuO5bUA3f77+1Oej7zYUH2+sSGJDlksnslDKR8T6BTcK/RqySGwZajrxkmsu
 XQX5u2XwKoAaT0zfaJRSbaw6/MnPQ4Cv2LgYu23tU/+4ICaIrfkz3tCcjCps8XD7FmtjAMc6qJb
 Q/M9wx0UOti5BzuDvmxV+RE/suDVHAh9oc9IbZ9jGxYfpLyhszo2mL1CPFW7FOHYE+YLcg0+50m
 Jo65WFxgF7A+8tLYFyEch0ZxuH3vSw==
X-Proofpoint-ORIG-GUID: reJuvehbwXghMqBElu4vOdILyC7NMyfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
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

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

RGMU a.k.a Reduced Graphics Management Unit is a small state machine
with the sole purpose of providing IFPC (Inter Frame Power Collapse)
support. Compared to GMU, it doesn't manage GPU clock, voltage
scaling, bw voting or any other functionalities. All it does is detect
an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
it doesn't require iommu.

So far, only Adreno 612 GPU has an RGMU core. Document it in
qcom,adreno-rgmu.yaml.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bacc5b32e6d7b2f2b9e0424e77236e6a0ebe9a19
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-rgmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RGMU attached to certain Adreno GPUs
+
+maintainers:
+  - Rob Clark <robin.clark@oss.qualcomm.com>
+
+description:
+  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
+  belong to Adreno A6xx family. It is a small state machine that helps to
+  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
+  power.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,adreno-rgmu-612.0
+      - const: qcom,adreno-rgmu
+
+  reg:
+    items:
+      - description: Core RGMU registers
+
+  clocks:
+    items:
+      - description: GMU clock
+      - description: GPU CX clock
+      - description: GPU AXI clock
+      - description: GPU MEMNOC clock
+      - description: GPU SMMU vote clock
+
+  clock-names:
+    items:
+      - const: gmu
+      - const: cxo
+      - const: axi
+      - const: memnoc
+      - const: smmu_vote
+
+  power-domains:
+    items:
+      - description: CX GDSC power domain
+      - description: GX GDSC power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: gx
+
+  interrupts:
+    items:
+      - description: GMU OOB interrupt
+      - description: GMU interrupt
+
+  interrupt-names:
+    items:
+      - const: oob
+      - const: gmu
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - interrupts
+  - interrupt-names
+  - operating-points-v2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-gpucc.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    gmu@506a000 {
+        compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+
+        reg = <0x05000000 0x90000>;
+
+        clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+                 <&gpucc GPU_CC_CXO_CLK>,
+                 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+                 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+                 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+        clock-names = "gmu",
+                      "cxo",
+                      "axi",
+                      "memnoc",
+                      "smmu_vote";
+
+        power-domains = <&gpucc CX_GDSC>,
+                        <&gpucc GX_GDSC>;
+        power-domain-names = "cx",
+                             "gx";
+
+        interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "oob",
+                          "gmu";
+
+        operating-points-v2 = <&gmu_opp_table>;
+
+        gmu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ea364af99ba5c28895df765288d9d77448d2a8b7..77d7ecb92d9eeacf54e02415746e41d472915e38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7980,6 +7980,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
 F:	Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 F:	drivers/gpu/drm/msm/adreno/
 F:	drivers/gpu/drm/msm/msm_gpu.*

-- 
2.51.0

