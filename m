Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069ACAF9848
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 18:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77C910E34A;
	Fri,  4 Jul 2025 16:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0IVnfMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B61910E349
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 16:32:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5649fxoF016094
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Jul 2025 16:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CA4cR3EPt0ZKpDXPz76t1inkPsQdE85Hlallld4sOBE=; b=e0IVnfMwi4vHGSyF
 4tprmXwvmhnaLBzF8lnDm7Ank5+Z6eaQvXV82lDs0fKv8O2zET068/ttmg3P2cx4
 MPEX3f1G+RdabbDtvVlAzn9xK+D0y4piJZokwZga3KUifq7T0f0oyg6fJMmhsMxY
 YCpsUJ1DdwAO1gNyNCP+P0sgBMwoosBGRviMIlxDkE3wMLkB/GQhjLyXCcufsVIb
 M2kvg91sz39aZGmjXhXnWiQQsGU5ynpF4uxx28aDQWSb8Fl/aVZQEIyW91QME501
 9P5I/IPq3lGvhsv2lkAVtBchEi8qU1DB0Vuzt6ug1FqzRAXppym6LCnMz1x2v+rT
 skuHyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5js19a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 16:32:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d22790afd2so145036585a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 09:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751646720; x=1752251520;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CA4cR3EPt0ZKpDXPz76t1inkPsQdE85Hlallld4sOBE=;
 b=UwtpB5QS6xAdT0Sxt25zV4EUwgjarR1Yg82TlEpiNjA/29GbjPj7XxF96ooLqpdZLD
 2OXGFXkvnT4+hLTiTILtpj0a0tjV8+G1CYZp/FaEp8/FF7NBtNnQL4ZLGUIwkkcCPfvA
 rMc5td9+DSWbEGsBCDPQYflTjEgnBmOj9xKC0zzkXr4HwlKOp6ZazedS+xeTwOsuALzB
 nhEAoe57eDFYtB5k8VkXz9LJFptuDulYYvKBbp3avnhDbfvNYWwT079pjPkOk+Qd2/V2
 lQ5VV0q+Somxz7qmZKQF7KZvFrU779mbTiiXpLzbCVm2I7r7z9fk4dWXVqHHbFzhPoEu
 yMKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU47HrxbXg/Q8/+eK1O+kyyNGuNJdP1JxRx4gP79JG25Qu0+ybE0qCf1w1G/CsOcVdejSvYgLvG8Rk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ3hMVj9CuJFDPyLXv+d+/a4fx1i2yfJ1jQuHF6ZyDTn2u9CQI
 sIpeo3TcjN6X3yoTbCwal1yavekMrr5mqW11LpaXr5iuBdD4kTdyM5SNaVCRCcInoHZ4dwMWnEM
 LK7qKwp1EUxUzFBC/o8SKTxRUUjQmEiSrQ5RrpKR5g2HKo8aai3LGouWG32tHSMuDz3m2UlE=
X-Gm-Gg: ASbGnct2FNwVq6QL0Dgn/dTkYOy0+XrRxp13l2DFqUyTT+6Dzy+j3I836Yu1H5OnQNZ
 806iWp0Z4WxUv4hrQ8+xgzMS4nIiI9e6NksRBjYWjVXDPgc5DiU7ywIQhrzc5kBhpqX4JI0Y1dl
 2+yoErEzrq6BRc9BXeNSKGLx8naxMmkstUdYQqpfBPLPdYn1KG3dzCYIDxaWGeegqIGHRQVTO9U
 NRMi35nnzcykLzdN5/KNWo6pj48fP7vnThmb1q4z5xQfDSUSdAd/OLAThBDCzaIF2qzmax8YPoo
 xuBafitInTuVb4R8b2d0HE/v7IqFv28wwObkRLMFBnV8Oa+K2S1tUMa832gKCAfThE3MaBh96+C
 6KYzC8+18cr6klQRPkap8QKLNo9dgDT3C7CU=
