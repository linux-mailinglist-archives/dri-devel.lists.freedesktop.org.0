Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC769FEAE2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 22:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291BC10E592;
	Mon, 30 Dec 2024 21:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="J48s2zEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE9E10E593;
 Mon, 30 Dec 2024 21:11:52 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUKjhNH007790;
 Mon, 30 Dec 2024 21:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t8e/RYNdPtzWjmAPrNek3DccTlB5RaBsu4+1+5ZETVY=; b=J48s2zEi8K3hUKeb
 b4njrAc1XMoH5KNmx8v2aDk0WP3j7a5CX5J1LbnynPmtmed88ooWeRkwzvq2cVL3
 ZO4cPjW8fp4Qv87vzAtGqm86J0PBSGgS44KEV3k3UWmbTUQsHimaYEgVRwVX5N0U
 SHAfs/OgQ1oCVcNy0ng68wMWqRQnqRjNQpSD3J03oFuPDTlddAVoXYOZPRUNlgNZ
 Kp4LlYRzag7fFoufIf05iSXmlXf9K/tDL5IgPcoVYG46w4egFmypR/cq63EId6FB
 GLaFXYgjbmfgt3wwqBPovP4QnZYcShzLVAfEzu2G2m3kQx9714ntW1g9iFEnjBsb
 lhsfwg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v0368cba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 21:11:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BULBlBX001637
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 21:11:47 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Dec
 2024 13:11:41 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Tue, 31 Dec 2024 02:41:05 +0530
Subject: [PATCH v3 4/6] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241231-gpu-acd-v3-4-3ba73660e9ca@quicinc.com>
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
In-Reply-To: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735593076; l=4473;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=v1H9hPEmwq+1KQk4ZihY9QFdNy9cZ2zvYnoLVk2L/OE=;
 b=8vOCoDky4wyLLtvgGgx6jNDy4mgGtVw3qeTaE6smq+aLe1jbBYJyW7Y+m3JXeolLJUo+tJFCH
 34oTJuLJPwCDXZ9zarpVeSztimr99HX8025d8ilFtoI0gN2i4nMDlJ2
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Y-ysNZ8uMssHMREa5t9dJwT3H56sn1j1
X-Proofpoint-ORIG-GUID: Y-ysNZ8uMssHMREa5t9dJwT3H56sn1j1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300182
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

Add a new schema which extends opp-v2 to support a new vendor specific
property required for Adreno GPUs found in Qualcomm's SoCs. The new
property called "qcom,opp-acd-level" carries a u32 value recommended
for each opp needs to be shared to GMU during runtime.

Also, update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml.

Cc: Rob Clark <robdclark@gmail.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
new file mode 100644
index 000000000000..b7874f43aaf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Adreno compatible OPP supply
+
+description:
+  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
+  ACD related information tailored for the specific chipset. This binding
+  provides the information needed to describe such a hardware value.
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+allOf:
+  - $ref: opp-v2-base.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: operating-points-v2-adreno
+      - const: operating-points-v2
+
+patternProperties:
+  '^opp-[0-9]+$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      opp-hz: true
+
+      opp-level: true
+
+      opp-peak-kBps: true
+
+      opp-supported-hw: true
+
+      qcom,opp-acd-level:
+        description: |
+          A positive value representing the ACD (Adaptive Clock Distribution,
+          a fancy name for clk throttling during voltage droop) level associated
+          with this OPP node. This value is shared to a co-processor inside GPU
+          (called Graphics Management Unit a.k.a GMU) during wake up. It may not
+          be present for some OPPs and GMU will disable ACD while transitioning
+          to that OPP. This value encodes a voltage threshold, delay cycles &
+          calibration margins which are identified by characterization of the
+          SoC. So, it doesn't have any unit. This data is passed to GMU firmware
+          via 'HFI_H2F_MSG_ACD' packet.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - opp-hz
+      - opp-level
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    gpu_opp_table: opp-table {
+        compatible = "operating-points-v2-adreno", "operating-points-v2";
+
+        opp-687000000 {
+            opp-hz = /bits/ 64 <687000000>;
+            opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+            opp-peak-kBps = <8171875>;
+            qcom,opp-acd-level = <0x882e5ffd>;
+        };
+
+        opp-550000000 {
+            opp-hz = /bits/ 64 <550000000>;
+            opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+            opp-peak-kBps = <6074219>;
+            qcom,opp-acd-level = <0xc0285ffd>;
+        };
+
+        opp-390000000 {
+            opp-hz = /bits/ 64 <390000000>;
+            opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+            opp-peak-kBps = <3000000>;
+            qcom,opp-acd-level = <0xc0285ffd>;
+        };
+
+        opp-300000000 {
+            opp-hz = /bits/ 64 <300000000>;
+            opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+            opp-peak-kBps = <2136719>;
+            /* Intentionally left out qcom,opp-acd-level property here */
+        };
+
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..f7119623e1f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7292,6 +7292,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 F:	drivers/gpu/drm/msm/adreno/
 F:	drivers/gpu/drm/msm/msm_gpu.*
 F:	drivers/gpu/drm/msm/msm_gpu_devfreq.*

-- 
2.45.2

