Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97306CEB93A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E3010E4A7;
	Wed, 31 Dec 2025 08:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="enOU9L9v";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIX8Hr6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5617510E4A7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV78RMj2733191
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l5cNqp8Qm+t8u06T9EpMpBkWlIdG9mhCzVCQBuziAp4=; b=enOU9L9vGENbD5fC
 2ROlRFuMQwBc5MZdEo8pFtA6inEy/wGtAm2cPKbsvJyaeSDKm+JXClB1ByweaW6e
 WFiS9tPYfdX03Nifj/KuZ2iEep2ZjUYVUZn1eH5mof+TyvTBWjLdkoRuDPvFKR2o
 0Inw6Ef4fi1dkFqdsYOwwLtw0aNpb0xalqChyue8tVTffQ+Pto/Ysn9dIiHRDGrv
 Pg1uA3PJuqK7C0wrV5KGrijePdSUEo8Z3mM79ayS17pAx+H2s/CPf0x+2HDCLYqd
 prsK835c7sfiv0BwGYyba5MLafZO8eKUaZeLAYGA9EOwKGyiobE+eokI60BHcEa9
 tSFFkQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6ag5vg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34c6cda4a92so22776141a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 00:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170773; x=1767775573;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l5cNqp8Qm+t8u06T9EpMpBkWlIdG9mhCzVCQBuziAp4=;
 b=NIX8Hr6+7P3lRuadlqQULrlD9ecIQKcGtPz78QhTXEW3KbDJoO5PA6gKSnOh7JFjvz
 8JWxAPOh6o6DJqhFGDgjfQhaFmAvCXjbaQm1dSHTwb0lM6XHxxyoGyZEVYSWiYbDhAMC
 zfiWfnebNtZixtvp0nOgv57Z9MOHVVb5vZOB8KgI/RbutbGKgxpm3n3vNmowQvguJj1P
 YWxtSIv25hHUD08NsuXWb604dzyjYehqFlZ2wb+zjpDqaJRkkeMkD99cHvcJtBkKX6w1
 Qw61yAC0z9w1DW3nLOMIw6Q/AXu0CDlE0g5J56eG+ogB6jFcxX2W6cmmAhkUM0lss2eS
 lh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170773; x=1767775573;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l5cNqp8Qm+t8u06T9EpMpBkWlIdG9mhCzVCQBuziAp4=;
 b=DdxZ09HqicpGqOKGqFPX2gkhzn/0JxdIAUbYnhbjH1iQAzCu3DIP81QGtOXbqAvJ/c
 Y0vJe/IgOtVV0/yI7svSRDAgAJmvvQrUAuqdMHQhgyqVzQi0YhPiL6X2J+6Nz+O0IwcM
 co2AqCdi2r+r6C0g25mr9a5lPFwfN9uBWpAqAspsQZ7j5c7T15FEPSYjNKqHYvWt2MMc
 uvSuhsU9wzJ0HLPXGgl745PEah+fiFUCXreGZ5xvhGe0ZFqxt8lEqUBCCFH3cu3OCc+y
 4MvSE/Z/xo4YXjiv1P5dRiSLFUqL5b4TL5DMLtW4O2nAkB5rVePCrPWRtr1pSd6XtsST
 9aQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfMciC9sJLiesVjMNJwbm+cZLkJMx57ov02Asu9gPsqX57qfwE7Q/CQHrsxCd9cUzdtMdpaXNmN3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzjb1XJllJV+OL4UviTIC31B+OyS/VZeiwqzRuOVgZSFZYSt4R/
 QIo4ggUEbvZ+ycV8mjBMKxhCvN1bp6oAvY6PHOUk0cOcB5QqUqNiHoo6FiBLXOgSTT8wYBg+cd4
 VkY3ETQZ597uMX7sGi9QQdYAzNdIs/hR/Cs6vYYoyhcfPzb478npq87rH9UrgfhvbAtRmOQA=
