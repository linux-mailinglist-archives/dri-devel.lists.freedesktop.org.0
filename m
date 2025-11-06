Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B76FC3D67C
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 21:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFA010E9CA;
	Thu,  6 Nov 2025 20:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMojgMSI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNmBiCY7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6720810E9CA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 20:50:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A6HVu2S528568
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Nov 2025 20:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 spMx+sHJ5sO53itLCAelGZbnPh3HFQym6PGIzQk5jRk=; b=lMojgMSIYhwCkbag
 bkpiqXrCiXqAAy2V3QKzyPug2H27bqhMWag5eJxEOfJ+HN5oPcx8Vt6vu6m5dEYd
 Hkp+DFLucHwzjGmGB6BXHvfn4yLpOYJFmIe69oRw/NBr5fVZycdIye7fh7eVSzDJ
 UUvdMfoxpBrUlOhSsPmRMQ+5GDLmYHs5uhrPzvq6N/Po8IHtlgg7+t5uXGfWpBeo
 lGIZCJDINU2Nwn3gBf0cYQCjKKinZhsdPwbc4NuZsfdvGIwc4ApVNH62Exw3adj4
 SaS3ZuIiIRugxZrVUDgnLrUhe3ZNrscHXi/IXdNz3H4b7c9Jfq9aFEXHW8nj9SuE
 wwIY0g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905hrj3q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 20:50:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29557f43d56so520955ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 12:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762462246; x=1763067046;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=spMx+sHJ5sO53itLCAelGZbnPh3HFQym6PGIzQk5jRk=;
 b=YNmBiCY76ctyixjBo9ylea9khrSGR0zNOZjU2JTXBCf/fbNyjJiAXW+VvyPfE+nd8r
 S0MIYcmpz427IvSt7lH0lSGCeU6zOLlD132PyY76uJsjErGbNqeeLe16Hc7B/W2/l5w5
 B84KDVnWSH+XMGZ85H6nA2+5r24DGHFrhqGoqz1i2SyNUoRt0gRoChlwimC10JGYWS4O
 DYM4EXSGoplP3TvtVj3LSPdzeIj4cykpUlrSyVw/Cen2ySvfdAQsVvySWLcwmf3Rr5kO
 EQdmsxcUjDVkbgcJ2KtIYLYweW7twRhpgNlVs+EQ949r681ZzdXCzfca2Byo2m8TeS45
 8tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762462246; x=1763067046;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=spMx+sHJ5sO53itLCAelGZbnPh3HFQym6PGIzQk5jRk=;
 b=MZX3SrCGnp7MSuaJS7PcXAaJN2f4Q23XfS2jtcYhXP3mSw4Hpmci8jfBeOJgAsujO7
 52Dpx3v3xu6SX6zXbaDseMGiZ5wdeiS1ARIDVTDmipiXU/eQ1USy0i2snzpCkts0JF3J
 o1uufLJE2FrrgOTOBt2RdgSO7qea9dk5JVEY1iB7jlGLMoNr1ORp5c21qlX8ipzSpFyO
 83PeVsT1XXlaG+46Z8BTd08IhzGY6PSHHytYbaAhBzXPuI+9AFAv7Hz5tfgHyc82ay/i
 +rB4SRsTX+NQrt6ufvkUM6Hq/nm7v/qUQncrur2tegj895J8ozqsKitIcu9oluZb3Pa1
 85Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHnPYkgzIJ2SX97d0a5ZXf/4ExhVGTGRG6YSGAfChf8AZYr4DSIMOUCRZ/4H7YTkbDjArcrvhgk5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2xWYyHQM5BKS4KxHmZbIHExeV+UnFdDHGDqE5Q3X1oAIbThrE
 rFMkbaEAXb1vgywoTusuOnUn5RzyF71HlSoOuvUW6JCvEBNL1WwaQ/OMdS1Qqts58xsVnQBj75J
 jKYfNGcdC8sTrDzkkeCWhV8XyA//lxEnNB3X5XhccrhBI8ztHBs+wbiDD+QTLtjZFpqrsbto=
