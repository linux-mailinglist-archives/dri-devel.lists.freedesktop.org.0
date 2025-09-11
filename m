Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E63B5364B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEDF10E374;
	Thu, 11 Sep 2025 14:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcALeOKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678AD10E379
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BDhMQU019116
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=; b=OcALeOKqq5FfiH5Q
 Py/QQNLNC7rX/Jvk5AmVTJFz88Oe1YAdz8BSgnMrb/WAv6e63K/Uug1JNpAS/tYx
 ShKC5dv3Mef2IyOGWSAzfQlV+gdKwokiiHuBFHrzCrMsAd9vgXU+ShjOn3uOGcrk
 slSaU7MsJr5MExTLVwoh+62ssdm+t+mBdLBq0D/s7pdyteUqznEqwBrb6oGwvorx
 NF0n+SN6+LN7GsMO5nzltelUsrzsBp9RcM6MzZvvqIOnY+OSk2+q99sG/pLztVVC
 vXum7oNR1aho9RUlMtTLXttrGRn3olEW+NZSCgrkNRz0dhiHWHKjENi/e95SHcO0
 16Idag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphsvtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-32d8eb60ef5so187118a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602247; x=1758207047;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=;
 b=WqN46x5YCZlZ8znQosRG10Ud9XnLNVeQ7DbeBvbDRwR+rS0Qd5sqBtRM1R3A9sRs0T
 Vt3T3yo4R+KJ357hUITvxChbt6BEGI3OVuncHTzjp96A/cpMcezesm1VN7mKs/wkHN8H
 xKSEhVZ48LPcEL3Anc7Bbh7UP0XNfg1YJNPxOawLdrJh+LCkooD29e4UJui2McnVYZ+m
 R13FgPOYJKjgvYuMeW5lkfM4ks8gMSuS9VZIzFxFVm8Jvl19/s5CYJrzEij/6GorcI5d
 bulJXbs98EfBunwDvGa11GAdhnZ0BrtwNS1ImoUbflb3/vs4LPwhFdqR8VpOSBboJkT/
 yaoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzGC8kNodj7Vf/CHzURiD659Jvi19918Rr8hDAM+dIh9/08GrntYuZNxibr1lIa60QK3SgldyKL0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVPSVQzEmL74ktNat4ZsKPTOfS2UmzW3o6BWeQUouYuBgoYyIe
 3DFv+9y2KLKCGtPZ/vRQGDlXFBJm/mqVPavhvwiMSPN5eIO/KgBTnaLCxGFQgXMIxXpyYmldqrX
 KULCq0aVPnECMy50uW6PM46bnRRJsrHAmdfs4ejwHchlbFuVukzs9LpLUzLIN6Genvrl/ejQ=
X-Gm-Gg: ASbGncvVY79E79+V3zGf9gyKG3xeb+Drx1FUAScncmTnyKZuY06GODeMm+fe2S1V5sx
 41tWKY+qztlI+uxiSTlCJD1zNfzuPPsCJvINC7j9d76C3iDyB/u70yp83iCdrINmnArVUNDEt7Y
 TVHoJl/Ish9tgITCc72sb4c1B1iGwrKzG7D612oNBazE+VPVPbbCyNveAPRER3KkNiIlqsC40Pe
 Vqsu8M26kV/xeObQgwWyhptnFX/s4VkaKY1URva1DjODoqXztaudHB8YQJTcFIIIRC0KafmJatJ
 lb3Ea+9W9NnE11mfCsIA8mkzjWOHdrZjKjWvOTYRT5LxFnmpZaAiwyiCcWeFyBZoZzWCqzjj0/e
 vqowleqV2T+NbOEMW/CPHpGhaZ8sLkc4y8Idghh0z3TvwjMIaA8xDfzt3
X-Received: by 2002:a17:90b:1a8d:b0:327:c784:7c37 with SMTP id
 98e67ed59e1d1-32d43e2917dmr14750886a91.0.1757602246879; 
 Thu, 11 Sep 2025 07:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7xvZXGDe4gGeaoUOspB4SP+Qsy4fBUGY1A5emQkBUdAaDIYlttMk2dqbZSQPTGCSsk4VkxQ==