X-Received: by 2002:a05:620a:4553:b0:7c5:5670:bd6f with SMTP id
 af79cd13be357-7d5dcd4048bmr562638885a.53.1751646720148; 
 Fri, 04 Jul 2025 09:32:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr3+g6l0u0WyfYKx74vE0m1HBQS0pRyhe4KErDw8IpkZJfjmohlKg+ZO0KDPYK/r6AiAHRXw==
X-Received: by 2002:a05:620a:4553:b0:7c5:5670:bd6f with SMTP id
 af79cd13be357-7d5dcd4048bmr562631885a.53.1751646719489; 
 Fri, 04 Jul 2025 09:31:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:31:54 +0300
Subject: [PATCH 2/4] dt-bindings: display/msm: describe DPU on SC8180X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mdss-schema-v1-2-e978e4e73e14@oss.qualcomm.com>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
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
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3613;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LdPFH6oRbQYmT9cq0Y/hHQSHOp9Z0VRztyZKZ01w694=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaAH6nnSALyAuxHSso/6VMpuKfgpAStkiLnufr
 MDtUiOt/YGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgB+gAKCRCLPIo+Aiko
 1bkWB/9UNkOrPbaYrvefY+V+F6irbPlq67sccAvejlrV8j2Mb88fT40wYeT7W9kBfH5Q5H/zeeQ
 tTyZjZiZoO9n9j33gJvEuIdF7w6FW+Ig6A4VDoeIfR7ANqfqAx4lG6qcQI+Pm/pKF//LSSYtKrp
 mj+NVmr40rTTyAgnf2t7wWtFHBw9kzJcSIVzF6X2qtw07L6F7kT5gE5VDsw7iQjP9YgPFFggKGv
 Tv2z25esKQwQWn6VC0V/SW3xT8AIPik6P9teglDVl9WBmNepe+ZZAipmQBe+BsuY+74ea55lXkb
 MCHJYpQoyXr4xOYl16wxxOTukOyvw0JbaTFA13Z/QKe92m9c
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=68680201 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=PRzSAg5HSsxOSwAYWMMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AYKXxgdKjcZAoEcHCCazgnVLVrfs5w1d
X-Proofpoint-GUID: AYKXxgdKjcZAoEcHCCazgnVLVrfs5w1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfXwjbd+6/y2iJx
 vjCOY43fr2V3yCOuAhh9R12O5HjdCDNdoKimeGyu/w/lKcZQuxeg0LlttqSbkc5Vp47LT5mqGwV
 8GUW8GssHU6cUYAgCpHYUxIaOeGMOLFm4gFNFC/gGLMiNM/rnWYyjGIH5NwGI6F00curCfGYUiz
 MXEWbrA2e76yAU/bj06yhU3uFiv6Veypm0LBSZgGQGICA8vVwEQ3q0xGc5ChnomtCSUl5UL9+D6
 btoD4YdiNyCkUBmSAG6+23c0ETmkVBFa0RvZ6pT4OhOGubg5MaZXRqzr3hmNn+aG/4eomvRkdYK
 weo09OhvNrnQvLSXyuXMcBqwYEyApMaP7zoKKEH+2+7h7Z+y8CoHi0Wc5xcRUgi7oT1MpQ6fxWZ
 2xCUthh5hcj3JSZ5qI4hHAtrQmYrvEdi8vHgMuvZDwmhg4bvFcoH07YdpRYD0R5pCM4FU97L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040125
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

Describe the Display Processing Unit (DPU) as present on the SC8180X
platform.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a411126708b80f77bde88d7dd1ed49184856969c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC8180X Display DPU
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sc8180x-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display AHB clock
+      - description: Display HF AXI clock
+      - description: Display core clock
+      - description: Display vsync clock
+      - description: Display rotator clock
+      - description: Display LUT clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+      - const: vsync
+      - const: rot
+      - const: lut
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sc8180x.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sc8180x-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+                 <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>;
+        clock-names = "iface",
+                      "bus",
+                      "core",
+                      "vsync",
+                      "rot",
+                      "lut";
+
+        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd SC8180X_MMCX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+    };
+...

-- 
2.39.5

