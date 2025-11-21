Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C886C7BCB8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 22:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABEB10E906;
	Fri, 21 Nov 2025 21:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdojFF11";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X20Ld4Ln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C8210E906
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALC3VEH3007749
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LHl/GB/jo70EitSbdhdMrpAF7ix8vnjgTe1J/9HR1d8=; b=OdojFF11bbtCq47c
 gnt68Fu28VIqDL05HSPTHewLbOr81yWyHyd9/bSjR40uG6iFK8YLuK7frIQMGaPz
 JMeIaIaohdB1vP5IDM78afRt8NZopiV5M4baOi8Tqd99fKyiD4b0+kKKZpv2Kaw/
 dUV+P5teenXes5IGeKoza/JTy7e1wP892uol77Kio5LfjZ/28m9m3Q9u6weIXKSp
 Q6m+3gkrvEAwjDwAzsTQ6oKPBYd6pAVmWSXwFP3J99Zza3Q0qJuhiwXXRS6qVn5o
 1ZyQ1XZA4B/EsW3iX1FR4QCbWNIXg32KKiQcoCirNHwfBG75M88md5FtPEOJo0Mn
 xM3Q4Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkf305q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b8b79cbd76so2158656b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763761986; x=1764366786;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LHl/GB/jo70EitSbdhdMrpAF7ix8vnjgTe1J/9HR1d8=;
 b=X20Ld4Ln+aZ0BNiGj5shoY7OWS3LhZEl0wYB6AKdgzm7fedwg/yxJq0ZXaGfgTzs5S
 aQ1G7nmLK7z2mKjO3SoxxStyd9XAFndaUzKYuYTP2KaPgQb0uPM+yZZtZE8VxzfYzN+/
 O92sEUHEND9pYpqWZ4mYnTj9RFD6cQeC2FXDroHlSKDRCvX4Kgu2eAdgUWvcIW0JGWP9
 QLxyQ3weoZsxGKreVr22r9/+s+RymdpheY1q8mtrdEubQD95NvwbRgRafVzB3zZpRJy8
 GB8jfA45U7ZZtQpjaCT5JNr2aaeGoqTt5WNW3Z0dKKI7k0MRkMw6SrjO+8qVIwP/eG2T
 se8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763761986; x=1764366786;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LHl/GB/jo70EitSbdhdMrpAF7ix8vnjgTe1J/9HR1d8=;
 b=ZLdzfCcRfV2/AYw7YbNd71z7W7D4Yey9A2auYMONftqCxLD5oXTEFxNTE9yBRua8fw
 8pI3yrpTFKbtd+YVoNO1uMebv2bwpuOVnyw7SQ9etGKALQinAvVNZbx9Hzf8IvOFXg9O
 W/UXwuYFDdfBNrt5CliUqL1wpQPIlsGZAD+yfcFtLBqlMcp1PtUZvsAKz0bMdbWT3ObD
 recYuydaOURE591H68X8q4OLW9YyWyNnpP+wOHIM3IttoR2H4vRTZO/0yzOz83661l7N
 d6y2uH7LnRjRE9hzObqJZZX7Vdx6uasm05F/2MOyjydp9WyKpHQRhko78G0GlvdNDMny
 SeDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd3P84ApNcn4B2ObcrfrZohsMztH2y2fdjik4PaS53ytxtoy1CreekK1E9NAFSYGAoOZqcKOQ143o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbfzFg8dCGK6A8xgXRd/zTHWGcjvtCdeJQslJ4o/ZOTvsZ29Dr
 8AR8WLCgHyPX1a+1fe5FE2K9rsn51wjbFrXmoYbpSmJIclDsHmb99sKHN65YXL/pp1hmnIE34DO
 hNPH+K+4EERfxfD1cIIf5Ec5U1yYK0kyrCPi+BJiB/wMT5K6dthZNekYT98iT28mEDz0lFyk=