X-Gm-Gg: AY/fxX6vAicnjqMgynpXZ4XznFqUX800G8ROYah/fqUtVw7WelxVavAg1+NarDtiKeI
 rOgDRzoDMtHduuQJvuxjpGz5RGu0kRDosBt1f6nXvjvzPqESXmBTR6e4qCiBBXiwxdXS59OHBNh
 bc5MfGTUvASTmbfpYyDgyoEL3EzLEA5CSL3ePztf4iE2dTRSioe9lnrdF2C68LH8xapr+Kmw7rg
 TYX/aMYc/nb1CiFZHhqJ69jMc64Voc9Ey1Hf19wg/RfBNOU3O/2LMIHykmcfcJ/0BxhDxbGftOC
 t1rUGd9bggUQnLb1mDa+nNZtELQhSRsbhpbLTpdr2b40MQPIVT3Z84VQHyJN0gH/VbFNxS2wiJr
 sqiHF0Kkh0PQjIRcKa1FxkX04WkBxyVgZBg==
X-Received: by 2002:a17:90b:5608:b0:34a:9d9a:3f67 with SMTP id
 98e67ed59e1d1-34e921f010bmr27965288a91.33.1767170773193; 
 Wed, 31 Dec 2025 00:46:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWOcECsKpcRLks7dTeqSCj0+OwVQ0OhTkXgRdE0DhiH4j04pWxlR5FMxv41W6Bk54tKaKa0Q==
X-Received: by 2002:a17:90b:5608:b0:34a:9d9a:3f67 with SMTP id
 98e67ed59e1d1-34e921f010bmr27965255a91.33.1767170772690; 
 Wed, 31 Dec 2025 00:46:12 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:46:12 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:25 +0530
Subject: [PATCH v6 4/8] dt-bindings: display/msm/rgmu: Document A612 RGMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-4-da87debf6883@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=5026;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lCkErxOFNNBDx36AE9ptfo0yTuYneYy4ZQHJcSJyUY0=;
 b=8+HJTL/p0K5LbiQrOgs79dxL0EPGF8264zO3XhO07ZabRQotm1NWN35Pb1j0WFGcN44+17YkV
 yaM32Cu9BoUBIhK+bqs7cu8NVfEzKF5TWCJEd+HzCjizWO0VVSkKslr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: Tn-kHNY6jIS2GVAz-_Sa67y-TsMlDyNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfXztVbOqAkGRGs
 1ik29/qkkbTFfBdHSFBJZMmSI0Auwpx3Sx53uaTs0yzm9CEzicP8PnIn6WDFqT49kQmC5qzr97f
 xw4ncaR6w2dEqCuy2HJnHyGgoN0VdwukqtYSOxdcPe9CpVxHGDIWfeRl3JGSxIQShevBzGhHyGS
 lq05E+xsOFyleVnHxxtWNbnC8nmW+1C9TxFFTOPy6/qzZ+XuQNkClEFylOxCIgp+HnI1GDJ/0XC
 k+djmeox6GcxUNa7+5AjpXGqMQtSU68dR77OcfFf3qFOu5mPMA+00H9hCd1H7djZE8keILSAJu4
 jZl666/qir5SGXWfVhQ2Jb5s/0u78W3RJkbXBNPUAH+FI/91dXhDoHrJshg3QCUDWZmFfrIMURQ
 sSCtURdsY3qxmGANEg2QnenMMplaIIKDcUfVLkQM5FVhmgJ0K0+KhZZHmzsPRUMsoXa5yyjLCiG
 eYSUlxlANCEk6FOwMDg==
X-Proofpoint-GUID: Tn-kHNY6jIS2GVAz-_Sa67y-TsMlDyNf
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=6954e2d6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=OspxmFM2CjPT0bdoapIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
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
index 000000000000..bacc5b32e6d7
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
index dc731d37c8fe..ee09fc2a6e59 100644
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

