Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A56C8389C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 07:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3256210E34E;
	Tue, 25 Nov 2025 06:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdcUgQCc";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUPXuGf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF44910E34F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:04 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2go4M2009046
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ejOLCXs2H6V
 eH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=; b=DdcUgQCcQkqhWxddtSUrQAFauQz
 HagkaneA6DB3ZSj/laGX2rbSj+i/XPn36v48RGK7hOZnEtqwNJpYd4s8fIpEhN+h
 G2358jOI5j/lxEGPiCA9PPp9Cj90YHwrNeOVL26oOEcMQbkrQqGctsblHthNw5x2
 PH8jZoJVNiSkqzckDiQmpkEbZs/DQy4lZj1O0/w76IiXQ/Y1jMqaxM+bBCHZ17SD
 KONIi4wQYMNMI60P1ghH7hQVGL/nkq0QifxSCNbuoxO/XATLZfZGWW/PJmAg+BBv
 6bxj1LKPLFpQJ6/OfxQ4wUKykVWi9qPhPACegszgblL5IpKKbHQEIKquMuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amkknuhvf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8a1c15daa69so338872785a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053343; x=1764658143;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejOLCXs2H6VeH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=;
 b=ZUPXuGf4yn+NK+L1hMiNzMGLZ/UzphD7P0krnd0FIg85qBwxNayhJ3L3G1cPvpNhL+
 QoqnSBftR8HjMyVx7rnm/uh59YbiI8vumS1GL8fPiB4ZxZjgWw+PbMnNi/FOD6W8nVpI
 QBMXXF6dGHzUglfVm6DoX6s/gvZfhcmjC4OfdWg/ZvW2LFQeok9vkCRJbAUWky2mDtmf
 ErXf/X5GK41xA/gNTVEBcD3OIxcgWDEjcGjOPUKKqaPpMbXLBj0CYvUm/LV6dPzJZd1K
 iIJO76HQMY3JHBassP2+MjGjav35KxRvrul7AVSr+CiSgAMEFhJL6EkTDgq4yyoeufbZ
 1pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053343; x=1764658143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ejOLCXs2H6VeH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=;
 b=JonYXaAad6tvU1y6WN5kG/Xcnl789wkWtZAzUFbTaSJiFXTyId0g3yEC0eZoDJxPJ4
 4v5bG7MIMaYreTRkq29V2GP1ephNXjkob46LwESdtg/5HB/GChPuOXc1iRAgGXleIlEB
 uPB/+RqhFBMOwCKyoQnp/7PhCSSpCBP3v4uYZ3T9r6KWENguQjzaYIl/bpRdiKkA4lsI
 HADcnALZXn40JmQz3dLThsoUwkeIFiHf+EfZh28vuC3xrY+Cf6BSxbYKRt1clt3C8VR5
 usrOnLJgXzwGbfwYXZsrc1pG/2vToaff88Yy3cKFu3dfO8PKun5HRk09tJ0GjUiPdx+N
 redQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3ucmtOIxuQiLERCnnfZE12eD31UaEblDU1iL6GqozyGOAlPddv0PDLVLjjtJTonAh9/liVW1i/Ds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpsEXrOXFaHc6Yd1ZO7Hxs9lkSBMZwelnv4uiVZSX5OyIh48Mv
 hGLCseOmGSHheF8MNwOapqtd9FmqEjss0jn8rQKhEijyURNHtQZh/FspO0qBC8glM0HUymJPyr+
 prX3Jjmb1k/loxBZXauFf8d8cQPXKHNugbKnxA1jSX6a+MUp3NjfSTg1PjeOBvuS1WNFJnCc=
X-Gm-Gg: ASbGncukeDiRkwtjVizDSnw8UpA1MsbRZr2f9OYeI01ZnRDgsjWzUw6oSmWJ/9fQYUM
 z8ZADPE9d//oseBRvi6kbPZD32YSTi/FE4BWe0DkR0rrqvVutYoDs1Spy1LxJsMRXFF7Vgr23dJ
 8igCGRSdwH2r1TiKhqWbbMzDLJXfc9MUnbZdmAtF1YueYBtA/SQLKA7xPgYheQubMgpI1/TWAU2
 GBPJkgOnpaMfZxvbxWcRf9BiQCxN9ZJm2J0NOfiIPstFVlq6dOZvLAyzPaTRv2EMcvqAFqtH2xn
 kxR/W63AJ2Y3Dw+6wwit4TqsVpLXEwLqdJ2a/wUhPxUpYEURey8O4qLe2LtZpg+dxwdVAX/7DmU
 hAMh/qNBfg0BwTtragahS+fPUS2lxfwnzeMNnromZrHZNtSaCjIPkF/BB7MOLECAfaNBxlVI=
X-Received: by 2002:a05:620a:1a05:b0:8b2:6ac7:aa61 with SMTP id
 af79cd13be357-8b4ebdbea66mr234712485a.73.1764053343271; 
 Mon, 24 Nov 2025 22:49:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsdVVKLmwe2oMj05Y0aUe3dTPaFXm1YvlM5u/vQ9L9kjd09oWDF4kilPdJIBPHoiUnUPpmeg==
X-Received: by 2002:a05:620a:1a05:b0:8b2:6ac7:aa61 with SMTP id
 af79cd13be357-8b4ebdbea66mr234708685a.73.1764053342797; 
 Mon, 24 Nov 2025 22:49:02 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:49:02 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 04/10] dt-bindings: display/msm: qcom,
 kaanapali-mdss: Add Kaanapali
