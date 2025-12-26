Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D9DCDEE51
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 19:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25E911B1E7;
	Fri, 26 Dec 2025 18:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzLUXdDM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFqw3iNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C4B112919
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:32 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQGHg0f1099948
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WVp1yFN8HhnapkBgDp3KUg9KO3H+6by3N5ei8C2EZbE=; b=nzLUXdDMe/ZdWg/J
 NIwobe2a67R3FUltjEukcQ+4tsdEYOuqk4F6a1WLbWeoVYrTts7z/3vS3VP4nYer
 qyXkEklojNZUcURlA4puongoejom0oSSH/B5AT6jPFcQdW5H3AON/fR68qNq3EJ2
 //Q7SUwdPQFMoYJw/XVDdVj/YOdGNqIjEvoNDTasyXaXlPlTPY4B48bmYEtFLvqO
 4otMpjHUVQ4+7oQeHVijP9gvagx0jWUOcLEkqgYDCRQ99IIaVJekPrw9m84nrERH
 peu088g/pMAHGBlQQlq/rLvGAMNCCxvY+fco5kB7IdGB6gCnD7NIeELs/bqZDLQi
 /0XwJg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8vaabqbm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34aa6655510so9709995a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 10:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766773831; x=1767378631;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WVp1yFN8HhnapkBgDp3KUg9KO3H+6by3N5ei8C2EZbE=;
 b=gFqw3iNyBTp595gpVUoDTPlSwOOvr3lkYqtgMecIbCcjzp/L9bnmN8S6drukAto4Cj
 evq67Ez6TEAV889A18XfpVX87gPU3bmvneiegTJV40KWkfyzbt1t3QWWtfTeBNAhoAgX
 i5UsZ6bPPwFNOGwBkRh6sG9PN7fW6OOK8oh7qfRMCQSleEY5Fag3Lo7cJW5fskwQDKXb
 c99eRvIgl+Lnu40GG61cnONzfH9sjOi4JJcr6yMiRFS6YO5Ht+dCNOksd9SeLa10e/w1
 XlOfl8UtigQy75lOniqg+h7fbLXdwx1gzsQp2/YfAHv+Fyp0lJactk2LQpg4dCixjWlu
 vcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766773831; x=1767378631;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WVp1yFN8HhnapkBgDp3KUg9KO3H+6by3N5ei8C2EZbE=;
 b=nqQly6HW7WzQbQGVSp37IDC4QvRgsl2SVCvjyjUIhP9P7enbMzuoj1gE9gE+Wl5L1y
 LnEkAsHSUm/dZmclMsbNTRJYAjf0rXOOVp6guflrZqAlf7lZhnv4tFWhDhivv3K0+38X
 qWrJrjokuSCJSG5UAdUhx5iokiAtwrx6FoZox1EGJYCq3dsNtS+utE6pVNRQWrFGmGhO
 mmadNRqGAC64632BJf95LE0guT9szWyLGraAMe9H8dP6MAXKP+rNjPM/HiVPFCDqtEsp
 B0JlYBJhAr8uJpJ9BAr0Kj0Ffjnh4ysjfThCM7//R/RFeA06+UCXjmcn5QpyZ+iThYHG
 YS6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ8oSPtl3wYPUg3iVlk/DJFM2WDHaR/M/+z87Bmn3Mynn9ola+RsHZCtZ2GdxUJu59ESfvK33TsdY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1GoxWqgGJQNAoI1GqEs6HN6s9x4jajp2wjG8XnaO7r1HW8/br
 fpXxdiQFggbL+sbK1A40SFyqm6E6eUp8zn56rGQ5shTT+Nd1p48X/+eJOcLwuiUyC3KlMpDYDAA
 dlIMay7z7abY2boxudKE2oXq1/RN647h4gP3y9yyl0bQOCZlpw4hqavPolMs1tPdmyhft6gY=
