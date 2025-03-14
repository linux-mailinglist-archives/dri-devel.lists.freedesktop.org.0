Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E87AA608D1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 07:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6347310E95C;
	Fri, 14 Mar 2025 06:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4Rfza94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC37510E95C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:36 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DHJV4s021900
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1sUbM2SvyfVJOsSLSsKL5IhU1OYw0ytKP1s5wBNpq2E=; b=j4Rfza94M7CTeQU1
 BzzlR9PSsL/xuxUi60bUdA0zYewVeh37UEbSpyNZRpkQxoZ7wYSZAxOBRob2xGHe
 XABk1WHgvNIV+SEl2YDbyxmR38tCgDo0r5Q/vciKw+u6atrrLLfPrqh4Sne/0IvW
 9LFJF5iFZ6lRIpLKgsihcEiogxRy4oQ+MEWMnnFOTWoQVcW7UO+xIBnwPy7PCvj5
 /QljtPTJ+VyKytSe0gDHwWnnmhYNhA0++/M+sDXxhDA9hV8sR4SWVD6HFcnCylVl
 XPJoihHY7YwJ/urrw3Xq87ad1WS18+Ga0kO2YomRes/Kb9HndwNWS6nQ9JBQWV4M
 dwuxFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bu07k6xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0a89afcaaso338067985a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 23:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932575; x=1742537375;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1sUbM2SvyfVJOsSLSsKL5IhU1OYw0ytKP1s5wBNpq2E=;
 b=wuYgwChvO/LtMEOR2H0W0B79HO4QtFd5O0PeoZ1tcnhDRZahhkU221kl8TuzMDNv45
 adxCopVSJLtptNia+TH2heVWUKcH3Iun0JWMpAhsshBdc3rwl5k+BRb6je2AGfoQ2cfl
 JDka5ildtaHB5xy407VLB3M1QWxKqCNwYjYl5Qp2WqwZbEGL6zDCvFAR3f0XJ7tJwbMg
 roZd4bL+WLhxCMIERUoNAFr1oBC3gK31+Yd+LsdQJG0ZjlWsSllJViRRU1cH49/botoq
 Ymu7/z94UJtCTXCLYIRTyYzyzJ1h/v31i01Hcrd1doUjicKzksY+D9lG6zhpqDEFBAyq
 2Irg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTqXBAj3sSmojdHyX7HEDT+aKxozUZoP/zE2qGAxvqs0KbuMZ794ceEhJzsxEjWd/IC57XmLl5j/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGvwu1t8RA2DWvKC8RS5PSkwPz04F92Az5gB3Fu2s+s18Ei/kh
 dNoWXsPChXFQj1ILj7b7Bk8EJ72tSzRTVTjkNj9vl9w8iSy++JXGlzEo2u3JAKGgjY+qYO5N05D
 uERTkbGvroXlBhxWDAdOo+WD3lDEh+SkR9Wu4xenTCdtqpTRpRmZNCyummEFMM3xCj9c=
X-Gm-Gg: ASbGncvg81o/nlLgPPZoVzAC3B7YXNX0i1vsa2jwvhHWKBK60Svm+yOhPia65V11MEw
 p5/8pgw1euBrn1nRij4BX7At0ZaQ53x25Zqgh7LJ8KbvPlN/t56O7btlyf2ARbXpKJG+8ykk4io
 Rt3A3eAfMn02SDHjtFWl74AyUyMOg3lceRoiEIYwGXTZdeBNjvd/iwGJ5zNXsAHvC2RHKhTQTBF
 pGSeaFYoyvpqQ31YYyd26/7QZ/CaYvtKtuU5NqBwmcvgx+D41cSiFEJBKi9a9m411edx4TCWldv
 4Q8/N3PHNsfdYqc/yIG+gzaYGSLlwjo4Z4oy0VltdCXWj/CCLvCBEsoppizac/tGxktbTQd8yAI
 kcJWF97VZYHfrPl7YP717rdztpiDM
X-Received: by 2002:a05:620a:2450:b0:7c3:dbb2:9b2d with SMTP id
 af79cd13be357-7c5736e2b15mr833314885a.2.1741932574734; 
 Thu, 13 Mar 2025 23:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiczPIzoLiw1K6MLhP6jFTeQCsK8L+jcvk60VRCv8qzQ8LFkHt2oyl7Tx7neBgrwJKFvQFwg==
X-Received: by 2002:a05:620a:2450:b0:7c3:dbb2:9b2d with SMTP id
 af79cd13be357-7c5736e2b15mr833311185a.2.1741932574346; 
 Thu, 13 Mar 2025 23:09:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:09:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:09 +0200