Date: Tue, 25 Nov 2025 14:47:52 +0800
Message-Id: <20251125064758.7207-5-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GxjL_jNESR2h9WuWzL4Gn2WpU9tvOT9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfXyVJMlpswetzA
 3bOD1G5vU5v44HKgDWDQXN3J4V6kH4QEniKAFJBv6jijZrGuLH5FM1fjAuPpCtdrEIjlTdV0auP
 7XhswRir8z2miI6mXJOZgEN8js070Nlcw0q5pAgPBW/AY7519ZekxpKEA65GN2BQp17TChV0+vY
 0vnGFZvKvZfRsmwCO0H0b2vu/f6qAcxwIZZdGrvVWv9GDRiBzHjIYdAi+1HssfRv96L0eJJK5cu
 7kSyQXpVPPI9DCMN76+Kxajk8zInEV+4cYmeIQW24uTVslMMzzlOZ/9JOTy9MeiUf+T8UeqM7uD
 QMegcIoOtPoZ3uPXg5ekITkofj6PxqBEnbzNuyMhJxFZbfAG5TNOyoaxZAASjXyVh4bY1VBu3Qu
 GGWQjPNCerWfizTte3Ls3mfzwSEiQg==
X-Proofpoint-GUID: GxjL_jNESR2h9WuWzL4Gn2WpU9tvOT9W
X-Authority-Analysis: v=2.4 cv=B8S0EetM c=1 sm=1 tr=0 ts=6925515f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ttgK4pBlxCW4zpXUERAA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
Kaanapali has significant register changes, making it incompatible
with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
 1 file changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
new file mode 100644
index 000000000000..92293e2b4d94
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -0,0 +1,297 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,kaanapali-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Display MDSS
+
+maintainers:
+  - Yongxing Mou <yongxing.mou@oss.qualcomm.com>
+  - Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
+
+description:
+  Kaanapali MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks
+  like DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,kaanapali-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+      - description: Display AHB SWI
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
+        const: qcom,kaanapali-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,kaanapali-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,kaanapali-dsi-phy-3nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@9800000 {
+        compatible = "qcom,kaanapali-mdss";
+        reg = <0x09800000 0x1000>;
+        reg-names = "mdss";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&disp_cc_mdss_ahb_clk>,
+                 <&gcc_disp_hf_axi_clk>,
+                 <&disp_cc_mdss_mdp_clk>,
+                 <&disp_cc_mdss_ahb_swi_clk>;
+        resets = <&disp_cc_mdss_core_bcr>;
+
+        power-domains = <&mdss_gdsc>;
+
+        iommus = <&apps_smmu 0x800 0x2>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@9801000 {
+            compatible = "qcom,kaanapali-dpu";
+            reg = <0x09801000 0x1c8000>,
+                  <0x09b16000 0x3000>;
+            reg-names = "mdp",
+                        "vbif";
+
+            interrupts-extended = <&mdss 0>;
+
+            clocks = <&gcc_disp_hf_axi_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&disp_cc_mdss_mdp_lut_clk>,
+                     <&disp_cc_mdss_mdp_clk>,
+                     <&disp_cc_mdss_vsync_clk>;
+            clock-names = "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&disp_cc_mdss_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
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
+                opp-156000000 {
+                    opp-hz = /bits/ 64 <156000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-207000000 {
+                    opp-hz = /bits/ 64 <207000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-337000000 {
+                    opp-hz = /bits/ 64 <337000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-417000000 {
+                    opp-hz = /bits/ 64 <417000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-532000000 {
+                    opp-hz = /bits/ 64 <532000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-600000000 {
+                    opp-hz = /bits/ 64 <600000000>;
+                    required-opps = <&rpmhpd_opp_nom_l1>;
+                };
+
+                opp-650000000 {
+                    opp-hz = /bits/ 64 <650000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+            };
+        };
+
+        dsi@9ac0000 {
+            compatible = "qcom,kaanapali-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x09ac0000 0x1000>;
+            reg-names = "dsi_ctrl";
+
+            interrupts-extended = <&mdss 4>;
+
+            clocks = <&disp_cc_mdss_byte0_clk>,
+                     <&disp_cc_mdss_byte0_intf_clk>,
+                     <&disp_cc_mdss_pclk0_clk>,
+                     <&disp_cc_mdss_esc0_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&mdss_dsi0_phy 1>,
+                     <&mdss_dsi0_phy 0>,
+                     <&disp_cc_esync0_clk>,
+                     <&disp_cc_osc_clk>,
+                     <&disp_cc_mdss_byte0_clk_src>,
+                     <&disp_cc_mdss_pclk0_clk_src>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus",
+                          "dsi_pll_pixel",
+                          "dsi_pll_byte",
+                          "esync",
+                          "osc",
+                          "byte_src",
+                          "pixel_src";
+
+            operating-points-v2 = <&mdss_dsi_opp_table>;
+
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
+                        remote-endpoint = <&panel0_in>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+
+            mdss_dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-250000000 {
+                    opp-hz = /bits/ 64 <250000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-312500000 {
+                    opp-hz = /bits/ 64 <312500000>;
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
+        mdss_dsi0_phy: phy@9ac1000 {
+            compatible = "qcom,kaanapali-dsi-phy-3nm";
+            reg = <0x0 0x09ac1000 0x0 0x1cc>,
+                  <0x0 0x09ac1200 0x0 0x80>,
+                  <0x0 0x09ac1500 0x0 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface",
+                          "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+        };
+    };
-- 
2.34.1