X-Received: by 2002:a17:90b:1a8d:b0:327:c784:7c37 with SMTP id
 98e67ed59e1d1-32d43e2917dmr14750843a91.0.1757602246317; 
 Thu, 11 Sep 2025 07:50:46 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd6307590sm2934648a91.16.2025.09.11.07.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:50:45 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:46:08 +0800
Subject: [PATCH v4 01/13] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-1-177348170c2d@oss.qualcomm.com>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-177348170c2d@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-177348170c2d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602231; l=3530;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=LgccMGQtMns6i0nd4D5JzFa/u0XEgWzMdMJHz1iq7Mg=;
 b=qc4pX6kLKMoQjj45+8At2VeBeL4dm1JdeB+kNKD7kalxk9Tt5QDSuBldZaZaADwgeBZOZ/Jh3
 Rl//lKlw+bnDcHgiBAN82wKoU/3KmCQYDgTPVLd/kZkokweVPv3gmM2
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c2e1c8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=z8W1oWq9hX_DlPyfQGsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: gl41MZ9P-NRDxctfH1GXdFrzDNA-xE1z
X-Proofpoint-ORIG-GUID: gl41MZ9P-NRDxctfH1GXdFrzDNA-xE1z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX0NcYtj+WryRE
 4l02wFPVBK2RTf/Jgzaz1qIAjqx6aodUg7Sp3AHoI/vTWelBwneN4XT9eQSMJtb5oCfQ7IaJV/4
 fZ9U4bbT0aAyIQpwnuRjR6egumZ8HgwpySok6/KjTOOGq+njtxmr8U6/Td6miYU4N3se4Ph0A0d
 LEbUn6yr8nuUblZdE2+VQWr+vMTBbU4Htb8j4aIy6bGDSZaIcEwo43FA7Syc/OGXGB3Vsde66wF
 252ixCtcsZEGUVUPAQ+oZsIL6tQ4RnILohxIHKsmnbCQsNFuEVvlyUHieyFRZ5YQ0o6JfRp5KPI
 MKdtY+VjqSLBN9xYYJJ7KZmII5F1ieQb03Z4+W8av7mXArBLTq203IZywLDa/tc1M66YM4LU5su
 ZOC3m1L2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040
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

Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
on QCS615 Platform. This PHY supports both USB3 and DP functionality
over USB-C, with PHY mode switching capability. It does not support
combo mode.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..efb465c71c1b5870bd7ad3b0ec215cf693a32f04
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
+
+maintainers:
+  - Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
+
+description:
+  The QMP PHY controller supports physical layer functionality for both USB3
+  and DisplayPort over USB-C. While it enables mode switching between USB3 and
+  DisplayPort, but does not support combo mode.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcs615-qmp-usb3-dp-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aux
+      - const: ref
+      - const: cfg_ahb
+      - const: pipe
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: phy_phy
+      - const: dp_phy
+
+  vdda-phy-supply: true
+
+  vdda-pll-supply: true
+
+  "#clock-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+  "#phy-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the VLS CLAMP register
+          - description: offset of the PHY mode register
+    description: Clamp and PHY mode register present in the TCSR
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - "#clock-cells"
+  - "#phy-cells"
+  - qcom,tcsr-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    phy@88e8000 {
+      compatible = "qcom,qcs615-qmp-usb3-dp-phy";
+      reg = <0x88e8000 0x2000>;
+
+      clocks = <&gcc GCC_USB2_SEC_PHY_AUX_CLK>,
+               <&gcc GCC_USB3_SEC_CLKREF_CLK>,
+               <&gcc GCC_AHB2PHY_WEST_CLK>,
+               <&gcc GCC_USB2_SEC_PHY_PIPE_CLK>;
+      clock-names = "aux",
+                    "ref",
+                    "cfg_ahb",
+                    "pipe";
+
+      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
+               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+      reset-names = "phy_phy",
+                    "dp_phy";
+
+      vdda-phy-supply = <&vreg_l5a>;
+      vdda-pll-supply = <&vreg_l12a>;
+
+      #clock-cells = <1>;
+      #phy-cells = <1>;
+
+      qcom,tcsr-reg = <&tcsr 0xbff0 0xb24c>;
+    };

-- 
2.34.1