Subject: [PATCH v2 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-5-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14907;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mhVUBuasCeOBkqrxG/5PgGqIfKxDHldHx8QOIkjyyg4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08gGEGhOStiAQ9q+BX0yTfKI7tEBx70wL+wF0
 ptm+zhx9HaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PIBgAKCRCLPIo+Aiko
 1XNmB/wJnGQmTb/Ak7VdmPYDhhfv4SkYGL2YmjxdpyCYUlElGEopGPF1WuX8ggT3T8Tkiq5KbMW
 YCOEC+pBV/iiuxnK1HzE1vRt1aeVlTsG+1s7KQJZHQS2Z3naB5Fe59uoQ6O6dnBWNqKToDUszwv
 7F9hMweRha2T92o1yNM2N1eE0ccO/0zugQstJksubZOIojdEFJf/cH1tHdoTDJyJopg0jNQYK2f
 nrAK0Z8Nb1euurpgVOQENKpD5UngeI7Rf9MZu88OqpNUcQ1tx4+OJaGoHPxnhLFrg6Wrz+uSxRR
 2nwiT1N0ozwCThsNTzt1rmowZRgU1OLdWy3yTF+I03Si0qts
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 5DQGNghsgZO2tPLKRC3gAcOS2V--j-Fc
X-Authority-Analysis: v=2.4 cv=V+F90fni c=1 sm=1 tr=0 ts=67d3c81f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=-YBHemuPtO_JcOlGpNkA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5DQGNghsgZO2tPLKRC3gAcOS2V--j-Fc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe the Mobile Display SubSystem (MDSS) device present on the
Qualcomm SAR2130P platform. It looks pretty close to SM8550 on the
system level. SAR2130P features two DSI hosts and single DisplayPort
controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 439 +++++++++++++++++++++
 1 file changed, 439 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..870144b53cec9d3e0892276e14b49b745d021879
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -0,0 +1,439 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sar2130p-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SAR2130P Display MDSS
+
+maintainers:
+  - Dmitry Baryshkov <lumag@kernel.org>
+
+description:
+  SAR2310P MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sar2130p-mdss
+
+  clocks:
+    items:
+      - description: Display MDSS AHB
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sar2130p-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sar2130p-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sar2130p-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sar2130p-dsi-phy-5nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sar2130p-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interconnects = <&mmss_noc_master_mdp &mc_virt_slave_ebi1>,
+                        <&gem_noc_master_appss_proc &config_noc_slave_display_cfg>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
+
+        resets = <&dispcc_disp_cc_mdss_core_bcr>;
+
+        power-domains = <&dispcc_mdss_gdsc>;
+
+        clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                 <&gcc_gcc_disp_ahb_clk>,
+                 <&gcc_gcc_disp_hf_axi_clk>,
+                 <&dispcc_disp_cc_mdss_mdp_clk>;
+        clock-names = "iface", "bus", "nrt_bus", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x1c00 0x2>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sar2130p-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc_gcc_disp_ahb_clk>,
+                     <&gcc_gcc_disp_hf_axi_clk>,
+                     <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&dispcc_disp_cc_mdss_mdp_lut_clk>,
+                     <&dispcc_disp_cc_mdss_mdp_clk>,
+                     <&dispcc_disp_cc_mdss_vsync_clk>;
+            clock-names = "bus",
+                          "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    dpu_intf0_out: endpoint {
+                        remote-endpoint = <&mdss_dp0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss_dsi1_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-200000000 {
+                    opp-hz = /bits/ 64 <200000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-325000000 {
+                    opp-hz = /bits/ 64 <325000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-375000000 {
+                    opp-hz = /bits/ 64 <375000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-514000000 {
+                    opp-hz = /bits/ 64 <514000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        displayport-controller@ae90000 {
+            compatible = "qcom,sar2130p-dp",
+                         "qcom,sm8350-dp";
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0xc00>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <12>;
+            clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_aux_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_link_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_link_intf_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_pixel0_clk>;
+            clock-names = "core_iface",
+                          "core_aux",
+                          "ctrl_link",
+                          "ctrl_link_iface",
+                          "stream_pixel";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
+                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
+            assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
+                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+            phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+            phy-names = "dp";
+
+            #sound-dai-cells = <0>;
+
+            operating-points-v2 = <&dp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss_dp0_in: endpoint {
+                        remote-endpoint = <&dpu_intf0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_dp0_out: endpoint {
+                        remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+                    };
+                };
+        };
+
+        dp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-162000000 {
+                    opp-hz = /bits/ 64 <162000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,sar2130p-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispcc_disp_cc_mdss_byte0_clk>,
+                     <&dispcc_disp_cc_mdss_byte0_intf_clk>,
+                     <&dispcc_disp_cc_mdss_pclk0_clk>,
+                     <&dispcc_disp_cc_mdss_esc0_clk>,
+                     <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&gcc_gcc_disp_hf_axi_clk>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_byte0_clk_src>,
+                              <&dispcc_disp_cc_mdss_pclk0_clk_src>;
+            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi0_out: endpoint {
+                    };
+                };
+            };
+
+            dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@ae94400 {
+            compatible = "qcom,sar2130p-dsi-phy-5nm";
+            reg = <0x0ae95000 0x200>,
+                  <0x0ae95200 0x280>,
+                  <0x0ae95500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc_rpmh_cxo_clk>;
+            clock-names = "iface", "ref";
+        };
+
+        dsi@ae96000 {
+            compatible = "qcom,sar2130p-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae96000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <5>;
+
+            clocks = <&dispcc_disp_cc_mdss_byte1_clk>,
+                     <&dispcc_disp_cc_mdss_byte1_intf_clk>,
+                     <&dispcc_disp_cc_mdss_pclk1_clk>,
+                     <&dispcc_disp_cc_mdss_esc1_clk>,
+                     <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&gcc_gcc_disp_hf_axi_clk>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_byte1_clk_src>,
+                              <&dispcc_disp_cc_mdss_pclk1_clk_src>;
+            assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi1_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi1_in: endpoint {
+                        remote-endpoint = <&dpu_intf2_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi1_out: endpoint {
+                    };
+                };
+            };
+        };
+
+        mdss_dsi1_phy: phy@ae97000 {
+            compatible = "qcom,sar2130p-dsi-phy-5nm";
+            reg = <0x0ae97000 0x200>,
+                  <0x0ae97200 0x280>,
+                  <0x0ae97500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc_rpmh_cxo_clk>;
+            clock-names = "iface", "ref";
+        };
+    };
+...

-- 
2.39.5