X-Gm-Gg: ASbGncsCx9XTKeDjz56AV6rJSg4xAhYbTNMxREEIuuoEtIqd6t1HZVIToJQBP89v5jz
 l6CxsUpo+K3IIshewaJe4yDBo7Z4VnXLQFG0N4MG0Zyp/ipJpxD89TThB5WJGd/DxrQ0/Dq+T6R
 V5dU+dY+gjeye1HdYJcuGqocAdJRK0qTdhHR2N8pmo7Pi8VPOxoh98II3QPPbUXEDsOm2B3hARE
 xAvBPOY1XUj53dFkmFmRcg8mf76jEF23dEK3m4n/shvnZOfbA0x8e0jTfb4lz1OPrGShPtUni1p
 3vSOpfU6r6ns4z6JuPGzqDlD24H/IizWwWBuAwN8aBf6iq7f9MjHOBZCQ2RVg5e6CxQ4V2n28km
 t1Iq9SnQH6ng6gazLPTIJTng=
X-Received: by 2002:a17:902:d507:b0:295:9b9a:6a7f with SMTP id
 d9443c01a7336-297c0464c66mr11018105ad.49.1762462246159; 
 Thu, 06 Nov 2025 12:50:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFubHR3w/yTqZCuf0JtG12YJeLfTf4xJsZoeb7KhSgpPBRkU+4WeMkGH76/FL8a4LRS9tl3ig==
X-Received: by 2002:a17:902:d507:b0:295:9b9a:6a7f with SMTP id
 d9443c01a7336-297c0464c66mr11017735ad.49.1762462245600; 
 Thu, 06 Nov 2025 12:50:45 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 12:50:45 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:08 +0530
Subject: [PATCH v2 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-3-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
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
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=5000;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ciBeeGMfjWiHGzfaxmV6OYY2C96eUNUrGxpBOVfvQWI=;
 b=7umI2JFcr4UFcqzwuX/k/CjT3oVEfYmWA0rzoO4MrN7FcQ+DVggGGUff2nWNC75JHzeP6/uDx
 rhKEprxp0qFDVZ7CTAT6TnX2Mz8Ga0VP9hRFa4H+nrKPan8lOVnck+J
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfXy1swbEy+SXs3
 OPIwmxQXJc6jWDVN1lJIogbaXbtDQrr5tBf2UtABIJtbqhMvmoSnKg/C9rpB+VjsYoKcYuafS0Z
 9oLTpgTPYIVnIooZvYexP0V8M5MmwEKnk7gtLbUZ0CQD4M4dkR1UHo+nFU37AbeGXw/g2kg5mBR
 ASYb/BAPN0w03nIecHYy8IZRKdyDwPzmAMmDjD5oOXYToAzp14/l44xolMePTbWfT8cilBkduZv
 NzoZaaCQhBkThIsx64Vg6AqyiqUtlIX3Qg/ZDTibriSQ7AKxPtWtKQIBmivyxngiMWSzcR2+JVi
 LuL9VTCPZ+Wop6IuHESDx0Dg/IESn5adKeGj7AiPvqM5Azj6XlFFTaaImub8Kgaa7BWGpiFsVBe
 +SAiiR2O7ZG7du/d9Jwn7ly6EJ5yKw==
X-Proofpoint-GUID: FuG4erNbEvxkE7QeK0kJQwH7Anwr86j7
X-Authority-Analysis: v=2.4 cv=GMAF0+NK c=1 sm=1 tr=0 ts=690d0a26 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=OspxmFM2CjPT0bdoapIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: FuG4erNbEvxkE7QeK0kJQwH7Anwr86j7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060169
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

So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
schema.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/rgmu.yaml b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
new file mode 100644
index 000000000000..7621556477d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/display/msm/rgmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RGMU attached to certain Adreno GPUs
+
+maintainers:
+  - Rob Clark <robin.clark@oss.qualcomm.com>
+
+description: |
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
+  reg-names:
+    items:
+      - const: gmu
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
+  - reg
+  - reg-names
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
+    rgmu: rgmu@506a000 {
+        compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+
+        reg = <0x05000000 0x90000>;
+        reg-names = "gmu";
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
+                           "gx";
+
+        interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "oob",
+                          "gmu";
+
+        operating-points-v2 = <&rgmu_opp_table>;
+
+        rgmu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ea854fa44b20..c75911e70c82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7895,6 +7895,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	Documentation/devicetree/bindings/display/msm/rgmu.yaml
 F:	Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 F:	drivers/gpu/drm/msm/adreno/
 F:	drivers/gpu/drm/msm/msm_gpu.*

-- 
2.51.0