X-Gm-Gg: AY/fxX7HlqPB6agwExRzSwyAtPNmvGDfmv85rL6RE8aO7PiwSbbfUvx5lZSO9CGY8G/
 bku6Lvk1iSL0vWajPdB3JSduqVB0niVXYX8aPyngdoNGICirz2kI5ZZv/K1TBU2ebCj0WdZBjQ6
 kCWFOelZr/qsYzS+wJNZegfFnxXjC9fU4/Pi0q2yC1KDNXy0UVYFaZx50wyf9zvalKMlr7zd4Cg
 bqICjiqkrmyFpIxmCsLaQbF/wRdiZfO8OcyKcjFxccQxwZg+XbipOXKWS0dLipN9GaFhIkxtT8p
 Dcb3SdmTratsjvMfJg7iJP2e/PdNFeM7dssDwAo8C5q25LB1CFYj4Xzcwbpwzx6a9xXQAQODLzn
 i8d276XPcHjT1vEiuv6z0WzSIBDHtl3vmgg==
X-Received: by 2002:a17:90a:ca90:b0:340:d06d:ea73 with SMTP id
 98e67ed59e1d1-34e921af95amr13974276a91.19.1766773830630; 
 Fri, 26 Dec 2025 10:30:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsM5qVuZEDipjpNOFh4UfS/2dryUGeX7TCYh/GNfIog0vGtjrnDurTRSGqnGigsD/a9CIdUA==
X-Received: by 2002:a17:90a:ca90:b0:340:d06d:ea73 with SMTP id
 98e67ed59e1d1-34e921af95amr13974262a91.19.1766773830115; 
 Fri, 26 Dec 2025 10:30:30 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:30:29 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:37 +0530
Subject: [PATCH v5 4/8] dt-bindings: display/msm/rgmu: Document A612 RGMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-4-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=5138;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=uSE3sPERAiE75iumRyMImqBKNCNCcqza+1Vl3ymDj24=;
 b=SySzSMISdayjTf0CVmjXM/8v9YN+Mzj+yQ14mU7mxUS+w33xf3MNXyburtfW9Mm8mPEqjeFQC
 50T4FLmfwXpCodI/3y6N4O6+zA9nzEz9Zyef66oz7wDiKEoeq1V/+x2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: vDgdEWbK5Mg2iI5HAY5WAJKGo2L4Hw--
X-Proofpoint-ORIG-GUID: vDgdEWbK5Mg2iI5HAY5WAJKGo2L4Hw--
X-Authority-Analysis: v=2.4 cv=WMByn3sR c=1 sm=1 tr=0 ts=694ed447 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=y_M5XU1qouMi1lcPmcIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX7RzZb873I4nE
 0UM1BYBXEzX48zoPMcako8sFQde3H5ElVcze18Ly0vEMLFJDZpq0dVZ6PD0geTEtEMTGoaMVeG9
 L0VCVLCGtQzmuG3oZR5+2BuG1eT5bpqk3sHum8PnlR7ajWTjKAWqaE4FRC+EiKUufM9zhMX3COE
 QNL7xVsswCaJYvzWIYwp4xBdRYS29qC3Jzso7pj6Dt48ooN3ClA6ISOUkKP6aJyu75zU+mxGAS6
 asuCdrrwpd7LLkggi/2wCyNxBmQoKT2rfVuraE82XgOblbp+bKzn5Y7hc6R4gQbeKIhAH6rHeDD
 59paBOx8kU7in5JK5u3E8jE+itq33KnaT6tDClcpVdKdZZtTzZdhmJIKusiZ2ILE7W50rd+Dv0P
 qe2S3a0rBbaqVLcWOrJoxuOQJQBh11g/Ov1u+TEoSNQ8kbSnP1c7c9CpiyH/XiMtZuFQhHG+USP
 rxBkUa4lNP71DYtyUyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260173
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
index dc731d37c8feeff25613c59fe9c929927dadaa7e..ee09fc2a6e597f2432691b268d9956846789f39e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7982,6 +7982,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
 F:	Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 F:	drivers/gpu/drm/msm/adreno/
 F:	drivers/gpu/drm/msm/msm_gpu.*

-- 
2.51.0

