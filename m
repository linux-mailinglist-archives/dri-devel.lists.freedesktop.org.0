Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559F6AA7EE2
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 09:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F3810E370;
	Sat,  3 May 2025 07:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZItLERC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959DB10E333;
 Sat,  3 May 2025 07:04:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434ldMP006394;
 Sat, 3 May 2025 07:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LEW02jdPjDoJveXzlR3wZA2eZYv8Nvz4Ko7ouAauK1w=; b=ZItLERC8V46hKz/h
 yUJpi6FQ1v5hU6eaAsSJ8DN5i6hUdnoXtz1OSgLoPP5/roWnOIxpjk5DnpLOZPDA
 bHHxjastdvAyMQxYCUmYJ8fZzlUevp1uCu8Y86aa4hvDfdTtLBzCK2R2PD/r/p3I
 MR58itjBEaOniDkVtYMp3PdjUt08DePqZ9DKz0e7PW5FGqqN5m7k2BGyNcmKovqC
 sVaSaHZNAgTXcPZs3z8b1ZeHyZ/TWtKHl98uECh0bJ3Of+cesdmC8P0CZbwgzpwm
 qHmCBuf9kEHR7jbUfjEKSfXvwBgsusmX5ianzDOT24nBvnbslWq1HbYYfWZ3IHuY
 virZ/g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce984ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 May 2025 07:04:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54374ZI4009411
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 3 May 2025 07:04:35 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 3 May 2025
 00:04:28 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Sat, 3 May 2025 12:33:36 +0530
Subject: [PATCH v6 5/7] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250503-gpu-acd-v6-5-ab1b52866c64@quicinc.com>
References: <20250503-gpu-acd-v6-0-ab1b52866c64@quicinc.com>
In-Reply-To: <20250503-gpu-acd-v6-0-ab1b52866c64@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen
 <quic_akhilpo@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, "Maya
 Matuszczyk" <maccraft123mc@gmail.com>,
 Anthony Ruhier <aruhier@mailbox.org>, Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746255835; l=4723;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=rDFkk7Dnq+hER0LFu+box9iP0nylL8oEOfqrVYto8Ac=;
 b=+euPbjKhVUi1G2/O92+ip3DrRrmVqKVc+BkN4oc9J7DWmNmuGKQl1QJkr7guFXrZwHXYqceRg
 4me29yJgZ+BDSq1Au4d6gYVbxmWg98qDkHDHQzPMS3WVTZAA4SQpvg1
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA1OSBTYWx0ZWRfX2xewpMHKOLJT
 fgATCPIGjdMswAitGhXSPqomd/cijdwAvgicXTEp7qmunULoCtDCtyi69PLXsDfgk45/1x1HyNh
 1e2JzILTZo8s0stO4F9zlYF1qvHDJY0e5tfl4fzg2jMlL4VwRcywQj+BqbwDP/RmbVHjEgZwbl4
 7JcYSqIxwuTEvfsAPSk4YpfN0kZZhbb+gsR5hmEsOq6P5GRnt8vNA7+iAjyr9rh8C3jQh0tv8uV
 voZpiyLJ/+E4YJx9BJRf4o+AFm0nKIs0zBSmQywEq7KMDz5VSGcu/s6FibqAoWexEsObQ3mIVn7
 2n0gpf+ws0t6Kp14VqQ0s27IO26BNeF5fU6yci/BIfiIhfzvHDJoMoMIQL1vReoN6Ktx9zJbEev
 w1kNyoslW/gTKCk5Pv7UcVTfNSocQ5nleEEAOv/c6Ue03anxU0oegCiXnObNFYxbmz/z7I6f
X-Proofpoint-ORIG-GUID: JO1DdNFtd9MC2-Gffl_ozP6a8QVQbSlN
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6815c004 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8
 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=1Nsl-F2zrY1Sy5AUJpAA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22 a=Rv2g8BkzVjQTVhhssdqe:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JO1DdNFtd9MC2-Gffl_ozP6a8QVQbSlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030059
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
Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Tested-by: Anthony Ruhier <aruhier@mailbox.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 .../bindings/opp/opp-v2-qcom-adreno.yaml           | 96 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 97 insertions(+)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a27ba7b663d456f964628a91a661b51a684de1be
--- /dev/null
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
@@ -0,0 +1,96 @@
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
+    contains:
+      const: operating-points-v2-adreno
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
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c59316109e3f8feacf9628fd1065ed551c4250d5..2d055c8135d1e3dbbf29fe9a552ac0ee98a8a2a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7512,6 +7512,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/gpu.yaml
+F:	Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 F:	drivers/gpu/drm/msm/adreno/
 F:	drivers/gpu/drm/msm/msm_gpu.*
 F:	drivers/gpu/drm/msm/msm_gpu_devfreq.*

-- 
2.48.1