X-Gm-Gg: ASbGncuuE/kxvZaikj/cZ2jK34vn6/13OvV3BHXnTVQM7//N7DhCb8UPa3VQcun1na7
 Nmfb3Sr72862Ci05yPJPHWNljaWvSlRJGvw9E3GkSVjylDOl7X3hnJiJoPFXFRdIU6gqVhYBwtt
 7HUMZnystv+cVRBTBbwEyqVLXSbDiydJUGqkID6ePfrY9kuFfowb6MJWOkwuE5MYUDxf7EzcYYA
 hj0iWWj8u3/5xN4Drpjeeg+wl3BNqjFI/m5d/QK0OERwTx7YQ9id8UlzhsxChqRVCUzfug2kdPE
 m7z/DM+hYHPMI5mcrgf1erKzVITFoSQ3YFcVAJAk3p82SW67HFmIIB+0e+nfxHvdVl21yZiYItU
 7Uz6OJhYEGQt24TCG13ZdBpNhYjcyjKW9XA==
X-Received: by 2002:a05:6a20:72a2:b0:35e:b02b:4efd with SMTP id
 adf61e73a8af0-3613e5abfa4mr9071458637.27.1763761986066; 
 Fri, 21 Nov 2025 13:53:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF11iHDqgjwpVwwnGeh2ib8bqQV6EKSXFBnhvWQZTYg5xViCSpPUbmOmjN6Xms1mxCZtSjE8g==
X-Received: by 2002:a05:6a20:72a2:b0:35e:b02b:4efd with SMTP id
 adf61e73a8af0-3613e5abfa4mr9071439637.27.1763761985528; 
 Fri, 21 Nov 2025 13:53:05 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd75def6314sm6399270a12.7.2025.11.21.13.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 13:53:05 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 03:22:17 +0530
Subject: [PATCH v3 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-qcs615-spin-2-v3-3-9f4d4c87f51d@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763761959; l=4974;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dHnbBdwTFFaHzI/uvU7oZBCQbIeKLNxKJrLt9qTuo0c=;
 b=usT1ULrG5ctQoyANX0NRjiuoSRPoWhuu3kyFjQ+SqboWZbhpnT2zN/UBogYrw4QezYw1k58tH
 qEBrCnJEty7D5ZqKzYtK/OJ/mFB7JW9KGtj9u9MDAEB3HawgjlXkQOl
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: paV6S_31oWCP6nU6OVCZdz0gWimClGCQ
X-Authority-Analysis: v=2.4 cv=ApPjHe9P c=1 sm=1 tr=0 ts=6920df43 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=OspxmFM2CjPT0bdoapIA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: paV6S_31oWCP6nU6OVCZdz0gWimClGCQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE2NyBTYWx0ZWRfX8NluYEgHS2QN
 2eOJWhKNOusRuJLTHgzuAo7zfocRJphzP629jgIhCAvXAotSQshI5gRKoPtO5Sfp7FoBvBbJ2h2
 SI0z/cJRutg6sQ9G5cfH3SIYYlbDhVle7G1tC6Nqx950JJ2BIQojfPXhSWEnfBoKmKy1/5Ysr2t
 v4aFLiK0s6wQyiKZTnFlzSaxrsjPlL2wiDRb5X84BxaVXRbzPFIVeJplLKu5PKCdsdaEYyzFS41
 bS1HKLqcXDviaeEvpOZygl35Tm4oN27MM3/MyZ/TmGqKPbExzBnQbpCQMzHBRZCBymvecj29Sj9
 VDdfTUVVUcPAum7N5T/1gFK4CGXduAcRE/Qf4FW6Bssy6qip+KjJRhF2qw47uxCx5A0FFSUsrOv
 eLHLvQpWAkbZ4HV8UmqJHg7r/FqVsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210167
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
index e2ed9827be3f..b891eb0141c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7949,6 +7949,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
 F:	Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 F:	drivers/gpu/drm/msm/adreno/
 F:	drivers/gpu/drm/msm/msm_gpu.*

-- 
2.51.0

